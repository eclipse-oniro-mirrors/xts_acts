/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "PerformanceTest.h"
#include "hiappeventTest.h"
#include "hicollieTest.h"
EXTERN_C_START

napi_property_descriptor desc[] = {
    {"SetReportRouteValue", nullptr, SetReportRouteValue, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetReportPolicy", nullptr, SetReportPolicy, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetCustomConfig", nullptr, SetCustomConfig, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetConfigId", nullptr, SetConfigId, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetConfigName", nullptr, SetConfigName, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetReportUserId", nullptr, SetReportUserId, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetReportUserProperty0", nullptr, SetReportUserProperty0, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetReportUserProperty1", nullptr, SetReportUserProperty1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetReportUserProperty2", nullptr, SetReportUserProperty2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetReportUserProperty3", nullptr, SetReportUserProperty3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetReportUserPropertyCode", nullptr, SetReportUserPropertyCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetReportUserPropertyCodeValue", nullptr, SetReportUserPropertyCodeValue, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"SetWatcherOnReceive", nullptr, SetWatcherOnReceive, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"RemoveProcessor", nullptr, RemoveProcessor, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetConfigItem", nullptr, SetConfigItem, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetConfigItem1", nullptr, SetConfigItem1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetEventConfig", nullptr, SetEventConfig, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestHiCollieStuckWithTimeoutNdk2", nullptr, TestHiCollieStuckWithTimeoutNdk2, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"TestHiCollieStuckWithTimeoutNdk", nullptr, TestHiCollieStuckWithTimeoutNdk, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"TestHiCollieJankC", nullptr, TestHiCollieJankC, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetTimer1", nullptr, SetTimer1, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetTimer2", nullptr, SetTimer2, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetTimer3", nullptr, SetTimer3, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetTimer4", nullptr, SetTimer4, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"TestHiCollieStuckWithTimeoutNdk1", nullptr, TestHiCollieStuckWithTimeoutNdk1, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiAppEventSetConfigItem", nullptr, HiAppEventSetConfigItem, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"SetEventConfigSuccess", nullptr, SetEventConfigSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiAppEventCreateProcessor", nullptr, HiAppEventCreateProcessor, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiCollieInitStuckDetectionSuccess", nullptr, HiCollieInitStuckDetectionSuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiCollieInitJankDetectionSuccess", nullptr, HiCollieInitJankDetectionSuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiCollieInitJankDetectionInvalid", nullptr, HiCollieInitJankDetectionInvalid, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiCollieReportInvalid", nullptr, HiCollieReportInvalid, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiCollieFlagDefaultCode", nullptr, HiCollieFlagDefaultCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiCollieFlagLogCode", nullptr, HiCollieFlagLogCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiCollieFlagRecoveryCode", nullptr, HiCollieFlagRecoveryCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiDebugStartAppTraceCaptureSuccess", nullptr, HiDebugStartAppTraceCaptureSuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiDebugStartAppTraceCaptureInvalid", nullptr, HiDebugStartAppTraceCaptureInvalid, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiDebugStartAppTraceCaptureCapturedAlReady", nullptr, HiDebugStartAppTraceCaptureCapturedAlReady, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"HiDebugStopAppTraceCaptureSuccess", nullptr, HiDebugStopAppTraceCaptureSuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiDebugStopAppTraceCaptureNoTraceRunning", nullptr, HiDebugStopAppTraceCaptureNoTraceRunning, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"HiDebugGetGraphicsMemorySuccess", nullptr, HiDebugGetGraphicsMemorySuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiDebugGetGraphicsMemoryInvalid", nullptr, HiDebugGetGraphicsMemoryInvalid, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiDebugSetMallocDispatchTableSuccess", nullptr, HiDebugSetMallocDispatchTableSuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiDebugSetMallocDispatchTableInvalid", nullptr, HiDebugSetMallocDispatchTableInvalid, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiDebugSymbolicAddressInvalid", nullptr, HiDebugSymbolicAddressInvalid, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"HiDebugTraceCapturedAlreadyCode", nullptr, HiDebugTraceCapturedAlreadyCode, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"HiDebugNoTraceRunningCode", nullptr, HiDebugNoTraceRunningCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiDebugTraceFlagAllThreadsCode", nullptr, HiDebugTraceFlagAllThreadsCode, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"HiTraceIdInvalidCode", nullptr, HiTraceIdInvalidCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceIdTraceIdValidCode", nullptr, HiTraceIdTraceIdValidCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceVer1Code", nullptr, HiTraceVer1Code, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceFlagDonotCreateSpanCode", nullptr, HiTraceFlagDonotCreateSpanCode, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"HiTraceFlagTpInfoCode", nullptr, HiTraceFlagTpInfoCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceFlagNoBeInfoCode", nullptr, HiTraceFlagNoBeInfoCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceFlagDonotEnableLogCode", nullptr, HiTraceFlagDonotEnableLogCode, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"HiTraceFlagD2dTpInfoCode", nullptr, HiTraceFlagD2dTpInfoCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceTpCrCode", nullptr, HiTraceTpCrCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceTpSsCode", nullptr, HiTraceTpSsCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceTpSrCode", nullptr, HiTraceTpSrCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceTpGeneralCode", nullptr, HiTraceTpGeneralCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceCmThreadCode", nullptr, HiTraceCmThreadCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceCmProcessCode", nullptr, HiTraceCmProcessCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceCmDeviceCode", nullptr, HiTraceCmDeviceCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceIdValidCode", nullptr, HiTraceIdValidCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceIdVerCode", nullptr, HiTraceIdVerCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceIdChainIdCode", nullptr, HiTraceIdChainIdCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceIdFlagsCode", nullptr, HiTraceIdFlagsCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceIdSpanIdCode", nullptr, HiTraceIdSpanIdCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"HiTraceIdParentSpanIdCode", nullptr, HiTraceIdParentSpanIdCode, nullptr, nullptr, nullptr, napi_default, nullptr},
};

static napi_value Init(napi_env env, napi_value exports)
{
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
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
