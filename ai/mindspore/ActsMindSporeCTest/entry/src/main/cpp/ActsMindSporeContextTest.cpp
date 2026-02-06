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
bool AddFirstNpuDeviceByType(OH_AI_ContextHandle context)
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return false;
    }

    const std::string npuNamePrefix = "NPU_";
    OH_AI_NNRTDeviceType npuType = OH_AI_NNRTDEVICE_OTHERS;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        std::cout << "OH_AI_GetTypeFromNNRTDeviceDesc " << type << std::endl;
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            npuType = type;
        }
    }

    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByType(npuType);
    ASSERT_NE(nnrtDeviceInfo, nullptr);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    return true;
}

bool AddFirstNpuDeviceId(OH_AI_DeviceInfoHandle deviceInfo)
{
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        return false;
    }
    const std::string npuNamePrefix = "NPU_";
    NNRTDeviceDesc* matched = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            matched = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    if (matched == nullptr) {
        OH_AI_DestroyAllNNRTDeviceDescs(&descs);
        return false;
    }
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(matched);
    OH_AI_DeviceInfoSetDeviceId(deviceInfo, id);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    return true;
}
} // namespace


// 创建多个context
/**
 * @tc.name   SUBAIMindSporeContextCreate0001
 * @tc.number SUBAIMindSporeContextCreate0001
 * @tc.desc   SUBAIMindSporeContextCreate0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0001()
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
    ASSERT_NE(inputs.handle_num, 0);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OHPrintf("==========OH_AI_ModelDestroy==========\n");
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextHandle context2 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo2 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context2, cpuDeviceInfo2);
    OH_AI_ContextHandle context3 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo3 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context3, cpuDeviceInfo3);
    OH_AI_ContextHandle context4 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo4 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context4, cpuDeviceInfo4);
    OH_AI_ContextHandle context5 = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo5 = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context5, cpuDeviceInfo5);
    OH_AI_ContextDestroy(&context2);
    OH_AI_ContextDestroy(&context3);
    OH_AI_ContextDestroy(&context4);
    OH_AI_ContextDestroy(&context5);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextDestroy接口context对象为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0002
 * @tc.number SUBAIMindSporeContextCreate0002
 * @tc.desc   SUBAIMindSporeContextCreate0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0002()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextDestroy(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadNum接口，context设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0003
 * @tc.number SUBAIMindSporeContextCreate0003
 * @tc.desc   SUBAIMindSporeContextCreate0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0003()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextSetThreadNum(nullptr, THREAD_NUM_DOUBLE);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadNum接口，threadNum设置为-100
/**
 * @tc.name   SUBAIMindSporeContextCreate0004
 * @tc.number SUBAIMindSporeContextCreate0004
 * @tc.desc   SUBAIMindSporeContextCreate0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0004()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadNum(context, INVALID_THREAD_NUM);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    std::cout << threadNum << std::endl;
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadNum接口，重复设置线程数，均可设置成功
/**
 * @tc.name   SUBAIMindSporeContextCreate0005
 * @tc.number SUBAIMindSporeContextCreate0005
 * @tc.desc   SUBAIMindSporeContextCreate0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0005()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_DOUBLE);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    ASSERT_EQ(threadNum, THREAD_NUM_DOUBLE);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_TEN);
    threadNum = OH_AI_ContextGetThreadNum(context);
    ASSERT_EQ(threadNum, THREAD_NUM_TEN);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadNum接口，设置的context已被销毁，然后传入ThreadNum接口
/**
 * @tc.name   SUBAIMindSporeContextCreate0006
 * @tc.number SUBAIMindSporeContextCreate0006
 * @tc.desc   SUBAIMindSporeContextCreate0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0006()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextDestroy(&context);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_DOUBLE);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextGetThreadNum接口，context设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0007
 * @tc.number SUBAIMindSporeContextCreate0007
 * @tc.desc   SUBAIMindSporeContextCreate0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0007()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    int32_t threadNum = OH_AI_ContextGetThreadNum(nullptr);
    std::cout << threadNum << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadAffinityMode接口，context设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0008
 * @tc.number SUBAIMindSporeContextCreate0008
 * @tc.desc   SUBAIMindSporeContextCreate0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0008()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextSetThreadAffinityMode(nullptr, 1);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadAffinityMode接口，mode设置为3
/**
 * @tc.name   SUBAIMindSporeContextCreate0009
 * @tc.number SUBAIMindSporeContextCreate0009
 * @tc.desc   SUBAIMindSporeContextCreate0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0009()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadAffinityMode(context, INVALID_THREAD_NUM);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    std::cout << threadAffinityMode << std::endl;
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_SUCCESS);
    threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    std::cout << threadAffinityMode << std::endl;
    OHPrintf("==========OH_AI_ModelGetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    FillInputsData(inputs, "ml_face_isface", true);
    OHPrintf("==========OH_AI_ModelPredict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========CompareModelOutputs==========\n");
    CompareResult(outputs, "ml_face_isface");
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadAffinityMode接口，重复设置各种绑核模式，均可设置成功
/**
 * @tc.name   SUBAIMindSporeContextCreate0010
 * @tc.number SUBAIMindSporeContextCreate0010
 * @tc.desc   SUBAIMindSporeContextCreate0010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0010()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_ContextSetThreadAffinityMode(context, THREAD_AFFINITY_MIDDLE_CORE);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    ASSERT_EQ(threadAffinityMode, THREAD_AFFINITY_MIDDLE_CORE);
    OH_AI_ContextSetThreadAffinityMode(context, THREAD_AFFINITY_BIG_CORE);
    threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    ASSERT_EQ(threadAffinityMode, THREAD_AFFINITY_BIG_CORE);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextGetThreadAffinityMode 接口，context设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0011
 * @tc.number SUBAIMindSporeContextCreate0011
 * @tc.desc   SUBAIMindSporeContextCreate0011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0011()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(nullptr);
    std::cout << threadAffinityMode << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadAffinityCoreList接口，context设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0012
 * @tc.number SUBAIMindSporeContextCreate0012
 * @tc.desc   SUBAIMindSporeContextCreate0012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0012()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    constexpr size_t coreNum = 4;
    int32_t coreList[coreNum] = { 0, 1, 2, 3 };
    OH_AI_ContextSetThreadAffinityCoreList(nullptr, coreList, coreNum);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadAffinityCoreList接口，core_num非法（0）、与coreList个数不一致（大于、小于）
/**
 * @tc.name   SUBAIMindSporeContextCreate0013
 * @tc.number SUBAIMindSporeContextCreate0013
 * @tc.desc   SUBAIMindSporeContextCreate0013
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0013()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    constexpr size_t coreNum = 4;
    constexpr size_t threadNum = 0;
    int32_t coreList[coreNum] = { 0, 1, 2, 3 };
    OH_AI_ContextSetThreadAffinityCoreList(context, coreList, threadNum);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadAffinityCoreList接口，coreList设置中存在非法编号（负数、极大值）
/**
 * @tc.name   SUBAIMindSporeContextCreate0014
 * @tc.number SUBAIMindSporeContextCreate0014
 * @tc.desc   SUBAIMindSporeContextCreate0014
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0014()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    constexpr size_t coreNum = 4;
    constexpr size_t threadNum = 4;
    int32_t coreList[coreNum] = { 0, 1, 2, -3 };
    OH_AI_ContextSetThreadAffinityCoreList(context, coreList, threadNum);
    size_t retCoreNum;
    int32_t* retCoreList = nullptr;
    retCoreList = const_cast<int32_t*>(OH_AI_ContextGetThreadAffinityCoreList(context, &retCoreNum));
    ASSERT_EQ(retCoreNum, coreNum);
    for (size_t i = 0; i < retCoreNum; i++) {
        OHPrintf("==========retCoreList:%d\n", retCoreList[i]);
        ASSERT_EQ(retCoreList[i], coreList[i]);
    }
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextSetThreadAffinityCoreList接口，每次设置不同的core_list，均可设置成功
/**
 * @tc.name   SUBAIMindSporeContextCreate0015
 * @tc.number SUBAIMindSporeContextCreate0015
 * @tc.desc   SUBAIMindSporeContextCreate0015
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0015()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    constexpr size_t coreNum = 4;
    int32_t coreList[coreNum] = { 0, 1, 2, 3 };
    OH_AI_ContextSetThreadAffinityCoreList(context, coreList, coreNum);
    constexpr size_t coreNum2 = 4;
    int32_t coreList2[coreNum2] = { 4, 5, 6, 7 };
    OH_AI_ContextSetThreadAffinityCoreList(context, coreList2, coreNum);
    size_t retCoreNum;
    int32_t* retCoreList = nullptr;
    retCoreList = const_cast<int32_t*>(OH_AI_ContextGetThreadAffinityCoreList(context, &retCoreNum));
    ASSERT_EQ(retCoreNum, coreNum2);
    for (size_t i = 0; i < retCoreNum; i++) {
        OHPrintf("==========retCoreList:%d\n", retCoreList[i]);
        ASSERT_EQ(retCoreList[i], coreList2[i]);
    }
    free(retCoreList);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextGetThreadAffinityCoreList接口，context为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0016
 * @tc.number SUBAIMindSporeContextCreate0016
 * @tc.desc   SUBAIMindSporeContextCreate0016
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0016()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    size_t retCoreNum;
    const int32_t* retCoreList = OH_AI_ContextGetThreadAffinityCoreList(nullptr, &retCoreNum);
    std::cout << retCoreList << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextGetThreadAffinityCoreList接口，core_num为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0017
 * @tc.number SUBAIMindSporeContextCreate0017
 * @tc.desc   SUBAIMindSporeContextCreate0017
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0017()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    const int32_t* retCoreList = OH_AI_ContextGetThreadAffinityCoreList(context, nullptr);
    std::cout << retCoreList << std::endl;
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoCreate接口，传入无效值、非法值
/**
 * @tc.name   SUBAIMindSporeContextCreate0018
 * @tc.number SUBAIMindSporeContextCreate0018
 * @tc.desc   SUBAIMindSporeContextCreate0018
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0018()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
    ASSERT_EQ(cpuDeviceInfo, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetProvide接口，device_info传入nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0019
 * @tc.number SUBAIMindSporeContextCreate0019
 * @tc.desc   SUBAIMindSporeContextCreate0019
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0019()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoSetProviderDevice(nullptr, "aaa");
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetProvide接口，provider传入nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0020
 * @tc.number SUBAIMindSporeContextCreate0020
 * @tc.desc   SUBAIMindSporeContextCreate0020
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0020()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    OH_AI_DeviceInfoSetProviderDevice(cpuDeviceInfo, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoGetProvider，device设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0021
 * @tc.number SUBAIMindSporeContextCreate0021
 * @tc.desc   SUBAIMindSporeContextCreate0021
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0021()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoGetProvider(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoGetProvider接口，未设置provider，直接获取默认值
/**
 * @tc.name   SUBAIMindSporeContextCreate0022
 * @tc.number SUBAIMindSporeContextCreate0022
 * @tc.desc   SUBAIMindSporeContextCreate0022
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0022()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    char* proInfo = const_cast<char*>(OH_AI_DeviceInfoGetProvider(cpuDeviceInfo));
    std::cout << proInfo << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetProviderDevice接口， device_info设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0023
 * @tc.number SUBAIMindSporeContextCreate0023
 * @tc.desc   SUBAIMindSporeContextCreate0023
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0023()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoSetProviderDevice(nullptr, "aaa");
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetProviderDevice接口， device设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0024
 * @tc.number SUBAIMindSporeContextCreate0024
 * @tc.desc   SUBAIMindSporeContextCreate0024
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0024()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    OH_AI_DeviceInfoSetProviderDevice(cpuDeviceInfo, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoGetProviderDevice接口， device设置为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0025
 * @tc.number SUBAIMindSporeContextCreate0025
 * @tc.desc   SUBAIMindSporeContextCreate0025
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0025()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoGetProviderDevice(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoGetProviderDevice接口，未设置device，直接获取默认值
/**
 * @tc.name   SUBAIMindSporeContextCreate0026
 * @tc.number SUBAIMindSporeContextCreate0026
 * @tc.desc   SUBAIMindSporeContextCreate0026
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0026()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    char* proInfo = const_cast<char*>(OH_AI_DeviceInfoGetProviderDevice(cpuDeviceInfo));
    std::cout << proInfo << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextAddDeviceInfo接口，context传入nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0027
 * @tc.number SUBAIMindSporeContextCreate0027
 * @tc.desc   SUBAIMindSporeContextCreate0027
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0027()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(nullptr, cpuDeviceInfo);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextAddDeviceInfo接口，正常添加多次同一个设备信息
/**
 * @tc.name   SUBAIMindSporeContextCreate0028
 * @tc.number SUBAIMindSporeContextCreate0028
 * @tc.desc   SUBAIMindSporeContextCreate0028
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0028()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_ContextAddDeviceInfo接口，正常添加多次不同设备信息
/**
 * @tc.name   SUBAIMindSporeContextCreate0029
 * @tc.number SUBAIMindSporeContextCreate0029
 * @tc.desc   SUBAIMindSporeContextCreate0029
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0029()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoHandle npuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OH_AI_ContextAddDeviceInfo(context, npuDeviceInfo);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoCreate接口，OH_AI_DEVICETYPE_INVALID
/**
 * @tc.name   SUBAIMindSporeContextCreate0030
 * @tc.number SUBAIMindSporeContextCreate0030
 * @tc.desc   SUBAIMindSporeContextCreate0030
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0030()
{
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
    ASSERT_EQ(cpuDeviceInfo, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetEnableFP16接口，device_info设置为nnrt，然后调用此接口
/**
 * @tc.name   SUBAIMindSporeContextCreate0031
 * @tc.number SUBAIMindSporeContextCreate0031
 * @tc.desc   SUBAIMindSporeContextCreate0031
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0031()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    NNRTDeviceDesc* desc0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, id0);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_DeviceInfoSetEnableFP16(nnrtDeviceInfo, false);
    bool isFp16 = OH_AI_DeviceInfoGetEnableFP16(nnrtDeviceInfo);
    OHPrintf("==========isFp16:%d\n", isFp16);
    ASSERT_EQ(isFp16, false);
    OH_AI_DeviceInfoSetEnableFP16(nnrtDeviceInfo, true);
    isFp16 = OH_AI_DeviceInfoGetEnableFP16(nnrtDeviceInfo);
    OHPrintf("==========isFp16:%d\n", isFp16);
    ASSERT_EQ(isFp16, true);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_CreateNNRTDeviceInfoByName
/**
 * @tc.name   SUBAIMindSporeContextCreate0032
 * @tc.number SUBAIMindSporeContextCreate0032
 * @tc.desc   SUBAIMindSporeContextCreate0032
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0032()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    const char* npuName = nullptr;
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
    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByName(npuName);
    ASSERT_NE(nnrtDeviceInfo, nullptr);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_CreateNNRTDeviceInfoByName，创建多次
/**
 * @tc.name   SUBAIMindSporeContextCreate0033
 * @tc.number SUBAIMindSporeContextCreate0033
 * @tc.desc   SUBAIMindSporeContextCreate0033
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0033()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    const char* npuName = nullptr;
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
    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByName(npuName);
    ASSERT_NE(nnrtDeviceInfo, nullptr);
    nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByName(npuName);
    ASSERT_NE(nnrtDeviceInfo, nullptr);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_CreateNNRTDeviceInfoByName，name不存在
/**
 * @tc.name   SUBAIMindSporeContextCreate0034
 * @tc.number SUBAIMindSporeContextCreate0034
 * @tc.desc   SUBAIMindSporeContextCreate0034
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0034()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByName("aaa");
    ASSERT_EQ(nnrtDeviceInfo, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_CreateNNRTDeviceInfoByName，name为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0035
 * @tc.number SUBAIMindSporeContextCreate0035
 * @tc.desc   SUBAIMindSporeContextCreate0035
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0035()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByName(nullptr);
    ASSERT_EQ(nnrtDeviceInfo, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_CreateNNRTDeviceInfoByType
/**
 * @tc.name   SUBAIMindSporeContextCreate0036
 * @tc.number SUBAIMindSporeContextCreate0036
 * @tc.desc   SUBAIMindSporeContextCreate0036
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0036()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    OH_AI_NNRTDeviceType npuType;
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
            npuType = type;
        }
    }
    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByType(npuType);
    ASSERT_NE(nnrtDeviceInfo, nullptr);
    OH_AI_DestroyAllNNRTDeviceDescs(&descs);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_CreateNNRTDeviceInfoByType，多次调用
/**
 * @tc.name   SUBAIMindSporeContextCreate0037
 * @tc.number SUBAIMindSporeContextCreate0037
 * @tc.desc   SUBAIMindSporeContextCreate0037
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0037()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    bool addOk = AddFirstNpuDeviceByType(context);
    ASSERT_EQ(addOk, true);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_CreateNNRTDeviceInfoByType，OH_AI_NNRTDeviceType不正确
/**
 * @tc.name   SUBAIMindSporeContextCreate0038
 * @tc.number SUBAIMindSporeContextCreate0038
 * @tc.desc   SUBAIMindSporeContextCreate0038
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0038()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    auto nnrtDeviceInfo = OH_AI_CreateNNRTDeviceInfoByType(OH_AI_NNRTDEVICE_OTHERS);
    ASSERT_EQ(nnrtDeviceInfo, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_GetAllNNRTDeviceDescs，num为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0039
 * @tc.number SUBAIMindSporeContextCreate0039
 * @tc.desc   SUBAIMindSporeContextCreate0039
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0039()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetAllNNRTDeviceDescs(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_GetElementOfNNRTDeviceDescs，descs为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0040
 * @tc.number SUBAIMindSporeContextCreate0040
 * @tc.desc   SUBAIMindSporeContextCreate0040
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0040()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetElementOfNNRTDeviceDescs(nullptr, 0);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_GetNameFromNNRTDeviceDesc，desc为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0041
 * @tc.number SUBAIMindSporeContextCreate0041
 * @tc.desc   SUBAIMindSporeContextCreate0041
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0041()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetNameFromNNRTDeviceDesc(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_GetTypeFromNNRTDeviceDesc，desc为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0042
 * @tc.number SUBAIMindSporeContextCreate0042
 * @tc.desc   SUBAIMindSporeContextCreate0042
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0042()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetTypeFromNNRTDeviceDesc(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_GetDeviceIdFromNNRTDeviceDesc，desc为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0043
 * @tc.number SUBAIMindSporeContextCreate0043
 * @tc.desc   SUBAIMindSporeContextCreate0043
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0043()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_GetDeviceIdFromNNRTDeviceDesc(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetDeviceId，多次调用
/**
 * @tc.name   SUBAIMindSporeContextCreate0044
 * @tc.number SUBAIMindSporeContextCreate0044
 * @tc.desc   SUBAIMindSporeContextCreate0044
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0044()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    bool gotId = AddFirstNpuDeviceId(nnrtDeviceInfo);
    ASSERT_EQ(gotId, true);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, OH_AI_DeviceInfoGetDeviceId(nnrtDeviceInfo));
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetDeviceId，id不正确
/**
 * @tc.name   SUBAIMindSporeContextCreate0045
 * @tc.number SUBAIMindSporeContextCreate0045
 * @tc.desc   SUBAIMindSporeContextCreate0045
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0045()
{
    constexpr size_t deviceId = 12345;
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    OH_AI_DeviceInfoSetDeviceId(nnrtDeviceInfo, deviceId);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
    OHPrintf("==========OH_AI_ModelBuildFromFile==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    OH_AI_Status buildRet =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    ASSERT_EQ(buildRet, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetDeviceId，device_info不正确
/**
 * @tc.name   SUBAIMindSporeContextCreate0046
 * @tc.number SUBAIMindSporeContextCreate0046
 * @tc.desc   SUBAIMindSporeContextCreate0046
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0046()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    bool gotId = AddFirstNpuDeviceId(cpuDeviceInfo);
    ASSERT_EQ(gotId, true);
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

// OH_AI_DeviceInfoSetDeviceId，device为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0047
 * @tc.number SUBAIMindSporeContextCreate0047
 * @tc.desc   SUBAIMindSporeContextCreate0047
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0047()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    NNRTDeviceDesc* desc0 = nullptr;
    for (size_t i = 0; i < num; i++) {
        auto desc = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetNameFromNNRTDeviceDesc " << name << std::endl;
        auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
        std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id << std::endl;
        const std::string npuNamePrefix = "NPU_";
        if (strncmp(npuNamePrefix.c_str(), name, npuNamePrefix.size()) == 0) {
            desc0 = OH_AI_GetElementOfNNRTDeviceDescs(descs, i);
        }
    }
    auto id0 = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc0);
    std::cout << "OH_AI_GetDeviceIdFromNNRTDeviceDesc " << id0 << std::endl;
    OH_AI_DeviceInfoSetDeviceId(nullptr, id0);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetDeviceId，device_info不正确
/**
 * @tc.name   SUBAIMindSporeContextCreate0048
 * @tc.number SUBAIMindSporeContextCreate0048
 * @tc.desc   SUBAIMindSporeContextCreate0048
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0048()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    auto id = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    std::cout << "OH_AI_DeviceInfoGetDeviceType " << id << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetDeviceId，device为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0049
 * @tc.number SUBAIMindSporeContextCreate0049
 * @tc.desc   SUBAIMindSporeContextCreate0049
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0049()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    auto id = OH_AI_DeviceInfoGetDeviceType(nullptr);
    std::cout << "OH_AI_DeviceInfoGetDeviceType " << id << std::endl;
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetPerformanceMode
/**
 * @tc.name   SUBAIMindSporeContextCreate0050
 * @tc.number SUBAIMindSporeContextCreate0050
 * @tc.desc   SUBAIMindSporeContextCreate0050
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0050()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    bool gotId = AddFirstNpuDeviceId(nnrtDeviceInfo);
    ASSERT_EQ(gotId, true);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrtDeviceInfo), OH_AI_PERFORMANCE_NONE);
    OH_AI_DeviceInfoSetPerformanceMode(nnrtDeviceInfo, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrtDeviceInfo), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrtDeviceInfo, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrtDeviceInfo), OH_AI_PRIORITY_MEDIUM);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
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

// OH_AI_DeviceInfoSetPerformanceMode，覆盖枚举值
/**
 * @tc.name   SUBAIMindSporeContextCreate0051
 * @tc.number SUBAIMindSporeContextCreate0051
 * @tc.desc   SUBAIMindSporeContextCreate0051
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0051()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    bool gotId = AddFirstNpuDeviceId(nnrtDeviceInfo);
    ASSERT_EQ(gotId, true);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrtDeviceInfo), OH_AI_PERFORMANCE_NONE);
    OH_AI_DeviceInfoSetPerformanceMode(nnrtDeviceInfo, OH_AI_PERFORMANCE_LOW);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrtDeviceInfo), OH_AI_PERFORMANCE_LOW);
    OH_AI_DeviceInfoSetPerformanceMode(nnrtDeviceInfo, OH_AI_PERFORMANCE_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrtDeviceInfo), OH_AI_PERFORMANCE_MEDIUM);
    OH_AI_DeviceInfoSetPerformanceMode(nnrtDeviceInfo, OH_AI_PERFORMANCE_HIGH);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrtDeviceInfo), OH_AI_PERFORMANCE_HIGH);
    OH_AI_DeviceInfoSetPerformanceMode(nnrtDeviceInfo, OH_AI_PERFORMANCE_EXTREME);
    ASSERT_EQ(OH_AI_DeviceInfoGetPerformanceMode(nnrtDeviceInfo), OH_AI_PERFORMANCE_EXTREME);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
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

// OH_AI_DeviceInfoSetPerformanceMode，device不正确
/**
 * @tc.name   SUBAIMindSporeContextCreate0052
 * @tc.number SUBAIMindSporeContextCreate0052
 * @tc.desc   SUBAIMindSporeContextCreate0052
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0052()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoSetPerformanceMode(cpuDeviceInfo, OH_AI_PERFORMANCE_MEDIUM);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetPerformanceMode，device为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0053
 * @tc.number SUBAIMindSporeContextCreate0053
 * @tc.desc   SUBAIMindSporeContextCreate0053
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0053()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoSetPerformanceMode(nullptr, OH_AI_PERFORMANCE_MEDIUM);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoGetPerformanceMode，device不正确
/**
 * @tc.name   SUBAIMindSporeContextCreate0054
 * @tc.number SUBAIMindSporeContextCreate0054
 * @tc.desc   SUBAIMindSporeContextCreate0054
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0054()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoGetPerformanceMode(cpuDeviceInfo);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoGetPerformanceMode，device为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0055
 * @tc.number SUBAIMindSporeContextCreate0055
 * @tc.desc   SUBAIMindSporeContextCreate0055
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0055()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoGetPerformanceMode(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetPriority
/**
 * @tc.name   SUBAIMindSporeContextCreate0056
 * @tc.number SUBAIMindSporeContextCreate0056
 * @tc.desc   SUBAIMindSporeContextCreate0056
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0056()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    bool gotId = AddFirstNpuDeviceId(nnrtDeviceInfo);
    ASSERT_EQ(gotId, true);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrtDeviceInfo), OH_AI_PRIORITY_NONE);
    OH_AI_DeviceInfoSetPriority(nnrtDeviceInfo, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrtDeviceInfo), OH_AI_PRIORITY_MEDIUM);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
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

// OH_AI_DeviceInfoSetPriority，覆盖枚举值
/**
 * @tc.name   SUBAIMindSporeContextCreate0057
 * @tc.number SUBAIMindSporeContextCreate0057
 * @tc.desc   SUBAIMindSporeContextCreate0057
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0057()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    bool gotId = AddFirstNpuDeviceId(nnrtDeviceInfo);
    ASSERT_EQ(gotId, true);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrtDeviceInfo), OH_AI_PRIORITY_NONE);
    OH_AI_DeviceInfoSetPriority(nnrtDeviceInfo, OH_AI_PRIORITY_LOW);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrtDeviceInfo), OH_AI_PRIORITY_LOW);
    OH_AI_DeviceInfoSetPriority(nnrtDeviceInfo, OH_AI_PRIORITY_MEDIUM);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrtDeviceInfo), OH_AI_PRIORITY_MEDIUM);
    OH_AI_DeviceInfoSetPriority(nnrtDeviceInfo, OH_AI_PRIORITY_HIGH);
    ASSERT_EQ(OH_AI_DeviceInfoGetPriority(nnrtDeviceInfo), OH_AI_PRIORITY_HIGH);
    OH_AI_ContextAddDeviceInfo(context, nnrtDeviceInfo);
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

// OH_AI_DeviceInfoSetPriority，device不正确
/**
 * @tc.name   SUBAIMindSporeContextCreate0058
 * @tc.number SUBAIMindSporeContextCreate0058
 * @tc.desc   SUBAIMindSporeContextCreate0058
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0058()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoSetPriority(cpuDeviceInfo, OH_AI_PRIORITY_MEDIUM);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoSetPriority，device为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0059
 * @tc.number SUBAIMindSporeContextCreate0059
 * @tc.desc   SUBAIMindSporeContextCreate0059
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0059()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoSetPriority(nullptr, OH_AI_PRIORITY_MEDIUM);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoGetPriority，device不正确
/**
 * @tc.name   SUBAIMindSporeContextCreate0060
 * @tc.number SUBAIMindSporeContextCreate0060
 * @tc.desc   SUBAIMindSporeContextCreate0060
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0060()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoGetPriority(cpuDeviceInfo);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoGetPriority，device为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0061
 * @tc.number SUBAIMindSporeContextCreate0061
 * @tc.desc   SUBAIMindSporeContextCreate0061
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0061()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoGetPriority(nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoAddExtension，device不正确
/**
 * @tc.name   SUBAIMindSporeContextCreate0062
 * @tc.number SUBAIMindSporeContextCreate0062
 * @tc.desc   SUBAIMindSporeContextCreate0062
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0062()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    const char* modelName = "cache_model";
    OH_AI_Status extensionRet = OH_AI_DeviceInfoAddExtension(cpuDeviceInfo, "ModelName", modelName, strlen(modelName));
    ASSERT_EQ(extensionRet, OH_AI_STATUS_LITE_ERROR);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoAddExtension，device为nullptr
/**
 * @tc.name   SUBAIMindSporeContextCreate0063
 * @tc.number SUBAIMindSporeContextCreate0063
 * @tc.desc   SUBAIMindSporeContextCreate0063
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0063()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    const char* modelName = "cache_model";
    OH_AI_Status extensionRet = OH_AI_DeviceInfoAddExtension(nullptr, "ModelName", modelName, strlen(modelName));
    ASSERT_EQ(extensionRet, OH_AI_STATUS_LITE_NULLPTR);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoAddExtension，name不在白名单内
/**
 * @tc.name   SUBAIMindSporeContextCreate0064
 * @tc.number SUBAIMindSporeContextCreate0064
 * @tc.desc   SUBAIMindSporeContextCreate0064
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0064()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    bool gotId = AddFirstNpuDeviceId(nnrtDeviceInfo);
    ASSERT_EQ(gotId, true);
    const char* modelName = "cache_model";
    OH_AI_Status extensionRet = OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "aaa", modelName, strlen(modelName));
    ASSERT_EQ(extensionRet, OH_AI_STATUS_LITE_ERROR);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoAddExtension，name为空
/**
 * @tc.name   SUBAIMindSporeContextCreate0065
 * @tc.number SUBAIMindSporeContextCreate0065
 * @tc.desc   SUBAIMindSporeContextCreate0065
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0065()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    bool gotId = AddFirstNpuDeviceId(nnrtDeviceInfo);
    ASSERT_EQ(gotId, true);
    const char* modelName = "cache_model";
    OH_AI_Status extensionRet = OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, nullptr, modelName, strlen(modelName));
    ASSERT_EQ(extensionRet, OH_AI_STATUS_LITE_NULLPTR);
    return OH_AI_STATUS_SUCCESS;
}

// OH_AI_DeviceInfoAddExtension，value为空
/**
 * @tc.name   SUBAIMindSporeContextCreate0066
 * @tc.number SUBAIMindSporeContextCreate0066
 * @tc.desc   SUBAIMindSporeContextCreate0066
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextCreate0066()
{
    if (!IsNPU()) {
        OHPrintf("NNRt is not NPU, skip this test");
        return ActsMindSporeValues::NPU_SKIP_STATUS;
    }
    OHPrintf("==========OH_AI_ContextCreate==========\n");
    OH_AI_DeviceInfoHandle nnrtDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    bool gotId = AddFirstNpuDeviceId(nnrtDeviceInfo);
    ASSERT_EQ(gotId, true);
    const char* modelName = "cache_model";
    OH_AI_Status extensionRet = OH_AI_DeviceInfoAddExtension(nnrtDeviceInfo, "ModelName", nullptr, strlen(modelName));
    ASSERT_EQ(extensionRet, OH_AI_STATUS_LITE_NULLPTR);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：多输入模型，测试ContextDestroy接口，Context在model释放之前释放
/**
 * @tc.name   SUBAIMindSporeContextDestroy0001
 * @tc.number SUBAIMindSporeContextDestroy0001
 * @tc.desc   SUBAIMindSporeContextDestroy0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextDestroy0001()
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

// 异常场景：多输入模型，测试ContextDestroy接口，Context在model释放之后释放
/**
 * @tc.name   SUBAIMindSporeContextDestroy0002
 * @tc.number SUBAIMindSporeContextDestroy0002
 * @tc.desc   SUBAIMindSporeContextDestroy0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SUBAIMindSporeContextDestroy0002()
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
    OH_AI_ModelDestroy(&model);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

} // namespace MindSpore
}