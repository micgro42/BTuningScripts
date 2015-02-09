#!/bin/bash
rm -v output/weights.bak
mv -v output/weights output/weights.bak
prof-lsobs -v --datadir ./output --weight=1.0 -o ./output/weights
cat ./output/weights
