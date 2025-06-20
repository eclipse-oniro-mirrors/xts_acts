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
#include <cerrno>
#include <cstdio>
#include <js_native_api_types.h>

#define RETURN_0 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_16 16
#define SIZE_7 7

extern "C" int __aeabi_atexit(void *obj, void (*func)(void *), void *d);
extern "C" int __aeabi_memclr(void *dest, size_t n);
extern "C" int __aeabi_memclr4(void *dest, size_t n);
extern "C" int __aeabi_memclr8(void *dest, size_t n);
extern "C" void *__aeabi_memcpy(void *__restrict, const void *__restrict, size_t);
extern "C" void *__aeabi_memcpy4(void *__restrict, const void *__restrict, size_t);
extern "C" void *__aeabi_memcpy8(void *__restrict, const void *__restrict, size_t);
extern "C" void *__aeabi_memmove(void *, const void *, size_t);
extern "C" void *__aeabi_memmove4(void *, const void *, size_t);
extern "C" void *__aeabi_memmove8(void *, const void *, size_t);
extern "C" void *__aeabi_memset(void *, int, size_t);
extern "C" void *__aeabi_memset4(void *, int, size_t);
extern "C" void *__aeabi_memset8(void *, int, size_t);
extern "C" void *__aeabi_read_tp();
extern "C" char *__progname;
extern "C" uintptr_t __stack_chk_guard;

static napi_value AeabiMemclr(napi_env env, napi_callback_info info)
{
    char dest[] = "__aeabi_memclr";
    napi_value result = nullptr;
    if (__aeabi_memclr(dest, sizeof(dest)) != PARAM_0) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemclr4(napi_env env, napi_callback_info info)
{
    char dest[] = "__aeabi_memclr";
    napi_value result = nullptr;
    if (__aeabi_memclr4(dest, sizeof(dest)) != PARAM_0) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemclr8(napi_env env, napi_callback_info info)
{
    char dest[] = "__aeabi_memclr";
    napi_value result = nullptr;
    if (__aeabi_memclr8(dest, sizeof(dest)) != PARAM_0) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemcpy(napi_env env, napi_callback_info info)
{
    int dest[] = {1, 2, 3, 4, 5, 6, 7};
    int src[] = {4, 5, 6, 7};
    void *ret = __aeabi_memcpy(dest, src, SIZE_16);
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemcpy4(napi_env env, napi_callback_info info)
{
    int dest[] = {1, 2, 3, 4, 5, 6, 7};
    int src[] = {4, 5, 6, 7};
    void *ret = __aeabi_memcpy4(dest, src, SIZE_16);
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemcpy8(napi_env env, napi_callback_info info)
{
    int dest[] = {1, 2, 3, 4, 5, 6, 7};
    int src[] = {4, 5, 6, 7};
    void *ret = __aeabi_memcpy8(dest, src, SIZE_16);
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemmove(napi_env env, napi_callback_info info)
{
    int dest[] = {1, 2, 3, 4, 5, 6, 7};
    int src[] = {4, 5, 6, 7};
    void *ret = __aeabi_memmove(dest, src, SIZE_16);
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemmove4(napi_env env, napi_callback_info info)
{
    int dest[] = {1, 2, 3, 4, 5, 6, 7};
    int src[] = {4, 5, 6, 7};
    void *ret = __aeabi_memmove4(dest, src, SIZE_16);
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemmove8(napi_env env, napi_callback_info info)
{
    int dest[] = {1, 2, 3, 4, 5, 6, 7};
    int src[] = {4, 5, 6, 7};
    void *ret = __aeabi_memmove8(dest, src, SIZE_16);
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemset(napi_env env, napi_callback_info info)
{
    int dest[] = {1, 2, 3, 4, 5, 6, 7};
    int src = SIZE_7;
    void *ret = __aeabi_memset(dest, src, SIZE_16);
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemset4(napi_env env, napi_callback_info info)
{
    int dest[] = {1, 2, 3, 4, 5, 6, 7};
    int src = SIZE_7;
    void *ret = __aeabi_memset4(dest, src, SIZE_16);
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiMemset8(napi_env env, napi_callback_info info)
{
    int dest[] = {1, 2, 3, 4, 5, 6, 7};
    int src = SIZE_7;
    void *ret = __aeabi_memset4(dest, src, SIZE_16);
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value AeabiReadTp(napi_env env, napi_callback_info info)
{
    void *ret = __aeabi_read_tp();
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value Progname(napi_env env, napi_callback_info info)
{
    __progname = PARAM_0;
    errno = ERRON_0;
    printf("%s", __progname);
    napi_value result = nullptr;
    if (errno == ERRON_0) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

static napi_value StackChkGuard(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    if (__stack_chk_guard) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"aeabiMemclr", nullptr, AeabiMemclr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemclr4", nullptr, AeabiMemclr4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemclr8", nullptr, AeabiMemclr8, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemcpy", nullptr, AeabiMemcpy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemcpy4", nullptr, AeabiMemcpy4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemcpy8", nullptr, AeabiMemcpy8, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemmove", nullptr, AeabiMemmove, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemmove4", nullptr, AeabiMemmove4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemmove8", nullptr, AeabiMemmove8, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemset", nullptr, AeabiMemset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemset4", nullptr, AeabiMemset4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiMemset8", nullptr, AeabiMemset8, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiReadTp", nullptr, AeabiReadTp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"progname", nullptr, Progname, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stackChkGuard", nullptr, StackChkGuard, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "aeabindk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
