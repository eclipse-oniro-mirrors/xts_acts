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

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <BasicServicesKit/ohprint.h>
#define TEST_PRINTER "testPrinter"
namespace {
    static const uint32_t MAX_NAME_LENGTH = 1024;
}
static void PrinterChangeCallback(Print_PrinterEvent event, const Print_PrinterInfo *printerInfo)
{
}
static constexpr size_t ARG_SIZE_ONE = 1;
static constexpr int32_t ERROR_COMMON = -1;

static napi_value OHPrintNoError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    Print_StringList* list = nullptr;
    errorCode = OH_Print_QueryPrinterList(list);
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintGenericFailure(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    Print_StringList list = {0};
    errorCode = OH_Print_QueryPrinterList(&list);
    errorCode = OH_Print_LaunchPrinterManager();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintInvalidPrintJob(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_StartPrintJob(nullptr);
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintInvalidPrinter(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Print_RegisterPrinterChangeListener(PrinterChangeCallback);
    Print_ErrorCode errorCode = OH_Print_ConnectPrinter(TEST_PRINTER);
    OH_Print_UnregisterPrinterChangeListener();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OHPrintNoError", nullptr, OHPrintNoError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHPrintInvalidParameter", nullptr, OHPrintInvalidParameter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHPrintGenericFailure", nullptr, OHPrintGenericFailure, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHPrintInvalidPrintJob", nullptr, OHPrintInvalidPrintJob, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHPrintInvalidPrinter", nullptr, OHPrintInvalidPrinter, nullptr, nullptr, nullptr, napi_default, nullptr}
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
