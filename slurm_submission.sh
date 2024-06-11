#!/bin/bash

#SBATCH --job-name=prs.job.name
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH -p cpu,mrcieu
#SBATCH --account=SSCM013902
#SBATCH --mem=5GB
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=YOUR.EMAIL@bristol.ac.uk


bash weighted_prs_pipeline.sh

