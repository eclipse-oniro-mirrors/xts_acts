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

#include "MindSporeModelTest.h"
#include <mindspore/model.h>
#include <string>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <ctime>
#include <cstdio>
#include <fstream>
typedef int errno_t;

namespace MindSporeModelTest {
char **TransStrVectorToCharArrays(const std::vector<std::string> &s)
{
    char **charArr = static_cast<char **>(malloc(s.size() * sizeof(char *)));
    if (charArr == nullptr) {
        return nullptr;
    }
    for (size_t i = 0; i < s.size(); i++) {
        charArr[i] = static_cast<char *>(malloc(s[i].size() + 1));
        if (charArr[i] == nullptr) {
            for (size_t j = 0; j < i; j++) {
                free(charArr[j]);
            }
            free(charArr);
            return nullptr;
        }
        std::copy(s[i].begin(), s[i].end(), charArr[i]);
        charArr[i][s[i].size()] = '\0';
    }
    return charArr;
}

napi_value TrainCfgCreateTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    napi_create_int32(env, train_cfg != nullptr ? 0 : 1, &retValue);
    OH_AI_TrainCfgDestroy(&train_cfg);
    return retValue;
}

napi_value TrainCfgDestroyTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, train_cfg == nullptr ? 0 : 1, &retValue);
    return retValue;
}

napi_value TrainCfgGetLossNameTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    size_t num = 0;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    char **lossName = OH_AI_TrainCfgGetLossName(train_cfg, &num);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, lossName != nullptr ? 0 : 1, &retValue);
    return retValue;
}

napi_value TrainCfgGetLossNameTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    size_t num = 0;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    char **lossName = OH_AI_TrainCfgGetLossName(nullptr, &num);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, lossName == nullptr ? 0 : 1, &retValue);
    return retValue;
}

napi_value TrainCfgGetLossNameTest_003(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    size_t num = 0;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    char **lossName = OH_AI_TrainCfgGetLossName(train_cfg, NULL);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, lossName == nullptr ? 0 : 1, &retValue);
    return retValue;
}

napi_value TrainCfgSetLossNameTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    size_t num = PARAM_10;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    std::vector<std::string> set_train_cfg_loss_name = {"loss_fct", "_loss_fn"};
    char **setLossName = TransStrVectorToCharArrays(set_train_cfg_loss_name);
    OH_AI_TrainCfgSetLossName(train_cfg, const_cast<const char **>(setLossName), set_train_cfg_loss_name.size());
    char **lossName = OH_AI_TrainCfgGetLossName(train_cfg, &num);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, lossName != nullptr ? 0 : 1, &retValue);
    return retValue;
}

napi_value TrainCfgGetOptimizationLevelTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO0 ? 0 : 1, &retValue);
    return retValue;
}

napi_value TrainCfgGetOptimizationLevelTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(nullptr);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO0 ? 0 : 1, &retValue);
    return retValue;
}

napi_value TrainCfgSetOptimizationLevelTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KO2);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO2 ? 0 : 1, &retValue);
    return retValue;
}

napi_value TrainCfgSetOptimizationLevelTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(nullptr, OH_AI_KO2);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO0 ? 0 : 1, &retValue);
    return retValue;
}

const void* LoadModelData(const char* filename, size_t* outSize)
{
    if (!filename || !outSize) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LoadModelData", "Invalid parameters");
        return nullptr;
    }
    FILE* file = fopen(filename, "rb");
    if (!file) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LoadModelData",
                     "Failed to open file: %{public}s, errno: %{public}d", filename, errno);
        return nullptr;
    }
    if (fseek(file, 0, SEEK_END) != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LoadModelData", "Failed get file size: %{public}d", errno);
        return nullptr;
    }
    long fileSize = ftell(file);
    if (fileSize == PARAM_NEGATIVE_1) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LoadModelData", "Failed get file size: %{public}d", errno);
        return nullptr;
    }
    rewind(file);

    if (fileSize <= 0) {
        if (fclose(file) != 0) {
        }
        return nullptr;
    }
    void* buffer = malloc(fileSize);
    if (!buffer) {
        if (fclose(file) != 0) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LoadModelData", "Failed to file: %s", strerror(errno));
        }
        return nullptr;
    }
    size_t bytesRead = fread(buffer, 1, fileSize, file);
    if (fclose(file) != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "LoadModelData", "Failed close file: %s", strerror(errno));
    }
    if (bytesRead != static_cast<size_t>(fileSize)) {
        free(buffer);
        return nullptr;
    }
    *outSize = fileSize;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "LoadModelData",
                 "Successfully loaded %{public}zu bytes from %{public}s", fileSize, filename);
    return buffer;
}

napi_value TrainModelBuildTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret = OH_AI_TrainModelBuild(model, modelData, size, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
    napi_create_int32(env, ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value TrainModelBuildFromFileTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
    napi_create_int32(env, ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

bool PrintBeforeCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                         const OH_AI_CallBackParam kernel_Info)
{
    const char* nodeName = kernel_Info.node_name;
    const char* nodeType = kernel_Info.node_type;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "kernel_Info", "nodeName: %{public}d", nodeName);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "kernel_Info", "nodeType: %{public}d", nodeType);
    return true;
}

bool PrintAfterCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                        const OH_AI_CallBackParam kernel_Info)
{
    bool ret = false;
    const char* nodeName = kernel_Info.node_name;
    const char* nodeType = kernel_Info.node_type;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "kernel_Info", "nodeName: %{public}d", nodeName);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "kernel_Info", "nodeType: %{public}d", nodeType);
    if (nodeName != nullptr && nodeType != nullptr) {
        ret = true;
    }
    return true;
}

napi_value RunStepTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    OH_AI_KernelCallBack before_call_back = PrintBeforeCallback;
    OH_AI_KernelCallBack after_call_back = PrintAfterCallback;
    auto ret = OH_AI_RunStep(model, nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "model: %{public}d", model);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ModelSetLearningRateTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto status = OH_AI_ModelSetLearningRate(model, 0.01f);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", status);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, status == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ModelGetLearningRateTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    auto status1 = OH_AI_ModelGetLearningRate(model);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "status1: %{public}f", status1);
    OH_AI_ModelDestroy(&model);
    napi_create_double(env, status1, &retValue);
    return retValue;
}

napi_value ModelGetWeightsTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TensorHandleArray get_update_weights = OH_AI_ModelGetWeights(model);
    for (size_t i = 0; i < get_update_weights.handle_num; ++i) {
        OH_AI_TensorHandle weights_tensor = get_update_weights.handle_list[i];
        if (strcmp(OH_AI_TensorGetName(weights_tensor), "fc3.bias") == 0) {
            float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(weights_tensor));
        }
    }
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, get_update_weights.handle_num >= 0  ? 0 : 1, &retValue);
    return retValue;
}

napi_value ModelUpdateWeightsTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto generator = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 random_engine_;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
                              [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {PARAM_10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
                                                   createShape, createShapeNum, nullptr, 0);
    generator(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    auto status = OH_AI_ModelUpdateWeights(model, update_weights);
    auto status2 = OH_AI_ModelSetTrainMode(model, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", status);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, status == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ModelGetTrainModeTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    auto status = OH_AI_ModelSetTrainMode(model, false);
    auto train_mode = OH_AI_ModelGetTrainMode(model);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, train_mode == false ? 0 : 1, &retValue);
    return retValue;
}

napi_value ModelSetTrainModeTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto status = OH_AI_ModelSetTrainMode(model, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", status);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, status == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ModelSetupVirtualBatchTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto status = OH_AI_ModelSetupVirtualBatch(model, 2, -1.0f, -1.0f);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", status);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, status == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

char *ReadFile(const char *file, size_t* size)
{
    printf("[common.cpp] Loading data from: %s\n", file);

    std::ifstream ifs(file);
    if (!ifs.good()) {
        return nullptr;
    }

    if (!ifs.is_open()) {
        ifs.close();
        return nullptr;
    }

    ifs.seekg(0, std::ios::end);
    *size = ifs.tellg();

    char *buf = new char[*size];
    if (buf == nullptr) {
        ifs.close();
        return nullptr;
    }

    ifs.seekg(0, std::ios::beg);
    ifs.read(buf, *size);
    ifs.close();

    return buf;
}

void PackNCHWToNHWCFp32(const char *src, char *dst, int batch, int plane, int channel)
{
    for (int n = 0; n < batch; n++) {
        for (int c = 0; c < channel; c++) {
            for (int hw = 0; hw < plane; hw++) {
                int nhwcIndex = n * channel * plane + hw * channel + c;
                int nchwIndex = n * channel * plane + c * plane + hw;
                dst[nhwcIndex * PARAM_4] = src[nchwIndex * PARAM_4];
                dst[nhwcIndex * PARAM_4 + 1] = src[nchwIndex * PARAM_4 + 1];
                dst[nhwcIndex * PARAM_4 + PARAM_2] = src[nchwIndex * PARAM_4 + PARAM_2];
                dst[nhwcIndex * PARAM_4 + PARAM_3] = src[nchwIndex * PARAM_4 + PARAM_3];
            }
        }
    }
    return;
}

bool SafeMemCopy(void* dest, size_t destSize, const void* src, size_t copySize)
{
    if (!dest || !src) {
        printf("Error: Null pointer detected\n");
        return false;
    }
    if (copySize > destSize) {
        printf("Error: Copy size (%zu) exceeds destination size (%zu)\n", copySize, destSize);
        return false;
    }
    const char* srcBytes = static_cast<const char*>(src);
    char* destBytes = static_cast<char*>(dest);
    std::copy(srcBytes, srcBytes + copySize, destBytes);
    return true;
}

void FillInputsData(OH_AI_TensorHandleArray inputs, std::string modelName, bool isTranspose)
{
    std::string testResourcesDir = "/data/test/resource/";
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        printf("==========ReadFile==========\n");
        size_t size1;
        std::string inputDataPath = testResourcesDir + modelName + "_" + std::to_string(i) + ".input";
        const char *imagePath = inputDataPath.c_str();
        char *imageBuf = ReadFile(imagePath, &size1);
        OH_AI_TensorHandle tensor = inputs.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s. \n", OH_AI_TensorGetName(tensor));
        float *inputData = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(inputs.handle_list[i]));
        
        size_t tensorDataSize = OH_AI_TensorGetDataSize(tensor);
        
        if (isTranspose) {
            printf("==========Transpose==========\n");
            size_t shapeNum;
            const int64_t *shape = OH_AI_TensorGetShape(tensor, &shapeNum);
            if (size1 <= 0 && size1 > tensorDataSize) {
                printf("Memory copy failed for tensor %zu\n", i);
            }
            auto imageBufNhwc = new char[size1];
            PackNCHWToNHWCFp32(imageBuf, imageBufNhwc, shape[0], shape[1] * shape[PARAM_2], shape[PARAM_3]);
            // 使用自定义安全拷贝
            bool copySuccess = SafeMemCopy(inputData, tensorDataSize, imageBufNhwc, size1);
            if (!copySuccess) {
                printf("Memory copy failed for tensor %zu\n", i);
            }
            delete[] imageBufNhwc;
        } else {
            // 使用自定义安全拷贝
            if (!SafeMemCopy(inputData, tensorDataSize, imageBuf, size1)) {
                printf("Memory copy failed for tensor %zu\n", i);
            }
        }
        
        printf("input data after filling is: ");
        for (int j = 0; j < elementNum && j <= PARAM_20; ++j) {
            printf("%f ", inputData[j]);
        }
        printf("\n");
        delete[] imageBuf;
    }
}

void ModelTrain(OH_AI_ModelHandle model, OH_AI_ContextHandle context, std::string modelName,
                OH_AI_ShapeInfo shapeInfos, bool buildByGraph)
{
    std::string testResourcesDir = "/data/test/resource/";
    std::string modelPath = testResourcesDir + modelName + ".ms";
    const char *graphPath = modelPath.c_str();
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    OH_AI_Status ret = OH_AI_STATUS_SUCCESS;
    if (buildByGraph) {
        printf("==========Build model by graphBuf==========\n");
        size_t size;
        size_t *ptrSize = &size;
        char *graphBuf = ReadFile(graphPath, ptrSize);
        ret = OH_AI_TrainModelBuild(model, graphBuf, size, OH_AI_MODELTYPE_MINDIR, context, trainCfg);
        delete[] graphBuf;
    } else {
        printf("==========Build model==========\n");
        ret = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    }
    printf("==========build model return code:%d\n", ret);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    if (shapeInfos.shape_num != 0) {
        printf("==========Resizes==========\n");
        OH_AI_Status resize_ret = OH_AI_ModelResize(model, inputs, &shapeInfos, inputs.handle_num);
        printf("==========Resizes return code:%d\n", resize_ret);
    }
    FillInputsData(inputs, modelName, false);
    ret = OH_AI_ModelSetTrainMode(model, true);
    ret = OH_AI_RunStep(model, nullptr, nullptr);
    printf("==========Model RunStep End==========\n");
}

napi_value ExportModelTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto generator = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 random_engine_;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
                              [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {PARAM_10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
                                                   createShape, createShapeNum, nullptr, 0);
    generator(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    auto status = OH_AI_ModelUpdateWeights(model, update_weights);
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    status = OH_AI_RunStep(model, nullptr, nullptr);
    auto ret = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/storage/el2/base/files/lenet_train_infer.ms",
                                 OH_AI_NO_QUANT, true, nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", ret);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ExportModelBufferTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto generator = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 random_engine_;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
                              [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {PARAM_10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
                                                   createShape, createShapeNum, nullptr, 0);
    generator(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    auto status1 = OH_AI_ModelUpdateWeights(model, update_weights);
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    FillInputsData(inputs, "lenet_train", false);
    status1 = OH_AI_ModelSetTrainMode(model, true);
    status1 = OH_AI_RunStep(model, nullptr, nullptr);
    char *modelData1;
    size_t dataSize;
    auto status = OH_AI_ExportModelBuffer(model, OH_AI_MODELTYPE_MINDIR,
                                          &modelData1, &dataSize, OH_AI_NO_QUANT, true, nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", status);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, status == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ExportWeightsCollaborateTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto generator = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 random_engine_;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
                              [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {PARAM_10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
                                                   createShape, createShapeNum, nullptr, 0);
    generator(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    OH_AI_ModelUpdateWeights(model, update_weights);
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    FillInputsData(inputs, "lenet_train", false);
    OH_AI_ModelSetTrainMode(model, true);
    OH_AI_RunStep(model, nullptr, nullptr);
    auto status = OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR,
                                                          "/data/storage/el2/base/files/xiaoyi_train_codegen_net1.bin",
                                                          true, true, nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", status);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, status == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value ModelLoadConfigTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    ModelTrain(model, context, "lenet_train", {}, true);
    const char* validConfigPath = "/data/storage/el2/base/files/ml_face_isface.config";
    OH_AI_Status status = OH_AI_ModelLoadConfig(model, validConfigPath);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", status);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, status == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value QuantizationTypeTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto generator = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 random_engine_;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
                              [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {PARAM_10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
                                                   createShape, createShapeNum, nullptr, 0);
    generator(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    auto status = OH_AI_ModelUpdateWeights(model, update_weights);
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    status = OH_AI_RunStep(model, nullptr, nullptr);
    auto quantization_type = OH_AI_NO_QUANT;
    auto ret = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/storage/el2/base/files/lenet_train_infer.ms",
                                 quantization_type, true, nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", ret);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value QuantizationTypeTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto generator = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 random_engine_;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
                              [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {PARAM_10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
                                                   createShape, createShapeNum, nullptr, 0);
    generator(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    auto status = OH_AI_ModelUpdateWeights(model, update_weights);
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    status = OH_AI_RunStep(model, nullptr, nullptr);
    auto quantization_type = OH_AI_WEIGHT_QUANT;
    auto ret = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/storage/el2/base/files/lenet_train_infer.ms",
                                 quantization_type, true, nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", ret);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value QuantizationTypeTest_003(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto generator = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 random_engine_;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
                              [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {PARAM_10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
                                                   createShape, createShapeNum, nullptr, 0);
    generator(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    auto status = OH_AI_ModelUpdateWeights(model, update_weights);
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    status = OH_AI_RunStep(model, nullptr, nullptr);
    auto quantization_type = OH_AI_FULL_QUANT;
    auto ret = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/storage/el2/base/files/lenet_train_infer.ms",
                                 quantization_type, true, nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", ret);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value QuantizationTypeTest_004(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    const char *graphPath = "/data/storage/el2/base/files/lenet_train.ms";
    size_t size;
    size_t *ptrSize = &size;
    const void* modelData = LoadModelData(graphPath, ptrSize);
    if (modelData == nullptr || size == 0) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111TrainModelBuildTest",
                 "Failed to load model from: %{public}s, size: %{public}d", graphPath, size);
    }
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    auto generator = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 random_engine_;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
                              [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {PARAM_10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
                                                   createShape, createShapeNum, nullptr, 0);
    generator(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    auto status = OH_AI_ModelUpdateWeights(model, update_weights);
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    status = OH_AI_RunStep(model, nullptr, nullptr);
    auto quantization_type = OH_AI_UNKNOWN_QUANT_TYPE;
    auto ret = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/storage/el2/base/files/lenet_train_infer.ms",
                                 quantization_type, true, nullptr, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111", "model: %{public}d", ret);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}
}