mkdir ipol
prof-batchtune  -N 20  --weights weights  --datadir .  --runsfile runcombs.dat  -o "--ipol cubic" /afs/cern.ch/sw/lcg/external/MCGenerators/professor/1.3.3/x86_64-slc5-gcc43-opt/share/professor/templates/prof-interpolate.template
