# -*- coding:gbk -*-
import os
result = []
ffo = open("adblock+adguard.txt", "rb+")
fo = open("adblock+adguard-test.txt", "wb+")
fffo=str(ffo)
result=list(set(fffo))
result.sort()
#ist=str(result)
#ist=ist.encode('utf-8')
fo.writelines(result)
#for line in result:
#    fo.write(line+'\n')
fo.close()
ffo.close()
