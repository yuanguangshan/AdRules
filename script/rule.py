# -*- coding:gbk -*-
import os
result = []
ffo = open("adblock+adguard.txt", "rb+")
fo = open("adblock+adguard-test.txt", "wb+")
result=list(set(ffo.readlines()))
result.sort()
#ist=str(result)
#ist=ist.encode('utf-8')
fo.writelines(result)
#for line in result:
#    fo.write(line+'\n')
fo.close()
ffo.close()
'''
list01 = []
for i in open('test.txt'):
    if i in list01:
        continue
    list01.append(i)
with open('test01.txt', 'w') as handle:
    handle.writelines(list01)
'''
