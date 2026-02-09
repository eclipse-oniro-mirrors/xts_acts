/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#ifndef HIAPPEVENT_PERFORMANCETEST_H
#define HIAPPEVENT_PERFORMANCETEST_H

#include <js_native_api.h>

napi_value HiCollieInitStuckDetectionSuccess(napi_env env, napi_callback_info info);
napi_value HiCollieInitJankDetectionSuccess(napi_env env, napi_callback_info info);
napi_value HiCollieInitJankDetectionInvalid(napi_env env, napi_callback_info info);
napi_value HiCollieReportInvalid(napi_env env, napi_callback_info info);
napi_value HiCollieFlagDefaultCode(napi_env env, napi_callback_info info);
napi_value HiCollieFlagLogCode(napi_env env, napi_callback_info info);
napi_value HiCollieFlagRecoveryCode(napi_env env, napi_callback_info info);
napi_value HiDebugStartAppTraceCaptureSuccess(napi_env env, napi_callback_info info);
napi_value HiDebugStartAppTraceCaptureInvalid(napi_env env, napi_callback_info info);
napi_value HiDebugStartAppTraceCaptureCapturedAlReady(napi_env env, napi_callback_info info);
napi_value HiDebugStopAppTraceCaptureSuccess(napi_env env, napi_callback_info info);
napi_value HiDebugStopAppTraceCaptureNoTraceRunning(napi_env env, napi_callback_info info);
napi_value HiDebugGetGraphicsMemorySuccess(napi_env env, napi_callback_info info);
napi_value HiDebugGetGraphicsMemoryInvalid(napi_env env, napi_callback_info info);
napi_value HiDebugSetMallocDispatchTableSuccess(napi_env env, napi_callback_info info);
napi_value HiDebugSetMallocDispatchTableInvalid(napi_env env, napi_callback_info info);
napi_value HiDebugSymbolicAddressInvalid(napi_env env, napi_callback_info info);
napi_value HiDebugGetGraphicsMemorySummarySuccess(napi_env env, napi_callback_info info);
napi_value HiDebugGetGraphicsMemorySummaryInvalid(napi_env env, napi_callback_info info);
napi_value HiDebugSuccessCode(napi_env env, napi_callback_info info);
napi_value HiDebugInvalidArgumentCode(napi_env env, napi_callback_info info);
napi_value HiDebugTraceCapturedAlreadyCode(napi_env env, napi_callback_info info);
napi_value HiDebugNoTraceRunningCode(napi_env env, napi_callback_info info);
napi_value HiDebugTraceFlagAllThreadsCode(napi_env env, napi_callback_info info);
napi_value HiLogLogFatalCode(napi_env env, napi_callback_info info);
napi_value HiTraceIdInvalidCode(napi_env env, napi_callback_info info);
napi_value HiTraceIdTraceIdValidCode(napi_env env, napi_callback_info info);
napi_value HiTraceVer1Code(napi_env env, napi_callback_info info);
napi_value HiTraceFlagDonotCreateSpanCode(napi_env env, napi_callback_info info);
napi_value HiTraceFlagTpInfoCode(napi_env env, napi_callback_info info);
napi_value HiTraceFlagNoBeInfoCode(napi_env env, napi_callback_info info);
napi_value HiTraceFlagDonotEnableLogCode(napi_env env, napi_callback_info info);
napi_value HiTraceFlagD2dTpInfoCode(napi_env env, napi_callback_info info);
napi_value HiTraceTpCrCode(napi_env env, napi_callback_info info);
napi_value HiTraceTpSsCode(napi_env env, napi_callback_info info);
napi_value HiTraceTpSrCode(napi_env env, napi_callback_info info);
napi_value HiTraceTpGeneralCode(napi_env env, napi_callback_info info);
napi_value HiTraceCmThreadCode(napi_env env, napi_callback_info info);
napi_value HiTraceCmProcessCode(napi_env env, napi_callback_info info);
napi_value HiTraceCmDeviceCode(napi_env env, napi_callback_info info);
napi_value HiTraceIdValidCode(napi_env env, napi_callback_info info);
napi_value HiTraceIdVerCode(napi_env env, napi_callback_info info);
napi_value HiTraceIdChainIdCode(napi_env env, napi_callback_info info);
napi_value HiTraceIdFlagsCode(napi_env env, napi_callback_info info);
napi_value HiTraceIdSpanIdCode(napi_env env, napi_callback_info info);
napi_value HiTraceIdParentSpanIdCode(napi_env env, napi_callback_info info);

#endif // HIAPPEVENT_PERFORMANCETEST_H
