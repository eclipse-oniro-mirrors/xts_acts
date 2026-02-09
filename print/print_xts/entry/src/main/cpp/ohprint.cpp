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

static napi_value CreateEnumType1()
{
    Print_ErrorCode errorCode = Print_ErrorCode::PRINT_ERROR_NONE;
    errorCode = Print_ErrorCode::PRINT_ERROR_NO_PERMISSION;
    errorCode = Print_ErrorCode::PRINT_ERROR_INVALID_PARAMETER;
    errorCode = Print_ErrorCode::PRINT_ERROR_GENERIC_FAILURE;
    errorCode = Print_ErrorCode::PRINT_ERROR_RPC_FAILURE;
    errorCode = Print_ErrorCode::PRINT_ERROR_SERVER_FAILURE;
    errorCode = Print_ErrorCode::PRINT_ERROR_INVALID_EXTENSION;
    errorCode = Print_ErrorCode::PRINT_ERROR_INVALID_PRINTER;
    errorCode = Print_ErrorCode::PRINT_ERROR_INVALID_PRINT_JOB;
    errorCode = Print_ErrorCode::PRINT_ERROR_FILE_IO;
    errorCode = Print_ErrorCode::PRINT_ERROR_UNKNOWN;
    
    Print_PrinterState printerState = Print_PrinterState::PRINTER_IDLE;
    printerState = Print_PrinterState::PRINTER_BUSY;
    printerState = Print_PrinterState::PRINTER_UNAVAILABLE;
    
    Print_DiscoveryEvent discoveryEvent = Print_DiscoveryEvent::PRINTER_DISCOVERED;
    discoveryEvent = Print_DiscoveryEvent::PRINTER_LOST;
    discoveryEvent = Print_DiscoveryEvent::PRINTER_CONNECTING;
    discoveryEvent = Print_DiscoveryEvent::PRINTER_CONNECTED;
    
    Print_PrinterEvent printerEvent = Print_PrinterEvent::PRINTER_ADDED;
    printerEvent = Print_PrinterEvent::PRINTER_DELETED;
    printerEvent = Print_PrinterEvent::PRINTER_STATE_CHANGED;
    printerEvent = Print_PrinterEvent::PRINTER_INFO_CHANGED;
    
    Print_DuplexMode duplexMode = Print_DuplexMode::DUPLEX_MODE_ONE_SIDED;
    duplexMode = Print_DuplexMode::DUPLEX_MODE_TWO_SIDED_LONG_EDGE;
    duplexMode = Print_DuplexMode::DUPLEX_MODE_TWO_SIDED_SHORT_EDGE;
    
    Print_ColorMode colorMode = Print_ColorMode::COLOR_MODE_MONOCHROME;
    colorMode = Print_ColorMode::COLOR_MODE_COLOR;
    colorMode = Print_ColorMode::COLOR_MODE_AUTO;
    
    Print_OrientationMode orientationMode = Print_OrientationMode::ORIENTATION_MODE_PORTRAIT;
    orientationMode = Print_OrientationMode::ORIENTATION_MODE_LANDSCAPE;
    orientationMode = Print_OrientationMode::ORIENTATION_MODE_REVERSE_LANDSCAPE;
    orientationMode = Print_OrientationMode::ORIENTATION_MODE_REVERSE_PORTRAIT;
    orientationMode = Print_OrientationMode::ORIENTATION_MODE_NONE;
}

static napi_value CreateEnumType2()
{
    Print_Quality quality = Print_Quality::PRINT_QUALITY_DRAFT;
    quality = Print_Quality::PRINT_QUALITY_NORMAL;
    quality = Print_Quality::PRINT_QUALITY_HIGH;
    
    Print_DocumentFormat documentFormat = Print_DocumentFormat::DOCUMENT_FORMAT_AUTO;
    documentFormat = Print_DocumentFormat::DOCUMENT_FORMAT_JPEG;
    documentFormat = Print_DocumentFormat::DOCUMENT_FORMAT_PDF;
    documentFormat = Print_DocumentFormat::DOCUMENT_FORMAT_POSTSCRIPT;
    documentFormat = Print_DocumentFormat::DOCUMENT_FORMAT_TEXT;
    
    Print_JobDocAdapterState jobDocAdapterState = Print_JobDocAdapterState::PRINT_DOC_ADAPTER_PREVIEW_ABILITY_DESTROY;
    jobDocAdapterState = Print_JobDocAdapterState::PRINT_DOC_ADAPTER_PRINT_TASK_SUCCEED;
    jobDocAdapterState = Print_JobDocAdapterState::PRINT_DOC_ADAPTER_PRINT_TASK_FAIL;
    jobDocAdapterState = Print_JobDocAdapterState::PRINT_DOC_ADAPTER_PRINT_TASK_CANCEL;
    jobDocAdapterState = Print_JobDocAdapterState::PRINT_DOC_ADAPTER_PRINT_TASK_BLOCK;
    jobDocAdapterState = Print_JobDocAdapterState::PRINT_DOC_ADAPTER_PREVIEW_ABILITY_DESTROY_FOR_CANCELED;
    jobDocAdapterState = Print_JobDocAdapterState::PRINT_DOC_ADAPTER_PREVIEW_ABILITY_DESTROY_FOR_STARTED;
}

static napi_value CreateStruct()
{
    char* str = "test";
    auto printerInfo = new Print_PrinterInfo;
    std::fill_n(reinterpret_cast<char*>(printerInfo), sizeof(Print_PrinterInfo), 0);
    printerInfo->printerState = Print_PrinterState::PRINTER_IDLE;
    Print_PrinterCapability capability;
    printerInfo->capability = capability;
    Print_DefaultValue defaultValue;
    printerInfo->defaultValue = defaultValue;
    printerInfo->isDefaultPrinter = false;
    printerInfo->printerId = str;
    printerInfo->printerName = str;
    printerInfo->description = str;
    printerInfo->location = str;
    printerInfo->makeAndModel = str;
    printerInfo->printerUri = str;
    printerInfo->detailInfo = str;
    
    auto printJob = new Print_PrintJob;
    std::fill_n(reinterpret_cast<char*>(printJob), sizeof(Print_PrintJob), 0);
    printJob->jobName = str;
    uint32_t fdList[] = {1, 2};
    printJob->fdList = fdList;
    printJob->fdListCount = 1;
    printJob->printerId = str;
    printJob->copyNumber = 1;
    printJob->paperSource = str;
    printJob->mediaType = str;
    printJob->pageSizeId = str;
    printJob->colorMode = Print_ColorMode::COLOR_MODE_MONOCHROME;
    printJob->duplexMode = Print_DuplexMode::DUPLEX_MODE_ONE_SIDED;
    Print_Resolution resolution;
    resolution.horizontalDpi = 1;
    printJob->resolution = resolution;
    Print_Margin margin;
    margin.leftMargin = 1;
    printJob->printMargin = margin;
    printJob->borderless = false;
    printJob->orientationMode = Print_OrientationMode::ORIENTATION_MODE_PORTRAIT;
    printJob->printQuality = Print_Quality::PRINT_QUALITY_DRAFT;
    printJob->documentFormat = Print_DocumentFormat::DOCUMENT_FORMAT_AUTO;
    printJob->advancedOptions = str;
}