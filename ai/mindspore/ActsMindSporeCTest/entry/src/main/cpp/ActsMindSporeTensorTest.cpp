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
// OH_AI_TensorCreate接口，name为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0001
 * @tc.number SUBAIMindSporeTensorCreate0001
 * @tc.desc   SUBAIMindSporeTensorCreate0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0001()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate(nullptr, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_EQ(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorCreate接口，type为异常类型
/**
 * @tc.name   SUBAIMindSporeTensorCreate0002
 * @tc.number SUBAIMindSporeTensorCreate0002
 * @tc.desc   SUBAIMindSporeTensorCreate0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0002()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DataTypeInvalid, createShape, createShapeNum, nullptr, 0);
    ASSERT_EQ(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorCreate接口，tensor维度数组长度为33，超过最大值32
/**
 * @tc.name   SUBAIMindSporeTensorCreate0003
 * @tc.number SUBAIMindSporeTensorCreate0003
 * @tc.desc   SUBAIMindSporeTensorCreate0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0003()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 33;
    int64_t createShape[createShapeNum] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1,  1, 1,
                                            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_EQ(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorCreate接口，tensor维度数组长度为32，shapeNum为3
/**
 * @tc.name   SUBAIMindSporeTensorCreate0004
 * @tc.number SUBAIMindSporeTensorCreate0004
 * @tc.desc   SUBAIMindSporeTensorCreate0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0004()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 32;
    int64_t createShape[createShapeNum] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1,  1,
                                            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, 3, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常调用接口创建Tensor，并传入input进行推理
/**
 * @tc.name   SUBAIMindSporeTensorCreate0005
 * @tc.number SUBAIMindSporeTensorCreate0005
 * @tc.desc   SUBAIMindSporeTensorCreate0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0005()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    OH_AI_TensorHandleArray inTensorArray;
    inTensorArray.handle_num = 1;
    inTensorArray.handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * 1);
    inTensorArray.handle_list[0] = tensor;
    FillInputsData(inTensorArray, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inTensorArray, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常调用接口创建Tensor，用不同的OH_AI_DataType，并传入input进行推理
/**
 * @tc.name   SUBAIMindSporeTensorCreate0006
 * @tc.number SUBAIMindSporeTensorCreate0006
 * @tc.desc   SUBAIMindSporeTensorCreate0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0006()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet = OH_AI_ModelBuildFromFile(
        model, FilePath("aiy_vision_classifier_plants_V1_3.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 224, 224, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_UINT8, createShape, createShapeNum, nullptr, 0);
    OH_AI_TensorHandleArray inTensorArray;
    inTensorArray.handle_num = 1;
    inTensorArray.handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * 1);
    inTensorArray.handle_list[0] = tensor;
    FillInputsData(inTensorArray, "aiy_vision_classifier_plants_V1_3", false);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inTensorArray, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
        uint8_t* outputData = reinterpret_cast<uint8_t*>(OH_AI_TensorGetMutableData(tensor));
        OHPrintf("output data is:");
        for (int j = 0; j < elementNum && j <= ActsMindSporeValues::OUTPUT_PRINT_LIMIT; ++j) {
            OHPrintf("%d ", outputData[j]);
        }
        OHPrintf("\n");
        OHPrintf("==========CompFp32WithTData==========\n");
        string expectedDataFile = FilePath("aiy_vision_classifier_plants_V1_3") + std::to_string(i) + ".output";
        bool result = CompUint8WithTData(outputData,
                                         expectedDataFile,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         false);
        ASSERT_EQ(result, true);
    }
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorCreate接口，OH_AI_DataType类型、shape数组长度，遍历设置
/**
 * @tc.name   SUBAIMindSporeTensorCreate0007
 * @tc.number SUBAIMindSporeTensorCreate0007
 * @tc.desc   SUBAIMindSporeTensorCreate0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0007()
{
    constexpr size_t datatypeNum = 12;
    OH_AI_DataType datatype[datatypeNum] = { OH_AI_DATATYPE_NUMBERTYPE_BOOL,    OH_AI_DATATYPE_NUMBERTYPE_INT8,
                                             OH_AI_DATATYPE_NUMBERTYPE_INT16,   OH_AI_DATATYPE_NUMBERTYPE_INT32,
                                             OH_AI_DATATYPE_NUMBERTYPE_INT64,   OH_AI_DATATYPE_NUMBERTYPE_UINT8,
                                             OH_AI_DATATYPE_NUMBERTYPE_UINT16,  OH_AI_DATATYPE_NUMBERTYPE_UINT32,
                                             OH_AI_DATATYPE_NUMBERTYPE_UINT64,  OH_AI_DATATYPE_NUMBERTYPE_FLOAT16,
                                             OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, OH_AI_DATATYPE_NUMBERTYPE_FLOAT64 };
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    for (size_t i = 0; i < datatypeNum; ++i) {
        OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype[i], createShape, createShapeNum, nullptr, 0);
        ASSERT_NE(tensor, nullptr);
        OH_AI_TensorDestroy(&tensor);
    }
    return OH_AI_STATUS_SUCCESS;
}

void CreateAndSetTensor(OH_AI_ModelHandle model,
                        OH_AI_ContextHandle context,
                        OH_AI_TensorHandleArray* inTensorArray,
                        bool isFirst)
{
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_TensorHandle tensor;
    if (isFirst) {
        OH_AI_Status buildRet =
            OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
        ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
        OHPrintf("==========OH_AI_ModelGetInputs==========\n");
        OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
        ASSERT_NE(inputs.handle_list, nullptr);
        OH_AI_TensorSetFormat(inputs.handle_list[0], OH_AI_FORMAT_NHWC);
        constexpr size_t createShapeNum = 4;
        int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
        tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    } else {
        OH_AI_Status buildRet = OH_AI_ModelBuildFromFile(
            model, FilePath("aiy_vision_classifier_plants_V1_3.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
        ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
        OHPrintf("==========OH_AI_ModelGetInputs==========\n");
        OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
        ASSERT_NE(inputs.handle_list, nullptr);
        constexpr size_t createShapeNum = 4;
        int64_t createShape[createShapeNum] = { 1, 224, 224, 3 };
        tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_UINT8, createShape, createShapeNum, nullptr, 0);
    }

    inTensorArray->handle_num = 1;
    inTensorArray->handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * 1);
    inTensorArray->handle_list[0] = tensor;
}

// 正常调用接口创建多个Tensor，并传入input进行推理
/**
 * @tc.name   SUBAIMindSporeTensorCreate0008
 * @tc.number SUBAIMindSporeTensorCreate0008
 * @tc.desc   SUBAIMindSporeTensorCreate0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0008()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_TensorHandleArray inTensorArray;
    CreateAndSetTensor(model, context, &inTensorArray, true);
    FillInputsData(inTensorArray, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inTensorArray, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_TensorHandleArray inTensorArray2;
    CreateAndSetTensor(model2, context2, &inTensorArray2, false);
    FillInputsData(inTensorArray2, "aiy_vision_classifier_plants_V1_3", false);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs2 = OH_AI_ModelGetOutputs(model2);
    OH_AI_Status predictRet2 = OH_AI_ModelPredict(model2, inTensorArray2, &outputs2, nullptr, nullptr);
    ASSERT_EQ(predictRet2, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    for (size_t i = 0; i < outputs2.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs2.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
        uint8_t* outputData = reinterpret_cast<uint8_t*>(OH_AI_TensorGetMutableData(tensor));
        OHPrintf("output data is:");
        for (int j = 0; j < elementNum && j <= ActsMindSporeValues::OUTPUT_PRINT_LIMIT; ++j) {
            OHPrintf("%d ", outputData[j]);
        }
        OHPrintf("\n");
        OHPrintf("==========CompFp32WithTData==========\n");
        string expectedDataFile = FilePath("aiy_vision_classifier_plants_V1_3") + std::to_string(i) + ".output";
        bool result = CompUint8WithTData(outputData,
                                         expectedDataFile,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         ActsMindSporeValues::DEFAULT_TOLERANCE,
                                         false);
        ASSERT_EQ(result, true);
    }
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model2);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorDestroy接口，传入的tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0009
 * @tc.number SUBAIMindSporeTensorCreate0009
 * @tc.desc   SUBAIMindSporeTensorCreate0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0009()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorDestroy(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorDestroy接口，多次释放已创建的tensor
/**
 * @tc.name   SUBAIMindSporeTensorCreate0010
 * @tc.number SUBAIMindSporeTensorCreate0010
 * @tc.desc   SUBAIMindSporeTensorCreate0010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0010()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorClone接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0011
 * @tc.number SUBAIMindSporeTensorCreate0011
 * @tc.desc   SUBAIMindSporeTensorCreate0011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0011()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorHandle clone = OH_AI_TensorClone(nullptr);
    ASSERT_EQ(clone, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorClone 接口（深拷贝tensor），拷贝完释放原始tensor
/**
 * @tc.name   SUBAIMindSporeTensorCreate0012
 * @tc.number SUBAIMindSporeTensorCreate0012
 * @tc.desc   SUBAIMindSporeTensorCreate0012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0012()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size1;
    size_t* ptrSize1 = &size1;
    char* imageBuf = ReadFile(FilePath("ml_face_isface.input").c_str(), ptrSize1);
    ASSERT_NE(imageBuf, nullptr);
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone), "data_duplicate"), STRCMP_EQUAL);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&clone);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorClone，克隆出多个tensor
/**
 * @tc.name   SUBAIMindSporeTensorCreate0013
 * @tc.number SUBAIMindSporeTensorCreate0013
 * @tc.desc   SUBAIMindSporeTensorCreate0013
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0013()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size1;
    size_t* ptrSize1 = &size1;
    char* imageBuf = ReadFile(FilePath("ml_face_isface.input").c_str(), ptrSize1);
    ASSERT_NE(imageBuf, nullptr);
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone), "data_duplicate"), STRCMP_EQUAL);
    OH_AI_TensorHandle clone2 = OH_AI_TensorClone(tensor);
    ASSERT_NE(clone2, nullptr);
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone2), "data_duplicate"), STRCMP_EQUAL);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&clone);
    OH_AI_TensorDestroy(&clone2);
    return OH_AI_STATUS_SUCCESS;
}

// 正常设置name
/**
 * @tc.name   SUBAIMindSporeTensorCreate0014
 * @tc.number SUBAIMindSporeTensorCreate0014
 * @tc.desc   SUBAIMindSporeTensorCreate0014
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0014()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "new_data");
    const char* tensorName = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName, "new_data"), STRCMP_EQUAL);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 多次设置name
/**
 * @tc.name   SUBAIMindSporeTensorCreate0015
 * @tc.number SUBAIMindSporeTensorCreate0015
 * @tc.desc   SUBAIMindSporeTensorCreate0015
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0015()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "new_data");
    const char* tensorName = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName, "new_data"), STRCMP_EQUAL);
    OH_AI_TensorSetName(tensor, "new_data2");
    const char* tensorName2 = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName2, "new_data2"), STRCMP_EQUAL);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetName接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0016
 * @tc.number SUBAIMindSporeTensorCreate0016
 * @tc.desc   SUBAIMindSporeTensorCreate0016
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0016()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorSetName(nullptr, "data");
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetName接口，name为空字符、含有非法字符
/**
 * @tc.name   SUBAIMindSporeTensorCreate0017
 * @tc.number SUBAIMindSporeTensorCreate0017
 * @tc.desc   SUBAIMindSporeTensorCreate0017
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0017()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetName(tensor, "");
    OHPrintf("Tensor name: %s. \n", OH_AI_TensorGetName(tensor));
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetName接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0018
 * @tc.number SUBAIMindSporeTensorCreate0018
 * @tc.desc   SUBAIMindSporeTensorCreate0018
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0018()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    const char* tensorName = OH_AI_TensorGetName(nullptr);
    ASSERT_EQ(tensorName, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetDataType接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0019
 * @tc.number SUBAIMindSporeTensorCreate0019
 * @tc.desc   SUBAIMindSporeTensorCreate0019
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0019()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorSetDataType(nullptr, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetDataType接口，OH_AI_DataType设置无效值、非法值
/**
 * @tc.name   SUBAIMindSporeTensorCreate0020
 * @tc.number SUBAIMindSporeTensorCreate0020
 * @tc.desc   SUBAIMindSporeTensorCreate0020
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0020()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetDataType(tensor, OH_AI_DataTypeInvalid);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常设置datatype
/**
 * @tc.name   SUBAIMindSporeTensorCreate0021
 * @tc.number SUBAIMindSporeTensorCreate0021
 * @tc.desc   SUBAIMindSporeTensorCreate0021
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0021()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    ASSERT_EQ(OH_AI_TensorGetDataType(tensor), OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 多次设置datatype
/**
 * @tc.name   SUBAIMindSporeTensorCreate0022
 * @tc.number SUBAIMindSporeTensorCreate0022
 * @tc.desc   SUBAIMindSporeTensorCreate0022
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0022()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    ASSERT_EQ(OH_AI_TensorGetDataType(tensor), OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_UINT8);
    ASSERT_EQ(OH_AI_TensorGetDataType(tensor), OH_AI_DATATYPE_NUMBERTYPE_UINT8);
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_UNKNOWN);
    ASSERT_EQ(OH_AI_TensorGetDataType(tensor), OH_AI_DATATYPE_UNKNOWN);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetDataType接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0023
 * @tc.number SUBAIMindSporeTensorCreate0023
 * @tc.desc   SUBAIMindSporeTensorCreate0023
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0023()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetDataType(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetShape接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0024
 * @tc.number SUBAIMindSporeTensorCreate0024
 * @tc.desc   SUBAIMindSporeTensorCreate0024
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0024()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorSetShape(nullptr, createShape, createShapeNum);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetShape接口，shape数组长度为33
/**
 * @tc.name   SUBAIMindSporeTensorCreate0025
 * @tc.number SUBAIMindSporeTensorCreate0025
 * @tc.desc   SUBAIMindSporeTensorCreate0025
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0025()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    constexpr size_t createShapeSet = 33;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetShape(tensor, createShape, createShapeSet);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常设置shape
/**
 * @tc.name   SUBAIMindSporeTensorCreate0026
 * @tc.number SUBAIMindSporeTensorCreate0026
 * @tc.desc   SUBAIMindSporeTensorCreate0026
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0026()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    constexpr size_t newShapeNum = 4;
    int64_t newShape[newShapeNum] = { 1, 32, 32, 1 };
    OH_AI_TensorSetShape(tensor, newShape, newShapeNum);
    size_t newRetShapeNum;
    const int64_t* newRetShape = OH_AI_TensorGetShape(tensor, &newRetShapeNum);
    ASSERT_EQ(newRetShapeNum, newShapeNum);
    for (size_t i = 0; i < newRetShapeNum; i++) {
        ASSERT_EQ(newRetShape[i], newShape[i]);
    }
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 多次设置shape
/**
 * @tc.name   SUBAIMindSporeTensorCreate0027
 * @tc.number SUBAIMindSporeTensorCreate0027
 * @tc.desc   SUBAIMindSporeTensorCreate0027
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0027()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    constexpr size_t newShapeNum = 4;
    int64_t newShape[newShapeNum] = { 1, 32, 32, 1 };
    OH_AI_TensorSetShape(tensor, newShape, newShapeNum);
    size_t newRetShapeNum;
    const int64_t* newRetShape = OH_AI_TensorGetShape(tensor, &newRetShapeNum);
    ASSERT_EQ(newRetShapeNum, newShapeNum);
    for (size_t i = 0; i < newRetShapeNum; i++) {
        ASSERT_EQ(newRetShape[i], newShape[i]);
    }
    constexpr size_t newShapeNum2 = 4;
    int64_t newShape2[newShapeNum2] = { 1, 16, 16, 1 };
    OH_AI_TensorSetShape(tensor, newShape2, newShapeNum2);
    size_t newRetShapeNum2;
    const int64_t* newRetShape2 = OH_AI_TensorGetShape(tensor, &newRetShapeNum2);
    ASSERT_EQ(newRetShapeNum2, newShapeNum2);
    for (size_t i = 0; i < newRetShapeNum2; i++) {
        ASSERT_EQ(newRetShape2[i], newShape2[i]);
    }
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetShape接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0028
 * @tc.number SUBAIMindSporeTensorCreate0028
 * @tc.desc   SUBAIMindSporeTensorCreate0028
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0028()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    size_t shapeNum;
    OH_AI_TensorGetShape(nullptr, &shapeNum);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetFormat接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0029
 * @tc.number SUBAIMindSporeTensorCreate0029
 * @tc.desc   SUBAIMindSporeTensorCreate0029
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0029()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorSetFormat(nullptr, OH_AI_FORMAT_NCHW);
    return OH_AI_STATUS_SUCCESS;
}

// 正常设置format
/**
 * @tc.name   SUBAIMindSporeTensorCreate0030
 * @tc.number SUBAIMindSporeTensorCreate0030
 * @tc.desc   SUBAIMindSporeTensorCreate0030
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0030()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NCHW);
    ASSERT_EQ(OH_AI_TensorGetFormat(tensor), OH_AI_FORMAT_NCHW);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 多次设置format
/**
 * @tc.name   SUBAIMindSporeTensorCreate0031
 * @tc.number SUBAIMindSporeTensorCreate0031
 * @tc.desc   SUBAIMindSporeTensorCreate0031
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0031()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NCHW);
    ASSERT_EQ(OH_AI_TensorGetFormat(tensor), OH_AI_FORMAT_NCHW);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NHWC);
    ASSERT_EQ(OH_AI_TensorGetFormat(tensor), OH_AI_FORMAT_NHWC);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 循环设置所有的format类型
/**
 * @tc.name   SUBAIMindSporeTensorCreate0032
 * @tc.number SUBAIMindSporeTensorCreate0032
 * @tc.desc   SUBAIMindSporeTensorCreate0032
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0032()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    constexpr size_t formatNum = 18;
    OH_AI_Format format[formatNum] = { OH_AI_FORMAT_NCHW, OH_AI_FORMAT_NHWC,   OH_AI_FORMAT_NHWC4, OH_AI_FORMAT_HWKC,
                                       OH_AI_FORMAT_HWCK, OH_AI_FORMAT_KCHW,   OH_AI_FORMAT_CKHW,  OH_AI_FORMAT_KHWC,
                                       OH_AI_FORMAT_CHWK, OH_AI_FORMAT_HW,     OH_AI_FORMAT_HW4,   OH_AI_FORMAT_NC,
                                       OH_AI_FORMAT_NC4,  OH_AI_FORMAT_NC4HW4, OH_AI_FORMAT_NCDHW, OH_AI_FORMAT_NWC,
                                       OH_AI_FORMAT_NCW };
    for (size_t i = 0; i < formatNum; ++i) {
        OH_AI_TensorSetFormat(tensor, format[i]);
        ASSERT_EQ(OH_AI_TensorGetFormat(tensor), format[i]);
    }
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetFormat接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0033
 * @tc.number SUBAIMindSporeTensorCreate0033
 * @tc.desc   SUBAIMindSporeTensorCreate0033
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0033()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetFormat(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetData接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0034
 * @tc.number SUBAIMindSporeTensorCreate0034
 * @tc.desc   SUBAIMindSporeTensorCreate0034
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0034()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorSetData(nullptr, data);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetData接口，data为空指针nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0035
 * @tc.number SUBAIMindSporeTensorCreate0035
 * @tc.desc   SUBAIMindSporeTensorCreate0035
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0035()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 6 };
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, 6 * 4);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorSetData(tensor, nullptr);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetData接口，正常设置data
/**
 * @tc.name   SUBAIMindSporeTensorCreate0036
 * @tc.number SUBAIMindSporeTensorCreate0036
 * @tc.desc   SUBAIMindSporeTensorCreate0036
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0036()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 6 };
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, 6 * 4);
    ASSERT_NE(tensor, nullptr);
    float data2[dataLen] = { 12, 22, 32, 42, 52, 62 };
    OH_AI_TensorSetData(tensor, data2);
    const float* retData = static_cast<const float*>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(retData, nullptr);
    OHPrintf("return data is:");
    for (size_t i = 0; i < dataLen; i++) {
        ASSERT_EQ(retData[i], data2[i]);
        OHPrintf("%f ", retData[i]);
    }
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetData接口，多次设置data
/**
 * @tc.name   SUBAIMindSporeTensorCreate0037
 * @tc.number SUBAIMindSporeTensorCreate0037
 * @tc.desc   SUBAIMindSporeTensorCreate0037
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0037()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 6 };
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, 6 * 4);
    ASSERT_NE(tensor, nullptr);
    float data2[dataLen] = { 12, 22, 32, 42, 52, 62 };
    float data3[dataLen] = { 13, 23, 33, 43, 53, 63 };
    OH_AI_TensorSetData(tensor, data2);
    OH_AI_TensorSetData(tensor, data3);
    const float* retData = static_cast<const float*>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(retData, nullptr);
    OHPrintf("return data is:");
    for (size_t i = 0; i < dataLen; i++) {
        ASSERT_EQ(retData[i], data3[i]);
        OHPrintf("%f ", retData[i]);
    }
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetData接口。tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0038
 * @tc.number SUBAIMindSporeTensorCreate0038
 * @tc.desc   SUBAIMindSporeTensorCreate0038
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0038()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetData(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetMutableData接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0039
 * @tc.number SUBAIMindSporeTensorCreate0039
 * @tc.desc   SUBAIMindSporeTensorCreate0039
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0039()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetMutableData(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetElementNum接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0040
 * @tc.number SUBAIMindSporeTensorCreate0040
 * @tc.desc   SUBAIMindSporeTensorCreate0040
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0040()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    int64_t element = OH_AI_TensorGetElementNum(nullptr);
    std::cout << element << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetDataSize接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0041
 * @tc.number SUBAIMindSporeTensorCreate0041
 * @tc.desc   SUBAIMindSporeTensorCreate0041
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0041()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    size_t datasize = OH_AI_TensorGetDataSize(nullptr);
    std::cout << datasize << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetDataSize接口，未填入数据
/**
 * @tc.name   SUBAIMindSporeTensorCreate0042
 * @tc.number SUBAIMindSporeTensorCreate0042
 * @tc.desc   SUBAIMindSporeTensorCreate0042
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0042()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    size_t datasize = OH_AI_TensorGetDataSize(tensor);
    std::cout << datasize << std::endl;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetUserData接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0043
 * @tc.number SUBAIMindSporeTensorCreate0043
 * @tc.desc   SUBAIMindSporeTensorCreate0043
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0043()
{
    const int userData = 6 * 4;
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    auto status = OH_AI_TensorSetUserData(nullptr, data, userData);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_NULLPTR);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetUserData接口，data为空指针nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0044
 * @tc.number SUBAIMindSporeTensorCreate0044
 * @tc.desc   SUBAIMindSporeTensorCreate0044
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0044()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 6 };
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, 6 * 4);
    ASSERT_NE(tensor, nullptr);
    auto status = OH_AI_TensorSetUserData(tensor, nullptr, 0);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_PARAM_INVALID);
    auto status01 = OH_AI_TensorSetUserData(tensor, data, 0);
    ASSERT_EQ(status01, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetUserData接口，正常设置data
/**
 * @tc.name   SUBAIMindSporeTensorCreate0045
 * @tc.number SUBAIMindSporeTensorCreate0045
 * @tc.desc   SUBAIMindSporeTensorCreate0045
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0045()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 6 };
    constexpr size_t dataLen = 6;
    constexpr size_t userData = 6 * 4;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, 6 * 4);
    ASSERT_NE(tensor, nullptr);
    float data2[dataLen] = { 12, 22, 32, 42, 52, 62 };
    auto status = OH_AI_TensorSetUserData(tensor, data2, userData);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    const float* retData = static_cast<const float*>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(retData, nullptr);
    OHPrintf("return data is:");
    for (size_t i = 0; i < dataLen; i++) {
        ASSERT_EQ(retData[i], data2[i]);
        OHPrintf("%f ", retData[i]);
    }
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetUserData接口，多次设置data
/**
 * @tc.name   SUBAIMindSporeTensorCreate0046
 * @tc.number SUBAIMindSporeTensorCreate0046
 * @tc.desc   SUBAIMindSporeTensorCreate0046
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0046()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 1;
    constexpr size_t userData = 6 * 4;
    int64_t createShape[createShapeNum] = { 6 };
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, 6 * 4);
    ASSERT_NE(tensor, nullptr);
    float data2[dataLen] = { 12, 22, 32, 42, 52, 62 };
    float data3[dataLen] = { 13, 23, 33, 43, 53, 63 };
    auto status01 = OH_AI_TensorSetUserData(tensor, data2, userData);
    ASSERT_EQ(status01, OH_AI_STATUS_SUCCESS);
    auto status02 = OH_AI_TensorSetUserData(tensor, data3, userData);
    ASSERT_EQ(status02, OH_AI_STATUS_SUCCESS);
    const float* retData = static_cast<const float*>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(retData, nullptr);
    OHPrintf("return data is:");
    for (size_t i = 0; i < dataLen; i++) {
        ASSERT_EQ(retData[i], data3[i]);
        OHPrintf("%f ", retData[i]);
    }
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetAllocator接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0047
 * @tc.number SUBAIMindSporeTensorCreate0047
 * @tc.desc   SUBAIMindSporeTensorCreate0047
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0047()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 6 };
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, 6 * 4);
    ASSERT_NE(tensor, nullptr);
    void* inAllocator = OH_AI_TensorGetAllocator(tensor);
    auto status = OH_AI_TensorSetAllocator(nullptr, inAllocator);
    ASSERT_EQ(status, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetAllocator接口，正常设置allocator
/**
 * @tc.name   SUBAIMindSporeTensorCreate0048
 * @tc.number SUBAIMindSporeTensorCreate0048
 * @tc.desc   SUBAIMindSporeTensorCreate0048
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0048()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 6 };
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, 6 * 4);
    ASSERT_NE(tensor, nullptr);
    void* inAllocator = OH_AI_TensorGetAllocator(tensor);
    ASSERT_EQ(inAllocator, nullptr);
    OH_AI_TensorSetAllocator(tensor, inAllocator);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorSetAllocator接口，多次设置allocator
/**
 * @tc.name   SUBAIMindSporeTensorCreate0049
 * @tc.number SUBAIMindSporeTensorCreate0049
 * @tc.desc   SUBAIMindSporeTensorCreate0049
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0049()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 6 };
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, 6 * 4);
    ASSERT_NE(tensor, nullptr);
    void* inAllocator = OH_AI_TensorGetAllocator(tensor);
    OH_AI_TensorSetAllocator(tensor, inAllocator);
    OH_AI_TensorSetAllocator(tensor, inAllocator);
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_TensorGetAllocator接口，tensor为nullptr
/**
 * @tc.name   SUBAIMindSporeTensorCreate0050
 * @tc.number SUBAIMindSporeTensorCreate0050
 * @tc.desc   SUBAIMindSporeTensorCreate0050
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeTensorCreate0050()
{
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    OH_AI_TensorGetAllocator(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

} // namespace MindSpore
} // namespace Acts
