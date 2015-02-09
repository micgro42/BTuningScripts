#!/bin/bash

cd output/mc/000
rivet-cmphistos -o ../../plots/ out.yoda
cd ../../plots/
make-plots *.dat
rm -fv *.dat
