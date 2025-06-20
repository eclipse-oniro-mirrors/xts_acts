/**
 * * Copyright (c) 2024 Huawei Device Co., Ltd.
 * * Licensed under the Apache License, Version 2.0 (the "License");
 * * you may not use this file except in compliance with the License.
 * * You may obtain a copy of the License at
 * *
 * *
 * http://www.apache.org/licenses/LICENSE-2.0
 * *
 * * Unless required by applicable law or agreed to in writing, software
 * * distributed under the License is distributed on an "AS IS" BASIS,
 * * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * * See the License for the specific language governing permissions and
 * * limitations under the License.
 * */

#include "hilog/log.h"
#include "napi/native_api.h"
#include "string"
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_interface.h"


char *GetStringValue(napi_env env, napi_value value)
{
    size_t size = 0;
    napi_get_value_string_utf8(env, value, nullptr, 0, &size);
    char *paramValue = new (std::nothrow) char[size + 1];
    size_t paramLength = 0;
    napi_get_value_string_utf8(env, value, paramValue, size + 1, &paramLength);
    return paramValue;
}

bool GetBoolValue(napi_env env, napi_value value)
{
    bool result;
    napi_get_value_bool(env, value, &result);
    return result;
}

static napi_value SetConfigCookieSync(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *url = GetStringValue(env, args[0]);
    OH_LOG_INFO(LOG_APP,  "SetConfigCookieSync url: %{public}s", url);

    char *cookieValue = GetStringValue(env, args[1]);
    OH_LOG_INFO(LOG_APP,  "SetConfigCookieSync cookieValue: %{public}s", cookieValue);

    bool incognito = GetBoolValue(env, args[2]);
    OH_LOG_INFO(LOG_APP,  "SetConfigCookieSync incognito: %{public}d", incognito);

    bool includeHttpOnly = GetBoolValue(env, args[3]);
    OH_LOG_INFO(LOG_APP,  "SetConfigCookieSync includeHttpOnly: %{public}d", includeHttpOnly);

    static ArkWeb_CookieManagerAPI *cookieManager = nullptr;
    cookieManager = reinterpret_cast<ArkWeb_CookieManagerAPI *>(OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_COOKIE_MANAGER));
    cookieManager->clearAllCookiesSync(incognito);

    ArkWeb_ErrorCode resultCode = cookieManager->configCookieSync(url, cookieValue, incognito, includeHttpOnly);
    OH_LOG_INFO(LOG_APP,  "SetConfigCookieSync configCookieSync resultCode: %{public}d", resultCode);

    napi_value result;
    napi_create_int32(env, resultCode, &result);
    return result;
}


static napi_value GetFetchCookieSync(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *url = GetStringValue(env, args[0]);
    OH_LOG_INFO(LOG_APP,  "GetFetchCookieSync url: %{public}s", url);

    bool incognito = GetBoolValue(env, args[1]);
    OH_LOG_INFO(LOG_APP,  "GetFetchCookieSync incognito: %{public}d", incognito);

    bool includeHttpOnly = GetBoolValue(env, args[2]);
    OH_LOG_INFO(LOG_APP,  "GetFetchCookieSync includeHttpOnly: %{public}d", includeHttpOnly);

    static ArkWeb_CookieManagerAPI *cookieManager = nullptr;
    cookieManager = reinterpret_cast<ArkWeb_CookieManagerAPI *>(OH_ArkWeb_GetNativeAPI(ARKWEB_NATIVE_COOKIE_MANAGER));

    char *cookieValue;
    ArkWeb_ErrorCode resultCode = cookieManager->fetchCookieSync(url, incognito, includeHttpOnly, &cookieValue);
    OH_LOG_INFO(LOG_APP,  "fetchCookieSync resultCode: %{public}d, cookieValue: %{public}s", resultCode, cookieValue);

    napi_value resultValue;
    napi_create_string_utf8(env, cookieValue, NAPI_AUTO_LENGTH, &resultValue);

    cookieManager->clearAllCookiesSync(incognito);
    OH_LOG_INFO(LOG_APP,  "GetFetchCookieSync clearAllCookiesSync success");

    return resultValue;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setConfigCookieSync", nullptr, SetConfigCookieSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getFetchCookieSync", nullptr, GetFetchCookieSync, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }