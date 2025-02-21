/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "hilog/log.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "usb_ddk_api.h"
#include "usb_ddk_types.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <tuple>
#include <unistd.h>


#define ENDPOINT 0
#define SLEEP 2
#define PARAM_8 8
#define USB_DDK_TEST_BUF_SIZE 100
#define USB_DDK_ENDPOINT_DIR_MASK 0x80
#define USB_DDK_DIR_IN 0x80
#define USB_DDK_ENDPOINT_XFERTYPE_MASK 0x03
#define USB_DDK_ENDPOINT_XFER_INT 0x03
static uint8_t configIndex = 0;
static uint8_t interfaceIndex = 0;
static uint64_t interfaceHandle = 0;
static uint8_t settingIndex = 0;
static uint32_t timeout = 1000;

static constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_APP, 0xFEFE, "JSAPP"};
#define MY_HILOG(op, fmt, args...)                                                                                     \
    do {                                                                                                               \
        op(LABEL, "{%{public}s:%{public}d} " fmt, __FUNCTION__, __LINE__, ##args);                                     \
    } while (0)
#define DEBUG_LOG(fmt, ...) MY_HILOG(OHOS::HiviewDFX::HiLog::Info, fmt, ##__VA_ARGS__)

uint64_t g_devHandle = 0;

static bool IsInterruptInEndpoint(const UsbEndpointDescriptor &epDesc)
{
    return (((epDesc.bEndpointAddress & USB_DDK_ENDPOINT_DIR_MASK) == USB_DDK_DIR_IN) &&
            ((epDesc.bmAttributes & USB_DDK_ENDPOINT_XFERTYPE_MASK) == USB_DDK_ENDPOINT_XFER_INT));
}

static std::tuple<bool, uint8_t, uint8_t, uint16_t> FindForEachInterface(const UsbDdkInterface &interface)
{
    struct UsbDdkInterfaceDescriptor *intDesc = interface.altsetting;
    uint32_t numSetting = interface.numAltsetting;
    for (uint32_t setIdx = 0; setIdx < numSetting; ++setIdx) {
        uint32_t numEp = intDesc[setIdx].interfaceDescriptor.bNumEndpoints;
        struct UsbDdkEndpointDescriptor *epDesc = intDesc[setIdx].endPoint;
        for (uint32_t epIdx = 0; epIdx < numEp; ++epIdx) {
            if (IsInterruptInEndpoint(epDesc[epIdx].endpointDescriptor)) {
                return {true, intDesc[setIdx].interfaceDescriptor.bInterfaceNumber,
                        epDesc[epIdx].endpointDescriptor.bEndpointAddress,
                        epDesc[epIdx].endpointDescriptor.wMaxPacketSize};
            }
        }
    }

    return {false, {}, {}, {}};
}

static std::tuple<bool, uint8_t, uint8_t, uint16_t> GetEndpointInfo(const struct UsbDdkConfigDescriptor *config)
{
    for (uint32_t intIdx = 0; intIdx < config->configDescriptor.bNumInterfaces; ++intIdx) {
        auto result = FindForEachInterface(config->interface[intIdx]);
        if (std::get<0>(result)) {
            return result;
        }
    }
    return {false, {}, {}, {}};
}

uint64_t GetDeviceId(void)
{
    return g_devHandle;
}

void ReleaseDeviceId(void)
{
    DEBUG_LOG("ReleaseDeviceId,START");
    DEBUG_LOG("ReleaseDeviceId,END");
}

static napi_value UsbInit(napi_env env, napi_callback_info)
{
    int32_t returnValue = OH_Usb_Init();
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbRelease(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, true, &result);
    return result;
}

static napi_value UsbGetDeviceDescriptorOne(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(g_devHandle, &devDesc);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetDeviceDescriptorTwo(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(g_devHandle, nullptr);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetConfigDescriptorOne(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t returnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetConfigDescriptorTwo(napi_env env, napi_callback_info)
{
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t errorId = 1;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(errorId, configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetConfigDescriptorThree(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t returnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, nullptr);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbFreeConfigDescriptor(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t returnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, &config);
    NAPI_ASSERT(env, returnValue == 0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, true, &result);
    return result;
}

static napi_value UsbClaimInterfaceOne(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t returnValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbClaimInterfaceTwo(napi_env env, napi_callback_info)
{
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    uint64_t errorId = 1;
    int32_t returnValue = OH_Usb_ClaimInterface(errorId, interfaceIndex, &interfaceHandle);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbClaimInterfaceThree(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t returnValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, nullptr);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbReleaseInterface(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    int32_t returnValue = OH_Usb_ReleaseInterface(interfaceHandle);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSelectInterfaceSettingOne(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    int32_t returnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSelectInterfaceSettingTwo(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    OH_Usb_Release();
    int32_t returnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetCurrentInterfaceSettingOne(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "OH_Usb_ClaimInterface failed");
    int32_t usbSelectInterfaceSettingReturnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    NAPI_ASSERT(env, usbSelectInterfaceSettingReturnValue == 0, "OH_Usb_SelectInterfaceSetting failed");
    int32_t returnValue = OH_Usb_GetCurrentInterfaceSetting(interfaceHandle, &settingIndex);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetCurrentInterfaceSettingTwo(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "OH_Usb_ClaimInterface failed");
    int32_t usbSelectInterfaceSettingReturnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    NAPI_ASSERT(env, usbSelectInterfaceSettingReturnValue == 0, "OH_Usb_SelectInterfaceSetting failed");
    OH_Usb_Release();
    int32_t returnValue = OH_Usb_GetCurrentInterfaceSetting(interfaceHandle, &settingIndex);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetCurrentInterfaceSettingThree(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    int32_t usbSelectInterfaceSettingReturnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    NAPI_ASSERT(env, usbSelectInterfaceSettingReturnValue == 0, "Usb_ClaimInterface failed");
    int32_t returnValue = OH_Usb_GetCurrentInterfaceSetting(interfaceHandle, nullptr);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestOne(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint8_t data[USB_DDK_TEST_BUF_SIZE] = {0};
    uint32_t dataLen = USB_DDK_TEST_BUF_SIZE;
    setup.bmRequestType = 0x80;
    setup.bRequest = 0x06;
    setup.wValue = (0x03 << PARAM_8) | 0x01;
    setup.wIndex = 0x409;
    setup.wLength = dataLen;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, &setup, UINT32_MAX, data, &dataLen);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestTwo(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    OH_Usb_Release();
    struct UsbControlRequestSetup setup;
    uint8_t data[USB_DDK_TEST_BUF_SIZE] = {0};
    uint32_t dataLen = USB_DDK_TEST_BUF_SIZE;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, &setup, timeout, data, &dataLen);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestThree(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    uint8_t data[USB_DDK_TEST_BUF_SIZE] = {0};
    uint32_t dataLen = USB_DDK_TEST_BUF_SIZE;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, nullptr, timeout, data, &dataLen);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestFour(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint32_t dataLen = 10;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, &setup, timeout, nullptr, &dataLen);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestFive(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint8_t data = 10;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, &setup, timeout, &data, nullptr);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequestOne(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint8_t data = 10;
    uint32_t dataLen = 10;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, &setup, timeout, &data, dataLen);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequestTwo(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    OH_Usb_Release();
    struct UsbControlRequestSetup setup;
    uint8_t data = 10;
    uint32_t dataLen = 10;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, &setup, timeout, &data, dataLen);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequestThree(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    uint8_t data = 10;
    uint32_t dataLen = 10;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, nullptr, timeout, &data, dataLen);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequestFour(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint32_t dataLen = 10;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, &setup, timeout, nullptr, dataLen);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendPipeRequestOne(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(g_devHandle, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == 0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == 0, "OH_Usb_GetConfigDescriptor failed");
    auto [result1, interface1, endpoint1, maxPktSize1] = GetEndpointInfo(config);
    OH_Usb_FreeConfigDescriptor(config);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(g_devHandle, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == 0, "Usb_ClaimInterface failed");
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = 10;
    int32_t UsbCreateDeviceMemMapReturnValue = OH_Usb_CreateDeviceMemMap(g_devHandle, bufferLen, &devMemMap);
    NAPI_ASSERT(env, UsbCreateDeviceMemMapReturnValue == 0, "OH_Usb_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMemMap != nullptr, "OH_Usb_CreateDeviceMemMap failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = endpoint1;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequest(&pipe, devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendPipeRequestTwo(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(g_devHandle, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == 0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == 0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = 10;
    int32_t UsbCreateDeviceMemMapReturnValue = OH_Usb_CreateDeviceMemMap(g_devHandle, bufferLen, &devMemMap);
    NAPI_ASSERT(env, UsbCreateDeviceMemMapReturnValue == 0, "OH_Usb_CreateDeviceMemMap failed");
    OH_Usb_Release();
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = ENDPOINT;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequest(&pipe, devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendPipeRequestThree(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(g_devHandle, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == 0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == 0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = 10;
    int32_t UsbCreateDeviceMemMapReturnValue = OH_Usb_CreateDeviceMemMap(g_devHandle, bufferLen, &devMemMap);
    NAPI_ASSERT(env, UsbCreateDeviceMemMapReturnValue == 0, "OH_Usb_CreateDeviceMemMap failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = ENDPOINT;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequest(nullptr, devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendPipeRequestFour(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(g_devHandle, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == 0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == 0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = 10;
    int32_t UsbCreateDeviceMemMapReturnValue = OH_Usb_CreateDeviceMemMap(g_devHandle, bufferLen, &devMemMap);
    NAPI_ASSERT(env, UsbCreateDeviceMemMapReturnValue == 0, "OH_Usb_CreateDeviceMemMap failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = ENDPOINT;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequest(&pipe, nullptr);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbCreateDeviceMemMapOne(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(g_devHandle, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == 0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == 0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = 10;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(g_devHandle, bufferLen, &devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbCreateDeviceMemMapTow(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(g_devHandle, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == 0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == 0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    size_t bufferLen = 10;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(g_devHandle, bufferLen, nullptr);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbDestroyDeviceMemMap(napi_env env, napi_callback_info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == 0, "OH_Usb_Init failed");
    GetDeviceId();
    DEBUG_LOG("OH_Usb_UnRegisterNotificationBack %{public}llu", g_devHandle);
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(g_devHandle, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == 0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(g_devHandle, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == 0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = 10;
    OH_Usb_CreateDeviceMemMap(g_devHandle, bufferLen, &devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    ReleaseDeviceId();
    napi_value result = nullptr;
    napi_create_int32(env, true, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"usbInit", nullptr, UsbInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbRelease", nullptr, UsbRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetDeviceDescriptorOne", nullptr, UsbGetDeviceDescriptorOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbGetDeviceDescriptorTwo", nullptr, UsbGetDeviceDescriptorTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbGetConfigDescriptorOne", nullptr, UsbGetConfigDescriptorOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbGetConfigDescriptorTwo", nullptr, UsbGetConfigDescriptorTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbGetConfigDescriptorThree", nullptr, UsbGetConfigDescriptorThree, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbFreeConfigDescriptor", nullptr, UsbFreeConfigDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbClaimInterfaceOne", nullptr, UsbClaimInterfaceOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbClaimInterfaceTwo", nullptr, UsbClaimInterfaceTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbClaimInterfaceThree", nullptr, UsbClaimInterfaceThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbReleaseInterface", nullptr, UsbReleaseInterface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSelectInterfaceSettingOne", nullptr, UsbSelectInterfaceSettingOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbSelectInterfaceSettingTwo", nullptr, UsbSelectInterfaceSettingTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbGetCurrentInterfaceSettingOne", nullptr, UsbGetCurrentInterfaceSettingOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbGetCurrentInterfaceSettingTwo", nullptr, UsbGetCurrentInterfaceSettingTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbGetCurrentInterfaceSettingThree", nullptr, UsbGetCurrentInterfaceSettingThree, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbSendControlReadRequestOne", nullptr, UsbSendControlReadRequestOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbSendControlReadRequestTwo", nullptr, UsbSendControlReadRequestTwo, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbSendControlReadRequestThree", nullptr, UsbSendControlReadRequestThree, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbSendControlReadRequestFour", nullptr, UsbSendControlReadRequestFour, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbSendControlReadRequestFive", nullptr, UsbSendControlReadRequestFive, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbSendControlWriteRequestOne", nullptr, UsbSendControlWriteRequestOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbSendControlWriteRequestTwo", nullptr, UsbSendControlWriteRequestTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbSendControlWriteRequestThree", nullptr, UsbSendControlWriteRequestThree, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbSendControlWriteRequestFour", nullptr, UsbSendControlWriteRequestFour, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"usbSendPipeRequestOne", nullptr, UsbSendPipeRequestOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSendPipeRequestTwo", nullptr, UsbSendPipeRequestTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSendPipeRequestThree", nullptr, UsbSendPipeRequestThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSendPipeRequestFour", nullptr, UsbSendPipeRequestFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbCreateDeviceMemMapOne", nullptr, UsbCreateDeviceMemMapOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbCreateDeviceMemMapTow", nullptr, UsbCreateDeviceMemMapTow, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"usbDestroyDeviceMemMap", nullptr, UsbDestroyDeviceMemMap, nullptr, nullptr, nullptr, napi_default, nullptr}};

    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libusbddk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
