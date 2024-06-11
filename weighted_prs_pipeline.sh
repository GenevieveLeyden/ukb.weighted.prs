#!/bin/bash

# read .env file
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
else
  echo "No .env file exists, exiting"
  exit
fi


module add gcc/10.5.0 # dependency for bgen
module add bgen/1.1.7
module add  plink2/2.00a4.3-openblas


# check environmental variables 
: "${SNPLISTFILE:?Need to set SNPLISTFILE}"
: "${GENDIR:?Need to set GENDIR}"
: "${OUTDIR:?Need to set OUTDIR}"
: "${SAMPLE:?Need to set SAMPLE}"
: "${BGEN:?Need to set BGEN}"
: "${PGEN:?Need to set PGEN}"
: "${SCORE:?Need to set SCORE}"
: "${PRS:?Need to set PRS}"

########### 01. Extraction 

cmd=""
for i in {01..22}
do
  bgenix -g "${GENDIR}data.chr${i}.bgen" -incl-rsids "$SNPLISTFILE" > "${OUTDIR}chr_${i}.bgen"
  cmd="$cmd${OUTDIR}chr_${i}.bgen "
done

# Combine the .bgen files for each chromosome into one
cat-bgen -g $cmd -og "${OUTDIR}test.genotype.bgen" -clobber

# Write index file .bgen.bgi
bgenix -g "${OUTDIR}test.genotype.bgen" -index -clobber

# Remove the individual chromosome files
for i in {01..22}
do
  rm "${OUTDIR}chr_${i}.bgen"
done


########### 02. Conversion

plink2 --bgen "$BGEN" ref-first --sample "$SAMPLE" --make-pgen --out "$PGEN"


########### 03. Score

plink2 --pfile "$PGEN" --score "$SCORE" no-mean-imputation list-variants --out "$PRS"



