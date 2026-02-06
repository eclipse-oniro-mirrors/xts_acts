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
#include "ActsBaseDDkNoPermTest.h"
#include "ddk/ddk_api.h"
#include "ddk/ddk_types.h"
#include "hid/hid_ddk_api.h"
#include "hid/hid_ddk_types.h"
#include "scsi_peripheral/scsi_peripheral_api.h"
#include "scsi_peripheral/scsi_peripheral_types.h"
#include "usb_serial/usb_serial_api.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <unistd.h>
#include <cctype>
#include <vector>

#define BUFF_LENTH 10
#define PARAM_0 0
#define PORT_READ 0x01
#define PORT_WRITE 0x02
#define PORT_ILLEGAL 0x08

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

constexpr const char* DEVICE_NAME = "VSoC_keyboard";
constexpr const char* KEYBOARD_SUFFIX = "keyboard";
const uint32_t PARAM_1 = 1;
const uint64_t HID_DDK_INVALID_DEVICE_ID = 0xFFFFFFFFFFFFFFFF;
const uint32_t DATA_BUFF_SIZE  = 1024;
const uint32_t GET_REPORT_BUFF_SIZE = 9;
const uint32_t INVALID_BUFF_SIZE = HID_MAX_REPORT_BUFFER_SIZE + 1;
const uint32_t READ_TIME_OUT = 10000;
const uint32_t SIXTEEN_BIT = 16;
const uint32_t THIRTYTWO_BIT = 32;
const uint32_t BUS_NUM_MASK = 0xFFFF0000;
const uint32_t DEVICE_NUM_MASK = 0x0000FFFF;
const uint32_t INVALID_NON_BLOCK = 2;

void addBaseDDkErrorCodeNoPermTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"IsHidDevice", nullptr, IsHidDevice, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"CreateTestDeviceDdkNOPERM", nullptr, CreateTestDeviceDdkNOPERM, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"HidEmitEventNOPERM", nullptr, HidEmitEventNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidDestroyDeviceNOPERM", nullptr, HidDestroyDeviceNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidInitNOPERM", nullptr, HidInitNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidReleaseNOPERM", nullptr, HidReleaseNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidOpenNOPERM", nullptr, HidOpenNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidCloseNOPERM", nullptr, HidCloseNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidWriteNOPERM", nullptr, HidWriteNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidReadTimeoutNOPERM", nullptr, HidReadTimeoutNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidReadNOPERM", nullptr, HidReadNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidDdkErrCodeNOPERM", nullptr, HidDdkErrCodeNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidSetNonBlockingNOPERM", nullptr, HidSetNonBlockingNOPERM, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"HidGetRawInfoNOPERM", nullptr, HidGetRawInfoNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidGetRawNameNOPERM", nullptr, HidGetRawNameNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidGetPhysicalAddressNOPERM", nullptr, HidGetPhysicalAddressNOPERM, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"HidGetRawUniqueIdNOPERM", nullptr, HidGetRawUniqueIdNOPERM, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"HidSendReportNOPERM", nullptr, HidSendReportNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidGetReportNOPERM", nullptr, HidGetReportNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidGetReportDescriptorNOPERM", nullptr, HidGetReportDescriptorNOPERM, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbSerialReleaseNOPERM", nullptr, UsbSerialReleaseNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbSerialCloseNOPERM", nullptr, UsbSerialCloseNOPERM, nullptr, nullptr, nullptr, napi_default, nullptr});
}

static bool CompareIgnoreCase(char a, char b)
{
    return std::tolower(a) == std::tolower(b);
}

static bool EndsWithSuffix(char data[], const char* suffix)
{
    size_t dataSize = strlen(data);
    size_t suffixLen = strlen(suffix);
    if (dataSize < suffixLen) {
        return false;
    }
    for (size_t i = 0; i < suffixLen; ++i) {
        if (!CompareIgnoreCase(data[dataSize - suffixLen + i], suffix[i])) {
            return false;
        }
    }
    return true;
}

static bool IsUsbKeyboard(Hid_DeviceHandle *dev)
{
    std::vector<char> buffer(DATA_BUFF_SIZE, 0);
    int32_t ret = OH_Hid_GetRawName(dev, buffer.data(), DATA_BUFF_SIZE);
    if (ret != HID_DDK_SUCCESS) {
        return false;
    }
    return EndsWithSuffix(buffer.data(), KEYBOARD_SUFFIX);
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
    napi_get_value_int64(env, args[0], &tmpDeviceId);
    uint64_t deviceId = ConvertDeviceId(tmpDeviceId);
    return deviceId;
}

napi_value IsHidDevice(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDeviceId(env, info);
    int32_t returnValue = OH_Hid_Init();
    Hid_DeviceHandle *deviceHandle = nullptr;

    returnValue = OH_Hid_Open(deviceId, 0, &deviceHandle);
    bool boolRet = returnValue == HID_DDK_SUCCESS ? true : false;
    OH_Hid_Close(&deviceHandle);
    OH_Hid_Release();
    napi_value result = nullptr;
    napi_status status = napi_get_boolean(env, boolRet, &result);
    return result;
}

static int32_t CreateTestDeviceNOPERM(const char* str)
{
    std::vector<Hid_DeviceProp> deviceProp = { HID_PROP_DIRECT };
    Hid_Device hidDevice = {
        .deviceName = str,
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = { HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC };
    Hid_EventTypeArray eventTypeArray = {
        .hidEventType = eventType.data(),
        .length = (uint16_t)eventType.size()
    };
    std::vector<Hid_KeyCode> keyCode = {
        HID_BTN_TOOL_PEN, HID_BTN_TOOL_RUBBER, HID_BTN_TOUCH, HID_BTN_STYLUS, HID_BTN_RIGHT };
    Hid_KeyCodeArray keyCodeArray = {
        .hidKeyCode = keyCode.data(),
        .length = (uint16_t)keyCode.size()
    };
    std::vector<Hid_MscEvent> mscEvent = { HID_MSC_SCAN };
    Hid_MscEventArray mscEventArray = {
        .hidMscEvent = mscEvent.data(),
        .length = (uint16_t)mscEvent.size()
    };
    std::vector<Hid_AbsAxes> absAxes = { HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE };
    Hid_AbsAxesArray absAxesArray = {
        .hidAbsAxes = absAxes.data(),
        .length = (uint16_t)absAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value CreateTestDeviceDdkNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceNOPERM(DEVICE_NAME);
    napi_create_int32(env, deviceId == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidEmitEventNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceNOPERM(DEVICE_NAME);
    Hid_EmitItem event = {
        .type = HID_EV_MSC,
        .code = HID_MSC_SCAN,
        .value = 0x000d0042
    };
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidDestroyDeviceNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceNOPERM(DEVICE_NAME);
    int32_t returnValue = OH_Hid_DestroyDevice(deviceId);
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidInitNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_Hid_Init();
    returnValue = OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidReleaseNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Hid_Init();
    int32_t returnValue = OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidOpenNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidCloseNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    returnValue = OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidWriteNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    if (IsUsbKeyboard(dev)) {
        uint8_t data[] = {0x00, 0x02};
        uint32_t bytesWritten = 0;
        returnValue = OH_Hid_Write(dev, data, sizeof(data), &bytesWritten);
    }
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidReadTimeoutNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_ReadTimeout(dev, data, DATA_BUFF_SIZE, READ_TIME_OUT, &bytesRead);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidReadNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_Read(dev, data, DATA_BUFF_SIZE, &bytesRead);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidDdkErrCodeNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_Hid_Init();
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidSetNonBlockingNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    returnValue = OH_Hid_SetNonBlocking(dev, 0);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidGetRawInfoNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    struct Hid_RawDevInfo rawDevInfo;
    returnValue = OH_Hid_GetRawInfo(dev, &rawDevInfo);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidGetRawNameNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    char data[DATA_BUFF_SIZE] = {0};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    returnValue = OH_Hid_GetRawName(dev, data, DATA_BUFF_SIZE);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidGetPhysicalAddressNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    char data[DATA_BUFF_SIZE] = {0};
    int32_t hidInitRetVal = OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    returnValue = OH_Hid_GetPhysicalAddress(dev, data, DATA_BUFF_SIZE);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidGetRawUniqueIdNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    uint8_t data[DATA_BUFF_SIZE] = {0};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    returnValue = OH_Hid_GetRawUniqueId(dev, data, DATA_BUFF_SIZE);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidSendReportNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Hid_Init();
    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_SendReport(dev, HID_FEATURE_REPORT, data, DATA_BUFF_SIZE);
    DeleteHidDeviceHandle(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidGetReportNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Hid_Init();
    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_GetReport(dev, HID_FEATURE_REPORT, data, DATA_BUFF_SIZE);
    DeleteHidDeviceHandle(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value HidGetReportDescriptorNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_GetReportDescriptor(dev, data, DATA_BUFF_SIZE, &bytesRead);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_NO_PERM ? 0 : 1, &result);
    return result;
}

napi_value UsbSerialReleaseNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    returnValue = OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_NO_PERM ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialCloseNOPERM(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    OH_UsbSerial_Open(1, 0, &deviceHandle);
    int32_t returnValue = OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_NO_PERM ? 0 : -1, &result);
    return result;
}