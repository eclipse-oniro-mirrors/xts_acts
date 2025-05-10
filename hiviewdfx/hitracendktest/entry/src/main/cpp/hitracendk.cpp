/*
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
 */

#include "napi/native_api.h"
#include <trace.h>
#include <thread>

#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_5 5
#define PARAM_10 10
static const int32_t TASK_ID = 111;
static const int32_t TASK_ID_TWO = 112;

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
