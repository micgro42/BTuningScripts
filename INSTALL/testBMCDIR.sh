#!/bin/bash
if [ ${BMCDIR} ]
then
 echo "BMCDIR is set to $BMCDIR" 1>&2
 exitcode=0
else
 echo "BMCDIR is not set!" 1>&2
 exitcode=1
fi
return $exitcode
