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

#include "MindSporeDataTypeTest.h"
#include <mindspore/data_type.h>
#include <mindspore/tensor.h>

namespace MindSporeDataTypeTest {
napi_value DataTypeTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    OH_AI_TensorHandle tensor = nullptr;
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_UNKNOWN);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_UNKNOWN ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_OBJECTTYPE_STRING;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_OBJECTTYPE_STRING ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_003(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 2;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_OBJECTTYPE_LIST;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_OBJECTTYPE_LIST);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_OBJECTTYPE_LIST ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_004(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_OBJECTTYPE_TUPLE;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_OBJECTTYPE_TUPLE ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_005(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_OBJECTTYPE_TENSOR;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_OBJECTTYPE_TENSOR ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_006(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_BEGIN;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_BEGIN ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_007(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_BOOL;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_BOOL ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_008(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_INT8;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_INT8 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_009(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_INT16;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_INT16 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_010(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_INT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_INT32 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_011(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_INT64;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_INT64 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_012(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_UINT8;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_UINT8 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_013(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_UINT16;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_UINT16 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_014(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_UINT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_UINT32 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_015(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_UINT64;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_UINT64 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value DataTypeTest_016(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t CreateShapeNum = 1;
    int64_t createShape[CreateShapeNum] = {PARAM_10};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_END;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, createShape, CreateShapeNum, nullptr, 0);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE tensor: %{public}d", tensor);
    auto ret = OH_AI_TensorGetDataType(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE : %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_DATATYPE_NUMBERTYPE_END ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

}