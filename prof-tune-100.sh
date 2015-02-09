#! /usr/bin/env bash 
#$ -S /bin/bash
#PBS -N prof-100

# HepMC: /afs/cern.ch/sw/lcg/external/HepMC/2.06.08/x86_64-slc5-gcc43-opt/


# Load an up-to-date compiler version
# source /afs/cern.ch/sw/lcg/contrib/gcc/4.3/x86_64-slc5-gcc43-opt/setup.sh
# source /afs/cern.ch/sw/lcg/contrib/gcc/4.3.6/x86_64-slc5-gcc46-opt/setup.sh
# source gcc.sh

#export LD_LIBRARY_PATH=/afs/.cern.ch/sw/lcg/contrib/gcc/4.3.6/x86_64-slc5-gcc43-opt/lib64/:$LD_LIBRARY_PATH

# Load a current Rivet installation for make-plots and rivet-config.
# source /afs/cern.ch/sw/lcg/external/MCGenerators_hepmc2.06.08/rivet/1.8.1.fj3/x86_64-slc5-gcc43-opt/rivetenv.sh
#source $HOME/BMC/rivet/rivetenv.sh
#export RIVET_ANALYSIS_PATH=$HOME/BMC/trunk/rivetanalyses

# setup up-to-date Python version
# PATH=/afs/cern.ch/sw/lcg/external/Python/2.6.5p2/x86_64-slc5-gcc43-opt/bin:${PATH}


# setup Professor binaries
export PATH=/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/bin:${PATH}
export PYTHONPATH=/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/lib/python2.6/site-packages:${PYTHONPATH}
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/lib:${LD_LIBRARY_PATH}

# BOOST:
export BOOSTPATH=/afs/cern.ch/sw/lcg/external/Boost/1.50.0_python2.6/x86_64-slc5-gcc43-opt/include/boost-1_50

# Include ROOT for Minuit access even if ROOTSYS is set to get the Minuit version PyMinuit was compiled with.
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.07/x86_64-slc5-gcc43-opt/root/lib:${LD_LIBRARY_PATH}
export PATH=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.07/x86_64-slc5-gcc43-opt/root/bin:${PATH}

# setup 3rd party python modules
PYTHONPATH=/afs/cern.ch/sw/lcg/external/pyanalysis/1.3_python2.6/x86_64-slc5-gcc43-opt/lib/python2.6/site-packages:${PYTHONPATH}
export PYTHONPATH


# Source the tab completion script if possible
if (complete &> /dev/null); then
    test -e "/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/prof-completion" && source "/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/prof-completion"
fi



source enviroment.sh



rivet --list-analyses  &> /mnt/eeh/micgro42/BMC/trunk/professor.log
