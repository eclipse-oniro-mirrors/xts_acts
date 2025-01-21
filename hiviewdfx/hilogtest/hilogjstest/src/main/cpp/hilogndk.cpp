/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xD003200
#define LOG_TAG "testTag"

using namespace std;

napi_value g_sum = 0;
double g_test = 0;
std::string g_msg = "";

void callback(const LogType type, const LogLevel level, const unsigned int domain, const char *tag, const char *msg)
{
    g_msg = msg;
    g_test = 6;  //test number : 6
}

static napi_value Add(napi_env env, napi_callback_info info)
{
    OH_LOG_SetCallback(callback);
    printf("hahahahha");
    OH_LOG_INFO(LOG_APP, "123456");
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

    g_test = value0 + value1; // 5

    OH_LOG_INFO(LOG_APP, "666666");
    napi_create_double(env, g_test, &g_sum);

    return g_sum;
}

static napi_value GetMsg(napi_env env, napi_callback_info info)
{
    napi_value message;
    napi_create_string_utf8(env, g_msg.c_str(), strlen(g_msg.c_str()), &message);
    return message;
}

static napi_value OhIsLoggableTest(napi_env env, napi_callback_info info)
{
    napi_value res = nullptr;
    bool isLoggable = OH_LOG_IsLoggable(0x3200, "testTag", LOG_DEBUG);
    napi_get_boolean(env, isLoggable, &res);
    return res;
}

static napi_value OhPrintTest(napi_env env, napi_callback_info info)
{
    napi_value res = nullptr;
    LogType type = LOG_APP;
    LogLevel level = LOG_ERROR;
    int retLen = OH_LOG_Print(type, level, 0x3200, "testTag", "string for hilog test");
    bool ret = (retLen > 0) ? true : false;
    napi_get_boolean(env, ret, &res);
    return res;
}



EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "ohIsLoggableTest", nullptr, OhIsLoggableTest,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ohPrintTest", nullptr, OhPrintTest,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "add", nullptr, Add,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getMsg", nullptr, GetMsg,
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
    .nm_modname = "libhilogndk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
