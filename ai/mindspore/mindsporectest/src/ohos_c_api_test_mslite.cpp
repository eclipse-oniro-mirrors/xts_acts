/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <thread>
#include <random>
#include <inttypes.h>
#include <securec.h>
#include "ohos_common.h"
#include "gtest/gtest.h"
#include "include/c_api/context_c.h"
#include "include/c_api/model_c.h"
#include "include/c_api/types_c.h"
#include "include/c_api/status_c.h"
#include "include/c_api/data_type_c.h"
#include "include/c_api/tensor_c.h"
#include "include/c_api/format_c.h"
#include "syspara/parameter.h"

using namespace testing::ext;

class MSLiteTest: public testing::Test {
protected:
    static void SetUpTestCase(void) {}
    static void TearDownTestCase(void) {}
    virtual void SetUp() {}
    virtual void TearDown() {}
};

// function before callback
bool PrintBeforeCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                         const OH_AI_CallBackParam kernel_Info) {
    std::cout << "Before forwarding " << kernel_Info.node_name << " " << kernel_Info.node_type << std::endl;
    return true;
}

// function after callback
bool PrintAfterCallback(const OH_AI_TensorHandleArray inputs, const OH_AI_TensorHandleArray outputs,
                        const OH_AI_CallBackParam kernel_Info) {
    std::cout << "After forwarding " << kernel_Info.node_name << " " << kernel_Info.node_type << std::endl;
    return true;
}

// add cpu device info
void AddContextDeviceCPU(OH_AI_ContextHandle context) {
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
}

bool IsNNRTAvailable() {
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        return false;
    }
    auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
    if (type != 1) {
        return false;
    }
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    return true;
}

bool IsNPU() {
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


OH_AI_Status OH_AI_Test_GetDeviceID(char *nnrtDevice, size_t len)
{
    const std::string nullHardwareName = "default";
    const std::string hardwareName = "const.ai.nnrt_deivce";
    constexpr size_t hardwareNameMaxLength = 128;

    if (nnrtDevice == nullptr || len == 0) {
        std::cout << "nnrtDevice is nullptr or len is 0." << std::endl;
        return OH_AI_STATUS_LITE_ERROR;
    }

    char cName[hardwareNameMaxLength] = {0};
    int ret = GetParameter(hardwareName.c_str(), nullHardwareName.c_str(), cName, hardwareNameMaxLength);
    // 如果成功获取返回值为硬件名称的字节数
    if (ret <= 0) {
        std::cout << "GetNNRtDeviceName failed, failed to get parameter." << std::endl;
        return OH_AI_STATUS_LITE_ERROR;
    }

    auto secureRet = strcpy_s(nnrtDevice, len, cName);
    if (secureRet != EOK) {
        std::cout << "GetNNRtDeviceName failed, failed to get name." << std::endl;
        return OH_AI_STATUS_LITE_ERROR;
    }
    return OH_AI_STATUS_SUCCESS;
}


// add nnrt device info
void AddContextDeviceNNRT(OH_AI_ContextHandle context) {
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return;
    }

    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }

    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(descs);

    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    ASSERT_NE(nnrt_device_info, nullptr);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);

    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(nnrt_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_NNRT);

    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_MEDIUM);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// add nnrt device info
void AddContextDeviceNNRTWithCache(OH_AI_ContextHandle context, const char *cache_path, const char *cache_version) {
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return;
    }

    std::cout << "found " << num << " nnrt devices" << std::endl;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        ASSERT_NE(desc, nullptr);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;
    }

    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(descs);

    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    ASSERT_NE(nnrt_device_info, nullptr);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);

    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(nnrt_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_NNRT);

    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_MEDIUM);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cache_path, strlen(cache_path));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CacheVersion", cache_version, strlen(cache_version));

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// add nnrt device info by type
void AddContextDeviceNNRTByType(OH_AI_ContextHandle context) {
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    // 返回值desc是NNRTDeviceDesc结构体数组首地址
    if (desc == nullptr) {
        return;
    }
    // 目前nnrt仅提供了rk3568的驱动，只有cpu一个设备，故不用判断
    std::cout << "found " << num << " nnrt devices" << std::endl;
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
    auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
    std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;

    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByType(type);
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    ASSERT_NE(nnrt_device_info, nullptr);

    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(nnrt_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_NNRT);
    ASSERT_EQ(OH_AI_DeviceInfoGetDeviceId(nnrt_device_info), id);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// add nnrt device info by name
void AddContextDeviceNNRTByName(OH_AI_ContextHandle context) {
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    // 返回值desc是NNRTDeviceDesc结构体数组首地址
    if (desc == nullptr) {
        return;
    }
    // 目前nnrt仅提供了rk3568的驱动，只有cpu一个设备，故不用判断
    std::cout << "found " << num << " nnrt devices" << std::endl;
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
    auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
    std::cout << "NNRT device: id = " << id << ", name: " << name << ", type:" << type << std::endl;

    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByName(name);
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    ASSERT_NE(nnrt_device_info, nullptr);

    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(nnrt_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_NNRT);
    ASSERT_EQ(OH_AI_DeviceInfoGetDeviceId(nnrt_device_info), id);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// fill data to inputs tensor
void FillInputsData(OH_AI_TensorHandleArray inputs, string model_name, bool is_transpose) {
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        printf("==========ReadFile==========\n");
        size_t size1;
        size_t *ptr_size1 = &size1;
        string input_data_path = "/data/test/" + model_name + "_" + std::to_string(i) + ".input";
        const char *imagePath = input_data_path.c_str();
        char *imageBuf = ReadFile(imagePath, ptr_size1);
        ASSERT_NE(imageBuf, nullptr);
        OH_AI_TensorHandle tensor = inputs.handle_list[i];
        int64_t element_num = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s. \n", OH_AI_TensorGetName(tensor));
        float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(inputs.handle_list[i]));
        ASSERT_NE(input_data, nullptr);
        if (is_transpose) {
            printf("==========Transpose==========\n");
            size_t shape_num;
            const int64_t *shape = OH_AI_TensorGetShape(tensor, &shape_num);
            auto imageBuf_nhwc = new char[size1];
            PackNCHWToNHWCFp32(imageBuf, imageBuf_nhwc, shape[0], shape[1] * shape[2], shape[3]);
            memcpy_s(input_data, size1, imageBuf_nhwc, size1);
            delete[] imageBuf_nhwc;
        } else {
            memcpy_s(input_data, size1, imageBuf, size1);
        }
        printf("input data after filling is: ");
        for (int j = 0; j < element_num && j <= 20; ++j) {
            printf("%f ", input_data[j]);
        }
        printf("\n");
        delete[] imageBuf;
    }
}

// compare result after predict
void CompareResult(OH_AI_TensorHandleArray outputs, string model_name, float atol = 0.01, float rtol = 0.01, bool isquant = false) {
    printf("==========GetOutput==========\n");
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t element_num = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s .\n", OH_AI_TensorGetName(tensor));
        float *output_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(tensor));
        printf("output data is:");
        for (int j = 0; j < element_num && j <= 20; ++j) {
            printf("%f ", output_data[j]);
        }
        printf("\n");
        printf("==========compFp32WithTData==========\n");
        string output_file = "/data/test/" + model_name + std::to_string(i) + ".output";
        bool result = compFp32WithTData(output_data, output_file, atol, rtol, isquant);
        EXPECT_EQ(result, true);
    }
}

// model build and predict
void ModelPredict(OH_AI_ModelHandle model, OH_AI_ContextHandle context, string model_name,
            OH_AI_ShapeInfo shape_infos, bool build_by_graph, bool is_transpose, bool is_callback) {
    string model_path = "/data/test/" + model_name + ".ms";
    const char *graphPath = model_path.c_str();
    OH_AI_Status ret = OH_AI_STATUS_SUCCESS;
    if (build_by_graph) {
        printf("==========Build model by graphBuf==========\n");
        size_t size;
        size_t *ptr_size = &size;
        char *graphBuf = ReadFile(graphPath, ptr_size);
        ASSERT_NE(graphBuf, nullptr);
        ret = OH_AI_ModelBuild(model, graphBuf, size, OH_AI_MODELTYPE_MINDIR, context); 
        delete[] graphBuf;
    } else {
        printf("==========Build model==========\n");
        ret = OH_AI_ModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context);
    }
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    if (shape_infos.shape_num != 0) {
        printf("==========Resizes==========\n");
        OH_AI_Status resize_ret = OH_AI_ModelResize(model, inputs, &shape_infos, inputs.handle_num);
        printf("==========Resizes return code:%d\n", resize_ret);
        ASSERT_EQ(resize_ret, OH_AI_STATUS_SUCCESS);
    }

    FillInputsData(inputs, model_name, is_transpose);
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_STATUS_SUCCESS;
    if (is_callback) {
        printf("==========Model Predict Callback==========\n");
        OH_AI_KernelCallBack before_call_back = PrintBeforeCallback;
        OH_AI_KernelCallBack after_call_back = PrintAfterCallback;
        predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, before_call_back, after_call_back);
    }else {
        printf("==========Model Predict==========\n");
        predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    }
    printf("==========Model Predict End==========\n");
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("=========CompareResult===========\n");
    CompareResult(outputs, model_name);
    printf("=========OH_AI_ContextDestroy===========\n");
    OH_AI_ContextDestroy(&context);
    printf("=========OH_AI_ContextDestroy End===========\n");
    printf("=========OH_AI_ModelDestroy===========\n");
    OH_AI_ModelDestroy(&model);
    printf("=========OH_AI_ModelDestroy End===========\n");
}

// model build and predict
void ModelTrain(OH_AI_ModelHandle model, OH_AI_ContextHandle context, string model_name,
            OH_AI_ShapeInfo shape_infos, bool build_by_graph, bool is_transpose, bool is_callback) {
    string model_path = "/data/test/" + model_name + ".ms";
    const char *graphPath = model_path.c_str();
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    OH_AI_Status ret = OH_AI_STATUS_SUCCESS;
    if (build_by_graph) {
        printf("==========Build model by graphBuf==========\n");
        size_t size;
        size_t *ptr_size = &size;
        char *graphBuf = ReadFile(graphPath, ptr_size);
        ASSERT_NE(graphBuf, nullptr);
        ret = OH_AI_TrainModelBuild(model, graphBuf, size, OH_AI_MODELTYPE_MINDIR, context, train_cfg); 
        delete[] graphBuf;
    } else {
        printf("==========Build model==========\n");
        ret = OH_AI_TrainModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    }
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    if (shape_infos.shape_num != 0) {
        printf("==========Resizes==========\n");
        OH_AI_Status resize_ret = OH_AI_ModelResize(model, inputs, &shape_infos, inputs.handle_num);
        printf("==========Resizes return code:%d\n", resize_ret);
        ASSERT_EQ(resize_ret, OH_AI_STATUS_SUCCESS);
    }
    FillInputsData(inputs, model_name, is_transpose);
    ret = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    if (is_callback) {
        printf("==========Model RunStep Callback==========\n");
        OH_AI_KernelCallBack before_call_back = PrintBeforeCallback;
        OH_AI_KernelCallBack after_call_back = PrintAfterCallback;
        ret = OH_AI_RunStep(model, before_call_back, after_call_back);
    }else {
        printf("==========Model RunStep==========\n");
        ret = OH_AI_RunStep(model, nullptr, nullptr);
    }
    printf("==========Model RunStep End==========\n");
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
}
char **TransStrVectorToCharArrays(const std::vector<std::string> &s) {
  char **char_arr = static_cast<char **>(malloc(s.size() * sizeof(char *)));
  for (size_t i = 0; i < s.size(); i++) {
    char_arr[i] = static_cast<char *>(malloc((s[i].size() + 1)));
    strcpy(char_arr[i], s[i].c_str());
  }
  return char_arr;
}
std::vector<std::string> TransCharArraysToStrVector(char **c, const size_t &num) {
  std::vector<std::string> str;
  for (size_t i = 0; i < num; i++) {
    str.push_back(std::string(c[i]));
  }
  return str;
}

void PrintTrainLossName(OH_AI_TrainCfgHandle trainCfg) {
    size_t num = 0;
    char **lossName = OH_AI_TrainCfgGetLossName(trainCfg, &num);
    std::vector<std::string> trainCfgLossName = TransCharArraysToStrVector(lossName, num);
    for (auto ele : trainCfgLossName) {
        std::cout << "loss_name:" << ele << std::endl;
    }
    for (size_t i = 0; i < num; i++) {
        free(lossName[i]);
    }
}

// 正常场景：更新权重
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto GenRandomData = [](size_t size, void *data) {
      auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
      std::mt19937 random_engine_;
      size_t elements_num = size / sizeof(float);
      (void)std::generate_n(static_cast<float *>(data), elements_num,
                            [&]() { return static_cast<float>(generator(random_engine_)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t create_shape_num = 1;
    int64_t create_shape[create_shape_num] = {10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    GenRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    status = OH_AI_ModelUpdateWeights(model, update_weights);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

void ModelUpdateWeightsTest(OH_AI_ModelHandle model)
{
    OH_AI_TensorHandleArray get_update_weights = OH_AI_ModelGetWeights(model);
    for (size_t i = 0; i < get_update_weights.handle_num; ++i) {
        OH_AI_TensorHandle weights_tensor = get_update_weights.handle_list[i];
        if (strcmp(OH_AI_TensorGetName(weights_tensor), "fc3.bias") == 0) {
            float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(weights_tensor));
            std::cout << "fc3.bias:" << input_data[0] << std::endl;
        }
    }
    auto genRandomData = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 randomEngine;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
            [&]() { return static_cast<float>(generator(randomEngine)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = {10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        createShapeNum, nullptr, 0);
    genRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    OH_AI_ModelUpdateWeights(model, update_weights);
}

// 正常场景：更新权重后导出训练图，再获取权重
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0002, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR,
        context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    ModelUpdateWeightsTest(model);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT,
        true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray export_update_weights = OH_AI_ModelGetWeights(model);
    for (size_t i = 0; i < export_update_weights.handle_num; ++i) {
        OH_AI_TensorHandle weights_tensor = export_update_weights.handle_list[i];
        if (strcmp(OH_AI_TensorGetName(weights_tensor), "fc3.bias") == 0){
            float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(weights_tensor));
            std::cout << "fc3.bias:" << input_data[0] << std::endl;
        }
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：更新权重tensor name错误
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0003, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t create_shape_num = 1;
    int64_t create_shape[create_shape_num] = {10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("aaaaa", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape, create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    status = OH_AI_ModelUpdateWeights(model, update_weights);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：更新权重tensor type错误
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0004, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t create_shape_num = 1;
    int64_t create_shape[create_shape_num] = {10};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT16, create_shape, create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    vec_inputs.push_back(tensor);
    OH_AI_TensorHandleArray update_weights = {1, vec_inputs.data()};
    status = OH_AI_ModelUpdateWeights(model, update_weights);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：更新权重tensor name全部错误
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0005, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray get_weights = OH_AI_ModelGetWeights(model);
    std::vector<OH_AI_TensorHandle>  feature_maps;
    for (size_t i = 0; i < get_weights.handle_num; i++) {
        auto name = OH_AI_TensorGetName(get_weights.handle_list[i]);
        size_t shape_num;
        auto shape = OH_AI_TensorGetShape(get_weights.handle_list[i], &shape_num);
        OH_AI_DataType data_type = OH_AI_TensorGetDataType(get_weights.handle_list[i]);
        auto data = OH_AI_TensorGetData(get_weights.handle_list[i]);
        auto data_size = OH_AI_TensorGetDataSize(get_weights.handle_list[i]);
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate(name, data_type, shape, shape_num, data, data_size);
        OH_AI_TensorSetName(tensor, "AAAA");
        feature_maps.push_back(tensor);
    }
    printf("==========OH_AI_TrainModel updateWeights==========\n");
    status = OH_AI_ModelUpdateWeights(model, {feature_maps.size(), feature_maps.data()});
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：更新权重tensor name错误一个
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_UpdateWeights_0006, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray get_weights = OH_AI_ModelGetWeights(model);
    std::vector<OH_AI_TensorHandle>  feature_maps;
    for (size_t i = 0; i < get_weights.handle_num; i++) {
        auto name = OH_AI_TensorGetName(get_weights.handle_list[i]);
        size_t shape_num;
        auto shape = OH_AI_TensorGetShape(get_weights.handle_list[i], &shape_num);
        OH_AI_DataType data_type = OH_AI_TensorGetDataType(get_weights.handle_list[i]);
        auto data = OH_AI_TensorGetData(get_weights.handle_list[i]);
        auto data_size = OH_AI_TensorGetDataSize(get_weights.handle_list[i]);
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate(name, data_type, shape, shape_num, data, data_size);
        feature_maps.push_back(tensor);
    }
    printf("==========OH_AI_TrainModel updateWeights==========\n");
    OH_AI_TensorSetName(feature_maps.at(1), "AAAA");
    status = OH_AI_ModelUpdateWeights(model, {feature_maps.size(), feature_maps.data()});
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：设置学习率为0.01
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_SetLearningRate_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto learing_rate = OH_AI_ModelGetLearningRate(model);
    std::cout << "learing_rate:" << learing_rate << std::endl;
    status = OH_AI_ModelSetLearningRate(model, 0.01f);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    learing_rate = OH_AI_ModelGetLearningRate(model);
    std::cout << "get_learing_rate:" << learing_rate << std::endl;
    ASSERT_EQ(learing_rate, 0.01f);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：设置学习率值为1000.0
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_SetLearningRate_0002, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto learing_rate = OH_AI_ModelGetLearningRate(model);
    std::cout << "learing_rate:" << learing_rate << std::endl;
    status = OH_AI_ModelSetLearningRate(model, 1000.0f);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    learing_rate = OH_AI_ModelGetLearningRate(model);
    std::cout << "get_learing_rate:" << learing_rate << std::endl;
    ASSERT_EQ(learing_rate, 1000.0f);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：设置虚拟batch_size为2
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_SetupVirtualBatch_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ModelSetupVirtualBatch(model, 2, -1.0f, -1.0f);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, "lenet_train_infer", {}, false, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：设置优化等级
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_SetOptimizationLevel_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    auto opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    std::cout << "opt_level:" << opt_level << std::endl;
    OH_AI_TrainCfgSetOptimizationLevel(train_cfg, OH_AI_KO2);
    auto set_opt_level = OH_AI_TrainCfgGetOptimizationLevel(train_cfg);
    std::cout << "set_opt_level:" << set_opt_level << std::endl;
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, "lenet_train_infer", {}, false, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：创建TrainCfg对象并销毁
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_TrainCfg_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    OH_AI_TrainCfgDestroy(&train_cfg);
    ASSERT_EQ(train_cfg, nullptr);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：设置存在的损失函数名
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_TrainCfg_0002, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    PrintTrainLossName(train_cfg);

    std::vector<std::string> set_train_cfg_loss_name = {"loss_fct", "_loss_fn"};
    char **set_loss_name = TransStrVectorToCharArrays(set_train_cfg_loss_name);
    OH_AI_TrainCfgSetLossName(train_cfg, const_cast<const char **>(set_loss_name), set_train_cfg_loss_name.size());
    PrintTrainLossName(train_cfg);

    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, "lenet_train_infer", {}, false, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：设置不存在的损失函数名
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_TrainCfg_0003, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    PrintTrainLossName(train_cfg);

    std::vector<std::string> set_train_cfg_loss_name = {"aaa", "bbb"};
    char **set_loss_name = TransStrVectorToCharArrays(set_train_cfg_loss_name);
    OH_AI_TrainCfgSetLossName(train_cfg, const_cast<const char **>(set_loss_name), set_train_cfg_loss_name.size());
    PrintTrainLossName(train_cfg);

    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：设置损失函数名个数大于num
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_TrainCfg_0004, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    PrintTrainLossName(train_cfg);

    std::vector<std::string> set_train_cfg_loss_name = {"loss_fct", "_loss_fn"};
    char **set_loss_name = TransStrVectorToCharArrays(set_train_cfg_loss_name);
    OH_AI_TrainCfgSetLossName(train_cfg, const_cast<const char **>(set_loss_name), 1);
    PrintTrainLossName(train_cfg);

    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：通过buffer加载模型，执行1轮训练并对比精度
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ModelBuild_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, true, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, "lenet_train_infer", {}, true, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：加载模型buffer为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ModelBuild_0002, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========Build model by graphBuf==========\n");
    auto status = OH_AI_TrainModelBuild(model, nullptr, 0, OH_AI_MODELTYPE_MINDIR, context, train_cfg); 
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：加载模型文件路径不存在
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ModelBuild_0003, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/not_exist/lenet_train.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：加载模型文件路径为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ModelBuild_0004, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    auto status = OH_AI_TrainModelBuildFromFile(model, "", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：加载模型文件路径为错误文件
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ModelBuild_0005, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/lenet_train_0.input", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：训练model导出推理图后对比精度
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, "lenet_train_infer", {}, false, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：quantization_type为OH_AI_WEIGHT_QUANT
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0002, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_WEIGHT_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, "lenet_train_infer", {}, false, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：quantization_type为OH_AI_FULL_QUANT
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0003, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_FULL_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, "lenet_train_infer", {}, false, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：quantization_type为OH_AI_UNKNOWN_QUANT_TYPE
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0004, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_UNKNOWN_QUANT_TYPE, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, "lenet_train_infer", {}, false, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：export_inference_only为false
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0005, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_train.ms", OH_AI_NO_QUANT, false, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelTrain==========\n");
    ModelTrain(model2, context2, "lenet_train_train", {}, false, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：export_inference_only为false，再指定output_tensor_name
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0006, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    const std::vector<std::string> output_name = {"Default/network-WithLossCell/_loss_fn-L1Loss/ReduceMean-op127"};
    auto output_tensor_name = TransStrVectorToCharArrays(output_name);
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_train.ms", OH_AI_NO_QUANT, false, output_tensor_name, 1);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    printf("==========ModelTrain==========\n");
    ModelTrain(model2, context2, "lenet_train_train", {}, false, false, false);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：OH_AI_MODELTYPE_INVALID
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0007, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_INVALID, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：指定导出不存在的output_tensor_name
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0008, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    const std::vector<std::string> output_name = {"aaa"};
    auto output_tensor_name = TransStrVectorToCharArrays(output_name);
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT, true, output_tensor_name, 1);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：output_tensor_name的个数与num不一致
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0009, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    const std::vector<std::string> output_name = {"Default/network-WithLossCell/_loss_fn-L1Loss/ReduceMean-op127"};
    auto output_tensor_name = TransStrVectorToCharArrays(output_name);
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT, true, output_tensor_name, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：model_file文件路径不存在
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0010, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/not_exsit/lenet_train_infer.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：model_file路径为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0011, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：model_file路径为文件夹
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0012, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：OH_AI_ModelGetTrainMode
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0013, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/lenet_train_infer.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto train_mode = OH_AI_ModelGetTrainMode(model);
    ASSERT_EQ(train_mode, false);
    printf("=========OH_AI_ModelDestroy===========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    printf("=========OH_AI_ModelDestroy End===========\n");
}
// 正常场景：OH_AI_ExportModelBuffer
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportModel_0014, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_RunStep==========\n");
    ModelTrain(model, context, "lenet_train", {}, false, false, false);
    printf("==========OH_AI_ExportModel==========\n");
    char *modelData;
    size_t data_size;
    auto status = OH_AI_ExportModelBuffer(model, OH_AI_MODELTYPE_MINDIR, &modelData,
	 &data_size, OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    ASSERT_NE(modelData, nullptr);
    ASSERT_NE(data_size, 0);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);

    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    printf("==========ModelPredict==========\n");
    auto ret = OH_AI_ModelBuild(model2, modelData, data_size, OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model2);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train_infer", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model2, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("=========CompareResult===========\n");
    CompareResult(outputs, "lenet_train_infer");
    printf("=========model01 context and Model destroy===========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    printf("=========model01 context and Model destroy End===========\n");
    printf("=========model02 context and Model destroy===========\n");
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model2);
    printf("=========model02 context and Model destroy End===========\n");
}
// 正常场景：训练model导出micro权重
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportWeights_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/xiaoyi_train_codegen.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_gru_model1.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_net1.bin", true, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_net1_fp32.bin", true, false, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

void ModelExportWeightsTest(OH_AI_ModelHandle model)
{
    const std::vector<std::string> changebleWeightsName = {"app_usage_statistic_30_cell.embedding.embedding_table",
        "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
        "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
        "data-57"};
    char **setChangebleWeightsName = TransStrVectorToCharArrays(changebleWeightsName);
    OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR,
        "/data/test/xiaoyi_train_codegen_net1.bin", true, true,
        setChangebleWeightsName, changebleWeightsName.size());
    OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR,
        "/data/test/xiaoyi_train_codegen_net1_fp32.bin", true, false,
        setChangebleWeightsName, changebleWeightsName.size());
    printf("==================== update weight ==================\n");
    auto genRandomData = [](size_t size, void *data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 randomEngine;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(static_cast<float *>(data), elementsNum,
            [&]() { return static_cast<float>(generator(randomEngine)); });
    };
    std::vector<OH_AI_TensorHandle> vec_inputs;
    constexpr size_t createShapeNum = 2;
    int64_t createShape[createShapeNum] = {76, 8};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("app_usage_statistic_30_cell.embedding.embedding_table",
        OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    genRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vec_inputs.push_back(tensor);
    constexpr size_t createShapeNum2 = 2;
    int64_t createShape2[createShapeNum2] = {76, 8};
    OH_AI_TensorHandle tensor2 = OH_AI_TensorCreate("moment1.app_usage_statistic_30_cell.embedding.embedding_table",
        OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape2, createShapeNum2, nullptr, 0);
    genRandomData(OH_AI_TensorGetDataSize(tensor2), OH_AI_TensorGetMutableData(tensor2));
    vec_inputs.push_back(tensor2);
    constexpr size_t createShapeNum3 = 2;
    int64_t createShape3[createShapeNum3] = {76, 8};
    OH_AI_TensorHandle tensor3 = OH_AI_TensorCreate("moment2.app_usage_statistic_30_cell.embedding.embedding_table",
        OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape3, createShapeNum3, nullptr, 0);
    genRandomData(OH_AI_TensorGetDataSize(tensor3), OH_AI_TensorGetMutableData(tensor3));
    vec_inputs.push_back(tensor3);
    OH_AI_TensorHandleArray update_weights = {3, vec_inputs.data()};
    OH_AI_ModelUpdateWeights(model, update_weights);
}

// 正常场景：训练model更新并导出micro权重
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportWeights_0002, Function | MediumTest | Level0) {
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    std::vector<std::string> set_train_cfg_loss_name = {"loss_fct", "_loss_fn", "SigmoidCrossEntropy",
        "BinaryCrossEntropy"};
    char **set_loss_name = TransStrVectorToCharArrays(set_train_cfg_loss_name);
    OH_AI_TrainCfgSetLossName(train_cfg, const_cast<const char **>(set_loss_name), set_train_cfg_loss_name.size());
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/xiaoyi_train_codegen.ms", OH_AI_MODELTYPE_MINDIR,
        context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_gru_model1.ms",
        OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const std::vector<std::string> changebleWeightsName2 = {"app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "data-57"};
    char **setChangebleWeightsName2 = TransStrVectorToCharArrays(changebleWeightsName2);
    ModelExportWeightsTest(model);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel2==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_gru_model2.ms",
        OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR,
        "/data/test/xiaoyi_train_codegen_net2.bin", true, true,
        setChangebleWeightsName2, changebleWeightsName2.size());
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR,
        "/data/test/xiaoyi_train_codegen_net2_fp32.bin", true, false,
        setChangebleWeightsName2, changebleWeightsName2.size());
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：weight_file文件路径不存在
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportWeights_0003, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    std::vector<std::string> set_train_cfg_loss_name = {"loss_fct", "_loss_fn", "SigmoidCrossEntropy", "BinaryCrossEntropy"};
    char **set_loss_name = TransStrVectorToCharArrays(set_train_cfg_loss_name);
    OH_AI_TrainCfgSetLossName(train_cfg, const_cast<const char **>(set_loss_name), set_train_cfg_loss_name.size());
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/xiaoyi_train_codegen.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_gru_model1.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const std::vector<std::string> changeble_weights_name = {"app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "data-57"};
    char **set_changeble_weights_name = TransStrVectorToCharArrays(changeble_weights_name);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR, "/data/not_exist/xiaoyi_train_codegen_net1.bin", true, true, set_changeble_weights_name, changeble_weights_name.size());
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：weight_file路径为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportWeights_0004, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    std::vector<std::string> set_train_cfg_loss_name = {"loss_fct", "_loss_fn", "SigmoidCrossEntropy", "BinaryCrossEntropy"};
    char **set_loss_name = TransStrVectorToCharArrays(set_train_cfg_loss_name);
    OH_AI_TrainCfgSetLossName(train_cfg, const_cast<const char **>(set_loss_name), set_train_cfg_loss_name.size());
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/xiaoyi_train_codegen.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_gru_model1.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const std::vector<std::string> changeble_weights_name = {"app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "data-57"};
    char **set_changeble_weights_name = TransStrVectorToCharArrays(changeble_weights_name);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR, "", true, true, set_changeble_weights_name, changeble_weights_name.size());
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：weight_file路径为文件夹
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportWeights_0005, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    std::vector<std::string> set_train_cfg_loss_name = {"loss_fct", "_loss_fn", "SigmoidCrossEntropy", "BinaryCrossEntropy"};
    char **set_loss_name = TransStrVectorToCharArrays(set_train_cfg_loss_name);
    OH_AI_TrainCfgSetLossName(train_cfg, const_cast<const char **>(set_loss_name), set_train_cfg_loss_name.size());
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/xiaoyi_train_codegen.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_gru_model1.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const std::vector<std::string> changeble_weights_name = {"app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "data-57"};
    char **set_changeble_weights_name = TransStrVectorToCharArrays(changeble_weights_name);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR, "/data/test/", true, true, set_changeble_weights_name, changeble_weights_name.size());
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 异常场景：is_inference为false
HWTEST(MSLiteTest, SUB_AI_MindSpore_Train_ExportWeights_0006, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle train_cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(train_cfg, nullptr);
    std::vector<std::string> set_train_cfg_loss_name = {"loss_fct", "_loss_fn", "SigmoidCrossEntropy", "BinaryCrossEntropy"};
    char **set_loss_name = TransStrVectorToCharArrays(set_train_cfg_loss_name);
    OH_AI_TrainCfgSetLossName(train_cfg, const_cast<const char **>(set_loss_name), set_train_cfg_loss_name.size());
    printf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(model, "/data/test/xiaoyi_train_codegen.ms", OH_AI_MODELTYPE_MINDIR, context, train_cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_gru_model1.ms", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const std::vector<std::string> changeble_weights_name = {"app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
                                                 "data-57"};
    char **set_changeble_weights_name = TransStrVectorToCharArrays(changeble_weights_name);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model, OH_AI_MODELTYPE_MINDIR, "/data/test/xiaoyi_train_codegen_net1.bin", false, true, set_changeble_weights_name, changeble_weights_name.size());
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


// predict on cpu
void Predict_CPU() {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// predict on cpu
void Predict_NPU() {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，默认场景，不设置线程绑核
HWTEST(MSLiteTest, OHOS_Context_CPU_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，4线程
HWTEST(MSLiteTest, OHOS_Context_CPU_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 4);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 4);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，2线程
HWTEST(MSLiteTest, OHOS_Context_CPU_0003, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 2);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 2);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，1线程
HWTEST(MSLiteTest, OHOS_Context_CPU_0004, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 1);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 1);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 异常场景：Context设置CPU，0线程
HWTEST(MSLiteTest, OHOS_Context_CPU_0005, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 0);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 0);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：Context设置CPU，不绑核
HWTEST(MSLiteTest, OHOS_Context_CPU_0006, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 4);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 4);
    OH_AI_ContextSetThreadAffinityMode(context, 0);
    int thread_affinity_mode = OH_AI_ContextGetThreadAffinityMode(context);
    printf("==========thread_affinity_mode:%d\n", thread_affinity_mode);
    ASSERT_EQ(thread_affinity_mode, 0);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，绑大核
HWTEST(MSLiteTest, OHOS_Context_CPU_0007, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 4);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 4);
    OH_AI_ContextSetThreadAffinityMode(context, 1);
    int thread_affinity_mode = OH_AI_ContextGetThreadAffinityMode(context);
    printf("==========thread_affinity_mode:%d\n", thread_affinity_mode);
    ASSERT_EQ(thread_affinity_mode, 1);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，绑中核
HWTEST(MSLiteTest, OHOS_Context_CPU_0008, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 4);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 4);
    OH_AI_ContextSetThreadAffinityMode(context, 2);
    int thread_affinity_mode = OH_AI_ContextGetThreadAffinityMode(context);
    printf("==========thread_affinity_mode:%d\n", thread_affinity_mode);
    ASSERT_EQ(thread_affinity_mode, 2);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 异常场景：Context设置CPU，绑核失败
HWTEST(MSLiteTest, OHOS_Context_CPU_0009, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 4);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 4);
    OH_AI_ContextSetThreadAffinityMode(context, 3);
    int thread_affinity_mode = OH_AI_ContextGetThreadAffinityMode(context);
    printf("==========thread_affinity_mode:%d\n", thread_affinity_mode);
    ASSERT_EQ(thread_affinity_mode, 0);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：Context设置CPU，绑核列表{0,1,2,3}
HWTEST(MSLiteTest, OHOS_Context_CPU_0010, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 4);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 4);
    constexpr size_t core_num = 4;
    int32_t core_list[core_num] = {0, 1, 2, 3};
    OH_AI_ContextSetThreadAffinityCoreList(context, core_list, core_num);
    size_t ret_core_num;
    int32_t *ret_core_list = nullptr;
    ret_core_list = const_cast<int32_t *>(OH_AI_ContextGetThreadAffinityCoreList(context, &ret_core_num));
    ASSERT_EQ(ret_core_num, core_num);
    for (size_t i = 0; i < ret_core_num; i++) {
        printf("==========ret_core_list:%d\n", ret_core_list[i]);
        ASSERT_EQ(ret_core_list[i], core_list[i]);
    }
    free(ret_core_list);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，绑核列表和模式同时开启
HWTEST(MSLiteTest, OHOS_Context_CPU_0011, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 4);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 4);
    OH_AI_ContextSetThreadAffinityMode(context, 1);
    int thread_affinity_mode = OH_AI_ContextGetThreadAffinityMode(context);
    printf("==========thread_affinity_mode:%d\n", thread_affinity_mode);
    constexpr size_t core_num = 4;
    int32_t core_list[core_num] = {0, 1, 3, 4};
    OH_AI_ContextSetThreadAffinityCoreList(context, core_list, core_num);
    size_t ret_core_num;
    int32_t *ret_core_list = nullptr;
    ret_core_list = const_cast<int32_t *>(OH_AI_ContextGetThreadAffinityCoreList(context, &ret_core_num));
    ASSERT_EQ(ret_core_num, core_num);
    for (size_t i = 0; i < ret_core_num; i++) {
        printf("==========ret_core_list:%d\n", ret_core_list[i]);
        ASSERT_EQ(ret_core_list[i], core_list[i]);
    }
    free(ret_core_list);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，开启并行
HWTEST(MSLiteTest, OHOS_Context_CPU_0012, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 4);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 4);
    OH_AI_ContextSetEnableParallel(context, true);
    bool is_parallel = OH_AI_ContextGetEnableParallel(context);
    printf("==========is_parallel:%d\n", is_parallel);
    ASSERT_EQ(is_parallel, true);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，关闭并行
HWTEST(MSLiteTest, OHOS_Context_CPU_0013, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, 4);
    int32_t thread_num = OH_AI_ContextGetThreadNum(context);
    printf("==========thread_num:%d\n", thread_num);
    ASSERT_EQ(thread_num, 4);
    OH_AI_ContextSetEnableParallel(context, false);
    bool is_parallel = OH_AI_ContextGetEnableParallel(context);
    printf("==========is_parallel:%d\n", is_parallel);
    ASSERT_EQ(is_parallel, false);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，开启fp16
HWTEST(MSLiteTest, OHOS_Context_CPU_0014, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceInfoSetEnableFP16(cpu_device_info, true);
    bool is_fp16 = OH_AI_DeviceInfoGetEnableFP16(cpu_device_info);
    printf("==========is_fp16:%d\n", is_fp16);
    ASSERT_EQ(is_fp16, true);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，关闭fp16
HWTEST(MSLiteTest, OHOS_Context_CPU_0015, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceInfoSetEnableFP16(cpu_device_info, false);
    bool is_fp16 = OH_AI_DeviceInfoGetEnableFP16(cpu_device_info);
    printf("==========is_fp16:%d\n", is_fp16);
    ASSERT_EQ(is_fp16, false);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，设置厂商名称
HWTEST(MSLiteTest, OHOS_Context_CPU_0016, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceInfoSetProvider(cpu_device_info, "vendor_new");
    char *proInfo = const_cast<char *>(OH_AI_DeviceInfoGetProvider(cpu_device_info));
    ASSERT_EQ(strcmp(proInfo, "vendor_new"), 0);
    free(proInfo);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，设置厂商设备类型
HWTEST(MSLiteTest, OHOS_Context_CPU_0017, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceInfoSetProviderDevice(cpu_device_info, "cpu_new");
    char *proInfo = const_cast<char *>(OH_AI_DeviceInfoGetProviderDevice(cpu_device_info));
    ASSERT_EQ(strcmp(proInfo, "cpu_new"), 0);
    free(proInfo);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，销毁MSDeviceInfo
HWTEST(MSLiteTest, OHOS_Context_CPU_0018, Function | MediumTest | Level0) {
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoDestroy(&cpu_device_info);
    ASSERT_EQ(cpu_device_info, nullptr);
}

// 正常场景：Context设置CPU，销毁OH_AI_Context
HWTEST(MSLiteTest, OHOS_Context_CPU_0019, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ContextDestroy(&context);
    ASSERT_EQ(context, nullptr);
}

// 异常场景：Context不设置device info
HWTEST(MSLiteTest, OHOS_Context_CPU_0020, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：Context设置NPU,频率为1
HWTEST(MSLiteTest, OHOS_Context_NPU_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle npu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_KIRIN_NPU);
    ASSERT_NE(npu_device_info, nullptr);
    OH_AI_DeviceInfoSetFrequency(npu_device_info, 1);
    int frequency = OH_AI_DeviceInfoGetFrequency(npu_device_info);
    ASSERT_EQ(frequency, 1);
    OH_AI_ContextAddDeviceInfo(context, npu_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelBuild，调用指针方法
HWTEST(MSLiteTest, OHOS_Model_Build_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, true, true, false);
}

// 异常场景：ModelBuild，model_data指向的不是模型数据
HWTEST(MSLiteTest, OHOS_Model_Build_0002, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuild(model, imageBuf, size1, OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    delete[] imageBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，model_data为空
HWTEST(MSLiteTest, OHOS_Model_Build_0003, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuild(model, nullptr, 0, OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，data_size为0
HWTEST(MSLiteTest, OHOS_Model_Build_0004, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size;
    size_t *ptr_size = &size;
    const char *graphPath = "/data/test/ml_face_isface.ms";
    char *graphBuf = ReadFile(graphPath, ptr_size);
    ASSERT_NE(graphBuf, nullptr);
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuild(model, graphBuf, 0, OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_INPUT_PARAM_INVALID);
    delete[] graphBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，读取路径方法，且路径不是模型数据路径
HWTEST(MSLiteTest, OHOS_Model_Build_0005, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.input", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，读取路径方法，路径为空
HWTEST(MSLiteTest, OHOS_Model_Build_0006, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，model_type不支持
HWTEST(MSLiteTest, OHOS_Model_Build_0007, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_INVALID, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，model_context为空
HWTEST(MSLiteTest, OHOS_Model_Build_0008, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, nullptr);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelBuild，调用GetOutputs获取输出
HWTEST(MSLiteTest, OHOS_Model_Build_0009, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Model build==========\n");
    OH_AI_ModelBuildFromFile(model,"/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    OH_AI_TensorHandleArray output;
    FillInputsData(inputs,"ml_face_isface",false);
    OH_AI_Status ret = OH_AI_ModelPredict(model, inputs, &output, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetOutput==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t element_num = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), element_num);
        float *output_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(tensor));
        printf("output data is:");
        for (int j = 0; j < element_num && j <= 20; ++j) {
            printf("%f ", output_data[j]);
        }
        printf("\n");
        printf("==========compFp32WithTData==========\n");
        string expectedDataFile = "/data/test/ml_face_isface" + std::to_string(i) + ".output";
        bool result = compFp32WithTData(output_data, expectedDataFile, 0.01, 0.01, false);
        EXPECT_EQ(result, true);
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelResize，shape与之前一致
HWTEST(MSLiteTest, OHOS_Model_Resize_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_ocr_cn", {4, {1, 32, 512, 1}}, false, true, false);
}

// 正常场景：ModelResize，shape与之前不一致
HWTEST(MSLiteTest, OHOS_Model_Resize_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_ocr_cn.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    printf("==========Resizes==========\n");
    OH_AI_ShapeInfo shape_infos = {4, {1, 64, 256, 1}};
    OH_AI_Status resize_ret = OH_AI_ModelResize(model, inputs, &shape_infos, inputs.handle_num);
    printf("==========Resizes return code:%d\n", resize_ret);
    ASSERT_EQ(resize_ret, OH_AI_STATUS_SUCCESS);
    FillInputsData(inputs, "ml_ocr_cn", false);
    OH_AI_TensorHandleArray outputs;
    printf("==========Model Predict==========\n");
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelResize，shape为三维
HWTEST(MSLiteTest, OHOS_Model_Resize_0003, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_ocr_cn.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    printf("==========Resizes==========\n");
    OH_AI_ShapeInfo shape_infos = {4, {1, 32, 1}};
    ret = OH_AI_ModelResize(model, inputs, &shape_infos, inputs.handle_num);
    printf("==========Resizes return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelResize，shape值有负数
HWTEST(MSLiteTest, OHOS_Model_Resize_0004, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_ocr_cn.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    printf("==========Resizes==========\n");
    OH_AI_ShapeInfo shape_infos = {4, {1, -32, 32, 1}};
    ret = OH_AI_ModelResize(model, inputs, &shape_infos, inputs.handle_num);
    printf("==========Resizes return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelResize，不支持resize的模型
HWTEST(MSLiteTest, OHOS_Model_Resize_0005, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    printf("==========Resizes==========\n");
    OH_AI_ShapeInfo shape_infos = {4, {1, 96, 96, 1}};
    ret = OH_AI_ModelResize(model, inputs, &shape_infos, inputs.handle_num);
    printf("==========Resizes return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelPredict
HWTEST(MSLiteTest, OHOS_Model_Predict_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 异常场景：ModelPredict，model被销毁
HWTEST(MSLiteTest, OHOS_Model_Predict_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_ModelDestroy(&model);
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    printf("==========Model Predict return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
}

// 异常场景：ModelPredict，input为空
HWTEST(MSLiteTest, OHOS_Model_Predict_0003, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray inputs;
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    printf("==========Model Predict return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelPredict，传入回调函数
HWTEST(MSLiteTest, OHOS_Model_Predict_0004, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, true);
}

// 正常场景：ModelGetInputByTensorName
HWTEST(MSLiteTest, OHOS_Model_GetInputByTensorName_0001, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetInputByTensorName(model, "data");
    ASSERT_NE(tensor, nullptr);
    int64_t element_num = OH_AI_TensorGetElementNum(tensor);
    printf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), element_num);
    float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(tensor));
    ASSERT_NE(input_data, nullptr);
    printf("==========Transpose==========\n");
    size_t shape_num;
    const int64_t *shape = OH_AI_TensorGetShape(tensor, &shape_num);
    auto imageBuf_nhwc = new char[size1];
    PackNCHWToNHWCFp32(imageBuf, imageBuf_nhwc, shape[0], shape[1] * shape[2], shape[3]);
    memcpy_s(input_data, size1, imageBuf_nhwc, size1);
    printf("input data is:");
    for (int j = 0; j < element_num && j <= 20; ++j) {
        printf("%f ", input_data[j]);
    }
    printf("\n");
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    delete[] imageBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelGetInputByTensorName，名称不存在
HWTEST(MSLiteTest, OHOS_Model_GetInputByTensorName_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetInputByTensorName(model, "aaa");
    ASSERT_EQ(tensor, nullptr);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelGetOutputByTensorName
HWTEST(MSLiteTest, OHOS_Model_GetOutputByTensorName_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetOutput==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetOutputByTensorName(model, "prob");
    ASSERT_NE(tensor, nullptr);
    int64_t element_num = OH_AI_TensorGetElementNum(tensor);
    printf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), element_num); 
    float *output_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(tensor));
    printf("output data is:");
    for (int j = 0; j < element_num && j <= 20; ++j) {
        printf("%f ", output_data[j]);
    }
    printf("\n");
    printf("==========compFp32WithTData==========\n");
    bool result = compFp32WithTData(output_data, "/data/test/ml_face_isface0.output", 0.01, 0.01, false);
    EXPECT_EQ(result, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelGetOutputByTensorName，名称不存在
HWTEST(MSLiteTest, OHOS_Model_GetOutputByTensorName_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetOutput==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetOutputByTensorName(model, "aaa");
    ASSERT_EQ(tensor, nullptr);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：MSTensorCreate,创建tensor
HWTEST(MSLiteTest, OHOS_Tensor_Create_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                            create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    inputs.handle_list[0] = tensor;
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：MSTensorDestroy,销毁tensor
HWTEST(MSLiteTest, OHOS_Tensor_Create_0002, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    ASSERT_EQ(tensor, nullptr);
}

// 正常场景：MSTensorGetName,获取tensor名称
HWTEST(MSLiteTest, OHOS_Tensor_Create_0003, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                            create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    const char *tensor_name = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensor_name, "data"), 0);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorGetName,设置tensor名称
HWTEST(MSLiteTest, OHOS_Tensor_Create_0004, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "new_data");
    const char *tensor_name = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensor_name, "new_data"), 0);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorGetDataType,获取tensor数据类型
HWTEST(MSLiteTest, OHOS_Tensor_Create_0005, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_DataType data_type = OH_AI_TensorGetDataType(tensor);
    ASSERT_EQ(data_type, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorSetDataType,设置tensor数据类型
HWTEST(MSLiteTest, OHOS_Tensor_Create_0006, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    OH_AI_DataType data_type = OH_AI_TensorGetDataType(tensor);
    ASSERT_EQ(data_type, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorGetShape,获取tensor维度
HWTEST(MSLiteTest, OHOS_Tensor_Create_0007, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                            create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    size_t ret_shape_num;
    const int64_t *ret_shape = OH_AI_TensorGetShape(tensor, &ret_shape_num);
    ASSERT_EQ(ret_shape_num, create_shape_num);
    for (size_t i = 0; i < ret_shape_num; i++) {
        ASSERT_EQ(ret_shape[i], create_shape[i]);
    }
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorSetShape,设置tensor维度
HWTEST(MSLiteTest, OHOS_Tensor_Create_0008, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    size_t ret_shape_num;
    const int64_t *ret_shape = OH_AI_TensorGetShape(tensor, &ret_shape_num);
    ASSERT_EQ(ret_shape_num, create_shape_num);
    for (size_t i = 0; i < ret_shape_num; i++) {
        ASSERT_EQ(ret_shape[i], create_shape[i]);
    }
    constexpr size_t new_shape_num = 4;
    int64_t new_shape[new_shape_num] = {1, 32, 32, 1};
    OH_AI_TensorSetShape(tensor, new_shape, new_shape_num);
    size_t new_ret_shape_num;
    const int64_t *new_ret_shape = OH_AI_TensorGetShape(tensor, &new_ret_shape_num);
    ASSERT_EQ(new_ret_shape_num, new_shape_num);
    for (size_t i = 0; i < new_ret_shape_num; i++) {
        ASSERT_EQ(new_ret_shape[i], new_shape[i]);
    }
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorGetFormat,获取tensor格式
HWTEST(MSLiteTest, OHOS_Tensor_Create_0009, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_Format data_format = OH_AI_TensorGetFormat(tensor);
    ASSERT_EQ(data_format, OH_AI_FORMAT_NHWC);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorSetFormat,设置tensor格式
HWTEST(MSLiteTest, OHOS_Tensor_Create_0010, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NHWC);
    OH_AI_Format data_format = OH_AI_TensorGetFormat(tensor);
    ASSERT_EQ(data_format, OH_AI_FORMAT_NHWC);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorGetData,获取tensor数据
HWTEST(MSLiteTest, OHOS_Tensor_Create_0011, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    const float *ret_data = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(ret_data, nullptr);
    printf("return data is:");
    for (int i = 0; i < 20; ++i) {
        printf("%f ", ret_data[i]);
    }
    printf("\n");
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorSetData,设置tensor数据
HWTEST(MSLiteTest, OHOS_Tensor_Create_0012, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorSetData(tensor, data);
    const float *ret_data = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(ret_data, nullptr);
    printf("return data is:");
    for (size_t i = 0; i < data_len; i++) {
        ASSERT_EQ(ret_data[i], data[i]);
        printf("%f ", ret_data[i]);
    }
    printf("\n");
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorGetElementNum,获取tensor元素
HWTEST(MSLiteTest, OHOS_Tensor_Create_0013, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    int64_t element_num = OH_AI_TensorGetElementNum(tensor);
    printf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), element_num); 
    ASSERT_EQ(element_num, 6912);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorGetDataSize,获取tensor大小
HWTEST(MSLiteTest, OHOS_Tensor_Create_0014, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    size_t data_size = OH_AI_TensorGetDataSize(tensor);
    printf("Tensor data size: %zu.\n", data_size);
    ASSERT_EQ(data_size, 6912 * sizeof(float));
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorGetMutableData,获取tensor可变数据指针
HWTEST(MSLiteTest, OHOS_Tensor_Create_0015, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(tensor));
    ASSERT_NE(input_data, nullptr);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorClone,拷贝tensor
HWTEST(MSLiteTest, OHOS_Tensor_Create_0016, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone), "data_duplicate"), 0);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&clone);
}

// 正常场景：单输入模型
HWTEST(MSLiteTest, OHOS_Input_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：多输入模型
HWTEST(MSLiteTest, OHOS_Input_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_headpose_pb2tflite.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_headpose_pb2tflite", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_headpose_pb2tflite", 0.02, 0.02);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：输入为uint8模型
HWTEST(MSLiteTest, OHOS_Input_0003, Function | MediumTest | Level0) {
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/aiy_vision_classifier_plants_V1_3.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    printf("==========Create and Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/aiy_vision_classifier_plants_V1_3.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = inputs.handle_list[i];
        int64_t element_num = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), element_num);
        void *input_data = OH_AI_TensorGetMutableData(inputs.handle_list[i]);
        ASSERT_NE(input_data, nullptr);
        memcpy(input_data, imageBuf, size1);
    }
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetOutput==========\n");
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t element_num = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), element_num);
        uint8_t *output_data = reinterpret_cast<uint8_t *>(OH_AI_TensorGetMutableData(tensor));
        printf("output data is:");
        for (int j = 0; j < element_num && j <= 20; ++j) {
            printf("%d ", output_data[j]);
        }
        printf("\n==========compFp32WithTData==========\n");
        string expectedDataFile = "/data/test/aiy_vision_classifier_plants_V1_3" + std::to_string(i) + ".output";
        bool result = compUint8WithTData(output_data, expectedDataFile, 0.01, 0.01, false);
        EXPECT_EQ(result, true);
    }
    delete[] imageBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：量化模型
HWTEST(MSLiteTest, OHOS_Input_0004, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface_quant", {}, false, true, false);
}

// 正常场景：循环多次执行推理流程
HWTEST(MSLiteTest, OHOS_Multiple_0001, Function | MediumTest | Level0) {
    for (size_t num = 0; num < 50; ++num) {
        Predict_CPU();
    }
}

// 异常场景：Model创建一次，Build多次
HWTEST(MSLiteTest, OHOS_Multiple_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    int ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========Build model==========\n");
    int ret2 = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret2);
    ASSERT_EQ(ret2, OH_AI_STATUS_LITE_MODEL_REBUILD);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：Model创建一次,Build一次，Predict多次
HWTEST(MSLiteTest, OHOS_Multiple_0003, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OH_AI_TensorHandleArray outputs;
    for (size_t i = 0; i < 50; ++i) {
        printf("==========Model Predict==========\n");
        OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
        ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    }
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：多次创建和销毁Model
HWTEST(MSLiteTest, OHOS_Multiple_0004, Function | MediumTest | Level0) {
    for (size_t i = 0; i < 50; ++i) {
        printf("==========Init Context==========\n");
        OH_AI_ContextHandle context = OH_AI_ContextCreate();
        ASSERT_NE(context, nullptr);
        AddContextDeviceCPU(context);
        printf("==========Create model==========\n");
        OH_AI_ModelHandle model = OH_AI_ModelCreate();
        ASSERT_NE(model, nullptr);
        printf("==========Build model==========\n");
        OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
        printf("==========build model return code:%d\n", ret);
        ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
        printf("==========Build model==========\n");
        OH_AI_ContextDestroy(&context);
        OH_AI_ModelDestroy(&model);
    }
}

// 正常场景：两个模型都在CPU上并行推理
HWTEST(MSLiteTest, OHOS_Parallel_0001, Function | MediumTest | Level0) {
    std::cout << "run start" << std::endl;
    std::thread t1(Predict_CPU);
    std::cout << "1111111111111" << std::endl;
    std::thread t2(Predict_CPU);
    std::cout << "2222222222222" << std::endl;
    t1.join();
    t2.join();
}

// 正常场景：两个模型都在NPU上并行推理
HWTEST(MSLiteTest, OHOS_Parallel_0002, Function | MediumTest | Level0) {
    std::cout << "run start" << std::endl;
    std::thread t1(Predict_NPU);
    std::cout << "1111111111111" << std::endl;
    std::thread t2(Predict_NPU);
    std::cout << "2222222222222" << std::endl;
    t1.join();
    t2.join();
}

// 正常场景：两个模型在CPU NPU上并行推理
HWTEST(MSLiteTest, OHOS_Parallel_0003, Function | MediumTest | Level0) {
    std::cout << "run start" << std::endl;
    std::thread t1(Predict_CPU);
    std::cout << "1111111111111" << std::endl;
    std::thread t2(Predict_NPU);
    std::cout << "2222222222222" << std::endl;
    t1.join();
    t2.join();
}

// 正常场景：r1.3转换的模型在r1.5上推理
HWTEST(MSLiteTest, OHOS_Compatible_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface_r13.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


// 正常场景：离线模型支持NNRT后端，单模型输入
HWTEST(MSLiteTest, OHOS_OfflineModel_0001, Function | MediumTest | Level0) {
    if (!IsNNRTAvailable()) {
        printf("NNRt is not available, skip this test");
        return;
    }

    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface_offline_model.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：离线模型支持NNRT后端,多输入模型
HWTEST(MSLiteTest, OHOS_OfflineModel_0002, Function | MediumTest | Level0) {
    if (!IsNNRTAvailable()) {
        printf("NNRt is not available, skip this test");
        return;
    }

    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_headpose_pb2tflite_offline_model.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_headpose_pb2tflite", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_headpose_pb2tflite", 0.02, 0.02);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


// 正常场景：离线模型支持NNRT后端,Model创建一次,Build一次，Predict多次
HWTEST(MSLiteTest, OHOS_OfflineModel_0004, Function | MediumTest | Level0) {
    if (!IsNNRTAvailable()) {
        printf("NNRt is not available, skip this test");
        return;
    }

    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface_offline_model.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OH_AI_TensorHandleArray outputs;
    for (size_t i = 0; i < 50; ++i) {
        printf("==========Model Predict==========\n");
        OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
        ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    }
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：离线模型支持NNRT后端,Model创建一次，Build多次
HWTEST(MSLiteTest, OHOS_OfflineModel_0005, Function | MediumTest | Level0) {
    if (!IsNNRTAvailable()) {
        printf("NNRt is not available, skip this test");
        return;
    }

    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    int ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface_offline_model.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========Build model==========\n");
    int ret2 = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface_offline_model.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret2);
    ASSERT_EQ(ret2, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：离线模型支持NNRT后端,ModelPredict，input为空
HWTEST(MSLiteTest, OHOS_OfflineModel_0006, Function | MediumTest | Level0) {
    if (!IsNNRTAvailable()) {
        printf("NNRt is not available, skip this test");
        return;
    }

    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface_offline_model.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray inputs;
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    printf("==========Model Predict return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：非离线模型支持NNRT后端,ms模型未转换为NNRT后端模型
HWTEST(MSLiteTest, OHOS_OfflineModel_0007, Function | MediumTest | Level0) {
    if (!IsNNRTAvailable()) {
        printf("NNRt is not available, skip this test");
        return;
    }

    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    AddContextDeviceCPU(context);  // nnrt算子支持有限，加cpu设备走异构推理
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：覆盖模型ml_ocr_cn
HWTEST(MSLiteTest, OHOS_OfflineModel_0008, Function | MediumTest | Level0) {
    if (!IsNNRTAvailable()) {
        printf("NNRt is not available, skip this test");
        return;
    }

    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_ocr_cn_offline_model.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_ocr_cn", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_ocr_cn");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：离线模型覆盖NPU
HWTEST(MSLiteTest, OHOS_OfflineModel_0009, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }

    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/tinynet.om.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = inputs.handle_list[i];
        float *input_data = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(tensor));
        size_t element_num = OH_AI_TensorGetElementNum(tensor);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_real_distribution<float> dis(0.0f,1.0f);
        for (int z=0;z<element_num;z++) {
            input_data[z] = dis(gen);
        }
    }
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：delegate异构，使用低级接口创建nnrt device info，选取第一个NNRT设备
HWTEST(MSLiteTest, OHOS_NNRT_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

//  正常场景：delegate异构，使用高级接口创建nnrt device info，根据类型确定NNRT设备
HWTEST(MSLiteTest, OHOS_NNRT_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRTByType(context);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：delegate异构，使用高级接口创建nnrt device info，根据名称确定NNRT设备
HWTEST(MSLiteTest, OHOS_NNRT_0003, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRTByName(context);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


// 正常场景：delegate异构，设置NNRT扩展选项，包括cache路径
HWTEST(MSLiteTest, OHOS_NNRT_0005, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRTWithCache(context, "/data/local/tmp/", "1");
    AddContextDeviceCPU(context);

    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);

    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);

    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);

    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


// 正常场景：通过OH_AI_ModelGetInputs和OH_AI_ModelGetOutputs获取，实现数据免拷贝
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_copy_free_0001, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

void RunMSLiteModel(OH_AI_ModelHandle model, string model_name, bool is_transpose) {
    const size_t MAX_DIMS = 10;
    int64_t shape[MAX_DIMS];
    size_t shape_num;
    OH_AI_TensorHandleArray in_tensor_array;
    OH_AI_TensorHandleArray out_tensor_array;
    printf("==========OH_AI_TensorSetAllocator in_tensor==========\n");
    OH_AI_TensorHandleArray inputs_handle = OH_AI_ModelGetInputs(model);
    in_tensor_array.handle_num = inputs_handle.handle_num;
    in_tensor_array.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) * in_tensor_array.handle_num);
    for (size_t i = 0; i < inputs_handle.handle_num; i++) {
        auto ori_tensor = inputs_handle.handle_list[i];
        auto shape_ptr = OH_AI_TensorGetShape(ori_tensor, &shape_num);
        for (size_t j = 0; j < shape_num; j++) {
            shape[j] = shape_ptr[j];
        }
        void *in_allocator = OH_AI_TensorGetAllocator(ori_tensor);
        OH_AI_TensorHandle in_tensor = OH_AI_TensorCreate(OH_AI_TensorGetName(ori_tensor), OH_AI_TensorGetDataType(ori_tensor),
                                        shape, shape_num, nullptr, 0);  
        OH_AI_TensorSetAllocator(in_tensor, in_allocator);
        in_tensor_array.handle_list[i] = in_tensor;
    }
    printf("==========FillInputsData==========\n");
    FillInputsData(in_tensor_array, model_name, is_transpose);
    printf("==========OH_AI_TensorSetAllocator out_tensor==========\n");
    OH_AI_TensorHandleArray outputs_handle = OH_AI_ModelGetOutputs(model);
    out_tensor_array.handle_num = outputs_handle.handle_num;
    out_tensor_array.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) * out_tensor_array.handle_num);
    for (size_t i = 0; i < outputs_handle.handle_num; i++) {
        auto ori_tensor = outputs_handle.handle_list[i];
        auto shape_ptr = OH_AI_TensorGetShape(ori_tensor, &shape_num);
        for (size_t j = 0; j < shape_num; j++) {
            shape[j] = shape_ptr[j];
        }
        void *in_allocator = OH_AI_TensorGetAllocator(ori_tensor);
        OH_AI_TensorHandle out_tensor = OH_AI_TensorCreate(OH_AI_TensorGetName(ori_tensor), OH_AI_TensorGetDataType(ori_tensor),
                                        shape, shape_num, nullptr, 0);
        OH_AI_TensorSetAllocator(out_tensor, in_allocator);
        out_tensor_array.handle_list[i] = out_tensor;
    }
    printf("==========OH_AI_ModelPredict==========\n");
    auto ret = OH_AI_ModelPredict(model, in_tensor_array, &out_tensor_array, NULL, NULL);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_TensorDestroy==========\n");
    CompareResult(out_tensor_array, model_name);
    for (size_t i = 0; i < in_tensor_array.handle_num; i++) {
        auto ori_tensor = in_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(in_tensor_array.handle_list);
    for (size_t i = 0; i < out_tensor_array.handle_num; i++) {
        auto ori_tensor = out_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(out_tensor_array.handle_list);
}

void CopyFreeSetAllocator(OH_AI_ModelHandle model, OH_AI_TensorHandleArray *in_tensor_array,
    OH_AI_TensorHandleArray *out_tensor_array)
{
    const size_t maxDims = 10;
    int64_t shape[maxDims];
    size_t shapeNum;
    OH_AI_TensorHandleArray inputs_handle = OH_AI_ModelGetInputs(model);
    in_tensor_array->handle_num = inputs_handle.handle_num;
    in_tensor_array->handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) *
        in_tensor_array->handle_num);
    for (size_t i = 0; i < inputs_handle.handle_num; i++) {
        auto ori_tensor = inputs_handle.handle_list[i];
        auto shape_ptr = OH_AI_TensorGetShape(ori_tensor, &shapeNum);
        for (size_t j = 0; j < shapeNum; j++) {
            shape[j] = shape_ptr[j];
        }
        void *in_allocator = OH_AI_TensorGetAllocator(ori_tensor);
        OH_AI_TensorHandle in_tensor = OH_AI_TensorCreate(OH_AI_TensorGetName(ori_tensor),
            OH_AI_TensorGetDataType(ori_tensor), shape, shapeNum, nullptr, 0);
        OH_AI_TensorSetAllocator(in_tensor, in_allocator);
        in_tensor_array->handle_list[i] = in_tensor;
    }
    printf("==========OH_AI_TensorSetAllocator out_tensor==========\n");
    OH_AI_TensorHandleArray outputs_handle = OH_AI_ModelGetOutputs(model);
    out_tensor_array->handle_num = outputs_handle.handle_num;
    out_tensor_array->handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) *
        out_tensor_array->handle_num);
    for (size_t i = 0; i < outputs_handle.handle_num; i++) {
        auto ori_tensor = outputs_handle.handle_list[i];
        auto shape_ptr = OH_AI_TensorGetShape(ori_tensor, &shapeNum);
        for (size_t j = 0; j < shapeNum; j++) {
            shape[j] = shape_ptr[j];
        }
        void *in_allocator = OH_AI_TensorGetAllocator(ori_tensor);
        OH_AI_TensorHandle out_tensor = OH_AI_TensorCreate(OH_AI_TensorGetName(ori_tensor),
            OH_AI_TensorGetDataType(ori_tensor), shape, shapeNum, nullptr, 0);
        OH_AI_TensorSetAllocator(out_tensor, in_allocator);
        out_tensor_array->handle_list[i] = out_tensor;
    }
}

// 正常场景：CPU免拷贝场景，并循环推理
HWTEST(MSLiteTest, SUB_AI_MindSpore_CPU_copy_free_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);

    OH_AI_TensorHandleArray in_tensor_array;
    OH_AI_TensorHandleArray out_tensor_array;
    printf("==========OH_AI_TensorSetAllocator in_tensor==========\n");
    CopyFreeSetAllocator(model, &in_tensor_array, &out_tensor_array);
    printf("==========FillInputsData==========\n");
    FillInputsData(in_tensor_array, "ml_face_isface", true);
    for (size_t i = 0; i < 50; ++i) {
        printf("==========OH_AI_ModelPredict==========\n");
        auto predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &out_tensor_array, NULL, NULL);
        ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
        CompareResult(out_tensor_array, "ml_face_isface");
    }
    printf("==========OH_AI_TensorDestroy==========\n");
    for (size_t i = 0; i < in_tensor_array.handle_num; i++) {
        auto ori_tensor = in_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(in_tensor_array.handle_list);
    for (size_t i = 0; i < out_tensor_array.handle_num; i++) {
        auto ori_tensor = out_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(out_tensor_array.handle_list);
    printf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

void CopyFreeNoSetAllocator(OH_AI_ModelHandle model, OH_AI_TensorHandleArray *in_tensor_array,
    OH_AI_TensorHandleArray *out_tensor_array)
{
    const size_t maxDims = 10;
    int64_t shape[maxDims];
    size_t shapeNum;
    OH_AI_TensorHandleArray inputs_handle = OH_AI_ModelGetInputs(model);
    in_tensor_array->handle_num = inputs_handle.handle_num;
    in_tensor_array->handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) *
                                                                in_tensor_array->handle_num);
    for (size_t i = 0; i < inputs_handle.handle_num; i++) {
        auto ori_tensor = inputs_handle.handle_list[i];
        auto shape_ptr = OH_AI_TensorGetShape(ori_tensor, &shapeNum);
        for (size_t j = 0; j < shapeNum; j++) {
            shape[j] = shape_ptr[j];
        }
        OH_AI_TensorHandle in_tensor = OH_AI_TensorCreate(OH_AI_TensorGetName(ori_tensor),
            OH_AI_TensorGetDataType(ori_tensor), shape, shapeNum, nullptr, 0);
        in_tensor_array->handle_list[i] = in_tensor;
    }
    printf("==========OH_AI_TensorSetAllocator out_tensor==========\n");
    OH_AI_TensorHandleArray outputs_handle = OH_AI_ModelGetOutputs(model);
    out_tensor_array->handle_num = outputs_handle.handle_num;
    out_tensor_array->handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) *
                                                                out_tensor_array->handle_num);
    for (size_t i = 0; i < outputs_handle.handle_num; i++) {
        auto ori_tensor = outputs_handle.handle_list[i];
        auto shape_ptr = OH_AI_TensorGetShape(ori_tensor, &shapeNum);
        for (size_t j = 0; j < shapeNum; j++) {
            shape[j] = shape_ptr[j];
        }
        OH_AI_TensorHandle out_tensor = OH_AI_TensorCreate(OH_AI_TensorGetName(ori_tensor),
            OH_AI_TensorGetDataType(ori_tensor), shape, shapeNum, nullptr, 0);
        out_tensor_array->handle_list[i] = out_tensor;
    }
}

// 正常场景：CPU免拷贝场景，不调用OH_AI_TensorSetAllocator
HWTEST(MSLiteTest, SUB_AI_MindSpore_CPU_copy_free_0003, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray in_tensor_array;
    OH_AI_TensorHandleArray out_tensor_array;
    printf("==========OH_AI_TensorSetAllocator in_tensor==========\n");
    CopyFreeNoSetAllocator(model, &in_tensor_array, &out_tensor_array);
    printf("==========FillInputsData==========\n");
    FillInputsData(in_tensor_array, "ml_face_isface", true);
    printf("==========OH_AI_ModelPredict==========\n");
    auto predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &out_tensor_array, NULL, NULL);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(out_tensor_array, "ml_face_isface");
    printf("==========OH_AI_TensorDestroy==========\n");
    for (size_t i = 0; i < in_tensor_array.handle_num; i++) {
        auto ori_tensor = in_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(in_tensor_array.handle_list);
    for (size_t i = 0; i < out_tensor_array.handle_num; i++) {
        auto ori_tensor = out_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(out_tensor_array.handle_list);
    printf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：CPU免拷贝场景，不调用OH_AI_TensorSetAllocator，并循环推理
HWTEST(MSLiteTest, SUB_AI_MindSpore_CPU_copy_free_0004, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray in_tensor_array;
    OH_AI_TensorHandleArray out_tensor_array;
    printf("==========OH_AI_TensorSetAllocator in_tensor==========\n");
    CopyFreeNoSetAllocator(model, &in_tensor_array, &out_tensor_array);
    printf("==========FillInputsData==========\n");
    FillInputsData(in_tensor_array, "ml_face_isface", true);
    for (size_t i = 0; i < 50; ++i) {
        printf("==========OH_AI_ModelPredict==========\n");
        auto predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &out_tensor_array, NULL, NULL);
        ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
        CompareResult(out_tensor_array, "ml_face_isface");
    }
    printf("==========OH_AI_TensorDestroy==========\n");
    for (size_t i = 0; i < in_tensor_array.handle_num; i++) {
        auto ori_tensor = in_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(in_tensor_array.handle_list);
    for (size_t i = 0; i < out_tensor_array.handle_num; i++) {
        auto ori_tensor = out_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(out_tensor_array.handle_list);
    printf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：通过OH_AI_TensorCreate创建输入输出tensor，实现数据免拷贝
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_copy_free_0002, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    RunMSLiteModel(model, "ml_face_isface", true);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：OH_AI_TensorSetAllocator设置空指针
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_copy_free_0003, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    const size_t MAX_DIMS = 10;
    int64_t shape[MAX_DIMS];
    size_t shapeNum;
    OH_AI_TensorHandleArray in_tensor_array;
    OH_AI_TensorHandleArray inputs_handle = OH_AI_ModelGetInputs(model);
    in_tensor_array.handle_num = inputs_handle.handle_num;
    in_tensor_array.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) * in_tensor_array.handle_num);
    for (size_t i = 0; i < inputs_handle.handle_num; i++) {
        auto ori_tensor = inputs_handle.handle_list[i];
        auto shape_ptr = OH_AI_TensorGetShape(ori_tensor, &shapeNum);
        for (size_t j = 0; j < shapeNum; j++) {
            shape[j] = shape_ptr[j];
        }
        OH_AI_TensorHandle in_tensor = OH_AI_TensorCreate(OH_AI_TensorGetName(ori_tensor),
                                        OH_AI_TensorGetDataType(ori_tensor), shape, shapeNum, nullptr, 0);
        OH_AI_Status ret = OH_AI_TensorSetAllocator(in_tensor, nullptr);
        ASSERT_NE(ret, OH_AI_STATUS_SUCCESS);
        in_tensor_array.handle_list[i] = in_tensor;
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：通过OH_AI_TensorCreate创建输入输出tensor，实现数据免拷贝, CPU后端场景
HWTEST(MSLiteTest, SUB_AI_MindSpore_CPU_copy_free_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    RunMSLiteModel(model, "ml_face_isface", true);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


// 正常场景：npu循环推理
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_copy_free_0004, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    for (size_t i = 0; i < 50; ++i) {
        printf("==========Model Predict==========\n");
        OH_AI_TensorHandleArray outputs;
        ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
        ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
        CompareResult(outputs, "ml_face_isface");
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：npu免拷贝场景循环推理
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_copy_free_0005, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray in_tensor_array;
    OH_AI_TensorHandleArray out_tensor_array;
    printf("==========OH_AI_TensorSetAllocator in_tensor==========\n");
    CopyFreeSetAllocator(model, &in_tensor_array, &out_tensor_array);
    printf("==========FillInputsData==========\n");
    FillInputsData(in_tensor_array, "ml_face_isface", true);
    for (size_t i = 0; i < 50; ++i) {
        printf("==========OH_AI_ModelPredict==========\n");
        auto ret = OH_AI_ModelPredict(model, in_tensor_array, &out_tensor_array, NULL, NULL);
        ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
        CompareResult(out_tensor_array, "ml_face_isface");
    }
    printf("==========OH_AI_TensorDestroy==========\n");
    for (size_t i = 0; i < in_tensor_array.handle_num; i++) {
        auto ori_tensor = in_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(in_tensor_array.handle_list);
    for (size_t i = 0; i < out_tensor_array.handle_num; i++) {
        auto ori_tensor = out_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(out_tensor_array.handle_list);
    printf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：npu免拷贝场景，不调用OH_AI_TensorSetAllocator
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_copy_free_0006, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray in_tensor_array;
    OH_AI_TensorHandleArray out_tensor_array;
    printf("==========OH_AI_TensorSetAllocator in_tensor==========\n");
    CopyFreeNoSetAllocator(model, &in_tensor_array, &out_tensor_array);
    printf("==========FillInputsData==========\n");
    FillInputsData(in_tensor_array, "ml_face_isface", true);
    printf("==========OH_AI_ModelPredict==========\n");
    auto predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &out_tensor_array, NULL, NULL);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(out_tensor_array, "ml_face_isface");
    printf("==========OH_AI_TensorDestroy==========\n");
    for (size_t i = 0; i < in_tensor_array.handle_num; i++) {
        auto ori_tensor = in_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(in_tensor_array.handle_list);
    for (size_t i = 0; i < out_tensor_array.handle_num; i++) {
        auto ori_tensor = out_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(out_tensor_array.handle_list);
    printf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：npu免拷贝场景，不调用OH_AI_TensorSetAllocator，并循环推理
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_copy_free_0007, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    printf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);

    OH_AI_TensorHandleArray in_tensor_array;
    OH_AI_TensorHandleArray out_tensor_array;
    printf("==========OH_AI_TensorSetAllocator in_tensor==========\n");
    CopyFreeNoSetAllocator(model, &in_tensor_array, &out_tensor_array);
    printf("==========FillInputsData==========\n");
    FillInputsData(in_tensor_array, "ml_face_isface", true);
    for (size_t i = 0; i < 50; ++i) {
        printf("==========OH_AI_ModelPredict==========\n");
        auto predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &out_tensor_array, NULL, NULL);
        ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
        CompareResult(out_tensor_array, "ml_face_isface");
    }
    printf("==========OH_AI_TensorDestroy==========\n");
    for (size_t i = 0; i < in_tensor_array.handle_num; i++) {
        auto ori_tensor = in_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(in_tensor_array.handle_list);
    for (size_t i = 0; i < out_tensor_array.handle_num; i++) {
        auto ori_tensor = out_tensor_array.handle_list[i];
        OH_AI_TensorDestroy(&ori_tensor);
    }
    free(out_tensor_array.handle_list);
    printf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：NPU权重量化模型
HWTEST(MSLiteTest, OHOS_NNRT_QUANT_0001, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface_quant", {}, false, true, false);
}


// add nnrt hiai device info
void AddContextDeviceHIAI(OH_AI_ContextHandle context) {
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// 异常场景：HIAI流程，离线模型支持NNRT后端,Model创建一次，Build多次
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0004, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceHIAI(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========Build model==========\n");
    OH_AI_Status ret2 = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret2, OH_AI_STATUS_LITE_MODEL_REBUILD);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：HIAI流程，离线模型支持NNRT后端,ModelPredict，input为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0005, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceHIAI(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray inputs;
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：HIAI流程，非离线模型支持NNRT后端,ms模型未转换为NNRT后端模型
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0006, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceHIAI(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：HIAI流程，离线模型配置量化参数
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0007, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model_param", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantConfigData", quant_config, q_size);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "test_model", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：HIAI流程，设置量化配置QuantConfigData为空指针时等于不量化
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0008, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantConfigData", nullptr, 0);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "test_model", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：HIAI流程，设置量化配置QuantConfigData为错误配置文件
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0009, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model.om.ms", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantConfigData", quant_config, q_size);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：HIAI流程，设置量化q_size为异常值
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0010, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model_param", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantConfigData", quant_config, 0);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：HIAI流程，设置 NPU 和外围输入/输出(I/O)设备的带宽模式BandMode模式为HIAI_BANDMODE_NORMAL
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0011, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_NORMAL";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model_param", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantConfigData", quant_config, q_size);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "test_model", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：HIAI流程，设置 NPU 和外围输入/输出(I/O)设备的带宽模式BandMode模式为HIAI_BANDMODE_LOW
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0012, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_LOW";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model_param", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantConfigData", quant_config, q_size);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "test_model", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：HIAI流程，设置 NPU 和外围输入/输出(I/O)设备的带宽模式BandMode模式为HIAI_BANDMODE_UNSET
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0013, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_UNSET";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model_param", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantConfigData", quant_config, q_size);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "test_model", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：HIAI流程，设置 NPU 和外围输入/输出(I/O)设备的带宽模式BandMode模式为HIAI_BANDMODE_HIGH
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0014, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model_param", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantConfigData", quant_config, q_size);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "test_model", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：HIAI流程，离线模型配置量化参数QuantBuffer
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0015, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model_param", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantBuffer", quant_config, q_size);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "test_model", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：HIAI流程，设置量化配置QuantBuffer为空指针时等于不量化
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0016, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantBuffer", nullptr, 0);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "test_model", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：HIAI流程，设置量化配置QuantBuffer为错误配置文件
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0017, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model.om.ms", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantBuffer", quant_config, q_size);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：HIAI流程，设置量化QuantBufferq_size为异常值
HWTEST(MSLiteTest, SUB_AI_MindSpore_HIAI_OfflineModel_0018, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status deviceRet = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(deviceRet, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc *desc_1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc_1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id_1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_1);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_1);
    const char *band_mode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "BandMode", band_mode, strlen(band_mode));
    size_t q_size;
    char *quant_config = ReadFile("/data/test/test_model_param", &q_size);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "QuantBuffer", quant_config, 0);

    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/test_model.om.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

void PrintMem(const std::string &position) {
    std::string procFile = "/proc/" + std::to_string(getpid()) + "/status";
    std::ifstream infile(procFile);
    if (infile.good()) {
        std::string line;
        while (std::getline(infile, line)) {
            if (line.find("VmRSS") != std::string::npos) {
                std::cout << position << " mem size: " << line << std::endl;
            }
        }
        infile.close();
    }
}


// 正常场景：context配置cache信息，执行推理流程
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_Cache_0001, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    const char *cache_path = "/data/local/tmp";
    const char *cache_version = "1";
    const char *model_name = "cache_model";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cache_path, strlen(cache_path));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CacheVersion", cache_version, strlen(cache_version));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "ModelName", model_name, strlen(model_name));
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========OH_AI_ModelCreate==========\n");
    PrintMem("before build");
    uint64_t timeStartPrepare = getTimeInUs();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    uint64_t timeEndPrepare = getTimeInUs();
    float init_session_time_once = (timeEndPrepare - timeStartPrepare) / 1000.0;
    std::cout << "init_session_time_once: " << init_session_time_once << std::endl;
    PrintMem("after build");
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：context配置cache信息，量化模型执行推理流程
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_Cache_0002, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    const char *cache_path = "/data/local/tmp";
    const char *cache_version = "1";
    const char *model_name = "cache_model_quant";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cache_path, strlen(cache_path));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CacheVersion", cache_version, strlen(cache_version));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "ModelName", model_name, strlen(model_name));
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface_quant.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface_quant", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface_quant", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

void AddContextCacheDiffPath(OH_AI_ContextHandle context, const char *modelName)
{
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    const char *cachePath = "/data/local/tmp";
    const char *cacheVersion = "1";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cachePath, strlen(cachePath));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CacheVersion", cacheVersion, strlen(cacheVersion));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "ModelName", modelName, strlen(modelName));
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// 正常场景：多个不同模型在同一路径下缓存，执行推理流程
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_Cache_0003, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextCacheDiffPath(context, "cache_a");
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_ocr_cn.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    AddContextCacheDiffPath(context2, "cache_b");
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_Status ret2 = OH_AI_ModelBuildFromFile(model2, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(ret2, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_ocr_cn", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_ocr_cn", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    printf("==========GetInputs2==========\n");
    OH_AI_TensorHandleArray inputs2 = OH_AI_ModelGetInputs(model2);
    ASSERT_NE(inputs2.handle_list, nullptr);
    FillInputsData(inputs2, "ml_face_isface", true);
    printf("==========Model Predict2==========\n");
    OH_AI_TensorHandleArray outputs2;
    OH_AI_Status predict_ret2 = OH_AI_ModelPredict(model2, inputs2, &outputs2, nullptr, nullptr);
    ASSERT_EQ(predict_ret2, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs2, "ml_face_isface", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model2);
}

// 异常场景：CachePath路径非法值或不存在
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_Cache_0004, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    const char *cache_path = "/data/local/tmp/notexist/";
    const char *cache_version = "1";
    const char *model_name = "cache_error";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cache_path, strlen(cache_path));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CacheVersion", cache_version, strlen(cache_version));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "ModelName", model_name, strlen(model_name));
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：CacheVersion在取值范围外
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_Cache_0005, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    const char *cache_path = "/data/local/tmp";
    const char *cache_version = "-1";
    const char *model_name = "cache_error";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cache_path, strlen(cache_path));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CacheVersion", cache_version, strlen(cache_version));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "ModelName", model_name, strlen(model_name));
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// add cpu device info
void AddContextCache(OH_AI_ContextHandle context)
{
    auto nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    const char *cachePath = "/data/local/tmp";
    const char *cacheVersion = "1";
    const char *modelName = "cache_same";
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cachePath, strlen(cachePath));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CacheVersion", cacheVersion, strlen(cacheVersion));
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "ModelName", modelName, strlen(modelName));
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
}

// 异常场景：a模型生成缓存，b模型用相同的CachePath、CacheVersion、modelname
HWTEST(MSLiteTest, SUB_AI_MindSpore_NNRT_Cache_0006, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    char nnrtDevice[128];
    OH_AI_Status device_ret = OH_AI_Test_GetDeviceID(nnrtDevice, sizeof(nnrtDevice));
    printf("nnrtDevice name: %s. \n", nnrtDevice);
    ASSERT_EQ(device_ret, OH_AI_STATUS_SUCCESS);
    if (strcmp(nnrtDevice, "K5010") == 0) {
        printf("nnrtDevice is K5010, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextCache(context);
    printf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    AddContextCache(context2);
    printf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_Status ret2 = OH_AI_ModelBuildFromFile(model2, "/data/test/ml_ocr_cn.ms", OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(ret2, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface", 0.01, 0.01, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    printf("==========GetInputs2==========\n");
    OH_AI_TensorHandleArray inputs2 = OH_AI_ModelGetInputs(model2);
    ASSERT_NE(inputs2.handle_list, nullptr);
    FillInputsData(inputs2, "ml_ocr_cn", true);
    printf("==========Model Predict2==========\n");
    OH_AI_TensorHandleArray outputs2;
    OH_AI_Status predict_ret2 = OH_AI_ModelPredict(model2, inputs2, &outputs2, nullptr, nullptr);
    ASSERT_EQ(predict_ret2, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model2);
}

// 正常场景：多输入模型，测试ContextDestroy接口，Context在model释放之前释放
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextDestroy_0001, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_headpose_pb2tflite.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_headpose_pb2tflite", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_headpose_pb2tflite", 0.02, 0.02);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：多输入模型，测试ContextDestroy接口，Context在model释放之后释放
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextDestroy_0002, Function | MediumTest | Level0) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_headpose_pb2tflite.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_headpose_pb2tflite", false);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_headpose_pb2tflite", 0.02, 0.02);
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
}

// OH_AI_TensorCreate接口，name为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate(nullptr, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
        createShape, createShapeNum, nullptr, 0);
    ASSERT_EQ(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorCreate接口，type为异常类型
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0002, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DataTypeInvalid,
        createShape, createShapeNum, nullptr, 0);
    ASSERT_EQ(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorCreate接口，tensor维度数组长度为33，超过最大值32
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0003, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 33;
    int64_t createShape[createShapeNum] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        createShapeNum, nullptr, 0);
    ASSERT_EQ(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorCreate接口，tensor维度数组长度为32，shapeNum为3
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0004, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 32;
    int64_t createShape[createShapeNum] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, 3,
        nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
}

// 正常调用接口创建Tensor，并传入input进行推理
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0005, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    OH_AI_TensorHandleArray in_tensor_array;
    in_tensor_array.handle_num = 1;
    in_tensor_array.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) * 1);
    in_tensor_array.handle_list[0] = tensor;
    FillInputsData(in_tensor_array, "ml_face_isface", true);
    printf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常调用接口创建Tensor，用不同的OH_AI_DataType，并传入input进行推理
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0006, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/aiy_vision_classifier_plants_V1_3.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    constexpr size_t create_shape_num = 4;
    int64_t createShape[create_shape_num] = {1, 224, 224, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_UINT8, createShape,
        create_shape_num, nullptr, 0);
    OH_AI_TensorHandleArray in_tensor_array;
    in_tensor_array.handle_num = 1;
    in_tensor_array.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) * 1);
    in_tensor_array.handle_list[0] = tensor;
    FillInputsData(in_tensor_array, "aiy_vision_classifier_plants_V1_3", false);
    printf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t element_num = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), element_num);
        uint8_t *output_data = reinterpret_cast<uint8_t *>(OH_AI_TensorGetMutableData(tensor));
        printf("output data is:");
        for (int j = 0; j < element_num && j <= 20; ++j) {
            printf("%d ", output_data[j]);
        }
        printf("\n");
        printf("==========compFp32WithTData==========\n");
        string expectedDataFile = "/data/test/aiy_vision_classifier_plants_V1_3" + std::to_string(i) + ".output";
        bool result = compUint8WithTData(output_data, expectedDataFile, 0.01, 0.01, false);
        ASSERT_EQ(result, true);
    }
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_TensorCreate接口，OH_AI_DataType类型、shape数组长度，遍历设置
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0007, Function | MediumTest | Level0) {
constexpr size_t datatypeNum = 12;
OH_AI_DataType datatype[datatypeNum] = {
    OH_AI_DATATYPE_NUMBERTYPE_BOOL,
    OH_AI_DATATYPE_NUMBERTYPE_INT8,
    OH_AI_DATATYPE_NUMBERTYPE_INT16,
    OH_AI_DATATYPE_NUMBERTYPE_INT32,
    OH_AI_DATATYPE_NUMBERTYPE_INT64,
    OH_AI_DATATYPE_NUMBERTYPE_UINT8,
    OH_AI_DATATYPE_NUMBERTYPE_UINT16,
    OH_AI_DATATYPE_NUMBERTYPE_UINT32,
    OH_AI_DATATYPE_NUMBERTYPE_UINT64,
    OH_AI_DATATYPE_NUMBERTYPE_FLOAT16,
    OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
    OH_AI_DATATYPE_NUMBERTYPE_FLOAT64
};
constexpr size_t createShapeNum = 4;
int64_t createShape[createShapeNum] = {1, 48, 48, 3};
for (size_t i = 0; i < datatypeNum; ++i) {
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype[i], createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
}
}

void CreateAndSetTensor(OH_AI_ModelHandle model, OH_AI_ContextHandle context,
    OH_AI_TensorHandleArray *in_tensor_array, bool isFirst)
{
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_TensorHandle tensor;
    if (isFirst) {
        OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
            OH_AI_MODELTYPE_MINDIR, context);
        ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
        printf("==========OH_AI_ModelGetInputs==========\n");
        OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
        ASSERT_NE(inputs.handle_list, nullptr);
        OH_AI_TensorSetFormat(inputs.handle_list[0], OH_AI_FORMAT_NHWC);
        constexpr size_t createShapeNum = 4;
        int64_t createShape[createShapeNum] = {1, 48, 48, 3};
        tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32,
            createShape, createShapeNum, nullptr, 0);
    } else {
        OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/aiy_vision_classifier_plants_V1_3.ms",
            OH_AI_MODELTYPE_MINDIR, context);
        ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
        printf("==========OH_AI_ModelGetInputs==========\n");
        OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
        ASSERT_NE(inputs.handle_list, nullptr);
        constexpr size_t createShapeNum = 4;
        int64_t createShape[createShapeNum] = {1, 224, 224, 3};
        tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_UINT8, createShape,
            createShapeNum, nullptr, 0);
    }
    
    in_tensor_array->handle_num = 1;
    in_tensor_array->handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) * 1);
    in_tensor_array->handle_list[0] = tensor;
}

// 正常调用接口创建多个Tensor，并传入input进行推理
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0008, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TensorHandleArray in_tensor_array;
    CreateAndSetTensor(model, context, &in_tensor_array, true);
    FillInputsData(in_tensor_array, "ml_face_isface", true);
    printf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);

    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_TensorHandleArray in_tensor_array2;
    CreateAndSetTensor(model2, context2, &in_tensor_array2, false);
    FillInputsData(in_tensor_array2, "aiy_vision_classifier_plants_V1_3", false);
    printf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs2;
    OH_AI_Status predict_ret2 = OH_AI_ModelPredict(model2, in_tensor_array2, &outputs2, nullptr, nullptr);
    ASSERT_EQ(predict_ret2, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    for (size_t i = 0; i < outputs2.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs2.handle_list[i];
        int64_t element_num = OH_AI_TensorGetElementNum(tensor);
        printf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), element_num);
        uint8_t *output_data = reinterpret_cast<uint8_t *>(OH_AI_TensorGetMutableData(tensor));
        printf("output data is:");
        for (int j = 0; j < element_num && j <= 20; ++j) {
            printf("%d ", output_data[j]);
        }
        printf("\n");
        printf("==========compFp32WithTData==========\n");
        string expectedDataFile = "/data/test/aiy_vision_classifier_plants_V1_3" + std::to_string(i) + ".output";
        bool result = compUint8WithTData(output_data, expectedDataFile, 0.01, 0.01, false);
        ASSERT_EQ(result, true);
    }
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model2);
}

// OH_AI_TensorDestroy接口，传入的tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0009, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorDestroy(nullptr);
}

// OH_AI_TensorDestroy接口，多次释放已创建的tensor
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0010, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorClone接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0011, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorHandle clone = OH_AI_TensorClone(nullptr);
    ASSERT_EQ(clone, nullptr);
}

// OH_AI_TensorClone 接口（深拷贝tensor），拷贝完释放原始tensor
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0012, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone), "data_duplicate"), 0);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&clone);
}

// OH_AI_TensorClone，克隆出多个tensor
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0013, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/test/ml_face_isface.input";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    ASSERT_NE(imageBuf, nullptr);
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                                           create_shape_num, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone), "data_duplicate"), 0);
    OH_AI_TensorHandle clone2 = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone2, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone2), "data_duplicate"), 0);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&clone);
    OH_AI_TensorDestroy(&clone2);
}

// 正常设置name
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0014, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "new_data");
    const char *tensorName = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName, "new_data"), 0);
    OH_AI_TensorDestroy(&tensor);
}

// 多次设置name
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0015, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "new_data");
    const char *tensorName = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName, "new_data"), 0);
    OH_AI_TensorSetName(tensor, "new_data2");
    const char *tensorName2 = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName2, "new_data2"), 0);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetName接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0016, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorSetName(nullptr, "data");
}

// OH_AI_TensorSetName接口，name为空字符、含有非法字符
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0017, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "");
    printf("Tensor name: %s. \n", OH_AI_TensorGetName(tensor));
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorGetName接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0018, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    const char *tensorName = OH_AI_TensorGetName(nullptr);
    ASSERT_EQ(tensorName, nullptr);
}

// OH_AI_TensorSetDataType接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0019, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorSetDataType(nullptr, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32);
}

// OH_AI_TensorSetDataType接口，OH_AI_DataType设置无效值、非法值
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0020, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetDataType(tensor, OH_AI_DataTypeInvalid);
    OH_AI_TensorDestroy(&tensor);
}

// 正常设置datatype
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0021, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    ASSERT_EQ(OH_AI_TensorGetDataType(tensor), OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    OH_AI_TensorDestroy(&tensor);
}

// 多次设置datatype
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0022, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    ASSERT_EQ(OH_AI_TensorGetDataType(tensor), OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_UINT8);
    ASSERT_EQ(OH_AI_TensorGetDataType(tensor), OH_AI_DATATYPE_NUMBERTYPE_UINT8);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorGetDataType接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0023, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetDataType(nullptr);
}

// OH_AI_TensorSetShape接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0024, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorSetShape(nullptr, create_shape, create_shape_num);
}

// OH_AI_TensorSetShape接口，shape数组长度为33
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0025, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetShape(tensor, create_shape, 33);
    OH_AI_TensorDestroy(&tensor);
}

// 正常设置shape
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0026, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    constexpr size_t new_shape_num = 4;
    int64_t new_shape[new_shape_num] = {1, 32, 32, 1};
    OH_AI_TensorSetShape(tensor, new_shape, new_shape_num);
    size_t new_ret_shape_num;
    const int64_t *new_ret_shape = OH_AI_TensorGetShape(tensor, &new_ret_shape_num);
    ASSERT_EQ(new_ret_shape_num, new_shape_num);
    for (size_t i = 0; i < new_ret_shape_num; i++) {
        ASSERT_EQ(new_ret_shape[i], new_shape[i]);
    }
    OH_AI_TensorDestroy(&tensor);
}

// 多次设置shape
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0027, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    constexpr size_t new_shape_num = 4;
    int64_t new_shape[new_shape_num] = {1, 32, 32, 1};
    OH_AI_TensorSetShape(tensor, new_shape, new_shape_num);
    size_t new_ret_shape_num;
    const int64_t *new_ret_shape = OH_AI_TensorGetShape(tensor, &new_ret_shape_num);
    ASSERT_EQ(new_ret_shape_num, new_shape_num);
    for (size_t i = 0; i < new_ret_shape_num; i++) {
        ASSERT_EQ(new_ret_shape[i], new_shape[i]);
    }
    constexpr size_t newShapeNum2 = 4;
    int64_t newShape2[newShapeNum2] = {1, 16, 16, 1};
    OH_AI_TensorSetShape(tensor, newShape2, newShapeNum2);
    size_t newRetShapeNum2;
    const int64_t *newRetShape2 = OH_AI_TensorGetShape(tensor, &newRetShapeNum2);
    ASSERT_EQ(newRetShapeNum2, newShapeNum2);
    for (size_t i = 0; i < newRetShapeNum2; i++) {
        ASSERT_EQ(newRetShape2[i], newShape2[i]);
    }
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorGetShape接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0028, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    size_t shape_num;
    OH_AI_TensorGetShape(nullptr, &shape_num);
}

// OH_AI_TensorSetFormat接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0029, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorSetFormat(nullptr, OH_AI_FORMAT_NCHW);
}

// 正常设置format
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0030, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NCHW);
    ASSERT_EQ(OH_AI_TensorGetFormat(tensor), OH_AI_FORMAT_NCHW);
    OH_AI_TensorDestroy(&tensor);
}

// 多次设置format
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0031, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NCHW);
    ASSERT_EQ(OH_AI_TensorGetFormat(tensor), OH_AI_FORMAT_NCHW);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NHWC);
    ASSERT_EQ(OH_AI_TensorGetFormat(tensor), OH_AI_FORMAT_NHWC);
    OH_AI_TensorDestroy(&tensor);
}

// 循环设置所有的format类型
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0032, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
        create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    constexpr size_t formatNum = 18;
    OH_AI_Format format[formatNum] = {
        OH_AI_FORMAT_NCHW,
        OH_AI_FORMAT_NHWC,
        OH_AI_FORMAT_NHWC4,
        OH_AI_FORMAT_HWKC,
        OH_AI_FORMAT_HWCK,
        OH_AI_FORMAT_KCHW,
        OH_AI_FORMAT_CKHW,
        OH_AI_FORMAT_KHWC,
        OH_AI_FORMAT_CHWK,
        OH_AI_FORMAT_HW,
        OH_AI_FORMAT_HW4,
        OH_AI_FORMAT_NC,
        OH_AI_FORMAT_NC4,
        OH_AI_FORMAT_NC4HW4,
        OH_AI_FORMAT_NCDHW,
        OH_AI_FORMAT_NWC,
        OH_AI_FORMAT_NCW
    };
    for (size_t i = 0; i < formatNum; ++i) {
        OH_AI_TensorSetFormat(tensor, format[i]);
        ASSERT_EQ(OH_AI_TensorGetFormat(tensor), format[i]);
    }
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorGetFormat接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0033, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetFormat(nullptr);
}

// OH_AI_TensorSetData接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0034, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorSetData(nullptr, data);
}

// OH_AI_TensorSetData接口，data为空指针nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0035, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetData(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetData接口，正常设置data
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0036, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
    ASSERT_NE(tensor, nullptr);
    float data2[data_len] = {12, 22, 32, 42, 52, 62};
    OH_AI_TensorSetData(tensor, data2);
    const float *ret_data = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(ret_data, nullptr);
    printf("return data is:");
    for (size_t i = 0; i < data_len; i++) {
        ASSERT_EQ(ret_data[i], data2[i]);
        printf("%f ", ret_data[i]);
    }
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetData接口，多次设置data
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0037, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
    ASSERT_NE(tensor, nullptr);
    float data2[data_len] = {12, 22, 32, 42, 52, 62};
    float data3[data_len] = {13, 23, 33, 43, 53, 63};
    OH_AI_TensorSetData(tensor, data2);
    OH_AI_TensorSetData(tensor, data3);
    const float *ret_data = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(ret_data, nullptr);
    printf("return data is:");
    for (size_t i = 0; i < data_len; i++) {
        ASSERT_EQ(ret_data[i], data3[i]);
        printf("%f ", ret_data[i]);
    }
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorGetData接口。tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0038, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetData(nullptr);
}

// OH_AI_TensorGetMutableData接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0039, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetMutableData(nullptr);
}

// OH_AI_TensorGetElementNum接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0040, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    int64_t element = OH_AI_TensorGetElementNum(nullptr);
    std::cout << element << std::endl;
}

// OH_AI_TensorGetDataSize接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0041, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    size_t datasize = OH_AI_TensorGetDataSize(nullptr);
    std::cout << datasize << std::endl;
}

// OH_AI_TensorGetDataSize接口，未填入数据
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0042, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, create_shape,
                            create_shape_num, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    size_t datasize = OH_AI_TensorGetDataSize(tensor);
    std::cout << datasize << std::endl;
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetUserData接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0043, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorSetUserData(nullptr, data, 6 * 4);
}

// OH_AI_TensorSetUserData接口，data为空指针nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0044, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetUserData(tensor, nullptr, 0);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetUserData接口，正常设置data
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0045, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
    ASSERT_NE(tensor, nullptr);
    float data2[data_len] = {12, 22, 32, 42, 52, 62};
    OH_AI_TensorSetUserData(tensor, data2, 6*4);
    const float *ret_data = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(ret_data, nullptr);
    printf("return data is:");
    for (size_t i = 0; i < data_len; i++) {
        ASSERT_EQ(ret_data[i], data2[i]);
        printf("%f ", ret_data[i]);
    }
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetUserData接口，多次设置data
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0046, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
    ASSERT_NE(tensor, nullptr);
    float data2[data_len] = {12, 22, 32, 42, 52, 62};
    float data3[data_len] = {13, 23, 33, 43, 53, 63};
    OH_AI_TensorSetUserData(tensor, data2, 6*4);
    OH_AI_TensorSetUserData(tensor, data3, 6*4);
    const float *ret_data = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(ret_data, nullptr);
    printf("return data is:");
    for (size_t i = 0; i < data_len; i++) {
        ASSERT_EQ(ret_data[i], data3[i]);
        printf("%f ", ret_data[i]);
    }
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetAllocator接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0047, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
    ASSERT_NE(tensor, nullptr);
    void *inAllocator = OH_AI_TensorGetAllocator(tensor);
    OH_AI_TensorSetAllocator(nullptr, inAllocator);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetAllocator接口，正常设置allocator
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0048, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
    ASSERT_NE(tensor, nullptr);
    void *inAllocator = OH_AI_TensorGetAllocator(tensor);
    OH_AI_TensorSetAllocator(tensor, inAllocator);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetAllocator接口，多次设置allocator
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0049, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    constexpr size_t data_len = 6;
    float data[data_len] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
        create_shape_num, data, 6*4);
    ASSERT_NE(tensor, nullptr);
    void *inAllocator = OH_AI_TensorGetAllocator(tensor);
    OH_AI_TensorSetAllocator(tensor, inAllocator);
    OH_AI_TensorSetAllocator(tensor, inAllocator);
    OH_AI_TensorDestroy(&tensor);
}

// OH_AI_TensorSetAllocator接口，tensor为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_TensorCreate_0050, Function | MediumTest | Level0) {
    printf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetAllocator(nullptr);
}

// 创建多个context
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpu_device_info2);
    OH_AI_ContextHandle context3 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info3 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context3, cpu_device_info3);
    OH_AI_ContextHandle context4 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info4 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context4, cpu_device_info4);
    OH_AI_ContextHandle context5 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info5 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context5, cpu_device_info5);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ContextDestroy(&context3);
    OH_AI_ContextDestroy(&context3);
    OH_AI_ContextDestroy(&context4);
    OH_AI_ContextDestroy(&context4);
    OH_AI_ContextDestroy(&context5);
    OH_AI_ContextDestroy(&context5);
}

// OH_AI_ContextDestroy接口context对象为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0002, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextDestroy(nullptr);
}

// OH_AI_ContextSetThreadNum接口，context设置为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0003, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextSetThreadNum(nullptr, 2);
}

// OH_AI_ContextSetThreadNum接口，threadNum设置为-100
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0004, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadNum(context, -100);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    std::cout << threadNum << std::endl;
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
}

// OH_AI_ContextSetThreadNum接口，重复设置线程数，均可设置成功
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0005, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadNum(context, 2);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    ASSERT_EQ(threadNum, 2);
    OH_AI_ContextSetThreadNum(context, 10);
    threadNum = OH_AI_ContextGetThreadNum(context);
    ASSERT_EQ(threadNum, 10);
    OH_AI_ContextDestroy(&context);
}

// OH_AI_ContextSetThreadNum接口，设置的context已被销毁，然后传入ThreadNum接口
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0006, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextSetThreadNum(context, 2);
}

// OH_AI_ContextGetThreadNum接口，context设置为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0007, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    int32_t threadNum = OH_AI_ContextGetThreadNum(nullptr);
    std::cout << threadNum << std::endl;
}

// OH_AI_ContextSetThreadAffinityMode接口，context设置为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0008, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextSetThreadAffinityMode(nullptr, 1);
}

// OH_AI_ContextSetThreadAffinityMode接口，mode设置为3
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0009, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadAffinityMode(context, -100);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    std::cout << threadAffinityMode << std::endl;
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    std::cout << threadAffinityMode << std::endl;
    printf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
}

// OH_AI_ContextSetThreadAffinityMode接口，重复设置各种绑核模式，均可设置成功
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0010, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadAffinityMode(context, 2);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    ASSERT_EQ(threadAffinityMode, 2);
    OH_AI_ContextSetThreadAffinityMode(context, 1);
    threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    ASSERT_EQ(threadAffinityMode, 1);
    OH_AI_ContextDestroy(&context);
}

// OH_AI_ContextGetThreadAffinityMode 接口，context设置为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0011, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(nullptr);
    std::cout << threadAffinityMode << std::endl;
}

// OH_AI_ContextSetThreadAffinityCoreList接口，context设置为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0012, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    constexpr size_t core_num = 4;
    int32_t coreList[core_num] = {0, 1, 2, 3};
    OH_AI_ContextSetThreadAffinityCoreList(nullptr, coreList, core_num);
}

// OH_AI_ContextSetThreadAffinityCoreList接口，core_num非法（0）、与coreList个数不一致（大于、小于）
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0013, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    constexpr size_t core_num = 4;
    int32_t coreList[core_num] = {0, 1, 2, 3};
    OH_AI_ContextSetThreadAffinityCoreList(context, coreList, 0);
    OH_AI_ContextDestroy(&context);
}

// OH_AI_ContextSetThreadAffinityCoreList接口，coreList设置中存在非法编号（负数、极大值）
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0014, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    constexpr size_t core_num = 4;
    int32_t coreList[core_num] = {0, 1, 2, -3};
    OH_AI_ContextSetThreadAffinityCoreList(context, coreList, 4);
    size_t ret_core_num;
    int32_t *retCoreList = nullptr;
    retCoreList = const_cast<int32_t *>(OH_AI_ContextGetThreadAffinityCoreList(context, &ret_core_num));
    ASSERT_EQ(ret_core_num, core_num);
    for (size_t i = 0; i < ret_core_num; i++) {
        printf("==========retCoreList:%d\n", retCoreList[i]);
        ASSERT_EQ(retCoreList[i], coreList[i]);
    }
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
}

// OH_AI_ContextSetThreadAffinityCoreList接口，每次设置不同的core_list，均可设置成功
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0015, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    constexpr size_t core_num = 4;
    int32_t core_list[core_num] = {0, 1, 2, 3};
    OH_AI_ContextSetThreadAffinityCoreList(context, core_list, 4);
    constexpr size_t coreNum2 = 4;
    int32_t coreList2[coreNum2] = {4, 5, 6, 7};
    OH_AI_ContextSetThreadAffinityCoreList(context, coreList2, 4);
    size_t ret_core_num;
    int32_t *retCoreList = nullptr;
    retCoreList = const_cast<int32_t *>(OH_AI_ContextGetThreadAffinityCoreList(context, &ret_core_num));
    ASSERT_EQ(ret_core_num, coreNum2);
    for (size_t i = 0; i < ret_core_num; i++) {
        printf("==========retCoreList:%d\n", retCoreList[i]);
        ASSERT_EQ(retCoreList[i], coreList2[i]);
    }
    free(retCoreList);
    OH_AI_ContextDestroy(&context);
}

// OH_AI_ContextGetThreadAffinityCoreList接口，context为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0016, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    size_t ret_core_num;
    const int32_t *retCoreList = OH_AI_ContextGetThreadAffinityCoreList(nullptr, &ret_core_num);
    std::cout << retCoreList << std::endl;
}

// OH_AI_ContextGetThreadAffinityCoreList接口，core_num为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0017, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    const int32_t *retCoreList = OH_AI_ContextGetThreadAffinityCoreList(context, nullptr);
    std::cout << retCoreList << std::endl;
    OH_AI_ContextDestroy(&context);
}

// OH_AI_DeviceInfoCreate接口，传入无效值、非法值
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0018, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
    ASSERT_EQ(cpu_device_info, nullptr);
}

// OH_AI_DeviceInfoSetProvide接口，device_info传入nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0019, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoSetProviderDevice(nullptr, "aaa");
}

// OH_AI_DeviceInfoSetProvide接口，provider传入nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0020, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceInfoSetProviderDevice(cpu_device_info, nullptr);
}

// OH_AI_DeviceInfoGetProvider，device设置为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0021, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoGetProvider(nullptr);
}

// OH_AI_DeviceInfoGetProvider接口，未设置provider，直接获取默认值
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0022, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    char *proInfo = const_cast<char *>(OH_AI_DeviceInfoGetProvider(cpu_device_info));
    std::cout << proInfo << std::endl;
}

// OH_AI_DeviceInfoSetProviderDevice接口， device_info设置为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0023, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoSetProviderDevice(nullptr, "aaa");
}

// OH_AI_DeviceInfoSetProviderDevice接口， device设置为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0024, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceInfoSetProviderDevice(cpu_device_info, nullptr);
}

// OH_AI_DeviceInfoGetProviderDevice接口， device设置为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0025, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoGetProviderDevice(nullptr);
}

// OH_AI_DeviceInfoGetProviderDevice接口，未设置device，直接获取默认值
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0026, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    char *proInfo = const_cast<char *>(OH_AI_DeviceInfoGetProviderDevice(cpu_device_info));
    std::cout << proInfo << std::endl;
}

// OH_AI_ContextAddDeviceInfo接口，context传入nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0027, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(nullptr, cpu_device_info);
}

// OH_AI_ContextAddDeviceInfo接口，正常添加多次同一个设备信息
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0028, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
}

// OH_AI_ContextAddDeviceInfo接口，正常添加多次不同设备信息
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0029, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoHandle npu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ContextAddDeviceInfo(context, npu_device_info);
}

// OH_AI_DeviceInfoCreate接口，OH_AI_DEVICETYPE_INVALID
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0030, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
    ASSERT_EQ(cpu_device_info, nullptr);
}

// OH_AI_DeviceInfoSetEnableFP16接口，device_info设置为nnrt，然后调用此接口
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0031, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_DeviceInfoSetEnableFP16(nnrt_device_info, false);
    bool isFp16 = OH_AI_DeviceInfoGetEnableFP16(nnrt_device_info);
    printf("==========isFp16:%d\n", isFp16);
    ASSERT_EQ(isFp16, false);
    OH_AI_DeviceInfoSetEnableFP16(nnrt_device_info, true);
    isFp16 = OH_AI_DeviceInfoGetEnableFP16(nnrt_device_info);
    printf("==========isFp16:%d\n", isFp16);
    ASSERT_EQ(isFp16, true);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// OH_AI_CreateNNRTDeviceInfoByName
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0032, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    const char *npuName = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            npuName = name;
        }
    }
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByName(npuName);
    ASSERT_NE(nnrt_device_info, nullptr);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// OH_AI_CreateNNRTDeviceInfoByName，创建多次
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0033, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    const char *npuName = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            npuName = name;
        }
    }
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByName(npuName);
    ASSERT_NE(nnrt_device_info, nullptr);
    nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByName(npuName);
    ASSERT_NE(nnrt_device_info, nullptr);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// OH_AI_CreateNNRTDeviceInfoByName，name不存在
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0034, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByName("aaa");
    ASSERT_EQ(nnrt_device_info, nullptr);
}

// OH_AI_CreateNNRTDeviceInfoByName，name为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0035, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByName(nullptr);
    ASSERT_EQ(nnrt_device_info, nullptr);
}

// OH_AI_CreateNNRTDeviceInfoByType
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0036, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    OH_AI_NNRTDeviceType npu_type;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetTypeFromNNRTDeviceDesc " << type << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            npu_type = type;
        }
    }
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByType(npu_type);
    ASSERT_NE(nnrt_device_info, nullptr);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// OH_AI_CreateNNRTDeviceInfoByType，多次调用
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0037, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    OH_AI_NNRTDeviceType npu_type;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetTypeFromNNRTDeviceDesc " << type << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            npu_type = type;
        }
    }
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByType(npu_type);
    ASSERT_NE(nnrt_device_info, nullptr);
    nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByType(npu_type);
    ASSERT_NE(nnrt_device_info, nullptr);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// OH_AI_CreateNNRTDeviceInfoByType，OH_AI_NNRTDeviceType不正确
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0038, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByType(OH_AI_NNRTDEVICE_OTHERS);
    ASSERT_EQ(nnrt_device_info, nullptr);
}

// OH_AI_GetAllNNRTDeviceDescs，num为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0039, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetAllNNRTDeviceDescs(nullptr);
}

// OH_AI_GetElementOfNNRTDeviceDescs，descs为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0040, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetElementOfNNRTDeviceDescs(nullptr, 0);
}

// OH_AI_GetNameFromNNRTDeviceDesc，desc为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0041, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetNameFromNNRTDeviceDesc(nullptr);
}

// OH_AI_GetTypeFromNNRTDeviceDesc，desc为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0042, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetTypeFromNNRTDeviceDesc(nullptr);
}

// OH_AI_GetDeviceIdFromNNRTDeviceDesc，desc为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0043, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetDeviceIdFromNNRTDeviceDesc(nullptr);
}

// OH_AI_DeviceInfoSetDeviceId，多次调用
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0044, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// OH_AI_DeviceInfoSetDeviceId，id不正确
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0045, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, 12345);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_DeviceInfoSetDeviceId，device_info不正确
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0046, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(cpu_device_info, id_0);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_DeviceInfoSetDeviceId，device为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0047, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nullptr, id_0);
}

// OH_AI_DeviceInfoSetDeviceId，device_info不正确
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0048, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    auto id = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    std::cout << "OH_AI_DeviceInfoGetDeviceType " << id << std::endl;
}

// OH_AI_DeviceInfoSetDeviceId，device为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0049, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    auto id = OH_AI_DeviceInfoGetDeviceType(nullptr);
    std::cout << "OH_AI_DeviceInfoGetDeviceType " << id << std::endl;
}

// OH_AI_DeviceInfoSetPerformanceMode
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0050, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    ASSERT_NE(descs, nullptr);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_NONE);
    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_MEDIUM);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_DeviceInfoSetPerformanceMode，覆盖枚举值
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0051, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    ASSERT_NE(descs, nullptr);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_NONE);
    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_LOW);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_LOW);
    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_HIGH);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_HIGH);
    OH_AI_DeviceInfoSetPerformanceMode(nnrt_device_info, OH_AI_PERFORMANCE_EXTREME);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrt_device_info), OH_AI_PERFORMANCE_EXTREME);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_DeviceInfoSetPerformanceMode，device不正确
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0052, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoSetPerformanceMode(cpu_device_info, OH_AI_PERFORMANCE_MEDIUM);
}

// OH_AI_DeviceInfoSetPerformanceMode，device为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0053, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoSetPerformanceMode(nullptr, OH_AI_PERFORMANCE_MEDIUM);
}

// OH_AI_DeviceInfoGetPerformanceMode，device不正确
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0054, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoGetPerformanceMode(cpu_device_info);
}

// OH_AI_DeviceInfoGetPerformanceMode，device为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0055, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoGetPerformanceMode(nullptr);
}

// OH_AI_DeviceInfoSetPriority
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0056, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    ASSERT_NE(descs, nullptr);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_NONE);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_MEDIUM);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_DeviceInfoSetPriority，覆盖枚举值
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0057, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    ASSERT_NE(descs, nullptr);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_NONE);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_LOW);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_LOW);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_HIGH);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrt_device_info), OH_AI_PRIORITY_HIGH);
    OH_AI_ContextAddDeviceInfo(context, nnrt_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_DeviceInfoSetPriority，device不正确
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0058, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoSetPriority(cpu_device_info, OH_AI_PRIORITY_MEDIUM);
}

// OH_AI_DeviceInfoSetPriority，device为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0059, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoSetPriority(nullptr, OH_AI_PRIORITY_MEDIUM);
}

// OH_AI_DeviceInfoGetPriority，device不正确
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0060, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoGetPriority(cpu_device_info);
}

// OH_AI_DeviceInfoGetPriority，device为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0061, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoGetPriority(nullptr);
}

// OH_AI_DeviceInfoAddExtension，device不正确
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0062, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    const char *model_name = "cache_model";
    OH_AI_Status extension_ret = OH_AI_DeviceInfoAddExtension(cpu_device_info, "ModelName",
        model_name, strlen(model_name));
    ASSERT_EQ(extension_ret, OH_AI_STATUS_LITE_ERROR);
}

// OH_AI_DeviceInfoAddExtension，device为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0063, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    const char *model_name = "cache_model";
    OH_AI_Status extension_ret = OH_AI_DeviceInfoAddExtension(nullptr, "ModelName", model_name, strlen(model_name));
    ASSERT_EQ(extension_ret, OH_AI_STATUS_LITE_NULLPTR);
}

// OH_AI_DeviceInfoAddExtension，name不在白名单内
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0064, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    ASSERT_NE(descs, nullptr);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    const char *model_name = "cache_model";
    OH_AI_Status extension_ret = OH_AI_DeviceInfoAddExtension(nnrt_device_info, "aaa", model_name, strlen(model_name));
    ASSERT_EQ(extension_ret, OH_AI_STATUS_LITE_ERROR);
}

// OH_AI_DeviceInfoAddExtension，name为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0065, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    ASSERT_NE(descs, nullptr);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    const char *model_name = "cache_model";
    OH_AI_Status extension_ret = OH_AI_DeviceInfoAddExtension(nnrt_device_info, nullptr,
        model_name, strlen(model_name));
    ASSERT_EQ(extension_ret, OH_AI_STATUS_LITE_NULLPTR);
}

// OH_AI_DeviceInfoAddExtension，value为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_ContextCreate_0066, Function | MediumTest | Level0) {
    if (!IsNPU()) {
        printf("NNRt is not NPU, skip this test");
        return;
    }
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    ASSERT_NE(descs, nullptr);
    NNRTDeviceDesc *desc_0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc_0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id_0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc_0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id_0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrt_device_info, id_0);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    const char *model_name = "cache_model";
    OH_AI_Status extension_ret = OH_AI_DeviceInfoAddExtension(nnrt_device_info, "ModelName",
        nullptr, strlen(model_name));
    ASSERT_EQ(extension_ret, OH_AI_STATUS_LITE_NULLPTR);
}

// 正常调用接口，创建model对象
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0001, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常调用接口，创建多个model对象
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0002, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpu_device_info2);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    OH_AI_Status build_ret2 = OH_AI_ModelBuildFromFile(model2, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(build_ret2, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model);
    OH_AI_ModelDestroy(&model2);
}

// 正常调用接口，循环创建model对象
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0003, Function | MediumTest | Level0) {
    for (size_t i = 0; i < 10; i++) {
        printf("==========OH_AI_ContextCreate==========\n");
        OH_AI_ContextHandle context = OH_AI_ContextCreate();
        OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
        printf("==========OH_AI_ModelBuildFromFile==========\n");
        OH_AI_ModelHandle model = OH_AI_ModelCreate();
        OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
            OH_AI_MODELTYPE_MINDIR, context);
        ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
        printf("==========OH_AI_ModelDestroy==========\n");
        OH_AI_ContextDestroy(&context);
        OH_AI_ModelDestroy(&model);
    }
}

// 正常调用接口，多次释放model对象
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0005, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuild接口，正常调用
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0006, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size;
    const char *modelPath = "/data/test/ml_face_isface.ms";
    char *modelBuf = ReadFile(modelPath, &size);
    ASSERT_NE(modelBuf, nullptr);
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuild(model, modelBuf, size, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuild接口，model多次build
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0007, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size;
    const char *modelPath = "/data/test/ml_face_isface.ms";
    char *modelBuf = ReadFile(modelPath, &size);
    ASSERT_NE(modelBuf, nullptr);
    size_t size2;
    const char *modelPath2 = "/data/test/aiy_vision_classifier_plants_V1_3.ms";
    char *modelBuf2 = ReadFile(modelPath2, &size2);
    ASSERT_NE(modelBuf2, nullptr);
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpu_device_info2);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuild(model, modelBuf, size, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    OH_AI_Status build_ret2 = OH_AI_ModelBuild(model, modelBuf2, size2, OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(build_ret2, OH_AI_STATUS_LITE_MODEL_REBUILD);
    delete[] modelBuf;
    delete[] modelBuf2;
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuild接口model对象为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0008, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size;
    const char *modelPath = "/data/test/ml_face_isface.ms";
    char *modelBuf = ReadFile(modelPath, &size);
    ASSERT_NE(modelBuf, nullptr);
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_Status build_ret = OH_AI_ModelBuild(nullptr, modelBuf, size, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_NULLPTR);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
}

// OH_AI_ModelBuild接口model data对象为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0009, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size;
    const char *modelPath = "/data/test/ml_face_isface.ms";
    char *modelBuf = ReadFile(modelPath, &size);
    ASSERT_NE(modelBuf, nullptr);
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuild(model, nullptr, 0, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_NULLPTR);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuild接口model type非法，传入OH_AI_MODELTYPE_INVALID
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0010, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size;
    const char *modelPath = "/data/test/ml_face_isface.ms";
    char *modelBuf = ReadFile(modelPath, &size);
    ASSERT_NE(modelBuf, nullptr);
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuild(model, modelBuf, size, OH_AI_MODELTYPE_INVALID, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_PARAM_INVALID);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuild接口context对象为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0011, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size;
    const char *modelPath = "/data/test/ml_face_isface.ms";
    char *modelBuf = ReadFile(modelPath, &size);
    ASSERT_NE(modelBuf, nullptr);
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuild(model, modelBuf, size, OH_AI_MODELTYPE_MINDIR, nullptr);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_NULLPTR);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuild接口data_size小于实际model_data
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0012, Function | MediumTest | Level0) {
    printf("==========ReadFile==========\n");
    size_t size;
    const char *modelPath = "/data/test/ml_face_isface.ms";
    char *modelBuf = ReadFile(modelPath, &size);
    ASSERT_NE(modelBuf, nullptr);
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuild(model, modelBuf, 1, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_ERROR);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuildFromFile接口model为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0013, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(nullptr, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
}

// OH_AI_ModelBuildFromFile接口modelPath有误
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0014, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuildFromFile接口model type非法，传入OH_AI_MODELTYPE_INVALID
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0015, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_INVALID, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuildFromFile接口context对象为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0016, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, nullptr);
    ASSERT_EQ(build_ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


// OH_AI_ModelBuildFromFile接口，正常调用
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0017, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelBuildFromFile接口，model多次build
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0018, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpu_device_info2);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model,
        "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    OH_AI_Status build_ret2 = OH_AI_ModelBuildFromFile(model,
        "/data/test/aiy_vision_classifier_plants_V1_3.ms", OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(build_ret2, OH_AI_STATUS_LITE_MODEL_REBUILD);
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelPredict接口model为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0019, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(nullptr, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelPredict接口input为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0020, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs;
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


// OH_AI_ModelPredict接口input给非法数据（其他模型输入、非input数据）
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0021, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    constexpr size_t create_shape_num = 1;
    int64_t createShape[create_shape_num] = {6};
    float data[6] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
                                           create_shape_num, data, sizeof(data));
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandleArray in_tensor_array;
    in_tensor_array.handle_num = 1;
    in_tensor_array.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) * in_tensor_array.handle_num);
    in_tensor_array.handle_list[0] = tensor;
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &outputs, nullptr, nullptr);
    std::cout << predict_ret << std::endl;
    ASSERT_EQ(predict_ret, OH_AI_STATUS_LITE_INPUT_TENSOR_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_TensorDestroy(&tensor);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelPredict接口，callback功能
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0022, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict Callback==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_KernelCallBack before_call_back = PrintBeforeCallback;
    OH_AI_KernelCallBack after_call_back = PrintAfterCallback;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, before_call_back, after_call_back);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("=========CompareResult===========\n");
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelResize接口resize动态模型，shape_infos为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0027, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    OH_AI_ShapeInfo shape_infos[] = {{4, {1, 3, 48, 48}}};
    OH_AI_Status resize_ret = OH_AI_ModelResize(model, inputs, shape_infos, inputs.handle_num);
    ASSERT_EQ(resize_ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelResize接口resize静态模型
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0028, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    OH_AI_ShapeInfo shape_infos[] = {{4, {1, 112, 112, 3}}};
    OH_AI_Status resize_ret = OH_AI_ModelResize(model, inputs, shape_infos, inputs.handle_num);
    ASSERT_EQ(resize_ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 正常调用ModelGetInputs
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0029, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 多次调用ModelGetInputs
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0030, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    OH_AI_TensorHandleArray inputs2 = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs2.handle_list, nullptr);
    FillInputsData(inputs2, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs2, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelGetInputs,model为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0031, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ModelGetInputs(nullptr);
}

// 正常调用OH_AI_ModelGetOutputs
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0032, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 多次调用OH_AI_ModelGetOutputs
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0033, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    ASSERT_NE(outputs.handle_list, nullptr);
    OH_AI_TensorHandleArray outputs2 = OH_AI_ModelGetOutputs(model);
    ASSERT_NE(outputs2.handle_list, nullptr);
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs2, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs2, "ml_face_isface");
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelGetOutputs，model为nullptr
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0034, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ModelGetOutputs(nullptr);
}

// OH_AI_ModelGetInputByTensorName
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0035, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelGetInputByTensorName==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetInputByTensorName(model, "data");
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandleArray in_tensor_array;
    in_tensor_array.handle_num = 1;
    in_tensor_array.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) * 1);
    in_tensor_array.handle_list[0] = tensor;
    FillInputsData(in_tensor_array, "ml_face_isface", true);
    printf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, in_tensor_array, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelGetInputByTensorName，model为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0036, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ModelGetInputByTensorName(nullptr, "data");
}

// OH_AI_ModelGetInputByTensorName，名字不存在
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0037, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========OH_AI_ModelGetInputByTensorName==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetInputByTensorName(model, "aaa");
    ASSERT_EQ(tensor, nullptr);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelGetOutputByTensorName
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0038, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetOutputByTensorName(model, "prob");
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandleArray outputs;
    outputs.handle_num = 1;
    outputs.handle_list = (OH_AI_TensorHandle *)malloc(sizeof(OH_AI_TensorHandle) * 1);
    outputs.handle_list[0] = tensor;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// OH_AI_ModelGetOutputByTensorName，model为空
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0039, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ModelGetOutputByTensorName(nullptr, "prob");
}

// OH_AI_ModelGetOutputByTensorName，名字不存在
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0040, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetOutputByTensorName(model, "aaa");
    ASSERT_EQ(tensor, nullptr);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}

// 两个model调用同一个context
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0041, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_Status build_ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR,
        context);
    ASSERT_EQ(build_ret, OH_AI_STATUS_SUCCESS);
    OH_AI_Status build_ret2 = OH_AI_ModelBuildFromFile(model2, "/data/test/aiy_vision_classifier_plants_V1_3.ms",
        OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(build_ret2, OH_AI_STATUS_LITE_PARAM_INVALID);
    printf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OH_AI_ModelDestroy(&model2);
}

// OH_AI_ModelCreate同时创建3个model
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelCreate_0042, Function | MediumTest | Level0) {
    printf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpu_device_info2);
    OH_AI_ContextHandle context3 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpu_device_info3 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context3, cpu_device_info3);
    printf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
    printf("==========Model Build2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    ModelPredict(model2, context2, "ml_face_isface_quant", {}, false, false, false);
    printf("==========Model Build3==========\n");
    OH_AI_ModelHandle model3 = OH_AI_ModelCreate();
    ASSERT_NE(model3, nullptr);
    OH_AI_ShapeInfo shape_infos = {4, {1, 32, 512, 1}};
    ModelPredict(model3, context3, "ml_ocr_cn", shape_infos, false, false, false);
}


//完善枚举值覆盖率
HWTEST(MSLiteTest, SUB_AI_MindSpore_Covered_0001, Function | MediumTest | Level0) {
    ASSERT_EQ(OH_AI_COMPCODE_CORE, 0);
    ASSERT_EQ(OH_AI_COMPCODE_MD, 268435456);
    ASSERT_EQ(OH_AI_COMPCODE_ME, 536870912);
    ASSERT_EQ(OH_AI_COMPCODE_MC, 805306368);
    ASSERT_EQ(OH_AI_COMPCODE_LITE, 4026531840);
    ASSERT_EQ(OH_AI_STATUS_CORE_FAILED, 1);
    ASSERT_EQ(OH_AI_STATUS_LITE_NO_CHANGE, 4294967292);
    ASSERT_EQ(OH_AI_STATUS_LITE_SUCCESS_EXIT, 4294967291);
    ASSERT_EQ(OH_AI_STATUS_LITE_MEMORY_FAILED, 4294967290);
    ASSERT_EQ(OH_AI_STATUS_LITE_NOT_SUPPORT, 4294967289);
    ASSERT_EQ(OH_AI_STATUS_LITE_THREADPOOL_ERROR, 4294967288);
    ASSERT_EQ(OH_AI_STATUS_LITE_UNINITIALIZED_OBJ, 4294967287);
    ASSERT_EQ(OH_AI_STATUS_LITE_OUT_OF_TENSOR_RANGE, 4294967196);
    ASSERT_EQ(OH_AI_STATUS_LITE_REENTRANT_ERROR, 4294967194);
    ASSERT_EQ(OH_AI_STATUS_LITE_GRAPH_FILE_ERROR, 4294967096);
    ASSERT_EQ(OH_AI_STATUS_LITE_NOT_FIND_OP, 4294966996);
    ASSERT_EQ(OH_AI_STATUS_LITE_INVALID_OP_NAME, 4294966995);
    ASSERT_EQ(OH_AI_STATUS_LITE_INVALID_OP_ATTR, 4294966994);
    ASSERT_EQ(OH_AI_STATUS_LITE_OP_EXECUTE_FAILURE, 4294966993);
    ASSERT_EQ(OH_AI_STATUS_LITE_FORMAT_ERROR, 4294966896);
    ASSERT_EQ(OH_AI_STATUS_LITE_INFER_ERROR, 4294966796);
    ASSERT_EQ(OH_AI_STATUS_LITE_INFER_INVALID, 4294966795);
    ASSERT_EQ(OH_AI_DEVICETYPE_GPU, 1);
    ASSERT_EQ(OH_AI_NNRTDEVICE_CPU, 1);
    ASSERT_EQ(OH_AI_NNRTDEVICE_GPU, 2);
    ASSERT_EQ(OH_AI_NNRTDEVICE_ACCELERATOR, 3);
    ASSERT_EQ(OH_AI_KO0, 0);
    ASSERT_EQ(OH_AI_KO3, 3);
    ASSERT_EQ(OH_AI_KAUTO, 4);
    ASSERT_EQ(OH_AI_KOPTIMIZATIONTYPE, 4294967295);
    ASSERT_EQ(OH_AI_DATATYPE_UNKNOWN, 0);
    ASSERT_EQ(OH_AI_DATATYPE_OBJECTTYPE_STRING, 12);
    ASSERT_EQ(OH_AI_DATATYPE_OBJECTTYPE_LIST, 13);
    ASSERT_EQ(OH_AI_DATATYPE_OBJECTTYPE_TUPLE, 14);
    ASSERT_EQ(OH_AI_DATATYPE_OBJECTTYPE_TENSOR, 17);
    ASSERT_EQ(OH_AI_DATATYPE_NUMBERTYPE_BEGIN, 29);
    ASSERT_EQ(OH_AI_DATATYPE_NUMBERTYPE_END, 46);
}


/**
* @tc.number    : SUB_AI_MindSpore_ModelLoadConfig_0001
* @tc.name      : 模型加载合法配置文件成功
* @tc.desc      : 正常场景1：合法参数+有效配置文件 → 返回OH_AI_STATUS_SUCCESS
*/
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelLoadConfig_0001, Function | MediumTest | Level0) {
    printf("==========创建上下文与模型==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);  // 添加CPU设备支持
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========加载合法配置文件==========\n");
    // 测试目标：加载存在且格式正确的配置文件
    const char* validConfigPath = "/data/test/ml_face_isface.config";
    OH_AI_Status load_status = OH_AI_ModelLoadConfig(model, validConfigPath);
    ASSERT_EQ(load_status, OH_AI_STATUS_SUCCESS);
    // 从文件加载模型
    printf("==========从文件加载模型==========\n");
    auto status = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    printf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predict_ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    printf("==========CompareResult==========\n");
    CompareResult(outputs, "ml_face_isface");
    // 资源释放
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


/**
* @tc.number    : SUB_AI_MindSpore_ModelLoadConfig_0002
* @tc.name      : config_file_path为nullptr
* @tc.desc      : 异常场景1：config_file_path为nullptr → 返回OH_AI_STATUS_LITE_NULLPTR
*/
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelLoadConfig_0002, Function | MediumTest | Level0) {
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status load_status = OH_AI_ModelLoadConfig(model, nullptr);
    std::cout << "load_status is " << load_status << std::endl;
    ASSERT_EQ(load_status, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_Status load_status_01 = OH_AI_ModelLoadConfig(nullptr, "/data/test/ml_face_isface.config");
    std::cout << "load_status is " << load_status_01 << std::endl;
    ASSERT_EQ(load_status_01, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


/**
* @tc.number    : SUB_AI_MindSpore_ModelLoadConfig_0003
* @tc.name      : 配置文件不存在
* @tc.desc      : 异常场景2：配置文件不存在 → 必须返回非SUCCESS且非NULLPTR
*/
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelLoadConfig_0003, Function | MediumTest | Level0) {
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    const char* nonExistConfig = "/data/test/not_exist.config";  // 不存在
    OH_AI_Status load_status = OH_AI_ModelLoadConfig(model, nonExistConfig);
    std::cout << "load_status is " << load_status << std::endl;
    // 修正：同时断言非SUCCESS和非NULLPTR，确保错误被检测
    ASSERT_NE(load_status, OH_AI_STATUS_SUCCESS);
    ASSERT_NE(load_status, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}


/**
* @tc.number    : SUB_AI_MindSpore_ModelLoadConfig_0004
* @tc.name      : 配置内容无效（如不支持的数据类型
* @tc.desc      : 异常场景3：配置内容无效（如不支持的数据类型）→ 返回SUCCESS
*/
HWTEST(MSLiteTest, SUB_AI_MindSpore_ModelLoadConfig_0004, Function | MediumTest | Level0) {
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    const char* invalidContentConfig = "/data/test/invalid_content.config";  // 内容无效
    OH_AI_Status load_status = OH_AI_ModelLoadConfig(model, invalidContentConfig);
    std::cout << "load_status is " << load_status << std::endl;
    ASSERT_EQ(load_status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
