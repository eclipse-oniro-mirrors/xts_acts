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
#include "hilog/log.h"

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
int result = 0;
// 自定义休眠时间，模拟卡死场景
const int64_t BLOCK_TIME = 5;
// 设置应用线程执行任务情况标志位, true-正常， false-卡死
std::shared_ptr<std::atomic<bool>> appThreadIsAlive_ = std::make_shared<std::atomic<bool>>(true);
// 设置上报应用线程卡死事件标志位
std::shared_ptr<std::atomic<bool>> isSixSecondEvent_ = std::make_shared<std::atomic<bool>>(false);

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

void CallBack(void*)
{
    // OH_LOG_INFO(LogType::LOG_APP, "HiCollieTimerNdk callBackParam:");
}

static napi_value TestHiCollieTimerNdkErr03(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int id;
    HiCollie_SetTimerParam param = {nullptr, 1, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    napi_create_int32(env, errorCode, &sum);
    return sum;
}

static napi_value TestHiCollieTimerNdkErr04(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 0, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    napi_create_int32(env, errorCode, &sum);
    return sum;
}

static napi_value TestHiCollieTimerNdkErr05(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 1, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    napi_create_int32(env, errorCode, &sum);
    return sum;
}

static napi_value TestHiCollieTimerNdkErr06(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 1, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, nullptr);
    napi_create_int32(env, errorCode, &sum);
    return sum;
}

static napi_value TestHiCollieTimerNdkSetSuc(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 1, CallBack, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    // OH_LOG_INFO(LogType::LOG_APP, "HiCollieTimer taskId: %{public}d", errorCode);
    napi_create_int32(env, errorCode, &sum);
    return sum;
}

static napi_value TestHiCollieTimerNdkCanSuc(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 1, CallBack, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    if (errorCode == HICOLLIE_SUCCESS) {
        sleep(2);
        OH_HiCollie_CancelTimer(id);
        napi_create_int32(env, 0, &sum);
    }
    return sum;
}

void SetTimeout()
{
	int64_t now = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::
    system_clock::now().time_since_epoch()).count();
	sleep(BLOCK_TIME);
	int64_t currentTime = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::
    system_clock::now().time_since_epoch()).count();
	if (currentTime - now < BLOCK_TIME) {
    appThreadIsAlive_->store(true);
    return;
  }
  appThreadIsAlive_->store(false);
}

// 开发者可自定义周期性检测任务
void Timer()
{
	// 每隔5s检查应用是否正常执行任务
	if (appThreadIsAlive_->load()) {
    OH_LOG_INFO(LogType::LOG_APP, "Check appThread isAlive.");
    // 更新appThreadIsAlive_，正常执行下次检测时为true
    appThreadIsAlive_->store(false);
    // 模拟超时场景
    SetTimeout();
    return;
  }
  ReportEvent();
}

int InitStuckDetectionWithTimeout()
{
	// 初始化线程卡死监控函数
	int initResult = OH_HiCollie_Init_StuckDetectionWithTimeout(Timer, BLOCK_TIME);
	// 成功结果：0
	OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_StuckDetection: %{public}d", initResult);
	return initResult;
}

//HICOLLIE_WRONG_THREAD_CONTEXT 29800001 - 调用线程错误。无法从主线程调用该函数
static napi_value TestHiCollieStuckWithTimeoutNdk(napi_env env, napi_callback_info info)
{
	napi_value sum;
	int initResult = OH_HiCollie_Init_StuckDetectionWithTimeout(Timer, BLOCK_TIME);
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_StuckDetection: %{public}d", initResult);
    napi_create_int32(env, initResult, &sum);
	return sum;
}
//HICOLLIE_SUCCESS 0 - 成功。
static napi_value TestHiCollieStuckWithTimeoutNdk1(napi_env env, napi_callback_info info)
{
    napi_value sum;
	// 创建子线程
	std::thread threadObj(InitStuckDetectionWithTimeout);
	// 执行任务
	threadObj.join();
    napi_create_int32(env, result, &sum);
	return sum;
}
//HICOLLIE_INVALID_ARGUMENT 401 - 开始函数和结束函数两者都必须有值或为空，否则将返回该错误值;卡死时间<3s
static napi_value TestHiCollieStuckWithTimeoutNdk2(napi_env env, napi_callback_info info)
{
	napi_value sum;
	// 创建子线程
	int initResult = OH_HiCollie_Init_StuckDetectionWithTimeout(Timer, 1);
	OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_StuckDetection: %{public}d", initResult);
	// 执行任务
    napi_create_int32(env, initResult, &sum);
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
        { "TestHiCollieTimerNdkErr03", nullptr, TestHiCollieTimerNdkErr03, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "TestHiCollieTimerNdkErr04", nullptr, TestHiCollieTimerNdkErr04, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "TestHiCollieTimerNdkErr05", nullptr, TestHiCollieTimerNdkErr05, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "TestHiCollieTimerNdkErr06", nullptr, TestHiCollieTimerNdkErr05, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "TestHiCollieTimerNdkSetSuc", nullptr, TestHiCollieTimerNdkSetSuc, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "TestHiCollieTimerNdkCanSuc", nullptr, TestHiCollieTimerNdkCanSuc, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testHiCollieStuckWithTimeoutNdk", nullptr, TestHiCollieStuckWithTimeoutNdk, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testHiCollieStuckWithTimeoutNdk1", nullptr, TestHiCollieStuckWithTimeoutNdk1, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testHiCollieStuckWithTimeoutNdk2", nullptr, TestHiCollieStuckWithTimeoutNdk2, nullptr, nullptr, nullptr, napi_default, nullptr },
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
