#!/bin/bash
cd ~/BMC
export BMCDIR=$PWD
cd trunk

# compiler
source /afs/cern.ch/sw/lcg/contrib/gcc/4.7.2/x86_64-slc6-gcc47-opt/setup.sh
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/contrib/gcc/4.7.2/x86_64-slc6-gcc47-opt/lib64/:$LD_LIBRARY_PATH

# ROOT: neueste Version mit x86_64-slc5-gcc43-opt 5.34.07 bisher: 5.27.02
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.20/x86_64-slc6-gcc47-opt/root/lib:${LD_LIBRARY_PATH}
export PATH=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.20/x86_64-slc6-gcc47-opt/root/bin:${PATH}
export PYTHONPATH=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.20/x86_64-slc6-gcc47-opt/root/lib:${PYTHONPATH}

# setup up-to-date Python version
export PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.3/x86_64-slc6-gcc47-opt/bin:${PATH}
export PYTHONPATH=/afs/cern.ch/sw/lcg/external/Python/2.7.3/x86_64-slc6-gcc47-opt/lib/python2.7:${PYTHONPATH}
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.3/x86_64-slc6-gcc47-opt/lib:${LD_LIBRARY_PATH}

#HepMC
# variable fuer include dir ?
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/HepMC/2.06.08/x86_64-slc6-gcc47-opt/lib:${LD_LIBRARY_PATH}
export HEPMCDIR=/afs/cern.ch/sw/lcg/external/HepMC/2.06.08/x86_64-slc6-gcc47-opt
export HEPMCPATH=/afs/cern.ch/sw/lcg/external/HepMC/2.06.08/x86_64-slc6-gcc47-opt
export HEPMCLOCATION=/afs/cern.ch/sw/lcg/external/HepMC/2.06.08/x86_64-slc6-gcc47-opt

#MC-Tester
source $BMCDIR/trunk/envvar/env_MCTESTER.sh

#pythia
source $BMCDIR/trunk/envvar/env_pythia.sh

#Tauola
source $BMCDIR/trunk/envvar/env_tauola.sh

#Photos
source $BMCDIR/trunk/envvar/env_photos.sh

#EvtGen
source $BMCDIR/trunk/envvar/env_evtgen.sh

#fastjet
source $BMCDIR/trunk/envvar/env_fastjet.sh
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/fastjet/3.0.3/x86_64-slc6-gcc47-opt/lib:${LD_LIBRARY_PATH}
export FASTJETPATH=/afs/cern.ch/sw/lcg/external/fastjet/3.0.3/x86_64-slc6-gcc47-opt
export PATH=${FASTJETPATH}/bin:${PATH}


#boost
export BOOSTPATH=/afs/cern.ch/sw/lcg/external/Boost/1.53.0_python2.7/x86_64-slc6-gcc47-opt/include/boost-1_53

#yoda
source $BMCDIR/trunk/envvar/env_YODA.sh

#rivet
source $BMCDIR/trunk/envvar/env_RIVET.sh
#source /afs/cern.ch/sw/lcg/external/MCGenerators_hepmc2.06.08/rivet/1.8.1.fj3/x86_64-slc5-gcc43-opt/rivetenv.sh
export RIVET_ANALYSIS_PATH=$HOME/BMC/trunk/rivetanalyses

# numpy, scipy, matlibplot, pyminuit
export PYTHONPATH=/afs/cern.ch/sw/lcg/external/pyanalysis/1.4_python2.7/x86_64-slc6-gcc47-opt/lib/python2.7/site-packages:${PYTHONPATH}

# professor
source $BMCDIR/trunk/envvar/env_professor.sh
#export PATH=/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/bin:${PATH}
#export PYTHONPATH=/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/lib/python2.6/site-packages:${PYTHONPATH}
#export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/lib:${LD_LIBRARY_PATH}

# professor: Source the tab completion script if possible
if (complete &> /dev/null); then
    test -e "$BMCDIR/professor/etc/bash_completion.d/prof-completion" && source "/users/eeh/micgro42/BMC/professor/etc/bash_completion.d/prof-completion"
#    test -e "/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/prof-completion" && source "/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/prof-completion"
fi
