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

#include "napi/native_api.h"
#include "native_common.h"
#include <database/preferences/oh_preferences.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <string>
#include <database/preferences/oh_preferences_err_code.h>

static napi_value OHPreferencesIsStorageTypeSupportedError(napi_env env, napi_callback_info info)
{
    bool IsFileExist(const std::string &path);
    OH_PreferencesOption *option = OH_PreferencesOption_Create();
    const char *fileName = "CStorageTypeTest005";
    NAPI_ASSERT(env, OH_PreferencesOption_SetFileName(option, fileName) == PREFERENCES_OK,
                "OH_PreferencesOption_Create is fail.");
    int errCode = OH_Preferences_IsStorageTypeSupported(Preferences_StorageType::PREFERENCES_STORAGE_GSKV, nullptr);
    napi_value result;
    napi_create_int32(env, errCode == PREFERENCES_ERROR_INVALID_PARAM ? 0 : -1, &result);
    (void)OH_PreferencesOption_Destroy(option);
    return result;
}

static napi_value PreferencesStorageXml(napi_env env, napi_callback_info info)
{
    OH_PreferencesOption* option = OH_PreferencesOption_Create();

    OH_PreferencesOption_SetFileName(option, "/demo.xml");
    int stateCode = OH_PreferencesOption_SetStorageType(option, PREFERENCES_STORAGE_XML);
    OH_PreferencesOption_Destroy(option);
    napi_value result;
    napi_create_int32(env, stateCode == PREFERENCES_OK ? 0 : -1, &result);
    return result;
}

static napi_value PreferencesStorageError(napi_env env, napi_callback_info info)
{
    OH_PreferencesOption* option = OH_PreferencesOption_Create();
    
    OH_PreferencesOption_SetFileName(option, "/demo.xml");
    Preferences_StorageType type;
    int stateCode = OH_PreferencesOption_SetStorageType(option, type);
    OH_PreferencesOption_Destroy(option);
    napi_value result;
    napi_create_int32(env, stateCode == PREFERENCES_ERROR_INVALID_PARAM ? 0 : -1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OHPreferencesIsStorageTypeSupportedError", nullptr, OHPreferencesIsStorageTypeSupportedError, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"PreferencesStorageXml", nullptr, PreferencesStorageXml, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PreferencesStorageError", nullptr, PreferencesStorageError, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "preferencestest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }