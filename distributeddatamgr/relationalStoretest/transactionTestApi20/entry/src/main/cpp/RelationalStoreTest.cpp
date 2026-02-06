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

#include "RelationalStoreTest.h"
#include "napi/native_api.h"
#include <cstdint>
#include <database/rdb/oh_rdb_types.h>
#include <database/rdb/relational_store.h>
#include <database/rdb/relational_store_error_code.h>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <string>
#include <sys/stat.h>

namespace RelationalStoreTest {
const char *RDB_TEST = "/data/storage/el2/database/com.acts.acttransactiontest/";
char g_storeName[20] = "rdb_store_test.db";
char g_bundleName[100] = "com.acts.acttransactiontest";
char g_moduleName[100] = "";
OH_Rdb_Config RDB_CONFIG;
} // namespace RelationalStoreTest

int g_rSErrorCode = 14800000;
int g_rSInvalidParamCode = 14800001;
int g_notSupportedCode = 801;

void InitRdbConfig()
{
    RelationalStoreTest::RDB_CONFIG.dataBaseDir = RelationalStoreTest::RDB_TEST;
    RelationalStoreTest::RDB_CONFIG.storeName = RelationalStoreTest::g_storeName;
    RelationalStoreTest::RDB_CONFIG.bundleName = RelationalStoreTest::g_bundleName;
    RelationalStoreTest::RDB_CONFIG.moduleName = RelationalStoreTest::g_moduleName;
    RelationalStoreTest::RDB_CONFIG.securityLevel = OH_Rdb_SecurityLevel::S1;
    RelationalStoreTest::RDB_CONFIG.isEncrypt = false;
    RelationalStoreTest::RDB_CONFIG.selfSize = sizeof(OH_Rdb_Config);
}

void RdbSubscribeDetailCallback(void *context, const Rdb_ChangeInfo **changeInfo, uint32_t count) {}

void AddRelationStoreTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testSetDbType", nullptr, TestSetDbType, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testSetCryptoParam", nullptr, TestSetCryptoParam, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testSetTokenizerInvalidParam", nullptr, TestSetTokenizerInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testSetTokenizerSuccess", nullptr, TestSetTokenizerSuccess, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testSetPersistentInvalidParam", nullptr, TestSetPersistentInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testSetPersistentSuccess", nullptr, TestSetPersistentSuccess, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testIsTokenizerSupportedInvalidParam", nullptr, TestIsTokenizerSupportedInvalidParam, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testDeleteStoreInvalidParam", nullptr, TestDeleteStoreInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testDeleteStoreSuccess", nullptr, TestDeleteStoreSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testInsertError", nullptr, TestInsertError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testInsertWithConflictResolutionSuccess", nullptr, TestInsertWithConflictResolutionSuccess,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testInsertWithConflictResolutionAbnormalError", nullptr,
                        TestInsertWithConflictResolutionAbnormalError, nullptr, nullptr, nullptr, napi_default,
                        nullptr});
    descData.push_back({"testBatchInsertInvalidParam", nullptr, TestBatchInsertInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testBatchInsertError", nullptr, TestBatchInsertError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testUpdateFailed", nullptr, TestUpdateFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testUpdateWithConflictResolutionSuccess", nullptr, TestUpdateWithConflictResolutionSuccess,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testUpdateWithConflictResolutionError", nullptr, TestUpdateWithConflictResolutionError,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testDeleteInvalidParam", nullptr, TestDeleteInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testDeleteFailed", nullptr, TestDeleteFailed, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testExecuteInvalidParam", nullptr, TestExecuteInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testExecuteV2InvalidParam", nullptr, TestExecuteV2InvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testExecuteV2Error", nullptr, TestExecuteV2Error, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testOHRdbAttachError", nullptr, TestOHRdbAttachError, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddRelationStoreTest2(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testBeginTransactionInvalidParam", nullptr, TestBeginTransactionInvalidParam, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testBeginTransactionSuccess", nullptr, TestBeginTransactionSuccess, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testRollBackInvalidParam", nullptr, TestRollBackInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testRollBackSuccess", nullptr, TestRollBackSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testCommitInvalidParam", nullptr, TestCommitInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testCommitSuccess", nullptr, TestCommitSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testBackupInvalidParam", nullptr, TestBackupInvalidParam, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testBackupSuccess", nullptr, TestBackupSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testRestoreInvalidParam", nullptr, TestRestoreInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testRestoreSuccess", nullptr, TestRestoreSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGetVersionInvalidParam", nullptr, TestGetVersionInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testGetVersionSuccess", nullptr, TestGetVersionSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testSetVersionInvalidParam", nullptr, TestSetVersionInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testSetVersionSuccess", nullptr, TestSetVersionSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddRelationStoreTest3(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testLockRowInvalidParam", nullptr, TestLockRowInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testUnlockRowInvalidParam", nullptr, TestUnlockRowInvalidParam, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testCreateTransactionInvalidParam", nullptr, TestCreateTransactionInvalidParam, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testSetLocaleSuccess", nullptr, TestSetLocaleSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testOHRdbAttachBusy", nullptr, TestOHRdbAttachBusy, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testOHRdbDetachOk", nullptr, TestOHRdbDetachOk, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testOHRdbDetachError", nullptr, TestOHRdbDetachError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOHRdbSubscribeDetails", nullptr, TestOHRdbSubscribeDetails, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testSetTokenizerNotSupported", nullptr, TestSetTokenizerNotSupported, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"testRollBackByTrxIdSuccess", nullptr, TestRollBackByTrxIdSuccess, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testCommitByTrxIdSuccess", nullptr, TestCommitByTrxIdSuccess, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testSubscribeSuccess", nullptr, TestSubscribeSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void AddRelationStoreTest(std::vector<napi_property_descriptor> &descData)
{
    AddRelationStoreTest1(descData);
    AddRelationStoreTest2(descData);
    AddRelationStoreTest3(descData);
}

napi_value TestSetDbType(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();

    int dbType = Rdb_DBType::RDB_CAYLEY;
    int ret = OH_Rdb_SetDbType(config, dbType);
    if (ret == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED || ret == OH_Rdb_ErrCode::RDB_OK) {
        napi_create_int32(env, ret, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    OH_Rdb_DestroyConfig(config);
    return result;
}

napi_value TestSetCryptoParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();

    OH_Rdb_CryptoParam *cryptoParam = OH_Rdb_CreateCryptoParam();

    int ret = OH_Rdb_SetCryptoParam(config, cryptoParam);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);

    OH_Rdb_DestroyConfig(config);
    OH_Rdb_DestroyCryptoParam(cryptoParam);
    return result;
}

napi_value TestSetTokenizerInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *config = nullptr;

    Rdb_Tokenizer token = Rdb_Tokenizer::RDB_CUSTOM_TOKENIZER;

    int ret = OH_Rdb_SetTokenizer(config, token);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    return result;
}

napi_value TestSetTokenizerSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();

    Rdb_Tokenizer token = Rdb_Tokenizer::RDB_CUSTOM_TOKENIZER;

    int ret = OH_Rdb_SetTokenizer(config, token);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);

    OH_Rdb_DestroyConfig(config);
    return result;
}

napi_value TestSetPersistentInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *config = nullptr;

    bool isPersistent = true;
    int ret = OH_Rdb_SetPersistent(config, isPersistent);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    return result;
}

napi_value TestSetPersistentSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();

    bool isPersistent = true;
    int ret = OH_Rdb_SetPersistent(config, isPersistent);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);

    OH_Rdb_DestroyConfig(config);
    return result;
}

napi_value TestIsTokenizerSupportedInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    Rdb_Tokenizer token = RDB_NONE_TOKENIZER;

    int ret = OH_Rdb_IsTokenizerSupported(token, nullptr);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    return result;
}

napi_value TestDeleteStoreInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_Config *config = nullptr;

    int ret = OH_Rdb_DeleteStore(config);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    return result;
}

napi_value TestDeleteStoreSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();

    int ret = OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);

    return result;
}

napi_value TestInsertError(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();

    OH_Rdb_Store *testRdbStore = nullptr;

    int errCode = 0;
    char table[] = "test";

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "ZhangSan");
    int64_t data2Value = 12000;
    valueBucket->putInt64(valueBucket, "data2", data2Value);
    double data3Value = 12.15;
    valueBucket->putReal(valueBucket, "data3", data3Value);

    int ret = OH_Rdb_Insert(testRdbStore, table, valueBucket);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_ERR ? -1 : 1, &result);
    valueBucket->destroy(valueBucket);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestInsertWithConflictResolutionSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "data1 TEXT, "
                                 "data2 INT64, "
                                 "data3 REAL)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "ZhangSan");
    int64_t data2Value = 12000;
    valueBucket->putInt64(valueBucket, "data2", data2Value);
    double data3Value = 12.15;
    valueBucket->putReal(valueBucket, "data3", data3Value);
    int64_t rowId = 0;

    Rdb_ConflictResolution resolution = RDB_CONFLICT_NONE;
    int ret = OH_Rdb_InsertWithConflictResolution(testRdbStore, "test", valueBucket, resolution, &rowId);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);
    valueBucket->destroy(valueBucket);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestInsertWithConflictResolutionAbnormalError(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "data1 TEXT, "
                                 "data2 INT64, "
                                 "data3 REAL)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "ZhangSan");
    int64_t data2Value = 12000;
    valueBucket->putInt64(valueBucket, "data2", data2Value);
    double data3Value = 12.15;
    valueBucket->putReal(valueBucket, "data3", data3Value);
    int64_t rowId = 0;

    Rdb_ConflictResolution resolution = RDB_CONFLICT_NONE;
   
    int ret = OH_Rdb_InsertWithConflictResolution(testRdbStore, "test1", valueBucket, resolution, &rowId);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_ERROR ? g_rSErrorCode : -1, &result);
    valueBucket->destroy(valueBucket);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestBatchInsertInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "data1 TEXT, "
                                 "data2 INT64, "
                                 "data3 REAL)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();

    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "ZhangSan");
    int64_t data2Value = 12000;
    valueBucket->putInt64(valueBucket, "data2", data2Value);
    double data3Value = 12.15;
    valueBucket->putReal(valueBucket, "data3", data3Value);

    OH_Data_VBuckets *valueBuckets = OH_VBuckets_Create();

    OH_VBuckets_PutRow(valueBuckets, valueBucket);

    Rdb_ConflictResolution resolution = RDB_CONFLICT_NONE;

    int64_t changes = 0;
    int ret = OH_Rdb_BatchInsert(nullptr, "test", valueBuckets, resolution, &changes);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);
    valueBucket->destroy(valueBucket);
    OH_VBuckets_Destroy(valueBuckets);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestBatchInsertError(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "data1 TEXT, "
                                 "data2 INT64, "
                                 "data3 REAL)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();

    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "ZhangSan");
    int64_t data2Value = 12000;
    valueBucket->putInt64(valueBucket, "data2", data2Value);
    double data3Value = 12.15;
    valueBucket->putReal(valueBucket, "data3", data3Value);

    OH_Data_VBuckets *valueBuckets = OH_VBuckets_Create();

    OH_VBuckets_PutRow(valueBuckets, valueBucket);

    Rdb_ConflictResolution resolution = RDB_CONFLICT_NONE;

    int64_t changes = 0;
    int ret = OH_Rdb_BatchInsert(testRdbStore, "test_data", valueBuckets, resolution, &changes);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_ERROR ? g_rSErrorCode : -1, &result);
    valueBucket->destroy(valueBucket);
    OH_VBuckets_Destroy(valueBuckets);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestUpdateFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "data1 TEXT, "
                                 "data2 INT64, "
                                 "data3 REAL)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "data1", "ZhangSan");
    int64_t data2Value = 12000;
    insertBucket->putInt64(insertBucket, "data2", data2Value);
    double data3Value = 12.15;
    insertBucket->putReal(insertBucket, "data3", data3Value);
    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "ZhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data5", valueObject);

    OH_VBucket *updateBucket = OH_Rdb_CreateValuesBucket();
    updateBucket->putText(updateBucket, "data5", "LiSi");

    int ret = OH_Rdb_Update(testRdbStore, updateBucket, predicates);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_ERR ? -1 : 1, &result);

    insertBucket->destroy(insertBucket);
    updateBucket->destroy(updateBucket);
    predicates->clear(predicates);
    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestUpdateWithConflictResolutionSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data1Value = 60;
    valueObject->putInt64(valueObject, &data1Value, 0);
    predicates->equalTo(predicates, "score", valueObject);

    OH_VBucket *updateBucket = OH_Rdb_CreateValuesBucket();
    int64_t scoreValue1 = 90;
    updateBucket->putInt64(updateBucket, "score", scoreValue1);

    Rdb_ConflictResolution resolution = Rdb_ConflictResolution::RDB_CONFLICT_ROLLBACK;
    int64_t changes = 0;
    int ret = OH_Rdb_UpdateWithConflictResolution(testRdbStore, updateBucket, predicates, resolution, &changes);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);

    insertBucket->destroy(insertBucket);
    updateBucket->destroy(updateBucket);
    predicates->clear(predicates);
    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);
    return result;
}

napi_value TestUpdateWithConflictResolutionError(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test_rdb");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data1Value = 60;
    valueObject->putInt64(valueObject, &data1Value, 0);
    predicates->equalTo(predicates, "score", valueObject);

    OH_VBucket *updateBucket = OH_Rdb_CreateValuesBucket();
    int64_t scoreValue1 = 90;
    updateBucket->putInt64(updateBucket, "score", scoreValue1);

    Rdb_ConflictResolution resolution = Rdb_ConflictResolution::RDB_CONFLICT_ROLLBACK;
    int64_t changes = 0;
    int ret = OH_Rdb_UpdateWithConflictResolution(testRdbStore, updateBucket, predicates, resolution, &changes);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_ERROR ? g_rSErrorCode : -1, &result);

    insertBucket->destroy(insertBucket);
    updateBucket->destroy(updateBucket);
    predicates->clear(predicates);
    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestDeleteInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data1Value = 60;
    valueObject->putInt64(valueObject, &data1Value, 0);
    predicates->equalTo(predicates, "score", valueObject);

    int ret = OH_Rdb_Delete(nullptr, predicates);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    insertBucket->destroy(insertBucket);
    predicates->clear(predicates);
    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestDeleteFailed(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test_rdb");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data1Value = 60;
    valueObject->putInt64(valueObject, &data1Value, 0);
    predicates->equalTo(predicates, "score", valueObject);

    int ret = OH_Rdb_Delete(testRdbStore, predicates);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_ERR ? -1 : 1, &result);

    insertBucket->destroy(insertBucket);
    predicates->clear(predicates);
    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestExecuteInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    int ret = OH_Rdb_Execute(nullptr, createTableSql);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestExecuteV2InvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Data_Values *args = OH_Values_Create();

    OH_Data_Value *result1 = OH_Value_Create();

    int ret = OH_Rdb_ExecuteV2(nullptr, createTableSql, args, &result1);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    OH_Values_Destroy(args);
    OH_Value_Destroy(result1);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestExecuteV2Error(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Data_Value *result1 = nullptr;

    OH_Rdb_ExecuteV2(testRdbStore, createTableSql, nullptr, &result1);

    const char *invalidSql = "SELECT * FROM non_existent_table";

    OH_Data_Value *invalidResult = nullptr;

    int ret = OH_Rdb_ExecuteV2(testRdbStore, invalidSql, nullptr, &invalidResult);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_ERROR ? g_rSErrorCode : -1, &result);

    OH_Value_Destroy(result1);
    OH_Value_Destroy(invalidResult);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestBeginTransactionInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    int ret = OH_Rdb_BeginTransaction(nullptr);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);
    return result;
}

napi_value TestBeginTransactionSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    int ret = OH_Rdb_BeginTransaction(testRdbStore);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);

    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);
    return result;
}

napi_value TestRollBackInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    int ret = OH_Rdb_RollBack(nullptr);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestRollBackSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_Rdb_BeginTransaction(testRdbStore);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    int ret = OH_Rdb_RollBack(testRdbStore);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);

    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestCommitInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_Rdb_BeginTransaction(testRdbStore);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    int ret = OH_Rdb_Commit(nullptr);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestCommitSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_Rdb_BeginTransaction(testRdbStore);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    int ret = OH_Rdb_Commit(testRdbStore);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);

    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestBackupInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;

    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_SQLITE);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);

    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testStore, "test", insertBucket);

    char backupPath[100];
    int ret = OH_Rdb_Backup(nullptr, backupPath);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);
    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);

    return result;
}

napi_value TestBackupSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;

    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_SQLITE);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);

    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testStore, "test", insertBucket);

    char dbPath[] = "backup1.db";
    std::string testPath1 = std::string(RelationalStoreTest::RDB_TEST) + std::string(dbPath);
    int ret = OH_Rdb_Backup(testStore, testPath1.c_str());

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);
    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);

    return result;
}

napi_value TestRestoreInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;

    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_SQLITE);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);

    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testStore, "test", insertBucket);

    char backupPath[100];
    OH_Rdb_Backup(testStore, backupPath);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    errCode = OH_Rdb_Delete(testStore, predicates);

    int ret = OH_Rdb_Restore(nullptr, backupPath);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    insertBucket->destroy(insertBucket);
    predicates->destroy(predicates);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);

    return result;
}

napi_value TestRestoreSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;

    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_SQLITE);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);

    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testStore, "test", insertBucket);

    char dbPath[] = "backup.db";
    std::string testPath1 = std::string(RelationalStoreTest::RDB_TEST) + std::string(dbPath);
    OH_Rdb_Backup(testStore, testPath1.c_str());
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    errCode = OH_Rdb_Delete(testStore, predicates);

    int ret = OH_Rdb_Restore(testStore, testPath1.c_str());

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);
    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);

    return result;
}

napi_value TestGetVersionInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;

    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_SQLITE);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);

    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);

    int version = 0;
    int ret = OH_Rdb_GetVersion(nullptr, &version);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);
    return result;
}

napi_value TestGetVersionSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;

    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_SQLITE);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);

    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);

    int version = 0;
    int ret = OH_Rdb_GetVersion(testStore, &version);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);
    return result;
}

napi_value TestSetVersionInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;

    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_SQLITE);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);

    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);

    int version = 3;
    int ret = OH_Rdb_SetVersion(nullptr, version);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);
    return result;
}

napi_value TestSetVersionSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;

    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_SQLITE);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);

    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);

    int version = 3;
    int ret = OH_Rdb_SetVersion(testStore, version);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);
    return result;
}

napi_value TestLockRowInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "ZhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "name", valueObject);

    int ret = OH_Rdb_LockRow(nullptr, predicates);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);
    return result;
}

napi_value TestUnlockRowInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";

    OH_Rdb_Execute(testRdbStore, createTableSql);

    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t scoreValue = 60;
    insertBucket->putInt64(insertBucket, "score", scoreValue);

    OH_Rdb_Insert(testRdbStore, "test", insertBucket);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "ZhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "name", valueObject);

    int ret = OH_Rdb_UnlockRow(nullptr, predicates);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestCreateTransactionInvalidParam(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    OH_Rdb_Transaction *trans = nullptr;
    OH_RDB_TransOptions *g_options = OH_RdbTrans_CreateOptions();
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    int ret = OH_Rdb_CreateTransaction(nullptr, g_options, &trans);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ? g_rSInvalidParamCode : -1, &result);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);
    OH_RdbTrans_DestroyOptions(g_options);
    return result;
}

napi_value TestSetLocaleSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbConfig();
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;

    testRdbStore = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);

    int ret = OH_Rdb_SetLocale(testRdbStore, "zh");

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_OK ? 0 : -1, &result);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);

    return result;
}

napi_value TestOHRdbAttachBusy(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    const char *rdbTestPatH1 = "/data/storage/el2/database/com.acts.acttransactiontest/entry";
    OH_Rdb_SetDatabaseDir(configV2, rdbTestPatH1);
    OH_Rdb_SetStoreName(configV2, "rdb_store_test.db");
    OH_Rdb_SetBundleName(configV2, "com.acts.acttransactiontest");
    OH_Rdb_SetModuleName(configV2, "");
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_SQLITE);
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;
    testRdbStore = OH_Rdb_CreateOrOpen(configV2, &errCode);
    OH_Rdb_RollBack(testRdbStore);
    OH_Rdb_Transaction *trans = nullptr;
    OH_RDB_TransOptions *options = OH_RdbTrans_CreateOptions();
    OH_Rdb_CreateTransaction(testRdbStore, options, &trans);
    OH_RdbTrans_DestroyOptions(options);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    OH_Cursor *cursor = OH_Rdb_Query(testRdbStore, predicates, NULL, 0);
    OH_ColumnType type;
    errCode = cursor->getColumnType(cursor, 0, &type);
    size_t attachedNumber = 0;
    auto ret = OH_Rdb_Attach(testRdbStore, configV2, "rdb_attach_test", 3, &attachedNumber);
    napi_create_int32(env, ret == RDB_E_DATABASE_BUSY ? 0 : -1, &result);
    cursor->destroy(cursor);
    predicates->destroy(predicates);
    OH_RdbTrans_Destroy(trans);
    OH_RdbTrans_DestroyOptions(options);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Rdb_DestroyConfig(configV2);
    return result;
}

napi_value TestOHRdbAttachError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    const char *rdbTestPatH1 = "/data/storage/el2/database/com.acts.acttransactiontest/entry6";
    OH_Rdb_SetDatabaseDir(configV2, rdbTestPatH1);
    OH_Rdb_SetStoreName(configV2, "rdb_store_test.db");
    OH_Rdb_SetBundleName(configV2, "com.acts.acttransactiontest");
    OH_Rdb_SetModuleName(configV2, "");
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL5);
    OH_Rdb_SetReadOnly(configV2, false);
    int errCode = 0;
    OH_Rdb_Store *testRdbStore = nullptr;
    testRdbStore = OH_Rdb_CreateOrOpen(configV2, &errCode);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_SetReadOnly(configV2, true);
    testRdbStore = OH_Rdb_CreateOrOpen(configV2, &errCode);
    size_t attachedNumber = 0;
    auto ret = OH_Rdb_Attach(testRdbStore, configV2, "rdb_attach_test", 1, &attachedNumber);
    napi_create_int32(env, ret == RDB_E_ERROR ? 0 : ret, &result);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Rdb_DestroyConfig(configV2);
    return result;
}

napi_value TestOHRdbDetachOk(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    const char *rdbTestPatH1 = "/data/storage/el2/database/com.acts.acttransactiontest/entry";
    OH_Rdb_SetDatabaseDir(configV2, rdbTestPatH1);
    OH_Rdb_SetStoreName(configV2, "rdb_store_test.db");
    OH_Rdb_SetBundleName(configV2, "com.acts.acttransactiontest");
    OH_Rdb_SetModuleName(configV2, "");
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_SQLITE);
    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;
    testRdbStore = OH_Rdb_CreateOrOpen(configV2, &errCode);
    OH_Rdb_RollBack(testRdbStore);
    OH_Rdb_Transaction *trans = nullptr;
    OH_RDB_TransOptions *options = OH_RdbTrans_CreateOptions();
    OH_Rdb_CreateTransaction(testRdbStore, options, &trans);
    OH_RdbTrans_DestroyOptions(options);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    OH_Cursor *cursor = OH_Rdb_Query(testRdbStore, predicates, NULL, 0);
    OH_ColumnType type;
    errCode = cursor->getColumnType(cursor, 0, &type);
    size_t attachedNumber = 0;
    int64_t waitTime = 3;
    auto ret = OH_Rdb_Attach(testRdbStore, configV2, "rdb_attach_test", waitTime, &attachedNumber);
    ret = OH_Rdb_Detach(testRdbStore, "rdb_attach_test", waitTime, &attachedNumber);
    napi_create_int32(env, ret == RDB_OK ? 0 : -1, &result);
    predicates->destroy(predicates);
    cursor->destroy(cursor);
    OH_RdbTrans_Destroy(trans);
    OH_RdbTrans_DestroyOptions(options);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Rdb_DestroyConfig(configV2);
    return result;
}

napi_value TestOHRdbDetachError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    const char *rdbTestPatH1 = "/data/storage/el2/database/com.acts.acttransactiontest/entry6";
    OH_Rdb_SetDatabaseDir(configV2, rdbTestPatH1);
    OH_Rdb_SetStoreName(configV2, "rdb_store_test.db");
    OH_Rdb_SetBundleName(configV2, "com.acts.acttransactiontest");
    OH_Rdb_SetModuleName(configV2, "");
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL5);
    OH_Rdb_SetReadOnly(configV2, false);
    int errCode = 0;
    OH_Rdb_Store *testRdbStore = nullptr;
    testRdbStore = OH_Rdb_CreateOrOpen(configV2, &errCode);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_SetReadOnly(configV2, true);
    testRdbStore = OH_Rdb_CreateOrOpen(configV2, &errCode);
    size_t attachedNumber = 0;
    auto ret = OH_Rdb_Attach(testRdbStore, configV2, "rdb_attach_test", 1, &attachedNumber);
    ret = OH_Rdb_Detach(testRdbStore, "rdb_attach_test", 1, &attachedNumber);
    napi_create_int32(env, ret == RDB_E_ERROR ? 0 : -1, &result);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Rdb_DestroyConfig(configV2);
    return result;
}

napi_value TestOHRdbSubscribeDetails(napi_env env, napi_callback_info info)
{
    napi_value returnCode;
    InitRdbConfig();
    int chmodValue = 0770;
    mkdir(RelationalStoreTest::RDB_CONFIG.dataBaseDir, chmodValue);
    int errCode = 0;
    OH_Rdb_Store *store = nullptr;
    store = OH_Rdb_GetOrOpen(&RelationalStoreTest::RDB_CONFIG, &errCode);
    Rdb_DetailsObserver detailObserver = RdbSubscribeDetailCallback;
    Rdb_DataObserver detailObs = {.context = nullptr, .callback.detailsObserver = detailObserver};
    int ret = OH_Rdb_Subscribe(store, RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS, &detailObs);
    napi_create_double(env, ret == RDB_OK ? 0 : -1, &returnCode);
    OH_Rdb_CloseStore(store);
    OH_Rdb_DeleteStore(&RelationalStoreTest::RDB_CONFIG);
    return returnCode;
}

napi_value TestSetTokenizerNotSupported(napi_env env, napi_callback_info info)
{
    int numType = 0;
    OH_Rdb_GetSupportedDbType(&numType);
    napi_value result;
    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_CAYLEY);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);
    Rdb_Tokenizer token = Rdb_Tokenizer::RDB_ICU_TOKENIZER;
    int ret = OH_Rdb_SetTokenizer(configV2_, token);
    if (ret == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED || ret == OH_Rdb_ErrCode::RDB_OK) {
        napi_create_int32(env, ret, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    OH_Rdb_DestroyConfig(configV2_);
    return result;
}

napi_value TestRollBackByTrxIdSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;
    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_CAYLEY);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);
    int numType = 0;
    OH_Rdb_GetSupportedDbType(&numType);
    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);
    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test1 ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";
    OH_Rdb_Execute(testStore, createTableSql);
    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->clear(insertBucket);
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t int64Value = 60;
    insertBucket->putInt64(insertBucket, "score", int64Value);
    OH_Rdb_Insert(testStore, "test1", insertBucket);
    int64_t trxId = 0;
    OH_Rdb_BeginTransWithTrxId(testStore, &trxId);
    int ret = OH_Rdb_RollBackByTrxId(testStore, trxId);
    if (ret == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED || ret == OH_Rdb_ErrCode::RDB_OK) {
        napi_create_int32(env, ret, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);
    return result;
}

napi_value TestCommitByTrxIdSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;
    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2_, RelationalStoreTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2_, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2_, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2_, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetDbType(configV2_, RDB_CAYLEY);
    OH_Rdb_SetEncrypted(configV2_, false);
    OH_Rdb_SetSecurityLevel(configV2_, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2_, RDB_SECURITY_AREA_EL1);
    int numType = 0;
    OH_Rdb_GetSupportedDbType(&numType);
    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);
    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";
    OH_Rdb_Execute(testStore, createTableSql);
    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t int64Value = 60;
    insertBucket->putInt64(insertBucket, "score", int64Value);
    OH_Rdb_Insert(testStore, "test", insertBucket);
    int64_t trxId = 0;
    OH_Rdb_BeginTransWithTrxId(testStore, &trxId);
    int ret = OH_Rdb_CommitByTrxId(testStore, trxId);
    if (ret == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED || ret == OH_Rdb_ErrCode::RDB_OK) {
        napi_create_int32(env, ret, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);
    return result;
}

napi_value TestSubscribeSuccess(napi_env env, napi_callback_info info)
{
    static Rdb_DetailsObserver detailObserver = RdbSubscribeDetailCallback;
    static const Rdb_DataObserver detailObs = {.context = nullptr, .callback.detailsObserver = detailObserver};
    napi_value result;
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    const char *rdbTestPatH1 = "/data/storage/el2/database/com.acts.acttransactiontest/entry7";
    OH_Rdb_SetDatabaseDir(configV2, rdbTestPatH1);
    OH_Rdb_SetStoreName(configV2, RelationalStoreTest::g_storeName);
    OH_Rdb_SetBundleName(configV2, RelationalStoreTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2, RelationalStoreTest::g_moduleName);
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_SQLITE);
    int errCode = 0;
    OH_Rdb_Store *testRdbStore = OH_Rdb_CreateOrOpen(configV2, &errCode);
    int ret = OH_Rdb_Subscribe(testRdbStore, RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS, &detailObs);
    napi_create_int32(env, ret == RDB_OK ? 0 : -1, &result);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DestroyConfig(configV2);
    return result;
}