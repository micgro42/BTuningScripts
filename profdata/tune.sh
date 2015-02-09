#!/bin/bash
prof-tune --datadir ./output --runs ./output/runcombs.dat --weights ./output/weights --ipol cubic
rivet-mkhtml ./output/tunes/tune-weights-*/ipolhistos/*.aida -o ./output/tune-plots
