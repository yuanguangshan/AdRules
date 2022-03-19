#!/bin/sh
num_adg=`cat adguard.txt | wc -l`
num_al=`cat allow.txt | wc -l`
num_adb=`cat adblock.txt | wc -l`
num_adp=`cat adblock+adguard.txt | wc -l`
num_dns=`cat dns.txt | wc -l`
num_hosts=`cat hosts.txt | wc -l`
num_damian=`cat ad-damain.txt | wc -l`
num=8
declare -i count_adg=$num_adg-$num
declare -i count_al=$num_al-3
declare -i count_adb=$num_adb-$num
declare -i count_adp=$num_adp-$num
declare -i count_dns=$num_dns-$num
declare -i count_hosts=$num_hosts-$num
declare -i count_damian=$num_damian-2
time=$(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')
sed -i "s/^更新时间:.*/更新时间: $time （北京时间） /g" README.md
sed -i 's/^AdRules（For AdBlock）规则数量:.*/AdRules（For AdBlock）规则数量: '$count_adb' /g' README.md
sed -i 's/^AdRules（For AdGuard）规则数量:.*/AdRules（For AdGuard）规则数量: '$count_adg' /g' README.md
sed -i 's/^AdRules（For DNS）规则数量:.*/AdRules（For DNS）规则数量: '$count_dns' /g' README.md
sed -i 's/^AdRules（For Adaway）规则数量:.*/AdRules（For Adaway）规则数量: '$count_hosts' /g' README.md
sed -i 's/^Allowlist规则数量:.*/Allowlist规则数量: '$count_al' /g' README.md
sed -i 's/^AdRules AD Damian数量:.*/AdRules AD Damian数量: '$count_damian' /g' README.md
sed -i 's/^AdRules AdBlock Full List规则数量:.*/AdRules AdBlock Full List规则数量: '$count_adp' /g' README.md
echo $count_damian