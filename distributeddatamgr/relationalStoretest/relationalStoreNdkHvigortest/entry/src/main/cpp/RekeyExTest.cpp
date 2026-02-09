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
#include "database/rdb/relational_store.h"

const char *TAG = "rekeyEx_test";
const char *RDB_TEST_PATH = "/data/storage/el2/database/com.example.buchongndktest/entry/";


const char *CREATE_TABLE_SQL =
    "CREATE TABLE store_test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
    "data3 FLOAT, data4 BLOB, data5 TEXT);";
const char *QUERY_SQL = "SELECT * FROM store_test";
static int Delete(OH_Rdb_Store *store)
    {
        OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
        OH_VObject *valueObject = OH_Rdb_CreateValueObject();
        const char *dataValue = "zhangSan";
        valueObject->putText(valueObject, dataValue);
        predicates->equalTo(predicates, "data1", valueObject);
        int errCode = OH_Rdb_Delete(store, predicates);
        return errCode;
    }
static OH_Rdb_ConfigV2 *CreateEncryptedConfig()
{
    OH_Rdb_ConfigV2 *encryptedConfig = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(encryptedConfig, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(encryptedConfig, "rdb_store_rekey_test.db");
    OH_Rdb_SetBundleName(encryptedConfig, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(encryptedConfig, true);
    OH_Rdb_SetSecurityLevel(encryptedConfig, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(encryptedConfig, RDB_SECURITY_AREA_EL1);
    return encryptedConfig;
}
static  OH_VBucket *CreateAndSetValueBucket()
{
        const int data2Value = 12800;
        const double data3Value = 200.1;
        OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
        valueBucket->putInt64(valueBucket, "id", 1);
        valueBucket->putText(valueBucket, "data1", "zhangSan");
        valueBucket->putInt64(valueBucket, "data2", data2Value);
        valueBucket->putReal(valueBucket, "data3", data3Value);
        valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
        return valueBucket;
}
static napi_value OH_Rdb_RekeyEx0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_rekeyextest.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_Rdb_CryptoParam *crypto1 = OH_Rdb_CreateCryptoParam();
    OH_Crypto_SetEncryptionAlgo(crypto1, RDB_PLAIN_TEXT);
    errCode = OH_Rdb_RekeyEx(store, crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");

    OH_Rdb_SetCryptoParam(config, crypto1);
    store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");

    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, QUERY_SQL);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_RekeyEx0200(napi_env env, napi_callback_info)
{
    int iteration = 3000;
    int pageSize = 2048;
    int errCode = 0;
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_CryptoParam *crypto1 = OH_Rdb_CreateCryptoParam();
    const uint8_t key[] = "12345678";
    errCode = OH_Crypto_SetEncryptionKey(crypto1, key, sizeof(key) - 1);
    errCode = OH_Rdb_SetCryptoParam(rekeyTestConfig, crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_SetCryptoParam is fail.");
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto2, newKey, sizeof(newKey) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetEncryptionAlgo(crypto2, RDB_AES_256_GCM);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto2, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetKdfAlgo(crypto2, RDB_KDF_SHA1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetKdfAlgo is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto2, RDB_HMAC_SHA1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetHmacAlgo is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto2, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);
    errCode = Delete(store);
    NAPI_ASSERT(env, errCode == 1, "getRowCount is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    OH_Rdb_SetCryptoParam(rekeyTestConfig, crypto2);
    store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Cursor *cursor1 = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount1 = 0;
    cursor1->getRowCount(cursor1, &rowCount1);
    NAPI_ASSERT(env, rowCount1 == 0, "getRowCount is fail.");
    valueBucket->destroy(valueBucket);
    cursor1->destroy(cursor1);
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_RekeyEx0300(napi_env env, napi_callback_info)
{
    int iteration = 3000;
    int pageSize = 2048;
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    errCode = OH_Crypto_SetEncryptionAlgo(crypto2, RDB_AES_256_CBC);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto2, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetKdfAlgo(crypto2, RDB_KDF_SHA512);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetKdfAlgo is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto2, RDB_HMAC_SHA512);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetHmacAlgo is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto2, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);
    errCode = Delete(store);
    NAPI_ASSERT(env, errCode == 1, "getRowCount is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_SetEncrypted(rekeyTestConfig, true);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    OH_Rdb_SetCryptoParam(rekeyTestConfig, crypto2);
    store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Cursor *cursor1 = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount1 = 0;
    cursor1->getRowCount(cursor1, &rowCount1);
    NAPI_ASSERT(env, rowCount1 == 0, "getRowCount is fail.");
    valueBucket->destroy(valueBucket);
    cursor1->destroy(cursor1);
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_RekeyEx0400(napi_env env, napi_callback_info)
{
    int iteration = 3000;
    int pageSize = 2048;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_rekeyextest.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto2, newKey, sizeof(newKey) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetEncryptionAlgo(crypto2, RDB_AES_256_CBC);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto2, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetKdfAlgo(crypto2, RDB_KDF_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto2, RDB_HMAC_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetHmacAlgo is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto2, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);
    errCode = Delete(store);
    NAPI_ASSERT(env, errCode == 1, "getRowCount is fail.");
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_SetEncrypted(config, true);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    OH_Rdb_SetCryptoParam(config, crypto2);
    store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Cursor *cursor1 = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount1 = 0;
    cursor1->getRowCount(cursor1, &rowCount1);
    NAPI_ASSERT(env, rowCount1 == 0, "getRowCount is fail.");
    valueBucket->destroy(valueBucket);
    cursor1->destroy(cursor1);
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_RekeyEx0500(napi_env env, napi_callback_info)
{
    int iteration = 3000;
    int pageSize = 2048;
    int errCode = 0;
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_CryptoParam *crypto1 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto1, newKey, sizeof(newKey) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetEncryptionAlgo(crypto1, RDB_AES_256_GCM);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto1, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetKdfAlgo(crypto1, RDB_KDF_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto1, RDB_HMAC_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetHmacAlgo is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto1, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey1[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto2, newKey1, sizeof(newKey1) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetEncryptionAlgo(crypto2, RDB_PLAIN_TEXT);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto2, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetKdfAlgo(crypto2, RDB_KDF_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto2, RDB_HMAC_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetHmacAlgo is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto2, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);
    errCode = Delete(store);
    NAPI_ASSERT(env, errCode == 1, "getRowCount is fail.");
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_SetEncrypted(rekeyTestConfig, false);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    OH_Rdb_SetCryptoParam(rekeyTestConfig, crypto2);
    store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Cursor *cursor1 = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount1 = 0;
    cursor1->getRowCount(cursor1, &rowCount1);
    NAPI_ASSERT(env, rowCount1 == 0, "getRowCount is fail.");
    valueBucket->destroy(valueBucket);
    cursor1->destroy(cursor1);
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_RekeyEx0600(napi_env env, napi_callback_info)
{
    int iteration = 3000;
    int pageSize = 2048;
    int errCode = 0;
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_CryptoParam *crypto1 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto1, newKey, sizeof(newKey) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetEncryptionAlgo(crypto1, RDB_AES_256_GCM);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto1, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetKdfAlgo(crypto1, RDB_KDF_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto1, RDB_HMAC_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetHmacAlgo is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto1, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);
    errCode = Delete(store);
    NAPI_ASSERT(env, errCode == 1, "getRowCount is fail.");
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_SetEncrypted(rekeyTestConfig, true);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    OH_Rdb_SetCryptoParam(rekeyTestConfig, crypto2);
    store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Cursor *cursor1 = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount1 = 0;
    cursor1->getRowCount(cursor1, &rowCount1);
    NAPI_ASSERT(env, rowCount1 == 0, "getRowCount is fail.");
    valueBucket->destroy(valueBucket);
    cursor1->destroy(cursor1);
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_RekeyEx0700(napi_env env, napi_callback_info)
{
    int iteration = 3000;
    int pageSize = 2048;
    int errCode = 0;
    int loop = 3;
    for (int i = 0; i < loop; i++)
    {
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_CryptoParam *crypto1 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto1, newKey, sizeof(newKey) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetEncryptionAlgo(crypto1, i);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto1, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto1, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey1[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto2, newKey1, sizeof(newKey1) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetEncryptionAlgo(crypto2, i);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto2, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto2, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    }
    for (int j = 0; j < loop; j++)
    {
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_CryptoParam *crypto1 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto1, newKey, sizeof(newKey) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode =  OH_Crypto_SetKdfAlgo(crypto1, j);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto1, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto1, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey1[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto2, newKey1, sizeof(newKey1) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode =  OH_Crypto_SetKdfAlgo(crypto2, j);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto2, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto2, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    }
    for (int k = 0; k < loop; k++)
    {
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_CryptoParam *crypto1 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto1, newKey, sizeof(newKey) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto1, k);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto1, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto1, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey1[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto2, newKey1, sizeof(newKey1) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto2, k);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto2, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto2, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_RekeyEx0900(napi_env env, napi_callback_info)
{
    int num = -1;
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    errCode = OH_Crypto_SetEncryptionAlgo(crypto2, num);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto2, num);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetKdfAlgo(crypto2, num);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Crypto_SetKdfAlgo is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto2, num);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Crypto_SetHmacAlgo is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto2, num);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Crypto_SetCryptoPageSize is fail.");
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_RekeyEx is fail.");
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_RekeyEx1000(napi_env env, napi_callback_info)
{
    int iteration = 3000;
    int pageSize = 2048;
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    errCode = OH_Crypto_SetEncryptionAlgo(crypto2, RDB_AES_256_CBC);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto2, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetKdfAlgo(crypto2, RDB_KDF_SHA512);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetKdfAlgo is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto2, RDB_HMAC_SHA512);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetHmacAlgo is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto2, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    errCode = OH_Rdb_RekeyEx(nullptr, crypto2);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS , "OH_Rdb_RekeyEx is fail.");
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_RekeyEx1100(napi_env env, napi_callback_info)
{
    int iteration = 3000;
    int pageSize = 2048;
    int errCode = 0;
    OH_Rdb_ConfigV2 *rekeyTestConfig = CreateEncryptedConfig();
    NAPI_ASSERT(env, rekeyTestConfig != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_CryptoParam *crypto1 = OH_Rdb_CreateCryptoParam();
    const uint8_t newKey[] = "87654321";
    errCode = OH_Crypto_SetEncryptionKey(crypto1, newKey, sizeof(newKey) - 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionKey is fail.");
    errCode = OH_Crypto_SetEncryptionAlgo(crypto1, RDB_AES_256_GCM);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetEncryptionAlgo is fail.");
    errCode = OH_Crypto_SetIteration(crypto1, iteration);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetKdfAlgo(crypto1, RDB_KDF_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetIteration is fail.");
    errCode = OH_Crypto_SetHmacAlgo(crypto1, RDB_HMAC_SHA256);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetHmacAlgo is fail.");
    errCode = OH_Crypto_SetCryptoPageSize(crypto1, pageSize);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Crypto_SetCryptoPageSize is fail.");
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(rekeyTestConfig, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, QUERY_SQL);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    OH_Rdb_CryptoParam *crypto2 = OH_Rdb_CreateCryptoParam();
    errCode = OH_Rdb_RekeyEx(store, crypto2);
    NAPI_ASSERT(env, errCode == RDB_E_SQLITE_BUSY, "OH_Rdb_RekeyEx is fail.");
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);
    errCode = OH_Rdb_DeleteStoreV2(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(rekeyTestConfig);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyCryptoParam(crypto2);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "OH_Rdb_RekeyEx0100", nullptr, OH_Rdb_RekeyEx0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_RekeyEx0200", nullptr, OH_Rdb_RekeyEx0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_RekeyEx0300", nullptr, OH_Rdb_RekeyEx0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_RekeyEx0400", nullptr, OH_Rdb_RekeyEx0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_RekeyEx0500", nullptr, OH_Rdb_RekeyEx0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_RekeyEx0600", nullptr, OH_Rdb_RekeyEx0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_RekeyEx0700", nullptr, OH_Rdb_RekeyEx0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_RekeyEx0900", nullptr, OH_Rdb_RekeyEx0900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_RekeyEx1000", nullptr, OH_Rdb_RekeyEx1000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_RekeyEx1100", nullptr, OH_Rdb_RekeyEx1100, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "rekeyextest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

