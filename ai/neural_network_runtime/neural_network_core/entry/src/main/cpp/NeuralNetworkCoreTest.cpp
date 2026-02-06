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

#include "NeuralNetworkCoreTest.h"
#include <neural_network_runtime/neural_network_runtime.h>
#include <cstdlib>
#include <cstring>

namespace {
    static const uint32_t SHAPE_SIZE = 3;
    static const uint32_t SHAPE_VALUE_32 = 32;
    static const uint32_t SHAPE_VALUE_28 = 28;
}

napi_value NNTensorDesc_DestroyA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_Destroy(&tensorDesc);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_DestroyB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    returnValue = OH_NNTensorDesc_Destroy(&tensorDesc);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetNameA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    const char *descName = "testDesc";
    returnValue = OH_NNTensorDesc_SetName(tensorDesc, descName);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetNameB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    const char *descName = "testDesc";
    returnValue = OH_NNTensorDesc_SetName(tensorDesc, descName);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetNameC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    const char *descName = nullptr;
    returnValue = OH_NNTensorDesc_SetName(tensorDesc, descName);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetNameA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    const char *descName = nullptr;
    returnValue = OH_NNTensorDesc_GetName(tensorDesc, &descName);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetNameB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    const char *descName = nullptr;
    returnValue = OH_NNTensorDesc_GetName(tensorDesc, &descName);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetNameC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetName(tensorDesc, nullptr);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetDataTypeA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_SetDataType(tensorDesc, OH_NN_DataType::OH_NN_BOOL);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetDataTypeB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    returnValue = OH_NNTensorDesc_SetDataType(tensorDesc, OH_NN_DataType::OH_NN_BOOL);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetDataTypeA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    OH_NN_DataType dataType;
    returnValue = OH_NNTensorDesc_GetDataType(tensorDesc, &dataType);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetDataTypeB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    OH_NN_DataType dataType;
    returnValue = OH_NNTensorDesc_GetDataType(tensorDesc, &dataType);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetDataTypeC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetDataType(tensorDesc, nullptr);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetShapeA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    int shape[] = {SHAPE_VALUE_32, SHAPE_VALUE_28, SHAPE_VALUE_28};
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetShapeB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    int shape[] = {SHAPE_VALUE_32, SHAPE_VALUE_28, SHAPE_VALUE_28};
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetShapeC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, nullptr, SHAPE_SIZE);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetShapeD(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    int shape[] = {SHAPE_VALUE_32, SHAPE_VALUE_28, SHAPE_VALUE_28};
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, nullptr, 0);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetShapeA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    int *shape = nullptr;
    size_t shapeSize;
    returnValue = OH_NNTensorDesc_GetShape(tensorDesc, &shape, &shapeSize);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetShapeB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    int *shape = nullptr;
    size_t shapeSize;
    returnValue = OH_NNTensorDesc_GetShape(tensorDesc, &shape, &shapeSize);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetShapeC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    size_t shapeSize;
    returnValue = OH_NNTensorDesc_GetShape(tensorDesc, nullptr, &shapeSize);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetShapeD(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    int *shape = nullptr;
    returnValue = OH_NNTensorDesc_GetShape(tensorDesc, &shape, nullptr);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetFormatA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_SetFormat(tensorDesc, OH_NN_Format::OH_NN_FORMAT_NCHW);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_SetFormatB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    returnValue = OH_NNTensorDesc_SetFormat(tensorDesc, OH_NN_Format::OH_NN_FORMAT_NCHW);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetFormatA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    OH_NN_Format format;
    returnValue = OH_NNTensorDesc_GetFormat(tensorDesc, &format);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetFormatB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    OH_NN_Format format;
    returnValue = OH_NNTensorDesc_GetFormat(tensorDesc, &format);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetFormatC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetFormat(tensorDesc, nullptr);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetElementCountA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    size_t elementCount;
    int shape[] = {SHAPE_VALUE_32, SHAPE_VALUE_28, SHAPE_VALUE_28};
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetElementCount(tensorDesc, &elementCount);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetElementCountB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    size_t elementCount;
    int shape[] = {SHAPE_VALUE_32, SHAPE_VALUE_28, SHAPE_VALUE_28};
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetElementCount(tensorDesc, &elementCount);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetElementCountC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    int shape[] = {SHAPE_VALUE_32, SHAPE_VALUE_28, SHAPE_VALUE_28};
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetElementCount(tensorDesc, nullptr);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetElementCountD(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    size_t elementCount;
    int *shape = static_cast<int *>(std::malloc(sizeof(int) * SHAPE_SIZE));
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetElementCount(tensorDesc, &elementCount);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetByteSizeA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    size_t byteSize;
    returnValue = OH_NNTensorDesc_SetDataType(tensorDesc, OH_NN_DataType::OH_NN_BOOL);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    int shape[] = {SHAPE_VALUE_32, SHAPE_VALUE_28, SHAPE_VALUE_28};
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetByteSize(tensorDesc, &byteSize);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetByteSizeB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = nullptr;
    size_t byteSize;
    returnValue = OH_NNTensorDesc_SetDataType(tensorDesc, OH_NN_DataType::OH_NN_BOOL);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    int shape[] = {SHAPE_VALUE_32, SHAPE_VALUE_28, SHAPE_VALUE_28};
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetByteSize(tensorDesc, &byteSize);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNTensorDesc_GetByteSizeC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_TensorDesc *tensorDesc = OH_NNTensorDesc_Create();
    if (tensorDesc == nullptr) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_SetDataType(tensorDesc, OH_NN_DataType::OH_NN_BOOL);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    int shape[] = {SHAPE_VALUE_32, SHAPE_VALUE_28, SHAPE_VALUE_28};
    returnValue = OH_NNTensorDesc_SetShape(tensorDesc, shape, SHAPE_SIZE);
    if (returnValue != OH_NN_ReturnCode::OH_NN_SUCCESS) {
        NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
        return result;
    }
    returnValue = OH_NNTensorDesc_GetByteSize(tensorDesc, nullptr);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}