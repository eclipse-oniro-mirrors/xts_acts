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

#ifndef HDF_ERRORCODE_ACTSBASEDDKNOPERMTEST_H
#define HDF_ERRORCODE_ACTSBASEDDKNOPERMTEST_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addBaseDDkErrorCodeNoPermTest(std::vector<napi_property_descriptor>& descData);
napi_value IsHidDevice(napi_env env, napi_callback_info info);
napi_value CreateTestDeviceDdkNOPERM(napi_env env, napi_callback_info info);
napi_value HidEmitEventNOPERM(napi_env env, napi_callback_info info);
napi_value HidDestroyDeviceNOPERM(napi_env env, napi_callback_info info);
napi_value HidInitNOPERM(napi_env env, napi_callback_info info);
napi_value HidReleaseNOPERM(napi_env env, napi_callback_info info);
napi_value HidOpenNOPERM(napi_env env, napi_callback_info info);
napi_value HidCloseNOPERM(napi_env env, napi_callback_info info);
napi_value HidWriteNOPERM(napi_env env, napi_callback_info info);
napi_value HidReadTimeoutNOPERM(napi_env env, napi_callback_info info);
napi_value HidReadNOPERM(napi_env env, napi_callback_info info);
napi_value HidDdkErrCodeNOPERM(napi_env env, napi_callback_info info);
napi_value HidSetNonBlockingNOPERM(napi_env env, napi_callback_info info);
napi_value HidGetRawInfoNOPERM(napi_env env, napi_callback_info info);
napi_value HidGetRawNameNOPERM(napi_env env, napi_callback_info info);
napi_value HidGetPhysicalAddressNOPERM(napi_env env, napi_callback_info info);
napi_value HidGetRawUniqueIdNOPERM(napi_env env, napi_callback_info info);
napi_value HidSendReportNOPERM(napi_env env, napi_callback_info info);
napi_value HidGetReportNOPERM(napi_env env, napi_callback_info info);
napi_value HidGetReportDescriptorNOPERM(napi_env env, napi_callback_info info);
napi_value UsbSerialReleaseNOPERM(napi_env env, napi_callback_info info);
napi_value UsbSerialCloseNOPERM(napi_env env, napi_callback_info info);
#endif //HDF_ERRORCODE_ACTSBASEDDKNOPERMTEST_H
