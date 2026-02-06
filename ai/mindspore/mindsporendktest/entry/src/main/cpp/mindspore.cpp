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

#include "mindspore/context.h"
#include "mindspore/data_type.h"
#include "mindspore/model.h"
#include "mindspore/status.h"
#include "napi/native_api.h"
#include "native_common.h"
#include <cerrno>
#include <cstdlib>
#include <fstream>
#include <js_native_api_types.h>

#define SUCCESS 0
#define FAIL (-1)
int GenerateInputDataWithRandom(OH_AI_TensorHandleArray inputs)
{
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        float *input_data = (float *)OH_AI_TensorGetMutableData(inputs.handle_list[i]);
        if (input_data == NULL) {
            printf("MSTensorGetMutableData failed.\n");
            return OH_AI_STATUS_LITE_ERROR;
        }
        int64_t num = OH_AI_TensorGetElementNum(inputs.handle_list[i]);
        const int divisor = 10;
        for (size_t j = 0; j < num; j++) {
            input_data[j] = (float)(rand() % divisor) / divisor;
        }
    }
    return OH_AI_STATUS_SUCCESS;
}

static napi_value OHAIContextCreateOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();

    napi_value result = nullptr;
    napi_create_int32(env, oH_AI_ContextHandle != nullptr, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextDestroyOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();

    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    napi_create_int32(env, oH_AI_ContextHandle == nullptr, &result);

    return result;
}

static napi_value OHAIContextSetThreadNumOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadNum(oH_AI_ContextHandle, valueOne);
    int32_t threadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, threadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadNumTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;

    napi_value result = nullptr;
    OH_AI_ContextSetThreadNum(oH_AI_ContextHandle, valueOne);
    int32_t threadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, threadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadNumOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadNum(oH_AI_ContextHandle, valueOne);
    int32_t getThreadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, getThreadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadNumTwo(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;
    napi_value result = nullptr;
    int32_t oH_AI_ContextGetThreadNum = OH_AI_ContextGetThreadNum(oH_AI_ContextHandle);
    napi_create_int32(env, oH_AI_ContextGetThreadNum, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityModeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, valueOne);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityModeTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, valueOne);
    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadAffinityModeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetThreadAffinityMode(oH_AI_ContextHandle, valueOne);
    int threadAffinityModeResult = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityModeResult, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadAffinityModeTwo(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;
    napi_value result = nullptr;

    int threadAffinityMode = OH_AI_ContextGetThreadAffinityMode(oH_AI_ContextHandle);
    napi_create_int32(env, threadAffinityMode, &result);

    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIDeviceInfoCreateOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_ContextHandle Create Error");
        napi_create_int32(env, oH_AI_DeviceInfoHandle != nullptr, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceTypeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceType == OH_AI_DEVICETYPE_CPU, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceTypeTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceType == OH_AI_DEVICETYPE_NNRT, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceTypeThree(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_INVALID) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle == nullptr, "Create oH_AI_DeviceInfoHandle != nullptr");
        OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceType == OH_AI_DEVICETYPE_INVALID, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceTypeFour(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    OH_AI_DeviceType deviceType = OH_AI_DeviceInfoGetDeviceType(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, deviceType == OH_AI_DEVICETYPE_INVALID, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIDeviceInfoDestroyOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
        napi_create_int32(env, oH_AI_DeviceInfoHandle == nullptr, &result);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetProviderOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[1], valueTwo, length, &stResult);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);

        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, valueTwo);
        const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(valueTwo);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[1], valueTwo, length, &stResult);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);

        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, valueTwo);
        const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(valueTwo);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderThree(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[1], valueTwo, length, &stResult);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_INVALID) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle == nullptr, "Create oH_AI_DeviceInfoHandle != nullptr");
        OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, valueTwo);
        const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, providerResult == nullptr, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(valueTwo);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderFour(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[1], valueTwo, length, &stResult);

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, valueTwo);
    const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, providerResult == nullptr, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    free(valueTwo);
    return result;
}

static napi_value OHAIDeviceInfoGetProviderOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[1], valueTwo, length, &stResult);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProvider(oH_AI_DeviceInfoHandle, valueTwo);
        const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(valueTwo);
    return result;
}

static napi_value OHAIDeviceInfoGetProviderTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    const char *providerResult = OH_AI_DeviceInfoGetProvider(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, providerResult == nullptr, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderDeviceOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[1], valueTwo, length, &stResult);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProviderDevice(oH_AI_DeviceInfoHandle, valueTwo);
        const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(valueTwo);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderDeviceTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[1], valueTwo, length, &stResult);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProviderDevice(oH_AI_DeviceInfoHandle, valueTwo);
        const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(valueTwo);
    return result;
}

static napi_value OHAIDeviceInfoSetProviderDeviceThree(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[1], valueTwo, length, &stResult);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_INVALID) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle == nullptr, "Create oH_AI_DeviceInfoHandle != nullptr");
        OH_AI_DeviceInfoSetProviderDevice(oH_AI_DeviceInfoHandle, valueTwo);
        const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, providerResult == nullptr, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(valueTwo);
    return result;
}

static napi_value OHAIDeviceInfoGetProviderDeviceOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[1], valueTwo, length, &stResult);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetProviderDevice(oH_AI_DeviceInfoHandle, valueTwo);
        const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
        napi_create_string_utf8(env, providerResult, NAPI_AUTO_LENGTH, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    free(valueTwo);
    return result;
}

static napi_value OHAIDeviceInfoGetProviderDeviceTwo(napi_env env, napi_callback_info)
{

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    const char *providerResult = OH_AI_DeviceInfoGetProviderDevice(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, providerResult == nullptr, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIDeviceInfoSetEnableFP16One(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetEnableFP16(oH_AI_DeviceInfoHandle, true);
        bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, fP16Result == true, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }

    return result;
}

static napi_value OHAIDeviceInfoSetEnableFP16Two(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetEnableFP16(oH_AI_DeviceInfoHandle, false);
        bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, fP16Result == false, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }

    return result;
}

static napi_value OHAIDeviceInfoSetEnableFP16Three(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    OH_AI_DeviceInfoSetEnableFP16(oH_AI_DeviceInfoHandle, true);
    bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, fP16Result == 0, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);

    return result;
}

static napi_value OHAIDeviceInfoGetEnableFP16One(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_CPU) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetEnableFP16(oH_AI_DeviceInfoHandle, false);
        bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, fP16Result == false, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }

    return result;
}

static napi_value OHAIDeviceInfoGetEnableFP16Two(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    bool fP16Result = OH_AI_DeviceInfoGetEnableFP16(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, fP16Result == 0, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);

    return result;
}

static napi_value OHAIDeviceInfoSetDeviceIdOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    int valueTwo;
    napi_get_value_int32(env, args[1], &valueTwo);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetDeviceId(oH_AI_DeviceInfoHandle, valueTwo);
        size_t deviceId = OH_AI_DeviceInfoGetDeviceId(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceId, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetDeviceIdTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    size_t deviceId = OH_AI_DeviceInfoGetDeviceId(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, deviceId == 0, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);

    return result;
}

static napi_value OHAIDeviceInfoGetDeviceIdOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    int valueTwo;
    napi_get_value_int32(env, args[1], &valueTwo);

    napi_value result = nullptr;

    if (valueOne == OH_AI_DEVICETYPE_NNRT) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetDeviceId(oH_AI_DeviceInfoHandle, valueTwo);
        size_t deviceIdResult = OH_AI_DeviceInfoGetDeviceId(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, deviceIdResult, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetDeviceIdTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    size_t deviceId = OH_AI_DeviceInfoGetDeviceId(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, deviceId == 0, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);

    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    int valueTwo;
    napi_get_value_int32(env, args[1], &valueTwo);

    napi_value result = nullptr;

    if ((valueOne == OH_AI_DEVICETYPE_NNRT) && (valueTwo == OH_AI_PERFORMANCE_NONE)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_NONE);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    int valueTwo;
    napi_get_value_int32(env, args[1], &valueTwo);

    napi_value result = nullptr;

    if ((valueOne == OH_AI_DEVICETYPE_NNRT) && (valueTwo == OH_AI_PERFORMANCE_LOW)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_LOW);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeThree(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    int valueTwo;
    napi_get_value_int32(env, args[1], &valueTwo);

    napi_value result = nullptr;

    if ((valueOne == OH_AI_DEVICETYPE_NNRT) && (valueTwo == OH_AI_PERFORMANCE_MEDIUM)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_MEDIUM);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeFour(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    int valueTwo;
    napi_get_value_int32(env, args[1], &valueTwo);

    napi_value result = nullptr;

    if ((valueOne == OH_AI_DEVICETYPE_NNRT) && (valueTwo == OH_AI_PERFORMANCE_HIGH)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_HIGH);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoSetPerformanceModeFive(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    int valueTwo;
    napi_get_value_int32(env, args[1], &valueTwo);

    napi_value result = nullptr;

    if ((valueOne == OH_AI_DEVICETYPE_NNRT) && (valueTwo == OH_AI_PERFORMANCE_EXTREME)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_EXTREME);
        OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceMode, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetPerformanceModeOne(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    int valueTwo;
    napi_get_value_int32(env, args[1], &valueTwo);

    napi_value result = nullptr;

    if ((valueOne == OH_AI_DEVICETYPE_NNRT) && (valueTwo == OH_AI_PERFORMANCE_NONE)) {
        OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
        NAPI_ASSERT(env, oH_AI_DeviceInfoHandle != nullptr, "oH_AI_DeviceInfoHandle Create Error");
        OH_AI_DeviceInfoSetPerformanceMode(oH_AI_DeviceInfoHandle, OH_AI_PERFORMANCE_NONE);
        OH_AI_PerformanceMode performanceModeResult = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
        napi_create_int32(env, performanceModeResult, &result);
        OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    } else {
        NAPI_ASSERT(env, 0, "napi_callback_info value is Error");
    }
    return result;
}

static napi_value OHAIDeviceInfoGetPerformanceModeTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    OH_AI_PerformanceMode performanceMode = OH_AI_DeviceInfoGetPerformanceMode(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, performanceMode, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIContextSetThreadAffinityCoreListOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    constexpr size_t coreNum = 3;
    const int32_t coreList[coreNum] = {0, 1, 2};
    OH_AI_ContextSetThreadAffinityCoreList(oH_AI_ContextHandle, coreList, coreNum);
    size_t retCoreNum;
    const int32_t *threadAffinityCoreList = OH_AI_ContextGetThreadAffinityCoreList(oH_AI_ContextHandle, &retCoreNum);
    for (size_t i = 0; i < retCoreNum; i++) {
        NAPI_ASSERT(env, threadAffinityCoreList[i] == coreList[i], "threadAffinityCoreList is error");
    }
    napi_create_int32(env, 1, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetThreadAffinityCoreListOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    constexpr size_t coreNum = 5;
    const int32_t coreList[coreNum] = {1, 2, 3, 4, 5};
    OH_AI_ContextSetThreadAffinityCoreList(oH_AI_ContextHandle, coreList, coreNum);
    size_t retCoreNum;
    const int32_t *threadAffinityCoreList = OH_AI_ContextGetThreadAffinityCoreList(oH_AI_ContextHandle, &retCoreNum);
    for (size_t i = 0; i < retCoreNum; i++) {
        NAPI_ASSERT(env, threadAffinityCoreList[i] == coreList[i], "threadAffinityCoreList is error");
    }
    napi_create_int32(env, 1, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetEnableParallelOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetEnableParallel(oH_AI_ContextHandle, true);
    bool parallelResult = OH_AI_ContextGetEnableParallel(oH_AI_ContextHandle);
    napi_create_int32(env, parallelResult == true, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextSetEnableParallelTwo(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetEnableParallel(oH_AI_ContextHandle, false);
    bool parallelResult = OH_AI_ContextGetEnableParallel(oH_AI_ContextHandle);
    napi_create_int32(env, parallelResult == false, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetEnableParallelOne(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = OH_AI_ContextCreate();
    NAPI_ASSERT(env, oH_AI_ContextHandle != nullptr, "oH_AI_ContextHandle Create Error");

    napi_value result = nullptr;
    OH_AI_ContextSetEnableParallel(oH_AI_ContextHandle, true);
    bool getParallelResult = OH_AI_ContextGetEnableParallel(oH_AI_ContextHandle);
    napi_create_int32(env, getParallelResult == true, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAIContextGetEnableParallelTwo(napi_env env, napi_callback_info)
{
    OH_AI_ContextHandle oH_AI_ContextHandle = nullptr;
    napi_value result = nullptr;
    bool getParallelResult = OH_AI_ContextGetEnableParallel(oH_AI_ContextHandle);
    napi_create_int32(env, getParallelResult == 0, &result);
    OH_AI_ContextDestroy(&oH_AI_ContextHandle);
    return result;
}

static napi_value OHAISetFrequencyOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_KIRIN_NPU);
    OH_AI_DeviceInfoSetFrequency(oH_AI_DeviceInfoHandle, valueOne);
    int frequency = OH_AI_DeviceInfoGetFrequency(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, frequency, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIGetFrequencyOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);

    napi_value result = nullptr;

    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_KIRIN_NPU);
    OH_AI_DeviceInfoSetFrequency(oH_AI_DeviceInfoHandle, valueOne);
    int frequency = OH_AI_DeviceInfoGetFrequency(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, frequency, &result);
    OH_AI_DeviceInfoDestroy(&oH_AI_DeviceInfoHandle);
    return result;
}

static napi_value OHAIModelCreateOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    napi_create_int32(env, model != nullptr, &result);
    OH_AI_ModelDestroy(&model);
    return result;
}

static napi_value OHAIModelDestroyOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();

    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextDestroy(&model);
    napi_create_int32(env, model == nullptr, &result);

    return result;
}

static napi_value OHAITensorCreateOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    napi_create_int32(env, tensor != nullptr, &result);
    return result;
}

static napi_value OHAITensorDestroyOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorDestroy(&tensor);
    napi_create_int32(env, tensor == nullptr, &result);
    return result;
}

static napi_value OHAITensorCloneOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    size_t len = 1 * 48 * 48 * 3 * sizeof(float);
    size_t valueOne[len];
    OH_AI_TensorHandle tensor = OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape,
                                                   createShapeNum, (void *)valueOne, len);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorHandle clone = OH_AI_TensorClone(tensor);
    napi_create_int32(env, clone != nullptr, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetNameOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64, stResult = 0;
    char *valueTwo = (char *)malloc(sizeof(char) * length);
    NAPI_ASSERT(env, valueTwo != nullptr, "malloc result is nullptr");
    napi_get_value_string_utf8(env, args[0], valueTwo, length, &stResult);
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetName(tensor, valueTwo);
    const char *tensorName = OH_AI_TensorGetName(tensor);
    napi_create_string_utf8(env, tensorName, NAPI_AUTO_LENGTH, &result);
    OH_AI_TensorDestroy(&tensor);
    free(valueTwo);
    return result;
}

static napi_value OHAITensorGetNameOne(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64, stResult = 0;
    char *getValue = (char *)malloc(sizeof(char) * length);
    napi_get_value_string_utf8(env, args[0], getValue, length, &stResult);
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetName(tensor, getValue);
    const char *getTensorName = OH_AI_TensorGetName(tensor);
    napi_create_string_utf8(env, getTensorName, NAPI_AUTO_LENGTH, &result);
    OH_AI_TensorDestroy(&tensor);
    free(getValue);
    return result;
}

static napi_value OHAITensorSetDataTypeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT16);
    OH_AI_DataType data_type = OH_AI_TensorGetDataType(tensor);
    napi_create_int32(env, data_type == OH_AI_DATATYPE_NUMBERTYPE_FLOAT16, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetDataTypeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetDataType(tensor, OH_AI_DATATYPE_NUMBERTYPE_FLOAT64);
    OH_AI_DataType get_data_type = OH_AI_TensorGetDataType(tensor);
    napi_create_int32(env, get_data_type == OH_AI_DATATYPE_NUMBERTYPE_FLOAT64, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetShapeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    constexpr size_t newShapeNum = 4;
    int64_t newShape[newShapeNum] = {1, 32, 32, 1};
    OH_AI_TensorSetShape(tensor, newShape, newShapeNum);
    size_t newRetShapeNum;
    const int64_t *newRetShape = OH_AI_TensorGetShape(tensor, &newRetShapeNum);
    for (size_t i = 0; i < newRetShapeNum; i++) {
        NAPI_ASSERT(env, newRetShape[i] == newShape[i], "tensor shape compare error");
    }
    napi_create_int32(env, newRetShapeNum == newShapeNum, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetShapeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    constexpr size_t newShapeNum = 6;
    int64_t newShape[newShapeNum] = {16, 32, 64, 64, 32, 16};
    OH_AI_TensorSetShape(tensor, newShape, newShapeNum);
    size_t newRetShapeNum;
    const int64_t *newRetShape = OH_AI_TensorGetShape(tensor, &newRetShapeNum);
    for (size_t i = 0; i < newRetShapeNum; i++) {
        NAPI_ASSERT(env, newRetShape[i] == newShape[i], "tensor shape compare error");
    }
    napi_create_int32(env, newRetShapeNum == newShapeNum, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetFormatOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_NHWC);
    OH_AI_Format data_format = OH_AI_TensorGetFormat(tensor);
    napi_create_int32(env, data_format == OH_AI_FORMAT_NHWC, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetFormatOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetFormat(tensor, OH_AI_FORMAT_HWKC);
    OH_AI_Format get_data_format = OH_AI_TensorGetFormat(tensor);
    napi_create_int32(env, get_data_format == OH_AI_FORMAT_HWKC, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetDataOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    constexpr size_t dataLen = 6;
    float data[dataLen] = {1, 2, 3, 4, 5, 6};
    OH_AI_TensorSetData(tensor, data);
    const float *retData = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    for (size_t i = 0; i < dataLen; i++) {
        NAPI_ASSERT(env, retData[i] == data[i], "tensor data Error");
    }
    napi_create_int32(env, 1, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetDataOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    constexpr size_t dataLen = 4;
    float data[dataLen] = {1, 2, 3, 4};
    OH_AI_TensorSetData(tensor, data);
    const float *getRetData = static_cast<const float *>(OH_AI_TensorGetData(tensor));
    for (size_t i = 0; i < dataLen; i++) {
        NAPI_ASSERT(env, getRetData[i] == data[i], "tensor data Error");
    }
    napi_create_int32(env, 1, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetMutableDataOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    float *inputData = reinterpret_cast<float *>(OH_AI_TensorGetMutableData(tensor));
    napi_create_int32(env, inputData != nullptr, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetElementNumOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    int64_t elementNum = OH_AI_TensorGetElementNum(tensor);
    napi_create_int32(env, elementNum != 0, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetDataSizeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;

    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    size_t dataSize = OH_AI_TensorGetDataSize(tensor);
    napi_create_int32(env, dataSize != 0, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAIGetAllNNRTDeviceDescsOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    size_t num = 0;
    auto descs = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (descs == nullptr) {
        napi_create_int32(env, descs == nullptr, &result);
        return result;
    }
    napi_create_int32(env, descs != nullptr, &result);
    return result;
}

static napi_value OHAIDestroyAllNNRTDeviceDescsOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        napi_create_int32(env, desc == nullptr, &result);
        return result;
    }
    NAPI_ASSERT(env, desc != nullptr, "desc Create Error");
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    napi_create_int32(env, desc == nullptr, &result);
    return result;
}

static napi_value OHAIGetDeviceIdFromNNRTDeviceDescOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        napi_create_int32(env, desc == nullptr, &result);
        return result;
    }
    NAPI_ASSERT(env, desc != nullptr, "desc Create Error");
    auto id = OH_AI_GetDeviceIdFromNNRTDeviceDesc(desc);
    napi_create_int32(env, id != 0, &result);
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    return result;
}

static napi_value OHAIGetNameFromNNRTDeviceDescOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        napi_create_int32(env, desc == nullptr, &result);
        return result;
    }
    NAPI_ASSERT(env, desc != nullptr, "desc Create Error");
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
    napi_create_int32(env, name != nullptr, &result);
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    return result;
}

static napi_value OHAIGetTypeFromNNRTDeviceDescOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    size_t num = 0;
    int mix = 3;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        napi_create_int32(env, desc == nullptr, &result);
        return result;
    }
    NAPI_ASSERT(env, desc != nullptr, "desc Create Error");
    auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
    napi_create_int32(env, ((0 <= type) && (type <= mix)), &result);
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    return result;
}

static napi_value OHAICreateNNRTDeviceInfoByNameOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        napi_create_int32(env, desc == nullptr, &result);
        return result;
    }
    NAPI_ASSERT(env, desc != nullptr, "desc Create Error");
    auto name = OH_AI_GetNameFromNNRTDeviceDesc(desc);
    NAPI_ASSERT(env, name != nullptr, "name Create Error");
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByName(name);
    napi_create_int32(env, nnrt_device_info != nullptr, &result);
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    return result;
}

static napi_value OHAICreateNNRTDeviceInfoByTypeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    size_t num = 0;
    int mix = 3;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        napi_create_int32(env, desc == nullptr, &result);
        return result;
    }
    NAPI_ASSERT(env, desc != nullptr, "desc Create Error");
    auto type = OH_AI_GetTypeFromNNRTDeviceDesc(desc);
    NAPI_ASSERT(env, ((0 <= type) && (type <= mix)), "type Create Error");
    auto nnrt_device_info = OH_AI_CreateNNRTDeviceInfoByType(type);
    napi_create_int32(env, nnrt_device_info != nullptr, &result);
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    return result;
}

static napi_value OHAIDeviceInfoSetPriorityOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    NAPI_ASSERT(env, nnrt_device_info != nullptr, "nnrt_device_info Create Error");
    errno = 0;
    OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
    napi_create_int32(env, errno == 0, &result);
    OH_AI_DeviceInfoDestroy(&nnrt_device_info);
    return result;
}

static napi_value OHAIGetElementOfNNRTDeviceDescsOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    size_t num = 0;
    auto desc = OH_AI_GetAllNNRTDeviceDescs(&num);
    if (desc == nullptr) {
        napi_create_int32(env, desc == nullptr, &result);
        return result;
    }
    NAPI_ASSERT(env, desc != nullptr, "desc Create Error");
    for (size_t i = 0; i < num; i++) {
        auto getDesc = OH_AI_GetElementOfNNRTDeviceDescs(desc, i);
        NAPI_ASSERT(env, getDesc != nullptr, "desc Create Error");
    }
    napi_create_int32(env, 1, &result);
    OH_AI_DestroyAllNNRTDeviceDescs(&desc);
    return result;
}

static napi_value OHAIDeviceInfoAddExtensionOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    const char *cachePath = "/data/local/tmp/";
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    errno = 0;
    size_t sizeValue = sizeof(*cachePath);
    OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cachePath, sizeValue);
    napi_create_int32(env, errno == 0, &result);
    return result;
}

static napi_value OHAIContextAddDeviceInfoOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle npu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_KIRIN_NPU);
    NAPI_ASSERT(env, npu_device_info != nullptr, "npu_device_info Create Error");
    errno = 0;
    OH_AI_ContextAddDeviceInfo(context, npu_device_info);
    napi_create_int32(env, errno == 0, &result);
    return result;
}

static napi_value OHAIModelBuildFromFileOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                OH_AI_MODELTYPE_MINDIR, context);
    napi_create_int32(env, ret == OH_AI_STATUS_SUCCESS, &result);
    return result;
}

static napi_value OHAIModelResizeOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                OH_AI_MODELTYPE_MINDIR, context);
    NAPI_ASSERT(env, ret == 0, "ret STATUS Error");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    NAPI_ASSERT(env, inputs.handle_list != nullptr, "inputs Create Error");
    OH_AI_ShapeInfo shape_infos = {};
    OH_AI_Status resize_ret = OH_AI_ModelResize(model, inputs, &shape_infos, inputs.handle_num);

    napi_create_int32(env, resize_ret == OH_AI_STATUS_LITE_ERROR, &result);
    return result;
}

static napi_value OHAIModelPredictOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                OH_AI_MODELTYPE_MINDIR, context);
    NAPI_ASSERT(env, ret == OH_AI_STATUS_SUCCESS, "ret STATUS Error");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    NAPI_ASSERT(env, inputs.handle_list != nullptr, "inputs Create Error");
    GenerateInputDataWithRandom(inputs);
    auto output = OH_AI_ModelGetOutputs(model);
    OH_AI_Status retData = OH_AI_ModelPredict(model, inputs, &output, nullptr, nullptr);
    napi_create_int32(env, retData == OH_AI_STATUS_SUCCESS, &result);
    return result;
}

static napi_value OHAIModelGetInputsOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                OH_AI_MODELTYPE_MINDIR, context);
    NAPI_ASSERT(env, ret == OH_AI_STATUS_SUCCESS, "ret STATUS Error");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    napi_create_int32(env, inputs.handle_list != nullptr, &result);
    return result;
}

static napi_value OHAIModelGetOutputsOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                OH_AI_MODELTYPE_MINDIR, context);
    NAPI_ASSERT(env, ret == OH_AI_STATUS_SUCCESS, "ret STATUS Error");
    OH_AI_TensorHandleArray outputs = OH_AI_ModelGetOutputs(model);
    napi_create_int32(env, outputs.handle_list != nullptr, &result);
    return result;
}

static napi_value OHAIModelGetInputByTensorNameOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                OH_AI_MODELTYPE_MINDIR, context);
    NAPI_ASSERT(env, ret == OH_AI_STATUS_SUCCESS, "ret STATUS Error");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetOutputByTensorName(model, "prob");
    napi_create_int32(env, tensor != nullptr, &result);
    return result;
}

static napi_value OHAIModelGetOutputByTensorNameOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                OH_AI_MODELTYPE_MINDIR, context);
    NAPI_ASSERT(env, ret == OH_AI_STATUS_SUCCESS, "ret STATUS Error");
    OH_AI_TensorHandle tensor = OH_AI_ModelGetInputByTensorName(model, "data");
    napi_create_int32(env, tensor != nullptr, &result);
    return result;
}

char *ReadFile(const char *file, size_t *size)
{
    printf("[common.cpp] Loading data from: %s\n", file);

    std::ifstream ifs(file);
    if (!ifs.good()) {
        return nullptr;
    }

    if (!ifs.is_open()) {
        ifs.close();
        return nullptr;
    }

    ifs.seekg(0, std::ios::end);
    *size = ifs.tellg();

    char *buf = new char[*size];
    if (buf == nullptr) {
        ifs.close();
        return nullptr;
    }

    ifs.seekg(0, std::ios::beg);
    ifs.read(buf, *size);
    ifs.close();

    return buf;
}
static napi_value OHAITensorSetUserDataOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    OH_AI_Status ret = OH_AI_ModelBuildFromFile(model, "/data/storage/el2/base/files/ml_face_isface.ms",
                                                OH_AI_MODELTYPE_MINDIR, context);

    NAPI_ASSERT(env, ret == OH_AI_STATUS_SUCCESS, "ret STATUS Error");
    OH_AI_TensorHandleArray inputs = OH_AI_ModelGetInputs(model);
    NAPI_ASSERT(env, inputs.handle_list != nullptr, "inputs Create Error");
    for (size_t i = 0; i < inputs.handle_num; ++i) {
        size_t size1;
        size_t *ptr_size1 = &size1;
        const char *imagePath = "/data/storage/el2/base/files/ml_face_isface.input";
        char *imageBuf = ReadFile(imagePath, ptr_size1);
        OH_AI_TensorHandle tensor = inputs.handle_list[i];
        size_t data_size = OH_AI_TensorGetDataSize(tensor);
        auto userData = OH_AI_TensorSetUserData(tensor, imageBuf, data_size);
        if (userData == OH_AI_STATUS_SUCCESS) {
            napi_create_int32(env, true, &result);
            break;
        }
    }
    return result;
}

static napi_value OHAIDeviceInfoCreateTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_INVALID);
    napi_create_int32(env, oH_AI_DeviceInfoHandle == nullptr, &result);
    return result;
}

static napi_value OHAIContextSetThreadAffinityCoreListTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t coreNum = 3;
    const int32_t coreList[coreNum] = {0, 1, 2};
    OH_AI_ContextSetThreadAffinityCoreList(nullptr, coreList, coreNum);
    size_t retCoreNum;
    const int32_t *threadAffinityCoreList = OH_AI_ContextGetThreadAffinityCoreList(nullptr, &retCoreNum);
    napi_create_int32(env, threadAffinityCoreList == nullptr, &result);
    return result;
}

static napi_value OHAIContextGetThreadAffinityCoreListTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t coreNum = 5;
    const int32_t coreList[coreNum] = {1, 2, 3, 4, 5};
    OH_AI_ContextSetThreadAffinityCoreList(nullptr, coreList, coreNum);
    size_t retCoreNum;
    const int32_t *threadAffinityCoreList = OH_AI_ContextGetThreadAffinityCoreList(nullptr, &retCoreNum);
    napi_create_int32(env, threadAffinityCoreList == nullptr, &result);
    return result;
}

static napi_value OHAISetFrequencyTwo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueOne;
    napi_get_value_int32(env, args[0], &valueOne);
    napi_value result = nullptr;
    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    OH_AI_DeviceInfoSetFrequency(oH_AI_DeviceInfoHandle, valueOne);
    int frequency = OH_AI_DeviceInfoGetFrequency(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, frequency, &result);
    return result;
}

static napi_value OHAIGetFrequencyTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_DeviceInfoHandle oH_AI_DeviceInfoHandle = nullptr;
    int frequency = OH_AI_DeviceInfoGetFrequency(oH_AI_DeviceInfoHandle);
    napi_create_int32(env, frequency, &result);
    return result;
}

static napi_value OHAITensorCreateTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor = nullptr;
    OH_AI_TensorCreate(nullptr, OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    napi_create_int32(env, tensor != nullptr, &result);
    return result;
}

static napi_value OHAITensorSetNameTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetName(tensor, nullptr);
    const char *tensorName = OH_AI_TensorGetName(tensor);
    napi_create_int32(env, tensorName == nullptr, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetNameTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetName(tensor, nullptr);
    const char *getTensorName = OH_AI_TensorGetName(tensor);
    napi_create_int32(env, getTensorName == nullptr, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetDataTypeTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetDataType(tensor, OH_AI_DataTypeInvalid);
    OH_AI_DataType data_type = OH_AI_TensorGetDataType(tensor);
    napi_create_int32(env, data_type == OH_AI_DataTypeInvalid, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetDataTypeTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetDataType(tensor, OH_AI_DataTypeInvalid);
    OH_AI_DataType get_data_type = OH_AI_TensorGetDataType(tensor);
    napi_create_int32(env, get_data_type == OH_AI_DataTypeInvalid, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorSetShapeTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t newShapeNum = 4;
    int64_t newShape[newShapeNum] = {1, 32, 32, 1};
    OH_AI_TensorSetShape(nullptr, newShape, newShapeNum);
    size_t newRetShapeNum;
    const int64_t *newRetShape = OH_AI_TensorGetShape(nullptr, &newRetShapeNum);
    napi_create_int32(env, newRetShape == nullptr, &result);
    return result;
}

static napi_value OHAITensorGetShapeTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t newShapeNum = 6;
    int64_t newShape[newShapeNum] = {16, 32, 64, 64, 32, 16};
    OH_AI_TensorSetShape(nullptr, newShape, newShapeNum);
    size_t newRetShapeNum;
    const int64_t *newRetShape = OH_AI_TensorGetShape(nullptr, &newRetShapeNum);
    napi_create_int32(env, newRetShape == nullptr, &result);
    return result;
}

static napi_value OHAITensorSetFormatTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_TensorSetFormat(nullptr, OH_AI_FORMAT_HWKC);
    OH_AI_Format data_format = OH_AI_TensorGetFormat(nullptr);
    napi_create_int32(env, data_format == 0, &result);
    return result;
}

static napi_value OHAITensorGetFormatTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_TensorSetFormat(nullptr, OH_AI_FORMAT_HWKC);
    OH_AI_Format get_data_format = OH_AI_TensorGetFormat(nullptr);
    napi_create_int32(env, get_data_format == 0, &result);
    return result;
}

static napi_value OHAITensorSetDataTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetData(tensor, nullptr);
    const void *retData = OH_AI_TensorGetData(tensor);
    napi_create_int32(env, retData == nullptr, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetDataTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    constexpr size_t createShapeNum = 4;
    int64_t createShape[createShapeNum] = {1, 48, 48, 3};
    OH_AI_TensorHandle tensor =
        OH_AI_TensorCreate("data", OH_AI_DATATYPE_NUMBERTYPE_FLOAT32, createShape, createShapeNum, nullptr, 0);
    NAPI_ASSERT(env, tensor != nullptr, "tensor Create Error");
    OH_AI_TensorSetData(tensor, nullptr);
    const void *getRetData = OH_AI_TensorGetData(tensor);
    napi_create_int32(env, getRetData == nullptr, &result);
    OH_AI_TensorDestroy(&tensor);
    return result;
}

static napi_value OHAITensorGetMutableDataTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    void *inputData = OH_AI_TensorGetMutableData(nullptr);
    napi_create_int32(env, inputData == nullptr, &result);
    return result;
}

static napi_value OHAITensorGetElementNumTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    int64_t elementNum = OH_AI_TensorGetElementNum(nullptr);
    napi_create_int32(env, elementNum == 0, &result);
    return result;
}

static napi_value OHAITensorGetDataSizeTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    size_t dataSize = OH_AI_TensorGetDataSize(nullptr);
    napi_create_int32(env, dataSize == 0, &result);
    return result;
}

static napi_value OHAIDeviceInfoSetPriorityTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    NAPI_ASSERT(env, nnrt_device_info != nullptr, "nnrt_device_info Create Error");
    try {
        OH_AI_DeviceInfoSetPriority(nnrt_device_info, OH_AI_PRIORITY_MEDIUM);
        napi_create_int32(env, SUCCESS, &result);
    } catch (std::exception& e) {
        napi_create_int32(env, FAIL, &result);
    }
    OH_AI_DeviceInfoDestroy(&nnrt_device_info);
    return result;
}

static napi_value OHAITensorCloneTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_TensorHandle clone = OH_AI_TensorClone(nullptr);
    napi_create_int32(env, clone == nullptr, &result);
    return result;
}

static napi_value OHAIDeviceInfoAddExtensionTwo(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    const char *cachePath = "/data/local/tmp/";
    size_t sizeValue = sizeof(*cachePath);
    OH_AI_Status result_ai_status = OH_AI_DeviceInfoAddExtension(nullptr, "CachePath", cachePath, sizeValue);
    napi_create_int32(env, result_ai_status == OH_AI_STATUS_LITE_NULLPTR, &result);
    return result;
}

static napi_value OHAIDeviceInfoAddExtensionThree(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    const char *cachePath = "/data/local/tmp/";
    OH_AI_DeviceInfoHandle nnrt_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_NNRT);
    size_t sizeValue = sizeof(*cachePath);
    OH_AI_Status result_ai_status =
        OH_AI_DeviceInfoAddExtension(nnrt_device_info, "CachePath", cachePath, sizeValue + 1);
    napi_create_int32(env, result_ai_status == OH_AI_STATUS_SUCCESS, &result);
    return result;
}

static napi_value OHAIModelBuildOne(napi_env env, napi_callback_info)
{
    napi_value result = nullptr;
    OH_AI_ModelHandle model = OH_AI_ModelCreate();
    NAPI_ASSERT(env, model != nullptr, "model Create Error");
    OH_AI_ContextHandle context = OH_AI_ContextCreate();
    NAPI_ASSERT(env, context != nullptr, "context Create Error");
    OH_AI_DeviceInfoHandle cpu_device_info = OH_AI_DeviceInfoCreate(OH_AI_DEVICETYPE_CPU);
    OH_AI_ContextAddDeviceInfo(context, cpu_device_info);
    size_t size1;
    size_t *ptr_size1 = &size1;
    const char *imagePath = "/data/storage/el2/base/files/ml_face_isface.ms";
    char *imageBuf = ReadFile(imagePath, ptr_size1);
    OH_AI_Status userData = OH_AI_ModelBuild(model, imageBuf, size1, OH_AI_MODELTYPE_MINDIR, context);
    napi_create_int32(env, userData == OH_AI_STATUS_SUCCESS, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHAIContextCreateOne", nullptr, OHAIContextCreateOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIContextDestroyOne", nullptr, OHAIContextDestroyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIContextSetThreadNumOne", nullptr, OHAIContextSetThreadNumOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextSetThreadNumTwo", nullptr, OHAIContextSetThreadNumTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextGetThreadNumOne", nullptr, OHAIContextGetThreadNumOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextGetThreadNumTwo", nullptr, OHAIContextGetThreadNumTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIContextSetThreadAffinityModeOne", nullptr, OHAIContextSetThreadAffinityModeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetThreadAffinityModeTwo", nullptr, OHAIContextSetThreadAffinityModeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetThreadAffinityModeOne", nullptr, OHAIContextGetThreadAffinityModeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetThreadAffinityModeTwo", nullptr, OHAIContextGetThreadAffinityModeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoCreateOne", nullptr, OHAIDeviceInfoCreateOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoGetDeviceTypeOne", nullptr, OHAIDeviceInfoGetDeviceTypeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetDeviceTypeTwo", nullptr, OHAIDeviceInfoGetDeviceTypeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetDeviceTypeThree", nullptr, OHAIDeviceInfoGetDeviceTypeThree, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetDeviceTypeFour", nullptr, OHAIDeviceInfoGetDeviceTypeFour, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoDestroyOne", nullptr, OHAIDeviceInfoDestroyOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetProviderOne", nullptr, OHAIDeviceInfoSetProviderOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetProviderTwo", nullptr, OHAIDeviceInfoSetProviderTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetProviderThree", nullptr, OHAIDeviceInfoSetProviderThree, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetProviderFour", nullptr, OHAIDeviceInfoSetProviderFour, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetProviderOne", nullptr, OHAIDeviceInfoGetProviderOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoGetProviderTwo", nullptr, OHAIDeviceInfoGetProviderTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetProviderDeviceOne", nullptr, OHAIDeviceInfoSetProviderDeviceOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetProviderDeviceTwo", nullptr, OHAIDeviceInfoSetProviderDeviceTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetProviderDeviceThree", nullptr, OHAIDeviceInfoSetProviderDeviceThree, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoGetProviderDeviceOne", nullptr, OHAIDeviceInfoGetProviderDeviceOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetProviderDeviceTwo", nullptr, OHAIDeviceInfoGetProviderDeviceTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetEnableFP16One", nullptr, OHAIDeviceInfoSetEnableFP16One, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetEnableFP16Two", nullptr, OHAIDeviceInfoSetEnableFP16Two, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetEnableFP16Three", nullptr, OHAIDeviceInfoSetEnableFP16Three, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetEnableFP16One", nullptr, OHAIDeviceInfoGetEnableFP16One, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetEnableFP16Two", nullptr, OHAIDeviceInfoGetEnableFP16Two, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetDeviceIdOne", nullptr, OHAIDeviceInfoSetDeviceIdOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetDeviceIdTwo", nullptr, OHAIDeviceInfoSetDeviceIdTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoGetDeviceIdOne", nullptr, OHAIDeviceInfoGetDeviceIdOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoGetDeviceIdTwo", nullptr, OHAIDeviceInfoGetDeviceIdTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetPerformanceModeOne", nullptr, OHAIDeviceInfoSetPerformanceModeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetPerformanceModeTwo", nullptr, OHAIDeviceInfoSetPerformanceModeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetPerformanceModeThree", nullptr, OHAIDeviceInfoSetPerformanceModeThree, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoSetPerformanceModeFour", nullptr, OHAIDeviceInfoSetPerformanceModeFour, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoSetPerformanceModeFive", nullptr, OHAIDeviceInfoSetPerformanceModeFive, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoGetPerformanceModeOne", nullptr, OHAIDeviceInfoGetPerformanceModeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoGetPerformanceModeTwo", nullptr, OHAIDeviceInfoGetPerformanceModeTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetThreadAffinityCoreListOne", nullptr, OHAIContextSetThreadAffinityCoreListOne, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIContextGetThreadAffinityCoreListOne", nullptr, OHAIContextGetThreadAffinityCoreListOne, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIContextSetEnableParallelOne", nullptr, OHAIContextSetEnableParallelOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextSetEnableParallelTwo", nullptr, OHAIContextSetEnableParallelTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetEnableParallelOne", nullptr, OHAIContextGetEnableParallelOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextGetEnableParallelTwo", nullptr, OHAIContextGetEnableParallelTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAISetFrequencyOne", nullptr, OHAISetFrequencyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIGetFrequencyOne", nullptr, OHAIGetFrequencyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIModelCreateOne", nullptr, OHAIModelCreateOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIModelDestroyOne", nullptr, OHAIModelDestroyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorCreateOne", nullptr, OHAITensorCreateOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorDestroyOne", nullptr, OHAITensorDestroyOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorCloneOne", nullptr, OHAITensorCloneOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetNameOne", nullptr, OHAITensorSetNameOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetNameOne", nullptr, OHAITensorGetNameOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetDataTypeOne", nullptr, OHAITensorSetDataTypeOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorGetDataTypeOne", nullptr, OHAITensorGetDataTypeOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorSetShapeOne", nullptr, OHAITensorSetShapeOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetShapeOne", nullptr, OHAITensorGetShapeOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetFormatOne", nullptr, OHAITensorSetFormatOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetFormatOne", nullptr, OHAITensorGetFormatOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetDataOne", nullptr, OHAITensorSetDataOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetDataOne", nullptr, OHAITensorGetDataOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetMutableDataOne", nullptr, OHAITensorGetMutableDataOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorGetElementNumOne", nullptr, OHAITensorGetElementNumOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorGetDataSizeOne", nullptr, OHAITensorGetDataSizeOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIGetAllNNRTDeviceDescsOne", nullptr, OHAIGetAllNNRTDeviceDescsOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDestroyAllNNRTDeviceDescsOne", nullptr, OHAIDestroyAllNNRTDeviceDescsOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIGetDeviceIdFromNNRTDeviceDescOne", nullptr, OHAIGetDeviceIdFromNNRTDeviceDescOne, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIGetNameFromNNRTDeviceDescOne", nullptr, OHAIGetNameFromNNRTDeviceDescOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIGetTypeFromNNRTDeviceDescOne", nullptr, OHAIGetTypeFromNNRTDeviceDescOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAICreateNNRTDeviceInfoByNameOne", nullptr, OHAICreateNNRTDeviceInfoByNameOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAICreateNNRTDeviceInfoByTypeOne", nullptr, OHAICreateNNRTDeviceInfoByTypeOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoSetPriorityOne", nullptr, OHAIDeviceInfoSetPriorityOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIGetElementOfNNRTDeviceDescsOne", nullptr, OHAIGetElementOfNNRTDeviceDescsOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoAddExtensionOne", nullptr, OHAIDeviceInfoAddExtensionOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIContextAddDeviceInfoOne", nullptr, OHAIContextAddDeviceInfoOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIModelBuildFromFileOne", nullptr, OHAIModelBuildFromFileOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIModelResizeOne", nullptr, OHAIModelResizeOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIModelPredictOne", nullptr, OHAIModelPredictOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIModelGetInputsOne", nullptr, OHAIModelGetInputsOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIModelGetOutputsOne", nullptr, OHAIModelGetOutputsOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIModelGetInputByTensorNameOne", nullptr, OHAIModelGetInputByTensorNameOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIModelGetOutputByTensorNameOne", nullptr, OHAIModelGetOutputByTensorNameOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAITensorSetUserDataOne", nullptr, OHAITensorSetUserDataOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoCreateTwo", nullptr, OHAIDeviceInfoCreateTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIContextSetThreadAffinityCoreListTwo", nullptr, OHAIContextSetThreadAffinityCoreListTwo, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAIContextGetThreadAffinityCoreListTwo", nullptr, OHAIContextGetThreadAffinityCoreListTwo, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHAISetFrequencyTwo", nullptr, OHAISetFrequencyTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIGetFrequencyTwo", nullptr, OHAIGetFrequencyTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorCreateTwo", nullptr, OHAITensorCreateTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetNameTwo", nullptr, OHAITensorSetNameTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetNameTwo", nullptr, OHAITensorGetNameTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetDataTypeTwo", nullptr, OHAITensorSetDataTypeTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorGetDataTypeTwo", nullptr, OHAITensorGetDataTypeTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorSetShapeTwo", nullptr, OHAITensorSetShapeTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetShapeTwo", nullptr, OHAITensorGetShapeTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetFormatTwo", nullptr, OHAITensorSetFormatTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetFormatTwo", nullptr, OHAITensorGetFormatTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorSetDataTwo", nullptr, OHAITensorSetDataTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetDataTwo", nullptr, OHAITensorGetDataTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAITensorGetMutableDataTwo", nullptr, OHAITensorGetMutableDataTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorGetElementNumTwo", nullptr, OHAITensorGetElementNumTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorGetDataSizeTwo", nullptr, OHAITensorGetDataSizeTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAIDeviceInfoSetPriorityTwo", nullptr, OHAIDeviceInfoSetPriorityTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHAITensorCloneTwo", nullptr, OHAITensorCloneTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHAIDeviceInfoAddExtensionTwo", nullptr, OHAIDeviceInfoAddExtensionTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIDeviceInfoAddExtensionThree", nullptr, OHAIDeviceInfoAddExtensionThree, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHAIModelBuildOne", nullptr, OHAIModelBuildOne, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libmindspore",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
