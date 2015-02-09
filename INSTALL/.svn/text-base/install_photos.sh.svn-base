cd ../../

VERSION=3.54
LOGFILE=PHOTOS.log

echo "remove old PHOTOS versions:" > $LOGFILE
rm -vf PHOTOS.3*  >> $LOGFILE 2>&1
rm -vrf PHOTOS  >> $LOGFILE 2>&1

echo "Downloading currunt PHOTOS version:" >> $LOGFILE
wget -vN -a $LOGFILE http://photospp.web.cern.ch/photospp/resources/PHOTOS.$VERSION/PHOTOS.$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf PHOTOS.$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$HEPMCPATH $HEPMCPATH" >> $LOGFILE
echo "\$PYTHIADIR $PYTHIADIR" >> $LOGFILE
echo "\$MCTESTERLOCATION $MCTESTERLOCATION" >> $LOGFILE
echo "\$TAUOLADIR $TAUOLADIR" >> $LOGFILE
g++ --version >> $LOGFILE

cd PHOTOS
echo  >> $BMCDIR/$LOGFILE
echo "configure PHOTOS"  >> $BMCDIR/$LOGFILE
./configure --with-hepmc=$HEPMCPATH --with-pythia8=$PYTHIADIR --with-tauola=$TAUOLADIR >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** echo make PHOTOS *** " >> $BMCDIR/$LOGFILE
make  >> $BMCDIR/$LOGFILE 2>&1

echo "#PHOTOS version $VERSION `date`" > $BMCDIR/trunk/envvar/env_photos.sh
echo "export PHOTOSDIR=$PWD" >> $BMCDIR/trunk/envvar/env_photos.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_photos.sh

echo  >> $BMCDIR/trunk/enviroment.sh
echo "#PHOTOS version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_photos.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_photos.sh

echo  >> $BMCDIR/$LOGFILE
echo "done" >> $BMCDIR/$LOGFILE

echo "begin photos errors:"
cat $BMCDIR/$LOGFILE | grep -i error
echo "end photos errors"
