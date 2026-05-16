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
#define LOG_TAG "NNRtTensorTest"

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
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensor0100
 * @tc.desc   创建Tensor，TensorDesc为nullptr
 */
int TestTensorCreate0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreate0100 START");

    size_t deviceId = 0;
    int ret = GetDeviceID(&deviceId);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed, ret=%{public}d", ret);
        return -1;
    }

    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, nullptr);
    if (tensor != nullptr) {
        OH_NNTensor_Destroy(&tensor);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got tensor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreate0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensor0200
 * @tc.desc   创建Tensor，deviceId=0，设备找到，创建成功
 */
int TestTensorCreate0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreate0200 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;

    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNTensor_Destroy(&tensor);
    if (ret != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Destroy failed, ret=%{public}d", ret);
        return -1;
    }

    OH_NNTensorDesc_Destroy(&tensorDesc);
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreate0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0100
 * @tc.desc   根据size创建Tensor，TensorDesc为nullptr
 */
int TestTensorCreateWithSize0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithSize0100 START");

    size_t deviceId = 0;
    int ret = GetDeviceID(&deviceId);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed, ret=%{public}d", ret);
        return -1;
    }

    size_t size = 4;
    NN_Tensor *tensor = OH_NNTensor_CreateWithSize(deviceId, nullptr, size);
    if (tensor != nullptr) {
        OH_NNTensor_Destroy(&tensor);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got tensor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithSize0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetDataBuffer0100
 * @tc.desc   获取databuffer，tensor为空
 */
int TestTensorGetDataBuffer0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetDataBuffer0100 START");

    void *buffer = OH_NNTensor_GetDataBuffer(nullptr);
    if (buffer != nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got buffer");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetDataBuffer0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetDataBuffer0200
 * @tc.desc   获取databuffer，返回正确
 */
int TestTensorGetDataBuffer0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetDataBuffer0200 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    int ret = GetDeviceID(&deviceId);
    if (ret != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed, ret=%{public}d", ret);
        return -1;
    }

    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    void *buffer = OH_NNTensor_GetDataBuffer(tensor);
    if (buffer == nullptr) {
        OH_NNTensor_Destroy(&tensor);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetDataBuffer returned nullptr");
        return -1;
    }

    OH_NNTensor_Destroy(&tensor);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetDataBuffer0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_Destroy0100
 * @tc.desc   销毁tensor，tensor为空
 */
int TestTensorDestroy0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorDestroy0100 START");

    OH_NN_ReturnCode ret = OH_NNTensor_Destroy(nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorDestroy0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetTensorDesc0100
 * @tc.desc   获取TensorDesc，tensor为空
 */
int TestTensorGetTensorDesc0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetTensorDesc0100 START");

    NN_TensorDesc *desc = OH_NNTensor_GetTensorDesc(nullptr);
    if (desc != nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got tensorDesc");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetTensorDesc0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetSize0100
 * @tc.desc   获取SIZE，tensor为空
 */
int TestTensorGetSize0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetSize0100 START");

    size_t size = 0;
    OH_NN_ReturnCode ret = OH_NNTensor_GetSize(nullptr, &size);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetSize0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetFd0100
 * @tc.desc   获取Fd，tensor为空
 */
int TestTensorGetFd0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetFd0100 START");

    int fd = -1;
    OH_NN_ReturnCode ret = OH_NNTensor_GetFd(nullptr, &fd);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetFd0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetOffset0100
 * @tc.desc   获取offset，tensor为空
 */
int TestTensorGetOffset0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetOffset0100 START");

    size_t offset = 0;
    OH_NN_ReturnCode ret = OH_NNTensor_GetOffset(nullptr, &offset);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetOffset0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensor0300
 * @tc.desc   创建Tensor，成功创建
 */
int TestTensorCreate0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreate0300 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    OH_NNTensor_Destroy(&tensor);
    OH_NNTensorDesc_Destroy(&tensorDesc);

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreate0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0200
 * @tc.desc   根据size创建Tensor，size = 0
 */
int TestTensorCreateWithSize0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithSize0200 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    size_t size = 0;
    NN_Tensor *tensor = OH_NNTensor_CreateWithSize(deviceId, tensorDesc, size);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (tensor != nullptr) {
        OH_NNTensor_Destroy(&tensor);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got valid tensor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithSize0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithSize0300
 * @tc.desc   根据size创建Tensor，size < tensor size
 */
int TestTensorCreateWithSize0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithSize0300 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    size_t byteSize = 0;
    if (OH_NNTensorDesc_GetByteSize(tensorDesc, &byteSize) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensorDesc_GetByteSize failed");
        return -1;
    }

    size_t size = byteSize - 1;
    NN_Tensor *tensor = OH_NNTensor_CreateWithSize(deviceId, tensorDesc, size);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (tensor != nullptr) {
        OH_NNTensor_Destroy(&tensor);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got valid tensor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithSize0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0100
 * @tc.desc   通过fd根据size创建Tensor，TensorDesc为nullptr
 */
int TestTensorCreateWithFd0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0100 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    size_t size = 4;
    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    int fd = -1;
    if (OH_NNTensor_GetFd(tensor, &fd) != OH_NN_SUCCESS) {
        OH_NNTensor_Destroy(&tensor);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetFd failed");
        return -1;
    }

    size_t offset = 1;
    NN_Tensor *tensortmp = OH_NNTensor_CreateWithFd(deviceId, nullptr, fd, size, offset);
    OH_NNTensor_Destroy(&tensor);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (tensortmp != nullptr) {
        OH_NNTensor_Destroy(&tensortmp);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got valid tensor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0200
 * @tc.desc   通过fd根据size创建Tensor，fd = -1
 */
int TestTensorCreateWithFd0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0200 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    size_t size = 4;
    int fd = -1;
    size_t offset = 1;
    NN_Tensor *tensor = OH_NNTensor_CreateWithFd(deviceId, tensorDesc, fd, size, offset);

    OH_NNTensorDesc_Destroy(&tensorDesc);

    if (tensor != nullptr) {
        OH_NNTensor_Destroy(&tensor);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got valid tensor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0300
 * @tc.desc   通过fd根据size创建Tensor，size = 0
 */
int TestTensorCreateWithFd0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0300 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    int fd = -1;
    if (OH_NNTensor_GetFd(tensor, &fd) != OH_NN_SUCCESS) {
        OH_NNTensor_Destroy(&tensor);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetFd failed");
        return -1;
    }

    size_t offset = 0;
    NN_TensorDesc *tensorDescTmp = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    NN_Tensor *tensortmp = OH_NNTensor_CreateWithFd(deviceId, tensorDescTmp, fd, 0, offset);

    OH_NNTensor_Destroy(&tensor);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    OH_NNTensorDesc_Destroy(&tensorDescTmp);

    if (tensortmp != nullptr) {
        OH_NNTensor_Destroy(&tensortmp);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got valid tensor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0400
 * @tc.desc   通过fd根据size创建Tensor，size = offset
 */
int TestTensorCreateWithFd0400()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0400 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    size_t size = 4;
    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    int fd = -1;
    if (OH_NNTensor_GetFd(tensor, &fd) != OH_NN_SUCCESS) {
        OH_NNTensor_Destroy(&tensor);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetFd failed");
        return -1;
    }

    size_t offset = 4;
    NN_TensorDesc *tensorDescTmp = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    NN_Tensor *tensortmp = OH_NNTensor_CreateWithFd(deviceId, tensorDescTmp, fd, size, offset);

    OH_NNTensor_Destroy(&tensor);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    OH_NNTensorDesc_Destroy(&tensorDescTmp);

    if (tensortmp != nullptr) {
        OH_NNTensor_Destroy(&tensortmp);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got valid tensor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0400 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_CreateTensorWithFd0500
 * @tc.desc   通过fd根据size创建Tensor，size-offset < tensorDescBytesize
 */
int TestTensorCreateWithFd0500()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0500 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    size_t byteSize = 0;
    if (OH_NNTensorDesc_GetByteSize(tensorDesc, &byteSize) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensorDesc_GetByteSize failed");
        return -1;
    }

    size_t size = 10;
    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    int fd = -1;
    if (OH_NNTensor_GetFd(tensor, &fd) != OH_NN_SUCCESS) {
        OH_NNTensor_Destroy(&tensor);
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetFd failed");
        return -1;
    }

    size_t offset = size - byteSize + 1;
    NN_TensorDesc *tensorDescTmp = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    NN_Tensor *tensortmp = OH_NNTensor_CreateWithFd(deviceId, tensorDescTmp, fd, size, offset);

    OH_NNTensor_Destroy(&tensor);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    OH_NNTensorDesc_Destroy(&tensorDescTmp);

    if (tensortmp != nullptr) {
        OH_NNTensor_Destroy(&tensortmp);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected nullptr but got valid tensor");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorCreateWithFd0500 PASSED");
    return 0;
}


/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_Destroy0200
 * @tc.desc   销毁tensor，*tensor为空
 */
int TestTensorDestroy0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorDestroy0200 START");
    NN_Tensor *tensor = nullptr;
    OH_NN_ReturnCode ret = OH_NNTensor_Destroy(&tensor);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorDestroy0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetTensorDesc0200
 * @tc.desc   获取TensorDesc，返回正确
 */
int TestTensorGetTensorDesc0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetTensorDesc0200 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    const NN_TensorDesc *resultDesc = OH_NNTensor_GetTensorDesc(tensor);

    OH_NNTensor_Destroy(&tensor);
    OH_NNTensorDesc_Destroy(&tensorDesc);

    if (resultDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetTensorDesc returned nullptr");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetTensorDesc0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetSize0200
 * @tc.desc   获取SIZE，OH_NNTensor_Create创建
 */
int TestTensorGetSize0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetSize0200 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    size_t size = 0;
    OH_NN_ReturnCode ret = OH_NNTensor_GetSize(tensor, &size);

    OH_NNTensor_Destroy(&tensor);
    OH_NNTensorDesc_Destroy(&tensorDesc);

    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetSize failed, ret=%{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetSize0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetSize0300
 * @tc.desc   获取SIZE，OH_NNTensor_CreateWithSize创建
 */
int TestTensorGetSize0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetSize0300 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    size_t byteSize = 0;
    if (OH_NNTensorDesc_GetByteSize(tensorDesc, &byteSize) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensorDesc_GetByteSize failed");
        return -1;
    }

    size_t size = byteSize + 2;
    NN_Tensor *tensor = OH_NNTensor_CreateWithSize(deviceId, tensorDesc, size);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_CreateWithSize returned nullptr");
        return -1;
    }

    size_t sizeTmp = 0;
    OH_NN_ReturnCode ret = OH_NNTensor_GetSize(tensor, &sizeTmp);

    OH_NNTensor_Destroy(&tensor);
    OH_NNTensorDesc_Destroy(&tensorDesc);

    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetSize failed, ret=%{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetSize0300 PASSED");
    return 0;
}


/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetFd0200
 * @tc.desc   获取Fd，返回成功
 */
int TestTensorGetFd0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetFd0200 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    int fd = -1;
    OH_NN_ReturnCode ret = OH_NNTensor_GetFd(tensor, &fd);

    OH_NNTensorDesc_Destroy(&tensorDesc);
    OH_NNTensor_Destroy(&tensor);

    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetFd failed, ret=%{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetFd0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Tensor_GetOffset0200
 * @tc.desc   获取offset，返回成功，offset = 0
 */
int TestTensorGetOffset0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetOffset0200 START");

    int32_t inputDims[4] = {1, 1, 2, 3};
    NN_TensorDesc *tensorDesc = createTensorDesc(inputDims, 4, OH_NN_FLOAT32, OH_NN_FORMAT_NCHW);
    size_t deviceId = 0;
    if (GetDeviceID(&deviceId) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] GetDeviceID failed");
        return -1;
    }

    NN_Tensor *tensor = OH_NNTensor_Create(deviceId, tensorDesc);
    if (tensor == nullptr) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_Create returned nullptr");
        return -1;
    }

    size_t offset = 0;
    OH_NN_ReturnCode ret = OH_NNTensor_GetOffset(tensor, &offset);

    OH_NNTensorDesc_Destroy(&tensorDesc);
    OH_NNTensor_Destroy(&tensor);

    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] OH_NNTensor_GetOffset failed, ret=%{public}d", ret);
        return -1;
    }

    if (offset != 0) {
        OH_LOG_ERROR(LOG_APP, "[TensorTest] Expected offset=0 but got %{public}zu", offset);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorTest] TestTensorGetOffset0200 PASSED");
    return 0;
}
    

// 导出所有测试函数
struct TensorTestCase {
    const char *name;
    int (*func)();
};

static std::vector<TensorTestCase> g_tensorTests = {
    {"TestTensorCreate0100", TestTensorCreate0100},
    {"TestTensorCreate0200", TestTensorCreate0200},
    {"TestTensorCreate0300", TestTensorCreate0300},
    {"TestTensorCreateWithSize0100", TestTensorCreateWithSize0100},
    {"TestTensorCreateWithSize0200", TestTensorCreateWithSize0200},
    {"TestTensorCreateWithSize0300", TestTensorCreateWithSize0300},
    {"TestTensorCreateWithFd0100", TestTensorCreateWithFd0100},
    {"TestTensorCreateWithFd0200", TestTensorCreateWithFd0200},
    {"TestTensorCreateWithFd0300", TestTensorCreateWithFd0300},
    {"TestTensorCreateWithFd0400", TestTensorCreateWithFd0400},
    {"TestTensorCreateWithFd0500", TestTensorCreateWithFd0500},
    {"TestTensorGetDataBuffer0100", TestTensorGetDataBuffer0100},
    {"TestTensorGetDataBuffer0200", TestTensorGetDataBuffer0200},
    {"TestTensorDestroy0100", TestTensorDestroy0100},
    {"TestTensorDestroy0200", TestTensorDestroy0200},
    {"TestTensorGetTensorDesc0100", TestTensorGetTensorDesc0100},
    {"TestTensorGetTensorDesc0200", TestTensorGetTensorDesc0200},
    {"TestTensorGetSize0100", TestTensorGetSize0100},
    {"TestTensorGetSize0200", TestTensorGetSize0200},
    {"TestTensorGetSize0300", TestTensorGetSize0300},
    {"TestTensorGetFd0100", TestTensorGetFd0100},
    {"TestTensorGetFd0200", TestTensorGetFd0200},
    {"TestTensorGetOffset0100", TestTensorGetOffset0100},
    {"TestTensorGetOffset0200", TestTensorGetOffset0200},
};

// 运行所有Tensor测试
int RunAllTensorTests()
{
    int passCount = 0;
    int failCount = 0;

    OH_LOG_INFO(LOG_APP, "========== Running Tensor Tests ==========");
    OH_LOG_INFO(LOG_APP, "Total test cases: %{public}zu", g_tensorTests.size());

    for (const auto &testCase : g_tensorTests) {
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

    OH_LOG_INFO(LOG_APP, "========== Tensor Tests Summary ==========");
    OH_LOG_INFO(LOG_APP, "Passed: %{public}d, Failed: %{public}d", passCount, failCount);

    return (failCount == 0) ? 0 : -1;
}

} // namespace NeuralNetworkCore
} // namespace OHOS
