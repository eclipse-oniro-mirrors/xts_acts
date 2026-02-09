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

#include "CryptoParamTest.h"
#include "napi/native_api.h"
#include <database/rdb/relational_store.h>
#include <database/rdb/relational_store_error_code.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <database/rdb/oh_rdb_crypto_param.h>

void AddCryptoParamTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOHCryptoSetHmacAlgoSha1", nullptr, TestOHCryptoSetHmacAlgoSha1, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOHCryptoSetHmacAlgoSha256", nullptr, TestOHCryptoSetHmacAlgoSha256, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOHCryptoSetEncryptionAlgo256Gcm", nullptr, TestOHCryptoSetEncryptionAlgo256Gcm, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOHCryptoSetKdfAlgoKdfSha1", nullptr, TestOHCryptoSetKdfAlgoKdfSha1, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testOHCryptoSetKdfAlgoKdgShs256", nullptr, TestOHCryptoSetKdfAlgoKdgShs256, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
}

napi_value TestOHCryptoSetHmacAlgoSha1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    auto ret = OH_Crypto_SetHmacAlgo(obj, RDB_HMAC_SHA1);
    napi_create_int32(env, ret == RDB_OK ? 0 : -1, &result);
    OH_Rdb_DestroyCryptoParam(obj);
    return result;
}

napi_value TestOHCryptoSetHmacAlgoSha256(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    auto ret = OH_Crypto_SetHmacAlgo(obj, RDB_HMAC_SHA256);
    napi_create_int32(env, ret == RDB_OK ? 0 : -1, &result);
    OH_Rdb_DestroyCryptoParam(obj);
    return result;
}

napi_value TestOHCryptoSetEncryptionAlgo256Gcm(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    auto ret = OH_Crypto_SetEncryptionAlgo(obj, RDB_AES_256_GCM);
    napi_create_int32(env, ret == RDB_OK ? 0 : -1, &result);
    OH_Rdb_DestroyCryptoParam(obj);
    return result;
}

napi_value TestOHCryptoSetKdfAlgoKdfSha1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    auto ret = OH_Crypto_SetKdfAlgo(obj, RDB_KDF_SHA1);
    napi_create_int32(env, ret == RDB_OK ? 0 : -1, &result);
    OH_Rdb_DestroyCryptoParam(obj);
    return result;
}

napi_value TestOHCryptoSetKdfAlgoKdgShs256(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Rdb_CryptoParam *obj = OH_Rdb_CreateCryptoParam();
    auto ret = OH_Crypto_SetKdfAlgo(obj, RDB_KDF_SHA256);
    napi_create_int32(env, ret == RDB_OK ? 0 : -1, &result);
    OH_Rdb_DestroyCryptoParam(obj);
    return result;
}