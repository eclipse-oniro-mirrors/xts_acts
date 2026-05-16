/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
#include "napi/native_api.h"
#include "include/ApiTest.h"
#include "include/FuncTest.h"
#include "include/Func2Test.h"
#include "include/ProcTest.h"
#include <vector>
#include <functional>

// ============================================
// 类型定义
// ============================================

using TestFunction = std::function<int()>;

// ============================================
// 常量定义
// ============================================

// 异步测试用例索引
static constexpr int32_t ASYNC_TEST_CASE_2200 = 19;  // DEMUXER_FUNCTION_2200
static constexpr int32_t ASYNC_TEST_CASE_2300 = 20;  // DEMUXER_FUNCTION_2300

// ============================================
// 测试函数映射表
// ============================================

// API 测试函数映射表
static const std::vector<TestFunction> apiTestFunctions = {
    OhAvSourceCreateWithDataSource0100,           // 0
    OhAvSourceCreateWithDataSourceExt0100,        // 1
    DemuxerIllegalPara0100,                       // 2
    DemuxerIllegalPara0200,                       // 3
    DemuxerIllegalPara0700,                       // 4
    DemuxerIllegalPara0800,                       // 5
    DemuxerIllegalPara0300,                       // 6
    DemuxerIllegalPara0400,                       // 7
    DemuxerIllegalPara0500,                       // 8
    DemuxerIllegalPara0600,                       // 9
    DemuxerIllegalPara2300,                       // 10
    DemuxerIllegalPara0900,                       // 11
    DemuxerIllegalPara1000,                       // 12
    DemuxerIllegalPara1100,                       // 13
    DemuxerIllegalPara1200,                       // 14
    DemuxerIllegalPara1300,                       // 15
    DemuxerIllegalPara1400,                       // 16
    DemuxerIllegalPara1500,                       // 17
    DemuxerIllegalPara1600,                       // 18
    DemuxerIllegalPara1700,                       // 19
    DemuxerApi0200,                               // 20
    DemuxerApi1100                                // 21
};

// 功能测试函数映射表
// 注意: 索引 0 和 1 对应的 DemuxerFunction0200 和 DemuxerFunction0300 已被删除
static const std::vector<TestFunction> funcTestFunctions = {
    nullptr,                                      // 0 - DemuxerFunction0200 已删除
    nullptr,                                      // 1 - DemuxerFunction0300 已删除
    DemuxerFunction0400,                          // 2
    DemuxerFunction0500,                          // 3
    DemuxerFunction0700,                          // 4
    DemuxerFunction0800,                          // 5
    DemuxerFunction0900,                          // 6
    DemuxerFunction1000,                          // 7
    DemuxerFunction1100,                          // 8
    DemuxerFunction1200,                          // 9
    DemuxerFunction1300,                          // 10
    DemuxerFunction1400,                          // 11
    DemuxerFunction1500,                          // 12
    DemuxerFunction1600,                          // 13
    DemuxerFunction1700,                          // 14
    DemuxerFunction1800,                          // 15
    DemuxerFunction1900,                          // 16
    DemuxerFunction2000,                          // 17
    DemuxerFunction2100,                          // 18
    DemuxerFunction2200,                          // 19 - 异步执行
    DemuxerFunction2300,                          // 20 - 异步执行
    DemuxerFunction2400,                          // 21
    DemuxerFunction3100,                          // 22
    DemuxerFunction3200,                          // 23
    DemuxerFunction3300,                          // 24
    DemuxerFunction3400,                          // 25
    DemuxerFunction3500,                          // 26
    DemuxerFunction3600,                          // 27
    DemuxerFunction3700,                          // 28
    DemuxerFunction3800,                          // 29
    DemuxerFunction3900,                          // 30
    DemuxerFunction4000,                          // 31
    DemuxerFunction4100,                          // 32
    DemuxerFunction4200,                          // 33
    DemuxerFunction4300,                          // 34
    DemuxerFunction4400,                          // 35
    DemuxerFunction4500,                          // 36
    DemuxerFunction7000,                          // 37
    DemuxerFunction7100,                          // 38
    DemuxerFunction7200,                          // 39
    DemuxerFunction7300,                          // 40
    DemuxerFunction7400,                          // 41
    DemuxerFunction7500,                          // 42
    DemuxerFunction7600,                          // 43
    DemuxerFunction7700,                          // 44
    DemuxerFunction7800,                          // 45
    DemuxerFunction7900,                          // 46
    DemuxerFunction8000,                          // 47
    DemuxerFunction8100,                          // 48
    DemuxerFunction8200,                          // 49
    DemuxerFunction8300,                          // 50
    DemuxerFunction8400,                          // 51
    DemuxerFunction8500,                          // 52
    DemuxerFunction8600,                          // 53
    DemuxerFunction8700,                          // 54
    DemuxerFunction8800,                          // 55
    DemuxerFunction8900,                          // 56
    DemuxerFunction9000,                          // 57
    SubMediaDemuxerFunction0200,                  // 58
    SubMediaDemuxerFunction0300,                  // 59
    SubMediaDemuxerFunction1000,                  // 60
    SubMediaDemuxerFunction1100,                  // 61
    SubMediaDemuxerFunction1200,                  // 62
    SubMediaDemuxerFunction1300                   // 63
};

// 功能测试2函数映射表
static const std::vector<TestFunction> func2TestFunctions = {
    SubMediaDemuxerVtt6100,                       // 0
    DemuxerMeta0090,                              // 1
    DemuxerWavAlawFunc0001,                       // 2
    DemuxerWavAlawFunc0002,                       // 3
    DemuxerWavAlawFunc0003,                       // 4
    DemuxerWavAlawFunc0004,                       // 5
    DemuxerWavAlawFunc0005,                       // 6
    DemuxerWavAlawFunc0006,                       // 7
    DemuxerWavAlawFunc0007,                       // 8
    DemuxerWavAlawFunc0008,                       // 9
    DemuxerWavAlawFunc0009,                       // 10
    DemuxerWavAlawFunc0010,                       // 11
    DemuxerFunctionTrack0010,                     // 12
    DemuxerFunctionTrack0020,                     // 13
    DemuxerFunctionTrack0030,                     // 14
    DemuxerFunctionTrack0040,                     // 15
    DemuxerFunctionTrack0050,                     // 16
    DemuxerFunctionTrack0060,                     // 17
    DemuxerFunctionTrack0061,                     // 18
    DemuxerFunctionTrack0070,                     // 19
    DemuxerFunctionTrack0080,                     // 20
    DemuxerFunctionTrack0090,                     // 21
    DemuxerFunctionTrack0130,                     // 22
    DemuxerFunctionTrack0140,                     // 23
    DemuxerFunctionTrack0150,                     // 24
    DemuxerFunctionTrack0160,                     // 25
    DemuxerFunctionTrack0170,                     // 26
    DemuxerFunctionTrack0180,                     // 27
    DemuxerFunctionTrack0190,                     // 28
    DemuxerFunctionAudioTrack0010,                // 29
    DemuxerFunctionAudioTrack0020,                // 30
    DemuxerFunctionAudioTrack0030,                // 31
    DemuxerFunctionAudioTrack0040,                // 32
    DemuxerFunctionAudioTrack0050,                // 33
    DemuxerFunctionAudioTrack0060,                // 34
    DemuxerFunctionAudioTrack0061,                // 35
    DemuxerFunctionAudioTrack0070,                // 36
    DemuxerFunctionAudioTrack0080,                // 37
    DemuxerFunctionAudioTrack0090,                // 38
    DemuxerFunctionAudioTrack0130,                // 39
    DemuxerFunctionAudioTrack0140,                // 40
    DemuxerFunctionAudioTrack0150,                // 41
    DemuxerFunctionAudioTrack0160,                // 42
    DemuxerFunctionAudioTrack0170,                // 43
    DemuxerFunctionAudioTrack0180,                // 44
    DemuxerFunctionAudioTrack0190,                // 45
    DemuxerFunctionAdd0010,                       // 46
    DemuxerFunctionAdd0020,                       // 47
    DemuxerFunctionAdd0030                        // 48
};

// 流程测试函数映射表
static const std::vector<TestFunction> procTestFunctions = {
    SubMediaDemuxerProcess1400,                   // 0
    SubMediaDemuxerProcess1500,                   // 1
    SubMediaDemuxerProcess1600,                   // 2
    SubMediaDemuxerProcess1700,                   // 3
    SubMediaDemuxerProcess1800,                   // 4
    SubMediaDemuxerProcess1900,                   // 5
    SubMediaDemuxerProcess2000,                   // 6
    SubMediaDemuxerProcess2100,                   // 7
    SubMediaDemuxerProcess2200,                   // 8
    SubMediaDemuxerProcess2300,                   // 9
    SubMediaDemuxerProcess2400,                   // 10
    SubMediaDemuxerProcess2600,                   // 11
    SubMediaDemuxerProcess2700,                   // 12
    SubMediaDemuxerProcess2800,                   // 13
    SubMediaDemuxerProcess2900,                   // 14
    SubMediaDemuxerProcess3000,                   // 15
    SubMediaDemuxerProcess3100,                   // 16
    SubMediaDemuxerProcess3200,                   // 17
    SubMediaDemuxerProcess3300,                   // 18
    SubMediaDemuxerProcess3400,                   // 19
    SubMediaDemuxerProcess3800,                   // 20
    SubMediaDemuxerProcess3700,                   // 21
    SubMediaDemuxerProcess3600,                   // 22
    SubMediaDemuxerProcess3510,                   // 23
    SubMediaDemuxerProcess3500                    // 24
};

// ============================================
// 辅助函数
// ============================================

static napi_value createResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

// 异步执行上下文
struct AsyncTestContext {
    napi_env env;
    napi_async_work work;
    napi_deferred deferred;
    int testCase;
    int result;
};

// 异步执行函数 (在工作线程中执行)
static void executeAsyncTest(napi_env env, void* data)
{
    AsyncTestContext* context = static_cast<AsyncTestContext*>(data);

    // 使用函数映射表执行测试
    if (context->testCase >= 0 && context->testCase < static_cast<int>(funcTestFunctions.size())
        && funcTestFunctions[context->testCase] != nullptr) {
        context->result = funcTestFunctions[context->testCase]();
    } else {
        context->result = -1;
    }
}

// 异步完成回调 (在主线程中执行)
static void completeAsyncTest(napi_env env, napi_status status, void* data)
{
    AsyncTestContext* context = static_cast<AsyncTestContext*>(data);

    if (status != napi_ok) {
        napi_value error;
        napi_create_string_utf8(env, "Async test execution failed", NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, context->deferred, error);
    } else {
        // 清理资源
        CleanupResources();

        // 返回结果
        napi_value result;
        napi_create_int32(env, context->result, &result);
        napi_resolve_deferred(env, context->deferred, result);
    }

    // 清理异步工作
    napi_delete_async_work(env, context->work);
    delete context;
}

// ============================================
// NAPI 包装函数（按源文件拆分）
// ============================================

// API 测试 - 22 个测试用例
static napi_value runApiTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
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

    // 使用函数映射表执行测试
    int result = -1;
    if (testCase >= 0 && testCase < static_cast<int>(apiTestFunctions.size())
        && apiTestFunctions[testCase] != nullptr) {
        result = apiTestFunctions[testCase]();
    } else {
        napi_throw_type_error(env, nullptr, "Invalid test case number");
        CleanupResources();
        return createResultValue(env, -1);
    }

    CleanupResources();
    return createResultValue(env, result);
}

static int ValidateAsyncTestArgs(napi_env env, napi_callback_info info, int32_t &testCase)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        napi_throw_error(env, nullptr, "Invalid arguments");
        return -1;
    }
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return -1;
    }
    status = napi_get_value_int32(env, args[0], &testCase);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get test case number");
        return -1;
    }
    if (testCase != ASYNC_TEST_CASE_2200 && testCase != ASYNC_TEST_CASE_2300) {
        napi_throw_error(env, nullptr,
            "Only test case 19 (DEMUXER_FUNCTION_2200) and 20 (DEMUXER_FUNCTION_2300) are supported in async mode");
        return -1;
    }
    return 0;
}

static AsyncTestContext* CreateAsyncContext(napi_env env, napi_deferred deferred, int32_t testCase)
{
    AsyncTestContext* context = new AsyncTestContext();
    context->env = env;
    context->deferred = deferred;
    context->testCase = testCase;
    context->result = -1;
    return context;
}

static int CreateAndQueueAsyncWork(napi_env env, AsyncTestContext* context)
{
    napi_value resourceName;
    napi_create_string_utf8(env, "DemuxerAsyncTest", NAPI_AUTO_LENGTH, &resourceName);
    napi_status status = napi_create_async_work(env, nullptr, resourceName, executeAsyncTest,
                                                completeAsyncTest, context, &context->work);
    if (status != napi_ok) {
        delete context;
        napi_throw_error(env, nullptr, "Failed to create async work");
        return -1;
    }
    status = napi_queue_async_work(env, context->work);
    if (status != napi_ok) {
        napi_delete_async_work(env, context->work);
        delete context;
        napi_throw_error(env, nullptr, "Failed to queue async work");
        return -1;
    }
    return 0;
}

// 异步功能测试 (用于 2200 和 2300)
static napi_value runFuncTestAsync(napi_env env, napi_callback_info info)
{
    int32_t testCase = -1;
    if (ValidateAsyncTestArgs(env, info, testCase) != 0) {
        return nullptr;
    }
    napi_value promise;
    napi_deferred deferred;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }
    AsyncTestContext* context = CreateAsyncContext(env, deferred, testCase);
    if (CreateAndQueueAsyncWork(env, context) != 0) {
        return nullptr;
    }
    return promise;
}

// 功能测试 - 64 个测试用例（异步版本）
static napi_value runFuncTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        napi_value promise;
        napi_deferred deferred;
        napi_create_promise(env, &deferred, &promise);
        napi_value error;
        napi_create_string_utf8(env, "Invalid arguments", NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, deferred, error);
        return promise;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_value promise;
        napi_deferred deferred;
        napi_create_promise(env, &deferred, &promise);
        napi_value error;
        napi_create_string_utf8(env, "Argument must be a number", NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, deferred, error);
        return promise;
    }

    int32_t testCase = -1;
    status = napi_get_value_int32(env, args[0], &testCase);
    if (status != napi_ok || testCase < 0 || testCase >= static_cast<int>(funcTestFunctions.size()) ||
        funcTestFunctions[testCase] == nullptr) {
        napi_value promise;
        napi_deferred deferred;
        napi_create_promise(env, &deferred, &promise);
        napi_value error;
        napi_create_string_utf8(env, "Invalid test case number", NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, deferred, error);
        return promise;
    }

    AsyncTestContext* context = new AsyncTestContext();
    context->env = env;
    context->testCase = testCase;
    context->result = -1;

    napi_value promise;
    napi_create_promise(env, &context->deferred, &promise);

    napi_value resourceName;
    napi_create_string_utf8(env, "FuncTestAsync", NAPI_AUTO_LENGTH, &resourceName);

    napi_create_async_work(env, nullptr, resourceName, executeAsyncTest, completeAsyncTest, context,
                           &context->work);
    napi_queue_async_work(env, context->work);

    return promise;
}

// 功能测试2 - 49 个测试用例
static napi_value runFunc2Test(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
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

    // 使用函数映射表执行测试
    int result = -1;
    if (testCase >= 0 && testCase < static_cast<int>(func2TestFunctions.size())
        && func2TestFunctions[testCase] != nullptr) {
        result = func2TestFunctions[testCase]();
    } else {
        napi_throw_type_error(env, nullptr, "Invalid test case number");
        CleanupResources();
        return createResultValue(env, -1);
    }

    CleanupResources();
    return createResultValue(env, result);
}

// 流程测试 - 25 个测试用例
static napi_value runProcTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
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

    // 使用函数映射表执行测试
    int result = -1;
    if (testCase >= 0 && testCase < static_cast<int>(procTestFunctions.size())
        && procTestFunctions[testCase] != nullptr) {
        result = procTestFunctions[testCase]();
    } else {
        napi_throw_type_error(env, nullptr, "Invalid test case number");
        CleanupResources();
        return createResultValue(env, -1);
    }

    CleanupResources();
    return createResultValue(env, result);
}

// ============================================
// 模块初始化
// ============================================

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "runApiTest", nullptr, runApiTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runFuncTest", nullptr, runFuncTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runFuncTestAsync", nullptr, runFuncTestAsync, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runFunc2Test", nullptr, runFunc2Test, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runProcTest", nullptr, runProcTest, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "demuxer_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
