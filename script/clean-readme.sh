#!/bin/sh
time=$(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')
sed -i "s/^更新时间:.*/更新时间: $time （北京时间） /g" README.md
diffFile="$(ls|sort -u| grep ".txt")"
for i in $diffFile; do
 x=`sed -n 's/^! Title: //p' $i `
 c=`sed -n 's/^! Total count: //p' $i `
 nn=`echo $x规则数量`
 n=`echo $x规则数量：$c`
 sed -i "s/^$nn.*/$n/g" README.md
done
