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
#ifndef HDF_ERRORCODE_USBTEST_H
#define HDF_ERRORCODE_USBTEST_H

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void UsbTest(std::vector<napi_property_descriptor>& descData);
napi_value UsbDdkConfigDescriptor0100(napi_env env, napi_callback_info info);
napi_value UsbDdkConfigDescriptor0200(napi_env env, napi_callback_info info);
napi_value UsbDdkInterfaceDescriptor0100(napi_env env, napi_callback_info info);
napi_value UsbDdkInterfaceDescriptor0200(napi_env env, napi_callback_info info);
napi_value UsbDdkEndpointDescriptor0100(napi_env env, napi_callback_info info);
napi_value UsbDdkEndpointDescriptor0200(napi_env env, napi_callback_info info);
napi_value UsbEndpointDescriptor0100(napi_env env, napi_callback_info info);
napi_value UsbEndpointDescriptor0200(napi_env env, napi_callback_info info);
napi_value UsbEndpointDescriptor0300(napi_env env, napi_callback_info info);
napi_value UsbEndpointDescriptor0400(napi_env env, napi_callback_info info);
napi_value UsbEndpointDescriptor0500(napi_env env, napi_callback_info info);
napi_value UsbInterfaceDescriptor0100(napi_env env, napi_callback_info info);
napi_value UsbInterfaceDescriptor0200(napi_env env, napi_callback_info info);
napi_value UsbInterfaceDescriptor0300(napi_env env, napi_callback_info info);
napi_value UsbInterfaceDescriptor0400(napi_env env, napi_callback_info info);
napi_value UsbInterfaceDescriptor0500(napi_env env, napi_callback_info info);
napi_value UsbInterfaceDescriptor0600(napi_env env, napi_callback_info info);
napi_value UsbInterfaceDescriptor0700(napi_env env, napi_callback_info info);
napi_value UsbAddress0800(napi_env env, napi_callback_info info);
napi_value UsbOffset0900(napi_env env, napi_callback_info info);
napi_value UsbSize1000(napi_env env, napi_callback_info info);
napi_value UsbBufferLength1100(napi_env env, napi_callback_info info);
napi_value UsbTransferedLength1200(napi_env env, napi_callback_info info);
#endif //HDF_ERRORCODE_USBTEST_H
