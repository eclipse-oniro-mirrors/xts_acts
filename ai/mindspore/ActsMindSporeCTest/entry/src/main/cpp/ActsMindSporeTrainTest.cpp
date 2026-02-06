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

// 正常场景：更新权重
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0001
 * @tc.number SUBAIMindSporeTrainUpdateWeights0001
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */

int SUBAIMindSporeTrainUpdateWeights0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto genRandomData = [](size_t size, void* data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 randomEngine;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(
            static_cast<float*>(data), elementsNum, [&]() { return static_cast<float>(generator(randomEngine)); });
    };
    std::vector<OH_AI_TensorHandle> vecInputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 10 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    genRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vecInputs.push_back(tensor);
    OH_AI_TensorHandleArray updateWeights = { 1, vecInputs.data() };
    status = OH_AI_ModelUpdateWeights(model, updateWeights);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

void ModelUpdateWeightsTest(OH_AI_ModelHandle model)
{
    OH_AI_TensorHandleArray getUpdateWeights = OH_AI_ModelGetWeights(model);
    for (size_t i = 0; i < getUpdateWeights.handle_num; ++i) {
        OH_AI_TensorHandle weightsTensor = getUpdateWeights.handle_list[i];
        if (strcmp(OH_AI_TensorGetName(weightsTensor), "fc3.bias") == 0) {
            float* inputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(weightsTensor));
            std::cout << "fc3.bias:" << inputData[0] << std::endl;
        }
    }
    auto genRandomData = [](size_t size, void* data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 randomEngine;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(
            static_cast<float*>(data), elementsNum, [&]() { return static_cast<float>(generator(randomEngine)); });
    };
    std::vector<OH_AI_TensorHandle> vecInputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 10 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    genRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    vecInputs.push_back(tensor);
    OH_AI_TensorHandleArray updateWeights = { 1, vecInputs.data() };
    OH_AI_ModelUpdateWeights(model, updateWeights);
}

// 正常场景：更新权重后导出训练图，再获取权重
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0002
 * @tc.number SUBAIMindSporeTrainUpdateWeights0002
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    ModelUpdateWeightsTest(model);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray exportUpdateWeights = OH_AI_ModelGetWeights(model);
    ASSERT_NE(exportUpdateWeights.handle_list, nullptr);
    ASSERT_NE(exportUpdateWeights.handle_num, 0);
    for (size_t i = 0; i < exportUpdateWeights.handle_num; ++i) {
        OH_AI_TensorHandle weightsTensor = exportUpdateWeights.handle_list[i];
        if (strcmp(OH_AI_TensorGetName(weightsTensor), "fc3.bias") == 0) {
            float* inputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(weightsTensor));
            std::cout << "fc3.bias:" << inputData[0] << std::endl;
        }
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：更新权重tensor name错误
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0003
 * @tc.number SUBAIMindSporeTrainUpdateWeights0003
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0003()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    std::vector<OH_AI_TensorHandle> vecInputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 10 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("aaaaa", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    vecInputs.push_back(tensor);
    OH_AI_TensorHandleArray updateWeights = { 1, vecInputs.data() };
    status = OH_AI_ModelUpdateWeights(model, updateWeights);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：更新权重tensor type错误
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0004
 * @tc.number SUBAIMindSporeTrainUpdateWeights0004
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0004()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    std::vector<OH_AI_TensorHandle> vecInputs;
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 10 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("fc3.bias", OH_AI_DATATYPE_NUMBERTYPE_FLOAT16, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    vecInputs.push_back(tensor);
    OH_AI_TensorHandleArray updateWeights = { 1, vecInputs.data() };
    status = OH_AI_ModelUpdateWeights(model, updateWeights);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：更新权重tensor name全部错误
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0005
 * @tc.number SUBAIMindSporeTrainUpdateWeights0005
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0005()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray getWeights = OH_AI_ModelGetWeights(model);
    std::vector<OH_AI_TensorHandle> featureMaps;
    for (size_t i = 0; i < getWeights.handle_num; i++) {
        auto name = OH_AI_TensorGetName(getWeights.handle_list[i]);
        size_t shapeNum;
        auto shape = OH_AI_TensorGetShape(getWeights.handle_list[i], &shapeNum);
        OH_AI_DataType dataType = OH_AI_TensorGetDataType(getWeights.handle_list[i]);
        auto data = OH_AI_TensorGetData(getWeights.handle_list[i]);
        auto dataSize = OH_AI_TensorGetDataSize(getWeights.handle_list[i]);
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate(name, dataType, shape, shapeNum, data, dataSize);
        OH_AI_TensorSetName(tensor, "AAAA");
        featureMaps.push_back(tensor);
    }
    OHPrintf("==========OH_AI_TrainModel updateWeights==========\n");
    status = OH_AI_ModelUpdateWeights(model, { featureMaps.size(), featureMaps.data() });
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
void RunStepErrorCodeTest()
{
    // OH_AI_RunStep异常测试
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context01 = OH_AI_ContextCreate();
    ASSERT_NE(context01, nullptr);
    AddContextDeviceCPU(context01);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model01 = OH_AI_ModelCreate();
    ASSERT_NE(model01, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(
        model01, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context01);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    auto status01 = OH_AI_RunStep(model01, nullptr, nullptr);
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_INPUT_TENSOR_ERROR);
    auto status02 = OH_AI_RunStep(nullptr, nullptr, nullptr);
    ASSERT_EQ(status02, OH_AI_STATUS_LITE_PARAM_INVALID);
    auto status03 = OH_AI_ModelSetLearningRate(model01, 1000.0f);
    ASSERT_EQ(status03, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context01);
    OH_AI_ModelDestroy(&model01);
}
// 异常场景：更新权重tensor name错误一个
/**
 * @tc.name   SUBAIMindSporeTrainUpdateWeights0006
 * @tc.number SUBAIMindSporeTrainUpdateWeights0006
 * @tc.desc   SUBAIMindSporeTrainUpdateWeights0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainUpdateWeights0006()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_TensorHandleArray getWeights = OH_AI_ModelGetWeights(model);
    std::vector<OH_AI_TensorHandle> featureMaps;
    for (size_t i = 0; i < getWeights.handle_num; i++) {
        auto name = OH_AI_TensorGetName(getWeights.handle_list[i]);
        size_t shapeNum;
        auto shape = OH_AI_TensorGetShape(getWeights.handle_list[i], &shapeNum);
        OH_AI_DataType dataType = OH_AI_TensorGetDataType(getWeights.handle_list[i]);
        auto data = OH_AI_TensorGetData(getWeights.handle_list[i]);
        auto dataSize = OH_AI_TensorGetDataSize(getWeights.handle_list[i]);
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate(name, dataType, shape, shapeNum, data, dataSize);
        featureMaps.push_back(tensor);
    }
    OHPrintf("==========OH_AI_TrainModel updateWeights==========\n");
    OH_AI_TensorSetName(featureMaps.at(1), "AAAA");
    status = OH_AI_ModelUpdateWeights(model, { featureMaps.size(), featureMaps.data() });
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    auto status01 = OH_AI_ModelUpdateWeights(nullptr, { featureMaps.size(), featureMaps.data() });
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    RunStepErrorCodeTest();
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置学习率为0.01
/**
 * @tc.name   SUBAIMindSporeTrainSetLearningRate0001
 * @tc.number SUBAIMindSporeTrainSetLearningRate0001
 * @tc.desc   SUBAIMindSporeTrainSetLearningRate0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainSetLearningRate0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto learingRate = OH_AI_ModelGetLearningRate(model);
    std::cout << "learingRate:" << learingRate << std::endl;
    status = OH_AI_ModelSetLearningRate(model, DEFAULT_LEARNING_RATE);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    learingRate = OH_AI_ModelGetLearningRate(model);
    std::cout << "get_learing_rate:" << learingRate << std::endl;
    ASSERT_EQ(learingRate, DEFAULT_LEARNING_RATE);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置学习率值为1000.0
/**
 * @tc.name   SUBAIMindSporeTrainSetLearningRate0002
 * @tc.number SUBAIMindSporeTrainSetLearningRate0002
 * @tc.desc   SUBAIMindSporeTrainSetLearningRate0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainSetLearningRate0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto learingRate = OH_AI_ModelGetLearningRate(model);
    std::cout << "learingRate:" << learingRate << std::endl;
    auto status01 = OH_AI_ModelSetLearningRate(nullptr, 1000.0f);
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_PARAM_INVALID);
    status = OH_AI_ModelSetLearningRate(model, EXTREME_LEARNING_RATE);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    learingRate = OH_AI_ModelGetLearningRate(model);
    std::cout << "get_learing_rate:" << learingRate << std::endl;
    ASSERT_EQ(learingRate, EXTREME_LEARNING_RATE);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto status02 = OH_AI_ModelSetTrainMode(nullptr, true);
    ASSERT_EQ(status02, OH_AI_STATUS_LITE_PARAM_INVALID);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
void SetupVirtualBatchErrorCodeTest()
{
    printf("==========error code==========\n");
    constexpr size_t setupVirtualBatchArg1 = 2;
    constexpr float setupVirtualBatchArg2 = -1.0f;
    constexpr float setupVirtualBatchArg3 = -1.0f;
    printf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    printf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    printf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    printf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    auto status = OH_AI_ModelSetupVirtualBatch(
        model, setupVirtualBatchArg1, setupVirtualBatchArg2, setupVirtualBatchArg3);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
}
// 正常场景：设置虚拟batch_size为2
/**
 * @tc.name   SUBAIMindSporeTrainSetupVirtualBatch0001
 * @tc.number SUBAIMindSporeTrainSetupVirtualBatch0001
 * @tc.desc   SUBAIMindSporeTrainSetupVirtualBatch0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainSetupVirtualBatch0001()
{
    constexpr size_t setupVirtualBatchArg1 = 2;
    constexpr float setupVirtualBatchArg2 = -1.0f;
    constexpr float setupVirtualBatchArg3 = -1.0f;
    OHPrintf("==========OH_AI_ModelCreate and OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ModelSetupVirtualBatch(
        model, setupVirtualBatchArg1, setupVirtualBatchArg2, setupVirtualBatchArg3);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto status01 = OH_AI_ModelSetupVirtualBatch(
        nullptr, setupVirtualBatchArg1, setupVirtualBatchArg2, setupVirtualBatchArg3);
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_PARAM_INVALID);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep and OH_AI_ExportModel==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelCreate2 and OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    SetupVirtualBatchErrorCodeTest();
    return OH_AI_STATUS_SUCCESS;
}
void SetTrainCfgOptimizationLevel(OH_AI_TrainCfgHandle trainCfg)
{
    auto optLevel = OH_AI_TrainCfgGetOptimizationLevel(trainCfg);
    std::cout << "optLevel:" << optLevel << std::endl;
    OH_AI_TrainCfgSetOptimizationLevel(trainCfg, OH_AI_KO0);
    auto setOptLevel01 = OH_AI_TrainCfgGetOptimizationLevel(trainCfg);
    ASSERT_EQ(setOptLevel01, OH_AI_KO0);
    OH_AI_TrainCfgSetOptimizationLevel(trainCfg, OH_AI_KO3);
    auto setOptLevel02 = OH_AI_TrainCfgGetOptimizationLevel(trainCfg);
    ASSERT_EQ(setOptLevel02, OH_AI_KO3);
    OH_AI_TrainCfgSetOptimizationLevel(trainCfg, OH_AI_KAUTO);
    auto setOptLevel03 = OH_AI_TrainCfgGetOptimizationLevel(trainCfg);
    ASSERT_EQ(setOptLevel03, OH_AI_KAUTO);
    OH_AI_TrainCfgSetOptimizationLevel(trainCfg, OH_AI_KOPTIMIZATIONTYPE);
    auto setOptLevel04 = OH_AI_TrainCfgGetOptimizationLevel(trainCfg);
    ASSERT_EQ(setOptLevel04, OH_AI_KOPTIMIZATIONTYPE);
    OH_AI_TrainCfgSetOptimizationLevel(trainCfg, OH_AI_KO2);
    auto setOptLevel05 = OH_AI_TrainCfgGetOptimizationLevel(trainCfg);
    ASSERT_EQ(setOptLevel05, OH_AI_KO2);
    std::cout << "setOptLevel:" << setOptLevel05 << std::endl;
}

// 正常场景：设置优化等级
/**
 * @tc.name   SUBAIMindSporeTrainSetOptimizationLevel0001
 * @tc.number SUBAIMindSporeTrainSetOptimizationLevel0001
 * @tc.desc   SUBAIMindSporeTrainSetOptimizationLevel0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainSetOptimizationLevel0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    SetTrainCfgOptimizationLevel(trainCfg);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：创建TrainCfg对象并销毁
/**
 * @tc.name   SUBAIMindSporeTrainTrainCfg0001
 * @tc.number SUBAIMindSporeTrainTrainCfg0001
 * @tc.desc   SUBAIMindSporeTrainTrainCfg0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainTrainCfg0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OH_AI_TrainCfgDestroy(&trainCfg);
    ASSERT_EQ(trainCfg, nullptr);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置存在的损失函数名
/**
 * @tc.name   SUBAIMindSporeTrainTrainCfg0002
 * @tc.number SUBAIMindSporeTrainTrainCfg0002
 * @tc.desc   SUBAIMindSporeTrainTrainCfg0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainTrainCfg0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    PrintTrainLossName(trainCfg);

    std::vector<std::string> setTrainCfgLossName = { "loss_fct", "_loss_fn" };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), setTrainCfgLossName.size());
    PrintTrainLossName(trainCfg);

    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train", false);
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========Model RunStep==========\n");
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置不存在的损失函数名
/**
 * @tc.name   SUBAIMindSporeTrainTrainCfg0003
 * @tc.number SUBAIMindSporeTrainTrainCfg0003
 * @tc.desc   SUBAIMindSporeTrainTrainCfg0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainTrainCfg0003()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    PrintTrainLossName(trainCfg);

    std::vector<std::string> setTrainCfgLossName = { "aaa", "bbb" };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), setTrainCfgLossName.size());
    PrintTrainLossName(trainCfg);

    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：设置损失函数名个数大于num
/**
 * @tc.name   SUBAIMindSporeTrainTrainCfg0004
 * @tc.number SUBAIMindSporeTrainTrainCfg0004
 * @tc.desc   SUBAIMindSporeTrainTrainCfg0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainTrainCfg0004()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    PrintTrainLossName(trainCfg);

    std::vector<std::string> setTrainCfgLossName = { "loss_fct", "_loss_fn" };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), 1);
    PrintTrainLossName(trainCfg);

    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：通过buffer加载模型，执行1轮训练并对比精度
/**
 * @tc.name   SUBAIMindSporeTrainModelBuild0001
 * @tc.number SUBAIMindSporeTrainModelBuild0001
 * @tc.desc   SUBAIMindSporeTrainModelBuild0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainModelBuild0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, true, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：加载模型buffer为空
/**
 * @tc.name   SUBAIMindSporeTrainModelBuild0002
 * @tc.number SUBAIMindSporeTrainModelBuild0002
 * @tc.desc   SUBAIMindSporeTrainModelBuild0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainModelBuild0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========Build model by graphBuf==========\n");
    size_t size;
    size_t *ptrSize = &size;
    char *graphBuf = ReadFile(FilePath("lenet_train.ms").c_str(), ptrSize);
    auto status01 = OH_AI_TrainModelBuild(model, nullptr, 0, OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_NULLPTR);
    auto status02 = OH_AI_TrainModelBuild(model, graphBuf, 0, OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status02, OH_AI_STATUS_LITE_ERROR);
    auto status03 = OH_AI_TrainModelBuild(model, graphBuf, size, OH_AI_MODELTYPE_INVALID, context, trainCfg);
    ASSERT_EQ(status03, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：加载模型文件路径不存在
/**
 * @tc.name   SUBAIMindSporeTrainModelBuild0003
 * @tc.number SUBAIMindSporeTrainModelBuild0003
 * @tc.desc   SUBAIMindSporeTrainModelBuild0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainModelBuild0003()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("not_exist/lenet_train.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：加载模型文件路径为空
/**
 * @tc.name   SUBAIMindSporeTrainModelBuild0004
 * @tc.number SUBAIMindSporeTrainModelBuild0004
 * @tc.desc   SUBAIMindSporeTrainModelBuild0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainModelBuild0004()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    auto status01 = OH_AI_TrainModelBuildFromFile(model, "", OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_ERROR);
    auto status02 = OH_AI_TrainModelBuildFromFile(model, nullptr, OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status02, OH_AI_STATUS_LITE_NULLPTR);
    auto status03 = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train.ms").c_str(), OH_AI_MODELTYPE_INVALID, context, trainCfg);
    ASSERT_EQ(status03, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：加载模型文件路径为错误文件
/**
 * @tc.name   SUBAIMindSporeTrainModelBuild0005
 * @tc.number SUBAIMindSporeTrainModelBuild0005
 * @tc.desc   SUBAIMindSporeTrainModelBuild0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainModelBuild0005()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("lenet_train_0.input").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：训练model导出推理图后对比精度
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0001
 * @tc.number SUBAIMindSporeTrainExportModel0001
 * @tc.desc   SUBAIMindSporeTrainExportModel0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：quantization_type为OH_AI_WEIGHT_QUANT
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0002
 * @tc.number SUBAIMindSporeTrainExportModel0002
 * @tc.desc   SUBAIMindSporeTrainExportModel0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_WEIGHT_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：quantization_type为OH_AI_FULL_QUANT
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0003
 * @tc.number SUBAIMindSporeTrainExportModel0003
 * @tc.desc   SUBAIMindSporeTrainExportModel0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0003()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_FULL_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：quantization_type为OH_AI_UNKNOWN_QUANT_TYPE
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0004
 * @tc.number SUBAIMindSporeTrainExportModel0004
 * @tc.desc   SUBAIMindSporeTrainExportModel0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0004()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model,
                                    OH_AI_MODELTYPE_MINDIR,
                                    FilePath("lenet_train_infer.ms").c_str(),
                                    OH_AI_UNKNOWN_QUANT_TYPE,
                                    true,
                                    nullptr,
                                    0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelPredict==========\n");
    ModelPredict(model2, context2, ModelPredictOptions("lenet_train_infer", {}, false, false, false));
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：export_inference_only为false
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0005
 * @tc.number SUBAIMindSporeTrainExportModel0005
 * @tc.desc   SUBAIMindSporeTrainExportModel0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0005()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_train.ms").c_str(), OH_AI_NO_QUANT, false, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelTrain==========\n");
    ModelTrainOptions options2 = ModelTrainOptions("lenet_train_train");
    ModelTrain(model2, context2, options2);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：export_inference_only为false，再指定output_tensor_name
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0006
 * @tc.number SUBAIMindSporeTrainExportModel0006
 * @tc.desc   SUBAIMindSporeTrainExportModel0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0006()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    const std::vector<std::string> outputName = { "Default/network-WithLossCell/_loss_fn-L1Loss/ReduceMean-op127" };
    auto outputTensorName = TransStrVectorToCharArrays(outputName);
    auto status = OH_AI_ExportModel(model,
                                    OH_AI_MODELTYPE_MINDIR,
                                    FilePath("lenet_train_train.ms").c_str(),
                                    OH_AI_NO_QUANT,
                                    false,
                                    outputTensorName,
                                    1);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ContextCreate2==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OHPrintf("==========ModelTrain==========\n");
    ModelTrainOptions options2 = ModelTrainOptions("lenet_train_train");
    ModelTrain(model2, context2, options2);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：OH_AI_MODELTYPE_INVALID
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0007
 * @tc.number SUBAIMindSporeTrainExportModel0007
 * @tc.desc   SUBAIMindSporeTrainExportModel0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0007()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_INVALID, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：指定导出不存在的output_tensor_name
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0008
 * @tc.number SUBAIMindSporeTrainExportModel0008
 * @tc.desc   SUBAIMindSporeTrainExportModel0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0008()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    const std::vector<std::string> outputName = { "aaa" };
    auto outputTensorName = TransStrVectorToCharArrays(outputName);
    auto status = OH_AI_ExportModel(model,
                                    OH_AI_MODELTYPE_MINDIR,
                                    FilePath("lenet_train_infer.ms").c_str(),
                                    OH_AI_NO_QUANT,
                                    true,
                                    outputTensorName,
                                    1);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：output_tensor_name的个数与num不一致
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0009
 * @tc.number SUBAIMindSporeTrainExportModel0009
 * @tc.desc   SUBAIMindSporeTrainExportModel0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0009()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    const std::vector<std::string> outputName = { "Default/network-WithLossCell/_loss_fn-L1Loss/ReduceMean-op127" };
    auto outputTensorName = TransStrVectorToCharArrays(outputName);
    auto status = OH_AI_ExportModel(model,
                                    OH_AI_MODELTYPE_MINDIR,
                                    FilePath("lenet_train_infer.ms").c_str(),
                                    OH_AI_NO_QUANT,
                                    true,
                                    outputTensorName,
                                    0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：model_file文件路径不存在
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0010
 * @tc.number SUBAIMindSporeTrainExportModel0010
 * @tc.desc   SUBAIMindSporeTrainExportModel0010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0010()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model,
                                    OH_AI_MODELTYPE_MINDIR,
                                    FilePath("not_exsit/lenet_train_infer.ms").c_str(),
                                    OH_AI_NO_QUANT,
                                    true,
                                    nullptr,
                                    0);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：model_file路径为空
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0011
 * @tc.number SUBAIMindSporeTrainExportModel0011
 * @tc.desc   SUBAIMindSporeTrainExportModel0011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0011()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model, OH_AI_MODELTYPE_MINDIR, "", OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：model_file路径为文件夹
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0012
 * @tc.number SUBAIMindSporeTrainExportModel0012
 * @tc.desc   SUBAIMindSporeTrainExportModel0012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0012()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, ActsMindSporeConstants::FILES_DIR.c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_NE(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：OH_AI_ModelGetTrainMode
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0013
 * @tc.number SUBAIMindSporeTrainExportModel0013
 * @tc.desc   SUBAIMindSporeTrainExportModel0013
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0013()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("lenet_train_infer.ms").c_str(), OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelSetTrainMode:false==========\n");
    status = OH_AI_ModelSetTrainMode(model, false);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto trainMode = OH_AI_ModelGetTrainMode(model);
    ASSERT_EQ(trainMode, false);
    OHPrintf("==========OH_AI_ModelSetTrainMode:true==========\n");
    status = OH_AI_ModelSetTrainMode(model, true);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    auto train_mode_02 = OH_AI_ModelGetTrainMode(model);
    ASSERT_EQ(train_mode_02, true);
    OHPrintf("=========OH_AI_ModelDestroy===========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OHPrintf("=========OH_AI_ModelDestroy End===========\n");
    OHPrintf("==========error code==========\n");
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context01 = OH_AI_ContextCreate();
    ASSERT_NE(context01, nullptr);
    AddContextDeviceCPU(context01);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model01 = OH_AI_ModelCreate();
    ASSERT_NE(model01, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret01 = OH_AI_ModelBuildFromFile(
        model01, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context01);
    OHPrintf("==========build model return code:%d\n", ret01);
    ASSERT_EQ(ret01, OH_AI_STATUS_SUCCESS);
    auto status02 = OH_AI_ModelSetTrainMode(model01, true);
    ASSERT_EQ(status02, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context01);
    OH_AI_ModelDestroy(&model01);
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：OH_AI_ExportModelBuffer
/**
 * @tc.name   SUBAIMindSporeTrainExportModel0014
 * @tc.number SUBAIMindSporeTrainExportModel0014
 * @tc.desc   SUBAIMindSporeTrainExportModel0014
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportModel0014()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_RunStep==========\n");
    ModelTrainOptions options = ModelTrainOptions("lenet_train");
    ModelTrain(model, context, options);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    char* modelData;
    size_t dataSize;
    auto status = OH_AI_ExportModelBuffer(
        model, OH_AI_MODELTYPE_MINDIR, &modelData, &dataSize, OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    ASSERT_NE(modelData, nullptr);
    ASSERT_NE(dataSize, EXPECT_SUCCESS);
    auto status01 = OH_AI_ExportModelBuffer(
        nullptr, OH_AI_MODELTYPE_MINDIR, &modelData, &dataSize, OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_PARAM_INVALID);
    OHPrintf("==========OH_AI_ModelCreate2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    ASSERT_NE(context2, nullptr);
    AddContextDeviceCPU(context2);
    OHPrintf("==========ModelPredict==========\n");
    auto ret = OH_AI_ModelBuild(model2, modelData, dataSize, OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model2);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "lenet_train_infer", false);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model2, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("=========CompareResult===========\n");
    CompareResult(outputs, "lenet_train_infer");
    OHPrintf("=========model01 context and Model destroy===========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OHPrintf("=========model01 context and Model destroy End and model02 context and Model destroy===========\n");
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model2);
    OHPrintf("=========model02 context and Model destroy End===========\n");
    return OH_AI_STATUS_SUCCESS;
}
// 正常场景：训练model导出micro权重
/**
 * @tc.name   SUBAIMindSporeTrainExportWeights0001
 * @tc.number SUBAIMindSporeTrainExportWeights0001
 * @tc.desc   SUBAIMindSporeTrainExportWeights0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportWeights0001()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("xiaoyi_train_codegen.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model,
                               OH_AI_MODELTYPE_MINDIR,
                               FilePath("xiaoyi_train_codegen_gru_model1.ms").c_str(),
                               OH_AI_NO_QUANT,
                               true,
                               nullptr,
                               0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ExportWeightsCollaborateWithMicro(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("xiaoyi_train_codegen_net1.bin").c_str(), true, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ExportWeightsCollaborateWithMicro(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("xiaoyi_train_codegen_net1_fp32.bin").c_str(), true, false, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

static OH_AI_TensorHandle CreateRandomTensor(const char* name, int64_t shape[2])
{
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate(name, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, shape, 2, nullptr, 0);
    auto genRandomData = [](size_t size, void* data) {
        auto generator = std::uniform_real_distribution<float>(0.0f, 1.0f);
        std::mt19937 randomEngine;
        size_t elementsNum = size / sizeof(float);
        (void)std::generate_n(
            static_cast<float*>(data), elementsNum, [&]() { return static_cast<float>(generator(randomEngine)); });
    };
    genRandomData(OH_AI_TensorGetDataSize(tensor), OH_AI_TensorGetMutableData(tensor));
    return tensor;
}

static void RunTrainStep(OH_AI_ModelHandle model, bool trainMode)
{
    auto status = OH_AI_ModelSetTrainMode(model, trainMode);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_RunStep(model, nullptr, nullptr);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
}

static void ExportWeightsForMicro(OH_AI_ModelHandle model,
                                  char** weightsName,
                                  size_t weightsCount,
                                  const char* binFile,
                                  const char* fp32File)
{
    auto status = OH_AI_ExportWeightsCollaborateWithMicro(
        model, OH_AI_MODELTYPE_MINDIR, FilePath(binFile).c_str(), true, true, weightsName, weightsCount);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    status = OH_AI_ExportWeightsCollaborateWithMicro(
        model, OH_AI_MODELTYPE_MINDIR, FilePath(fp32File).c_str(), true, false, weightsName, weightsCount);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
}

static const std::vector<std::string> CHANGEBLE_WEIGHTS_NAMES = {
    "app_usage_statistic_30_cell.embedding.embedding_table",
    "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
    "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
    "data-57"
};

static void SetupModelForExportWeights(OH_AI_ContextHandle& ctx, OH_AI_ModelHandle& mod, OH_AI_TrainCfgHandle& cfg)
{
    ctx = OH_AI_ContextCreate();
    ASSERT_NE(ctx, nullptr);
    AddContextDeviceCPU(ctx);
    mod = OH_AI_ModelCreate();
    ASSERT_NE(mod, nullptr);
    cfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(cfg, nullptr);
    std::vector<std::string> setTrainCfgLossName = {
        "loss_fct", "_loss_fn", "SigmoidCrossEntropy", "BinaryCrossEntropy"
    };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(cfg, const_cast<const char**>(setLossName), setTrainCfgLossName.size());
    auto status = OH_AI_TrainModelBuildFromFile(
        mod, FilePath("xiaoyi_train_codegen.ms").c_str(), OH_AI_MODELTYPE_MINDIR, ctx, cfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
}

void ModelExportWeightsTest(OH_AI_ModelHandle model)
{
    const std::vector<std::string> changebleWeightsName = {
        "app_usage_statistic_30_cell.embedding.embedding_table",
        "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
        "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
        "data-57"
    };
    char** setChangebleWeightsName = TransStrVectorToCharArrays(changebleWeightsName);
    OH_AI_ExportWeightsCollaborateWithMicro(model,
                                            OH_AI_MODELTYPE_MINDIR,
                                            FilePath("xiaoyi_train_codegen_net1.bin").c_str(),
                                            true,
                                            true,
                                            setChangebleWeightsName,
                                            changebleWeightsName.size());
    OH_AI_ExportWeightsCollaborateWithMicro(model,
                                            OH_AI_MODELTYPE_MINDIR,
                                            FilePath("xiaoyi_train_codegen_net1_fp32.bin").c_str(),
                                            true,
                                            false,
                                            setChangebleWeightsName,
                                            changebleWeightsName.size());
    OHPrintf("==================== update weight ==================\n");
    int64_t shape[] = { 76, 8 };
    std::vector<OH_AI_TensorHandle> vecInputs = {
        CreateRandomTensor("app_usage_statistic_30_cell.embedding.embedding_table", shape),
        CreateRandomTensor("moment1.app_usage_statistic_30_cell.embedding.embedding_table", shape),
        CreateRandomTensor("moment2.app_usage_statistic_30_cell.embedding.embedding_table", shape)
    };
    OH_AI_TensorHandleArray updateWeights = { 3, vecInputs.data() };
    OH_AI_ModelUpdateWeights(model, updateWeights);
}

// 正常场景：训练model更新并导出micro权重
/**
 * @tc.name   SUBAIMindSporeTrainExportWeights0002
 * @tc.number SUBAIMindSporeTrainExportWeights0002
 * @tc.desc   SUBAIMindSporeTrainExportWeights0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportWeights0002()
{
    OH_AI_ContextHandle context;
    OH_AI_ModelHandle model;
    OH_AI_TrainCfgHandle trainCfg;
    SetupModelForExportWeights(context, model, trainCfg);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    auto status = OH_AI_ExportModel(model,
                                    OH_AI_MODELTYPE_MINDIR,
                                    FilePath("xiaoyi_train_codegen_gru_model1.ms").c_str(),
                                    OH_AI_NO_QUANT,
                                    true,
                                    nullptr,
                                    0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    char** setChangebleWeightsName2 = TransStrVectorToCharArrays(CHANGEBLE_WEIGHTS_NAMES);
    ModelExportWeightsTest(model);
    RunTrainStep(model, true);
    RunTrainStep(model, false);
    OHPrintf("==========OH_AI_ExportModel2==========\n");
    status = OH_AI_ExportModel(model,
                               OH_AI_MODELTYPE_MINDIR,
                               FilePath("xiaoyi_train_codegen_gru_model2.ms").c_str(),
                               OH_AI_NO_QUANT,
                               true,
                               nullptr,
                               0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    ExportWeightsForMicro(model,
                          setChangebleWeightsName2,
                          CHANGEBLE_WEIGHTS_NAMES.size(),
                          "xiaoyi_train_codegen_net2.bin",
                          "xiaoyi_train_codegen_net2_fp32.bin");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：weight_file文件路径不存在
/**
 * @tc.name   SUBAIMindSporeTrainExportWeights0003
 * @tc.number SUBAIMindSporeTrainExportWeights0003
 * @tc.desc   SUBAIMindSporeTrainExportWeights0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportWeights0003()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    std::vector<std::string> setTrainCfgLossName = {
        "loss_fct", "_loss_fn", "SigmoidCrossEntropy", "BinaryCrossEntropy"
    };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), setTrainCfgLossName.size());
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("xiaoyi_train_codegen.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model,
                               OH_AI_MODELTYPE_MINDIR,
                               FilePath("xiaoyi_train_codegen_gru_model1.ms").c_str(),
                               OH_AI_NO_QUANT,
                               true,
                               nullptr,
                               0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const std::vector<std::string> changebleWeightsName = {
        "app_usage_statistic_30_cell.embedding.embedding_table",
        "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
        "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
        "data-57"
    };
    char** setChangebleWeightsName = TransStrVectorToCharArrays(changebleWeightsName);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model,
                                                     OH_AI_MODELTYPE_MINDIR,
                                                     "/data/not_exist/xiaoyi_train_codegen_net1.bin",
                                                     true,
                                                     true,
                                                     setChangebleWeightsName,
                                                     changebleWeightsName.size());
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：weight_file路径为空
/**
 * @tc.name   SUBAIMindSporeTrainExportWeights0004
 * @tc.number SUBAIMindSporeTrainExportWeights0004
 * @tc.desc   SUBAIMindSporeTrainExportWeights0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportWeights0004()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    std::vector<std::string> setTrainCfgLossName = {
        "loss_fct", "_loss_fn", "SigmoidCrossEntropy", "BinaryCrossEntropy"
    };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), setTrainCfgLossName.size());
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("xiaoyi_train_codegen.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model,
                               OH_AI_MODELTYPE_MINDIR,
                               FilePath("xiaoyi_train_codegen_gru_model1.ms").c_str(),
                               OH_AI_NO_QUANT,
                               true,
                               nullptr,
                               0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const std::vector<std::string> changebleWeightsName = {
        "app_usage_statistic_30_cell.embedding.embedding_table",
        "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
        "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
        "data-57"
    };
    char** setChangebleWeightsName = TransStrVectorToCharArrays(changebleWeightsName);
    status = OH_AI_ExportWeightsCollaborateWithMicro(
        model, OH_AI_MODELTYPE_MINDIR, "", true, true, setChangebleWeightsName, changebleWeightsName.size());
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：weight_file路径为文件夹
/**
 * @tc.name   SUBAIMindSporeTrainExportWeights0005
 * @tc.number SUBAIMindSporeTrainExportWeights0005
 * @tc.desc   SUBAIMindSporeTrainExportWeights0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportWeights0005()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    std::vector<std::string> setTrainCfgLossName = {
        "loss_fct", "_loss_fn", "SigmoidCrossEntropy", "BinaryCrossEntropy"
    };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), setTrainCfgLossName.size());
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("xiaoyi_train_codegen.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(model,
                               OH_AI_MODELTYPE_MINDIR,
                               FilePath("xiaoyi_train_codegen_gru_model1.ms").c_str(),
                               OH_AI_NO_QUANT,
                               true,
                               nullptr,
                               0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const std::vector<std::string> changebleWeightsName = {
        "app_usage_statistic_30_cell.embedding.embedding_table",
        "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
        "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
        "data-57"
    };
    char** setChangebleWeightsName = TransStrVectorToCharArrays(changebleWeightsName);
    status = OH_AI_ExportWeightsCollaborateWithMicro(model,
                                                     OH_AI_MODELTYPE_MINDIR,
                                                     ActsMindSporeConstants::FILES_DIR.c_str(),
                                                     true,
                                                     true,
                                                     setChangebleWeightsName,
                                                     changebleWeightsName.size());
    ASSERT_EQ(status, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
// 异常场景：is_inference为false
/**
 * @tc.name   SUBAIMindSporeTrainExportWeights0006
 * @tc.number SUBAIMindSporeTrainExportWeights0006
 * @tc.desc   SUBAIMindSporeTrainExportWeights0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTrainExportWeights0006()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========OH_AI_ModelCreate==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========OH_AI_TrainCfgCreate==========\n");
    OH_AI_TrainCfgHandle trainCfg = OH_AI_TrainCfgCreate();
    ASSERT_NE(trainCfg, nullptr);
    std::vector<std::string> setTrainCfgLossName = {
        "loss_fct", "_loss_fn", "SigmoidCrossEntropy", "BinaryCrossEntropy"
    };
    char** setLossName = TransStrVectorToCharArrays(setTrainCfgLossName);
    OH_AI_TrainCfgSetLossName(trainCfg, const_cast<const char**>(setLossName), setTrainCfgLossName.size());
    OHPrintf("==========OH_AI_TrainModelBuildFromFile==========\n");
    auto status = OH_AI_TrainModelBuildFromFile(
        model, FilePath("xiaoyi_train_codegen.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context, trainCfg);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ExportModel==========\n");
    status = OH_AI_ExportModel(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("xiaoyi_train_codegen_gru_model1.ms").c_str(),
        OH_AI_NO_QUANT, true, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const std::vector<std::string> changebleWeightsName = {
        "app_usage_statistic_30_cell.embedding.embedding_table",
        "moment1.app_usage_statistic_30_cell.embedding.embedding_table",
        "moment2.app_usage_statistic_30_cell.embedding.embedding_table",
        "data-57"
    };
    char** setChangebleWeightsName = TransStrVectorToCharArrays(changebleWeightsName);
    status = OH_AI_ExportWeightsCollaborateWithMicro(
        model, OH_AI_MODELTYPE_MINDIR, FilePath("xiaoyi_train_codegen_net1.bin").c_str(),
        false, true, setChangebleWeightsName, changebleWeightsName.size());
    ASSERT_EQ(status, OH_AI_STATUS_LITE_NOT_SUPPORT);
    auto status01 = OH_AI_ExportWeightsCollaborateWithMicro(
        nullptr, OH_AI_MODELTYPE_MINDIR, FilePath("xiaoyi_train_codegen_net1.bin").c_str(),
        false, true, setChangebleWeightsName, changebleWeightsName.size());
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}
} // namespace MindSpore
} // namespace Acts