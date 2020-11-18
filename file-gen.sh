#!/bin/bash
# Use this script for format generator, theres thousand of file in db directory created with script.
# Usage 
# ./file-gen.sh packagename/regrex
# eg. ./file-gen.sh g # it will generate file of all packages starting with "g"




alpha="$@"
apt install "${alpha}*" -y
pp=`apt list "${alpha}*" | cut -d'/' -f1`
for i in $pp;
do
        echo $i
        dpkg -L $i >> $i.raw
        echo " Raw file has created"
        sed "s/^/$i: /" $i.raw >> $i
        apt remove $i -y

done
rm *.raw
