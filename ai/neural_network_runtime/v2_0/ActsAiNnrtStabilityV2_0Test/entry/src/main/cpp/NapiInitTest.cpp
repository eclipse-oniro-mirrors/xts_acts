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
#include "MultiThreadTest.cpp"

namespace {
const int32_t TEST_CASE_0100 = 100;
const int32_t TEST_CASE_0200 = 200;
const int32_t INVALID_RESULT = -1;
}

// 异步工作数据结构
struct AsyncWorkData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int testCase = -1;
    int result = -1;
};

// 异步执行函数（在工作线程中执行）
static void ExecuteAsyncWork(napi_env env, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    
    // 在工作线程中执行耗时的测试函数
    switch (workData->testCase) {
        case TEST_CASE_0100:
            workData->result = SubAiNnrReliabilityNorthStress0100();
            break;
        case TEST_CASE_0200:
            workData->result = SubAiNnrReliabilityNorthStress0200();
            break;
        default:
            workData->result = INVALID_RESULT;
            break;
    }
}

// 异步完成回调（在主线程中执行）
static void CompleteAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    
    napi_value result;
    napi_create_int32(env, workData->result, &result);
    
    if (workData->result == 0) {
        // 测试成功，resolve Promise
        napi_resolve_deferred(env, workData->deferred, result);
    } else {
        // 测试失败，reject Promise
        napi_reject_deferred(env, workData->deferred, result);
    }
    
    // 清理异步工作
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

static int32_t GetTestCaseNumber(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args,
        nullptr, nullptr);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get callback info");
        return INVALID_RESULT;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return INVALID_RESULT;
    }

    int32_t testCase = INVALID_RESULT;
    status = napi_get_value_int32(env, args[0], &testCase);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get test case number");
        return INVALID_RESULT;
    }

    if (testCase != TEST_CASE_0100 && testCase != TEST_CASE_0200) {
        napi_throw_error(env, nullptr, "Invalid test case number");
        return INVALID_RESULT;
    }

    return testCase;
}

static napi_value CreateAsyncWork(napi_env env, int32_t testCase)
{
    napi_value promise;
    napi_deferred deferred;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    AsyncWorkData* workData = new AsyncWorkData();
    workData->deferred = deferred;
    workData->testCase = testCase;

    napi_value resourceName;
    napi_create_string_utf8(env, "NNRtStabilityTest",
        NAPI_AUTO_LENGTH, &resourceName);

    status = napi_create_async_work(env, nullptr, resourceName,
        ExecuteAsyncWork, CompleteAsyncWork, workData,
        &workData->asyncWork);
    if (status != napi_ok) {
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create async work");
        return nullptr;
    }

    status = napi_queue_async_work(env, workData->asyncWork);
    if (status != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        napi_throw_error(env, nullptr, "Failed to queue async work");
        return nullptr;
    }

    return promise;
}

/**
 * NAPI function for Stress tests
 * 参数：testCase - 测试用例编号 (100 或 200)
 * 返回：Promise<number>，成功返回 0，失败返回 -1
 */
static napi_value SubAiNnrReliabilityNorthStress(napi_env env,
    napi_callback_info info)
{
    int32_t testCase = GetTestCaseNumber(env, info);
    if (testCase == INVALID_RESULT) {
        return nullptr;
    }

    return CreateAsyncWork(env, testCase);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"SubAiNnrReliabilityNorthStress", nullptr,
            SubAiNnrReliabilityNorthStress, nullptr, nullptr, nullptr,
            napi_default, nullptr},
    };
    napi_define_properties(env, exports,
        sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "acts_nnrt_stability_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
