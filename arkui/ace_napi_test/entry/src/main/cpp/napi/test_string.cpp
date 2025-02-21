/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

#include "common/native_common.h"
#include "napi/native_api.h"
#include <cstdint>
#include <string>
#include <cstdio>
#include <vector>

static napi_value TestLatin1(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1];
    NAPI_CALL(env, napi_get_cb_info(env, info, &argc, args, NULL, NULL));

    NAPI_ASSERT(env, argc >= 1, "Wrong number of arguments");

    napi_valuetype valuetype;
    NAPI_CALL(env, napi_typeof(env, args[0], &valuetype));

    NAPI_ASSERT(env, valuetype == napi_string,
            "Wrong type of argment. Expects a string.");

    char buffer[128];
    size_t buffer_size = 128;
    size_t copied;

    NAPI_CALL(env,
            napi_get_value_string_latin1(env, args[0], buffer, buffer_size, &copied));

    napi_value output;
    NAPI_CALL(env, napi_create_string_latin1(env, buffer, copied, &output));

    return output;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor properties[] = { DECLARE_NAPI_FUNCTION("TestLatin1", TestLatin1), };

    NAPI_CALL(env, napi_define_properties(env, exports, sizeof(properties) / sizeof(*properties), properties));
    return exports;
}
EXTERN_C_END

static napi_module
demoModule = {
.nm_version = 1,
.nm_flags = 0,
.nm_filename = nullptr,
.nm_register_func = Init,
.nm_modname = "teststring",
.nm_priv = ((void *)0),
.reserved = {
0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
napi_module_register(& demoModule);
}
