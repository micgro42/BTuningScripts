#!/bin/bash
cd ../../

VERSION=1.1.0
LOGFILE=YODA.log

echo "begin installation of YODA version $VERSION at `date` " > $LOGFILE

echo "remove old yoda versions:" >> $LOGFILE
rm -vf YODA-$VERSION*  >> $LOGFILE 2>&1
rm -vrf yoda >> $LOGFILE 2>&1
rm -vrf YODA-$VERSION* >> $LOGFILE 2>&1

echo "Downloading YODA version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE http://www.hepforge.org/archive/yoda/YODA-$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf YODA-$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE
echo "\$BOOSTPATH $BOOSTPATH" >> $LOGFILE
g++ --version >> $LOGFILE
python --version >> $LOGFILE 2>&1
echo "root version: `root-config --version`"  >> $LOGFILE

mkdir yoda

cd YODA-$VERSION
echo  >> $BMCDIR/$LOGFILE
echo "configure YODA"  >> $BMCDIR/$LOGFILE
./configure --prefix=$BMCDIR/yoda --enable-root --enable-static --with-boost=$BOOSTPATH  >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** make YODA *** " >> $BMCDIR/$LOGFILE
make -j4 >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** make check *** " >> $BMCDIR/$LOGFILE
make check -j4 >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** make install *** " >> $BMCDIR/$LOGFILE
make install -j4 >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** make installcheck *** " >> $BMCDIR/$LOGFILE
make installcheck -j4 >> $BMCDIR/$LOGFILE 2>&1

cd $BMCDIR/yoda
echo "#YODA version $VERSION `date`" > $BMCDIR/trunk/envvar/env_YODA.sh
echo "export YODAPATH=$PWD" >> $BMCDIR/trunk/envvar/env_YODA.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_YODA.sh
echo "export PATH=$PWD/bin:\$PATH" >> $BMCDIR/trunk/envvar/env_YODA.sh
echo "export PYTHONPATH=$PWD/lib/python2.7/site-packages:\$PYTHONPATH" >> $BMCDIR/trunk/envvar/env_YODA.sh
echo "# YODA: Source the tab completion script if possible" >> $BMCDIR/trunk/envvar/env_YODA.sh
echo "if (complete &> /dev/null); then" >> $BMCDIR/trunk/envvar/env_YODA.sh
echo "    test -e \"$PWD/share/YODA/yoda-completion\" && source \"$PWD/share/YODA/yoda-completion\"" >> $BMCDIR/trunk/envvar/env_YODA.sh
echo "fi" >> $BMCDIR/trunk/envvar/env_YODA.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#YODA version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_YODA.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_YODA.sh

echo >> $BMCDIR/$LOGFILE
echo "done: `date`" >> $BMCDIR/$LOGFILE

echo " *** begin yoda errors: *** "
cat $BMCDIR/$LOGFILE | grep -i error
echo "end yoda errors"



