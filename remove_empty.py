import json
import os

filepath = input("Enter the input json file path::")
try:
    f = open(filepath)
    try:
        data = json.load(f)
        f.close()
        print("Input:" + str(data))
        def dictCheck(dkey,dvalue):
            if not dvalue:
                del data[kst]
                return
            elif dvalue == '':
                del data[kst][dkey]
                return
            elif isinstance(dvalue,dict):
                for s,t in dvalue.items():
                    if isinstance(t,dict):
                        dictCheck(s,t)
                    else:
                        if dvalue[s] == "":
                            del dvalue[s]
                            return
        for k, v in list(data.items()):
            kst = k
            if not v:
                del data[k]
            elif isinstance(v,dict):
                dictCheck(k,v)
        print("Output: "+ str(data))
    except AttributeError:
        print("Oops! Please check your Json data.  Try again...")
except:
    print("Oops! Unable to open file.  Try again...")




