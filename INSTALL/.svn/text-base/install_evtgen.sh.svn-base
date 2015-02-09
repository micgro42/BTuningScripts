#!/bin/bash

source testBMCDIR.sh
if [ $? -eq 1 ]
then
 echo "BMCDIR not set, exiting"
 exit 1
fi
cd ../../

VERSION=R01-03-00
LOGFILE=$BMCDIR/EVTGEN.log

echo "begin installation of EvtGen version $VERSION at `date` " > $LOGFILE

echo "remove old EVTGEN versions:" >> $LOGFILE
rm -vf EvtGen.R*  >> $LOGFILE 2>&1
rm -vrf EvtGen >> $LOGFILE 2>&1

echo "Downloading EVTGEN version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE http://evtgen.warwick.ac.uk/static/srcrep/$VERSION/EvtGen.$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf EvtGen.$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE
BASEDIR=$BMCDIR/EvtGen
echo "\$BASEDIR $BASEDIR" >> $LOGFILE
echo "\$HEPMCDIR $HEPMCDIR" >> $LOGFILE
echo "\$PYTHIADIR $PYTHIADIR" >> $LOGFILE
echo "\$PHOTOSDIR $PHOTOSDIR" >> $LOGFILE
echo "\$TAUOLADIR $TAUOLADIR" >> $LOGFILE
g++ --version >> $LOGFILE

cd EvtGen
cp -vr $VERSION/* ./ >> $LOGFILE  2>&1
echo  >> $LOGFILE
echo "configure EVTGEN"  >> $LOGFILE
./configure --hepmcdir=$HEPMCPATH --photosdir=$PHOTOSDIR --pythiadir=$PYTHIADIR --tauoladir=$TAUOLADIR --prefix=$BASEDIR >> $LOGFILE 2>&1


echo >> $LOGFILE
echo " *** make EVTGEN *** " >> $LOGFILE
make >> $LOGFILE 2>&1

#echo >> $LOGFILE
#echo " *** make install ***" >> $LOGFILE
#make install >> $LOGFILE 2>&1

cd ./test
chmod -v u+x configure >> $LOGFILE 
./configure >> $LOGFILE

cd ..

#cd $BASEDIR
echo "#EVTGEN version $VERSION `date`" > $BMCDIR/trunk/envvar/env_evtgen.sh
echo "export EVTGENDIR=$PWD" >> $BMCDIR/trunk/envvar/env_evtgen.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_evtgen.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#EVTGEN version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_evtgen.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_evtgen.sh

echo >> $LOGFILE
echo "done: `date`" >> $LOGFILE

echo "begin evtgen errors:"
cat $LOGFILE | grep -i error
echo "end evtgen errors"

