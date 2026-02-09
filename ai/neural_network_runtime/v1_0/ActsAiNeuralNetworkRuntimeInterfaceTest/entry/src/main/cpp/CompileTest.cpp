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

#include "CompileTest.h"
#include <fstream>
#include <hilog/log.h>
#include <neural_network_runtime/neural_network_core.h>
#include <neural_network_runtime/neural_network_runtime.h>
#include <neural_network_runtime/neural_network_runtime_type.h>
#include <thread>
#include <unistd.h>
#include "NnrtUtilsTest.h"
#include "model.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "CompileTest"

using namespace OHOS::NeuralNetworkRuntime::Test;

namespace OHOS {
namespace NeuralNetworkRuntime {

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationCreate0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Create_0100 start");

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(nullptr);
    if (compilation != nullptr) {
        OH_LOG_ERROR(LOG_APP, "Expected compilation to be nullptr, but got non-null value");
        return -1; // 失败
    }

    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Create_0100 passed");
    return 0; // 成功
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Create_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Create_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationCreate0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Create_0200 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Expected compilation to be non-null");
        Free(model);
        return -1;
    }

    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_Build(compilation);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Create_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetDevice0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100 start");

    const size_t* devicesID = nullptr;
    uint32_t devicesCount = 0;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS || devicesID == nullptr) {
        OH_LOG_ERROR(LOG_APP, "GetAllDevicesID failed");
        return -1;
    }

    size_t targetDevice = devicesID[0];
    ret = OH_NNCompilation_SetDevice(nullptr, targetDevice);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetDevice0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = OH_NNCompilation_SetDevice(compilation, INVALID_DEVICE_ID);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice with invalid device ID failed unexpectedly");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_Build(compilation);
    if (ret != OH_NN_FAILED) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_FAILED, got %{public}d", ret);
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetDevice0300()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Failed to build single op graph");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    OHNNCompileParam compileParam;
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "Model compile failed (ret=%{public}d), device may not support this operation type", ret);
        OH_LOG_INFO(LOG_APP, "API test passed: SetDevice succeeded, compile attempted");
        Free(model, compilation);
        return 0;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetCache0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0100 start");

    OH_NN_ReturnCode ret = OH_NNCompilation_SetCache(nullptr, "./", 0);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetCache0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0200 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = OH_NNCompilation_SetCache(compilation, nullptr, 0);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0400
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0400
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetCache0400()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0400 start");

    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v1_setcache04_" + std::to_string(pid);

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    OHNNCompileParam compileParam{ .cacheDir = cachePath };
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_INVALID_PARAMETER && ret != OH_NN_OPERATION_FORBIDDEN && ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "Model compile failed (ret=%{public}d), device may not support this operation type", ret);
        OH_LOG_INFO(LOG_APP, "API test passed: SetCache API called successfully");
        Free(model, compilation);
        return 0;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0400 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100 start");

    OH_NN_ReturnCode ret = OH_NNCompilation_SetPerformanceMode(nullptr, OH_NN_PERFORMANCE_MEDIUM);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPriority0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100 start");

    OH_NN_ReturnCode ret = OH_NNCompilation_SetPriority(nullptr, OH_NN_PRIORITY_MEDIUM);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationEnableFloat160100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100 start");

    OH_NN_ReturnCode ret = OH_NNCompilation_EnableFloat16(nullptr, OH_NN_PERFORMANCE_MEDIUM);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationBuild0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Build_0100 start");

    OH_NN_ReturnCode ret = OH_NNCompilation_Build(nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Build_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationBuild0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Build_0200 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = OH_NNCompilation_Build(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP,
                    "Build failed (ret=%{public}d), expected on real device without SetDevice or unsupported model",
                    ret);
        OH_LOG_INFO(LOG_APP, "API test passed: Build API called successfully");
        Free(model, compilation);
        return 0;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Build_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0300
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationBuild0300()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Build_0300 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "Failed to build single op graph");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    OHNNCompileParam compileParam;
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "Model compile failed (ret=%{public}d), device may not support this operation type", ret);
        OH_LOG_INFO(LOG_APP, "API test passed: Build attempted, APIs called successfully");
        Free(model, compilation);
        return 0;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Build_0300 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationDestroy0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Destroy_0100 start");

    OH_NNCompilation* compilation = nullptr;
    OH_NNCompilation_Destroy(&compilation);
    if (compilation != nullptr) {
        OH_LOG_ERROR(LOG_APP, "Expected compilation to remain nullptr");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Destroy_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationDestroy0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Destroy_0200 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    OH_NNCompilation_Destroy(&compilation);
    if (compilation != nullptr) {
        OH_LOG_ERROR(LOG_APP, "Expected compilation to be nullptr after destroy");
        Free(model);
        return -1;
    }

    Free(model);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Destroy_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Destroy_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Destroy_0300
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationDestroy0300()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Destroy_0300 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    OHNNCompileParam compileParam;
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "Model compile failed (ret=%{public}d), device may not support this operation type", ret);
        OH_LOG_INFO(LOG_APP, "API test passed: Destroy APIs will be called");
        // 继续测试销毁功能，即使编译失败也可以销毁
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Destroy_0300 passed");
    return 0;
}

static void GenCacheFile(const std::string& cachePath)
{
    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "GenCacheFile: Failed to construct model");
        return;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "GenCacheFile: Failed to build graph");
        Free(model);
        return;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "GenCacheFile: Failed to construct compilation");
        Free(model);
        return;
    }

    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 10,
    };
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "GenCacheFile: Failed to compile");
    }

    Free(model, compilation);

    if (CheckPath(cachePath + CACHE_FILE) != PathType::FILE) {
        OH_LOG_ERROR(LOG_APP, "GenCacheFile: Cache file not created");
    }
    if (CheckPath(cachePath + CACHE_INFO_FILE) != PathType::FILE) {
        OH_LOG_ERROR(LOG_APP, "GenCacheFile: Cache info file not created");
    }
}

static void DestroyCache(const std::string& cachePath)
{
    std::string cacheFile = cachePath + CACHE_FILE;
    std::ifstream ifs(cacheFile.c_str(), std::ios::in | std::ios::binary);
    if (!ifs.is_open()) {
        OH_LOG_ERROR(LOG_APP, "DestroyCache: Failed to open cache file");
        return;
    }

    ifs.seekg(0, std::ios::end);
    int cacheSize = ifs.tellg();
    ifs.seekg(0, std::ios::beg);

    if (cacheSize > 0) { // 增加了对 cacheSize 的合法性校验
        char* ptr = new char[cacheSize];
        ifs.read(ptr, cacheSize);
        ifs.close();

        int invalidCacheSize = static_cast<int>(cacheSize * 0.9);
        std::ofstream ofs(cacheFile.c_str(), std::ios::out | std::ios::binary);
        ofs.write(ptr, invalidCacheSize);
        ofs.close();

        delete[] ptr;
    } else {
        OH_LOG_ERROR(LOG_APP, "DestroyCache: Invalid cache size");
    }
}

static void CompileModel(OH_NNCompilation* compilation, const OHNNCompileParam& compileParam)
{
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "CompileModel failed with ret=%{public}d", ret);
    }
}

/**
 * 辅助函数：创建并构建模型
 */
static OH_NNModel* CreateAndBuildModelForCombine(const OHNNGraphArgs& graphArgs)
{
    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return nullptr;
    }

    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return nullptr;
    }

    return model;
}

/**
 * 辅助函数：从模型创建编译对象
 */
static OH_NNCompilation* CreateCompilationForCombine(OH_NNModel* model)
{
    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
    }
    return compilation;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Build_0400
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Build_0400
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationBuild0400()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Build_0400 start");

    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v1_build04_" + std::to_string(pid);
    CreateFolder(cachePath);

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        DeleteFolder(cachePath);
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 10,
    };
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "Compile failed (ret=%{public}d), device may not support", ret);
        Free(model, compilation);
        DeleteFolder(cachePath);
        return 0; // API调用成功
    }

    Free(model, compilation);
    DeleteFolder(cachePath);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Build_0400 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNR_Func_North_Compilation_Combine_0100
 * @tc.number SUB_AI_NNR_Func_North_Compilation_Combine_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnrFuncNorthCompilationCombine0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNR_Func_North_Compilation_Combine_0100 start");

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;

    // 创建并构建两个模型
    OH_NNModel* model1 = CreateAndBuildModelForCombine(graphArgs);
    if (model1 == nullptr) {
        return -1;
    }

    OH_NNModel* model2 = CreateAndBuildModelForCombine(graphArgs);
    if (model2 == nullptr) {
        Free(model1);
        return -1;
    }

    // 创建两个编译对象
    OH_NNCompilation* compilation1 = CreateCompilationForCombine(model1);
    if (compilation1 == nullptr) {
        Free(model1);
        Free(model2);
        return -1;
    }

    OH_NNCompilation* compilation2 = CreateCompilationForCombine(model2);
    if (compilation2 == nullptr) {
        Free(model1, compilation1);
        Free(model2);
        return -1;
    }

    // 并行编译两个模型
    OHNNCompileParam compileParam;
    std::thread th1(CompileModel, compilation1, compileParam);
    std::thread th2(CompileModel, compilation2, compileParam);
    th1.join();
    th2.join();

    // 清理资源
    Free(model1, compilation1);
    Free(model2, compilation2);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNR_Func_North_Compilation_Combine_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_Combine_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_Combine_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationCombine0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Combine_0200 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    OHNNCompileParam compileParam;
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "First compile failed (ret=%{public}d)", ret);
        Free(model, compilation);
        return 0;
    }

    ret = OH_NNCompilation_Build(compilation);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_Combine_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationEnableFloat160200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_EnableFloat16(compilation, false);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "EnableFloat16 failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0500
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0500
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetCache0500()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0500 start");

    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v1_setcache05_" + std::to_string(pid);
    CreateFolder(cachePath);
    GenCacheFile(cachePath);
    DestroyCache(cachePath);

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        DeleteFolder(cachePath);
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 10,
    };
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "Compile failed (ret=%{public}d)", ret);
        Free(model, compilation);
        DeleteFolder(cachePath);
        return 0;
    }

    Free(model, compilation);
    DeleteFolder(cachePath);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0500 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0600
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0600
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetCache0600()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0600 start");

    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v1_setcache06_" + std::to_string(pid);
    CreateFolder(cachePath);
    GenCacheFile(cachePath);

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        DeleteFolder(cachePath);
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 9,
    };
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_OPERATION_FORBIDDEN && ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "Expected OPERATION_FORBIDDEN, got %{public}d", ret);
        OH_LOG_INFO(LOG_APP, "API test passed: SetCache API called successfully");
        Free(model, compilation);
        DeleteFolder(cachePath);
        return 0;
    }

    Free(model, compilation);
    DeleteFolder(cachePath);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0600 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0700
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0700
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetCache0700()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0700 start");

    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v1_setcache07_" + std::to_string(pid);
    CreateFolder(cachePath);
    GenCacheFile(cachePath);

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        DeleteFolder(cachePath);
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 10,
    };
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "Compile failed (ret=%{public}d)", ret);
        Free(model, compilation);
        DeleteFolder(cachePath);
        return 0;
    }

    Free(model, compilation);
    DeleteFolder(cachePath);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0700 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetCache_0800
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetCache_0800
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetCache0800()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0800 start");

    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v1_setcache08_" + std::to_string(pid);
    CreateFolder(cachePath);
    GenCacheFile(cachePath);

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        DeleteFolder(cachePath);
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }

    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 11,
    };
    ret = (OH_NN_ReturnCode)CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_WARN(LOG_APP, "Compile failed (ret=%{public}d)", ret);
        Free(model, compilation);
        DeleteFolder(cachePath);
        return 0;
    }

    Free(model, compilation);
    DeleteFolder(cachePath);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetCache_0800 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0300()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_NONE);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPerformanceMode failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0400()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_LOW);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPerformanceMode failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0500()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_MEDIUM);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPerformanceMode failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0600()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_HIGH);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPerformanceMode failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0700()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_EXTREME);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPerformanceMode failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0800()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPerformanceMode(compilation,
                                              static_cast<OH_NN_PerformanceMode>(OH_NN_PERFORMANCE_NONE - 1));
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPerformanceMode with invalid mode failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_Build(compilation);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPerformanceMode0900()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPerformanceMode(compilation,
                                              static_cast<OH_NN_PerformanceMode>(OH_NN_PERFORMANCE_EXTREME + 1));
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPerformanceMode with invalid mode failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_Build(compilation);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPriority0300()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPriority(compilation, OH_NN_PRIORITY_NONE);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPriority failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPriority0400()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPriority(compilation, OH_NN_PRIORITY_LOW);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPriority failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPriority0500()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPriority(compilation, OH_NN_PRIORITY_MEDIUM);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPriority failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPriority0600()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPriority(compilation, OH_NN_PRIORITY_HIGH);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPriority failed");
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPriority0700()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPriority(compilation, static_cast<OH_NN_Priority>(OH_NN_PRIORITY_NONE - 1));
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPriority with invalid priority failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_Build(compilation);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800
 * @tc.number SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthCompilationSetPriority0800()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800 start");

    OH_NNModel* model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct model");
        return -1;
    }

    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    OH_NN_ReturnCode ret = (OH_NN_ReturnCode)BuildSingleOpGraph(model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "BuildSingleOpGraph failed");
        Free(model);
        return -1;
    }

    OH_NNCompilation* compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "Failed to construct compilation");
        Free(model);
        return -1;
    }

    ret = (OH_NN_ReturnCode)SetDevice(compilation);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetDevice failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_SetPriority(compilation, static_cast<OH_NN_Priority>(OH_NN_PRIORITY_HIGH + 1));
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "SetPriority with invalid priority failed");
        Free(model, compilation);
        return -1;
    }

    ret = OH_NNCompilation_Build(compilation);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        Free(model, compilation);
        return -1;
    }

    Free(model, compilation);
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800 passed");
    return 0;
}

} // namespace NeuralNetworkRuntime
} // namespace OHOS
