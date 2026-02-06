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
constexpr size_t MAX_DIMS = 10;

void DestroyTensorArray(OH_AI_TensorHandleArray* tensorArray)
{
    if (tensorArray == nullptr || tensorArray->handle_list == nullptr) {
        return;
    }
    for (size_t i = 0; i < tensorArray->handle_num; i++) {
        auto tensor = tensorArray->handle_list[i];
        OH_AI_TensorDestroy(&tensor);
    }
    free(tensorArray->handle_list);
    tensorArray->handle_list = nullptr;
    tensorArray->handle_num = 0;
}

OH_AI_TensorHandle CreateTensorLike(const OH_AI_TensorHandle oriTensor, bool setAllocator)
{
    size_t shapeNum;
    int64_t shape[MAX_DIMS];
    auto shapePtr = OH_AI_TensorGetShape(oriTensor, &shapeNum);
    for (size_t j = 0; j < shapeNum; j++) {
        shape[j] = shapePtr[j];
    }
    void* allocator = OH_AI_TensorGetAllocator(oriTensor);
    OH_AI_TensorHandle newTensor = OH_AI_TensorCreate(
        OH_AI_TensorGetName(oriTensor), OH_AI_TensorGetDataType(oriTensor), shape, shapeNum, nullptr, 0);
    if (setAllocator) {
        OH_AI_TensorSetAllocator(newTensor, allocator);
    }
    return newTensor;
}

void BuildTensorArray(OH_AI_ModelHandle model,
                      OH_AI_TensorHandleArray* inTensorArray,
                      OH_AI_TensorHandleArray* outTensorArray,
                      bool setAllocator)
{
    OH_AI_TensorHandleArray inputsHandle = OH_AI_ModelGetInputs(model);
    inTensorArray->handle_num = inputsHandle.handle_num;
    inTensorArray->handle_list =
        static_cast<OH_AI_TensorHandle*>(malloc(sizeof(OH_AI_TensorHandle) * inTensorArray->handle_num));
    for (size_t i = 0; i < inputsHandle.handle_num; i++) {
        inTensorArray->handle_list[i] = CreateTensorLike(inputsHandle.handle_list[i], setAllocator);
    }

    OH_AI_TensorHandleArray outputsHandle = OH_AI_ModelGetOutputs(model);
    outTensorArray->handle_num = outputsHandle.handle_num;
    outTensorArray->handle_list =
        static_cast<OH_AI_TensorHandle*>(malloc(sizeof(OH_AI_TensorHandle) * outTensorArray->handle_num));
    for (size_t i = 0; i < outputsHandle.handle_num; i++) {
        outTensorArray->handle_list[i] = CreateTensorLike(outputsHandle.handle_list[i], setAllocator);
    }
}

void PredictLoopAndCompare(OH_AI_ModelHandle model,
                           OH_AI_TensorHandleArray inputs,
                           OH_AI_TensorHandleArray& outputs,
                           const std::string& modelName,
                           size_t loopCount)
{
    for (size_t i = 0; i < loopCount; ++i) {
        OHPrintf("==========OH_AI_ModelPredict==========\n");
        auto ret = OH_AI_ModelPredict(model, inputs, &outputs, NULL, NULL);
        ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
        CompareResult(outputs, modelName);
    }
}
} // namespace

void RunMSLiteModel(OH_AI_ModelHandle model, string modelName, bool isTranspose)
{
    OH_AI_TensorHandleArray inTensorArray{};
    OH_AI_TensorHandleArray outTensorArray{};
    OHPrintf("==========OH_AI_TensorSetAllocator inTensor==========\n");
    BuildTensorArray(model, &inTensorArray, &outTensorArray, true);
    OHPrintf("==========FillInputsData==========\n");
    FillInputsData(inTensorArray, modelName, isTranspose);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    auto ret = OH_AI_ModelPredict(model, inTensorArray, &outTensorArray, NULL, NULL);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_TensorDestroy==========\n");
    CompareResult(outTensorArray, modelName);
    DestroyTensorArray(&inTensorArray);
    DestroyTensorArray(&outTensorArray);
}

void CopyFreeSetAllocator(OH_AI_ModelHandle model,
                          OH_AI_TensorHandleArray* inTensorArray,
                          OH_AI_TensorHandleArray* outTensorArray)
{
    BuildTensorArray(model, inTensorArray, outTensorArray, true);
}

// 正常场景：CPU免拷贝场景，并循环推理
/**
 * @tc.name   SUBAIMindSporeCPUCopyFree0002
 * @tc.number SUBAIMindSporeCPUCopyFree0002
 * @tc.desc   SUBAIMindSporeCPUCopyFree0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeCPUCopyFree0002()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);

    OH_AI_TensorHandleArray inTensorArray;
    OH_AI_TensorHandleArray outTensorArray;
    OHPrintf("==========OH_AI_TensorSetAllocator inTensor==========\n");
    CopyFreeSetAllocator(model, &inTensorArray, &outTensorArray);
    OHPrintf("==========FillInputsData==========\n");
    FillInputsData(inTensorArray, "ml_face_isface", true);
    PredictLoopAndCompare(
        model, inTensorArray, outTensorArray, "ml_face_isface", ActsMindSporeValues::DEFAULT_PREDICT_LOOP);
    OHPrintf("==========OH_AI_TensorDestroy==========\n");
    DestroyTensorArray(&inTensorArray);
    DestroyTensorArray(&outTensorArray);
    OHPrintf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

void CopyFreeNoSetAllocator(OH_AI_ModelHandle model,
                            OH_AI_TensorHandleArray* inTensorArray,
                            OH_AI_TensorHandleArray* outTensorArray)
{
    BuildTensorArray(model, inTensorArray, outTensorArray, false);
}

// 正常场景：CPU免拷贝场景，不调用OH_AI_TensorSetAllocator
/**
 * @tc.name   SUBAIMindSporeCPUCopyFree0003
 * @tc.number SUBAIMindSporeCPUCopyFree0003
 * @tc.desc   SUBAIMindSporeCPUCopyFree0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeCPUCopyFree0003()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray;
    OH_AI_TensorHandleArray outTensorArray;
    OHPrintf("==========OH_AI_TensorSetAllocator inTensor==========\n");
    CopyFreeNoSetAllocator(model, &inTensorArray, &outTensorArray);
    OHPrintf("==========FillInputsData==========\n");
    FillInputsData(inTensorArray, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    auto predictRet = OH_AI_ModelPredict(model, inTensorArray, &outTensorArray, NULL, NULL);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(outTensorArray, "ml_face_isface");
    OHPrintf("==========OH_AI_TensorDestroy==========\n");
    DestroyTensorArray(&inTensorArray);
    DestroyTensorArray(&outTensorArray);
    OHPrintf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：CPU免拷贝场景，不调用OH_AI_TensorSetAllocator，并循环推理
/**
 * @tc.name   SUBAIMindSporeCPUCopyFree0004
 * @tc.number SUBAIMindSporeCPUCopyFree0004
 * @tc.desc   SUBAIMindSporeCPUCopyFree0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeCPUCopyFree0004()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray;
    OH_AI_TensorHandleArray outTensorArray;
    OHPrintf("==========OH_AI_TensorSetAllocator inTensor==========\n");
    CopyFreeNoSetAllocator(model, &inTensorArray, &outTensorArray);
    OHPrintf("==========FillInputsData==========\n");
    FillInputsData(inTensorArray, "ml_face_isface", true);
    PredictLoopAndCompare(
        model, inTensorArray, outTensorArray, "ml_face_isface", ActsMindSporeValues::DEFAULT_PREDICT_LOOP);
    OHPrintf("==========OH_AI_TensorDestroy==========\n");
    DestroyTensorArray(&inTensorArray);
    DestroyTensorArray(&outTensorArray);
    OHPrintf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：通过OH_AI_TensorCreate创建输入输出tensor，实现数据免拷贝, CPU后端场景
/**
 * @tc.name   SUBAIMindSporeCPUCopyFree0001
 * @tc.number SUBAIMindSporeCPUCopyFree0001
 * @tc.desc   SUBAIMindSporeCPUCopyFree0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeCPUCopyFree0001()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    RunMSLiteModel(model, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：通过OH_AI_ModelGetInputs和OH_AI_ModelGetOutputs获取，实现数据免拷贝
/**
 * @tc.name   SUBAIMindSporeNNRTCopyFree0001
 * @tc.number SUBAIMindSporeNNRTCopyFree0001
 * @tc.desc   SUBAIMindSporeNNRTCopyFree0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCopyFree0001()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}


// 正常场景：通过OH_AI_TensorCreate创建输入输出tensor，实现数据免拷贝
/**
 * @tc.name   SUBAIMindSporeNNRTCopyFree0002
 * @tc.number SUBAIMindSporeNNRTCopyFree0002
 * @tc.desc   SUBAIMindSporeNNRTCopyFree0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCopyFree0002()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    RunMSLiteModel(model, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：OH_AI_TensorSetAllocator设置空指针
/**
 * @tc.name   SUBAIMindSporeNNRTCopyFree0003
 * @tc.number SUBAIMindSporeNNRTCopyFree0003
 * @tc.desc   SUBAIMindSporeNNRTCopyFree0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCopyFree0003()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputsHandle = OH_AI_ModelGetInputs(model);
    OH_AI_TensorHandleArray inTensorArray{};
    inTensorArray.handle_num = inputsHandle.handle_num;
    inTensorArray.handle_list =
        static_cast<OH_AI_TensorHandle*>(malloc(sizeof(OH_AI_TensorHandle) * inTensorArray.handle_num));
    for (size_t i = 0; i < inputsHandle.handle_num; i++) {
        auto oriTensor = inputsHandle.handle_list[i];
        OH_AI_TensorHandle inTensor = CreateTensorLike(oriTensor, false);
        OH_AI_Status setRet = OH_AI_TensorSetAllocator(inTensor, nullptr);
        ASSERT_EQ(setRet, OH_AI_STATUS_LITE_PARAM_INVALID);
        inTensorArray.handle_list[i] = inTensor;
    }
    DestroyTensorArray(&inTensorArray);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：npu循环推理
/**
 * @tc.name   SUBAIMindSporeNNRTCopyFree0004
 * @tc.number SUBAIMindSporeNNRTCopyFree0004
 * @tc.desc   SUBAIMindSporeNNRTCopyFree0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCopyFree0004()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    PredictLoopAndCompare(model, inputs, outputs, "ml_face_isface", ActsMindSporeValues::DEFAULT_PREDICT_LOOP);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：npu免拷贝场景循环推理
/**
 * @tc.name   SUBAIMindSporeNNRTCopyFree0005
 * @tc.number SUBAIMindSporeNNRTCopyFree0005
 * @tc.desc   SUBAIMindSporeNNRTCopyFree0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCopyFree0005()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray;
    OH_AI_TensorHandleArray outTensorArray;
    OHPrintf("==========OH_AI_TensorSetAllocator inTensor==========\n");
    CopyFreeSetAllocator(model, &inTensorArray, &outTensorArray);
    OHPrintf("==========FillInputsData==========\n");
    FillInputsData(inTensorArray, "ml_face_isface", true);
    PredictLoopAndCompare(
        model, inTensorArray, outTensorArray, "ml_face_isface", ActsMindSporeValues::DEFAULT_PREDICT_LOOP);
    OHPrintf("==========OH_AI_TensorDestroy==========\n");
    DestroyTensorArray(&inTensorArray);
    DestroyTensorArray(&outTensorArray);
    OHPrintf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：npu免拷贝场景，不调用OH_AI_TensorSetAllocator
/**
 * @tc.name   SUBAIMindSporeNNRTCopyFree0006
 * @tc.number SUBAIMindSporeNNRTCopyFree0006
 * @tc.desc   SUBAIMindSporeNNRTCopyFree0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCopyFree0006()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray inTensorArray;
    OH_AI_TensorHandleArray outTensorArray;
    OHPrintf("==========OH_AI_TensorSetAllocator inTensor==========\n");
    CopyFreeNoSetAllocator(model, &inTensorArray, &outTensorArray);
    OHPrintf("==========FillInputsData==========\n");
    FillInputsData(inTensorArray, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    auto predictRet = OH_AI_ModelPredict(model, inTensorArray, &outTensorArray, NULL, NULL);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(outTensorArray, "ml_face_isface");
    OHPrintf("==========OH_AI_TensorDestroy==========\n");
    DestroyTensorArray(&inTensorArray);
    DestroyTensorArray(&outTensorArray);
    OHPrintf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：npu免拷贝场景，不调用OH_AI_TensorSetAllocator，并循环推理
/**
 * @tc.name   SUBAIMindSporeNNRTCopyFree0007
 * @tc.number SUBAIMindSporeNNRTCopyFree0007
 * @tc.desc   SUBAIMindSporeNNRTCopyFree0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCopyFree0007()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceNNRT(context);
    OHPrintf("==========Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);

    OH_AI_TensorHandleArray inTensorArray;
    OH_AI_TensorHandleArray outTensorArray;
    OHPrintf("==========OH_AI_TensorSetAllocator inTensor==========\n");
    CopyFreeNoSetAllocator(model, &inTensorArray, &outTensorArray);
    OHPrintf("==========FillInputsData==========\n");
    FillInputsData(inTensorArray, "ml_face_isface", true);
    PredictLoopAndCompare(
        model, inTensorArray, outTensorArray, "ml_face_isface", ActsMindSporeValues::DEFAULT_PREDICT_LOOP);
    OHPrintf("==========OH_AI_TensorDestroy==========\n");
    DestroyTensorArray(&inTensorArray);
    DestroyTensorArray(&outTensorArray);
    OHPrintf("==========ContextDestroy and ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// add nnrt hiai device info
void AddContextDeviceHIAI(OH_AI_ContextHandle context)
{
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    auto status = OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
}

// 异常场景：HIAI流程，离线模型支持NNRT后端,Model创建一次，Build多次
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0004
 * @tc.number SUBAIMindSporeHIAIOfflineModel0004
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0004()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceHIAI(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret2 =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret2, OH_AI_STATUS_LITE_MODEL_REBUILD);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：HIAI流程，离线模型支持NNRT后端,ModelPredict，input为空
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0005
 * @tc.number SUBAIMindSporeHIAIOfflineModel0005
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0005()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceHIAI(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray inputs{ .handle_num = 0, .handle_list = nullptr };
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：HIAI流程，非离线模型支持NNRT后端,ms模型未转换为NNRT后端模型
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0006
 * @tc.number SUBAIMindSporeHIAIOfflineModel0006
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0006()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceHIAI(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：HIAI流程，离线模型配置量化参数
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0007
 * @tc.number SUBAIMindSporeHIAIOfflineModel0007
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0007()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model_param").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantConfigData", quantConfig, qSize);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "test_model", ActsMindSporeValues::DEFAULT_TOLERANCE, ActsMindSporeValues::DEFAULT_TOLERANCE, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：HIAI流程，设置量化配置QuantConfigData为空指针时等于不量化
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0008
 * @tc.number SUBAIMindSporeHIAIOfflineModel0008
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0008()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantConfigData", nullptr, 0);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "test_model", ActsMindSporeValues::DEFAULT_TOLERANCE, ActsMindSporeValues::DEFAULT_TOLERANCE, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：HIAI流程，设置量化配置QuantConfigData为错误配置文件
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0009
 * @tc.number SUBAIMindSporeHIAIOfflineModel0009
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0009()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model.om.ms").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantConfigData", quantConfig, qSize);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：HIAI流程，设置量化q_size为异常值
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0010
 * @tc.number SUBAIMindSporeHIAIOfflineModel0010
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0010()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model_param").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantConfigData", quantConfig, 0);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：HIAI流程，设置 NPU 和外围输入/输出(I/O)设备的带宽模式BandMode模式为HIAI_BANDMODE_NORMAL
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0011
 * @tc.number SUBAIMindSporeHIAIOfflineModel0011
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0011()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_NORMAL";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model_param").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantConfigData", quantConfig, qSize);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "test_model", ActsMindSporeValues::DEFAULT_TOLERANCE, ActsMindSporeValues::DEFAULT_TOLERANCE, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：HIAI流程，设置 NPU 和外围输入/输出(I/O)设备的带宽模式BandMode模式为HIAI_BANDMODE_LOW
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0012
 * @tc.number SUBAIMindSporeHIAIOfflineModel0012
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0012()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_LOW";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model_param").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantConfigData", quantConfig, qSize);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "test_model", ActsMindSporeValues::DEFAULT_TOLERANCE, ActsMindSporeValues::DEFAULT_TOLERANCE, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：HIAI流程，设置 NPU 和外围输入/输出(I/O)设备的带宽模式BandMode模式为HIAI_BANDMODE_UNSET
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0013
 * @tc.number SUBAIMindSporeHIAIOfflineModel0013
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0013
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0013()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_UNSET";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model_param").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantConfigData", quantConfig, qSize);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "test_model", ActsMindSporeValues::DEFAULT_TOLERANCE, ActsMindSporeValues::DEFAULT_TOLERANCE, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：HIAI流程，设置 NPU 和外围输入/输出(I/O)设备的带宽模式BandMode模式为HIAI_BANDMODE_HIGH
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0014
 * @tc.number SUBAIMindSporeHIAIOfflineModel0014
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0014
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0014()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model_param").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantConfigData", quantConfig, qSize);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "test_model", ActsMindSporeValues::DEFAULT_TOLERANCE, ActsMindSporeValues::DEFAULT_TOLERANCE, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：HIAI流程，离线模型配置量化参数QuantBuffer
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0015
 * @tc.number SUBAIMindSporeHIAIOfflineModel0015
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0015
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0015()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model_param").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantBuffer", quantConfig, qSize);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "test_model", ActsMindSporeValues::DEFAULT_TOLERANCE, ActsMindSporeValues::DEFAULT_TOLERANCE, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：HIAI流程，设置量化配置QuantBuffer为空指针时等于不量化
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0016
 * @tc.number SUBAIMindSporeHIAIOfflineModel0016
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0016
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0016()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantBuffer", nullptr, 0);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "test_model", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "test_model", ActsMindSporeValues::DEFAULT_TOLERANCE, ActsMindSporeValues::DEFAULT_TOLERANCE, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：HIAI流程，设置量化配置QuantBuffer为错误配置文件
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0017
 * @tc.number SUBAIMindSporeHIAIOfflineModel0017
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0017
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0017()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model.om.ms").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantBuffer", quantConfig, qSize);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：HIAI流程，设置量化QuantBufferq_size为异常值
/**
 * @tc.name   SUBAIMindSporeHIAIOfflineModel0018
 * @tc.number SUBAIMindSporeHIAIOfflineModel0018
 * @tc.desc   SUBAIMindSporeHIAIOfflineModel0018
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeHIAIOfflineModel0018()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    std::cout << "found " << num << " nnrt devices" << std::endl;
    NNRTDeviceDesc* desc1 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strcmp(name, "HIAI_F") == 0) {
            desc1 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }

    auto id1 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc1);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id1);
    const char* bandMode = "HIAI_BANDMODE_HIGH";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "BandMode", bandMode, strlen(bandMode));
    size_t qSize;
    char* quantConfig = ReadFile(FilePath("test_model_param").c_str(), &qSize);
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "QuantBuffer", quantConfig, 0);

    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("test_model.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：context配置cache信息，执行推理流程
/**
 * @tc.name   SUBAIMindSporeNNRTCache0001
 * @tc.number SUBAIMindSporeNNRTCache0001
 * @tc.desc   SUBAIMindSporeNNRTCache0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCache0001()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc0);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id0);
    const char* cachePath = ActsMindSporeConstants::CACHE_DIR.c_str();
    const char* cacheVersion = "1";
    const char* modelName = "cache_model";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CachePath", cachePath, strlen(cachePath));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CacheVersion", cacheVersion, strlen(cacheVersion));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "ModelName", modelName, strlen(modelName));
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    uint64_t timeStartPrepare = GetTimeInUs();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    uint64_t timeEndPrepare = GetTimeInUs();
    float initSessionTimeOnce = (timeEndPrepare - timeStartPrepare) / 1000.0;
    std::cout << "initSessionTimeOnce: " << initSessionTimeOnce << std::endl;
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs,
                  "ml_face_isface",
                  ActsMindSporeValues::DEFAULT_TOLERANCE,
                  ActsMindSporeValues::DEFAULT_TOLERANCE,
                  true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：context配置cache信息，量化模型执行推理流程
/**
 * @tc.name   SUBAIMindSporeNNRTCache0002
 * @tc.number SUBAIMindSporeNNRTCache0002
 * @tc.desc   SUBAIMindSporeNNRTCache0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCache0002()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc0);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id0);
    const char* cachePath = ActsMindSporeConstants::CACHE_DIR.c_str();
    const char* cacheVersion = "1";
    const char* modelName = "cache_model_quant";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CachePath", cachePath, strlen(cachePath));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CacheVersion", cacheVersion, strlen(cacheVersion));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "ModelName", modelName, strlen(modelName));
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface_quant.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface_quant", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs,
                  "ml_face_isface_quant",
                  ActsMindSporeValues::DEFAULT_TOLERANCE,
                  ActsMindSporeValues::DEFAULT_TOLERANCE,
                  true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

void AddContextCacheDiffPath(OH_AI_ContextHandle context, const char* modelName)
{
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc0);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id0);
    const char* cachePath = ActsMindSporeConstants::CACHE_DIR.c_str();
    const char* cacheVersion = "1";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CachePath", cachePath, strlen(cachePath));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CacheVersion", cacheVersion, strlen(cacheVersion));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "ModelName", modelName, strlen(modelName));
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
}

// 正常场景：多个不同模型在同一路径下缓存，执行推理流程
/**
 * @tc.name   SUBAIMindSporeNNRTCache0003
 * @tc.number SUBAIMindSporeNNRTCache0003
 * @tc.desc   SUBAIMindSporeNNRTCache0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCache0003()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextCacheDiffPath(context, "cache_a");
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_ocr_cn.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    AddContextCacheDiffPath(context2, "cache_b");
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_Status ret2 =
        OH_AI_ModelBuildFromFile(model2, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(ret2, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_ocr_cn", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "ml_ocr_cn", ActsMindSporeValues::DEFAULT_TOLERANCE, ActsMindSporeValues::DEFAULT_TOLERANCE, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OHPrintf("==========GetInputs2==========\n");
    OH_AI_TensorHandleArray inputs2 = OH_AI_ModelGetInputs(model2);
    ASSERT_NE(inputs2.handle_list, nullptr);
    FillInputsData(inputs2, "ml_face_isface", true);
    OHPrintf("==========Model Predict2==========\n");
    OH_AI_TensorHandleArray outputs2;
    OH_AI_Status predictRet2 = OH_AI_ModelPredict(model2, inputs2, &outputs2, nullptr, nullptr);
    ASSERT_EQ(predictRet2, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs2,
                  "ml_face_isface",
                  ActsMindSporeValues::DEFAULT_TOLERANCE,
                  ActsMindSporeValues::DEFAULT_TOLERANCE,
                  true);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model2);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：CachePath路径非法值或不存在
/**
 * @tc.name   SUBAIMindSporeNNRTCache0004
 * @tc.number SUBAIMindSporeNNRTCache0004
 * @tc.desc   SUBAIMindSporeNNRTCache0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCache0004()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc0);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id0);
    const std::string notExistPath = ActsMindSporeConstants::CACHE_DIR + "notexist/";
    const char* cachePath = notExistPath.c_str();
    const char* cacheVersion = "1";
    const char* modelName = "cache_error";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CachePath", cachePath, strlen(cachePath));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CacheVersion", cacheVersion, strlen(cacheVersion));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "ModelName", modelName, strlen(modelName));
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：CacheVersion在取值范围外
/**
 * @tc.name   SUBAIMindSporeNNRTCache0005
 * @tc.number SUBAIMindSporeNNRTCache0005
 * @tc.desc   SUBAIMindSporeNNRTCache0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCache0005()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc0);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id0);
    const char* cachePath = ActsMindSporeConstants::CACHE_DIR.c_str();
    const char* cacheVersion = "-1";
    const char* modelName = "cache_error";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CachePath", cachePath, strlen(cachePath));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CacheVersion", cacheVersion, strlen(cacheVersion));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "ModelName", modelName, strlen(modelName));
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// add cpu device info
void AddContextCache(OH_AI_ContextHandle context)
{
    auto nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    auto desc0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, 0);
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc0);
    std::cout << "OH_AI_GetNameFromNNRTDeviceDesc: " << name << std::endl;
    auto id0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc0);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id0);
    const char* cachePath = ActsMindSporeConstants::CACHE_DIR.c_str();
    const char* cacheVersion = "1";
    const char* modelName = "cache_same";
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CachePath", cachePath, strlen(cachePath));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "CacheVersion", cacheVersion, strlen(cacheVersion));
    OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "ModelName", modelName, strlen(modelName));
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
}

// 异常场景：a模型生成缓存，b模型用相同的CachePath、CacheVersion、modelname
/**
 * @tc.name   SUBAIMindSporeNNRTCache0006
 * @tc.number SUBAIMindSporeNNRTCache0006
 * @tc.desc   SUBAIMindSporeNNRTCache0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeNNRTCache0006()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextCache(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    AddContextCache(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_Status ret2 =
        OH_AI_ModelBuildFromFile(model2, FilePath("ml_ocr_cn.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(ret2, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs,
                  "ml_face_isface",
                  ActsMindSporeValues::DEFAULT_TOLERANCE,
                  ActsMindSporeValues::DEFAULT_TOLERANCE,
                  true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OHPrintf("==========GetInputs2==========\n");
    OH_AI_TensorHandleArray inputs2 = OH_AI_ModelGetInputs(model2);
    ASSERT_NE(inputs2.handle_list, nullptr);
    FillInputsData(inputs2, "ml_ocr_cn", true);
    OHPrintf("==========Model Predict2==========\n");
    OH_AI_TensorHandleArray outputs2;
    OH_AI_Status predictRet2 = OH_AI_ModelPredict(model2, inputs2, &outputs2, nullptr, nullptr);
    ASSERT_EQ(predictRet2, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model2);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：delegate异构，使用低级接口创建nnrt device info，选取第一个NNRT设备
/**
 * @tc.name   OHOSNNRT0001
 * @tc.number OHOSNNRT0001
 * @tc.desc   OHOSNNRT0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSNNRT0001()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

//  正常场景：delegate异构，使用高级接口创建nnrt device info，根据类型确定NNRT设备
/**
 * @tc.name   OHOSNNRT0002
 * @tc.number OHOSNNRT0002
 * @tc.desc   OHOSNNRT0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSNNRT0002()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRTByType(context);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：delegate异构，使用高级接口创建nnrt device info，根据名称确定NNRT设备
/**
 * @tc.name   OHOSNNRT0003
 * @tc.number OHOSNNRT0003
 * @tc.desc   OHOSNNRT0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSNNRT0003()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRTByName(context);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：delegate异构，设置NNRT扩展选项，包括cache路径
/**
 * @tc.name   OHOSNNRT0005
 * @tc.number OHOSNNRT0005
 * @tc.desc   OHOSNNRT0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSNNRT0005()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRTWithCache(context, ActsMindSporeConstants::CACHE_DIR.c_str(), "1");
    AddContextDeviceCPU(context);

    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);

    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);

    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);

    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}


// 正常场景：NPU权重量化模型
/**
 * @tc.name   OHOSNNRTQUANT0001
 * @tc.number OHOSNNRTQUANT0001
 * @tc.desc   OHOSNNRTQUANT0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSNNRTQUANT0001()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface_quant", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

} // namespace MindSpore
} // namespace Acts
