rm path.log
touch path.log
date >> path.log
echo "gcc --version" >> path.log
gcc --version >> path.log
echo "g++ --version" >> path.log
g++ --version >> path.log
echo "python --version" >> path.log
python --version >> path.log 2>&1
echo "openssl version" >> path.log
openssl version >> path.log

echo '$COMPILER_PATH' >> path.log
echo $COMPILER_PATH >> path.log
echo '$RIVET_ANALYSIS_PATH' >> path.log
echo $RIVET_ANALYSIS_PATH >> path.log
echo '$EVTGENDIR' >> path.log
echo $EVTGENDIR >> path.log

echo  >> path.log

echo '$PYTHONPATH' >> path.log
echo $PYTHONPATH >> path.log


cat path.log
