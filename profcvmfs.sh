#!/bin/bash
cd ..
export BMCDIR=$PWD

cd /cvmfs
ls
ls sft.cern.ch
ls

cd $BMCDIR/trunk
# compiler
source /cvmfs/sft.cern.ch/lcg/dev/gcc-462/x86_64-slc5/setup.sh
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/dev/gcc-462/x86_64-slc5/lib64:${LD_LIBRARY_PATH}

# ROOT: 5.34.10 is the version that works with pyanalysis 1.4_python2.7
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/app/releases/ROOT/5.34.10/x86_64-slc5-gcc46-opt/root/lib:${LD_LIBRARY_PATH}
export PATH=/cvmfs/sft.cern.ch/lcg/app/releases/ROOT/5.34.10/x86_64-slc5-gcc46-opt/root/bin:${PATH}
export ROOTSYS=/cvmfs/sft.cern.ch/lcg/app/releases/ROOT/5.34.10/x86_64-slc5-gcc46-opt/root

# setup up-to-date Python version
export PATH=/cvmfs/sft.cern.ch/lcg/external/Python/2.7.3/x86_64-slc5-gcc46-opt/bin:${PATH}
export PYTHONPATH=/cvmfs/sft.cern.ch/lcg/external/Python/2.7.3/x86_64-slc5-gcc46-opt/lib/python2.6:${PYTHONPATH}

#HepMC
# variable fuer include dir ?
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/external/HepMC/2.06.05/x86_64-slc5-gcc43-opt/lib:${LD_LIBRARY_PATH}
export HEPMCDIR=/cvmfs/sft.cern.ch/lcg/external/HepMC/2.06.05/x86_64-slc5-gcc43-opt
export HEPMCPATH=/cvmfs/sft.cern.ch/lcg/external/HepMC/2.06.05/x86_64-slc5-gcc43-opt
export HEPMCLOCATION=/cvmfs/sft.cern.ch/lcg/external/HepMC/2.06.05/x86_64-slc5-gcc43-opt

#Tauola
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/external/MCGenerators_hepmc2.06.05/tauola++/1.0.7/x86_64-slc5-gcc43-opt/lib:${LD_LIBRARY_PATH}
export TAUOLADIR=/cvmfs/sft.cern.ch/lcg/external/MCGenerators_hepmc2.06.05/tauola++/1.0.7/x86_64-slc5-gcc43-opt

#Photos
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/external/MCGenerators_hepmc2.06.05/photos++/3.52/x86_64-slc5-gcc43-opt/lib:${LD_LIBRARY_PATH}
export PHOTOSDIR=/cvmfs/sft.cern.ch/lcg/external/MCGenerators_hepmc2.06.05/photos++/3.52/x86_64-slc5-gcc43-opt

#pythia
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/external/MCGenerators_hepmc2.06.05/pythia8/170/x86_64-slc5-gcc43-opt/lib:${LD_LIBRARY_PATH}
export PYTHIA8DATA=/cvmfs/sft.cern.ch/lcg/external/MCGenerators_hepmc2.06.05/pythia8/170/x86_64-slc5-gcc43-opt/xmldoc
export PYTHIALOCATION=/cvmfs/sft.cern.ch/lcg/external/MCGenerators_hepmc2.06.05/pythia8/170/x86_64-slc5-gcc43-opt
export PYTHIADIR=/cvmfs/sft.cern.ch/lcg/external/MCGenerators_hepmc2.06.05/pythia8/170/x86_64-slc5-gcc43-opt

#EvtGen
source envvar/env_evtgen.sh

#fastjet
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/external/fastjet/3.0.3/x86_64-slc5-gcc43-opt/lib:${LD_LIBRARY_PATH}
export PATH=/cvmfs/sft.cern.ch/lcg/external/fastjet/3.0.3/x86_64-slc5-gcc43-opt/bin:${PATH}
export FASTJETPATH=/cvmfs/sft.cern.ch/lcg/external/fastjet/3.0.3/x86_64-slc5-gcc43-opt

#boost
export BOOSTPATH=/cvmfs/sft.cern.ch/lcg/external/Boost/1.53.0_python2.7/x86_64-slc5-gcc46-opt/include/boost-1_53

#rivet
source /cvmfs/sft.cern.ch/lcg/external/MCGenerators_hepmc2.06.05/rivet/1.8.3b1/x86_64-slc5-gcc43-opt/rivetenv.sh
export RIVET_ANALYSIS_PATH=$HOME/BMC/trunk/rivetanalyses

#several strange libraries
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/external/lapack/3.4.0/x86_64-slc5-gcc43-opt/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=/cvmfs/sft.cern.ch/lcg/external/blas/20110419/x86_64-slc5-gcc43-opt/lib:${LD_LIBRARY_PATH}

# numpy, scipy, matlibplot, pyminuit
export PYTHONPATH=/cvmfs/sft.cern.ch/lcg/external/pyanalysis/1.4_python2.7/x86_64-slc5-gcc46-opt/lib/python2.7/site-packages:${PYTHONPATH}

# professor
source envvar/env_professor.sh

