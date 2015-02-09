cd $BMCDIR

LOGFILE=PYMINUIT2.log
VERSION=1.1.0

wget -vN -a $LOGFILE http://pyminuit2.googlecode.com/files/pyminuit2-$VERSION.tar.gz

tar xzvf pyminuit2-$VERSION.tar.gz >> $LOGFILE 2>&1

mkdir pyminuit2

cd pyminuit2-$VERSION

python setup.py build -v
python setup.py install -v --prefix=$BMCDIR/pyminuit2





