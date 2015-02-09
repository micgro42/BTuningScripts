#!/bin/sh
rm -vr output/mc.bak
mv -v output/mc output/mc.bak

NoP=6 #number of parameters
n=3 #dimension of interpolation: 2=quadratic 3=cubic etc

#calculating number of runs according to formula (3) in professor papaer Eur.Phys.J.C (2010) 65: 331-357
case $n in
  2 ) NoR=`echo "scale=30;1+$NoP+1/2*$NoP*($NoP+1)" | bc -l` ;;
  3 ) NoR=`echo "scale=30;1+$NoP+1/2*$NoP*($NoP+1)+1/6*$NoP*($NoP+1)*($NoP+2)" | bc -l` ;;
  * ) echo fail ;;
esac
NoR=`echo $NoR | awk '{print int($1+0.5)}'`
NoR=$(($NoR*2))
echo "number of runs: $NoR"

#prof-sampleparams -S 0 -v -N $NoR -o ./output params --first-run 001
prof-sampleparams -S 0 -v -N 3 -o ./output params --first-run 001

cd output/mc
mkdir 000
cd 000
echo StringFlav:mesonSvector  0.725e+00 > used_params
echo StringFlav:mesonCvector  1.06e+00 >> used_params
echo StringFlav:mesonUDvector  0.62e+00 >> used_params
echo StringFlav:probStoUD  0.19e+00 >> used_params
echo StringFlav:probQQtoQ  0.09e+00 >> used_params
echo StringFlav:etaSup 0.63e+00 >> used_params
