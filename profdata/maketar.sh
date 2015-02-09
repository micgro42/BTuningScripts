#!/bin/bash
# optional: remove rivet.log and STDIN.e* files, since they can be ver large...
cd output/mc
find . -name "rivet.log" -print0 | xargs -0 rm -rf
find . -name "profmc.log" -print0 | xargs -0 rm -rf
find . -name "STDIN.*" -print0 | xargs -0 rm -rf
cd -
cd output
filename=profdata-$(date +%Y%m%d-%H%M%S%z).tar
tar cvf $filename mc ipol tunes runcombs.dat weights
gzip -9 -v $filename
rm -v profdata-newest.tar.gz
ln -s $filename.gz profdata-newest.tar.gz
rm -v $HOME/www/profdata-newest.tar.gz
ln -s $BMCDIR/output/$filename.gz $HOME/www/profdata-newest.tar.gz
