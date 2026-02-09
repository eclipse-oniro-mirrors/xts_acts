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
constexpr int MAX_DIMS = 10;
constexpr int SHAPE_N = 1;
constexpr int SHAPE_C = 3;
constexpr int SHAPE_H = 800;
constexpr int SHAPE_W = 800;

void AddContextDeviceAIPP(OH_AI_ContextHandle context, string aippPath)
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
    OH_AI_Status extensionRet = OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "AIPP", aippPath.c_str(), aippPath.size());
    ASSERT_EQ(extensionRet, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
}
} // namespace

void CreateAIPPModelData(OH_AI_ModelHandle model, OH_AI_TensorHandleArray* inTensorArray)
{
    int64_t shape[MAX_DIMS];
    size_t shapeNum;
    OH_AI_TensorHandleArray inputsHandle = OH_AI_ModelGetInputs(model);
    inTensorArray->handle_num = inputsHandle.handle_num;
    inTensorArray->handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * inTensorArray->handle_num);
    for (size_t i = 0; i < inputsHandle.handle_num; i++) {
        auto oriTensor = inputsHandle.handle_list[i];
        OH_AI_TensorGetShape(oriTensor, &shapeNum);
        shape[SHAPE_INDEX_0] = SHAPE_N;
        shape[SHAPE_INDEX_1] = SHAPE_C;
        shape[SHAPE_INDEX_2] = SHAPE_H;
        shape[SHAPE_INDEX_3] = SHAPE_W;
        void* inAllocator = OH_AI_TensorGetAllocator(oriTensor);
        OH_AI_TensorHandle inTensor = OH_AI_TensorCreate(
            OH_AI_TensorGetName(oriTensor), OH_AI_DATATYPE_NUMBERTYPE_UINT8, shape, shapeNum, nullptr, 0);
        OH_AI_TensorSetAllocator(inTensor, inAllocator);
        OH_AI_TensorSetFormat(inTensor, OH_AI_FORMAT_NCHW);
        inTensorArray->handle_list[i] = inTensor;
    }
}
// 正常接口测试：OH_AI_ModelPredictWithConfig接口调用
/**
 * @tc.name   SUBAIMindSporeAIPP0001
 * @tc.number SUBAIMindSporeAIPP0001
 * @tc.desc   SUBAIMindSporeAIPP0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0001()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray{};
    CreateAIPPModelData(model, &inTensorArray);
    FillInputsData(inTensorArray, "two_add_operators", false);
    OH_AI_TensorHandleArray outputs;
    const char* predictConfig =
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=0,load_start_pos_h=0,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216!"
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=80,load_start_pos_h=80,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216";
    OH_AI_Status predictRet =
        OH_AI_ModelPredictWithConfig(model, inTensorArray, &outputs, predictConfig, nullptr, nullptr);
    if (predictRet != OH_AI_STATUS_LITE_AIPP_NOT_SUPPORTED) {
        ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常接口测试：OH_AI_ModelPredictWithConfig接口callback功能
/**
 * @tc.name   SUBAIMindSporeAIPP0002
 * @tc.number SUBAIMindSporeAIPP0002
 * @tc.desc   SUBAIMindSporeAIPP0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0002()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray{};
    CreateAIPPModelData(model, &inTensorArray);
    FillInputsData(inTensorArray, "two_add_operators", false);
    OH_AI_TensorHandleArray outputs;
    OH_AI_KernelCallBack beforeCallBack = PrintBeforeCallback;
    OH_AI_KernelCallBack afterCallBack = PrintAfterCallback;
    const char* predictConfig =
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=0,load_start_pos_h=0,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216!"
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=80,load_start_pos_h=80,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216";
    OH_AI_Status predictRet =
        OH_AI_ModelPredictWithConfig(model, inTensorArray, &outputs, predictConfig, beforeCallBack, afterCallBack);
    if (predictRet != OH_AI_STATUS_LITE_AIPP_NOT_SUPPORTED) {
        ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常接口测试：OH_AI_ModelPredictWithConfig接口model为nullptr
/**
 * @tc.name   SUBAIMindSporeAIPP0003
 * @tc.number SUBAIMindSporeAIPP0003
 * @tc.desc   SUBAIMindSporeAIPP0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0003()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray{};
    CreateAIPPModelData(model, &inTensorArray);
    FillInputsData(inTensorArray, "two_add_operators", false);
    OH_AI_TensorHandleArray outputs;
    const char* predictConfig =
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=0,load_start_pos_h=0,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216!"
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=80,load_start_pos_h=80,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216";
    OH_AI_Status predictRet =
        OH_AI_ModelPredictWithConfig(nullptr, inTensorArray, &outputs, predictConfig, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常接口测试：OH_AI_ModelPredictWithConfig接口input为空
/**
 * @tc.name   SUBAIMindSporeAIPP0004
 * @tc.number SUBAIMindSporeAIPP0004
 * @tc.desc   SUBAIMindSporeAIPP0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0004()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray;
    OH_AI_TensorHandleArray outputs;
    const char* predictConfig =
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=0,load_start_pos_h=0,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216!"
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=80,load_start_pos_h=80,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216";
    OH_AI_Status predictRet =
        OH_AI_ModelPredictWithConfig(model, inTensorArray, &outputs, predictConfig, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常接口测试：OH_AI_ModelPredictWithConfig接口input给非法数据
/**
 * @tc.name   SUBAIMindSporeAIPP0005
 * @tc.number SUBAIMindSporeAIPP0005
 * @tc.desc   SUBAIMindSporeAIPP0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0005()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray;
    OH_AI_TensorHandleArray inputsHandle = OH_AI_ModelGetInputs(model);
    inTensorArray.handle_num = inputsHandle.handle_num;
    inTensorArray.handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * inTensorArray.handle_num);
    for (size_t i = 0; i < inputsHandle.handle_num; i++) {
        constexpr size_t shapeNum = 1;
        int64_t shape[shapeNum] = { 6 };
        uint8_t data[6] = { 1, 2, 3, 4, 5, 6 };
        OH_AI_TensorHandle inTensor = OH_AI_TensorCreate(OH_AI_TensorGetName(inputsHandle.handle_list[i]),
                                                         OH_AI_DATATYPE_NUMBERTYPE_UINT8,
                                                         shape,
                                                         shapeNum,
                                                         data,
                                                         sizeof(data));
        inTensorArray.handle_list[i] = inTensor;
    }
    OH_AI_TensorHandleArray outputs;
    const char* predictConfig =
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=0,load_start_pos_h=0,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216!"
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=80,load_start_pos_h=80,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216";
    OH_AI_Status predictRet =
        OH_AI_ModelPredictWithConfig(model, inTensorArray, &outputs, predictConfig, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_LITE_INPUT_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常接口测试：OH_AI_ModelPredictWithConfig接口predictConfig为空
/**
 * @tc.name   SUBAIMindSporeAIPP0006
 * @tc.number SUBAIMindSporeAIPP0006
 * @tc.desc   SUBAIMindSporeAIPP0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0006()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray{};
    CreateAIPPModelData(model, &inTensorArray);
    FillInputsData(inTensorArray, "two_add_operators", false);
    OH_AI_TensorHandleArray outputs;
    const char* predictConfig = "";
    OH_AI_Status predictRet =
        OH_AI_ModelPredictWithConfig(model, inTensorArray, &outputs, predictConfig, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

void CreateAIPPModelDataCopyFree(OH_AI_ModelHandle model,
                                 OH_AI_TensorHandleArray* inTensorArray,
                                 OH_AI_TensorHandleArray* outTensorArray)
{
    int64_t shape[MAX_DIMS];
    size_t shapeNum;
    OH_AI_TensorHandleArray inputsHandle = OH_AI_ModelGetInputs(model);
    inTensorArray->handle_num = inputsHandle.handle_num;
    inTensorArray->handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * inTensorArray->handle_num);
    for (size_t i = 0; i < inputsHandle.handle_num; i++) {
        auto oriTensor = inputsHandle.handle_list[i];
        OH_AI_TensorGetShape(oriTensor, &shapeNum);
        shape[SHAPE_INDEX_0] = SHAPE_N;
        shape[SHAPE_INDEX_1] = SHAPE_C;
        shape[SHAPE_INDEX_2] = SHAPE_H;
        shape[SHAPE_INDEX_3] = SHAPE_W;
        void* inAllocator = OH_AI_TensorGetAllocator(oriTensor);
        OH_AI_TensorHandle inTensor = OH_AI_TensorCreate(
            OH_AI_TensorGetName(oriTensor), OH_AI_DATATYPE_NUMBERTYPE_UINT8, shape, shapeNum, nullptr, 0);
        OH_AI_TensorSetAllocator(inTensor, inAllocator);
        OH_AI_TensorSetFormat(inTensor, OH_AI_FORMAT_NCHW);
        inTensorArray->handle_list[i] = inTensor;
    }
    OH_AI_TensorHandleArray outputsHandle = OH_AI_ModelGetOutputs(model);
    outTensorArray->handle_num = outputsHandle.handle_num;
    outTensorArray->handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * outTensorArray->handle_num);
    for (size_t i = 0; i < outputsHandle.handle_num; i++) {
        auto oriTensor = outputsHandle.handle_list[i];
        auto shapePtr = OH_AI_TensorGetShape(oriTensor, &shapeNum);
        for (size_t j = 0; j < shapeNum; j++) {
            shape[j] = shapePtr[j];
        }
        void* inAllocator = OH_AI_TensorGetAllocator(oriTensor);
        OH_AI_TensorHandle outTensor = OH_AI_TensorCreate(
            OH_AI_TensorGetName(oriTensor), OH_AI_TensorGetDataType(oriTensor), shape, shapeNum, nullptr, 0);
        OH_AI_TensorSetAllocator(outTensor, inAllocator);
        outTensorArray->handle_list[i] = outTensor;
    }
}

// 正常接口测试：使用OH_AI_TensorCreate创建Tensor方式的NPU免拷贝，进行推理
/**
 * @tc.name   SUBAIMindSporeAIPP0007
 * @tc.number SUBAIMindSporeAIPP0007
 * @tc.desc   SUBAIMindSporeAIPP0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0007()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray{};
    OH_AI_TensorHandleArray outTensorArray{};
    CreateAIPPModelDataCopyFree(model, &inTensorArray, &outTensorArray);
    FillInputsData(inTensorArray, "two_add_operators", false);
    const char* predictConfig =
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=0,load_start_pos_h=0,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216!"
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=80,load_start_pos_h=80,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216";
    OH_AI_Status predictRet =
        OH_AI_ModelPredictWithConfig(model, inTensorArray, &outTensorArray, predictConfig, nullptr, nullptr);
    if (predictRet != OH_AI_STATUS_LITE_AIPP_NOT_SUPPORTED) {
        ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常接口测试：不支持设备OH_AI_ModelPredictWithConfig接口调用
/**
 * @tc.name   SUBAIMindSporeAIPP0008
 * @tc.number SUBAIMindSporeAIPP0008
 * @tc.desc   SUBAIMindSporeAIPP0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0008()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray{};
    CreateAIPPModelData(model, &inTensorArray);
    FillInputsData(inTensorArray, "two_add_operators", false);
    OH_AI_TensorHandleArray outputs;
    const char* predictConfig =
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=0,load_start_pos_h=0,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216!"
        "input_para:src_h=800,src_w=800;swap_func:rbuv_swap_switch=false,ax_swap_switch=false;crop_func:load_start_pos_"
        "w=80,load_start_pos_h=80,crop_size_w=640,crop_size_h=640;dtc_func:mean_chn_0=0,mean_chn_1=0,mean_chn_2=0,min_"
        "chn_0=0,min_chn_1=0,min_chn_2=0,var_reci_chn_0=0.0039216,var_reci_chn_1=0.0039216,var_reci_chn_2=0.0039216";
    OH_AI_Status predictRet =
        OH_AI_ModelPredictWithConfig(model, inTensorArray, &outputs, predictConfig, nullptr, nullptr);
    if (predictRet != OH_AI_STATUS_LITE_AIPP_NOT_SUPPORTED) {
        ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常接口测试：扩展配置接口传入错误的AIPP前处理参数
/**
 * @tc.name   SUBAIMindSporeAIPP0009
 * @tc.number SUBAIMindSporeAIPP0009
 * @tc.desc   SUBAIMindSporeAIPP0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0009()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config_error.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常接口测试：OH_AI_ModelPredictWithConfig接口传入错误的predictConfig
/**
 * @tc.name   SUBAIMindSporeAIPP0010
 * @tc.number SUBAIMindSporeAIPP0010
 * @tc.desc   SUBAIMindSporeAIPP0010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeAIPP0010()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    string aippPath = FilePath("two_add_operators_config.json");
    AddContextDeviceAIPP(context, aippPath);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("two_add_operators.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray{};
    CreateAIPPModelData(model, &inTensorArray);
    FillInputsData(inTensorArray, "two_add_operators", false);
    OH_AI_TensorHandleArray outputs;
    const char* predictConfig = "input_para_error:src_h=800,src_w=800;";
    OH_AI_Status predictRet =
        OH_AI_ModelPredictWithConfig(model, inTensorArray, &outputs, predictConfig, nullptr, nullptr);
    if (predictRet != OH_AI_STATUS_LITE_AIPP_NOT_SUPPORTED) {
        ASSERT_EQ(predictRet, OH_AI_STATUS_LITE_AIPP_INFER_ERROR);
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
} // namespace MindSpore
} // namespace Acts
