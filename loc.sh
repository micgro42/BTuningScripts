echo "lines of python code in this project: "
PY=`find .  -type f -name '*.py'| xargs cat | sed '/^\s*$/d;/^\s*#/d' | wc -l`
echo $PY
echo

echo "lines of shell code in this project: "
SH=`find .  -type f -name '*.sh'| xargs cat | sed '/^\s*$/d;/^\s*#/d' | wc -l`
echo $SH
echo

echo "lines of C/C++ code in this project: "
C=`find .  -type f -name '*.c'| xargs cat | sed '/^\s*$/d;/^\s*\/\//d' | wc -l`
CC=`find .  -type f -name '*.cc'| xargs cat | sed '/^\s*$/d;/^\s*\/\//d' | wc -l`
CXX=`find .  -type f -name '*.cxx'| xargs cat | sed '/^\s*$/d;/^\s*\/\//d' | wc -l`
H=`find .  -type f -name '*.h'| xargs cat | sed '/^\s*$/d;/^\s*\/\//d' | wc -l`
HH=`find .  -type f -name '*.hh'| xargs cat | sed '/^\s*$/d;/^\s*\/\//d' | wc -l`
echo $C+$CC+$CXX+$H+$HH | bc