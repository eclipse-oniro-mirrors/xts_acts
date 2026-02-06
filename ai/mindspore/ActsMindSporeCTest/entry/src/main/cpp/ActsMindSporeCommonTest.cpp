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

#include <cinttypes>
#include <cstring>
#include <mindspore/context.h>
#include <mindspore/data_type.h>
#include <mindspore/format.h>
#include <mindspore/model.h>
#include <mindspore/status.h>
#include <mindspore/tensor.h>
#include <mindspore/types.h>
#include <random>
#include <thread>
#include "include/ActsMindSporeTest.h"
#include "include/OhosCommonTest.h"

namespace Acts {
namespace MindSpore {

namespace {

struct BuildModelInternalOptions {
    OH_AI_ModelHandle model;
    const char* graphPath;
    bool buildByGraph;
    OH_AI_ContextHandle context;
};

OH_AI_Status BuildModelInternal(BuildModelInternalOptions options)
{
    OH_AI_Status ret = OH_AI_STATUS_SUCCESS;
    if (!options.buildByGraph) {
        OHPrintf("==========Build model==========\n");
        return OH_AI_ModelBuildFromFile(options.model, options.graphPath, OH_AI_MODELTYPE_MINDIR, options.context);
    }

    OHPrintf("==========Build model by graphBuf==========\n");
    size_t size;
    size_t* ptrSize = &size;
    char* graphBuf = ReadFile(options.graphPath, ptrSize);
    ASSERT_NE(graphBuf, nullptr);
    ret = OH_AI_ModelBuild(options.model, graphBuf, size, OH_AI_MODELTYPE_MINDIR, options.context);
    delete[] graphBuf;
    return ret;
}

void ResizeModelIfNeeded(OH_AI_ModelHandle model, OH_AI_TensorHandleArray inputs, OH_AI_ShapeInfo shapeInfos)
{
    if (shapeInfos.shape_num == 0) {
        return;
    }
    OHPrintf("==========Resizes==========\n");
    OH_AI_Status resizeRet = OH_AI_ModelResize(model, inputs, &shapeInfos, inputs.handle_num);
    OHPrintf("==========Resizes return code:%d\n", resizeRet);
    ASSERT_EQ(resizeRet, OH_AI_STATUS_SUCCESS);
}

OH_AI_Status PredictWithOptionalCallback(OH_AI_ModelHandle model,
                                         OH_AI_TensorHandleArray inputs,
                                         OH_AI_TensorHandleArray& outputs,
                                         bool isCallback)
{
    if (!isCallback) {
        OHPrintf("==========Model Predict==========\n");
        return OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    }

    OHPrintf("==========Model Predict Callback==========\n");
    OH_AI_KernelCallBack beforeCallBack = PrintBeforeCallback;
    OH_AI_KernelCallBack afterCallBack = PrintAfterCallback;
    return OH_AI_ModelPredict(model, inputs, &outputs, beforeCallBack, afterCallBack);
}

} // namespace

// function before callback
bool PrintBeforeCallback(const OH_AI_TensorHandleArray inputs,
                         const OH_AI_TensorHandleArray outputs,
                         const OH_AI_CallBackParam kernel_Info)
{
    std::cout << "Before forwarding " << kernel_Info.node_name << " " << kernel_Info.node_type << std::endl;
    return true;
}

// function after callback
bool PrintAfterCallback(const OH_AI_TensorHandleArray inputs,
                        const OH_AI_TensorHandleArray outputs,
                        const OH_AI_CallBackParam kernel_Info)
{
    std::cout << "After forwarding " << kernel_Info.node_name << " " << kernel_Info.node_type << std::endl;
    return true;
}

// add cpu device info
void AddContextDeviceCPU(OH_AI_ContextHandle context)
{
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OHPrintf("==========deviceType:%d\n", deviceType);
    ASSERT_EQ(deviceType, OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
}

bool IsNNRTAvailable()
{
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        OHPrintf("IsNNRTAvailable()==========OH_AI_GetAllNNRTDeviceDescs == nullptr");
        return false;
    }
    auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
    if (type != 1) {
        OHPrintf("IsNNRTAvailable()==========OH_AI_GetTypeFromNNRTDeviceDesc type != 1");
        return false;
    }
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    return true;
}

bool IsNPU()
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return false;
    }
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            return true;
        }
    }
    return false;
}

// add nnrt device info
void AddContextDeviceNNRT(OH_AI_ContextHandle context)
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return;
    }
    NNRTDeviceDesc* desc_1 = nullptr;
    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }
    if (desc_1 == nullptr) {
        return;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    std::cout << "NNRT device: id = " << id << std::endl;
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    ASSERT_NE(nnrtDeviceInfo, nullptr);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);

    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(nnrtDeviceInfo);
    OHPrintf("==========deviceType:%d\n", deviceType);
    ASSERT_EQ(deviceType, OH_AI_DEVICETYPE_NNRT);

    OH_AI_DeviceInfoSetPerformanceMode(nnrtDeviceInfo, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrtDeviceInfo), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrtDeviceInfo, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrtDeviceInfo), OH_AI_PRIORITY_MEDIUM);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
}

// add nnrt device info
void AddContextDeviceNNRTWithCache(OH_AI_ContextHandle context, const char* cachePath, const char* cacheVersion)
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return;
    }
    NNRTDeviceDesc* desc_1 = nullptr;
    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }
    if (desc_1 == nullptr) {
        return;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    std::cout << "NNRT device: id = " << id << std::endl;

    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    ASSERT_NE(nnrtDeviceInfo, nullptr);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);

    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(nnrtDeviceInfo);
    OHPrintf("==========deviceType:%d\n", deviceType);
    ASSERT_EQ(deviceType, OH_AI_DEVICETYPE_NNRT);

    OH_AI_DeviceInfoSetPerformanceMode(nnrtDeviceInfo, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrtDeviceInfo), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrtDeviceInfo, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrtDeviceInfo), OH_AI_PRIORITY_MEDIUM);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CachePath", cachePath, strlen(cachePath));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CacheVersion", cacheVersion, strlen(cacheVersion));

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
}

// add nnrt device info by type
void AddContextDeviceNNRTByType(OH_AI_ContextHandle context)
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    // 返回值desc是NNRTDeviceDesc结构体数组首地址
    if (descs == nullptr) {
        return;
    }

    NNRTDeviceDesc* desc_1 = nullptr;
    // 目前nnrt仅提供了rk3568的驱动，只有cpu一个设备，故不用判断
    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }
    if (desc_1 == nullptr) {
        return;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    std::cout << "NNRT device: id = " << id << std::endl;
    auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc_1);
    ASSERT_EQ(type, OH_AI_NNRTDEVICE_ACCELERATOR);
    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByType(type);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    ASSERT_NE(nnrtDeviceInfo, nullptr);

    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(nnrtDeviceInfo);
    OHPrintf("==========deviceType:%d\n", deviceType);
    ASSERT_EQ(deviceType, OH_AI_DEVICETYPE_NNRT);
    ASSERT_EQ(OH_AI_DeviceInfoGetDeviceId(nnrtDeviceInfo), id);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
}

// add nnrt device info by name
void AddContextDeviceNNRTByName(OH_AI_ContextHandle context)
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    // 返回值desc是NNRTDeviceDesc结构体数组首地址
    if (descs == nullptr) {
        return;
    }
    NNRTDeviceDesc* desc_1 = nullptr;
    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }
    if (desc_1 == nullptr) {
        return;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    std::cout << "NNRT device: id = " << id << std::endl;
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc_1);

    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByName(name);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    ASSERT_NE(nnrtDeviceInfo, nullptr);

    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(nnrtDeviceInfo);
    OHPrintf("==========deviceType:%d\n", deviceType);
    ASSERT_EQ(deviceType, OH_AI_DEVICETYPE_NNRT);
    ASSERT_EQ(OH_AI_DeviceInfoGetDeviceId(nnrtDeviceInfo), id);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
}

// fill data to inputs tensor
void FillInputsData(OH_AI_TensorHandleArray inputs, string modelName, bool isTranspose)
{
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        OHPrintf("==========ReadFile==========\n");
        size_t size1;
        size_t* ptrSize1 = &size1;
        string inputDataPath = ActsMindSporeConstants::FILES_DIR + modelName + "_" + std::to_string(i) + ".input";
        const char* imagePath = inputDataPath.c_str();
        char* imageBuf = ReadFile(imagePath, ptrSize1);
        ASSERT_NE(imageBuf, nullptr);
        OH_AI_TensorHandle tensor = inputs.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        OHPrintf("Tensor name: %s. \n", OH_AI_TensorGetName(tensor));
        float* inputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(inputs.handle_list[i]));
        ASSERT_NE(inputData, nullptr);
        if (isTranspose) {
            OHPrintf("==========Transpose==========\n");
            size_t shapeNum;
            const int64_t* shape = OH_AI_TensorGetShape(tensor, &shapeNum);
            auto imageBufNhwc = new char[size1];
            PackNCHWToNHWCFp32(imageBuf,

                               imageBufNhwc,
                               shape[SHAPE_INDEX_0],
                               shape[SHAPE_INDEX_1] * shape[SHAPE_INDEX_2],
                               shape[SHAPE_INDEX_3]);
            SafeMemcpy(inputData, size1, imageBufNhwc, size1);
            delete[] imageBufNhwc;
        } else {
            SafeMemcpy(inputData, size1, imageBuf, size1);
        }
        OHPrintf("input data after filling is: ");
        for (int j = 0; j < elementNum && j <= FORMAT_PRINT_LIMIT; ++j) {
            OHPrintf("%f ", inputData[j]);
        }
        OHPrintf("\n");
        delete[] imageBuf;
    }
}

// compare result after predict
void CompareResult(OH_AI_TensorHandleArray outputs, string modelName, float atol, float rtol, bool isquant)
{
    OHPrintf("==========GetOutput==========\n");
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        OHPrintf("Tensor name: %s .\n", OH_AI_TensorGetName(tensor));
        float* outputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(tensor));
        OHPrintf("output data is:");
        for (int j = 0; j < elementNum && j <= FORMAT_PRINT_LIMIT; ++j) {
            OHPrintf("%f ", outputData[j]);
        }
        OHPrintf("\n");
        OHPrintf("==========CompFp32WithTData==========\n");
        string outputFile = ActsMindSporeConstants::FILES_DIR + modelName + std::to_string(i) + ".output";
        bool result = CompFp32WithTData(outputData, outputFile, atol, rtol, isquant);
        ASSERT_EQ(result, true);
    }
}

// model build and predict
void ModelPredict(OH_AI_ModelHandle model, OH_AI_ContextHandle context, ModelPredictOptions modelPredictOptions)
{
    string modelPath = ActsMindSporeConstants::FILES_DIR + modelPredictOptions.modelName + ".ms";
    const char* graphPath = modelPath.c_str();
    BuildModelInternalOptions options;
    options.model = model;
    options.graphPath = graphPath;
    options.buildByGraph = modelPredictOptions.buildByGraph;
    options.context = context;
    OH_AI_Status ret = BuildModelInternal(options);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    ResizeModelIfNeeded(model, inputs, modelPredictOptions.shapeInfos);

    FillInputsData(inputs, modelPredictOptions.modelName, modelPredictOptions.isTranspose);
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    OH_AI_Status predictRet = PredictWithOptionalCallback(model, inputs, outputs, modelPredictOptions.isCallback);
    OHPrintf("==========Model Predict End==========\n");
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("=========CompareResult===========\n");
    CompareResult(outputs, modelPredictOptions.modelName);
    OHPrintf("=========OH_AI_ContextDestroy===========\n");
    OH_AI_ContextDestroy(&context);
    OHPrintf("=========OH_AI_ContextDestroy End===========\n");
    OHPrintf("=========OH_AI_ModelDestroy===========\n");
    OH_AI_ModelDestroy(&model);
    OHPrintf("=========OH_AI_ModelDestroy End===========\n");
}

// model build and predict
void ModelTrain(OH_AI_ModelHandle model, OH_AI_ContextHandle context, ModelTrainOptions& options)
{
    string modelPath = ActsMindSporeConstants::FILES_DIR + options.modelName + ".ms";
    const char* graphPath = modelPath.c_str();
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    OH_AI_Status ret = OH_AI_STATUS_SUCCESS;
    if (options.buildByGraph) {
        OHPrintf("==========Build model by graphBuf==========\n");
        size_t size;
        size_t* ptrSize = &size;
        char* graphBuf = ReadFile(graphPath, ptrSize);
        ASSERT_NE(graphBuf, nullptr);
        ret = OH_AI_TrainModelBuild(model, graphBuf, size, OH_AI_MODELTYPE_MINDIR, context, trainCfg);
        delete[] graphBuf;
    } else {
        OHPrintf("==========Build model==========\n");
        ret = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    }
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    if (options.shapeInfos.shape_num != 0) {
        OHPrintf("==========Resizes==========\n");
        OH_AI_Status resizeRet = OH_AI_ModelResize(model, inputs, &options.shapeInfos, inputs.handle_num);
        OHPrintf("==========Resizes return code:%d\n", resizeRet);
        ASSERT_EQ(resizeRet, OH_AI_STATUS_SUCCESS);
    }
    FillInputsData(inputs, options.modelName, options.isTranspose);
    ret = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    if (options.isCallback) {
        OHPrintf("==========Model RunStep Callback==========\n");
        OH_AI_KernelCallBack beforeCallBack = PrintBeforeCallback;
        OH_AI_KernelCallBack afterCallBack = PrintAfterCallback;
        ret = OH_AI_RunStep(model, beforeCallBack, afterCallBack);
    } else {
        OHPrintf("==========Model RunStep==========\n");
        ret = OH_AI_RunStep(model, nullptr, nullptr);
    }
    OHPrintf("==========Model RunStep End==========\n");
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
}

char** TransStrVectorToCharArrays(const std::vector<std::string>& s)
{
    if (s.empty()) {
        return nullptr;
    }
    char** charArr = static_cast<char**>(malloc(s.size() * sizeof(char*)));
    if (charArr == nullptr) {
        return nullptr;
    }
    for (size_t i = 0; i < s.size(); ++i) {
        size_t len = s[i].size();
        if (len > SIZE_MAX - 1) {
            for (size_t j = 0; j < i; ++j)
                free(charArr[j]);
            free(charArr);
            return nullptr;
        }
        charArr[i] = static_cast<char*>(malloc(len + 1));
        if (charArr[i] == nullptr) {
            for (size_t j = 0; j < i; ++j) {
                free(charArr[j]);
            }
            free(charArr);
            return nullptr;
        }
        if (len > 0) {
            SafeMemcpy(charArr[i], len, s[i].c_str(), len);
        }
        charArr[i][len] = '\0';
    }
    return charArr;
}

std::vector<std::string> TransCharArraysToStrVector(char** c, const size_t& num)
{
    std::vector<std::string> str;
    for (size_t i = 0; i < num; i++) {
        str.push_back(std::string(c[i]));
    }
    return str;
}

void PrintTrainLossName(OH_AI_TrainCfgHandle trainCfg)
{
    size_t num = 0;
    char** lossName = OH_AI_TrainCfgGetLossName(trainCfg, &num);
    std::vector<std::string> trainCfgLossName = TransCharArraysToStrVector(lossName, num);
    for (auto ele : trainCfgLossName) {
        std::cout << "loss_name:" << ele << std::endl;
    }
    for (size_t i = 0; i < num; i++) {
        free(lossName[i]);
    }
}

// predict on cpu
void PredictCPU()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
}

// predict on cpu
void PredictNPU()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
}
} // namespace MindSpore
}