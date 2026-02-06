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

#ifndef HDF_ERRORCODE_ACTSBASEDDKTEST_H
#define HDF_ERRORCODE_ACTSBASEDDKTEST_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addBaseDDkErrorCodeTest(std::vector<napi_property_descriptor>& descData);
napi_value DdkMapAshmemAshmemFd(napi_env env, napi_callback_info info);
napi_value DdkMapAshmemAddress(napi_env env, napi_callback_info info);
napi_value DdkMapAshmemSize(napi_env env, napi_callback_info info);
napi_value DdkMapAshmemOffset(napi_env env, napi_callback_info info);
napi_value DdkMapAshmemBufferLength(napi_env env, napi_callback_info info);
napi_value DdkMapAshmemTransferredLength(napi_env env, napi_callback_info info);
napi_value DdkMapAshmemFailure(napi_env env, napi_callback_info info);
napi_value DdkMapAshmemInvalidParameter(napi_env env, napi_callback_info info);
napi_value DdkMapAshmemInvalidOperation(napi_env env, napi_callback_info info);
napi_value DdkMapAshmemNullPTR(napi_env env, napi_callback_info info);
napi_value DdkUnmapAshmemFailure(napi_env env, napi_callback_info info);
napi_value DdkDestroyAshmemFailure(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeNullPtr(napi_env env, napi_callback_info info);
napi_value IsHidDevice1(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeTimeOut(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeInitError(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeNotFound(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeFailure(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeIOError(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHidRelAxesArrayHidRelAxes(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeHidRelAxesArrayLength(napi_env env, napi_callback_info info);
napi_value CreateTestDeviceDdkFailure(napi_env env, napi_callback_info info);
napi_value CreateTestDeviceDdk(napi_env env, napi_callback_info info);
napi_value CreateTestDeviceDdk1(napi_env env, napi_callback_info info);
napi_value HidEmitEventInvalidParameter(napi_env env, napi_callback_info info);
napi_value HidEmitEventInvalidOperation(napi_env env, napi_callback_info info);
napi_value HidEmitEventNullPtr(napi_env env, napi_callback_info info);
napi_value HidDestroyDeviceNullPtr(napi_env env, napi_callback_info info);
napi_value HidDestroyDeviceInvalidOperation(napi_env env, napi_callback_info info);
napi_value HidInitOne(napi_env env, napi_callback_info info);
napi_value HidReleaseOne(napi_env env, napi_callback_info info);
napi_value HidOpenServiceError(napi_env env, napi_callback_info info);
napi_value HidCloseServiceError(napi_env env, napi_callback_info info);
napi_value HidReadTimeoutServiceError(napi_env env, napi_callback_info info);
napi_value HidReadServiceError(napi_env env, napi_callback_info info);
napi_value HidGetRawInfoInvalidOperation(napi_env env, napi_callback_info info);
napi_value HidGetRawNameInvalidOperation(napi_env env, napi_callback_info info);
napi_value HidGetPhysicalAddressInvalidOperation(napi_env env, napi_callback_info info);
napi_value HidGetRawUniqueIdInvalidOperation(napi_env env, napi_callback_info info);
napi_value HidSendReportSuccess(napi_env env, napi_callback_info info);
napi_value HidGetReportSuccess(napi_env env, napi_callback_info info);
napi_value HidGetReportDescriptorInvalidOperation(napi_env env, napi_callback_info info);
napi_value HidSetNonBlocking(napi_env env, napi_callback_info info);
#endif //HDF_ERRORCODE_ACTSBASEDDKTEST_H