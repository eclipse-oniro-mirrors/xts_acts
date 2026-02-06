/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include "hilog/log.h"
#include "hitrace/trace.h"

#undef LOG_TAG
#define LOG_TAG "traceTest"

static napi_value HiTraceCppListener(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    int ret;
    if (value0 == 0) {
        int a = value1;
        if (a == -1) {
            ret = OH_HiTrace_RegisterTraceListener(nullptr);
        } else {
            ret = OH_HiTrace_RegisterTraceListener([](bool enable) {
                OH_LOG_INFO(LogType::LOG_APP, "Cpp_c: %{public}d", enable);
            });
        }
        OH_LOG_INFO(LogType::LOG_APP, "OH_HiTrace_RegisterTraceListener end, ret: %{public}d", ret);
    } else {
        int a = value1;
        ret = OH_HiTrace_UnregisterTraceListener(a);
        OH_LOG_INFO(LogType::LOG_APP, "OH_HiTrace_UnregisterTraceListener end, ret: %{public}d", ret);
    }

    napi_value retNapi;
    napi_create_double(env, static_cast<double>(ret), &retNapi);
    OH_LOG_INFO(LogType::LOG_APP, "OH_HiTrace_UnregisterTraceListener end, retNapi: %{public}d", retNapi);

    return retNapi;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "hiTraceCppListener", nullptr, HiTraceCppListener, nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
