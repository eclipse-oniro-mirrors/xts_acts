/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include "hilog/log.h"
#include <string>
#include <ctime>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include "common.h"
#include <sys/stat.h>
#include <cstdio>
#include <string>
#include "database/rdb/relational_store.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/oh_rdb_transaction.h"
#include "database/rdb/oh_values_bucket.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/oh_predicates.h"
#include "database/rdb/oh_cursor.h"

#define DIRMODE 0770
const char *TAG = "testLog";
static  const char *RDB_TEST_PATH = "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/";
char RDB_STORE_NAME[] =  "rdb_store_test.db";
char BUNDLE_NAME[] =  "ohos.acts.relationalstorendktesthvigor";
char MODULE_NAME[] =  "ohos.acts.relationalstorendktesthvigor";
OH_Rdb_Store *storeTestRdbStore_;
static OH_Rdb_Config config_;
static void InitRdbConfig()
{
    config_.dataBaseDir = RDB_TEST_PATH;
    config_.storeName = RDB_STORE_NAME;
    config_.bundleName = BUNDLE_NAME;
    config_.moduleName = MODULE_NAME;
    config_.securityLevel = OH_Rdb_SecurityLevel::S1;
    config_.isEncrypt = false;
    config_.selfSize = sizeof(OH_Rdb_Config);
}
static napi_value RdbstoreSetUpTestCase(napi_env env, napi_callback_info info) 
{
    InitRdbConfig();
    int permissionNum = 0770;
    mkdir(config_.dataBaseDir, permissionNum);
    int errCode = 0;
    storeTestRdbStore_ = OH_Rdb_GetOrOpen(&config_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_GetOrOpen is fail.");
    NAPI_ASSERT(env, storeTestRdbStore_ != NULL, "OH_Rdb_GetOrOpen config is fail.");
    char createTableSql[] = "CREATE TABLE store_test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode = OH_Rdb_Execute(storeTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value RdbstoreTearDownTestCase(napi_env env, napi_callback_info info) 
{
    int errCode = 0;
    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    OH_Rdb_Execute(storeTestRdbStore_, dropTableSql);
    OH_Rdb_CloseStore(storeTestRdbStore_);
    errCode = OH_Rdb_DeleteStore(&config_);
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value OH_Rdb_BatchInsert_0100(napi_env env, napi_callback_info info)
{
    NAPI_ASSERT(env, storeTestRdbStore_ != NULL, "OH_Rdb_BatchInsert_0100 is fail.");
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    int idNum = 12;
    valueBucket->putInt64(valueBucket, "id", idNum);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    int errCode = OH_Rdb_Insert(storeTestRdbStore_, "store_test", valueBucket);
    int rowId = 12;
    NAPI_ASSERT(env, errCode == rowId, "OH_Rdb_BatchInsert_0100 is fail.");
    OH_Data_VBuckets *rows = OH_VBuckets_Create();
    NAPI_ASSERT(env, rows != nullptr, "OH_Rdb_BatchInsert_0100 is fail.");
    OH_VBucket *vbs[5];
    int idNum1 = 10;
    int maxNum = 5;
    for (auto i = 0; i < maxNum; i++) {
        OH_VBucket *row = OH_Rdb_CreateValuesBucket();
        NAPI_ASSERT(env, rows != nullptr, "OH_Rdb_BatchInsert_0100 is fail.");
        row->putInt64(row, "id", idNum1 + i);
        row->putText(row, "data1", "test_name");
        vbs[i] = row;
        NAPI_ASSERT(env, OH_VBuckets_PutRow(rows, row) == RDB_OK, "OH_Rdb_BatchInsert_0100 is fail.");
    }
    int64_t changes = -1;
    int ret = OH_Rdb_BatchInsert(storeTestRdbStore_, "store_test", rows, RDB_CONFLICT_NONE, &changes);
    NAPI_ASSERT(env, ret == RDB_E_SQLITE_CONSTRAINT, "OH_Rdb_BatchInsert_0100 is fail.");
    NAPI_ASSERT(env, changes == 0, "OH_Rdb_BatchInsert_0100 is fail.");
    ret = OH_Rdb_BatchInsert(storeTestRdbStore_, "store_test", rows, RDB_CONFLICT_ROLLBACK, &changes);
    NAPI_ASSERT(env, ret == RDB_E_SQLITE_CONSTRAINT, "OH_Rdb_BatchInsert_0100 is fail.");
    NAPI_ASSERT(env, changes == 0, "OH_Rdb_BatchInsert_0100 is fail.");
    ret = OH_Rdb_BatchInsert(storeTestRdbStore_, "store_test", rows, RDB_CONFLICT_ABORT, &changes);
    NAPI_ASSERT(env, ret == RDB_E_SQLITE_CONSTRAINT, "OH_Rdb_BatchInsert_0100 is fail.");
    NAPI_ASSERT(env, changes == 0, "OH_Rdb_BatchInsert_0100 is fail.");
    ret = OH_Rdb_BatchInsert(storeTestRdbStore_, "store_test", rows, RDB_CONFLICT_FAIL, &changes);
    NAPI_ASSERT(env, ret == RDB_E_SQLITE_CONSTRAINT, "OH_Rdb_BatchInsert_0100 is fail.");
    int insertCount = 2;
    NAPI_ASSERT(env, changes == insertCount, "OH_Rdb_BatchInsert_0100 is fail.");
    ret = OH_Rdb_BatchInsert(storeTestRdbStore_, "store_test", rows, RDB_CONFLICT_IGNORE, &changes);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_BatchInsert_0100 is fail.");
    int insertCount2 = 2;
    NAPI_ASSERT(env, changes == insertCount2, "OH_Rdb_BatchInsert_0100 is fail.");
    ret = OH_Rdb_BatchInsert(storeTestRdbStore_, "store_test", rows, RDB_CONFLICT_REPLACE, &changes);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_BatchInsert_0100 is fail.");
    int batchInsertNum = 5;
    NAPI_ASSERT(env, changes == batchInsertNum, "OH_Rdb_BatchInsert_0100 is fail.");
    for (OH_VBucket *vb : vbs) {
        vb->destroy(vb);
    }
    OH_VBuckets_Destroy(rows);
    char querySql[] = "SELECT * FROM store_test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    int countNum = 5;
    NAPI_ASSERT(env, rowCount == countNum, "OH_Rdb_BatchInsert_0100 is fail.");
    cursor->destroy(cursor);
    napi_value returncode;
    napi_create_int32(env, ret, &returncode);
    return returncode;
}

static napi_value OH_Value_PutNull_0100(napi_env env, napi_callback_info info)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Values_PutFloatVector_0100 is fail.");
    OH_Rdb_SetStoreName(config, "memDb");
    OH_Rdb_SetBundleName(config, BUNDLE_NAME);
    OH_Rdb_SetPersistent(config, false);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetSecurityLevel(config, S1);
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    char createTableSql[] = "CREATE TABLE mem_test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode = OH_Rdb_Execute(store, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");
    OH_Data_Value *value = OH_Value_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_Value_PutNull_0100 is fail.");
    float floatArr[] = {1.0, 2.0, 3.0};
    int ret = OH_Value_PutFloatVector(value, nullptr, 0);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Value_PutNull_0100 is fail.");
    ret = OH_Value_PutFloatVector(value, floatArr, 0);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutNull_0100 is fail.");
    size_t length;
    ret = OH_Value_GetFloatVectorCount(value, &length);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutNull_0100 is fail.");
    NAPI_ASSERT(env, length == 0, "OH_Value_PutNull_0100 is fail.");
    double realValue;
    ret = OH_Value_GetReal(value, &realValue);
    NAPI_ASSERT(env, ret == RDB_E_TYPE_MISMATCH, "OH_Value_PutNull_0100 is fail.");
    ret = OH_Value_PutNull(value);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutNull_0100 is fail.");
    ret = OH_Value_GetReal(value, &realValue);
    NAPI_ASSERT(env, ret == RDB_E_DATA_TYPE_NULL, "OH_Value_PutNull_0100 is fail.");
    ret = OH_Value_Destroy(value);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutNull_0100 is fail.");
    napi_value returncode;
    napi_create_int32(env, ret, &returncode);
    return returncode;
}

static napi_value OH_Value_Put_0100(napi_env env, napi_callback_info info)
{
    OH_Data_Value *value = OH_Value_Create();
    int ret = OH_Value_PutInt(nullptr, 1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Value_Put_0100 is fail.");
    ret = OH_Value_PutInt(value, 1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutInt is fail.");
    int64_t readData1;
    ret = OH_Value_GetInt(value, &readData1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetInt is fail.");
    NAPI_ASSERT(env, readData1 == 1, "OH_Value_GetInt is fail.");
    int putRealNum = 1.1;
    ret = OH_Value_PutReal(value, putRealNum);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutReal is fail.");
    double readData2;
    ret = OH_Value_GetReal(value, &readData2);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetReal is fail.");
    NAPI_ASSERT(env, readData2 == putRealNum, "OH_Value_GetReal is fail.");
    ret = OH_Value_PutText(value, "1");
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutText is fail.");
    const char *readData3 = nullptr;
    ret = OH_Value_GetText(value, &readData3);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetText is fail.");
    NAPI_ASSERT(env, strcmp(readData3, "1") == 0, "OH_Value_GetText is fail.");
    unsigned char arr[] = {1, 2};
    ret = OH_Value_PutBlob(value, arr, sizeof(arr) / sizeof(arr[0]));
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutBlob is fail.");
    const uint8_t *readData4 = nullptr;
    size_t len4;
    ret = OH_Value_GetBlob(value, &readData4, &len4);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetBlob is fail.");
    int blobLen = 2;
    NAPI_ASSERT(env, len4 == blobLen, "OH_Value_GetBlob is fail.");
    NAPI_ASSERT(env, readData4[0] == 1, "OH_Value_GetBlob is fail.");
    int getBlobLen = 2;
    NAPI_ASSERT(env, readData4[1] == getBlobLen, "OH_Value_GetBlob is fail.");
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    ret = OH_Data_Asset_SetName(asset, "name");
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Data_Asset_SetName is fail.");
    ret = OH_Value_PutAsset(value, asset);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutAsset is fail.");
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();
    ret = OH_Value_GetAsset(value, readData5);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetAsset is fail.");
    char readDataName[32];
    size_t length5 = 32;
    ret = OH_Data_Asset_GetName(readData5, readDataName, &length5);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetAsset is fail.");
    NAPI_ASSERT(env, strcmp(readDataName, "name") == 0, "OH_Value_GetAsset is fail.");
    int nameLen = 4;
    NAPI_ASSERT(env, length5 == nameLen, "OH_Value_GetAsset is fail.");
    OH_Data_Asset_DestroyOne(readData5);
    Data_Asset **assets1 = OH_Data_Asset_CreateMultiple(2);
    ret = OH_Data_Asset_SetName(assets1[0], "name1");
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Data_Asset_SetName is fail.");
    ret = OH_Data_Asset_SetName(assets1[1], "name2");
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Data_Asset_SetName is fail.");
    int assetsLen = 2;
    ret = OH_Value_PutAssets(value, assets1, assetsLen);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutAssets is fail.");
    size_t readDataCount6;
    ret = OH_Value_GetAssetsCount(value, &readDataCount6);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetAssetsCount is fail.");
    int assetsLen1 = 2;
    NAPI_ASSERT(env, readDataCount6 == assetsLen1, "OH_Value_GetAssetsCount is fail.");
    Data_Asset **readData6 = OH_Data_Asset_CreateMultiple(2);
    NAPI_ASSERT(env, readData6 != nullptr, "OH_Value_GetAssetsCount is fail.");
    size_t out6;
    int assetsInLen = 2;
    ret = OH_Value_GetAssets(value, readData6, assetsInLen, &out6);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetAssets is fail.");
    int outLen1 = 2;
    NAPI_ASSERT(env, out6 == outLen1, "OH_Value_GetAssets is fail.");
    int assetCount = 2;
    OH_Data_Asset_DestroyMultiple(readData6, assetCount);
    uint64_t bigInt[] = {1, 2, 3, 4, 5};
    ret = OH_Value_PutUnlimitedInt(value, 0, bigInt, sizeof(bigInt) / sizeof(bigInt[0]));
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutUnlimitedInt is fail.");
    size_t readDataLen7;
    ret = OH_Value_GetUnlimitedIntBand(value, &readDataLen7);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetUnlimitedIntBand is fail.");
    int bandLen = 5;
    NAPI_ASSERT(env, readDataLen7 == bandLen, "OH_Value_GetUnlimitedIntBand is fail.");
    int readDataSign7;
    uint64_t readData7[5];
    size_t outLen;
    int trueFormLen = 5;
    ret = OH_Value_GetUnlimitedInt(value, &readDataSign7, readData7, trueFormLen, &outLen);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetUnlimitedInt is fail.");
    int unlimitedIntOutLen = 5;
    NAPI_ASSERT(env, outLen == unlimitedIntOutLen, "OH_Value_GetUnlimitedInt is fail.");
    NAPI_ASSERT(env, readDataSign7 == 0, "OH_Value_GetUnlimitedInt is fail.");
    NAPI_ASSERT(env, readData7[0] == 1, "OH_Value_GetUnlimitedInt is fail.");
    int trueFormVal4 = 5;
    int assetIndex = 4;
    NAPI_ASSERT(env, readData7[assetIndex] == trueFormVal4, "OH_Value_GetUnlimitedInt is fail.");
    OH_ColumnType columnType;
    ret = OH_Value_GetType(value, &columnType);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetType is fail.");
    int typeNum = 8;
    NAPI_ASSERT(env, columnType == typeNum, "OH_Value_GetType is fail.");
    bool isNull;
    ret = OH_Value_IsNull(value, &isNull);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_IsNull is fail.");
    NAPI_ASSERT(env, isNull == false, "OH_Value_IsNull is fail.");
    napi_value returncode;
    napi_create_int32(env, ret, &returncode);
    return returncode;
}

static napi_value OH_Values_Put_0100(napi_env env, napi_callback_info info)
{
    OH_Data_Values *values = OH_Values_Create();
    NAPI_ASSERT(env, values != nullptr, "OH_Values_Put_0100 is fail.");
    OH_Data_Value *value = OH_Value_Create();
    int ret = OH_Value_PutInt(nullptr, 1);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Value_Put_0100 is fail.");
    ret = OH_Values_Put(nullptr, value);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Value_Put_0100 is fail.");
    ret = OH_Values_Put(values, nullptr);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Value_Put_0100 is fail.");
    ret = OH_Values_Put(values, value);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    ret = OH_Value_Destroy(value);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    int putIntNum = 2;
    ret = OH_Values_PutInt(values, putIntNum);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    int realVal = 1.1;
    ret = OH_Values_PutReal(values, realVal);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    ret = OH_Values_PutText(values, "1");
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    unsigned char val[] = {1, 2};
    ret = OH_Values_PutBlob(values, val, sizeof(val) / sizeof(val[0]));
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    Data_Asset *asset = OH_Data_Asset_CreateOne();
    ret = OH_Data_Asset_SetName(asset, "name");
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    ret = OH_Values_PutAsset(values, asset);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    OH_Data_Asset_DestroyOne(asset);
    Data_Asset **assets = OH_Data_Asset_CreateMultiple(2);
    ret = OH_Data_Asset_SetName(assets[0], "name1");
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    ret = OH_Data_Asset_SetName(assets[1], "name2");
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    int assetsLen = 2;
    ret = OH_Values_PutAssets(values, assets, assetsLen);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    int assetCount = 2;
    ret = OH_Data_Asset_DestroyMultiple(assets, assetCount);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    uint64_t bigInt[] = {1, 2, 3, 4, 5};
    ret = OH_Values_PutUnlimitedInt(values, 0, bigInt, sizeof(bigInt) / sizeof(bigInt[0]));
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Put_0100 is fail.");
    ret = OH_Values_PutNull(values);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_PutNull is fail.");
    OH_ColumnType columnType;
    ret = OH_Values_GetType(values, 0, &columnType);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetType is fail.");
    NAPI_ASSERT(env, columnType == 0, "OH_Values_GetType is fail.");
    size_t readSize = 0;
    ret = OH_Values_Count(values, &readSize);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_Count is fail.");
    int valCount = 9;
    NAPI_ASSERT(env, readSize == valCount, "OH_Values_Count is fail.");
    OH_Data_Value *readData0 = nullptr;
    ret = OH_Values_Get(values, 0, &readData0);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_Get is fail.");
    NAPI_ASSERT(env, readData0 != nullptr, "OH_Values_Get is fail.");
    bool isNull;
    ret = OH_Values_IsNull(values, 1, &isNull);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_IsNull is fail.");
    NAPI_ASSERT(env, isNull == false, "OH_Values_IsNull is fail.");
    int64_t readData1;
    ret = OH_Values_GetInt(values, 1, &readData1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetInt is fail.");
    int getIntVal = 2;
    NAPI_ASSERT(env, readData1 == getIntVal, "OH_Values_GetInt is fail.");
    double readData2;
    int realIndex = 2;
    ret = OH_Values_GetReal(values, realIndex, &readData2);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetReal is fail.");
    int realVal1 = 1.1;
    NAPI_ASSERT(env, readData2 = realVal1, "OH_Values_GetReal is fail.");
    const char *readData3 = nullptr;
    int getIndex = 3;
    ret = OH_Values_GetText(values, getIndex, &readData3);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetText is fail.");
    NAPI_ASSERT(env, strcmp(readData3, "1") == 0, "OH_Values_GetText is fail.");
    const uint8_t *readData4 = nullptr;
    size_t len4;
    int getBlobIndex = 4;
    ret = OH_Values_GetBlob(values, getBlobIndex, &readData4, &len4);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetBlob is fail.");
    int blobLen = 2;
    NAPI_ASSERT(env, len4 == blobLen, "OH_Values_GetBlob is fail.");
    NAPI_ASSERT(env, readData4[0] == 1, "OH_Values_GetBlob is fail.");
    int getBlobLen = 2;
    NAPI_ASSERT(env, readData4[1] == getBlobLen, "OH_Values_GetBlob is fail.");
    Data_Asset *readData5 = OH_Data_Asset_CreateOne();
    NAPI_ASSERT(env, readData5 != nullptr, "OH_Values_GetBlob is fail.");
    OH_ColumnType columnType5;
    int getTypeIndex = 5;
    ret = OH_Values_GetType(values, getTypeIndex, &columnType5);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetType is fail.");
    NAPI_ASSERT(env, columnType5 == TYPE_ASSET, "OH_Values_GetType is fail.");
    int assetIndex = 5;
    ret = OH_Values_GetAsset(values, assetIndex, readData5);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetAsset is fail.");
    char readDataName[32];
    size_t length5 = 32;
    ret = OH_Data_Asset_GetName(readData5, readDataName, &length5);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Data_Asset_GetName is fail.");
    NAPI_ASSERT(env, strcmp(readDataName, "name") == 0, "OH_Data_Asset_GetName is fail.");
    int assetLen = 4;
    NAPI_ASSERT(env, length5 == assetLen, "OH_Data_Asset_GetName is fail.");
    OH_Data_Asset_DestroyOne(readData5);
    size_t readDataCount6;
    int assetsIndex = 6;
    ret = OH_Values_GetAssetsCount(values, assetsIndex, &readDataCount6);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetAssetsCount is fail.");
    int assetsLength = 2;
    NAPI_ASSERT(env, readDataCount6 == assetsLength, "OH_Values_GetAssetsCount is fail.");
    Data_Asset **readData6 = OH_Data_Asset_CreateMultiple(2);
    NAPI_ASSERT(env, readData6 != nullptr, "OH_Values_GetAssetsCount is fail.");
    size_t out6;
    int assetsIndex1 = 6;
    int assetsInLen = 2;
    ret = OH_Values_GetAssets(values, assetsIndex1, readData6, assetsInLen, &out6);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetAssets is fail.");
    int assetsLen1 = 2;
    NAPI_ASSERT(env, out6 == assetsLen1, "OH_Values_GetAssets is fail.");
    int assetNum = 2;
    OH_Data_Asset_DestroyMultiple(readData6, assetNum);
    size_t readDataLen7;
    int valIndex = 7;
    ret = OH_Values_GetUnlimitedIntBand(values, valIndex, &readDataLen7);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetUnlimitedIntBand is fail.");
    int arrLen = 5;
    NAPI_ASSERT(env, readDataLen7 == arrLen, "OH_Values_GetUnlimitedIntBand is fail.");
    int readDataSign7;
    uint64_t readData7[5];
    size_t outLen;
    int unlimitedIndex = 7;
    int inLenNum = 5;
    ret = OH_Values_GetUnlimitedInt(values, unlimitedIndex, &readDataSign7, readData7, inLenNum, &outLen);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetUnlimitedInt is fail.");
    int unlimitedLen = 5;
    NAPI_ASSERT(env, outLen == unlimitedLen, "OH_Values_GetUnlimitedInt is fail.");
    NAPI_ASSERT(env, readDataSign7 == 0, "OH_Values_GetUnlimitedInt is fail.");
    NAPI_ASSERT(env, readData7[0] == 1, "OH_Values_GetUnlimitedInt is fail.");
    int index4 = 4;
    int unlimitedVal4 = 5;
    NAPI_ASSERT(env, readData7[index4] == unlimitedVal4, "OH_Values_GetUnlimitedInt is fail.");
    napi_value returncode;
    napi_create_int32(env, ret, &returncode);
    return returncode;
}

static napi_value OH_Value_PutFloatVector_0100(napi_env env, napi_callback_info info)
{
    OH_Data_Value *value = OH_Value_Create();
    NAPI_ASSERT(env, value != nullptr, "OH_Value_PutFloatVector_0100 is fail.");
    float floatArr[] = {1.0, 2.0, 3.0};
    int ret = OH_Value_PutFloatVector(value, nullptr, 0);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Values_GetUnlimitedInt is fail.");
    int vectorLen = 3;
    ret = OH_Value_PutFloatVector(value, floatArr, vectorLen);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_PutFloatVector is fail.");
    OH_ColumnType type;
    ret = OH_Value_GetType(value, &type);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetType is fail.");
    NAPI_ASSERT(env, type == TYPE_FLOAT_VECTOR, "OH_Value_GetType is fail.");
    size_t length;
    ret = OH_Value_GetFloatVectorCount(value, &length);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetFloatVectorCount is fail.");
    int vectorCountLen = 3;
    NAPI_ASSERT(env, length == vectorCountLen, "OH_Value_GetFloatVectorCount is fail.");
    float retArray[10];
    size_t outLen;
    int vectorInLen = 10;
    ret = OH_Value_GetFloatVector(value, retArray, vectorInLen, &outLen);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetFloatVector is fail.");
    int vectorLen1 = 3;
    NAPI_ASSERT(env, outLen == vectorLen1, "OH_Value_GetFloatVector is fail.");
    NAPI_ASSERT(env, retArray[0] == 1.0, "OH_Value_GetFloatVector is fail.");
    ret = OH_Value_Destroy(value);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Destroy is fail.");
    napi_value returncode;
    napi_create_int32(env, ret, &returncode);
    return returncode;
}

static napi_value OH_Values_PutFloatVector_0100(napi_env env, napi_callback_info info)
{
    OH_Data_Values *values = OH_Values_Create();
    NAPI_ASSERT(env, values != nullptr, "OH_Values_PutFloatVector_0100 is fail.");
    float floatArr[] = {1.0, 2.0, 3.0};
    int ret = OH_Values_PutFloatVector(values, nullptr, 0);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Values_PutFloatVector is fail.");
    int arrLen = 3;
    ret = OH_Values_PutFloatVector(values, floatArr, arrLen);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_PutFloatVector is fail.");
    size_t length;
    ret = OH_Values_GetFloatVectorCount(values, 0, &length);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_GetFloatVectorCount is fail.");
    int vectorCountLen = 3;
    NAPI_ASSERT(env, length == vectorCountLen, "OH_Value_GetFloatVectorCount is fail.");
    float retArray[10];
    size_t outLen;
    int vectorValLen = 10;
    ret = OH_Values_GetFloatVector(values, 0, retArray, vectorValLen, &outLen);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_GetFloatVector is fail.");
    int vectorOutLen = 3;
    NAPI_ASSERT(env, outLen == vectorOutLen, "OH_Values_GetFloatVector is fail.");
    NAPI_ASSERT(env, retArray[0] == 1.0, "OH_Values_GetFloatVector is fail.");
    ret = OH_Values_Destroy(values);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Values_Destroy is fail.");
    napi_value returncode;
    napi_create_int32(env, ret, &returncode);
    return returncode;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"RdbstoreSetUpTestCase", nullptr, RdbstoreSetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbstoreTearDownTestCase", nullptr, RdbstoreTearDownTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Rdb_BatchInsert_0100", nullptr, OH_Rdb_BatchInsert_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Value_PutNull_0100", nullptr, OH_Value_PutNull_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Value_Put_0100", nullptr, OH_Value_Put_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Values_Put_0100", nullptr, OH_Values_Put_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Value_PutFloatVector_0100", nullptr, OH_Value_PutFloatVector_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OH_Values_PutFloatVector_0100", nullptr, OH_Values_PutFloatVector_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "rdbvalue",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
