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
#include "hicollieTest.h"
#include "hicollie/hicollie.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include <atomic>
#include <string>
#include <thread>
#include <unistd.h>
#undef LOG_TAG
#define LOG_TAG "testTag"

OH_HiCollie_BeginFunc beginFunc_;
OH_HiCollie_EndFunc endFunc_;
HiCollie_DetectionParam param{.sampleStackTriggerTime = 150, .reserved = 0};
int64_t g_lastWatchTime = 0;
const int64_t CHECK_INTERNAL_TIME = 3000;
std::shared_ptr<std::atomic<bool>> isReport = std::make_shared<std::atomic<bool>>(true);
int g_count = 0;
bool g_needReport = true;
int g_initResult = -1;
int g_result = 0;
const int64_t BLOCK_TIME = 5;
std::shared_ptr<std::atomic<bool>> appThreadIsAlive_ = std::make_shared<std::atomic<bool>>(true);
std::shared_ptr<std::atomic<bool>> isSixSecondEvent_ = std::make_shared<std::atomic<bool>>(false);
void InitBeginFunc(const char *eventName) { std::string str(eventName); }
void InitEndFunc(const char *eventName) { std::string str(eventName); }
void TestJankDetection()
{
    beginFunc_ = InitBeginFunc;
    endFunc_ = InitEndFunc;
    int initResult = OH_HiCollie_Init_JankDetection(&beginFunc_, &endFunc_, param);
    int ret = -1;
    if (initResult == HICOLLIE_SUCCESS) {
        ret = 0;
    }
    int initcount = 0;
    while (initcount < 2) { // as of 2
        beginFunc_("TestBegin");
        endFunc_("TestEnd");
        initcount++;
    }
}

napi_value TestHiCollieJankC(napi_env env, napi_callback_info info)
{
    std::thread threadObj(TestJankDetection);
    threadObj.join();
    napi_value sum;
    napi_create_double(env, 0, &sum);
    return sum;
}

int64_t GetCurrentTime()
{
    return std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch())
        .count();
}

bool ReportEvent()
{
    if ((GetCurrentTime() - g_lastWatchTime) > CHECK_INTERNAL_TIME) {
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
}

void SetTimeout()
{
    int64_t now =
        std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch())
            .count();
    sleep(BLOCK_TIME);
    int64_t currentTime =
        std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch())
            .count();
    if (currentTime - now < BLOCK_TIME) {
        appThreadIsAlive_->store(true);
        return;
    }
    appThreadIsAlive_->store(false);
}

void Timer()
{
    if (appThreadIsAlive_->load()) {
        OH_LOG_INFO(LogType::LOG_APP, "Check appThread isAlive.");
        appThreadIsAlive_->store(false);
        SetTimeout();
        return;
    }
    ReportEvent();
}

int InitStuckDetectionWithTimeout()
{
    HiCollie_ErrorCode initResult = OH_HiCollie_Init_StuckDetectionWithTimeout(Timer, BLOCK_TIME);
    if (initResult == HICOLLIE_SUCCESS) {
        return 0;
    }
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_StuckDetection: %{public}d", initResult);
    return initResult;
}

napi_value TestHiCollieStuckWithTimeoutNdk(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int returnValue = OH_HiCollie_Init_StuckDetectionWithTimeout(Timer, BLOCK_TIME);
    int ret = -1;
    if (returnValue == HICOLLIE_WRONG_THREAD_CONTEXT) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value TestHiCollieStuckWithTimeoutNdk1(napi_env env, napi_callback_info info)
{
    napi_value sum;
    std::thread threadObj(InitStuckDetectionWithTimeout);
    threadObj.join();
    napi_create_int32(env, g_result, &sum);
    return sum;
}

napi_value TestHiCollieStuckWithTimeoutNdk2(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int returnValue = OH_HiCollie_Init_StuckDetectionWithTimeout(Timer, 1);
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_StuckDetection: %{public}d", returnValue);
    int ret = -1;
    if (returnValue == HICOLLIE_INVALID_ARGUMENT) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetTimer1(napi_env env, napi_callback_info info)
{
    int id;
    HiCollie_SetTimerParam param = {nullptr, 1, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    int ret = -1;
    if (errorCode == HICOLLIE_INVALID_TIMER_NAME) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetTimer2(napi_env env, napi_callback_info info)
{
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 0, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    int ret = -1;
    if (errorCode == HICOLLIE_INVALID_TIMEOUT_VALUE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value SetTimer3(napi_env env, napi_callback_info info)
{
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 1, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    int ret = -1;
    if (errorCode == HICOLLIE_WRONG_PROCESS_CONTEXT) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    return result;
}

napi_value SetTimer4(napi_env env, napi_callback_info info)
{
    HiCollie_SetTimerParam param = {"testSetTimer", 1, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_NOOP};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, nullptr);
    int ret = -1;
    if (errorCode == HICOLLIE_WRONG_TIMER_ID_OUTPUT_PARAM) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
