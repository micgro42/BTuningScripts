#!/bin/bash
cd ../../

VERSION=2.1.2
LOGFILE=RIVET.log
echo "begin installation of RIVET version $VERSION at `date` " > $LOGFILE

echo "remove old RIVET versions:" >> $LOGFILE
rm -vf Rivet-$VERSION*  >> $LOGFILE 2>&1
rm -vrf rivet >> $LOGFILE 2>&1
rm -vrf Rivet-$VERSION* >> $LOGFILE 2>&1

echo "Downloading RIVET version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE http://www.hepforge.org/archive/rivet/Rivet-$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf Rivet-$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE
echo "\$BOOSTPATH $BOOSTPATH" >> $LOGFILE
echo "\$HEPMCDIR $HEPMCDIR" >> $LOGFILE
echo "\$FASTJETPATH $FASTJETPATH" >> $LOGFILE
echo "\$YODAPATH $YODAPATH" >> $LOGFILE
echo "\$LIBS $LIBS" >> $LOGFILE
LIBS=-lstdc++
echo "\$LIBS $LIBS" >> $LOGFILE
g++ --version >> $LOGFILE
python --version >> $LOGFILE 2>&1
echo "root version: `root-config --version`"  >> $LOGFILE

mkdir rivet

cd Rivet-$VERSION
echo  >> $BMCDIR/$LOGFILE
echo "configure RIVET"  >> $BMCDIR/$LOGFILE
./configure --prefix=$BMCDIR/rivet --with-hepmc=$HEPMCDIR --with-boost=$BOOSTPATH --with-yoda=$YODAPATH --enable-static --enable-shared >> $BMCDIR/$LOGFILE 2>&1
# --enable-debug --enable-extra-warnings

# include workaround for trivial lorentz-transformation
# now manually change line 47-ish in LorentzTrans.hh to 
#if (beta>0.0){
#      _boostMatrix =rotate(Vector3::mkX(), boost)._boostMatrix;
#}

echo >> $BMCDIR/$LOGFILE
echo " *** make RIVET *** " >> $BMCDIR/$LOGFILE
make -j4 >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** make check *** " >> $BMCDIR/$LOGFILE
make check >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** make install *** " >> $BMCDIR/$LOGFILE
make install >> $BMCDIR/$LOGFILE 2>&1

echo >> $BMCDIR/$LOGFILE
echo " *** make installcheck *** " >> $BMCDIR/$LOGFILE
make installcheck >> $BMCDIR/$LOGFILE 2>&1


cd $BMCDIR/rivet
echo "#RIVET version $VERSION `date`" > $BMCDIR/trunk/envvar/env_RIVET.sh
echo "export RIVETDIR=$PWD" >> $BMCDIR/trunk/envvar/env_RIVET.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_RIVET.sh
echo "export RIVET_ANALYSIS_PATH=$BMCDIR/trunk/rivetanalyses" >> $BMCDIR/trunk/envvar/env_RIVET.sh
echo "export PATH=$PWD/bin:\$PATH" >> $BMCDIR/trunk/envvar/env_RIVET.sh
echo "export PYTHONPATH=$PWD/lib/python2.7/site-packages:\$PYTHONPATH" >> $BMCDIR/trunk/envvar/env_RIVET.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#RIVET version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_RIVET.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_RIVET.sh

echo >> $BMCDIR/$LOGFILE
echo "done: `date`" >> $BMCDIR/$LOGFILE

echo "begin rivet errors:"
cat $BMCDIR/$LOGFILE | grep -i error
echo "end rivet errors"



