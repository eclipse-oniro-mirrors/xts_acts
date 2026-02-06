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
#include "ActsPrintErrorCodeTest.h"
#include "napi/native_api.h"
#include <BasicServicesKit/ohprint.h>
#include <ffrt/sleep.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <unistd.h>
#define TEST_PRINTER "testPrinter"
namespace {
static const uint32_t MAX_NAME_LENGTH = 1024;
static uint32_t g_singleFd = 100;
} // namespace
static void PrinterChangeCallback(Print_PrinterEvent event, const Print_PrinterInfo *printerInfo) {}
static constexpr size_t ARG_SIZE_ONE = 1;
static constexpr int32_t ERROR_COMMON = -1;

void addPrintErrorCodeTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"OHPrintNoError", nullptr, OHPrintNoError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHPrintInvalidParameter", nullptr, OHPrintInvalidParameter, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"OHPrintGenericFailure", nullptr, OHPrintGenericFailure, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"OHPrintInvalidPrintJob", nullptr, OHPrintInvalidPrintJob, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"OHPrintInvalidPrinter", nullptr, OHPrintInvalidPrinter, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Print_Init1", nullptr, OH_Print_Init1, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Print_StartPrinterDiscovery1", nullptr, OH_Print_StartPrinterDiscovery1, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Print_StopPrinterDiscovery1", nullptr, OH_Print_StopPrinterDiscovery1, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Print_ConnectPrinter1", nullptr, OH_Print_ConnectPrinter1, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Print_StartPrintJob1", nullptr, OH_Print_StartPrintJob1, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Print_StartPrintJob2", nullptr, OH_Print_StartPrintJob2, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Print_RegisterPrinterChangeListener1", nullptr, OH_Print_RegisterPrinterChangeListener1,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Print_QueryPrinterList1", nullptr, OH_Print_QueryPrinterList1, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Print_QueryPrinterList2", nullptr, OH_Print_QueryPrinterList2, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Print_QueryPrinterInfo1", nullptr, OH_Print_QueryPrinterInfo1, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Print_QueryPrinterInfo2", nullptr, OH_Print_QueryPrinterInfo2, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Print_LaunchPrinterManager1", nullptr, OH_Print_LaunchPrinterManager1, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Print_QueryPrinterProperties1", nullptr, OH_Print_QueryPrinterProperties1, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Print_RestorePrinterProperties1", nullptr, OH_Print_RestorePrinterProperties1, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
}

napi_value OHPrintNoError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    napi_create_int32(env, errorCode == PRINT_ERROR_NONE ? 0 : -1, &result);
    return result;
}

napi_value OHPrintInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    Print_StringList *list = nullptr;
    errorCode = OH_Print_QueryPrinterList(list);
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value OHPrintGenericFailure(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_Init();
    Print_StringList list = {0};
    errorCode = OH_Print_QueryPrinterList(&list);
    errorCode = OH_Print_LaunchPrinterManager();
    napi_create_int32(env, errorCode == PRINT_ERROR_GENERIC_FAILURE ? 0 : -1, &result);
    return result;
}

napi_value OHPrintInvalidPrintJob(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    Print_ErrorCode errorCode = OH_Print_StartPrintJob(nullptr);
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PRINT_JOB ? 0 : -1, &result);
    return result;
}

napi_value OHPrintInvalidPrinter(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Print_RegisterPrinterChangeListener(PrinterChangeCallback);
    Print_ErrorCode errorCode = OH_Print_ConnectPrinter(TEST_PRINTER);
    OH_Print_UnregisterPrinterChangeListener();
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PRINTER ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_Init1(napi_env env, napi_callback_info info)
{
    Print_ErrorCode errorCode = OH_Print_Init();
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_NONE ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_StartPrinterDiscovery1(napi_env env, napi_callback_info info)
{
    Print_PrinterDiscoveryCallback callback;
    Print_ErrorCode errorCode = OH_Print_StartPrinterDiscovery(callback);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_NONE ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_StopPrinterDiscovery1(napi_env env, napi_callback_info info)
{
    Print_PrinterDiscoveryCallback callback;
    OH_Print_StartPrinterDiscovery(callback);
    Print_ErrorCode errorCode = OH_Print_StopPrinterDiscovery();
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_NONE ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_ConnectPrinter1(napi_env env, napi_callback_info info)
{
    Print_PrinterInfo virtualPrinter = {
        .printerId = "VIRTUAL_001",
        .printerName = "虚拟打印机",
        .printerState = PRINTER_IDLE,
    };
    Print_ErrorCode errorCode = OH_Print_ConnectPrinter(virtualPrinter.printerId);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PRINTER ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_StartPrintJob1(napi_env env, napi_callback_info info)
{
    Print_PrinterInfo virtualPrinter = {
        .printerId = "VIRTUAL_001", .printerName = "虚拟打印机", .printerState = PRINTER_IDLE};
    Print_PrintJob printJob = {.jobName = strdup("Document1"),
                               .printerId = strdup(virtualPrinter.printerId),
                               .fdList = NULL,
                               .fdListCount = 0,
                               .copyNumber = 1,
                               .colorMode = COLOR_MODE_COLOR,
                               .paperSource = strdup("Auto"),
                               .pageSizeId = strdup("A4")};
    OH_Print_ConnectPrinter(virtualPrinter.printerId);
    Print_ErrorCode errorCode = OH_Print_StartPrintJob(&printJob);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PRINT_JOB ? 0 : -1, &result);
    return result;
}


napi_value OH_Print_StartPrintJob2(napi_env env, napi_callback_info info)
{
    Print_PrinterInfo virtualPrinter = {
        .printerId = "VIRTUAL_001", .printerName = "虚拟打印机", .printerState = PRINTER_IDLE};
    Print_PrintJob printJob = {.jobName = strdup("Document1"),
                               .printerId = strdup(virtualPrinter.printerId),
                               .fdList = &g_singleFd,
                               .fdListCount = 0,
                               .copyNumber = 1,
                               .colorMode = COLOR_MODE_COLOR,
                               .paperSource = strdup("Auto"),
                               .pageSizeId = strdup("A4")};
    OH_Print_ConnectPrinter(virtualPrinter.printerId);
    Print_ErrorCode errorCode = OH_Print_StartPrintJob(&printJob);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PRINTER ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_RegisterPrinterChangeListener1(napi_env env, napi_callback_info info)
{
    Print_PrinterChangeCallback callback;
    Print_ErrorCode errorCode = OH_Print_RegisterPrinterChangeListener(callback);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_NONE ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_QueryPrinterList1(napi_env env, napi_callback_info info)
{
    Print_StringList *printerIdList;
    Print_ErrorCode errorCode = OH_Print_QueryPrinterList(nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_QueryPrinterList2(napi_env env, napi_callback_info info)
{
    Print_StringList *printerIdList = (Print_StringList *)malloc(sizeof(Print_StringList));
    if (printerIdList != NULL) {
        printerIdList->count = 0;
        printerIdList->list = NULL;
    };
    Print_ErrorCode errorCode = OH_Print_QueryPrinterList(printerIdList);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PRINTER ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_QueryPrinterInfo1(napi_env env, napi_callback_info info)
{
    Print_ErrorCode errorCode = OH_Print_QueryPrinterInfo(nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_QueryPrinterInfo2(napi_env env, napi_callback_info info)
{
    Print_PrinterInfo virtualPrinter = {
        .printerId = "VIRTUAL_001", .printerName = "虚拟打印机", .printerState = PRINTER_IDLE};
    Print_PrinterInfo *printerPtr = &virtualPrinter;
    Print_ErrorCode errorCode = OH_Print_QueryPrinterInfo(virtualPrinter.printerId, &printerPtr);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PRINTER ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_LaunchPrinterManager1(napi_env env, napi_callback_info info)
{
    Print_ErrorCode errorCode = OH_Print_LaunchPrinterManager();
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_GENERIC_FAILURE ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_QueryPrinterProperties1(napi_env env, napi_callback_info info)
{
    Print_ErrorCode errorCode = OH_Print_QueryPrinterProperties(nullptr, nullptr, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_INVALID_PRINTER ? 0 : -1, &result);
    return result;
}

napi_value OH_Print_RestorePrinterProperties1(napi_env env, napi_callback_info info)
{
    Print_PrinterInfo virtualPrinter = {
        .printerId = "VIRTUAL_001", .printerName = "虚拟打印机", .printerState = PRINTER_IDLE};
    Print_StringList *propertyKeyList;
    Print_ErrorCode errorCode = OH_Print_RestorePrinterProperties(virtualPrinter.printerId, propertyKeyList);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == PRINT_ERROR_NONE ? 0 : -1, &result);
    return result;
}