#!/bin/bash
cd ../../

VERSION=3.0.6
LOGFILE=FASTJET.log

echo "remove old FASTJET versions:" > $LOGFILE
rm -vf fastjet-3*  >> $LOGFILE 2>&1
rm -vrf fastjet*  >> $LOGFILE 2>&1

echo "Downloading currunt FASTJET version:" >> $LOGFILE
wget -vN -a $LOGFILE http://fastjet.fr/repo/fastjet-$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf fastjet-$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE

mkdir fastjet
cd fastjet-$VERSION
echo  >> $BMCDIR/$LOGFILE
echo "configure FASTJET"  >> $BMCDIR/$LOGFILE
./configure --prefix=$BMCDIR/fastjet --enable-allcxxplugins >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo "echo make FASTJET" >> $BMCDIR/$LOGFILE
make -j 8 >> $BMCDIR/$LOGFILE 2>&1
make check >> $BMCDIR/$LOGFILE 2>&1
make install -j 8 >> $BMCDIR/$LOGFILE 2>&1

cd $BMCDIR/fastjet

echo "#FASTJET version $VERSION `date`" > $BMCDIR/trunk/envvar/env_fastjet.sh
echo "export FASTJETPATH=$PWD" >> $BMCDIR/trunk/envvar/env_fastjet.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_fastjet.sh
echo "export PATH=\${FASTJETPATH}/bin:\${PATH}" >> $BMCDIR/trunk/envvar/env_fastjet.sh

echo  >> $BMCDIR/trunk/enviroment.sh
echo "#FASTJET version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_fastjet.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_fastjet.sh

echo "done" >> $BMCDIR/$LOGFILE

echo "begin fastjet errors:"
cat $BMCDIR/$LOGFILE | grep -i error
echo "end fastjet errors"


