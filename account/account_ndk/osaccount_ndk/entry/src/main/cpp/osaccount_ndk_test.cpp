/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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
#include "native_common.h"
#include "BasicServicesKit/os_account.h"
#include "BasicServicesKit/os_account_common.h"
#include <js_native_api_types.h>

namespace {
static const uint32_t MAX_NAME_LENGTH = 256;
static const uint32_t MAX_NAME_LENGTH_MINUS_ONE = 255;
static const uint32_t MAX_NAME_LENGTH_PLUS_ONE = 257;
static const uint32_t ALPHABET_SIZE = 26;
}

static napi_value OsAccountGetAccountNameA(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetName(str, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value OsAccountGetAccountNameB(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetName(str, 0);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value OsAccountGetAccountNameC(napi_env env, napi_callback_info info)
{
    char accountName[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetName(nullptr, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, accountName, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue == OS_ACCOUNT_ERR_INVALID_PARAMETER ? 0 : -1, &result));
    return result;
}

static napi_value OsAccountGetAccountNameD(napi_env env, napi_callback_info info)
{
    OsAccount_ErrCode INTERNAL_ERROR = OS_ACCOUNT_ERR_INTERNAL_ERROR;
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, INTERNAL_ERROR == OS_ACCOUNT_ERR_INTERNAL_ERROR ? 0 : -1, &result));
    return result;
}

static napi_value OsAccountGetAccountNameByIdA(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetNameByLocalId(-1, str, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue == OS_ACCOUNT_ERR_ACCOUNT_NOT_FOUND ? 0 : -1, &result));
    return result;
}

static napi_value OsAccountGetAccountNameByIdB(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetNameByLocalId(101, str, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue == OS_ACCOUNT_ERR_ACCOUNT_NOT_FOUND ? 0 : -1, &result));
    return result;
}

static napi_value OsAccountGetAccountNameByIdC(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetNameByLocalId(0, str, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue == OS_ACCOUNT_ERR_RESTRICTED_ACCOUNT ? 0 : -1, &result));
    return result;
}

static napi_value OsAccountGetAccountNameByIdD(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetNameByLocalId(100, str, 0);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue == OS_ACCOUNT_ERR_INVALID_PARAMETER ? 0 : -1, &result));
    return result;
}

static napi_value OsAccountGetAccountNameByIdE(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetNameByLocalId(100, nullptr, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue == OS_ACCOUNT_ERR_INVALID_PARAMETER ? 0 : -1, &result));
    return result;
}

static napi_value OsAccountGetAccountNameByIdF(napi_env env, napi_callback_info info)
{
    char oversizedName[MAX_NAME_LENGTH_PLUS_ONE];
    for (int i = 0; i < MAX_NAME_LENGTH; i++) {
        oversizedName[i] = 'B' + (i % ALPHABET_SIZE);
    }
    oversizedName[MAX_NAME_LENGTH] = '\0';
    OsAccount_ErrCode returnValue = OH_OsAccount_GetNameByLocalId(100, oversizedName, MAX_NAME_LENGTH_PLUS_ONE);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, oversizedName, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue == OS_ACCOUNT_ERR_INVALID_PARAMETER ? 0 : -1, &result));
    return result;
}

static napi_value OsAccountGetAccountNameByIdG(napi_env env, napi_callback_info info)
{
    char maxName[MAX_NAME_LENGTH];
    for (int i = 0; i < MAX_NAME_LENGTH_MINUS_ONE; i++) {
        maxName[i] = 'A' + (i % ALPHABET_SIZE);
    }
    maxName[MAX_NAME_LENGTH_MINUS_ONE] = '\0';
    OsAccount_ErrCode returnValue = OH_OsAccount_GetNameByLocalId(100, maxName, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, maxName, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static napi_value OsAccountGetAccountNameByIdH(napi_env env, napi_callback_info info)
{
    char str[MAX_NAME_LENGTH] = {0};
    OsAccount_ErrCode returnValue = OH_OsAccount_GetNameByLocalId(100, str, MAX_NAME_LENGTH);
    if (returnValue == OsAccount_ErrCode::OS_ACCOUNT_ERR_OK) {
        napi_value result = nullptr;
        NAPI_CALL(env, napi_create_string_utf8(env, str, NAPI_AUTO_LENGTH, &result));
        return result;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"osAccountGetAccountNameA", nullptr, OsAccountGetAccountNameA, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameB", nullptr, OsAccountGetAccountNameB, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameC", nullptr, OsAccountGetAccountNameC, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameD", nullptr, OsAccountGetAccountNameD, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameByIdA", nullptr, OsAccountGetAccountNameByIdA, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameByIdB", nullptr, OsAccountGetAccountNameByIdB, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameByIdC", nullptr, OsAccountGetAccountNameByIdC, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameByIdD", nullptr, OsAccountGetAccountNameByIdD, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameByIdE", nullptr, OsAccountGetAccountNameByIdE, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameByIdF", nullptr, OsAccountGetAccountNameByIdF, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameByIdG", nullptr, OsAccountGetAccountNameByIdG, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"osAccountGetAccountNameByIdH", nullptr, OsAccountGetAccountNameByIdH, nullptr, nullptr, nullptr, napi_default,
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
    .nm_modname = "osaccountndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
