#!/bin/sh
LC_ALL='C'

rm *.txt
rm -rf md5 tmp
# Create temporary folder
echo '新建TMP文件夹...'
mkdir -p ./tmp/
cd tmp
echo '新建TMP文件夹完成'

# Start Download Filter File
echo '开始下载规则...'
easylist=(
#  "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt" #反广告屏蔽规则
#  "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt" #反广告屏蔽规则
  "https://easylist-downloads.adblockplus.org/easylistchina+easylistchina_compliance+easylist.txt" #EasyChina和Easylist 基础规则
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt" #adgk规则 @坂本大佬
  "https://raw.githubusercontent.com/banbendalao/ADgk/master/kill-baidu-ad.txt" #百度超级净化 @坂本大佬
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt" #一个URL过滤器
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt" #乘风视频广告规则
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt" #大萌主针的盗版网站的规则
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt" #Clean Url 扩展的规则
#  "https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-pc.txt" #My AdFilter (For PC)
#  "https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-edentw.txt" #反广告拦截规则合集
  "https://raw.githubusercontent.com/hacamer/Adblist/master/adp-pc.txt" #杏梢的全量规则
#  "https://filters.adtidy.org/extension/ublock/filters/104_optimized.txt"
  "https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt" #去APP下载按钮
#  "https://easylist-downloads.adblockplus.org/fanboy-notifications.txt"
#  "https://easylist-downloads.adblockplus.org/i_dont_care_about_cookies.txt"
)

easylist_plus=(
"https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/rule.txt" #乘风规则
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt" #ubo烦人过滤器
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt" #
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt" #ubo基础过滤器
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt" #ubo隐私保护
"https://raw.githubusercontent.com/Cats-Team/AdRule/main/url-filter.txt" #url过滤器 by Hacamer
#"https://raw.githubusercontent.com/Cats-Team/AdRule/main/rules-admin.txt" #一些零碎规则 by Hacamer
#"https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt" #adgk规则 @坂本大佬
 # "https://easylist.to/easylist/fanboy-annoyance.txt" #烦人规则
 #"https://filters.adtidy.org/extension/ublock/filters/122_optimized.txt" #fanboy-annoyance
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

adguard_full_ubo=(
  "https://filters.adtidy.org/extension/ublock/filters/2.txt" #adg基础过滤器
  "https://filters.adtidy.org/extension/ublock/filters/11.txt" #adg移动设备过滤器
  "https://filters.adtidy.org/extension/ublock/filters/3.txt" #adg防跟踪
  "https://filters.adtidy.org/extension/ublock/filters/224.txt" #adg中文过滤器
  "https://filters.adtidy.org/extension/ublock/filters/14.txt" #adg烦人过滤器
  "https://filters.adtidy.org/extension/ublock/filters/5.txt" #adg实验过滤器
  "https://filters.adtidy.org/extension/ublock/filters/4.txt" #adg社交过滤器
  "https://filters.adtidy.org/extension/ublock/filters/17.txt"  #adgURL过滤器
)

adguard_ubo=(
  "https://filters.adtidy.org/extension/ublock/filters/2_optimized.txt" #adg基础过滤器
  "https://filters.adtidy.org/extension/ublock/filters/11_optimized.txt" #adg移动设备过滤器
  "https://filters.adtidy.org/extension/ublock/filters/17_optimized.txt"  #adgURL过滤器
  "https://filters.adtidy.org/extension/ublock/filters/3_optimized.txt" #adg防跟踪
  "https://filters.adtidy.org/extension/ublock/filters/224_optimized.txt" #adg中文过滤器
  "https://filters.adtidy.org/extension/ublock/filters/14_optimized.txt" #adg烦人过滤器
  "https://filters.adtidy.org/extension/ublock/filters/5_optimized.txt" #adg实验过滤器
  "https://filters.adtidy.org/extension/ublock/filters/4_optimized.txt" #adg社交过滤器
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
  "https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt"
 # "https://adaway.org/hosts.txt" #adaway规则
  "https://abp.oisd.nl/basic/"
  "https://raw.githubusercontent.com/liwenjie119/adg-rules/master/white.txt"
  "https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt"
  "https://easylist-downloads.adblockplus.org/easylistchina+easylistchina_compliance+easylist.txt"
  "https://raw.githubusercontent.com/DandlionSprout/adfilt/master/AdGuard%20Home%20Compilation%20List/AdGuardHomeCompilationList-Notifications.txt"
)

hosts=(
  "https://adaway.org/hosts.txt"
"https://raw.githubusercontent.com/ookangzheng/dbl-oisd-nl/master/hosts_light.txt"
)

ad_domains=(
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt"
)

allow_domains=(
  "https://raw.githubusercontent.com/privacy-protection-tools/dead-horse/master/anti-ad-white-list.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt"
  #"https://raw.githubusercontent.com/Ultimate-Hosts-Blacklist/whitelist/master/domains.list"
  #"https://raw.githubusercontent.com/neodevpro/neodevhost/master/customallowlist"
)

for i in "${!easylist[@]}" "${!easylist_plus[@]}" "${!adguard_full[@]}" "${!adguard[@]}" "${!adguard_full_ubo[@]}" "${!adguard_ubo[@]}" "${!allow[@]}" "${!hosts[@]}" "${!dns[@]}" "${!ad_domains[@]}"  "${!allow_domains[@]}"
do
  curl --parallel --parallel-immediate -k -L -C - -o "easylist${i}.txt" --connect-timeout 60 -s "${easylist[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "plus-easylist${i}.txt" --connect-timeout 60 -s "${easylist_plus[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "full-adguard${i}.txt" --connect-timeout 60 -s "${adguard_full[$i]}" &
  #curl --parallel --parallel-immediate -k -L -C - -o "ubo-full-adguard${i}.txt" --connect-timeout 60 -s "${adguard_full_ubo[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "adguard${i}.txt" --connect-timeout 60 -s "${adguard[$i]}" &
  #curl --parallel --parallel-immediate -k -L -C - -o "ubo-adguard${i}.txt" --connect-timeout 60 -s "${adguard_ubo[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "allow${i}.txt" --connect-timeout 60 -s "${allow[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "dns${i}.txt" --connect-timeout 60 -s "${dns[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "hosts${i}.txt" --connect-timeout 60 -s "${hosts[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "ad-domains${i}.txt" --connect-timeout 60 -s "${ad_domains[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "allow-domains${i}.txt" --connect-timeout 60 -s "${allow_domains[$i]}" &
  # shellcheck disable=SC2181
done
wait

curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list \
 | grep -F 'DOMAIN-SUFFIX,' | sed 's/DOMAIN-SUFFIX,/127.0.0.1 /g' > hosts999.txt
curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list \
 | grep -F 'DOMAIN-SUFFIX,' | sed 's/DOMAIN-SUFFIX,/127.0.0.1 /g' > hosts998.txt
curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/ookangzheng/dbl-oisd-nl/master/hosts_light.txt \
 | grep -v '^#' > plus-hosts1.txt
echo '规则下载完成'

# 添加空格
file="$(ls|sort -u)"
for i in $file; do
  echo -e '\n' >> $i
done

# Pre Fix rules
echo '处理规则中...'
cat hosts*.txt | sort -n| sed '/^$/d' | grep -v -E "^((#.*)|(\s*))$" \
 | grep -v -E "^[0-9\.:]+\s+(ip6\-)?(localhost|loopback)$" \
 | sed s/127.0.0.1/0.0.0.0/g | sed s/::/0.0.0.0/g |grep '0.0.0.0' |grep -Ev '.0.0.0.0 ' | sort \
 | uniq >base-src-hosts.txt

cat base-src-hosts.txt | sed '/^$/d' | grep -Ev '#|\$|@|!|/|\\|\*'\
 | grep -v -E "^((#.*)|(\s*))$" \
 | grep -v -E "^[0-9\.:]+\s+(ip6\-)?(localhost|loopback)$" \
 | sed 's/127.0.0.1 //' | sed 's/0.0.0.0 //' \
 | sed "s/^/||&/g" |sed "s/$/&^/g"| sed '/^$/d' \
 | grep -v '^#' | grep -v 'local' \
 | sort -n | uniq | awk '!a[$0]++' > abp-hosts.txt  #Hosts规则转ABP规则

cat allow-domains*.txt | sed '/^$/d' | grep -v '#' \
 | sed "s/^/@@||&/g" | sed "s/$/&^/g"  \
 | sort -n | uniq | awk '!a[$0]++' > pre-allow.txt  #将允许域名转换为ABP规则

cat allow-domains0.txt | sed '/^$/d' | grep -v "#" \
 |sed "s/^/@@||&/g" | sed "s/$/&^/g" | sort -n \
 | uniq | awk '!a[$0]++' > pre-allow1.txt  #将允许域名转换为ABP规则

cat *.txt | sed '/^$/d' |grep '^/' |grep '.\.$' \
 |grep -v './\|.?\|.\$\|.js\|._\|.\*\|.(php|png)\|.[0-9]\|.\^\|.=\|.~\|.[A-Z]\|.-' \
 |sort -u > l.txt

#cat l.txt
# Start Merge and Duplicate Removal
#set LC_ALL='C'

echo 开始合并
cat .././mod/rules/adblock-rules.txt easylist*.txt \
 | grep -v '^!' | grep -v '.!' | grep -v '^！' \
 | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' \
 | grep -v '^\【' | grep -v 'local.adguard.org' \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adblock.txt #处理主规则

cat .././mod/rules/adblock-rules.txt *easylist*.txt full-adg*.txt \
 | grep -v '.!' |grep -v '^!' | grep -v '^！' \
 | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' \
 | grep -v '^\【' | grep -v 'local.adguard.org' \
 | sort -u | sort -n | uniq | awk '!a[$0]++' > tmp-adblock+adguard.txt #处理Plus规则

cat adguard*.txt \
 | grep -v '.!' | grep -v '^!' | grep -v '^# ' \
 | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adguard.txt #处理AdGuard的规则

cat full-adguard*.txt \
 | grep -v '.!' | grep -v '^!' | grep -v '^# ' \
 | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adguard-full.txt #处理AdGuard的Full规则

#cat ubo-adguard*.txt | grep -v '.!' | grep -v '^!' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' | sort -n | uniq | awk '!a[$0]++' > tmp-adguard-ubo.txt #处理AdGuard的规则
#cat ubo-full-adguard*.txt | grep -v '.!' | grep -v '^!' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' | sort -n | uniq | awk '!a[$0]++' > tmp-adguard-full-ubo.txt #处理AdGuard的规则

cat .././mod/rules/*-rules.txt dns*.txt *easylist*.txt full-adg*.txt abp-hosts*.txt \
 | grep '^||\|^@@||' | grep -v './' \
 | grep -v '^\[' | grep -v '.\[' | grep -v '.\$' | grep -Ev "([0-9]{1,3}.){3}[0-9]{1,3}" | grep -v '^!' \
 | sed 's/\^|/\^/' |sort -n > ll.txt 

cat ll.txt l.txt pre-allow1.txt abp-hosts*.txt \
 |grep -v '^!' \
 |sort -n |uniq > tmp-dns.txt  #处理DNS规则

cat base-src-hosts.txt tmp-dns.txt \
 | sed '/^$/d' |grep '^||\|^[0-9]' | grep -v '\*'\
 | grep -v './'| grep -v '^\[' | grep -v '.!' \
 | grep -v '.\$'|grep -Ev "([0-9]{1,3}.){3}[0-9]{1,3}" \
 |sed 's/||/0.0.0.0 /' | sed 's/\^//' | grep -v "^|" \
 | sort -n | uniq | awk '!a[$0]++' > tmp-hosts.txt  #处理Hosts规则

cat tmp-hosts.txt \
 | sed 's/0.0.0.0 //' \
 | sort -n | uniq | awk '!a[$0]++' > tmp-ad-domains.txt #处理广告域名

cat *.txt | grep '^@' \
 | sort -n | uniq | awk '!a[$0]++' > tmp-allow.txt #允许清单处理


echo 规则合并完成
# Move to Pre Filter
echo '移动规则到Pre目录'
cd ../
mkdir -p ./pre/
mv ./tmp/tmp-*.txt ./pre
cd ./pre
echo '移动完成'

# Python 处理重复规则
python .././script/rule.py
echo '规则去重处理完成'
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

# Add Title and MD5
cd ../
mkdir -p ./md5/
diffFile="$(ls pre |sort -u)"
for i in $diffFile; do
 titleName=$(echo "$i" |sed 's#.txt#-title.txt#')
 cat ./mod/title/$titleName ./pre/$i | awk '!a[$0]++'> ./$i
 sed -i '/^$/d' $i
 md5sum $i | sed "s/$i//" > ./md5/$i.md5
 perl ./script/addchecksum.pl ./$i
 #echo "合并${i}的标题中"
done
echo '规则处理完成'
# Check Rules
a=`cat dns.txt |wc -l`
b=1000
if [ "$a" -lt "$b" ]
then
 bash ./script/update-rules.sh
else
 echo Check PASS
fi

rm -rf pre
exit
