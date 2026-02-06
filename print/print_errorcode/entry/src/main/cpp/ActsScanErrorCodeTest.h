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

#ifndef PRINT_ERRORCODE_ACTSSCANERRORCODETEST_H
#define PRINT_ERRORCODE_ACTSSCANERRORCODETEST_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addScanErrorCodeTest(std::vector<napi_property_descriptor>& descData);
napi_value OHScanNoError(napi_env env, napi_callback_info info);
napi_value OHScanInvalidParameter(napi_env env, napi_callback_info info);
napi_value OHScanUnSupported(napi_env env, napi_callback_info info);
napi_value OHPrintINVALID(napi_env env, napi_callback_info info);
napi_value OHScanInit1(napi_env env, napi_callback_info info);
napi_value OH_Scan_StartScannerDiscovery1(napi_env env, napi_callback_info info);
napi_value OH_Scan_OpenScanner1(napi_env env, napi_callback_info info);
napi_value OH_Scan_CloseScanner1(napi_env env, napi_callback_info info);
napi_value OH_Scan_SetScannerParameter1(napi_env env, napi_callback_info info);
napi_value OH_Scan_StartScan1(napi_env env, napi_callback_info info);
napi_value OH_Scan_CancelScan1(napi_env env, napi_callback_info info);
napi_value OH_Scan_GetPictureScanProgress1(napi_env env, napi_callback_info info);
#endif //PRINT_ERRORCODE_ACTSSCANERRORCODETEST_H
