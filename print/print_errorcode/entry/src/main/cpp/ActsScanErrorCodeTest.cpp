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

#include "ActsScanErrorCodeTest.h"
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <BasicServicesKit/ohscan.h>
#define SCANNER_ID "12"
#define TEST_PRINTER "testPrinter"
void addScanErrorCodeTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHScanNoError", nullptr, OHScanNoError,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHScanInvalidParameter", nullptr, OHScanInvalidParameter,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHScanUnSupported", nullptr, OHScanUnSupported,
             nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHPrintINVALID", nullptr, OHPrintINVALID,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHScanInit1", nullptr, OHScanInit1,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Scan_StartScannerDiscovery1", nullptr, OH_Scan_StartScannerDiscovery1,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Scan_OpenScanner1", nullptr, OH_Scan_OpenScanner1,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Scan_CloseScanner1", nullptr, OH_Scan_CloseScanner1,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Scan_SetScannerParameter1", nullptr, OH_Scan_SetScannerParameter1,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Scan_StartScan1", nullptr, OH_Scan_StartScan1,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Scan_CancelScan1", nullptr, OH_Scan_CancelScan1,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Scan_GetPictureScanProgress1", nullptr, OH_Scan_GetPictureScanProgress1,
            nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value OHScanNoError(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    napi_create_int32(env, errorCode == SCAN_ERROR_NONE ? 0 : -1, &result);
    return result;
}

napi_value OHScanInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_CloseScanner(nullptr);
    napi_create_int32(env, errorCode == SCAN_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value OHScanUnSupported(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    errorCode = OH_Scan_OpenScanner(SCANNER_ID);
    napi_create_int32(env, errorCode == SCAN_ERROR_UNSUPPORTED ? 0 : -1, &result);
    return result;
}

napi_value OHPrintINVALID(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_StartScan(SCANNER_ID, false);
    napi_create_int32(env, errorCode == SCAN_ERROR_INVALID ? 0 : -1, &result);
    return result;
}

napi_value OHScanInit1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_Init();
    napi_create_int32(env, errorCode == SCAN_ERROR_NONE ? 0 : -1, &result);
    return result;
}

void ScannerDiscoveryCallback(Scan_ScannerDevice **devices, int32_t deviceCount){};
napi_value OH_Scan_StartScannerDiscovery1(napi_env env, napi_callback_info info)
{
    Scan_ScannerDiscoveryCallback callback;
    napi_value result = nullptr;
    int32_t errorCode = OH_Scan_StartScannerDiscovery(ScannerDiscoveryCallback);
    napi_create_int32(env, ((errorCode == SCAN_ERROR_GENERIC_FAILURE) || (errorCode == SCAN_ERROR_NONE))
    ? 0 : -1, &result);
    return result;
}

napi_value OH_Scan_OpenScanner1(napi_env env, napi_callback_info info)
{
    OH_Scan_Init();
    const char *scannerId;
    int32_t errorCode = OH_Scan_OpenScanner(scannerId);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == SCAN_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value OH_Scan_CloseScanner1(napi_env env, napi_callback_info info)
{
    OH_Scan_Init();
    const char *scannerId;
    int32_t errorCode = OH_Scan_CloseScanner(scannerId);
    napi_value result = nullptr;
    napi_create_int32(env, errorCode == SCAN_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value OH_Scan_SetScannerParameter1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t paraOption = 0;
    int32_t errorCode = OH_Scan_SetScannerParameter(SCANNER_ID, paraOption, SCANNER_ID);
    napi_create_int32(env, errorCode == SCAN_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value OH_Scan_StartScan1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t paraOption = 0;
    int32_t errorCode = OH_Scan_StartScan(nullptr, true);
    napi_create_int32(env, errorCode == SCAN_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value OH_Scan_CancelScan1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t paraOption = 0;
    int32_t errorCode = OH_Scan_CancelScan(nullptr);
    napi_create_int32(env, errorCode == SCAN_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value OH_Scan_GetPictureScanProgress1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t paraOption = 0;
    int32_t errorCode = OH_Scan_GetPictureScanProgress(nullptr, nullptr);
    napi_create_int32(env, errorCode == SCAN_ERROR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}