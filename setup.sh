# Setup environment for Professor usage.
# Just source this file in your current shell session via
# source /afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/setup.sh

# Load an up-to-date compiler version
source /afs/cern.ch/sw/lcg/contrib/gcc/4.3/x86_64-slc5-gcc43-opt/setup.sh

# Load a current Rivet installation for make-plots and rivet-config.
source /afs/cern.ch/sw/lcg/external/MCGenerators/rivet/1.8.1.fj3/x86_64-slc5-gcc43-opt/rivetenv.sh

# setup up-to-date Python version
PATH=/afs/cern.ch/sw/lcg/external/Python/2.6.5p2/x86_64-slc5-gcc43-opt/bin:${PATH}
# setup Professor binaries
PATH=/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/bin:${PATH}
export PATH
# setup 3rd party python modules
PYTHONPATH=/afs/cern.ch/sw/lcg/external/pyanalysis/1.2_python2.6/x86_64-slc5-gcc43-opt/lib/python2.6/site-packages:${PYTHONPATH}
# setup Professor imports
PYTHONPATH=/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/lib/python2.6/site-packages:${PYTHONPATH}
export PYTHONPATH

# Include ROOT for Minuit access even if ROOTSYS is set to get the Minuit version PyMinuit was compiled with.
export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/lib:/afs/cern.ch/sw/lcg/external/Python/2.6.5p2/x86_64-slc5-gcc43-opt/lib:/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.04/x86_64-slc5-gcc43-opt/root/lib:${LD_LIBRARY_PATH}

# Source the tab completion script if possible
if (complete &> /dev/null); then
    test -e "/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/prof-completion" && source "/afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/prof-completion"
fi
