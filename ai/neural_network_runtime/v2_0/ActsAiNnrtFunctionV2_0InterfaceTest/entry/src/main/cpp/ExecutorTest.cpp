/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
#include <cmath>
#include <cstdio>
#include <vector>
#include <thread>

#include "include/NnrtUtilsTest.h"
#include "include/ModelTest.h"

using namespace OHOS::NeuralNetworkRuntime;
using namespace OHOS::NeuralNetworkRuntime::Test;

// 全局变量
static AddModel g_executorAddModel;
static OHNNGraphArgs g_executorGraphArgs = g_executorAddModel.graphArgs;
static OHNNCompileParam g_executorCompileParam;

// 前向声明
static int ProcessInputWithInvalidIndex(OH_NNExecutor *executor, uint32_t inputIndex,
    const OH_NN_Tensor &operand, const OHNNOperandTest &operandTem, const float *valueX2);
static int ProcessOutputWithInvalidOffset(OH_NNExecutor *executor, uint32_t outputIndex,
    const OHNNOperandTest &operandTem);

// 辅助结构体：封装执行器上下文
struct ExecutorContext {
    OH_NNExecutor *executor;
    OH_NNModel *model;
    OH_NNCompilation *compilation;
    OH_NN_Memory **memoryArray;
};

// 辅助函数：创建Tensor
static OH_NN_Tensor CreateTensorFromOperand(const OHNNOperandTest &operandTem)
{
    OH_NN_Tensor operand = {
        operandTem.dataType,
        (uint32_t)operandTem.shape.size(),
        operandTem.shape.data(),
        operandTem.quantParam,
        operandTem.type
    };
    return operand;
}

// 辅助函数：处理输入设置
static int ProcessInput(OH_NNExecutor *executor, uint32_t inputIndex,
    const OH_NN_Tensor &operand, const OHNNOperandTest &operandTem)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, operandTem.data, operandTem.length);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    return 0;
}

// 辅助函数：处理输出设置（测试空执行器）
static int ProcessOutputWithNullExecutor(OH_NNExecutor *executor, uint32_t outputIndex,
    const OHNNOperandTest &operandTem, bool testNullExecutor)
{
    OH_NNExecutor *execPtr = testNullExecutor ? nullptr : executor;
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOutput(
        execPtr, outputIndex, operandTem.data, operandTem.length);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// 辅助函数：处理输入输出设置的循环逻辑
static int ProcessInputOutputLoop(
    OH_NNExecutor *executor,
    OH_NNModel *model,
    OH_NNCompilation *compilation,
    bool testNullExecutor,
    uint32_t invalidOutputIndex = 0)
{
    uint32_t inputIndex = 0;
    uint32_t outputIndex = invalidOutputIndex;
    
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        OH_NN_Tensor operand = CreateTensorFromOperand(operandTem);
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            if (ProcessInput(executor, inputIndex, operand, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            inputIndex += 1;
            continue;
        }
        
        auto outputBegin = g_executorGraphArgs.outputIndices.begin();
        auto outputEnd = g_executorGraphArgs.outputIndices.end();
        if (std::find(outputBegin, outputEnd, i) != outputEnd) {
            if (ProcessOutputWithNullExecutor(executor, outputIndex, operandTem, testNullExecutor) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            outputIndex += 1;
        }
    }
    return 0;
}

// 辅助函数：创建并编译模型
static int CreateAndCompileModel(
    OH_NNModel **model,
    OH_NNCompilation **compilation)
{
    *model = OH_NNModel_Construct();
    if (*model == nullptr) {
        return -1;
    }
    
    int ret = BuildSingleOpGraph(*model, g_executorGraphArgs);
    if (ret != OH_NN_SUCCESS) {
        Free(*model);
        return -1;
    }
    
    *compilation = OH_NNCompilation_Construct(*model);
    if (*compilation == nullptr) {
        Free(*model);
        return -1;
    }
    
    ret = CompileGraphMock(*compilation, g_executorCompileParam);
    if (ret != OH_NN_SUCCESS) {
        Free(*model, *compilation);
        return -1;
    }
    
    return 0;
}

// 辅助函数：创建执行器
static OH_NNExecutor* CreateExecutor(
    OH_NNCompilation *compilation,
    OH_NNModel *model)
{
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
    }
    return executor;
}

// 辅助函数：处理输出设置
static int ProcessOutput(OH_NNExecutor *executor, uint32_t outputIndex,
    const OHNNOperandTest &operandTem)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOutput(
        executor, outputIndex, operandTem.data, operandTem.length);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    return 0;
}

// 辅助函数：设置输入输出并执行
static int SetupAndExecute(
    OH_NNExecutor *executor,
    OH_NNModel *model,
    OH_NNCompilation *compilation)
{
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        OH_NN_Tensor operand = CreateTensorFromOperand(operandTem);
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            if (ProcessInput(executor, inputIndex, operand, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            inputIndex += 1;
            continue;
        }
        
        auto outputBegin = g_executorGraphArgs.outputIndices.begin();
        auto outputEnd = g_executorGraphArgs.outputIndices.end();
        if (std::find(outputBegin, outputEnd, i) != outputEnd) {
            if (ProcessOutput(executor, outputIndex, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            outputIndex += 1;
        }
    }
    
    OH_NN_ReturnCode ret = OH_NNExecutor_Run(executor);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    
    return 0;
}

// 辅助函数：处理输入输出设置循环（使用无效索引）
static int ProcessInputOutputWithInvalidIndex(OH_NNExecutor *executor, OH_NNModel *model,
    OH_NNCompilation *compilation, float *valueX2)
{
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType,
            (uint32_t)operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam,
            operandTem.type
        };
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            if (ProcessInputWithInvalidIndex(executor, inputIndex, operand, operandTem, valueX2) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            inputIndex++;
            continue;
        }
        
        auto outputBegin = g_executorGraphArgs.outputIndices.begin();
        auto outputEnd = g_executorGraphArgs.outputIndices.end();
        if (std::find(outputBegin, outputEnd, i) != outputEnd) {
            if (ProcessOutput(executor, outputIndex, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            outputIndex++;
        }
    }
    return 0;
}

// 辅助函数：处理输入输出设置循环（使用无效偏移）
static int ProcessInputOutputWithInvalidOffset(OH_NNExecutor *executor, OH_NNModel *model,
    OH_NNCompilation *compilation)
{
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType,
            (uint32_t)operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam,
            operandTem.type
        };
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            if (ProcessInput(executor, inputIndex, operand, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            inputIndex++;
            continue;
        }
        
        auto outputBegin = g_executorGraphArgs.outputIndices.begin();
        auto outputEnd = g_executorGraphArgs.outputIndices.end();
        if (std::find(outputBegin, outputEnd, i) != outputEnd) {
            if (ProcessOutputWithInvalidOffset(executor, outputIndex, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            outputIndex++;
        }
    }
    return 0;
}

// 辅助函数：处理输入内存的分配和设置
static int ProcessInputMemorySetup(const ExecutorContext &ctx, uint32_t inputIndex,
    const OH_NN_Tensor *operand, const OHNNOperandTest &operandTem,
    OH_NN_Memory **inputMemory)
{
    *inputMemory = OH_NNExecutor_AllocateInputMemory(
        ctx.executor, inputIndex, operandTem.length);
    if (*inputMemory == nullptr) {
        for (size_t j = 0; j < inputIndex; j++) {
            OH_NNExecutor_DestroyInputMemory(ctx.executor, j, &ctx.memoryArray[j]);
        }
        Free(ctx.model, ctx.compilation, ctx.executor);
        return -1;
    }
    
    OH_NN_ReturnCode ret = OH_NNExecutor_SetInputWithMemory(
        ctx.executor, inputIndex, operand, *inputMemory);
    if (ret != OH_NN_SUCCESS) {
        for (size_t j = 0; j <= inputIndex; j++) {
            OH_NNExecutor_DestroyInputMemory(ctx.executor, j, &ctx.memoryArray[j]);
        }
        Free(ctx.model, ctx.compilation, ctx.executor);
        return -1;
    }
    
    int copyRet = SafeMemcpy((*inputMemory)->data, operandTem.length,
        static_cast<void*>(operandTem.data), operandTem.length);
    if (copyRet != 0) {
        for (size_t j = 0; j <= inputIndex; j++) {
            OH_NNExecutor_DestroyInputMemory(ctx.executor, j, &ctx.memoryArray[j]);
        }
        Free(ctx.model, ctx.compilation, ctx.executor);
        return -1;
    }
    
    return 0;
}

// 辅助函数：处理输出设置并清理内存（Combine0400专用）
static int ProcessOutputSetupWithCleanup(const ExecutorContext &ctx,
    uint32_t outputIndex, const OHNNOperandTest &operandTem, uint32_t inputIndex)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOutput(
        ctx.executor, outputIndex, operandTem.data, operandTem.length);
    if (ret != OH_NN_SUCCESS) {
        for (size_t j = 0; j < inputIndex; j++) {
            OH_NNExecutor_DestroyInputMemory(ctx.executor, j, &ctx.memoryArray[j]);
        }
        Free(ctx.model, ctx.compilation, ctx.executor);
        return -1;
    }
    return 0;
}

// 辅助函数：处理输入输出内存循环（Combine0400专用）
static int ProcessInputOutputMemoryLoop(OH_NNExecutor *executor, OH_NNModel *model,
    OH_NNCompilation *compilation, OH_NN_Memory *OHNNMemory[])
{
    ExecutorContext ctx = {executor, model, compilation, OHNNMemory};
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType,
            (uint32_t)operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam,
            operandTem.type
        };
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            OH_NN_Memory *inputMemory = nullptr;
            if (ProcessInputMemorySetup(ctx, inputIndex, &operand, operandTem,
                &inputMemory) != 0) {
                return -1;
            }
            OHNNMemory[inputIndex] = inputMemory;
            inputIndex++;
            continue;
        }
        
        auto outputBegin = g_executorGraphArgs.outputIndices.begin();
        auto outputEnd = g_executorGraphArgs.outputIndices.end();
        if (std::find(outputBegin, outputEnd, i) != outputEnd) {
            if (ProcessOutputSetupWithCleanup(ctx, outputIndex, operandTem,
                inputIndex) != 0) {
                return -1;
            }
            outputIndex++;
        }
    }
    return 0;
}

// 辅助函数：运行并验证输出（Combine0400专用）
static int RunAndVerifyWithMemory(OH_NNExecutor *executor, OH_NNModel *model,
    OH_NNCompilation *compilation, OH_NN_Memory *OHNNMemory[])
{
    if (OH_NNExecutor_Run(executor) != OH_NN_SUCCESS) {
        for (size_t i = 0; i < g_executorGraphArgs.inputIndices.size(); i++) {
            OH_NNExecutor_DestroyInputMemory(executor, i, &OHNNMemory[i]);
        }
        Free(model, compilation, executor);
        return -1;
    }
    
    bool outputCheck = CheckOutput(
        g_executorAddModel.outputValue, g_executorAddModel.expectValue);
    if (!outputCheck) {
        for (size_t i = 0; i < g_executorGraphArgs.inputIndices.size(); i++) {
            OH_NNExecutor_DestroyInputMemory(executor, i, &OHNNMemory[i]);
        }
        Free(model, compilation, executor);
        return -1;
    }
    
    for (size_t i = 0; i < g_executorGraphArgs.inputIndices.size(); i++) {
        OH_NNExecutor_DestroyInputMemory(executor, i, &OHNNMemory[i]);
        if (OHNNMemory[i] != nullptr) {
            Free(model, compilation, executor);
            return -1;
        }
    }
    
    return 0;
}

// 辅助函数：处理输入输出设置循环（Combine0500专用）
static int ProcessInputOutputForCombine0500(OH_NNExecutor *executor, OH_NNModel *model,
    OH_NNCompilation *compilation, OH_NN_Memory **outputMemory)
{
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType,
            (uint32_t)operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam,
            operandTem.type
        };
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            OH_NN_ReturnCode ret = OH_NNExecutor_SetInput(
                executor, inputIndex, &operand, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                Free(model, compilation, executor);
                return -1;
            }
            inputIndex++;
            continue;
        }
        
        auto outputBegin = g_executorGraphArgs.outputIndices.begin();
        auto outputEnd = g_executorGraphArgs.outputIndices.end();
        if (std::find(outputBegin, outputEnd, i) == outputEnd) {
            continue;
        }
        
        *outputMemory = OH_NNExecutor_AllocateOutputMemory(
            executor, outputIndex, operandTem.length);
        if (*outputMemory == nullptr) {
            Free(model, compilation, executor);
            return -1;
        }
        
        OH_NN_ReturnCode ret = OH_NNExecutor_SetOutputWithMemory(
            executor, outputIndex, *outputMemory);
        if (ret != OH_NN_SUCCESS) {
            OH_NNExecutor_DestroyOutputMemory(executor, outputIndex, outputMemory);
            Free(model, compilation, executor);
            return -1;
        }
        outputIndex++;
    }
    return 0;
}

// 辅助函数：处理输出内存设置并运行
static int ProcessOutputMemoryAndRun(OH_NNExecutor *executor, OH_NNModel *model,
    OH_NNCompilation *compilation, OH_NN_Memory **outputMemory)
{
    if (OH_NNExecutor_Run(executor) != OH_NN_SUCCESS) {
        OH_NNExecutor_DestroyOutputMemory(executor, 0, outputMemory);
        Free(model, compilation, executor);
        return -1;
    }
    
    float* outputData = static_cast<float*>(const_cast<void*>((*outputMemory)->data));
    float* expectData = static_cast<float*>(g_executorAddModel.expectValue);
    if (!CheckOutput(outputData, expectData)) {
        OH_NNExecutor_DestroyOutputMemory(executor, 0, outputMemory);
        Free(model, compilation, executor);
        return -1;
    }
    
    OH_NNExecutor_DestroyOutputMemory(executor, 0, outputMemory);
    if (*outputMemory != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }
    
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Create_0100
int SubAiNnrtFuncNorthExecutorCreate0100()
{
    OH_NNExecutor *executor = OH_NNExecutor_Construct(nullptr);
    if (executor != nullptr) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Create_0200
int SubAiNnrtFuncNorthExecutorCreate0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{0};
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    size_t targetDevice = devicesID[0];
    
    if (OH_NNCompilation_SetDevice(compilation, targetDevice) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor != nullptr) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetInput_0100
int SubAiNnrtFuncNorthExecutorSetInput0100()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    uint32_t inputIndex = 0;
    const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[0];
    auto quantParam = operandTem.quantParam;
    OH_NN_Tensor operand = {
        operandTem.dataType,
        (uint32_t)operandTem.shape.size(),
        operandTem.shape.data(),
        quantParam,
        operandTem.type
    };
    
    OH_NN_ReturnCode setInputRet = OH_NNExecutor_SetInput(
        nullptr, inputIndex, &operand, operandTem.data, operandTem.length);
    if (setInputRet != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation);
        return -1;
    }
    
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetInput_0200
int SubAiNnrtFuncNorthExecutorSetInput0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    uint32_t inputIndex = 100000;
    const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[0];
    auto quantParam = operandTem.quantParam;
    OH_NN_Tensor operand = {
        operandTem.dataType,
        (uint32_t)operandTem.shape.size(),
        operandTem.shape.data(),
        quantParam,
        operandTem.type
    };
    
    OH_NN_ReturnCode setInputRet = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, operandTem.data, operandTem.length);
    if (setInputRet != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetInput_0300
int SubAiNnrtFuncNorthExecutorSetInput0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    uint32_t inputIndex = 0;
    const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[0];
    auto quantParam = operandTem.quantParam;
    OH_NN_Tensor operand = {
        operandTem.dataType,
        (uint32_t)operandTem.shape.size(),
        operandTem.shape.data(),
        quantParam,
        OH_NN_ADD_ACTIVATIONTYPE
    };
    
    OH_NN_ReturnCode setInputRet = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, operandTem.data, operandTem.length);
    if (setInputRet != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetInput_0400
int SubAiNnrtFuncNorthExecutorSetInput0400()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    uint32_t inputIndex = 0;
    const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[0];
    auto quantParam = operandTem.quantParam;
    int32_t dimensions[3]{3, 3, 3};
    OH_NN_Tensor operand = {
        operandTem.dataType,
        (uint32_t)operandTem.shape.size(),
        dimensions,
        quantParam,
        operandTem.type
    };
    
    OH_NN_ReturnCode setInputRet = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, operandTem.data, operandTem.length);
    if (setInputRet != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetInput_0500
int SubAiNnrtFuncNorthExecutorSetInput0500()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    uint32_t inputIndex = 0;
    const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[0];
    auto quantParam = operandTem.quantParam;
    OH_NN_Tensor operand = {
        operandTem.dataType,
        (uint32_t)operandTem.shape.size(),
        operandTem.shape.data(),
        quantParam,
        operandTem.type
    };
    
    OH_NN_ReturnCode setInputRet = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, nullptr, operandTem.length);
    if (setInputRet != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetInput_0600
int SubAiNnrtFuncNorthExecutorSetInput0600()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    uint32_t inputIndex = 0;
    const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[0];
    auto quantParam = operandTem.quantParam;
    OH_NN_Tensor operand = {
        operandTem.dataType,
        (uint32_t)operandTem.shape.size(),
        operandTem.shape.data(),
        quantParam,
        operandTem.type
    };
    
    OH_NN_ReturnCode setInputRet = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, operandTem.data, 0);
    if (setInputRet != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetInput_0700
int SubAiNnrtFuncNorthExecutorSetInput0700()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    uint32_t inputIndex = 0;
    const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[0];
    auto quantParam = operandTem.quantParam;
    OH_NN_Tensor operand = {
        operandTem.dataType,
        (uint32_t)operandTem.shape.size(),
        operandTem.shape.data(),
        quantParam,
        operandTem.type
    };
    
    OH_NN_ReturnCode ret1 = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, operandTem.data, operandTem.length);
    if (ret1 != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    OH_NN_ReturnCode ret2 = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, operandTem.data, operandTem.length);
    if (ret2 != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetOutput_0100
int SubAiNnrtFuncNorthExecutorSetOutput0100()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    int compileRet = CompileGraphMock(compilation, g_executorCompileParam);
    if (compileRet != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    int result = ProcessInputOutputLoop(executor, model, compilation, true, 0);
    if (result != 0) {
        return result;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetOutput_0200
int SubAiNnrtFuncNorthExecutorSetOutput0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    int compileRet = CompileGraphMock(compilation, g_executorCompileParam);
    if (compileRet != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    int result = ProcessInputOutputLoop(executor, model, compilation, false, 10000);
    if (result != 0) {
        return result;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// 辅助函数：处理输出设置（nullptr数据测试）
static int ProcessOutputWithNullData(OH_NNExecutor *executor, uint32_t outputIndex, size_t length)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOutput(executor, outputIndex, nullptr, length);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetOutput_0300
int SubAiNnrtFuncNorthExecutorSetOutput0300()
{
    OH_NNModel *model = nullptr;
    OH_NNCompilation *compilation = nullptr;
    
    if (CreateAndCompileModel(&model, &compilation) != 0) {
        return -1;
    }
    
    OH_NNExecutor *executor = CreateExecutor(compilation, model);
    if (executor == nullptr) {
        return -1;
    }
    
    // 测试nullptr数据的特殊逻辑
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        OH_NN_Tensor operand = CreateTensorFromOperand(operandTem);
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            if (ProcessInput(executor, inputIndex, operand, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            inputIndex += 1;
            continue;
        }
        
        auto outputBegin = g_executorGraphArgs.outputIndices.begin();
        auto outputEnd = g_executorGraphArgs.outputIndices.end();
        if (std::find(outputBegin, outputEnd, i) != outputEnd) {
            if (ProcessOutputWithNullData(executor, outputIndex, operandTem.length) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            outputIndex += 1;
        }
    }
    
    Free(model, compilation, executor);
    return 0;
}

// 辅助函数：处理输出设置（长度为0的无效参数测试）
static int ProcessOutputWithInvalidLength(OH_NNExecutor *executor, uint32_t outputIndex,
    const OHNNOperandTest &operandTem)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOutput(executor, outputIndex, operandTem.data, 0);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetOutput_0400
int SubAiNnrtFuncNorthExecutorSetOutput0400()
{
    OH_NNModel *model = nullptr;
    OH_NNCompilation *compilation = nullptr;
    
    if (CreateAndCompileModel(&model, &compilation) != 0) {
        return -1;
    }
    
    OH_NNExecutor *executor = CreateExecutor(compilation, model);
    if (executor == nullptr) {
        return -1;
    }
    
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType,
            (uint32_t)operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam,
            operandTem.type
        };
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            OH_NN_ReturnCode ret = OH_NNExecutor_SetInput(
                executor, inputIndex, &operand, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                Free(model, compilation, executor);
                return -1;
            }
            inputIndex += 1;
            continue;
        }
        
        auto outputBegin = g_executorGraphArgs.outputIndices.begin();
        auto outputEnd = g_executorGraphArgs.outputIndices.end();
        if (std::find(outputBegin, outputEnd, i) != outputEnd) {
            if (ProcessOutputWithInvalidLength(executor, outputIndex, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            outputIndex += 1;
        }
    }
    
    Free(model, compilation, executor);
    return 0;
}

// 辅助函数：处理输出设置（重复设置测试）
static int ProcessOutputTwice(OH_NNExecutor *executor, uint32_t outputIndex,
    const OHNNOperandTest &operandTem)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOutput(
        executor, outputIndex, operandTem.data, operandTem.length);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    ret = OH_NNExecutor_SetOutput(
        executor, outputIndex, operandTem.data, operandTem.length);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_SetOutput_0500
int SubAiNnrtFuncNorthExecutorSetOutput0500()
{
    OH_NNModel *model = nullptr;
    OH_NNCompilation *compilation = nullptr;
    
    if (CreateAndCompileModel(&model, &compilation) != 0) {
        return -1;
    }
    
    OH_NNExecutor *executor = CreateExecutor(compilation, model);
    if (executor == nullptr) {
        return -1;
    }
    
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType,
            (uint32_t)operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam,
            operandTem.type
        };
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            if (ProcessInput(executor, inputIndex, operand, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            inputIndex += 1;
            continue;
        }
        
        auto outputBegin = g_executorGraphArgs.outputIndices.begin();
        auto outputEnd = g_executorGraphArgs.outputIndices.end();
        if (std::find(outputBegin, outputEnd, i) != outputEnd) {
            if (ProcessOutputTwice(executor, outputIndex, operandTem) != 0) {
                Free(model, compilation, executor);
                return -1;
            }
            outputIndex += 1;
        }
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Run_0100
int SubAiNnrtFuncNorthExecutorRun0100()
{
    if (OH_NNExecutor_Run(nullptr) != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Run_0200
int SubAiNnrtFuncNorthExecutorRun0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    if (OH_NNExecutor_Run(executor) != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// 辅助函数：设置所有输入（Run0300专用）
static int SetAllInputsForRun0300(OH_NNExecutor *executor, OH_NNModel *model,
    OH_NNCompilation *compilation)
{
    uint32_t inputIndex = 0;
    for (size_t i = 0; i < g_executorGraphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[i];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {
            operandTem.dataType,
            (uint32_t)operandTem.shape.size(),
            operandTem.shape.data(),
            quantParam,
            operandTem.type
        };
        
        auto inputBegin = g_executorGraphArgs.inputIndices.begin();
        auto inputEnd = g_executorGraphArgs.inputIndices.end();
        if (std::find(inputBegin, inputEnd, i) != inputEnd) {
            OH_NN_ReturnCode ret = OH_NNExecutor_SetInput(
                executor, inputIndex, &operand, operandTem.data, operandTem.length);
            if (ret != OH_NN_SUCCESS) {
                Free(model, compilation, executor);
                return -1;
            }
            inputIndex++;
        }
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Run_0300
int SubAiNnrtFuncNorthExecutorRun0300()
{
    OH_NNModel *model = nullptr;
    OH_NNCompilation *compilation = nullptr;
    
    if (CreateAndCompileModel(&model, &compilation) != 0) {
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    if (SetAllInputsForRun0300(executor, model, compilation) != 0) {
        return -1;
    }
    
    if (OH_NNExecutor_Run(executor) != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// 辅助函数：设置输入输出（Run0400专用）
static int SetInputOutputForRun0400(OH_NNExecutor *executor, OH_NNModel *model,
    OH_NNCompilation *compilation)
{
    uint32_t inputIndex = 0;
    uint32_t outputIndex = 0;
    const OHNNOperandTest &operandTem = g_executorGraphArgs.operands[0];
    auto quantParam = operandTem.quantParam;
    OH_NN_Tensor operand = {
        operandTem.dataType,
        (uint32_t)operandTem.shape.size(),
        operandTem.shape.data(),
        quantParam,
        operandTem.type
    };
    
    OH_NN_ReturnCode ret = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, operandTem.data, operandTem.length);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    
    const OHNNOperandTest &operandOut = g_executorGraphArgs.operands[3];
    ret = OH_NNExecutor_SetOutput(
        executor, outputIndex, operandOut.data, operandOut.length);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Run_0400
int SubAiNnrtFuncNorthExecutorRun0400()
{
    OH_NNModel *model = nullptr;
    OH_NNCompilation *compilation = nullptr;
    
    if (CreateAndCompileModel(&model, &compilation) != 0) {
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    if (SetInputOutputForRun0400(executor, model, compilation) != 0) {
        return -1;
    }
    
    if (OH_NNExecutor_Run(executor) != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Run_0600
int SubAiNnrtFuncNorthExecutorRun0600()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    int ret = ExecuteGraphMock(
        executor, g_executorGraphArgs, g_executorAddModel.expectValue);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    
    if (!CheckOutput(g_executorAddModel.outputValue, g_executorAddModel.expectValue)) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_GetOutputDimensions_0100到0800 - GetOutputShape测试,简化实现
int SubAiNnrtFuncNorthExecutorGetOutputDimensions0100()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    int ret = ExecuteGraphMock(
        executor, g_executorGraphArgs, g_executorAddModel.expectValue);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    
    int32_t *outputDimensions = nullptr;
    uint32_t outputDimensionCount{0};
    uint32_t addOutputIndex = {0};
    
    OH_NN_ReturnCode retCode = OH_NNExecutor_GetOutputShape(
        nullptr, addOutputIndex, &outputDimensions, &outputDimensionCount);
    if (retCode != OH_NN_INVALID_PARAMETER) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Destroy_0100
int SubAiNnrtFuncNorthExecutorDestroy0100()
{
    OH_NNExecutor *executor = nullptr;
    OH_NNExecutor_Destroy(&executor);
    if (executor != nullptr) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Destroy_0200
int SubAiNnrtFuncNorthExecutorDestroy0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    int ret = ExecuteGraphMock(
        executor, g_executorGraphArgs, g_executorAddModel.expectValue);
    if (ret != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    
    if (!CheckOutput(g_executorAddModel.outputValue, g_executorAddModel.expectValue)) {
        Free(model, compilation, executor);
        return -1;
    }
    
    OH_NNExecutor_Destroy(&executor);
    if (executor != nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    Free(model, compilation);
    return 0;
}

// SUB_AI_NNR_Func_North_Executor_Combine_0100 - 多线程测试
int SubAiNnrFuncNorthExecutorCombine0100()
{
    OH_NNModel *model1 = nullptr;
    OH_NNModel *model2 = nullptr;
    OH_NNCompilation *compilation1 = nullptr;
    OH_NNCompilation *compilation2 = nullptr;
    
    if (CreateAndCompileModel(&model1, &compilation1) != 0) {
        return -1;
    }
    if (CreateAndCompileModel(&model2, &compilation2) != 0) {
        Free(model1, compilation1);
        return -1;
    }
    
    OH_NNExecutor *executor1 = CreateExecutor(compilation1, model1);
    if (executor1 == nullptr) {
        Free(model2, compilation2);
        return -1;
    }
    
    OH_NNExecutor *executor2 = CreateExecutor(compilation2, model2);
    if (executor2 == nullptr) {
        Free(model1, compilation1, executor1);
        return -1;
    }
    
    // 真机测试模式下,顺序执行而非多线程
    int ret1 = ExecuteGraphMock(
        executor1, g_executorGraphArgs, g_executorAddModel.expectValue);
    int ret2 = ExecuteGraphMock(
        executor2, g_executorGraphArgs, g_executorAddModel.expectValue);
    
    Free(model1, compilation1, executor1);
    Free(model2, compilation2, executor2);
    
    if (ret1 != OH_NN_SUCCESS || ret2 != OH_NN_SUCCESS) {
        return -1;
    }
    return 0;
}

// 辅助函数：处理输入设置（包括无效索引测试）
static int ProcessInputWithInvalidIndex(OH_NNExecutor *executor, uint32_t inputIndex,
    const OH_NN_Tensor &operand, const OHNNOperandTest &operandTem, const float *valueX2)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_SetInput(
        executor, inputIndex, &operand, operandTem.data, operandTem.length);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    ret = OH_NNExecutor_SetInput(
        executor, INVALID_INPUT_INDEX, &operand, valueX2, operandTem.length);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Combine_0200
int SubAiNnrtFuncNorthExecutorCombine0200()
{
    OH_NNModel *model = nullptr;
    OH_NNCompilation *compilation = nullptr;
    
    if (CreateAndCompileModel(&model, &compilation) != 0) {
        return -1;
    }
    
    OH_NNExecutor *executor = CreateExecutor(compilation, model);
    if (executor == nullptr) {
        return -1;
    }
    
    float valueX2[4] = {3, 2, 1, 0};
    if (ProcessInputOutputWithInvalidIndex(executor, model, compilation, valueX2) != 0) {
        return -1;
    }
    
    if (OH_NNExecutor_Run(executor) != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    
    if (!CheckOutput(g_executorAddModel.outputValue, g_executorAddModel.expectValue)) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// 辅助函数：处理输出设置（包括无效偏移测试）
static int ProcessOutputWithInvalidOffset(OH_NNExecutor *executor, uint32_t outputIndex,
    const OHNNOperandTest &operandTem)
{
    OH_NN_ReturnCode ret = OH_NNExecutor_SetOutput(
        executor, outputIndex, operandTem.data, operandTem.length);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    ret = OH_NNExecutor_SetOutput(
        executor, outputIndex + INVALID_OUTPUT_OFFSET, operandTem.data, operandTem.length);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Combine_0300
int SubAiNnrtFuncNorthExecutorCombine0300()
{
    OH_NNModel *model = nullptr;
    OH_NNCompilation *compilation = nullptr;
    
    if (CreateAndCompileModel(&model, &compilation) != 0) {
        return -1;
    }
    
    OH_NNExecutor *executor = CreateExecutor(compilation, model);
    if (executor == nullptr) {
        return -1;
    }
    
    if (ProcessInputOutputWithInvalidOffset(executor, model, compilation) != 0) {
        return -1;
    }
    
    if (OH_NNExecutor_Run(executor) != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    
    if (!CheckOutput(g_executorAddModel.outputValue, g_executorAddModel.expectValue)) {
        Free(model, compilation, executor);
        return -1;
    }
    
    if (OH_NNExecutor_Run(executor) != OH_NN_SUCCESS) {
        Free(model, compilation, executor);
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Combine_0400
int SubAiNnrtFuncNorthExecutorCombine0400()
{
    OH_NNModel *model = nullptr;
    OH_NNCompilation *compilation = nullptr;
    
    if (CreateAndCompileModel(&model, &compilation) != 0) {
        return -1;
    }
    
    OH_NNExecutor *executor = CreateExecutor(compilation, model);
    if (executor == nullptr) {
        return -1;
    }
    
    OH_NN_Memory *OHNNMemory[g_executorGraphArgs.inputIndices.size()];
    
    if (ProcessInputOutputMemoryLoop(executor, model, compilation, OHNNMemory) != 0) {
        return -1;
    }
    
    if (RunAndVerifyWithMemory(executor, model, compilation, OHNNMemory) != 0) {
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}

// SUB_AI_NNRt_Func_North_Executor_Combine_0500
int SubAiNnrtFuncNorthExecutorCombine0500()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    if (BuildSingleOpGraph(model, g_executorGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    if (compilation == nullptr) {
        Free(model);
        return -1;
    }
    if (CompileGraphMock(compilation, g_executorCompileParam) != OH_NN_SUCCESS) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        Free(model, compilation);
        return -1;
    }
    
    OH_NN_Memory *outputMemory = nullptr;
    if (ProcessInputOutputForCombine0500(executor, model, compilation, &outputMemory) != 0) {
        return -1;
    }
    
    if (ProcessOutputMemoryAndRun(executor, model, compilation, &outputMemory) != 0) {
        return -1;
    }
    
    Free(model, compilation, executor);
    return 0;
}
