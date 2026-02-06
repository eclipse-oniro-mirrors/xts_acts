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
char* LoadInputBuffer(const std::string& fileName, size_t* size)
{
    char* buffer = ReadFile(FilePath(fileName.c_str()).c_str(), size);
    ASSERT_NE(buffer, nullptr);
    return buffer;
}

void FillUint8Inputs(OH_AI_TensorHandleArray inputs, const char* imageBuf, size_t size1)
{
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = inputs.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
        void* inputData = OH_AI_TensorGetMutableData(tensor);
        ASSERT_NE(inputData, nullptr);
        SafeMemcpy(inputData, size1, imageBuf, size1);
    }
}

void VerifyUint8Outputs(OH_AI_TensorHandleArray outputs, const std::string& expectedPrefix)
{
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
        uint8_t* outputData = reinterpret_cast<uint8_t*>(OH_AI_TensorGetMutableData(tensor));
        OHPrintf("output data is:");
        for (int j = 0; j < elementNum && j <= ActsMindSporeValues::OUTPUT_PRINT_LIMIT; ++j) {
            OHPrintf("%d ", outputData[j]);
        }
        OHPrintf("\n==========CompFp32WithTData==========\n");
        std::string expectedDataFile = expectedPrefix + std::to_string(i) + ".output";
        bool result = CompUint8WithTData(outputData,
                                         expectedDataFile,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         false);
        ASSERT_EQ(result, true);
    }
}
} // namespace

// 正常场景：单输入模型
/**
 * @tc.name   OHOSInput0001
 * @tc.number OHOSInput0001
 * @tc.desc   OHOSInput0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSInput0001()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：多输入模型
/**
 * @tc.name   OHOSInput0002
 * @tc.number OHOSInput0002
 * @tc.desc   OHOSInput0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSInput0002()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_headpose_pb2tflite.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_headpose_pb2tflite", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "ml_headpose_pb2tflite", ActsMindSporeValues::STRICT_TOLERANCE, ActsMindSporeValues::STRICT_TOLERANCE);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：输入为uint8模型
/**
 * @tc.name   OHOSInput0003
 * @tc.number OHOSInput0003
 * @tc.desc   OHOSInput0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSInput0003()
{
    size_t size1;
    char* imageBuf = LoadInputBuffer("aiy_vision_classifier_plants_V1_3.input", &size1);
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    AddContextDeviceCPU(context);
    OHPrintf("==========Create and Build model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(
        model, FilePath("aiy_vision_classifier_plants_V1_3.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillUint8Inputs(inputs, imageBuf, size1);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetOutput==========\n");
    VerifyUint8Outputs(outputs, FilePath("aiy_vision_classifier_plants_V1_3"));
    delete[] imageBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：量化模型
/**
 * @tc.name   OHOSInput0004
 * @tc.number OHOSInput0004
 * @tc.desc   OHOSInput0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSInput0004()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface_quant", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：循环多次执行推理流程
/**
 * @tc.name   OHOSMultiple0001
 * @tc.number OHOSMultiple0001
 * @tc.desc   OHOSMultiple0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSMultiple0001()
{
    for (size_t num = 0; num < ActsMindSporeValues::DEFAULT_PREDICT_LOOP; ++num) {
        PredictCPU();
    }
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：Model创建一次，Build多次
/**
 * @tc.name   OHOSMultiple0002
 * @tc.number OHOSMultiple0002
 * @tc.desc   OHOSMultiple0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSMultiple0002()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    int ret = OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Build model==========\n");
    int ret2 = OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret2);
    ASSERT_EQ(ret2, OH_AI_STATUS_LITE_MODEL_REBUILD);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Model创建一次,Build一次，Predict多次
/**
 * @tc.name   OHOSMultiple0003
 * @tc.number OHOSMultiple0003
 * @tc.desc   OHOSMultiple0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSMultiple0003()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
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
    OH_AI_TensorHandleArray outputs;
    for (size_t i = 0; i < ActsMindSporeValues::DEFAULT_PREDICT_LOOP; ++i) {
        OHPrintf("==========Model Predict==========\n");
        OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
        ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    }
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：多次创建和销毁Model
/**
 * @tc.name   OHOSMultiple0004
 * @tc.number OHOSMultiple0004
 * @tc.desc   OHOSMultiple0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSMultiple0004()
{
    for (size_t i = 0; i < ActsMindSporeValues::DEFAULT_PREDICT_LOOP; ++i) {
        OHPrintf("==========Init Context==========\n");
        OH_AI_ContextHandle context = OH_AI_ContextCreate();
        ASSERT_NE(context, nullptr);
        AddContextDeviceCPU(context);
        OHPrintf("==========Create model==========\n");
        OH_AI_ModelHandle model = OH_AI_ModelCreate();
        ASSERT_NE(model, nullptr);
        OHPrintf("==========Build model==========\n");
        OH_AI_Status ret =
            OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
        OHPrintf("==========build model return code:%d\n", ret);
        ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
        OHPrintf("==========Build model==========\n");
        OH_AI_ContextDestroy(&context);
        OH_AI_ModelDestroy(&model);
    }
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：两个模型都在CPU上并行推理
/**
 * @tc.name   OHOSParallel0001
 * @tc.number OHOSParallel0001
 * @tc.desc   OHOSParallel0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSParallel0001()
{
    std::cout << "run start" << std::endl;
    std::thread t1(PredictCPU);
    std::cout << "1111111111111" << std::endl;
    std::thread t2(PredictCPU);
    std::cout << "2222222222222" << std::endl;
    t1.join();
    t2.join();
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：两个模型都在NPU上并行推理
/**
 * @tc.name   OHOSParallel0002
 * @tc.number OHOSParallel0002
 * @tc.desc   OHOSParallel0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSParallel0002()
{
    std::cout << "run start" << std::endl;
    std::thread t1(PredictNPU);
    std::cout << "1111111111111" << std::endl;
    std::thread t2(PredictNPU);
    std::cout << "2222222222222" << std::endl;
    t1.join();
    t2.join();
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：两个模型在CPU NPU上并行推理
/**
 * @tc.name   OHOSParallel0003
 * @tc.number OHOSParallel0003
 * @tc.desc   OHOSParallel0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSParallel0003()
{
    std::cout << "run start" << std::endl;
    std::thread t1(PredictCPU);
    std::cout << "1111111111111" << std::endl;
    std::thread t2(PredictNPU);
    std::cout << "2222222222222" << std::endl;
    t1.join();
    t2.join();
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：r1.3转换的模型在r1.5上推理
/**
 * @tc.name   OHOSCompatible0001
 * @tc.number OHOSCompatible0001
 * @tc.desc   OHOSCompatible0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSCompatible0001()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface_r13.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
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

// 正常场景：离线模型支持NNRT后端，单模型输入
/**
 * @tc.name   OHOSOfflineModel0001
 * @tc.number OHOSOfflineModel0001
 * @tc.desc   OHOSOfflineModel0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSOfflineModel0001()
{
    if (!IsNNRTAvailable()) {
        OHPrintf("NNRt is not available, skip this test");
        return OH_AI_STATUS_SUCCESS;
    }

    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(
        model, FilePath("ml_face_isface_offline_model.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
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

// 正常场景：离线模型支持NNRT后端,多输入模型
/**
 * @tc.name   OHOSOfflineModel0002
 * @tc.number OHOSOfflineModel0002
 * @tc.desc   OHOSOfflineModel0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSOfflineModel0002()
{
    if (!IsNNRTAvailable()) {
        OHPrintf("NNRt is not available, skip this test");
        return OH_AI_STATUS_SUCCESS;
    }

    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(
        model, FilePath("ml_headpose_pb2tflite_offline_model.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_headpose_pb2tflite", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(
        outputs, "ml_headpose_pb2tflite", ActsMindSporeValues::STRICT_TOLERANCE, ActsMindSporeValues::STRICT_TOLERANCE);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：离线模型支持NNRT后端,Model创建一次,Build一次，Predict多次
/**
 * @tc.name   OHOSOfflineModel0004
 * @tc.number OHOSOfflineModel0004
 * @tc.desc   OHOSOfflineModel0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSOfflineModel0004()
{
    if (!IsNNRTAvailable()) {
        OHPrintf("NNRt is not available, skip this test");
        return OH_AI_STATUS_SUCCESS;
    }

    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(
        model, FilePath("ml_face_isface_offline_model.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OH_AI_TensorHandleArray outputs;
    for (size_t i = 0; i < ActsMindSporeValues::DEFAULT_PREDICT_LOOP; ++i) {
        OHPrintf("==========Model Predict==========\n");
        OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
        ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    }
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：离线模型支持NNRT后端,Model创建一次，Build多次
/**
 * @tc.name   OHOSOfflineModel0005
 * @tc.number OHOSOfflineModel0005
 * @tc.desc   OHOSOfflineModel0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSOfflineModel0005()
{
    if (!IsNNRTAvailable()) {
        OHPrintf("NNRt is not available, skip this test");
        return OH_AI_STATUS_SUCCESS;
    }

    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    int ret = OH_AI_ModelBuildFromFile(
        model, FilePath("ml_face_isface_offline_model.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Build model==========\n");
    int ret2 = OH_AI_ModelBuildFromFile(
        model, FilePath("ml_face_isface_offline_model.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret2);
    ASSERT_EQ(ret2, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：离线模型支持NNRT后端,ModelPredict，input为空
/**
 * @tc.name   OHOSOfflineModel0006
 * @tc.number OHOSOfflineModel0006
 * @tc.desc   OHOSOfflineModel0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSOfflineModel0006()
{
    if (!IsNNRTAvailable()) {
        OHPrintf("NNRt is not available, skip this test");
        return OH_AI_STATUS_SUCCESS;
    }

    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(
        model, FilePath("ml_face_isface_offline_model.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray inputs;
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    OHPrintf("==========Model Predict return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：非离线模型支持NNRT后端,ms模型未转换为NNRT后端模型
/**
 * @tc.name   OHOSOfflineModel0007
 * @tc.number OHOSOfflineModel0007
 * @tc.desc   OHOSOfflineModel0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSOfflineModel0007()
{
    if (!IsNNRTAvailable()) {
        OHPrintf("NNRt is not available, skip this test");
        return OH_AI_STATUS_SUCCESS;
    }

    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    AddContextDeviceCPU(context); // nnrt算子支持有限，加cpu设备走异构推理
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：覆盖模型ml_ocr_cn
/**
 * @tc.name   OHOSOfflineModel0008
 * @tc.number OHOSOfflineModel0008
 * @tc.desc   OHOSOfflineModel0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSOfflineModel0008()
{
    if (!IsNNRTAvailable()) {
        OHPrintf("NNRt is not available, skip this test");
        return OH_AI_STATUS_SUCCESS;
    }

    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceNNRT(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(
        model, FilePath("ml_ocr_cn_offline_model.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_ocr_cn", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_ocr_cn");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：离线模型覆盖NPU
/**
 * @tc.name   OHOSOfflineModel0009
 * @tc.number OHOSOfflineModel0009
 * @tc.desc   OHOSOfflineModel0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSOfflineModel0009()
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
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("tinynet.om.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = inputs.handle_list[i];
        float* inputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(tensor));
        size_t elementNum = OH_AI_TensorGetElementNum(tensor);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_real_distribution<float> dis(0.0f, 1.0f);
        for (int z = 0; z < elementNum; z++) {
            inputData[z] = dis(gen);
        }
    }
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

} // namespace MindSpore
} // namespace Acts
