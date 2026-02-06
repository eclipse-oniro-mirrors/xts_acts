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
#include <vector>
#include <string>
#include "NNcoreUtilsTest.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0001
#define LOG_TAG "NNRtTensorDescTest"

using namespace OHOS::NeuralNetworkRuntime::Test;

namespace OHOS {
namespace NeuralNetworkCore {

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescCreate0100
 * @tc.desc   创建TensorDesc
 */
int TestTensorDescCreate0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescCreate0100 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Destroy failed, ret=%{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescCreate0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0100
 * @tc.desc   销毁TensorDesc，TensorDesc为空
 */
int TestTensorDescDestroy0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescDestroy0100 START");

    OH_NN_ReturnCode ret = OH_NNTensorDesc_Destroy(nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescDestroy0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0100
 * @tc.desc   设置TensorDesc数据类型，TensorDesc为空
 */
int TestTensorDescSetDataType0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetDataType0100 START");

    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetDataType(nullptr, OH_NN_UNKNOWN);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetDataType0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0200
 * @tc.desc   设置TensorDesc数据类型，遍历DataType
 */
int TestTensorDescSetDataType0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetDataType0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetDataType(tensorDesc, OH_NN_UNKNOWN);
    if (ret != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] SetDataType(OH_NN_UNKNOWN) failed, ret=%{public}d", ret);
        return -1;
    }

    ret = OH_NNTensorDesc_SetDataType(tensorDesc, OH_NN_FLOAT64);
    if (ret != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] SetDataType(OH_NN_FLOAT64) failed, ret=%{public}d", ret);
        return -1;
    }

    ret = OH_NNTensorDesc_SetDataType(tensorDesc, OH_NN_BOOL);
    if (ret != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] SetDataType(OH_NN_BOOL) failed, ret=%{public}d", ret);
        return -1;
    }

    OH_NNTensorDesc_Destroy(&tensorDesc);
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetDataType0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetDataType0100
 * @tc.desc   获取TensorDesc数据类型，TensorDesc为空
 */
int TestTensorDescGetDataType0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetDataType0100 START");

    OH_NN_DataType dataType;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetDataType(nullptr, &dataType);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetDataType0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetShape0100
 * @tc.desc   设置TensorDescShape，TensorDesc为空
 */
int TestTensorDescSetShape0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetShape0100 START");

    int32_t inputDims[4] = {1, 2, 2, 3};
    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetShape(nullptr, inputDims, 4);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetShape0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0100
 * @tc.desc   获取TensorDescShape，TensorDesc为空
 */
int TestTensorDescGetShape0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetShape0100 START");

    size_t shapeLength = 0;
    int32_t *shape = nullptr;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetShape(nullptr, &shape, &shapeLength);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetShape0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetFormat0100
 * @tc.desc   设置TensorDescFormat，TensorDesc为空
 */
int TestTensorDescSetFormat0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetFormat0100 START");

    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetFormat(nullptr, OH_NN_FORMAT_NONE);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetFormat0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0100
 * @tc.desc   获取TensorDescFormat，TensorDesc为空
 */
int TestTensorDescGetFormat0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetFormat0100 START");

    OH_NN_Format format = OH_NN_FORMAT_NONE;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetFormat(nullptr, &format);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetFormat0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0200
 * @tc.desc   销毁TensorDesc，*TensorDesc为空
 */
int TestTensorDescDestroy0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescDestroy0200 START");

    NN_TensorDesc *tensorDesc = nullptr;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescDestroy0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescDestroy0300
 * @tc.desc   销毁TensorDesc
 */
int TestTensorDescDestroy0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescDestroy0300 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Destroy failed, ret=%{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescDestroy0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetDataType0300
 * @tc.desc   设置TensorDesc数据类型，DataType不合法
 */
int TestTensorDescSetDataType0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetDataType0300 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    int dataType = static_cast<int>(OH_NN_FLOAT64) + 1;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetDataType(tensorDesc, static_cast<OH_NN_DataType>(dataType));
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER for dataType+1 but got %{public}d",
                     ret);
        return -1;
    }

    dataType = static_cast<int>(OH_NN_UNKNOWN) - 1;
    ret = OH_NNTensorDesc_SetDataType(tensorDesc, static_cast<OH_NN_DataType>(dataType));
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER for dataType-1 but got %{public}d",
                     ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetDataType0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetDataType0200
 * @tc.desc   获取TensorDesc数据类型，未设置DataType
 */
int TestTensorDescGetDataType0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetDataType0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    OH_NN_DataType dataType = OH_NN_UNKNOWN;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetDataType(tensorDesc, &dataType);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_GetDataType failed, ret=%{public}d", ret);
        return -1;
    }

    if (dataType != OH_NN_UNKNOWN) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_UNKNOWN but got %{public}d", dataType);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetDataType0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetShape0200
 * @tc.desc   设置TensorDescShape，shape为空
 */
int TestTensorDescSetShape0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetShape0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetShape(tensorDesc, nullptr, 0);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetShape0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0200
 * @tc.desc   获取TensorDescShape，未设置shape
 */
int TestTensorDescGetShape0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetShape0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    size_t shapeLength = 0;
    int32_t *shape = nullptr;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetShape(tensorDesc, &shape, &shapeLength);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_GetShape failed, ret=%{public}d", ret);
        return -1;
    }

    if (shape != nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected nullptr but got non-null shape");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetShape0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetShape0300
 * @tc.desc   获取TensorDescShape，合法设置返回成功
 */
int TestTensorDescGetShape0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetShape0300 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    const size_t setShapeLength = 4;
    int32_t inputDims[4] = {1, 2, 2, 3};
    if (OH_NNTensorDesc_SetShape(tensorDesc, inputDims, setShapeLength) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_SetShape failed");
        return -1;
    }

    size_t shapeLength = 0;
    int32_t *shape = nullptr;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetShape(tensorDesc, &shape, &shapeLength);
    const size_t expectedShapeLength = 4;

    if (ret != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_GetShape failed, ret=%{public}d", ret);
        return -1;
    }

    if (shapeLength != expectedShapeLength) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Shape length mismatch, expected 4 but got %{public}zu", shapeLength);
        return -1;
    }

    for (size_t i = 0; i < shapeLength; i++) {
        if (inputDims[i] != shape[i]) {
            OH_NNTensorDesc_Destroy(&tensorDesc);
            OH_LOG_ERROR(LOG_APP,
                         "[TensorDescTest] Shape[%{public}zu] mismatch, expected %{public}d but got %{public}d", i,
                         inputDims[i], shape[i]);
            return -1;
        }
    }

    OH_NNTensorDesc_Destroy(&tensorDesc);

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetShape0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetFormat0200
 * @tc.desc   设置TensorDescFormat，遍历设置format
 */
int TestTensorDescSetFormat0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetFormat0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    if (OH_NNTensorDesc_SetFormat(tensorDesc, OH_NN_FORMAT_NONE) != OH_NN_SUCCESS ||
        OH_NNTensorDesc_SetFormat(tensorDesc, OH_NN_FORMAT_NCHW) != OH_NN_SUCCESS ||
        OH_NNTensorDesc_SetFormat(tensorDesc, OH_NN_FORMAT_NHWC) != OH_NN_SUCCESS ||
        OH_NNTensorDesc_SetFormat(tensorDesc, OH_NN_FORMAT_ND) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_SetFormat failed");
        return -1;
    }

    OH_NNTensorDesc_Destroy(&tensorDesc);

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetFormat0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0200
 * @tc.desc   获取TensorDescFormat，未设置Format
 */
int TestTensorDescGetFormat0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetFormat0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    OH_NN_Format format = OH_NN_FORMAT_NONE;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetFormat(tensorDesc, &format);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_GetFormat failed, ret=%{public}d", ret);
        return -1;
    }
    if (format != OH_NN_FORMAT_NONE) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_FORMAT_NONE but got %{public}d", format);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetFormat0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetFormat0300
 * @tc.desc   获取TensorDescFormat，合法获取，返回成功
 */
int TestTensorDescGetFormat0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetFormat0300 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    if (OH_NNTensorDesc_SetFormat(tensorDesc, OH_NN_FORMAT_NCHW) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_SetFormat failed");
        return -1;
    }

    OH_NN_Format format = OH_NN_FORMAT_NONE;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetFormat(tensorDesc, &format);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_GetFormat failed, ret=%{public}d", ret);
        return -1;
    }
    if (format != OH_NN_FORMAT_NCHW) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_FORMAT_NCHW but got %{public}d", format);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetFormat0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0100
 * @tc.desc   获取TensorDescElementCount，TensorDesc为空
 */
int TestTensorDescGetElementCount0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetElementCount0100 START");

    size_t elementCount = 0;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetElementCount(nullptr, &elementCount);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetElementCount0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0200
 * @tc.desc   获取TensorDescElementCount，合理设置返回正确
 */
int TestTensorDescGetElementCount0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetElementCount0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    const size_t setShapeLength = 4;
    int32_t inputDims[4] = {1, 2, 2, 3};
    if (OH_NNTensorDesc_SetShape(tensorDesc, inputDims, setShapeLength) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_SetShape failed");
        return -1;
    }

    size_t elementCount = 0;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetElementCount(tensorDesc, &elementCount);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_GetElementCount failed, ret=%{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetElementCount0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetElementCount0300
 * @tc.desc   获取TensorDescElementCount，不设置，返回错误
 */
int TestTensorDescGetElementCount0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetElementCount0300 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    size_t elementCount = 0;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetElementCount(tensorDesc, &elementCount);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetElementCount0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0100
 * @tc.desc   获取TensorDescByteSize，TensorDesc为空
 */
int TestTensorDescGetByteSize0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetByteSize0100 START");

    size_t byteSize = 0;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetByteSize(nullptr, &byteSize);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetByteSize0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0200
 * @tc.desc   获取TensorDescByteSize，合理设置返回正确
 */
int TestTensorDescGetByteSize0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetByteSize0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    const size_t shapeLength = 4;
    int32_t inputDims[4] = {1, 2, 2, 3};
    if (OH_NNTensorDesc_SetDataType(tensorDesc, OH_NN_FLOAT32) != OH_NN_SUCCESS ||
        OH_NNTensorDesc_SetShape(tensorDesc, inputDims, shapeLength) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Setup failed");
        return -1;
    }

    size_t byteSize = 0;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetByteSize(tensorDesc, &byteSize);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_GetByteSize failed, ret=%{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetByteSize0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetByteSize0300
 * @tc.desc   获取TensorDescByteSize，不设置，返回错误
 */
int TestTensorDescGetByteSize0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetByteSize0300 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    size_t byteSize = 0;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetByteSize(tensorDesc, &byteSize);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetByteSize0300 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetName0100
 * @tc.desc   设置TensorDescName，TensorDesc为空
 */
int TestTensorDescSetName0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetName0100 START");

    const char *name = "tensorDesc";
    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetName(nullptr, name);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetName0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescSetName0200
 * @tc.desc   设置TensorDescName，name为空
 */
int TestTensorDescSetName0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetName0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    OH_NN_ReturnCode ret = OH_NNTensorDesc_SetName(tensorDesc, nullptr);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescSetName0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetName0100
 * @tc.desc   获取TensorDescName，TensorDesc为空
 */
int TestTensorDescGetName0100()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetName0100 START");

    const char *name = nullptr;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetName(nullptr, &name);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected OH_NN_INVALID_PARAMETER but got %{public}d", ret);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetName0100 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetName0200
 * @tc.desc   获取TensorDescName，合理设置返回正确
 */
int TestTensorDescGetName0200()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetName0200 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    const char *nameIn = "tensorDesc";
    if (OH_NNTensorDesc_SetName(tensorDesc, nameIn) != OH_NN_SUCCESS) {
        OH_NNTensorDesc_Destroy(&tensorDesc);
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_SetName failed");
        return -1;
    }

    const char *nameOut = nullptr;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetName(tensorDesc, &nameOut);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_GetName failed, ret=%{public}d", ret);
        return -1;
    }
    if (*nameIn != *nameOut) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Name mismatch");
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetName0200 PASSED");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Core_Func_North_TensorDescGetName0300
 * @tc.desc   获取TensorDescName，不设置，返回错误
 */
int TestTensorDescGetName0300()
{
    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetName0300 START");

    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_Create returned nullptr");
        return -1;
    }

    const char *nameOut = nullptr;
    OH_NN_ReturnCode ret = OH_NNTensorDesc_GetName(tensorDesc, &nameOut);
    OH_NNTensorDesc_Destroy(&tensorDesc);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] OH_NNTensorDesc_GetName failed, ret=%{public}d", ret);
        return -1;
    }
    std::string name(nameOut);
    std::string empty("");
    if (empty != name) {
        OH_LOG_ERROR(LOG_APP, "[TensorDescTest] Expected empty string but got %{public}s", nameOut);
        return -1;
    }

    OH_LOG_INFO(LOG_APP, "[TensorDescTest] TestTensorDescGetName0300 PASSED");
    return 0;
}

// 导出所有测试函数
struct TensorDescTestCase {
    const char *name;
    int (*func)();
};

static std::vector<TensorDescTestCase> g_tensorDescTests = {
    {"TestTensorDescCreate0100", TestTensorDescCreate0100},
    {"TestTensorDescDestroy0100", TestTensorDescDestroy0100},
    {"TestTensorDescDestroy0200", TestTensorDescDestroy0200},
    {"TestTensorDescDestroy0300", TestTensorDescDestroy0300},
    {"TestTensorDescSetDataType0100", TestTensorDescSetDataType0100},
    {"TestTensorDescSetDataType0200", TestTensorDescSetDataType0200},
    {"TestTensorDescSetDataType0300", TestTensorDescSetDataType0300},
    {"TestTensorDescGetDataType0100", TestTensorDescGetDataType0100},
    {"TestTensorDescGetDataType0200", TestTensorDescGetDataType0200},
    {"TestTensorDescSetShape0100", TestTensorDescSetShape0100},
    {"TestTensorDescSetShape0200", TestTensorDescSetShape0200},
    {"TestTensorDescGetShape0100", TestTensorDescGetShape0100},
    {"TestTensorDescGetShape0200", TestTensorDescGetShape0200},
    {"TestTensorDescGetShape0300", TestTensorDescGetShape0300},
    {"TestTensorDescSetFormat0100", TestTensorDescSetFormat0100},
    {"TestTensorDescSetFormat0200", TestTensorDescSetFormat0200},
    {"TestTensorDescGetFormat0100", TestTensorDescGetFormat0100},
    {"TestTensorDescGetFormat0200", TestTensorDescGetFormat0200},
    {"TestTensorDescGetFormat0300", TestTensorDescGetFormat0300},
    {"TestTensorDescGetElementCount0100", TestTensorDescGetElementCount0100},
    {"TestTensorDescGetElementCount0200", TestTensorDescGetElementCount0200},
    {"TestTensorDescGetElementCount0300", TestTensorDescGetElementCount0300},
    {"TestTensorDescGetByteSize0100", TestTensorDescGetByteSize0100},
    {"TestTensorDescGetByteSize0200", TestTensorDescGetByteSize0200},
    {"TestTensorDescGetByteSize0300", TestTensorDescGetByteSize0300},
    {"TestTensorDescSetName0100", TestTensorDescSetName0100},
    {"TestTensorDescSetName0200", TestTensorDescSetName0200},
    {"TestTensorDescGetName0100", TestTensorDescGetName0100},
    {"TestTensorDescGetName0200", TestTensorDescGetName0200},
    {"TestTensorDescGetName0300", TestTensorDescGetName0300},
};

// 运行所有TensorDesc测试
int RunAllTensorDescTests()
{
    int passCount = 0;
    int failCount = 0;

    OH_LOG_INFO(LOG_APP, "========== Running TensorDesc Tests ==========");
    OH_LOG_INFO(LOG_APP, "Total test cases: %{public}zu", g_tensorDescTests.size());

    for (const auto &testCase : g_tensorDescTests) {
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

    OH_LOG_INFO(LOG_APP, "========== TensorDesc Tests Summary ==========");
    OH_LOG_INFO(LOG_APP, "Passed: %{public}d, Failed: %{public}d", passCount, failCount);

    return (failCount == 0) ? 0 : -1;
}

} // namespace NeuralNetworkCore
} // namespace OHOS
