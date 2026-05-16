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
#include "hid/hid_ddk_api.h"
#include "hid/hid_ddk_types.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <tuple>
#include <unistd.h>
#include <cctype>
#include <vector>

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
const uint32_t PARAM_0 = 0;
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

static napi_value IsHidDevice(napi_env env, napi_callback_info info)
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
    NAPI_CALL(env, status);
    return result;
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

static int32_t CreateTestDevice(const char* str)
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

static napi_value HidCreateDeviceOne(napi_env env, napi_callback_info info)
{
    int32_t deviceId = 0;
    deviceId = CreateTestDevice(DEVICE_NAME);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, deviceId, &result));
    return result;
}

static napi_value HidCreateDeviceTwo(napi_env env, napi_callback_info info)
{
    int32_t deviceId = 0;
    deviceId = CreateTestDevice(nullptr);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, deviceId, &result));
    return result;
}

static napi_value HidCreateDeviceThree(napi_env env, napi_callback_info info)
{
    int32_t deviceId = 0;
    deviceId = CreateTestDevice("");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, deviceId, &result));
    return result;
}

static napi_value HidEmitEventOne(napi_env env, napi_callback_info info)
{
    int32_t deviceId = 0;
    deviceId = CreateTestDevice(DEVICE_NAME);
    NAPI_ASSERT(env, deviceId >= 0, "OH_Hid_CreateDevice failed");
    Hid_EmitItem event = {
        .type = HID_EV_MSC,
        .code = HID_MSC_SCAN,
        .value = 0x000d0042
    };
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value HidEmitEventTwo(napi_env env, napi_callback_info info)
{
    int32_t deviceId = 0;
    deviceId = CreateTestDevice(DEVICE_NAME);
    NAPI_ASSERT(env, deviceId >= 0, "OH_Hid_CreateDevice failed");
    const uint16_t len = 21;
    std::vector<Hid_EmitItem> items;
    for (uint16_t i = 0; i < len; ++i) {
        Hid_EmitItem item = {1, 0x14a, 108};
        items.push_back(item);
    }
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value HidEmitEventThree(napi_env env, napi_callback_info info)
{
    int32_t deviceId = 0;
    deviceId = CreateTestDevice(DEVICE_NAME);
    NAPI_ASSERT(env, deviceId >= 0, "OH_Hid_CreateDevice failed");
    const uint16_t len = 20;
    std::vector<Hid_EmitItem> items;
    for (uint16_t i = 0; i < len; ++i) {
        Hid_EmitItem item = {1, 0x14a, 108};
        items.push_back(item);
    }
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value HidDestroyDeviceOne(napi_env env, napi_callback_info info)
{
    int32_t deviceId = 0;
    deviceId = CreateTestDevice(DEVICE_NAME);
    NAPI_ASSERT(env, deviceId >= 0, "OH_Hid_CreateDevice failed");
    int32_t returnValue = OH_Hid_DestroyDevice(deviceId);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value HidDestroyDeviceTwo(napi_env env, napi_callback_info info)
{
    int32_t devId = -1;
    int32_t returnValue = OH_Hid_DestroyDevice(devId);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value HidDestroyDeviceThree(napi_env env, napi_callback_info info)
{
    const int16_t devId = 200;
    int32_t returnValue = OH_Hid_DestroyDevice(devId);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value HidInitOne(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_Init();
    returnValue = OH_Hid_Release();
    NAPI_ASSERT(env, returnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReleaseOne(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Hid_Release();
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReleaseTwo(napi_env env, napi_callback_info info)
{
    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");
    int32_t returnValue = OH_Hid_Release();
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidOpenOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t initReturnValue = OH_Hid_Init();
    NAPI_ASSERT(env, initReturnValue == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidOpenTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidOpenThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t initReturnValue = OH_Hid_Init();
    NAPI_ASSERT(env, initReturnValue == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);

    int32_t returnValue = OH_Hid_Open(deviceId, 0, nullptr);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidOpenFour(napi_env env, napi_callback_info info)
{
    int32_t initReturnValue = OH_Hid_Init();
    NAPI_ASSERT(env, initReturnValue == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(HID_DDK_INVALID_DEVICE_ID, 0, &dev);

    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidCloseOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    int32_t returnValue = OH_Hid_Close(&dev);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidCloseTwo(napi_env env, napi_callback_info info)
{
    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int32_t returnValue = OH_Hid_Close(nullptr);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidCloseThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    returnValue = OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidWriteOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[] = {0x02, 0x02};
    uint32_t bytesWritten = 0;
    int32_t returnValue = OH_Hid_Write(dev, data, sizeof(data), &bytesWritten);
    DeleteHidDeviceHandle(&dev);

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidWriteTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[] = {0x02, 0x02};
    uint32_t bytesWritten = 0;
    returnValue = OH_Hid_Write(nullptr, data, sizeof(data), &bytesWritten);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Write failed");

    returnValue = OH_Hid_Write(dev, nullptr, sizeof(data), &bytesWritten);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Write failed");

    returnValue = OH_Hid_Write(dev, data, 0, &bytesWritten);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Write failed");

    returnValue = OH_Hid_Write(dev, data, INVALID_BUFF_SIZE, &bytesWritten);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Write failed");

    returnValue = OH_Hid_Write(dev, data, sizeof(data), nullptr);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Write failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidWriteThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    if (IsUsbKeyboard(dev)) {
        uint8_t data[] = {0x00, 0x02};
        uint32_t bytesWritten = 0;
        returnValue = OH_Hid_Write(dev, data, sizeof(data), &bytesWritten);
    }

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReadTimeoutOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_Hid_ReadTimeout(dev, data, DATA_BUFF_SIZE, 1000, &bytesRead);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReadTimeoutTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_ReadTimeout(nullptr, data, DATA_BUFF_SIZE, READ_TIME_OUT, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_ReadTimeout failed");

    returnValue = OH_Hid_ReadTimeout(dev, nullptr, DATA_BUFF_SIZE, READ_TIME_OUT, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_ReadTimeout failed");

    returnValue = OH_Hid_ReadTimeout(dev, data, 0, READ_TIME_OUT, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_ReadTimeout failed");

    returnValue = OH_Hid_ReadTimeout(dev, data, INVALID_BUFF_SIZE, READ_TIME_OUT, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_ReadTimeout failed");

    returnValue = OH_Hid_ReadTimeout(dev, data, DATA_BUFF_SIZE, READ_TIME_OUT, nullptr);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_ReadTimeout failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReadTimeoutThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_ReadTimeout(dev, data, DATA_BUFF_SIZE, READ_TIME_OUT, &bytesRead);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReadTimeoutFour(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_ReadTimeout(dev, data, DATA_BUFF_SIZE, 0, &bytesRead);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReadOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_Hid_Read(dev, data, DATA_BUFF_SIZE, &bytesRead);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReadTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_Read(nullptr, data, DATA_BUFF_SIZE, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Read failed");

    returnValue = OH_Hid_Read(dev, nullptr, DATA_BUFF_SIZE, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Read failed");

    returnValue = OH_Hid_Read(dev, data, 0, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Read failed");

    returnValue = OH_Hid_Read(dev, data, INVALID_BUFF_SIZE, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Read failed");

    returnValue = OH_Hid_Read(dev, data, DATA_BUFF_SIZE, nullptr);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_Read failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReadThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_Read(dev, data, DATA_BUFF_SIZE, &bytesRead);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidReadFour(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    returnValue = OH_Hid_SetNonBlocking(dev, 1);

    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_Read(dev, data, DATA_BUFF_SIZE, &bytesRead);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidSetNonBlockingOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    int32_t returnValue = OH_Hid_SetNonBlocking(dev, 0);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidSetNonBlockingTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    returnValue = OH_Hid_SetNonBlocking(nullptr, 0);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_SetNonBlocking failed");

    returnValue = OH_Hid_SetNonBlocking(dev, INVALID_NON_BLOCK);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_SetNonBlocking failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidSetNonBlockingThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    returnValue = OH_Hid_SetNonBlocking(dev, 0);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetRawInfoOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    struct Hid_RawDevInfo rawDevInfo;
    int32_t returnValue = OH_Hid_GetRawInfo(dev, &rawDevInfo);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetRawInfoTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    struct Hid_RawDevInfo rawDevInfo;
    returnValue = OH_Hid_GetRawInfo(nullptr, &rawDevInfo);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawInfo failed");

    returnValue = OH_Hid_GetRawInfo(dev, nullptr);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawInfo failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetRawInfoThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    struct Hid_RawDevInfo rawDevInfo;
    returnValue = OH_Hid_GetRawInfo(dev, &rawDevInfo);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetRawNameOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    char data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_GetRawName(dev, data, DATA_BUFF_SIZE);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetRawNameTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    char data[DATA_BUFF_SIZE] = {0};
    returnValue = OH_Hid_GetRawName(nullptr, data, DATA_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawName failed");

    returnValue = OH_Hid_GetRawName(dev, nullptr, DATA_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawName failed");

    returnValue = OH_Hid_GetRawName(dev, data, 0);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawName failed");

    returnValue = OH_Hid_GetRawName(dev, data, INVALID_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawName failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetRawNameThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    char data[DATA_BUFF_SIZE] = {0};

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    returnValue = OH_Hid_GetRawName(dev, data, DATA_BUFF_SIZE);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetPhysicalAddressOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    char data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_GetPhysicalAddress(dev, data, DATA_BUFF_SIZE);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetPhysicalAddressTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    char data[DATA_BUFF_SIZE] = {0};
    returnValue = OH_Hid_GetPhysicalAddress(nullptr, data, DATA_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetPhysicalAddress failed");

    returnValue = OH_Hid_GetPhysicalAddress(dev, nullptr, DATA_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetPhysicalAddress failed");

    returnValue = OH_Hid_GetPhysicalAddress(dev, data, 0);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetPhysicalAddress failed");

    returnValue = OH_Hid_GetPhysicalAddress(dev, data, INVALID_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetPhysicalAddress failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetPhysicalAddressThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    char data[DATA_BUFF_SIZE] = {0};

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    returnValue = OH_Hid_GetPhysicalAddress(dev, data, DATA_BUFF_SIZE);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetRawUniqueIdOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_GetRawUniqueId(dev, data, DATA_BUFF_SIZE);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetRawUniqueIdTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[DATA_BUFF_SIZE] = {0};
    returnValue = OH_Hid_GetRawUniqueId(nullptr, data, DATA_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawUniqueId failed");

    returnValue = OH_Hid_GetRawUniqueId(dev, nullptr, DATA_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawUniqueId failed");

    returnValue = OH_Hid_GetRawUniqueId(dev, data, 0);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawUniqueId failed");

    returnValue = OH_Hid_GetRawUniqueId(dev, data, INVALID_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetRawUniqueId failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetRawUniqueIdThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));
    uint8_t data[DATA_BUFF_SIZE] = {0};

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    returnValue = OH_Hid_GetRawUniqueId(dev, data, DATA_BUFF_SIZE);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidSendReportOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[] = {0x02, 0x02};
    int32_t returnValue = OH_Hid_SendReport(dev, HID_OUTPUT_REPORT, data, sizeof(data));
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidSendReportTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[] = {0x02, 0x02};
    returnValue = OH_Hid_SendReport(nullptr, HID_OUTPUT_REPORT, data, sizeof(data));
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_SendReport failed");

    returnValue = OH_Hid_SendReport(dev, HID_OUTPUT_REPORT, nullptr, sizeof(data));
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_SendReport failed");

    returnValue = OH_Hid_SendReport(dev, HID_OUTPUT_REPORT, data, 0);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_SendReport failed");

    returnValue = OH_Hid_SendReport(dev, HID_OUTPUT_REPORT, data, INVALID_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_SendReport failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidSendReportThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 1, &dev);

    uint8_t data[] = {0x02, 0x02};
    returnValue = OH_Hid_SendReport(dev, HID_FEATURE_REPORT, data, sizeof(data));
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidSendReportFour(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 1, &dev);

    uint8_t data[] = {0x02, 0x02};
    returnValue = OH_Hid_SendReport(dev, HID_INPUT_REPORT, data, sizeof(data));
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidSendReportFive(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    if (IsUsbKeyboard(dev)) {
        uint8_t data[] = {0x00, 0x02};
        returnValue = OH_Hid_SendReport(dev, HID_OUTPUT_REPORT, data, sizeof(data));
        if (returnValue == HID_DDK_INVALID_OPERATION) {
            returnValue = HID_DDK_SUCCESS;
        }
    }

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetReportOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[GET_REPORT_BUFF_SIZE] = {0};
    int32_t returnValue = OH_Hid_GetReport(dev, HID_OUTPUT_REPORT, data, GET_REPORT_BUFF_SIZE);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetReportTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[GET_REPORT_BUFF_SIZE] = {0};
    returnValue = OH_Hid_GetReport(nullptr, HID_OUTPUT_REPORT, data, GET_REPORT_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetReport failed");

    returnValue = OH_Hid_GetReport(dev, HID_OUTPUT_REPORT, nullptr, GET_REPORT_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetReport failed");

    returnValue = OH_Hid_GetReport(dev, HID_OUTPUT_REPORT, data, 0);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetReport failed");

    returnValue = OH_Hid_GetReport(dev, HID_OUTPUT_REPORT, data, INVALID_BUFF_SIZE);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetReport failed");

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetReportThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 1, &dev);

    uint8_t data[GET_REPORT_BUFF_SIZE] = {0};
    returnValue = OH_Hid_GetReport(dev, HID_OUTPUT_REPORT, data, GET_REPORT_BUFF_SIZE);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetReportFour(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    if (IsUsbKeyboard(dev)) {
        uint8_t data[GET_REPORT_BUFF_SIZE] = {0};
        returnValue = OH_Hid_GetReport(dev, HID_INPUT_REPORT, data, GET_REPORT_BUFF_SIZE);
        if (returnValue == HID_DDK_INVALID_OPERATION) {
            returnValue = HID_DDK_SUCCESS;
        }
    }

    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetReportFive(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 1, &dev);

    uint8_t data[GET_REPORT_BUFF_SIZE] = {0};

    returnValue = OH_Hid_GetReport(dev, HID_FEATURE_REPORT, data, GET_REPORT_BUFF_SIZE);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetReportDescriptorOne(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    Hid_DeviceHandle *dev = NewHidDeviceHandle();
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    int32_t returnValue = OH_Hid_GetReportDescriptor(dev, data, DATA_BUFF_SIZE, &bytesRead);
    DeleteHidDeviceHandle(&dev);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value HidGetReportDescriptorTwo(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_GetReportDescriptor(nullptr, data, DATA_BUFF_SIZE, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetReport failed");

    returnValue = OH_Hid_GetReportDescriptor(dev, nullptr, DATA_BUFF_SIZE, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetReport failed");

    returnValue = OH_Hid_GetReportDescriptor(dev, data, 0, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetReport failed");

    returnValue = OH_Hid_GetReportDescriptor(dev, data, INVALID_BUFF_SIZE, &bytesRead);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetReport failed");

    returnValue = OH_Hid_GetReportDescriptor(dev, data, DATA_BUFF_SIZE, nullptr);
    NAPI_ASSERT(env, returnValue == HID_DDK_INVALID_PARAMETER, "OH_Hid_GetReport failed");
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}


static napi_value HidGetReportDescriptorThree(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, nullptr, nullptr));

    int32_t hidInitRetVal = OH_Hid_Init();
    NAPI_ASSERT(env, hidInitRetVal == HID_DDK_SUCCESS, "OH_Hid_Init failed");

    int64_t deviceId64;
    NAPI_CALL(env, napi_get_value_int64(env, args[PARAM_0], &deviceId64));
    uint64_t deviceId = ConvertDeviceId(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);

    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_GetReportDescriptor(dev, data, DATA_BUFF_SIZE, &bytesRead);
    OH_Hid_Close(&dev);
    int32_t releaseReturnValue = OH_Hid_Release();
    NAPI_ASSERT(env, releaseReturnValue == HID_DDK_SUCCESS, "OH_Hid_Release failed");
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"hidCreateDeviceOne", nullptr, HidCreateDeviceOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidCreateDeviceTwo", nullptr, HidCreateDeviceTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidCreateDeviceThree", nullptr, HidCreateDeviceThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidEmitEventOne", nullptr, HidEmitEventOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidEmitEventTwo", nullptr, HidEmitEventTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidEmitEventThree", nullptr, HidEmitEventThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidDestroyDeviceOne", nullptr, HidDestroyDeviceOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidDestroyDeviceTwo", nullptr, HidDestroyDeviceTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidDestroyDeviceThree", nullptr, HidDestroyDeviceThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isHidDevice", nullptr, IsHidDevice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidInitOne", nullptr, HidInitOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReleaseOne", nullptr, HidReleaseOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReleaseTwo", nullptr, HidReleaseTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidOpenOne", nullptr, HidOpenOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidOpenTwo", nullptr, HidOpenTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidOpenThree", nullptr, HidOpenThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidOpenFour", nullptr, HidOpenFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidCloseOne", nullptr, HidCloseOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidCloseTwo", nullptr, HidCloseTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidCloseThree", nullptr, HidCloseThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidWriteOne", nullptr, HidWriteOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidWriteTwo", nullptr, HidWriteTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidWriteThree", nullptr, HidWriteThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadTimeoutOne", nullptr, HidReadTimeoutOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadTimeoutTwo", nullptr, HidReadTimeoutTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadTimeoutThree", nullptr, HidReadTimeoutThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadTimeoutFour", nullptr, HidReadTimeoutFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadOne", nullptr, HidReadOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadTwo", nullptr, HidReadTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadThree", nullptr, HidReadThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidReadFour", nullptr, HidReadFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSetNonBlockingOne", nullptr, HidSetNonBlockingOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSetNonBlockingTwo", nullptr, HidSetNonBlockingTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSetNonBlockingThree", nullptr, HidSetNonBlockingThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawInfoOne", nullptr, HidGetRawInfoOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawInfoTwo", nullptr, HidGetRawInfoTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawInfoThree", nullptr, HidGetRawInfoThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawNameOne", nullptr, HidGetRawNameOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawNameTwo", nullptr, HidGetRawNameTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawNameThree", nullptr, HidGetRawNameThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetPhysicalAddressOne", nullptr, HidGetPhysicalAddressOne, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"hidGetPhysicalAddressTwo", nullptr, HidGetPhysicalAddressTwo, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"hidGetPhysicalAddressThree", nullptr, HidGetPhysicalAddressThree, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"hidGetRawUniqueIdOne", nullptr, HidGetRawUniqueIdOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawUniqueIdTwo", nullptr, HidGetRawUniqueIdTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetRawUniqueIdThree", nullptr, HidGetRawUniqueIdThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSendReportOne", nullptr, HidSendReportOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSendReportTwo", nullptr, HidSendReportTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSendReportThree", nullptr, HidSendReportThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSendReportFour", nullptr, HidSendReportFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidSendReportFive", nullptr, HidSendReportFive, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReportOne", nullptr, HidGetReportOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReportTwo", nullptr, HidGetReportTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReportThree", nullptr, HidGetReportThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReportFour", nullptr, HidGetReportFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReportFive", nullptr, HidGetReportFive, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidGetReportDescriptorOne", nullptr, HidGetReportDescriptorOne, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"hidGetReportDescriptorTwo", nullptr, HidGetReportDescriptorTwo, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"hidGetReportDescriptorThree", nullptr, HidGetReportDescriptorThree, nullptr, nullptr, nullptr, napi_default,
            nullptr},
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
    .nm_modname = "libhidemiteventndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
