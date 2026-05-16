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

#include "MindSporeTypesTest.h"
#include <mindspore/model.h>
#include <mindspore/types.h>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <ctime>
#include <cstdio>
#include <fstream>

namespace MindSporeTypesTest {
napi_value DeviceTypeTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_GPU);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", device_type);
    OH_AI_ContextDestroy(&context);
    napi_create_int32(env, device_type == OH_AI_DEVICETYPE_GPU ? 0 : 1, &retValue);
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

napi_value ModelTypetest_001(napi_env env, napi_callback_info info)
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
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "modelData: %{public}p,"
                 "size:%{public}d", &modelData, size);
    OH_AI_ModelType model_type = OH_AI_MODELTYPE_INVALID;
    auto ret1 = OH_AI_TrainModelBuildFromFile(model, graphPath, model_type, context, train_cfg);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret1);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, ret1 == OH_AI_STATUS_LITE_PARAM_INVALID ? 0 : 1, &retValue);
    return retValue;
}

napi_value NNRTDeviceTypetest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    size_t argc = 1;
    napi_value argv[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    uint32_t type = 0;
    napi_get_value_uint32(env, argv[0], &type);
    OH_AI_NNRTDeviceType checkType;
    int ret = -1;
    if (type == OH_AI_NNRTDEVICE_OTHERS) {
        ret = 0;
    } else if (type == OH_AI_NNRTDEVICE_CPU) {
        ret = 0;
    } else if (type == OH_AI_NNRTDEVICE_GPU) {
        ret = 0;
    } else if (type == OH_AI_NNRTDEVICE_ACCELERATOR) {
        ret = 0;
    };
    napi_create_int32(env, ret, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KO0);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO0 ? 0 : 1, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KO2);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO2 ? 0 : 1, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_003(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KO3);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KO3 ? 0 : 1, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_004(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KAUTO);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KAUTO? 0 : 1, &retValue);
    return retValue;
}

napi_value OptimizationLevelTest_005(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KOPTIMIZATIONTYPE);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    OH_AI_TrainCfgDestroy(&train_cfg);
    napi_create_int32(env, opt_level == OH_AI_KOPTIMIZATIONTYPE ? 0 : 1, &retValue);
    return retValue;
}
}