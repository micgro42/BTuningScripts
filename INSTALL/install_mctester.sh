#!/bin/bash
cd ../../

VERSION=1.25.0
LOGFILE=MCTESTER.log

echo "remove old MCTESTER versions:" > $LOGFILE
rm -vf MC-TESTER-*  >> $LOGFILE 2>&1
rm -vrf MC-TESTER  >> $LOGFILE 2>&1

echo "Downloading current MCTESTER version:" >> $LOGFILE
wget -vN -a $LOGFILE http://mc-tester.web.cern.ch/MC-TESTER/MC-TESTER-$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf MC-TESTER* >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE
echo "\$HEPMCPATH $HEPMCPATH" >> $LOGFILE

cd MC-TESTER
echo "configure MC-TESTER"  >> $BMCDIR/$LOGFILE
./configure --with-HepMC=$HEPMCPATH  >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** make MC-TESTER *** "  >> $BMCDIR/$LOGFILE
make -j1  >> $BMCDIR/$LOGFILE 2>&1

echo "#MC-TESTER version $VERSION `date`" > $BMCDIR/trunk/envvar/env_MCTESTER.sh
echo "export MCTESTERLOCATION=$PWD" >> $BMCDIR/trunk/envvar/env_MCTESTER.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_MCTESTER.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#MC-TESTER version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_MCTESTER.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_MCTESTER.sh

echo >> $BMCDIR/$LOGFILE
echo "done" >> $BMCDIR/$LOGFILE

echo "begin mctester errors:"
cat $BMCDIR/$LOGFILE | grep -i error
echo "end mctester errors"
