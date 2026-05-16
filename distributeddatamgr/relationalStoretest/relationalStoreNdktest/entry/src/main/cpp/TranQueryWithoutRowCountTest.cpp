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
#include <cstddef>
#include <sys/stat.h>
#include <sys/types.h>
#include "hilog/log.h"
#include <string>
#include "common.h"
#include "database/rdb/relational_store.h"
#include "database/rdb/oh_rdb_transaction.h"
#include "database/rdb/relational_store_error_code.h"

static OH_Rdb_ConfigV2 *InitRdbConfig();
static void CreateAssetTable();
static void SetAsset(Data_Asset *asset, int index);
static void CheckResultSetForNormalGet(OH_Cursor *cursor);
static void CheckResultSetForAllColumn(OH_Cursor *cursor);
static void CheckResultSetForAbnormalGet1(OH_Cursor *cursor);
static void CheckResultSetForAbnormalGet2(OH_Cursor *cursor);
static void CheckResultSetForGetAssert(OH_Cursor *cursor);
static void CheckResultSetForGetAsserts(OH_Cursor *cursor);
 
static OH_Rdb_Store *rdbStore_;
static OH_RDB_TransOptions *options_;
const char *TAG = "RDB_TRANS_TEST";
static  const char *RDB_TEST_PATH = "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/";

OH_Rdb_ConfigV2 *InitRdbConfig()
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "queryWithoutRowCount_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.querywithoutrowcount");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(config, RDB_SQLITE);
    return config;
}

static napi_value SetUpTestCase(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func SetUpTestCase  start ------ ");
    mkdir(RDB_TEST_PATH, 0770); // The permission on the path is 0770.
    int errCode = 0;
    auto config = InitRdbConfig();
    char table[] = "test";
    rdbStore_ = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, rdbStore_ != NULL, "OH_Rdb_CreateOrOpen is fail");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == errCode, "OH_Rdb_CreateOrOpen is fail");
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "data1 TEXT, data2 INTEGER, data3 FLOAT, data4 BLOB);";
    errCode = OH_Rdb_Execute(rdbStore_, createTableSql);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == errCode, "OH_Rdb_CreateOrOpen is fail");
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1); // Set the value of id to 1.
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800); // Set the value of data2 to 12800.
    valueBucket->putReal(valueBucket, "data3", 100.1); // Set the value of data3 to 100.1.
    uint8_t arr[] = { 1, 2, 3, 4, 5 };
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    errCode = OH_Rdb_Insert(rdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail");
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2); // Set the value of id to 2.
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800); // Set the value of data2 to 13800.
    valueBucket->putReal(valueBucket, "data3", 200.1); // Set the value of data3 to 200.1.
    errCode = OH_Rdb_Insert(rdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail2");
    valueBucket->destroy(valueBucket);
    CreateAssetTable();
    options_ = OH_RdbTrans_CreateOptions();
    NAPI_ASSERT(env, options_ != nullptr, "OH_Rdb_Insert is fail2");
    int ret = OH_RdbTransOption_SetType(options_, RDB_TRANS_DEFERRED);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_Insert is fail2");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func SetUpTestCase end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value TearDownTestCase(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func TearDownTestCase start ------ ");
    rdbStore_ = nullptr;
    auto config = InitRdbConfig();
    OH_Rdb_DeleteStoreV2(config);
    OH_RdbTrans_DestroyOptions(options_);
    options_ = nullptr;
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func TearDownTestCase end ------ ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

void CreateAssetTable()
{
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS asset_table (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 "
                            "asset, data2 assets );";
    int errCode = OH_Rdb_Execute(rdbStore_, createTableSql);
    char table[] = "asset_table";
    int assetsCount = 2;
    int curRow = 1;
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    Data_Asset *asset1 = OH_Data_Asset_CreateOne();
    SetAsset(asset1, 1); // The suffix of index is 1.
    Data_Asset *asset2 = OH_Data_Asset_CreateOne();
    SetAsset(asset2, 2); // The suffix of index is 2.
    valueBucket->putInt64(valueBucket, "id", curRow);
    OH_VBucket_PutAsset(valueBucket, "data1", asset1);
    Data_Asset **assets = OH_Data_Asset_CreateMultiple(assetsCount);
    SetAsset(assets[0], 1); // The suffix of index is 1.
    SetAsset(assets[1], 2); // The suffix of index is 2.
    errCode = OH_VBucket_PutAssets(valueBucket, "data2", assets, assetsCount);
    int rowID = OH_Rdb_Insert(rdbStore_, table, valueBucket);
    curRow++;
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", curRow);
    OH_VBucket_PutAsset(valueBucket, "data1", asset2);
    Data_Asset **assets2 = OH_Data_Asset_CreateMultiple(assetsCount);
    SetAsset(assets2[0], 1); // The suffix of index is 1.
    SetAsset(assets2[1], 3); // The suffix of index is 3.
    errCode = OH_VBucket_PutAssets(valueBucket, "data2", assets2, assetsCount);
    rowID = OH_Rdb_Insert(rdbStore_, table, valueBucket);
    OH_Data_Asset_DestroyMultiple(assets, assetsCount);
    OH_Data_Asset_DestroyMultiple(assets2, assetsCount);
    OH_Data_Asset_DestroyOne(asset1);
    OH_Data_Asset_DestroyOne(asset2);
    valueBucket->destroy(valueBucket);
}
 
void SetAsset(Data_Asset *asset, int index)
{
    std::string indexString = std::to_string(index);
    std::string name;
    name.append("name").append(indexString);
    int errcode = OH_Data_Asset_SetName(asset, name.c_str());
    std::string uri;
    uri.append("uri").append(indexString);
    errcode = OH_Data_Asset_SetUri(asset, uri.c_str());
    std::string path;
    path.append("path").append(indexString);
    errcode = OH_Data_Asset_SetPath(asset, path.c_str());
    errcode = OH_Data_Asset_SetCreateTime(asset, index);
    errcode = OH_Data_Asset_SetModifyTime(asset, index);
    errcode = OH_Data_Asset_SetSize(asset, index);
    errcode = OH_Data_Asset_SetStatus(asset, Data_AssetStatus::ASSET_NORMAL);
}
 
void CheckResultSetForNormalGet(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    size_t size = 0;
    cursor->getSize(cursor, 0, &size);
    char data1Value[size];
    cursor->getText(cursor, 0, data1Value, size);
    int64_t data2Value;
    cursor->getInt64(cursor, 1, &data2Value);
    double data3Value;
    cursor->getReal(cursor, 2, &data3Value);
    cursor->getSize(cursor, 3, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 3, data4Value, size);
    cursor->goToNextRow(cursor);
    cursor->getSize(cursor, 0, &size);
    char data1Value1[size];
    cursor->getText(cursor, 0, data1Value1, size);
    cursor->getInt64(cursor, 1, &data2Value);
    cursor->getReal(cursor, 2, &data3Value);
    cursor->destroy(cursor);
}
 
void CheckResultSetForAllColumn(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    int64_t id;
    cursor->getInt64(cursor, 0, &id);
    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value[size];
    cursor->getText(cursor, 1, data1Value, size);
    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value); // columnIndex is 2
    double data3Value;
    cursor->getReal(cursor, 3, &data3Value); // columnIndex is 3
    cursor->getSize(cursor, 4, &size); // columnIndex is 4
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size); // columnIndex is 4
    cursor->goToNextRow(cursor);
    cursor->getInt64(cursor, 0, &id);
    cursor->getSize(cursor, 1, &size);
    char data1Value1[size];
    cursor->getText(cursor, 1, data1Value1, size);
    cursor->getInt64(cursor, 2, &data2Value);
    cursor->getReal(cursor, 3, &data3Value);
    cursor->destroy(cursor);
}
 
void CheckResultSetForAbnormalGet1(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    size_t size = 0;
    int errCode = cursor->getSize(nullptr, 1, &size);
    errCode = cursor->getSize(cursor, 1, nullptr);
    errCode = cursor->getSize(cursor, -1, &size);
    errCode = cursor->getSize(cursor, 5, &size); // columnIndex is 5
    errCode = cursor->getSize(cursor, 1, &size);
    char data1Value[size];
    errCode = cursor->getText(nullptr, 1, data1Value, size);
    errCode = cursor->getText(cursor, -1, data1Value, size);
    errCode = cursor->getText(cursor, 5, data1Value, size); // columnIndex is 5
    errCode = cursor->getText(cursor, 1, nullptr, size);
    errCode = cursor->getText(cursor, 1, data1Value, 0);
    int64_t data2Value;
    errCode = cursor->getInt64(nullptr, 2, &data2Value); // columnIndex is 2
    errCode = cursor->getInt64(cursor, 2, nullptr); // columnIndex is 2
    errCode = cursor->getInt64(cursor, -1, &data2Value);
    errCode = cursor->getInt64(cursor, 5, &data2Value); // columnIndex is 5
    cursor->destroy(cursor);
}
void CheckResultSetForAbnormalGet2(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    double data3Value;
    int errCode = cursor->getReal(nullptr, 3, &data3Value);
    errCode = cursor->getReal(cursor, 3, nullptr); // columnIndex is 3
    errCode = cursor->getReal(cursor, -1, &data3Value);
    errCode = cursor->getReal(cursor, 5, &data3Value); // columnIndex is 5
    size_t size = 0;
    errCode = cursor->getSize(cursor, 4, &size); // columnIndex is 4
    unsigned char data4Value[size];
    errCode = cursor->getBlob(nullptr, 4, data4Value, size); // columnIndex is 4
    errCode = cursor->getBlob(cursor, 4, nullptr, size); // columnIndex is 4
    errCode = cursor->getBlob(cursor, 4, data4Value, 0); // columnIndex is 4
    errCode = cursor->getBlob(cursor, -1, data4Value, size);
    errCode = cursor->getBlob(cursor, 5, data4Value, size); // columnIndex is 5
    bool isNull = false;
    errCode = cursor->isNull(nullptr, 1, &isNull);
    errCode = cursor->isNull(cursor, 1, nullptr);
    errCode = cursor->destroy(nullptr);
    cursor->destroy(cursor);
}
 
void CheckResultSetForGetAssert(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    OH_ColumnType type;
    int errCode = cursor->getColumnType(cursor, 1, &type);
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    errCode = cursor->getAsset(cursor, 1, asset);
    char name[10] = "";
    size_t nameLength = 10;
    errCode = OH_Data_Asset_GetName(asset, name, &nameLength);
    char uri[10] = "";
    size_t uriLength = 10;
    errCode = OH_Data_Asset_GetUri(asset, uri, &uriLength);
    char path[10] = "";
    size_t pathLength = 10;
    errCode = OH_Data_Asset_GetPath(asset, path, &pathLength);
    int64_t createTime = 0;
    errCode = OH_Data_Asset_GetCreateTime(asset, &createTime);
    int64_t modifyTime = 0;
    errCode = OH_Data_Asset_GetModifyTime(asset, &modifyTime);
    size_t size = 0;
    errCode = OH_Data_Asset_GetSize(asset, &size);
    Data_AssetStatus status = Data_AssetStatus::ASSET_NULL;
    errCode = OH_Data_Asset_GetStatus(asset, &status);
    OH_Data_Asset_DestroyOne(asset);
    cursor->destroy(cursor);
}
void CheckResultSetForGetAsserts(OH_Cursor *cursor)
{
    cursor->goToNextRow(cursor);
    OH_ColumnType type;
    int errCode = cursor->getColumnType(cursor, 2, &type);
    uint32_t assetCount = 0;
    errCode = cursor->getAssets(cursor, 2, nullptr, &assetCount); // columnIndex is 2
    Data_Asset **assets = OH_Data_Asset_CreateMultiple(assetCount);
    errCode = cursor->getAssets(cursor, 2, assets, &assetCount); // columnIndex is 2
    Data_Asset *asset = assets[1];
    char name[10] = "";
    size_t nameLength = 10;
    errCode = OH_Data_Asset_GetName(asset, name, &nameLength);
    char uri[10] = "";
    size_t uriLength = 10;
    errCode = OH_Data_Asset_GetUri(asset, uri, &uriLength);
    char path[10] = "";
    size_t pathLength = 10;
    errCode = OH_Data_Asset_GetPath(asset, path, &pathLength);
    int64_t createTime = 0;
    errCode = OH_Data_Asset_GetCreateTime(asset, &createTime);
    int64_t modifyTime = 0;
    errCode = OH_Data_Asset_GetModifyTime(asset, &modifyTime);
    size_t size = 0;
    errCode = OH_Data_Asset_GetSize(asset, &size);
    Data_AssetStatus status = Data_AssetStatus::ASSET_NULL;
    errCode = OH_Data_Asset_GetStatus(asset, &status);
    OH_Data_Asset_DestroyMultiple(assets, assetCount);
    cursor->destroy(cursor);
}

static napi_value OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0100  start ------ ");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = { "data1", "data2", "data3", "data4" };
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, len);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor != NULL, "OH_RdbTrans_QueryWithoutRowCount is fail.");
    CheckResultSetForNormalGet(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_PutInt is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0100  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200  start ------ ");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, NULL, 0);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction trans is fail.");
    CheckResultSetForAllColumn(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300  start ------ ");
    const char *columnNames[] = { "data1", "data2", "data3", "data4" };
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(nullptr, predicates, columnNames, len);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_CreateTransaction trans is fail.");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail2.");
    cursor = OH_RdbTrans_QueryWithoutRowCount(trans, nullptr, columnNames, len);
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_CreateTransaction trans is fail.");
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400  start ------ ");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail2.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = { "data1", "data2", "data3", "data4" };
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, 2);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_CreateTransaction trans is fail.");
    cursor->goToNextRow(cursor);
    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 2, "getColumnCount is fail.");
    size_t size = 0;
    cursor->getSize(cursor, 0, &size);
    NAPI_ASSERT(env, size == 9, "getSize is fail.");
    char data1Value[size];
    cursor->getText(cursor, 0, data1Value, size);
    NAPI_ASSERT(env, strcmp(data1Value, "zhangSan") == 0, "getSize is fail.");
    int64_t data2Value;
    cursor->getInt64(cursor, 1, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getInt64 is fail.");
    double data3Value;
    int errCode = cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_COLUMN_INDEX, "getInt64 is fail.");
    errCode = cursor->getSize(cursor, 3, &size);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_COLUMN_INDEX, "getInt64 is fail.");
    size = 5;
    unsigned char data4Value[size];
    errCode = cursor->getBlob(cursor, 3, data4Value, size);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_COLUMN_INDEX, "getInt64 is fail.");
    cursor->goToNextRow(cursor);
    cursor->getSize(cursor, 0, &size);
    NAPI_ASSERT(env, size == 5, "getSize is fail.");
    char data1Value1[size];
    cursor->getText(cursor, 0, data1Value1, size);
    cursor->getInt64(cursor, 1, &data2Value);
    NAPI_ASSERT(env, data2Value == 13800, "getInt64 is fail.");
    errCode = cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_COLUMN_INDEX, "getInt64 is fail.");
    cursor->destroy(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "getInt64 is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500  start ------ ");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail2.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = { "data1", "data2", "data3", "data4", "data5" };
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, 5);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor != NULL, "OH_RdbTrans_QueryWithoutRowCount trans is fail2.");
    int errCode = cursor->goToNextRow(cursor);;
    NAPI_ASSERT(env, errCode == RDB_E_SQLITE_ERROR, "getInt64 is fail.");
    cursor->destroy(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_RdbTrans_Destroy is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600  start ------ ");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail2.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = { nullptr, "data2", "data3", "data4" };
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, len);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor == NULL, "OH_RdbTrans_QueryWithoutRowCount trans is fail2.");
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700  start ------ ");
    const char *columnNames[] = { "", "data1", "data2", "data3", "data4" };
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail2.");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_RdbTrans_QueryWithoutRowCount(trans, predicates, columnNames, len);
    predicates->destroy(predicates);
    NAPI_ASSERT(env, cursor != NULL, "OH_RdbTrans_QueryWithoutRowCount trans is fail2.");
    cursor->goToNextRow(cursor);
    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 4, "getColumnCount is fail.");
    size_t size = 0;
    cursor->getSize(cursor, 0, &size);
    NAPI_ASSERT(env, size == 9, "getSize is fail.");
    char data1Value[size];
    cursor->getText(cursor, 0, data1Value, size);
    NAPI_ASSERT(env, strcmp(data1Value, "zhangSan") == 0, "getSize is fail.");
    int64_t data2Value;
    cursor->getInt64(cursor, 1, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getInt64 is fail.");
    double data3Value;
    cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, data3Value == 100.1, "getInt64 is fail.");
    cursor->getSize(cursor, 3, &size);
    NAPI_ASSERT(env, size == 5, "getSize is fail.");
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 3, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getSize is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getSize is fail.");
    cursor->goToNextRow(cursor);
    cursor->getSize(cursor, 0, &size);
    NAPI_ASSERT(env, size == 5, "getSize is fail.");
    char data1Value1[size];
    cursor->getText(cursor, 0, data1Value1, size);
    cursor->getInt64(cursor, 1, &data2Value);
    NAPI_ASSERT(env, data2Value == 13800, "getInt64 is fail.");
    cursor->getReal(cursor, 2, &data3Value);
    NAPI_ASSERT(env, data3Value == 200.1, "getInt64 is fail.");
    cursor->destroy(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100  start ------ ");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail2.");
    char querySql[] = "select data1, data2, data3, data4 from test;";
    OH_Cursor *cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql, nullptr);
    NAPI_ASSERT(env, cursor != NULL, "OH_RdbTrans_QueryWithoutRowCount trans is fail2.");
    CheckResultSetForNormalGet(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200  start ------ ");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail2.");
    char querySql[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    ret = OH_Values_PutInt(values, 1); // Add int value 1 to values
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_Cursor *cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql, values);
    ret = OH_Values_Destroy(values);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, cursor != NULL, "OH_RdbTrans_QueryWithoutRowCount trans is fail2.");
    cursor->goToNextRow(cursor);
    int columnCount = 0;
    cursor->getColumnCount(cursor, &columnCount);
    NAPI_ASSERT(env, columnCount == 5, "getColumnCount is fail.");
    int64_t id;
    cursor->getInt64(cursor, 0, &id);
    NAPI_ASSERT(env, id == 1, "getColumnCount is fail.");
    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    NAPI_ASSERT(env, size == 9, "getSize is fail.");
    char data1Value[size];
    cursor->getText(cursor, 1, data1Value, size);
    NAPI_ASSERT(env, strcmp(data1Value, "zhangSan") == 0, "getSize is fail.");
    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getSize is fail.");
    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 100.1, "getSize is fail.");
    cursor->getSize(cursor, 4, &size);
    NAPI_ASSERT(env, size == 5, "getSize is fail.");
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getSize is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getSize is fail.");
    cursor->destroy(cursor);
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300  start ------ ");
    OH_Rdb_Transaction *trans = nullptr;
    int ret = OH_Rdb_CreateTransaction(rdbStore_, options_, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction trans is fail2.");
    char querySql[] = "select * from test;";
    OH_Cursor *cursor = OH_RdbTrans_QuerySqlWithoutRowCount(nullptr, querySql, {});
    NAPI_ASSERT(env, cursor == NULL, "OH_RdbTrans_QueryWithoutRowCount trans is fail11.");
    cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, nullptr, {});
    NAPI_ASSERT(env, cursor == NULL, "OH_RdbTrans_QueryWithoutRowCount trans is fail22.");
    char querySql1[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql1, values);
    NAPI_ASSERT(env, cursor != NULL, "OH_RdbTrans_QuerySqlWithoutRowCount trans is fail1.");
    cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql1, {});
    NAPI_ASSERT(env, cursor != NULL, "OH_RdbTrans_QuerySqlWithoutRowCount trans is fail2.");
    ret = OH_Values_PutInt(values, 1); // Add int value 1 to values
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_PutInt is fail.");
    cursor = OH_RdbTrans_QuerySqlWithoutRowCount(trans, querySql, values);
    NAPI_ASSERT(env, cursor != NULL, "OH_RdbTrans_QuerySqlWithoutRowCount trans is fail3.");
    cursor->destroy(cursor);
    ret = OH_Values_Destroy(values);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_Destroy values is fail.");
    ret = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_Destroy trans is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------ func RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300  end ------ ");
    int result = 0;
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "SetUpTestCase", nullptr, SetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "TearDownTestCase", nullptr, TearDownTestCase, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0100", nullptr, OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200", nullptr, OH_RdbTrans_QueryWithoutRowCount_Normal_Get_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300", nullptr, OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400", nullptr, OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500", nullptr, OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600", nullptr, OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700", nullptr, OH_RdbTrans_QueryWithoutRowCount_Abnormal_InvalidArgs_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100", nullptr, RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200", nullptr, RdbTrans_QuerySqlWithoutRowCount_Normal_Get_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300", nullptr, RdbTrans_QuerySqlWithoutRowCount_Abnormal_InvalidArgs_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "rdbTran",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
