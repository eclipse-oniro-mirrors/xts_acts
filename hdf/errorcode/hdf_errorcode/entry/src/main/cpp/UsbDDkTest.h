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

#ifndef HDF_ERRORCODE_USBDDKTEST_H
#define HDF_ERRORCODE_USBDDKTEST_H
#include "napi/native_api.h"
#include "Common.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

void addUsbDDKNoPermTest(std::vector<napi_property_descriptor>& descData);
napi_value ErrcodeTest_001(napi_env env, napi_callback_info info);
napi_value ErrcodeTest_002(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_001(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_002(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_003(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_004(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_005(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_006(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_007(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_008(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_009(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_010(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_011(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_012(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_013(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_014(napi_env env, napi_callback_info info);
napi_value UsbDeviceDescriptorTest_015(napi_env env, napi_callback_info info);
napi_value UsbConfigDescriptorTest_001(napi_env env, napi_callback_info info);
napi_value UsbConfigDescriptorTest_002(napi_env env, napi_callback_info info);
napi_value UsbConfigDescriptorTest_003(napi_env env, napi_callback_info info);
napi_value UsbConfigDescriptorTest_004(napi_env env, napi_callback_info info);
napi_value UsbConfigDescriptorTest_005(napi_env env, napi_callback_info info);
napi_value UsbConfigDescriptorTest_006(napi_env env, napi_callback_info info);
napi_value UsbConfigDescriptorTest_007(napi_env env, napi_callback_info info);
napi_value DeviceArrayTest_001(napi_env env, napi_callback_info info);
#endif //HDF_ERRORCODE_USBDDKNOPERMTEST_H