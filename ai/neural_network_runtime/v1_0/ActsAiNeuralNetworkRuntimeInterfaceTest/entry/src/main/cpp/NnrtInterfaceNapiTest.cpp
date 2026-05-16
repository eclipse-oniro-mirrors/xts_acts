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

#include <cassert>
#include <cstdio>
#include <string>
#include "CompileTest.h"
#include "DeviceTest.h"
#include "ExecutorTest.h"
#include "MemoryTest.h"
#include "ModelTest.h"
#include "napi/native_api.h"

// 测试函数统一类型：返回 int，无参数
using TestFunction = int (*)();

// 异步工作数据结构
struct AsyncWorkData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int testCaseIndex = -1; // 测试用例索引
    int result = -1;        // 测试结果
};

// 测试函数注册表（静态数组）
static TestFunction g_testFunctions[] = {
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationCreate0100,             // 索引 0
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationCreate0200,             // 索引 1
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetDevice0100,          // 索引 2
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetDevice0200,          // 索引 3
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetCache0100,           // 索引 4
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetCache0200,           // 索引 5
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPerformanceMode0100, // 索引 6
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPriority0100,        // 索引 7
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationEnableFloat160100,      // 索引 8
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationBuild0100,              // 索引 9
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationBuild0200,              // 索引 10
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationDestroy0100,            // 索引 11
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationDestroy0200,            // 索引 12
    // Device 测试系列
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceId0100,   // 索引 13
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceId0200,   // 索引 14
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceId0300,   // 索引 15
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceId0400,   // 索引 16
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceName0100, // 索引 17
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceName0200, // 索引 18
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceName0300, // 索引 19
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceName0400, // 索引 20
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceType0100, // 索引 21
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceType0200, // 索引 22
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthDeviceDeviceType0300, // 索引 23
    // Executor 测试系列
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthExecutorCreate0100,   // 索引 24
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthExecutorCreate0200,   // 索引 25
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthExecutorSetInput0100, // 索引 26
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthExecutorRun0100,      // 索引 27
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthExecutorDestroy0100,  // 索引 28
    // Memory 测试系列
    // CreateInputMemory 系列
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthExecutorMemoryCreateInputMemory0100, // 索引 29
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthExecutorMemoryCreateInputMemory0200, // 索引 30
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthExecutorMemoryCreateInputMemory0300, // 索引 31
    // CreateOutputMemory 系列
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthExecutorMemoryCreateOutputMemory0100, // 索引 32
    // DestroyInputMemory 系列
    // DestroyOutputMemory 系列
    // SetInputFromMemory 系列
    // SetOutputFromMemory 系列
    // Run 系列
    // Model 测试系列
    // CreateModel 系列
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthModelCreateModel0100, // 索引 33
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthModelCreateModel0200, // 索引 34
    // AddOperand 系列
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthModelAddOperand0100, // 索引 35
    // SetOperandValue 系列
    // AddOperation 系列
    // SpecifyInputsAndOutputs 系列
    // Finish 系列
    // Destroy 系列
    // GetSupportedOperation 系列
    // Combine 系列
    // ========== 新增 Compilation 测试（补充） ==========
    // EnableFloat16 补充测试
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationEnableFloat160200, // 索引 36
    // SetCache 补充测试
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetCache0500, // 索引 37
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetCache0600, // 索引 38
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetCache0700, // 索引 39
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetCache0800, // 索引 40
    // SetPerformanceMode 补充测试
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPerformanceMode0300, // 索引 41
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPerformanceMode0400, // 索引 42
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPerformanceMode0500, // 索引 43
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPerformanceMode0600, // 索引 44
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPerformanceMode0700, // 索引 45
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPerformanceMode0800, // 索引 46
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPerformanceMode0900, // 索引 47
    // SetPriority 补充测试
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPriority0300, // 索引 48
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPriority0400, // 索引 49
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPriority0500, // 索引 50
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPriority0600, // 索引 51
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPriority0700, // 索引 52
    OHOS::NeuralNetworkRuntime::SubAiNnRtFuncNorthCompilationSetPriority0800, // 索引 53
    // 后续添加新测试函数在此处追加即可
};

// 自动计算测试用例总数
static const int G_TEST_FUNCTION_COUNT = static_cast<int>(sizeof(g_testFunctions) / sizeof(g_testFunctions[0]));
// 异步执行函数（在工作线程中执行）
static void ExecuteAsyncWork(napi_env env, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);

    // 验证测试用例索引有效性
    if (workData->testCaseIndex >= 0 && workData->testCaseIndex < G_TEST_FUNCTION_COUNT) {
        // 在工作线程中执行测试函数
        workData->result = g_testFunctions[workData->testCaseIndex]();
    } else {
        workData->result = -1;
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

/**
| * 创建结果值的辅助函数
| * @param env NAPI环境
| * @param success 是否成功
| * @return napi_value 返回0表示成功，-1表示失败
| */
static napi_value createResultValue(napi_env env, bool success)
{
    napi_value result;
    napi_create_int32(env, success ? 0 : -1, &result);
    return result;
}

/**
| * 辅助函数：验证参数并获取测试用例编号
| * @param env NAPI环境
| * @param info 回调信息
| * @param caseNum 输出参数，存储获取到的测试用例编号
| * @return bool 验证成功返回true，失败返回false（并抛出异常）
| */
static bool ValidateAndGetCaseNumber(napi_env env, napi_callback_info info, int32_t* caseNum)
{
    // 1. 获取参数
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "NAPI call failed");
        return false;
    }

    // 2. 验证参数类型
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return false;
    }

    // 3. 获取测试用例编号
    status = napi_get_value_int32(env, args[0], caseNum);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to get case number");
        return false;
    }

    // 4. 验证范围
    if (*caseNum < 0 || *caseNum >= G_TEST_FUNCTION_COUNT) {
        std::string errorMsg = "The range of case must be 0 to " + std::to_string(G_TEST_FUNCTION_COUNT - 1);
        napi_throw_type_error(env, nullptr, errorMsg.c_str());
        return false;
    }

    return true;
}

/**
| * 辅助函数：创建并加入异步工作队列
| * @param env NAPI环境
| * @param deferred Promise的deferred对象
| * @param caseNum 测试用例编号
| * @return bool 创建成功返回true，失败返回false（并抛出异常）
| */
static bool CreateAsyncWorkForTest(napi_env env, napi_deferred deferred, int32_t caseNum)
{
    // 1. 创建异步工作数据
    AsyncWorkData* workData = new AsyncWorkData();
    workData->deferred = deferred;
    workData->testCaseIndex = caseNum;

    // 2. 创建异步工作
    napi_value resourceName;
    napi_create_string_utf8(env, "NNRtInterfaceTest", NAPI_AUTO_LENGTH, &resourceName);

    napi_status status = napi_create_async_work(
        env, nullptr, resourceName, ExecuteAsyncWork, CompleteAsyncWork, workData, &workData->asyncWork);
    if (status != napi_ok) {
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create async work");
        return false;
    }

    // 3. 加入异步队列
    status = napi_queue_async_work(env, workData->asyncWork);
    if (status != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        napi_throw_error(env, nullptr, "Failed to queue async work");
        return false;
    }

    return true;
}

/**
| * 统一的NNRT接口测试函数（异步版本）
| * @param env NAPI环境
| * @param info 回调信息
| * @return napi_value Promise对象，成功返回0，失败返回-1
| */
static napi_value nnrtInterfaceTest(napi_env env, napi_callback_info info)
{
    // 1. 验证参数并获取测试用例编号
    int32_t caseNum = -1;
    if (!ValidateAndGetCaseNumber(env, info, &caseNum)) {
        return nullptr;
    }

    // 2. 创建 Promise
    napi_value promise;
    napi_deferred deferred;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    // 3. 创建并加入异步工作队列
    if (!CreateAsyncWorkForTest(env, deferred, caseNum)) {
        return nullptr;
    }

    return promise;
}

/**
| * NAPI模块初始化
| */
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "nnrtInterfaceTest", nullptr, nnrtInterfaceTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

/**
| * 模块注册
| * nm_modname必须与ETS中import的模块名一致
| */
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "ai_nnrt_interface_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

/**
| * 模块注册入口
| */
extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
