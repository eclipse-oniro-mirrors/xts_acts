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
void CompareResult(OH_AI_TensorHandleArray outputs, string model_name) {
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
        bool result = compFp32WithTData(output_data, output_file, 0.01, 0.01, false);
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
    } else {
        printf("==========Build model==========\n");
        ret = OH_AI_ModelBuildFromFile(model, graphPath, OH_AI_MODELTYPE_MINDIR, context);
    }
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    printf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    if (shape_infos.shape_num != NULL) {
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
    ASSERT_EQ(predict_ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, model_name);
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

// 正常场景：Context设置CPU，默认场景，不设置线程绑核
HWTEST(MSLiteTest, OHOS_Context_CPU_0001, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0002, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0003, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0004, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0005, Function | MediumTest | Level1) {
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
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NOT_SUPPORT);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：Context设置CPU，不绑核
HWTEST(MSLiteTest, OHOS_Context_CPU_0006, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0007, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0008, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0009, Function | MediumTest | Level1) {
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
    ASSERT_EQ(thread_affinity_mode, 3);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/test/ml_face_isface.ms", OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ModelDestroy(&model);
}

// 正常场景：Context设置CPU，绑核列表{0,1,2,3}
HWTEST(MSLiteTest, OHOS_Context_CPU_0010, Function | MediumTest | Level1) {
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
    const int32_t *ret_core_list = nullptr;
    ret_core_list = OH_AI_ContextGetThreadAffinityCoreList(context, &ret_core_num);
    ASSERT_EQ(ret_core_num, core_num);
    for (size_t i = 0; i < ret_core_num; i++) {
        printf("==========ret_core_list:%d\n", ret_core_list[i]);
        ASSERT_EQ(ret_core_list[i], core_list[i]);
    }
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，绑核列表和模式同时开启
HWTEST(MSLiteTest, OHOS_Context_CPU_0011, Function | MediumTest | Level1) {
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
    const int32_t *ret_core_list = nullptr;
    ret_core_list = OH_AI_ContextGetThreadAffinityCoreList(context, &ret_core_num);
    ASSERT_EQ(ret_core_num, core_num);
    for (size_t i = 0; i < ret_core_num; i++) {
        printf("==========ret_core_list:%d\n", ret_core_list[i]);
        ASSERT_EQ(ret_core_list[i], core_list[i]);
    }
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，开启并行
HWTEST(MSLiteTest, OHOS_Context_CPU_0012, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0013, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0014, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0015, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0016, Function | MediumTest | Level1) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceInfoSetProvider(cpu_device_info, "vendor_new");
    ASSERT_EQ(strcmp(OH_AI_DeviceInfoGetProvider(cpu_device_info), "vendor_new"), 0);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，设置厂商设备类型
HWTEST(MSLiteTest, OHOS_Context_CPU_0017, Function | MediumTest | Level1) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceInfoSetProviderDevice(cpu_device_info, "cpu_new");
    ASSERT_EQ(strcmp(OH_AI_DeviceInfoGetProviderDevice(cpu_device_info), "cpu_new"), 0);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：Context设置CPU，销毁MSDeviceInfo
HWTEST(MSLiteTest, OHOS_Context_CPU_0018, Function | MediumTest | Level1) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpu_device_info, nullptr);
    OH_AI_DeviceType device_type = OH_AI_DeviceInfoGetDeviceType(cpu_device_info);
    printf("==========device_type:%d\n", device_type);
    ASSERT_EQ(device_type, OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_DeviceInfoDestroy(&cpu_device_info);
    ASSERT_EQ(cpu_device_info, nullptr);
}

// 正常场景：Context设置CPU，销毁OH_AI_Context
HWTEST(MSLiteTest, OHOS_Context_CPU_0019, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Context_CPU_0020, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

 // 正常场景：Context设置NPU,频率为1
 HWTEST(MSLiteTest, OHOS_Context_NPU_0002, Function | MediumTest | Level1) {
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
 }

// 正常场景：ModelBuild，调用指针方法
HWTEST(MSLiteTest, OHOS_Model_Build_0001, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Model_Build_0002, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，model_data为空
HWTEST(MSLiteTest, OHOS_Model_Build_0003, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，data_size为0
HWTEST(MSLiteTest, OHOS_Model_Build_0004, Function | MediumTest | Level1) {
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
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    delete[] graphBuf;
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，读取路径方法，且路径不是模型数据路径
HWTEST(MSLiteTest, OHOS_Model_Build_0005, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，读取路径方法，路径为空
HWTEST(MSLiteTest, OHOS_Model_Build_0006, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，model_type不支持
HWTEST(MSLiteTest, OHOS_Model_Build_0007, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelBuild，model_context为空
HWTEST(MSLiteTest, OHOS_Model_Build_0008, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelBuild，调用GetOutputs获取输出
HWTEST(MSLiteTest, OHOS_Model_Build_0009, Function | MediumTest | Level1) {
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
}

// 正常场景：ModelResize，shape与之前一致
HWTEST(MSLiteTest, OHOS_Model_Resize_0001, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Model_Resize_0002, Function | MediumTest | Level1) {
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
}

// 异常场景：ModelResize，shape为三维
HWTEST(MSLiteTest, OHOS_Model_Resize_0003, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelResize，shape值有负数
HWTEST(MSLiteTest, OHOS_Model_Resize_0004, Function | MediumTest | Level1) {
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
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelResize，不支持resize的模型
HWTEST(MSLiteTest, OHOS_Model_Resize_0005, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelPredict
HWTEST(MSLiteTest, OHOS_Model_Predict_0001, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Model_Predict_0002, Function | MediumTest | Level1) {
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
}

// 异常场景：ModelPredict，input为空
HWTEST(MSLiteTest, OHOS_Model_Predict_0003, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelPredict，传入回调函数
HWTEST(MSLiteTest, OHOS_Model_Predict_0004, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Model_GetInputByTensorName_0001, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelGetInputByTensorName，名称不存在
HWTEST(MSLiteTest, OHOS_Model_GetInputByTensorName_0002, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 正常场景：ModelGetOutputByTensorName
HWTEST(MSLiteTest, OHOS_Model_GetOutputByTensorName_0001, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 异常场景：ModelGetOutputByTensorName，名称不存在
HWTEST(MSLiteTest, OHOS_Model_GetOutputByTensorName_0002, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 正常场景：MSTensorCreate,创建tensor
HWTEST(MSLiteTest, OHOS_Tensor_Create_0001, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 正常场景：MSTensorDestroy,销毁tensor
HWTEST(MSLiteTest, OHOS_Tensor_Create_0002, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0003, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0004, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0005, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0006, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0007, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0008, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0009, Function | MediumTest | Level1) {
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
    ASSERT_EQ(data_format, OH_AI_FORMAT_NCHW);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
}

// 正常场景：MSTensorSetFormat,设置tensor格式
HWTEST(MSLiteTest, OHOS_Tensor_Create_0010, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0011, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0012, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0013, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0014, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0015, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Tensor_Create_0016, Function | MediumTest | Level1) {
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
HWTEST(MSLiteTest, OHOS_Input_0001, Function | MediumTest | Level1) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}


// 正常场景：量化模型
HWTEST(MSLiteTest, OHOS_Input_0004, Function | MediumTest | Level1) {
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, "ml_face_isface", {}, false, true, false);
}

// 正常场景：循环多次执行推理流程
HWTEST(MSLiteTest, OHOS_Multiple_0001, Function | MediumTest | Level1) {
    for (size_t num = 0; num < 50; ++num) {
        Predict_CPU();
    }
}

// 正常场景：Model创建一次,Build一次，Predict多次
HWTEST(MSLiteTest, OHOS_Multiple_0003, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}

// 正常场景：多次创建和销毁Model
HWTEST(MSLiteTest, OHOS_Multiple_0004, Function | MediumTest | Level1) {
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
        OH_AI_ModelDestroy(&model);
    }
}

// 正常场景：两个模型都在CPU上并行推理
HWTEST(MSLiteTest, OHOS_Parallel_0001, Function | MediumTest | Level1) {
    std::cout << "run start" << std::endl;
    std::thread t1(Predict_CPU);
    std::cout << "1111111111111" << std::endl;
    std::thread t2(Predict_CPU);
    std::cout << "2222222222222" << std::endl;
    t1.join();
    t2.join();
}

// 正常场景：r1.3转换的模型在r1.5上推理
HWTEST(MSLiteTest, OHOS_Compatible_0001, Function | MediumTest | Level1) {
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
    OH_AI_ModelDestroy(&model);
}