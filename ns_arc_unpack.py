#!/usr/bin/python3
import sys
import json
import os

dumpPath = "dump"

if not os.path.exists(dumpPath):
    os.mkdir(dumpPath)
    
arcpack = open(sys.argv[2],'rb')

with open(sys.argv[1], 'r') as arcjson:
    data = json.load(arcjson)
    for group in data["Groups"]:
        groupPath = dumpPath + "/" + group["Name"]
        if not os.path.exists(groupPath):
            os.mkdir(groupPath)

        for OrderedEntrie in group["OrderedEntries"]:
            filePath = groupPath + "/" + OrderedEntrie["OriginalFilename"]
            if not os.path.exists(filePath[0:filePath.rfind("/")]):
                os.makedirs(filePath[0:filePath.rfind("/")])

            arcpack.seek(OrderedEntrie["Offset"])
            with open(filePath, 'wb') as dumpFile:
                dumpFile.write(arcpack.read(OrderedEntrie["Length"]))
                dumpFile.close()


    arcjson.close()

arcpack.close()