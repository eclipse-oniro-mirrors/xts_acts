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
#include "UsbDDkTest.h"
#include "usb/usb_ddk_api.h"
#include "napi/native_api.h"
#include <ddk/ddk_api.h>
#include <hilog/log.h>

#define USB_DDK_TEST_BUF_SIZE 100
#define USB_DDK_ENDPOINT_DIR_MASK 0x80
#define USB_DDK_DIR_IN 0x80
#define USB_DDK_ENDPOINT_XFERTYPE_MASK 0x03
#define USB_DDK_ENDPOINT_XFER_INT 0x03
#define USB_DDK_TEST_BUF_SIZE 100

static uint8_t g_configIndex = 0;
static uint64_t g_interfaceHandle = 0;
static uint8_t g_settingIndex = 0;
static uint32_t g_timeout = 1000;

void addUsbDDKNoPermTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"ErrcodeTest_001", nullptr, ErrcodeTest_001, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ErrcodeTest_002", nullptr, ErrcodeTest_002, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_001", nullptr, UsbDeviceDescriptorTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_002", nullptr, UsbDeviceDescriptorTest_002,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_003", nullptr, UsbDeviceDescriptorTest_003,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_004", nullptr, UsbDeviceDescriptorTest_004,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_005", nullptr, UsbDeviceDescriptorTest_006,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_006", nullptr, UsbDeviceDescriptorTest_006,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_007", nullptr, UsbDeviceDescriptorTest_007,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_008", nullptr, UsbDeviceDescriptorTest_008,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_009", nullptr, UsbDeviceDescriptorTest_009,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_010", nullptr, UsbDeviceDescriptorTest_010,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_011", nullptr, UsbDeviceDescriptorTest_011,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_012", nullptr, UsbDeviceDescriptorTest_012,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_013", nullptr, UsbDeviceDescriptorTest_013,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDeviceDescriptorTest_014", nullptr, UsbDeviceDescriptorTest_014,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbConfigDescriptorTest_001", nullptr, UsbConfigDescriptorTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbConfigDescriptorTest_002", nullptr, UsbConfigDescriptorTest_002,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbConfigDescriptorTest_003", nullptr, UsbConfigDescriptorTest_003,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbConfigDescriptorTest_004", nullptr, UsbConfigDescriptorTest_004,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbConfigDescriptorTest_005", nullptr, UsbConfigDescriptorTest_005,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbConfigDescriptorTest_006", nullptr, UsbConfigDescriptorTest_006,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbConfigDescriptorTest_007", nullptr, UsbConfigDescriptorTest_007,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DeviceArrayTest_001", nullptr, DeviceArrayTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value ErrcodeTest_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t usbInitReturnValue = OH_Usb_Init();
    OH_Usb_Release();
    napi_create_int32(env, usbInitReturnValue == USB_DDK_SUCCESS ? 0 : 1, &result);
    return result;
}

napi_value ErrcodeTest_002(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t errorId = PARAM_1;
    int32_t ret = OH_Usb_GetConfigDescriptor(errorId, g_configIndex, nullptr);
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_INVALID_PARAMETER ? 0 : 1, &result);
    return result;
}

uint64_t JsDeviceIdToNative(uint64_t deviceId)
{
    uint32_t busNum = static_cast<uint32_t>(deviceId >> PARAM_48);
    uint32_t devNum = static_cast<uint32_t>((deviceId & 0x0000FFFF00000000) >> PARAM_32);
    return (((static_cast<uint64_t>(busNum)) << PARAM_32) | devNum);
}

napi_value UsbDeviceDescriptorTest_001(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.bLength;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_002(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.bDescriptorType;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_003(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.bcdUSB;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_004(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.bDeviceClass;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_005(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.bDeviceSubClass;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_006(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.bDeviceProtocol;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_007(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.bMaxPacketSize0;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_008(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.idVendor;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_009(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.idProduct;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_010(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.bcdDevice;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_011(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.iManufacturer;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_012(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.iProduct;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_013(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.iSerialNumber;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbDeviceDescriptorTest_014(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    devDesc.bNumConfigurations;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "devDesc: %{public}d", devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbConfigDescriptorTest_001(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->configDescriptor.bLength;
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbConfigDescriptorTest_002(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->configDescriptor.bDescriptorType;
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbConfigDescriptorTest_003(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->configDescriptor.wTotalLength;
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbConfigDescriptorTest_004(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->configDescriptor.bConfigurationValue;
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbConfigDescriptorTest_005(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->configDescriptor.iConfiguration;
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbConfigDescriptorTest_006(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->configDescriptor.bmAttributes;
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value UsbConfigDescriptorTest_007(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    config->configDescriptor.bMaxPower;
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value DeviceArrayTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct Usb_DeviceArray deviceArray;
    constexpr size_t maxUsNum = PARAM_128;
    deviceArray.deviceIds = new uint64_t[maxUsNum];
    int32_t returnValue = OH_Usb_GetDevices(&deviceArray);
    uint32_t num = deviceArray.num;
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "returnValue: %{public}d", returnValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111", "num: %{public}d", num);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue == USB_DDK_SUCCESS ? 0 : 1, &result);
    return result;
}