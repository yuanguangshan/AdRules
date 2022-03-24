#!/bin/sh
num_adg=`cat adguard.txt | wc -l`
num_adgf=`cat adguard-full.txt | wc -l`
num_al=`cat allow.txt | wc -l`
num_adb=`cat adblock.txt | wc -l`
num_adp=`cat adblock+adguard.txt | wc -l`
num_dns=`cat dns.txt | wc -l`
num_hosts=`cat hosts.txt | wc -l`
num_domains=`cat ad-domains.txt | wc -l`
num=9
declare -i count_adg=$num_adg-$num
declare -i count_adgf=$num_adgf-$num
declare -i count_al=$num_al-4
declare -i count_adb=$num_adb-$num
declare -i count_adp=$num_adp-$num
declare -i count_dns=$num_dns-$num
declare -i count_hosts=$num_hosts-$num
declare -i count_domains=$num_domains-3
time=$(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')
sed -i "s/^更新时间:.*/更新时间: $time （北京时间） /g" README.md
sed -i 's/^AdRules（For AdBlock）规则数量:.*/AdRules（For AdBlock）规则数量: '$count_adb' /g' README.md
sed -i 's/^AdRules（For AdGuard）规则数量:.*/AdRules（For AdGuard）规则数量: '$count_adg' /g' README.md
sed -i 's/^AdRules（For DNS）规则数量:.*/AdRules（For DNS）规则数量: '$count_dns' /g' README.md
sed -i 's/^AdRules（For Adaway）规则数量:.*/AdRules（For Adaway）规则数量: '$count_hosts' /g' README.md
sed -i 's/^AdRules Allowlist 规则数量:.*/AdRules Allowlist 规则数量: '$count_al' /g' README.md
sed -i 's/^AdRules Ad Domains List 数量:.*/AdRules Ad Domains List 数量: '$count_domains' /g' README.md
sed -i 's/^AdRules AdBlock Full List 规则数量:.*/AdRules AdBlock Full List 规则数量: '$count_adp' /g' README.md
sed -i 's/^AdRules AdGuard Full List 规则数量:.*/AdRules AdGuard Full List 规则数量: '$count_adgf' /g' README.md
exit
