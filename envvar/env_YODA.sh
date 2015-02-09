#YODA version 1.1.0 Mon Aug 18 15:38:38 CEST 2014
export YODAPATH=/users/eeh/micgro42/BMC/yoda
export LD_LIBRARY_PATH=/users/eeh/micgro42/BMC/yoda/lib:$LD_LIBRARY_PATH
export PATH=/users/eeh/micgro42/BMC/yoda/bin:$PATH
export PYTHONPATH=/users/eeh/micgro42/BMC/yoda/lib/python2.7/site-packages:$PYTHONPATH
# YODA: Source the tab completion script if possible
if (complete &> /dev/null); then
    test -e "/users/eeh/micgro42/BMC/yoda/share/YODA/yoda-completion" && source "/users/eeh/micgro42/BMC/yoda/share/YODA/yoda-completion"
fi
