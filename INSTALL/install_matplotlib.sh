#!/bin/bash
cd ../../

VERSION=1.2.0
LOGFILE=MATPLOTLIB.log

echo "remove old matplotlib versions:" > $LOGFILE
rm -vf matplotlib-*  >> $LOGFILE 2>&1
rm -vrf matplotlib >> $LOGFILE 2>&1
rm -vrf matplotlib-* >> $LOGFILE 2>&1

echo "Downloading matplotlib version $VERSION:" >> $LOGFILE
wget -vN -a $LOGFILE https://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-$VERSION/matplotlib-$VERSION.tar.gz

echo >> $LOGFILE
echo "extracting tarball:" >> $LOGFILE
tar xvzf matplotlib-$VERSION.tar.gz >> $LOGFILE 2>&1

echo "relevant env variables:" >> $LOGFILE
echo "\$BMCDIR $BMCDIR" >> $LOGFILE

mkdir matplotlib
mkdir matplotlib/lib
mkdir matplotlib/lib/python2.6
mkdir matplotlib/lib/python2.6/site-packages
mkdir matplotlib/lib64
mkdir matplotlib/lib64/python2.6
mkdir matplotlib/lib64/python2.6/site-packages

cd matplotlib-$VERSION
echo  >> $BMCDIR/$LOGFILE

echo "build matplotlib"  >> $BMCDIR/$LOGFILE
python setup.py build -v >> $BMCDIR/$LOGFILE 2>&1

export PYTHONPATH=$BMCDIR/matplotlib/lib/python2.6/site-packages:$PYTHONPATH
export PYTHONPATH=$BMCDIR/matplotlib/lib64/python2.6/site-packages:$PYTHONPATH

echo "install matplotlib"  >> $BMCDIR/$LOGFILE
python setup.py install -v --prefix=$BMCDIR/matplotlib >> $BMCDIR/$LOGFILE 2>&1

cd $BMCDIR/matplotlib
echo "#matplotlib version $VERSION `date`" > $BMCDIR/trunk/envvar/env_matplotlib.sh
echo "export PATH=$PWD/bin:\$PATH" >> $BMCDIR/trunk/envvar/env_matplotlib.sh
echo "export PYTHONPATH=$PWD/lib64/python2.6/site-packages:\$PYTHONPATH" >> $BMCDIR/trunk/envvar/env_matplotlib.sh

echo  >> $BMCDIR/trunk/enviroment.sh >> $BMCDIR/trunk/enviroment.sh
echo "#matplotlib version $VERSION `date`" >> $BMCDIR/trunk/enviroment.sh
echo "source $BMCDIR/trunk/envvar/env_matplotlib.sh" >> $BMCDIR/trunk/enviroment.sh

source $BMCDIR/trunk/envvar/env_matplotlib.sh

echo "done" >> $BMCDIR/$LOGFILE

cat $BMCDIR/$LOGFILE | grep -i error



