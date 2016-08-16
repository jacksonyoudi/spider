#!/bin/bash

for i in `lastb |awk '{print $3}'|grep '[0-9]'`
do
        nali $i >> 1
done
cat 1 |sort -k1|uniq -c|sort -k1 -n -r
rm -rf 1

