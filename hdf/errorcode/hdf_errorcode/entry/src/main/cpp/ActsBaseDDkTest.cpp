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
#include "ActsBaseDDkTest.h"
#include "ddk/ddk_api.h"
#include "ddk/ddk_types.h"
#include "hid/hid_ddk_api.h"
#include "hid/hid_ddk_types.h"
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

struct HidDeviceHandle {
    int32_t fd = -1;
    int32_t nonBlock = 0;
};

HidDeviceHandle *NewHidDeviceHandle1()
{
    return new HidDeviceHandle;
}

void DeleteHidDeviceHandle(Hid_DeviceHandle **dev)
{
    if (*dev != nullptr) {
        delete *dev;
        *dev = nullptr;
    }
}

const uint32_t MAX_DEVICE_NUM = 201;
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

void addBaseDDkErrorCodeTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back(
        {"DdkMapAshmemAshmemFd", nullptr, DdkMapAshmemAshmemFd, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemAddress", nullptr, DdkMapAshmemAddress, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemSize", nullptr, DdkMapAshmemSize, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemOffset", nullptr, DdkMapAshmemOffset, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DdkMapAshmemBufferLength", nullptr, DdkMapAshmemBufferLength, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"DdkMapAshmemTransferredLength", nullptr, DdkMapAshmemTransferredLength, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemFailure", nullptr, DdkMapAshmemFailure, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DdkMapAshmemInvalidParameter", nullptr, DdkMapAshmemInvalidParameter, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"DdkMapAshmemInvalidOperation", nullptr, DdkMapAshmemInvalidOperation, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkMapAshmemNullPTR", nullptr, DdkMapAshmemNullPTR, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"DdkUnmapAshmemFailure", nullptr, DdkUnmapAshmemFailure, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"DdkDestroyAshmemFailure", nullptr, DdkDestroyAshmemFailure, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"HidDdkErrCodeNullPtr", nullptr, HidDdkErrCodeNullPtr, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"IsHidDevice1", nullptr, IsHidDevice1, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidDdkErrCodeTimeOut", nullptr, HidDdkErrCodeTimeOut, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidDdkErrCodeInitError", nullptr, HidDdkErrCodeInitError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidDdkErrCodeNotFound", nullptr, HidDdkErrCodeNotFound, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidDdkErrCodeFailure", nullptr, HidDdkErrCodeFailure, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidDdkErrCodeIOError", nullptr, HidDdkErrCodeIOError, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addBaseDDkErrorCodeTest(std::vector<napi_property_descriptor> &descData)
{
    addBaseDDkErrorCodeTest1(descData);
    descData.push_back({"HidDdkErrCodeHidRelAxesArrayHidRelAxes", nullptr, HidDdkErrCodeHidRelAxesArrayHidRelAxes,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidDdkErrCodeHidRelAxesArrayLength", nullptr, HidDdkErrCodeHidRelAxesArrayLength, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"CreateTestDeviceDdkFailure", nullptr, CreateTestDeviceDdkFailure, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"HidEmitEventInvalidParameter", nullptr, HidEmitEventInvalidParameter, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"HidEmitEventInvalidOperation", nullptr, HidEmitEventInvalidOperation, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"HidEmitEventNullPtr", nullptr, HidEmitEventNullPtr, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"HidDestroyDeviceNullPtr", nullptr, HidDestroyDeviceNullPtr, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"HidDestroyDeviceInvalidOperation", nullptr, HidDestroyDeviceInvalidOperation, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
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


static uint64_t ConvertDeviceId1(uint64_t deviceId64)
{
    int32_t deviceId32 = static_cast<uint32_t>(deviceId64 >> THIRTYTWO_BIT);
    uint32_t busNum = (deviceId32 & BUS_NUM_MASK) >> SIXTEEN_BIT;
    uint32_t deviceNum = deviceId32 & DEVICE_NUM_MASK;
    uint64_t deviceId = ((static_cast<uint64_t>(busNum) << THIRTYTWO_BIT) | deviceNum);

    return deviceId;
}

static uint64_t GetDeviceId1(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1];
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int64_t tmpDeviceId;
    napi_get_value_int64(env, args[0], &tmpDeviceId);
    uint64_t deviceId = ConvertDeviceId1(tmpDeviceId);
    return deviceId;
}

napi_value IsHidDevice1(napi_env env, napi_callback_info info)
{
    uint64_t deviceId = GetDeviceId1(env, info);
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

napi_value DdkMapAshmemAshmemFd(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->ashmemFd;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemAddress(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->address = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemSize(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->size;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemOffset(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->offset = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemBufferLength(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->bufferLength = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemTransferredLength(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->transferredLength = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value DdkMapAshmemFailure(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->ashmemFd = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue == DDK_FAILURE ? 0 : 1, &result);
    return result;
}

napi_value DdkMapAshmemInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = PARAM_0;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    napi_create_int32(env, returnValue == DDK_INVALID_PARAMETER ? 0 : 1, &result);
    return result;
}

napi_value DdkMapAshmemInvalidOperation(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_ILLEGAL;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue == DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

napi_value DdkMapAshmemNullPTR(napi_env env, napi_callback_info info)
{
    napi_value result;
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    int32_t returnValue = OH_DDK_MapAshmem(nullptr, ashmemMapType);
    napi_create_int32(env, returnValue == DDK_NULL_PTR ? 0 : 1, &result);
    return result;
}

napi_value DdkUnmapAshmemFailure(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->ashmemFd = 0;
    OH_DDK_MapAshmem(ashmem, ashmemMapType);
    int32_t returnValue = OH_DDK_UnmapAshmem(ashmem);
    napi_create_int32(env, returnValue == DDK_FAILURE ? 0 : 1, &result);
    return result;
}

napi_value DdkDestroyAshmemFailure(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->ashmemFd = 0;
    OH_DDK_MapAshmem(ashmem, ashmemMapType);
    int32_t returnValue = OH_DDK_DestroyAshmem(ashmem);
    napi_create_int32(env, returnValue == DDK_FAILURE ? 0 : 1, &result);
    return result;
}

napi_value HidDdkErrCodeNullPtr(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_Hid_DestroyDevice(-1);
    napi_create_int32(env, returnValue == HID_DDK_NULL_PTR ? 0 : 1, &result);
    return result;
}

napi_value HidDdkErrCodeTimeOut(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId1(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    returnValue = OH_Hid_SetNonBlocking(dev, 1);
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_Read(dev, data, DATA_BUFF_SIZE, &bytesRead);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_TIMEOUT ? 0 : 1, &result);
    return result;
}

napi_value HidDdkErrCodeInitError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_INIT_ERROR ? 0 : 1, &result);
    return result;
}

napi_value HidDdkErrCodeNotFound(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Hid_Init();
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(HID_DDK_INVALID_DEVICE_ID, 0, &dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_DEVICE_NOT_FOUND ? 0 : 1, &result);
    return result;
}

static int32_t CreateTestDeviceFailure(const char* str)
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

napi_value HidDdkErrCodeFailure(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    for (int i = 0; i < MAX_DEVICE_NUM; i++) {
        deviceId = CreateTestDeviceFailure(DEVICE_NAME);
    }
    napi_create_int32(env, deviceId == HID_DDK_FAILURE ? 0 : 1, &result);
    return result;
}

napi_value HidDdkErrCodeIOError(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Hid_Init();
    int64_t deviceId64;
    uint64_t deviceId = ConvertDeviceId1(deviceId64);
    Hid_DeviceHandle *dev;
    int32_t returnValue = OH_Hid_Open(deviceId, 0, &dev);
    uint8_t data[DATA_BUFF_SIZE] = {0};
    uint32_t bytesRead = 0;
    returnValue = OH_Hid_Read(dev, data, DATA_BUFF_SIZE, &bytesRead);
    OH_Hid_Close(&dev);
    OH_Hid_Release();
    napi_create_int32(env, returnValue == HID_DDK_IO_ERROR ? 0 : 1, &result);
    return result;
}

static int32_t CreateTestDeviceHidRelAxesArrayHidRelAxes(const char* str)
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
    std::vector<Hid_RelAxes> relAxes = {HID_REL_X, HID_REL_Y};
    Hid_RelAxesArray  resAxesArray = {
        .hidRelAxes = relAxes.data(),
        .length = (uint16_t)relAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidRelBits = resAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidDdkErrCodeHidRelAxesArrayHidRelAxes(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceHidRelAxesArrayHidRelAxes(DEVICE_NAME);
    OH_Hid_DestroyDevice(deviceId);
    napi_create_int32(env, deviceId == HID_DDK_SUCCESS ? 0 : 1, &result);
    return result;
}

static int32_t CreateTestDeviceHidRelAxesArraylength(const char* str)
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
    std::vector<Hid_RelAxes> relAxes = {HID_REL_X, HID_REL_Y};
    Hid_RelAxesArray  resAxesArray = {
        .hidRelAxes = relAxes.data(),
        .length = (uint16_t)relAxes.size()
    };
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidRelBits = resAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    return OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
}

napi_value HidDdkErrCodeHidRelAxesArrayLength(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceHidRelAxesArraylength(DEVICE_NAME);
    OH_Hid_DestroyDevice(deviceId);
    napi_create_int32(env, deviceId == HID_DDK_SUCCESS ? 0 : 1, &result);
    return result;
}

static int32_t CreateTestDeviceFailure1(const char* str)
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

napi_value CreateTestDeviceDdkFailure(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    for (int i = 0; i < MAX_DEVICE_NUM; i++) {
        deviceId = CreateTestDeviceFailure1(DEVICE_NAME);
    }
    OH_Hid_DestroyDevice(deviceId);
    napi_create_int32(env, deviceId == HID_DDK_FAILURE ? 0 : 1, &result);
    return result;
}


napi_value HidEmitEventInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    Hid_EmitItem event = {
        .type = HID_EV_MSC,
        .code = HID_MSC_SCAN,
        .value = 0x000d0042
    };
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(-1, items.data(), (uint16_t)items.size());
    napi_create_int32(env, returnValue == HID_DDK_INVALID_PARAMETER ? 0 : 1, &result);
    return result;
}

napi_value HidEmitEventInvalidOperation(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDeviceFailure1(DEVICE_NAME);
    Hid_EmitItem event = {
        .type = HID_EV_MSC,
        .code = HID_MSC_SCAN,
        .value = 0x000d0042
    };
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(12, items.data(), (uint16_t)items.size());
    napi_create_int32(env, returnValue == HID_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}

static int32_t CreateTestDevice(const char* str)
{
    return OH_Hid_CreateDevice(nullptr, nullptr);
}

napi_value HidEmitEventNullPtr(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t deviceId = 0;
    deviceId = CreateTestDevice(DEVICE_NAME);
    Hid_EmitItem event = {
        .type = HID_EV_MSC,
        .code = HID_MSC_SCAN,
        .value = 0x000d0042
    };
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_create_int32(env, returnValue == HID_DDK_NULL_PTR ? 0 : 1, &result);
    return result;
}

napi_value HidDestroyDeviceNullPtr(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t devId = -1;
    int32_t returnValue = OH_Hid_DestroyDevice(devId);
    napi_create_int32(env, returnValue == HID_DDK_NULL_PTR ? 0 : 1, &result);
    return result;
}

napi_value HidDestroyDeviceInvalidOperation(napi_env env, napi_callback_info info)
{
    napi_value result;
    const int16_t devId = 200;
    int32_t returnValue = OH_Hid_DestroyDevice(NULL);
    napi_create_int32(env, returnValue == HID_DDK_INVALID_OPERATION ? 0 : 1, &result);
    return result;
}