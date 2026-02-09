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
#ifndef NEURAL_NETWORK_CORE_TEST_H
#define NEURAL_NETWORK_CORE_TEST_H

#include "napi/native_api.h"
#include "native_common.h"
#include <js_native_api_types.h>

napi_value NNTensorDesc_DestroyA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_DestroyB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetNameA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetNameB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetNameC(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetNameA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetNameB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetNameC(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetDataTypeA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetDataTypeB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetDataTypeA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetDataTypeB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetDataTypeC(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetShapeA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetShapeB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetShapeC(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetShapeD(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetShapeA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetShapeB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetShapeC(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetShapeD(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetFormatA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_SetFormatB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetFormatA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetFormatB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetFormatC(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetElementCountA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetElementCountB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetElementCountC(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetElementCountD(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetByteSizeA(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetByteSizeB(napi_env env, napi_callback_info info);
napi_value NNTensorDesc_GetByteSizeC(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetScalesA(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetScalesB(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetScalesC(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetScalesD(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetZeroPointsA(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetZeroPointsB(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetZeroPointsC(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetZeroPointsD(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetNumBitsA(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetNumBitsB(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetNumBitsC(napi_env env, napi_callback_info info);
napi_value NNQuantParam_SetNumBitsD(napi_env env, napi_callback_info info);
napi_value NNQuantParam_DestroyA(napi_env env, napi_callback_info info);
napi_value NNQuantParam_DestroyB(napi_env env, napi_callback_info info);
napi_value NNReturnCode_DynamicShape(napi_env env, napi_callback_info info);
napi_value NNFuseType_FusedRelu(napi_env env, napi_callback_info info);
napi_value NNFuseType_FusedRelu6(napi_env env, napi_callback_info info);
napi_value NNOperationType_OpsExpandDimsA(napi_env env, napi_callback_info info);
napi_value NNDataTypeCommonTest(napi_env env, napi_callback_info info);
napi_value NNOperationTypeCommonTest(napi_env env, napi_callback_info info);
napi_value NNDeviceTypeCommonTest(napi_env env, napi_callback_info info);
napi_value HandleTensorOperations(napi_env env, napi_callback_info info);
napi_value OhNnQuantParamCode(napi_env env, napi_callback_info info);
napi_value OhNnMemoryCode(napi_env env, napi_callback_info info);

template <class T>
class TestOptional {
public:
    TestOptional() : hasValue_(false) {}
    explicit TestOptional(T value) : value_(value), hasValue_(true) {}

    bool HasValue() const { return hasValue_; }
    explicit operator bool() const { return hasValue_; }
    const T& Value() const& { return value_; }

    TestOptional& operator=(T value)
    {
        value_ = value;
        hasValue_ = true;
        return *this;
    }
private:
    T value_;
    bool hasValue_;
};

#endif // NEURAL_NETWORK_CORE_TEST_H
