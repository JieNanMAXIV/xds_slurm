# xds_slurm
Steps to set up XDS on a SLURM system
1. Install XDS
2. Copy all these files to the same folder where XDS binary files are located, which will replace the original forkxds. 
3. Define $MX_SOFT_XDS, it should be the directory where XDS is installed, see below for an example
   export MX_SOFT_XDS="/mxsoft/xds"
4. Make sure all files are executable (otherwise run "chmod +x" in Linux).
5. forxds_ori is nearly the same as the original forxds, only with minor changes
6. forxds is made for MAXIV HPC environment, probably require changes to adapt to the your HPC environment
7. optional, under the folder otherPC, there is a file called xds_par_cc, which is an exmaple to run xds_par on HPC from a local machine (and give real-time output in terminal, can be terminated by ctrl+c or kill). To use it, you can copy this file to a local machine (modify accordingly), rename to xds_par and add to your environment. 
8. optional, under the folder otherPC, the file forkxds_bs and forxds_bs_remote, is an example of only sending forked jobs to HPC, the rest of XDS jobs will run on a local server. You need to copy forkxds_bs_remote to XDS installation on the local server and replace forkxds
9. for 7 and 8, it's important to set up passwordless login between the local machine and HPC, otherwise you will have to type in password all the time.

How to run
Option 1) launch xds by "xds_par", as one normally runs XDS. XDS will run on one node for most JOBs, except for that during colspot and integration steps,the forked jobs will be run on CLUSTER_NODES nodes. 
Option 2) launch the xds job on new cluster nodes by executing "sbatch xds.sh", one needs to adapt the xds.sh to the HPC environment.
Option 3) excecuting "xds_hpc_wait" directly, similar to 2) except that it will wait until the xds job finishes.

Important information
1. CLUSTER_NODES (if undefined, will be the MAXIMUM_NUMBER_OF_JOBS) in XDS.INP, will the total number of NODES XDS use in forkxds.Match the value to the number of nodes that you plan to use. Note, it's different from the official release of XDS, where a list of nodes(hostname) is required. The default value is 1 if unspecified.  
2. To reach the best performance, all nodes are reserved exclusively by default (otherwise one can remove the keyword in forkxds_job)
