# Copyright (C) 2023 Huawei Device Co., Ltd.
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
from unittest import suite

G_SUITE = ""
G_MAXCASECNT = 5
G_MUSTPASSPATH = "mustpass/"
G_MUSTPASSFILE = ".txt"
G_TMPPATH = "template/"
G_TMPDIRPATH = G_TMPPATH + "ace_ets_template"
G_HAPDIRPATH = "../act_etc_component_"
G_IMPORTTEST = "import {}Jsunit from \'./{}.test.ets\';"
G_IMPORTTESTCASE = "{}Jsunit()"
G_PATHDIRPATH = "/entry/src/main/ets/MainAbility/pages/"
G_PAGETEMPPATH = "/pagetemplate.ets"
G_PAGEATTRTEMPPATH = "/pageattrtemplate.ets"
G_TESTDIRPATH = "/entry/src/main/ets/test/"
G_TESTCASETEMPPATH = "/testcasetemplate.ets"
G_TESTTEMPPATH = "/List.test.ets"
G_LISTTESTETSPATH = "/entry/src/main/ets/test/List.test.ets"
G_PAGENAMEPATTERN = "##PAGENAME"
G_ATTRNAMEPATTERN = "##ATTRNAME"
G_LOWATTRNAMEPATTERN = "##LOWATTRNAME"
G_PAGENAMETESETPATTERN = "##PAGENAMETEST"
G_PAGEFILENAMEPATTERN = "##PAGEFILENAME"
G_SUITENAMEPATTERN = "##SUITENAME"
G_PAGENAMETESTPATTERN = "##PAGENAMETEXT"
G_CONFIGJSONPATH = "/entry/src/main/config.json"
G_BUILDGNPATH = "/BUILD.gn"
G_TESTJSONPATH = "/Test.json"
G_INDEXETSPATH = "/entry/src/main/ets/MainAbility/pages/index.ets"

def writemultestcase():
    print("writemultestcase")
    writemultestcasecpp()
    print("writemulbuildgn")
    writemulbuildgn()

def writemulbuildgn():
    #生成buildgn
    for suiteitem in G_SUITE:
        subcasecnt = 0
        subattcnt = 0
        subgncnt = 0
        suiteitemcap = "".join(suiteitem[:1].upper() + suiteitem[1:])
        print("suite:", suiteitem, "----------------------")
        #创建一个hap目录
        hapdirpath = G_HAPDIRPATH + suiteitem.lower()
        if os.path.exists(hapdirpath):
            os.system(r"rm -rf {}".format(hapdirpath))
            os.system(r"cp {} {} -r".format(G_TMPDIRPATH, hapdirpath))
        else:
            os.system(r"cp {} {} -r".format(G_TMPDIRPATH, hapdirpath))

        mustpass = G_MUSTPASSPATH + suiteitem + G_MUSTPASSFILE
        with open(mustpass) as mastpassfile:
            compdict = {"":1}

            importtestheads = []
            importtests = []
            for line in mastpassfile:
                if line[0] == "#":
                    continue
                line = line.replace("\n", "")
                linelist = line.split(",")
                suitename = linelist[0]
                casename = linelist[1]

                if suitename in compdict:
                    #同文件里加属性
                    ind = compdict[suitename]
                    subattcnt += 1
                    #在page文件里追加attr内容
                    suitenamecap = "".join(suitename[:1].upper() + suitename[1:])
                    casenamecap = "".join(casename[:1].upper() + casename[1:])
                    pagename = suitenamecap + casenamecap
                    pagenametext = suitename + "-" + casenamecap
                    pagefilename = hapdirpath + G_PATHDIRPATH + suitename + ".ets"
                    attrtmp = G_TMPPATH + G_PAGEATTRTEMPPATH
                    with open(attrtmp, encoding="utf-8", mode="r") as attrtmpfile:
                        for attrtempline in attrtmpfile:
                            attrtempline = attrtempline.replace(" ", "\ ")
                            attrtempline = attrtempline.replace(G_PAGENAMETESTPATTERN, pagenametext)
                            attrtempline = attrtempline.replace(G_ATTRNAMEPATTERN, casename)
                            os.system(r"sed -i '{}a {}' {}".format(ind, attrtempline, pagefilename))
                            ind += 1
                    compdict[suitename] = ind

                else:
                    #创建不同页面
                    subgncnt += 1
                    subattcnt = 1
                    ind = 29
                    compdict[suitename] = ind
                    postfix = '%04d' % subgncnt
                    dirpath = suitename + postfix
                    temppagefilename = G_TMPPATH + G_PAGETEMPPATH
                    suitenamecap = "".join(suitename[:1].upper() + suitename[1:])
                    casenamecap = "".join(casename[:1].upper() + casename[1:])
                    pagename = suitename + casenamecap
                    capagename = suitenamecap + casenamecap
                    testname = pagename
                    pagefilename = hapdirpath + G_PATHDIRPATH + suitename + ".ets"
                    os.system(r"cp {} {}".format(temppagefilename, pagefilename))
                    #替换page里的名称
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_PAGENAMEPATTERN, capagename, pagefilename))
                    #追加page里的attr
                    pagenametext = suitename + "-" + casenamecap
                    attrtmp = G_TMPPATH + G_PAGEATTRTEMPPATH
                    with open(attrtmp, encoding="utf-8", mode="r") as attrtmpfile:
                        for attrtempline in attrtmpfile:
                            attrtempline = attrtempline.replace(" ", "\ ")
                            attrtempline = attrtempline.replace(G_PAGENAMETESTPATTERN, pagenametext)
                            attrtempline = attrtempline.replace(G_ATTRNAMEPATTERN, casename)
                            os.system(r"sed -i '{}a {}' {}".format(ind, attrtempline, pagefilename))
                            ind += 1
                    compdict[suitename] = ind

                    temptestfilename = G_TMPPATH + G_TESTCASETEMPPATH
                    testfilename = hapdirpath + G_TESTDIRPATH + suitename + ".test.ets"
                    os.system(r"cp {} {}".format(temptestfilename, testfilename))
                    #替换test里的名称
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_ATTRNAMEPATTERN, testname, testfilename))
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_PAGENAMETESETPATTERN, testname+"Test", testfilename))
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_PAGEFILENAMEPATTERN, pagename, testfilename))
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_LOWATTRNAMEPATTERN, casename, testfilename))
                    #替换config.json里的名称
                    configjsonname = hapdirpath + G_CONFIGJSONPATH
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_SUITENAMEPATTERN, suiteitemcap, configjsonname))
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_PAGEFILENAMEPATTERN, casenamecap, configjsonname))
                    #替换BUILD.gn里的名称
                    buildgnname = hapdirpath + G_BUILDGNPATH
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_SUITENAMEPATTERN, suiteitemcap, buildgnname))
                    # formate gn
                    formatcmd = "cat "+buildgnname+" | ~/workspace/oh31/prebuilts/build-tools/linux-x86/bin/gn format --stdin > FORMAT_RESULT.gn;cp -f FORMAT_RESULT.gn "+buildgnname+";rm FORMAT_RESULT.gn"
                    os.system(formatcmd)
                    #替换index.ets里的名称
                    indexetsname = hapdirpath + G_INDEXETSPATH
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_SUITENAMEPATTERN, suiteitemcap, indexetsname))

                    #替换Test.json里的名称
                    testjsonname = hapdirpath + G_TESTJSONPATH
                    os.system(r"sed -i 's/{}/{}/g' {}".format(G_SUITENAMEPATTERN, suiteitemcap, testjsonname))

                    importtestheads.append(G_IMPORTTEST.format(testname, suitename))
                    importtests.append(G_IMPORTTESTCASE.format(testname))
                subcasecnt += 1
            #插入List.test.ets，装载多个testcase
            ind = 16
            for importtestsline in importtests:
                os.system(r"sed -i '{}a \ \ {}' {}".format(ind, importtestsline, hapdirpath + G_LISTTESTETSPATH))
                ind += 1
            ind = 14
            for importtestheadsline in importtestheads:
                os.system(r"sed -i '{}a {}' {}".format(ind, importtestheadsline, hapdirpath + G_LISTTESTETSPATH))
                ind += 1

def writemultestcasecpp():
    #生成testcase
    for suiteitem in G_SUITE:
        print("suite:", suiteitem)

def removedir(rootdir):
    for root,dirs,files in os.walk(rootdir, topdown=False):
        for name in files:
            os.remove(os.path.join(rootdir,name))
        for name in dirs:
            os.rmdir(os.path.join(rootdir,name))
    os.rmdir(rootdir)


def printhelp():
    print("Need testsuite and codepattern:\n")
    print("For example\n")
    print("python3 .\GenerateTestCase.py apilack\n")
    print("codepattern contains: apilack, attrlack\n")

def new_report(bakdir, str):
    files = os.listdir(bakdir)
    lists = [] #列出目录的下所有文件和文件夹保存到lists
    for f in files:
        if "latest" in f:
            continue
        lists.append(f)

    lists.sort(key=lambda fn:os.path.getmtime(bakdir + "/" + fn))  # 按时间排序
    file_new = os.path.join(bakdir,lists[-1]) # 获取最新的文件保存到file_new
    print("latest file:", file_new)
    return file_new


if __name__ == '__main__':
    latestpath = new_report("reports", "")
    tmpfile = "tmptestsuite.xml"
    putfile = "/result/ActsLibuvTest.xml"
    tasklogfile = "/log/task_log.log"
    putdir = latestpath+putfile
    tasklogpath = latestpath+tasklogfile

    timelist = latestpath.split("/")
    curtime = timelist[1].replace("\n", "")
    testcaselist = []
    total = 0
    passcnt = 0
    failcnt = 0
    suitename = ""
    #读取最近的tasklog文件
    with open(tasklogpath) as tasklogbuf:
        #从tasklog文件中获取运行的testcase的信息
        for tasklogline in tasklogbuf:
            if "[Start test suite [" in tasklogline:
                suitelist = tasklogline.split("[Start test suite [")
                suiteitem = suitelist[1].split("]")
                suitename = suiteitem[0]
            if "[ok " in tasklogline:
                freslist = tasklogline.split("ok")
                numcase = freslist[1]
                numcase = numcase.replace(" ","")
                numcase = numcase.replace("]","")
                caseline = numcase.split("-")
                total +=1
                passcnt += 1
                testcaselist.append(caseline[1]+"-true")
            if "[not ok " in tasklogline:
                freslist = tasklogline.split("not ok")
                numcase = freslist[1]
                numcase = numcase.replace(" ","")
                numcase = numcase.replace("]","")
                caseline = numcase.split("-")
                total +=1
                failcnt += 1
                testcaselist.append(caseline[1]+"-false")
    #将testcase信息生成文件
    xmlfile = open(tmpfile, mode='w+')
    xmlfile.write("<?xml version='1.0' encoding='UTF-8'?>\n")
    xmlfile.write("<testsuites name=\"{}\" timestamp=\"{}\" time=\"0.0\" errors=\"0\" disabled=\"0\" failures=\"{}\" tests=\"{}\" ignored=\"0\" unavailable=\"0\" productinfo=\"{}\">\n".format(suitename, curtime, failcnt, total, "{}"))
    xmlfile.write("  <testsuite name=\"{}\" time=\"0.0\" errors=\"0\" disabled=\"0\" failures=\"{}\" ignored=\"0\" tests=\"{}\" message=\"\">\n".format(suitename, failcnt, total))
    for casename in testcaselist:
        casename = casename.replace("\n","")
        loccasename = casename.split("-")
        recasename = loccasename[0]
        casestate = loccasename[1]
        xmlfile.write("    <testcase name=\"{}\" status=\"run\" time=\"0.0\" classname=\"{}\" result=\"{}\" level=\"1\" message=\"\" />\n".format(recasename, suitename, casestate))
    xmlfile.write("  </testsuite>\n")
    xmlfile.write("</testsuites>\n")
    xmlfile.close()
    #将tmp文件替换xts框架的result
    os.system(r"cp {} {}".format(tmpfile, putdir))
