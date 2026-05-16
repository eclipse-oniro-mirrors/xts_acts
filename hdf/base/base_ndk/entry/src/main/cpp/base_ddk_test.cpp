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

#include "hilog/log.h"
#include "napi/native_api.h"
#include "native_common.h"
#include "ddk/ddk_api.h"
#include "ddk/ddk_types.h"
#include <cstdlib>
#include <js_native_api_types.h>
#include <unistd.h>
#include <vector>

#define BUFF_LENTH 10
#define PARAM_0 0
#define PORT_READ 0x01
#define PORT_WRITE 0x02
#define PORT_ILLEGAL 0x08

static napi_value DdkCreateAshmemOne(napi_env env, napi_callback_info info)
{
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}


static napi_value DdkCreateAshmemTwo(napi_env env, napi_callback_info info)
{
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = PARAM_0;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkCreateAshmemThree(napi_env env, napi_callback_info info)
{
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t *name = nullptr;
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkMapAshmemOne(napi_env env, napi_callback_info info)
{
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t ddkCreateAshmemValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    NAPI_ASSERT(env, ddkCreateAshmemValue == DDK_SUCCESS, "OH_DDK_CreateAshmem failed");
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    int32_t returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkMapAshmemTwo(napi_env env, napi_callback_info info)
{
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    int32_t returnValue = OH_DDK_MapAshmem(nullptr, ashmemMapType);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkMapAshmemThree(napi_env env, napi_callback_info info)
{
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t ddkCreateAshmemValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    NAPI_ASSERT(env, ddkCreateAshmemValue == DDK_SUCCESS, "OH_DDK_CreateAshmem failed");
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->ashmemFd = 0;
    int32_t returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkMapAshmemFour(napi_env env, napi_callback_info info)
{
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t ddkCreateAshmemValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    NAPI_ASSERT(env, ddkCreateAshmemValue == DDK_SUCCESS, "OH_DDK_CreateAshmem failed");
    const uint8_t ashmemMapType = PORT_ILLEGAL;
    int32_t returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkUnmapAshmemOne(napi_env env, napi_callback_info info)
{
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t ddkCreateAshmemValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    NAPI_ASSERT(env, ddkCreateAshmemValue == DDK_SUCCESS, "OH_DDK_CreateAshmem failed");
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    int32_t ddkMapAshmemValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    NAPI_ASSERT(env, ddkMapAshmemValue == DDK_SUCCESS, "OH_DDK_MapAshmem failed");
    int32_t returnValue = OH_DDK_UnmapAshmem(ashmem);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkUnmapAshmemTwo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_DDK_UnmapAshmem(nullptr);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkDestroyAshmemOne(napi_env env, napi_callback_info info)
{
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t ddkCreateAshmemValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    NAPI_ASSERT(env, ddkCreateAshmemValue == DDK_SUCCESS, "OH_DDK_CreateAshmem failed");
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    int32_t ddkMapAshmemValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    NAPI_ASSERT(env, ddkMapAshmemValue == DDK_SUCCESS, "OH_DDK_MapAshmem failed");
    int32_t returnValue = OH_DDK_DestroyAshmem(ashmem);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value DdkDestroyAshmemTwo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_DDK_DestroyAshmem(nullptr);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ddkCreateAshmemOne", nullptr, DdkCreateAshmemOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkCreateAshmemTwo", nullptr, DdkCreateAshmemTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkCreateAshmemThree", nullptr, DdkCreateAshmemThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkMapAshmemOne", nullptr, DdkMapAshmemOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkMapAshmemTwo", nullptr, DdkMapAshmemTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkMapAshmemThree", nullptr, DdkMapAshmemThree, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkMapAshmemFour", nullptr, DdkMapAshmemFour, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkUnmapAshmemOne", nullptr, DdkUnmapAshmemOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkUnmapAshmemTwo", nullptr, DdkUnmapAshmemTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkDestroyAshmemOne", nullptr, DdkDestroyAshmemOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ddkDestroyAshmemTwo", nullptr, DdkDestroyAshmemTwo, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libbaseddkjstest",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
