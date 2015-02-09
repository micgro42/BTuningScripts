#!/bin/bash
cd ../../

VERSION=1.8.0
LOGFILE=NUMPY.log

echo "remove old numpy versions:" > $LOGFILE
rm -vf numpy-*  >> $LOGFILE 2>&1
rm -vrf numpy >> $LOGFILE 2>&1
rm -vrf numpy-* >> $LOGFILE 2>&1

echo "Downloading numpy version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE http://downloads.sourceforge.net/project/numpy/NumPy/$VERSION/numpy-$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf numpy-$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE

mkdir numpy

cd numpy-$VERSION
echo  >> $BMCDIR/$LOGFILE
echo "install numpy"  >> $BMCDIR/$LOGFILE
python setup.py build -v >> $BMCDIR/$LOGFILE 2>&1
python setup.py install -v --prefix=$BMCDIR/numpy >> $BMCDIR/$LOGFILE 2>&1

cd $BMCDIR/numpy
echo "#numpy version $VERSION `date`" > $BMCDIR/trunk/envvar/env_numpy.sh
echo "export PATH=$PWD/bin:\$PATH" >> $BMCDIR/trunk/envvar/env_numpy.sh
echo "export PYTHONPATH=$PWD/lib64/python2.6/site-packages:\$PYTHONPATH" >> $BMCDIR/trunk/envvar/env_numpy.sh
# export PYTHONPATH

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#numpy version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_numpy.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_numpy.sh

echo "done" >> $BMCDIR/$LOGFILE

cat $BMCDIR/$LOGFILE | grep -i error



