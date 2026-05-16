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

#include "MindSporeFormatTest.h"
#include <mindspore/data_type.h>
#include <mindspore/tensor.h>

namespace MindSporeFormatTest {
napi_value FormatTest_001(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NCHW);
    auto ret = OH_AI_TensorGetFormat(tensor);
    napi_create_int32(env, ret == OH_AI_FORMAT_NCHW ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_002(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NHWC4);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_NHWC4 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_003(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_HWCK);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_HWCK ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_004(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_KCHW);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_KCHW ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_005(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_CKHW);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_CKHW ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_006(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_KHWC);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_KHWC ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_007(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_CHWK);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_CHWK ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_008(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_HW);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_HW ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_009(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_HW4);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_HW4 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_010(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NC);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_NC ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_011(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NC4);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_NC4 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_012(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NC4HW4);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_NC4HW4 ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_013(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NCDHW);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_NCDHW ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_014(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NWC);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_NWC ? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

napi_value FormatTest_015(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    constexpr size_t create_shape_num = 4;
    int64_t create_shape[create_shape_num] = {1, 48, 48, 3};
    OH_AI_DataType datatype = OH_AI_DATATYPE_NUMBERTYPE_FLOAT32;
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", datatype, create_shape, create_shape_num, nullptr, 0);
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NCW);
    auto ret = OH_AI_TensorGetFormat(tensor);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "datatype", "OH_AI_DATATYPE_UNKNOWN: %{public}d", ret);
    napi_create_int32(env, ret == OH_AI_FORMAT_NCW? 0 : 1, &retValue);
    OH_AI_TensorDestroy(&tensor);
    return retValue;
}

}