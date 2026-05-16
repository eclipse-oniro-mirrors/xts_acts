/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
#include <cmath>
#include <cstdio>
#include <vector>
#include <thread>
#include <cstdlib>

#include "include/NnrtUtilsTest.h"
#include "include/ModelTest.h"

using namespace OHOS::NeuralNetworkRuntime;
using namespace OHOS::NeuralNetworkRuntime::Test;

// 全局变量
static AddModel g_memoryAddModel;
static OHNNGraphArgs g_memoryGraphArgs = g_memoryAddModel.graphArgs;
static OHNNCompileParam g_memoryCompileParam;

// SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0100
int SubAiNnrtFuncNorthExecutorMemoryCreateInputMemory0100()
{
    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateInputMemory(nullptr, 0, 4);
    if (OHNNMemory != nullptr) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0200
int SubAiNnrtFuncNorthExecutorMemoryCreateInputMemory0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateInputMemory(executor, 2, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0300
int SubAiNnrtFuncNorthExecutorMemoryCreateInputMemory0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateInputMemory(executor, 0, 0);
    if (OHNNMemory != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }
    Free(model, compilation, executor);
    return 0;
}


// SUB_AI_NNRt_Func_North_Executor_Memory_CreateInputMemory_0500
int SubAiNnrtFuncNorthExecutorMemoryCreateInputMemory0500()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateInputMemory(executor, 0, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }
    OH_NN_Memory *OHNNMemory2 = OH_NNExecutor_AllocateInputMemory(
        executor, 0, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory2 == nullptr) {
        OH_NNExecutor_DestroyInputMemory(executor, 0, &OHNNMemory);
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyInputMemory(executor, 0, &OHNNMemory);
    if (OHNNMemory != nullptr) {
        OH_NNExecutor_DestroyInputMemory(executor, 0, &OHNNMemory2);
        Free(model, compilation, executor);
        return -1;
    }
    OH_NNExecutor_DestroyInputMemory(executor, 0, &OHNNMemory2);
    if (OHNNMemory2 != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0100
int SubAiNnrtFuncNorthExecutorMemoryCreateOutputMemory0100()
{
    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateOutputMemory(nullptr, 0, 4);
    if (OHNNMemory != nullptr) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0200
int SubAiNnrtFuncNorthExecutorMemoryCreateOutputMemory0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateOutputMemory(executor, 2, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0300
int SubAiNnrtFuncNorthExecutorMemoryCreateOutputMemory0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateOutputMemory(executor, 0, 0);
    if (OHNNMemory != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_CreateOutputMemory_0500
int SubAiNnrtFuncNorthExecutorMemoryCreateOutputMemory0500()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateOutputMemory(executor, 0, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }
    OH_NN_Memory *OHNNMemory2 = OH_NNExecutor_AllocateOutputMemory(
        executor, 0, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory2 == nullptr) {
        OH_NNExecutor_DestroyOutputMemory(executor, 0, &OHNNMemory);
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyOutputMemory(executor, 0, &OHNNMemory);
    if (OHNNMemory != nullptr) {
        OH_NNExecutor_DestroyOutputMemory(executor, 0, &OHNNMemory2);
        Free(model, compilation, executor);
        return -1;
    }
    OH_NNExecutor_DestroyOutputMemory(executor, 0, &OHNNMemory2);
    if (OHNNMemory2 != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0100
int SubAiNnrtFuncNorthExecutorMemoryDestroyInputMemory0100()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateInputMemory(executor, 0, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyInputMemory(nullptr, 0, &OHNNMemory);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyInputMemory(executor, 0, &OHNNMemory);
    if (OHNNMemory != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0200
int SubAiNnrtFuncNorthExecutorMemoryDestroyInputMemory0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateInputMemory(executor, 0, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyInputMemory(executor, 1, &OHNNMemory);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyInputMemory(executor, 0, &OHNNMemory);
    if (OHNNMemory != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_DestroyInputMemory_0300
int SubAiNnrtFuncNorthExecutorMemoryDestroyInputMemory0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = nullptr;
    OH_NNExecutor_DestroyInputMemory(executor, 0, &OHNNMemory);

    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0100
int SubAiNnrtFuncNorthExecutorMemoryDestroyOutputMemory0100()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateOutputMemory(executor, 0, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyOutputMemory(nullptr, 0, &OHNNMemory);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyOutputMemory(executor, 0, &OHNNMemory);
    if (OHNNMemory != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0200
int SubAiNnrtFuncNorthExecutorMemoryDestroyOutputMemory0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NN_Memory *OHNNMemory = OH_NNExecutor_AllocateOutputMemory(executor, 0, g_memoryGraphArgs.operands[0].length);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyOutputMemory(executor, 1, &OHNNMemory);
    if (OHNNMemory == nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    OH_NNExecutor_DestroyOutputMemory(executor, 0, &OHNNMemory);
    if (OHNNMemory != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }

    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Memory_DestroyOutputMemory_0300
int SubAiNnrtFuncNorthExecutorMemoryDestroyOutputMemory0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_memoryGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_memoryCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }

    OH_NNExecutor_DestroyOutputMemory(executor, 0, nullptr);

    Free(model, compilation, executor);
    return 0;
}
