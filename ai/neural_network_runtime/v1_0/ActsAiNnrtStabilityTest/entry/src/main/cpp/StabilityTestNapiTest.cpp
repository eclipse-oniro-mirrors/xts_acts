/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <cstdio>
#include "StabilityTest.h"
#include "include/NnrtUtilsTest.h"
#include "napi/native_api.h"

// 测试函数统一类型：返回 int，无参数
using TestFunction = int (*)();

// 异步工作数据结构
struct AsyncWorkData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int testCaseIndex = -1;
    int result = -1;
};

// 测试函数注册表（静态数组）
static TestFunction g_testFunctions[] = {
    OHOS::NeuralNetworkRuntime::SubAiNnrReliabilityNorthStress0100,
    OHOS::NeuralNetworkRuntime::SubAiNnrReliabilityNorthStress0200,
};

static const int TEST_FUNCTION_COUNT = sizeof(g_testFunctions) / sizeof(g_testFunctions[0]);

static void ExecuteAsyncWork(napi_env env, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);

    if (workData->testCaseIndex >= 0 && workData->testCaseIndex < TEST_FUNCTION_COUNT) {
        workData->result = g_testFunctions[workData->testCaseIndex]();
    } else {
        workData->result = -1;
    }
}

static void CompleteAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);

    napi_value result;
    napi_create_int32(env, workData->result, &result);
    if (workData->result == 0) {
        napi_resolve_deferred(env, workData->deferred, result);
    } else {
        napi_reject_deferred(env, workData->deferred, result);
    }
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

/**
 * 统一的稳定性测试接口函数（异步版本）
 * @param env NAPI环境
 * @param info 回调信息
 * @return napi_value Promise对象，成功返回0，失败返回-1
 */
static napi_value stabilityTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_valuetype valuetype;
    int32_t caseNum = -1;
    napi_value promise;
    napi_value resourceName;
    napi_deferred deferred;
    napi_status status;

    if ((status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) != napi_ok ||
        napi_typeof(env, args[0], &valuetype) != napi_ok || valuetype != napi_number ||
        (status = napi_get_value_int32(env, args[0], &caseNum)) != napi_ok) {
        napi_throw_error(env, nullptr, "Invalid argument");
        return nullptr;
    }
    if (caseNum < 0 || caseNum >= TEST_FUNCTION_COUNT) {
        OHPrintf("The range of case must be 0 to %d", TEST_FUNCTION_COUNT - 1);
        napi_throw_type_error(env, nullptr, "Case number out of range");
        return nullptr;
    }
    if ((status = napi_create_promise(env, &deferred, &promise)) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }
    AsyncWorkData* workData = new AsyncWorkData();
    workData->deferred = deferred;
    workData->testCaseIndex = caseNum;
    napi_create_string_utf8(env, "NNRtStabilityTest", NAPI_AUTO_LENGTH, &resourceName);
    if ((status = napi_create_async_work(
        env,
        nullptr,
        resourceName,
        ExecuteAsyncWork,
        CompleteAsyncWork,
        workData,
        &workData->asyncWork)) != napi_ok ||
        (status = napi_queue_async_work(env, workData->asyncWork)) != napi_ok) {
        if (workData->asyncWork) {
            napi_delete_async_work(env, workData->asyncWork);
        }
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create/queue async work");
        return nullptr;
    }
    return promise;
}

/**
 * NAPI模块初始化
 */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "stabilityTest", nullptr, stabilityTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

/**
 * 模块注册
 * nm_modname必须与ETS中import的模块名一致
 */
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "ai_nnrt_stability_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

/**
 * 模块注册入口
 */
extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}