#!/bin/bash

# Copyright (C) 2021 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


from ast import Return
import os
import sys
import platform
import shutil
from unittest import suite

def removedir(rootdir):
    for root,dirs,files in os.walk(rootdir, topdown=False):
        for name in files:
            os.remove(os.path.join(rootdir,name))
        for name in dirs:
            os.rmdir(os.path.join(rootdir,name))
    os.rmdir(rootdir)

def new_report(bakdir, str):
    files = os.listdir(bakdir)
    lists = [] #列出目录的下所有文件和文件夹保存到lists
    for f in files:
        # if f.startswith(str):
        if "latest" in f:
            continue
        lists.append(f)

    lists.sort(key=lambda fn:os.path.getmtime(bakdir + "/" + fn))  # 按时间排序
    file_new = os.path.join(bakdir,lists[-1]) # 获取最新的文件保存到file_new
    print("latest file:", file_new)
    return file_new


if __name__ == '__main__':
    suitename = sys.argv[1]
    mustpassfile = sys.argv[2]
    latestpath = new_report("reports", "")
    tmpfile = "tmptestsuite.xml"
    putfile = "/result/"+suitename+".xml"
    tasklogfile = suitename+".qpa"
    putdir = latestpath+putfile
    tasklogpath = tasklogfile
    mustpasspath = "testcases/vulkandata/vk-default/"+mustpassfile
    curtime = ""
    if sys.platform.startswith('linux'):
        print('os is Linux')
    elif sys.platform.startswith('win'):
        print('os is  Windows')
    elif sys.platform.startswith('darwin'):
        print('os is  macOS')
    else:
        print('unknown os', sys.platform)
    timelist = latestpath.split("/")
    if len(timelist) > 1:
        curtime = timelist[1].replace("\n", "")
    else:
        timelist = latestpath.split("\\")
        curtime = timelist[1].replace("\n", "")
    testcaselist = []
    mustpasslist = []
    total = 0
    passcnt = 0
    failcnt = 0
    unavailablecnt = 0
    
    with open(mustpasspath) as mustpassbuf:
        for mustpassline in mustpassbuf:
            mustpasslist.append(mustpassline.strip().strip("\r").strip("\n"))
    print("mustfile line:", len(mustpasslist))
    #读取最近的tasklog文件
    print("tasklogpath :", tasklogpath)
    with open(tasklogpath) as tasklogbuf:
        #从tasklog文件中获取运行的testcase的信息
        casename = ""
        testbegin = 0
        testresult = 0
        for tasklogline in tasklogbuf:
            # if "[Start test suite [" in tasklogline:
            #     suitelist = tasklogline.split("[Start test suite [")
            #     suiteitem = suitelist[1].split("]")
            #     suitename = suiteitem[0]
            if "#beginTestCaseResult " in tasklogline:
                freslist = tasklogline.split("#beginTestCaseResult ")
                casename = freslist[1]
                testbegin = 1
            if "#endTestCaseResult" in tasklogline:
                if testbegin == 1 and testresult == 0:
                    total += 1
                    failcnt += 1
                    testcaselist.append(casename+"@@@false@@@run")
                testbegin = 0
                testresult = 0
            if "<Result StatusCode=\"Pass\">" in tasklogline:
                total +=1
                passcnt += 1
                testresult = 1
                testcaselist.append(casename+"@@@true@@@run")
            if "<Result StatusCode=\"NotSupported\">" in tasklogline:
                total +=1
                passcnt += 1
                testresult = 1
                testcaselist.append(casename+"@@@true@@@run")
            if "<Result StatusCode=\"Fail\">" in tasklogline:
                total +=1
                failcnt += 1
                testresult = 1
                testcaselist.append(casename+"@@@false@@@run")
                #print("tasklogfile line:", caseline[0], caseline[1])
    
    i = 0
    j = 0
    notfindlist = []
    while i < len(mustpasslist):
        isfind = False
        j = 0
        while j < len(testcaselist):
            if mustpasslist[i] in testcaselist[j]:
                isfind = True
                break
            j += 1
        if isfind == False:
            notfindlist.append(mustpasslist[i]+"@@@false@@@run")
            failcnt += 1
            total += 1
        i += 1
    testcaselist += notfindlist
    #将testcase信息生成文件
    xmlfile = open(tmpfile, mode='w+')
    xmlfile.write("<?xml version='1.0' encoding='UTF-8'?>\n")
    xmlfile.write("<testsuites name=\"{}\" timestamp=\"{}\" time=\"0.0\" errors=\"0\" disabled=\"0\" failures=\"{}\" tests=\"{}\" ignored=\"0\" unavailable=\"{}\" productinfo=\"{}\">\n".format(suitename, curtime, failcnt, total, unavailablecnt, "{}"))
    xmlfile.write("  <testsuite name=\"{}\" time=\"0.0\" errors=\"0\" disabled=\"0\" failures=\"{}\" ignored=\"0\" tests=\"{}\" message=\"\">\n".format(suitename, failcnt, total))
    for casename in testcaselist:
        casename = casename.replace("\n","")
        loccasename = casename.split("@@@")
        # print("loccasename : ", loccasename)
        recasename = loccasename[0]
        caseresult = loccasename[1]
        casestate = loccasename[2]
        xmlfile.write("    <testcase name=\"{}\" status=\"{}\" time=\"0.0\" classname=\"{}\" result=\"{}\" level=\"1\" message=\"\" />\n".format(recasename, casestate, suitename, caseresult))
    xmlfile.write("  </testsuite>\n")
    xmlfile.write("</testsuites>\n")
    xmlfile.close()
    #将tmp文件替换xts框架的result
    if os.path.exists(latestpath+"/result") == False:
        os.mkdir(latestpath+"/result")
    # os.system(r"cp {} {}".format(tmpfile, putdir))
    print("putdir :", putdir)
    shutil.copy2(tmpfile,putdir)
