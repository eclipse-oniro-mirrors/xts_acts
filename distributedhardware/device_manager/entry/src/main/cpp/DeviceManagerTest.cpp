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
#include <cstdlib>
#include <distributedhardware/device_manager/oh_device_manager.h>
#include <distributedhardware/device_manager/oh_device_manager_err_code.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>

const int32_t CONFIRM_RESULT_ONE = 1;
const int32_t CONFIRM_RESULT_TOW = 2;

static napi_value GetLocalDeviceNameErrorCodeOK(napi_env env, napi_callback_info info)
{
    char *localDeviceName = nullptr;
    unsigned int len = 256;
    int32_t result = OH_DeviceManager_GetLocalDeviceName(&localDeviceName, len);
    if (result == ERR_OK && localDeviceName != nullptr) {
        delete [] localDeviceName;
        localDeviceName = nullptr; // 释放内存
    }
    napi_value retValue;
    int32_t confirmResult;
    if (result == DM_ERR_FAILED || result == DM_ERR_OBTAIN_SERVICE || result == DM_ERR_OBTAIN_BUNDLE_NAME
        || result == ERR_PERMISSION_ERROR || result == ERR_INVALID_PARAMETER) {
        confirmResult = CONFIRM_RESULT_ONE;
    } else if (result == ERR_OK) {
        confirmResult = ERR_OK;
    } else {
        confirmResult = CONFIRM_RESULT_TOW;
    }
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}

static napi_value FisrtGetLocalDeviceNameErrorCode401(napi_env env, napi_callback_info info)
{
    char *localDeviceName = nullptr;
    unsigned int len = 256;
    int32_t result = OH_DeviceManager_GetLocalDeviceName(nullptr, len);
    if (result == ERR_OK && localDeviceName != nullptr) {
        delete [] localDeviceName;
        localDeviceName = nullptr; // 释放内存
    }
    napi_value retValue;
    int32_t confirmResult = ERR_OK;
    if (result == ERR_INVALID_PARAMETER) {
        confirmResult = ERR_OK;
    } else {
        confirmResult = CONFIRM_RESULT_ONE;
    }
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}

static napi_value SecondGetLocalDeviceNameErrorCode401(napi_env env, napi_callback_info info)
{
    char arr[] = "Hello, World!";
    char *localDeviceName = arr;
    unsigned int len = 256;
    int32_t result = OH_DeviceManager_GetLocalDeviceName(&localDeviceName, len);
    if (result == ERR_OK && localDeviceName != nullptr) {
        delete [] localDeviceName;
        localDeviceName = nullptr; // 释放内存
    }
    napi_value retValue;
    int32_t confirmResult = ERR_OK;
    if (result == ERR_INVALID_PARAMETER) {
        confirmResult = ERR_OK;
    } else {
        confirmResult = CONFIRM_RESULT_ONE;
    }
    napi_create_int32(env, confirmResult, &retValue);
    return retValue;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetLocalDeviceNameErrorCodeOK", nullptr, GetLocalDeviceNameErrorCodeOK, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"FisrtGetLocalDeviceNameErrorCode401", nullptr, FisrtGetLocalDeviceNameErrorCode401, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"SecondGetLocalDeviceNameErrorCode401", nullptr, SecondGetLocalDeviceNameErrorCode401, nullptr, nullptr,
         nullptr, napi_default, nullptr},
    };

    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {.nm_version = 1,
                                 .nm_flags = 0,
                                 .nm_filename = nullptr,
                                 .nm_register_func = Init,
                                 .nm_modname = "actsdevicemanagerndk",
                                 .nm_priv = ((void *)0),
                                 .reserved = {0}};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
