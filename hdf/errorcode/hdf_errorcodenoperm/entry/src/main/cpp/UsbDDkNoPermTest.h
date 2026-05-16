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

#ifndef HDF_ERRORCODE_USBDDKNOPERMTEST_H
#define HDF_ERRORCODE_USBDDKNOPERMTEST_H
#include "napi/native_api.h"
#include "Common.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

void addUsbDDKNoPermTest(std::vector<napi_property_descriptor>& descData);
napi_value ReleaseTest_001(napi_env env, napi_callback_info info);
napi_value ReleaseResourceTest_001(napi_env env, napi_callback_info info);
napi_value ReleaseResourceTest_002(napi_env env, napi_callback_info info);
napi_value GetDeviceDescriptorTest_001(napi_env env, napi_callback_info info);
napi_value GetConfigDescriptorTest_001(napi_env env, napi_callback_info info);
napi_value FreeConfigDescriptorTest_001(napi_env env, napi_callback_info info);
napi_value ClaimInterfaceTest_001(napi_env env, napi_callback_info info);
napi_value ReleaseInterfaceTest_001(napi_env env, napi_callback_info info);
napi_value SelectInterfaceSettingTest_001(napi_env env, napi_callback_info info);
napi_value GetCurrentInterfaceSettingTest_001(napi_env env, napi_callback_info info);
napi_value SendControlReadRequestTest_001(napi_env env, napi_callback_info info);
napi_value SendControlWriteRequestTest_001(napi_env env, napi_callback_info info);
napi_value CreateDeviceMemMapTest_001(napi_env env, napi_callback_info info);
napi_value DestroyDeviceMemMapTest_001(napi_env env, napi_callback_info info);
napi_value GetDevicesTest_001(napi_env env, napi_callback_info info);
napi_value UsbDdkErrCodeTest_001(napi_env env, napi_callback_info info);

#endif //HDF_ERRORCODE_USBDDKNOPERMTEST_H
