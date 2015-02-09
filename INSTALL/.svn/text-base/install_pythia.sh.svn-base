#!/bin/bash

cd ../../
VERSION=8183
LOGFILE=PYTHIA.log

echo "remove old PYTHIA versions:" > $LOGFILE
rm -vf pythia8*  >> $LOGFILE 2>&1
rm -vrf pythia >> $LOGFILE 2>&1
rm -vrf pythia8* >> $LOGFILE 2>&1

echo "Downloading PYTHIA version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE http://home.thep.lu.se/~torbjorn/pythia8/pythia$VERSION.tgz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf pythia$VERSION.tgz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$HEPMCPATH $HEPMCPATH" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE
gcc --version >> $LOGFILE

mkdir pythia
cd pythia$VERSION

echo >> $BMCDIR/$LOGFILE
echo "configure pythia"  >> $BMCDIR/$LOGFILE
./configure --with-hepmc=$HEPMCPATH --enable-shared --enable-64bits  --prefix=$BMCDIR/pythia >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo "*** gmake pythia ***" >> $BMCDIR/$LOGFILE
gmake -j1 >> ../$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** gmake install *** " >> $BMCDIR/$LOGFILE
gmake install -j1 >> ../$LOGFILE 2>&1

cd ../pythia
echo "#PYTHIA version $VERSION `date`" > $BMCDIR/trunk/envvar/env_pythia.sh
echo "export PYTHIADIR=$PWD" >> $BMCDIR/trunk/envvar/env_pythia.sh
echo "export PYTHIALOCATION=$PWD" >> $BMCDIR/trunk/envvar/env_pythia.sh
echo "export PYTHIA8DATA=$PWD/xmldoc" >> $BMCDIR/trunk/envvar/env_pythia.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_pythia.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#PYTHIA version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_pythia.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_pythia.sh

echo "done" >> $BMCDIR/$LOGFILE

echo "begin pythia errors:"
cat $BMCDIR/$LOGFILE | grep -i error
echo "end pythia errors"
