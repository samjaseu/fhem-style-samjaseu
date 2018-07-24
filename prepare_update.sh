#!/bin/bash

THEMEFILE=controls_samjas_theme.txt
DIRS="./www"


if [ -e $THEMEFILE ] 
then
  rm $THEMEFILE
fi

find $DIRS -type f \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' f;
  do
   echo "DEL ${f}" >> $THEMEFILE
   out="UPD "$(stat -c %y  $f | cut -d. -f1 | awk '{printf "%s_%s",$1,$2}')" "$(stat -c %s $f)" ${f}"
   echo ${out//.\//} >> $THEMEFILE
  done


# CHANGED file
echo "samjas FHEM Theme last change:" > CHANGED
echo $(date +"%Y-%m-%d") >> CHANGED
echo " - $(git log master --pretty=%B)" >> CHANGED
