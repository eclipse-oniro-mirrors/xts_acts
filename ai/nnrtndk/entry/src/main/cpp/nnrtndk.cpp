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

#include "common/native_common.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include <cstring>
#include <js_native_api.h>
#include <neural_network_runtime/neural_network_runtime.h>
#include <node_api.h>
#include <string>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_3 3
#define PARAM_4 4
#define MPARAM_1 (-1)
#define PARAM_100000 100000

#define SUCCESS 0
#define RETURN_1 1
#define FAIL (-1)

void Free(OH_NNModel *model) { OH_NNModel_Destroy(&model); };
void FreeCompilation(OH_NNCompilation *compilation) { OH_NNCompilation_Destroy(&compilation); };
struct OHNNOperandTest {
    OH_NN_DataType dataType;
    OH_NN_TensorType type;
    std::vector<int32_t> shape;
    void *data{nullptr};
    int32_t length{PARAM_0};
    const OH_NN_QuantParam *quantParam = nullptr;
};
struct OHNNGraphArgs {
    OH_NN_OperationType operationType;
    std::vector<OHNNOperandTest> operands;
    std::vector<uint32_t> paramIndices;
    std::vector<uint32_t> inputIndices;
    std::vector<uint32_t> outputIndices;
    bool build = true;
    bool specifyIO = true;
    bool addOperation = true;
};

static napi_value OHNNModelConstructOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    if (model != nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value OHNNModelConstructTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model_first = OH_NNModel_Construct();
    OH_NNModel *model_second = OH_NNModel_Construct();
    if ((model_first != nullptr) && (model_second != nullptr) && (model_first != model_second)) {
        ret = SUCCESS;
    }
    Free(model_first);
    Free(model_second);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value OHNNModelAddTensorOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    if (model != nullptr) {
        int32_t dimensions[PARAM_3]{PARAM_3, PARAM_2, PARAM_2};
        OH_NN_Tensor operand{OH_NN_FLOAT32, PARAM_3, dimensions, nullptr, OH_NN_TENSOR};
        OH_NN_ReturnCode addTensor_ret = OH_NNModel_AddTensor(model, &operand);
        if (addTensor_ret == OH_NN_SUCCESS) {
            ret = SUCCESS;
        }
    }
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNModelAddTensorTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    int32_t dimensions[PARAM_3]{PARAM_3, PARAM_2, PARAM_2};
    OH_NN_Tensor operand{OH_NN_FLOAT32, PARAM_3, dimensions, nullptr, OH_NN_TENSOR};
    OH_NN_ReturnCode addTensor_ret = OH_NNModel_AddTensor(nullptr, &operand);
    if (addTensor_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNModelSetTensorDataOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    if (model != nullptr) {

        float inputValue0[PARAM_4] = {PARAM_0, PARAM_1, PARAM_2, PARAM_3};

        OHNNOperandTest operand;
        operand.dataType = OH_NN_FLOAT32;
        operand.type = OH_NN_TENSOR;
        operand.shape = {PARAM_1, PARAM_2, PARAM_2, PARAM_1};
        operand.data = inputValue0;
        operand.length = PARAM_4 * sizeof(float);
        OH_NN_Tensor operandSor{OH_NN_FLOAT32, PARAM_4, operand.shape.data(), nullptr, OH_NN_TENSOR};
        OH_NNModel_AddTensor(model, &operandSor);

        OH_NN_ReturnCode setTensor_ret = OH_NNModel_SetTensorData(model, PARAM_0, operand.data, operand.length);
        if (setTensor_ret == OH_NN_SUCCESS) {
            ret = SUCCESS;
        }
    }
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNModelSetTensorDataTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    int8_t activationValue{PARAM_0};
    OH_NN_ReturnCode setTensor_ret =
        OH_NNModel_SetTensorData(nullptr, PARAM_1, (void *)&activationValue, sizeof(int8_t));
    if (setTensor_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

OHNNGraphArgs addTesorAndSetTensor(OH_NNModel *model)
{
    float inputValue[PARAM_4] = {PARAM_0, PARAM_1, PARAM_2, PARAM_3};
    OHNNOperandTest operand;
    operand.dataType = OH_NN_FLOAT32;
    operand.type = OH_NN_TENSOR;
    operand.shape = {PARAM_1, PARAM_2, PARAM_2, PARAM_1};
    operand.data = inputValue;
    operand.length = PARAM_4 * sizeof(float);

    OHNNOperandTest operand2;
    operand2.dataType = OH_NN_FLOAT32;
    operand2.type = OH_NN_TENSOR;
    operand2.shape = {PARAM_1, PARAM_2, PARAM_2, PARAM_1};
    operand2.data = inputValue;
    operand2.length = PARAM_4 * sizeof(float);

    float outputValue[PARAM_4] = {PARAM_0};
    int8_t activationValue = OH_NN_FUSED_NONE;
    OHNNOperandTest activation = {OH_NN_INT8, OH_NN_ADD_ACTIVATIONTYPE, {}, &activationValue, sizeof(int8_t)};

    OHNNOperandTest output = {
        OH_NN_FLOAT32, OH_NN_TENSOR, {PARAM_1, PARAM_2, PARAM_2, PARAM_1}, outputValue, PARAM_4 * sizeof(float)};

    OHNNGraphArgs graphArgs;
    graphArgs.operationType = OH_NN_OPS_ADD;
    graphArgs.operands = {operand, operand2, activation, output};
    graphArgs.paramIndices = {PARAM_2};
    graphArgs.inputIndices = {PARAM_0, PARAM_1};
    graphArgs.outputIndices = {PARAM_3};

    for (int i = 0; i < graphArgs.operands.size(); i++) {
        const OHNNOperandTest &operandTem = graphArgs.operands[i];
        OH_NN_Tensor operand = {operandTem.dataType, (uint32_t)operandTem.shape.size(), operandTem.shape.data(),
                                nullptr, operandTem.type};
        OH_NNModel_AddTensor(model, &operand);

        if (std::find(graphArgs.paramIndices.begin(), graphArgs.paramIndices.end(), i) !=
            graphArgs.paramIndices.end()) {
            OH_NNModel_SetTensorData(model, i, operandTem.data, operandTem.length);
        }
    }
    return graphArgs;
}
static napi_value OHNNModelAddOperationOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    if (model != nullptr) {
        OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

        OH_NN_UInt32Array paramIndices;
        paramIndices.data = graphArgs.paramIndices.data();
        paramIndices.size = graphArgs.paramIndices.size();
        OH_NN_UInt32Array inputIndices;
        inputIndices.data = graphArgs.inputIndices.data();
        inputIndices.size = graphArgs.inputIndices.size();
        OH_NN_UInt32Array outputIndices;
        outputIndices.data = graphArgs.outputIndices.data();
        outputIndices.size = graphArgs.outputIndices.size();

        OH_NN_ReturnCode addOperation_ret =
            OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
        if (addOperation_ret == OH_NN_SUCCESS) {
            ret = SUCCESS;
        }
    }
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNModelAddOperationTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode addOperation_ret = OH_NNModel_AddOperation(nullptr, OH_NN_OPS_ADD, nullptr, nullptr, nullptr);
    if (addOperation_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value OHNNModelSpecifyInputsAndOutputsOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    if (model != nullptr) {
        OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

        OH_NN_UInt32Array inputIndices;
        inputIndices.data = graphArgs.inputIndices.data();
        inputIndices.size = graphArgs.inputIndices.size();
        OH_NN_UInt32Array outputIndices;
        outputIndices.data = graphArgs.outputIndices.data();
        outputIndices.size = graphArgs.outputIndices.size();

        OH_NN_ReturnCode specifyInputsAndOutputs_ret =
            OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
        if (specifyInputsAndOutputs_ret == OH_NN_SUCCESS) {
            ret = SUCCESS;
        }
    }
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNModelSpecifyInputsAndOutputsTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode specifyInputsAndOutputs_ret = OH_NNModel_SpecifyInputsAndOutputs(nullptr, nullptr, nullptr);
    if (specifyInputsAndOutputs_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNModelFinishOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    if (model != nullptr) {
        OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

        OH_NN_UInt32Array paramIndices;
        paramIndices.data = graphArgs.paramIndices.data();
        paramIndices.size = graphArgs.paramIndices.size();
        OH_NN_UInt32Array inputIndices;
        inputIndices.data = graphArgs.inputIndices.data();
        inputIndices.size = graphArgs.inputIndices.size();
        OH_NN_UInt32Array outputIndices;
        outputIndices.data = graphArgs.outputIndices.data();
        outputIndices.size = graphArgs.outputIndices.size();

        OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
        OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);

        OH_NN_ReturnCode finish_ret = OH_NNModel_Finish(model);
        if (finish_ret == OH_NN_SUCCESS) {
            ret = SUCCESS;
        }
    }
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNModelFinishTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode finish_ret = OH_NNModel_Finish(nullptr);
    if (finish_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNModelDestroy(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    if (model != nullptr) {
        OH_NNModel_Destroy(&model);
        if (model == nullptr) {
            ret = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value OHNNModelGetAvailableoperationsOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    if (model != nullptr) {

        OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

        OH_NN_UInt32Array paramIndices;
        paramIndices.data = graphArgs.paramIndices.data();
        paramIndices.size = graphArgs.paramIndices.size();
        OH_NN_UInt32Array inputIndices;
        inputIndices.data = graphArgs.inputIndices.data();
        inputIndices.size = graphArgs.inputIndices.size();
        OH_NN_UInt32Array outputIndices;
        outputIndices.data = graphArgs.outputIndices.data();
        outputIndices.size = graphArgs.outputIndices.size();

        OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
        OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
        OH_NNModel_Finish(model);

        const bool *realSupported{nullptr};
        uint32_t opCount;
        uint32_t devicesCount{PARAM_0};
        const size_t *devicesID = nullptr;
        OH_NN_ReturnCode allDevicesId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
        if (allDevicesId_ret == OH_NN_SUCCESS) {
            if (devicesCount > PARAM_0) {
                size_t targetDevice = devicesID[PARAM_0];
                OH_NN_ReturnCode availableOperations_ret =
                    OH_NNModel_GetAvailableOperations(model, targetDevice, &realSupported, &opCount);
                if (availableOperations_ret == OH_NN_SUCCESS) {
                    ret = SUCCESS;
                }
            } else if (devicesCount == PARAM_0) {
                OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
                ret = SUCCESS;
            }
        }
    }
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNModelGetAvailableoperationsTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    size_t targetDevice{PARAM_100000};
    const bool *isSupported{nullptr};
    uint32_t opCount{PARAM_0};
    OH_NN_ReturnCode availableOperations_ret =
        OH_NNModel_GetAvailableOperations(nullptr, targetDevice, &isSupported, &opCount);
    if (availableOperations_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNCompilationConstructOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    if (model != nullptr) {
        OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

        OH_NN_UInt32Array paramIndices;
        paramIndices.data = graphArgs.paramIndices.data();
        paramIndices.size = graphArgs.paramIndices.size();
        OH_NN_UInt32Array inputIndices;
        inputIndices.data = graphArgs.inputIndices.data();
        inputIndices.size = graphArgs.inputIndices.size();
        OH_NN_UInt32Array outputIndices;
        outputIndices.data = graphArgs.outputIndices.data();
        outputIndices.size = graphArgs.outputIndices.size();

        OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
        OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
        OH_NN_ReturnCode finish_ret = OH_NNModel_Finish(model);
        if (finish_ret == OH_NN_SUCCESS) {
            OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
            if (compilation != nullptr) {
                ret = SUCCESS;
            }
            FreeCompilation(compilation);
        }
    }
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNCompilationConstructTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(nullptr);
    if (compilation == nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value OHNNCompilationSetDeviceOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();

    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);

    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value OHNNCompilationSetDeviceTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(nullptr, PARAM_0);
    if (setDevice_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}

static napi_value OHNNCompilationSetCacheOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetAllDevicesID Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode setCache_ret = OH_NNCompilation_SetCache(compilation, "./", PARAM_0);
        NAPI_ASSERT(env, setCache_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetCache Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNCompilationSetCacheTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode setCache_ret = OH_NNCompilation_SetCache(nullptr, "./", PARAM_0);
    if (setCache_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNCompilationSetPerformanceModeOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNCompilation_SetCache Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode performanceMode_ret = OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_NONE);
        if (performanceMode_ret == OH_NN_SUCCESS) {
            ret = SUCCESS;
        } else {
            ret = performanceMode_ret;
        }
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNCompilationSetPerformanceModeTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNCompilation_SetDevice Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();

    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);

    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode performanceMode_ret = OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_LOW);
        if (performanceMode_ret == OH_NN_SUCCESS) {
            ret = SUCCESS;
        } else {
            ret = performanceMode_ret;
        }
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNCompilationSetPerformanceModeThree(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode performanceMode_ret =
            OH_NNCompilation_SetPerformanceMode(compilation, OH_NN_PERFORMANCE_MEDIUM);
        if (performanceMode_ret == OH_NN_SUCCESS) {
            ret = SUCCESS;
        } else {
            ret = performanceMode_ret;
        }
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNCompilationSetPerformanceModeFour(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode performanceMode_ret = OH_NNCompilation_SetPerformanceMode(nullptr, OH_NN_PERFORMANCE_MEDIUM);
    if (performanceMode_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNCompilationSetPriorityOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();

    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);

    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");

    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");

    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode priority_ret = OH_NNCompilation_SetPriority(compilation, OH_NN_PRIORITY_NONE);
        NAPI_ASSERT(env, priority_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetPriority Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNCompilationSetPriorityTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode priority_ret = OH_NNCompilation_SetPriority(nullptr, OH_NN_PRIORITY_MEDIUM);
    if (priority_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNCompilationEnableFloat16One(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode priority_ret = OH_NNCompilation_EnableFloat16(compilation, false);
        NAPI_ASSERT(env, priority_ret == OH_NN_SUCCESS, "OH_NNCompilation_EnableFloat16 Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNCompilationEnableFloat16Two(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode priority_ret = OH_NNCompilation_EnableFloat16(nullptr, OH_NN_PRIORITY_MEDIUM);
    if (priority_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNCompilationBuildOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();

    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNCompilationBuildTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(nullptr);
    if (build_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNCompilationDestroy(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    OH_NNCompilation_Destroy(&compilation);
    NAPI_ASSERT(env, compilation == nullptr, "OH_NNCompilation_Destroy Error");
    ret = SUCCESS;
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorConstructOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        NAPI_ASSERT(env, executor != nullptr, "OH_NNExecutor_Construct Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorConstructTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNExecutor *executor = OH_NNExecutor_Construct(nullptr);
    if (executor == nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorSetInputOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNExecutor_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);

    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();

    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");

    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        NAPI_ASSERT(env, executor != nullptr, "OH_NNExecutor_Construct Error");
        uint32_t inputIndex = PARAM_0;
        const OHNNOperandTest &operandTem = graphArgs.operands[PARAM_0];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {operandTem.dataType, (uint32_t)operandTem.shape.size(), operandTem.shape.data(),
                                quantParam, operandTem.type};
        OH_NN_ReturnCode setInput =
            OH_NNExecutor_SetInput(executor, inputIndex, &operand, operandTem.data, operandTem.length);
        NAPI_ASSERT(env, setInput == OH_NN_SUCCESS, "OH_NNExecutor_SetInput Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorSetInputTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode setInput = OH_NNExecutor_SetInput(nullptr, PARAM_0, nullptr, nullptr, PARAM_0);
    if (setInput == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorSetOutputOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        NAPI_ASSERT(env, executor != nullptr, "OH_NNExecutor_Construct Error");
        uint32_t inputIndex = PARAM_0;
        uint32_t outputIndex = PARAM_0;
        const OHNNOperandTest &operandTem = graphArgs.operands[PARAM_0];
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {operandTem.dataType, (uint32_t)operandTem.shape.size(), operandTem.shape.data(),
                                quantParam, operandTem.type};
        OH_NN_ReturnCode setInput_ret =
            OH_NNExecutor_SetInput(executor, inputIndex, &operand, operandTem.data, operandTem.length);
        NAPI_ASSERT(env, setInput_ret == OH_NN_SUCCESS, "OH_NNExecutor_SetInput Error");
        inputIndex += 1;
        const OHNNOperandTest &operandOut = graphArgs.operands[PARAM_3];
        OH_NN_ReturnCode setOutput_ret =
            OH_NNExecutor_SetOutput(executor, outputIndex, operandOut.data, operandOut.length);
        NAPI_ASSERT(env, setOutput_ret == OH_NN_SUCCESS, "OH_NNExecutor_SetOutput Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorSetOutputTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode setOutput_ret = OH_NNExecutor_SetOutput(nullptr, PARAM_0, nullptr, PARAM_0);
    if (setOutput_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorGetOutputShapeOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        uint32_t inputIndex = PARAM_0;
        uint32_t outputIndex = PARAM_0;
        for (auto i = PARAM_0; i < graphArgs.operands.size(); i++) {
            const OHNNOperandTest &operandTem = graphArgs.operands[i];
            auto quantParam = operandTem.quantParam;
            OH_NN_Tensor operand = {operandTem.dataType, (uint32_t)operandTem.shape.size(), operandTem.shape.data(),
                                    quantParam, operandTem.type};
            if (std::find(graphArgs.inputIndices.begin(), graphArgs.inputIndices.end(), i) !=
                graphArgs.inputIndices.end()) {
                OH_NNExecutor_SetInput(executor, inputIndex, &operand, operandTem.data, operandTem.length);
                inputIndex += 1;
            } else if (std::find(graphArgs.outputIndices.begin(), graphArgs.outputIndices.end(), i) !=
                       graphArgs.outputIndices.end()) {
                OH_NNExecutor_SetOutput(executor, outputIndex, operandTem.data, operandTem.length);
                outputIndex += 1;
            }
        }
        OH_NN_ReturnCode run_ret = OH_NNExecutor_Run(executor);
        NAPI_ASSERT(env, run_ret == OH_NN_SUCCESS, "OH_NNExecutor_Run Error");
        int32_t *outputDimensions = nullptr;
        uint32_t outputDimensionCount{PARAM_0};
        uint32_t addOutputIndex = {PARAM_0};
        OH_NN_ReturnCode getOutput_ret =
            OH_NNExecutor_GetOutputShape(executor, addOutputIndex, &outputDimensions, &outputDimensionCount);
        NAPI_ASSERT(env, getOutput_ret == OH_NN_SUCCESS, "OH_NNExecutor_GetOutputShape Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorGetOutputShapeTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    int32_t *outputDimensions = nullptr;
    uint32_t outputDimensionCount{PARAM_0};
    uint32_t addOutputIndex = {PARAM_0};
    OH_NN_ReturnCode getOutput_ret =
        OH_NNExecutor_GetOutputShape(nullptr, addOutputIndex, &outputDimensions, &outputDimensionCount);
    if (getOutput_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorRunOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        uint32_t inputIndex = PARAM_0;
        uint32_t outputIndex = PARAM_0;
        for (auto i = 0; i < graphArgs.operands.size(); i++) {
            const OHNNOperandTest &operandTem = graphArgs.operands[i];
            auto quantParam = operandTem.quantParam;
            OH_NN_Tensor operand = {operandTem.dataType, (uint32_t)operandTem.shape.size(), operandTem.shape.data(),
                                    quantParam, operandTem.type};
            if (std::find(graphArgs.inputIndices.begin(), graphArgs.inputIndices.end(), i) !=
                graphArgs.inputIndices.end()) {
                OH_NNExecutor_SetInput(executor, inputIndex, &operand, operandTem.data, operandTem.length);
                inputIndex += 1;
            } else if (std::find(graphArgs.outputIndices.begin(), graphArgs.outputIndices.end(), i) !=
                       graphArgs.outputIndices.end()) {
                OH_NNExecutor_SetOutput(executor, outputIndex, operandTem.data, operandTem.length);
                outputIndex += 1;
            }
        }
        OH_NN_ReturnCode run_ret = OH_NNExecutor_Run(executor);
        NAPI_ASSERT(env, run_ret == OH_NN_SUCCESS, "OH_NNExecutor_Run Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorRunTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode run_ret = OH_NNExecutor_Run(nullptr);
    if (run_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorAllocateInputMemoryOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        NAPI_ASSERT(env, executor != nullptr, "OH_NNExecutor_Construct Error");
        const OHNNOperandTest &operandTem = graphArgs.operands[PARAM_0];
        OH_NN_Memory *inputMemory = OH_NNExecutor_AllocateInputMemory(executor, PARAM_0, operandTem.length);
        NAPI_ASSERT(env, inputMemory != nullptr, "OH_NNExecutor_AllocateInputMemory Error");
        ret = SUCCESS;
        OH_NNExecutor_DestroyInputMemory(executor, PARAM_0, &inputMemory);
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorAllocateInputMemoryTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_Memory *inputMemory = OH_NNExecutor_AllocateInputMemory(nullptr, PARAM_0, PARAM_0);
    if (inputMemory == nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorAllocateOutputMemoryOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        NAPI_ASSERT(env, executor != nullptr, "OH_NNExecutor_Construct Error");
        const OHNNOperandTest &operandTem = graphArgs.operands[PARAM_0];
        OH_NN_Memory *inputMemory = OH_NNExecutor_AllocateInputMemory(executor, PARAM_0, operandTem.length);
        NAPI_ASSERT(env, inputMemory != nullptr, "OH_NNExecutor_AllocateInputMemory Error");
        OH_NN_Memory *outputMemory = OH_NNExecutor_AllocateOutputMemory(executor, PARAM_0, operandTem.length);
        NAPI_ASSERT(env, outputMemory != nullptr, "OH_NNExecutor_AllocateOutputMemory Error");
        ret = SUCCESS;
        OH_NNExecutor_DestroyOutputMemory(executor, PARAM_0, &outputMemory);
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorAllocateOutputMemoryTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_Memory *inputMemory = OH_NNExecutor_AllocateOutputMemory(nullptr, PARAM_0, PARAM_0);
    if (inputMemory == nullptr) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorDestroyInputMemory(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        NAPI_ASSERT(env, executor != nullptr, "OH_NNExecutor_Construct Error");
        const OHNNOperandTest &operandTem = graphArgs.operands[PARAM_0];
        OH_NN_Memory *inputMemory = OH_NNExecutor_AllocateInputMemory(executor, PARAM_0, operandTem.length);
        OH_NNExecutor_DestroyInputMemory(executor, PARAM_0, &inputMemory);
        NAPI_ASSERT(env, inputMemory == nullptr, "OH_NNExecutor_DestroyInputMemory Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorDestroyOutputMemory(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        NAPI_ASSERT(env, executor != nullptr, "OH_NNExecutor_Construct Error");
        const OHNNOperandTest &operandTem = graphArgs.operands[PARAM_0];
        OH_NN_Memory *inputMemory = OH_NNExecutor_AllocateInputMemory(executor, PARAM_0, operandTem.length);
        NAPI_ASSERT(env, inputMemory != nullptr, "OH_NNExecutor_AllocateInputMemory Error");
        OH_NN_Memory *outputMemory = OH_NNExecutor_AllocateOutputMemory(executor, PARAM_0, operandTem.length);
        OH_NNExecutor_DestroyOutputMemory(executor, PARAM_0, &outputMemory);
        NAPI_ASSERT(env, outputMemory == nullptr, "OH_NNExecutor_DestroyOutputMemory Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorSetInputWithMemoryOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        NAPI_ASSERT(env, executor != nullptr, "OH_NNExecutor_Construct Error");
        const OHNNOperandTest &operandTem = graphArgs.operands[PARAM_0];
        OH_NN_Memory *inputMemory = OH_NNExecutor_AllocateInputMemory(executor, PARAM_0, operandTem.length);
        NAPI_ASSERT(env, inputMemory != nullptr, "OH_NNExecutor_AllocateInputMemory Error");
        auto quantParam = operandTem.quantParam;
        OH_NN_Tensor operand = {operandTem.dataType, (uint32_t)operandTem.shape.size(), operandTem.shape.data(),
                                quantParam, operandTem.type};
        OH_NN_ReturnCode setInputMemory_ret =
            OH_NNExecutor_SetInputWithMemory(executor, PARAM_0, &operand, inputMemory);
        NAPI_ASSERT(env, setInputMemory_ret == OH_NN_SUCCESS, "OH_NNExecutor_SetInputWithMemory Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorSetInputWithMemoryTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode setInputMemory_ret = OH_NNExecutor_SetInputWithMemory(nullptr, PARAM_0, nullptr, nullptr);
    if (setInputMemory_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorSetOutputWithMemoryOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        NAPI_ASSERT(env, executor != nullptr, "OH_NNExecutor_Construct Error");
        const OHNNOperandTest &operandTem = graphArgs.operands[PARAM_0];
        OH_NN_Memory *inputMemory = OH_NNExecutor_AllocateInputMemory(executor, PARAM_0, operandTem.length);
        NAPI_ASSERT(env, inputMemory != nullptr, "OH_NNExecutor_AllocateInputMemory Error");
        OH_NN_Memory *outputMemory = OH_NNExecutor_AllocateOutputMemory(executor, PARAM_0, operandTem.length);
        NAPI_ASSERT(env, outputMemory != nullptr, "OH_NNExecutor_AllocateOutputMemory Error");
        OH_NN_ReturnCode setOutputMempry_ret = OH_NNExecutor_SetOutputWithMemory(executor, PARAM_0, outputMemory);
        NAPI_ASSERT(env, setOutputMempry_ret == OH_NN_SUCCESS, "OH_NNExecutor_SetOutputWithMemory Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNExecutorSetOutputWithMemoryTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode setOutputMempry_ret = OH_NNExecutor_SetOutputWithMemory(nullptr, 0, nullptr);
    if (setOutputMempry_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNExecutorDestroy(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, name != nullptr, "OH_NNDevice_GetName Error");
        OH_NN_ReturnCode setDevice_ret = OH_NNCompilation_SetDevice(compilation, devicesID[PARAM_0]);
        NAPI_ASSERT(env, setDevice_ret == OH_NN_SUCCESS, "OH_NNCompilation_SetDevice Error");
        OH_NN_ReturnCode build_ret = OH_NNCompilation_Build(compilation);
        NAPI_ASSERT(env, build_ret == OH_NN_SUCCESS, "OH_NNCompilation_Build Error");
        OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
        OH_NNExecutor_Destroy(&executor);
        NAPI_ASSERT(env, executor == nullptr, "OH_NNExecutor_Destroy Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNDeviceGetAllDevicesIDOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    ret = SUCCESS;
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNDeviceGetAllDevicesIDTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(nullptr, PARAM_0);
    if (allDeviceId_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNDeviceGetNameOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        const char *name = nullptr;
        OH_NN_ReturnCode getDeviceName_ret = OH_NNDevice_GetName(devicesID[PARAM_0], &name);
        NAPI_ASSERT(env, getDeviceName_ret == OH_NN_SUCCESS, "OH_NNDevice_GetName Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNDeviceGetNameTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    const char *name = nullptr;
    OH_NN_ReturnCode getDeviceName_ret = OH_NNDevice_GetName(PARAM_1, &name);
    if (getDeviceName_ret == OH_NN_FAILED) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
static napi_value OHNNDeviceGetTypeOne(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NNModel *model = OH_NNModel_Construct();
    NAPI_ASSERT(env, model != nullptr, "OH_NNModel_Construct Error");
    OHNNGraphArgs graphArgs = addTesorAndSetTensor(model);
    OH_NN_UInt32Array paramIndices;
    paramIndices.data = graphArgs.paramIndices.data();
    paramIndices.size = graphArgs.paramIndices.size();
    OH_NN_UInt32Array inputIndices;
    inputIndices.data = graphArgs.inputIndices.data();
    inputIndices.size = graphArgs.inputIndices.size();
    OH_NN_UInt32Array outputIndices;
    outputIndices.data = graphArgs.outputIndices.data();
    outputIndices.size = graphArgs.outputIndices.size();
    OH_NNModel_AddOperation(model, OH_NN_OPS_ADD, &paramIndices, &inputIndices, &outputIndices);
    OH_NNModel_SpecifyInputsAndOutputs(model, &inputIndices, &outputIndices);
    OH_NNModel_Finish(model);
    OH_NNCompilation *compilation = OH_NNCompilation_Construct(model);
    NAPI_ASSERT(env, compilation != nullptr, "OH_NNCompilation_Construct Error");
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{PARAM_0};
    OH_NN_ReturnCode allDeviceId_ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    NAPI_ASSERT(env, allDeviceId_ret == OH_NN_SUCCESS, "OH_NNDevice_GetAllDevicesID Error");
    if (devicesCount > PARAM_0) {
        OH_NN_DeviceType type{OH_NN_OTHERS};
        OH_NN_ReturnCode getDeviceName_ret = OH_NNDevice_GetType(devicesID[PARAM_0], &type);
        NAPI_ASSERT(env, getDeviceName_ret == OH_NN_SUCCESS, "OH_NNDevice_GetType Error");
        ret = SUCCESS;
    } else if (devicesCount == PARAM_0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "devicesCount is 0", "no devices");
        ret = SUCCESS;
    }
    FreeCompilation(compilation);
    Free(model);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNNDeviceGetTypeTwo(napi_env env, napi_callback_info info)
{
    int ret = FAIL;
    OH_NN_DeviceType type{OH_NN_OTHERS};
    OH_NN_ReturnCode getDeviceName_ret = OH_NNDevice_GetType(MPARAM_1, &type);
    if (getDeviceName_ret == OH_NN_INVALID_PARAMETER) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);

    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHNNModelConstructOne", nullptr, OHNNModelConstructOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNModelConstructTwo", nullptr, OHNNModelConstructTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNModelAddTensorOne", nullptr, OHNNModelAddTensorOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNModelAddTensorTwo", nullptr, OHNNModelAddTensorTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNModelSetTensorDataOne", nullptr, OHNNModelSetTensorDataOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNModelSetTensorDataTwo", nullptr, OHNNModelSetTensorDataTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNModelAddOperationOne", nullptr, OHNNModelAddOperationOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNModelAddOperationTwo", nullptr, OHNNModelAddOperationTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNModelSpecifyInputsAndOutputsOne", nullptr, OHNNModelSpecifyInputsAndOutputsOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNModelSpecifyInputsAndOutputsTwo", nullptr, OHNNModelSpecifyInputsAndOutputsTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNModelFinishOne", nullptr, OHNNModelFinishOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNModelFinishTwo", nullptr, OHNNModelFinishTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNModelDestroy", nullptr, OHNNModelDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNModelGetAvailableoperationsOne", nullptr, OHNNModelGetAvailableoperationsOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNModelGetAvailableoperationsTwo", nullptr, OHNNModelGetAvailableoperationsTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNCompilationConstructOne", nullptr, OHNNCompilationConstructOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNCompilationConstructTwo", nullptr, OHNNCompilationConstructTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNCompilationSetDeviceOne", nullptr, OHNNCompilationSetDeviceOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNCompilationSetDeviceTwo", nullptr, OHNNCompilationSetDeviceTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNCompilationSetCacheOne", nullptr, OHNNCompilationSetCacheOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNCompilationSetCacheTwo", nullptr, OHNNCompilationSetCacheTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNCompilationSetPerformanceModeOne", nullptr, OHNNCompilationSetPerformanceModeOne, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNNCompilationSetPerformanceModeTwo", nullptr, OHNNCompilationSetPerformanceModeTwo, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNNCompilationSetPerformanceModeThree", nullptr, OHNNCompilationSetPerformanceModeThree, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNNCompilationSetPerformanceModeFour", nullptr, OHNNCompilationSetPerformanceModeFour, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNNCompilationSetPriorityOne", nullptr, OHNNCompilationSetPriorityOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNCompilationSetPriorityTwo", nullptr, OHNNCompilationSetPriorityTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNCompilationEnableFloat16One", nullptr, OHNNCompilationEnableFloat16One, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNCompilationEnableFloat16Two", nullptr, OHNNCompilationEnableFloat16Two, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNCompilationBuildOne", nullptr, OHNNCompilationBuildOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNCompilationBuildTwo", nullptr, OHNNCompilationBuildTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNCompilationDestroy", nullptr, OHNNCompilationDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNExecutorConstructOne", nullptr, OHNNExecutorConstructOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNExecutorConstructTwo", nullptr, OHNNExecutorConstructTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNExecutorSetInputOne", nullptr, OHNNExecutorSetInputOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNExecutorSetInputTwo", nullptr, OHNNExecutorSetInputTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNExecutorSetOutputOne", nullptr, OHNNExecutorSetOutputOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNExecutorSetOutputTwo", nullptr, OHNNExecutorSetOutputTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNExecutorGetOutputShapeOne", nullptr, OHNNExecutorGetOutputShapeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorGetOutputShapeTwo", nullptr, OHNNExecutorGetOutputShapeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorRunOne", nullptr, OHNNExecutorRunOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNExecutorRunTwo", nullptr, OHNNExecutorRunTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNExecutorAllocateInputMemoryOne", nullptr, OHNNExecutorAllocateInputMemoryOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorAllocateInputMemoryTwo", nullptr, OHNNExecutorAllocateInputMemoryTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorAllocateOutputMemoryOne", nullptr, OHNNExecutorAllocateOutputMemoryOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorAllocateOutputMemoryTwo", nullptr, OHNNExecutorAllocateOutputMemoryTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorDestroyInputMemory", nullptr, OHNNExecutorDestroyInputMemory, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorDestroyOutputMemory", nullptr, OHNNExecutorDestroyOutputMemory, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorSetInputWithMemoryOne", nullptr, OHNNExecutorSetInputWithMemoryOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorSetInputWithMemoryTwo", nullptr, OHNNExecutorSetInputWithMemoryTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorSetOutputWithMemoryOne", nullptr, OHNNExecutorSetOutputWithMemoryOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorSetOutputWithMemoryTwo", nullptr, OHNNExecutorSetOutputWithMemoryTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNNExecutorDestroy", nullptr, OHNNExecutorDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNDeviceGetAllDevicesIDOne", nullptr, OHNNDeviceGetAllDevicesIDOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNDeviceGetAllDevicesIDTwo", nullptr, OHNNDeviceGetAllDevicesIDTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNNDeviceGetNameOne", nullptr, OHNNDeviceGetNameOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNDeviceGetNameTwo", nullptr, OHNNDeviceGetNameTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNDeviceGetTypeOne", nullptr, OHNNDeviceGetTypeOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNNDeviceGetTypeTwo", nullptr, OHNNDeviceGetTypeTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nnrt",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
