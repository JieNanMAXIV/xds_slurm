# xds_slurm
Steps to set up XDS on a SLURM system
1. Install XDS
2. Copy all these files to the same folder where XDS binary files are located, which will replace the original forkcolspot and forkintegrate.
4. Make sure all files are executable (otherwise run "chmod +x" in Linux).
5. Modify the XDS path in the forkcolspot_job and forkintegrate_job, and adapt to your local SLURM environment if needed.
6. Optional 1, modify the "wait timeout" value (in the xds_wait_queue, default 600s).
7. Optional 2, add shortcut to submit xds_par job, e.x. add the following line to the .bashrc. 
   alias xds_hpc="sbatch $MX_SOFT/XDS/xds.sh" 

Important information
1. MAXIMUM_NUMBER_OF_JOBS in XDS.INP, will be the number of jobs submitted in the forkcolspot and forkintegreate steps. Match the value to the number of nodes that you plan to use. 
2. To reach the best performance, all nodes are reserved exclusively by default (otherwise one can remove the keyword in forkcolspot_job, forintegrate_job)
3. MAXIMUM_NUMBER_OF_PROCESSORS should be the number of CPUs per node. If not defined, XDS will use all available nodes. 
