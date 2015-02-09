echo $PWD
cd $BMCDIR/output/mc/$1
echo $PWD
echo `date` >> ../../progress.log
echo $PWD >>../../progress.log
rm temp.fifo
mkfifo temp.fifo
$BMCDIR/trunk/profmc 100000 temp.fifo used_params >profmc.log & rivet -l Rivet.Analysis=DEBUG temp.fifo -a BABAR_2004_S632399 -a BABAR_2007_S719111 -a BELLE_2001_S4598261 -a ARGUS_1993_S2653028 -a ARGUS_1993_S2789213 -a CLEO_1996_S398228 --ignore-beams -H out.yoda > rivet.log

echo `date`


# --verbose
# log levels: TRACE, DEBUG, INFO, WARNING, ERROR
# a ARGUS_1993_S2653028 -a BABAR_2007_S719111 -a BABAR_2004_phi
# -a BABAR_2007_S719111 -a BABAR_2004_phi
# BELLE_2001_S4598261

#     sourcen von Rivet
#     sourcen von allem was du für evgen brauchst, sprich du musst die umgebungsvariablen
#     in das script schreiben
#     Evgen muss mit der kommandozeilen Option umgehen können, um das dem run XZY
#     entsprechende used_params file einlesen zu können
#     Evgen/Rivet muss beigebracht werden, das out.aida in den Ordner XYZ zu schreiben
#     (die '-H' option bei rivet)
#     Logfiles rausschreiben
