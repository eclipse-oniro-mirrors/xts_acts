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
#include "bundle/native_interface_bundle.h"

#include <cstdlib>
#include <js_native_api_types.h>

static napi_value GetMainElementName(napi_env env, napi_callback_info info)
{
    OH_NativeBundle_ElementName elementName = OH_NativeBundle_GetMainElementName();
    napi_value result = nullptr;
    napi_create_object(env, &result);
    napi_value napi_elementName_bundleName;
    napi_create_string_utf8(env, elementName.bundleName, NAPI_AUTO_LENGTH, &napi_elementName_bundleName);
    napi_set_named_property(env, result, "bundleName", napi_elementName_bundleName);

    napi_value napi_elementName_moduleName;
    napi_create_string_utf8(env, elementName.moduleName, NAPI_AUTO_LENGTH, &napi_elementName_moduleName);
    napi_set_named_property(env, result, "moduleName", napi_elementName_moduleName);

    napi_value napi_elementName_abilityName;
    napi_create_string_utf8(env, elementName.abilityName, NAPI_AUTO_LENGTH, &napi_elementName_abilityName);
    napi_set_named_property(env, result, "abilityName", napi_elementName_abilityName);
    free(elementName.bundleName);
    free(elementName.moduleName);
    free(elementName.abilityName);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "getMainElementName", nullptr, GetMainElementName,
            nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libbundlendk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
