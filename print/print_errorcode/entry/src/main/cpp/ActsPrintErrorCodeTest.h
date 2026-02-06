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

#ifndef PRINT_ERRORCODE_ACTSPRINTERRORCODETEST_H
#define PRINT_ERRORCODE_ACTSPRINTERRORCODETEST_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addPrintErrorCodeTest(std::vector<napi_property_descriptor>& descData);
napi_value OHPrintNoError(napi_env env, napi_callback_info info);
napi_value OHPrintInvalidParameter(napi_env env, napi_callback_info info);
napi_value OHPrintGenericFailure(napi_env env, napi_callback_info info);
napi_value OHPrintInvalidPrintJob(napi_env env, napi_callback_info info);
napi_value OHPrintInvalidPrinter(napi_env env, napi_callback_info info);
napi_value OH_Print_Init1(napi_env env, napi_callback_info info);
napi_value OH_Print_StartPrinterDiscovery1(napi_env env, napi_callback_info info);
napi_value OH_Print_StopPrinterDiscovery1(napi_env env, napi_callback_info info);
napi_value OH_Print_ConnectPrinter1(napi_env env, napi_callback_info info);
napi_value OH_Print_StartPrintJob1(napi_env env, napi_callback_info info);
napi_value OH_Print_StartPrintJob2(napi_env env, napi_callback_info info);
napi_value OH_Print_RegisterPrinterChangeListener1(napi_env env, napi_callback_info info);
napi_value OH_Print_QueryPrinterList1(napi_env env, napi_callback_info info);
napi_value OH_Print_QueryPrinterList2(napi_env env, napi_callback_info info);
napi_value OH_Print_QueryPrinterInfo1(napi_env env, napi_callback_info info);
napi_value OH_Print_QueryPrinterInfo2(napi_env env, napi_callback_info info);
napi_value OH_Print_LaunchPrinterManager1(napi_env env, napi_callback_info info);
napi_value OH_Print_QueryPrinterProperties1(napi_env env, napi_callback_info info);
napi_value OH_Print_RestorePrinterProperties1(napi_env env, napi_callback_info info);
#endif //PRINT_ERRORCODE_ACTSPRINTERRORCODETEST_H
