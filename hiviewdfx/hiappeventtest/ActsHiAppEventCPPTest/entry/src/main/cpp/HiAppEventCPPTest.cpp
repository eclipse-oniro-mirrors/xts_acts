/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
#include <numeric>
#include <iostream>
#include <vector>
#include <map>
#include <sstream>
#include <cstdlib>
#include <cstdio>
#include <ctime>
#include <ctime>
#include <mutex>
#include <condition_variable>
#include <chrono>
#include <hiappevent/hiappevent.h>
#include "include/HiappeventParamTest.h"
#include "include/HiappeventEventTest.h"
#include "include/ConstantTest.h"
#include "include/HelpersTest.h"
#include <hiappevent/hiappevent_event.h>
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0001
#define LOG_TAG "HiAppEventCPPTest11"

#define BUFF_SIZE 100
using namespace std;

namespace {
    const char* TEST_DOMAIN_NAME = "test_domain";
    const char* TEST_EVENT_NAME = "test_event";
    string g_reDiRectTimeout = "5";
    string g_logPath = "/data/test/hiappevent/";
    string g_delelogPath = "/data/test/hiappevent/*";
}

// 辅助函数已移至 TestHelpers.cpp

static int DfxDftHiviewKitHiAppEventNative0100()
{
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative0100 start");

    // 重置全局状态
    {   std::lock_guard<std::mutex> lock(g_mutex);
        g_eventReceived = false;
        g_eventValid = false;
    }

    // 1. 创建并添加 Watcher
    HiAppEvent_Watcher* watcher = OH_HiAppEvent_CreateWatcher("test_watcher_0100");
    if (watcher == nullptr) {
        OH_LOG_ERROR(LOG_APP, "CreateWatcher failed");
        return -1;
    }

    // SDK 14: OH_HiAppEvent_SetAppEventFilter(watcher, domain, eventTypes, names, namesLen)
    OH_HiAppEvent_SetAppEventFilter(watcher, TEST_DOMAIN_NAME, 0, nullptr, 0);
    OH_HiAppEvent_SetWatcherOnReceive(watcher, OnReceive);

    int ret = OH_HiAppEvent_AddWatcher(watcher);
    if (ret != 0) {
        OH_LOG_ERROR(LOG_APP, "AddWatcher failed: %{public}d", ret);
        OH_HiAppEvent_DestroyWatcher(watcher);
        return -1;
    }
    OH_LOG_INFO(LOG_APP,  "Watcher added successfully");

    // 2. 写入事件
    bool boolean = false;
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddBoolParam(list, "bool_key", boolean);
    EventType eventType = EventType::FAULT;

    ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP,  "Write result: %{public}d", ret);

    // 3. 等待回调
    bool received = false;
    {   std::unique_lock<std::mutex> lock(g_mutex);
        received = g_cv.wait_for(lock,
                                 std::chrono::seconds(TestConstants::WATCHER_TIMEOUT_SECONDS),
                                 []() { return g_eventReceived; });
    }

    // 4. 清理资源
    OH_HiAppEvent_DestroyParamList(list);
    OH_HiAppEvent_RemoveWatcher(watcher);
    OH_HiAppEvent_DestroyWatcher(watcher);

    // 5. 验证结果
    if (!received) {
        OH_LOG_ERROR(LOG_APP,
                     "Timeout: Event not received within %{public}d seconds",
                     TestConstants::WATCHER_TIMEOUT_SECONDS);
        return -1;
    }

    if (!g_eventValid) {
        OH_LOG_ERROR(LOG_APP, "Event validation failed: bool_key not found or incorrect");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0100 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative0200()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0200 start");

    // 1. 先设置 Watcher
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {"\"bool_key\":true"});
    if (watcher == nullptr) {
        return -1;
    }

    // 2. 再写入事件
    bool boolean = true;
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddBoolParam(list, "bool_key", boolean);
    EventType eventType = EventType::FAULT;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    // 3. 等待并验证
    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0200 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative0300()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0300 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {"\"bool_arr_key\":[true,true]"});
    if (watcher == nullptr) {
        return -1;
    }

    bool booleans[] = {true, true};
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddBoolArrayParam(list, "bool_arr_key",
                                    booleans, TestConstants::BOOL_ARRAY_SIZE);
    EventType eventType = EventType::FAULT;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0300 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative0400()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0400 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_BEHAVIOR,
        {"\"str_key\":\"hello\""});
    if (watcher == nullptr) {
        return -1;
    }

    char str[] = "hello";
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", str);
    EventType eventType = EventType::BEHAVIOR;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0400 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative0500()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0500 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_BEHAVIOR,
        {"\"str_arr_key\":[\"hello\",\"world\"]"});
    if (watcher == nullptr) {
        return -1;
    }

    char str1[] = "hello";
    char str2[] = "world";
    char* strs[] = {str1, str2};
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringArrayParam(list, "str_arr_key",
                                      strs, TestConstants::STRING_ARRAY_SIZE);
    EventType eventType = EventType::BEHAVIOR;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0500 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative0800()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0800 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {"\"double_key\":30949.374"});
    if (watcher == nullptr) {
        return -1;
    }

    double num = 30949.374;
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddDoubleParam(list, "double_key", num);
    EventType eventType = EventType::FAULT;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0800 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative0900()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0900 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_STATISTIC,
        {"\"double_arr_key\":[123.22,30949.374,131312.46464]"});
    if (watcher == nullptr) {
        return -1;
    }

    double nums[] = {123.22, 30949.374, 131312.46464};
    ParamList list = OH_HiAppEvent_CreateParamList();
    constexpr int doubleArraySize = 3;
    OH_HiAppEvent_AddDoubleArrayParam(list, "double_arr_key",
                                      nums, doubleArraySize);
    EventType eventType = EventType::STATISTIC;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative0900 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative1000()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1000 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_STATISTIC,
        {"\"float_key\":234.5"});
    if (watcher == nullptr) {
        return -1;
    }

    float num = 234.5f;
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddFloatParam(list, "float_key", num);
    EventType eventType = EventType::STATISTIC;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1000 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative1100()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1100 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_STATISTIC,
        {"\"float_arr_key\":[123.22", "234.5", "131312.46"});
    if (watcher == nullptr) {
        return -1;
    }

    float nums[] = {123.22f, 234.5f, 131312.46464f};
    ParamList list = OH_HiAppEvent_CreateParamList();
    constexpr int floatArraySize = 3;
    OH_HiAppEvent_AddFloatArrayParam(list, "float_arr_key",
                                     nums, floatArraySize);
    EventType eventType = EventType::STATISTIC;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1100 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative1200()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1200 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_SECURITY,
        {"\"int8_key\":1"});
    if (watcher == nullptr) {
        return -1;
    }

    int num = 1;
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt8Param(list, "int8_key", num);
    EventType eventType = EventType::SECURITY;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1200 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative1300()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1300 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_SECURITY,
        {"\"int8_arr_key\":[1,10,100]"});
    if (watcher == nullptr) {
        return -1;
    }

    int8_t nums[] = {1, 10, 100};
    ParamList list = OH_HiAppEvent_CreateParamList();
    constexpr int int8ArraySize = 3;
    OH_HiAppEvent_AddInt8ArrayParam(list, "int8_arr_key",
                                    nums, int8ArraySize);
    EventType eventType = EventType::SECURITY;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1300 end - SUCCESS");
    return 0;
}


static int DfxDftHiviewKitHiAppEventNative1400()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1400 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_SECURITY,
        {"\"int16_key\":1"});
    if (watcher == nullptr) {
        return -1;
    }

    int16_t num = 1;
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt16Param(list, "int16_key", num);
    EventType eventType = EventType::SECURITY;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1400 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative1500()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1500 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_SECURITY,
        {"\"int16_arr_key\":[1,1000,5000]"});
    if (watcher == nullptr) {
        return -1;
    }

    int16_t nums[] = {1, 1000, 5000};
    ParamList list = OH_HiAppEvent_CreateParamList();
    constexpr int int16ArraySize = 3;
    OH_HiAppEvent_AddInt16ArrayParam(list, "int16_arr_key",
                                     nums, int16ArraySize);
    EventType eventType = EventType::SECURITY;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1500 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative1600()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1600 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_SECURITY,
        {"\"int32_key\":1"});
    if (watcher == nullptr) {
        return -1;
    }

    int32_t num = 1;
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt32Param(list, "int32_key", num);
    EventType eventType = EventType::SECURITY;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1600 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative1700()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1700 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_SECURITY,
        {"\"int32_arr_key\":[1,100000,500000]"});
    if (watcher == nullptr) {
        return -1;
    }

    int32_t nums[] = {1, 100000, 500000};
    ParamList list = OH_HiAppEvent_CreateParamList();
    constexpr int int32ArraySize = 3;
    OH_HiAppEvent_AddInt32ArrayParam(list, "int32_arr_key",
                                     nums, int32ArraySize);
    EventType eventType = EventType::SECURITY;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1700 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative1800()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1800 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_SECURITY,
        {"\"int64_key\":1"});
    if (watcher == nullptr) {
        return -1;
    }

    int64_t num = 1;
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddInt64Param(list, "int64_key", num);
    EventType eventType = EventType::SECURITY;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1800 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative1900()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1900 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_SECURITY,
        {"\"int64_arr_key\":[1,10000000,50000000]"});
    if (watcher == nullptr) {
        return -1;
    }

    int64_t nums[] = {1, 10000000, 50000000};
    ParamList list = OH_HiAppEvent_CreateParamList();
    constexpr int int64ArraySize = 3;
    OH_HiAppEvent_AddInt64ArrayParam(list, "int64_arr_key",
                                     nums, int64ArraySize);
    EventType eventType = EventType::SECURITY;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative1900 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative2100()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2100 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(TestConstants::EVENT_TYPE_BEHAVIOR,
        {"\"str_arr_key\":[\"hello_world_0\"", "hello_world_99\""});
    if (watcher == nullptr) {
        return -1;
    }

    char* strs[TestConstants::ARRAY_SIZE_100];
    constexpr int bufferSize = 32;
    for (int i = 0; i < TestConstants::ARRAY_SIZE_100; i++) {
        strs[i] = new char[bufferSize];
        std::string formatted = "hello_world_" + std::to_string(i);
        size_t copyLen = formatted.length();
        if (copyLen >= bufferSize) {
            OH_LOG_ERROR(LOG_APP, "String too long for index %d", i);
            copyLen = bufferSize - 1;
        }
        formatted.copy(strs[i], copyLen);
        strs[i][copyLen] = '\0';
    }

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringArrayParam(list, "str_arr_key", strs, sizeof(strs) / sizeof(strs[0]));
    EventType eventType = EventType::BEHAVIOR;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    // 释放内存
    for (int i = 0; i < TestConstants::ARRAY_SIZE_100; i++) {
        delete[] strs[i];
    }

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2100 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative2200()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2200 start");

    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_BEHAVIOR,
        {"\"str_key\":", "abcdefgh"});
    if (watcher == nullptr) {
        return -1;
    }

    string strs = "";
    constexpr int stringRepeatCount = 1024;
    for (int i = 0; i < stringRepeatCount; i++) {
        strs.append("abcdefgh");
    }

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", strs.c_str());
    EventType eventType = EventType::BEHAVIOR;

    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2200 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative2300()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2300 start");
    char str[] = "hello";

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", str);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, NULL, eventType, list);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != -1) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2300 end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative2400()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2400 start");
    char str[] = "hello";

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", str);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, "", eventType, list);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != -1) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2400 end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative2500()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2500 start");
    char str[] = "hello";

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", str);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, "9527_test_event", eventType, list);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != -1) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2500 end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative2700()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2700 start");

    // 验证前32个参数能被写入, 第33个会被忽略
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {"\"key31\":\"value31\"", "\"key15\":\"value15\""});
    if (watcher == nullptr) {
        return -1;
    }

    int maxLen = 32;
    string keys[maxLen + 1];
    string values[maxLen + 1];
    ParamList list = OH_HiAppEvent_CreateParamList();
    for (int i = 0; i <= maxLen; i++) {
        keys[i] = "key" + std::to_string(i);
        values[i] = "value" + std::to_string(i);
        OH_HiAppEvent_AddStringParam(list, keys[i].c_str(),
                                     values[i].c_str());
    }
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d (expected 5 for param limit warning)", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != TestConstants::RETURN_PARAM_LIMIT_WARNING) {
        return -1;  // 返回值5表示参数数量超限警告
    }
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2700 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative2800()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2800 start");

    // 空key和value会被忽略, 但事件仍然被写入(params为空)
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {});
    if (watcher == nullptr) {
        return -1;
    }

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "", "");
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d (expected 1 for invalid param warning)", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != 1) {
        return -1;  // 返回值1表示参数无效警告
    }
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2800 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative2900()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2900 start");

    // key为空会被忽略, 但事件仍然被写入(params为空)
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {});
    if (watcher == nullptr) {
        return -1;
    }

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "", "hello");
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d (expected 1 for invalid param warning)", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != 1) {
        return -1;  // 返回值1表示参数无效警告
    }
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative2900 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative3000()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3000 start");

    // key以数字开头会被忽略, 但事件仍然被写入(params为空)
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {});
    if (watcher == nullptr) {
        return -1;
    }

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "9527_hello", "world");
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d (expected 1 for invalid param warning)", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != 1) {
        return -1;  // 返回值1表示参数无效警告
    }
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3000 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative3100()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3100 start");

    // 8KB + 1字符串超过限制, 整个参数被丢弃(params为空)
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {});
    if (watcher == nullptr) {
        return -1;
    }

    string strs = "";
    constexpr int stringRepeatCount8K = 1024;
    for (int i = 0; i < stringRepeatCount8K; i++) {
        strs.append("abcdefgh");
    }
    strs.append("a");  // 8KB + 1字节

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, "str_key", strs.c_str());
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d (expected 4 for string too long)", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != TestConstants::RETURN_STRING_TOO_LONG) {
        return -1;  // 返回值4表示字符串过长
    }
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3100 end - SUCCESS");
    return 0;
}


static int DfxDftHiviewKitHiAppEventNative3200()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3200 start");

    // NULL参数会被忽略, 事件仍然被写入(params为空)
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {});
    if (watcher == nullptr) {
        return -1;
    }

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringParam(list, NULL, NULL);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d (expected 0 for success)", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != 0) {
        return -1;
    }
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3200 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative3300()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3300 start");

    // 101个数组元素会被截断到100个
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_BEHAVIOR,
        {"\"str_arr_key\":[\"hello_world_0\"", "hello_world_99\""});
    if (watcher == nullptr) {
        return -1;
    }

    char* strs[101];
    constexpr int bufferSize = 32;
    constexpr int arraySize101 = 101;
    for (int i = 0; i < arraySize101; i++) {
        strs[i] = new char[bufferSize];
        std::string formatted = "hello_world_" + std::to_string(i);
        size_t copyLen = formatted.length();
        if (copyLen >= bufferSize) {
            OH_LOG_ERROR(LOG_APP, "String too long for index %d", i);
            copyLen = bufferSize - 1;
        }
        formatted.copy(strs[i], copyLen);
        strs[i][copyLen] = '\0';
    }

    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddStringArrayParam(list, "str_arr_key", strs, sizeof(strs) / sizeof(strs[0]));
    EventType eventType = EventType::BEHAVIOR;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d (expected 6 for array truncation warning)", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    // 释放内存
    for (int i = 0; i < arraySize101; i++) {
        delete[] strs[i];
    }

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != TestConstants::RETURN_ARRAY_TRUNCATED) {
        return -1;  // 返回值6表示数组被截断
    }
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3300 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative3400()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3400 start");

    // 33个参数, 验证前32个能被写入
    HiAppEvent_Watcher* watcher = SetupWatcher(1,
        {"\"key31\":\"value31\"", "\"key15\":\"value15\"", "\"key0\":\"value0\""});
    if (watcher == nullptr) {
        return -1;
    }

    int maxLen = 32;
    string keys[maxLen + 1];
    string values[maxLen + 1];
    ParamList list = OH_HiAppEvent_CreateParamList();
    for (int i = 0; i <= maxLen; i++) {
        keys[i] = "key" + std::to_string(i);
        values[i] = "value" + std::to_string(i);
        OH_HiAppEvent_AddStringParam(list, keys[i].c_str(),
                                     values[i].c_str());
    }
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d (expected 5 for param limit warning)", ret);

    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (ret != TestConstants::RETURN_PARAM_LIMIT_WARNING) {
        return -1;  // 返回值5表示参数数量超限
    }
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3400 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative3500()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3500 start");

    // 设置 Watcher 监听事件
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {"\"key31\":\"value31\"",
         "\"key15\":\"value15\"",
         "\"key0\":\"value0\""});
    if (watcher == nullptr) {
        return -1;
    }

    // 配置 10M 存储配额
    OH_HiAppEvent_Configure(TestConstants::CONFIG_KEY_MAX_STORAGE,
                            TestConstants::STORAGE_QUOTA_10M);

    // 写入包含 32 个参数的事件
    int maxLen = TestConstants::MAX_PARAM_COUNT;
    string keys[maxLen + 1];
    string values[maxLen + 1];
    ParamList list = OH_HiAppEvent_CreateParamList();
    for (int i = 0; i <= maxLen; i++) {
        keys[i] = "key" + std::to_string(i);
        values[i] = "value" + std::to_string(i);
        OH_HiAppEvent_AddStringParam(list, keys[i].c_str(),
                                     values[i].c_str());
    }

    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    // 等待并验证 Watcher 是否收到事件
    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);
    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3500 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative3600()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3600 start");

    // 设置 Watcher 监听事件
    HiAppEvent_Watcher* watcher = SetupWatcher(
        TestConstants::EVENT_TYPE_FAULT,
        {"\"key31\":\"value31\"",
         "\"key15\":\"value15\"",
         "\"key0\":\"value0\""});
    if (watcher == nullptr) {
        return -1;
    }

    // 配置 1M 存储配额
    OH_HiAppEvent_Configure(TestConstants::CONFIG_KEY_MAX_STORAGE,
                            TestConstants::STORAGE_QUOTA_1M);

    // 写入包含 32 个参数的事件
    int maxLen = TestConstants::MAX_PARAM_COUNT;
    string keys[maxLen + 1];
    string values[maxLen + 1];
    ParamList list = OH_HiAppEvent_CreateParamList();
    for (int i = 0; i <= maxLen; i++) {
        keys[i] = "key" + std::to_string(i);
        values[i] = "value" + std::to_string(i);
        OH_HiAppEvent_AddStringParam(list, keys[i].c_str(),
                                     values[i].c_str());
    }

    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d", ret);

    // 等待并验证 Watcher 是否收到事件
    bool result = WaitAndVerifyWatcher(watcher);

    OH_HiAppEvent_DestroyParamList(list);

    // 恢复配额
    OH_HiAppEvent_Configure(TestConstants::CONFIG_KEY_MAX_STORAGE,
                            TestConstants::STORAGE_QUOTA_10M);

    if (!result) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3600 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative3700()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3700 start");

    // 禁用事件写入, 验证返回值为-99且Watcher不会收到回调
    OH_HiAppEvent_Configure("disable", "true");

    bool boolean = true;
    ParamList list = OH_HiAppEvent_CreateParamList();
    OH_HiAppEvent_AddBoolParam(list, "bool_key", boolean);
    EventType eventType = EventType::FAULT;
    int ret = OH_HiAppEvent_Write(TEST_DOMAIN_NAME, TEST_EVENT_NAME, eventType, list);
    OH_LOG_INFO(LOG_APP, "Write result: %{public}d (expected -99 for disabled)", ret);

    OH_HiAppEvent_DestroyParamList(list);

    // 恢复配置
    OH_HiAppEvent_Configure("disable", "false");

    if (ret != TestConstants::RETURN_WRITE_DISABLED) {
        return -1;  // 返回值-99表示事件写入被禁用
    }
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3700 end - SUCCESS");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative3800()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3800 start");
    // nullptr config 应该返回 ERROR_EVENT_CONFIG_IS_NULL (-5)
    if (OH_HiAppEvent_SetConfigItem(nullptr, "testName", "testValue") !=
        HIAPPEVENT_EVENT_CONFIG_IS_NULL) {
        return -1;
    }

    constexpr int maxStringLength = 1024;
    std::string longStr(maxStringLength, 'a');
    std::string longInvalidStr(maxStringLength + 1, 'a');
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();

    // 空字符串 key 是允许的
    if (OH_HiAppEvent_SetConfigItem(configDemo, "", "testValue") != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    // 1024字符的 key 是允许的
    if (OH_HiAppEvent_SetConfigItem(configDemo, longStr.c_str(), "testValue") !=
        HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    // nullptr key 应该返回 ERROR_INVALID_PARAM_VALUE (-4)
    if (OH_HiAppEvent_SetConfigItem(configDemo, nullptr, "testValue") != HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }
    // 超过1024字符的 key 应该返回 ERROR_INVALID_PARAM_VALUE (-4)
    if (OH_HiAppEvent_SetConfigItem(configDemo, longInvalidStr.c_str(), "testValue") !=
        HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }

    // 空字符串 value 是允许的
    if (OH_HiAppEvent_SetConfigItem(configDemo, "testName", "") != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    // 1024字符的 value 是允许的
    if (OH_HiAppEvent_SetConfigItem(configDemo, "testName", longStr.c_str()) !=
        HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    // nullptr value 是允许的
    if (OH_HiAppEvent_SetConfigItem(configDemo, "testName", nullptr) !=
        HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    // 超过1024字符的 value 应该返回 ERROR_INVALID_PARAM_VALUE (-4)
    if (OH_HiAppEvent_SetConfigItem(configDemo, "testName", longInvalidStr.c_str()) !=
        HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }

    OH_HiAppEvent_DestroyConfig(configDemo);

    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3800 end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative3900()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3900 start");
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    if (OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "0") != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }

    // 无效事件名应该返回 ERROR_INVALID_PARAM_VALUE (-4)
    if (OH_HiAppEvent_SetEventConfig("", configDemo) != HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }
    if (OH_HiAppEvent_SetEventConfig(nullptr, configDemo) != HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }
    if (OH_HiAppEvent_SetEventConfig("testName", configDemo) != HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }
    int maxStrLen = 1024;
    std::string longInvalidStr(maxStrLen + 1, 'a');
    if (OH_HiAppEvent_SetEventConfig(longInvalidStr.c_str(), configDemo) != HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }

    OH_HiAppEvent_DestroyConfig(configDemo);
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative3900 end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative4000()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative4000 start");
    
    if (OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", nullptr) != HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }

    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    if (OH_HiAppEvent_SetEventConfig("MAIN_THREAD_JANK", configDemo) != HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }

    const char* invalidValues[] = {"-1", "abc", "", nullptr, "100"};
    for (const char* val : invalidValues) {
        if (!TestConfigItem(configDemo, "log_type", val, "MAIN_THREAD_JANK",
                            HIAPPEVENT_INVALID_PARAM_VALUE)) {
            return -1;
        }
    }

    const char* validValues[] = {"0", "2"};
    for (const char* val : validValues) {
        if (!TestConfigItem(configDemo, "log_type", val, "MAIN_THREAD_JANK",
                            HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS)) {
            return -1;
        }
    }

    OH_HiAppEvent_DestroyConfig(configDemo);
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative4000 end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative4100()
{
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative4100  start");
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    if (OH_HiAppEvent_SetConfigItem(configDemo, "log_type", "1") != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    int res = OH_HiAppEvent_SetEventConfig(EVENT_MAIN_THREAD_JANK, configDemo);
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative4100 value %{public}s", EVENT_MAIN_THREAD_JANK);
    OH_LOG_INFO(LOG_APP, "DfxDftHiviewKitHiAppEventNative4100 value %{public}d", res);
    if (OH_HiAppEvent_SetEventConfig(EVENT_MAIN_THREAD_JANK, configDemo) !=
        HiAppEvent_ErrorCode::HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }

    if (OH_HiAppEvent_SetConfigItem(configDemo, "ignore_startup_time", "10") !=
        HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    if (OH_HiAppEvent_SetConfigItem(configDemo, "sample_interval", "100") !=
        HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    if (OH_HiAppEvent_SetConfigItem(configDemo, "report_times_per_app", "3") !=
        HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    if (OH_HiAppEvent_SetConfigItem(configDemo, "sample_count", "21") !=
        HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    if (OH_HiAppEvent_SetEventConfig(EVENT_MAIN_THREAD_JANK, configDemo) !=
        HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }

    OH_HiAppEvent_DestroyConfig(configDemo);
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative4100  end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative4200()
{
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative4200 start");
    HiAppEvent_Config* configDemo = OH_HiAppEvent_CreateConfig();
    
    const char* configKeys[] = {"log_type", "sample_count", "ignore_startup_time",
                                "report_times_per_app", "sample_interval"};
    const char* configValues[] = {"1", "21", "10", "3", "50"};
    constexpr int configItemCount = 5;
    for (int i = 0; i < configItemCount; i++) {
        if (OH_HiAppEvent_SetConfigItem(configDemo, configKeys[i], configValues[i]) !=
            HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
            return -1;
        }
    }

    if (OH_HiAppEvent_SetEventConfig(EVENT_MAIN_THREAD_JANK, configDemo) !=
        HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }

    const char* invalidIntervals[] = {"-1", "49", "aa", "92233720368547758079223372036854775807"};
    for (const char* val : invalidIntervals) {
        if (!TestConfigItem(configDemo, "sample_interval", val, EVENT_MAIN_THREAD_JANK,
                            HiAppEvent_ErrorCode::HIAPPEVENT_INVALID_PARAM_VALUE)) {
            return -1;
        }
    }

    OH_HiAppEvent_DestroyConfig(configDemo);
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative4200 end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative4300()
{
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative4300 start");
    // Processor API 在 SDK 14 中未实现, 所有调用应该返回 -200
    const char* validname = "test_processor";
    HiAppEvent_Processor* processor0 = OH_HiAppEvent_CreateProcessor(validname);
    if (processor0 != nullptr) {
        // 如果创建成功, 验证其他 API 返回 -200
        if (OH_HiAppEvent_SetReportRoute(processor0, "com.example.app",
            "https://hiappevents.com/test") != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
            return -1;
        }
        constexpr int reportPolicyValue = 5;
        if (OH_HiAppEvent_SetReportPolicy(processor0, TestConstants::PROCESSOR_REPORT_PERIOD,
            reportPolicyValue, true, false) != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
            return -1;
        }
        if (OH_HiAppEvent_SetReportEvent(processor0, "OS", "ADDRESS_SANITIZER", true) !=
            HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
            return -1;
        }
        if (OH_HiAppEvent_SetCustomConfig(processor0, "test", "test") !=
            HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
            return -1;
        }
        if (OH_HiAppEvent_SetConfigId(processor0, TestConstants::PROCESSOR_CONFIG_ID) !=
            HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
            return -1;
        }
        const char* userList[] = {"testprocessor", "processor2", "processor3"};
        if (OH_HiAppEvent_SetReportUserId(processor0, userList, 1) !=
            HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
            return -1;
        }
        if (OH_HiAppEvent_SetReportUserProperty(processor0, userList, 1) !=
            HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
            return -1;
        }
        if (OH_HiAppEvent_AddProcessor(processor0) > HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
            return -1;
        }
    }
    if (OH_HiAppEvent_RemoveProcessor(TestConstants::PROCESSOR_CONFIG_ID) > HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative4300 end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative4400()
{
   // OH_HiAppEvent_SetEventConfig() 仅支持 MAIN_THREAD_JANK
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative4400 start");
    HiAppEvent_Config* config = OH_HiAppEvent_CreateConfig();
    int res = OH_HiAppEvent_SetConfigItem(config,
                                          MAIN_THREAD_JANK_PARAM_LOG_TYPE,
                                          TestConstants::JANK_LOG_TYPE_VALUE);
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }

    res = OH_HiAppEvent_SetConfigItem(config,
                                      MAIN_THREAD_JANK_PARAM_IGNORE_STARTUP_TIME,
                                      TestConstants::JANK_IGNORE_STARTUP_TIME);
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    res = OH_HiAppEvent_SetConfigItem(config,
                                      MAIN_THREAD_JANK_PARAM_SAMPLE_INTERVAL,
                                      TestConstants::JANK_SAMPLE_INTERVAL);
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    res = OH_HiAppEvent_SetConfigItem(config,
                                      MAIN_THREAD_JANK_PARAM_REPORT_TIMES_PER_APP,
                                      TestConstants::JANK_REPORT_TIMES);
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    res = OH_HiAppEvent_SetConfigItem(config,
                                      MAIN_THREAD_JANK_PARAM_SAMPLE_COUNT,
                                      TestConstants::JANK_SAMPLE_COUNT);
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    res = OH_HiAppEvent_SetConfigItem(config,
                                      MAIN_THREAD_JANK_PARAM_AUTO_STOP_SAMPLING,
                                      TestConstants::JANK_AUTO_STOP_TRUE);
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    res = OH_HiAppEvent_SetEventConfig(EVENT_MAIN_THREAD_JANK_V2, config);
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }

    OH_HiAppEvent_DestroyConfig(config);
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative4400 end");
    return 0;
}

static int DfxDftHiviewKitHiAppEventNative4500()
{
   // OH_HiAppEvent_SetEventConfig() 仅支持 MAIN_THREAD_JANK
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative4500 start");
    HiAppEvent_Config* config = OH_HiAppEvent_CreateConfig();
    // SetConfigItem 总是成功
    int res = OH_HiAppEvent_SetConfigItem(config,
                                          MAIN_THREAD_JANK_PARAM_AUTO_STOP_SAMPLING,
                                          "");
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    // 空字符串在 SetEventConfig 时也是允许的
    res = OH_HiAppEvent_SetEventConfig(EVENT_MAIN_THREAD_JANK_V2, config);
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }

    // SetConfigItem 总是成功
    res = OH_HiAppEvent_SetConfigItem(config,
                                      MAIN_THREAD_JANK_PARAM_AUTO_STOP_SAMPLING,
                                      "invalidValue");
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_SUCCESS) {
        return -1;
    }
    // 无效值在 SetEventConfig 时失败
    res = OH_HiAppEvent_SetEventConfig(EVENT_MAIN_THREAD_JANK_V2, config);
    if (res != HiAppEvent_ErrorCode::HIAPPEVENT_INVALID_PARAM_VALUE) {
        return -1;
    }

    OH_HiAppEvent_DestroyConfig(config);
    OH_LOG_INFO(LOG_APP,  "DfxDftHiviewKitHiAppEventNative4500 end");
    return 0;
}