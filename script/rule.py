# -*- coding:utf-8 -*-
import os
#去重开始
print("去重中...")
#初始化
result = []
resultb = []
resultc = []
resultd = []
resulte = []
resultf = []
resultg = []
#读取文件
ffo = open("tmp-adblock+adguard.txt")
fo = open("tmp-adblock+adguard-test.txt", "w")
ffob = open("tmp-adblock.txt")
fob = open("tmp-adblock-test.txt", "w")
ffoc = open("tmp-adguard.txt")
foc = open("tmp-adguard-test.txt", "w")
ffod = open("tmp-dns.txt")
fod = open("tmp-dns-test.txt", "w")
ffoe = open("tmp-hosts.txt")
foe = open("tmp-hosts-test.txt", "w")
ffof = open("tmp-damain.txt")
fof = open("tmp-damain-test.txt", "w")
ffog = open("tmp-allow.txt")
fog = open("tmp-allow-test.txt", "w")
#开始处理规则
result=list(set(ffo.readlines()))
result.sort()
fo.writelines(result)
fo.close()
ffo.close()
os.remove("tmp-adblock+adguard.txt")
os.rename("tmp-adblock+adguard-test.txt","tmp-adblock+adguard.txt")

resultb=list(set(ffob.readlines()))
resultb.sort()
fob.writelines(resultb)
fob.close()
ffob.close()
os.remove("tmp-adblock.txt")
os.rename("tmp-adblock-test.txt","tmp-adblock.txt")

resultc=list(set(ffoc.readlines()))
resultc.sort()
foc.writelines(resultc)
foc.close()
ffoc.close()
os.remove("tmp-adguard.txt")
os.rename("tmp-adguard-test.txt","tmp-adguard.txt")

resultd=list(set(ffod.readlines()))
resultd.sort()
fod.writelines(resultd)
fod.close()
ffod.close()
os.remove("tmp-dns.txt")
os.rename("tmp-dns-test.txt","tmp-dns.txt")

resulte=list(set(ffoe.readlines()))
resulte.sort()
foe.writelines(resulte)
foe.close()
ffoe.close()
os.remove("tmp-hosts.txt")
os.rename("tmp-hosts-test.txt","tmp-hosts.txt")

resultf=list(set(ffof.readlines()))
resultf.sort()
fof.writelines(resultf)
fof.close()
ffof.close()
os.remove("tmp-damain.txt")
os.rename("tmp-damain-test.txt","tmp-damain.txt")

resultg=list(set(ffog.readlines()))
resultg.sort()
fog.writelines(resultg)
fog.close()
ffog.close()
os.remove("tmp-allow.txt")
os.rename("tmp-allow-test.txt","tmp-allow.txt")
#处理完毕
print("去重完毕")
