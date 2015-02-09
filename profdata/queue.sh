#!/bin/bash
rm -v output/progress.log
cd output/mc
rm -v STDIN.*
echo $PWD
for i in *; do
cat << EOS | qsub -V -
#!/bin/bash
# walltime : take your best guess and multiply it by 3
#PBS -l walltime=1:30:00 
#PBS -m n
#PBS -M micgro42@physik.hu-berlin.de
# PBS -q sl5_64

##########################################
#                                        #
#   Output some useful job information.  #
#                                        #
##########################################

echo ------------------------------------------------------
echo -n 'Job is running on node '; cat $PBS_NODEFILE
echo ------------------------------------------------------
echo PBS: qsub is running on $PBS_O_HOST
echo PBS: originating queue is $PBS_O_QUEUE
echo PBS: executing queue is $PBS_QUEUE
echo PBS: working directory is $PBS_O_WORKDIR
echo PBS: execution mode is $PBS_ENVIRONMENT
echo PBS: job identifier is $PBS_JOBID
echo PBS: job name is $PBS_JOBNAME
echo PBS: node file is $PBS_NODEFILE
echo PBS: current home directory is $PBS_O_HOME
echo PBS: PATH = $PBS_O_PATH
echo ------------------------------------------------------

echo $PWD
echo `date`
echo "This is run number $i."
echo "calling evtgenscript.sh:"
if [ -f  /users/eeh/micgro42/BMC/trunk/profdata/evtgenscript.sh ]
then
  echo "physik.hu-berlin.de enviroment detected"
  /users/eeh/micgro42/BMC/trunk/profdata/evtgenscript.sh $i
else
  echo "physik.hu-berlin enviroment not detected"
fi

if [ -f /home1x/hep/micgro42/BMC/trunk/profdata/evtgenscript.sh ]
then
  echo "uvic.ca enviroment detected"
  /home1x/hep/micgro42/BMC/trunk/profdata/evtgenscript.sh $i
else
  echo "uvic.ca enviroment not detected"
fi
echo "evtgenscript done"
EOS
done
