/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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
 */

#include "HelpersTest.h"
#include "ConstantTest.h"
#include "hilog/log.h"
#include <chrono>
#include <sstream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iostream>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0001
#define LOG_TAG "HiAppEventCPPTest11"

// 全局变量定义
std::mutex g_mutex;
std::condition_variable g_cv;
bool g_eventReceived = false;
bool g_eventValid = false;
int g_expectedEventType = TestConstants::EVENT_TYPE_FAULT;
std::vector<std::string> g_expectedParams;

// 辅助函数：验证参数是否存在
static bool ValidateParam(const std::string& params, const std::string& expectedParam)
{
    return params.find(expectedParam) != std::string::npos;
}

// 辅助函数：验证所有期望的参数
static bool ValidateAllParams(const std::string& params,
                              const std::vector<std::string>& expectedParams)
{
    for (const auto& expectedParam : expectedParams) {
        if (!ValidateParam(params, expectedParam)) {
            OH_LOG_INFO(LOG_APP,
                        "Missing expected param: %{public}s",
                        expectedParam.c_str());
            return false;
        }
    }
    return true;
}

// 事件接收回调函数
void OnReceive(const char* domain,
               const struct HiAppEvent_AppEventGroup* appEventGroups,
               uint32_t groupLen)
{
    OH_LOG_INFO(LOG_APP,
                "Watcher received: domain=%{public}s, groupLen=%{public}d",
                domain,
                groupLen);

    std::lock_guard<std::mutex> lock(g_mutex);

    if (groupLen == 0) {
        OH_LOG_INFO(LOG_APP, "No events in group");
        g_eventReceived = true;
        g_eventValid = true;
        g_cv.notify_one();
        return;
    }

    for (uint32_t i = 0; i < groupLen; i++) {
        const HiAppEvent_AppEventInfo* events = appEventGroups[i].appEventInfos;
        uint32_t infoLen = appEventGroups[i].infoLen;

        for (uint32_t j = 0; j < infoLen; j++) {
            const char* eventName = events[j].name;
            int eventType = events[j].type;
            const char* params = events[j].params;

            OH_LOG_INFO(LOG_APP,
                        "Event: name=%{public}s, type=%{public}d, params=%{public}s",
                        eventName,
                        eventType,
                        params);

            if (eventType == g_expectedEventType) {
                std::string paramsStr(params);
                g_eventValid = ValidateAllParams(paramsStr, g_expectedParams);
                g_eventReceived = true;
                g_cv.notify_one();
                return;
            }
        }
    }

    g_eventReceived = true;
    g_cv.notify_one();
}

// 设置 Watcher
HiAppEvent_Watcher* SetupWatcher(int eventType,
                                 const std::vector<std::string>& expectedParams,
                                 int timeoutSeconds)
{
    std::lock_guard<std::mutex> lock(g_mutex);
    g_eventReceived = false;
    g_eventValid = false;
    g_expectedEventType = eventType;
    g_expectedParams = expectedParams;

    std::string watcherName = "test_watcher_" + std::to_string(eventType);
    HiAppEvent_Watcher* watcher = OH_HiAppEvent_CreateWatcher(watcherName.c_str());
    if (watcher == nullptr) {
        OH_LOG_ERROR(LOG_APP, "CreateWatcher failed");
        return nullptr;
    }

    OH_HiAppEvent_SetAppEventFilter(watcher,
                                    "test_domain",
                                    0,
                                    nullptr,
                                    0);
    OH_HiAppEvent_SetWatcherOnReceive(watcher, OnReceive);

    int ret = OH_HiAppEvent_AddWatcher(watcher);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP, "AddWatcher failed: %{public}d", ret);
        OH_HiAppEvent_DestroyWatcher(watcher);
        return nullptr;
    }

    OH_LOG_INFO(LOG_APP, "Watcher added successfully");
    return watcher;
}

// 等待并验证 Watcher
bool WaitAndVerifyWatcher(HiAppEvent_Watcher* watcher, int timeoutSeconds)
{
    bool received = false;
    {
        std::unique_lock<std::mutex> lock(g_mutex);
        received = g_cv.wait_for(lock,
                                 std::chrono::seconds(timeoutSeconds),
                                 []() { return g_eventReceived; });
    }

    OH_HiAppEvent_RemoveWatcher(watcher);
    OH_HiAppEvent_DestroyWatcher(watcher);

    if (!received) {
        OH_LOG_ERROR(LOG_APP,
                     "Timeout: Event not received within %{public}d seconds",
                     timeoutSeconds);
        return false;
    }

    if (!g_eventValid) {
        OH_LOG_ERROR(LOG_APP, "Event validation failed");
        return false;
    }

    return true;
}

// 清理函数
void TearDown()
{
    OH_LOG_INFO(LOG_APP, "TearDown start");
    std::string cmd = "rm -f /data/test/hiappevent/*";
    std::vector<std::string> cmdret;
    ExecCmdWithRet(cmd, cmdret);
    OH_LOG_INFO(LOG_APP, "TearDown end");
}

// ========== 拆分大函数用的辅助函数 ==========

// 创建并添加 Watcher
HiAppEvent_Watcher* CreateAndAddWatcher(const char* watcherName,
                                        const char* domain)
{
    HiAppEvent_Watcher* watcher = OH_HiAppEvent_CreateWatcher(watcherName);
    if (watcher == nullptr) {
        OH_LOG_ERROR(LOG_APP, "CreateWatcher failed");
        return nullptr;
    }

    OH_HiAppEvent_SetAppEventFilter(watcher, domain, 0, nullptr, 0);
    OH_HiAppEvent_SetWatcherOnReceive(watcher, OnReceive);

    int ret = OH_HiAppEvent_AddWatcher(watcher);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP, "AddWatcher failed: %{public}d", ret);
        OH_HiAppEvent_DestroyWatcher(watcher);
        return nullptr;
    }

    OH_LOG_INFO(LOG_APP, "Watcher added successfully");
    return watcher;
}

// 等待事件回调
bool WaitForEvent(int timeoutSeconds)
{
    bool received = false;
    {   std::unique_lock<std::mutex> lock(g_mutex);
        received = g_cv.wait_for(lock,
                                 std::chrono::seconds(timeoutSeconds),
                                 []() { return g_eventReceived; });
    }
    return received;
}

// 验证事件结果
bool VerifyEventResult(bool received)
{
    if (!received) {
        OH_LOG_ERROR(LOG_APP, "Timeout: Event not received");
        return false;
    }

    if (!g_eventValid) {
        OH_LOG_ERROR(LOG_APP, "Event validation failed");
        return false;
    }

    return true;
}

// 清理 Watcher 资源
void CleanupWatcher(HiAppEvent_Watcher* watcher)
{
    if (watcher != nullptr) {
        OH_HiAppEvent_RemoveWatcher(watcher);
        OH_HiAppEvent_DestroyWatcher(watcher);
    }
}

// 创建字符串数组
char** CreateStringArray(int size, int bufferSize)
{
    // 校验内存申请大小的合法性
    constexpr int maxBufferSize = 10240;  // 10KB
    constexpr int maxArraySize = 10000;
    if (bufferSize <= 0 || bufferSize > maxBufferSize) {
        OH_LOG_ERROR(LOG_APP, "Invalid bufferSize: %d", bufferSize);
        return nullptr;
    }
    if (size <= 0 || size > maxArraySize) {
        OH_LOG_ERROR(LOG_APP, "Invalid array size: %d", size);
        return nullptr;
    }

    char** array = new char* [size];
    for (int i = 0; i < size; i++) {
        array[i] = new char[bufferSize];
    }
    return array;
}

// 释放字符串数组
void FreeStringArray(char** array, int size)
{
    for (int i = 0; i < size; i++) {
        delete[] array[i];
    }
    delete[] array;
}

// 填充字符串数组
void FillStringArray(char** array, int size, int bufferSize, const char* prefix)
{
    if (array == nullptr || prefix == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Invalid parameters: array or prefix is null");
        return;
    }

    for (int i = 0; i < size; i++) {
        if (array[i] == nullptr) {
            OH_LOG_ERROR(LOG_APP, "array[%d] is null", i);
            continue;
        }
        std::string formatted = std::string(prefix) + std::to_string(i);
        size_t copyLen = formatted.length();
        if (copyLen >= static_cast<size_t>(bufferSize)) {
            OH_LOG_ERROR(LOG_APP, "String too long for index %d", i);
            copyLen = bufferSize - 1;
        }
        formatted.copy(array[i], copyLen);
        array[i][copyLen] = '\0';
    }
}

// ==================== 配置测试辅助函数 ====================

// 测试配置项设置
bool TestConfigItem(HiAppEvent_Config* config, const char* key, const char* value,
                    const char* eventName, int expectedResult)
{
    if (OH_HiAppEvent_SetConfigItem(config, key, value) != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return false;
    }
    if (OH_HiAppEvent_SetEventConfig(eventName, config) != expectedResult) {
        return false;
    }
    return true;
}

// ==================== 文件和命令工具函数（原 FileUtilsTest）====================

// 执行命令并返回结果
int ExecCmdWithRet(std::string cmd, std::vector<std::string>& resvec)
{
    if (cmd.size() == 0) {
        return 0;
    }

    std::cout << "cmd is " + cmd << std::endl;
    if ((cmd.find("hilog") == std::string::npos) && (cmd.find("hidumper") == std::string::npos) &&
        (cmd.find("ps") == std::string::npos) && (cmd.find("rm") == std::string::npos) &&
        (cmd.find("hiperf") == std::string::npos) && (cmd.find("hisysevent") == std::string::npos) &&
        (cmd.find("mkdir") == std::string::npos) && (cmd.find("dd") == std::string::npos)) {
        std::cout << "unsupport cmd!" + cmd << std::endl;
        return 0;
    }
    resvec.clear();
    FILE* pp = popen(cmd.c_str(), "r");
    if (pp == nullptr) {
        return -1;
    }
    char tmp[1024];
    while (fgets(tmp, sizeof(tmp), pp) != nullptr) {
        if (tmp[strlen(tmp) - 1] == '\n') {
            tmp[strlen(tmp) - 1] = '\0';
        }
        resvec.push_back(tmp);
    }
    pclose(pp);
    return resvec.size();
}

// 执行命令
void ExeCmd(std::string cmd)
{
    std::vector<std::string> cmdret;
    ExecCmdWithRet(cmd, cmdret);
}

// 执行命令并返回结果字符串
void CmdRun(std::string cmd, std::string& result)
{
    std::vector<std::string> cmdret;
    int resultlen;
    int i = 0;
    std::string rst;
    resultlen = ExecCmdWithRet(cmd, cmdret);
    while (i < resultlen) {
        rst = rst + cmdret[i];
        i = i + 1;
    }
    result = rst;
}

// 清理命令
void CleanCmd()
{
    std::string cmdResult;
    std::string cleanCmd = "hilog -r";
    CmdRun(cleanCmd, cmdResult);
    std::cout << cmdResult;
}

// 执行命令并返回结果
std::string ExecuteCmd(std::string cmd)
{
    std::vector<std::string> cmdret;
    int resultlen;
    int i = 0;
    std::string rst;
    resultlen = ExecCmdWithRet(cmd, cmdret);
    while (i < resultlen) {
        rst = rst + cmdret[i] + "\n";
        i = i + 1;
    }
    return rst;
}

// 保存命令输出到文件
void SaveCmdOutput(std::string cmd, std::string saveFile)
{
    std::fstream fstr(saveFile, std::ios::out);
    std::string cmdRet = ExecuteCmd(cmd);
    fstr << cmdRet;
    fstr.close();
}

// 重定向 hilog
void RedirecthiLog(std::string& hilogredirect, std::string& timeout)
{
    unsigned long i;
    std::vector<std::string> cmdret;
    unsigned long cmdretlen;
    std::string cmd = "rm " + hilogredirect;
    cmdretlen = ExecCmdWithRet(cmd, cmdret);
    for (i = 0; i < cmdretlen; i++) {
        std::cout << cmdret[i].c_str() << std::endl;
    }
    cmd = "timeout " + timeout + " hilog >" + hilogredirect;
    std::cout << cmd << std::endl;
    cmdretlen = ExecCmdWithRet(cmd, cmdret);
    for (i = 0; i < cmdretlen; i++) {
        std::cout << cmdret[i].c_str() << std::endl;
    }
}

// 检查信息
bool CheckInfo(std::vector<std::string>& para, std::string info)
{
    if (info.empty()) {
        return false;
    }
    bool result = false;
    unsigned long matchcnt = 0;
    for (unsigned long i = 0; i < para.size(); i++) {
        if (int(info.find(para[i])) >= 0) {
            matchcnt++;
        }
    }
    std::cout << matchcnt << std::endl;
    if (matchcnt == para.size()) {
        result = true;
    }
    return result;
}

// 比较字符串
bool CompareString(const std::string& x, const std::string& y)
{
    int len = x.length() - 1;
    while (x[len] == y[len] && len >= 0) {
        len--;
    }
    if (len >= 0 && x[len] > y[len]) {
        return false;
    }
    return true;
}

// 获取文本文件行数
int GetTxtLine(std::string filename)
{
    FILE* fd = fopen(filename.c_str(), "r");
    int count = 0;
    if (fd != nullptr) {
        while (!feof(fd)) {
            if (fgetc(fd) == '\n') {
                count++;
            }
        }
    }
    std::cout << count << std::endl;
    if (fd != nullptr) {
        fclose(fd);
    }
    return count;
}

// 读取文件
std::string ReadFile(std::string filename)
{
    std::ifstream ifile(filename);
    std::ostringstream buf;
    char ch;
    if (ifile.fail()) {
        std::cout << "open file fail!" << std::endl;
        return "";
    }
    while (buf && ifile.get(ch)) {
        buf.put(ch);
    }
    ifile.close();
    return buf.str();
}

// 获取路径下的文件列表
std::vector<std::string> GetFileInPath(std::string path)
{
    std::vector<std::string> filelist;
    DIR* dir;
    struct dirent* pdirent;
    dir = opendir(path.c_str());
    if (dir != nullptr) {
        while ((pdirent = readdir(dir)) != nullptr) {
            if (strncmp(pdirent->d_name, ".", strlen(pdirent->d_name)) == 0 ||
                strncmp(pdirent->d_name, "..", strlen(pdirent->d_name)) == 0) {
                continue;
            } else if (pdirent->d_type == DT_DIR) {
                continue;
            } else {
                filelist.push_back(pdirent->d_name);
            }
        }
        closedir(dir);
    }
    return filelist;
}
