git clone git://github.com/iminuit/iminuit.git
python setup.py build -v
python setup.py install --prefix=$PWD


echo "export PYTHONPATH=$PWD/lib64/python2.6/site-packages:\$PYTHONPATH" >> $BMCDIR/trunk/envvar/env_minuit.sh
