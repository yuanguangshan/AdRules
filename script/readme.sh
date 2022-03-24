#!/bin/sh
sed -i '/^```/','/^```/'d README.md
sed -i '/^## 规则总数/a\```' README.md
diffFile="$(ls|sort -u| grep ".txt")"
for i in $diffFile; do
 x=`sed -n 's/^! Title: //p' $i `
 c=`sed -n 's/^! Total count: //p' $i `
 #
 n=`echo $x 规则数量：$c`
 sed -i "/^```/a\ $n" README.md
done

sed -i '/^## 说明/i\ ```' README.md