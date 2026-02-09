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
#include "huks_api_test.h"
#include "huks_error_test.h"

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"huksNativeApi22Err0100", nullptr, OHHuksNativeApi22Err0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"huksNativeApi22Err0200", nullptr, OHHuksNativeApi22Err0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"huksNativeApi22Err0300", nullptr, OHHuksNativeApi22Err0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"huksNativeApi22Err0400", nullptr, OHHuksNativeApi22Err0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"huksNativeApi22Err0500", nullptr, OHHuksNativeApi22Err0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"huksNativeApi22Err0600", nullptr, OHHuksNativeApi22Err0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"huksNativeApi22Type0100", nullptr, OHHuksNativeApi22Type0100, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"huksNativeApi22Type0200", nullptr, OHHuksNativeApi22Type0200, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"huksNativeApi22Utils0100", nullptr, OHHuksNativeApi22Utils0100, nullptr, nullptr, nullptr, napi_default,
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
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
