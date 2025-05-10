/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "native_common.h"
#include "usb/usb_ddk_api.h"
#include "usb/usb_ddk_types.h"
#include "scsi_peripheral/scsi_peripheral_api.h"
#include "scsi_peripheral/scsi_peripheral_types.h"
#include "ddk/ddk_api.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <tuple>
#include <unistd.h>
#include "hilog/log.h"
#include "usb_serial/usb_serial_api.h"
#include <vector>
#include <string>

#define ENDPOINT 0
#define SLEEP 2
#define PARAM_8 8
#define USB_DDK_TEST_BUF_SIZE 100
#define USB_DDK_ENDPOINT_DIR_MASK 0x80
#define USB_DDK_DIR_IN 0x80
#define USB_DDK_ENDPOINT_XFERTYPE_MASK 0x03
#define USB_DDK_ENDPOINT_XFER_INT 0x03
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_10 10
#define PARAM_32 32
#define PARAM_48 48
#define PARM_0 0
#define PARM_1 1
#define USB_SERIAL_TEST_BUF_SIZE 100
static uint8_t configIndex = 0;
static uint8_t interfaceIndex = 0;
static uint64_t interfaceHandle = 0;
static uint8_t settingIndex = 0;
static uint32_t timeout = 1000;
constexpr size_t MAX_USB_DEVICE_NUM = 128;
constexpr size_t DEVICE_MEM_MAP_SIZE = 10 * 1024; // 10K
constexpr size_t DEVICE_MEM_MAP_SIZE_50K = 50 * 1024; // 50K
constexpr size_t DEVICE_MEM_MAP_SIZE_128M = 128 * 1024 * 1024; // 128M
constexpr size_t DEVICE_MEM_MAP_MAX_SIZE = 1024 * 1024 * 10;
const uint64_t SCSI_DDK_INVALID_DEVICE_ID = 0xFFFFFFFFFFFFFFFF;
const uint32_t SIXTEEN_BIT = 16;
const uint32_t THIRTYTWO_BIT = 32;
const uint32_t BUS_NUM_MASK = 0xFFFF0000;
const uint32_t DEVICE_NUM_MASK = 0x0000FFFF;
const uint8_t CONTROL_READY_DATA = 10;
const uint8_t CONTROL_INQUIRY_DATA = 100;
const uint16_t ALLOCATIONLENGTH_DATA = 16;
const uint8_t READ10_DATA = 123;
constexpr uint8_t ONE_BYTE = 1;
constexpr uint8_t TWO_BYTE = 2;
constexpr uint8_t THREE_BYTE = 3;
constexpr uint8_t FOUR_BYTE = 4;
constexpr uint8_t FIVE_BYTE = 5;
constexpr uint8_t SIX_BYTE = 6;
constexpr uint8_t SEVEN_BYTE = 7;
constexpr uint8_t EIGHT_BYTE = 8;
constexpr uint8_t NINE_BYTE = 9;
constexpr uint16_t MAX_MEM_LEN = 256;
constexpr uint32_t TIMEOUT = 5000;
constexpr uint32_t TIMEOUT2 = 20000;
constexpr uint32_t TIMEOUT3 = -10;
constexpr uint8_t CDB_LENGTH_TEN = 10;
constexpr uint8_t TEMP_BUFFER_SIZE = 20;
constexpr uint8_t BASE_10 = 10;
constexpr uint8_t STATUS_MSG_LEN = 100;
constexpr uint8_t INTERFACE_INDEX2 = 5;

struct UsbSerial_Device {
    int32_t fd = -1;
};

static UsbSerial_Device *NewSerialDeviceHandle()
{
    return new UsbSerial_Device;
}

static void DeleteUsbSerialDeviceHandle(UsbSerial_Device **dev)
{
    if (*dev != nullptr) {
        delete *dev;
        *dev = nullptr;
    }
}

struct ScsiPeripheral_Device {
    int32_t devFd = -1;
    int32_t memMapFd = -1;
    int32_t lbLength = 0;
};

static ScsiPeripheral_Device *NewScsiPeripheralDevice()
{
    return new ScsiPeripheral_Device;
}

static void DeleteScsiPeripheralDevice(ScsiPeripheral_Device **dev)
{
    if (*dev != nullptr) {
        delete *dev;
        *dev = nullptr;
    }
}

static uint64_t ConvertDeviceId(uint64_t deviceId64)
{
    int32_t deviceId32 = static_cast<uint32_t>(deviceId64 >> THIRTYTWO_BIT);
    uint32_t busNum = (deviceId32 & BUS_NUM_MASK) >> SIXTEEN_BIT;
    uint32_t deviceNum = deviceId32 & DEVICE_NUM_MASK;
    uint64_t deviceId = ((static_cast<uint64_t>(busNum) << THIRTYTWO_BIT) | deviceNum);

    return deviceId;
}

static uint64_t GetDeviceId(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int64_t tmpDeviceId;
    napi_get_value_int64(env, args[PARAM_0], &tmpDeviceId);
    uint64_t deviceId = ConvertDeviceId(tmpDeviceId);
    return deviceId;
}

static void AppendIntToString(char *buffer, int32_t ret)
{
    char temp[TEMP_BUFFER_SIZE];
    int i = 0;

    int isNegative = (ret < 0);
    if (isNegative) {
        ret = -ret;
    }

    do {
        temp[i++] = '0' + (ret % BASE_10);
        ret /= BASE_10;
    } while (ret > 0);

    if (isNegative) {
        temp[i++] = '-';
    }

    for (int start = 0, end = i - 1; start < end; start++, end--) {
        char t = temp[start];
        temp[start] = temp[end];
        temp[end] = t;
    }

    size_t bufferLen = strlen(buffer);
    for (int j = 0; j < i; j++) {
        buffer[bufferLen + j] = temp[j];
    }
    buffer[bufferLen + i] = '\0';
}

static bool IsInterruptInEndpoint(const UsbEndpointDescriptor &epDesc)
{
    return (((epDesc.bEndpointAddress & USB_DDK_ENDPOINT_DIR_MASK) == USB_DDK_DIR_IN) &&
            ((epDesc.bmAttributes & USB_DDK_ENDPOINT_XFERTYPE_MASK) == USB_DDK_ENDPOINT_XFER_INT));
}

static std::tuple<bool, uint8_t, uint8_t, uint16_t> FindForEachInterface(const UsbDdkInterface &interface)
{
    struct UsbDdkInterfaceDescriptor *intDesc = interface.altsetting;
    uint32_t numSetting = interface.numAltsetting;
    for (uint32_t setIdx = PARAM_0; setIdx < numSetting; ++setIdx) {
        uint32_t numEp = intDesc[setIdx].interfaceDescriptor.bNumEndpoints;
        struct UsbDdkEndpointDescriptor *epDesc = intDesc[setIdx].endPoint;
        for (uint32_t epIdx = PARAM_0; epIdx < numEp; ++epIdx) {
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
    for (uint32_t intIdx = PARAM_0; intIdx < config->configDescriptor.bNumInterfaces; ++intIdx) {
        auto result = FindForEachInterface(config->interface[intIdx]);
        if (std::get<0>(result)) {
            return result;
        }
    }
    return {false, {}, {}, {}};
}

uint64_t JsDeviceIdToNative(uint64_t deviceId)
{
    uint32_t busNum = (uint32_t)(deviceId >> PARAM_48);
    uint32_t devNum = (uint32_t)((deviceId & 0x0000FFFF00000000) >> PARAM_32);
    return (((static_cast<uint64_t>(busNum)) << PARAM_32) | devNum);
}

static bool ParseConfiguration(uint64_t deviceId, std::tuple<bool, uint8_t, uint8_t, uint16_t> &source)
{
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t ret = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
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

static napi_value UsbInit(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Usb_Init();
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbRelease(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, true, &result);
    return result;
}

static napi_value UsbReleaseResource(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    int32_t returnValue = OH_Usb_ReleaseResource();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetDeviceDescriptorOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));

    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetDeviceDescriptorTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetConfigDescriptorOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetConfigDescriptorTwo(napi_env env, napi_callback_info info)
{
    struct UsbDdkConfigDescriptor *config = nullptr;
    uint64_t errorId = PARAM_1;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(errorId, configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetConfigDescriptorThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");

    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbFreeConfigDescriptor(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    NAPI_ASSERT(env, returnValue == PARAM_0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    napi_value result = nullptr;
    napi_create_int32(env, true, &result);
    return result;
}

static napi_value UsbClaimInterfaceOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t returnValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbClaimInterfaceTwo(napi_env env, napi_callback_info info)
{
    uint64_t errorId = PARAM_1;
    int32_t returnValue = OH_Usb_ClaimInterface(errorId, interfaceIndex, &interfaceHandle);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbClaimInterfaceThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t returnValue = OH_Usb_ClaimInterface(deviceId, interface, nullptr);
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbReleaseInterface(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    int32_t returnValue = OH_Usb_ReleaseInterface(interfaceHandle);
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSelectInterfaceSettingOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    int32_t returnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSelectInterfaceSettingTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    int32_t returnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetCurrentInterfaceSettingOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "OH_Usb_ClaimInterface failed");
    int32_t usbSelectInterfaceSettingReturnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    NAPI_ASSERT(env, usbSelectInterfaceSettingReturnValue == PARAM_0, "OH_Usb_SelectInterfaceSetting failed");
    int32_t returnValue = OH_Usb_GetCurrentInterfaceSetting(interfaceHandle, &settingIndex);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetCurrentInterfaceSettingTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "OH_Usb_ClaimInterface failed");
    int32_t usbSelectInterfaceSettingReturnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    NAPI_ASSERT(env, usbSelectInterfaceSettingReturnValue == PARAM_0, "OH_Usb_SelectInterfaceSetting failed");
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    int32_t returnValue = OH_Usb_GetCurrentInterfaceSetting(interfaceHandle, &settingIndex);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetCurrentInterfaceSettingThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    int32_t usbSelectInterfaceSettingReturnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    NAPI_ASSERT(env, usbSelectInterfaceSettingReturnValue == PARAM_0, "Usb_ClaimInterface failed");
    int32_t returnValue = OH_Usb_GetCurrentInterfaceSetting(interfaceHandle, nullptr);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint8_t data[USB_DDK_TEST_BUF_SIZE] = {PARAM_0};
    uint32_t dataLen = USB_DDK_TEST_BUF_SIZE;
    setup.bmRequestType = 0x80;
    setup.bRequest = 0x06;
    setup.wValue = (0x03 << PARAM_8) | 0x01;
    setup.wIndex = 0x409;
    setup.wLength = dataLen;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, &setup, UINT32_MAX, data, &dataLen);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    struct UsbControlRequestSetup setup;
    uint8_t data[USB_DDK_TEST_BUF_SIZE] = {PARAM_0};
    uint32_t dataLen = USB_DDK_TEST_BUF_SIZE;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, &setup, timeout, data, &dataLen);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    uint8_t data[USB_DDK_TEST_BUF_SIZE] = {PARAM_0};
    uint32_t dataLen = USB_DDK_TEST_BUF_SIZE;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, nullptr, timeout, data, &dataLen);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestFour(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint32_t dataLen = PARAM_10;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, &setup, timeout, nullptr, &dataLen);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequestFive(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint8_t data = PARAM_10;
    int32_t returnValue = OH_Usb_SendControlReadRequest(interfaceHandle, &setup, timeout, &data, nullptr);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequestOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup = {PARAM_0};
    uint8_t dataw[USB_DDK_TEST_BUF_SIZE] = {PARAM_0};
    uint32_t dataLen = USB_DDK_TEST_BUF_SIZE;
    setup.bmRequestType = 0x80;
    setup.bRequest = 0x06;
    setup.wValue = (0x03 << PARAM_8) | 0x01;
    setup.wIndex = 0x409;
    setup.wLength = dataLen;
    int32_t returnValueR = OH_Usb_SendControlReadRequest(interfaceHandle, &setup, timeout, dataw, &dataLen);
    NAPI_ASSERT(env, returnValueR == PARAM_0, "OH_Usb_SendControlReadRequest failed");
    struct UsbControlRequestSetup setupW = {PARAM_0};
    setupW.bmRequestType = 0x00;
    setupW.bRequest = 0x09;
    setupW.wValue = (0x03 << PARAM_8) | 0x01;
    setupW.wIndex = 0;
    setupW.wLength = dataLen;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, &setupW, timeout, dataw, dataLen);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequestTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    struct UsbControlRequestSetup setup;
    uint8_t data = PARAM_10;
    uint32_t dataLen = PARAM_10;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, &setup, timeout, &data, dataLen);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequestThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    uint8_t data = PARAM_10;
    uint32_t dataLen = PARAM_10;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, nullptr, timeout, &data, dataLen);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequestFour(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint32_t dataLen = PARAM_10;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, &setup, timeout, nullptr, dataLen);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequestFive(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint8_t data = PARAM_10;
    uint32_t dataLen = PARAM_10;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, &setup, timeout, &data, dataLen);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendPipeRequestOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    uint8_t endpoint1 = std::get<2>(source);
    uint16_t maxPktSize1 = std::get<3>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = maxPktSize1;
    int32_t usbCreateDeviceMemMapReturnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    NAPI_ASSERT(env, usbCreateDeviceMemMapReturnValue == PARAM_0, "OH_Usb_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMemMap != nullptr, "OH_Usb_CreateDeviceMemMap failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = endpoint1;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequest(&pipe, devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendPipeRequestTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == PARAM_0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t usbCreateDeviceMemMapReturnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    NAPI_ASSERT(env, usbCreateDeviceMemMapReturnValue == PARAM_0, "OH_Usb_CreateDeviceMemMap failed");
    OH_Usb_Release();
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = ENDPOINT;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequest(&pipe, devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendPipeRequestThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == PARAM_0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t usbCreateDeviceMemMapReturnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    NAPI_ASSERT(env, usbCreateDeviceMemMapReturnValue == PARAM_0, "OH_Usb_CreateDeviceMemMap failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = ENDPOINT;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequest(nullptr, devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendPipeRequestFour(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == PARAM_0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t usbCreateDeviceMemMapReturnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    NAPI_ASSERT(env, usbCreateDeviceMemMapReturnValue == PARAM_0, "OH_Usb_CreateDeviceMemMap failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = ENDPOINT;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequest(&pipe, nullptr);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbCreateDeviceMemMapOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == PARAM_0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbCreateDeviceMemMapTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == PARAM_0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    size_t bufferLen = PARAM_10;
    int32_t returnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbDestroyDeviceMemMap(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == PARAM_0, "OH_Usb_GetConfigDescriptor failed");
    OH_Usb_FreeConfigDescriptor(config);
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, true, &result);
    return result;
}

static napi_value UsbSendPipeRequestWithAshmemOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    uint8_t endpoint1 = std::get<2>(source);
    uint16_t maxPktSize1 = std::get<3>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    size_t bufferLen = maxPktSize1;
    const uint8_t name[100] = "TestAshmem";
    DDK_Ashmem *ashmem = nullptr;
    int32_t createAshmemValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    NAPI_ASSERT(env, createAshmemValue == PARAM_0, "OH_DDK_CreateAshmem failed");
    const uint8_t ashmemMapType = 0x03;
    int32_t mapAshmemValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    NAPI_ASSERT(env, mapAshmemValue == PARAM_0, "OH_DDK_MapAshmem failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = endpoint1;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(&pipe, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value UsbSendPipeRequestWithAshmemTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    size_t bufferLen = PARAM_10;
    const uint8_t name[100] = "TestAshmem";
    DDK_Ashmem *ashmem = nullptr;
    int32_t createAshmemValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    NAPI_ASSERT(env, createAshmemValue == PARAM_0, "OH_DDK_CreateAshmem failed");
    const uint8_t ashmemMapType = 0x03;
    int32_t mapAshmemValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    NAPI_ASSERT(env, mapAshmemValue == PARAM_0, "OH_DDK_MapAshmem failed");
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(nullptr, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    OH_Usb_Release();
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value UsbSendPipeRequestWithAshmemThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    uint8_t endpoint1 = std::get<2>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = endpoint1;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(&pipe, nullptr);
    int32_t releaseValue = OH_Usb_ReleaseInterface(interfaceHandle);
    NAPI_ASSERT(env, releaseValue == PARAM_0, "OH_Usb_ReleaseInterface failed");
    OH_Usb_Release();
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value UsbSendPipeRequestWithAshmemFour(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = JsDeviceIdToNative(static_cast<uint64_t>(deviceId64));
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t usbGetDeviceDescriptorReturnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    NAPI_ASSERT(env, usbGetDeviceDescriptorReturnValue == PARAM_0, "OH_Usb_GetDeviceDescriptor failed");
    std::tuple<bool, uint8_t, uint8_t, uint16_t> source;
    bool result1 = ParseConfiguration(deviceId, source);
    NAPI_ASSERT(env, result1 == true, "ParseConfiguration failed");
    uint8_t interface = std::get<1>(source);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interface, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    OH_Usb_Release();
    size_t bufferLen = PARAM_10;
    const uint8_t name[100] = "TestAshmem";
    DDK_Ashmem *ashmem = nullptr;
    int32_t createAshmemValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    NAPI_ASSERT(env, createAshmemValue == PARAM_0, "OH_DDK_CreateAshmem failed");
    const uint8_t ashmemMapType = 0x03;
    int32_t mapAshmemValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    NAPI_ASSERT(env, mapAshmemValue == PARAM_0, "OH_DDK_MapAshmem failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = ENDPOINT;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(&pipe, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value UsbGetDevicesOne(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct Usb_DeviceArray deviceArray;
    deviceArray.deviceIds = new uint64_t[MAX_USB_DEVICE_NUM];
    int32_t returnValue = OH_Usb_GetDevices(&deviceArray);
    OH_Usb_Release();
    delete[] deviceArray.deviceIds;
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value UsbGetDevicesTwo(napi_env env, napi_callback_info info)
{
    struct Usb_DeviceArray deviceArray;
    deviceArray.deviceIds = new uint64_t[MAX_USB_DEVICE_NUM];
    int32_t returnValue = OH_Usb_GetDevices(&deviceArray);
    delete[] deviceArray.deviceIds;
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value UsbGetDevicesThree(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    int32_t returnValue = OH_Usb_GetDevices(nullptr);
    OH_Usb_Release();
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value IsScsiDevice(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDeviceId(env, info);
    int32_t ret = OH_ScsiPeripheral_Init();
    ScsiPeripheral_Device *dev = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &dev);
    bool boolRet = ret == SCSIPERIPHERAL_DDK_SUCCESS ? true : false;

    OH_ScsiPeripheral_Close(&dev);
    OH_ScsiPeripheral_Release();
    napi_value result = nullptr;
    napi_status status = napi_get_boolean(env, boolRet, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralInitOne(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralReleaseOne(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_Release failed");

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralReleaseTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    ret = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Release failed");

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralOpenOne(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_Open failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralOpenTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ret = OH_ScsiPeripheral_Open(deviceId, 0, nullptr);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Open failed");

    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralOpenThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(SCSI_DDK_INVALID_DEVICE_ID, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND, "OH_ScsiPeripheral_Open failed");

    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralOpenFour(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralOpenFive(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = 0; // Invalid deviceId
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND, "OH_ScsiPeripheral_Open failed");
    if (ret == SCSIPERIPHERAL_DDK_SUCCESS) {
        OH_ScsiPeripheral_Close(&device);
    }
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralOpenSix(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = UINT64_MAX; // Invalid deviceId
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND, "OH_ScsiPeripheral_Open success");

    if (ret == SCSIPERIPHERAL_DDK_SUCCESS) {
        OH_ScsiPeripheral_Close(&device);
    }

    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralOpenSeven(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    if (ret == SCSIPERIPHERAL_DDK_SUCCESS) {
        OH_ScsiPeripheral_Close(&device);
    }
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralOpenEight(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;

    ret = OH_ScsiPeripheral_Open(deviceId, UINT8_MAX, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND, "OH_ScsiPeripheral_Open success");

    if (ret == SCSIPERIPHERAL_DDK_SUCCESS) {
        OH_ScsiPeripheral_Close(&device);
    }
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralOpenNine(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 1, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND, "OH_ScsiPeripheral_Open failed");

    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralCloseOne(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Close(&device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_Close failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralCloseTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_Device **dev = nullptr;
    ret = OH_ScsiPeripheral_Close(dev);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Close failed");

    ScsiPeripheral_Device *dev2 = nullptr;
    ret = OH_ScsiPeripheral_Close(&dev2);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Close failed");

    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralCloseThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ret = OH_ScsiPeripheral_Close(&device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Close failed");

    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadCapacityOne(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_ReadCapacity10(nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_ReadCapacity10 failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadCapacityTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_Device *dev = nullptr;
    ScsiPeripheral_ReadCapacityRequest req = {0};
    ScsiPeripheral_CapacityInfo capacityInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_ReadCapacity10(dev, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_ReadCapacity10 failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *dev2 = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &dev2);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_ReadCapacityRequest *req2 = nullptr;
    ScsiPeripheral_CapacityInfo capacityInfo2 = {0};
    ScsiPeripheral_Response resp2 = {{0}};
    ret = OH_ScsiPeripheral_ReadCapacity10(dev2, req2, &capacityInfo2, &resp2);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_ReadCapacity10 failed");

    ScsiPeripheral_Device *dev3 = dev2;
    ScsiPeripheral_ReadCapacityRequest req3 = {0};
    ScsiPeripheral_CapacityInfo *capacityInfo3 = nullptr;
    ScsiPeripheral_Response resp3 = {{0}};
    ret = OH_ScsiPeripheral_ReadCapacity10(dev3, &req3, capacityInfo3, &resp3);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_ReadCapacity10 failed");

    ScsiPeripheral_Device *dev4 = dev2;
    ScsiPeripheral_ReadCapacityRequest req4 = {0};
    ScsiPeripheral_CapacityInfo capacityInfo4 = {0};
    ScsiPeripheral_Response *resp4 = nullptr;
    ret = OH_ScsiPeripheral_ReadCapacity10(dev4, &req4, &capacityInfo4, resp4);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_ReadCapacity10 failed");

    OH_ScsiPeripheral_Close(&dev2);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadCapacityThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    const uint32_t timeOut = 2000;
    ScsiPeripheral_ReadCapacityRequest req = {0};
    req.lbAddress = 0;
    req.control = 0;
    req.byte8 = 0;
    req.timeout = timeOut;
    ScsiPeripheral_CapacityInfo capacityInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadCapacityFour(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_ReadCapacityRequest req = {0};
    req.lbAddress = 0;
    ScsiPeripheral_CapacityInfo capacityInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    req.lbAddress = UINT32_MAX;
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    req.lbAddress = CONTROL_INQUIRY_DATA;
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadCapacityFive(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_ReadCapacityRequest req = {0};
    req.control = 0;
    ScsiPeripheral_CapacityInfo capacityInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    req.control = UINT8_MAX;
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    req.control = CONTROL_INQUIRY_DATA;
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadCapacitySix(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_ReadCapacityRequest req = {0};
    req.byte8 = 0;
    ScsiPeripheral_CapacityInfo capacityInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    req.byte8 = UINT8_MAX;
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    req.byte8 = CONTROL_INQUIRY_DATA;
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadCapacitySeven(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_ReadCapacityRequest req = {0};
    req.timeout = UINT32_MAX;
    ScsiPeripheral_CapacityInfo capacityInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    req.timeout = CONTROL_READY_DATA;
    ret = OH_ScsiPeripheral_ReadCapacity10(device, &req, &capacityInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_ReadCapacity10 failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralTestUnitReadyOne(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_Device *device = nullptr;
    ScsiPeripheral_TestUnitReadyRequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_TestUnitReady(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_TestUnitReady failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralTestUnitReadyTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_Device *device = nullptr;
    ScsiPeripheral_TestUnitReadyRequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_TestUnitReady(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_TestUnitReady failed");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ret = OH_ScsiPeripheral_TestUnitReady(dev, nullptr, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_TestUnitReady failed");

    ret = OH_ScsiPeripheral_TestUnitReady(dev, &req, nullptr);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_TestUnitReady failed");

    DeleteScsiPeripheralDevice(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralTestUnitReadyThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_TestUnitReadyRequest req = {0};
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_TestUnitReady(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_TestUnitReady failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralTestUnitReadyFour(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_TestUnitReadyRequest req = {0};
    req.control = 0;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_TestUnitReady(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_TestUnitReady failed");

    req.control = UINT8_MAX;
    ret = OH_ScsiPeripheral_TestUnitReady(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_TestUnitReady failed");

    req.control = CONTROL_READY_DATA;
    ret = OH_ScsiPeripheral_TestUnitReady(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_TestUnitReady failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralTestUnitReadyFive(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_TestUnitReadyRequest req = {0};
    req.timeout = UINT32_MAX;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_TestUnitReady(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_TestUnitReady failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralInquiryOne(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_InquiryRequest req = {0};
    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Inquiry(nullptr, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_Inquiry failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralInquiryTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_Device *dev = nullptr;
    ScsiPeripheral_InquiryRequest req = {0};
    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Inquiry(dev, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Inquiry failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *dev2 = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &dev2);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_InquiryRequest *req2 = nullptr;
    ScsiPeripheral_InquiryInfo inquiryInfo2 = {0};
    ScsiPeripheral_Response resp2 = {{0}};
    ret = OH_ScsiPeripheral_Inquiry(dev2, req2, &inquiryInfo2, &resp2);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Inquiry failed");

    ScsiPeripheral_Device *dev3 = dev2;
    ScsiPeripheral_InquiryRequest req3 = {0};
    ScsiPeripheral_InquiryInfo *inquiryInfo3 = nullptr;
    ScsiPeripheral_Response resp3 = {{0}};
    ret = OH_ScsiPeripheral_Inquiry(dev3, &req3, inquiryInfo3, &resp3);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Inquiry failed");

    ScsiPeripheral_Device *dev4 = dev2;
    ScsiPeripheral_InquiryRequest req4 = {0};
    ScsiPeripheral_InquiryInfo inquiryInfo4 = {0};
    ScsiPeripheral_Response *resp4 = nullptr;
    ret = OH_ScsiPeripheral_Inquiry(dev4, &req4, &inquiryInfo4, resp4);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Inquiry failed");

    OH_ScsiPeripheral_Close(&dev2);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralInquiryThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    ScsiPeripheral_InquiryRequest req = {0};
    req.timeout = TIMEOUT;
    inquiryInfo.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralInquiryFour(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");
    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    ScsiPeripheral_InquiryRequest req = {0};
    req.pageCode = 0;
    req.byte1 = 0;
    inquiryInfo.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    req.pageCode = UINT8_MAX;
    req.byte1 = 0;
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    req.pageCode = 1;
    req.byte1 = 1;
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralInquiryFive(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");
    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_MAX_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    ScsiPeripheral_InquiryRequest req = {0};
    inquiryInfo.data = devMmap;
    req.allocationLength = 0;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    req.allocationLength = UINT16_MAX;
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    req.allocationLength = ALLOCATIONLENGTH_DATA;
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralInquirySix(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");
    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    ScsiPeripheral_InquiryRequest req = {0};
    inquiryInfo.data = devMmap;
    req.control = 0;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    req.control = UINT8_MAX;
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    req.control = CONTROL_INQUIRY_DATA;
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralInquirySeven(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");
    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    ScsiPeripheral_InquiryRequest req = {0};
    inquiryInfo.data = devMmap;
    req.pageCode = TWO_BYTE;
    req.byte1 = 0;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    req.pageCode = 0;
    req.byte1 = UINT8_MAX;
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    req.pageCode = TWO_BYTE;
    req.byte1 = 1;
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralInquiryEight(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");
    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    ScsiPeripheral_InquiryRequest req = {0};
    inquiryInfo.data = devMmap;
    req.timeout = UINT32_MAX;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    req.timeout = CONTROL_READY_DATA;
    ret = OH_ScsiPeripheral_Inquiry(device, &req, &inquiryInfo, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Inquiry failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralRequestSenseOne(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_Device *device = nullptr;
    ScsiPeripheral_RequestSenseRequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_RequestSense failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralRequestSenseTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_RequestSenseRequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_RequestSense(nullptr, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_RequestSense failed");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ret = OH_ScsiPeripheral_RequestSense(dev, nullptr, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_RequestSense failed");

    ret = OH_ScsiPeripheral_RequestSense(dev, &req, nullptr);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_RequestSense failed");

    DeleteScsiPeripheralDevice(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralRequestSenseThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_RequestSenseRequest req = {0};
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralRequestSenseFour(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_RequestSenseRequest req = {0};
    req.allocationLength = 0;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    req.allocationLength = UINT8_MAX;
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    req.allocationLength = ALLOCATIONLENGTH_DATA;
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralRequestSenseFive(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_RequestSenseRequest req = {0};
    req.control = 0;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    req.control = UINT8_MAX;
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    req.control = CONTROL_INQUIRY_DATA;
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralRequestSenseSix(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_RequestSenseRequest req = {0};
    req.byte1 = 0;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    req.byte1 = UINT8_MAX;
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    req.byte1 = 1;
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    req.timeout = CONTROL_READY_DATA;
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    req.timeout = UINT32_MAX;
    ret = OH_ScsiPeripheral_RequestSense(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_RequestSense failed");

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadOne(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_Device *device = nullptr;
    ScsiPeripheral_IORequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_Read10 failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_IORequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Read10(nullptr, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Read10 failed");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ret = OH_ScsiPeripheral_Read10(dev, nullptr, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Read10 failed");

    ret = OH_ScsiPeripheral_Read10(dev, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Read10 failed");

    uint8_t buff;
    ScsiPeripheral_DeviceMemMap devMmap({&buff, sizeof(buff), 0, sizeof(buff), 0});
    req.data = &devMmap;
    ret = OH_ScsiPeripheral_Read10(dev, &req, nullptr);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Read10 failed");

    DeleteScsiPeripheralDevice(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMmap != nullptr, "devMmap is nullptr");
    ScsiPeripheral_IORequest req = {0};

    const uint32_t tmpTimeout = TIMEOUT2;
    req.lbAddress = 1;
    req.transferLength = 1;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadFour(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMmap != nullptr, "devMmap is nullptr");

    ScsiPeripheral_IORequest req = {0};
    req.lbAddress = 0;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    req.lbAddress = UINT32_MAX;
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadFive(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_MAX_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMmap != nullptr, "devMmap is nullptr");

    ScsiPeripheral_IORequest req = {0};
    req.transferLength = 0;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    req.transferLength = UINT16_MAX;
    req.lbAddress = 0;
    req.byte1 = 0;
    req.byte6 = 0;
    req.control = 0;
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_IO_ERROR || ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_Read10 failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadSix(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMmap != nullptr, "devMmap is nullptr");

    ScsiPeripheral_IORequest req = {0};
    req.control = 0;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    req.control = UINT8_MAX;
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    req.control = CONTROL_INQUIRY_DATA;
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadSeven(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMmap != nullptr, "devMmap is nullptr");

    ScsiPeripheral_IORequest req = {0};
    req.byte1 = 0;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    req.byte1 = UINT8_MAX;
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    req.byte1 = READ10_DATA;
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadEight(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMmap != nullptr, "devMmap is nullptr");

    ScsiPeripheral_IORequest req = {0};
    req.byte6 = 0;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    req.byte6 = UINT8_MAX;
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    req.byte6 = READ10_DATA;
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    req.timeout = UINT32_MAX;
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralReadNine(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMmap != nullptr, "devMmap is nullptr");
    ScsiPeripheral_IORequest req = {0};

    const uint32_t tmpTimeout = 10000;
    req.lbAddress = 1;
    req.transferLength = 1;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Read10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Read10 failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralWriteOne(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_Device *device = nullptr;
    ScsiPeripheral_IORequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_Write10 failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralWriteTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_IORequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Write10(nullptr, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Write10 failed");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ret = OH_ScsiPeripheral_Write10(dev, nullptr, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Write10 failed");

    ret = OH_ScsiPeripheral_Write10(dev, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Write10 failed");

    uint8_t buff;
    ScsiPeripheral_DeviceMemMap devMmap({&buff, sizeof(buff), 0, sizeof(buff), 0});
    req.data = &devMmap;
    ret = OH_ScsiPeripheral_Write10(dev, &req, nullptr);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Write10 failed");

    DeleteScsiPeripheralDevice(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralWriteThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    ScsiPeripheral_IORequest req = {0};
    const uint32_t tmpTimeout = TIMEOUT2;
    req.lbAddress = 1;
    req.transferLength = 1;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Write10 failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value WriteBytes1(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 20000;
    req.lbAddress = 0;
    req.transferLength = 1;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytes1 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value WriteBytes2(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 20000;
    req.lbAddress = 1;
    req.transferLength = 1;
    req.control = 0;
    req.byte1 = UINT8_MAX;
    req.byte6 = 0;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytes2 failed ret: ";
    AppendIntToString(statusMsg, ret);

    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value WriteBytes3(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 20000;
    req.lbAddress = 0;
    req.transferLength = 1;
    req.control = 0;
    req.byte1 = 0x13;
    req.byte6 = 0;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytes3 failed ret: ";
    AppendIntToString(statusMsg, ret);

    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value WriteBytes6Check1(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 20000;
    req.lbAddress = 0;
    req.transferLength = 1;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytes6Check1 failed ret: ";
    AppendIntToString(statusMsg, ret);

    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value WriteBytes6Check2(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 20000;
    req.lbAddress = 0;
    req.transferLength = 1;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = UINT8_MAX;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytes6Check2 failed ret: ";
    AppendIntToString(statusMsg, ret);

    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value WriteBytes6Check3(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 10000;
    req.lbAddress = 0;
    req.transferLength = 1;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0x13;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytes6Check3 failed ret: ";
    AppendIntToString(statusMsg, ret);

    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value WriteBytes6Check4(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 10000;
    req.lbAddress = UINT32_MAX;
    req.transferLength = 0x10;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0x13;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytes6Check4 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }

    if ((resp.status != SCSIPERIPHERAL_STATUS_GOOD) && (resp.status != SCSIPERIPHERAL_STATUS_CHECK_CONDITION_NEEDED)) {
        char statusMsg2[STATUS_MSG_LEN] = "WriteBytes6Check4 Status check condition needed, actual status: ";
        AppendIntToString(statusMsg2, resp.status);
        napi_throw_error(env, nullptr, statusMsg2);
        return nullptr;
    }
    return nullptr;
}

static napi_value WriteBytesTrans1(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 10000;
    req.lbAddress = 0;
    req.transferLength = 0;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0x13;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytesTrans1 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static int32_t WriteBytesTrans2(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 10000;
    req.lbAddress = 0;
    req.transferLength = UINT16_MAX;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0x13;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytesTrans2 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if ((ret != SCSIPERIPHERAL_DDK_IO_ERROR) && (ret != SCSIPERIPHERAL_DDK_SUCCESS)) {
        napi_throw_error(env, nullptr, statusMsg);
        return ret;
    }
    return ret;
}

static napi_value WriteBytesTrans3(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 10000;
    req.lbAddress = 0;
    req.transferLength = 0x10;
    req.control = 0;
    req.byte1 = 0;
    req.byte6 = 0x13;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytesTrans3 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value WriteBytesTrans4(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 10000;
    req.lbAddress = 0;
    req.transferLength = 0x10;
    req.control = UINT8_MAX;
    req.byte1 = 0;
    req.byte6 = 0x13;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytesTrans4 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value WriteBytesTrans5(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMmap)
{
    ScsiPeripheral_IORequest req;
    const uint32_t tmpTimeout = 10000;
    const uint32_t control = 100;
    req.lbAddress = 0;
    req.transferLength = 0x10;
    req.control = control;
    req.byte1 = 0;
    req.byte6 = 0x13;
    req.timeout = tmpTimeout;
    req.data = devMmap;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "WriteBytesTrans5 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value ScsiPeripheralWriteFour(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE_50K, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    WriteBytes1(env, device, devMmap);
    WriteBytes2(env, device, devMmap);
    WriteBytes3(env, device, devMmap);
    WriteBytes6Check1(env, device, devMmap);
    WriteBytes6Check2(env, device, devMmap);
    WriteBytes6Check3(env, device, devMmap);
    WriteBytes6Check4(env, device, devMmap);
    WriteBytesTrans1(env, device, devMmap);
    WriteBytesTrans3(env, device, devMmap);
    WriteBytesTrans4(env, device, devMmap);
    WriteBytesTrans5(env, device, devMmap);
    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);

    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static int32_t CheckCDB1(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMemMap)
{
    ScsiPeripheral_Request request;
    request.cdbLength = 0;
    const uint8_t tmpCommand = 28;
    const int32_t tmpDataDirection = 1;
    request.commandDescriptorBlock[0] = tmpCommand;
    request.commandDescriptorBlock[ONE_BYTE] = 0;
    request.commandDescriptorBlock[TWO_BYTE] = 0;
    request.commandDescriptorBlock[THREE_BYTE] = 0;
    request.commandDescriptorBlock[FOUR_BYTE] = 0;
    request.commandDescriptorBlock[FIVE_BYTE] = 0;
    request.commandDescriptorBlock[SIX_BYTE] = 0;
    request.commandDescriptorBlock[SEVEN_BYTE] = 0;
    request.commandDescriptorBlock[EIGHT_BYTE] = 1;
    request.commandDescriptorBlock[NINE_BYTE] = 0;
    request.dataTransferDirection = tmpDataDirection;
    request.timeout = TIMEOUT;
    request.data = devMemMap;
    ScsiPeripheral_Response response = {{0}};
    int32_t ret = OH_ScsiPeripheral_SendRequestByCdb(device, &request, &response);
    char statusMsg[STATUS_MSG_LEN] = "CheckCDB1 failed ret: ";
    AppendIntToString(statusMsg, ret);

    if (ret != SCSIPERIPHERAL_DDK_INVALID_PARAMETER) {
        napi_throw_error(env, nullptr, statusMsg);
        return ret;
    }
    return ret;
}

static napi_value ScsiPeripheralWriteFour1(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    ret = CheckCDB1(env, device, devMmap);

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralWriteFive(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMmap = nullptr;
    OH_ScsiPeripheral_CreateDeviceMemMap(device, DEVICE_MEM_MAP_SIZE_128M, &devMmap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    ret = WriteBytesTrans2(env, device, devMmap);

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMmap);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralVerifyOne(napi_env env, napi_callback_info info)
{
    ScsiPeripheral_Device *device = nullptr;
    ScsiPeripheral_VerifyRequest req;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_Verify10 failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralVerifyTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_VerifyRequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    ret = OH_ScsiPeripheral_Verify10(nullptr, &req, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Verify10 failed");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ret = OH_ScsiPeripheral_Verify10(dev, nullptr, &resp);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Verify10 failed");

    ret = OH_ScsiPeripheral_Verify10(dev, &req, nullptr);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_Verify10 failed");

    DeleteScsiPeripheralDevice(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value Verify0(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);

    char statusMsg[STATUS_MSG_LEN] = "Verify0 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify1(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.lbAddress = 0;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);

    char statusMsg[STATUS_MSG_LEN] = "Verify1 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify2(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.lbAddress = UINT32_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify2 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    if ((resp.status != SCSIPERIPHERAL_STATUS_GOOD) && (resp.status != SCSIPERIPHERAL_STATUS_CHECK_CONDITION_NEEDED)) {
        char statusMsg2[STATUS_MSG_LEN] = "Verify2 Status check condition needed, actual status: ";
        AppendIntToString(statusMsg2, resp.status);
        napi_throw_error(env, nullptr, statusMsg2);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify3(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.verificationLength = 0;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify3 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify4(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.verificationLength = 0;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify4 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify5(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.verificationLength = 0x16;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify5 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify6(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.control = 0;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify6 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify7(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.control = UINT8_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify7 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify8(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.control = 0x64;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify8 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify9(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.byte1 = 0;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify9 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify10(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.byte1 = UINT8_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify10 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify11(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.byte1 = 0x88;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify11 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify12(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.byte6 = 0;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify12 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify13(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.byte6 = UINT8_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify13 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify14(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.byte6 = 0x88;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify14 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify15(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.timeout = UINT32_MAX;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify15 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value Verify16(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.timeout = 0x10;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify16 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_SUCCESS) {
        napi_throw_error(env, nullptr, statusMsg);
        return nullptr;
    }
    return nullptr;
}

static napi_value ScsiPeripheralVerifyThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    Verify0(env, device);
    Verify1(env, device);
    Verify2(env, device);
    Verify3(env, device);
    Verify4(env, device);
    Verify5(env, device);
    Verify6(env, device);
    Verify7(env, device);
    Verify8(env, device);
    Verify9(env, device);
    Verify10(env, device);
    Verify11(env, device);
    Verify12(env, device);
    Verify13(env, device);
    Verify14(env, device);
    Verify15(env, device);
    Verify16(env, device);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, ret, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value ScsiPeripheralSendRequestByCDBOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ScsiPeripheral_Request request = {{0}};
    ScsiPeripheral_Response response = {{0}};
    int32_t ret = OH_ScsiPeripheral_SendRequestByCdb(dev, &request, &response);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INIT_ERROR, "OH_ScsiPeripheral_SendRequestByCdb failed");
    DeleteScsiPeripheralDevice(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralSendRequestByCDBTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_Request request = {{0}};
    ScsiPeripheral_Response response = {{0}};
    ret = OH_ScsiPeripheral_SendRequestByCdb(nullptr, &request, &response);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER, "OH_ScsiPeripheral_SendRequestByCdb failed");

    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralSendRequestByCDBThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *dev = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &dev);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMemMap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(dev, DEVICE_MEM_MAP_SIZE, &devMemMap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ScsiPeripheral_Request request = {{0}};
    request.cdbLength = CDB_LENGTH_TEN;
    const uint8_t tmpCommand = 28;
    const int32_t tmpDataDirection = -3;
    constexpr uint32_t tmpTimeout = 10;
    request.commandDescriptorBlock[0] = tmpCommand;
    request.commandDescriptorBlock[ONE_BYTE] = 0;
    request.commandDescriptorBlock[TWO_BYTE] = 0;
    request.commandDescriptorBlock[THREE_BYTE] = 0;
    request.commandDescriptorBlock[FOUR_BYTE] = 0;
    request.commandDescriptorBlock[FIVE_BYTE] = 0;
    request.commandDescriptorBlock[SIX_BYTE] = 0;
    request.commandDescriptorBlock[SEVEN_BYTE] = 0;
    request.commandDescriptorBlock[EIGHT_BYTE] = 1;
    request.commandDescriptorBlock[NINE_BYTE] = 0;
    request.dataTransferDirection = tmpDataDirection;
    request.timeout = tmpTimeout;
    request.data = devMemMap;
    ScsiPeripheral_Response response = {{0}};
    ret = OH_ScsiPeripheral_SendRequestByCdb(dev, &request, &response);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_SendRequestByCdb failed");

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMemMap);
    OH_ScsiPeripheral_Close(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static int32_t CheckCDB2(napi_env env, ScsiPeripheral_Device *device, ScsiPeripheral_DeviceMemMap *devMemMap)
{
    ScsiPeripheral_Request request = {{0}};
    request.cdbLength = UINT8_MAX;
    const uint8_t tmpCommand = 28;
    const int32_t tmpDataDirection = 2;
    request.commandDescriptorBlock[0] = tmpCommand;
    request.commandDescriptorBlock[ONE_BYTE] = 0;
    request.commandDescriptorBlock[TWO_BYTE] = 0;
    request.commandDescriptorBlock[THREE_BYTE] = 0;
    request.commandDescriptorBlock[FOUR_BYTE] = 0;
    request.commandDescriptorBlock[FIVE_BYTE] = 0;
    request.commandDescriptorBlock[SIX_BYTE] = 0;
    request.commandDescriptorBlock[SEVEN_BYTE] = 0;
    request.commandDescriptorBlock[EIGHT_BYTE] = 1;
    request.commandDescriptorBlock[NINE_BYTE] = 0;
    request.dataTransferDirection = tmpDataDirection;
    request.timeout = TIMEOUT;
    request.data = devMemMap;
    ScsiPeripheral_Response response = {{0}};
    int32_t ret = OH_ScsiPeripheral_SendRequestByCdb(device, &request, &response);
    char statusMsg[STATUS_MSG_LEN] = "CheckCDB2 failed ret: ";
    AppendIntToString(statusMsg, ret);
    if (ret != SCSIPERIPHERAL_DDK_IO_ERROR) {
        napi_throw_error(env, nullptr, statusMsg);
        return ret;
    }
    return ret;
}

static napi_value ScsiPeripheralSendRequestByCDBFour(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *dev = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &dev);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMemMap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(dev, DEVICE_MEM_MAP_SIZE, &devMemMap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ret = CheckCDB1(env, dev, devMemMap);
    ret = CheckCDB2(env, dev, devMemMap);

    OH_ScsiPeripheral_DestroyDeviceMemMap(devMemMap);
    OH_ScsiPeripheral_Close(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralCreateDeviceMemMapOne(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    ScsiPeripheral_DeviceMemMap *devMemMap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(nullptr, DEVICE_MEM_MAP_SIZE, &devMemMap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER,
        "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(dev, DEVICE_MEM_MAP_SIZE, nullptr);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER,
        "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ret = OH_ScsiPeripheral_CreateDeviceMemMap(dev, DEVICE_MEM_MAP_SIZE, &devMemMap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER,
        "OH_ScsiPeripheral_CreateDeviceMemMap failed");
    OH_ScsiPeripheral_DestroyDeviceMemMap(devMemMap);
    DeleteScsiPeripheralDevice(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralCreateDeviceMemMapTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *dev;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &dev);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ScsiPeripheral_DeviceMemMap *devMemMap = nullptr;
    ret = OH_ScsiPeripheral_CreateDeviceMemMap(dev, MAX_MEM_LEN, &devMemMap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ret = OH_ScsiPeripheral_DestroyDeviceMemMap(devMemMap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_DestroyDeviceMemMap failed");
    OH_ScsiPeripheral_Close(&dev);
    ret = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Release failed");

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static int32_t CheckMemory1(napi_env env, ScsiPeripheral_Device *dev)
{
    ScsiPeripheral_DeviceMemMap *devMemMap = nullptr;
    size_t memSize = 0;
    int32_t ret = OH_ScsiPeripheral_CreateDeviceMemMap(dev, memSize, &devMemMap);

    char statusMsg[STATUS_MSG_LEN] = "CheckMemory1 failed ret: ";
    AppendIntToString(statusMsg, ret);
    OH_ScsiPeripheral_DestroyDeviceMemMap(devMemMap);
    if (ret != SCSIPERIPHERAL_DDK_MEMORY_ERROR) {
        napi_throw_error(env, nullptr, statusMsg);
        return ret;
    }

    return ret;
}

static napi_value ScsiPeripheralCreateDeviceMemMapThree(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *dev;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &dev);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Open failed");

    ret = CheckMemory1(env, dev);

    OH_ScsiPeripheral_Close(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralDestroyDeviceMemMapOne(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_DestroyDeviceMemMap(nullptr);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralDestroyDeviceMemMapTwo(napi_env env, napi_callback_info info)
{
    int32_t ret = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS, "OH_ScsiPeripheral_Init failed");

    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *dev = nullptr;
    ret = OH_ScsiPeripheral_Open(deviceId, 0, &dev);

    ScsiPeripheral_DeviceMemMap *devMemMap = nullptr;
    OH_ScsiPeripheral_CreateDeviceMemMap(dev, DEVICE_MEM_MAP_SIZE, &devMemMap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_CreateDeviceMemMap failed");

    ret = OH_ScsiPeripheral_DestroyDeviceMemMap(devMemMap);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_DestroyDeviceMemMap failed");

    OH_ScsiPeripheral_Close(&dev);
    OH_ScsiPeripheral_Release();

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralParseBasicSenseInfoOne(napi_env env, napi_callback_info info)
{
    uint8_t senseData[SCSIPERIPHERAL_MAX_SENSE_DATA_LEN] = {0x00};
    ScsiPeripheral_BasicSenseInfo senseInfo = {0};
    int32_t ret = OH_ScsiPeripheral_ParseBasicSenseInfo(nullptr, sizeof(senseData), &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, 0, &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, sizeof(senseData), nullptr);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    uint8_t tmpLen = 0;
    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, tmpLen, &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    tmpLen = UINT8_MAX;
    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, tmpLen, &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static napi_value ScsiPeripheralParseBasicSenseInfoTwo(napi_env env, napi_callback_info info)
{
    uint8_t senseData[SCSIPERIPHERAL_MAX_SENSE_DATA_LEN] = {0x00};
    senseData[0] = 0x70 | 0x80;
    ScsiPeripheral_BasicSenseInfo senseInfo = {0};
    int32_t ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, sizeof(senseData), &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    senseData[0] = 0x71 | 0x80;
    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, sizeof(senseData), &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    senseData[0] = 0x72;
    senseData[SEVEN_BYTE] = THIRTYTWO_BIT;
    senseData[EIGHT_BYTE] = 0x00;
    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, sizeof(senseData), &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    senseData[0] = 0x73;
    senseData[SEVEN_BYTE] = THIRTYTWO_BIT;
    senseData[EIGHT_BYTE] = 0x00;
    senseData[NINE_BYTE] = 0x0A;
    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, sizeof(senseData), &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    senseData[0] = 0x73;
    senseData[SEVEN_BYTE] = THIRTYTWO_BIT;
    senseData[EIGHT_BYTE] = 0x01;
    senseData[NINE_BYTE] = 0x0A;
    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, sizeof(senseData), &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    senseData[0] = 0x73;
    senseData[SEVEN_BYTE] = THIRTYTWO_BIT;
    senseData[EIGHT_BYTE] = 0x02;
    senseData[NINE_BYTE] = 0x06;
    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, sizeof(senseData), &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    senseData[0] = 0x73;
    senseData[SEVEN_BYTE] = THIRTYTWO_BIT;
    senseData[EIGHT_BYTE] = 0x02;
    senseData[NINE_BYTE] = THIRTYTWO_BIT;
    ret = OH_ScsiPeripheral_ParseBasicSenseInfo(senseData, sizeof(senseData), &senseInfo);
    NAPI_ASSERT(env, ret == SCSIPERIPHERAL_DDK_SUCCESS,
        "OH_ScsiPeripheral_ParseBasicSenseInfo failed");

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, ret, &result));
    return result;
}

static uint64_t GetDevicedId(napi_env env, napi_callback_info info)
{
    size_t argc = PARM_1;
    napi_value args[PARM_1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int64_t tmpDeviceId;
    napi_get_value_int64(env, args[0], &tmpDeviceId);
    uint64_t deviceId = static_cast<uint64_t>(tmpDeviceId);
    return deviceId;
}

static int32_t OpenUsbSerial(uint64_t deviceId, UsbSerial_Device **deviceHandle)
{
    int32_t returnValue = OH_UsbSerial_Open(deviceId, 0, deviceHandle);
    if (returnValue != USB_SERIAL_DDK_SUCCESS) {
        OH_UsbSerial_Close(deviceHandle);
        OH_UsbSerial_Release();
    }
    return returnValue;
}

static napi_value IsUsbSerialDevice(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;

    returnValue = OH_UsbSerial_Open(deviceId, 0, &deviceHandle);
    bool boolRet = returnValue != USB_SERIAL_DDK_DEVICE_NOT_FOUND;
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_get_boolean(env, boolRet, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialOpenOne(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    UsbSerial_Device *deviceHandle = nullptr;
    int32_t returnValue = OH_UsbSerial_Open(deviceId, 0, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_Open failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialOpenTwo(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    returnValue = OH_UsbSerial_Open(deviceId, 0, nullptr);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Open failed");

    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialOpenThree(napi_env env, napi_callback_info info)
{
    napi_status status;
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    uint64_t deviceId = 10001001;
    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_DEVICE_NOT_FOUND, "OH_UsbSerial_Open failed");
    napi_value result = nullptr;
    status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialOpenFour(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_Open(deviceId, 0, &deviceHandle);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialOpenFive(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    interfaceIndex = INTERFACE_INDEX2;
    returnValue = OH_UsbSerial_Open(deviceId, interfaceIndex, &deviceHandle);
    OH_UsbSerial_Release();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_DEVICE_NOT_FOUND, "OH_UsbSerial_Open failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialWriteOne(napi_env env, napi_callback_info info)
{
    napi_status status;
    UsbSerial_Device *deviceHandle = nullptr;
    std::vector<uint8_t> buff = {1, 2, 3, 4, 5, 6};
    uint32_t bytesWritten = 0;

    int32_t returnValue = OH_UsbSerial_Write(deviceHandle, buff.data(), buff.size(), &bytesWritten);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_Write failed");

    napi_value result = nullptr;
    status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialWriteTwo(napi_env env, napi_callback_info info)
{
    napi_status status;
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    std::vector<uint8_t> buff = {1, 2, 3, 4, 5, 6};
    uint32_t bytesWritten = 0;
    returnValue = OH_UsbSerial_Write(deviceHandle, buff.data(), buff.size(), &bytesWritten);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Write failed");

    uint64_t deviceId = GetDevicedId(env, info);
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    returnValue = OH_UsbSerial_Write(deviceHandle, nullptr, buff.size(), &bytesWritten);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Write failed buffer null");

    returnValue = OH_UsbSerial_Write(deviceHandle, buff.data(), 0, &bytesWritten);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Write failed size 0");

    returnValue = OH_UsbSerial_Write(deviceHandle, buff.data(), buff.size(), nullptr);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Write failed bytesWritten null");

    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialWriteThree(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    std::vector<uint8_t> buff = {0x01, 0x03, 0x00, 0x00, 0x00, 0x01, 0x84, 0xA};
    uint32_t bytesWritten = 0;
    returnValue = OH_UsbSerial_Write(deviceHandle, buff.data(), buff.size(), &bytesWritten);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialWriteFour(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    std::vector<uint8_t> buff = {0x01, 0x03, 0x00, 0x00, 0x00, 0x01, 0x84, 0xA};
    uint32_t bytesWritten = 0;
    returnValue = OH_UsbSerial_Write(deviceHandle, buff.data(), buff.size(), &bytesWritten);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialCloseThree(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    returnValue = OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialCloseFour(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    returnValue = OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialReadOne(napi_env env, napi_callback_info info)
{
    napi_status status;
    UsbSerial_Device *deviceHandle = nullptr;
    std::vector<uint8_t> buff(USB_SERIAL_TEST_BUF_SIZE);
    uint32_t bytesRead = 0;

    int32_t returnValue = OH_UsbSerial_Read(deviceHandle, buff.data(), buff.size(), &bytesRead);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_Read failed");

    napi_value result = nullptr;
    status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialReadTwo(napi_env env, napi_callback_info info)
{
    napi_status status;
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    std::vector<uint8_t> buff(USB_SERIAL_TEST_BUF_SIZE);
    uint32_t bytesRead = 0;
    returnValue = OH_UsbSerial_Read(deviceHandle, buff.data(), buff.size(), &bytesRead);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Write failed");

    uint64_t deviceId = GetDevicedId(env, info);
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    returnValue = OH_UsbSerial_Read(deviceHandle, nullptr, buff.size(), &bytesRead);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Write failed");

    returnValue = OH_UsbSerial_Read(deviceHandle, buff.data(), 0, &bytesRead);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Write failed");

    returnValue = OH_UsbSerial_Read(deviceHandle, buff.data(), buff.size(), nullptr);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Write failed");

    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialReadThree(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);

    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    UsbSerial_Params params = {9600, 8, 1, 0};
    returnValue = OH_UsbSerial_SetParams(deviceHandle, &params);

    std::vector<uint8_t> writeBuff = {0x01, 0x03, 0x00, 0x00, 0x00, 0x01, 0x84, 0xA};
    uint32_t bytesWritten = 0;
    returnValue = OH_UsbSerial_Write(deviceHandle, writeBuff.data(), writeBuff.size(), &bytesWritten);

    std::vector<uint8_t> readBuff(USB_SERIAL_TEST_BUF_SIZE);
    uint32_t bytesRead = 0;
    returnValue = OH_UsbSerial_Read(deviceHandle, readBuff.data(), readBuff.size(), &bytesRead);

    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialReadFour(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    std::vector<uint8_t> readBuff(USB_SERIAL_TEST_BUF_SIZE);
    uint32_t bytesRead = 0;
    returnValue = OH_UsbSerial_Read(deviceHandle, readBuff.data(), readBuff.size(), &bytesRead);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetBaudRateOne(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = nullptr;
    uint32_t baudRate = 9600;
    int32_t returnValue = OH_UsbSerial_SetBaudRate(deviceHandle, baudRate);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_SetBaudRate failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetBaudRateTwo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    uint32_t baudRate = 9600;
    returnValue = OH_UsbSerial_SetBaudRate(deviceHandle, baudRate);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_SetBaudRate failed");

    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetBaudRateThree(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    uint32_t baudRate = 9600;
    returnValue = OH_UsbSerial_SetBaudRate(deviceHandle, baudRate);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetBaudRateFour(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    uint32_t baudRate = 9600;
    returnValue = OH_UsbSerial_SetBaudRate(deviceHandle, baudRate);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetParamsOne(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = nullptr;
    UsbSerial_Params params = {9600, 0, 10, 0};
    int32_t returnValue = OH_UsbSerial_SetParams(deviceHandle, &params);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_SetParams failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetParamsTwo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    UsbSerial_Params params = {9600, 0, 10, 0};
    returnValue = OH_UsbSerial_SetParams(deviceHandle, &params);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Init failed");

    uint64_t deviceId = GetDevicedId(env, info);
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    returnValue = OH_UsbSerial_SetParams(deviceHandle, nullptr);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Init failed");
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetParamsThree(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Params params = {9600, 8, 1, 0};
    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    returnValue = OH_UsbSerial_SetParams(deviceHandle, &params);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetParamsFour(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    UsbSerial_Params params = {9600, 8, 1, 0};
    returnValue = OH_UsbSerial_SetParams(deviceHandle, &params);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetTimeoutOne(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = nullptr;
    int32_t returnValue = OH_UsbSerial_SetTimeout(deviceHandle, timeout);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_SetTimeout failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetTimeoutTwo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_SetTimeout(deviceHandle, timeout);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_SetTimeout failed");

    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetTimeoutThree(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    returnValue = OH_UsbSerial_SetTimeout(deviceHandle, timeout);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetTimeoutFour(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    returnValue = OH_UsbSerial_SetTimeout(deviceHandle, timeout);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetTimeoutFive(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    timeout = TIMEOUT3;
    returnValue = OH_UsbSerial_SetTimeout(deviceHandle, timeout);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_SetTimeout failed");
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetFlowControlOne(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = nullptr;
    int32_t returnValue = 0;
    returnValue = OH_UsbSerial_SetFlowControl(deviceHandle, UsbSerial_FlowControl::USB_SERIAL_SOFTWARE_FLOW_CONTROL);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_SetFlowControl failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetFlowControlTwo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_SetFlowControl(deviceHandle, UsbSerial_FlowControl::USB_SERIAL_SOFTWARE_FLOW_CONTROL);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_SetFlowControl failed");

    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetFlowControlThree(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    returnValue = OH_UsbSerial_SetFlowControl(deviceHandle, UsbSerial_FlowControl::USB_SERIAL_SOFTWARE_FLOW_CONTROL);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialSetFlowControlFour(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    returnValue = OH_UsbSerial_SetFlowControl(deviceHandle, UsbSerial_FlowControl::USB_SERIAL_SOFTWARE_FLOW_CONTROL);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushOne(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = nullptr;
    int32_t returnValue = OH_UsbSerial_Flush(deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_Flush failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushTwo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_Flush(deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_Flush failed");

    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushThree(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    returnValue = OH_UsbSerial_Flush(deviceHandle);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushFour(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    returnValue = OH_UsbSerial_Flush(deviceHandle);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushInputOne(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = nullptr;
    int32_t returnValue = OH_UsbSerial_FlushInput(deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_FlushInput failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushInputTwo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_FlushInput(deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_FlushInput failed");

    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushInputThree(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    returnValue = OH_UsbSerial_FlushInput(deviceHandle);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushInputFour(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    returnValue = OH_UsbSerial_FlushInput(deviceHandle);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushOutputOne(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = nullptr;
    int32_t returnValue = OH_UsbSerial_FlushOutput(deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INIT_ERROR, "OH_UsbSerial_FlushOutput failed");

    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushOutputTwo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_FlushOutput(deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER, "OH_UsbSerial_FlushOutput failed");

    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushOutputThree(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = NewSerialDeviceHandle();
    returnValue = OH_UsbSerial_FlushOutput(deviceHandle);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

static napi_value UsbSerialFlushOutputFour(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDevicedId(env, info);
    int32_t returnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Init failed");

    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OpenUsbSerial(deviceId, &deviceHandle);
    NAPI_ASSERT(env, returnValue == USB_SERIAL_DDK_SUCCESS, "OH_UsbSerial_Open failed");

    returnValue = OH_UsbSerial_FlushOutput(deviceHandle);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_status status = napi_create_int32(env, returnValue, &result);
    NAPI_ASSERT(env, status == napi_ok, "napi_create_int32 failed");
    NAPI_CALL(env, status);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"usbInit", nullptr, UsbInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbRelease", nullptr, UsbRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbReleaseResource", nullptr, UsbReleaseResource, nullptr, nullptr, nullptr, napi_default, nullptr},
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
        {"usbFreeConfigDescriptor", nullptr, UsbFreeConfigDescriptor, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"usbClaimInterfaceOne", nullptr, UsbClaimInterfaceOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbClaimInterfaceTwo", nullptr, UsbClaimInterfaceTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbClaimInterfaceThree", nullptr, UsbClaimInterfaceThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbReleaseInterface", nullptr, UsbReleaseInterface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSelectInterfaceSettingOne", nullptr, UsbSelectInterfaceSettingOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSelectInterfaceSettingTwo", nullptr, UsbSelectInterfaceSettingTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbGetCurrentInterfaceSettingOne", nullptr, UsbGetCurrentInterfaceSettingOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbGetCurrentInterfaceSettingTwo", nullptr, UsbGetCurrentInterfaceSettingTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbGetCurrentInterfaceSettingThree", nullptr, UsbGetCurrentInterfaceSettingThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendControlReadRequestOne", nullptr, UsbSendControlReadRequestOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendControlReadRequestTwo", nullptr, UsbSendControlReadRequestTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
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
        {"usbSendControlWriteRequestFive", nullptr, UsbSendControlWriteRequestFive, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendPipeRequestOne", nullptr, UsbSendPipeRequestOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendPipeRequestTwo", nullptr, UsbSendPipeRequestTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendPipeRequestThree", nullptr, UsbSendPipeRequestThree, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"usbSendPipeRequestFour", nullptr, UsbSendPipeRequestFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbCreateDeviceMemMapOne", nullptr, UsbCreateDeviceMemMapOne, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"usbCreateDeviceMemMapTwo", nullptr, UsbCreateDeviceMemMapTwo, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"usbDestroyDeviceMemMap", nullptr, UsbDestroyDeviceMemMap, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendPipeRequestWithAshmemOne", nullptr, UsbSendPipeRequestWithAshmemOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendPipeRequestWithAshmemTwo", nullptr, UsbSendPipeRequestWithAshmemTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendPipeRequestWithAshmemThree", nullptr, UsbSendPipeRequestWithAshmemThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendPipeRequestWithAshmemFour", nullptr, UsbSendPipeRequestWithAshmemFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbGetDevicesOne", nullptr, UsbGetDevicesOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetDevicesTwo", nullptr, UsbGetDevicesTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetDevicesThree", nullptr, UsbGetDevicesThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isScsiDevice", nullptr, IsScsiDevice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralInitOne", nullptr, ScsiPeripheralInitOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReleaseOne", nullptr, ScsiPeripheralReleaseOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReleaseTwo", nullptr, ScsiPeripheralReleaseTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralOpenOne", nullptr, ScsiPeripheralOpenOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralOpenTwo", nullptr, ScsiPeripheralOpenTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralOpenThree", nullptr, ScsiPeripheralOpenThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralOpenFour", nullptr, ScsiPeripheralOpenFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralOpenFive", nullptr, ScsiPeripheralOpenFive, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralOpenSix", nullptr, ScsiPeripheralOpenSix, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralOpenSeven", nullptr, ScsiPeripheralOpenSeven, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralOpenEight", nullptr, ScsiPeripheralOpenEight, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralOpenNine", nullptr, ScsiPeripheralOpenNine, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralCloseOne", nullptr, ScsiPeripheralCloseOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralCloseTwo", nullptr, ScsiPeripheralCloseTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralCloseThree", nullptr, ScsiPeripheralCloseThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReadCapacityOne", nullptr, ScsiPeripheralReadCapacityOne, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"scsiPeripheralReadCapacityTwo", nullptr, ScsiPeripheralReadCapacityTwo, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"scsiPeripheralReadCapacityThree", nullptr, ScsiPeripheralReadCapacityThree, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralReadCapacityFour", nullptr, ScsiPeripheralReadCapacityFour, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralReadCapacityFive", nullptr, ScsiPeripheralReadCapacityFive, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralReadCapacitySix", nullptr, ScsiPeripheralReadCapacitySix, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralReadCapacitySeven", nullptr, ScsiPeripheralReadCapacitySeven, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralTestUnitReadyOne", nullptr, ScsiPeripheralTestUnitReadyOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralTestUnitReadyTwo", nullptr, ScsiPeripheralTestUnitReadyTwo, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralTestUnitReadyThree", nullptr, ScsiPeripheralTestUnitReadyThree, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralTestUnitReadyFour", nullptr, ScsiPeripheralTestUnitReadyFour, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralTestUnitReadyFive", nullptr, ScsiPeripheralTestUnitReadyFive, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralInquiryOne", nullptr, ScsiPeripheralInquiryOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralInquiryTwo", nullptr, ScsiPeripheralInquiryTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralInquiryThree", nullptr, ScsiPeripheralInquiryThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralInquiryFour", nullptr, ScsiPeripheralInquiryFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralInquiryFive", nullptr, ScsiPeripheralInquiryFive, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralInquirySix", nullptr, ScsiPeripheralInquirySix, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralInquirySeven", nullptr, ScsiPeripheralInquirySeven, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralInquiryEight", nullptr, ScsiPeripheralInquiryEight, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralRequestSenseOne", nullptr, ScsiPeripheralRequestSenseOne, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"scsiPeripheralRequestSenseTwo", nullptr, ScsiPeripheralRequestSenseTwo, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"scsiPeripheralRequestSenseThree", nullptr, ScsiPeripheralRequestSenseThree, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"scsiPeripheralRequestSenseFour", nullptr, ScsiPeripheralRequestSenseFour, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"scsiPeripheralRequestSenseFive", nullptr, ScsiPeripheralRequestSenseFive, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"scsiPeripheralRequestSenseSix", nullptr, ScsiPeripheralRequestSenseSix, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"scsiPeripheralReadOne", nullptr, ScsiPeripheralReadOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReadTwo", nullptr, ScsiPeripheralReadTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReadThree", nullptr, ScsiPeripheralReadThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReadFour", nullptr, ScsiPeripheralReadFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReadFive", nullptr, ScsiPeripheralReadFive, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReadSix", nullptr, ScsiPeripheralReadSix, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReadSeven", nullptr, ScsiPeripheralReadSeven, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReadEight", nullptr, ScsiPeripheralReadEight, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralReadNine", nullptr, ScsiPeripheralReadNine, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralWriteOne", nullptr, ScsiPeripheralWriteOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralWriteTwo", nullptr, ScsiPeripheralWriteTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralWriteThree", nullptr, ScsiPeripheralWriteThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralWriteFour", nullptr, ScsiPeripheralWriteFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralWriteFour1", nullptr, ScsiPeripheralWriteFour1, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralWriteFive", nullptr, ScsiPeripheralWriteFive, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralVerifyOne", nullptr, ScsiPeripheralVerifyOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralVerifyTwo", nullptr, ScsiPeripheralVerifyTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralVerifyThree", nullptr, ScsiPeripheralVerifyThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralSendRequestByCDBOne", nullptr, ScsiPeripheralSendRequestByCDBOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralSendRequestByCDBTwo", nullptr, ScsiPeripheralSendRequestByCDBTwo, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralSendRequestByCDBThree", nullptr, ScsiPeripheralSendRequestByCDBThree, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralSendRequestByCDBFour", nullptr, ScsiPeripheralSendRequestByCDBFour, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralCreateDeviceMemMapOne", nullptr, ScsiPeripheralCreateDeviceMemMapOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralCreateDeviceMemMapTwo", nullptr, ScsiPeripheralCreateDeviceMemMapTwo, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralCreateDeviceMemMapThree", nullptr, ScsiPeripheralCreateDeviceMemMapThree, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralDestroyDeviceMemMapOne", nullptr, ScsiPeripheralDestroyDeviceMemMapOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralDestroyDeviceMemMapTwo", nullptr, ScsiPeripheralDestroyDeviceMemMapTwo, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralParseBasicSenseInfoOne", nullptr, ScsiPeripheralParseBasicSenseInfoOne, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralParseBasicSenseInfoTwo", nullptr, ScsiPeripheralParseBasicSenseInfoTwo, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"isUsbSerialDevice", nullptr, IsUsbSerialDevice, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialOpenOne", nullptr, UsbSerialOpenOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialOpenTwo", nullptr, UsbSerialOpenTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialOpenThree", nullptr, UsbSerialOpenThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialOpenFour", nullptr, UsbSerialOpenFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialOpenFive", nullptr, UsbSerialOpenFive, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialCloseThree", nullptr, UsbSerialCloseThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialCloseFour", nullptr, UsbSerialCloseFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialWriteOne", nullptr, UsbSerialWriteOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialWriteTwo", nullptr, UsbSerialWriteTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialWriteThree", nullptr, UsbSerialWriteThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialWriteFour", nullptr, UsbSerialWriteFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialReadOne", nullptr, UsbSerialReadOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialReadTwo", nullptr, UsbSerialReadTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialReadThree", nullptr, UsbSerialReadThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialReadFour", nullptr, UsbSerialReadFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetBaudRateOne", nullptr, UsbSerialSetBaudRateOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetBaudRateTwo", nullptr, UsbSerialSetBaudRateTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetBaudRateThree", nullptr, UsbSerialSetBaudRateThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetBaudRateFour", nullptr, UsbSerialSetBaudRateFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetParamsOne", nullptr, UsbSerialSetParamsOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetParamsTwo", nullptr, UsbSerialSetParamsTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetParamsThree", nullptr, UsbSerialSetParamsThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetParamsFour", nullptr, UsbSerialSetParamsFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetTimeoutOne", nullptr, UsbSerialSetTimeoutOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetTimeoutTwo", nullptr, UsbSerialSetTimeoutTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetTimeoutThree", nullptr, UsbSerialSetTimeoutThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetTimeoutFour", nullptr, UsbSerialSetTimeoutFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetTimeoutFive", nullptr, UsbSerialSetTimeoutFive, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetFlowControlOne", nullptr, UsbSerialSetFlowControlOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetFlowControlTwo", nullptr, UsbSerialSetFlowControlTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetFlowControlThree", nullptr, UsbSerialSetFlowControlThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialSetFlowControlFour", nullptr, UsbSerialSetFlowControlFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushOne", nullptr, UsbSerialFlushOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushTwo", nullptr, UsbSerialFlushTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushThree", nullptr, UsbSerialFlushThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushFour", nullptr, UsbSerialFlushFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushInputOne", nullptr, UsbSerialFlushInputOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushInputTwo", nullptr, UsbSerialFlushInputTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushInputThree", nullptr, UsbSerialFlushInputThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushInputFour", nullptr, UsbSerialFlushInputFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushOutputOne", nullptr, UsbSerialFlushOutputOne, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushOutputTwo", nullptr, UsbSerialFlushOutputTwo, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushOutputThree", nullptr, UsbSerialFlushOutputThree, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSerialFlushOutputFour", nullptr, UsbSerialFlushOutputFour, nullptr, nullptr, nullptr,
            napi_default, nullptr},
    };

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
