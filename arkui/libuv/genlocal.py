#!/usr/bin/python
# -*- coding: UTF-8 -*-
"""
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
"""

import os
import subprocess

G_SUITE = ""
G_MAXCASECNT = 5
G_MUSTPASSPATH = "mustpass"
G_MUSTPASSFILE = ".txt"
G_TMPPATH = "template/"
G_TMPDIRPATH = G_TMPPATH + "ace_ets_template"
G_HAPDIRPATH = "../act_etc_component_"
G_IMPORTTEST = "import {}Jsunit from \'./{}.test.ets\';"
G_IMPORTTESTCASE = "{}Jsunit()"
G_PATHDIRPATH = "entry/src/main/ets/MainAbility/pages"
G_PAGETEMPPATH = "pagetemplate.ets"
G_PAGEATTRTEMPPATH = "pageattrtemplate.ets"
G_TESTDIRPATH = "entry/src/main/ets/test"
G_TESTCASETEMPPATH = "testcasetemplate.ets"
G_TESTTEMPPATH = "List.test.ets"
G_LISTTESTETSPATH = "entry/src/main/ets/test/List.test.ets"
G_PAGENAMEPATTERN = "##PAGENAME"
G_ATTRNAMEPATTERN = "##ATTRNAME"
G_LOWATTRNAMEPATTERN = "##LOWATTRNAME"
G_PAGENAMETESETPATTERN = "##PAGENAMETEST"
G_PAGEFILENAMEPATTERN = "##PAGEFILENAME"
G_SUITENAMEPATTERN = "##SUITENAME"
G_PAGENAMETESTPATTERN = "##PAGENAMETEXT"
G_CONFIGJSONPATH = "entry/src/main/config.json"
G_BUILDGNPATH = "BUILD.gn"
G_TESTJSONPATH = "Test.json"
G_INDEXETSPATH = "entry/src/main/ets/MainAbility/pages/index.ets"


def writemultestcase():
    # 生成testcase
    print("writemultestcase")
    writemultestcasecpp()
    print("writemulbuildgn")
    writemulbuildgn()


def run_cmd(commond):
    # 执行命令
    subprocess.run(commond.split(" "), shell=False, capture_output=True)


def writemulbuildgn():
    # 生成buildgn
    for suiteitem in G_SUITE:
        subcasecnt = 0
        subattcnt = 0
        subgncnt = 0
        suiteitemcap = "{}{}".format(suiteitem[:1].upper(), suiteitem[1:])
        print("suite:", suiteitem, "----------------------")
        # 创建一个hap目录
        hapdirpath = "{}{}".format(G_HAPDIRPATH, suiteitem.lower())
        if os.path.exists(hapdirpath):
            run_cmd(r"rm -rf {}".format(hapdirpath))
            run_cmd(r"cp {} {} -r".format(G_TMPDIRPATH, hapdirpath))
        else:
            run_cmd(r"cp {} {} -r".format(G_TMPDIRPATH, hapdirpath))

        mustpass =  os.path.join(G_MUSTPASSPATH, "{}{}".format(suiteitem, G_MUSTPASSFILE))
        with open(mustpass) as mastpassfile:
            compdict = {"": 1}
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
                    casenamecap = "{}{}".format(casename[:1].upper(), casename[1:])
                    pagenametext = "{}-{}".format(suitename, casenamecap)
                    pagefilename = os.path.join(hapdirpath, G_PATHDIRPATH, "{}.ets".format(suitename))
                    attrtmp = os.path.join(G_TMPPATH, G_PAGEATTRTEMPPATH)
                    with open(attrtmp, encoding="utf-8", mode="r") as attrtmpfile:
                        for attrtempline in attrtmpfile:
                            attrtempline = attrtempline.replace(" ", "\ ")
                            attrtempline = attrtempline.replace(G_PAGENAMETESTPATTERN, pagenametext)
                            attrtempline = attrtempline.replace(G_ATTRNAMEPATTERN, casename)
                            run_cmd(r"sed -i '{}a {}' {}".format(ind, attrtempline, pagefilename))
                            ind += 1
                    compdict[suitename] = ind
                else:
                    # 创建不同页面
                    subgncnt += 1
                    subattcnt = 1
                    ind = 29
                    compdict[suitename] = ind
                    temppagefilename = os.path.join(G_TMPPATH, G_PAGETEMPPATH)
                    suitenamecap = "{}{}".format(suitename[:1].upper(), suitename[1:])
                    casenamecap = "{}{}".format(casename[:1].upper(), casename[1:])
                    pagename = "{}{}".format(suitename, casenamecap)
                    capagename = "{}{}".format(suitenamecap, casenamecap)
                    testname = pagename
                    pagefilename = os.path.join(hapdirpath, G_PATHDIRPATH, "{}.ets".format(suitename))
                    run_cmd(r"cp {} {}".format(temppagefilename, pagefilename))
                    # 替换page里的名称
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_PAGENAMEPATTERN, capagename, pagefilename))
                    # 追加page里的attr
                    pagenametext = "{}-{}".format(suitename, casenamecap)
                    attrtmp = os.path.join(G_TMPPATH, G_PAGEATTRTEMPPATH)
                    with open(attrtmp, encoding="utf-8", mode="r") as attrtmpfile:
                        for attrtempline in attrtmpfile:
                            attrtempline = attrtempline.replace(" ", "\ ")
                            attrtempline = attrtempline.replace(G_PAGENAMETESTPATTERN, pagenametext)
                            attrtempline = attrtempline.replace(G_ATTRNAMEPATTERN, casename)
                            run_cmd(r"sed -i '{}a {}' {}".format(ind, attrtempline, pagefilename))
                            ind += 1
                    compdict[suitename] = ind

                    temptestfilename = os.path.join(G_TMPPATH, G_TESTCASETEMPPATH)
                    testfilename = os.path.join(hapdirpath, G_TESTDIRPATH, "{}.test.ets".format(suitename))
                    run_cmd(r"cp {} {}".format(temptestfilename, testfilename))
                    # 替换test里的名称
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_ATTRNAMEPATTERN, testname, testfilename))
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_PAGENAMETESETPATTERN, "{}Test".format(testname), 
					testfilename))
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_PAGEFILENAMEPATTERN, pagename, testfilename))
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_LOWATTRNAMEPATTERN, casename, testfilename))
                    # 替换config.json里的名称
                    configjsonname = os.path.join(hapdirpath, G_CONFIGJSONPATH)
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_SUITENAMEPATTERN, suiteitemcap, configjsonname))
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_PAGEFILENAMEPATTERN, casenamecap, configjsonname))
                    # 替换BUILD.gn里的名称
                    buildgnname = os.path.join(hapdirpath, G_BUILDGNPATH)
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_SUITENAMEPATTERN, suiteitemcap, buildgnname))
                    # formate gn
                    formatcmd = "cat {} | ~/workspace/oh31/prebuilts/build-tools/linux-x86/bin/gn format --stdin "
                    "> FORMAT_RESULT.gn;cp -f FORMAT_RESULT.gn {};rm FORMAT_RESULT.gn".format(buildgnname, buildgnname)
                    run_cmd(formatcmd)
                    # 替换index.ets里的名称
                    indexetsname = os.path.join(hapdirpath, G_INDEXETSPATH)
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_SUITENAMEPATTERN, suiteitemcap, indexetsname))

                    # 替换Test.json里的名称
                    testjsonname = os.path.join(hapdirpath, G_TESTJSONPATH)
                    run_cmd(r"sed -i 's/{}/{}/g' {}".format(G_SUITENAMEPATTERN, suiteitemcap, testjsonname))

                    importtestheads.append(G_IMPORTTEST.format(testname, suitename))
                    importtests.append(G_IMPORTTESTCASE.format(testname))
                subcasecnt += 1
            # 插入List.test.ets，装载多个testcase
            ind = 16
            for importtestsline in importtests:
                run_cmd(r"sed -i '{}a \ \ {}' {}".format(ind, importtestsline, os.path.join(hapdirpath, G_LISTTESTETSPATH)))
                ind += 1
            ind = 14
            for importtestheadsline in importtestheads:
                run_cmd(r"sed -i '{}a {}' {}".format(ind, importtestheadsline, os.path.join(hapdirpath, G_LISTTESTETSPATH)))
                ind += 1

def writemultestcasecpp():
    # 生成testcase
    for suiteitem in G_SUITE:
        print("suite:", suiteitem)

def removedir(rootdir):
    # 删除文件夹
    for _, dirs, files in os.walk(rootdir, topdown=False):
        for name in files:
            os.remove(os.path.join(rootdir, name))
        for name in dirs:
            os.rmdir(os.path.join(rootdir, name))
    os.rmdir(rootdir)


def printhelp():
    # 打印提示信息
    print("Need testsuite and codepattern:\n")
    print("For example\n")
    print("python3 .\GenerateTestCase.py apilack\n")
    print("codepattern contains: apilack, attrlack\n")

def new_report(bakdir, str1):
    # 列出目录的下所有文件和文件夹保存到lists
    files = os.listdir(bakdir)
    lists = [] 
    for f in files:
        if "latest" in f:
            continue
        lists.append(f)

    # 按时间排序
    lists.sort(key=lambda fn:os.path.getmtime(os.path.join(bakdir, fn)))  
    # 获取最新的文件保存到file_new
    file_new = os.path.join(bakdir, lists[-1]) 
    print("latest file:", file_new)
    return file_new


if __name__ == '__main__':
    latestpath = new_report("reports", "")
    tmpfile = "tmptestsuite.xml"
    putfile = "result/ActsLibuvTest.xml"
    tasklogfile = "log/task_log.log"
    putdir = os.path.join(latestpath, putfile)
    tasklogpath = os.path.join(latestpath, tasklogfile)

    timelist = latestpath.split("/")
    curtime = timelist[1].replace("\n", "")
    testcaselist = []
    total = 0
    passcnt = 0
    failcnt = 0
    suitename = ""
    # 读取最近的tasklog文件
    with open(tasklogpath) as tasklogbuf:
        # 从tasklog文件中获取运行的testcase的信息
        for tasklogline in tasklogbuf:
            if "[Start test suite [" in tasklogline:
                suitelist = tasklogline.split("[Start test suite [")
                suiteitem = suitelist[1].split("]")
                suitename = suiteitem[0]
            if "[ok " in tasklogline:
                freslist = tasklogline.split("ok")
                numcase = freslist[1]
                numcase = numcase.replace(" ", "")
                numcase = numcase.replace("]", "")
                caseline = numcase.split("-")
                total += 1
                passcnt += 1
                testcaselist.append("{}-true".format(caseline[1]))
            if "[not ok " in tasklogline:
                freslist = tasklogline.split("not ok")
                numcase = freslist[1]
                numcase = numcase.replace(" ", "")
                numcase = numcase.replace("]", "")
                caseline = numcase.split("-")
                total +=1
                failcnt += 1
                testcaselist.append("{}-false".format(caseline[1]))
    # 将testcase信息生成文件
    xmlfile = open(tmpfile, mode='w+')
    xmlfile.write("<?xml version='1.0' encoding='UTF-8'?>\n")
    xmlfile.write("<testsuites name=\"{}\" timestamp=\"{}\" time=\"0.0\" errors=\"0\" disabled=\"0\" failures=\"{}\" "
	"tests=\"{}\" ignored=\"0\" unavailable=\"0\" productinfo=\"{}\">\n"
	.format(suitename, curtime, failcnt, total, "{}"))
    xmlfile.write("  <testsuite name=\"{}\" time=\"0.0\" errors=\"0\" disabled=\"0\" failures=\"{}\" ignored=\"0\" "
	"tests=\"{}\" message=\"\">\n".format(suitename, failcnt, total))
    for casename in testcaselist:
        casename = casename.replace("\n", "")
        loccasename = casename.split("-")
        recasename = loccasename[0]
        casestate = loccasename[1]
        xmlfile.write("    <testcase name=\"{}\" status=\"run\" time=\"0.0\" classname=\"{}\" result=\"{}\" "
		"level=\"1\" message=\"\" />\n".format(recasename, suitename, casestate))
    xmlfile.write("  </testsuite>\n")
    xmlfile.write("</testsuites>\n")
    xmlfile.close()
    # 将tmp文件替换xts框架的result
    run_cmd(r"cp {} {}".format(tmpfile, putdir))
