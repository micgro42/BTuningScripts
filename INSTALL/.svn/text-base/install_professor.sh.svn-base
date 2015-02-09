#!/bin/bash
cd ../../

VERSION=1.3.3
LOGFILE=PROFESSOR.log

echo "remove old professor versions:" > $LOGFILE
#rm -vf professor-*  >> $LOGFILE 2>&1
rm -vrf professor >> $LOGFILE 2>&1
#rm -vrf professor-* >> $LOGFILE 2>&1

#echo "Downloading professor version $VERSION:" >> $LOGFILE
#wget -vN -a $LOGFILE http://www.hepforge.org/archive/professor/professor-$VERSION.tar.bz2

#echo >> $LOGFILE
#echo "extracting tarball:" >> $LOGFILE
#tar xvjf professor-$VERSION.tar.bz2 >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE
echo "\$BOOSTPATH $BOOSTPATH" >> $LOGFILE
echo "\$HEPMCDIR $HEPMCDIR" >> $LOGFILE
echo "\$FASTJETPATH $FASTJETPATH" >> $LOGFILE

mkdir professor

#cd professor-$VERSION
cd profsvn/trunk
echo  >> $BMCDIR/$LOGFILE
echo "install professor"  >> $BMCDIR/$LOGFILE
./setup.py install -v --prefix="$BMCDIR/professor" >> $BMCDIR/$LOGFILE 2>&1
return 1
cd $BMCDIR/professor
echo "#professor version $VERSION `date`" > $BMCDIR/trunk/envvar/env_professor.sh
echo "export PROFESSORDIR=$PWD" >> $BMCDIR/trunk/envvar/env_professor.sh
echo "export LD_LIBRARY_PATH=$PWD/lib:\$LD_LIBRARY_PATH" >> $BMCDIR/trunk/envvar/env_professor.sh
echo "export PYTHONPATH=$PWD/lib/python2.7/site-packages:\$PYTHONPATH" >> $BMCDIR/trunk/envvar/env_professor.sh
echo "export PATH=$PWD/bin:\$PATH" >> $BMCDIR/trunk/envvar/env_professor.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#professor version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_professor.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_professor.sh

echo "done" >> $BMCDIR/$LOGFILE

cat $BMCDIR/$LOGFILE | grep -i error



