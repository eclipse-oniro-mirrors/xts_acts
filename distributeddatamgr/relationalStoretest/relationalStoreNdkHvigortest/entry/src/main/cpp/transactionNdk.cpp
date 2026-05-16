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
#include <iostream>
#include <unistd.h>
#include "napi/native_api.h"
#include "hilog/log.h"
#include <string>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <cstdint>
#include "common.h"
#include <sys/stat.h>
#include <sys/types.h>
#include <thread>
#include "database/data/oh_data_value.h"
#include "database/data/oh_data_values.h"
#include "database/data/oh_data_values_buckets.h"
#include "database/rdb/relational_store.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/oh_rdb_transaction.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/oh_values_bucket.h"
#include "database/data/data_asset.h"
#include "database/rdb/oh_value_object.h"
#include "database/rdb/oh_rdb_types.h"
#include "database/rdb/oh_predicates.h"
#include "database/rdb/oh_cursor.h"

#define DIRMODE 0770

#define WAIT_TIME 3

const char *TAG = "transaction_ctest";
const char *RDB_TEST_PATH = "/data/storage/el2/database/com.example.buchongndktest/entry/";
static OH_Rdb_Store *g_transStore;
static OH_RDB_TransOptions *g_options;
static OH_Rdb_Config config_;
OH_Rdb_Store *store_;
OH_Rdb_Store *storeTestRdbStore_;
float test_[] = { 1.2, 2.3 };

static OH_Rdb_ConfigV2 *InitRdbConfig(napi_env env)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_ExecuteQueryV2 is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_vector_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    return config;
}

static void InitRdbConfig()
{
    config_.dataBaseDir = RDB_TEST_PATH;
        config_.storeName = "rdb_store_test.db";
        config_.bundleName = "com.example.buchongndktest";
        config_.moduleName = "";
        config_.securityLevel = OH_Rdb_SecurityLevel::S1;
        config_.isEncrypt = false;
        config_.selfSize = sizeof(OH_Rdb_Config);
        config_.area = RDB_SECURITY_AREA_EL1;
}

static napi_value RdbstoreSetUpTestCase(napi_env env, napi_callback_info info)
{
    InitRdbConfig();
    int chmodValue = 0770;
    mkdir(config_.dataBaseDir, chmodValue);
    int errCode = 0;
    char table[] = "test";
    g_transStore = OH_Rdb_GetOrOpen(&config_, &errCode);
    NAPI_ASSERT(env, g_transStore != NULL, "OH_Rdb_Execute  dropTableSql is fail.");
    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode = OH_Rdb_Execute(g_transStore, createTableSql);
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = { 1, 2, 3, 4, 5 };
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(g_transStore, table, valueBucket);
    const int SUCCESS = 1;
    NAPI_ASSERT(env, errCode == SUCCESS, "OH_Rdb_Insert is fail.");
    const int ID = 2;
    const int PHONE_NUMBER = 13800;
    const double HEIGHT = 200.1;
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", ID);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", PHONE_NUMBER);
    valueBucket->putReal(valueBucket, "data3", HEIGHT);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(g_transStore, table, valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_CreateConfig is fail.");
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 3);
    valueBucket->putText(valueBucket, "data1", "wangWu");
    const int DATA2_VALUE = 14800;
    valueBucket->putInt64(valueBucket, "data2", DATA2_VALUE);
    const double HEIGHT_DATA = 300.1;
    valueBucket->putReal(valueBucket, "data3", HEIGHT_DATA);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGHI");
    errCode = OH_Rdb_Insert(g_transStore, table, valueBucket);
    NAPI_ASSERT(env, errCode == 3, "OH_Rdb_CreateConfig is fail.");
    valueBucket->destroy(valueBucket);
    g_options = OH_RdbTrans_CreateOptions();
    NAPI_ASSERT(env, g_options != nullptr, "OH_Rdb_CreateConfig is fail.");
    int ret = OH_RdbTransOption_SetType(g_options, RDB_TRANS_BUTT);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_CreateConfig is fail.");
    ret = OH_RdbTransOption_SetType(g_options, RDB_TRANS_DEFERRED);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value RdbstoreTearDownTestCase(napi_env env, napi_callback_info info)
{
    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    int errCode = OH_Rdb_Execute(g_transStore, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateConfig is fail.");
    delete g_transStore;
    g_transStore = NULL;
    OH_Rdb_DeleteStore(&config_);
    OH_RdbTrans_DestroyOptions(g_options);
    g_options = nullptr;
    
    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    return result;
}

static void FillDataValues(napi_env env, OH_Data_Values *values)
{
    NAPI_ASSERT_RETURN_VOID(env, values != nullptr, "OH_Rdb_Backup1 is fail.");
    OH_Data_Value *value = OH_Value_Create();
    int ret = OH_Value_PutInt(nullptr, 1);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_Backup1 is fail.");
    ret = OH_Value_PutInt(value, 1);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Backup1 is fail.");
    ret = OH_Values_Put(nullptr, value);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_Backup1 is fail.");
    ret = OH_Values_Put(values, nullptr);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_Backup1 is fail.");
    ret = OH_Values_Put(values, value);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Backup1 is fail.");
    ret = OH_Value_Destroy(value);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Backup1 is fail.");
    ret = OH_Values_PutInt(values, 2);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Values_PutInt is fail.");
    ret = OH_Values_PutReal(values, 1.1);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Values_PutReal is fail.");
    ret = OH_Values_PutText(values, "1");
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Values_PutText is fail.");
    unsigned char val[] = {1, 2};
    ret = OH_Values_PutBlob(values, val, sizeof(val) / sizeof(val[0]));
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Values_PutBlob is fail.");
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    ret = OH_Data_Asset_SetName(asset, "name");
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Data_Asset_SetName is fail.");
    ret = OH_Values_PutAsset(values, asset);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Values_PutAsset is fail.");
    OH_Data_Asset_DestroyOne(asset);
    Data_Asset **assets = OH_Data_Asset_CreateMultiple(2);
    ret = OH_Data_Asset_SetName(assets[0], "name1");
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Backup1 is fail.");
    ret = OH_Data_Asset_SetName(assets[1], "name2");
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Backup1 is fail.");
    const int ASSET_COUNT = 2;
    ret = OH_Values_PutAssets(values, assets, ASSET_COUNT);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Backup1 is fail.");
    ret = OH_Data_Asset_DestroyMultiple(assets, 2);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Backup1 is fail.");
    uint64_t bigInt[] = {1, 2, 3, 4, 5};
    ret = OH_Values_PutUnlimitedInt(values, 0, bigInt, sizeof(bigInt) / sizeof(bigInt[0]));
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Backup1 is fail.");
}

static napi_value OH_Rdb_Transaction0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_Transaction *trans = nullptr;
    NAPI_ASSERT(env, g_transStore != NULL, "OH_Rdb_Execute  g_transStore is fail.");
    NAPI_ASSERT(env, g_options != NULL, "OH_Rdb_Execute  g_options is fail.");
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetBundleName2 ret= %{public}d", ret);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "trans != nullptr is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_CreateTransaction0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "test";
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail.");
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 4);
    valueBucket->putText(valueBucket, "data1", "test_name4");
    const int DATA2_VALUE = 14800;
    valueBucket->putInt64(valueBucket, "data2", DATA2_VALUE);
    const double DATA3_VALUE = 300.1;
    valueBucket->putReal(valueBucket, "data3", DATA3_VALUE);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGHI");
    int64_t rowId = -1;
    ret = OH_RdbTrans_Insert(trans, table, valueBucket, &rowId);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Insert is fail.");
    NAPI_ASSERT(env, rowId == 4, "OH_RdbTrans_Insert is fail.");
    valueBucket->destroy(valueBucket);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Destroy is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_RdbTrans_Rollback0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "test";
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putText(valueBucket, "data1", "test_name4");
    const int DATA2_VALUE = 14800;
    valueBucket->putInt64(valueBucket, "data2", DATA2_VALUE);
    const double DATA3_VALUE = 300.1;
    valueBucket->putReal(valueBucket, "data3", DATA3_VALUE);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGHI");
    int64_t rowId = -1;
    ret = OH_RdbTrans_Insert(trans, table, valueBucket, &rowId);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    NAPI_ASSERT(env, rowId == 4, "OH_Rdb_CreateConfig is fail.");
    ret = OH_RdbTrans_Rollback(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    valueBucket->destroy(valueBucket);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_RdbTrans_Query0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "test";
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction is fail.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates(table);
    const char *columns[] = {"id", "data1"};
    OH_Cursor *cursor = OH_RdbTrans_Query(nullptr, predicates, columns, 2);
    NAPI_ASSERT(env, cursor == nullptr, "OH_RdbTrans_Query is fail.");
    cursor = OH_RdbTrans_Query(trans, nullptr, columns, 2);
    NAPI_ASSERT(env, cursor == nullptr, "OH_RdbTrans_Query is fail.");
    cursor = OH_RdbTrans_Query(trans, predicates, nullptr, 0);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_CreateConfig is fail.");
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount is fail.");
    ret = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, ret == 0, "goToNextRow is fail.");
    int64_t id;
    cursor->getInt64(cursor, 0, &id);
    NAPI_ASSERT(env, id == 1, "getInt64 is fail.");
    char data1[15];
    cursor->getText(cursor, 1, data1, 15);
    NAPI_ASSERT(env, strcmp(data1, "zhangSan") == 0, "getInt64 is fail.");
    int64_t data2;
    cursor->getInt64(cursor, 2, &data2);
    NAPI_ASSERT(env, data2 == 12800, "OH_Rdb_CreateConfig is fail.");
    cursor->destroy(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_VBuckets_Create0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "test";
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction is fail.");
    OH_VBucket *row1 = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, row1 != nullptr, "OH_Rdb_CreateValuesBucket is fail.");

    row1->putInt64(row1, "id", 4);
    row1->putText(row1, "data1", "test_name4");
    const int DATA2_VALUE = 14800;
    row1->putInt64(row1, "data2", DATA2_VALUE);
    const double DATA3_VALUE = 300.1;
    row1->putReal(row1, "data3", DATA3_VALUE);
    row1->putText(row1, "data5", "ABCDEFGHI");
    OH_VBucket *row2 = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, row2 != nullptr, "OH_Rdb_CreateValuesBucket is fail.");

    row2->putInt64(row2, "id", 5);
    row2->putText(row2, "data1", "test_name5");
    const double DATA4_VALUE = 15800;
    const double DATA5_VALUE = 500.1;
    row2->putInt64(row2, "data2", DATA4_VALUE);
    row2->putReal(row2, "data3", DATA5_VALUE);
    row2->putText(row2, "data5", "ABCDEFGHI");
    OH_Data_VBuckets *rows = OH_VBuckets_Create();
    NAPI_ASSERT(env, rows != nullptr, "OH_VBuckets_Create is fail.");
    ret = OH_VBuckets_PutRow(rows, row1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBuckets_PutRow is fail.");

    size_t count = -1;
    ret = OH_VBuckets_RowCount(rows, &count);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBuckets_RowCount is fail.");
    NAPI_ASSERT(env, count == 1, "OH_VBuckets_RowCount is fail.");
    ret = OH_VBuckets_PutRow(rows, row2);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    ret = OH_VBuckets_RowCount(rows, &count);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    const int EXPECTED_COUNT = 2;
    NAPI_ASSERT(env, count == EXPECTED_COUNT, "OH_Rdb_CreateConfig is fail.");

    int64_t changes = -1;
    ret = OH_RdbTrans_BatchInsert(trans, table, rows, RDB_CONFLICT_NONE, &changes);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_BatchInsert is fail.");
    NAPI_ASSERT(env, changes == 2, "OH_RdbTrans_BatchInsert is fail.");
    row1->destroy(row1);
    row2->destroy(row2);
    ret = OH_VBuckets_Destroy(rows);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBuckets_Destroy is fail.");
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Destroy is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_VBuckets_Destroy0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "test";
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_PreferencesOption_SetFileName(option, "") ret= %{public}d", ret);
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction is fail.");
    OH_VBucket *row1 = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, row1 != nullptr, "OH_Rdb_CreateValuesBucket is fail.");
    const int USER_ID = 4;
    row1->putInt64(row1, "id", USER_ID);
    row1->putText(row1, "data1", "test_name4");
    const int DATA1_VALUE = 14800;
    row1->putInt64(row1, "data2", DATA1_VALUE);
    const double DATA3_VALUE = 300.1;
    row1->putReal(row1, "data3", DATA3_VALUE);
    row1->putText(row1, "data5", "ABCDEFGHI");
    OH_VBucket *row2 = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, row2 != nullptr, "OH_Rdb_CreateConfig is fail.");
    row2->putInt64(row2, "id", 5);
    row2->putText(row2, "data1", "test_name5");
    const int DATA2_VALUE = 15800;
    row2->putInt64(row2, "data2", DATA2_VALUE);
    const double DATA5_VALUE = 500.1;
    row2->putReal(row2, "data3", DATA5_VALUE);
    row2->putText(row2, "data5", "ABCDEFGHI");
    OH_Data_VBuckets *rows = OH_VBuckets_Create();
    NAPI_ASSERT(env, rows != nullptr, "OH_VBuckets_Create is fail.");
    ret = OH_VBuckets_PutRow(rows, row1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBuckets_PutRow is fail.");
    size_t count = -1;
    ret = OH_VBuckets_RowCount(rows, &count);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    NAPI_ASSERT(env, count == 1, "OH_Rdb_CreateConfig is fail.");
    ret = OH_VBuckets_PutRow(rows, row2);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBuckets_PutRow is fail.");
    ret = OH_VBuckets_RowCount(rows, &count);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBuckets_RowCount is fail.");
    NAPI_ASSERT(env, count == 2, "OH_VBuckets_RowCount is fail.");
    OH_Data_VBuckets *rows2 = OH_VBuckets_Create();
    NAPI_ASSERT(env, rows != nullptr, "OH_Rdb_CreateConfig is fail.");
    ret = OH_VBuckets_PutRows(rows2, rows);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBuckets_PutRows is fail.");
    ret = OH_VBuckets_Destroy(rows);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBuckets_Destroy is fail.");
    int64_t changes = -1;
    ret = OH_RdbTrans_BatchInsert(trans, table, rows2, RDB_CONFLICT_REPLACE, &changes);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_BatchInsert is fail.");
    const int EXPECTED_CHANGES = 2;
    NAPI_ASSERT(env, changes == EXPECTED_CHANGES, "OH_RdbTrans_BatchInsert is fail.");
    row1->destroy(row1);
    row2->destroy(row2);
    ret = OH_VBuckets_Destroy(rows2);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBuckets_Destroy is fail.");
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Destroy is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_RdbTrans_Update0100(napi_env env, napi_callback_info info)
{  
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "test";
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction is fail.");
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putText(valueBucket, "data1", "liSi");
    const int DATA1_VALUE = 14800;
    valueBucket->putInt64(valueBucket, "data2", DATA1_VALUE);
    const double DATA2_VALUE = 500.1;
    valueBucket->putReal(valueBucket, "data3", DATA2_VALUE);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates(table);
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    int64_t changes = -1;
    ret = OH_RdbTrans_Update(trans, valueBucket, predicates, &changes);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Update is fail.");
    NAPI_ASSERT(env, changes == 1, "OH_RdbTrans_Update is fail.");
    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Destroy is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_RdbTrans_Delete0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "test";
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction is fail.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates(table);
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "liSi";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    int64_t changes = -1;
    ret = OH_RdbTrans_Delete(trans, predicates, &changes);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Delete is fail.");
    NAPI_ASSERT(env, changes == 1, "OH_RdbTrans_Delete is fail.");
    valueObject->destroy(valueObject);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_RdbTrans_QuerySql0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail.");

    char createTableSql[] = "CREATE TABLE transaction_table (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 INTEGER, "
        "data2 INTEGER, data3 FLOAT, data4 TEXT, data5 BLOB, data6 ASSET, data7 ASSETS, data8 UNLIMITED INT, "
        "data9 FLOATVECTOR);";
    ret = OH_Rdb_Execute(g_transStore, createTableSql);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_Execute is fail.");
    const char *sql = "SELECT id, data1 FROM transaction_table";
    OH_Cursor *cursor = OH_RdbTrans_QuerySql(nullptr, sql, nullptr);
    NAPI_ASSERT(env, cursor == nullptr, "OH_Rdb_CreateConfig is fail.");
    cursor = OH_RdbTrans_QuerySql(trans, nullptr, nullptr);
    NAPI_ASSERT(env, cursor == nullptr, "OH_Rdb_CreateConfig is fail.");
    cursor = OH_RdbTrans_QuerySql(trans, sql, nullptr);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_CreateConfig is fail.");
    cursor->destroy(cursor);
    OH_Data_Values *values = OH_Values_Create();
    FillDataValues(env, values);
    const char *insertSql = "INSERT INTO transaction_table "
        "(data1, data2, data3, data4, data5, data6, data7, data8) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    OH_Data_Value *outValue = nullptr;
    ret = OH_RdbTrans_Execute(trans, insertSql, values, &outValue);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_RdbTrans_Execute ret= %{public}d", ret);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Execute insertSql is fail");
    NAPI_ASSERT(env, outValue != nullptr, "OH_Rdb_CreateConfig is fail.");
    ret = OH_Value_Destroy(outValue);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    ret = OH_Values_Destroy(values);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_Destroy is fail.");
    const char *querySql = "SELECT * FROM transaction_table WHERE data1=?";
    OH_Data_Values *queryValues = OH_Values_Create();
    NAPI_ASSERT(env, queryValues != nullptr, "OH_Values_Create queryValues is fail.");
    ret = OH_Values_PutInt(queryValues, 1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_PutInt queryValues is fail.");
    OH_Cursor *cursorEnd = OH_RdbTrans_QuerySql(trans, querySql, queryValues);
    NAPI_ASSERT(env, cursorEnd != nullptr, "OH_Rdb_CreateConfig is fail.");
    int rowCount = 0;
    cursorEnd->getRowCount(cursorEnd, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "OH_Rdb_CreateConfig is fail.");
    ret = OH_Values_Destroy(queryValues);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_Destroy queryValues is fail.");
    cursorEnd->destroy(cursorEnd);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Destroy trans is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_VBucket_PutFloatVector0100(napi_env env, napi_callback_info info)
{
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, valueBucket != nullptr, "OH_Rdb_CreateConfig is fail.");
    float floatArr[] = { 1.0, 2.0, 3.0 };
    int ret = OH_VBucket_PutFloatVector(valueBucket, "data1", floatArr, 0);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBucket_PutFloatVector is fail.");
    const int DATA_SIZE = 3;
    ret = OH_VBucket_PutFloatVector(valueBucket, "data2", floatArr, DATA_SIZE);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBucket_PutFloatVector is fail.");
    valueBucket->destroy(valueBucket);

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_VBucket_PutUnlimitedInt0100(napi_env env, napi_callback_info info)
{  
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, valueBucket != nullptr, "OH_Rdb_CreateConfig is fail.");
    uint64_t trueForm[] = { 1, 2, 3 };
    int ret = OH_VBucket_PutUnlimitedInt(valueBucket, "data1", 0, trueForm, 0);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBucket_PutUnlimitedInt is fail.");
    ret = OH_VBucket_PutUnlimitedInt(valueBucket, "data2", 1, trueForm, 3);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_VBucket_PutUnlimitedInt is fail.");
    valueBucket->destroy(valueBucket);

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}


static napi_value OH_Rdb_SetTokenizer0100(napi_env env, napi_callback_info info)
{
    mkdir(RDB_TEST_PATH, 0770);
    OH_Rdb_ConfigV2 *config = InitRdbConfig(env);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ==
         OH_Rdb_SetTokenizer(config, static_cast<Rdb_Tokenizer>(Rdb_Tokenizer::RDB_NONE_TOKENIZER - 1)), "OH_Rdb_SetTokenizer is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_E_INVALID_ARGS ==
         OH_Rdb_SetTokenizer(config, static_cast<Rdb_Tokenizer>(Rdb_Tokenizer::RDB_CUSTOM_TOKENIZER + 1)), "OH_Rdb_SetTokenizer is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK ==
         OH_Rdb_SetTokenizer(config, Rdb_Tokenizer::RDB_NONE_TOKENIZER), "RDB_NONE_TOKENIZER is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK ==
         OH_Rdb_SetTokenizer(config, Rdb_Tokenizer::RDB_CUSTOM_TOKENIZER), "RDB_CUSTOM_TOKENIZER is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_SetTokenizer(config, Rdb_Tokenizer::RDB_ICU_TOKENIZER), "RDB_ICU_TOKENIZER is fail.");
    int numType = 0;
    const int *supportTypeList = OH_Rdb_GetSupportedDbType(&numType);
    NAPI_ASSERT(env, supportTypeList != nullptr, "OH_Rdb_SetDbType is fail.");
    OH_Rdb_DestroyConfig(config);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}


static napi_value OH_Rdb_IsTokenizerSupported0100(napi_env env, napi_callback_info info)
{
    bool isSupported = true;
    int errCode = OH_Rdb_IsTokenizerSupported(RDB_NONE_TOKENIZER, &isSupported);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    errCode = OH_Rdb_IsTokenizerSupported(RDB_ICU_TOKENIZER, &isSupported);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    errCode = OH_Rdb_IsTokenizerSupported(RDB_CUSTOM_TOKENIZER, &isSupported);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    errCode = OH_Rdb_IsTokenizerSupported(static_cast<Rdb_Tokenizer>(RDB_NONE_TOKENIZER - 1), &isSupported);
    NAPI_ASSERT(env, RDB_E_INVALID_ARGS == errCode, "OH_Rdb_CreateConfig is fail.");
    errCode = OH_Rdb_IsTokenizerSupported(static_cast<Rdb_Tokenizer>(RDB_CUSTOM_TOKENIZER + 1), &isSupported);
    NAPI_ASSERT(env, RDB_E_INVALID_ARGS == errCode, "OH_Rdb_CreateConfig is fail.");
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

static napi_value OH_RdbTrans_Commit0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "test";
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putText(valueBucket, "data1", "test_name4");
    const int DATA2_VALUE = 14800;
    valueBucket->putInt64(valueBucket, "data2", DATA2_VALUE);
    const double DATA3_VALUE = 300.1;
    valueBucket->putReal(valueBucket, "data3", DATA3_VALUE);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGHI");
    int64_t rowId = -1;
    ret = OH_RdbTrans_Insert(trans, table, valueBucket, &rowId);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    NAPI_ASSERT(env, rowId == 4, "OH_Rdb_CreateConfig is fail.");
    ret = OH_RdbTrans_Commit(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");
    valueBucket->destroy(valueBucket);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateConfig is fail.");

    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_RdbTrans_InsertWithConflictResolution0100(napi_env env, napi_callback_info)
{
    const int64_t dataValue2 = 13800;
    const double dataValue3 = 200.1;
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "test";
    int ret = OH_Rdb_CreateTransaction(g_transStore, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_InsertWithConflictResolution is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_InsertWithConflictResolution is fail.");
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", dataValue2);
    valueBucket->putReal(valueBucket, "data3", dataValue3);
    valueBucket->putNull(valueBucket, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates(table);
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    int64_t changes = -1;
    ret = OH_RdbTrans_InsertWithConflictResolution(trans, table, valueBucket,
        static_cast<Rdb_ConflictResolution>(0), &changes);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_RdbTrans_InsertWithConflictResolution is fail.");
    ret = OH_RdbTrans_UpdateWithConflictResolution(trans, valueBucket, predicates, RDB_CONFLICT_REPLACE, &changes);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_UpdateWithConflictResolution is fail.");
    NAPI_ASSERT(env, changes == 1, "OH_RdbTrans_UpdateWithConflictResolution is fail.");


    int64_t changes1 = -1;
    ret = OH_RdbTrans_InsertWithConflictResolution(trans, table, valueBucket,
        RDB_CONFLICT_NONE, nullptr);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_RdbTrans_InsertWithConflictResolution1 is fail.");

    ret = OH_RdbTrans_InsertWithConflictResolution(trans, nullptr, valueBucket,
        RDB_CONFLICT_ROLLBACK, nullptr); 
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_RdbTrans_InsertWithConflictResolution2 is fail.");

    ret = OH_RdbTrans_InsertWithConflictResolution(trans, table, nullptr,
        RDB_CONFLICT_ABORT, &changes1); 
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_RdbTrans_InsertWithConflictResolution3 is fail.");

    const char *table1 = "";
    ret = OH_RdbTrans_InsertWithConflictResolution(trans, table1, valueBucket,
        RDB_CONFLICT_FAIL, &changes1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_RdbTrans_InsertWithConflictResolution4 is fail.");

    Rdb_ConflictResolution resolution = static_cast<Rdb_ConflictResolution>(7);
    ret = OH_RdbTrans_InsertWithConflictResolution(trans, table, valueBucket,
        resolution, &changes1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_RdbTrans_InsertWithConflictResolution5 is fail.");

    ret = OH_RdbTrans_InsertWithConflictResolution(trans, table, valueBucket,
        RDB_CONFLICT_IGNORE, &changes1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_InsertWithConflictResolution6 is fail.");

    ret = OH_RdbTrans_InsertWithConflictResolution(trans, table, valueBucket,
        RDB_CONFLICT_REPLACE, &changes1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_InsertWithConflictResolution7 is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Destroy is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_SetCustomDir0100(napi_env env, napi_callback_info)
{
    const char *customDir = "test";
    auto ret =  OH_Rdb_SetCustomDir(nullptr, customDir);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_SetCustomDi is fail.");
    ret =  OH_Rdb_SetCustomDir(nullptr, "12345678901234567890123456789012345678901234567890"
        "12345678901234567890123456789012345678901234567890123456789012345678901234567890");
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_SetCustomDi is fail.");
    OH_Rdb_ConfigV2 *confg = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, confg != nullptr, "OH_Rdb_SetCustomDi is fail.");
    ret =  OH_Rdb_SetCustomDir(confg, nullptr);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_SetCustomDi is fail.");
    ret = OH_Rdb_SetCustomDir(confg, customDir);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetCustomDi is fail.");
    const char *customDir1 = "";
    ret = OH_Rdb_SetCustomDir(confg, customDir1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetCustomDi1 is fail.");

    ret = OH_Rdb_DestroyConfig(confg);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyConfig is fail.");

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_SetReadOnly0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *confg = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, confg != nullptr, "OH_Rdb_CreateConfig is fail.");
    auto ret =  OH_Rdb_SetReadOnly(nullptr, true);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_SetReadOnly is fail.");
    ret = OH_Rdb_SetReadOnly(confg, true);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetReadOnly is fail.");
    ret = OH_Rdb_SetReadOnly(confg, false);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetReadOnly is fail.");
    ret = OH_Rdb_DestroyConfig(confg);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_SetPlugins0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *confg = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, confg != nullptr, "OH_Rdb_CreateConfig is fail.");
    const char *plugins[] = {"1"};
    auto ret =  OH_Rdb_SetPlugins(nullptr, plugins, 1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_SetPlugins is fail.");
    ret = OH_Rdb_SetPlugins(confg, nullptr, 1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_SetPlugins is fail.");
    ret = OH_Rdb_SetPlugins(confg, plugins, 0);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetPlugins is fail.");
    ret = OH_Rdb_SetPlugins(confg, plugins, 1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetPlugins is fail.");
    const char *pluginsNew[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "0", "x"};
    ret = OH_Rdb_SetPlugins(confg, pluginsNew, sizeof(pluginsNew) / sizeof(pluginsNew[0]) - 1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetPlugins is fail.");
    ret = OH_Rdb_SetPlugins(confg, pluginsNew, sizeof(pluginsNew) / sizeof(pluginsNew[0]));
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_SetPlugins is fail.");
    const char *pluginsNew1[] = {"", ""};
    ret = OH_Rdb_SetPlugins(confg, pluginsNew1, 0);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetPlugins1 is fail.");
    ret = OH_Rdb_DestroyConfig(confg);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_SetSemanticIndex_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetSemanticIndex_Param_0100 ------------- ");
    OH_Rdb_ConfigV2 *confg = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, confg != nullptr, "OH_Rdb_CreateConfig is fail.");
    auto ret =  OH_Rdb_SetSemanticIndex(nullptr, true);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_SetSemanticIndex is fail.");
    ret = OH_Rdb_SetSemanticIndex(confg, true);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetSemanticIndex is fail.");
    ret = OH_Rdb_SetSemanticIndex(confg, false);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetSemanticIndex is fail.");
    ret = OH_Rdb_DestroyConfig(confg);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static void InitRdbConfigV2(OH_Rdb_ConfigV2 *configV2, char *storeName)
{
    OH_Rdb_SetDatabaseDir(configV2, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(configV2, storeName);
    OH_Rdb_SetBundleName(configV2, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(configV2, "module");
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_SQLITE);
    OH_Rdb_SetTokenizer(configV2, RDB_CUSTOM_TOKENIZER);
}

static void CreateTable(napi_env env, OH_Rdb_Store *store)
{
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS mail ("
    "id INTEGER PRIMARY KEY,"
    "subject TEXT,"
    "content TEXT"
    ");";
    auto ret = OH_Rdb_Execute(store, createTableSql);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Execute create is fail.");
    ret = OH_Rdb_CloseStore(store);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_CloseStore is fail.");
}

static void InsertData(napi_env env, OH_Rdb_Store *store)
{
    char insertSql1[] = "INSERT INTO mail (id, subject, content) VALUES (0, '运动直播场景', '运动直播场景正文');";
    auto ret = OH_Rdb_Execute(store, insertSql1);
    NAPI_ASSERT_RETURN_VOID(env, ret == RDB_OK, "OH_Rdb_Execute1 is fail.");
}

static napi_value OH_Rdb_SetSemanticIndex_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetSemanticIndex_Param_0200 ------------- ");
    OH_Rdb_ConfigV2 *confg = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, confg != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(confg, "rdb_store_test.db");
    int ret = OH_Rdb_DeleteStoreV2(confg);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto store = OH_Rdb_CreateOrOpen(confg, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    CreateTable(env, store);
    ret = OH_Rdb_SetSemanticIndex(confg, false);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetSemanticIndex is fail.");

    store = OH_Rdb_CreateOrOpen(confg, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    InsertData(env, store);
    std::this_thread::sleep_for(std::chrono::seconds(WAIT_TIME));

    char querySql[] = "select count(*) from mail_inverted";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "result row count is %{public}d", rowCount);
    NAPI_ASSERT(env, rowCount <= 0, "getRowCount is fail.");

    InitRdbConfigV2(confg, "rdb_store_test_vector.db");
    OH_Rdb_SetDbType(confg, RDB_CAYLEY);
    store = OH_Rdb_CreateOrOpen(confg, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen vector is fail.");
    char querySqlVector[] = "select count(*) from mail_vector";
    cursor = OH_Rdb_ExecuteQuery(store, querySqlVector);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");
    cursor->getRowCount(cursor, &rowCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "result vector row count is %{public}d", rowCount);
    NAPI_ASSERT(env, rowCount <= 0, "getRowCount is fail.");

    ret = OH_Rdb_DestroyConfig(confg);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyConfig is fail.");

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OH_Rdb_SetSemanticIndex_Param_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetSemanticIndex_Param_0300 ------------- ");
    OH_Rdb_ConfigV2 *confg = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, confg != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(confg, "rdb_store_test.db");
    int ret = OH_Rdb_DeleteStoreV2(confg);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto store = OH_Rdb_CreateOrOpen(confg, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    CreateTable(env, store);
    ret = OH_Rdb_SetSemanticIndex(confg, true);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_SetSemanticIndex is fail.");

    store = OH_Rdb_CreateOrOpen(confg, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    InsertData(env, store);
    std::this_thread::sleep_for(std::chrono::seconds(WAIT_TIME));

    char querySql[] = "select count(*) from mail_inverted";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "result row count is %{public}d", rowCount);
    NAPI_ASSERT(env, rowCount > 0, "getRowCount is fail.");

    InitRdbConfigV2(confg, "rdb_store_test_vector.db");
    OH_Rdb_SetDbType(confg, RDB_CAYLEY);
    store = OH_Rdb_CreateOrOpen(confg, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    char querySqlVector[] = "select count(*) from mail_vector";
    cursor = OH_Rdb_ExecuteQuery(store, querySqlVector);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");
    cursor->getRowCount(cursor, &rowCount);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "result vector row count is %{public}d", rowCount);
    NAPI_ASSERT(env, rowCount > 0, "getRowCount is fail.");

    ret = OH_Rdb_DestroyConfig(confg);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyConfig is fail.");

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "RdbstoreSetUpTestCase", nullptr, RdbstoreSetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbstoreTearDownTestCase", nullptr, RdbstoreTearDownTestCase, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Transaction0100", nullptr, OH_Rdb_Transaction0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_CreateTransaction0100", nullptr, OH_Rdb_CreateTransaction0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_Rollback0100", nullptr, OH_RdbTrans_Rollback0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_Query0100", nullptr, OH_RdbTrans_Query0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_VBuckets_Create0100", nullptr, OH_VBuckets_Create0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_VBuckets_Destroy0100", nullptr, OH_VBuckets_Destroy0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_Update0100", nullptr, OH_RdbTrans_Update0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_Delete0100", nullptr, OH_RdbTrans_Delete0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_QuerySql0100", nullptr, OH_RdbTrans_QuerySql0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_VBucket_PutFloatVector0100", nullptr, OH_VBucket_PutFloatVector0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_VBucket_PutUnlimitedInt0100", nullptr, OH_VBucket_PutUnlimitedInt0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_SetTokenizer0100", nullptr, OH_Rdb_SetTokenizer0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_IsTokenizerSupported0100", nullptr, OH_Rdb_IsTokenizerSupported0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_Commit0100", nullptr, OH_RdbTrans_Commit0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_InsertWithConflictResolution0100", nullptr, OH_RdbTrans_InsertWithConflictResolution0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_SetCustomDir0100", nullptr, OH_Rdb_SetCustomDir0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_SetReadOnly0100", nullptr, OH_Rdb_SetReadOnly0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_SetPlugins0100", nullptr, OH_Rdb_SetPlugins0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_SetSemanticIndex_Param_0100", nullptr, OH_Rdb_SetSemanticIndex_Param_0100, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "OH_Rdb_SetSemanticIndex_Param_0200", nullptr, OH_Rdb_SetSemanticIndex_Param_0200, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "OH_Rdb_SetSemanticIndex_Param_0300", nullptr, OH_Rdb_SetSemanticIndex_Param_0300, nullptr, nullptr, nullptr,
            napi_default, nullptr },
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
    .nm_modname = "transaction",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
