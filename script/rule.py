# -*- coding:gbk -*-
import os

result = []
ffo = open("adblock+adguard.txt")
fo = open("adblock+adguard-test.txt", "w")
result=list(set(ffo.readlines()))
result.sort()
#ist=str(result)
#ist=ist.encode('utf-8')
fo.writelines(result)
#for line in result:
#    fo.write(line+'\n')
fo.close()
ffo.close()
os.remove("adblock+adguard.txt")
os.rename("adblock+adguard-test.txt","adblock+adguard.txt")
'''
list01 = []
for i in open('adblock+adguard.txt'):
    if i in list01:
        continue
    list01.append(i)
with open('adblock+adguard-test.txt', 'w') as handle:
    handle.writelines(list01)
'''
