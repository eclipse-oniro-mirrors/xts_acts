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

#include "NeuralNetworkCoreTest.h"
#include <cstdint>
#include <map>
#include <neural_network_runtime/neural_network_runtime.h>
#include <string>

static const int16_t TYPE_NAME_SIZE = 200;
static const int16_t ARG_COUNT_2 = 2;
static const int16_t INDEX_VALUE_2 = 2;
static const int16_t INDEX_VALUE_3 = 3;
static const int16_t ARRAY_SIZE_2 = 2;
static const uint32_t SHAPE_SIZE = 3;

napi_value NNReturnCode_DynamicShape(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    size_t elementCount;
    int *shape = static_cast<int *>(std::malloc(sizeof(int) * SHAPE_SIZE));
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetElementCount(tensorDesc, &elementCount);
    if (returnValue == OH_NN_ReturnCode::OH_NN_DYNAMIC_SHAPE) {
        returnValue = OH_NN_SUCCESS;
    }
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNFuseType_FusedRelu(napi_env env, napi_callback_info info)
{
    OH_NN_FuseType returnValue = OH_NN_FuseType::OH_NN_FUSED_RELU;
    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNFuseType_FusedRelu6(napi_env env, napi_callback_info info)
{
    OH_NN_FuseType returnValue = OH_NN_FuseType::OH_NN_FUSED_RELU6;
    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static OH_NN_DeviceType GetDeviceTypeByName(std::string deviceTypeName)
{
    std::map<std::string, OH_NN_DeviceType> deviceTypeMap = {
        {std::string("OH_NN_OTHERS"), OH_NN_OTHERS},
        {std::string("OH_NN_CPU"), OH_NN_CPU},
        {std::string("OH_NN_GPU"), OH_NN_GPU},
        {std::string("OH_NN_ACCELERATOR"), OH_NN_ACCELERATOR},
    };

    auto it = deviceTypeMap.find(deviceTypeName);
    if (it != deviceTypeMap.end()) {
        return it->second;
    }
    return OH_NN_DeviceType::OH_NN_OTHERS;
}

napi_value NNDeviceTypeCommonTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    size_t deviceTypeSize = 0;
    char deviceTypeName[TYPE_NAME_SIZE] = "";
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], deviceTypeName, sizeof(deviceTypeName), &deviceTypeSize);

    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    OH_NN_DeviceType deviceType = GetDeviceTypeByName(deviceTypeName);
    if (deviceType == OH_NN_OTHERS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNDevice_GetType(0, &deviceType);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static OH_NN_DataType GetDataTypeByName(std::string dataTypeName)
{
    std::map<std::string, OH_NN_DataType> dataTypeMap = {
        {std::string("OH_NN_INT16"), OH_NN_INT16},
        {std::string("OH_NN_INT64"), OH_NN_INT64},
        {std::string("OH_NN_UINT8"), OH_NN_UINT8},
        {std::string("OH_NN_UINT16"), OH_NN_UINT16},
        {std::string("OH_NN_UINT32"), OH_NN_UINT32},
        {std::string("OH_NN_UINT64"), OH_NN_UINT64},
        {std::string("OH_NN_FLOAT16"), OH_NN_FLOAT16},
    };

    auto it = dataTypeMap.find(dataTypeName);
    if (it != dataTypeMap.end()) {
        return it->second;
    }
    return OH_NN_DataType::OH_NN_UNKNOWN;
}

napi_value NNDataTypeCommonTest(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_2;
    napi_value args[ARG_COUNT_2];
    size_t dataTypeSize = 0;
    char dataTypeName[TYPE_NAME_SIZE] = "";
    bool needTensor = false;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], dataTypeName, sizeof(dataTypeName), &dataTypeSize);
    napi_get_value_bool(env, args[1], &needTensor);

    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    OH_NN_DataType dataType = GetDataTypeByName(dataTypeName);
    if (dataType == OH_NN_UNKNOWN) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }

    NN_TensorDesc *tensorDesc = nullptr;
    if (needTensor) {
        tensorDesc = OH_NNTensorDesc_Create();
        if (tensorDesc == nullptr) {
            NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
            return result;
        }
    }
    returnValue = OH_NNTensorDesc_SetDataType(tensorDesc, dataType);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static void AddOpTypeToMapOne(std::map<std::string, OH_NN_OperationType>& opTypeMap)
{
    opTypeMap.emplace(std::string("OH_NN_OPS_REDUCE_ALL"), OH_NN_OPS_REDUCE_ALL);
    opTypeMap.emplace(std::string("OH_NN_OPS_QUANT_DTYPE_CAST"), OH_NN_OPS_QUANT_DTYPE_CAST);
    opTypeMap.emplace(std::string("OH_NN_OPS_TOP_K"), OH_NN_OPS_TOP_K);
    opTypeMap.emplace(std::string("OH_NN_OPS_ARG_MAX"), OH_NN_OPS_ARG_MAX);
    opTypeMap.emplace(std::string("OH_NN_OPS_UNSQUEEZE"), OH_NN_OPS_UNSQUEEZE);
    opTypeMap.emplace(std::string("OH_NN_OPS_GELU"), OH_NN_OPS_GELU);
    opTypeMap.emplace(std::string("OH_NN_OPS_UNSTACK"), OH_NN_OPS_UNSTACK);
    opTypeMap.emplace(std::string("OH_NN_OPS_ABS"), OH_NN_OPS_ABS);
    opTypeMap.emplace(std::string("OH_NN_OPS_ERF"), OH_NN_OPS_ERF);
    opTypeMap.emplace(std::string("OH_NN_OPS_AVG_POOL"), OH_NN_OPS_AVG_POOL);
    opTypeMap.emplace(std::string("OH_NN_OPS_BATCH_NORM"), OH_NN_OPS_BATCH_NORM);
    opTypeMap.emplace(std::string("OH_NN_OPS_BATCH_TO_SPACE_ND"), OH_NN_OPS_BATCH_TO_SPACE_ND);
    opTypeMap.emplace(std::string("OH_NN_OPS_BIAS_ADD"), OH_NN_OPS_BIAS_ADD);
    opTypeMap.emplace(std::string("OH_NN_OPS_CAST"), OH_NN_OPS_CAST);
    opTypeMap.emplace(std::string("OH_NN_OPS_FILL"), OH_NN_OPS_FILL);
    opTypeMap.emplace(std::string("OH_NN_OPS_FULL_CONNECTION"), OH_NN_OPS_FULL_CONNECTION);
    opTypeMap.emplace(std::string("OH_NN_OPS_GATHER"), OH_NN_OPS_GATHER);
    opTypeMap.emplace(std::string("OH_NN_OPS_HSWISH"), OH_NN_OPS_HSWISH);
    opTypeMap.emplace(std::string("OH_NN_OPS_LESS_EQUAL"), OH_NN_OPS_LESS_EQUAL);
    opTypeMap.emplace(std::string("OH_NN_OPS_MATMUL"), OH_NN_OPS_MATMUL);
    opTypeMap.emplace(std::string("OH_NN_OPS_MAXIMUM"), OH_NN_OPS_MAXIMUM);
    opTypeMap.emplace(std::string("OH_NN_OPS_MAX_POOL"), OH_NN_OPS_MAX_POOL);
    opTypeMap.emplace(std::string("OH_NN_OPS_MUL"), OH_NN_OPS_MUL);
    opTypeMap.emplace(std::string("OH_NN_OPS_EXPAND_DIMS"), OH_NN_OPS_EXPAND_DIMS);
    opTypeMap.emplace(std::string("OH_NN_OPS_ELTWISE"), OH_NN_OPS_ELTWISE);
    opTypeMap.emplace(std::string("OH_NN_OPS_EXP"), OH_NN_OPS_EXP);
    opTypeMap.emplace(std::string("OH_NN_OPS_LESS"), OH_NN_OPS_LESS);
    opTypeMap.emplace(std::string("OH_NN_OPS_SELECT"), OH_NN_OPS_SELECT);
    opTypeMap.emplace(std::string("OH_NN_OPS_SQUARE"), OH_NN_OPS_SQUARE);
    opTypeMap.emplace(std::string("OH_NN_OPS_FLATTEN"), OH_NN_OPS_FLATTEN);
    opTypeMap.emplace(std::string("OH_NN_OPS_DEPTH_TO_SPACE"), OH_NN_OPS_DEPTH_TO_SPACE);
    opTypeMap.emplace(std::string("OH_NN_OPS_RANGE"), OH_NN_OPS_RANGE);
    opTypeMap.emplace(std::string("OH_NN_OPS_INSTANCE_NORM"), OH_NN_OPS_INSTANCE_NORM);
    opTypeMap.emplace(std::string("OH_NN_OPS_CONSTANT_OF_SHAPE"), OH_NN_OPS_CONSTANT_OF_SHAPE);
    opTypeMap.emplace(std::string("OH_NN_OPS_BROADCAST_TO"), OH_NN_OPS_BROADCAST_TO);
    opTypeMap.emplace(std::string("OH_NN_OPS_EQUAL"), OH_NN_OPS_EQUAL);
    opTypeMap.emplace(std::string("OH_NN_OPS_GREATER"), OH_NN_OPS_GREATER);
    opTypeMap.emplace(std::string("OH_NN_OPS_NOT_EQUAL"), OH_NN_OPS_NOT_EQUAL);
    opTypeMap.emplace(std::string("OH_NN_OPS_GREATER_EQUAL"), OH_NN_OPS_GREATER_EQUAL);
    opTypeMap.emplace(std::string("OH_NN_OPS_LEAKY_RELU"), OH_NN_OPS_LEAKY_RELU);
    opTypeMap.emplace(std::string("OH_NN_OPS_LSTM"), OH_NN_OPS_LSTM);
    opTypeMap.emplace(std::string("OH_NN_OPS_CLIP"), OH_NN_OPS_CLIP);
    opTypeMap.emplace(std::string("OH_NN_OPS_ALL"), OH_NN_OPS_ALL);
    opTypeMap.emplace(std::string("OH_NN_OPS_ASSERT"), OH_NN_OPS_ASSERT);
    opTypeMap.emplace(std::string("OH_NN_OPS_COS"), OH_NN_OPS_COS);
}

static void AddOpTypeToMapTwo(std::map<std::string, OH_NN_OperationType>& opTypeMap)
{
    opTypeMap.emplace(std::string("OH_NN_OPS_LOG"), OH_NN_OPS_LOG);
    opTypeMap.emplace(std::string("OH_NN_OPS_LOGICAL_AND"), OH_NN_OPS_LOGICAL_AND);
    opTypeMap.emplace(std::string("OH_NN_OPS_LOGICAL_NOT"), OH_NN_OPS_LOGICAL_NOT);
    opTypeMap.emplace(std::string("OH_NN_OPS_MOD"), OH_NN_OPS_MOD);
    opTypeMap.emplace(std::string("OH_NN_OPS_NEG"), OH_NN_OPS_NEG);
    opTypeMap.emplace(std::string("OH_NN_OPS_RECIPROCAL"), OH_NN_OPS_RECIPROCAL);
    opTypeMap.emplace(std::string("OH_NN_OPS_SIN"), OH_NN_OPS_SIN);
    opTypeMap.emplace(std::string("OH_NN_OPS_WHERE"), OH_NN_OPS_WHERE);
    opTypeMap.emplace(std::string("OH_NN_OPS_SPARSE_TO_DENSE"), OH_NN_OPS_SPARSE_TO_DENSE);
    opTypeMap.emplace(std::string("OH_NN_OPS_LOGICAL_OR"), OH_NN_OPS_LOGICAL_OR);
    opTypeMap.emplace(std::string("OH_NN_OPS_CEIL"), OH_NN_OPS_CEIL);
    opTypeMap.emplace(std::string("OH_NN_OPS_CROP"), OH_NN_OPS_CROP);
    opTypeMap.emplace(std::string("OH_NN_OPS_DETECTION_POST_PROCESS"), OH_NN_OPS_DETECTION_POST_PROCESS);
    opTypeMap.emplace(std::string("OH_NN_OPS_FLOOR"), OH_NN_OPS_FLOOR);
    opTypeMap.emplace(std::string("OH_NN_OPS_L2_NORMALIZE"), OH_NN_OPS_L2_NORMALIZE);
    opTypeMap.emplace(std::string("OH_NN_OPS_LOG_SOFTMAX"), OH_NN_OPS_LOG_SOFTMAX);
    opTypeMap.emplace(std::string("OH_NN_OPS_LRN"), OH_NN_OPS_LRN);
    opTypeMap.emplace(std::string("OH_NN_OPS_MINIMUM"), OH_NN_OPS_MINIMUM);
    opTypeMap.emplace(std::string("OH_NN_OPS_RANK"), OH_NN_OPS_RANK);
    opTypeMap.emplace(std::string("OH_NN_OPS_REDUCE_MAX"), OH_NN_OPS_REDUCE_MAX);
    opTypeMap.emplace(std::string("OH_NN_OPS_REDUCE_MIN"), OH_NN_OPS_REDUCE_MIN);
    opTypeMap.emplace(std::string("OH_NN_OPS_REDUCE_SUM"), OH_NN_OPS_REDUCE_SUM);
    opTypeMap.emplace(std::string("OH_NN_OPS_ROUND"), OH_NN_OPS_ROUND);
    opTypeMap.emplace(std::string("OH_NN_OPS_SCATTER_ND"), OH_NN_OPS_SCATTER_ND);
    opTypeMap.emplace(std::string("OH_NN_OPS_SPACE_TO_DEPTH"), OH_NN_OPS_SPACE_TO_DEPTH);
    opTypeMap.emplace(std::string("OH_NN_OPS_SWISH"), OH_NN_OPS_SWISH);
    opTypeMap.emplace(std::string("OH_NN_OPS_REDUCE_L2"), OH_NN_OPS_REDUCE_L2);
    opTypeMap.emplace(std::string("OH_NN_OPS_HARD_SIGMOID"), OH_NN_OPS_HARD_SIGMOID);
    opTypeMap.emplace(std::string("OH_NN_OPS_GATHER_ND"), OH_NN_OPS_GATHER_ND);
}

static TestOptional<OH_NN_OperationType> GetOpTypeByName(std::string name)
{
    TestOptional<OH_NN_OperationType> opt;
    std::map<std::string, OH_NN_OperationType> opTypeMap = {
        {std::string("OH_NN_OPS_ONE_HOT"), OH_NN_OPS_ONE_HOT},
        {std::string("OH_NN_OPS_PAD"), OH_NN_OPS_PAD},
        {std::string("OH_NN_OPS_POW"), OH_NN_OPS_POW},
        {std::string("OH_NN_OPS_SCALE"), OH_NN_OPS_SCALE},
        {std::string("OH_NN_OPS_SHAPE"), OH_NN_OPS_SHAPE},
        {std::string("OH_NN_OPS_SIGMOID"), OH_NN_OPS_SIGMOID},
        {std::string("OH_NN_OPS_SLICE"), OH_NN_OPS_SLICE},
        {std::string("OH_NN_OPS_SOFTMAX"), OH_NN_OPS_SOFTMAX},
        {std::string("OH_NN_OPS_SPACE_TO_BATCH_ND"), OH_NN_OPS_SPACE_TO_BATCH_ND},
        {std::string("OH_NN_OPS_SPLIT"), OH_NN_OPS_SPLIT},
        {std::string("OH_NN_OPS_SQRT"), OH_NN_OPS_SQRT},
        {std::string("OH_NN_OPS_SQUARED_DIFFERENCE"), OH_NN_OPS_SQUARED_DIFFERENCE},
        {std::string("OH_NN_OPS_SQUEEZE"), OH_NN_OPS_SQUEEZE},
        {std::string("OH_NN_OPS_STACK"), OH_NN_OPS_STACK},
        {std::string("OH_NN_OPS_STRIDED_SLICE"), OH_NN_OPS_STRIDED_SLICE},
        {std::string("OH_NN_OPS_SUB"), OH_NN_OPS_SUB},
        {std::string("OH_NN_OPS_TANH"), OH_NN_OPS_TANH},
        {std::string("OH_NN_OPS_CONCAT"), OH_NN_OPS_CONCAT},
        {std::string("OH_NN_OPS_CONV2D"), OH_NN_OPS_CONV2D},
        {std::string("OH_NN_OPS_CONV2D_TRANSPOSE"), OH_NN_OPS_CONV2D_TRANSPOSE},
        {std::string("OH_NN_OPS_DEPTHWISE_CONV2D_NATIVE"), OH_NN_OPS_DEPTHWISE_CONV2D_NATIVE},
        {std::string("OH_NN_OPS_DIV"), OH_NN_OPS_DIV},
        {std::string("OH_NN_OPS_TILE"), OH_NN_OPS_TILE},
        {std::string("OH_NN_OPS_TRANSPOSE"), OH_NN_OPS_TRANSPOSE},
        {std::string("OH_NN_OPS_REDUCE_MEAN"), OH_NN_OPS_REDUCE_MEAN},
        {std::string("OH_NN_OPS_RESIZE_BILINEAR"), OH_NN_OPS_RESIZE_BILINEAR},
        {std::string("OH_NN_OPS_RSQRT"), OH_NN_OPS_RSQRT},
        {std::string("OH_NN_OPS_RESHAPE"), OH_NN_OPS_RESHAPE},
        {std::string("OH_NN_OPS_PRELU"), OH_NN_OPS_PRELU},
        {std::string("OH_NN_OPS_RELU"), OH_NN_OPS_RELU},
        {std::string("OH_NN_OPS_RELU6"), OH_NN_OPS_RELU6},
        {std::string("OH_NN_OPS_LAYER_NORM"), OH_NN_OPS_LAYER_NORM},
        {std::string("OH_NN_OPS_REDUCE_PROD"), OH_NN_OPS_REDUCE_PROD},
    };
    AddOpTypeToMapOne(opTypeMap);
    AddOpTypeToMapTwo(opTypeMap);

    auto it = opTypeMap.find(name);
    if (it != opTypeMap.end()) {
        opt = it->second;
    }
    return opt;
}

static OH_NN_TensorType GetTensorType(OH_NN_OperationType opType)
{
    std::map<OH_NN_OperationType, OH_NN_TensorType> tensorMap = {
        {OH_NN_OPS_ELTWISE, OH_NN_ELTWISE_MODE},
    };

    auto it = tensorMap.find(opType);
    if (it != tensorMap.end()) {
        return it->second;
    }
    return OH_NN_TENSOR;
}

static OH_NN_ReturnCode AddOperationTestCommon(OH_NN_OperationType opType, OH_NN_TensorType tensorType, bool needModel,
                                               OH_NN_UInt32Array **indices)
{
    if (!needModel) {
        return OH_NNModel_AddOperation(nullptr, opType, indices[0], indices[1], indices[ARRAY_SIZE_2]);
    }

    OH_NNModel *model = OH_NNModel_Construct();
    const int dim[ARRAY_SIZE_2] = {INDEX_VALUE_2, INDEX_VALUE_2};
    const OH_NN_Tensor tensor = {OH_NN_FLOAT32, INDEX_VALUE_2, dim, nullptr, OH_NN_TensorType::OH_NN_TENSOR};
    OH_NNModel_AddTensor(model, &tensor);
    OH_NNModel_AddTensor(model, &tensor);
    OH_NNModel_AddTensor(model, &tensor);

    const OH_NN_Tensor tensorParam = {OH_NN_INT8, 0, nullptr, nullptr, tensorType};
    OH_NNModel_AddTensor(model, &tensorParam);
    uint32_t index = 3;
    const int8_t activation = 0;
    OH_NNModel_SetTensorData(model, index, static_cast<const void *>(&activation), sizeof(int8_t));

    return OH_NNModel_AddOperation(model, opType, indices[0], indices[1], indices[ARRAY_SIZE_2]);
}

napi_value NNOperationType_OpsExpandDimsA(napi_env env, napi_callback_info info)
{
    uint32_t inputIndexs[ARRAY_SIZE_2] = {0, 1};
    uint32_t outputIndexs[1] = {INDEX_VALUE_2};
    OH_NN_UInt32Array inputIndices{inputIndexs, INDEX_VALUE_2};
    OH_NN_UInt32Array outputIndices{outputIndexs, 1};
    OH_NN_UInt32Array paramIndices{nullptr, 0};
    OH_NN_UInt32Array* indices[] = {&paramIndices, &inputIndices, &outputIndices};

    OH_NN_ReturnCode returnValue;
    OH_NN_OperationType opType = OH_NN_OperationType::OH_NN_OPS_EXPAND_DIMS;
    returnValue = AddOperationTestCommon(opType, OH_NN_TensorType::OH_NN_TENSOR, true, indices);
    napi_value result;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNOperationTypeCommonTest(napi_env env, napi_callback_info info)
{
    size_t argc = ARG_COUNT_2;
    napi_value args[ARG_COUNT_2];
    size_t opTypeSize = 0;
    char opTypeName[TYPE_NAME_SIZE] = "";
    bool needModel = false;
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_get_value_string_utf8(env, args[0], opTypeName, sizeof(opTypeName), &opTypeSize);
    napi_get_value_bool(env, args[1], &needModel);

    OH_NN_ReturnCode returnValue;
    napi_value result;
    TestOptional<OH_NN_OperationType> opType = GetOpTypeByName(opTypeName);
    if (!opType.HasValue()) {
        NAPI_CALL(env, napi_create_int32(env, OH_NN_ReturnCode::OH_NN_FAILED, &result));
        return result;
    }
    OH_NN_TensorType tensorType = GetTensorType(opType.Value());

    uint32_t inputIndexs[ARRAY_SIZE_2] = {0, 1};
    uint32_t outputIndexs[1] = {INDEX_VALUE_2};
    uint32_t paramIndexs[1] = {INDEX_VALUE_3};
    OH_NN_UInt32Array inputIndices{inputIndexs, INDEX_VALUE_2};
    OH_NN_UInt32Array outputIndices{outputIndexs, 1};
    OH_NN_UInt32Array paramIndices{paramIndexs, 1};
    OH_NN_UInt32Array* indices[] = {&paramIndices, &inputIndices, &outputIndices};

    returnValue = AddOperationTestCommon(opType.Value(), tensorType, needModel, indices);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}