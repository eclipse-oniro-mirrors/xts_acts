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
#include "ohprint.cpp"
#include "ohscan.cpp"

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "oHPrintInit", nullptr, OHPrintInit, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHPrintListener", nullptr, OHPrintListener, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHPrintDiscovery", nullptr, OHPrintDiscovery, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHPrintConnect", nullptr, OHPrintConnect, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHPrintJob", nullptr, OHPrintJob, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHPrintList", nullptr, OHPrintList, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHPrintInfo", nullptr, OHPrintInfo, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHPrintProperty", nullptr, OHPrintProperty, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHScanInit", nullptr, OHScanInit, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHScanStartScannerDiscovery", nullptr, OHScanStartScannerDiscovery,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHScanOpenScanner", nullptr, OHScanOpenScanner, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHScanCloseScanner", nullptr, OHScanCloseScanner, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHScanGetScannerParameter", nullptr, OHScanGetScannerParameter, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "oHScanSetScannerParameter", nullptr, OHScanSetScannerParameter, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "oHScanStartScan", nullptr, OHScanStartScan, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHScanCancelScan", nullptr, OHScanCancelScan, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHScanGetPictureScanProgress", nullptr, OHScanGetPictureScanProgress, nullptr,
            nullptr, nullptr, napi_default, nullptr },
        { "oHScanExit", nullptr, OHScanExit, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "oHPrintStartPrintByNative",
            nullptr, OHPrintStartPrintByNative, nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); };