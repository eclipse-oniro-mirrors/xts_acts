/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "BasicServicesKit/ohbattery_info.h"
#include "native_common.h"
#include "hilog/log.h"
#include <string>

static napi_value Add(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "func called");
    size_t argc = 0;
    napi_value args[2] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t value = OH_BatteryInfo_GetCapacity();
    int value2 = OH_BatteryInfo_GetPluggedType();
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "get value = %{public}d, %{public}d", value, value2);
    napi_value ret;
    napi_create_int32(env, value, &ret);
    return ret;
}

static napi_value GetCapacity(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "GetCapacity func called");
    size_t argc = 0;
    napi_value args[2] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t value = OH_BatteryInfo_GetCapacity();
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "get value = %{public}d", value);
    napi_value ret;
    napi_create_int32(env, value, &ret);
    return ret;
}

static napi_value GetPluggedType(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "GetPluggedType func called");
    size_t argc = 0;
    napi_value args[2] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    BatteryInfo_BatteryPluggedType type =  OH_BatteryInfo_GetPluggedType();
    std::string str;
    switch (type) {
        case PLUGGED_TYPE_NONE:
            str = "NONE";
            break;
        case PLUGGED_TYPE_AC:
            str = "AC";
            break;
        case PLUGGED_TYPE_USB:
            str = "USB";
            break;
        case PLUGGED_TYPE_WIRELESS:
            str = "WIRELESS";
            break;
        case PLUGGED_TYPE_BUTT:
            str = "BUTT";
            break;
        default:
            str = "UNKNOWN";
            break;
    }
    napi_value ret;
    napi_create_string_utf8(env, str.c_str(), NAPI_AUTO_LENGTH, &ret);
    return ret;
}

static napi_value CommonEventKeyCapacity(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "CommonEventKeyCapacity func called");
    size_t argc = 0;
    napi_value args[2] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string value = COMMON_EVENT_KEY_CAPACITY;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "get value = %{public}s", value.c_str());
    napi_value ret;
    napi_create_string_utf8(env, value.c_str(), NAPI_AUTO_LENGTH, &ret);
    return ret;
}

static napi_value CommonEventKeyChargeState(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "CommonEventKeyChargeState func called");
    size_t argc = 0;
    napi_value args[2] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string value = COMMON_EVENT_KEY_CHARGE_STATE;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "get value = %{public}s", value.c_str());
    napi_value ret;
    napi_create_string_utf8(env, value.c_str(), NAPI_AUTO_LENGTH, &ret);
    return ret;
}

static napi_value CommonEventKeyPluggedType(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "CommonEventKeyPluggedType func called");
    size_t argc = 0;
    napi_value args[2] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string value = COMMON_EVENT_KEY_PLUGGED_TYPE;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, "testLog", "get value = %{public}s", value.c_str());
    napi_value ret;
    napi_create_string_utf8(env, value.c_str(), NAPI_AUTO_LENGTH, &ret);
    return ret;
}

static napi_value EnumPluggedClassConstructor(napi_env env, napi_callback_info info)
{
    napi_value thisArg = nullptr;
    void* data = nullptr;

    napi_get_cb_info(env, info, nullptr, nullptr, &thisArg, &data);

    napi_value global = nullptr;
    napi_get_global(env, &global);

    return thisArg;
}

static napi_value CreateEnumPluggedType(napi_env env, napi_value exports)
{
    napi_value none = nullptr;
    napi_value ac = nullptr;
    napi_value usb = nullptr;
    napi_value wireless = nullptr;

    napi_create_int32(env, (int32_t)BatteryInfo_BatteryPluggedType::PLUGGED_TYPE_NONE, &none);
    napi_create_int32(env, (int32_t)BatteryInfo_BatteryPluggedType::PLUGGED_TYPE_AC, &ac);
    napi_create_int32(env, (int32_t)BatteryInfo_BatteryPluggedType::PLUGGED_TYPE_USB, &usb);
    napi_create_int32(env, (int32_t)BatteryInfo_BatteryPluggedType::PLUGGED_TYPE_WIRELESS, &wireless);

    napi_property_descriptor desc[] = {
        DECLARE_NAPI_STATIC_PROPERTY("NONE", none),
        DECLARE_NAPI_STATIC_PROPERTY("AC", ac),
        DECLARE_NAPI_STATIC_PROPERTY("USB", usb),
        DECLARE_NAPI_STATIC_PROPERTY("WIRELESS", wireless),
    };

    napi_value result = nullptr;
    napi_define_class(env, "BatteryInfo_BatteryPluggedType", NAPI_AUTO_LENGTH, EnumPluggedClassConstructor, nullptr,
        sizeof(desc) / sizeof(*desc), desc, &result);

    napi_set_named_property(env, exports, "BatteryInfo_BatteryPluggedType", result);

    return exports;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCapacity", nullptr, GetCapacity, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getPluggedType", nullptr, GetPluggedType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonEventKeyCapacity", nullptr, CommonEventKeyCapacity, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"commonEventKeyChargeState", nullptr, CommonEventKeyChargeState, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"commonEventKeyPluggedType", nullptr, CommonEventKeyPluggedType, nullptr, nullptr, nullptr,
         napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);

    CreateEnumPluggedType(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
