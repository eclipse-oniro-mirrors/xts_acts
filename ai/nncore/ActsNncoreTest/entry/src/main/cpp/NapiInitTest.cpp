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

#include <string>
#include "HdiCompilationTest.h"
#include "HdiExecutorTest.h"
#include "HdiModelTest.h"
#include "HdiTensorDescTest.h"
#include "HdiTensorTest.h"
#include "hilog/log.h"
#include "napi/native_api.h"

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
    int (*testFunc)() = nullptr; // 函数指针
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

// 辅助函数：创建并队列化异步工作
static napi_value createAsyncTest(napi_env env, const char* testName, int (*testFunc)())
{
    napi_value promise;
    napi_deferred deferred;
    if (napi_create_promise(env, &deferred, &promise) != napi_ok) {
        return createResultValue(env, -1);
    }
    AsyncWorkData* workData = new AsyncWorkData();
    workData->deferred = deferred;
    workData->testFunc = testFunc;
    napi_value resourceName;
    napi_create_string_utf8(env, testName, NAPI_AUTO_LENGTH, &resourceName);
    if (napi_create_async_work(env,
                               nullptr,
                               resourceName,
                               executeAsyncWork,
                               completeAsyncWork,
                               workData,
                               &workData->asyncWork) != napi_ok ||
        napi_queue_async_work(env, workData->asyncWork) != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        return createResultValue(env, -1);
    }
    return promise;
}

// 内联函数：生成异步测试的 NAPI 包装函数
static inline napi_value generateAsyncTestFunction(napi_env env, napi_callback_info info,
                                                   const char* testName, int (*testFunc)())
{
    return createAsyncTest(env, testName, testFunc);
}

// 内联函数：生成同步测试的 NAPI 包装函数
static inline napi_value generateSyncTestFunction(napi_env env, napi_callback_info info, int (*testFunc)())
{
    int testResult = testFunc();
    return createResultValue(env, testResult);
}

// ==================== Compilation Tests ====================
// 耗时测试（异步）
static napi_value TestCompilationConstructForCache0100(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationConstructForCache0100",
                                     OHOS::NeuralNetworkCore::TestCompilationConstructForCache0100);
}
static napi_value TestCompilationConstructForCache0200(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationConstructForCache0200",
                                     OHOS::NeuralNetworkCore::TestCompilationConstructForCache0200);
}
static napi_value TestCompilationAddExtensionConfig0100(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationAddExtensionConfig0100",
                                     OHOS::NeuralNetworkCore::TestCompilationAddExtensionConfig0100);
}
static napi_value TestCompilationAddExtensionConfig0200(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationAddExtensionConfig0200",
                                     OHOS::NeuralNetworkCore::TestCompilationAddExtensionConfig0200);
}
static napi_value TestCompilationAddExtensionConfig0300(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationAddExtensionConfig0300",
                                     OHOS::NeuralNetworkCore::TestCompilationAddExtensionConfig0300);
}
static napi_value TestCompilationAddExtensionConfig0400(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationAddExtensionConfig0400",
                                     OHOS::NeuralNetworkCore::TestCompilationAddExtensionConfig0400);
}
static napi_value TestCompilationAddExtensionConfig0500(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationAddExtensionConfig0500",
                                     OHOS::NeuralNetworkCore::TestCompilationAddExtensionConfig0500);
}
static napi_value TestCompilationConstructWithOfflineModelFile0100(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env,
        info,
        "TestCompilationConstructWithOfflineModelFile0100",
        OHOS::NeuralNetworkCore::TestCompilationConstructWithOfflineModelFile0100);
}
static napi_value TestCompilationConstructWithOfflineModelFile0200(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env,
        info,
        "TestCompilationConstructWithOfflineModelFile0200",
        OHOS::NeuralNetworkCore::TestCompilationConstructWithOfflineModelFile0200);
}
static napi_value TestCompilationConstructWithOfflineModelBuffer0100(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env,
        info,
        "TestCompilationConstructWithOfflineModelBuffer0100",
        OHOS::NeuralNetworkCore::TestCompilationConstructWithOfflineModelBuffer0100);
}
static napi_value TestCompilationConstructWithOfflineModelBuffer0200(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env,
        info,
        "TestCompilationConstructWithOfflineModelBuffer0200",
        OHOS::NeuralNetworkCore::TestCompilationConstructWithOfflineModelBuffer0200);
}
static napi_value TestCompilationExportCacheToBuffer0100(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationExportCacheToBuffer0100",
                                     OHOS::NeuralNetworkCore::TestCompilationExportCacheToBuffer0100);
}
static napi_value TestCompilationExportCacheToBuffer0200(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationExportCacheToBuffer0200",
                                     OHOS::NeuralNetworkCore::TestCompilationExportCacheToBuffer0200);
}
static napi_value TestCompilationImportCacheFromBuffer0100(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationImportCacheFromBuffer0100",
                                     OHOS::NeuralNetworkCore::TestCompilationImportCacheFromBuffer0100);
}
static napi_value TestCompilationImportCacheFromBuffer0200(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationImportCacheFromBuffer0200",
                                     OHOS::NeuralNetworkCore::TestCompilationImportCacheFromBuffer0200);
}
static napi_value TestCompilationImportCacheFromBuffer0300(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestCompilationImportCacheFromBuffer0300",
                                     OHOS::NeuralNetworkCore::TestCompilationImportCacheFromBuffer0300);
}

// 快速测试（同步）- 返回码检查
static napi_value TestCompilationReturnCodeCheck0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestCompilationReturnCodeCheck0100);
}
static napi_value TestCompilationReturnCodeCheck0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestCompilationReturnCodeCheck0200);
}
static napi_value TestCompilationReturnCodeCheck0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestCompilationReturnCodeCheck0300);
}
static napi_value TestCompilationReturnCodeCheck0400(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestCompilationReturnCodeCheck0400);
}
static napi_value TestCompilationReturnCodeCheck0500(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestCompilationReturnCodeCheck0500);
}
static napi_value TestCompilationReturnCodeCheck0600(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestCompilationReturnCodeCheck0600);
}
static napi_value TestCompilationReturnCodeCheck0700(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestCompilationReturnCodeCheck0700);
}
static napi_value TestCompilationReturnCodeCheck0800(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestCompilationReturnCodeCheck0800);
}
static napi_value TestCompilationReturnCodeCheck0900(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestCompilationReturnCodeCheck0900);
}

// ==================== Executor Tests ====================
// 耗时测试（异步）
static napi_value TestExecutorConstruct0100(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorConstruct0100", OHOS::NeuralNetworkCore::TestExecutorConstruct0100);
}
static napi_value TestExecutorRunSync0100(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunSync0100", OHOS::NeuralNetworkCore::TestExecutorRunSync0100);
}
static napi_value TestExecutorRunSync0200(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunSync0200", OHOS::NeuralNetworkCore::TestExecutorRunSync0200);
}
static napi_value TestExecutorRunSync0300(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunSync0300", OHOS::NeuralNetworkCore::TestExecutorRunSync0300);
}
static napi_value TestExecutorRunSync0400(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunSync0400", OHOS::NeuralNetworkCore::TestExecutorRunSync0400);
}
static napi_value TestExecutorRunSync0500(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunSync0500", OHOS::NeuralNetworkCore::TestExecutorRunSync0500);
}
static napi_value TestExecutorRunSync0600(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunSync0600", OHOS::NeuralNetworkCore::TestExecutorRunSync0600);
}
static napi_value TestExecutorRunSync0700(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunSync0700", OHOS::NeuralNetworkCore::TestExecutorRunSync0700);
}
static napi_value TestExecutorRunSync0800(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunSync0800", OHOS::NeuralNetworkCore::TestExecutorRunSync0800);
}
static napi_value TestExecutorRunSync0900(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunSync0900", OHOS::NeuralNetworkCore::TestExecutorRunSync0900);
}
static napi_value TestExecutorRunAsync0100(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunAsync0100", OHOS::NeuralNetworkCore::TestExecutorRunAsync0100);
}
static napi_value TestExecutorRunAsync0200(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunAsync0200", OHOS::NeuralNetworkCore::TestExecutorRunAsync0200);
}
static napi_value TestExecutorRunAsync0300(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunAsync0300", OHOS::NeuralNetworkCore::TestExecutorRunAsync0300);
}
static napi_value TestExecutorRunAsync0400(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunAsync0400", OHOS::NeuralNetworkCore::TestExecutorRunAsync0400);
}
static napi_value TestExecutorRunAsync0500(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunAsync0500", OHOS::NeuralNetworkCore::TestExecutorRunAsync0500);
}
static napi_value TestExecutorRunAsync0600(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorRunAsync0600", OHOS::NeuralNetworkCore::TestExecutorRunAsync0600);
}
static napi_value TestExecutorGetOutputShape0300(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(
        env, info, "TestExecutorGetOutputShape0300", OHOS::NeuralNetworkCore::TestExecutorGetOutputShape0300);
}

// 快速测试（同步）
static napi_value TestExecutorDestroy0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorDestroy0100);
}
static napi_value TestExecutorDestroy0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorDestroy0200);
}
static napi_value TestExecutorSetOnRunDone0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorSetOnRunDone0100);
}
static napi_value TestExecutorSetOnRunDone0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorSetOnRunDone0200);
}
static napi_value TestExecutorSetOnServiceDied0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorSetOnServiceDied0100);
}
static napi_value TestExecutorSetOnServiceDied0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorSetOnServiceDied0200);
}
static napi_value TestExecutorGetOutputShape0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetOutputShape0100);
}
static napi_value TestExecutorGetOutputShape0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetOutputShape0200);
}
static napi_value TestExecutorGetInputCount0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetInputCount0100);
}
static napi_value TestExecutorGetInputCount0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetInputCount0200);
}
static napi_value TestExecutorGetInputCount0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetInputCount0300);
}
static napi_value TestExecutorGetOutputCount0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetOutputCount0100);
}
static napi_value TestExecutorGetOutputCount0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetOutputCount0200);
}
static napi_value TestExecutorGetOutputCount0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetOutputCount0300);
}
static napi_value TestExecutorCreateInputTensorDesc0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(
        env, info, OHOS::NeuralNetworkCore::TestExecutorCreateInputTensorDesc0100);
}
static napi_value TestExecutorCreateInputTensorDesc0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(
        env, info, OHOS::NeuralNetworkCore::TestExecutorCreateInputTensorDesc0200);
}
static napi_value TestExecutorCreateInputTensorDesc0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(
        env, info, OHOS::NeuralNetworkCore::TestExecutorCreateInputTensorDesc0300);
}
static napi_value TestExecutorCreateOutputTensorDesc0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(
        env, info, OHOS::NeuralNetworkCore::TestExecutorCreateOutputTensorDesc0100);
}
static napi_value TestExecutorCreateOutputTensorDesc0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(
        env, info, OHOS::NeuralNetworkCore::TestExecutorCreateOutputTensorDesc0200);
}
static napi_value TestExecutorCreateOutputTensorDesc0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(
        env, info, OHOS::NeuralNetworkCore::TestExecutorCreateOutputTensorDesc0300);
}
static napi_value TestExecutorGetInputDimRange0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetInputDimRange0100);
}
static napi_value TestExecutorGetInputDimRange0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestExecutorGetInputDimRange0200);
}
static napi_value TestExecutorGetInputDimRange0500(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestExecutorGetInputDimRange0500",
                                     OHOS::NeuralNetworkCore::TestExecutorGetInputDimRange0500);
}
static napi_value TestExecutorGetInputDimRange0600(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestExecutorGetInputDimRange0600",
                                     OHOS::NeuralNetworkCore::TestExecutorGetInputDimRange0600);
}
static napi_value TestExecutorGetInputDimRange0700(napi_env env, napi_callback_info info)
{
    return generateAsyncTestFunction(env,
                                     info,
                                     "TestExecutorGetInputDimRange0700",
                                     OHOS::NeuralNetworkCore::TestExecutorGetInputDimRange0700);
}

// ==================== Model Tests (全部同步) ====================
static napi_value TestModelCreateQuantParam0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelCreateQuantParam0100);
}
static napi_value TestModelDestroyQuantParam0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelDestroyQuantParam0100);
}
static napi_value TestModelDestroyQuantParam0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelDestroyQuantParam0200);
}
static napi_value TestModelSetQuantParam0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetQuantParam0100);
}
static napi_value TestModelSetQuantParam0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetQuantParam0200);
}
static napi_value TestModelSetQuantParam0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetQuantParam0300);
}
static napi_value TestModelSetQuantParam0400(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetQuantParam0400);
}
static napi_value TestModelSetQuantParam0500(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetQuantParam0500);
}
static napi_value TestModelSetQuantParam0600(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetQuantParam0600);
}
static napi_value TestModelSetQuantParam0700(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetQuantParam0700);
}
static napi_value TestModelSetQuantParam0800(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetQuantParam0800);
}
static napi_value TestModelSetQuantParam0900(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetQuantParam0900);
}
static napi_value TestModelAddTensorToModel0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelAddTensorToModel0100);
}
static napi_value TestModelAddTensorToModel0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelAddTensorToModel0200);
}
static napi_value TestModelSetTensorData0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetTensorData0100);
}
static napi_value TestModelSetTensorData0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetTensorData0200);
}
static napi_value TestModelSetTensorData0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetTensorData0300);
}
static napi_value TestModelSetTensorData0400(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetTensorData0400);
}
static napi_value TestModelSetTensorType0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetTensorType0100);
}
static napi_value TestModelSetTensorType0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetTensorType0200);
}
static napi_value TestModelSetTensorType0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestModelSetTensorType0300);
}

// ==================== TensorDesc Tests (全部同步) ====================
static napi_value TestTensorDescCreate0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescCreate0100);
}
static napi_value TestTensorDescDestroy0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescDestroy0100);
}
static napi_value TestTensorDescDestroy0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescDestroy0200);
}
static napi_value TestTensorDescDestroy0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescDestroy0300);
}
static napi_value TestTensorDescSetDataType0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescSetDataType0100);
}
static napi_value TestTensorDescSetDataType0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescSetDataType0200);
}
static napi_value TestTensorDescSetDataType0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescSetDataType0300);
}
static napi_value TestTensorDescGetDataType0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetDataType0100);
}
static napi_value TestTensorDescGetDataType0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetDataType0200);
}
static napi_value TestTensorDescSetShape0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescSetShape0100);
}
static napi_value TestTensorDescSetShape0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescSetShape0200);
}
static napi_value TestTensorDescGetShape0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetShape0100);
}
static napi_value TestTensorDescGetShape0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetShape0200);
}
static napi_value TestTensorDescGetShape0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetShape0300);
}
static napi_value TestTensorDescSetFormat0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescSetFormat0100);
}
static napi_value TestTensorDescSetFormat0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescSetFormat0200);
}
static napi_value TestTensorDescGetFormat0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetFormat0100);
}
static napi_value TestTensorDescGetFormat0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetFormat0200);
}
static napi_value TestTensorDescGetFormat0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetFormat0300);
}
static napi_value TestTensorDescGetElementCount0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetElementCount0100);
}
static napi_value TestTensorDescGetElementCount0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetElementCount0200);
}
static napi_value TestTensorDescGetElementCount0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetElementCount0300);
}
static napi_value TestTensorDescGetByteSize0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetByteSize0100);
}
static napi_value TestTensorDescGetByteSize0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetByteSize0200);
}
static napi_value TestTensorDescGetByteSize0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetByteSize0300);
}
static napi_value TestTensorDescSetName0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescSetName0100);
}
static napi_value TestTensorDescSetName0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescSetName0200);
}
static napi_value TestTensorDescGetName0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetName0100);
}
static napi_value TestTensorDescGetName0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetName0200);
}
static napi_value TestTensorDescGetName0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDescGetName0300);
}

// ==================== Tensor Tests (全部同步) ====================
static napi_value TestTensorCreate0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreate0100);
}
static napi_value TestTensorCreate0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreate0200);
}
static napi_value TestTensorCreate0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreate0300);
}
static napi_value TestTensorCreateWithSize0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreateWithSize0100);
}
static napi_value TestTensorCreateWithSize0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreateWithSize0200);
}
static napi_value TestTensorCreateWithSize0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreateWithSize0300);
}
static napi_value TestTensorCreateWithFd0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreateWithFd0100);
}
static napi_value TestTensorCreateWithFd0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreateWithFd0200);
}
static napi_value TestTensorCreateWithFd0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreateWithFd0300);
}
static napi_value TestTensorCreateWithFd0400(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreateWithFd0400);
}
static napi_value TestTensorCreateWithFd0500(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorCreateWithFd0500);
}
static napi_value TestTensorGetDataBuffer0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetDataBuffer0100);
}
static napi_value TestTensorGetDataBuffer0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetDataBuffer0200);
}
static napi_value TestTensorDestroy0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDestroy0100);
}
static napi_value TestTensorDestroy0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorDestroy0200);
}
static napi_value TestTensorGetTensorDesc0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetTensorDesc0100);
}
static napi_value TestTensorGetTensorDesc0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetTensorDesc0200);
}
static napi_value TestTensorGetSize0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetSize0100);
}
static napi_value TestTensorGetSize0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetSize0200);
}
static napi_value TestTensorGetSize0300(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetSize0300);
}
static napi_value TestTensorGetFd0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetFd0100);
}
static napi_value TestTensorGetFd0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetFd0200);
}
static napi_value TestTensorGetOffset0100(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetOffset0100);
}
static napi_value TestTensorGetOffset0200(napi_env env, napi_callback_info info)
{
    return generateSyncTestFunction(env, info, OHOS::NeuralNetworkCore::TestTensorGetOffset0200);
}

// 辅助函数：添加单个测试描述符
static inline void addTestDescriptor(std::vector<napi_property_descriptor>& descriptors,
                                     const char* name,
                                     napi_callback callback)
{
    descriptors.push_back({ name, nullptr, callback, nullptr, nullptr, nullptr, napi_default, nullptr });
}

static void RegisterCompilationBasicTests(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(
        descriptors, "TestCompilationConstructForCache0100", TestCompilationConstructForCache0100);
    addTestDescriptor(
        descriptors, "TestCompilationConstructForCache0200", TestCompilationConstructForCache0200);
    addTestDescriptor(
        descriptors, "TestCompilationAddExtensionConfig0100", TestCompilationAddExtensionConfig0100);
    addTestDescriptor(
        descriptors, "TestCompilationAddExtensionConfig0200", TestCompilationAddExtensionConfig0200);
    addTestDescriptor(
        descriptors, "TestCompilationAddExtensionConfig0300", TestCompilationAddExtensionConfig0300);
    addTestDescriptor(
        descriptors, "TestCompilationAddExtensionConfig0400", TestCompilationAddExtensionConfig0400);
    addTestDescriptor(
        descriptors, "TestCompilationAddExtensionConfig0500", TestCompilationAddExtensionConfig0500);
    addTestDescriptor(descriptors,
                      "TestCompilationConstructWithOfflineModelFile0100",
                      TestCompilationConstructWithOfflineModelFile0100);
    addTestDescriptor(descriptors,
                      "TestCompilationConstructWithOfflineModelFile0200",
                      TestCompilationConstructWithOfflineModelFile0200);
    addTestDescriptor(descriptors,
                      "TestCompilationConstructWithOfflineModelBuffer0100",
                      TestCompilationConstructWithOfflineModelBuffer0100);
    addTestDescriptor(descriptors,
                      "TestCompilationConstructWithOfflineModelBuffer0200",
                      TestCompilationConstructWithOfflineModelBuffer0200);
    addTestDescriptor(
        descriptors, "TestCompilationExportCacheToBuffer0100", TestCompilationExportCacheToBuffer0100);
    addTestDescriptor(
        descriptors, "TestCompilationExportCacheToBuffer0200", TestCompilationExportCacheToBuffer0200);
    addTestDescriptor(
        descriptors, "TestCompilationImportCacheFromBuffer0100", TestCompilationImportCacheFromBuffer0100);
    addTestDescriptor(
        descriptors, "TestCompilationImportCacheFromBuffer0200", TestCompilationImportCacheFromBuffer0200);
    addTestDescriptor(
        descriptors, "TestCompilationImportCacheFromBuffer0300", TestCompilationImportCacheFromBuffer0300);
}

static void RegisterCompilationReturnCodeTests(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(descriptors, "TestCompilationReturnCodeCheck0100", TestCompilationReturnCodeCheck0100);
    addTestDescriptor(descriptors, "TestCompilationReturnCodeCheck0200", TestCompilationReturnCodeCheck0200);
    addTestDescriptor(descriptors, "TestCompilationReturnCodeCheck0300", TestCompilationReturnCodeCheck0300);
    addTestDescriptor(descriptors, "TestCompilationReturnCodeCheck0400", TestCompilationReturnCodeCheck0400);
    addTestDescriptor(descriptors, "TestCompilationReturnCodeCheck0500", TestCompilationReturnCodeCheck0500);
    addTestDescriptor(descriptors, "TestCompilationReturnCodeCheck0600", TestCompilationReturnCodeCheck0600);
    addTestDescriptor(descriptors, "TestCompilationReturnCodeCheck0700", TestCompilationReturnCodeCheck0700);
    addTestDescriptor(descriptors, "TestCompilationReturnCodeCheck0800", TestCompilationReturnCodeCheck0800);
    addTestDescriptor(descriptors, "TestCompilationReturnCodeCheck0900", TestCompilationReturnCodeCheck0900);
}

static void RegisterExecutorBasicTests(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(descriptors, "TestExecutorConstruct0100", TestExecutorConstruct0100);
    addTestDescriptor(descriptors, "TestExecutorDestroy0100", TestExecutorDestroy0100);
    addTestDescriptor(descriptors, "TestExecutorDestroy0200", TestExecutorDestroy0200);
    addTestDescriptor(descriptors, "TestExecutorSetOnRunDone0100", TestExecutorSetOnRunDone0100);
    addTestDescriptor(descriptors, "TestExecutorSetOnRunDone0200", TestExecutorSetOnRunDone0200);
    addTestDescriptor(descriptors, "TestExecutorSetOnServiceDied0100", TestExecutorSetOnServiceDied0100);
    addTestDescriptor(descriptors, "TestExecutorSetOnServiceDied0200", TestExecutorSetOnServiceDied0200);
    addTestDescriptor(descriptors, "TestExecutorRunSync0100", TestExecutorRunSync0100);
    addTestDescriptor(descriptors, "TestExecutorRunSync0200", TestExecutorRunSync0200);
    addTestDescriptor(descriptors, "TestExecutorRunSync0300", TestExecutorRunSync0300);
    addTestDescriptor(descriptors, "TestExecutorRunSync0400", TestExecutorRunSync0400);
    addTestDescriptor(descriptors, "TestExecutorRunSync0500", TestExecutorRunSync0500);
    addTestDescriptor(descriptors, "TestExecutorRunSync0600", TestExecutorRunSync0600);
    addTestDescriptor(descriptors, "TestExecutorRunSync0700", TestExecutorRunSync0700);
    addTestDescriptor(descriptors, "TestExecutorRunSync0800", TestExecutorRunSync0800);
    addTestDescriptor(descriptors, "TestExecutorRunSync0900", TestExecutorRunSync0900);
    addTestDescriptor(descriptors, "TestExecutorRunAsync0100", TestExecutorRunAsync0100);
    addTestDescriptor(descriptors, "TestExecutorRunAsync0200", TestExecutorRunAsync0200);
    addTestDescriptor(descriptors, "TestExecutorRunAsync0300", TestExecutorRunAsync0300);
    addTestDescriptor(descriptors, "TestExecutorRunAsync0400", TestExecutorRunAsync0400);
    addTestDescriptor(descriptors, "TestExecutorRunAsync0500", TestExecutorRunAsync0500);
}

static void RegisterExecutorAdvancedTests(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(descriptors, "TestExecutorGetOutputShape0100", TestExecutorGetOutputShape0100);
    addTestDescriptor(descriptors, "TestExecutorGetOutputShape0200", TestExecutorGetOutputShape0200);
    addTestDescriptor(descriptors, "TestExecutorGetOutputShape0300", TestExecutorGetOutputShape0300);
    addTestDescriptor(descriptors, "TestExecutorGetInputCount0100", TestExecutorGetInputCount0100);
    addTestDescriptor(descriptors, "TestExecutorGetInputCount0200", TestExecutorGetInputCount0200);
    addTestDescriptor(descriptors, "TestExecutorGetInputCount0300", TestExecutorGetInputCount0300);
    addTestDescriptor(descriptors, "TestExecutorGetOutputCount0100", TestExecutorGetOutputCount0100);
    addTestDescriptor(descriptors, "TestExecutorGetOutputCount0200", TestExecutorGetOutputCount0200);
    addTestDescriptor(descriptors, "TestExecutorGetOutputCount0300", TestExecutorGetOutputCount0300);
    addTestDescriptor(
        descriptors, "TestExecutorCreateInputTensorDesc0100", TestExecutorCreateInputTensorDesc0100);
    addTestDescriptor(
        descriptors, "TestExecutorCreateInputTensorDesc0200", TestExecutorCreateInputTensorDesc0200);
    addTestDescriptor(
        descriptors, "TestExecutorCreateInputTensorDesc0300", TestExecutorCreateInputTensorDesc0300);
    addTestDescriptor(
        descriptors, "TestExecutorCreateOutputTensorDesc0100", TestExecutorCreateOutputTensorDesc0100);
    addTestDescriptor(
        descriptors, "TestExecutorCreateOutputTensorDesc0200", TestExecutorCreateOutputTensorDesc0200);
    addTestDescriptor(
        descriptors, "TestExecutorCreateOutputTensorDesc0300", TestExecutorCreateOutputTensorDesc0300);
    addTestDescriptor(descriptors, "TestExecutorGetInputDimRange0100", TestExecutorGetInputDimRange0100);
    addTestDescriptor(descriptors, "TestExecutorGetInputDimRange0200", TestExecutorGetInputDimRange0200);
    addTestDescriptor(descriptors, "TestExecutorGetInputDimRange0500", TestExecutorGetInputDimRange0500);
    addTestDescriptor(descriptors, "TestExecutorGetInputDimRange0600", TestExecutorGetInputDimRange0600);
}

static void RegisterModelTests(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(descriptors, "TestModelCreateQuantParam0100", TestModelCreateQuantParam0100);
    addTestDescriptor(descriptors, "TestModelDestroyQuantParam0100", TestModelDestroyQuantParam0100);
    addTestDescriptor(descriptors, "TestModelDestroyQuantParam0200", TestModelDestroyQuantParam0200);
    addTestDescriptor(descriptors, "TestModelSetQuantParam0100", TestModelSetQuantParam0100);
    addTestDescriptor(descriptors, "TestModelSetQuantParam0200", TestModelSetQuantParam0200);
    addTestDescriptor(descriptors, "TestModelSetQuantParam0300", TestModelSetQuantParam0300);
    addTestDescriptor(descriptors, "TestModelSetQuantParam0400", TestModelSetQuantParam0400);
    addTestDescriptor(descriptors, "TestModelSetQuantParam0500", TestModelSetQuantParam0500);
    addTestDescriptor(descriptors, "TestModelSetQuantParam0600", TestModelSetQuantParam0600);
    addTestDescriptor(descriptors, "TestModelSetQuantParam0700", TestModelSetQuantParam0700);
    addTestDescriptor(descriptors, "TestModelSetQuantParam0800", TestModelSetQuantParam0800);
    addTestDescriptor(descriptors, "TestModelSetQuantParam0900", TestModelSetQuantParam0900);
    addTestDescriptor(descriptors, "TestModelAddTensorToModel0100", TestModelAddTensorToModel0100);
    addTestDescriptor(descriptors, "TestModelAddTensorToModel0200", TestModelAddTensorToModel0200);
    addTestDescriptor(descriptors, "TestModelSetTensorData0100", TestModelSetTensorData0100);
    addTestDescriptor(descriptors, "TestModelSetTensorData0200", TestModelSetTensorData0200);
    addTestDescriptor(descriptors, "TestModelSetTensorData0300", TestModelSetTensorData0300);
    addTestDescriptor(descriptors, "TestModelSetTensorData0400", TestModelSetTensorData0400);
    addTestDescriptor(descriptors, "TestModelSetTensorType0100", TestModelSetTensorType0100);
    addTestDescriptor(descriptors, "TestModelSetTensorType0200", TestModelSetTensorType0200);
}

static void RegisterTensorDescTestsPart1(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(descriptors, "TestTensorDescCreate0100", TestTensorDescCreate0100);
    addTestDescriptor(descriptors, "TestTensorDescDestroy0100", TestTensorDescDestroy0100);
    addTestDescriptor(descriptors, "TestTensorDescDestroy0200", TestTensorDescDestroy0200);
    addTestDescriptor(descriptors, "TestTensorDescDestroy0300", TestTensorDescDestroy0300);
    addTestDescriptor(descriptors, "TestTensorDescSetDataType0100", TestTensorDescSetDataType0100);
    addTestDescriptor(descriptors, "TestTensorDescSetDataType0200", TestTensorDescSetDataType0200);
    addTestDescriptor(descriptors, "TestTensorDescSetDataType0300", TestTensorDescSetDataType0300);
    addTestDescriptor(descriptors, "TestTensorDescGetDataType0100", TestTensorDescGetDataType0100);
    addTestDescriptor(descriptors, "TestTensorDescGetDataType0200", TestTensorDescGetDataType0200);
}

static void RegisterTensorDescTestsPart2(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(descriptors, "TestTensorDescSetShape0200", TestTensorDescSetShape0200);
    addTestDescriptor(descriptors, "TestTensorDescGetShape0100", TestTensorDescGetShape0100);
    addTestDescriptor(descriptors, "TestTensorDescGetShape0200", TestTensorDescGetShape0200);
    addTestDescriptor(descriptors, "TestTensorDescGetShape0300", TestTensorDescGetShape0300);
    addTestDescriptor(descriptors, "TestTensorDescSetFormat0100", TestTensorDescSetFormat0100);
    addTestDescriptor(descriptors, "TestTensorDescSetFormat0200", TestTensorDescSetFormat0200);
    addTestDescriptor(descriptors, "TestTensorDescGetFormat0100", TestTensorDescGetFormat0100);
    addTestDescriptor(descriptors, "TestTensorDescGetFormat0200", TestTensorDescGetFormat0200);
    addTestDescriptor(descriptors, "TestTensorDescGetFormat0300", TestTensorDescGetFormat0300);
}

static void RegisterTensorDescTestsPart3(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(descriptors, "TestTensorDescGetElementCount0200", TestTensorDescGetElementCount0200);
    addTestDescriptor(descriptors, "TestTensorDescGetElementCount0300", TestTensorDescGetElementCount0300);
    addTestDescriptor(descriptors, "TestTensorDescGetByteSize0100", TestTensorDescGetByteSize0100);
    addTestDescriptor(descriptors, "TestTensorDescGetByteSize0200", TestTensorDescGetByteSize0200);
    addTestDescriptor(descriptors, "TestTensorDescGetByteSize0300", TestTensorDescGetByteSize0300);
    addTestDescriptor(descriptors, "TestTensorDescSetName0100", TestTensorDescSetName0100);
    addTestDescriptor(descriptors, "TestTensorDescSetName0200", TestTensorDescSetName0200);
    addTestDescriptor(descriptors, "TestTensorDescGetName0100", TestTensorDescGetName0100);
    addTestDescriptor(descriptors, "TestTensorDescGetName0200", TestTensorDescGetName0200);
}

static void RegisterTensorDescTests(std::vector<napi_property_descriptor>& descriptors)
{
    RegisterTensorDescTestsPart1(descriptors);
    RegisterTensorDescTestsPart2(descriptors);
    RegisterTensorDescTestsPart3(descriptors);
}

static void RegisterTensorTestsPart1(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(descriptors, "TestTensorCreate0100", TestTensorCreate0100);
    addTestDescriptor(descriptors, "TestTensorCreate0200", TestTensorCreate0200);
    addTestDescriptor(descriptors, "TestTensorCreate0300", TestTensorCreate0300);
    addTestDescriptor(descriptors, "TestTensorCreateWithSize0100", TestTensorCreateWithSize0100);
    addTestDescriptor(descriptors, "TestTensorCreateWithSize0200", TestTensorCreateWithSize0200);
    addTestDescriptor(descriptors, "TestTensorCreateWithSize0300", TestTensorCreateWithSize0300);
    addTestDescriptor(descriptors, "TestTensorCreateWithFd0100", TestTensorCreateWithFd0100);
    addTestDescriptor(descriptors, "TestTensorCreateWithFd0200", TestTensorCreateWithFd0200);
    addTestDescriptor(descriptors, "TestTensorCreateWithFd0300", TestTensorCreateWithFd0300);
    addTestDescriptor(descriptors, "TestTensorCreateWithFd0400", TestTensorCreateWithFd0400);
    addTestDescriptor(descriptors, "TestTensorCreateWithFd0500", TestTensorCreateWithFd0500);
    addTestDescriptor(descriptors, "TestTensorGetDataBuffer0100", TestTensorGetDataBuffer0100);
}

static void RegisterTensorTestsPart2(std::vector<napi_property_descriptor>& descriptors)
{
    addTestDescriptor(descriptors, "TestTensorDestroy0100", TestTensorDestroy0100);
    addTestDescriptor(descriptors, "TestTensorDestroy0200", TestTensorDestroy0200);
    addTestDescriptor(descriptors, "TestTensorGetTensorDesc0100", TestTensorGetTensorDesc0100);
    addTestDescriptor(descriptors, "TestTensorGetTensorDesc0200", TestTensorGetTensorDesc0200);
    addTestDescriptor(descriptors, "TestTensorGetSize0100", TestTensorGetSize0100);
    addTestDescriptor(descriptors, "TestTensorGetSize0200", TestTensorGetSize0200);
    addTestDescriptor(descriptors, "TestTensorGetSize0300", TestTensorGetSize0300);
    addTestDescriptor(descriptors, "TestTensorGetFd0100", TestTensorGetFd0100);
    addTestDescriptor(descriptors, "TestTensorGetFd0200", TestTensorGetFd0200);
    addTestDescriptor(descriptors, "TestTensorGetOffset0100", TestTensorGetOffset0100);
}

static void RegisterTensorTests(std::vector<napi_property_descriptor>& descriptors)
{
    RegisterTensorTestsPart1(descriptors);
    RegisterTensorTestsPart2(descriptors);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> descriptors;

    RegisterCompilationBasicTests(descriptors);
    RegisterCompilationReturnCodeTests(descriptors);
    RegisterExecutorBasicTests(descriptors);
    RegisterExecutorAdvancedTests(descriptors);
    RegisterModelTests(descriptors);
    RegisterTensorDescTests(descriptors);
    RegisterTensorTests(descriptors);

    napi_define_properties(env, exports, descriptors.size(), descriptors.data());
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "nn_core_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
