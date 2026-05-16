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

#include "MindSporeContextTest.h"
#include <mindspore/model.h>

namespace MindSporeContextTest {
napi_value DeviceInfoGetPriorityTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    napi_create_int32(env, 1, &retValue);
    OH_AI_DeviceInfoDestroy(&nnrt_device_info);
    return retValue;
}

// function before callback
bool PrintBeforeCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                         const OH_AI_CallBackParam kernel_Info)
{
    const char* nodeName = kernel_Info.node_name;
    const char* nodeType = kernel_Info.node_type;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "node_name: %{public}d", nodeName);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "nodeType: %{public}d", nodeType);
    return true;
}

// function after callback
bool PrintAfterCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                        const OH_AI_CallBackParam kernel_Info)
{
    bool ret = false;
    const char* nodeName = kernel_Info.node_name;
    const char* nodeType = kernel_Info.node_type;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "nodeName: %{public}d", nodeName);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "nodeType: %{public}d", nodeType);
    if (nodeName != nullptr && nodeType != nullptr) {
        ret = true;
    }
    return ret;
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

napi_value CallBackParamTest_001(napi_env env, napi_callback_info info)
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
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    printf("==========Model Predict Callback==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_KernelCallBack before_call_back = PrintBeforeCallback;
    OH_AI_KernelCallBack after_call_back = PrintAfterCallback;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, before_call_back, after_call_back);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "111111111111111111111", "node_type: %{public}d", predict_ret);
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
    napi_create_int32(env, predict_ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value CallBackParamTest_002(napi_env env, napi_callback_info info)
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
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    printf("==========Model Predict Callback==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_KernelCallBack before_call_back = PrintBeforeCallback;
    OH_AI_KernelCallBack after_call_back = PrintAfterCallback;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, before_call_back, after_call_back);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111", "node_type: %{public}d", predict_ret);
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
    napi_create_int32(env, predict_ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

napi_value CallBackParamTest_003(napi_env env, napi_callback_info info)
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
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    printf("==========Model Predict Callback==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_KernelCallBack before_call_back = PrintBeforeCallback;
    OH_AI_KernelCallBack after_call_back = PrintAfterCallback;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, before_call_back, after_call_back);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "1111111111111111111111", "node_type: %{public}d", predict_ret);
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
    napi_create_int32(env, predict_ret == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    return retValue;
}

bool IsNPU()
{
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        return false;
    }
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
    const std::string npu_name_prefix = "NPU_";
    if (strncmp(npu_name_prefix.c_str(), name, npu_name_prefix.size()) != 0) {
        return false;
    }
    return true;
}

void AddContextDeviceNNRT(OH_AI_ContextHandle context)
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return;
    }
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(descs);
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(nnrt_device_info);
    printf("==========device_type:%d\n", device_type);
    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

napi_value TensorGetAllocatorTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    int result = 1;
    if (IsNPU()) {
        OH_AI_ContextHandle context = OH_AI_ContextCreate();
        AddContextDeviceNNRT(context);
        OH_AI_ModelHandle model = OH_AI_ModelCreate();
        OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                    OH_AI_MODELTYPE_MINDIR, context);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111k", "ret: %{public}d", ret);
        OH_AI_TensorHandleArray inputs_handle = OH_AI_ModelGetInputs(model);
        const size_t MAX_DIMS = PARAM_10;
        int64_t shape[MAX_DIMS];
        size_t shape_num;
        OH_AI_TensorHandleArray in_tensor_array;
        OH_AI_TensorHandleArray out_tensor_array;
        in_tensor_array.handle_num = inputs_handle.handle_num;
        in_tensor_array.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle)
                                                                   * in_tensor_array.handle_num);
        for (size_t i = 0; i < inputs_handle.handle_num; i++) {
            auto ori_tensor = inputs_handle.handle_list[i];
            auto shape_ptr = OH_AI_TensorGetShape(ori_tensor, &shape_num);
            for (size_t j = 0; j < shape_num; j++) {
                shape[j] = shape_ptr[j];
            }
            void *in_allocator = OH_AI_TensorGetAllocator(ori_tensor);
            OH_AI_TensorHandle in_tensor = OH_AI_TensorCreate(OH_AI_TensorGetName(ori_tensor),
                                                              OH_AI_TensorGetDataType(ori_tensor), shape, shape_num,
                                                              nullptr, 0);
            auto ret1 = OH_AI_TensorSetAllocator(in_tensor, in_allocator);
            result = ret1;
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111k", "ret1: %{public}d", ret1);
            in_tensor_array.handle_list[i] = in_tensor;
        }
        OH_AI_ModelDestroy(&model);
        OH_AI_ContextDestroy(&context);
        napi_create_int32(env, result == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111k", "ret: %{public}d", false);
        napi_create_int32(env, 0, &retValue);
    }
    return retValue;
}

napi_value TensorSetAllocatorTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    int result = 1;
    if (IsNPU()) {
        OH_AI_ContextHandle context = OH_AI_ContextCreate();
        AddContextDeviceNNRT(context);
        OH_AI_ModelHandle model = OH_AI_ModelCreate();
        OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                    OH_AI_MODELTYPE_MINDIR, context);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111k", "ret: %{public}d", ret);
        OH_AI_TensorHandleArray inputs_handle = OH_AI_ModelGetInputs(model);
        const size_t MAX_DIMS = PARAM_10;
        int64_t shape[MAX_DIMS];
        size_t shape_num;
        OH_AI_TensorHandleArray in_tensor_array;
        OH_AI_TensorHandleArray out_tensor_array;
        in_tensor_array.handle_num = inputs_handle.handle_num;
        in_tensor_array.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle)
                                                                   * in_tensor_array.handle_num);
        for (size_t i = 0; i < inputs_handle.handle_num; i++) {
            auto ori_tensor = inputs_handle.handle_list[i];
            auto shape_ptr = OH_AI_TensorGetShape(ori_tensor, &shape_num);
            for (size_t j = 0; j < shape_num; j++) {
                shape[j] = shape_ptr[j];
            }
            void *in_allocator = OH_AI_TensorGetAllocator(ori_tensor);
            OH_AI_TensorHandle in_tensor = OH_AI_TensorCreate(OH_AI_TensorGetName(ori_tensor),
                                                              OH_AI_TensorGetDataType(ori_tensor), shape, shape_num,
                                                              nullptr, 0);
            auto ret1 = OH_AI_TensorSetAllocator(in_tensor, in_allocator);
            result = ret1;
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111k", "ret1: %{public}d", ret1);
            in_tensor_array.handle_list[i] = in_tensor;
        }
        OH_AI_ModelDestroy(&model);
        OH_AI_ContextDestroy(&context);
        napi_create_int32(env, result == OH_AI_STATUS_SUCCESS ? 0 : 1, &retValue);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111k", "ret: %{public}d", false);
        napi_create_int32(env, 0, &retValue);
    }
    return retValue;
}
}