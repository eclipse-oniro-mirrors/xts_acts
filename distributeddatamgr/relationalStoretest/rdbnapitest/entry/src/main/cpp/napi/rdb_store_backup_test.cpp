/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <securec.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "napi/native_api.h"
#include "common/common.h"
#include "relational_store.h"
#include "relational_store_error_code.h"
#include "oh_cursor.h"
#include "oh_predicates.h"
#include "oh_value_object.h"
#include "oh_values_bucket.h"

char *RDB_TEST_PATH =  NULL;

char RDB_STORE_NAME[] =  "rdb_store_test.db";
char BUNDLE_NAME[] =  "com.acts.rdb.napitest";
char MODULE_NAME[] =  "com.acts.rdb.napitest";

OH_Rdb_Store *storeBackupTestRdbStore_ = NULL;
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
    sprintf(RDB_TEST_PATH, "%s/", buffer);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value RdbstoreSetUpTestCase(napi_env env, napi_callback_info info) {

    InitRdbConfig();
    mkdir(config_.dataBaseDir, 0770);

    int errCode = 0;
    storeBackupTestRdbStore_ = OH_Rdb_GetOrOpen(&config_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_GetOrOpen is fail.");
    NAPI_ASSERT(env, storeBackupTestRdbStore_ != NULL, "OH_Rdb_GetOrOpen config is fail.");

    char createTableSql[] = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode = OH_Rdb_Execute(storeBackupTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value RdbstoreTearDownTestCase(napi_env env, napi_callback_info info) {
    int errCode = 0;
    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    OH_Rdb_Execute(storeBackupTestRdbStore_, dropTableSql);
    OH_Rdb_CloseStore(storeBackupTestRdbStore_);
    errCode = OH_Rdb_DeleteStore(&config_);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_BackupRestoreTest_0100(napi_env env, napi_callback_info info) {

    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");

    int errCode = OH_Rdb_Insert(storeBackupTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);

    char dbpath[] = "";
    char backupPath[100];
    sprintf(backupPath, "%s%s", RDB_TEST_PATH, dbpath);
    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 14800011, "OH_Rdb_Backup is success.");

    errCode = valueBucket->destroy(valueBucket);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_BackupRestoreTest_0300(napi_env env, napi_callback_info info) {
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    int errCode = OH_Rdb_Insert(storeBackupTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);

    char dbpath[] = "backup.db";
    char backupPath[100];
    sprintf(backupPath, "%s%s", RDB_TEST_PATH, dbpath);
    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Backup1 is fail.");

    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Backup2 is fail.");

    // delete data before restore
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    errCode = OH_Rdb_Delete(storeBackupTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Delete is fail.");

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Restore is fail.");

    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value[size + 1];
    cursor->getText(cursor, 1, data1Value, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value, "zhangSan", 8) == 0, "getText is fail.");

    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getInt64 is fail.");

    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 100.1, "getReal is fail.");

    cursor->getSize(cursor, 4, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getBlob1 is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getBlob2 is fail.");

    cursor->getSize(cursor, 5, &size);
    char data5Value[size + 1];
    cursor->getText(cursor, 5, data5Value, size + 1);
    NAPI_ASSERT(env, strncmp(data5Value, "ABCDEFG", 7) == 0, "getText is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_BackupRestoreTest_0400(napi_env env, napi_callback_info info) {
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    int errCode = OH_Rdb_Insert(storeBackupTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);

    char dbpath1[] = "backup1.db";
    char backupPath1[100];
    sprintf(backupPath1, "%s%s", RDB_TEST_PATH, dbpath1);
    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath1);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Backup1 is fail.");

    char dbpath2[] = "backup2.db";
    char backupPath2[100];
    sprintf(backupPath2, "%s%s", RDB_TEST_PATH, dbpath2);
    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath2);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Backup2 is fail.");

    // delete data before restore
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    errCode = OH_Rdb_Delete(storeBackupTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Delete is fail.");

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, backupPath1);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Restore1 is fail.");

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, backupPath2);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Restore2 is fail.");

    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


static napi_value SUB_DDM_RDB_BackupRestoreTest_0500(napi_env env, napi_callback_info info) {
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    int errCode = OH_Rdb_Insert(storeBackupTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "Insert data is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);

    char dbpath[] = "backup.db";
    char backupPath[100];
    sprintf(backupPath, "%s%s", RDB_TEST_PATH, dbpath);

    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Backup is fail.");

    // delete data before restore
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    errCode = OH_Rdb_Delete(storeBackupTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 1, "DeleteData is fail.");

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Restore is fail.");

    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value[size + 1];
    cursor->getText(cursor, 1, data1Value, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value, "zhangSan", 8) == 0, "getText is fail.");

    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getInt64 is fail.");

    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 100.1, "getReal is fail.");

    cursor->getSize(cursor, 4, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getBlob1 is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getBlob2 is fail.");

    cursor->getSize(cursor, 5, &size);
    char data5Value[size + 1];
    cursor->getText(cursor, 5, data5Value, size + 1);
    NAPI_ASSERT(env, strncmp(data5Value, "ABCDEFG", 7) == 0, "getText is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


static napi_value SUB_DDM_RDB_BackupRestoreTest_0600(napi_env env, napi_callback_info info) {
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    int errCode = OH_Rdb_Insert(storeBackupTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "Insert data is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);

    char dbpath[] = " ";
    char backupPath[100];
    sprintf(backupPath, "%s%s", RDB_TEST_PATH, dbpath);
    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Backup is fail.");

    // delete data before restore
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    errCode = OH_Rdb_Delete(storeBackupTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 1, "DeleteData is fail.");

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Restore is fail.");

    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value[size + 1];
    cursor->getText(cursor, 1, data1Value, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value, "zhangSan", 8) == 0, "getText is fail.");

    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getInt64 is fail.");

    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 100.1, "getReal is fail.");

    cursor->getSize(cursor, 4, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getBlob1 is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getBlob2 is fail.");

    cursor->getSize(cursor, 5, &size);
    char data5Value[size + 1];
    cursor->getText(cursor, 5, data5Value, size + 1);
    NAPI_ASSERT(env, strncmp(data5Value, "ABCDEFG", 7) == 0, "getText is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_BackupRestoreTest_0700(napi_env env, napi_callback_info info) {
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    int errCode = OH_Rdb_Insert(storeBackupTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "Insert data is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);

    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, NULL);
    NAPI_ASSERT(env, errCode == 14800001, "OH_Rdb_Backup is success.");
    
    errCode = valueBucket->destroy(valueBucket);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_BackupRestoreTest_0800(napi_env env, napi_callback_info info) {
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    int errCode = OH_Rdb_Insert(storeBackupTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "Insert data is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);

    char dbpath[] = "backupNull.db";
    char backupPath[100];
    sprintf(backupPath, "%s%s", RDB_TEST_PATH, dbpath);
    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Backup is fail.");

    // delete data before restore
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    errCode = OH_Rdb_Delete(storeBackupTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 1, "DeleteData is fail.");

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, NULL);
    NAPI_ASSERT(env, errCode == 14800001, "OH_Rdb_Restore is success.");
    
    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is success.");

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Restore is fail.");
    
    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    NAPI_ASSERT(env, errCode == 0, "goToNextRow is fail.");

    size_t size = 0;
    cursor->getSize(cursor, 1, &size);
    char data1Value[size + 1];
    cursor->getText(cursor, 1, data1Value, size + 1);
    NAPI_ASSERT(env, strncmp(data1Value, "zhangSan", 8) == 0, "getText is fail.");

    int64_t data2Value;
    cursor->getInt64(cursor, 2, &data2Value);
    NAPI_ASSERT(env, data2Value == 12800, "getInt64 is fail.");

    double data3Value;
    cursor->getReal(cursor, 3, &data3Value);
    NAPI_ASSERT(env, data3Value == 100.1, "getReal is fail.");

    cursor->getSize(cursor, 4, &size);
    unsigned char data4Value[size];
    cursor->getBlob(cursor, 4, data4Value, size);
    NAPI_ASSERT(env, data4Value[0] == 1, "getBlob1 is fail.");
    NAPI_ASSERT(env, data4Value[1] == 2, "getBlob2 is fail.");

    cursor->getSize(cursor, 5, &size);
    char data5Value[size + 1];
    cursor->getText(cursor, 5, data5Value, size + 1);
    NAPI_ASSERT(env, strncmp(data5Value, "ABCDEFG", 7) == 0, "getText is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}



static napi_value SUB_DDM_RDB_BackupRestoreTest_0900(napi_env env, napi_callback_info info) {
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");

    int errCode = OH_Rdb_Insert(storeBackupTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);

    char dbpath[] = "backupEmpty.db";
    char backupPath[100];
    sprintf(backupPath, "%s%s", RDB_TEST_PATH, dbpath);
    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Backup is fail.");

    // delete data before restore
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    errCode = OH_Rdb_Delete(storeBackupTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Delete is fail.");

    char dbpath1[] = "";
    char reStorePath[100];
    sprintf(reStorePath, "%s%s", RDB_TEST_PATH, dbpath1);

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, reStorePath);
    NAPI_ASSERT(env, errCode == 14800011, "OH_Rdb_Restore is success.");

    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Restore is fail.");

    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_BackupRestoreTest_0110(napi_env env, napi_callback_info info) {
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");

    int errCode = OH_Rdb_Insert(storeBackupTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");

    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    cursor->destroy(cursor);

    char dbpath[] = "backupWrong.db";
    char backupPath[100];
    sprintf(backupPath, "%s%s", RDB_TEST_PATH, dbpath);

    errCode = OH_Rdb_Backup(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Backup is fail.");

    // delete data before restore
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    errCode = OH_Rdb_Delete(storeBackupTestRdbStore_, predicates);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Delete is fail.");

    char dbpath2[] = "wrong.db";
    char reStorePath[100];
    sprintf(reStorePath, "%s%s", RDB_TEST_PATH, dbpath2);
    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, reStorePath);
    NAPI_ASSERT(env, errCode == 14800011, "OH_Rdb_Restore is success.");

    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    errCode = OH_Rdb_Restore(storeBackupTestRdbStore_, backupPath);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Restore is fail.");

    cursor = OH_Rdb_ExecuteQuery(storeBackupTestRdbStore_, querySql);
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueBucket->destroy(valueBucket);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}




EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"RdbFilePath", nullptr, RdbFilePath, nullptr, nullptr, nullptr, napi_default, nullptr}, 
        {"RdbstoreSetUpTestCase", nullptr, RdbstoreSetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RdbstoreTearDownTestCase", nullptr, RdbstoreTearDownTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_BackupRestoreTest_0100", nullptr, SUB_DDM_RDB_BackupRestoreTest_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_BackupRestoreTest_0300", nullptr, SUB_DDM_RDB_BackupRestoreTest_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_BackupRestoreTest_0400", nullptr, SUB_DDM_RDB_BackupRestoreTest_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_BackupRestoreTest_0500", nullptr, SUB_DDM_RDB_BackupRestoreTest_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_BackupRestoreTest_0600", nullptr, SUB_DDM_RDB_BackupRestoreTest_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_BackupRestoreTest_0700", nullptr, SUB_DDM_RDB_BackupRestoreTest_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_BackupRestoreTest_0800", nullptr, SUB_DDM_RDB_BackupRestoreTest_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_BackupRestoreTest_0900", nullptr, SUB_DDM_RDB_BackupRestoreTest_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_BackupRestoreTest_0110", nullptr, SUB_DDM_RDB_BackupRestoreTest_0110, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "backup",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) {
    napi_module_register(&demoModule);
}
