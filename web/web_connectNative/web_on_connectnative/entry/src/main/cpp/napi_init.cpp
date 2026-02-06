/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include <hilog/log.h>
#include <unistd.h>
#include <errno.h>

#undef LOG_TAG
#define LOG_TAG "webNativeMessagingPip"

static napi_value CreatePipe(napi_env env, napi_callback_info info)
{
    int fd[2] = {};
    if (pipe(fd) != 0) {
        OH_LOG_ERROR(LOG_APP, "create pipe failed, errno = %{public}d", errno);
        napi_throw_error(env, "401", "create pipe failed");
        return nullptr;
    }
    
    char *keys[2] = {
        "readFd",
        "writeFd"
    };
    napi_value fdValue[2] = {nullptr};
    napi_create_int32(env, fd[0], &fdValue[0]);
    napi_create_int32(env, fd[1], &fdValue[1]);
    napi_value result;
    napi_create_object_with_named_properties(env, &result, 2, (const char **)keys, fdValue);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "createPipe", nullptr, CreatePipe, nullptr, nullptr, nullptr, napi_default, nullptr }
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
