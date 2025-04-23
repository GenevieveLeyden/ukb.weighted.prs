# ukb.weighted.prs
Notes and code to calculate a weighted PRS in the UKB. 

Please note the pipeline is built on University of Bristol infrastructure, though the code should be adaptable to other working environments. Further details are provided in the MRCIEU UKBionak data users [guidance material](https://uob.sharepoint.com/teams/grp-UKBiobankdatausers/Shared%20Documents/Forms/AllItems.aspx?csf=1&web=1&e=r7lbYe&CID=419637d0%2Db69c%2D448a%2D94f3%2D43451d1ce495&FolderCTID=0x012000B2DDC709B6D474469A800E84D003E8D8&id=%2Fteams%2Fgrp%2DUKBiobankdatausers%2FShared%20Documents%2FGeneral%2FTraining%2FGuidance%20material). If you notice any issues please get in touch. 


## Steps 

1. Create input files. 
2. Clone repo.
3. Create .env file (using .example_env template). 
4. Update .env as appropriate. 
4. Update job id and email details in slurm submission script. 
4. Run analysis. 

## Details 

#### Input files
Two input files are required to generate the weighted score: (1) a list of rsids (SNPLISTFILE) and (2) a three column file indicating the rsids, effect_allele and weights derived from a relevant GWAS (SCORE). Local storage of the ukb genetic and sample data are maintained by MRCIEU and are described elsewhere. 

#### Clone repo 
To use the pipeline, clone the repo to your working directory on BC4: `git clone git@github.com:GenevieveLeyden/ukb.weighted.prs.git`. 

#### Set environment variables 
To set the environment variables, within the repo you will need to copy the `.example_env` file to `.env`. Note these files are hidden, to list them use `ls -a`. Update the filepaths and names of all input/output files in `.env` as appropriate. Please note the paths to `GENDIR` and `SAMPLE` are provided in the [guidance material](https://uob.sharepoint.com/teams/grp-UKBiobankdatausers/Shared%20Documents/Forms/AllItems.aspx?csf=1&web=1&e=r7lbYe&CID=419637d0%2Db69c%2D448a%2D94f3%2D43451d1ce495&FolderCTID=0x012000B2DDC709B6D474469A800E84D003E8D8&id=%2Fteams%2Fgrp%2DUKBiobankdatausers%2FShared%20Documents%2FGeneral%2FTraining%2FGuidance%20material). 

#### Update slurm submission 
Update `--job-name` and `--mail-user` in the slurm submission script as appropriate to receive an update on the progress of your analysis. 

#### Run analysis 
To run the analysis, submit the job to the slurm scheduler using `sbatch slurm_submission.sh`. It may be useful to take note of the job id to check the progress of the analysis. 

