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

#include <string>

#include "napi/native_api.h"
#include <BasicServicesKit/ohprint.h>

#define TEST_PRINTER "testPrinter"

static constexpr size_t ARG_SIZE_ONE = 1;
static constexpr int32_t ERROR_COMMON = -1;

static void PrinterDiscoveryCallback(Print_DiscoveryEvent event, const Print_PrinterInfo *printerInfo)
{
}

static void PrinterChangeCallback(Print_PrinterEvent event, const Print_PrinterInfo *printerInfo)
{
}

static void OnStartLayoutWrite(const char *jobId,
                               uint32_t fd,
                               const Print_PrintAttributes *oldAttrs,
                               const Print_PrintAttributes *newAttrs,
                               Print_WriteResultCallback writeCallback)
{
}

static void OnJobStateChanged(const char* jobId, uint32_t state)
{
}

static napi_value OHPrintInit(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    errorCode = OH_Print_Release();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintListener(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    OH_Print_RegisterPrinterChangeListener(PrinterChangeCallback);
    OH_Print_UnregisterPrinterChangeListener();
    errorCode = OH_Print_Release();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintDiscovery(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    errorCode = OH_Print_StartPrinterDiscovery(PrinterDiscoveryCallback);
    OH_Print_StopPrinterDiscovery();
    errorCode = OH_Print_Release();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintConnect(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    OH_Print_RegisterPrinterChangeListener(PrinterChangeCallback);
    OH_Print_ConnectPrinter(TEST_PRINTER);
    OH_Print_UnregisterPrinterChangeListener();
    errorCode = OH_Print_Release();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintJob(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    OH_Print_StartPrintJob(nullptr);
    errorCode = OH_Print_Release();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintList(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    Print_StringList list = {0};
    errorCode = OH_Print_QueryPrinterList(&list);
    errorCode = OH_Print_LaunchPrinterManager();
    OH_Print_ReleasePrinterList(&list);
    errorCode = OH_Print_Release();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    Print_PrinterInfo *printerInfo = nullptr;
    errorCode = OH_Print_QueryPrinterInfo(TEST_PRINTER, &printerInfo);
    OH_Print_ReleasePrinterInfo(printerInfo);
    printerInfo = nullptr;
    errorCode = OH_Print_Release();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    Print_StringList key = {0};
    Print_PropertyList value = {0};
    errorCode = OH_Print_QueryPrinterProperties(TEST_PRINTER, &key, &value);
    errorCode = OH_Print_UpdatePrinterProperties(TEST_PRINTER, &value);
    errorCode = OH_Print_RestorePrinterProperties(TEST_PRINTER, &key);
    OH_Print_ReleasePrinterProperties(&value);
    errorCode = OH_Print_Release();
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}

static napi_value OHPrintStartPrintByNative(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    size_t argc = ARG_SIZE_ONE;
    napi_value args[ARG_SIZE_ONE] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc != ARG_SIZE_ONE) {
        napi_create_int32(env, ERROR_COMMON, &result);
        return result;
    }
    void* context = nullptr;
    napi_status status = napi_unwrap(env, args[0], &context);
    if (status != napi_ok) {
        napi_create_int32(env, ERROR_COMMON, &result);
        return result;
    }

    napi_value statgeMode = nullptr;
    napi_get_named_property(env, args[0], "stageMode", &statgeMode);
    bool isStageMode = false;
    napi_get_value_bool(env, statgeMode, &isStageMode);
    if (!isStageMode) {
        napi_create_int32(env, ERROR_COMMON, &result);
        return result;
    }

    std::string printJobName = "MyPrintTest";
    Print_PrintDocCallback cb;
    cb.startLayoutWriteCb = OnStartLayoutWrite;
    cb.jobStateChangedCb = OnJobStateChanged;
    Print_ErrorCode errorCode = OH_Print_StartPrintByNative(printJobName.c_str(), cb, context);
    napi_create_int32(env, static_cast<int32_t>(errorCode), &result);
    return result;
}