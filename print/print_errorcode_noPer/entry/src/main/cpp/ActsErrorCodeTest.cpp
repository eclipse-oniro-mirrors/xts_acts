/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <BasicServicesKit/ohprint.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <string>
#define SCANNER_ID "12"
#define TEST_PRINTER "testPrinter"

static napi_value OH_Print_Init1(napi_env env, napi_callback_info info)
{
    Print_ErrorCode errorCode = OH_Print_Init();
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_NO_PERMISSION ? PRINT_ERROR_NO_PERMISSION : 0, &result);
    return result;
}
static napi_value OH_Print_StartPrinterDiscovery1(napi_env env, napi_callback_info info)
{
    Print_PrinterDiscoveryCallback callback;
    Print_ErrorCode errorCode = OH_Print_StartPrinterDiscovery(callback);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_NO_PERMISSION ? PRINT_ERROR_NO_PERMISSION : 0, &result);
    return result;
}
static napi_value OH_Print_ConnectPrinter1(napi_env env, napi_callback_info info)
{
    std::string printerId = "001";
    Print_ErrorCode errorCode = OH_Print_ConnectPrinter(printerId.c_str());
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_NO_PERMISSION ? PRINT_ERROR_NO_PERMISSION : 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Print_Init1", nullptr, OH_Print_Init1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Print_StartPrinterDiscovery1", nullptr, OH_Print_StartPrinterDiscovery1, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Print_ConnectPrinter1", nullptr, OH_Print_ConnectPrinter1, nullptr, nullptr, nullptr, napi_default,
         nullptr},
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
    .nm_modname = "printerrorcode",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
