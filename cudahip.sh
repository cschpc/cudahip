#!/bin/bash

name=`echo "$1" | cut -d'.' -f1`
extension=`echo "$1" | cut -d'.' -f2`

# Check that the file extension is cu
if [[ "$extension" == "cu" ]];
then
        # name the hip file with extension hip.cpp
        hipify-perl $1 > ${name}".hip.cpp"
        # if there is icnlude of cuh file replace with hip.h
        checkcu=`grep cuh $1 | wc -l`
        if [[ "$checkcu" -gt "0" ]]; then
                sed -i 's/cuh/hip.h/g' $name".hip.cpp"
        fi
# if the file is cuda HEADER hipify to hip.h
elif  [[ "$extension" == "cuh" ]]; then
        hipify-perl $1 > ${name}".hip.h"
#if the file is cpp and it does include to cuh, copy the file to hip.cpp and rename .cuh to hip.h
elif [[ "$extension" == "cpp" ]]; then
        checkcu=`grep cuh $1 | wc -l`
        if [[ "$checkcu" -gt "0" ]]; then
                cp $1 $name".hip.cpp"
                sed -i 's/cuh/hip.h/g' $name".hip.cpp"
        fi
fi
