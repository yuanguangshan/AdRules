# -*- coding:utf-8 -*-
import os
#result = []
fo = open("adblock+adguard.txt", "wb+")
result=list(set(fo))
result.sort()
ist=str(result)
ist=ist.encode('utf-8')
fo.write(ist)
fo.close()
