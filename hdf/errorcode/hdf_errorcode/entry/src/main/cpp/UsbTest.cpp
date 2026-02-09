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

#include <tuple>
#include <usb/usb_ddk_api.h>
#include <UsbTest.h>
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <vector>
#include "hilog/log.h"
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_10 10
#define PARAM_32 32
#define PARAM_48 48
static uint8_t g_configIndex = 0;
#define USB_DDK_TEST_BUF_SIZE 100
#define USB_DDK_ENDPOINT_DIR_MASK 0x80
#define USB_DDK_DIR_IN 0x80
#define USB_DDK_ENDPOINT_XFERTYPE_MASK 0x03
#define USB_DDK_ENDPOINT_XFER_INT 0x03
void UsbTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"UsbDdkConfigDescriptor0100", nullptr, UsbDdkConfigDescriptor0100,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkConfigDescriptor0200", nullptr, UsbDdkConfigDescriptor0200,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkInterfaceDescriptor0100", nullptr, UsbDdkInterfaceDescriptor0100,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkInterfaceDescriptor0200", nullptr, UsbDdkInterfaceDescriptor0200,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkEndpointDescriptor0100", nullptr, UsbDdkEndpointDescriptor0100,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkEndpointDescriptor0200", nullptr, UsbDdkEndpointDescriptor0200,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbEndpointDescriptor0100", nullptr, UsbEndpointDescriptor0100,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbEndpointDescriptor0200", nullptr, UsbEndpointDescriptor0200,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbEndpointDescriptor0300", nullptr, UsbEndpointDescriptor0300,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbEndpointDescriptor0400", nullptr, UsbEndpointDescriptor0400,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbEndpointDescriptor0500", nullptr, UsbEndpointDescriptor0500,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbInterfaceDescriptor0100", nullptr, UsbInterfaceDescriptor0100,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbInterfaceDescriptor0200", nullptr, UsbInterfaceDescriptor0200,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbInterfaceDescriptor0300", nullptr, UsbInterfaceDescriptor0300,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbInterfaceDescriptor0400", nullptr, UsbInterfaceDescriptor0400,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbInterfaceDescriptor0500", nullptr, UsbInterfaceDescriptor0500,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbInterfaceDescriptor0600", nullptr, UsbInterfaceDescriptor0600,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbInterfaceDescriptor0700", nullptr, UsbInterfaceDescriptor0700,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbAddress0800", nullptr, UsbAddress0800,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbOffset0900", nullptr, UsbOffset0900,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbSize1000", nullptr, UsbSize1000,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbBufferLength1100", nullptr, UsbBufferLength1100,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbTransferedLength1200", nullptr, UsbTransferedLength1200,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}

uint64_t JsDeviceIdToNative1(uint64_t deviceId)
{
    uint32_t busNum = static_cast<uint32_t>(deviceId >> PARAM_48);
    uint32_t devNum = static_cast<uint32_t>((deviceId & 0x0000FFFF00000000) >> PARAM_32);
    return (((static_cast<uint64_t>(busNum)) << PARAM_32) | devNum);
}

napi_value UsbDdkConfigDescriptor0100(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->extra;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbDdkConfigDescriptor0200(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->extraLength;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbDdkInterfaceDescriptor0100(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->extra;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbDdkInterfaceDescriptor0200(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->extraLength;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbDdkEndpointDescriptor0100(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->endPoint->extra;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbDdkEndpointDescriptor0200(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->endPoint->extraLength;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbEndpointDescriptor0100(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->endPoint->endpointDescriptor.bLength;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbEndpointDescriptor0200(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->endPoint->endpointDescriptor.bDescriptorType;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbEndpointDescriptor0300(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->endPoint->endpointDescriptor.bInterval;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbEndpointDescriptor0400(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->endPoint->endpointDescriptor.bRefresh;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbEndpointDescriptor0500(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->endPoint->endpointDescriptor.bSynchAddress;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbInterfaceDescriptor0100(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->interfaceDescriptor.bLength;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbInterfaceDescriptor0200(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->interfaceDescriptor.bDescriptorType;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbInterfaceDescriptor0300(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->interfaceDescriptor.bAlternateSetting;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbInterfaceDescriptor0400(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->interfaceDescriptor.bInterfaceClass;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbInterfaceDescriptor0500(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->interfaceDescriptor.bInterfaceSubClass;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbInterfaceDescriptor0600(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->interfaceDescriptor.bInterfaceProtocol;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbInterfaceDescriptor0700(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int res = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->interface->altsetting->interfaceDescriptor.iInterface;
    napi_value value = nullptr;
    napi_create_int32(env, res == USB_DDK_INVALID_OPERATION ? 0 : -1, &value);
    OH_Usb_FreeConfigDescriptor(config);
    return value;
}

napi_value UsbAddress0800(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    int64_t deviceId64;
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    struct UsbDdkConfigDescriptor *config = nullptr;
    OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    devMemMap->address;
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbOffset0900(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    int64_t deviceId64;
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    struct UsbDdkConfigDescriptor *config = nullptr;
    OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    devMemMap->offset;
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbSize1000(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    int64_t deviceId64;
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    struct UsbDdkConfigDescriptor *config = nullptr;
    OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    devMemMap->size;
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbBufferLength1100(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    int64_t deviceId64;
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    struct UsbDdkConfigDescriptor *config = nullptr;
    OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    devMemMap->bufferLength;
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbTransferedLength1200(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    int64_t deviceId64;
    uint64_t deviceId = JsDeviceIdToNative1(static_cast<uint64_t>(deviceId64));
    OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    struct UsbDdkConfigDescriptor *config = nullptr;
    OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    devMemMap->transferedLength;
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
