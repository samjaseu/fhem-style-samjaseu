#!/bin/bash
THEMEFILE=controls_samjas_theme.txt


if [ -e $THEMEFILE ]
then
  rm $THEMEFILE
fi

find ./www -type f \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' f;
do
    echo "DEL ${f}" >> $THEMEFILE
    out="UPD "$(date -d "1970-01-01 + $(stat -c '%Y' www/samjaseu/custom.js) secs " '+%Y-%m-%d_%T')" "$(stat -c'%s %n' $f)
    echo ${out//.\//} >> $THEMEFILE
done


# CHANGED file
echo "FHEM SPRITPREISAUT last changes:" > CHANGED
echo $(date +"%Y-%m-%d") >> CHANGED
echo " - $(git log -1 --pretty=%B)" >> CHANGED

