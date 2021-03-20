#!/bin/bash

FILE=$(cat ./arg_sakura.txt | awk '{print $3}')
LINE=$(cat ./arg_sakura.txt | awk '{print $2}')

awk -f $(which codelist.awk) -v target_line=${LINE} ${FILE}

