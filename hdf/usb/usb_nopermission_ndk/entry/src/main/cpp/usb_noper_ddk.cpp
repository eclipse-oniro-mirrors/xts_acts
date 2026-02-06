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
#include "hid/hid_ddk_api.h"
#include "hid/hid_ddk_types.h"
#include <vector>
#include "usb_serial/usb_serial_api.h"

using namespace std;
#define ENDPOINT 0
#define SLEEP 2
#define PARAM_8 8
#define USB_DDK_TEST_BUF_SIZE 100
#define USB_DDK_ENDPOINT_DIR_MASK 0x80
#define USB_DDK_DIR_IN 0x80
#define USB_DDK_ENDPOINT_XFERTYPE_MASK 0x03
#define USB_DDK_ENDPOINT_XFER_INT 0x03
#define USB_DDK_ERR_NOPERM 201
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_10 10
#define PARAM_32 32
#define PARAM_48 48
static uint8_t configIndex = 0;
static uint8_t interfaceIndex = 0;
static uint64_t interfaceHandle = 0;
static uint8_t settingIndex = 0;
static uint32_t timeout = 1000;
static uint32_t g_timeout = 100;
constexpr size_t MAX_USB_DEVICE_NUM = 128;
const uint32_t CDB_LENGTH = 1;

const uint32_t DATA_BUFF_SIZE  = 1024;
const uint32_t READ_TIME_OUT = 10000;
const uint32_t SIXTEEN_BIT = 16;
const uint32_t THIRTYTWO_BIT = 32;
const uint32_t BUS_NUM_MASK = 0xFFFF0000;
const uint32_t DEVICE_NUM_MASK = 0x0000FFFF;

constexpr uint32_t USB_SERIAL_TEST_BAUDRATE = 9600;
constexpr uint8_t USB_SERIAL_TEST_DATA_BITS = 8;

struct Hid_DeviceHandle {
    int32_t fd = -1;
    int32_t nonBlock = 0;
};

Hid_DeviceHandle *NewHidDeviceHandle()
{
    return new Hid_DeviceHandle;
}

void DeleteHidDeviceHandle(Hid_DeviceHandle **dev)
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
    NAPI_ASSERT(env, usbInitReturnValue == USB_DDK_ERR_NOPERM, "OH_Usb_Init failed, no permission");
    OH_Usb_Release();
    napi_value result = nullptr;
    napi_create_int32(env, USB_DDK_ERR_NOPERM, &result);
    return result;
}

static napi_value UsbReleaseResource(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == USB_DDK_ERR_NOPERM, "OH_Usb_Init failed, no permission");
    int32_t returnValue = OH_Usb_ReleaseResource();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetDeviceDescriptor(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);

    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDeviceDescriptor devDesc;
    int32_t returnValue = OH_Usb_GetDeviceDescriptor(deviceId, &devDesc);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetConfigDescriptor(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t returnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    OH_Usb_FreeConfigDescriptor(config);
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
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
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

static napi_value UsbClaimInterface(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    int32_t returnValue = OH_Usb_ClaimInterface(deviceId, interfaceIndex, &interfaceHandle);
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
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    int32_t returnValue = OH_Usb_ReleaseInterface(interfaceHandle);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSelectInterfaceSetting(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    int32_t returnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbGetCurrentInterfaceSetting(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "OH_Usb_ClaimInterface failed");
    int32_t usbSelectInterfaceSettingReturnValue = OH_Usb_SelectInterfaceSetting(interfaceHandle, settingIndex);
    NAPI_ASSERT(env, usbSelectInterfaceSettingReturnValue == PARAM_0, "OH_Usb_SelectInterfaceSetting failed");
    int32_t returnValue = OH_Usb_GetCurrentInterfaceSetting(interfaceHandle, &settingIndex);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlReadRequest(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interfaceIndex, &interfaceHandle);
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
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSendControlWriteRequest(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == PARAM_0, "OH_Usb_Init failed");
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbControlRequestSetup setup;
    uint8_t data = PARAM_10;
    uint32_t dataLen = PARAM_10;
    int32_t returnValue = OH_Usb_SendControlWriteRequest(interfaceHandle, &setup, timeout, &data, dataLen);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

uint64_t JsDeviceIdToNative(uint64_t deviceId)
{
    uint32_t busNum = (uint32_t)(deviceId >> PARAM_48);
    uint32_t devNum = (uint32_t)((deviceId & 0x0000FFFF00000000) >> PARAM_32);
    return (((static_cast<uint64_t>(busNum)) << PARAM_32) | devNum);
}

static napi_value UsbSendPipeRequest(napi_env env, napi_callback_info info)
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
    auto [result1, interface1, endpoint1, maxPktSize1] = GetEndpointInfo(config);
    OH_Usb_FreeConfigDescriptor(config);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
    struct UsbDeviceMemMap *devMemMap = nullptr;
    size_t bufferLen = PARAM_10;
    int32_t usbCreateDeviceMemMapReturnValue = OH_Usb_CreateDeviceMemMap(deviceId, bufferLen, &devMemMap);
    NAPI_ASSERT(env, usbCreateDeviceMemMapReturnValue == PARAM_0, "OH_Usb_CreateDeviceMemMap failed");
    NAPI_ASSERT(env, devMemMap != nullptr, "OH_Usb_CreateDeviceMemMap failed");
    struct UsbRequestPipe pipe;
    pipe.interfaceHandle = interfaceHandle;
    pipe.endpoint = endpoint1;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequest(&pipe, devMemMap);
    OH_Usb_DestroyDeviceMemMap(devMemMap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbCreateDeviceMemMap(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
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

static napi_value UsbDestroyDeviceMemMap(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int64_t deviceId64;
    napi_get_value_int64(env, args[PARAM_0], &deviceId64);
    uint64_t deviceId = static_cast<uint64_t>(deviceId64);
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

static napi_value UsbSendPipeRequestWithAshmem(napi_env env, napi_callback_info info)
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
    struct UsbDdkConfigDescriptor *config = nullptr;
    int32_t usbGetConfigDescriptorReturnValue = OH_Usb_GetConfigDescriptor(deviceId, configIndex, &config);
    NAPI_ASSERT(env, usbGetConfigDescriptorReturnValue == PARAM_0, "OH_Usb_GetConfigDescriptor failed");
    auto [result1, interface1, endpoint1, maxPktSize1] = GetEndpointInfo(config);
    OH_Usb_FreeConfigDescriptor(config);
    int32_t usbClaimInterfaceValue = OH_Usb_ClaimInterface(deviceId, interfaceIndex, &interfaceHandle);
    NAPI_ASSERT(env, usbClaimInterfaceValue == PARAM_0, "Usb_ClaimInterface failed");
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
    pipe.endpoint = endpoint1;
    pipe.timeout = UINT32_MAX;
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(&pipe, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value UsbGetDevices(napi_env env, napi_callback_info info)
{
    int32_t usbInitReturnValue = OH_Usb_Init();
    NAPI_ASSERT(env, usbInitReturnValue == USB_DDK_NO_PERM, "OH_Usb_Init failed, no permission");
    struct Usb_DeviceArray deviceArray;
    deviceArray.deviceIds = new uint64_t[MAX_USB_DEVICE_NUM];
    int32_t returnValue = OH_Usb_GetDevices(&deviceArray);
    OH_Usb_Release();
    delete[] deviceArray.deviceIds;
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value ScsiPeripheralInit(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ScsiPeripheral_Init();
    int32_t releaseRetVal = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, releaseRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Release failed, no permission");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value ScsiPeripheralRelease(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");
    int32_t returnValue = OH_ScsiPeripheral_Release();
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value ScsiPeripheralOpen(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");
    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    int32_t returnValue = OH_ScsiPeripheral_Open(0, 0, &dev);
    NAPI_ASSERT(env, returnValue == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Open failed, no permission");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_ScsiPeripheral_Close(&dev);
    OH_ScsiPeripheral_Release();
    return result;
}

static napi_value ScsiPeripheralClose(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");
    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    int32_t returnValue = OH_ScsiPeripheral_Open(0, 0, &dev);
    NAPI_ASSERT(env, returnValue == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Open failed, no permission");
    returnValue = OH_ScsiPeripheral_Close(&dev);
    NAPI_ASSERT(env, returnValue == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Close failed, no permission");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_ScsiPeripheral_Release();
    return result;
}

static napi_value ScsiPeripheralTestUnitReady(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ScsiPeripheral_TestUnitReadyRequest request = {0};
    ScsiPeripheral_Response response = {{0}};
    int32_t returnValue = OH_ScsiPeripheral_TestUnitReady(dev, &request, &response);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteScsiPeripheralDevice(&dev);
    int32_t releaseRetVal = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, releaseRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Release failed, no permission");
    return result;
}

static napi_value ScsiPeripheralInquiry(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ScsiPeripheral_InquiryRequest request = {0};
    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    uint8_t buff;
    ScsiPeripheral_DeviceMemMap devMmap({&buff, sizeof(buff), 0, sizeof(buff), 0});
    inquiryInfo.data = &devMmap;
    ScsiPeripheral_Response response = {{0}};
    int32_t returnValue = OH_ScsiPeripheral_Inquiry(dev, &request, &inquiryInfo, &response);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteScsiPeripheralDevice(&dev);
    int32_t releaseRetVal = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, releaseRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Release failed, no permission");
    return result;
}

static napi_value ScsiPeripheralReadCapacity10(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ScsiPeripheral_ReadCapacityRequest request = {0};
    ScsiPeripheral_CapacityInfo capacityInfo = {0};
    ScsiPeripheral_Response response = {{0}};
    int32_t returnValue = OH_ScsiPeripheral_ReadCapacity10(dev, &request, &capacityInfo, &response);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteScsiPeripheralDevice(&dev);
    int32_t releaseRetVal = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, releaseRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Release failed, no permission");
    return result;
}

static napi_value ScsiPeripheralRequestSense(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ScsiPeripheral_RequestSenseRequest request = {0};
    ScsiPeripheral_Response response = {{0}};
    int32_t returnValue = OH_ScsiPeripheral_RequestSense(dev, &request, &response);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteScsiPeripheralDevice(&dev);
    int32_t releaseRetVal = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, releaseRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Release failed, no permission");
    return result;
}

static napi_value ScsiPeripheralRead10(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ScsiPeripheral_IORequest request = {0};
    uint8_t buff;
    ScsiPeripheral_DeviceMemMap devMmap({&buff, sizeof(buff), 0, sizeof(buff), 0});
    request.data = &devMmap;
    ScsiPeripheral_Response response = {{0}};
    int32_t returnValue = OH_ScsiPeripheral_Read10(dev, &request, &response);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteScsiPeripheralDevice(&dev);
    int32_t releaseRetVal = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, releaseRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Release failed, no permission");
    return result;
}

static napi_value ScsiPeripheralWrite10(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ScsiPeripheral_IORequest request = {0};
    uint8_t buff;
    ScsiPeripheral_DeviceMemMap devMmap({&buff, sizeof(buff), 0, sizeof(buff), 0});
    request.data = &devMmap;
    ScsiPeripheral_Response response = {{0}};
    int32_t returnValue = OH_ScsiPeripheral_Write10(dev, &request, &response);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteScsiPeripheralDevice(&dev);
    int32_t releaseRetVal = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, releaseRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Release failed, no permission");
    return result;
}

static napi_value ScsiPeripheralVerify10(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ScsiPeripheral_VerifyRequest request = {0};
    ScsiPeripheral_Response response = {{0}};
    int32_t returnValue = OH_ScsiPeripheral_Verify10(dev, &request, &response);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteScsiPeripheralDevice(&dev);
    int32_t releaseRetVal = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, releaseRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Release failed, no permission");
    return result;
}

static napi_value ScsiPeripheralSendRequestByCDB(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_ScsiPeripheral_Init();
    NAPI_ASSERT(env, initRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Init failed, no permission");

    ScsiPeripheral_Device *dev = NewScsiPeripheralDevice();
    ScsiPeripheral_Request request = {{0}};
    uint8_t buff;
    ScsiPeripheral_DeviceMemMap devMmap({&buff, sizeof(buff), 0, sizeof(buff), 0});
    request.data = &devMmap;
    request.cdbLength = CDB_LENGTH;
    ScsiPeripheral_Response response = {{0}};
    int32_t returnValue = OH_ScsiPeripheral_SendRequestByCdb(dev, &request, &response);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteScsiPeripheralDevice(&dev);
    int32_t releaseRetVal = OH_ScsiPeripheral_Release();
    NAPI_ASSERT(env, releaseRetVal == SCSIPERIPHERAL_DDK_NO_PERM, "OH_ScsiPeripheral_Release failed, no permission");
    return result;
}

static napi_value HidInit(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_Init();
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidRelease(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");
    int32_t returnValue = OH_Hid_Release();
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidOpen(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    int32_t deviceId32 = static_cast<int32_t>(deviceId64 >> THIRTYTWO_BIT);
    uint32_t busNum = ((deviceId32 & BUS_NUM_MASK) >> SIXTEEN_BIT);
    uint32_t deviceNum = deviceId32 & DEVICE_NUM_MASK;
    uint64_t deviceId = (static_cast<uint64_t>(busNum) << THIRTYTWO_BIT) | deviceNum;

    struct Hid_DeviceHandle *dev = nullptr;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    OH_Hid_Close(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidClose(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    int32_t returnValue = OH_Hid_Close(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidWrite(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[] = {0x02, 0x02};
    uint32_t bytesWritten = 0;
    int32_t returnValue = OH_Hid_Write(dev, data, sizeof(data), &bytesWritten);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidReadTimeout(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_Hid_ReadTimeout(dev, data, DATA_BUFF_SIZE, READ_TIME_OUT, &bytesRead);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidRead(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_Hid_Read(dev, data, DATA_BUFF_SIZE, &bytesRead);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidSetNonBlocking(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    int32_t returnValue = OH_Hid_SetNonBlocking(dev, 0);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidGetRawInfo(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    Hid_RawDevInfo rawDevInfo = {0};
    int32_t returnValue = OH_Hid_GetRawInfo(dev, &rawDevInfo);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidGetRawName(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    char data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_GetRawName(dev, data, DATA_BUFF_SIZE);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidGetPhysicalAddress(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    char data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_GetPhysicalAddress(dev, data, DATA_BUFF_SIZE);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidGetRawUniqueId(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_GetRawUniqueId(dev, data, DATA_BUFF_SIZE);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidSendReport(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_SendReport(dev, HID_FEATURE_REPORT, data, DATA_BUFF_SIZE);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidGetReport(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_GetReport(dev, HID_FEATURE_REPORT, data, DATA_BUFF_SIZE);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

static napi_value HidGetReportDescriptor(napi_env env, napi_callback_info info)
{
    int32_t initRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, initRetVal == USB_DDK_NO_PERM, "OH_Hid_Init failed, no permission");

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_Hid_GetReportDescriptor(dev, data, DATA_BUFF_SIZE, &bytesRead);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    DeleteHidDeviceHandle(&dev);
    int32_t releaseRetVal = OH_Hid_Release();
    NAPI_ASSERT(env, releaseRetVal == USB_DDK_NO_PERM, "OH_Hid_Release failed, no permission");
    return result;
}

UsbSerial_Device *InitializeAndCreateDeviceHandle(napi_env env)
{
    int32_t usbSerialInitReturnValue = OH_UsbSerial_Init();
    if (usbSerialInitReturnValue != USB_SERIAL_DDK_NO_PERM) {
        OH_UsbSerial_Release();
    }
    NAPI_ASSERT(env, usbSerialInitReturnValue == USB_SERIAL_DDK_NO_PERM, "OH_UsbSerial_Init, no permission");
    return NewSerialDeviceHandle();
}

static napi_value UsbSerialInit(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_UsbSerial_Init();
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value UsbSerialRelease(napi_env env, napi_callback_info info)
{
    int32_t usbSerialInitReturnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, usbSerialInitReturnValue == USB_SERIAL_DDK_NO_PERM, "OH_UsbSerial_Init, no permission");
    int32_t returnValue = OH_UsbSerial_Release();
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSerialOpen(napi_env env, napi_callback_info info)
{
    int32_t usbSerialInitReturnValue = OH_UsbSerial_Init();
    NAPI_ASSERT(env, usbSerialInitReturnValue == USB_SERIAL_DDK_NO_PERM, "OH_UsbSerial_Init, no permission");
    UsbSerial_Device *deviceHandle = nullptr;
    int32_t returnValue = OH_UsbSerial_Open(0, 0, &deviceHandle);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

static napi_value UsbSerialClose(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    int32_t returnValue = OH_UsbSerial_Close(&deviceHandle);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value UsbSerialRead(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    uint8_t dataBuff[8];
    uint32_t bytesRead;
    int32_t retrunValue = OH_UsbSerial_Read(deviceHandle, dataBuff, sizeof(dataBuff), &bytesRead);
    napi_value result = nullptr;
    napi_create_int32(env, retrunValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

static napi_value UsbSerialWrite(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    uint8_t buff[] = {0x01, 0x03, 0x00, 0x00, 0x00, 0x01, 0x84, 0x0A};
    uint32_t bytesWritten;
    int32_t retrunValue = OH_UsbSerial_Write(deviceHandle, buff, sizeof(buff), &bytesWritten);
    napi_value result = nullptr;
    napi_create_int32(env, retrunValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

static napi_value UsbSerialSetBaudRate(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    uint32_t baudRate = 9600;
    int32_t retrunValue = OH_UsbSerial_SetBaudRate(deviceHandle, baudRate);
    napi_value result = nullptr;
    napi_create_int32(env, retrunValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

static napi_value UsbSerialSetParams(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    UsbSerial_Parity parity = USB_SERIAL_PARITY_ODD;
    UsbSerial_Params serialParams;
    serialParams.baudRate = USB_SERIAL_TEST_BAUDRATE;
    serialParams.nDataBits = USB_SERIAL_TEST_DATA_BITS;
    serialParams.nStopBits = 1;
    serialParams.parity = parity;
    int32_t retrunValue = OH_UsbSerial_SetParams(deviceHandle, &serialParams);
    napi_value result = nullptr;
    napi_create_int32(env, retrunValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

static napi_value UsbSerialSetTimeout(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    timeout = g_timeout;
    int32_t retrunValue = OH_UsbSerial_SetTimeout(deviceHandle, timeout);
    napi_value result = nullptr;
    napi_create_int32(env, retrunValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

static napi_value UsbSerialSetFlowControl(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    UsbSerial_FlowControl flowControl = USB_SERIAL_SOFTWARE_FLOW_CONTROL;
    int32_t retrunValue = OH_UsbSerial_SetFlowControl(deviceHandle, flowControl);
    napi_value result;
    napi_create_int32(env, retrunValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

static napi_value UsbSerialFlush(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    int32_t retrunValue = OH_UsbSerial_Flush(deviceHandle);
    napi_value result;
    napi_create_int32(env, retrunValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

static napi_value UsbSerialFlushInput(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    int32_t retrunValue = OH_UsbSerial_FlushInput(deviceHandle);
    napi_value result;
    napi_create_int32(env, retrunValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

static napi_value UsbSerialFlushOutput(napi_env env, napi_callback_info info)
{
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    int32_t retrunValue = OH_UsbSerial_FlushOutput(deviceHandle);
    napi_value result;
    napi_create_int32(env, retrunValue, &result);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"usbInit", nullptr, UsbInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbRelease", nullptr, UsbRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbReleaseResource", nullptr, UsbReleaseResource, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetDeviceDescriptor", nullptr, UsbGetDeviceDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbGetConfigDescriptor", nullptr, UsbGetConfigDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbFreeConfigDescriptor", nullptr, UsbFreeConfigDescriptor, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"usbClaimInterface", nullptr, UsbClaimInterface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbReleaseInterface", nullptr, UsbReleaseInterface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSelectInterfaceSetting", nullptr, UsbSelectInterfaceSetting, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbGetCurrentInterfaceSetting", nullptr, UsbGetCurrentInterfaceSetting, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendControlReadRequest", nullptr, UsbSendControlReadRequest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendControlWriteRequest", nullptr, UsbSendControlWriteRequest, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbSendPipeRequest", nullptr, UsbSendPipeRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbCreateDeviceMemMap", nullptr, UsbCreateDeviceMemMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbDestroyDeviceMemMap", nullptr, UsbDestroyDeviceMemMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSendPipeRequestWithAshmem", nullptr, UsbSendPipeRequestWithAshmem, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"usbGetDevices", nullptr, UsbGetDevices, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralInit", nullptr, ScsiPeripheralInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralRelease", nullptr, ScsiPeripheralRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralOpen", nullptr, ScsiPeripheralOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralClose", nullptr, ScsiPeripheralClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralTestUnitReady", nullptr, ScsiPeripheralTestUnitReady, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralInquiry", nullptr, ScsiPeripheralInquiry, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralReadCapacity10", nullptr, ScsiPeripheralReadCapacity10, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralRequestSense", nullptr, ScsiPeripheralRequestSense, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"scsiPeripheralRead10", nullptr, ScsiPeripheralRead10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralWrite10", nullptr, ScsiPeripheralWrite10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralVerify10", nullptr, ScsiPeripheralVerify10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"scsiPeripheralSendRequestByCDB", nullptr, ScsiPeripheralSendRequestByCDB, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"hidInit", nullptr, HidInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidRelease", nullptr, HidRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidOpen", nullptr, HidOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidClose", nullptr, HidClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidWrite", nullptr, HidWrite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadTimeout", nullptr, HidReadTimeout, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidRead", nullptr, HidRead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSetNonBlocking", nullptr, HidSetNonBlocking, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawInfo", nullptr, HidGetRawInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawName", nullptr, HidGetRawName, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetPhysicalAddress", nullptr, HidGetPhysicalAddress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawUniqueId", nullptr, HidGetRawUniqueId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSendReport", nullptr, HidSendReport, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReport", nullptr, HidGetReport, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReportDescriptor", nullptr, HidGetReportDescriptor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialInit", nullptr, UsbSerialInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialRelease", nullptr, UsbSerialRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialOpen", nullptr, UsbSerialOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialClose", nullptr, UsbSerialClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialRead", nullptr, UsbSerialRead, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialWrite", nullptr, UsbSerialWrite, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialSetBaudRate", nullptr, UsbSerialSetBaudRate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialSetParams", nullptr, UsbSerialSetParams, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialSetTimeout", nullptr, UsbSerialSetTimeout, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialSetFlowControl", nullptr, UsbSerialSetFlowControl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialFlush", nullptr, UsbSerialFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialFlushInput", nullptr, UsbSerialFlushInput, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"usbSerialFlushOutput", nullptr, UsbSerialFlushOutput, nullptr, nullptr, nullptr, napi_default, nullptr},
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
