/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "PerformanceTest.h"
#include <future>
#include <hicollie/hicollie.h>
#include <hidebug/hidebug.h>
#include <hilog/log.h>
#include <hitrace/trace.h>
#include <js_native_api.h>
#include <sys/mman.h> // 包含标准 mmap/munmap 及相关宏（如 MAP_FAILED）
#include <thread>
#include <unistd.h>
#define MAX_FRAME_SIZE 256 // 最大栈回溯深度，应根据业务场景调整该值。
#define HIDEBUG_TRACE_TAG_FFRT (1ULL << 13)
static OH_HiCollie_BeginFunc beginFunc_1;
static OH_HiCollie_EndFunc endFunc_1;
HiCollie_DetectionParam param1{.sampleStackTriggerTime = 150, .reserved = 0};
int64_t g_lastWatchTime1 = 0;
const int64_t CHECK_INTERNAL_TIME1 = 3000;
// 自定义休眠时间，模拟卡死场景
const int64_t BLOCK_TIME1 = 5;
// 设置应用线程执行任务情况标志位, true-正常， false-卡死
std::shared_ptr<std::atomic<bool>> appThreadIsAlive_1 = std::make_shared<std::atomic<bool>>(true);
// 设置上报应用线程卡死事件标志位
std::shared_ptr<std::atomic<bool>> isSixSecondEvent_1 = std::make_shared<std::atomic<bool>>(false);

void SetTimeout1()
{
    int64_t now =
        std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch())
            .count();
    sleep(BLOCK_TIME1);
    int64_t currentTime =
        std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch())
            .count();
    if (currentTime - now < BLOCK_TIME1) {
        appThreadIsAlive_1->store(true);
        return;
    }
    appThreadIsAlive_1->store(false);
}

int64_t GetCurrentTime1()
{
    return std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch())
        .count();
}

bool ReportEvent1()
{
    if ((GetCurrentTime1() - g_lastWatchTime1) > CHECK_INTERNAL_TIME1) {
        return true;
    }
    return true;
}

// 开发者可自定义周期性检测任务
void Timer1()
{
    // 每隔5s检查应用是否正常执行任务
    if (appThreadIsAlive_1->load()) {
        OH_LOG_INFO(LogType::LOG_APP, "Check appThread isAlive.");
        // 更新appThreadIsAlive_1，正常执行下次检测时为true
        appThreadIsAlive_1->store(false);
        // 模拟超时场景
        SetTimeout1();
        return;
    }
    ReportEvent1();
}

int InitStuckDetection()
{
    // 初始化线程卡死监控函数
    OH_HiCollie_Task task;
    HiCollie_ErrorCode initResult = OH_HiCollie_Init_StuckDetection(Timer1);
    // 成功结果：0
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_StuckDetection: %{public}d", initResult);
    if (initResult == HICOLLIE_SUCCESS) {
        return initResult;
    }
    return -1; // 代表失败
}

napi_value HiCollieInitStuckDetectionSuccess(napi_env env, napi_callback_info info)
{
    // 使用std::async启动异步任务，替代std::thread
    // std::launch::async确保创建新线程
    std::future<int> future = std::async(std::launch::async, InitStuckDetection);

    // 等待线程执行完毕并获取返回值（会阻塞当前线程，类似join()）
    int result = future.get(); // result即为子线程的返回值

    // 后续可使用result做进一步处理（例如返回给JS层）
    OH_LOG_INFO(LogType::LOG_APP, "子线程返回值: %{public}d", result);

    // 如果需要向JS层返回结果，可创建napi_value并返回
    napi_value napiResult;
    napi_create_int32(env, result, &napiResult);
    return napiResult;
}

void InitBeginFunc1(const char *eventName) { std::string str(eventName); }

void InitEndFunc1(const char *eventName) { std::string str(eventName); }

int InitJankDetection()
{
    beginFunc_1 = InitBeginFunc1;
    endFunc_1 = InitEndFunc1;
    // 初始化线程卡死监控函数
    HiCollie_ErrorCode initResult = OH_HiCollie_Init_JankDetection(&beginFunc_1, &endFunc_1, param1);
    // 成功结果：0
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_JankDetection: %{public}d", initResult);
    if (initResult == HICOLLIE_SUCCESS) {
        return initResult;
    }
    return -1; // 代表失败
}

napi_value HiCollieInitJankDetectionSuccess(napi_env env, napi_callback_info info)
{
    // 使用std::async启动异步任务，替代std::thread
    // std::launch::async确保创建新线程
    std::future<int> future = std::async(std::launch::async, InitJankDetection);

    // 等待线程执行完毕并获取返回值
    int result = future.get(); // result即为子线程的返回值

    OH_LOG_INFO(LogType::LOG_APP, "子线程返回值: %{public}d", result);

    napi_value napiResult;
    napi_create_int32(env, result, &napiResult);
    return napiResult;
}

int InitHiCollieInitJankDetectionInvalid()
{
    beginFunc_1 = InitBeginFunc1;
    endFunc_1 = InitEndFunc1;
    // 初始化线程卡死监控函数
    HiCollie_ErrorCode initResult = OH_HiCollie_Init_JankDetection(nullptr, &endFunc_1, param1);
    // 结果：401
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Init_JankDetection: %{public}d", initResult);
    if (initResult == HICOLLIE_INVALID_ARGUMENT) {
        return initResult;
    }
    return -1; // 代表失败
}

napi_value HiCollieInitJankDetectionInvalid(napi_env env, napi_callback_info info)
{
    // 使用std::async启动异步任务，替代std::thread
    // std::launch::async确保创建新线程
    std::future<int> future = std::async(std::launch::async, InitHiCollieInitJankDetectionInvalid);

    // 等待线程执行完毕并获取返回值（会阻塞当前线程，类似join()）
    int result = future.get(); // result即为子线程的返回值

    // 后续可使用result做进一步处理（例如返回给JS层）
    OH_LOG_INFO(LogType::LOG_APP, "子线程返回值: %{public}d", result);

    // 如果需要向JS层返回结果，可创建napi_value并返回
    napi_value napiResult;
    napi_create_int32(env, result, &napiResult);
    return napiResult;
}

std::shared_ptr<std::atomic<bool>> isReport2 = std::make_shared<std::atomic<bool>>(true);

bool g_needReport2 = true;
int64_t g_lastWatchTime2 = 0;
const int64_t CHECK_INTERNAL_TIME = 3000;

int64_t GetCurrentTime2()
{
    return std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch())
        .count();
}

bool ReportEvent2()
{
    if ((GetCurrentTime2() - g_lastWatchTime2) > CHECK_INTERNAL_TIME) {
        return true;
    }
    return true;
}

int ReportInvalid()
{
    // 初始化线程卡死监控函数
    HiCollie_ErrorCode initResult = OH_HiCollie_Report(nullptr);
    // 结果：401
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiCollie_Report: %{public}d", initResult);
    if (initResult == HICOLLIE_INVALID_ARGUMENT) {
        return initResult;
    }
    return -1; // 代表失败
}

napi_value HiCollieReportInvalid(napi_env env, napi_callback_info info)
{
    // 使用std::async启动异步任务，替代std::thread
    // std::launch::async确保创建新线程
    std::future<int> future = std::async(std::launch::async, ReportInvalid);

    // 等待线程执行完毕并获取返回值（会阻塞当前线程，类似join()）
    int result = future.get(); // result即为子线程的返回值

    // 后续可使用result做进一步处理（例如返回给JS层）
    OH_LOG_INFO(LogType::LOG_APP, "子线程返回值: %{public}d", result);

    // 如果需要向JS层返回结果，可创建napi_value并返回
    napi_value napiResult;
    napi_create_int32(env, result, &napiResult);
    return napiResult;
}

napi_value HiCollieFlagDefaultCode(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 1, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_DEFAULT};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    if (errorCode == HICOLLIE_SUCCESS) {
        napi_create_int32(env, errorCode, &sum);
        return sum;
    }
    return nullptr;
}

napi_value HiCollieFlagLogCode(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 1, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_LOG};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    if (errorCode == HICOLLIE_SUCCESS) {
        napi_create_int32(env, errorCode, &sum);
        return sum;
    }
    return nullptr;
}

napi_value HiCollieFlagRecoveryCode(napi_env env, napi_callback_info info)
{
    napi_value sum;
    int id;
    HiCollie_SetTimerParam param = {"testSetTimer", 1, nullptr, nullptr, HiCollie_Flag::HICOLLIE_FLAG_RECOVERY};
    HiCollie_ErrorCode errorCode = OH_HiCollie_SetTimer(param, &id);
    if (errorCode == HICOLLIE_SUCCESS) {
        napi_create_int32(env, errorCode, &sum);
        return sum;
    }
    return nullptr;
}

napi_value HiDebugStartAppTraceCaptureSuccess(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_TraceFlag flag = HIDEBUG_TRACE_FLAG_MAIN_THREAD;
    uint64_t tags = HIDEBUG_TRACE_TAG_FFRT;
    uint32_t limitSize = 1024 * 1024;
    uint32_t length = 256;

    char fileName[length];
    HiDebug_ErrorCode errorCode = OH_HiDebug_StartAppTraceCapture(flag, tags, limitSize, fileName, length);
    if (errorCode == HIDEBUG_SUCCESS) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugStartAppTraceCaptureInvalid(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_TraceFlag flag = HIDEBUG_TRACE_FLAG_MAIN_THREAD;
    uint64_t tags = 0;
    uint32_t limitSize = 1024 * 1024;
    uint32_t length = 256;
    HiDebug_ErrorCode errorCode = OH_HiDebug_StartAppTraceCapture(flag, tags, limitSize, nullptr, length);
    if (errorCode == HIDEBUG_INVALID_ARGUMENT) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugStartAppTraceCaptureCapturedAlReady(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_TraceFlag flag = HIDEBUG_TRACE_FLAG_MAIN_THREAD;
    uint64_t tags = HIDEBUG_TRACE_TAG_FFRT;
    uint32_t limitSize = 1024 * 1024;
    uint32_t length = 256;

    char fileName[length];
    OH_HiDebug_StartAppTraceCapture(flag, tags, limitSize, fileName, length);
    HiDebug_ErrorCode errorCode = OH_HiDebug_StartAppTraceCapture(flag, tags, limitSize, fileName, length);
    if (errorCode == HIDEBUG_TRACE_CAPTURED_ALREADY) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugStopAppTraceCaptureSuccess(napi_env env, napi_callback_info info)
{
    HiDebug_TraceFlag flag = HIDEBUG_TRACE_FLAG_MAIN_THREAD;
    uint64_t tags = 0;
    uint32_t limitSize = 1024 * 1024;
    uint32_t length = 256;
    char fileName[length];

    HiDebug_ErrorCode errorCode = OH_HiDebug_StartAppTraceCapture(flag, tags, limitSize, fileName, length);
    errorCode = OH_HiDebug_StopAppTraceCapture();
    if (errorCode == HIDEBUG_SUCCESS) {
        napi_value ret;
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugStopAppTraceCaptureNoTraceRunning(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_ErrorCode errorCode = OH_HiDebug_StopAppTraceCapture();
    if (errorCode == HIDEBUG_NO_TRACE_RUNNING) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugGetGraphicsMemorySuccess(napi_env env, napi_callback_info info)
{
    napi_value ret;
    uint32_t value = 256;
    HiDebug_ErrorCode errorCode = OH_HiDebug_GetGraphicsMemory(&value);
    if (errorCode == HIDEBUG_SUCCESS) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugGetGraphicsMemoryInvalid(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_ErrorCode errorCode = OH_HiDebug_GetGraphicsMemory(nullptr);
    if (errorCode == HIDEBUG_INVALID_ARGUMENT) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

// 1. 自定义 malloc：包装标准 malloc，添加日志
void *MyMalloc(size_t size)
{
    const int maxMemorySize = 1024;
    if (size == 0) {
        OH_LOG_ERROR(LOG_APP, "[%{public}s MyMalloc: 申请 0 字节内存，非法请求", LOG_TAG);
        return nullptr;
    }
    if (size > maxMemorySize) { // 假设_MEMORY_SIZE 是一个预定义的最大允许内存大小
        OH_LOG_ERROR(LOG_APP, "[%{public}s] MyMalloc: 申请 %zu 字节内存，超出最大允许大小zu", LOG_TAG, size,
                     maxMemorySize);
        return nullptr;
    }
    void *ptr = malloc(size); // 调用标准 malloc
    if (ptr != nullptr) {
        OH_LOG_INFO(LOG_APP, "[%{public}s] MyMalloc: 分配 %zu 字节，地址: %p", LOG_TAG, size, ptr);
    } else {
        OH_LOG_ERROR(LOG_APP, "[%{public}s] MyMalloc: 分配 %zu 字节失败（NULL）", LOG_TAG, size);
    }
    return ptr;
}

napi_value HiDebugSetMallocDispatchTableSuccess(napi_env env, napi_callback_info info)
{
    HiDebug_MallocDispatch *original = (HiDebug_MallocDispatch *)OH_HiDebug_GetDefaultMallocDispatchTable();
    HiDebug_MallocDispatch *current = (HiDebug_MallocDispatch *)original->malloc(sizeof(HiDebug_MallocDispatch));
    current->malloc = MyMalloc;
    napi_value sum;
    HiDebug_ErrorCode initResult = OH_HiDebug_SetMallocDispatchTable(current);
    OH_HiDebug_RestoreMallocDispatchTable();
    if (initResult == HIDEBUG_SUCCESS) {
        napi_create_int32(env, initResult, &sum);
        return sum;
    }
    return nullptr;
}

napi_value HiDebugSetMallocDispatchTableInvalid(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_ErrorCode errorCode = OH_HiDebug_SetMallocDispatchTable(nullptr);
    if (errorCode == HIDEBUG_INVALID_ARGUMENT) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugSymbolicAddressInvalid(napi_env env, napi_callback_info info)
{
    napi_value ret;
    void *pc;
    void *arg;
    HiDebug_ErrorCode errorCode = OH_HiDebug_SymbolicAddress(nullptr, pc, arg, nullptr);
    if (errorCode == HIDEBUG_INVALID_ARGUMENT) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugTraceCapturedAlreadyCode(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_TraceFlag flag = HIDEBUG_TRACE_FLAG_MAIN_THREAD;
    uint64_t tags = HIDEBUG_TRACE_TAG_FFRT;
    uint32_t limitSize = 1024 * 1024;
    uint32_t length = 256;

    char fileName[length];
    OH_HiDebug_StartAppTraceCapture(flag, tags, limitSize, fileName, length);
    HiDebug_ErrorCode errorCode = OH_HiDebug_StartAppTraceCapture(flag, tags, limitSize, fileName, length);
    OH_HiDebug_StopAppTraceCapture();
    if (errorCode == HIDEBUG_TRACE_CAPTURED_ALREADY) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugNoTraceRunningCode(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_ErrorCode errorCode = OH_HiDebug_StopAppTraceCapture();
    if (errorCode == HIDEBUG_NO_TRACE_RUNNING) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

napi_value HiDebugTraceFlagAllThreadsCode(napi_env env, napi_callback_info info)
{
    napi_value ret;
    HiDebug_TraceFlag flag = HIDEBUG_TRACE_FLAG_ALL_THREADS;
    uint64_t tags = HIDEBUG_TRACE_TAG_FFRT;
    uint32_t limitSize = 1024 * 1024;
    uint32_t length = 256;

    char fileName[length];
    HiDebug_ErrorCode errorCode = OH_HiDebug_StartAppTraceCapture(flag, tags, limitSize, fileName, length);
    if (errorCode == HIDEBUG_SUCCESS) {
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    return nullptr;
}

void HiDebugSymbolicAddressCallback(void *pc, void *arg, const HiDebug_StackFrame *frame)
{
    if (frame->type == HIDEBUG_STACK_FRAME_TYPE_NATIVE) {
        OH_LOG_ERROR(LOG_APP, "[%{public}s] MyMunmap: 解映射地址 %p（大小: %zu 字节）失败", LOG_TAG, pc, arg);
    }
};

napi_value HiTraceIdInvalidCode(napi_env env, napi_callback_info info)
{
    HiTrace_Flag hitraceflag = HITRACE_FLAG_DONOT_CREATE_SPAN;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    hiTraceId.valid = HITRACE_ID_INVALID;
    auto result = OH_HiTrace_IsFlagEnabled(&hiTraceId, HITRACE_FLAG_DONOT_CREATE_SPAN);
    if (result == false) {
        napi_value res;
        napi_create_int32(env, 0, &res);
        return res;
    }
    return nullptr;
}

napi_value HiTraceIdTraceIdValidCode(napi_env env, napi_callback_info info)
{
    HiTrace_Flag hitraceflag = HITRACE_FLAG_DONOT_CREATE_SPAN;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    hiTraceId.valid = HITRACE_ID_VALID;
    auto result = OH_HiTrace_IsFlagEnabled(&hiTraceId, HITRACE_FLAG_DONOT_CREATE_SPAN);
    if (result) {
        napi_value res;
        napi_create_int32(env, 0, &res);
        return res;
    }
    return nullptr;
}

napi_value HiTraceVer1Code(napi_env env, napi_callback_info info)
{
    HiTrace_Flag hitraceflag = HITRACE_FLAG_DONOT_CREATE_SPAN;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    hiTraceId.ver = HITRACE_VER_1;
    auto result = OH_HiTrace_IsFlagEnabled(&hiTraceId, HITRACE_FLAG_DONOT_CREATE_SPAN);
    if (result) {
        napi_value res;
        napi_create_int32(env, 0, &res);
        return res;
    }
    return nullptr;
}

napi_value HiTraceFlagDonotCreateSpanCode(napi_env env, napi_callback_info info)
{
    HiTrace_Flag hitraceflag = HITRACE_FLAG_DONOT_CREATE_SPAN;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    auto result = OH_HiTrace_IsFlagEnabled(&hiTraceId, HITRACE_FLAG_DONOT_CREATE_SPAN);
    if (result) {
        napi_value res;
        napi_create_int32(env, 0, &res);
        return res;
    }
    return nullptr;
}

napi_value HiTraceFlagTpInfoCode(napi_env env, napi_callback_info info)
{
    HiTrace_Flag hitraceflag = HITRACE_FLAG_TP_INFO;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    auto result = OH_HiTrace_IsFlagEnabled(&hiTraceId, HITRACE_FLAG_TP_INFO);
    if (result) {
        napi_value res;
        napi_create_int32(env, 0, &res);
        return res;
    }
    return nullptr;
}

napi_value HiTraceFlagNoBeInfoCode(napi_env env, napi_callback_info info)
{
    HiTrace_Flag hitraceflag = HITRACE_FLAG_NO_BE_INFO;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    auto result = OH_HiTrace_IsFlagEnabled(&hiTraceId, HITRACE_FLAG_NO_BE_INFO);
    if (result) {
        napi_value res;
        napi_create_int32(env, 0, &res);
        return res;
    }
    return nullptr;
}

napi_value HiTraceFlagDonotEnableLogCode(napi_env env, napi_callback_info info)
{
    HiTrace_Flag hitraceflag = HITRACE_FLAG_DONOT_ENABLE_LOG;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    auto result = OH_HiTrace_IsFlagEnabled(&hiTraceId, HITRACE_FLAG_DONOT_ENABLE_LOG);
    if (result) {
        napi_value res;
        napi_create_int32(env, 0, &res);
        return res;
    }
    return nullptr;
}

napi_value HiTraceFlagD2dTpInfoCode(napi_env env, napi_callback_info info)
{
    HiTrace_Flag hitraceflag = HITRACE_FLAG_D2D_TP_INFO;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    auto result = OH_HiTrace_IsFlagEnabled(&hiTraceId, HITRACE_FLAG_D2D_TP_INFO);
    if (result) {
        napi_value res;
        napi_create_int32(env, 0, &res);
        return res;
    }
    return nullptr;
}

napi_value HiTraceTpCrCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_2 = 2;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    count++;
    OH_HiTrace_Tracepoint(HITRACE_CM_DEFAULT, HITRACE_TP_CR, &hiTraceId, "hitracetest4");
    count++;
    int returnValue = -1;
    if (count == PARAM_2) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceTpSsCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_2 = 2;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    count++;
    OH_HiTrace_Tracepoint(HITRACE_CM_DEFAULT, HITRACE_TP_SS, &hiTraceId, "hitracetest4");
    count++;
    int returnValue = -1;
    if (count == PARAM_2) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceTpSrCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_2 = 2;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    count++;
    OH_HiTrace_Tracepoint(HITRACE_CM_DEFAULT, HITRACE_TP_SR, &hiTraceId, "hitracetest4");
    count++;
    int returnValue = -1;
    if (count == PARAM_2) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceTpGeneralCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_2 = 2;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    count++;
    OH_HiTrace_Tracepoint(HITRACE_CM_DEFAULT, HITRACE_TP_GENERAL, &hiTraceId, "hitracetest4");
    count++;
    int returnValue = -1;
    if (count == PARAM_2) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceCmThreadCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_2 = 2;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    count++;
    OH_HiTrace_Tracepoint(HITRACE_CM_THREAD, HITRACE_TP_GENERAL, &hiTraceId, "hitracetest4");
    count++;
    int returnValue = -1;
    if (count == PARAM_2) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceCmProcessCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_2 = 2;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    count++;
    OH_HiTrace_Tracepoint(HITRACE_CM_PROCESS, HITRACE_TP_GENERAL, &hiTraceId, "hitracetest4");
    count++;
    int returnValue = -1;
    if (count == PARAM_2) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceCmDeviceCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_2 = 2;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    count++;
    OH_HiTrace_Tracepoint(HITRACE_CM_DEVICE, HITRACE_TP_GENERAL, &hiTraceId, "hitracetest4");
    count++;
    int returnValue = -1;
    if (count == PARAM_2) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceIdValidCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_1 = 1;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    hiTraceId.valid = 1;
    count++;
    int returnValue = -1;
    if (count == PARAM_1) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceIdVerCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_1 = 1;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    hiTraceId.ver = 1;
    count++;
    int returnValue = -1;
    if (count == PARAM_1) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceIdChainIdCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_1 = 1;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    hiTraceId.chainId = 1;
    count++;
    int returnValue = -1;
    if (count == PARAM_1) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceIdFlagsCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_1 = 1;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    hiTraceId.flags = 1;
    count++;
    int returnValue = -1;
    if (count == PARAM_1) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceIdSpanIdCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_1 = 1;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    hiTraceId.spanId = 1;
    count++;
    int returnValue = -1;
    if (count == PARAM_1) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value HiTraceIdParentSpanIdCode(napi_env env, napi_callback_info info)
{
    const int PARAM_0 = 0;
    const int PARAM_1 = 1;
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    hiTraceId.parentSpanId = 1;
    count++;
    int returnValue = -1;
    if (count == PARAM_1) {
        returnValue = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}