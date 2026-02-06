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

#ifndef ARK_RUNTIME_JSVM_ERROR_TEST_NAPIJSVMENUMCODETEST_H
#define ARK_RUNTIME_JSVM_ERROR_TEST_NAPIJSVMENUMCODETEST_H

#include <napi/native_api.h>
napi_value JsvmWritableCode(napi_env env1, napi_callback_info info);
napi_value JsvmConfigurableCode(napi_env env1, napi_callback_info info);
napi_value JsvmNoReceiverCheckCode(napi_env env1, napi_callback_info info);
napi_value JsvmStaticCode(napi_env env1, napi_callback_info info);
napi_value JsvmDefaultMethodCode(napi_env env1, napi_callback_info info);
napi_value JsvmMethodNoReceiverCheckCode(napi_env env1, napi_callback_info info);
napi_value JsvmDefaultJspropertyCode(napi_env env1, napi_callback_info info);
napi_value JsvmJspropertyNoReceiverlCheckCode(napi_env env1, napi_callback_info info);
napi_value JsvmKeyAllPropertiesCode(napi_env env1, napi_callback_info info);
napi_value JsvmKeySkipStringsCode(napi_env env1, napi_callback_info info);
napi_value JsvmCompileModeDefaultCode(napi_env env1, napi_callback_info info);
napi_value JsvmCompileModeConsumeCodeCode(napi_env env1, napi_callback_info info);
napi_value JsvmCompileModeProduceCompileProfileCode(napi_env env1, napi_callback_info info);
napi_value JsvmCompileModeConsumeCompileProfileCode(napi_env env1, napi_callback_info info);
napi_value JsvmCompileCodeCacheCode(napi_env env1, napi_callback_info info);
napi_value JsvmCompileCompileProfileCode(napi_env env1, napi_callback_info info);
napi_value JsvmCompileEnableSourceMapCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsTotalHeapSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsTotalHeapSizeExecutableCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsTotalPhysicalSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsTotalAvailableSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsUsedHeapSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsHeapSizeLimitCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsMallocedMemoryCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsExternalMemoryCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsPeakMallocedMemoryCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsNumberOfDetachedContextCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsTotalGlobalHandlesSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmHeapStatisticsUsedGlobalHandlesSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmInitOptionsArgcCode(napi_env env1, napi_callback_info info);
napi_value JsvmInitOptionsArgvCode(napi_env env1, napi_callback_info info);
napi_value JsvmInitOptionsRemoveFlagsCode(napi_env env1, napi_callback_info info);
napi_value JsvmCreateVmOptionsMaxOldGenerationSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmCreateVmOptionsMaxYoungGenerationSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmCreateVmOptionsInitialOldGenerationSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmCreateVmOptionsInitialYoungGenerationSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmCreateVmOptionsSnapshotBlobDataCode(napi_env env1, napi_callback_info info);
napi_value JsvmCreateVmOptionsSnapshotBlobSizeCode(napi_env env1, napi_callback_info info);
napi_value JsvmVmInfoEngineCode(napi_env env1, napi_callback_info info);
napi_value JsvmVmInfoVersionCode(napi_env env1, napi_callback_info info);
napi_value JsvmVmInfoCachedDataVersionTagCode(napi_env env1, napi_callback_info info);
napi_value JsvmExtendedErrorInfoEngineReservedCode(napi_env env1, napi_callback_info info);
napi_value JsvmExtendedErrorInfoEngineErrorCode(napi_env env1, napi_callback_info info);

#endif //ARK_RUNTIME_JSVM_ERROR_TEST_NAPIJSVMENUMCODETEST_H
