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
OH_Rdb_Store *storeLevelTestRdbStore_ = NULL;
static OH_Rdb_Config config1_;
static OH_Rdb_Config config2_;
static OH_Rdb_Config config3_;
static OH_Rdb_Config config4_;
static OH_Rdb_Config config_EL1;
static OH_Rdb_Config config_EL2;
static OH_Rdb_Config config_EL3;
static OH_Rdb_Config config_EL4;
static void InitRdbConfig1()
{
    config1_.dataBaseDir = RDB_TEST_PATH;
    config1_.storeName = RDB_STORE_NAME;
    config1_.bundleName = BUNDLE_NAME;
    config1_.moduleName = MODULE_NAME;
    config1_.securityLevel = OH_Rdb_SecurityLevel::S1;
    config1_.isEncrypt = false;
    config1_.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig2()
{
    config2_.dataBaseDir = RDB_TEST_PATH;
    config2_.storeName = RDB_STORE_NAME;
    config2_.bundleName = BUNDLE_NAME;
    config2_.moduleName = MODULE_NAME;
    config2_.securityLevel = OH_Rdb_SecurityLevel::S2;
    config2_.isEncrypt = false;
    config2_.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig3()
{
    config3_.dataBaseDir = RDB_TEST_PATH;
    config3_.storeName = RDB_STORE_NAME;
    config3_.bundleName = BUNDLE_NAME;
    config3_.moduleName = MODULE_NAME;
    config3_.securityLevel = OH_Rdb_SecurityLevel::S3;
    config3_.isEncrypt = false;
    config3_.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig4()
{
    config4_.dataBaseDir = RDB_TEST_PATH;
    config4_.storeName = RDB_STORE_NAME;
    config4_.bundleName = BUNDLE_NAME;
    config4_.moduleName = MODULE_NAME;
    config4_.securityLevel = OH_Rdb_SecurityLevel::S4;
    config4_.isEncrypt = false;
    config4_.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig_EL1()
{
    config_EL1.dataBaseDir = RDB_TEST_PATH;
    config_EL1.storeName = RDB_STORE_NAME;
    config_EL1.bundleName = BUNDLE_NAME;
    config_EL1.moduleName = MODULE_NAME;
    config_EL1.securityLevel = OH_Rdb_SecurityLevel::S1;
    config_EL1.isEncrypt = false;
    config_EL1.area = Rdb_SecurityArea::RDB_SECURITY_AREA_EL1;
    config_EL1.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig_EL2()
{
    config_EL2.dataBaseDir = RDB_TEST_PATH;
    config_EL2.storeName = RDB_STORE_NAME;
    config_EL2.bundleName = BUNDLE_NAME;
    config_EL2.moduleName = MODULE_NAME;
    config_EL2.securityLevel = OH_Rdb_SecurityLevel::S1;
    config_EL2.isEncrypt = false;
    config_EL2.area = Rdb_SecurityArea::RDB_SECURITY_AREA_EL2;
    config_EL2.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig_EL3()
{
    config_EL3.dataBaseDir = RDB_TEST_PATH;
    config_EL3.storeName = RDB_STORE_NAME;
    config_EL3.bundleName = BUNDLE_NAME;
    config_EL3.moduleName = MODULE_NAME;
    config_EL3.securityLevel = OH_Rdb_SecurityLevel::S1;
    config_EL3.isEncrypt = false;
    config_EL3.area = Rdb_SecurityArea::RDB_SECURITY_AREA_EL3;
    config_EL3.selfSize = sizeof(OH_Rdb_Config);
}

static void InitRdbConfig_EL4()
{
    config_EL4.dataBaseDir = RDB_TEST_PATH;
    config_EL4.storeName = RDB_STORE_NAME;
    config_EL4.bundleName = BUNDLE_NAME;
    config_EL4.moduleName = MODULE_NAME;
    config_EL4.securityLevel = OH_Rdb_SecurityLevel::S1;
    config_EL4.isEncrypt = false;
    config_EL4.area = Rdb_SecurityArea::RDB_SECURITY_AREA_EL4;
    config_EL4.selfSize = sizeof(OH_Rdb_Config);
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

static napi_value SUB_DDM_RDB_LEVEL_0100(napi_env env, napi_callback_info info) {
    InitRdbConfig1();
    mkdir(config1_.dataBaseDir, 0770);
    int errCode = 0;
    storeLevelTestRdbStore_ = OH_Rdb_GetOrOpen(&config1_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "getRdbStore is fail.");
        
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                                "data3 FLOAT, data4 BLOB, data5 TEXT);";
        
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    
    errCode = OH_Rdb_Insert(storeLevelTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeLevelTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);
    
    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(storeLevelTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config1_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail."); 

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_LEVEL_0200(napi_env env, napi_callback_info info) {
    InitRdbConfig2();
    mkdir(config2_.dataBaseDir, 0770);
    int errCode = 0;
    storeLevelTestRdbStore_ = OH_Rdb_GetOrOpen(&config2_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "getRdbStore is fail.");
        
    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                                "data3 FLOAT, data4 BLOB, data5 TEXT);";
        
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    
    errCode = OH_Rdb_Insert(storeLevelTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeLevelTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);

    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(storeLevelTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config2_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail."); 

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_LEVEL_0300(napi_env env, napi_callback_info info) {
    InitRdbConfig3();
    mkdir(config3_.dataBaseDir, 0770);
    int errCode = 0;
    storeLevelTestRdbStore_ = OH_Rdb_GetOrOpen(&config3_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "getRdbStore is fail.");
        
    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                                "data3 FLOAT, data4 BLOB, data5 TEXT);";
        
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    
    errCode = OH_Rdb_Insert(storeLevelTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeLevelTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);

    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(storeLevelTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config3_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail."); 

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_LEVEL_0400(napi_env env, napi_callback_info info) {
    InitRdbConfig4();
    mkdir(config4_.dataBaseDir, 0770);
    int errCode = 0;
    storeLevelTestRdbStore_ = OH_Rdb_GetOrOpen(&config4_, &errCode);
    NAPI_ASSERT(env, errCode == 0, "getRdbStore is fail.");
        
    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                                "data3 FLOAT, data4 BLOB, data5 TEXT);";
        
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    
    errCode = OH_Rdb_Insert(storeLevelTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeLevelTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);

    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(storeLevelTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config4_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail."); 

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_LEVEL_EL_0100(napi_env env, napi_callback_info info) {
    InitRdbConfig_EL1();
    mkdir(config_EL1.dataBaseDir, 0770);
    int errCode = 0;
    storeLevelTestRdbStore_ = OH_Rdb_GetOrOpen(&config_EL1, &errCode);
    NAPI_ASSERT(env, errCode == 0, "getRdbStore is fail.");
        
    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                                "data3 FLOAT, data4 BLOB, data5 TEXT);";
        
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    
    errCode = OH_Rdb_Insert(storeLevelTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeLevelTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);

    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(storeLevelTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config_EL1);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail."); 

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
static napi_value SUB_DDM_RDB_LEVEL_EL_0200(napi_env env, napi_callback_info info) {
    InitRdbConfig_EL2();
    mkdir(config_EL2.dataBaseDir, 0770);
    int errCode = 0;
    storeLevelTestRdbStore_ = OH_Rdb_GetOrOpen(&config_EL2, &errCode);
    NAPI_ASSERT(env, errCode == 0, "getRdbStore is fail.");
        
    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                                "data3 FLOAT, data4 BLOB, data5 TEXT);";
        
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    
    errCode = OH_Rdb_Insert(storeLevelTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeLevelTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);

    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(storeLevelTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config_EL2);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail."); 

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_LEVEL_EL_0300(napi_env env, napi_callback_info info) {
    InitRdbConfig_EL3();
    mkdir(config_EL3.dataBaseDir, 0770);
    int errCode = 0;
    storeLevelTestRdbStore_ = OH_Rdb_GetOrOpen(&config_EL3, &errCode);
    NAPI_ASSERT(env, errCode == 0, "getRdbStore is fail.");
        
    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                                "data3 FLOAT, data4 BLOB, data5 TEXT);";
        
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    
    errCode = OH_Rdb_Insert(storeLevelTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeLevelTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);

    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(storeLevelTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config_EL3);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail."); 

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value SUB_DDM_RDB_LEVEL_EL_0400(napi_env env, napi_callback_info info) {
    InitRdbConfig_EL4();
    mkdir(config_EL4.dataBaseDir, 0770);
    int errCode = 0;
    storeLevelTestRdbStore_ = OH_Rdb_GetOrOpen(&config_EL4, &errCode);
    NAPI_ASSERT(env, errCode == 0, "getRdbStore is fail.");
        
    char createTableSql[] = "CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                                "data3 FLOAT, data4 BLOB, data5 TEXT);";
        
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, createTableSql);
    NAPI_ASSERT(env, errCode == 0, "createTable is fail.");
    
    OH_VBucket* valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    
    errCode = OH_Rdb_Insert(storeLevelTestRdbStore_, "test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    
    char querySql[] = "SELECT * FROM test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(storeLevelTestRdbStore_, querySql);
    
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    
    valueBucket->destroy(valueBucket);
    cursor->destroy(cursor);

    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    errCode = OH_Rdb_Execute(storeLevelTestRdbStore_, dropTableSql);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_Execute is fail.");   
    errCode = OH_Rdb_CloseStore(storeLevelTestRdbStore_);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CloseStore is fail.");   
    errCode = OH_Rdb_DeleteStore(&config_EL4);
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_DeleteStore is fail."); 

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"RdbFilePath", nullptr, RdbFilePath, nullptr, nullptr, nullptr, napi_default, nullptr}, 
        {"SUB_DDM_RDB_LEVEL_0100", nullptr, SUB_DDM_RDB_LEVEL_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_LEVEL_0200", nullptr, SUB_DDM_RDB_LEVEL_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_LEVEL_0300", nullptr, SUB_DDM_RDB_LEVEL_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_LEVEL_0400", nullptr, SUB_DDM_RDB_LEVEL_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_LEVEL_EL_0100", nullptr, SUB_DDM_RDB_LEVEL_EL_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_LEVEL_EL_0200", nullptr, SUB_DDM_RDB_LEVEL_EL_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_LEVEL_EL_0300", nullptr, SUB_DDM_RDB_LEVEL_EL_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_LEVEL_EL_0400", nullptr, SUB_DDM_RDB_LEVEL_EL_0400, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "level",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) {
    napi_module_register(&demoModule);
}
