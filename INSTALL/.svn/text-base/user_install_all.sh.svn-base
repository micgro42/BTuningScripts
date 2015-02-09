#!/bin/bash

cd ../..
echo "export BMCDIR=$PWD" > trunk/enviroment.sh

cd trunk
source prof-tune-100.sh

mkdir envvar

cd INSTALL

source install_hepmc.sh
cd $BMCDIR/trunk/INSTALL
source install_pythia.sh
cd $BMCDIR/trunk/INSTALL
source install_mctester.sh
cd $BMCDIR/trunk/INSTALL
source install_tauola.sh
cd $BMCDIR/trunk/INSTALL
source install_photos.sh
cd $BMCDIR/trunk/INSTALL
source install_evtgen.sh
cd $BMCDIR/trunk/INSTALL
source install_fastjet.sh
cd $BMCDIR/trunk/INSTALL
source install_rivet.sh

# source install_numpy.sh

# source install_scipy.sh

# source install_matplotlib.sh

# source install_pyminuit2.sh

# source install_professor.sh


