#!/bin/bash -l

#Standard output and error:
#SBATCH -o ./out.%j
#SBATCH -e ./err.%j

# Initial working directory:
#SBATCH -D ./

#Job Name
#SBATCH -J siesta-5.0-raven

#Number of nodes and MPI tasks per node:
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=72
#SBATCH --cpus-per-task=1

#Wall clock limit:
#SBATCH --time=0-00:30:00

#E-mail notifications
#SBATCH --mail-type=all
#SBATCH --mail-user=rybakov.ad@icloud.com

########################
# Load environment
########################

# Libraries and modules
module purge
module load mkl/2023.1 intel/2023.1.0.x openmpi/4.1 netcdf-mpi/4.8.1 fftw-mpi/3.3.10 elpa/mpi/openmp/2023.11.001 

export LD_LIBRARY_PATH=$MKLROOT/lib/intel64:$NETCDF_HOME/lib


srun siesta < ch3.fdf > CH3.out
