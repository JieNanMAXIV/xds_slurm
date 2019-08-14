# xds_slurm
Steps to set up XDS on a SLURM system
1. Install XDS
2. renmame the original xds_par to xds_par_ori (mv xds_par xds_par_ori)
3. Copy all these files to the same folder where XDS binary files are located, which will replace the original forkxds. 
4. Define $MX_SOFT_XDS, it should be the directory where XDS is installed, see below for an example
   export MX_SOFT_XDS="/mxsoft/xds"
5. Make sure all files are executable (otherwise run "chmod +x" in Linux).
6. Modify the XDS path in the forkxds_job and adapt to your local SLURM environment if needed.
7. Optional, modify the "wait timeout" value (in the xds_wait_queue, default 600s).

How it works
You need to launch xds by "xds_par", as one normally runs XDS. XDS will run on one node for most JOBs, except for that during colspot and integration steps,the forked jobs will be run on CLUSTER_NODES nodes. 

Important information
1. CLUSTER_NODES (if undefined, will be the MAXIMUM_NUMBER_OF_JOBS) in XDS.INP, will the total number of NODES XDS use in forkxds.Match the value to the number of nodes that you plan to use. Note, it's different from the official release of XDS, where a list of nodes(hostname) is required. The default value is 1 if unspecified.  
2. To reach the best performance, all nodes are reserved exclusively by default (otherwise one can remove the keyword in forkxds_job)
