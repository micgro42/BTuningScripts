#!/bin/bash
rm -v ./output/runcombs.dat.bak
mv -v ./output/runcombs.dat ./output/runcombs.dat.bak
prof-runcombs --mcdir ./output/mc -c 0:1 -c 30:100 --weights ./output/weights -o ./output/runcombs.dat
#prof-runcombs --mcdir ./output/mc -c 0:1 -c 10:40 --weights ./output/weights -o ./output/runcombs.dat
