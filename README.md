# xds_slurm
Steps to set up XDS on a SLURM system
1. Install XDS
2. Copy all these files to the same folder where XDS binary files are located, which will replace the original forkxds. 
3. Define $MX_SOFT_XDS, it should be the directory where XDS is installed, see below for an example
   export MX_SOFT_XDS="/mxsoft/xds"
4. Make sure all files are executable (otherwise run "chmod +x" in Linux).
5. forkxds_ori is nearly the same as the original forxds, only with minor changes
6. forkxds is made for MAXIV HPC environment, probably require changes to adapt to the HPC environment
7. optional, under the folder otherPC, the file forkxds_bs and forxds_bs_remote, is an example of only sending forked jobs to HPC, the rest of XDS jobs will run on a local server. You need to copy forkxds_bs_remote to XDS installation on the local server and replace forkxds. It's important to set up passwordless login between the local machine and HPC, otherwise one will have to type the password every time when running XDS.

How to run
Option 1) launch xds by "xds_par", as one normally runs XDS. XDS will run on one node for most JOBs, except for that during colspot and integration steps,the forked jobs will be run on CLUSTER_NODES-1 nodes. 
Option 2) launch the xds job on new cluster nodes by executing "sbatch xds.sh", one might need to modify the xds.sh.
Option 3) excecute "xds_hpc_wait" directly, similar to 2) except that it will wait until the xds job finishes.

Important information
1. CLUSTER_NODES (if undefined, will be the MAXIMUM_NUMBER_OF_JOBS) in XDS.INP, is the total number of NODES XDS use in forkxds. Match the value to the number of nodes that you plan to use. Note, it's different from the official release of XDS, where a list of node names(hostname) is required. The default value is 1 if unspecified.  
2. To reach the best performance, all nodes are reserved exclusively by default
