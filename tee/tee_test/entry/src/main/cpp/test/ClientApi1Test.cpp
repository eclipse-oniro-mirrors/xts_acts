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
#include "common_test.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include "tee/tee_client_api.h"
#include "tee_client_constants.h"

static napi_value InitContext_NameIsNotNULL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Context context = {0};
    TEEC_Result ret = TEEC_SUCCESS;
    const char *name = "testname";

    ret = TEEC_InitializeContext(name, &context);
    TEEC_FinalizeContext(&context);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value InitContext_ContextIsNULL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Result ret = TEEC_SUCCESS;

    ret = TEEC_InitializeContext(nullptr, nullptr);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value InitContext_AfterFinalizeContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    TEEC_Context context = {0};
    TEEC_Result ret = TEEC_SUCCESS;
    TEEC_InitializeContext(nullptr, &context);
    TEEC_FinalizeContext(&context);

    ret = TEEC_InitializeContext(nullptr, &context);
    TEEC_FinalizeContext(&context);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value InitContext_Use17Context(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    TEEC_Result ret;
    TEEC_Context context[17] = {{0}};

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_create_uint32(env, TEEC_FAIL, &result);
    napi_create_uint32(env, TEEC_SUCCESS, &result2);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);

    uint32_t i;
    for (i = 0; i < 16; i++) {
        ret = TEEC_InitializeContext(NULL, &context[i]);
        if (ret != TEEC_SUCCESS) {
            napi_create_uint32(env, ret, &result);
            napi_set_element(env, array, 0, result);
            for (i = 0; i < 17; i++)
                TEEC_FinalizeContext(&context[i]);
            return array;
        } else {
            napi_create_uint32(env, ret, &result);
        }
    }
    // init 17th context should fail
    ret = TEEC_InitializeContext(NULL, &context[16]);
    for (i = 0; i < 17; i++)
        TEEC_FinalizeContext(&context[i]);

    napi_create_uint32(env, ret, &result2);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Finalizecontext_WithCreatedContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    TEEC_Context context = {0};
    TEEC_Result ret = TEEC_SUCCESS;
    ret = TEEC_InitializeContext(nullptr, &context);
    napi_create_uint32(env, ret, &result);
    TEEC_FinalizeContext(&context);
    napi_create_int32(env, context.fd, &result2);

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    return array;
}

static napi_value Finalizecontext_WithNotCreatedContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    TEEC_Context context = {0};
    TEEC_FinalizeContext(&context);
    napi_create_int32(env, context.fd, &result);

    return result;
}

static napi_value Finalizecontext_WithoutContext(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result2 = nullptr;
    TEEC_Context context = {0};
    TEEC_Result ret = TEEC_SUCCESS;
    ret = TEEC_InitializeContext(nullptr, &context);
    napi_create_uint32(env, ret, &result);
    TEEC_FinalizeContext(nullptr);
    if (context.fd != -1)
        napi_create_int32(env, TEEC_SUCCESS, &result2);
    else
        napi_create_int32(env, TEEC_ERROR_GENERIC, &result2);

    // 创建数组对象
    napi_value array;
    napi_create_array(env, &array);
    napi_set_element(env, array, 0, result);
    napi_set_element(env, array, 1, result2);
    TEEC_FinalizeContext(&context);
    return array;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"InitContext_NameIsNotNULL", nullptr, InitContext_NameIsNotNULL, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"InitContext_ContextIsNULL", nullptr, InitContext_ContextIsNULL, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"InitContext_AfterFinalizeContext", nullptr, InitContext_AfterFinalizeContext, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"InitContext_Use17Context", nullptr, InitContext_Use17Context, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Finalizecontext_WithCreatedContext", nullptr, Finalizecontext_WithCreatedContext, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Finalizecontext_WithNotCreatedContext", nullptr, Finalizecontext_WithNotCreatedContext, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"Finalizecontext_WithoutContext", nullptr, Finalizecontext_WithoutContext, nullptr, nullptr, nullptr,
         napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "client_api_test1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
