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

using namespace OHOS::NeuralNetworkRuntime::Test;

// 全局变量
static AddModel g_modelAddModel;
static OHNNGraphArgs g_modelGraphArgs = g_modelAddModel.graphArgs;

// SUB_AI_NNRt_Func_North_Model_CreateModel_0100
int SubAiNnrtFuncNorthModelCreateModel0100()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_CreateModel_0200
int SubAiNnrtFuncNorthModelCreateModel0200()
{
    OH_NNModel *model_first = OH_NNModel_Construct();
    if (model_first == nullptr) {
        return -1;
    }
    
    OH_NNModel *model_second = OH_NNModel_Construct();
    if (model_second == nullptr) {
        Free(model_first);
        return -1;
    }
    
    OH_NNModel *model_third = OH_NNModel_Construct();
    if (model_third == nullptr) {
        Free(model_first);
        Free(model_second);
        return -1;
    }
    
    if (model_first == model_second) {
        Free(model_first);
        Free(model_second);
        Free(model_third);
        return -1;
    }
    if (model_first == model_third) {
        Free(model_first);
        Free(model_second);
        Free(model_third);
        return -1;
    }
    if (model_second == model_third) {
        Free(model_first);
        Free(model_second);
        Free(model_third);
        return -1;
    }
    
    Free(model_first);
    Free(model_second);
    Free(model_third);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_AddOperand_0100
int SubAiNnrtFuncNorthModelAddOperand0100()
{
    int32_t dimensions[3]{3, 2, 2};
    OH_NN_Tensor operand{OH_NN_FLOAT32, 3, dimensions, nullptr, OH_NN_TENSOR};
    OH_NN_ReturnCode ret = OH_NNModel_AddTensor(nullptr, &operand);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_AddOperand_0200
int SubAiNnrtFuncNorthModelAddOperand0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    
    OH_NN_ReturnCode ret = OH_NNModel_AddTensor(model, nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_AddOperand_0300
int SubAiNnrtFuncNorthModelAddOperand0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    
    int32_t dimensions[3]{3, 2, 2};
    OH_NN_Tensor operand{static_cast<OH_NN_DataType>(100000), 3, dimensions, nullptr, OH_NN_TENSOR};
    OH_NN_ReturnCode ret = OH_NNModel_AddTensor(model, &operand);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_AddOperand_0400
int SubAiNnrtFuncNorthModelAddOperand0400()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    
    int32_t dimensions[3]{3, 2, 2};
    OH_NN_Tensor operand{OH_NN_FLOAT32, 3, dimensions, nullptr, static_cast<OH_NN_TensorType>(100000)};
    OH_NN_ReturnCode ret = OH_NNModel_AddTensor(model, &operand);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_SetOperandValue_0100
int SubAiNnrtFuncNorthModelSetOperandValue0100()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    
    int8_t activationValue{0};
    int32_t dimensions[3]{3, 2, 2};
    OH_NN_Tensor operand{OH_NN_FLOAT32, 3, dimensions, nullptr, OH_NN_TENSOR};
    if (OH_NNModel_AddTensor(model, &operand) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NN_ReturnCode ret = OH_NNModel_SetTensorData(
        nullptr, 1, (void *)&activationValue, sizeof(int8_t));
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_SetOperandValue_0200
int SubAiNnrtFuncNorthModelSetOperandValue0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    
    int8_t activationValue{0};
    int32_t dimensions[3]{3, 2, 2};
    OH_NN_Tensor operand{OH_NN_FLOAT32, 3, dimensions, nullptr, OH_NN_TENSOR};
    if (OH_NNModel_AddTensor(model, &operand) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NN_ReturnCode ret = OH_NNModel_SetTensorData(
        model, 1000, (void *)&activationValue, sizeof(int8_t));
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_SetOperandValue_0300
int SubAiNnrtFuncNorthModelSetOperandValue0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    
    int32_t dimensions[3]{3, 2, 2};
    OH_NN_Tensor operand{OH_NN_FLOAT32, 3, dimensions, nullptr, OH_NN_TENSOR};
    if (OH_NNModel_AddTensor(model, &operand) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NN_ReturnCode ret = OH_NNModel_SetTensorData(
        model, 1, nullptr, sizeof(int8_t));
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_SetOperandValue_0400
int SubAiNnrtFuncNorthModelSetOperandValue0400()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    
    int8_t activationValue{0};
    int32_t dimensions[3]{3, 2, 2};
    OH_NN_Tensor operand{OH_NN_FLOAT32, 3, dimensions, nullptr, OH_NN_TENSOR};
    if (OH_NNModel_AddTensor(model, &operand) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    OH_NN_ReturnCode ret = OH_NNModel_SetTensorData(
        model, 1, (void *)&activationValue, 0);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_AddOperation_0100
int SubAiNnrtFuncNorthModelAddOperation0100()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    g_modelGraphArgs.specifyIO = false;
    g_modelGraphArgs.build = false;
    g_modelGraphArgs.addOperation = false;
    if (BuildSingleOpGraph(model, g_modelGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    // 新的初始化方式(先声明再赋值):
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = const_cast<uint32_t *>(g_modelGraphArgs.paramIndices.data());
    paramIndices.size = g_modelGraphArgs.paramIndices.size();
    
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = const_cast<uint32_t *>(g_modelGraphArgs.inputIndices.data());
    inputIndices.size = g_modelGraphArgs.inputIndices.size();
    
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = const_cast<uint32_t *>(g_modelGraphArgs.outputIndices.data());
    outputIndices.size = g_modelGraphArgs.outputIndices.size();

    OH_NN_ReturnCode ret = OH_NNModel_AddOperation(
        nullptr, g_modelGraphArgs.operationType,
        &paramIndices, &inputIndices, &outputIndices);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_AddOperation_0200
int SubAiNnrtFuncNorthModelAddOperation0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    g_modelGraphArgs.specifyIO = false;
    g_modelGraphArgs.build = false;
    g_modelGraphArgs.addOperation = false;
    if (BuildSingleOpGraph(model, g_modelGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    // 新的初始化方式(先声明再赋值):
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = const_cast<uint32_t *>(g_modelGraphArgs.inputIndices.data());
    inputIndices.size = g_modelGraphArgs.inputIndices.size();
    
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = const_cast<uint32_t *>(g_modelGraphArgs.outputIndices.data());
    outputIndices.size = g_modelGraphArgs.outputIndices.size();

    OH_NN_ReturnCode ret = OH_NNModel_AddOperation(
        model, g_modelGraphArgs.operationType,
        nullptr, &inputIndices, &outputIndices);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0100
int SubAiNnrtFuncNorthModelSpecifyInputsAndOutputs0100()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    g_modelGraphArgs.specifyIO = false;
    g_modelGraphArgs.build = false;
    if (BuildSingleOpGraph(model, g_modelGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    // 新的初始化方式(先声明再赋值):
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = const_cast<uint32_t *>(g_modelGraphArgs.inputIndices.data());
    inputIndices.size = g_modelGraphArgs.inputIndices.size();
    
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = const_cast<uint32_t *>(g_modelGraphArgs.outputIndices.data());
    outputIndices.size = g_modelGraphArgs.outputIndices.size();

    OH_NN_ReturnCode ret = OH_NNModel_SpecifyInputsAndOutputs(
        nullptr, &inputIndices, &outputIndices);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0200
int SubAiNnrtFuncNorthModelSpecifyInputsAndOutputs0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    g_modelGraphArgs.specifyIO = false;
    g_modelGraphArgs.build = false;
    if (BuildSingleOpGraph(model, g_modelGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    // 新的初始化方式(先声明再赋值):
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = const_cast<uint32_t *>(g_modelGraphArgs.outputIndices.data());
    outputIndices.size = g_modelGraphArgs.outputIndices.size();

    OH_NN_ReturnCode ret = OH_NNModel_SpecifyInputsAndOutputs(
        model, nullptr, &outputIndices);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_SpecifyInputsAndOutputs_0300
int SubAiNnrtFuncNorthModelSpecifyInputsAndOutputs0300()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    g_modelGraphArgs.specifyIO = false;
    g_modelGraphArgs.build = false;
    if (BuildSingleOpGraph(model, g_modelGraphArgs) != OH_NN_SUCCESS) {
        Free(model);
        return -1;
    }
    
    // 新的初始化方式(先声明再赋值):
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = const_cast<uint32_t *>(g_modelGraphArgs.inputIndices.data());
    inputIndices.size = g_modelGraphArgs.inputIndices.size();

    OH_NN_ReturnCode ret = OH_NNModel_SpecifyInputsAndOutputs(
        model, &inputIndices, nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        Free(model);
        return -1;
    }
    Free(model);
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_Finish_0100
int SubAiNnrtFuncNorthModelFinish0100()
{
    if (OH_NNModel_Finish(nullptr) != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}


// SUB_AI_NNRt_Func_North_Model_Destroy_0100
int SubAiNnrtFuncNorthModelDestroy0100()
{
    OH_NNModel *model = nullptr;
    OH_NNModel_Destroy(&model);
    if (model != nullptr) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Model_Destroy_0200
int SubAiNnrtFuncNorthModelDestroy0200()
{
    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        return -1;
    }
    OH_NNModel_Destroy(&model);
    if (model != nullptr) {
        return -1;
    }
    return 0;
}
