cd ../../

VERSION=1.1.4
LOGFILE=TAUOLA.log

echo "remove old TAUOLA versions:" > $LOGFILE
rm -vf TAUOLA.1*  >> $LOGFILE 2>&1
rm -vrf TAUOLA  >> $LOGFILE 2>&1

echo "Downloading TAUOLA version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE  http://tauolapp.web.cern.ch/tauolapp/resources/TAUOLA.$VERSION/TAUOLA.$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf TAUOLA.$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$HEPMCPATH $HEPMCPATH" >> $LOGFILE
echo "\$PYTHIADIR $PYTHIADIR" >> $LOGFILE
echo "\$MCTESTERLOCATION $MCTESTERLOCATION" >> $LOGFILE
g++ --version >> $LOGFILE

cd TAUOLA
echo  >> $BMCDIR/$LOGFILE
echo "configure TAUOLA"  >> $BMCDIR/$LOGFILE
./configure --with-hepmc=$HEPMCPATH --with-pythia8=$PYTHIADIR >> $BMCDIR/$LOGFILE 2>&1
#./configure --with-hepmc=$HEPMCPATH --with-pythia8=$PYTHIADIR --with-mc-tester=$MCTESTERLOCATION  >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** make Tauola *** " >> $BMCDIR/$LOGFILE
make -j1 >> $BMCDIR/$LOGFILE 2>&1

#cd examples
#echo >> $BMCDIR/$LOGFILE
#echo " *** configure and make examples *** ">> $BMCDIR/$LOGFILE
#./configure >> $BMCDIR/$LOGFILE 2>&1
#make -j1 >> $BMCDIR/$LOGFILE 2>&1

echo "#TAUOLA version $VERSION `date`" > $BMCDIR/trunk/envvar/env_tauola.sh
echo "export TAUOLADIR=$PWD" >> $BMCDIR/trunk/envvar/env_tauola.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_tauola.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#TAUOLA version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_tauola.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_tauola.sh

echo  >> $BMCDIR/$LOGFILE
echo "done" >> $BMCDIR/$LOGFILE

echo "begin tauola errors:"
cat $BMCDIR/$LOGFILE | grep -i error
echo "end tauola errors"

