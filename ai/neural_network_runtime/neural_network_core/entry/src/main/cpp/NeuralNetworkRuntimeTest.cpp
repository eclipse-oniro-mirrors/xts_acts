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

namespace {
    static const uint32_t QUANT_COUNT = 8;
}

napi_value NNQuantParam_SetScalesA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    double scales = 1.5;
    returnValue = OH_NNQuantParam_SetScales(quantParams, &scales, QUANT_COUNT);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetScalesB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    double scales = 1.5;
    returnValue = OH_NNQuantParam_SetScales(nullptr, &scales, QUANT_COUNT);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetScalesC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    returnValue = OH_NNQuantParam_SetScales(quantParams, nullptr, QUANT_COUNT);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetScalesD(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    double scales = 1.5;
    returnValue = OH_NNQuantParam_SetScales(quantParams, &scales, 0);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetZeroPointsA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    int32_t zeroPoints = 0;
    returnValue = OH_NNQuantParam_SetZeroPoints(quantParams, &zeroPoints, QUANT_COUNT);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetZeroPointsB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    int32_t zeroPoints = 0;
    returnValue = OH_NNQuantParam_SetZeroPoints(nullptr, &zeroPoints, QUANT_COUNT);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetZeroPointsC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    returnValue = OH_NNQuantParam_SetZeroPoints(quantParams, nullptr, QUANT_COUNT);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetZeroPointsD(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    int32_t zeroPoints = 0;
    returnValue = OH_NNQuantParam_SetZeroPoints(quantParams, &zeroPoints, 0);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetNumBitsA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    const uint32_t numBits = 0;
    returnValue = OH_NNQuantParam_SetNumBits(quantParams, &numBits, QUANT_COUNT);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetNumBitsB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    const uint32_t numBits = 0;
    returnValue = OH_NNQuantParam_SetNumBits(nullptr, &numBits, QUANT_COUNT);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetNumBitsC(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    returnValue = OH_NNQuantParam_SetNumBits(quantParams, nullptr, QUANT_COUNT);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_SetNumBitsD(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    const uint32_t numBits = 0;
    returnValue = OH_NNQuantParam_SetNumBits(quantParams, &numBits, 0);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_DestroyA(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    NN_QuantParam *quantParams = OH_NNQuantParam_Create();
    returnValue = OH_NNQuantParam_Destroy(&quantParams);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NNQuantParam_DestroyB(napi_env env, napi_callback_info info)
{
    OH_NN_ReturnCode returnValue = OH_NN_ReturnCode::OH_NN_FAILED;
    napi_value result;
    returnValue = OH_NNQuantParam_Destroy(nullptr);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}
