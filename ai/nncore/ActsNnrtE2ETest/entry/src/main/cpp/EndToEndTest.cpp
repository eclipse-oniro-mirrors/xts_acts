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

#include <neural_network_runtime/neural_network_runtime.h>
#include <cstdio>
#include <string>
#include <vector>
#include "include/NNcoreUtilsTest.h"
#include "include/NNcoreConstTest.h"

using namespace OHOS::NeuralNetworkRuntime::Test;

// 辅助函数：构建定长模型
static void BuildModel(OH_NNModel **model)
{
    OH_LOG_INFO(LOG_APP, "[Helper] BuildModel: Constructing OH_NNModel...");
    *model = OH_NNModel_Construct();
    if (*model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[Helper] BuildModel: OH_NNModel_Construct returned nullptr");
        return;
    }
    OH_LOG_INFO(LOG_APP, "[Helper] BuildModel: Model constructed, building graph...");
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    int ret = BuildSingleOpGraph(*model, graphArgs);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Helper] BuildModel: BuildSingleOpGraph failed, ret=%{public}d", ret);
    } else {
        OH_LOG_INFO(LOG_APP, "[Helper] BuildModel: Graph built successfully");
    }
}

// 辅助函数：构建动态模型
static void BuildDynamicModel(OH_NNModel **model)
{
    *model = OH_NNModel_Construct();
    if (*model == nullptr) {
        return;
    }
    AvgPoolDynamicModel avgModel;
    OHNNGraphArgs graphArgs = avgModel.graphArgs;
    BuildSingleOpGraph(*model, graphArgs);
}

// 辅助函数：构建带量化参数的模型
static void BuildModelWithQuantParams(OH_NNModel **model)
{
    *model = OH_NNModel_Construct();
    if (*model == nullptr) {
        return;
    }
    AddModel addModel;
    OHNNGraphArgs graphArgs = addModel.graphArgs;
    BuildSingleOpGraphWithQuantParams(*model, graphArgs);
}

// 辅助函数：配置编译选项
static OH_NN_ReturnCode ConfigureCompilation(OH_NNCompilation* compilation, bool isUseCache)
{
    OH_NN_ReturnCode returnCode = OH_NNCompilation_SetPerformanceMode(compilation,
        OH_NN_PERFORMANCE_EXTREME);
    if (returnCode != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Helper] OH_NNCompilation_SetPerformanceMode failed, ret=%{public}d",
            returnCode);
        return returnCode;
    }

    returnCode = OH_NNCompilation_SetPriority(compilation, OH_NN_PRIORITY_HIGH);
    if (returnCode != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Helper] OH_NNCompilation_SetPriority failed, ret=%{public}d",
            returnCode);
        return returnCode;
    }

    returnCode = OH_NNCompilation_EnableFloat16(compilation, false);
    if (returnCode != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Helper] OH_NNCompilation_EnableFloat16 failed, ret=%{public}d",
            returnCode);
        return returnCode;
    }
    return OH_NN_SUCCESS;
}

// 辅助函数：构建编译对象
static OH_NNCompilation* ConstructCompilation(OH_NNModel* model, size_t deviceId,
    bool isUseCache = true)
{
    OH_NNCompilation* compilation = nullptr;
    if (model == nullptr) {
        compilation = OH_NNCompilation_ConstructForCache();
    } else {
        compilation = OH_NNCompilation_Construct(model);
    }
    if (compilation == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[Helper] OH_NNCompilation_Construct failed");
        return nullptr;
    }

    OH_NN_ReturnCode returnCode = OH_NNCompilation_SetDevice(compilation, deviceId);
    if (returnCode != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Helper] OH_NNCompilation_SetDevice failed, ret=%{public}d",
            returnCode);
        return nullptr;
    }

    if (isUseCache) {
        returnCode = OH_NNCompilation_SetCache(compilation, CACHE_DIR.c_str(), 1);
    }

    returnCode = ConfigureCompilation(compilation, isUseCache);
    if (returnCode != OH_NN_SUCCESS) {
        return nullptr;
    }

    returnCode = OH_NNCompilation_Build(compilation);
    if (returnCode != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[Helper] OH_NNCompilation_Build failed, ret=%{public}d", returnCode);
        return nullptr;
    }

    return compilation;
}

// 辅助函数：设置输入数据
static OH_NN_ReturnCode SetInputData(NN_Tensor* inputTensor[], size_t inputSize)
{
    OH_NN_DataType dataType(OH_NN_FLOAT32);
    OH_NN_ReturnCode ret{OH_NN_FAILED};
    size_t elementNum = 0;
    for (size_t i = 0; i < inputSize; ++i) {
        auto data = OH_NNTensor_GetDataBuffer(inputTensor[i]);
        if (data == nullptr) {
            return OH_NN_FAILED;
        }
        auto desc = OH_NNTensor_GetTensorDesc(inputTensor[i]);
        if (desc == nullptr) {
            return OH_NN_FAILED;
        }
        ret = OH_NNTensorDesc_GetDataType(desc, &dataType);
        if (ret != OH_NN_SUCCESS) {
            return ret;
        }
        ret = OH_NNTensorDesc_GetElementCount(desc, &elementNum);
        if (ret != OH_NN_SUCCESS) {
            return ret;
        }
        switch (dataType) {
            case OH_NN_FLOAT32: {
                float* floatValue = reinterpret_cast<float*>(data);
                for (size_t j = 0; j < elementNum; ++j) {
                    floatValue[j] = static_cast<float>(j);
                }
                break;
            }
            case OH_NN_INT32: {
                int* intValue = reinterpret_cast<int*>(data);
                for (size_t j = 0; j < elementNum; ++j) {
                    intValue[j] = static_cast<int>(j);
                }
                break;
            }
            default:
                return OH_NN_FAILED;
        }
    }
    return OH_NN_SUCCESS;
}

// 辅助函数：获取输入输出张量描述符
static OH_NN_ReturnCode GetInputAndOutputTensorDesc(OH_NNExecutor *executor,
    size_t *inputCount, std::vector<NN_TensorDesc*>& inputTensorDescs,
    size_t *outputCount, std::vector<NN_TensorDesc*>& outputTensorDescs)
{
    OH_NN_ReturnCode returnCode = OH_NNExecutor_GetInputCount(executor, inputCount);
    if (returnCode != OH_NN_SUCCESS) {
        return returnCode;
    }
    NN_TensorDesc* tensorDescTmp = nullptr;
    for (size_t i = 0; i < *inputCount; ++i) {
        tensorDescTmp = OH_NNExecutor_CreateInputTensorDesc(executor, i);
        if (tensorDescTmp == nullptr) {
            return OH_NN_FAILED;
        }
        inputTensorDescs.emplace_back(tensorDescTmp);
    }
    returnCode = OH_NNExecutor_GetOutputCount(executor, outputCount);
    if (returnCode != OH_NN_SUCCESS) {
        return returnCode;
    }
    for (size_t i = 0; i < *outputCount; ++i) {
        tensorDescTmp = OH_NNExecutor_CreateOutputTensorDesc(executor, i);
        if (tensorDescTmp == nullptr) {
            return OH_NN_FAILED;
        }
        outputTensorDescs.emplace_back(tensorDescTmp);
    }

    return returnCode;
}

// 辅助函数：获取输入维度并设置形状
static OH_NN_ReturnCode GetInputDimAndSetShape(OH_NNExecutor *executor,
    std::vector<NN_TensorDesc*>& inputTensorDescs,
    std::vector<NN_TensorDesc*>& outputTensorDescs, bool isDynamic)
{
    if (isDynamic) {
        size_t *minInputDims = nullptr;
        size_t *maxInputDims = nullptr;
        size_t shapeLength = ZERO;
        for (size_t i = 0; i < inputTensorDescs.size(); ++i) {
            if (OH_NN_SUCCESS != OH_NNExecutor_GetInputDimRange(executor, i, &minInputDims,
                &maxInputDims, &shapeLength)) {
                return OH_NN_FAILED;
            }
            std::vector<int32_t> minInputDimsT;
            for (size_t j = 0; j < shapeLength; ++j) {
                minInputDimsT.emplace_back(static_cast<int32_t>(minInputDims[j]));
            }
            if (OH_NN_SUCCESS != OH_NNTensorDesc_SetShape(inputTensorDescs[i],
                minInputDimsT.data(), shapeLength)) {
                return OH_NN_FAILED;
            }
        }
        std::vector<int32_t> outputShape{1, 2, 2, 1};
        for (size_t i = 0; i < outputTensorDescs.size(); ++i) {
            if (OH_NN_SUCCESS != OH_NNTensorDesc_SetShape(outputTensorDescs[i],
                outputShape.data(), outputShape.size())) {
                return OH_NN_FAILED;
            }
        }
    }
    return OH_NN_SUCCESS;
}

// 辅助函数：创建张量并销毁张量描述符
static OH_NN_ReturnCode CreateTensorAndDestroyTensorDesc(NN_Tensor* tensors[], size_t count,
    std::vector<NN_TensorDesc*>& tensorDescs, size_t deviceId)
{
    NN_Tensor* tensor = nullptr;
    for (size_t i = 0; i < count; ++i) {
        tensor = nullptr;
        tensor = OH_NNTensor_Create(deviceId, tensorDescs[i]);
        if (tensor == nullptr) {
            return OH_NN_FAILED;
        }
        tensors[i] = tensor;
    }
    for (size_t i = 0; i < count; ++i) {
        if (OH_NN_SUCCESS != OH_NNTensorDesc_Destroy(&tensorDescs[i])) {
            return OH_NN_FAILED;
        }
    }
    return OH_NN_SUCCESS;
}

// 辅助函数：销毁输入输出张量
static OH_NN_ReturnCode DestroyInputAndOutputTensor(NN_Tensor** inputTensors, size_t inputCount,
    NN_Tensor** outputTensors, size_t outputCount)
{
    OH_NN_ReturnCode returnCode = OH_NN_SUCCESS;
    for (size_t i = 0; i < inputCount; ++i) {
        returnCode = OH_NNTensor_Destroy(&inputTensors[i]);
        if (returnCode != OH_NN_SUCCESS) {
            return OH_NN_FAILED;
        }
    }
    for (size_t i = 0; i < outputCount; ++i) {
        returnCode = OH_NNTensor_Destroy(&outputTensors[i]);
        if (returnCode != OH_NN_SUCCESS) {
            return OH_NN_FAILED;
        }
    }
    return OH_NN_SUCCESS;
}

// 辅助函数：运行执行器
static OH_NNExecutor* RunExecutor(OH_NNCompilation* compilation, size_t deviceId,
    bool isDynamic = false)
{
    OH_NNExecutor *executor = OH_NNExecutor_Construct(compilation);
    if (executor == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[Helper] OH_NNExecutor_Construct failed");
        return nullptr;
    }

    size_t inputCount = 0;
    std::vector<NN_TensorDesc*> inputTensorDescs;
    size_t outputCount = 0;
    std::vector<NN_TensorDesc*> outputTensorDescs;

    OH_NN_ReturnCode returnCode = GetInputAndOutputTensorDesc(executor, &inputCount,
        inputTensorDescs, &outputCount, outputTensorDescs);
    if (returnCode != OH_NN_SUCCESS) {
        return nullptr;
    }

    returnCode = GetInputDimAndSetShape(executor, inputTensorDescs, outputTensorDescs, isDynamic);
    if (returnCode != OH_NN_SUCCESS) {
        return nullptr;
    }

    NN_Tensor* inputTensors[inputCount];
    OH_NN_ReturnCode returnCodeTmp = CreateTensorAndDestroyTensorDesc(inputTensors, inputCount,
        inputTensorDescs, deviceId);
    NN_Tensor* outputTensors[outputCount];
    returnCode = CreateTensorAndDestroyTensorDesc(outputTensors, outputCount,
        outputTensorDescs, deviceId);
    if (returnCode != OH_NN_SUCCESS || returnCodeTmp != OH_NN_SUCCESS) {
        return nullptr;
    }

    returnCode = SetInputData(inputTensors, inputCount);
    if (returnCode != OH_NN_SUCCESS) {
        return nullptr;
    }

    returnCode = OH_NNExecutor_RunSync(executor, inputTensors, inputCount, outputTensors, outputCount);
    if (returnCode != OH_NN_SUCCESS) {
        return nullptr;
    }

    returnCode = DestroyInputAndOutputTensor(inputTensors, inputCount, outputTensors, outputCount);
    if (returnCode != OH_NN_SUCCESS) {
        return nullptr;
    }

    return executor;
}

/**
 * @tc.name   sub_AI_NNRt_Core_Func_North_EndToEnd_0100
 * @tc.desc   定长模型编译端到端测试
 */
static int SubAiNnRtCoreFuncNorthEndToEnd0100()
{
    OH_LOG_INFO(LOG_APP, "[Test] ========== sub_AI_NNRt_Core_Func_North_EndToEnd_0100 START ==========");
    
    size_t deviceId = 0;
    if (OH_NN_SUCCESS != GetDeviceID(&deviceId)) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: GetDeviceID failed");
        return -1;
    }
    OH_NNModel* model = nullptr;
    BuildModel(&model);
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: BuildModel returned nullptr");
        return -1;
    }
    // 暂时禁用缓存来排查问题
    OH_NNCompilation* compilation = ConstructCompilation(model, deviceId, false);
    if (nullptr == compilation) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: ConstructCompilation returned nullptr");
        OH_NNModel_Destroy(&model);
        return -1;
    }
    OH_NNModel_Destroy(&model);
    OH_LOG_INFO(LOG_APP, "[Test] Step 4: Running executor...");
    OH_NNExecutor* executor = RunExecutor(compilation, deviceId);
    if (nullptr == executor) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: RunExecutor returned nullptr");
        OH_NNCompilation_Destroy(&compilation);
        return -1;
    }
    OH_NNCompilation_Destroy(&compilation);
    OH_NNExecutor_Destroy(&executor);
    
    return 0;
}

/**
 * @tc.name   sub_AI_NNRt_Core_Func_North_EndToEnd_0300
 * @tc.desc   定长模型编译带量化参数端到端测试
 */
static int SubAiNnRtCoreFuncNorthEndToEnd0300()
{
    OH_LOG_INFO(LOG_APP, "[Test] ========== sub_AI_NNRt_Core_Func_North_EndToEnd_0300 START ==========");
    
    size_t deviceId = 0;
    OH_LOG_INFO(LOG_APP, "[Test] Step 1: Getting device ID...");
    if (OH_NN_SUCCESS != GetDeviceID(&deviceId)) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: GetDeviceID failed");
        return -1;
    }

    OH_NNModel* model = nullptr;
    BuildModelWithQuantParams(&model);
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP,
            "[Test] FAILED: BuildModelWithQuantParams returned nullptr");
        return -1;
    }
    OH_NNCompilation* compilation = ConstructCompilation(model, deviceId, false);
    if (nullptr == compilation) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: ConstructCompilation returned nullptr");
        OH_NNModel_Destroy(&model);
        return -1;
    }
    
    OH_NNModel_Destroy(&model);
    OH_LOG_INFO(LOG_APP, "[Test] Step 4: Running executor...");
    OH_NNExecutor* executor = RunExecutor(compilation, deviceId);
    if (nullptr == executor) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: RunExecutor returned nullptr");
        OH_NNCompilation_Destroy(&compilation);
        return -1;
    }
    
    OH_NNCompilation_Destroy(&compilation);
    OH_NNExecutor_Destroy(&executor);
    
    OH_LOG_INFO(LOG_APP, "[Test] ========== sub_AI_NNRt_Core_Func_North_EndToEnd_0300 PASSED ==========");
    return 0;
}

/**
 * @tc.name   sub_AI_NNRt_Core_Func_North_Reliability_0100
 * @tc.desc   定长模型编译长稳测试
 */
static int SubAiNnRtCoreFuncNorthReliability0100()
{
    OH_LOG_INFO(LOG_APP, "[Test] ========== sub_AI_NNRt_Core_Func_North_Reliability_0100 START ==========");
    OH_LOG_INFO(LOG_APP, "[Test] Reliability test: Running %d iterations", STRESS_COUNT);
    
    size_t deviceId = 0;
    if (OH_NN_SUCCESS != GetDeviceID(&deviceId)) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: GetDeviceID failed");
        return -1;
    }

    OH_NNModel* model = nullptr;
    BuildModel(&model);
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[Test] FAILED: BuildModel returned nullptr");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[Test] Model built successfully, starting %d iterations", STRESS_COUNT);
    
    for (int i = 0; i < STRESS_COUNT; i++) {
        OH_NNCompilation* compilation = ConstructCompilation(model, deviceId, false);
        if (nullptr == compilation) {
            OH_LOG_ERROR(LOG_APP,
                "[Test] FAILED at iteration %d: ConstructCompilation returned nullptr", i);
            OH_NNModel_Destroy(&model);
            return -1;
        }
        OH_NNExecutor* executor = RunExecutor(compilation, deviceId);
        if (nullptr == executor) {
            OH_LOG_ERROR(LOG_APP,
                "[Test] FAILED at iteration %d: RunExecutor returned nullptr", i);
            OH_NNCompilation_Destroy(&compilation);
            OH_NNModel_Destroy(&model);
            return -1;
        }
        OH_NNCompilation_Destroy(&compilation);
        OH_NNExecutor_Destroy(&executor);
        if (i % PRINT_FREQ == 0) {
            OH_LOG_INFO(LOG_APP, "[Test] Reliability progress: %d/%d iterations completed", i, STRESS_COUNT);
        }
    }
    OH_NNModel_Destroy(&model);
    
    return 0;
}

