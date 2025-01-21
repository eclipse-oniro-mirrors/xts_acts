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
#include "hid_ddk_api.h"
#include "hid_ddk_types.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <tuple>
#include <unistd.h>
#include <vector>

static int32_t deviceId = 0;

static napi_value HidCreateDevice(napi_env env, napi_callback_info info)
{
    std::vector<Hid_DeviceProp> deviceProp = {HID_PROP_DIRECT};
    Hid_Device hidDevice = {
        .deviceName = "VSoC keyboard",
        .vendorId = 0x6006,
        .productId = 0x6006,
        .version = 1,
        .bustype = 3,
        .properties = deviceProp.data(),
        .propLength = (uint16_t)deviceProp.size()
    };

    std::vector<Hid_EventType> eventType = {HID_EV_ABS, HID_EV_KEY, HID_EV_SYN, HID_EV_MSC};
    Hid_EventTypeArray eventTypeArray = {.hidEventType = eventType.data(), .length = (uint16_t)eventType.size()};
    std::vector<Hid_KeyCode> keyCode = {
        HID_BTN_TOOL_PEN, HID_BTN_TOOL_RUBBER, HID_BTN_TOUCH, HID_BTN_STYLUS, HID_BTN_RIGHT};
    Hid_KeyCodeArray keyCodeArray = {.hidKeyCode = keyCode.data(), .length = (uint16_t)keyCode.size()};
    std::vector<Hid_MscEvent> mscEvent = {HID_MSC_SCAN};
    Hid_MscEventArray mscEventArray = {.hidMscEvent = mscEvent.data(), .length = (uint16_t)mscEvent.size()};
    std::vector<Hid_AbsAxes> absAxes = {HID_ABS_X, HID_ABS_Y, HID_ABS_PRESSURE};
    Hid_AbsAxesArray absAxesArray = {.hidAbsAxes = absAxes.data(), .length = (uint16_t)absAxes.size()};
    Hid_EventProperties hidEventProp = {
        .hidEventTypes = eventTypeArray,
        .hidKeys = keyCodeArray,
        .hidAbs = absAxesArray,
        .hidMiscellaneous=mscEventArray
    };

    int32_t returnValue = OH_Hid_CreateDevice(&hidDevice, &hidEventProp);
    deviceId = returnValue;
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}


static napi_value HidEmitEventOne(napi_env env, napi_callback_info info)
{
    Hid_EmitItem event = {.type = HID_EV_MSC, .code = HID_MSC_SCAN, .value = 0x000d0042};
    std::vector<Hid_EmitItem> items;
    items.push_back(event);
    int32_t returnValue = OH_Hid_EmitEvent(deviceId, items.data(), (uint16_t)items.size());
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value HidEmitEventTwo(napi_env env, napi_callback_info info)
{
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

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"hidCreateDevice", nullptr, HidCreateDevice, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidEmitEventOne", nullptr, HidEmitEventOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidEmitEventTwo", nullptr, HidEmitEventTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidEmitEventThree", nullptr, HidEmitEventThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidDestroyDeviceOne", nullptr, HidDestroyDeviceOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidDestroyDeviceTwo", nullptr, HidDestroyDeviceTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"hidDestroyDeviceThree", nullptr, HidDestroyDeviceThree, nullptr, nullptr, nullptr, napi_default, nullptr},
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
