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
#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <string>
#include <string.h>
#include <cstdio>
#include <cstdlib>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "napi/native_api.h"
#include "common.h"
#include "database/rdb/relational_store.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/oh_cursor.h"
#include "database/rdb/oh_predicates.h"
#include "database/rdb/oh_value_object.h"
#include "database/rdb/oh_values_bucket.h"


napi_env g_env = 0;
char *RDB_TEST_PATH =  NULL;
char RDB_STORE_NAME[] =  "rdb_store_test.db";
char BUNDLE_NAME[] =  "com.acts.relationalstorenapiTest";
char MODULE_NAME[] =  "com.acts.relationalstorenapiTest";
OH_Rdb_Store *storeTestRdbStore_ = NULL;
OH_Rdb_Store *storeTestRdbStore1_ = NULL;
OH_Rdb_Store *storeTestRdbStore2_ = NULL;

static OH_Rdb_Config config_;
static void InitRdbConfig()
{
    config_.dataBaseDir = RDB_TEST_PATH;
    config_.storeName = RDB_STORE_NAME;
    config_.bundleName = BUNDLE_NAME;
    config_.moduleName = MODULE_NAME;
    config_.securityLevel = OH_Rdb_SecurityLevel::S1;
    config_.isEncrypt = false;
    config_.area = Rdb_SecurityArea::RDB_SECURITY_AREA_EL1;
    config_.selfSize = sizeof(OH_Rdb_Config);
}


static napi_value RdbFilePath(napi_env env, napi_callback_info info) {
    int errCode = 0;
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    size_t bufferSize = 0;
    napi_get_value_string_latin1(env, args[0], nullptr, 0, &bufferSize);

    char *buffer = (char*)malloc((bufferSize) + 1);
    napi_get_value_string_utf8(env, args[0], buffer, bufferSize+1, &bufferSize);  

    RDB_TEST_PATH = (char*)malloc((bufferSize) + 1);
    sprintf(RDB_TEST_PATH, "%s", buffer);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value RdbstoreSetUpTestCase(napi_env env, napi_callback_info info) {

    InitRdbConfig();
    mkdir(config_.dataBaseDir, 0770);

    int errCode = 0;
    storeTestRdbStore_ = OH_Rdb_GetOrOpen(&config_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_GetOrOpen is fail.");
    NAPI_ASSERT(env, storeTestRdbStore_ != NULL, "OH_Rdb_GetOrOpen config is fail.");

    char createTableSql[] = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode = OH_Rdb_Execute(storeTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value RdbstoreTearDownTestCase(napi_env env, napi_callback_info info) {
    int errCode = 0;
    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    OH_Rdb_Execute(storeTestRdbStore_, dropTableSql);
    OH_Rdb_CloseStore(storeTestRdbStore_);
    errCode = OH_Rdb_DeleteStore(&config_);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static void ProgressCallback(void *context, Rdb_ProgressDetails *progressDetails) {
    NAPI_ASSERT_RETURN_VOID(g_env, progressDetails != nullptr, "progressDetails is fail.");   
    NAPI_ASSERT_RETURN_VOID(g_env, progressDetails->version == DISTRIBUTED_PROGRESS_DETAIL_VERSION, "version fail."); 
    NAPI_ASSERT_RETURN_VOID(g_env, progressDetails->schedule == Rdb_Progress::RDB_SYNC_FINISH, "schedule is fail."); 
    NAPI_ASSERT_RETURN_VOID(g_env, progressDetails->code == Rdb_ProgressCode::RDB_CLOUD_DISABLED, "code is fail."); 
    NAPI_ASSERT_RETURN_VOID(g_env, progressDetails->tableLength == 0, "tableLength is fail."); 
    Rdb_TableDetails *tableDetails = OH_Rdb_GetTableDetails(progressDetails, DISTRIBUTED_PROGRESS_DETAIL_VERSION);
    NAPI_ASSERT_RETURN_VOID(g_env, tableDetails != nullptr, "tableDetails is fail.");
}

static Rdb_ProgressCallback callback = ProgressCallback;
static Rdb_ProgressObserver observer = { nullptr, callback };


static void RdbSubscribeDetailCallback(void *context, const Rdb_ChangeInfo **changeInfo, uint32_t count)
{
    NAPI_ASSERT_RETURN_VOID(g_env, count == 0, "count is fail.");
}

static void RdbSubscribeBriefCallback(void *context, const char *values[], uint32_t count)
{
    NAPI_ASSERT_RETURN_VOID(g_env, count == 0, "count is fail.");
}

static Rdb_BriefObserver briefObserver = RdbSubscribeBriefCallback;
static Rdb_DetailsObserver detailObserver = RdbSubscribeDetailCallback;
static const Rdb_DataObserver briefObs = {.context = nullptr, .callback.briefObserver = briefObserver};
static const Rdb_DataObserver detailObs = {.context = nullptr, .callback.detailsObserver = detailObserver};

/**
 * @tc.name: SUB_DDM_RDB_0100
 * @tc.desc: napi test RDB store for Insert、Update、Query.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0100(napi_env env, napi_callback_info info) {

    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
   
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");
    
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Update is fail.");
    
    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strcmp(data1Value_1, "liSi") == 0, "getText is fail.");
    
    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 13800, "getInt64 is fail.");


    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 200.1, "getReal is fail.");

    cursor->getSize(cursor, 4, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getBlob is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getBlob is fail.");

    bool isNull = false;
    cursor->isNull(cursor, 5, &isNull);
    NAPI_ASSERT(env, isNull == true, "isNull is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;

}


/**
 * @tc.name: SUB_DDM_RDB_0200
 * @tc.desc: napi test RDB store for Insert with wrong table name or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
   
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "wrong", valueBucket);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Insert id=2 is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 3);
    valueBucket->putText(valueBucket, "data1", "wangWu");
    valueBucket->putInt64(valueBucket, "data2", 14800);
    valueBucket->putReal(valueBucket, "data3", 300.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGHI");
    char *table = NULL;
    errCode = OH_Rdb_Insert(storeTestRdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_Insert id=3 is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;

}

/**
 * @tc.name: SUB_DDM_RDB_0300
 * @tc.desc: napi test RDB store for Update with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
   
    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("wrong");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Update is fail.");
    
    char *table = NULL;
    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates(table);
    NAPI_ASSERT(env, predicates1 == NULL, "OH_Rdb_CreatePredicates is fail.");
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates1);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_Update is fail.");

    OH_Predicates *predicates2 = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates2, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");
    
    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strcmp(data1Value_1, "zhangSan") == 0, "getText is fail.");
    
    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getInt64 is fail.");
    
    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 100.1, "getReal is fail.");
    
    cursor->getSize(cursor, 4, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getBlob is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getBlob is fail.");

    cursor->getSize(cursor, 5, &size);
    char data5Value[size + 1];
    cursor->getText(cursor, 5, data5Value, size + 1);
    NAPI_ASSERT(env, strcmp(data5Value, "ABCDEFG") == 0, "getText is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    predicates2->destroy(predicates2);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;

}

/**
 * @tc.name: SUB_DDM_RDB_0400
 * @tc.desc: napi test RDB store for Update with valueBucket is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Update is fail.");

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strcmp(data1Value_1, "zhangSan") == 0, "getText is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0500
 * @tc.desc: napi test RDB store for Update with wrong predicates.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "wangwu";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Update is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strcmp(data1Value_1, "zhangSan") == 0, "getText is fail.");
    
    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0600
 * @tc.desc: napi test RDB store for Query with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("wrong");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    char *table = NULL;
    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates(table);

    OH_Cursor *cursor1 = OH_Rdb_Query(storeTestRdbStore_, predicates1, NULL, 0);
    NAPI_ASSERT(env, cursor1 == NULL, "OH_Rdb_Query 2 is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0700
 * @tc.desc: napi test RDB store for Query with wrong columnNames.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0800
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
   
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_0900
 * @tc.desc: napi test RDB store for Delete、ExecuteQuery.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_0900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert 2 is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Delete is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strcmp(data1Value_1, "liSi") == 0, "getText is fail.");
    
    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 13800, "getInt64 is fail.");

    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 200.1, "getReal is fail.");

    bool isNull = false;
    cursor->isNull(cursor, 4, &isNull);
    NAPI_ASSERT(env, isNull == true, "isNull is fail.");

    cursor->getSize(cursor, 5, &size);
    char data5Value[size + 1];
    cursor->getText(cursor, 5, data5Value, size + 1);
    NAPI_ASSERT(env, strcmp(data5Value, "ABCDEFGH") == 0, "getText is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_1000
 * @tc.desc: napi test RDB store for querysql is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char *querySql = NULL;
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_ExecuteQuery is fail.");

    errCode = valueBucket->destroy(valueBucket);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_1100
 * @tc.desc: napi test RDB store for Delete with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");


    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("wrong");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Delete is fail.");

    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates("test");
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates1, NULL, 0);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    char *table = NULL;
    OH_Predicates *predicates2 = OH_Rdb_CreatePredicates(table);
    NAPI_ASSERT(env, predicates2 == NULL, "OH_Rdb_CreatePredicates is fail.");

    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates2);
    NAPI_ASSERT(env, errCode == 14800001, "OH_Rdb_Delete is fail.");

    OH_Cursor *cursor1 = OH_Rdb_Query(storeTestRdbStore_, predicates1, NULL, 0);
    int rowCount1 = 0;
    cursor1->getRowCount(cursor1, &rowCount1);
    NAPI_ASSERT(env, rowCount1 == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    cursor1->destroy(cursor1);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1200
 * @tc.desc: napi test RDB store for Delete with wrong predicates.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "wangwu";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Delete is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


	
/**
 * @tc.name: SUB_DDM_RDB_1300
 * @tc.desc: napi test RDB store for Delete multiple.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Delete is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1400
 * @tc.desc: napi test RDB store for Transaction、Commit.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Rdb_Commit(storeTestRdbStore_);

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
	
/**
 * @tc.name: SUB_DDM_RDB_1500
 * @tc.desc: napi test RDB store for Transaction、RollBack.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");


    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Rdb_RollBack(storeTestRdbStore_);

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1600
 * @tc.desc: napi test RDB store for Transaction、Commit.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Rdb_Commit(storeTestRdbStore_);
    OH_Rdb_Commit(storeTestRdbStore_);

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1700
 * @tc.desc: napi test RDB store for Transaction、Commit.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Rdb_BeginTransaction(storeTestRdbStore_);

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Rdb_RollBack(storeTestRdbStore_);
    OH_Rdb_Commit(storeTestRdbStore_);

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1800
 * @tc.desc: napi test RDB store for GetVersion、SetVersion.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    int version = 0;
    int setVersion = 3;
    errCode = OH_Rdb_GetVersion(storeTestRdbStore_, &version);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_GetVersion is fail.");
    NAPI_ASSERT(env, version == 0, "OH_Rdb_GetVersion is fail.");

    errCode = OH_Rdb_SetVersion(storeTestRdbStore_, setVersion);
    errCode = OH_Rdb_GetVersion(storeTestRdbStore_, &version);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_SetVersion is fail.");
    NAPI_ASSERT(env, version == 3, "OH_Rdb_SetVersion is fail.");

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_1900
 * @tc.desc: napi test RDB store for Query with wrong columnNames.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_1900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");


    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2000
 * @tc.desc: napi test RDB store for Update with wrong columnNames.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data", valueObject);
    errCode = OH_Rdb_Update(storeTestRdbStore_, valueBucket, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Update is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value_1[size + 1];
    cursor->getText(cursor, 1, data1Value_1, size + 1);
    NAPI_ASSERT(env, strcmp(data1Value_1, "zhangSan") == 0, "getText is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2100
 * @tc.desc: napi test RDB store for Delete with wrong columnNames.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data", valueObject);
    errCode = OH_Rdb_Delete(storeTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_Delete is fail.");

    predicates->clear(predicates);
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 0);
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2200
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 2);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2300
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 7);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2400
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, NULL, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2500
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");


    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2600
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 1);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

	
/**
 * @tc.name: SUB_DDM_RDB_2700
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 2);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_2800
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 4);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_2900
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_2900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data2","data3","data4"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 3);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_3000
 * @tc.desc: napi test RDB store for Query with wrong length.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4","data5"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 5);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = valueBucket->destroy(valueBucket);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_3100
 * @tc.desc: napi test RDB store for id
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    const char *columnNames[] = {"data1","data2","data3","data4","data5"};
    OH_Cursor *cursor = OH_Rdb_Query(storeTestRdbStore_, predicates, columnNames, 5);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    errCode = valueBucket->capability;
    NAPI_ASSERT(env, errCode == 6, "valueBucket capabilityis fail.");

    int valueObjectID = valueObject->id;
    int valueBucketID = valueBucket->id;
    int predicatesID = predicates->id;
    int cursorID = cursor->id;
    int rdbID = storeTestRdbStore_->id;

    valueObject->id = 11;
    valueBucket->id = 12;
    predicates->id = 13;
    cursor->id = 14;
    storeTestRdbStore_->id = 15;

    errCode = valueObject->destroy(valueObject);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "valueObject id is fail.");
    errCode = valueBucket->destroy(valueBucket);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "valueBucket id is fail.");
    errCode = predicates->destroy(predicates);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "predicates id is fail.");
    errCode = cursor->destroy(cursor);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "cursor id is fail.");
    errCode = OH_Rdb_CloseStore(storeTestRdbStore_);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "rdb id is fail."); 

    valueObject->id = valueObjectID;
    valueBucket->id = valueBucketID;
    predicates->id = predicatesID;
    cursor->id = cursorID;
    storeTestRdbStore_->id = rdbID;

    errCode = valueObject->destroy(valueObject);
    NAPI_ASSERT(env, errCode == 0, "valueObject id2 is fail.");
    errCode = valueBucket->destroy(valueBucket);
    NAPI_ASSERT(env, errCode == 0, "valueBucket id2 is fail.");
    errCode = predicates->destroy(predicates);
    NAPI_ASSERT(env, errCode == 0, "predicates id2 is fail.");
    errCode = cursor->destroy(cursor);
    NAPI_ASSERT(env, errCode == 0, "cursor id2 is fail.");

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_3200
 * @tc.desc: napi test RDB store for dataBaseDir wrong
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3200(napi_env env, napi_callback_info info) {

    char RDB_TEST_PATH2[] =  "/data";
    char RDB_STORE_NAME2[] =  "rdb_store_test2.db";

    OH_Rdb_Config config2_;
    config2_.dataBaseDir = RDB_TEST_PATH2;
    config2_.storeName = RDB_STORE_NAME2;
    config2_.bundleName = BUNDLE_NAME;
    config2_.moduleName = MODULE_NAME;
    config2_.securityLevel = OH_Rdb_SecurityLevel::S1;
    config2_.isEncrypt = false;
    config2_.selfSize = sizeof(OH_Rdb_Config);  

    mkdir(config2_.dataBaseDir, 0770);

    int errCode = 0;
    storeTestRdbStore1_ = OH_Rdb_GetOrOpen(&config2_, &errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_CREATE_FOLDER_FAIL  , "OH_Rdb_GetOrOpen is fail.");
    errCode = 0;

    OH_Rdb_CloseStore(storeTestRdbStore1_);
    OH_Rdb_DeleteStore(&config2_);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_3300
 * @tc.desc: napi test RDB store for dataBaseDir wrong
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3300(napi_env env, napi_callback_info info) {

    char RDB_TEST_PATH3[] =  "";
    char RDB_STORE_NAME3[] =  "rdb_store_test3.db";

    OH_Rdb_Config config3_;
    config3_.dataBaseDir = RDB_TEST_PATH3;
    config3_.storeName = RDB_STORE_NAME3;
    config3_.bundleName = BUNDLE_NAME;
    config3_.moduleName = MODULE_NAME;
    config3_.securityLevel = OH_Rdb_SecurityLevel::S1;
    config3_.isEncrypt = false;
    config3_.selfSize = sizeof(OH_Rdb_Config);  

    mkdir(config3_.dataBaseDir, 0770);

    int errCode = 0;
    storeTestRdbStore2_ = OH_Rdb_GetOrOpen(&config3_, &errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_CREATE_FOLDER_FAIL , "OH_Rdb_GetOrOpen is fail.");
    errCode = 0;
    
    OH_Rdb_CloseStore(storeTestRdbStore2_);
    OH_Rdb_DeleteStore(&config3_);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_3400
 * @tc.desc: napi test RDB store for CloudSync TIME_FIRST
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3400(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr , "OH_Rdb_GetOrOpen is fail.");
    g_env = env;
    constexpr int TABLE_COUNT = 1;
    const char *table[TABLE_COUNT];
    table[0] = "store_test";

    Rdb_ProgressObserver observer;
    void *context = nullptr;
    observer.context = &context;
    observer.callback = ProgressCallback;
    auto errCode = OH_Rdb_CloudSync(storeTestRdbStore_, Rdb_SyncMode::RDB_SYNC_MODE_TIME_FIRST,
        table, TABLE_COUNT, &observer);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK , "OH_Rdb_CloudSync TIME_FIRST is fail.");
    errCode = 0;

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_3500
 * @tc.desc: napi test RDB store for CloudSync CLOUD_FIRST
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3500(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr , "OH_Rdb_GetOrOpen is fail.");
    constexpr int TABLE_COUNT = 1;
    const char *table[TABLE_COUNT];
    table[0] = "store_test";
    Rdb_ProgressObserver observer;
    void *context = nullptr;
    observer.context = &context;
    observer.callback = ProgressCallback;
    int errCode = OH_Rdb_CloudSync(storeTestRdbStore_, Rdb_SyncMode::RDB_SYNC_MODE_CLOUD_FIRST,
        table, TABLE_COUNT, &observer);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK , "OH_Rdb_CloudSync is fail.");
    errCode = 0;

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_3600
 * @tc.desc: napi test RDB store for CloudSync NATIVE_FIRST
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3600(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr , "OH_Rdb_GetOrOpen is fail.");
    constexpr int TABLE_COUNT = 1;
    const char *table[TABLE_COUNT];
    table[0] = "store_test";
    Rdb_ProgressObserver observer;
    void *context = nullptr;
    observer.context = &context;
    observer.callback = ProgressCallback;
    int errCode = OH_Rdb_CloudSync(storeTestRdbStore_, Rdb_SyncMode::RDB_SYNC_MODE_NATIVE_FIRST,
        table, TABLE_COUNT, &observer);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK , "OH_Rdb_CloudSync is fail.");
    errCode = 0;

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_3700
 * @tc.desc: napi test RDB store for CloudSync  err
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3700(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr , "OH_Rdb_GetOrOpen is fail.");
    constexpr int TABLE_COUNT = 1;
    const char *table[TABLE_COUNT];
    table[0] = "store_test";

    int errCode = OH_Rdb_CloudSync(storeTestRdbStore_, Rdb_SyncMode::RDB_SYNC_MODE_NATIVE_FIRST, table, TABLE_COUNT, nullptr);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS , "OH_Rdb_CloudSync is fail.");
    errCode = 0;

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_3800
 * @tc.desc: napi test RDB store for CloudSync  err
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3800(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr , "OH_Rdb_GetOrOpen is fail.");
    constexpr int TABLE_COUNT = 1;
    const char *table[TABLE_COUNT];
    table[0] = "store_test";
    Rdb_ProgressObserver observer;
    void *context = nullptr;
    observer.context = &context;
    observer.callback = ProgressCallback;
    int errCode = OH_Rdb_CloudSync(nullptr, Rdb_SyncMode::RDB_SYNC_MODE_CLOUD_FIRST, table, TABLE_COUNT, &observer);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS , "OH_Rdb_CloudSync is fail.");
    errCode = 0;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_3900
 * @tc.desc: napi test RDB store for SetDistributedTables RdbStore err
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_3900(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr , "OH_Rdb_GetOrOpen is fail.");
    Rdb_DistributedConfig config{ .version = 0, .isAutoSync = true };
    constexpr int TABLE_COUNT = 1;
    const char *table[TABLE_COUNT];
    table[0] = "store_test"; 
    config.version = DISTRIBUTED_CONFIG_VERSION;
    int errCode = OH_Rdb_SetDistributedTables(nullptr, table, TABLE_COUNT, Rdb_DistributedType::RDB_DISTRIBUTED_CLOUD, &config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS , "OH_Rdb_SetDistributedTables 2 is fail.");    
    errCode = 0;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_4000
 * @tc.desc: napi test RDB store for SetDistributedTables  err
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4000(napi_env env, napi_callback_info info) {
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr , "OH_Rdb_GetOrOpen is fail.");
    Rdb_DistributedConfig config{ .version = 0, .isAutoSync = true };
    constexpr int TABLE_COUNT = 1;
    const char *table[TABLE_COUNT];
    table[0] = "store_test"; 
    config.version = DISTRIBUTED_CONFIG_VERSION;
    int errCode = OH_Rdb_SetDistributedTables(NULL, table, TABLE_COUNT, Rdb_DistributedType::RDB_DISTRIBUTED_CLOUD, &config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS , "OH_Rdb_SetDistributedTables 2 is fail.");    
    errCode = 0;

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_4100
 * @tc.desc: napi test RDB store for OH_Rdb_FindModifyTime 
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4100(napi_env env, napi_callback_info info) 
{
    char createLogTableSql[] = "CREATE TABLE if not exists naturalbase_rdb_aux_rdbstoreimpltest_integer_log "
                               "(id INTEGER PRIMARY KEY AUTOINCREMENT, timestamp INTEGER, data_key INTEGER, "
                               "data3 FLOAT, data4 BLOB, data5 BOOLEAN);";
    int errCode = OH_Rdb_Execute(storeTestRdbStore_, createLogTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK , "OH_Rdb_Execute 1 is fail.");    

    OH_VBucket *bucket = OH_Rdb_CreateValuesBucket();
    bucket->putInt64(bucket, "data_key", 1);
    bucket->putInt64(bucket, "timestamp", 1000000000);
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "naturalbase_rdb_aux_rdbstoreimpltest_integer_log", bucket);
    NAPI_ASSERT(env, errCode == 1 , "OH_Rdb_Insert 1 is fail.");    

    OH_VObject *values = OH_Rdb_CreateValueObject();
    int64_t keys[] = { 1 };
    values->putInt64(values, keys, 1);

    OH_Cursor *cursor;
    cursor = OH_Rdb_FindModifyTime(storeTestRdbStore_, "rdbstoreimpltest_integer", "ROWID", values);
    int rowCount;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK , "getRowCount is fail.");    
    NAPI_ASSERT(env, rowCount == 1 , "OH_Rdb_Execute 1 is fail.");    
    cursor->goToNextRow(cursor);
    int64_t key = 0;
    cursor->getInt64(cursor, 0, &key);
    NAPI_ASSERT(env, key == 1 , "getInt64 1 is fail.");  
    int64_t time = 0;
    cursor->getInt64(cursor, 1, &time);
    NAPI_ASSERT(env, time == 100000 , "getInt64 1 is fail.");

    cursor->destroy(cursor);
    char dropLogTableSql[] = "DROP TABLE IF EXISTS naturalbase_rdb_aux_rdbstoreimpltest_integer_log";
    errCode = OH_Rdb_Execute(storeTestRdbStore_, dropLogTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK , "OH_Rdb_Execute is fail.");
    errCode = 0;

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_4200
 * @tc.desc: napi test RDB store for OH_Rdb_FindModifyTime, tablename columnName, keys is empty,
 *           and resultSet is null or empty
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4200(napi_env env, napi_callback_info info) 
{
    char createLogTableSql[] = "CREATE TABLE if not exists naturalbase_rdb_aux_rdbstoreimpltest_integer_log "
                               "(id INTEGER PRIMARY KEY AUTOINCREMENT, timestamp INTEGER, data_key INTEGER, "
                               "data3 FLOAT, data4 BLOB, data5 BOOLEAN);";
    int errCode = OH_Rdb_Execute(storeTestRdbStore_, createLogTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK , "OH_Rdb_Execute 1 is fail.");

    OH_VBucket *bucket = OH_Rdb_CreateValuesBucket();
    bucket->putInt64(bucket, "data_key", 1);
    bucket->putInt64(bucket, "timestamp", 1000000000);
    errCode = OH_Rdb_Insert(storeTestRdbStore_, "naturalbase_rdb_aux_rdbstoreimpltest_integer_log", bucket);
    NAPI_ASSERT(env, errCode == 1 , "OH_Rdb_Insert 1 is fail.");    

    OH_VObject *values = OH_Rdb_CreateValueObject();
    int64_t keys[] = { 1 };
    values->putInt64(values, keys, 1);

    // table name is ""
    OH_Cursor *cursor;
    cursor = OH_Rdb_FindModifyTime(storeTestRdbStore_, "", "data_key", values);
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS , "getRowCount 1 is fail.");

    cursor->destroy(cursor);
    char dropLogTableSql[] = "DROP TABLE IF EXISTS naturalbase_rdb_aux_rdbstoreimpltest_integer_log";
    errCode = OH_Rdb_Execute(storeTestRdbStore_, dropLogTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK , "OH_Rdb_Execute 1 is fail.");
    errCode = 0;

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_4300
 * @tc.desc: napi test RDB store for Rdb_ChangeInfo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4300(napi_env env, napi_callback_info info) 
{
    Rdb_KeyInfo::Rdb_KeyData keydata_;
    keydata_.integer = 1;
    keydata_.real = 1.0;
    keydata_.text = "rdbtest";

    Rdb_KeyInfo keyinfo_1;
    keyinfo_1.count = 1;
    keyinfo_1.type = 1;
    keyinfo_1.data = &keydata_;

    Rdb_KeyInfo keyinfo_2;
    keyinfo_2.count = 1;
    keyinfo_2.type = 1;
    keyinfo_2.data = &keydata_;

    Rdb_KeyInfo keyinfo_3;
    keyinfo_3.count = 1;
    keyinfo_3.type = 1;
    keyinfo_3.data = &keydata_;

    Rdb_ChangeInfo changeinfo_;
    changeinfo_.version = 1;
    changeinfo_.tableName = "tablename";
    changeinfo_.ChangeType = 1;
    changeinfo_.inserted = keyinfo_1;
    changeinfo_.updated = keyinfo_2;
    changeinfo_.deleted = keyinfo_3;

    NAPI_ASSERT(env, Rdb_ChangeType::RDB_DATA_CHANGE == 0 , "RDB_DATA_CHANGE 1 is fail."); 
    NAPI_ASSERT(env, Rdb_ChangeType::RDB_ASSET_CHANGE == 1 , "RDB_ASSET_CHANGE 1 is fail."); 

    NAPI_ASSERT(env, keyinfo_1.count == 1 , "count 1 is fail."); 
    NAPI_ASSERT(env, keyinfo_1.type == 1 , "type 1 is fail."); 
    NAPI_ASSERT(env, keyinfo_1.data == &keydata_ , "keydata_ 1 is fail."); 

    NAPI_ASSERT(env, changeinfo_.version == 1 , "version 1 is fail."); 
    NAPI_ASSERT(env, strcmp(changeinfo_.tableName, "tablename") == 0, "tablename is fail.");
    NAPI_ASSERT(env, changeinfo_.ChangeType == 1 , "ChangeType 1 is fail."); 
    NAPI_ASSERT(env, changeinfo_.inserted.count == 1 , "keyinfo_1 1 is fail."); 
    NAPI_ASSERT(env, changeinfo_.updated.count == 1 , "keyinfo_2 1 is fail."); 
    NAPI_ASSERT(env, changeinfo_.deleted.count == 1 , "keyinfo_3 1 is fail."); 
    int errCode = 0;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;

}
/**
 * @tc.name: SUB_DDM_RDB_4400
 * @tc.desc: napi test RDB store for Rdb_TableDetails
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4400(napi_env env, napi_callback_info info) 
{
    Rdb_Statistic statistic_;
    statistic_.total = 1;
    statistic_.successful = 1;
    statistic_.failed = 1;
    statistic_.remained = 1;

    Rdb_Statistic statistic_2;
    statistic_2.total = 1;
    statistic_2.successful = 1;
    statistic_2.failed = 1;
    statistic_2.remained = 1;

    Rdb_TableDetails tabledetails_;
    tabledetails_.table = "tablename";
    tabledetails_.upload = statistic_;
    tabledetails_.download = statistic_2;

    NAPI_ASSERT(env, Rdb_SubscribeType::RDB_SUBSCRIBE_TYPE_CLOUD == 0 , "RDB_SUBSCRIBE_TYPE_CLOUD 1 is fail."); 
    NAPI_ASSERT(env, Rdb_SubscribeType::RDB_SUBSCRIBE_TYPE_CLOUD_DETAILS == 1 , "RDB_SUBSCRIBE_TYPE_CLOUD_DETAILS 1 is fail.");

    NAPI_ASSERT(env, statistic_.total == 1 , "total 1 is fail."); 
    NAPI_ASSERT(env, statistic_.successful == 1 , "successful 1 is fail."); 
    NAPI_ASSERT(env, statistic_.failed == 1 , "failed 1 is fail."); 
    NAPI_ASSERT(env, statistic_.remained == 1 , "remained 1 is fail."); 
    NAPI_ASSERT(env, strcmp(tabledetails_.table, "tablename") == 0, "tablename is fail.");
    NAPI_ASSERT(env, tabledetails_.upload.total == 1 , "tabledetails_ upload 1 is fail."); 
    NAPI_ASSERT(env, tabledetails_.download.total == 1 , "tabledetails_ download 1 is fail.");
    int errCode = 0;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_4500
 * @tc.desc: napi test RDB store for Rdb_ProgressDetails
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4500(napi_env env, napi_callback_info info) 
{
    Rdb_ProgressDetails progressdetails_;
    progressdetails_.version = 1;
    progressdetails_.schedule = 1;
    progressdetails_.code = 1;
    progressdetails_.tableLength = 10;
    NAPI_ASSERT(env, progressdetails_.version == 1 , "progressdetails_.version 1 is fail."); 
    NAPI_ASSERT(env, progressdetails_.schedule == 1 , "progressdetails_.schedule 1 is fail."); 
    NAPI_ASSERT(env, progressdetails_.code == 1 , "progressdetails_.code 1 is fail."); 
    NAPI_ASSERT(env, progressdetails_.tableLength == 10 , "progressdetails_.tableLength 1 is fail.");  
    
    NAPI_ASSERT(env, Rdb_Progress ::RDB_SYNC_BEGIN == 0 , "RDB_SYNC_BEGIN 1 is fail."); 
    NAPI_ASSERT(env, Rdb_Progress ::RDB_SYNC_IN_PROGRESS == 1 , "RDB_SYNC_IN_PROGRESS 1 is fail."); 
    NAPI_ASSERT(env, Rdb_Progress ::RDB_SYNC_FINISH == 2 , "RDB_SYNC_FINISH 1 is fail."); 

    NAPI_ASSERT(env, Rdb_ProgressCode::RDB_SUCCESS == 0 , "Rdb_ProgressCode RDB_SUCCESS 1 is fail."); 
    NAPI_ASSERT(env, Rdb_ProgressCode::RDB_UNKNOWN_ERROR == 1 , "RDB_UNKNOWN_ERROR 1 is fail."); 
    NAPI_ASSERT(env, Rdb_ProgressCode::RDB_NETWORK_ERROR == 2 , "RDB_NETWORK_ERROR 1 is fail."); 
    NAPI_ASSERT(env, Rdb_ProgressCode::RDB_CLOUD_DISABLED == 3 , "RDB_CLOUD_DISABLED 1 is fail."); 
    NAPI_ASSERT(env, Rdb_ProgressCode::RDB_LOCKED_BY_OTHERS == 4 , "RDB_LOCKED_BY_OTHERS 1 is fail."); 
    NAPI_ASSERT(env, Rdb_ProgressCode::RDB_RECORD_LIMIT_EXCEEDED == 5 , "RDB_RECORD_LIMIT_EXCEEDED 1 is fail."); 
    NAPI_ASSERT(env, Rdb_ProgressCode::RDB_NO_SPACE_FOR_ASSET == 6 , "RDB_NO_SPACE_FOR_ASSET 1 is fail."); 
    int errCode = 0;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;       
}


/**
 * @tc.name: SUB_DDM_RDB_4600
 * @tc.desc: napi test RDB store for Query with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4600(napi_env env, napi_callback_info info)
{
    int errCode = -1;
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr, "store is nullptr.");
    errCode = OH_Rdb_Subscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD, &briefObs);
    NAPI_ASSERT(env, errCode == RDB_OK, "sub1 failed.");

    errCode = OH_Rdb_Subscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD, &briefObs);
    NAPI_ASSERT(env, errCode == RDB_OK, "sub2 failed.");

    errCode = OH_Rdb_Subscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "sub3 failed.");

    errCode = OH_Rdb_Subscribe(nullptr, RDB_SUBSCRIBE_TYPE_CLOUD, &briefObs);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "sub4 failed.");
    
    napi_value returnCode;
    if (errCode == RDB_E_INVALID_ARGS) {
        errCode = RDB_OK;
    }
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_4700
 * @tc.desc: napi test RDB store for Query with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4700(napi_env env, napi_callback_info info)
{
    int errCode = -1;
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr, "store is nullptr.");

    errCode = OH_Rdb_Subscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD_DETAILS, &detailObs);
    NAPI_ASSERT(env, errCode == RDB_OK, "sub1 failed.");

    errCode = OH_Rdb_Subscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD_DETAILS, &detailObs);
    NAPI_ASSERT(env, errCode == RDB_OK, "sub2 failed.");

    errCode = OH_Rdb_Subscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD_DETAILS, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "sub3 failed.");
    
    errCode = OH_Rdb_Subscribe(nullptr, RDB_SUBSCRIBE_TYPE_CLOUD_DETAILS, &detailObs);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "sub4 failed.");
    
    napi_value returnCode;
    if (errCode == RDB_E_INVALID_ARGS) {
        errCode = RDB_OK;
    }
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_4800
 * @tc.desc: napi test RDB store for Query with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4800(napi_env env, napi_callback_info info)
{
    int errCode = -1;
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr, "store is nullptr.");

    errCode = OH_Rdb_Unsubscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD, &briefObs);
    NAPI_ASSERT(env, errCode == RDB_OK, "unsub1 failed.");

    errCode = OH_Rdb_Unsubscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD, nullptr);
    NAPI_ASSERT(env, errCode == RDB_OK, "unsub2 failed.");

    errCode = OH_Rdb_Unsubscribe(nullptr, RDB_SUBSCRIBE_TYPE_CLOUD, &briefObs);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "unsub3 failed.");

    napi_value returnCode;
    if (errCode == RDB_E_INVALID_ARGS) {
        errCode = RDB_OK;
    }
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_4900
 * @tc.desc: napi test RDB store for Query with wrong table or table is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_4900(napi_env env, napi_callback_info info)
{
    int errCode = -1;
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr, "store is nullptr.");

    errCode = OH_Rdb_Unsubscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD_DETAILS, &detailObs);
    NAPI_ASSERT(env, errCode == RDB_OK, "unsub1 failed.");

    errCode = OH_Rdb_Unsubscribe(storeTestRdbStore_, RDB_SUBSCRIBE_TYPE_CLOUD_DETAILS, nullptr);
    NAPI_ASSERT(env, errCode == RDB_OK, "unsub2 failed.");

    errCode = OH_Rdb_Unsubscribe(nullptr, RDB_SUBSCRIBE_TYPE_CLOUD_DETAILS, &detailObs);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "unsub3 failed.");
    
    napi_value returnCode;
    if (errCode == RDB_E_INVALID_ARGS) {
        errCode = RDB_OK;
    }
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_5000
 * @tc.desc: napi test RDB store for OH_Rdb_UnsubscribeAutoSyncProgress test.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_5000(napi_env env, napi_callback_info info)
{
    int errCode = -1;
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr, "store is nullptr.");
    errCode = OH_Rdb_UnsubscribeAutoSyncProgress(storeTestRdbStore_, &observer);

    NAPI_ASSERT(env, errCode == RDB_OK, "unsub1 failed.");
    errCode = OH_Rdb_UnsubscribeAutoSyncProgress(storeTestRdbStore_, &observer);

    NAPI_ASSERT(env, errCode == RDB_OK, "unsub2 failed.");
    errCode = OH_Rdb_UnsubscribeAutoSyncProgress(storeTestRdbStore_, nullptr);

    NAPI_ASSERT(env, errCode == RDB_OK, "unsub3 failed.");
    errCode = OH_Rdb_UnsubscribeAutoSyncProgress(nullptr, &observer);

    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "unsub4 failed.");
    napi_value returnCode;
    if (errCode == RDB_E_INVALID_ARGS) {
        errCode = RDB_OK;
    }
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_5100
 * @tc.desc: napi test RDB store for OH_Rdb_subscribeAutoSyncProgress test.
 * @tc.type: FUNC
 */

static napi_value SUB_DDM_RDB_5100(napi_env env, napi_callback_info info)
{
    int errCode = -1;
    NAPI_ASSERT(env, storeTestRdbStore_ != nullptr, "store is nullptr.");
    errCode = OH_Rdb_SubscribeAutoSyncProgress(storeTestRdbStore_, &observer);
    NAPI_ASSERT(env, errCode == RDB_OK, "sub1 failed.");

    errCode = OH_Rdb_SubscribeAutoSyncProgress(storeTestRdbStore_, &observer);
    NAPI_ASSERT(env, errCode == RDB_OK, "sub2 failed.");

    errCode = OH_Rdb_SubscribeAutoSyncProgress(storeTestRdbStore_, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "sub3 failed.");

    errCode = OH_Rdb_SubscribeAutoSyncProgress(nullptr, &observer);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "sub4 failed.");
    
    napi_value returnCode;
    if (errCode == RDB_E_INVALID_ARGS) {
        errCode = RDB_OK;
    }
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"RdbFilePath", nullptr, RdbFilePath, nullptr, nullptr, nullptr, napi_default, nullptr},        
        {"RdbstoreSetUpTestCase", nullptr, RdbstoreSetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbstoreTearDownTestCase", nullptr, RdbstoreTearDownTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0100", nullptr, SUB_DDM_RDB_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0200", nullptr, SUB_DDM_RDB_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0300", nullptr, SUB_DDM_RDB_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0400", nullptr, SUB_DDM_RDB_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0500", nullptr, SUB_DDM_RDB_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0600", nullptr, SUB_DDM_RDB_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0700", nullptr, SUB_DDM_RDB_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0800", nullptr, SUB_DDM_RDB_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_0900", nullptr, SUB_DDM_RDB_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1000", nullptr, SUB_DDM_RDB_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1100", nullptr, SUB_DDM_RDB_1100, nullptr, nullptr, nullptr, napi_default, nullptr},    
        {"SUB_DDM_RDB_1200", nullptr, SUB_DDM_RDB_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1300", nullptr, SUB_DDM_RDB_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1400", nullptr, SUB_DDM_RDB_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1500", nullptr, SUB_DDM_RDB_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1600", nullptr, SUB_DDM_RDB_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1700", nullptr, SUB_DDM_RDB_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1800", nullptr, SUB_DDM_RDB_1800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_1900", nullptr, SUB_DDM_RDB_1900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2000", nullptr, SUB_DDM_RDB_2000, nullptr, nullptr, nullptr, napi_default, nullptr},   
        {"SUB_DDM_RDB_2100", nullptr, SUB_DDM_RDB_2100, nullptr, nullptr, nullptr, napi_default, nullptr},    
        {"SUB_DDM_RDB_2200", nullptr, SUB_DDM_RDB_2200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2300", nullptr, SUB_DDM_RDB_2300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2400", nullptr, SUB_DDM_RDB_2400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2500", nullptr, SUB_DDM_RDB_2500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2600", nullptr, SUB_DDM_RDB_2600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2700", nullptr, SUB_DDM_RDB_2700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2800", nullptr, SUB_DDM_RDB_2800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_2900", nullptr, SUB_DDM_RDB_2900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3000", nullptr, SUB_DDM_RDB_3000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3100", nullptr, SUB_DDM_RDB_3100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3200", nullptr, SUB_DDM_RDB_3200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3300", nullptr, SUB_DDM_RDB_3300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3400", nullptr, SUB_DDM_RDB_3400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3500", nullptr, SUB_DDM_RDB_3500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3600", nullptr, SUB_DDM_RDB_3600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3700", nullptr, SUB_DDM_RDB_3700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3800", nullptr, SUB_DDM_RDB_3800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_3900", nullptr, SUB_DDM_RDB_3900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4000", nullptr, SUB_DDM_RDB_4000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4100", nullptr, SUB_DDM_RDB_4100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4200", nullptr, SUB_DDM_RDB_4200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4300", nullptr, SUB_DDM_RDB_4300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4400", nullptr, SUB_DDM_RDB_4400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4500", nullptr, SUB_DDM_RDB_4500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4600", nullptr, SUB_DDM_RDB_4600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4700", nullptr, SUB_DDM_RDB_4700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4800", nullptr, SUB_DDM_RDB_4800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_4900", nullptr, SUB_DDM_RDB_4900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_5000", nullptr, SUB_DDM_RDB_5000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_5100", nullptr, SUB_DDM_RDB_5100, nullptr, nullptr, nullptr, napi_default, nullptr}

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
    .nm_modname = "rdbtest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) {
    napi_module_register(&demoModule);
}
