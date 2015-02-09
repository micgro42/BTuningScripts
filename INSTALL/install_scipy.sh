#!/bin/bash
cd ../../

VERSION=0.14.0b1
LOGFILE=SCIPY.log

echo "remove old scipy versions:" > $LOGFILE
rm -vf scipy-*  >> $LOGFILE 2>&1
rm -vrf scipy >> $LOGFILE 2>&1
rm -vrf scipy-* >> $LOGFILE 2>&1

echo "Downloading scipy version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE http://downloads.sourceforge.net/project/scipy/scipy/$VERSION/scipy-$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf scipy-$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE

mkdir scipy

cd scipy-$VERSION
echo  >> $BMCDIR/$LOGFILE
echo "install scipy"  >> $BMCDIR/$LOGFILE
python setup.py build -v >> $BMCDIR/$LOGFILE 2>&1
python setup.py install -v --prefix=$BMCDIR/scipy >> $BMCDIR/$LOGFILE 2>&1

cd $BMCDIR/scipy
echo "#scipy version $VERSION `date`" > $BMCDIR/trunk/envvar/env_scipy.sh
echo "export PATH=$PWD/bin:\$PATH" >> $BMCDIR/trunk/envvar/env_scipy.sh
echo "export PYTHONPATH=$PWD/lib64/python2.6/site-packages:\$PYTHONPATH" >> $BMCDIR/trunk/envvar/env_scipy.sh


echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#scipy version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_scipy.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_scipy.sh

echo "done" >> $BMCDIR/$LOGFILE

cat $BMCDIR/$LOGFILE | grep -i error



