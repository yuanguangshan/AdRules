# -*- coding:utf-8 -*-
import os
result = []
ffo = open("adblock+adguard.txt", "rb+")
fo = open("adblock+adguard.txt", "wb+")
result=list(set(ffo))
result.sort()
#ist=str(result)
#ist=ist.encode('utf-8')
#fo.writelines(result)
for line in result:
    fo.write(line+'\n')
fo.close()
