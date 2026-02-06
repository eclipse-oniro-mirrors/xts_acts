/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
#include "hitrace/trace.h"
#include "hilog/log.h"

#undef LOG_TAG
#define LOG_TAG "traceTest"

#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_5 5
#define PARAM_10 10
#define PARAM_9 9
static const int32_t TASK_ID = 111;
static const int32_t TASK_ID_TWO = 112;
static const int32_t TASK_ID_THREE = 1001;
static const int32_t TASK_ID_FOUR = 1002;
static const int32_t TASK_ID_FIVE = 1003;


static napi_value OHHiTraceCountTraceEx(napi_env env, napi_callback_info info)
{
    int64_t count = PARAM_0;
    // 第一个异步跟踪任务开始
    OH_HiTrace_StartAsyncTraceEx(HITRACE_LEVEL_DEBUG, "myTestAsyncTrace", TASK_ID_THREE, "categoryTest", "key=value");
    count++;
    OH_HiTrace_CountTraceEx(HITRACE_LEVEL_INFO, "myTestCountTrace", count);
    count++;
    // 业务流程
    OH_LOG_INFO(LogType::LOG_APP, "myTraceTest running, taskId: 1001");
    // 第二个异步跟踪任务开始，同时第一个跟踪的同名任务还没结束，出现了并行执行，对应接口的taskId需要不同
    OH_HiTrace_StartAsyncTraceEx(HITRACE_LEVEL_CRITICAL, "myTestAsyncTrace", TASK_ID_FOUR, "categoryTest", "key=value");
    count++;
    OH_HiTrace_CountTraceEx(HITRACE_LEVEL_CRITICAL, "myTestCountTrace", count);
    count++;
    // 业务流程
    OH_LOG_INFO(LogType::LOG_APP, "myTraceTest running, taskId: 1002");
    // 结束taskId为1001的异步跟踪任务
    OH_HiTrace_FinishAsyncTraceEx(HITRACE_LEVEL_MAX, "myTestAsyncTrace", TASK_ID_THREE);
    count++;
    // 结束taskId为1002的异步跟踪任务
    OH_HiTrace_FinishAsyncTraceEx(HITRACE_LEVEL_MAX, "myTestAsyncTrace", TASK_ID_FOUR);
    count++;
    // 开始同步跟踪任务
    OH_HiTrace_StartTraceEx(HITRACE_LEVEL_COMMERCIAL, "myTestSyncTrace", "key=value");
    count++;
    // 业务流程
    OH_LOG_INFO(LogType::LOG_APP, "myTraceTest running, synchronizing trace");
    // 结束同步跟踪任务
    OH_HiTrace_FinishTraceEx(HITRACE_LEVEL_COMMERCIAL);
    count++;

    // 若通过HiTraceMeter性能打点接口传递的参数的生成过程比较复杂，此时可以通过isTraceEnabled判断当前是否开启应用trace捕获，
    // 在未开启应用trace捕获时，避免该部分性能损耗
    if (OH_HiTrace_IsTraceEnabled()) {
        char customArgs[128] = "key0=value0";
        for (int index = 1; index < PARAM_10; index++) {
            char buffer[16];
        }
        OH_HiTrace_StartAsyncTraceEx(HITRACE_LEVEL_COMMERCIAL, "myTestAsync", TASK_ID_FIVE, "categoryTest", customArgs);
        OH_LOG_INFO(LogType::LOG_APP, "myTraceTest running, taskId: 1003");
        OH_HiTrace_FinishAsyncTraceEx(HITRACE_LEVEL_COMMERCIAL, "myTestAsync", TASK_ID_FIVE);
    } else {
        OH_LOG_INFO(LogType::LOG_APP, "myTraceTest running, trace is not enabled");
    }
    count++;
    int returnValue = FAIL;
    if (count == PARAM_9) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHiTraceCountTrace(napi_env env, napi_callback_info info)
{
    int64_t count = PARAM_0;
    OH_HiTrace_CountTrace("countTraceName", count++);
    int returnValue = FAIL;
    if (count == PARAM_1) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHiTraceStartTrace(napi_env env, napi_callback_info info)
{
    int count = PARAM_0;
    OH_HiTrace_StartTrace("traceName");
    count++;
    OH_HiTrace_FinishTrace();
    count++;
    int returnValue = FAIL;
    if (count == PARAM_2) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value OHHiTraceStartAsyncTrace(napi_env env, napi_callback_info info)
{
    int count = PARAM_0;
    OH_HiTrace_StartAsyncTrace("testAsync", TASK_ID);
    count++;
    OH_HiTrace_StartAsyncTrace("testAsync", TASK_ID_TWO);
    OH_HiTrace_FinishAsyncTrace("testAsync", TASK_ID);
    count++;
    OH_HiTrace_FinishAsyncTrace("testAsync", TASK_ID_TWO);
    int returnValue = FAIL;
    if (count == PARAM_2) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Begin(napi_env env, napi_callback_info info)
{
    int count = PARAM_0;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", HITRACE_FLAG_DEFAULT);
    count++;
    OH_HiTrace_InitId(&hiTraceId);
    OH_HiTrace_ClearId();
    OH_HiTrace_SetId(&hiTraceId);
    hiTraceId = OH_HiTrace_GetId();
    OH_HiTrace_IsIdValid(&hiTraceId);
    OH_HiTrace_EndChain();
    count++;
    HiTraceId traceId5 = OH_HiTrace_BeginChain("hitraceNdkTest5", HITRACE_FLAG_INCLUDE_ASYNC);
    count++;
    uint8_t pIdArray;
    OH_HiTrace_IdToBytes(&traceId5, &pIdArray, sizeof(traceId5));
    OH_HiTrace_IdFromBytes(&traceId5, &pIdArray, sizeof(traceId5));
    int returnValue = FAIL;
    if (count == PARAM_3) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    
    return result;
}

static napi_value Beginflag(napi_env env, napi_callback_info info)
{
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    count++;
    OH_HiTrace_IsFlagEnabled(&hiTraceId, HITRACE_FLAG_INCLUDE_ASYNC);
    count++;
    OH_HiTrace_EnableFlag(&hiTraceId, HITRACE_FLAG_FAULT_TRIGGER);
    count++;
    OH_HiTrace_GetFlags(&hiTraceId);
    count++;
    OH_HiTrace_SetFlags(&hiTraceId, HITRACE_FLAG_DEFAULT);
    OH_HiTrace_EndChain();
    count++;
    int returnValue = FAIL;
    if (count == PARAM_5) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value BeginSpan(napi_env env, napi_callback_info info)
{
    int count = PARAM_0;
    HiTrace_Flag hitraceflag = HITRACE_FLAG_INCLUDE_ASYNC;
    HiTraceId hiTraceId = OH_HiTrace_BeginChain("hiTraceChainndktest", hitraceflag);
    count++;
    uint64_t chainId = 10000;
    OH_HiTrace_SetChainId(&hiTraceId, chainId);
    count++;
    OH_HiTrace_GetChainId(&hiTraceId);
    count++;
    uint64_t spanId = 12345678;
    OH_HiTrace_SetSpanId(&hiTraceId, spanId);
    count++;
    OH_HiTrace_GetSpanId(&hiTraceId);
    count++;
    uint64_t parentSpanId = 66666;
    OH_HiTrace_SetParentSpanId(&hiTraceId, parentSpanId);
    count++;
    OH_HiTrace_GetParentSpanId(&hiTraceId);
    count++;
    OH_HiTrace_CreateSpan();
    count++;
    OH_HiTrace_Tracepoint(HITRACE_CM_DEFAULT, HITRACE_TP_CS, &hiTraceId, "hitracetest4");
    count++;
    OH_HiTrace_EndChain();
    count++;
    int returnValue = FAIL;
    if (count == PARAM_10) {
        returnValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHHiTraceStartTrace", nullptr, OHHiTraceStartTrace, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHiTraceStartAsyncTrace", nullptr, OHHiTraceStartAsyncTrace, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHHiTraceCountTrace", nullptr, OHHiTraceCountTrace, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHHiTraceCountTraceEx", nullptr, OHHiTraceCountTraceEx, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"begin", nullptr, Begin, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"beginflag", nullptr, Beginflag, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"beginSpan", nullptr, BeginSpan, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "hitrace",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
