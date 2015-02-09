#!/bin/bash
cd ../../

VERSION=2.06.09
LOGFILE=HEPMC.log

echo "remove old HEPMC versions:" > $LOGFILE
rm -vf HepMC-*  >> $LOGFILE 2>&1
rm -vrf HepMC >> $LOGFILE 2>&1
rm -vrf HepMC-* >> $LOGFILE 2>&1
rm -vrf HepMCbuild >> $LOGFILE 2>&1

echo "Downloading HEPMC version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE http://lcgapp.cern.ch/project/simu/HepMC/download/HepMC-$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf HepMC-$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE

mkdir HepMCbuild
cd HepMCbuild
echo  >> $BMCDIR/$LOGFILE
echo "echo make HEPMC" >> $BMCDIR/$LOGFILE
cmake -DCMAKE_INSTALL_PREFIX=$BMCDIR/HepMC -Dmomentum:STRING=GEV -Dlength:STRING=MM -DCMAKE_BUILD_TYPE=Debug $BMCDIR/HepMC-$VERSION  >> $BMCDIR/$LOGFILE 2>&1
make -j8 >> $BMCDIR/$LOGFILE 2>&1
make test -j8 >> $BMCDIR/$LOGFILE 2>&1
make install -j8 >> $BMCDIR/$LOGFILE 2>&1

cd $BMCDIR/HepMC
echo "#HEPMC version $VERSION `date`" > $BMCDIR/trunk/envvar/env_HEPMC.sh
echo "export HEPMCDIR=$PWD" >> $BMCDIR/trunk/envvar/env_HEPMC.sh
echo "export HEPMCPATH=$PWD" >> $BMCDIR/trunk/envvar/env_HEPMC.sh
echo "export HEPMCLOCATION=$PWD" >> $BMCDIR/trunk/envvar/env_HEPMC.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_HEPMC.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#HEPMC version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_HEPMC.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_HEPMC.sh

echo "done" >> $BMCDIR/$LOGFILE

echo "begin hepmc errors:"
cat $BMCDIR/$LOGFILE | grep -i error
echo "end hepmc errors"

