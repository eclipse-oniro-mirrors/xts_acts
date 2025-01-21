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

#define TEST_PRINTER "testPrinter"

static void PrinterDiscoveryCallback(Print_DiscoveryEvent event, const Print_PrinterInfo *printerInfo)
{
}

static void PrinterChangeCallback(Print_PrinterEvent event, const Print_PrinterInfo *printerInfo)
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