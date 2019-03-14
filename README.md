# xds_slurm
Steps to set up XDS on a SLURM system
1. Install XDS
2. Copy all these files to the same folder where XDS binary files are located, which will replace the original forkxds. 
3. Define $MX_SOFT_XDS, it should be the directory where XDS is installed, see below for an example
   export MX_SOFT_XDS="/mxsoft/xds"
4. Make sure all files are executable (otherwise run "chmod +x" in Linux).
5. Modify the XDS path in the forkxds_job and adapt to your local SLURM environment if needed.
6. Optional 1, modify the "wait timeout" value (in the xds_wait_queue, default 600s).
7. Optional 2, add shortcut to submit xds_par job, e.x. add the following line to the .bashrc. 
   alias xds_hpc="sbatch $MX_SOFT_XDS/xds.sh" 

How it works
You need to launch xds by "xds_hpc". XDS will run on one node for most JOBs, except for that during colspot and integration steps,the forked jobs will be run on CLUSTER_NODES nodes. 

Important information
1. CLUSTER_NODES in XDS.INP, will the total number of NODES XDS use in forkxds.Match the value to the number of nodes that you plan to use. Note, it's different from the official release of XDS, where a list of nodes(hostname) is required. The default value is 1 if unspecified.  
2. To reach the best performance, all nodes are reserved exclusively by default (otherwise one can remove the keyword in forkxds_job)
