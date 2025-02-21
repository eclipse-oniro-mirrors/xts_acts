/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
 
#include "napi/native_api.h"
#include "hicollie/hicollie.h"
#include <thread>
#include <string>
#include <unistd.h>
#include <atomic>
 
#undef LOG_TAG
#define LOG_TAG "testTag"

static OH_HiCollie_BeginFunc beginFunc_;
static OH_HiCollie_EndFunc endFunc_;
HiCollie_DetectionParam param {.sampleStackTriggerTime = 150, .reserved = 0};
int64_t lastWatchTime = 0;
const int64_t CHECK_INTERNAL_TIME = 3000;
std::shared_ptr<std::atomic<bool>> isReport = std::make_shared<std::atomic<bool>>(true);
int g_count = 0;
bool g_needReport = true;
int g_initResult = -1;

void InitBeginFunc(const char* eventName)
{
    std::string str(eventName);
}
void InitEndFunc(const char* eventName)
{
    std::string str(eventName);
}

void TestJankDetection()
{
    beginFunc_ = InitBeginFunc;
    endFunc_ = InitEndFunc;
    int initResult = OH_HiCollie_Init_JankDetection(&beginFunc_, &endFunc_, param);
    int initcount = 0;
    while (initcount < 2) { //as of 2
        beginFunc_("TestBegin");
        usleep(350 * 1000); //350ms转换为350*1000微秒
        endFunc_("TestEnd");
        initcount++;
    }
}

static napi_value TestHiCollieJankC(napi_env env, napi_callback_info info)
{
    std::thread threadObj(TestJankDetection);
    threadObj.join();
    napi_value sum;
    napi_create_double(env, 0, &sum);
    return sum;
}

int64_t GetCurrentTime()
{
    return std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::
    system_clock::now().time_since_epoch()).count();
}

bool ReportEvent()
{
    if ((GetCurrentTime() - lastWatchTime) > CHECK_INTERNAL_TIME) {
        return true;
    }
    return true;
}

void TestTask()
{
    if (g_needReport && ReportEvent()) {
        bool temp = isReport->load();
        int reportResult = OH_HiCollie_Report(&temp);
        g_needReport = false;
    }
    int64_t now = GetCurrentTime();
    if ((now - lastWatchTime) >= (CHECK_INTERNAL_TIME / 2)) { //as of 2
        lastWatchTime = now;
    }
}

int  TestStuckDetection()
{
    int initResult = -1;
    if (g_count == 0) {
        initResult = OH_HiCollie_Init_StuckDetection(TestTask);
        TestTask();
        g_count++;
    }
    return initResult;
}

static napi_value TestHiCollieStuckC(napi_env env, napi_callback_info info)
{
    std::thread threadObj(TestStuckDetection);
    threadObj.join();
    napi_value sum;
    napi_create_double(env, 0, &sum);
    return sum;
}

static napi_value TestStuckCMThread(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int initResult = OH_HiCollie_Init_StuckDetection(nullptr);
    napi_create_int32(env, initResult, &sum);
    return sum;
}

static napi_value TestJankCMThread(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int initResult = OH_HiCollie_Init_JankDetection(nullptr, &endFunc_, param);
    napi_create_int32(env, initResult, &sum);
    return sum;
}


static napi_value TestReportCMThread(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int initResult = OH_HiCollie_Report(nullptr);
    napi_create_int32(env, initResult, &sum);
    return sum;
}


void Test001()
{
    g_initResult = OH_HiCollie_Init_JankDetection(nullptr, &endFunc_, param);
}

static napi_value TestJankCerr401(napi_env env, napi_callback_info info)
{
    napi_value sum;
    std::thread threadObj(Test001);
    threadObj.join();
    napi_create_int32(env, g_initResult, &sum);
    return sum;
}


static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);
    return sum;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testHiCollieJankC", nullptr, TestHiCollieJankC, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testHiCollieStuckC", nullptr, TestHiCollieStuckC, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testJankCMThread", nullptr, TestJankCMThread, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testStuckCMThread", nullptr, TestStuckCMThread, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testReportCMThread", nullptr, TestReportCMThread, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testJankCerr401", nullptr,  TestJankCerr401, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "hicollie",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
