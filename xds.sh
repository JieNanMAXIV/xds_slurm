#!/bin/bash
#an example of sbatch file to submit xds_par job
#Jie Nan at MAXIV, 12/2016
#jie.nan@maxiv.lu.se

#SBATCH -t 00:20:00
#job name
#SBATCH -J xds_biomax
#SBATCH --exclusive
#SBATCH -N1
#SBATCH --cpus-per-task=20


# filenames stdout and stderr - customise, include %j
#SBATCH -o xds_hpc_%j.out
#SBATCH -e xds_hpc_%j.err

# write this script to stdout-file - useful for scripting errors
cat $0

# load the modules required for you program - customise for your program
export PATH="$MX_SOFT/XDS:$PATH"


# run the program
# customise for your program name and add arguments if required
xds_par
