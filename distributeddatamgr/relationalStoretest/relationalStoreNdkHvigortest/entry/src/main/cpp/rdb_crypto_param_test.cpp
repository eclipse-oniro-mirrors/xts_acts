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
#include <sys/stat.h>
#include <sys/types.h>
#include <string>
#include "common.h"
#include "database/rdb/oh_rdb_crypto_param.h"
#include "database/rdb/relational_store_error_code.h"

static napi_value OH_Rdb_DestroyCryptoParam0100(napi_env env, napi_callback_info)
{
    auto obj = OH_Rdb_CreateCryptoParam();
    NAPI_ASSERT(env, obj != NULL, "OH_Rdb_InsertWithConflictResolution is fail.");
    auto ret = OH_Rdb_DestroyCryptoParam(nullptr);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_DestroyCryptoParam is fail.");
    ret = OH_Rdb_DestroyCryptoParam(obj);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyCryptoParam is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_CreateCryptoParam0200(napi_env env, napi_callback_info)
{
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    NAPI_ASSERT(env, obj != NULL, "OH_Rdb_CreateCryptoParam is fail.");
    const uint8_t key[] = "12345678";
    auto ret = OH_Crypto_SetEncryptionKey(nullptr, key, sizeof(key) - 1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetEncryptionKey1 is fail.");
    ret = OH_Crypto_SetEncryptionKey(obj, key, sizeof(key) - 1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetEncryptionKey2 is fail.");

    int32_t length2 = 6;
    ret = OH_Crypto_SetEncryptionKey(obj, nullptr, length2);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetEncryptionKey5 is fail.");
    
    const uint8_t key1[] = "";
    int32_t length1 = 0;
    ret = OH_Crypto_SetEncryptionKey(obj, key1, length1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetEncryptionKey4 is fail.");

    ret = OH_Rdb_DestroyCryptoParam(obj);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyCryptoParam is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_CreateCryptoParam0300(napi_env env, napi_callback_info)
{
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    NAPI_ASSERT(env, obj != NULL, "OH_Rdb_CreateCryptoParam is fail.");
    int64_t iteration = -1;
    auto ret = OH_Crypto_SetIteration(obj, iteration);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetIteration1 is fail.");
    int64_t iteration1 = 1000;
    ret = OH_Crypto_SetIteration(obj, iteration1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetIteration2 is fail.");
    int64_t iteration2 = 0;
    ret = OH_Crypto_SetIteration(obj, iteration2);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetIteration3 is fail.");
    int64_t iteration3 = 9223372036854775807;
    ret = OH_Crypto_SetIteration(obj, iteration3);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetIteration4 is fail.");
    int64_t iteration4 = 9223372036854775808;
    ret = OH_Crypto_SetIteration(obj, iteration4);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetIteration5 is fail.");
    ret = OH_Rdb_DestroyCryptoParam(obj);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyCryptoParam is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_CreateCryptoParam0400(napi_env env, napi_callback_info)
{
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    NAPI_ASSERT(env, obj != NULL, "OH_Rdb_CreateCryptoParam is fail.");
    int32_t algo = 3;
    auto ret = OH_Crypto_SetEncryptionAlgo(obj, algo);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetEncryptionAlgo1 is fail.");
    int32_t algo1 = -1;
    ret = OH_Crypto_SetEncryptionAlgo(obj, algo1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetEncryptionAlgo2 is fail.");
    ret = OH_Crypto_SetEncryptionAlgo(obj, RDB_AES_256_CBC);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetEncryptionAlgo3 is fail.");
    ret = OH_Crypto_SetEncryptionAlgo(obj, RDB_AES_256_GCM);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetEncryptionAlgo4 is fail.");
    ret = OH_Crypto_SetEncryptionAlgo(obj, RDB_PLAIN_TEXT);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetEncryptionAlgo5 is fail.");
    ret = OH_Rdb_DestroyCryptoParam(obj);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyCryptoParam is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}


static napi_value OH_Rdb_CreateCryptoParam0500(napi_env env, napi_callback_info)
{
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    NAPI_ASSERT(env, obj != NULL, "OH_Rdb_CreateCryptoParam is fail.");
    int32_t algo = 3;
    auto ret = OH_Crypto_SetHmacAlgo(obj, algo);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetHmacAlgo1 is fail.");
    int32_t algo1 = -1;
    ret = OH_Crypto_SetHmacAlgo(obj, algo1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetHmacAlgo2 is fail.");
    ret = OH_Crypto_SetHmacAlgo(obj, RDB_HMAC_SHA512);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetHmacAlgo3 is fail.");
    ret = OH_Crypto_SetHmacAlgo(obj, RDB_HMAC_SHA1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetHmacAlgo4 is fail.");
    ret = OH_Crypto_SetHmacAlgo(obj, RDB_HMAC_SHA256);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetHmacAlgo5 is fail.");
    ret = OH_Rdb_DestroyCryptoParam(obj);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyCryptoParam is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_CreateCryptoParam0600(napi_env env, napi_callback_info)
{
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    NAPI_ASSERT(env, obj != NULL, "OH_Rdb_CreateCryptoParam is fail.");
    int32_t algo = 3;
    auto ret = OH_Crypto_SetKdfAlgo(obj, algo);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetKdfAlgo1 is fail.");
    int32_t algo1 = -1;
    ret = OH_Crypto_SetKdfAlgo(obj, algo1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetKdfAlgo2 is fail.");
    ret = OH_Crypto_SetKdfAlgo(obj, RDB_KDF_SHA512);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetKdfAlgo3 is fail.");
    ret = OH_Crypto_SetKdfAlgo(obj, RDB_KDF_SHA1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetKdfAlgo4 is fail.");
    ret = OH_Crypto_SetKdfAlgo(obj, RDB_KDF_SHA256);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetKdfAlgo5 is fail.");
    ret = OH_Rdb_DestroyCryptoParam(obj);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyCryptoParam is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_CreateCryptoParam0700(napi_env env, napi_callback_info)
{
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    NAPI_ASSERT(env, obj != NULL, "OH_Rdb_CreateCryptoParam is fail.");
    int64_t pageSize = -1;
    auto ret = OH_Crypto_SetCryptoPageSize(obj, pageSize);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetCryptoPageSize1 is fail.");
    int64_t pageSize1 = 1023;
    ret = OH_Crypto_SetCryptoPageSize(obj, pageSize1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetCryptoPageSize2 is fail.");
    int64_t pageSize2 = 0;
    ret = OH_Crypto_SetCryptoPageSize(obj, pageSize2);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetCryptoPageSize3 is fail.");
    int64_t pageSize3 = 1024;
    ret = OH_Crypto_SetCryptoPageSize(obj, pageSize3);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetCryptoPageSize4 is fail.");
    int64_t pageSize4 = 4096;
    ret = OH_Crypto_SetCryptoPageSize(obj, pageSize4);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetCryptoPageSize5 is fail.");
    int64_t pageSize5 = 65536;
    ret = OH_Crypto_SetCryptoPageSize(obj, pageSize5);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Crypto_SetCryptoPageSize6 is fail.");
    int64_t pageSize6 = 65537;
    ret = OH_Crypto_SetCryptoPageSize(obj, pageSize6);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Crypto_SetCryptoPageSize7 is fail.");
    ret = OH_Rdb_DestroyCryptoParam(obj);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyCryptoParam is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "OH_Rdb_DestroyCryptoParam0100", nullptr, OH_Rdb_DestroyCryptoParam0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_CreateCryptoParam0200", nullptr, OH_Rdb_CreateCryptoParam0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_CreateCryptoParam0300", nullptr, OH_Rdb_CreateCryptoParam0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_CreateCryptoParam0400", nullptr, OH_Rdb_CreateCryptoParam0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_CreateCryptoParam0500", nullptr, OH_Rdb_CreateCryptoParam0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_CreateCryptoParam0600", nullptr, OH_Rdb_CreateCryptoParam0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_CreateCryptoParam0700", nullptr, OH_Rdb_CreateCryptoParam0700, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "cryptoParam",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

