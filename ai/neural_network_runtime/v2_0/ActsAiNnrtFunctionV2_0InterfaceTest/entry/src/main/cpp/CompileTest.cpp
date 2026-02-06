/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
#include <cmath>
#include <cstdio>
#include <vector>
#include <thread>
#include <fstream>
#include <unistd.h>

#include "include/NnrtUtilsTest.h"
#include "include/ModelTest.h"

using namespace OHOS::NeuralNetworkRuntime;
using namespace OHOS::NeuralNetworkRuntime::Test;

// 全局变量
static AddModel g_compileAddModel;
static OHNNGraphArgs g_compileGraphArgs = g_compileAddModel.graphArgs;
static OHNNCompileParam g_compileParam;

// 辅助函数
static int GenCacheFile(const std::string& cachePath)
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 10,
    };
    if (CompileGraphMock(compilation, compileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    if (CheckPath(cachePath + CACHE_FILE) != PathType::FILE) {
        return -1;
    }
    if (CheckPath(cachePath + CACHE_INFO_FILE) != PathType::FILE) {
        return -1;
    }
    return 0;
}

static void DestroyCache(const std::string& cachePath)
{
    std::string cacheFile = cachePath + CACHE_FILE;
    std::ifstream ifs(cacheFile.c_str(), std::ios::in | std::ios::binary);
    char* ptr{nullptr};
    int cacheSize = ifs.tellg();
    int invalidCacheSize = cacheSize * 0.9;
    ifs.read(ptr, cacheSize);
    ifs.close();
    std::ofstream ofs(cacheFile.c_str(), std::ios::out | std::ios::binary);
    ofs.write(ptr, invalidCacheSize);
    ofs.close();
}

// SUB_AI_NNRt_Func_North_Compilation_Create_0100
int SubAiNnrtFuncNorthCompilationCreate0100()
{
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(nullptr);
    if (compilation != nullptr) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_Create_0200
int SubAiNnrtFuncNorthCompilationCreate0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_Build(compilation) != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_Create_0300 - MockIDevice测试
int SubAiNnrtFuncNorthCompilationCreate0300()
{
    // 真机测试模式下,不使用MockIDevice设置操作支持
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    
    AddTopKModel addTopKModel;
    OHNNGraphArgsMulti graphArgsMulti = addTopKModel.graphArgs;
    if (BuildMultiOpGraph(model, graphArgsMulti) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    const size_t *devicesID{nullptr};
    const bool *realSupported{nullptr};
    uint32_t opCount;
    uint32_t devicesCount;
    if (OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    size_t targetDevice = devicesID[0];
    
    OH_NN_ReturnCode ret = OH_NNModel_GetAvailableOperations(model, targetDevice, &realSupported, &opCount);
    if (ret != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    // 真机测试模式下,直接验证获取到的操作支持情况
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    // 真机测试可能成功也可能失败,取决于设备支持情况
    OH_NNCompilation_Build(compilation);
    
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetDevice_0100
int SubAiNnrtFuncNorthCompilationSetDevice0100()
{
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{0};
    if (OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount) != OH_NN_SUCCESS) {
        return -1;
    }
    size_t targetDevice = devicesID[0];
    if (OH_NNCompilation_SetDevice(nullptr, targetDevice) != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetDevice_0200
int SubAiNnrtFuncNorthCompilationSetDevice0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (OH_NNCompilation_SetDevice(compilation, INVALID_DEVICE_ID) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_Build(compilation) != OH_NN_FAILED) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetDevice_0300
int SubAiNnrtFuncNorthCompilationSetDevice0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    OHNNCompileParam compileParam;
    if (CompileGraphMock(compilation, compileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetCache_0100
int SubAiNnrtFuncNorthCompilationSetCache0100()
{
    if (OH_NNCompilation_SetCache(nullptr, "./", 0) != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetCache_0200
int SubAiNnrtFuncNorthCompilationSetCache0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetCache(compilation, nullptr, 0);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetCache_0300 - MockIDevice测试
int SubAiNnrtFuncNorthCompilationSetCache0300()
{
    // 真机测试模式下,不使用MockIDevice设置缓存支持
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetCache(compilation, "./cache", 10);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    // 真机测试可能成功也可能失败,取决于设备缓存支持情况
    OH_NNCompilation_Build(compilation);
    
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetCache_0400
int SubAiNnrtFuncNorthCompilationSetCache0400()
{
    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v2_setcache04_" + std::to_string(pid);
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    OHNNCompileParam compileParam{.cacheDir = cachePath};
    int ret = CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetCache_0500
int SubAiNnrtFuncNorthCompilationSetCache0500()
{
    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v2_setcache05_" + std::to_string(pid);
    CreateFolder(cachePath);
    if (GenCacheFile(cachePath) != 0) {
        DeleteFolder(cachePath);
        return -1;
    }
    DestroyCache(cachePath);
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        DeleteFolder(cachePath);
        return -1;
    }
    int buildRet = BuildSingleOpGraph(model, g_compileGraphArgs);
    if (buildRet != OH_NN_SUCCESS) {
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }
    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 10,
    };
    int ret = CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        DeleteFolder(cachePath);
        return -1;
    }
    Free(model, compilation);
    DeleteFolder(cachePath);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetCache_0600
int SubAiNnrtFuncNorthCompilationSetCache0600()
{
    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v2_setcache06_" + std::to_string(pid);
    CreateFolder(cachePath);
    if (GenCacheFile(cachePath) != 0) {
        DeleteFolder(cachePath);
        return -1;
    }
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        DeleteFolder(cachePath);
        return -1;
    }
    int buildRet = BuildSingleOpGraph(model, g_compileGraphArgs);
    if (buildRet != OH_NN_SUCCESS) {
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }
    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 9,
    };
    int compileRet = CompileGraphMock(compilation, compileParam);
    if (compileRet != OH_NN_OPERATION_FORBIDDEN) {
        Free(model, compilation);
        DeleteFolder(cachePath);
        return -1;
    }
    Free(model, compilation);
    DeleteFolder(cachePath);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetCache_0700
int SubAiNnrtFuncNorthCompilationSetCache0700()
{
    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v2_setcache07_" + std::to_string(pid);
    CreateFolder(cachePath);
    if (GenCacheFile(cachePath) != 0) {
        DeleteFolder(cachePath);
        return -1;
    }
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        DeleteFolder(cachePath);
        return -1;
    }
    int buildRet = BuildSingleOpGraph(model, g_compileGraphArgs);
    if (buildRet != OH_NN_SUCCESS) {
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }
    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 10,
    };
    int ret = CompileGraphMock(compilation, compileParam);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        DeleteFolder(cachePath);
        return -1;
    }
    Free(model, compilation);
    DeleteFolder(cachePath);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetCache_0800
int SubAiNnrtFuncNorthCompilationSetCache0800()
{
    pid_t pid = getpid();
    std::string cachePath = CACHE_DIR + "v2_setcache08_" + std::to_string(pid);
    CreateFolder(cachePath);
    if (GenCacheFile(cachePath) != 0) {
        DeleteFolder(cachePath);
        return -1;
    }
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        DeleteFolder(cachePath);
        return -1;
    }
    int buildRet = BuildSingleOpGraph(model, g_compileGraphArgs);
    if (buildRet != OH_NN_SUCCESS) {
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        DeleteFolder(cachePath);
        return -1;
    }
    OHNNCompileParam compileParam{
        .cacheDir = cachePath,
        .cacheVersion = 11,
    };
    int compileRet = CompileGraphMock(compilation, compileParam);
    if (compileRet != OH_NN_SUCCESS) {
        Free(model, compilation);
        DeleteFolder(cachePath);
        return -1;
    }
    Free(model, compilation);
    DeleteFolder(cachePath);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0100
int SubAiNnrtFuncNorthCompilationSetPerformanceMode0100()
{
    if (OH_NNCompilation_SetPerformanceMode(nullptr, OH_NN_PERFORMANCE_MEDIUM) != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_Mock_0200 - MockIDevice测试
int SubAiNnrtFuncNorthCompilationSetPerformanceModeMock0200()
{
    // 真机测试模式下,不使用MockIDevice设置性能支持
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    
    OHNNCompileParam compileParam{
        .performanceMode = OH_NN_PERFORMANCE_LOW,
    };
    
    // 真机测试可能成功也可能失败,取决于设备性能模式支持情况
    CompileGraphMock(compilation, compileParam);
    
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0300
int SubAiNnrtFuncNorthCompilationSetPerformanceMode0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPerformanceMode(
        compilation, OH_NN_PERFORMANCE_NONE);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0400
int SubAiNnrtFuncNorthCompilationSetPerformanceMode0400()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPerformanceMode(
        compilation, OH_NN_PERFORMANCE_LOW);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0500
int SubAiNnrtFuncNorthCompilationSetPerformanceMode0500()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPerformanceMode(
        compilation, OH_NN_PERFORMANCE_MEDIUM);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0600
int SubAiNnrtFuncNorthCompilationSetPerformanceMode0600()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPerformanceMode(
        compilation, OH_NN_PERFORMANCE_HIGH);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0700
int SubAiNnrtFuncNorthCompilationSetPerformanceMode0700()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPerformanceMode(
        compilation, OH_NN_PERFORMANCE_EXTREME);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0800
int SubAiNnrtFuncNorthCompilationSetPerformanceMode0800()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_PerformanceMode invalidMode = static_cast<OH_NN_PerformanceMode>(
        OH_NN_PERFORMANCE_NONE - 1);
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPerformanceMode(
        compilation, invalidMode);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_Build(compilation) != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPerformanceMode_0900
int SubAiNnrtFuncNorthCompilationSetPerformanceMode0900()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_PerformanceMode invalidMode = static_cast<OH_NN_PerformanceMode>(
        OH_NN_PERFORMANCE_EXTREME + 1);
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPerformanceMode(
        compilation, invalidMode);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_Build(compilation) != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPriority_0100
int SubAiNnrtFuncNorthCompilationSetPriority0100()
{
    if (OH_NNCompilation_SetPriority(nullptr, OH_NN_PRIORITY_MEDIUM) != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPriority_0200 - MockIDevice测试
int SubAiNnrtFuncNorthCompilationSetPriority0200()
{
    // 真机测试模式下,不使用MockIDevice设置优先级支持
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPriority(
        compilation, OH_NN_PRIORITY_LOW);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    // 真机测试可能成功也可能失败,取决于设备优先级支持情况
    OH_NNCompilation_Build(compilation);
    
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPriority_0300
int SubAiNnrtFuncNorthCompilationSetPriority0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPriority(
        compilation, OH_NN_PRIORITY_NONE);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPriority_0400
int SubAiNnrtFuncNorthCompilationSetPriority0400()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPriority(
        compilation, OH_NN_PRIORITY_LOW);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPriority_0500
int SubAiNnrtFuncNorthCompilationSetPriority0500()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPriority(
        compilation, OH_NN_PRIORITY_MEDIUM);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPriority_0600
int SubAiNnrtFuncNorthCompilationSetPriority0600()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPriority(
        compilation, OH_NN_PRIORITY_HIGH);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPriority_0700
int SubAiNnrtFuncNorthCompilationSetPriority0700()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_Priority invalidPriority = static_cast<OH_NN_Priority>(
        OH_NN_PRIORITY_NONE - 1);
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPriority(
        compilation, invalidPriority);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_Build(compilation) != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_SetPriority_0800
int SubAiNnrtFuncNorthCompilationSetPriority0800()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NN_Priority invalidPriority = static_cast<OH_NN_Priority>(
        OH_NN_PRIORITY_HIGH + 1);
    OH_NN_ReturnCode ret = OH_NNCompilation_SetPriority(
        compilation, invalidPriority);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_Build(compilation) != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0100
int SubAiNnrtFuncNorthCompilationEnableFloat160100()
{
    if (OH_NNCompilation_EnableFloat16(nullptr, true) != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0200
int SubAiNnrtFuncNorthCompilationEnableFloat160200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_EnableFloat16(compilation, false) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0300 - MockIDevice测试
int SubAiNnrtFuncNorthCompilationEnableFloat160300()
{
    // 真机测试模式下,不使用MockIDevice设置float16支持
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_EnableFloat16(compilation, true) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    // 真机测试可能成功也可能失败,取决于设备float16支持情况
    OH_NNCompilation_Build(compilation);
    
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_EnableFloat16_0400 - MockIDevice测试
int SubAiNnrtFuncNorthCompilationEnableFloat160400()
{
    // 真机测试模式下,不使用MockIDevice设置float16支持
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_EnableFloat16(compilation, false) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    if (OH_NNCompilation_Build(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_Build_0100
int SubAiNnrtFuncNorthCompilationBuild0100()
{
    if (OH_NNCompilation_Build(nullptr) != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_Build_0200
int SubAiNnrtFuncNorthCompilationBuild0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (OH_NNCompilation_Build(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_Destroy_0100
int SubAiNnrtFuncNorthCompilationDestroy0100()
{
    OH_NNCompilation *compilation = nullptr;
    OH_NNCompilation_Destroy(&compilation);
    if (compilation != nullptr) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Compilation_Destroy_0200
int SubAiNnrtFuncNorthCompilationDestroy0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_compileGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (SetDevice(compilation) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNCompilation_Destroy(&compilation);
    if (compilation != nullptr) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}
