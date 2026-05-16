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

#include "MindSporeStatusTest.h"
#include <mindspore/model.h>
#include <string>

namespace MindSporeStatusTest {

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

napi_value StatusTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {PARAM_6};
    constexpr size_t dataLen = PARAM_6;
    float data[dataLen] = {1, PARAM_2, PARAM_3, PARAM_4, PARAM_5, PARAM_6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        createShapeNum, data, PARAM_6*PARAM_4);
     
    auto ret = OH_AI_TensorSetUserData(tensor, data, PARAM_6 * PARAM_4);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111kernel_Info", "ret: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_STATUS_LITE_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value StatusTest_002(napi_env env, napi_callback_info info)
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

napi_value StatusTest_008(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status1 = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms",
                                                 OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    auto genRandomData = [](size_t size, void *data) {
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
    genRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    auto status = OH_AI_ModelUpdateWeights(model, update_weights);
    auto status2 = OH_AI_ModelSetTrainMode(model, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111kernel_Info", "model: %{public}d", status);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111kernel_Info", "model: %{public}d", status1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111kernel_Info", "model: %{public}d", status2);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    napi_create_int32(env, status2 == OH_AI_STATUS_LITE_UNINITIALIZED_OBJ ? 0 : 1, &retValue);
    return retValue;
}
}