#!/bin/sh
LC_ALL='C'

rm *.txt
rm -rf md5 tmp
wait
# Create temporary folder
echo '新建TMP文件夹...'
mkdir -p ./tmp/
cd tmp
echo '新建TMP文件夹完成'

# Start Download Filter File
echo '开始下载规则...'
easylist=(
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt" #adgk规则 @坂本大佬
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/kill-baidu-ad.txt" #百度超级净化 @坂本大佬
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt" #一个URL过滤器
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt" #乘风视频广告规则
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt" #大萌主针的盗版网站的规则
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt" #Clean Url 扩展的规则
  "https://raw.githubusercontent.com/hacamer/Adblist/master/adp-pc.txt" #杏梢的全量规则
  "https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt" #去APP下载按钮
  "https://easylist.to/easylist/easyprivacy.txt"
)

easylist_plus=(
"https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/rule.txt" #乘风规则
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt" #ubo烦人过滤器
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt" #
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt" #ubo基础过滤器
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt" #ubo隐私保护
"https://raw.githubusercontent.com/Cats-Team/AdRule/main/url-filter.txt" #url过滤器 by Hacamer
)

adguard=(
  "https://filters.adtidy.org/android/filters/2_optimized.txt" #adg基础过滤器
  "https://filters.adtidy.org/android/filters/11_optimized.txt" #adg移动设备过滤器
  "https://filters.adtidy.org/android/filters/17_optimized.txt"  #adgURL过滤器
  "https://filters.adtidy.org/android/filters/3_optimized.txt" #adg防跟踪
  "https://filters.adtidy.org/android/filters/224_optimized.txt" #adg中文过滤器
  "https://filters.adtidy.org/android/filters/14_optimized.txt" #adg烦人过滤器
  "https://filters.adtidy.org/android/filters/5_optimized.txt" #adg实验过滤器
  "https://filters.adtidy.org/android/filters/4_optimized.txt" #adg社交过滤器
)

adguard_full=(
  "https://filters.adtidy.org/windows/filters/2.txt" #adg基础过滤器
  "https://filters.adtidy.org/windows/filters/11.txt" #adg移动设备过滤器
  "https://filters.adtidy.org/windows/filters/3.txt" #adg防跟踪
  "https://filters.adtidy.org/windows/filters/224.txt" #adg中文过滤器
  "https://filters.adtidy.org/windows/filters/14.txt" #adg烦人过滤器
  "https://filters.adtidy.org/windows/filters/5.txt" #adg实验过滤器
  "https://filters.adtidy.org/windows/filters/4.txt" #adg社交过滤器
  "https://filters.adtidy.org/windows/filters/17.txt"  #adgURL过滤器
)

allow=(
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/ChineseFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/GermanFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/TurkishFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/whitelist.txt"
)

dns=(
  #以下规则不做阐述
  "https://easylist.to/easylist/fanboy-annoyance.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdGuardSDNSFilter/gh-pages/Filters/filter.txt"
  "https://abp.oisd.nl/basic/"
  "https://easylist-downloads.adblockplus.org/easylistchina+easylistchina_compliance+easylist.txt"
  "https://easylist-downloads.adblockplus.org/easyprivacy.txt"
  "https://easylist.to/easylist/easyprivacy.txt"
)

hosts=(
  "https://adaway.org/hosts.txt"
  "https://raw.githubusercontent.com/ookangzheng/dbl-oisd-nl/master/hosts_light.txt"
  "https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts"
#"https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts"
)

ad_domains=(
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt"
)

allow_domains=(
  "https://raw.githubusercontent.com/privacy-protection-tools/dead-horse/master/anti-ad-white-list.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt"
)

for i in "${!easylist[@]}" "${!easylist_plus[@]}" "${!adguard_full[@]}" "${!adguard[@]}" "${!adguard_full_ubo[@]}" "${!adguard_ubo[@]}" "${!allow[@]}" "${!hosts[@]}" "${!dns[@]}" "${!ad_domains[@]}"  "${!allow_domains[@]}"
do
  curl -m 68 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "easylist${i}.txt" --connect-timeout 60 -s "${easylist[$i]}" |iconv -t utf-8 &
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "plus-easylist${i}.txt" --connect-timeout 60 -s "${easylist_plus[$i]}"  |iconv -t utf-8 &
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "full-adguard${i}.txt" --connect-timeout 60 -s "${adguard_full[$i]}" |iconv -t utf-8 &
  #curl --parallel --parallel-immediate -k -L -C - -o "ubo-full-adguard${i}.txt" --connect-timeout 60 -s "${adguard_full_ubo[$i]}" &
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "adguard${i}.txt" --connect-timeout 60 -s "${adguard[$i]}" |iconv -t utf-8 &
  #curl --parallel --parallel-immediate -k -L -C - -o "ubo-adguard${i}.txt" --connect-timeout 60 -s "${adguard_ubo[$i]}" &
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "allow${i}.txt" --connect-timeout 60 -s "${allow[$i]}" |iconv -t utf-8 &
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "dns${i}.txt" --connect-timeout 60 -s "${dns[$i]}" |iconv -t utf-8 &
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "hosts${i}.txt" --connect-timeout 60 -s "${hosts[$i]}" |iconv -t utf-8 &
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "ad-domains${i}.txt" --connect-timeout 60 -s "${ad_domains[$i]}" |iconv -t utf-8 &
  curl -m 60 --retry-delay 2 --retry 5 --parallel --parallel-immediate -k -L -C - -o "allow-domains${i}.txt" --connect-timeout 60 -s "${allow_domains[$i]}" |iconv -t utf-8 &
  # shellcheck disable=SC2181
done
wait

curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list \
 | grep -F 'DOMAIN-SUFFIX,' | sed 's/DOMAIN-SUFFIX,/127.0.0.1 /g' > hosts999.txt &

curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list \
 | grep -F 'DOMAIN-SUFFIX,' | sed 's/DOMAIN-SUFFIX,/127.0.0.1 /g' > hosts998.txt &
wait
echo '规则下载完成'

# 添加空格
file="$(ls|sort -u)"
for i in $file; do
  echo -e '\n' >> $i &
done
wait
# Pre Fix rules
echo '处理规则中...'
cat hosts*.txt | sort -n| sed '/^$/d' | grep -v -E "^((#.*)|(\s*))$" \
 | grep -v -E "^[0-9\.:]+\s+(ip6\-)?(localhost|loopback)$" \
 | sed s/127.0.0.1/0.0.0.0/g | sed s/::/0.0.0.0/g |grep '0.0.0.0' |grep -Ev '.0.0.0.0 ' | sort \
 | uniq >base-src-hosts.txt &
wait
cat base-src-hosts.txt | sed '/^$/d' | grep -Ev '#|\$|@|!|/|\\|\*'\
 | grep -v -E "^((#.*)|(\s*))$" \
 | grep -v -E "^[0-9\.:]+\s+(ip6\-)?(localhost|loopback)$" \
 | sed 's/127.0.0.1 //' | sed 's/0.0.0.0 //' \
 | sed "s/^/||&/g" |sed "s/$/&^/g"| sed '/^$/d' \
 | grep -v '^#' | grep -v 'local' \
 | sort -n | uniq | awk '!a[$0]++' > abp-hosts.txt & #Hosts规则转ABP规则

cat allow-domains*.txt | sed '/^$/d' | grep -v '#' \
 | sed "s/^/@@||&/g" | sed "s/$/&^/g"  \
 | sort -n | uniq | awk '!a[$0]++' > pre-allow.txt & #将允许域名转换为ABP规则

cat allow-domains0.txt | sed '/^$/d' | grep -v "#" \
 |sed "s/^/@@||&/g" | sed "s/$/&^/g" | sort -n \
 | uniq | awk '!a[$0]++' > pre-allow1.txt & #将允许域名转换为ABP规则

cat *.txt | sed '/^$/d' \
 |grep -E "^\/[a-z]([a-z]|\.)*\.$" \
 |sort -u > l.txt &


# Start Merge and Duplicate Removal

echo 开始合并
cat .././mod/rules/adblock-rules.txt easylist*.txt \
 | grep -Ev "^((\!)|(\[)).*" | grep -v 'local.adguard.org' |grep -E -v "^[\.||]+[com]+[\^]$" \
 | sort -n | uniq >> tmp-adblock.txt & #处理主规则

cat .././mod/rules/adblock-rules.txt *easylist*.txt full-adg*.txt \
 |grep -Ev "^((\!)|(\[)).*" | grep -v 'local.adguard.org' \
 | sort -u | sort -n | uniq | awk '!a[$0]++' > tmp-adblock+adguard.txt & #处理Plus规则

cat adguard*.txt \
 |grep -Ev "^((\!)|(\[)).*" \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adguard.txt & #处理AdGuard的规则

cat full-adguard*.txt \
 |grep -Ev "^((\!)|(\[)).*" \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adguard-full.txt & #处理AdGuard的Full规则

#cat ubo-adguard*.txt | grep -v '.!' | grep -v '^!' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' | sort -n | uniq | awk '!a[$0]++' > tmp-adguard-ubo.txt #处理AdGuard的规则
#cat ubo-full-adguard*.txt | grep -v '.!' | grep -v '^!' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' | sort -n | uniq | awk '!a[$0]++' > tmp-adguard-full-ubo.txt #处理AdGuard的规则

cat .././mod/rules/*-rules.txt dns*.txt *easylist*.txt full-adg*.txt abp-hosts*.txt \
 | grep -E "^[(\@\@)|(\|\|)][^\/\^]+\^$" \
 | grep -Ev "([0-9]{1,3}.){3}[0-9]{1,3}" \
 | sort > ll.txt &
wait

cat l*.txt abp-hosts*.txt \
 |grep -v '^!' | grep -E -v "^[\.||]+[com]+[\^]$" \
 |sort -n |uniq >> tmp-dns.txt & #处理DNS规则
wait
cat base-src-hosts.txt tmp-dns.txt \
 | sed '/^$/d' |grep '^||\|^[0-9]' | grep -v '\*'\
 | grep -v './'| grep -v '^\[' | grep -v '.!' \
 | grep -v '.\$'|grep -Ev "([0-9]{1,3}.){3}[0-9]{1,3}" \
 |sed 's/||/0.0.0.0 /' | sed 's/\^//' | grep -v "^|" \
 | sort -n | uniq > tmp-hosts.txt & #处理Hosts规则
wait
cat tmp-hosts.txt \
 | sed 's/0.0.0.0 //' \
 | sort -n | uniq > tmp-ad-domains.txt & #处理广告域名

cat *.txt | grep '^@' \
 | sort -n | uniq > tmp-allow.txt & #允许清单处理
wait

echo 规则合并完成
# Move to Pre Filter
echo '移动规则到Pre目录'
cd ../
mkdir -p ./pre/
cp ./tmp/tmp-*.txt ./pre
cd ./pre
echo '移动完成'

# Python 处理重复规则
python .././script/rule.py

# Start Add title and date
diffFile="$(ls|sort -u)"
for i in $diffFile; do
 n=`cat $i | wc -l` 
 echo "! Version: $(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')（北京时间） " >> tpdate.txt 
 new=$(echo "$i" |sed 's/tmp-//g') 
 echo "! Total count: $n" > $i-tpdate.txt 
 cat ./tpdate.txt ./$i-tpdate.txt ./$i > ./$new 
 rm $i *tpdate.txt 
done

echo '规则添加统计数据完成'
# Add Title and MD5
cd ../
mkdir -p ./md5/
diffFile="$(ls pre |sort -u)"
for i in $diffFile; do
 titleName=$(echo "$i" |sed 's#.txt#-title.txt#') 
 cat ./mod/title/$titleName ./pre/$i | awk '!a[$0]++'> ./$i 
 sed -i '/^$/d' $i 
 md5sum $i | sed "s/$i//" > ./md5/$i.md5 
 perl ./script/addchecksum.pl ./$i &
 #echo "合并${i}的标题中"
done
wait
echo '规则处理完成'

rm -rf pre
exit
