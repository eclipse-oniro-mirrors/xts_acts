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

#ifndef TEST_HELPERS_H
#define TEST_HELPERS_H

#include <string>
#include <vector>
#include <mutex>
#include <condition_variable>
#include <hiappevent/hiappevent.h>

// 全局变量声明
extern std::mutex g_mutex;
extern std::condition_variable g_cv;
extern bool g_eventReceived;
extern bool g_eventValid;
extern int g_expectedEventType;
extern std::vector<std::string> g_expectedParams;

// 主要辅助函数声明
void OnReceive(const char* domain,
               const struct HiAppEvent_AppEventGroup* appEventGroups,
               uint32_t groupLen);

HiAppEvent_Watcher* SetupWatcher(int eventType,
                                 const std::vector<std::string>& expectedParams,
                                 int timeoutSeconds = 3);

bool WaitAndVerifyWatcher(HiAppEvent_Watcher* watcher,
                          int timeoutSeconds = 3);

void TearDown();

// 拆分大函数用的辅助函数
HiAppEvent_Watcher* CreateAndAddWatcher(const char* watcherName,
                                        const char* domain);

bool WaitForEvent(int timeoutSeconds);

bool VerifyEventResult(bool received);

void CleanupWatcher(HiAppEvent_Watcher* watcher);

char** CreateStringArray(int size, int bufferSize);

void FreeStringArray(char** array, int size);

void FillStringArray(char** array, int size, int bufferSize, const char* prefix);

// 配置测试辅助函数
bool TestConfigItem(HiAppEvent_Config* config, const char* key, const char* value,
                    const char* eventName, int expectedResult);

// 文件和命令工具函数（原 FileUtilsTest）
bool CheckInfo(std::vector<std::string>& para, std::string eventinfo);
int ExecCmdWithRet(std::string cmd, std::vector<std::string>& resvec);
std::string ReadFile(std::string filename);
void RedirecthiLog(std::string& hilogredirect, std::string& timeout);
void ExeCmd(std::string cmd);
void CmdRun(std::string cmd, std::string& result);
std::string ExecuteCmd(std::string cmd);
bool CompareString(const std::string& x, const std::string& y);
int GetTxtLine(std::string filename);
void CleanCmd();
void SaveCmdOutput(std::string cmd, std::string saveFile);
std::vector<std::string> GetFileInPath(std::string path);

#endif // TEST_HELPERS_H
