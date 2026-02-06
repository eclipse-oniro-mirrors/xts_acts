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

#include "RdbErrorCodeTest.h"
#include "napi/native_api.h"
#include <cstddef>
#include <database/rdb/oh_values_bucket.h>
#include <database/rdb/relational_store.h>
#include <database/rdb/relational_store_error_code.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>

int g_rEmptyTableNameCode = 14800005;
int g_rInvalidColumnTypeCode = 14800009;
int g_rNoTransInSessionCode = 14800016;
int g_rNoRowInQueryCode = 14800018;
int g_rInvalidObjectTypeCode = 14800020;
int g_rType = 2;

namespace RdbErrorCodeTest {
const char *RDB_TEST = "/data/storage/el2/database/com.acts.acttransactiontest/entry";
char g_storeName[20] = "rdb_store_test.db";
char g_bundleName[100] = "com.acts.acttransactiontest";
char g_moduleName[100] = "";
OH_Rdb_Config RDB_CONFIG;
} // namespace RdbErrorCodeTest

void InitRdbErrorCodeConfig()
{
    RdbErrorCodeTest::RDB_CONFIG.dataBaseDir = RdbErrorCodeTest::RDB_TEST;
    RdbErrorCodeTest::RDB_CONFIG.storeName = RdbErrorCodeTest::g_storeName;
    RdbErrorCodeTest::RDB_CONFIG.bundleName = RdbErrorCodeTest::g_bundleName;
    RdbErrorCodeTest::RDB_CONFIG.moduleName = RdbErrorCodeTest::g_moduleName;
    RdbErrorCodeTest::RDB_CONFIG.securityLevel = OH_Rdb_SecurityLevel::S1;
    RdbErrorCodeTest::RDB_CONFIG.isEncrypt = false;
    RdbErrorCodeTest::RDB_CONFIG.selfSize = sizeof(OH_Rdb_Config);
    RdbErrorCodeTest::RDB_CONFIG.area = RDB_SECURITY_AREA_EL1;
}

void InitRdbErrorCodeConfigV2(OH_Rdb_ConfigV2 *configV2)
{
    OH_Rdb_SetDatabaseDir(configV2, RdbErrorCodeTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2, RdbErrorCodeTest::g_storeName);
    OH_Rdb_SetBundleName(configV2, RdbErrorCodeTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2, RdbErrorCodeTest::g_moduleName);
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_CAYLEY);
}

void InitRdbSqliteConfigV2(OH_Rdb_ConfigV2 *configV2)
{
    OH_Rdb_SetDatabaseDir(configV2, RdbErrorCodeTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2, RdbErrorCodeTest::g_storeName);
    OH_Rdb_SetBundleName(configV2, RdbErrorCodeTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2, RdbErrorCodeTest::g_moduleName);
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_SQLITE);
}

void AddRdbErrorCodeTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testRdbError", nullptr, TestRdbError, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testEmptyTableName", nullptr, TestEmptyTableName, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testInvalidColumnType", nullptr, TestInvalidColumnType, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testNoRowInQuery", nullptr, TestNoRowInQuery, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNoTransactionInSession", nullptr, TestNoTransactionInSession, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testInvalidColumnIndex", nullptr, TestInvalidColumnIndex, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"testAlreadyClosed", nullptr, TestAlreadyClosed, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNotSupportedAttachInWalMode", nullptr, TestNotSupportedAttachInWalMode, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"testAttachDatabaseBusy", nullptr, TestAttachDatabaseBusy, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testGoToNextRowResultClosed", nullptr, TestGoToNextRowResultClosed, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testGoToNextRowAfterLast", nullptr, TestGoToNextRowAfterLast, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"testInvalidObjectType", nullptr, TestInvalidObjectType, nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value TestRdbError(napi_env env, napi_callback_info info)
{
    napi_value result;
    InitRdbErrorCodeConfig();

    OH_Rdb_Store *testRdbStore = nullptr;

    int errCode = 0;
    char table[] = "test";

    testRdbStore = OH_Rdb_GetOrOpen(&RdbErrorCodeTest::RDB_CONFIG, &errCode);

    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "ZhangSan");
    int64_t data2Value = 12000;
    valueBucket->putInt64(valueBucket, "data2", data2Value);
    double data3Value = 12.15;
    valueBucket->putReal(valueBucket, "data3", data3Value);

    int ret = OH_Rdb_Insert(testRdbStore, table, valueBucket);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_ERR ? -1 : 1, &result);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStore(&RdbErrorCodeTest::RDB_CONFIG);
    valueBucket->destroy(valueBucket);
    return result;
}

napi_value TestEmptyTableName(napi_env env, napi_callback_info info)
{
    napi_value result;

    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();

    OH_Rdb_SetDatabaseDir(configV2, RdbErrorCodeTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2, RdbErrorCodeTest::g_storeName);
    OH_Rdb_SetBundleName(configV2, RdbErrorCodeTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2, RdbErrorCodeTest::g_moduleName);
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_CAYLEY);

    OH_Rdb_Store *store = nullptr;
    int errCode = 0;
    store = OH_Rdb_CreateOrOpen(configV2, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "data1 TEXT, "
                                 "data2 INT64, "
                                 "data3 REAL)";

    OH_Rdb_Execute(store, createTableSql);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("");
    int ret = OH_Rdb_LockRow(store, predicates);
    OH_Rdb_CloseStore(store);
    OH_Rdb_DeleteStoreV2(configV2);
    predicates->destroy(predicates);
    if (ret == OH_Rdb_ErrCode::RDB_E_EMPTY_TABLE_NAME || ret == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED) {
        napi_create_int32(env, ret, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

napi_value TestInvalidColumnType(napi_env env, napi_callback_info info)
{
    napi_value result;
    int numType = 0;
    OH_Rdb_GetSupportedDbType(&numType);
    if (numType != g_rType) {
        napi_create_int32(env, g_rInvalidColumnTypeCode, &result);
        return result;
    }
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    InitRdbErrorCodeConfigV2(configV2);
    OH_Rdb_Store *store = nullptr;
    int errCode = 0;
    store = OH_Rdb_CreateOrOpen(configV2, &errCode);
    char createTableSql[] =
        "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 floatvector(2), data2 REAL);";
    OH_Rdb_ExecuteByTrxId(store, 0, createTableSql);
    OH_Rdb_ExecuteV2(store, "INSERT INTO test (id, data1, data2) VALUES (0, '[3.4, 4.5]', 128.0);", nullptr, nullptr);
    const char *sql = "SELECT * FROM test;";
    OH_Data_Values *values = OH_Values_Create();
    OH_Cursor *cursor = OH_Rdb_ExecuteQueryV2(store, sql, values);
    cursor->goToNextRow(cursor);
    int cnt = 0;
    cursor->getColumnCount(cursor, &cnt);
    int rowCnt = 0;
    cursor->getRowCount(cursor, &rowCnt);
    int columnIndex = 0;
    const char *name = "data2";
    cursor->getColumnIndex(cursor, name, &columnIndex);
    OH_ColumnType type;
    cursor->getColumnType(cursor, columnIndex, &type);
    size_t size = 0;
    int ret = cursor->getSize(cursor, columnIndex, &size);
    OH_Rdb_CloseStore(store);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Values_Destroy(values);
    cursor->destroy(cursor);
    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_COLUMN_TYPE ? g_rInvalidColumnTypeCode : 1, &result);
    return result;
}

napi_value TestNoRowInQuery(napi_env env, napi_callback_info info)
{
    napi_value result;

    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();

    OH_Rdb_SetDatabaseDir(configV2, RdbErrorCodeTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2, RdbErrorCodeTest::g_storeName);
    OH_Rdb_SetBundleName(configV2, RdbErrorCodeTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2, RdbErrorCodeTest::g_moduleName);
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_CAYLEY);

    OH_Rdb_Store *store = nullptr;
    int errCode = 0;
    store = OH_Rdb_CreateOrOpen(configV2, &errCode);

    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "data1 TEXT, "
                                 "data2 INT64, "
                                 "data3 REAL)";

    OH_Rdb_Execute(store, createTableSql);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    int ret = OH_Rdb_LockRow(store, predicates);
    OH_Rdb_CloseStore(store);
    OH_Rdb_DeleteStoreV2(configV2);
    predicates->destroy(predicates);
    if (ret == OH_Rdb_ErrCode::RDB_E_NO_ROW_IN_QUERY || ret == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED) {
        napi_create_int32(env, ret, &result);
    } else {
        napi_create_int32(env, -1, &result);
    }
    return result;
}

napi_value TestNoTransactionInSession(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(configV2, RdbErrorCodeTest::RDB_TEST);
    OH_Rdb_SetStoreName(configV2, RdbErrorCodeTest::g_storeName);
    OH_Rdb_SetBundleName(configV2, RdbErrorCodeTest::g_bundleName);
    OH_Rdb_SetModuleName(configV2, RdbErrorCodeTest::g_moduleName);
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_SQLITE);

    OH_Rdb_Store *testRdbStore = nullptr;
    int errCode = 0;
    testRdbStore = OH_Rdb_CreateOrOpen(configV2, &errCode);

    int ret = OH_Rdb_RollBack(testRdbStore);

    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Rdb_DestroyConfig(configV2);

    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_NO_TRANSACTION_IN_SESSION ? g_rNoTransInSessionCode : -1,
                      &result);
    return result;
}

napi_value TestInvalidColumnIndex(napi_env env, napi_callback_info info)
{
    napi_value result;
    int numType = 0;
    OH_Rdb_GetSupportedDbType(&numType);
    if (numType != g_rType) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    InitRdbErrorCodeConfigV2(configV2);
    OH_Rdb_Store *store = nullptr;
    int errCode = 0;
    store = OH_Rdb_CreateOrOpen(configV2, &errCode);
    char createTableSql[] =
        "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 floatvector(2), data2 REAL);";
    OH_Rdb_ExecuteByTrxId(store, 0, createTableSql);
    OH_Rdb_ExecuteV2(store, "INSERT INTO test (id, data1, data2) VALUES (0, '[3.4, 4.5]', 128.0);", nullptr, nullptr);
    const char *sql = "SELECT * FROM test;";
    OH_Data_Values *values = OH_Values_Create();
    OH_Cursor *cursor = OH_Rdb_ExecuteQueryV2(store, sql, values);
    cursor->goToNextRow(cursor);
    int cnt = 0;
    cursor->getColumnCount(cursor, &cnt);
    int rowCnt = 0;
    cursor->getRowCount(cursor, &rowCnt);
    int columnIndex = 10;
    size_t size = 0;
    int ret = cursor->getSize(cursor, columnIndex, &size);
    OH_Rdb_CloseStore(store);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Values_Destroy(values);
    cursor->destroy(cursor);
    napi_create_int32(env, ret == RDB_E_INVALID_COLUMN_INDEX ? 0 : -1, &result);
    return result;
}

napi_value TestAlreadyClosed(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    const char *rdbTestPatH1 = "/data/storage/el2/database/com.acts.acttransactiontest/entry/1";
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
    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "score INT64)";
    OH_Data_Value *res = OH_Value_Create();
    OH_RdbTrans_Execute(trans, createTableSql, nullptr, &res);
    OH_Rdb_CloseStore(testRdbStore);
    bool readOnly = true;
    OH_Rdb_SetReadOnly(configV2, readOnly);
    OH_Rdb_Store *testRdbStore1 = nullptr;
    testRdbStore1 = OH_Rdb_CreateOrOpen(configV2, &errCode);
    OH_Rdb_SetTokenizer(configV2, Rdb_Tokenizer::RDB_ICU_TOKENIZER);
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "name", "ZhangSan");
    int64_t int64Value = 99;
    valueBucket->putInt64(valueBucket, "score", int64Value);
    char table[] = "test";
    int64_t rowId = -1;
    int ret = OH_RdbTrans_Insert(trans, table, valueBucket, &rowId);

    OH_Value_Destroy(res);
    OH_RdbTrans_Destroy(trans);
    OH_RdbTrans_DestroyOptions(options);
    valueBucket->destroy(valueBucket);
    OH_Rdb_CloseStore(testRdbStore1);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Rdb_DestroyConfig(configV2);
    napi_create_int32(env, ret == RDB_E_ALREADY_CLOSED ? 0 : -1, &result);
    return result;
}

napi_value TestNotSupportedAttachInWalMode(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    InitRdbSqliteConfigV2(configV2);
    OH_Rdb_Store *store = nullptr;
    int errCode = 0;
    store = OH_Rdb_CreateOrOpen(configV2, &errCode);
    OH_Rdb_Execute(store, "PRAGMA journal_mode=WAL;");
    errCode = OH_Rdb_Execute(store, "ATTACH DATABASE '/data/storage/el1/database/aux.db' AS aux;");
    napi_create_int32(env, errCode == RDB_E_NOT_SUPPORTED_ATTACH_IN_WAL_MODE ? 0 : -1, &result);
    return result;
}

napi_value TestAttachDatabaseBusy(napi_env env, napi_callback_info info)
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
    OH_RDB_TransOptions *options = OH_RdbTrans_CreateOptions();
    OH_RdbTrans_DestroyOptions(options);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    OH_Cursor *cursor = OH_Rdb_Query(testRdbStore, predicates, NULL, 0);
    OH_ColumnType type;
    errCode = cursor->getColumnType(cursor, 0, &type);
    size_t attachedNumber = 0;
    auto ret = OH_Rdb_Attach(testRdbStore, configV2, "rdb_attach_test", 1, &attachedNumber);
    napi_create_int32(env, ret == RDB_E_DATABASE_BUSY ? 0 : -1, &result);
    cursor->destroy(cursor);
    predicates->destroy(predicates);
    OH_RdbTrans_DestroyOptions(options);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Rdb_DestroyConfig(configV2);
    return result;
}

napi_value TestGoToNextRowResultClosed(napi_env env, napi_callback_info info)
{
    const char *rdbTestPatH1 = "/data/storage/el2/database/com.acts.acttransactiontest/entry1/";
    RdbErrorCodeTest::RDB_CONFIG.dataBaseDir = rdbTestPatH1;
    RdbErrorCodeTest::RDB_CONFIG.storeName = "rdb_store_test.db";
    RdbErrorCodeTest::RDB_CONFIG.bundleName = "com.example.buchongndktest";
    RdbErrorCodeTest::RDB_CONFIG.moduleName = "";
    RdbErrorCodeTest::RDB_CONFIG.securityLevel = OH_Rdb_SecurityLevel::S1;
    RdbErrorCodeTest::RDB_CONFIG.isEncrypt = false;
    RdbErrorCodeTest::RDB_CONFIG.selfSize = sizeof(OH_Rdb_Config);
    RdbErrorCodeTest::RDB_CONFIG.area = RDB_SECURITY_AREA_EL1;
    int errCode1 = 0;
    OH_Rdb_Store *testStore = OH_Rdb_GetOrOpen(&RdbErrorCodeTest::RDB_CONFIG, &errCode1);
    char querySql[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    OH_Values_PutInt(values, 1);

    OH_Cursor *cursor = OH_Rdb_ExecuteQueryV2(testStore, querySql, values);
    float test[2] = {5.5f, 6.6f};
    OH_Data_Values *values1 = OH_Values_Create();
    size_t length = 2;
    OH_Values_PutFloatVector(values1, test, length);
    OH_Values_PutInt(values1, 1);
    OH_Rdb_ExecuteV2(testStore, "update test set data1 = ? where id = ?", values1, nullptr);

    cursor = OH_Rdb_ExecuteQueryV2(testStore, querySql, values);
    int moveResult = cursor->goToNextRow(cursor);

    napi_value result;
    napi_create_int32(env, moveResult == RDB_E_STEP_RESULT_CLOSED ? 0 : -1, &result);
    OH_Values_Destroy(values);
    cursor->destroy(cursor);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStore(&RdbErrorCodeTest::RDB_CONFIG);
    return result;
}

napi_value TestGoToNextRowAfterLast(napi_env env, napi_callback_info info)
{
    InitRdbErrorCodeConfig();
    int errCode1 = 0;
    OH_Rdb_Store *testStore = OH_Rdb_GetOrOpen(&RdbErrorCodeTest::RDB_CONFIG, &errCode1);
    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "data1 TEXT, "
                                 "data2 INT64, "
                                 "data3 REAL)";
    OH_Rdb_Execute(testStore, createTableSql);
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "ZhangSan");
    int64_t data2Value = 12800;
    valueBucket->putInt64(valueBucket, "data2", data2Value);
    double data3Value = 128.0;
    valueBucket->putReal(valueBucket, "data3", data3Value);
    OH_Rdb_Insert(testStore, "test", valueBucket);
    char querySql[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    OH_Values_PutInt(values, 1);
    OH_Cursor *cursor = OH_Rdb_ExecuteQueryV2(testStore, querySql, values);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    float test[2] = {5.5f, 6.6f};
    OH_Data_Values *values1 = OH_Values_Create();
    size_t length = 2;
    OH_Values_PutFloatVector(values1, test, length);
    OH_Values_PutInt(values1, 1);
    OH_Rdb_ExecuteV2(testStore, "update test set data1 = ? where id = ?", values1, nullptr);
    cursor = OH_Rdb_ExecuteQueryV2(testStore, querySql, values);
    cursor->getRowCount(cursor, &rowCount);
    int moveResult = cursor->goToNextRow(cursor);
    moveResult = cursor->goToNextRow(cursor);
    napi_value result;
    napi_create_int32(env, moveResult == RDB_E_STEP_RESULT_IS_AFTER_LAST ? 0 : -1, &result);
    OH_Values_Destroy(values);
    OH_Values_Destroy(values1);
    cursor->destroy(cursor);
    valueBucket->destroy(valueBucket);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStore(&RdbErrorCodeTest::RDB_CONFIG);
    return result;
}

napi_value TestInvalidObjectType(napi_env env, napi_callback_info info)
{
    napi_value result;
    int errCode = 0;
    OH_Rdb_Store *testStore = nullptr;
    OH_Rdb_ConfigV2 *configV2_ = nullptr;
    configV2_ = OH_Rdb_CreateConfig();
    InitRdbSqliteConfigV2(configV2_);
    testStore = OH_Rdb_CreateOrOpen(configV2_, &errCode);
    const char *createTableSql = "CREATE TABLE IF NOT EXISTS test ("
                                 "id INT64 PRIMARY KEY, "
                                 "name TEXT, "
                                 "data asset, "
                                 "score INT64)";
    OH_Rdb_Execute(testStore, createTableSql);
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    OH_Data_Asset_SetName(asset, "sss");
    OH_Data_Asset_SetUri(asset, "uri");
    OH_VBucket *insertBucket = OH_Rdb_CreateValuesBucket();
    insertBucket->putInt64(insertBucket, "id", 1);
    insertBucket->putText(insertBucket, "name", "ZhangSan");
    int64_t int64Value = 60;
    insertBucket->putInt64(insertBucket, "score", int64Value);
    OH_VBucket_PutAsset(insertBucket, "data", asset);
    OH_Rdb_Insert(testStore, "test", insertBucket);
    const char *sql = "SELECT * FROM test;";
    OH_Data_Values *values = OH_Values_Create();
    OH_Cursor *cursor = OH_Rdb_ExecuteQueryV2(testStore, sql, values);
    int cnt = 0;
    cursor->getRowCount(cursor, &cnt);
    int cnt1 = 0;
    cursor->getColumnCount(cursor, &cnt1);
    const char name[10] = "data";
    int cli = 0;
    cursor->getColumnIndex(cursor, name, &cli);
    cursor->goToNextRow(cursor);
    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    unsigned char value;
    int ret = cursor->getBlob(cursor, cli, &value, size);
    napi_create_int32(env, ret == OH_Rdb_ErrCode::RDB_E_INVALID_OBJECT_TYPE ? g_rInvalidObjectTypeCode : -1, &result);
    cursor->destroy(cursor);
    insertBucket->destroy(insertBucket);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStoreV2(configV2_);
    OH_Rdb_DestroyConfig(configV2_);
    return result;
}