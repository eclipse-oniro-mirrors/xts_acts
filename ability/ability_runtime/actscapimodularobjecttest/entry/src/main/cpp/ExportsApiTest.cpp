/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include "ActsCapiModularObjectTest.h"
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>

napi_property_descriptor desc[] = {
    {"ModularObject_0100", nullptr, ModularObject_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_0200", nullptr, ModularObject_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_0300", nullptr, ModularObject_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_0400", nullptr, ModularObject_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_0500", nullptr, ModularObject_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_0600", nullptr, ModularObject_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_0700", nullptr, ModularObject_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_0800", nullptr, ModularObject_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_0900", nullptr, ModularObject_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1000", nullptr, ModularObject_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1100", nullptr, ModularObject_1100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1200", nullptr, ModularObject_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1300", nullptr, ModularObject_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1400", nullptr, ModularObject_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1500", nullptr, ModularObject_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1600", nullptr, ModularObject_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1700", nullptr, ModularObject_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1800", nullptr, ModularObject_1800, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_1900", nullptr, ModularObject_1900, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_2000", nullptr, ModularObject_2000, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_2100", nullptr, ModularObject_2100, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_2200", nullptr, ModularObject_2200, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_2300", nullptr, ModularObject_2300, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_2400", nullptr, ModularObject_2400, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ModularObject_2500", nullptr, ModularObject_2500, nullptr, nullptr, nullptr, napi_default, nullptr}
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
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

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }