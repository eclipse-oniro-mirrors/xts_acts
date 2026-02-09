/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "EndToEndTest.cpp"

namespace {
const int32_t TEST_CASE_END_TO_END_0100 = 100;
const int32_t TEST_CASE_END_TO_END_0300 = 300;
}

static napi_value createResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

// Promise 异步工作数据结构
struct AsyncWorkData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int result = -1;
    int (*testFunc)() = nullptr;  // 函数指针
};

// 异步执行函数（在工作线程中执行）
static void executeAsyncWork(napi_env env, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    if (workData->testFunc != nullptr) {
        workData->result = workData->testFunc();
    }
}

// 异步完成回调（在主线程中执行）
static void completeAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);

    napi_value result;
    napi_create_int32(env, workData->result, &result);

    // 根据结果 resolve 或 reject Promise
    if (workData->result == 0) {
        napi_resolve_deferred(env, workData->deferred, result);
    } else {
        napi_reject_deferred(env, workData->deferred, result);
    }
    
    // 清理资源
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

// NAPI function for EndToEnd tests (0100, 0300)
static napi_value sub_AI_NNRt_Core_Func_North_EndToEnd(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return createResultValue(env, -1);
    }

    int32_t testCase = -1;
    status = napi_get_value_int32(env, args[0], &testCase);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    int result = -1;
    switch (testCase) {
        case TEST_CASE_END_TO_END_0100:
            result = SubAiNnRtCoreFuncNorthEndToEnd0100();
            break;
        case TEST_CASE_END_TO_END_0300:
            result = SubAiNnRtCoreFuncNorthEndToEnd0300();
            break;
        default:
            result = -1;
            break;
    }

    return createResultValue(env, result);
}

// NAPI function for Reliability tests (0100) - 返回 Promise
static napi_value sub_AI_NNRt_Core_Func_North_Reliability(napi_env env, napi_callback_info info)
{
    napi_value promise;
    napi_deferred deferred;
    
    // 创建 Promise
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    // 创建异步工作数据
    AsyncWorkData* workData = new AsyncWorkData();
    workData->deferred = deferred;
    workData->testFunc = SubAiNnRtCoreFuncNorthReliability0100;
    
    // 创建异步工作任务
    napi_value resourceName;
    napi_create_string_utf8(env, "NNRtReliabilityTest", NAPI_AUTO_LENGTH, &resourceName);
    
    status = napi_create_async_work(env, nullptr, resourceName, executeAsyncWork,
        completeAsyncWork, workData, &workData->asyncWork);
    if (status != napi_ok) {
        delete workData;
        return createResultValue(env, -1);
    }
    
    // 将异步工作加入队列
    status = napi_queue_async_work(env, workData->asyncWork);
    if (status != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        return createResultValue(env, -1);
    }
    
    return promise;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"sub_AI_NNRt_Core_Func_North_EndToEnd", nullptr,
            sub_AI_NNRt_Core_Func_North_EndToEnd, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sub_AI_NNRt_Core_Func_North_Reliability", nullptr,
            sub_AI_NNRt_Core_Func_North_Reliability, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nnrt_e2e_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
