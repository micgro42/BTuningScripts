#!/bin/bash
cd ../../

VERSION=1.55.0
VERSION2=1_55_0
LOGFILE=BOOST.log

echo "remove old Boost versions:" > $LOGFILE
#rm -vf boost**  >> $LOGFILE 2>&1
#rm -vrf EvtGen >> $LOGFILE 2>&1
#rm -vrf R01* >> $LOGFILE 2>&1

echo "Downloading EVTGEN version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE http://downloads.sourceforge.net/project/boost/boost/$VERSION/boost_$VERSION2.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf boost_$VERSION2.tar.gz >> $LOGFILE 2>&1

exit 0

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE

cd EvtGen/$VERSION
echo  >> $BMCDIR/$LOGFILE
echo "configure EVTGEN"  >> $BMCDIR/$LOGFILE
./configure --hepmcdir=$HEPMCPATH --photosdir=$PHOTOSDIR --pythiadir=$PYTHIADIR --tauoladir=$TAUOLADIR --prefix=$BASEDIR --enable-debug >> $BMCDIR/$LOGFILE 2>&1


echo >> $BMCDIR/$LOGFILE
echo "echo make EVTGEN" >> $BMCDIR/$LOGFILE
make >> $BMCDIR/$LOGFILE 2>&1
make install >> $BMCDIR/$LOGFILE 2>&1

cd $BASEDIR
echo "#EVTGEN version $VERSION `date`" > $BMCDIR/trunk/envvar/env_evtgen.sh
echo "export EVTGENDIR=$PWD" >> $BMCDIR/trunk/envvar/env_evtgen.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_evtgen.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#EVTGEN version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_evtgen.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_evtgen.sh





