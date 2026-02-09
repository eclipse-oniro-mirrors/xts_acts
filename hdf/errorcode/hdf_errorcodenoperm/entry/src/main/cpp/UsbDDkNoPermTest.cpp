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
#include "UsbDDkNoPermTest.h"
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
    descData.push_back({"ReleaseTest_001", nullptr, ReleaseTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ReleaseResourceTest_001", nullptr, ReleaseResourceTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ReleaseResourceTest_002", nullptr, ReleaseResourceTest_002,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"GetDeviceDescriptorTest_001", nullptr, GetDeviceDescriptorTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"GetConfigDescriptorTest_001", nullptr, GetConfigDescriptorTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"FreeConfigDescriptorTest_001", nullptr, FreeConfigDescriptorTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ClaimInterfaceTest_001", nullptr, ClaimInterfaceTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ReleaseInterfaceTest_001", nullptr, ReleaseInterfaceTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SelectInterfaceSettingTest_001", nullptr, SelectInterfaceSettingTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"GetCurrentInterfaceSettingTest_001", nullptr, GetCurrentInterfaceSettingTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SendControlReadRequestTest_001", nullptr, SendControlReadRequestTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"SendControlWriteRequestTest_001", nullptr, SendControlWriteRequestTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"CreateDeviceMemMapTest_001", nullptr, CreateDeviceMemMapTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DestroyDeviceMemMapTest_001", nullptr, DestroyDeviceMemMapTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"GetDevicesTest_001", nullptr, GetDevicesTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkErrCodeTest_001", nullptr, UsbDdkErrCodeTest_001,
                       nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value ReleaseTest_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_Usb_Init();
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value ReleaseResourceTest_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto ret = OH_Usb_ReleaseResource();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value ReleaseResourceTest_002(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t usbInitReturnValue = OH_Usb_Init();
    auto ret = OH_Usb_ReleaseResource();
    OH_Usb_Release();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value GetDeviceDescriptorTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t deviceId = PARAM_1;
    struct UsbDeviceDescriptor devDesc;
    int32_t ret = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value GetConfigDescriptorTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t errorId = PARAM_1;
    int32_t ret = OH_Usb_GetConfigDescriptor(errorId, g_configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value FreeConfigDescriptorTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t errorId = PARAM_1;
    int32_t ret = OH_Usb_GetConfigDescriptor(errorId, g_configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

static bool IsInterruptInEndpoint(const UsbEndpointDescriptor &epDesc)
{
    return (((epDesc.bEndpointAddress & USB_DDK_ENDPOINT_DIR_MASK) == USB_DDK_DIR_IN) &&
            ((epDesc.bmAttributes & USB_DDK_ENDPOINT_XFERTYPE_MASK) == USB_DDK_ENDPOINT_XFER_INT));
}

static auto FindInterruptEndpoint(const UsbDdkEndpointDescriptor *epDesc, uint32_t numEp)
    -> std::tuple<bool, uint8_t, uint8_t, uint16_t>
{
    for (uint32_t epIdx = 0; epIdx < numEp; ++epIdx) {
        if (IsInterruptInEndpoint(epDesc[epIdx].endpointDescriptor)) {
            return {true, epDesc[epIdx].endpointDescriptor.bEndpointAddress,
                    epDesc[epIdx].endpointDescriptor.wMaxPacketSize & 0xFF,
                    (epDesc[epIdx].endpointDescriptor.wMaxPacketSize >> 8) & 0xFF};
        }
    }
    return {false, 0, 0, 0};
}

static std::tuple<bool, uint8_t, uint8_t, uint16_t> FindForEachInterface(const UsbDdkInterface &interface)
{
    UsbDdkInterfaceDescriptor *intDesc = interface.altsetting;
    uint32_t numSetting = interface.numAltsetting;
    for (uint32_t setIdx = 0; setIdx < numSetting; ++setIdx) {
        auto result =
            FindInterruptEndpoint(intDesc[setIdx].endPoint, intDesc[setIdx].interfaceDescriptor.bNumEndpoints);
        if (std::get<0>(result)) {
            return {true, intDesc[setIdx].interfaceDescriptor.bInterfaceNumber, std::get<1>(result),
                    std::get<3>(result) << 8 | std::get<2>(result)};
        }
    }
    return {false, 0, 0, 0};
}

static std::tuple<bool, uint8_t, uint8_t, uint16_t> GetEndpointInfo(const struct UsbDdkConfigDescriptor *config)
{
    for (uint32_t intIdx = PARAM_0; intIdx < config->configDescriptor.bNumInterfaces; ++intIdx) {
        auto result = FindForEachInterface(config->interface[intIdx]);
        if (std::get<0>(result)) {
            return result;
        }
    }
    return {false, {}, {}, {}};
}

static bool ParseConfiguration(uint64_t deviceId, std::tuple<bool, uint8_t, uint8_t, uint16_t> &source)
{
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t ret = OH_Usb_GetConfigDescriptor(deviceId, g_configIndex, &config);
    if (ret != PARAM_0) {
        return false;
    }
    source = GetEndpointInfo(config);
    if (!std::get<0>(source)) {
        return false;
    }
    OH_Usb_FreeConfigDescriptor(config);
    return true;
}

napi_value ClaimInterfaceTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t deviceId = PARAM_1;
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    uint8_t interface = std::get<1>(source);
    int32_t ret = OH_Usb_ClaimInterface(deviceId, interface, &g_interfaceHandle);
    int32_t releaseValue = OH_Usb_ReleaseInterface(g_interfaceHandle);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value ReleaseInterfaceTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t deviceId = PARAM_1;
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    uint8_t interface = std::get<1>(source);
    int32_t releaseValue = OH_Usb_ClaimInterface(deviceId, interface, &g_interfaceHandle);
    int32_t ret = OH_Usb_ReleaseInterface(g_interfaceHandle);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", releaseValue);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value SelectInterfaceSettingTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t deviceId = PARAM_1;
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    uint8_t interface = std::get<1>(source);
    int32_t releaseValue = OH_Usb_ClaimInterface(deviceId, interface, &g_interfaceHandle);
    int32_t ret = OH_Usb_SelectInterfaceSetting(g_interfaceHandle, g_settingIndex);
    int32_t ret1 = OH_Usb_ReleaseInterface(g_interfaceHandle);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", releaseValue);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value GetCurrentInterfaceSettingTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t deviceId = PARAM_1;
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    uint8_t interface = std::get<1>(source);
    int32_t releaseValue = OH_Usb_ClaimInterface(deviceId, interface, &g_interfaceHandle);
    int32_t returnValue = OH_Usb_SelectInterfaceSetting(g_interfaceHandle, g_settingIndex);
    int32_t ret = OH_Usb_GetCurrentInterfaceSetting(g_interfaceHandle, &g_settingIndex);
    int32_t ret1 = OH_Usb_ReleaseInterface(g_interfaceHandle);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", releaseValue);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value SendControlReadRequestTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t deviceId = PARAM_1;
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    uint8_t interface = std::get<1>(source);
    int32_t releaseValue = OH_Usb_ClaimInterface(deviceId, interface, &g_interfaceHandle);
    int32_t releaseValue1 = OH_Usb_ReleaseInterface(g_interfaceHandle);
    struct UsbControlRequestSetup setup;
    uint8_t data[USB_DDK_TEST_BUF_SIZE] = {PARAM_0};
    uint32_t dataLen = USB_DDK_TEST_BUF_SIZE;
    int32_t ret = OH_Usb_SendControlReadRequest(g_interfaceHandle, &setup, g_timeout, data, &dataLen);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", releaseValue);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value SendControlWriteRequestTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t deviceId = PARAM_1;
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    uint8_t interface = std::get<1>(source);
    int32_t releaseValue = OH_Usb_ClaimInterface(deviceId, interface, &g_interfaceHandle);
    int32_t releaseValue1 = OH_Usb_ReleaseInterface(g_interfaceHandle);
    struct UsbControlRequestSetup setup;
    uint8_t data[USB_DDK_TEST_BUF_SIZE] = {PARAM_0};
    uint32_t dataLen = USB_DDK_TEST_BUF_SIZE;
    int32_t returnValue = OH_Usb_SendControlReadRequest(g_interfaceHandle, &setup, g_timeout, data, &dataLen);
    struct UsbControlRequestSetup setupW = {PARAM_0};
    setupW.bmRequestType = 0x00;
    setupW.bRequest = 0x09;
    setupW.wValue = (0x03 << PARAM_8) | 0x01;
    setupW.wIndex = 0;
    setupW.wLength = dataLen;
    int32_t ret = OH_Usb_SendControlWriteRequest(g_interfaceHandle, &setupW, g_timeout, data, dataLen);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", releaseValue);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value CreateDeviceMemMapTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t deviceId = PARAM_1;
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    uint8_t interface = std::get<1>(source);
    uint8_t endpoint1 = std::get<PARAM_2>(source);
    uint16_t maxPktSize1 = std::get<PARAM_3>(source);
    int32_t releaseValue = OH_Usb_ClaimInterface(deviceId, interface, &g_interfaceHandle);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = maxPktSize1;
    int32_t ret = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    OH_Usb_ReleaseInterface(g_interfaceHandle);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value DestroyDeviceMemMapTest_001(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t deviceId = PARAM_1;
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    uint8_t interface = std::get<1>(source);
    uint8_t endpoint1 = std::get<PARAM_2>(source);
    uint16_t maxPktSize1 = std::get<PARAM_3>(source);
    int32_t releaseValue = OH_Usb_ClaimInterface(deviceId, interface, &g_interfaceHandle);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = maxPktSize1;
    int32_t ret = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    OH_Usb_ReleaseInterface(g_interfaceHandle);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value GetDevicesTest_001(napi_env env, napi_callback_info info)
{
    constexpr size_t maxUsbDeviceNum = PARAM_128;
    int32_t usbInitReturnValue = OH_Usb_Init();
    struct Usb_DeviceArray deviceArray;
    deviceArray.deviceIds = new uint64_t[maxUsbDeviceNum];
    int32_t ret = OH_Usb_GetDevices(&deviceArray);
    OH_Usb_Release();
    napi_value result;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value UsbDdkErrCodeTest_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    auto ret = OH_Usb_ReleaseResource();
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "11111111111111111111111", "ret: %{public}d", ret);
    napi_create_int32(env, ret == USB_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}