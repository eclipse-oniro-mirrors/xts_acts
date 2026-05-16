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
void TransposeAndFillInputTensor(OH_AI_TensorHandle tensor, const char* imageBuf, size_t imageSize)
{
    size_t shapeNum;
    const int64_t* shape = OH_AI_TensorGetShape(tensor, &shapeNum);
    if (imageSize <= 0) {
        throw std::runtime_error("error imageSize");
    }
    auto imageBufNhwc = new char[imageSize];
    constexpr size_t nchwBatchIndex = 0;
    constexpr size_t nchwChannelIndex = 1;
    constexpr size_t nchwHeightIndex = 2;
    constexpr size_t nchwWidthIndex = 3;
    int batch = static_cast<int>(shape[nchwBatchIndex]);
    int plane = static_cast<int>(shape[nchwChannelIndex] * shape[nchwHeightIndex]);
    int channel = static_cast<int>(shape[nchwWidthIndex]);
    PackNCHWToNHWCFp32(imageBuf, imageBufNhwc, batch, plane, channel);
    float* inputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(tensor));
    SafeMemcpy(inputData, imageSize, imageBufNhwc, imageSize);
    delete[] imageBufNhwc;
}

void PrintInputPreview(float* inputData, int64_t elementNum)
{
    OHPrintf("input data is:");
    for (int64_t j = 0; j < elementNum && j <= ActsMindSporeValues::OUTPUT_PRINT_LIMIT; ++j) {
        OHPrintf("%f ", inputData[j]);
    }
    OHPrintf("\n");
}
} // namespace

// 正常场景：Context设置CPU，默认场景，不设置线程绑核
/**
 * @tc.name   OHOSContextCPU0001
 * @tc.number OHOSContextCPU0001
 * @tc.desc   OHOSContextCPU0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0001()
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

// 正常场景：Context设置CPU，4线程
/**
 * @tc.name   OHOSContextCPU0002
 * @tc.number OHOSContextCPU0002
 * @tc.desc   OHOSContextCPU0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0002()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_FOUR);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_FOUR);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，2线程
/**
 * @tc.name   OHOSContextCPU0003
 * @tc.number OHOSContextCPU0003
 * @tc.desc   OHOSContextCPU0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0003()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_DOUBLE);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_DOUBLE);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，1线程
/**
 * @tc.name   OHOSContextCPU0004
 * @tc.number OHOSContextCPU0004
 * @tc.desc   OHOSContextCPU0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0004()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_SINGLE);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_SINGLE);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：Context设置CPU，0线程
/**
 * @tc.name   OHOSContextCPU0005
 * @tc.number OHOSContextCPU0005
 * @tc.desc   OHOSContextCPU0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0005()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_ZERO);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_ZERO);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，不绑核
/**
 * @tc.name   OHOSContextCPU0006
 * @tc.number OHOSContextCPU0006
 * @tc.desc   OHOSContextCPU0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0006()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_FOUR);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_FOUR);
    OH_AI_ContextSetThreadAffinityMode(context, THREAD_AFFINITY_NONE);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    OHPrintf("==========threadAffinityMode:%d\n", threadAffinityMode);
    ASSERT_EQ(threadAffinityMode, THREAD_AFFINITY_NONE);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，绑大核
/**
 * @tc.name   OHOSContextCPU0007
 * @tc.number OHOSContextCPU0007
 * @tc.desc   OHOSContextCPU0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0007()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_FOUR);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_FOUR);
    OH_AI_ContextSetThreadAffinityMode(context, THREAD_AFFINITY_BIG_CORE);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    OHPrintf("==========threadAffinityMode:%d\n", threadAffinityMode);
    ASSERT_EQ(threadAffinityMode, THREAD_AFFINITY_BIG_CORE);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，绑中核
/**
 * @tc.name   OHOSContextCPU0008
 * @tc.number OHOSContextCPU0008
 * @tc.desc   OHOSContextCPU0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0008()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_FOUR);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_FOUR);
    OH_AI_ContextSetThreadAffinityMode(context, THREAD_AFFINITY_MIDDLE_CORE);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    OHPrintf("==========threadAffinityMode:%d\n", threadAffinityMode);
    ASSERT_EQ(threadAffinityMode, THREAD_AFFINITY_MIDDLE_CORE);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：Context设置CPU，绑核失败
/**
 * @tc.name   OHOSContextCPU0009
 * @tc.number OHOSContextCPU0009
 * @tc.desc   OHOSContextCPU0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0009()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_FOUR);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_FOUR);
    constexpr size_t affinityModeThree = 3;
    OH_AI_ContextSetThreadAffinityMode(context, affinityModeThree);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    OHPrintf("==========threadAffinityMode:%d\n", threadAffinityMode);
    ASSERT_EQ(threadAffinityMode, THREAD_AFFINITY_NONE);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，绑核列表{0,1,2,3}
/**
 * @tc.name   OHOSContextCPU0010
 * @tc.number OHOSContextCPU0010
 * @tc.desc   OHOSContextCPU0010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0010()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_FOUR);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_FOUR);
    constexpr size_t coreNum = 4;
    int32_t coreList[coreNum] = { 0, 1, 2, 3 };
    OH_AI_ContextSetThreadAffinityCoreList(context, coreList, coreNum);
    size_t retCoreNum;
    int32_t* retCoreList = nullptr;
    retCoreList = const_cast<int32_t*>(OH_AI_ContextGetThreadAffinityCoreList(context, &retCoreNum));
    ASSERT_NE(retCoreList, nullptr);
    ASSERT_EQ(retCoreNum, coreNum);
    for (size_t i = 0; i < retCoreNum; i++) {
        OHPrintf("==========retCoreList:%d\n", retCoreList[i]);
        ASSERT_EQ(retCoreList[i], coreList[i]);
    }
    free(retCoreList);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，绑核列表和模式同时开启
/**
 * @tc.name   OHOSContextCPU0011
 * @tc.number OHOSContextCPU0011
 * @tc.desc   OHOSContextCPU0011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0011()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_FOUR);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_FOUR);
    OH_AI_ContextSetThreadAffinityMode(context, THREAD_AFFINITY_BIG_CORE);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(context);
    OHPrintf("==========threadAffinityMode:%d\n", threadAffinityMode);
    constexpr size_t coreNum = 4;
    int32_t coreList[coreNum] = { 0, 1, 3, 4 };
    OH_AI_ContextSetThreadAffinityCoreList(context, coreList, coreNum);
    size_t retCoreNum;
    int32_t* retCoreList = nullptr;
    retCoreList = const_cast<int32_t*>(OH_AI_ContextGetThreadAffinityCoreList(context, &retCoreNum));
    ASSERT_EQ(retCoreNum, coreNum);
    for (size_t i = 0; i < retCoreNum; i++) {
        OHPrintf("==========retCoreList:%d\n", retCoreList[i]);
        ASSERT_EQ(retCoreList[i], coreList[i]);
    }
    free(retCoreList);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，开启并行
/**
 * @tc.name   OHOSContextCPU0012
 * @tc.number OHOSContextCPU0012
 * @tc.desc   OHOSContextCPU0012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0012()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_FOUR);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_FOUR);
    OH_AI_ContextSetEnableParallel(context, true);
    bool isParallel = OH_AI_ContextGetEnableParallel(context);
    OHPrintf("==========isParallel:%d\n", isParallel);
    ASSERT_EQ(isParallel, true);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，关闭并行
/**
 * @tc.name   OHOSContextCPU0013
 * @tc.number OHOSContextCPU0013
 * @tc.desc   OHOSContextCPU0013
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0013()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_ContextSetThreadNum(context, THREAD_NUM_FOUR);
    int32_t threadNum = OH_AI_ContextGetThreadNum(context);
    OHPrintf("==========threadNum:%d\n", threadNum);
    ASSERT_EQ(threadNum, THREAD_NUM_FOUR);
    OH_AI_ContextSetEnableParallel(context, false);
    bool isParallel = OH_AI_ContextGetEnableParallel(context);
    OHPrintf("==========isParallel:%d\n", isParallel);
    ASSERT_EQ(isParallel, false);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，开启fp16
/**
 * @tc.name   OHOSContextCPU0014
 * @tc.number OHOSContextCPU0014
 * @tc.desc   OHOSContextCPU0014
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0014()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    OH_AI_DeviceInfoSetEnableFP16(cpuDeviceInfo, true);
    bool isFp16 = OH_AI_DeviceInfoGetEnableFP16(cpuDeviceInfo);
    OHPrintf("==========isFp16:%d\n", isFp16);
    ASSERT_EQ(isFp16, true);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，关闭fp16
/**
 * @tc.name   OHOSContextCPU0015
 * @tc.number OHOSContextCPU0015
 * @tc.desc   OHOSContextCPU0015
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0015()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    OH_AI_DeviceInfoSetEnableFP16(cpuDeviceInfo, false);
    bool isFp16 = OH_AI_DeviceInfoGetEnableFP16(cpuDeviceInfo);
    OHPrintf("==========isFp16:%d\n", isFp16);
    ASSERT_EQ(isFp16, false);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，设置厂商名称
/**
 * @tc.name   OHOSContextCPU0016
 * @tc.number OHOSContextCPU0016
 * @tc.desc   OHOSContextCPU0016
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0016()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    OH_AI_DeviceInfoSetProvider(cpuDeviceInfo, "vendor_new");
    char* proInfo = const_cast<char*>(OH_AI_DeviceInfoGetProvider(cpuDeviceInfo));
    ASSERT_EQ(strcmp(proInfo, "vendor_new"), 0);
    free(proInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，设置厂商设备类型
/**
 * @tc.name   OHOSContextCPU0017
 * @tc.number OHOSContextCPU0017
 * @tc.desc   OHOSContextCPU0017
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0017()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    OH_AI_DeviceInfoSetProviderDevice(cpuDeviceInfo, "cpu_new");
    char* proInfo = const_cast<char*>(OH_AI_DeviceInfoGetProviderDevice(cpuDeviceInfo));
    ASSERT_EQ(strcmp(proInfo, "cpu_new"), 0);
    free(proInfo);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，销毁MSDeviceInfo
/**
 * @tc.name   OHOSContextCPU0018
 * @tc.number OHOSContextCPU0018
 * @tc.desc   OHOSContextCPU0018
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0018()
{
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OHPrintf("==========deviceType:%d\n", deviceType);
    ASSERT_EQ(deviceType, OH_AI_DEVICETYPE_CPU);
    OH_AI_DeviceInfoDestroy(&cpuDeviceInfo);
    ASSERT_EQ(cpuDeviceInfo, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置CPU，销毁OH_AI_Context
/**
 * @tc.name   OHOSContextCPU0019
 * @tc.number OHOSContextCPU0019
 * @tc.desc   OHOSContextCPU0019
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0019()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle cpuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    ASSERT_NE(cpuDeviceInfo, nullptr);
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(cpuDeviceInfo);
    OHPrintf("==========deviceType:%d\n", deviceType);
    ASSERT_EQ(deviceType, OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpuDeviceInfo);
    OH_AI_ContextDestroy(&context);
    ASSERT_EQ(context, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：Context不设置device info
/**
 * @tc.name   OHOSContextCPU0020
 * @tc.number OHOSContextCPU0020
 * @tc.desc   OHOSContextCPU0020
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextCPU0020()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret =
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：Context设置NPU,频率为1
/**
 * @tc.name   OHOSContextNPU0002
 * @tc.number OHOSContextNPU0002
 * @tc.desc   OHOSContextNPU0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSContextNPU0002()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    OH_AI_DeviceInfoHandle npuDeviceInfo = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_KIRIN_NPU);
    ASSERT_NE(npuDeviceInfo, nullptr);
    OH_AI_DeviceInfoSetFrequency(npuDeviceInfo, 1);
    int frequency = OH_AI_DeviceInfoGetFrequency(npuDeviceInfo);
    ASSERT_EQ(frequency, 1);
    OH_AI_ContextAddDeviceInfo(context, npuDeviceInfo);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：ModelBuild，调用指针方法
/**
 * @tc.name   OHOSModelBuild0001
 * @tc.number OHOSModelBuild0001
 * @tc.desc   OHOSModelBuild0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelBuild0001()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, true, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelBuild，model_data指向的不是模型数据
/**
 * @tc.name   OHOSModelBuild0002
 * @tc.number OHOSModelBuild0002
 * @tc.desc   OHOSModelBuild0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelBuild0002()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size1;
    size_t* ptrSize1 = &size1;
    char* imageBuf = ReadFile(FilePath("ml_face_isface.input").c_str(), ptrSize1);
    ASSERT_NE(imageBuf, nullptr);
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuild(model, imageBuf, size1, OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    delete[] imageBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelBuild，model_data为空
/**
 * @tc.name   OHOSModelBuild0003
 * @tc.number OHOSModelBuild0003
 * @tc.desc   OHOSModelBuild0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelBuild0003()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuild(model, nullptr, 0, OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelBuild，data_size为0
/**
 * @tc.name   OHOSModelBuild0004
 * @tc.number OHOSModelBuild0004
 * @tc.desc   OHOSModelBuild0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelBuild0004()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size;
    size_t* ptrSize = &size;
    char* graphBuf = ReadFile(FilePath("ml_face_isface.ms").c_str(), ptrSize);
    ASSERT_NE(graphBuf, nullptr);
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuild(model, graphBuf, 0, OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_INPUT_PARAM_INVALID);
    delete[] graphBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelBuild，读取路径方法，且路径不是模型数据路径
/**
 * @tc.name   OHOSModelBuild0005
 * @tc.number OHOSModelBuild0005
 * @tc.desc   OHOSModelBuild0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelBuild0005()
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
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.input").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelBuild，读取路径方法，路径为空
/**
 * @tc.name   OHOSModelBuild0006
 * @tc.number OHOSModelBuild0006
 * @tc.desc   OHOSModelBuild0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelBuild0006()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Build model==========\n");
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "", OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelBuild，model_type不支持
/**
 * @tc.name   OHOSModelBuild0007
 * @tc.number OHOSModelBuild0007
 * @tc.desc   OHOSModelBuild0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelBuild0007()
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
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_INVALID, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelBuild，model_context为空
/**
 * @tc.name   OHOSModelBuild0008
 * @tc.number OHOSModelBuild0008
 * @tc.desc   OHOSModelBuild0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelBuild0008()
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
        OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, nullptr);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：ModelBuild，调用GetOutputs获取输出
/**
 * @tc.name   OHOSModelBuild0009
 * @tc.number OHOSModelBuild0009
 * @tc.desc   OHOSModelBuild0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelBuild0009()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    OHPrintf("==========Model build==========\n");
    OH_AI_ModelBuildFromFile(model, FilePath("ml_face_isface.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    OH_AI_TensorHandleArray output;
    FillInputsData(inputs, "ml_face_isface", false);
    OH_AI_Status ret = OH_AI_ModelPredict(model, inputs, &output, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetOutput==========\n");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    for (size_t i = 0; i < outputs.handle_num; ++i) {
        OH_AI_TensorHandle tensor = outputs.handle_list[i];
        int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
        OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
        float* outputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(tensor));
        OHPrintf("output data is:");
        for (int j = 0; j < elementNum && j <= ActsMindSporeValues::OUTPUT_PRINT_LIMIT; ++j) {
            OHPrintf("%f ", outputData[j]);
        }
        OHPrintf("\n");
        OHPrintf("==========CompFp32WithTData==========\n");
        string expectedDataFile = FilePath("ml_face_isface") + std::to_string(i) + ".output";
        bool result = CompFp32WithTData(outputData,
                                        expectedDataFile,
                                        ActsMindSporeValues::DEFAULT_TOLERANCE,
                                        ActsMindSporeValues::DEFAULT_TOLERANCE,
                                        false);
        ASSERT_EQ(result, true);
    }
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：ModelResize，shape与之前一致
/**
 * @tc.name   OHOSModelResize0001
 * @tc.number OHOSModelResize0001
 * @tc.desc   OHOSModelResize0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelResize0001()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_ocr_cn", { 4, { 1, 32, 512, 1 } }, false, true, false));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：ModelResize，shape与之前不一致
/**
 * @tc.name   OHOSModelResize0002
 * @tc.number OHOSModelResize0002
 * @tc.desc   OHOSModelResize0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelResize0002()
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
        OH_AI_ModelBuildFromFile(model, FilePath("ml_ocr_cn.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    OHPrintf("==========Resizes==========\n");
    OH_AI_ShapeInfo shapeInfos = { 4, { 1, 64, 256, 1 } };
    OH_AI_Status resizeRet = OH_AI_ModelResize(model, inputs, &shapeInfos, inputs.handle_num);
    OHPrintf("==========Resizes return code:%d\n", resizeRet);
    ASSERT_EQ(resizeRet, OH_AI_STATUS_SUCCESS);
    FillInputsData(inputs, "ml_ocr_cn", false);
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_Status predictRet = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(predictRet, OH_AI_STATUS_SUCCESS);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelResize，shape为三维
/**
 * @tc.name   OHOSModelResize0003
 * @tc.number OHOSModelResize0003
 * @tc.desc   OHOSModelResize0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelResize0003()
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
        OH_AI_ModelBuildFromFile(model, FilePath("ml_ocr_cn.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    OHPrintf("==========Resizes==========\n");
    OH_AI_ShapeInfo shapeInfos = { 4, { 1, 32, 1 } };
    ret = OH_AI_ModelResize(model, inputs, &shapeInfos, inputs.handle_num);
    OHPrintf("==========Resizes return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelResize，shape值有负数
/**
 * @tc.name   OHOSModelResize0004
 * @tc.number OHOSModelResize0004
 * @tc.desc   OHOSModelResize0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelResize0004()
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
        OH_AI_ModelBuildFromFile(model, FilePath("ml_ocr_cn.ms").c_str(), OH_AI_MODELTYPE_MINDIR, context);
    OHPrintf("==========build model return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetInputs==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    OHPrintf("==========Resizes==========\n");
    OH_AI_ShapeInfo shapeInfos = { 4, { 1, -32, 32, 1 } };
    ret = OH_AI_ModelResize(model, inputs, &shapeInfos, inputs.handle_num);
    OHPrintf("==========Resizes return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_PARAM_INVALID);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelResize，不支持resize的模型
/**
 * @tc.name   OHOSModelResize0005
 * @tc.number OHOSModelResize0005
 * @tc.desc   OHOSModelResize0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelResize0005()
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
    OHPrintf("==========Resizes==========\n");
    OH_AI_ShapeInfo shapeInfos = { 4, { 1, 96, 96, 1 } };
    ret = OH_AI_ModelResize(model, inputs, &shapeInfos, inputs.handle_num);
    OHPrintf("==========Resizes return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_ERROR);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：ModelPredict
/**
 * @tc.name   OHOSModelPredict0001
 * @tc.number OHOSModelPredict0001
 * @tc.desc   OHOSModelPredict0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelPredict0001()
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

// 异常场景：ModelPredict，model被销毁
/**
 * @tc.name   OHOSModelPredict0002
 * @tc.number OHOSModelPredict0002
 * @tc.desc   OHOSModelPredict0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelPredict0002()
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
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    OH_AI_ModelDestroy(&model);
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    OHPrintf("==========Model Predict return code:%d\n", ret);
    ASSERT_EQ(ret, OH_AI_STATUS_LITE_NULLPTR);
    OH_AI_ContextDestroy(&context);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelPredict，input为空
/**
 * @tc.name   OHOSModelPredict0003
 * @tc.number OHOSModelPredict0003
 * @tc.desc   OHOSModelPredict0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelPredict0003()
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

// 正常场景：ModelPredict，传入回调函数
/**
 * @tc.name   OHOSModelPredict0004
 * @tc.number OHOSModelPredict0004
 * @tc.desc   OHOSModelPredict0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelPredict0004()
{
    OHPrintf("==========Init Context==========\n");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    ASSERT_NE(context, nullptr);
    AddContextDeviceCPU(context);
    OHPrintf("==========Create model==========\n");
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    ASSERT_NE(model, nullptr);
    ModelPredict(model, context, ModelPredictOptions("ml_face_isface", {}, false, true, true));
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：ModelGetInputByTensorName
/**
 * @tc.name   OHOSModelGetInputByTensorName0001
 * @tc.number OHOSModelGetInputByTensorName0001
 * @tc.desc   OHOSModelGetInputByTensorName0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelGetInputByTensorName0001()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size1;
    size_t* ptrSize1 = &size1;
    char* imageBuf = ReadFile(FilePath("ml_face_isface.input").c_str(), ptrSize1);
    ASSERT_NE(imageBuf, nullptr);
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
    OH_AI_TensorHandle tensor = OH_AI_ModelGetInputByTensorName(model, "data");
    ASSERT_NE(tensor, nullptr);
    int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
    OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
    float* inputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(tensor));
    ASSERT_NE(inputData, nullptr);
    OHPrintf("==========Transpose==========\n");
    TransposeAndFillInputTensor(tensor, imageBuf, size1);
    PrintInputPreview(inputData, elementNum);
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    ASSERT_NE(inputs.handle_list, nullptr);
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    CompareResult(outputs, "ml_face_isface");
    delete[] imageBuf;
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelGetInputByTensorName，名称不存在
/**
 * @tc.name   OHOSModelGetInputByTensorName0002
 * @tc.number OHOSModelGetInputByTensorName0002
 * @tc.desc   OHOSModelGetInputByTensorName0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelGetInputByTensorName0002()
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
    OH_AI_TensorHandle tensor = OH_AI_ModelGetInputByTensorName(model, "aaa");
    ASSERT_EQ(tensor, nullptr);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：ModelGetOutputByTensorName
/**
 * @tc.name   OHOSModelGetOutputByTensorName0001
 * @tc.number OHOSModelGetOutputByTensorName0001
 * @tc.desc   OHOSModelGetOutputByTensorName0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelGetOutputByTensorName0001()
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
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetOutput==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetOutputByTensorName(model, "prob");
    ASSERT_NE(tensor, nullptr);
    int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
    OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
    float* outputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(tensor));
    OHPrintf("output data is:");
    for (int j = 0; j < elementNum && j <= ActsMindSporeValues::OUTPUT_PRINT_LIMIT; ++j) {
        OHPrintf("%f ", outputData[j]);
    }
    OHPrintf("\n");
    OHPrintf("==========CompFp32WithTData==========\n");
    bool result = CompFp32WithTData(outputData,
                                    FilePath("ml_face_isface0.output"),
                                    ActsMindSporeValues::DEFAULT_TOLERANCE,
                                    ActsMindSporeValues::DEFAULT_TOLERANCE,
                                    false);
    ASSERT_EQ(result, true);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 异常场景：ModelGetOutputByTensorName，名称不存在
/**
 * @tc.name   OHOSModelGetOutputByTensorName0002
 * @tc.number OHOSModelGetOutputByTensorName0002
 * @tc.desc   OHOSModelGetOutputByTensorName0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSModelGetOutputByTensorName0002()
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
    OHPrintf("==========Model Predict==========\n");
    OH_AI_TensorHandleArray outputs;
    ret = OH_AI_ModelPredict(model, inputs, &outputs, nullptr, nullptr);
    ASSERT_EQ(ret, OH_AI_STATUS_SUCCESS);
    OHPrintf("==========GetOutput==========\n");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetOutputByTensorName(model, "aaa");
    ASSERT_EQ(tensor, nullptr);
    OH_AI_ContextDestroy(&context);
    OH_AI_ModelDestroy(&model);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorCreate,创建tensor
/**
 * @tc.name   OHOSTensorCreate0001
 * @tc.number OHOSTensorCreate0001
 * @tc.desc   OHOSTensorCreate0001
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0001()
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
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    ASSERT_NE(tensor, nullptr);
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    inputs.handle_list[0] = tensor;
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

// 正常场景：MSTensorDestroy,销毁tensor
/**
 * @tc.name   OHOSTensorCreate0002
 * @tc.number OHOSTensorCreate0002
 * @tc.desc   OHOSTensorCreate0002
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0002()
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
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    ASSERT_EQ(tensor, nullptr);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorGetName,获取tensor名称
/**
 * @tc.name   OHOSTensorCreate0003
 * @tc.number OHOSTensorCreate0003
 * @tc.desc   OHOSTensorCreate0003
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0003()
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
    const char* tensorName = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName, "data"), 0);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorGetName,设置tensor名称
/**
 * @tc.name   OHOSTensorCreate0004
 * @tc.number OHOSTensorCreate0004
 * @tc.desc   OHOSTensorCreate0004
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0004()
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
    OH_AI_TensorSetName(tensor, "new_data");
    const char* tensorName = OH_AI_TensorGetName(tensor);
    ASSERT_EQ(strcmp(tensorName, "new_data"), 0);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorGetDataType,获取tensor数据类型
/**
 * @tc.name   OHOSTensorCreate0005
 * @tc.number OHOSTensorCreate0005
 * @tc.desc   OHOSTensorCreate0005
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0005()
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
    OH_AI_DataType dataType = OH_AI_TensorGetDataType(tensor);
    ASSERT_EQ(dataType, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorSetDataType,设置tensor数据类型
/**
 * @tc.name   OHOSTensorCreate0006
 * @tc.number OHOSTensorCreate0006
 * @tc.desc   OHOSTensorCreate0006
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0006()
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
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    OH_AI_DataType dataType = OH_AI_TensorGetDataType(tensor);
    ASSERT_EQ(dataType, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorGetShape,获取tensor维度
/**
 * @tc.name   OHOSTensorCreate0007
 * @tc.number OHOSTensorCreate0007
 * @tc.desc   OHOSTensorCreate0007
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0007()
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
    size_t retShapeNum;
    const int64_t* retShape = OH_AI_TensorGetShape(tensor, &retShapeNum);
    ASSERT_EQ(retShapeNum, createShapeNum);
    for (size_t i = 0; i < retShapeNum; i++) {
        ASSERT_EQ(retShape[i], createShape[i]);
    }
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorSetShape,设置tensor维度
/**
 * @tc.name   OHOSTensorCreate0008
 * @tc.number OHOSTensorCreate0008
 * @tc.desc   OHOSTensorCreate0008
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0008()
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
    size_t retShapeNum;
    const int64_t* retShape = OH_AI_TensorGetShape(tensor, &retShapeNum);
    ASSERT_EQ(retShapeNum, createShapeNum);
    for (size_t i = 0; i < retShapeNum; i++) {
        ASSERT_EQ(retShape[i], createShape[i]);
    }
    constexpr size_t newShapeNum = 4;
    int64_t newShape[newShapeNum] = { 1, 32, 32, 1 };
    OH_AI_TensorSetShape(tensor, newShape, newShapeNum);
    size_t newRetShapeNum;
    const int64_t* newRetShape = OH_AI_TensorGetShape(tensor, &newRetShapeNum);
    ASSERT_NE(newRetShape, nullptr);
    ASSERT_EQ(newRetShapeNum, newShapeNum);
    for (size_t i = 0; i < newRetShapeNum; i++) {
        ASSERT_EQ(newRetShape[i], newShape[i]);
    }
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorGetFormat,获取tensor格式
/**
 * @tc.name   OHOSTensorCreate0009
 * @tc.number OHOSTensorCreate0009
 * @tc.desc   OHOSTensorCreate0009
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0009()
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
    OH_AI_Format dataFormat = OH_AI_TensorGetFormat(tensor);
    ASSERT_EQ(dataFormat, OH_AI_FORMAT_NHWC);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorSetFormat,设置tensor格式
/**
 * @tc.name   OHOSTensorCreate0010
 * @tc.number OHOSTensorCreate0010
 * @tc.desc   OHOSTensorCreate0010
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0010()
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
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NHWC);
    OH_AI_Format dataFormat = OH_AI_TensorGetFormat(tensor);
    ASSERT_EQ(dataFormat, OH_AI_FORMAT_NHWC);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorGetData,获取tensor数据
/**
 * @tc.name   OHOSTensorCreate0011
 * @tc.number OHOSTensorCreate0011
 * @tc.desc   OHOSTensorCreate0011
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0011()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size1;
    size_t* ptrSize1 = &size1;
    char* imageBuf = ReadFile(FilePath("ml_face_isface.input").c_str(), ptrSize1);
    ASSERT_NE(imageBuf, nullptr);
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    constexpr size_t recycleNum = 20;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    const float* retData = static_cast<const float*>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(retData, nullptr);
    OHPrintf("return data is:");
    for (int i = 0; i < recycleNum; ++i) {
        OHPrintf("%f ", retData[i]);
    }
    OHPrintf("\n");
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorSetData,设置tensor数据
/**
 * @tc.name   OHOSTensorCreate0012
 * @tc.number OHOSTensorCreate0012
 * @tc.desc   OHOSTensorCreate0012
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0012()
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
    constexpr size_t dataLen = 6;
    float data[dataLen] = { 1, 2, 3, 4, 5, 6 };
    OH_AI_TensorSetData(tensor, data);
    const float* retData = static_cast<const float*>(OH_AI_TensorGetData(tensor));
    ASSERT_NE(retData, nullptr);
    OHPrintf("return data is:");
    for (size_t i = 0; i < dataLen; i++) {
        ASSERT_EQ(retData[i], data[i]);
        OHPrintf("%f ", retData[i]);
    }
    OHPrintf("\n");
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorGetElementNum,获取tensor元素
/**
 * @tc.name   OHOSTensorCreate0013
 * @tc.number OHOSTensorCreate0013
 * @tc.desc   OHOSTensorCreate0013
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0013()
{
    OHPrintf("==========ReadFile==========\n");
    constexpr size_t modelElementNum = 6912;
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
    int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
    OHPrintf("Tensor name: %s, elements num: %" PRId64 ".\n", OH_AI_TensorGetName(tensor), elementNum);
    ASSERT_EQ(elementNum, modelElementNum);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorGetDataSize,获取tensor大小
/**
 * @tc.name   OHOSTensorCreate0014
 * @tc.number OHOSTensorCreate0014
 * @tc.desc   OHOSTensorCreate0014
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0014()
{
    OHPrintf("==========ReadFile==========\n");
    size_t size1;
    size_t* ptrSize1 = &size1;
    char* imageBuf = ReadFile(FilePath("ml_face_isface.input").c_str(), ptrSize1);
    ASSERT_NE(imageBuf, nullptr);
    OHPrintf("==========OH_AI_TensorCreate==========\n");
    constexpr size_t createShapeNum = 4;
    constexpr size_t scaleSize = 6912;
    int64_t createShape[createShapeNum] = { 1, 48, 48, 3 };
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, imageBuf, size1);
    ASSERT_NE(tensor, nullptr);
    size_t dataSize = OH_AI_TensorGetDataSize(tensor);
    OHPrintf("Tensor data size: %zu.\n", dataSize);
    ASSERT_EQ(dataSize, scaleSize * sizeof(float));
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorGetMutableData,获取tensor可变数据指针
/**
 * @tc.name   OHOSTensorCreate0015
 * @tc.number OHOSTensorCreate0015
 * @tc.desc   OHOSTensorCreate0015
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0015()
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
    float* inputData = reinterpret_cast<float*>(OH_AI_TensorGetMutableData(tensor));
    ASSERT_NE(inputData, nullptr);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    return OH_AI_STATUS_SUCCESS;
}

// 正常场景：MSTensorClone,拷贝tensor
/**
 * @tc.name   OHOSTensorCreate0016
 * @tc.number OHOSTensorCreate0016
 * @tc.desc   OHOSTensorCreate0016
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OHOSTensorCreate0016()
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
    ASSERT_EQ(strcmp(OH_AI_TensorGetName(clone), "data_duplicate"), 0);
    delete[] imageBuf;
    OH_AI_TensorDestroy(&tensor);
    OH_AI_TensorDestroy(&clone);
    return OH_AI_STATUS_SUCCESS;
}
} // namespace MindSpore
} // namespace Acts
