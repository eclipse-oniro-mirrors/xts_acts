/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <cmath>
#include <cstdio>
#include <vector>
#include <thread>
#include "NNcoreUtilsTest.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0001
#define LOG_TAG "NNRtModelTest"

using namespace OHOS::NeuralNetworkRuntime::Test;

namespace OHOS {
namespace NeuralNetworkCore {

static void BuildAddTopKGraph(OH_NNModel *model)
{
    AddTopKModel addTopKModel;
    OHNNGraphArgsMulti graphArgsMulti = addTopKModel.graphArgs;
    BuildMultiOpGraph(model, graphArgsMulti);
}

static void BuildModel(OH_NNModel *model, const OHNNGraphArgs &graphArgs)
{
    BuildSingleOpGraph(model, graphArgs);
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_CreateQuantParam0100
 * @tc.desc   创建量化参数
 */
int TestModelCreateQuantParam0100()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelCreateQuantParam0100 START");

    NN_QuantParam *quantParam = OH_NNQuantParam_Create();
    if (quantParam == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNQuantParam_Create returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNQuantParam_Destroy(&quantParam);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNQuantParam_Destroy failed, ret=%{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelCreateQuantParam0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_DestroyQuantParam0100
 * @tc.desc   释放量化参数,*quantParam为空
 */
int TestModelDestroyQuantParam0100()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelDestroyQuantParam0100 START");

    NN_QuantParam *quantParam = nullptr;
    OH_NN_ReturnCode ret = OH_NNQuantParam_Destroy(&quantParam);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelDestroyQuantParam0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_DestroyQuantParam0200
 * @tc.desc   释放量化参数,quantParam为空
 */
int TestModelDestroyQuantParam0200()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelDestroyQuantParam0200 START");

    OH_NN_ReturnCode ret = OH_NNQuantParam_Destroy(nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelDestroyQuantParam0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0100
 * @tc.desc   设置量化参数，参数为空，返回失败
 */
int TestModelSetQuantParam0100()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0100 START");

    double scales = 0.2;
    OH_NN_ReturnCode ret = OH_NNQuantParam_SetScales(nullptr, &scales, 1);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0200
 * @tc.desc   设置量化参数，参数合法，设置成功
 */
int TestModelSetQuantParam0200()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0200 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    NN_QuantParam *quantParam = OH_NNQuantParam_Create();
    double scales = 0.2;
    int32_t zeroPoints = 0;
    uint32_t numBits = 8;
    const size_t quantCount = 1;

    if (OH_NNQuantParam_SetScales(quantParam, &scales, quantCount) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetZeroPoints(quantParam, &zeroPoints, quantCount) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetNumBits(quantParam, &numBits, quantCount) != OH_NN_SUCCESS) {
        OH_NNQuantParam_Destroy(&quantParam);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] QuantParam setup failed");
        return -1;
    }

    if (OH_NNModel_SetTensorQuantParams(model, 0, quantParam) != OH_NN_SUCCESS) {
        OH_NNQuantParam_Destroy(&quantParam);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_SetTensorQuantParams failed");
        return -1;
    }

    OH_NNQuantParam_Destroy(&quantParam);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0300
 * @tc.desc   设置量化参数，count=1,channel=2,Per-Layer模式，设置成功
 */
int TestModelSetQuantParam0300()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0300 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 2, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    NN_QuantParam *quantParam = OH_NNQuantParam_Create();
    double scales = 0.2;
    int32_t zeroPoints = 0;
    uint32_t numBits = 8;

    if (OH_NNQuantParam_SetScales(quantParam, &scales, 1) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetZeroPoints(quantParam, &zeroPoints, 1) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetNumBits(quantParam, &numBits, 1) != OH_NN_SUCCESS ||
        OH_NNModel_SetTensorQuantParams(model, 0, quantParam) != OH_NN_SUCCESS) {
        OH_NNQuantParam_Destroy(&quantParam);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] SetQuantParam failed");
        return -1;
    }

    OH_NNQuantParam_Destroy(&quantParam);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0400
 * @tc.desc   设置量化参数，参数合法,count=2,参数的channel=1,调用失败
 */
int TestModelSetQuantParam0400()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0400 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    NN_QuantParam *quantParam = OH_NNQuantParam_Create();
    double scales = 0.2;
    int32_t zeroPoints = 0;
    uint32_t numBits = 8;
    const size_t quantCount = 2;

    if (OH_NNQuantParam_SetScales(quantParam, &scales, quantCount) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetZeroPoints(quantParam, &zeroPoints, quantCount) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetNumBits(quantParam, &numBits, quantCount) != OH_NN_SUCCESS) {
        OH_NNQuantParam_Destroy(&quantParam);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] QuantParam setup failed");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNModel_SetTensorQuantParams(model, 0, quantParam);
    OH_NNQuantParam_Destroy(&quantParam);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);

    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0400 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0500
 * @tc.desc   设置量化参数，参数合法,参数count不一致,调用失败
 */
int TestModelSetQuantParam0500()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0500 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    NN_QuantParam *quantParam = OH_NNQuantParam_Create();
    double scales = 0.2;
    int32_t zeroPoints = 0;
    uint32_t numBits = 8;
    const size_t quantParamCount = 1;
    const size_t setZeroLength = 2;

    if (OH_NNQuantParam_SetScales(quantParam, &scales, quantParamCount) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetZeroPoints(quantParam, &zeroPoints, setZeroLength) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetNumBits(quantParam, &numBits, quantParamCount) != OH_NN_SUCCESS) {
        OH_NNQuantParam_Destroy(&quantParam);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] QuantParam setup failed");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNModel_SetTensorQuantParams(model, 0, quantParam);
    OH_NNQuantParam_Destroy(&quantParam);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0500 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0600
 * @tc.desc   设置量化参数，参数合法,不设置zeroPoints,调用失败
 */
int TestModelSetQuantParam0600()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0600 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    NN_QuantParam *quantParam = OH_NNQuantParam_Create();
    double scales = 0.2;
    uint32_t numBits = 8;

    if (OH_NNQuantParam_SetScales(quantParam, &scales, 1) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetNumBits(quantParam, &numBits, 1) != OH_NN_SUCCESS) {
        OH_NNQuantParam_Destroy(&quantParam);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] QuantParam setup failed");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNModel_SetTensorQuantParams(model, 0, quantParam);
    OH_NNQuantParam_Destroy(&quantParam);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0600 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0700
 * @tc.desc   设置量化参数，参数合法,不设置numBits,调用失败
 */
int TestModelSetQuantParam0700()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0700 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    NN_QuantParam *quantParam = OH_NNQuantParam_Create();
    double scales = 0.2;
    int32_t zeroPoints = 0;

    if (OH_NNQuantParam_SetScales(quantParam, &scales, 1) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetZeroPoints(quantParam, &zeroPoints, 1) != OH_NN_SUCCESS) {
        OH_NNQuantParam_Destroy(&quantParam);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] QuantParam setup failed");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNModel_SetTensorQuantParams(model, 0, quantParam);
    OH_NNQuantParam_Destroy(&quantParam);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0700 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0800
 * @tc.desc   设置量化参数，参数合法,不设置scales,调用失败
 */
int TestModelSetQuantParam0800()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0800 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    NN_QuantParam *quantParam = OH_NNQuantParam_Create();
    int32_t zeroPoints = 0;
    uint32_t numBits = 8;

    if (OH_NNQuantParam_SetZeroPoints(quantParam, &zeroPoints, 1) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetNumBits(quantParam, &numBits, 1) != OH_NN_SUCCESS) {
        OH_NNQuantParam_Destroy(&quantParam);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] QuantParam setup failed");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNModel_SetTensorQuantParams(model, 0, quantParam);
    OH_NNQuantParam_Destroy(&quantParam);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0800 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetQuantParam0900
 * @tc.desc   设置量化参数，参数合法,tensor下标等于当前tensor个数,返回失败
 */
int TestModelSetQuantParam0900()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0900 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    NN_QuantParam *quantParam = OH_NNQuantParam_Create();
    double scales = 0.2;
    int32_t zeroPoints = 0;
    uint32_t numBits = 8;

    if (OH_NNQuantParam_SetScales(quantParam, &scales, 1) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetZeroPoints(quantParam, &zeroPoints, 1) != OH_NN_SUCCESS ||
        OH_NNQuantParam_SetNumBits(quantParam, &numBits, 1) != OH_NN_SUCCESS) {
        OH_NNQuantParam_Destroy(&quantParam);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] QuantParam setup failed");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNModel_SetTensorQuantParams(model, 1, quantParam);
    OH_NNQuantParam_Destroy(&quantParam);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetQuantParam0900 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_AddTensorToModel0100
 * @tc.desc   添加tensor到模型，model为空
 */
int TestModelAddTensorToModel0100()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelAddTensorToModel0100 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);

    OH_NN_ReturnCode ret = OH_NNModel_AddTensorToModel(nullptr, tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_NNTensorDesc_Destroy(&tensorDesc);
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelAddTensorToModel0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_AddTensorToModel0200
 * @tc.desc   添加tensor到模型，tensorDesc为空
 */
int TestModelAddTensorToModel0200()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelAddTensorToModel0200 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNModel_AddTensorToModel(model, nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_NNModel_Destroy(&model);
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelAddTensorToModel0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorData0100
 * @tc.desc   设置操作数值，model为nullptr
 */
int TestModelSetTensorData0100()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorData0100 START");

    int8_t activationValue{0};
    OH_NN_ReturnCode ret = OH_NNModel_SetTensorData(nullptr, 0, (void *)&activationValue, sizeof(int8_t));
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorData0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorData0200
 * @tc.desc   设置操作数值，dataBuffer为nullptr
 */
int TestModelSetTensorData0200()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorData0200 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNModel_SetTensorData(model, 0, nullptr, sizeof(int8_t));
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorData0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorData0300
 * @tc.desc   设置操作数值，length = 0
 */
int TestModelSetTensorData0300()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorData0300 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    int8_t activationValue{0};
    OH_NN_ReturnCode ret = OH_NNModel_SetTensorData(model, 0, (void *)&activationValue, 0);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorData0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorData0400
 * @tc.desc   设置操作数值，index大于tensor个数
 */
int TestModelSetTensorData0400()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorData0400 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    int8_t activationValue{0};
    OH_NN_ReturnCode ret = OH_NNModel_SetTensorData(model, 1000, (void *)&activationValue, sizeof(int8_t));
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorData0400 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorType0100
 * @tc.desc   设置tensortype，model为nullptr
 */
int TestModelSetTensorType0100()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorType0100 START");

    OH_NN_ReturnCode ret = OH_NNModel_SetTensorType(nullptr, 0, OH_NN_TENSOR);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorType0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorType0200
 * @tc.desc   设置tensortype，index大于tensor个数
 */
int TestModelSetTensorType0200()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorType0200 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNModel_SetTensorType(model, 1000, OH_NN_TENSOR);
    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorType0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Model_SetTensorType0300
 * @tc.desc   设置tensortype，遍历设置tensorType
 */
int TestModelSetTensorType0300()
{
    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorType0300 START");

    OH_NNModel *model = OH_NNModel_Construct();
    if (model == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_Construct returned nullptr");
        return -1;
    }

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    if (OH_NNModel_AddTensorToModel(model, tensorDesc) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_NNModel_Destroy(&model);
        OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_AddTensorToModel failed");
        return -1;
    }

    const size_t maxLength = 77;
    for (int tensorType = 0; tensorType < maxLength; tensorType++) {
        if (OH_NNModel_SetTensorType(model, 0, static_cast<OH_NN_TensorType>(tensorType)) != OH_NN_SUCCESS) {
            OH_NNModel_Destroy(&model);
            OH_NNTensorDesc_Destroy(&tensorDesc);
            OH_LOG_ERROR(LOG_APP, "[ModelTest] OH_NNModel_SetTensorType failed for type %{public}d", tensorType);
            return -1;
        }
    }

    OH_NNModel_Destroy(&model);
    OH_NNTensorDesc_Destroy(&tensorDesc);

    OH_LOG_INFO(LOG_APP, "[ModelTest] TestModelSetTensorType0300 PASSED");
    return 0;
}

// 导出所有测试函数
struct ModelTestCase {
    const char *name;
    int (*func)();
};

static std::vector<ModelTestCase> g_modelTests = {
    {"TestModelCreateQuantParam0100", TestModelCreateQuantParam0100},
    {"TestModelDestroyQuantParam0100", TestModelDestroyQuantParam0100},
    {"TestModelDestroyQuantParam0200", TestModelDestroyQuantParam0200},
    {"TestModelSetQuantParam0100", TestModelSetQuantParam0100},
    {"TestModelSetQuantParam0200", TestModelSetQuantParam0200},
    {"TestModelSetQuantParam0300", TestModelSetQuantParam0300},
    {"TestModelSetQuantParam0400", TestModelSetQuantParam0400},
    {"TestModelSetQuantParam0500", TestModelSetQuantParam0500},
    {"TestModelSetQuantParam0600", TestModelSetQuantParam0600},
    {"TestModelSetQuantParam0700", TestModelSetQuantParam0700},
    {"TestModelSetQuantParam0800", TestModelSetQuantParam0800},
    {"TestModelSetQuantParam0900", TestModelSetQuantParam0900},
    {"TestModelAddTensorToModel0100", TestModelAddTensorToModel0100},
    {"TestModelAddTensorToModel0200", TestModelAddTensorToModel0200},
    {"TestModelSetTensorData0100", TestModelSetTensorData0100},
    {"TestModelSetTensorData0200", TestModelSetTensorData0200},
    {"TestModelSetTensorData0300", TestModelSetTensorData0300},
    {"TestModelSetTensorData0400", TestModelSetTensorData0400},
    {"TestModelSetTensorType0100", TestModelSetTensorType0100},
    {"TestModelSetTensorType0200", TestModelSetTensorType0200},
    {"TestModelSetTensorType0300", TestModelSetTensorType0300},
};

// 运行所有Model测试
int RunAllModelTests()
{
    int passCount = 0;
    int failCount = 0;

    OH_LOG_INFO(LOG_APP, "========== Running Model Tests ==========");
    OH_LOG_INFO(LOG_APP, "Total test cases: %{public}zu", g_modelTests.size());

    for (const auto &testCase : g_modelTests) {
        OH_LOG_INFO(LOG_APP, "Running: %{public}s", testCase.name);
        int ret = testCase.func();
        if (ret == 0) {
            passCount++;
            OH_LOG_INFO(LOG_APP, "[PASSED] %{public}s", testCase.name);
        } else {
            failCount++;
            OH_LOG_ERROR(LOG_APP, "[FAILED] %{public}s", testCase.name);
        }
    }

    OH_LOG_INFO(LOG_APP, "========== Model Tests Summary ==========");
    OH_LOG_INFO(LOG_APP, "Passed: %{public}d, Failed: %{public}d", passCount, failCount);

    return (failCount == 0) ? 0 : -1;
}

} // namespace NeuralNetworkCore
} // namespace OHOS
