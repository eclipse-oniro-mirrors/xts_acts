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
// Expected values for component codes.
constexpr auto EXPECT_OH_AI_COMPCODE_CORE = 0;
constexpr auto EXPECT_OH_AI_COMPCODE_MD = 268435456;
constexpr auto EXPECT_OH_AI_COMPCODE_ME = 536870912;
constexpr auto EXPECT_OH_AI_COMPCODE_MC = 805306368;
constexpr auto EXPECT_OH_AI_COMPCODE_LITE = 4026531840U;

// Expected values for core and lite status codes.
constexpr auto EXPECT_OH_AI_STATUS_CORE_FAILED = 1;
constexpr auto EXPECT_OH_AI_STATUS_LITE_NO_CHANGE = 4294967292U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_SUCCESS_EXIT = 4294967291U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_MEMORY_FAILED = 4294967290U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_NOT_SUPPORT = 4294967289U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_THREADPOOL_ERROR = 4294967288U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_UNINITIALIZED_OBJ = 4294967287U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_OUT_OF_TENSOR_RANGE = 4294967196U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_REENTRANT_ERROR = 4294967194U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_GRAPH_FILE_ERROR = 4294967096U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_NOT_FIND_OP = 4294966996U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_INVALID_OP_NAME = 4294966995U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_INVALID_OP_ATTR = 4294966994U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_OP_EXECUTE_FAILURE = 4294966993U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_FORMAT_ERROR = 4294966896U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_INFER_ERROR = 4294966796U;
constexpr auto EXPECT_OH_AI_STATUS_LITE_INFER_INVALID = 4294966795U;

// Expected values for device and NNRT device types.
constexpr auto EXPECT_OH_AI_DEVICETYPE_GPU = 1;
constexpr auto EXPECT_OH_AI_NNRTDEVICE_CPU = 1;
constexpr auto EXPECT_OH_AI_NNRTDEVICE_GPU = 2;
constexpr auto EXPECT_OH_AI_NNRTDEVICE_ACCELERATOR = 3;

// Expected values for kernel optimization and data types.
constexpr auto EXPECT_OH_AI_KO0 = 0;
constexpr auto EXPECT_OH_AI_KO3 = 3;
constexpr auto EXPECT_OH_AI_KAUTO = 4;
constexpr auto EXPECT_OH_AI_KOPTIMIZATIONTYPE = 4294967295U;

constexpr auto EXPECT_OH_AI_DATATYPE_UNKNOWN = 0;
constexpr auto EXPECT_OH_AI_DATATYPE_OBJECTTYPE_STRING = 12;
constexpr auto EXPECT_OH_AI_DATATYPE_OBJECTTYPE_LIST = 13;
constexpr auto EXPECT_OH_AI_DATATYPE_OBJECTTYPE_TUPLE = 14;
constexpr auto EXPECT_OH_AI_DATATYPE_OBJECTTYPE_TENSOR = 17;
constexpr auto EXPECT_OH_AI_DATATYPE_NUMBERTYPE_BEGIN = 29;
constexpr auto EXPECT_OH_AI_DATATYPE_NUMBERTYPE_END = 46;
} // namespace

// 正常调用接口，创建model对象
/**
 * @tc.name   SUBAIMindSporeModelCreate0001
 * @tc.number SUBAIMindSporeModelCreate0001
 * @tc.desc   SUBAIMindSporeModelCreate0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0001()
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
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常调用接口，创建多个model对象
/**
 * @tc.name   SUBAIMindSporeModelCreate0002
 * @tc.number SUBAIMindSporeModelCreate0002
 * @tc.desc   SUBAIMindSporeModelCreate0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpuDeviceInfo2);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_Status buildRet2 =
        OH_AI_ModelBuildFromFile(model2, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(buildRet2, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model);
    OH_AI_ModelDestroy(&model2);
    return OH_AI_STATUS_SUCCESS;
}

// 正常调用接口，循环创建model对象
/**
 * @tc.name   SUBAIMindSporeModelCreate0003
 * @tc.number SUBAIMindSporeModelCreate0003
 * @tc.desc   SUBAIMindSporeModelCreate0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0003()
{
    for (size_t i = 0; i < LOOP_COUNT_TEN; i++) {
        OHPrintf("==========OH_AI_ContextCreate==========\n");
        OH_AI_ContextHandle context = OH_AI_ContextCreate();
        OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
        OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
        OH_AI_ModelHandle model = OH_AI_ModelCreate();
        OH_AI_Status buildRet =
            OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
        ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
        OHPrintf("==========OH_AI_ModelDestroy==========\n");
        OH_AI_ContextDestroy(&context);
        OH_AI_ModelDestroy(&model);
    }
    return OH_AI_STATUS_SUCCESS;
}

// 正常调用接口，多次释放model对象
/**
 * @tc.name   SUBAIMindSporeModelCreate0005
 * @tc.number SUBAIMindSporeModelCreate0005
 * @tc.desc   SUBAIMindSporeModelCreate0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0005()
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
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuild接口，正常调用
/**
 * @tc.name   SUBAIMindSporeModelCreate0006
 * @tc.number SUBAIMindSporeModelCreate0006
 * @tc.desc   SUBAIMindSporeModelCreate0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0006()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size;
    char* modelBuf = ReadFile(FilePath("ml_face_isface.ms").c_str(), &size);
    ASSERT_NE(modelBuf, nullptr);
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet = OH_AI_ModelBuild(model, modelBuf, size, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuild接口，model多次build
/**
 * @tc.name   SUBAIMindSporeModelCreate0007
 * @tc.number SUBAIMindSporeModelCreate0007
 * @tc.desc   SUBAIMindSporeModelCreate0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0007()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size;
    char* modelBuf = ReadFile(FilePath("ml_face_isface.ms").c_str(), &size);
    ASSERT_NE(modelBuf, nullptr);
    size_t size2;
    char* modelBuf2 = ReadFile(FilePath("aiy_vision_classifier_plants_V1_3.ms").c_str(), &size2);
    ASSERT_NE(modelBuf2, nullptr);
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpuDeviceInfo2);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet = OH_AI_ModelBuild(model, modelBuf, size, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_Status buildRet2 = OH_AI_ModelBuild(model, modelBuf2, size2, OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(buildRet2, OH_AI_STATUS_LITE_MODEL_REBUILD);
    delete[] modelBuf;
    delete[] modelBuf2;
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuild接口model对象为nullptr
/**
 * @tc.name   SUBAIMindSporeModelCreate0008
 * @tc.number SUBAIMindSporeModelCreate0008
 * @tc.desc   SUBAIMindSporeModelCreate0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0008()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size;
    char* modelBuf = ReadFile(FilePath("ml_face_isface.ms").c_str(), &size);
    ASSERT_NE(modelBuf, nullptr);
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_Status buildRet = OH_AI_ModelBuild(nullptr, modelBuf, size, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_NULLPTR);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuild接口model data对象为nullptr
/**
 * @tc.name   SUBAIMindSporeModelCreate0009
 * @tc.number SUBAIMindSporeModelCreate0009
 * @tc.desc   SUBAIMindSporeModelCreate0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0009()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size;
    char* modelBuf = ReadFile(FilePath("ml_face_isface.ms").c_str(), &size);
    ASSERT_NE(modelBuf, nullptr);
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet = OH_AI_ModelBuild(model, nullptr, 0, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_NULLPTR);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuild接口model type非法，传入OH_AI_MODELTYPE_INVALID
/**
 * @tc.name   SUBAIMindSporeModelCreate0010
 * @tc.number SUBAIMindSporeModelCreate0010
 * @tc.desc   SUBAIMindSporeModelCreate0010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0010()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size;
    char* modelBuf = ReadFile(FilePath("ml_face_isface.ms").c_str(), &size);
    ASSERT_NE(modelBuf, nullptr);
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet = OH_AI_ModelBuild(model, modelBuf, size, OH_AI_MODELTYPE_INVALID, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_PARAM_INVALID);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuild接口context对象为nullptr
/**
 * @tc.name   SUBAIMindSporeModelCreate0011
 * @tc.number SUBAIMindSporeModelCreate0011
 * @tc.desc   SUBAIMindSporeModelCreate0011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0011()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size;
    char* modelBuf = ReadFile(FilePath("ml_face_isface.ms").c_str(), &size);
    ASSERT_NE(modelBuf, nullptr);
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet = OH_AI_ModelBuild(model, modelBuf, size, OH_AI_MODELTYPE_MINDIR, nullptr);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_NULLPTR);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuild接口data_size小于实际model_data
/**
 * @tc.name   SUBAIMindSporeModelCreate0012
 * @tc.number SUBAIMindSporeModelCreate0012
 * @tc.desc   SUBAIMindSporeModelCreate0012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0012()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size;
    char* modelBuf = ReadFile(FilePath("ml_face_isface.ms").c_str(), &size);
    ASSERT_NE(modelBuf, nullptr);
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet = OH_AI_ModelBuild(model, modelBuf, 1, OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_ERROR);
    delete[] modelBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuildFromFile接口model为nullptr
/**
 * @tc.name   SUBAIMindSporeModelCreate0013
 * @tc.number SUBAIMindSporeModelCreate0013
 * @tc.desc   SUBAIMindSporeModelCreate0013
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0013()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(nullptr, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuildFromFile接口modelPath有误
/**
 * @tc.name   SUBAIMindSporeModelCreate0014
 * @tc.number SUBAIMindSporeModelCreate0014
 * @tc.desc   SUBAIMindSporeModelCreate0014
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0014()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, ActsMindSporeConstants::FILES_DIR.c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuildFromFile接口model type非法，传入OH_AI_MODELTYPE_INVALID
/**
 * @tc.name   SUBAIMindSporeModelCreate0015
 * @tc.number SUBAIMindSporeModelCreate0015
 * @tc.desc   SUBAIMindSporeModelCreate0015
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0015()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_INVALID, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuildFromFile接口context对象为nullptr
/**
 * @tc.name   SUBAIMindSporeModelCreate0016
 * @tc.number SUBAIMindSporeModelCreate0016
 * @tc.desc   SUBAIMindSporeModelCreate0016
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0016()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, nullptr);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuildFromFile接口，正常调用
/**
 * @tc.name   SUBAIMindSporeModelCreate0017
 * @tc.number SUBAIMindSporeModelCreate0017
 * @tc.desc   SUBAIMindSporeModelCreate0017
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0017()
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
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelBuildFromFile接口，model多次build
/**
 * @tc.name   SUBAIMindSporeModelCreate0018
 * @tc.number SUBAIMindSporeModelCreate0018
 * @tc.desc   SUBAIMindSporeModelCreate0018
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0018()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpuDeviceInfo2);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_Status buildRet2 = OH_AI_ModelBuildFromFile(
        model, FilePath("aiy_vision_classifier_plants_V1_3.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context2);
    ASSERT_EQ(buildRet2, OH_AI_STATUS_LITE_MODEL_REBUILD);
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelPredict接口model为nullptr
/**
 * @tc.name   SUBAIMindSporeModelCreate0019
 * @tc.number SUBAIMindSporeModelCreate0019
 * @tc.desc   SUBAIMindSporeModelCreate0019
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0019()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(nullptr, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelPredict接口input为空
/**
 * @tc.name   SUBAIMindSporeModelCreate0020
 * @tc.number SUBAIMindSporeModelCreate0020
 * @tc.desc   SUBAIMindSporeModelCreate0020
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0020()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs;
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    OHPrintf("==========predictRet==========%d\n", predictRet);
    ASSERT_EQ(predictRet, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelPredict接口input给非法数据（其他模型输入、非input数据）
/**
 * @tc.name   SUBAIMindSporeModelCreate0021
 * @tc.number SUBAIMindSporeModelCreate0021
 * @tc.desc   SUBAIMindSporeModelCreate0021
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0021()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    constexpr size_t createShapeNum = 1;
    int64_t createShape[createShapeNum] = { 6 };
    float data[6] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, data, sizeof(data));
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandleArray inTensorArray;
    inTensorArray.handle_num = 1;
    inTensorArray.handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * inTensorArray.handle_num);
    inTensorArray.handle_list[0] = tensor;
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inTensorArray, &outputs, nullptr, nullptr);
    std::cout << predictRet << std::endl;
    ASSERT_EQ(predictRet, OH_AI_STATUS_LITE_INPUT_TENSOR_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_TensorDestroy(&tensor);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelPredict接口，callback功能
/**
 * @tc.name   SUBAIMindSporeModelCreate0022
 * @tc.number SUBAIMindSporeModelCreate0022
 * @tc.desc   SUBAIMindSporeModelCreate0022
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0022()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict Callback==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_KernelCallBack beforeCallBack = PrintBeforeCallback;
    OH_AI_KernelCallBack afterCallBack = PrintAfterCallback;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, beforeCallBack, afterCallBack);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("=========CompareResult===========\n");
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelResize接口resize动态模型，shape_infos为nullptr
/**
 * @tc.name   SUBAIMindSporeModelCreate0027
 * @tc.number SUBAIMindSporeModelCreate0027
 * @tc.desc   SUBAIMindSporeModelCreate0027
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0027()
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
    OH_AI_ShapeInfo shapeInfos[] = { { 4, { 1, 3, 48, 48 } } };
    OH_AI_Status resizeRet = OH_AI_ModelResize(model, inputs, shapeInfos, inputs.handle_num);
    ASSERT_EQ(resizeRet, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelResize接口resize静态模型
/**
 * @tc.name   SUBAIMindSporeModelCreate0028
 * @tc.number SUBAIMindSporeModelCreate0028
 * @tc.desc   SUBAIMindSporeModelCreate0028
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0028()
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
    OH_AI_ShapeInfo shapeInfos[] = { { 4, { 1, 112, 112, 3 } } };
    OH_AI_Status resizeRet = OH_AI_ModelResize(model, inputs, shapeInfos, inputs.handle_num);
    ASSERT_EQ(resizeRet, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常调用ModelGetInputs
/**
 * @tc.name   SUBAIMindSporeModelCreate0029
 * @tc.number SUBAIMindSporeModelCreate0029
 * @tc.desc   SUBAIMindSporeModelCreate0029
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0029()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 多次调用ModelGetInputs
/**
 * @tc.name   SUBAIMindSporeModelCreate0030
 * @tc.number SUBAIMindSporeModelCreate0030
 * @tc.desc   SUBAIMindSporeModelCreate0030
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0030()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    OH_AI_TensorHandleArray inputs2 = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs2.handle_list, nullptr);
    FillInputsData(inputs2, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs2, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelGetInputs,model为nullptr
/**
 * @tc.name   SUBAIMindSporeModelCreate0031
 * @tc.number SUBAIMindSporeModelCreate0031
 * @tc.desc   SUBAIMindSporeModelCreate0031
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0031()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ModelGetInputs(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// 正常调用OH_AI_ModelGetOutputs
/**
 * @tc.name   SUBAIMindSporeModelCreate0032
 * @tc.number SUBAIMindSporeModelCreate0032
 * @tc.desc   SUBAIMindSporeModelCreate0032
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0032()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    ASSERT_NE(outputs.handle_list, nullptr);
    ASSERT_NE(outputs.handle_num, 0);
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 多次调用OH_AI_ModelGetOutputs
/**
 * @tc.name   SUBAIMindSporeModelCreate0033
 * @tc.number SUBAIMindSporeModelCreate0033
 * @tc.desc   SUBAIMindSporeModelCreate0033
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0033()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    ASSERT_NE(outputs.handle_list, nullptr);
    OH_AI_TensorHandleArray outputs2 = OH_AI_ModelGetOutputs(model);
    ASSERT_NE(outputs2.handle_list, nullptr);
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs2, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs2, "ml_face_isface");
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelGetOutputs，model为nullptr
/**
 * @tc.name   SUBAIMindSporeModelCreate0034
 * @tc.number SUBAIMindSporeModelCreate0034
 * @tc.desc   SUBAIMindSporeModelCreate0034
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0034()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ModelGetOutputs(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelGetInputByTensorName
/**
 * @tc.name   SUBAIMindSporeModelCreate0035
 * @tc.number SUBAIMindSporeModelCreate0035
 * @tc.desc   SUBAIMindSporeModelCreate0035
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0035()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelGetInputByTensorName==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetInputByTensorName(model, "data");
    ASSERT_NE(tensor, nullptr);
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

// OH_AI_ModelGetInputByTensorName，model为空
/**
 * @tc.name   SUBAIMindSporeModelCreate0036
 * @tc.number SUBAIMindSporeModelCreate0036
 * @tc.desc   SUBAIMindSporeModelCreate0036
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0036()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ModelGetInputByTensorName(nullptr, "data");
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelGetInputByTensorName，名字不存在
/**
 * @tc.name   SUBAIMindSporeModelCreate0037
 * @tc.number SUBAIMindSporeModelCreate0037
 * @tc.desc   SUBAIMindSporeModelCreate0037
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0037()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========OH_AI_ModelGetInputByTensorName==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetInputByTensorName(model, "aaa");
    ASSERT_EQ(tensor, nullptr);
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelGetOutputByTensorName
/**
 * @tc.name   SUBAIMindSporeModelCreate0038
 * @tc.number SUBAIMindSporeModelCreate0038
 * @tc.desc   SUBAIMindSporeModelCreate0038
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0038()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetOutputByTensorName(model, "prob");
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandleArray outputs;
    outputs.handle_num = 1;
    outputs.handle_list = (OH_AI_TensorHandle*)malloc(sizeof(OH_AI_TensorHandle) * 1);
    outputs.handle_list[0] = tensor;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelGetOutputByTensorName，model为空
/**
 * @tc.name   SUBAIMindSporeModelCreate0039
 * @tc.number SUBAIMindSporeModelCreate0039
 * @tc.desc   SUBAIMindSporeModelCreate0039
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0039()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ModelGetOutputByTensorName(nullptr, "prob");
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelGetOutputByTensorName，名字不存在
/**
 * @tc.name   SUBAIMindSporeModelCreate0040
 * @tc.number SUBAIMindSporeModelCreate0040
 * @tc.desc   SUBAIMindSporeModelCreate0040
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0040()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========FillModelInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetOutputByTensorName(model, "aaa");
    ASSERT_EQ(tensor, nullptr);
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 两个model调用同一个context
/**
 * @tc.name   SUBAIMindSporeModelCreate0041
 * @tc.number SUBAIMindSporeModelCreate0041
 * @tc.desc   SUBAIMindSporeModelCreate0041
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0041()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    OH_AI_Status buildRet2 = OH_AI_ModelBuildFromFile(
        model2, FilePath("aiy_vision_classifier_plants_V1_3.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet2, OH_AI_STATUS_LITE_PARAM_INVALID);
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OH_AI_ModelDestroy(&model2);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ModelCreate同时创建3个model
/**
 * @tc.name   SUBAIMindSporeModelCreate0042
 * @tc.number SUBAIMindSporeModelCreate0042
 * @tc.desc   SUBAIMindSporeModelCreate0042
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelCreate0042()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpuDeviceInfo2);
    OH_AI_ContextHandle context3 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo3 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context3, cpuDeviceInfo3);
    OHPrintf("==========Model Build==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    OHPrintf("==========Model Build2==========\n");
    OH_AI_ModelHandle model2 = OH_AI_ModelCreate();
    ASSERT_NE(model2, nullptr);
    ModelPredict(model2, context2, ModelPredictOptions("ml_face_isface_quant", {}, false, false, false));
    OHPrintf("==========Model Build3==========\n");
    OH_AI_ModelHandle model3 = OH_AI_ModelCreate();
    ASSERT_NE(model3, nullptr);
    OH_AI_ShapeInfo shapeInfos = { 4, { 1, 32, 512, 1 } };
    ModelPredict(model3, context3, ModelPredictOptions("ml_ocr_cn", shapeInfos, false, false, false));
    return OH_AI_STATUS_SUCCESS;
}

// 完善枚举值覆盖率
/**
 * @tc.name   SUBAIMindSporeCovered0001
 * @tc.number SUBAIMindSporeCovered0001
 * @tc.desc   SUBAIMindSporeCovered0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeCovered0001()
{
    ASSERT_EQ(OH_AI_COMPCODE_CORE, EXPECT_OH_AI_COMPCODE_CORE);
    ASSERT_EQ(OH_AI_COMPCODE_MD, EXPECT_OH_AI_COMPCODE_MD);
    ASSERT_EQ(OH_AI_COMPCODE_ME, EXPECT_OH_AI_COMPCODE_ME);
    ASSERT_EQ(OH_AI_COMPCODE_MC, EXPECT_OH_AI_COMPCODE_MC);
    ASSERT_EQ(OH_AI_COMPCODE_LITE, EXPECT_OH_AI_COMPCODE_LITE);

    ASSERT_EQ(OH_AI_STATUS_CORE_FAILED, EXPECT_OH_AI_STATUS_CORE_FAILED);
    ASSERT_EQ(OH_AI_STATUS_LITE_NO_CHANGE, EXPECT_OH_AI_STATUS_LITE_NO_CHANGE);
    ASSERT_EQ(OH_AI_STATUS_LITE_SUCCESS_EXIT, EXPECT_OH_AI_STATUS_LITE_SUCCESS_EXIT);
    ASSERT_EQ(OH_AI_STATUS_LITE_MEMORY_FAILED, EXPECT_OH_AI_STATUS_LITE_MEMORY_FAILED);
    ASSERT_EQ(OH_AI_STATUS_LITE_NOT_SUPPORT, EXPECT_OH_AI_STATUS_LITE_NOT_SUPPORT);
    ASSERT_EQ(OH_AI_STATUS_LITE_THREADPOOL_ERROR, EXPECT_OH_AI_STATUS_LITE_THREADPOOL_ERROR);
    ASSERT_EQ(OH_AI_STATUS_LITE_UNINITIALIZED_OBJ, EXPECT_OH_AI_STATUS_LITE_UNINITIALIZED_OBJ);
    ASSERT_EQ(OH_AI_STATUS_LITE_OUT_OF_TENSOR_RANGE, EXPECT_OH_AI_STATUS_LITE_OUT_OF_TENSOR_RANGE);
    ASSERT_EQ(OH_AI_STATUS_LITE_REENTRANT_ERROR, EXPECT_OH_AI_STATUS_LITE_REENTRANT_ERROR);
    ASSERT_EQ(OH_AI_STATUS_LITE_GRAPH_FILE_ERROR, EXPECT_OH_AI_STATUS_LITE_GRAPH_FILE_ERROR);
    ASSERT_EQ(OH_AI_STATUS_LITE_NOT_FIND_OP, EXPECT_OH_AI_STATUS_LITE_NOT_FIND_OP);
    ASSERT_EQ(OH_AI_STATUS_LITE_INVALID_OP_NAME, EXPECT_OH_AI_STATUS_LITE_INVALID_OP_NAME);
    ASSERT_EQ(OH_AI_STATUS_LITE_INVALID_OP_ATTR, EXPECT_OH_AI_STATUS_LITE_INVALID_OP_ATTR);
    ASSERT_EQ(OH_AI_STATUS_LITE_OP_EXECUTE_FAILURE, EXPECT_OH_AI_STATUS_LITE_OP_EXECUTE_FAILURE);
    ASSERT_EQ(OH_AI_STATUS_LITE_FORMAT_ERROR, EXPECT_OH_AI_STATUS_LITE_FORMAT_ERROR);
    ASSERT_EQ(OH_AI_STATUS_LITE_INFER_ERROR, EXPECT_OH_AI_STATUS_LITE_INFER_ERROR);
    ASSERT_EQ(OH_AI_STATUS_LITE_INFER_INVALID, EXPECT_OH_AI_STATUS_LITE_INFER_INVALID);

    ASSERT_EQ(OH_AI_DEVICETYPE_GPU, EXPECT_OH_AI_DEVICETYPE_GPU);
    ASSERT_EQ(OH_AI_NNRTDEVICE_CPU, EXPECT_OH_AI_NNRTDEVICE_CPU);
    ASSERT_EQ(OH_AI_NNRTDEVICE_GPU, EXPECT_OH_AI_NNRTDEVICE_GPU);
    ASSERT_EQ(OH_AI_NNRTDEVICE_ACCELERATOR, EXPECT_OH_AI_NNRTDEVICE_ACCELERATOR);

    ASSERT_EQ(OH_AI_KO0, EXPECT_OH_AI_KO0);
    ASSERT_EQ(OH_AI_KO3, EXPECT_OH_AI_KO3);
    ASSERT_EQ(OH_AI_KAUTO, EXPECT_OH_AI_KAUTO);
    ASSERT_EQ(OH_AI_KOPTIMIZATIONTYPE, EXPECT_OH_AI_KOPTIMIZATIONTYPE);

    ASSERT_EQ(OH_AI_DATATYPE_UNKNOWN, EXPECT_OH_AI_DATATYPE_UNKNOWN);
    ASSERT_EQ(OH_AI_DATATYPE_OBJECTTYPE_STRING, EXPECT_OH_AI_DATATYPE_OBJECTTYPE_STRING);
    ASSERT_EQ(OH_AI_DATATYPE_OBJECTTYPE_LIST, EXPECT_OH_AI_DATATYPE_OBJECTTYPE_LIST);
    ASSERT_EQ(OH_AI_DATATYPE_OBJECTTYPE_TUPLE, EXPECT_OH_AI_DATATYPE_OBJECTTYPE_TUPLE);
    ASSERT_EQ(OH_AI_DATATYPE_OBJECTTYPE_TENSOR, EXPECT_OH_AI_DATATYPE_OBJECTTYPE_TENSOR);
    ASSERT_EQ(OH_AI_DATATYPE_NUMBERTYPE_BEGIN, EXPECT_OH_AI_DATATYPE_NUMBERTYPE_BEGIN);
    ASSERT_EQ(OH_AI_DATATYPE_NUMBERTYPE_END, EXPECT_OH_AI_DATATYPE_NUMBERTYPE_END);
    return OH_AI_STATUS_SUCCESS;
}

/**
 * @tc.name   SUBAIMindSporeModelLoadConfig0001
 * @tc.number SUBAIMindSporeModelLoadConfig0001
 * @tc.desc   正常场景1：合法参数+有效配置文件 → 返回OH_AI_STATUS_SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelLoadConfig0001()
{
    OHPrintf("==========创建上下文与模型==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context); // 添加CPU设备支持
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========加载合法配置文件==========\n");
    // 测试目标：加载存在且格式正确的配置文件
    OH_AI_Status loadStatus = OH_AI_ModelLoadConfig(model, FilePath("ml_face_isface.config").c_str());
    ASSERT_EQ(loadStatus, OH_AI_STATUS_SUCCESS);
    // 从文件加载模型
    OHPrintf("==========从文件加载模型==========\n");
    auto status =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(status, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareResult==========\n");
    CompareResult(outputs, "ml_face_isface");
    // 资源释放
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

/**
 * @tc.name   SUBAIMindSporeModelLoadConfig0002
 * @tc.number SUBAIMindSporeModelLoadConfig0002
 * @tc.desc   异常场景1：config_file_path为nullptr → 返回OH_AI_STATUS_LITE_NULLPTR
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelLoadConfig0002()
{
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status loadStatus = OH_AI_ModelLoadConfig(model, nullptr);
    std::cout << "loadStatus is " << loadStatus << std::endl;
    ASSERT_EQ(loadStatus, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_Status loadStatus01 = OH_AI_ModelLoadConfig(nullptr, FilePath("ml_face_isface.config").c_str());
    std::cout << "loadStatus01 is " << loadStatus01 << std::endl;
    ASSERT_EQ(loadStatus01, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

/**
 * @tc.name   SUBAIMindSporeModelLoadConfig0003
 * @tc.number SUBAIMindSporeModelLoadConfig0003
 * @tc.desc   异常场景2：配置文件不存在 → 必须返回非SUCCESS且非NULLPTR
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelLoadConfig0003()
{
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status loadStatus = OH_AI_ModelLoadConfig(model, FilePath("not_exist.config").c_str()); // 不存在
    std::cout << "loadStatus is " << loadStatus << std::endl;
    // 修正：同时断言非SUCCESS和非NULLPTR，确保错误被检测
    ASSERT_NE(loadStatus, OH_AI_STATUS_SUCCESS);
    ASSERT_NE(loadStatus, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

/**
 * @tc.name   SUBAIMindSporeModelLoadConfig0004
 * @tc.number SUBAIMindSporeModelLoadConfig0004
 * @tc.desc   异常场景3：配置内容无效（如不支持的数据类型）→ 返回SUCCESS
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeModelLoadConfig0004()
{
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_Status loadStatus = OH_AI_ModelLoadConfig(model, FilePath("invalid_content.config").c_str()); // 内容无效
    std::cout << "loadStatus is " << loadStatus << std::endl;
    ASSERT_EQ(loadStatus, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

} // namespace MindSpore
} // namespace Acts
