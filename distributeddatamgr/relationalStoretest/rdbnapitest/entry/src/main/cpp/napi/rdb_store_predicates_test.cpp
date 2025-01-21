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

OH_Rdb_Store *predicatesTestRdbStore_ = NULL;

char *RDB_TEST_PATH =  NULL;
char RDB_STORE_NAME[] =  "rdb_store_predicates_test.db";
char BUNDLE_NAME[] =  "com.acts.rdb.napitest";
char MODULE_NAME[] =  "com.acts.rdb.napitest";

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
    sprintf(RDB_TEST_PATH, "%s", buffer);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

static napi_value PredicatesSetUpTestCase(napi_env env, napi_callback_info info) {
    InitRdbConfig();
    mkdir(config_.dataBaseDir, 0770);

    int errCode = 0;
    char table[] = "test";
    predicatesTestRdbStore_ = OH_Rdb_GetOrOpen(&config_, &errCode);
    NAPI_ASSERT(env, predicatesTestRdbStore_ != NULL, "OH_Rdb_GetOrOpen is fail.");

     char createTableSql[] = "CREATE TABLE IF NOT EXISTS test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode = OH_Rdb_Execute(predicatesTestRdbStore_, createTableSql);

    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 1);
    valueBucket->putText(valueBucket, "data1", "zhangSan");
    valueBucket->putInt64(valueBucket, "data2", 12800);
    valueBucket->putReal(valueBucket, "data3", 100.1);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "data4", arr, len);
    valueBucket->putText(valueBucket, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(predicatesTestRdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert 1  is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    errCode = OH_Rdb_Insert(predicatesTestRdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == 2, "OH_Rdb_Insert 2  is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 3);
    valueBucket->putText(valueBucket, "data1", "wangWu");
    valueBucket->putInt64(valueBucket, "data2", 14800);
    valueBucket->putReal(valueBucket, "data3", 300.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGHI");
    errCode = OH_Rdb_Insert(predicatesTestRdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == 3, "OH_Rdb_Insert 3  is fail.");

    valueBucket->clear(valueBucket);
    valueBucket->putInt64(valueBucket, "id", 4);
    valueBucket->putText(valueBucket, "data1", "zhangliu");
    valueBucket->putInt64(valueBucket, "data2", 14800);
    valueBucket->putReal(valueBucket, "data3", 300.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGHI");
    errCode = OH_Rdb_Insert(predicatesTestRdbStore_, table, valueBucket);
    NAPI_ASSERT(env, errCode == 4, "OH_Rdb_Insert 4  is fail.");

    errCode = 0;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
    
}

static napi_value PredicatesTearDownTestCase(napi_env env, napi_callback_info info) {
    int errCode = 0;
    char dropTableSql[] = "DROP TABLE IF EXISTS test";
    OH_Rdb_Execute(predicatesTestRdbStore_, dropTableSql);
    OH_Rdb_CloseStore(predicatesTestRdbStore_);
    errCode = OH_Rdb_DeleteStore(&config_);
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;

}


/**
 * @tc.name: SUB_DDM_RDB_Predicates_0100
 * @tc.desc: napi test RDB Predicates for EqualTo、AndOR、beginWrap and endWrap
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_0100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->beginWrap(predicates);
    predicates->equalTo(predicates, "data1", valueObject);
    predicates->orOperate(predicates);
    double data3Value = 200.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->equalTo(predicates, "data3", valueObject);
    predicates->endWrap(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_0200
 * @tc.desc: napi test RDB Predicates for NotEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_0200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->notEqualTo(predicates, "data1", valueObject);
    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_Predicates_0300
 * @tc.desc: napi test RDB Predicates for GreaterThan
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_0300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCDEFG";
    valueObject->putText(valueObject, data5Value);
    predicates->greaterThan(predicates, "data5", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_0400
 * @tc.desc: napi test RDB Predicates for GreaterThanOrEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_0400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCDEFG";
    valueObject->putText(valueObject, data5Value);
    predicates->greaterThanOrEqualTo(predicates, "data5", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 4, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}



/**
 * @tc.name: SUB_DDM_RDB_Predicates_0500
 * @tc.desc: napi test RDB Predicates for LessThan
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_0500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCDEFG";
    valueObject->putText(valueObject, data5Value);
    predicates->lessThan(predicates, "data5", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);

    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_0600
 * @tc.desc: napi test RDB Predicates for LessThanOrEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_0600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCDEFG";
    valueObject->putText(valueObject, data5Value);
    predicates->lessThanOrEqualTo(predicates, "data5", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_0700
 * @tc.desc: napi test RDB Predicates for IsNull
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_0700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->isNull(predicates, "data4");

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_0800
 * @tc.desc: napi test RDB Predicates for isNotNull
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_0800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->isNotNull(predicates, "data4");

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_0900
 * @tc.desc: napi test RDB Predicates for Between
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_0900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data2Value[] = {12000, 13000};
    uint32_t len = sizeof(data2Value) / sizeof(data2Value[0]);
    valueObject->putInt64(valueObject, data2Value, len);
    predicates->between(predicates, "data2", valueObject);
    double data3Value[] = {0.1, 101.1};
    len = sizeof(data3Value) / sizeof(data3Value[0]);
    valueObject->putDouble(valueObject, data3Value, len);
    predicates->between(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_1000
 * @tc.desc: napi test RDB Predicates for NotBetween
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data2Value[] = {12000, 13000};
    int len = sizeof(data2Value) / sizeof(data2Value[0]);
    valueObject->putInt64(valueObject, data2Value, len);
    predicates->notBetween(predicates, "data2", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}


/**
 * @tc.name: SUB_DDM_RDB_Predicates_1100
 * @tc.desc: napi test RDB Predicates for OrderBy、Limit、Offset.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->orderBy(predicates, "data2", OH_OrderType::ASC);
    predicates->limit(predicates, 1);
    predicates->offset(predicates, 0);
    predicates->distinct(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    int columnIndex;
    cursor->getColumnIndex(cursor, "data2", &columnIndex);
    NAPI_ASSERT(env, columnIndex == 2, "getColumnIndex is fail.");

    int64_t longValue;
    cursor->getInt64(cursor, columnIndex, &longValue);
    NAPI_ASSERT(env, longValue == 12800, "getInt64 is fail.");


    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_1200
 * @tc.desc: napi test RDB Predicates for In.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value[] = {"zhangSan", "liSi"};
    int len = sizeof(data1Value) / sizeof(data1Value[0]);
    valueObject->putTexts(valueObject, data1Value, len);
    predicates->in(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_1300
 * @tc.desc: napi test RDB Predicates for NotIn
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value[] = {"zhangSan", "liSi"};
    int len = sizeof(data1Value) / sizeof(data1Value[0]);
    valueObject->putTexts(valueObject, data1Value, len);
    predicates->notIn(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_1400
 * @tc.desc: napi test RDB Predicates for Like
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCD%";
    valueObject->putText(valueObject, data5Value);
    predicates->like(predicates, "data5", valueObject);
    const char *data2Value = "%800";
    valueObject->putText(valueObject, data2Value);
    predicates->like(predicates, "data2", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 4, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_1500
 * @tc.desc: napi test RDB Predicates for GroupBy
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"data1", "data2"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    predicates->groupBy(predicates, columnNames, len);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 4, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_1600
 * @tc.desc: napi test RDB Predicates for And
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    predicates->andOperate(predicates);
    double data3Value = 100.1;
    valueObject->putDouble(valueObject, &data3Value, 1);
    predicates->equalTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_1700
 * @tc.desc: napi test RDB Predicates for Clear
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");
    errCode = cursor->destroy(cursor);

    predicates->clear(predicates);
    predicates->notEqualTo(predicates, "data1", valueObject);
    cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_1800
 * @tc.desc: napi test RDB Predicates for table name is NULL.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1800(napi_env env, napi_callback_info info) {
    char *table = NULL;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates(table);
    NAPI_ASSERT(env, predicates == NULL, "OH_Rdb_CreatePredicates is fail.");

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor == NULL, "OH_Rdb_Query is fail.");
    
    int errCode = 0;
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_1900
 * @tc.desc: napi test RDB Predicates for equalTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_1900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_2000
 * @tc.desc: napi test RDB Predicates for equalTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 300.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->equalTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}



/**
 * @tc.name: SUB_DDM_RDB_Predicates_2100
 * @tc.desc: napi test RDB Predicates for equalTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 300.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->equalTo(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_2200
 * @tc.desc: napi test RDB Predicates for equalTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 1.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->equalTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_2300
 * @tc.desc: napi test RDB Predicates for notEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 300.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->notEqualTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_2400
 * @tc.desc: napi test RDB Predicates for notEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "wangWu";
    valueObject->putText(valueObject, data1Value);
    predicates->notEqualTo(predicates, "data1", valueObject);
    predicates->andOperate(predicates);
    OH_VObject *valueObject1 = OH_Rdb_CreateValueObject();
    const char *data1Value1 = "zhangliu";
    valueObject1->putText(valueObject1, data1Value1);
    predicates->notEqualTo(predicates, "data1", valueObject1);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    valueObject1->destroy(valueObject1);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_2500
 * @tc.desc: napi test RDB Predicates for notEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "name";
    valueObject->putText(valueObject, data1Value);
    predicates->notEqualTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 4, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_2600
 * @tc.desc: napi test RDB Predicates for notEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 300.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->notEqualTo(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");

    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_2700
 * @tc.desc: napi test RDB Predicates for beginWrap and endWrap
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->beginWrap(predicates);
    predicates->equalTo(predicates, "data1", valueObject);
    predicates->endWrap(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_2800
 * @tc.desc: napi test RDB Predicates for beginWrap and endWrap
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    predicates->endWrap(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_2900
 * @tc.desc: napi test RDB Predicates for beginWrap and endWrap
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_2900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->beginWrap(predicates);
    predicates->equalTo(predicates, "data1", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_3000
 * @tc.desc: napi test RDB Predicates for EqualTo、AndOR、beginWrap and endWrap
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->beginWrap(predicates);
    predicates->equalTo(predicates, "data1", valueObject);
    predicates->andOperate(predicates);
    double data3Value = 200.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->equalTo(predicates, "data3", valueObject);
    predicates->endWrap(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_3100
 * @tc.desc: napi test RDB Predicates for 
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    predicates->andOperate(predicates);
    predicates->orOperate(predicates);
    double data3Value = 200.1;
    valueObject->putDouble(valueObject, &data3Value, 1);
    predicates->equalTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_3200
 * @tc.desc: napi test RDB Predicates for And
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    predicates->orOperate(predicates);
    predicates->orOperate(predicates);
    double data3Value = 200.1;
    valueObject->putDouble(valueObject, &data3Value, 1);
    predicates->equalTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    predicates->destroy(predicates);
    valueObject->destroy(valueObject);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_3300
 * @tc.desc: napi test RDB Predicates for IsNull
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->isNull(predicates, "data");

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_3400
 * @tc.desc: napi test RDB Predicates for isNotNull
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->isNotNull(predicates, "data");

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_3500
 * @tc.desc: napi test RDB Predicates for Like
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "%BCD%";
    valueObject->putText(valueObject, data5Value);
    predicates->like(predicates, "data5", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 4, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_3600
 * @tc.desc: napi test RDB Predicates for Like
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "%BCDx%";
    valueObject->putText(valueObject, data5Value);
    predicates->like(predicates, "data5", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_3700
 * @tc.desc: napi test RDB Predicates for Like
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCD%";
    valueObject->putText(valueObject, data5Value);
    predicates->like(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_3800
 * @tc.desc: napi test RDB Predicates for Between
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data2Value[] = {12000, 12000};
    uint32_t len = sizeof(data2Value) / sizeof(data2Value[0]);
    valueObject->putInt64(valueObject, data2Value, len);
    predicates->between(predicates, "data2", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_3900
 * @tc.desc: napi test RDB Predicates for Between
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_3900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data2Value[] = {13000, 12000};
    uint32_t len = sizeof(data2Value) / sizeof(data2Value[0]);
    valueObject->putInt64(valueObject, data2Value, len);
    predicates->between(predicates, "data2", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_4000
 * @tc.desc: napi test RDB Predicates for Between
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data2Value[] = {12000, 13000};
    uint32_t len = sizeof(data2Value) / sizeof(data2Value[0]);
    valueObject->putInt64(valueObject, data2Value, len);
    predicates->between(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_4100
 * @tc.desc: napi test RDB Predicates for NotBetween
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data2Value[] = {12000, 13000};
    int len = sizeof(data2Value) / sizeof(data2Value[0]);
    valueObject->putInt64(valueObject, data2Value, len);
    predicates->notBetween(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_4200
 * @tc.desc: napi test RDB Predicates for GreaterThan
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 200.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->greaterThan(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_4300
 * @tc.desc: napi test RDB Predicates for GreaterThan
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 400.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->greaterThan(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_4400
 * @tc.desc: napi test RDB Predicates for GreaterThan
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCDEFG";
    valueObject->putText(valueObject, data5Value);
    predicates->greaterThan(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_4500
 * @tc.desc: napi test RDB Predicates for LessThan
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCDEFG";
    valueObject->putText(valueObject, data5Value);
    predicates->lessThan(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_4600
 * @tc.desc: napi test RDB Predicates for LessThan
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 300.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->lessThan(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_4700
 * @tc.desc: napi test RDB Predicates for LessThan
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 10.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->lessThan(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_4800
 * @tc.desc: napi test RDB Predicates for GreaterThanOrEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCDEFG";
    valueObject->putText(valueObject, data5Value);
    predicates->greaterThanOrEqualTo(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
     napi_create_double(env, errCode, &returnCode);
     return returnCode;
 }

/**
 * @tc.name: SUB_DDM_RDB_Predicates_4900
 * @tc.desc: napi test RDB Predicates for GreaterThanOrEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_4900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 300.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->greaterThanOrEqualTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_5000
 * @tc.desc: napi test RDB Predicates for GreaterThanOrEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_5000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 400.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->greaterThanOrEqualTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_5100
 * @tc.desc: napi test RDB Predicates for LessThanOrEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_5100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data5Value = "ABCDEFG";
    valueObject->putText(valueObject, data5Value);
    predicates->lessThanOrEqualTo(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_5200
 * @tc.desc: napi test RDB Predicates for LessThanOrEqualTo
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_5200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 1.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->lessThanOrEqualTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_5300
 * @tc.desc: napi test RDB Predicates for 
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_5300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    uint32_t count = 1;
    double data3Value = 200.1;
    valueObject->putDouble(valueObject, &data3Value, count);
    predicates->lessThanOrEqualTo(predicates, "data3", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_5400
 * @tc.desc: napi test RDB Predicates for GroupBy
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_5400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"data", "data2"};
    int len = sizeof(columnNames) / sizeof(columnNames[0]);
    predicates->groupBy(predicates, columnNames, len);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_5500
 * @tc.desc: napi test RDB Predicates for GroupBy
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_5500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"data1", "data2"};
    predicates->groupBy(predicates, columnNames, 0);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 4, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_5600
 * @tc.desc: napi test RDB Predicates for GroupBy
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_5600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"data1", "data2"};
    predicates->groupBy(predicates, columnNames, 2);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 4, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_5800
 * @tc.desc: napi test RDB Predicates for GroupBy
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_5800(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    const char *columnNames[] = {"data2", "data3"};
    predicates->groupBy(predicates, columnNames, 1);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 3, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_5900
 * @tc.desc: napi test RDB Predicates for In.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_5900(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value[] = {"zhangSan", "liSi"};
    int len = sizeof(data1Value) / sizeof(data1Value[0]);
    valueObject->putTexts(valueObject, data1Value, len);
    predicates->in(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_6000
 * @tc.desc: napi test RDB Predicates for In.
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_6000(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data2Value[] = {12800, 13000};
    uint32_t len = sizeof(data2Value) / sizeof(data2Value[0]);
    valueObject->putInt64(valueObject, data2Value, len);
    predicates->in(predicates, "data2", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_6100
 * @tc.desc: napi test RDB Predicates for NotIn
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_6100(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value[] = {"zhangSan", "liSi"};
    int len = sizeof(data1Value) / sizeof(data1Value[0]);
    valueObject->putTexts(valueObject, data1Value, len);
    predicates->notIn(predicates, "data", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_6200
 * @tc.desc: napi test RDB Predicates for NotIn
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_6200(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    int64_t data2Value[] = {12800, 13800};
    uint32_t len = sizeof(data2Value) / sizeof(data2Value[0]);
    valueObject->putInt64(valueObject, data2Value, len);
    predicates->notIn(predicates, "data2", valueObject);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 2, "getRowCount is fail.");

    valueObject->destroy(valueObject);
    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_6300
 * @tc.desc: napi test RDB Predicates for OrderBy
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_6300(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->orderBy(predicates, "data2", OH_OrderType::DESC);
    predicates->limit(predicates, 1);
    predicates->offset(predicates, 0);
    predicates->distinct(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = 0;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    errCode = cursor->goToNextRow(cursor);
    int columnIndex;
    cursor->getColumnIndex(cursor, "data2", &columnIndex);
    NAPI_ASSERT(env, columnIndex == 2, "getColumnIndex is fail.");

    int64_t longValue;
    cursor->getInt64(cursor, columnIndex, &longValue);
    NAPI_ASSERT(env, longValue == 14800, "getInt64 is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_6400
 * @tc.desc: napi test RDB Predicates for OrderBy
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_6400(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->orderBy(predicates, "data", OH_OrderType::ASC);
    predicates->limit(predicates, 1);
    predicates->offset(predicates, 0);
    predicates->distinct(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == -1, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}
/**
 * @tc.name: SUB_DDM_RDB_Predicates_6500
 * @tc.desc: napi test RDB Predicates for Limit
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_6500(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->orderBy(predicates, "data2", OH_OrderType::ASC);
    predicates->limit(predicates, 0);
    predicates->offset(predicates, 0);
    predicates->distinct(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 4, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_6600
 * @tc.desc: napi test RDB Predicates for Offset
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_6600(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->orderBy(predicates, "data2", OH_OrderType::ASC);
    predicates->limit(predicates, 1);
    predicates->offset(predicates, 5);
    predicates->distinct(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

/**
 * @tc.name: SUB_DDM_RDB_Predicates_6700
 * @tc.desc: napi test RDB Predicates for Offset
 * @tc.type: FUNC
 */
static napi_value SUB_DDM_RDB_Predicates_6700(napi_env env, napi_callback_info info) {
    int errCode = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test");
    predicates->orderBy(predicates, "data2", OH_OrderType::ASC);
    predicates->limit(predicates, 1);
    predicates->offset(predicates, -1);
    predicates->distinct(predicates);

    OH_Cursor *cursor = OH_Rdb_Query(predicatesTestRdbStore_, predicates, NULL, 0);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_Query is fail.");
    int rowCount = -1;
    errCode = cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount is fail.");

    predicates->destroy(predicates);
    errCode = cursor->destroy(cursor);
    
    napi_value returnCode;
    napi_create_double(env, errCode, &returnCode);
    return returnCode;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"RdbFilePath", nullptr, RdbFilePath, nullptr, nullptr, nullptr, napi_default, nullptr}, 
        {"PredicatesSetUpTestCase", nullptr, PredicatesSetUpTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PredicatesTearDownTestCase", nullptr, PredicatesTearDownTestCase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_0100", nullptr, SUB_DDM_RDB_Predicates_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_0200", nullptr, SUB_DDM_RDB_Predicates_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_0300", nullptr, SUB_DDM_RDB_Predicates_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_0400", nullptr, SUB_DDM_RDB_Predicates_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_0500", nullptr, SUB_DDM_RDB_Predicates_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_0600", nullptr, SUB_DDM_RDB_Predicates_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_0700", nullptr, SUB_DDM_RDB_Predicates_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_0800", nullptr, SUB_DDM_RDB_Predicates_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_0900", nullptr, SUB_DDM_RDB_Predicates_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_1000", nullptr, SUB_DDM_RDB_Predicates_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_1100", nullptr, SUB_DDM_RDB_Predicates_1100, nullptr, nullptr, nullptr, napi_default, nullptr},    
        {"SUB_DDM_RDB_Predicates_1200", nullptr, SUB_DDM_RDB_Predicates_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_1300", nullptr, SUB_DDM_RDB_Predicates_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_1400", nullptr, SUB_DDM_RDB_Predicates_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_1500", nullptr, SUB_DDM_RDB_Predicates_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_1600", nullptr, SUB_DDM_RDB_Predicates_1600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_1700", nullptr, SUB_DDM_RDB_Predicates_1700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_1800", nullptr, SUB_DDM_RDB_Predicates_1800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_1900", nullptr, SUB_DDM_RDB_Predicates_1900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_2000", nullptr, SUB_DDM_RDB_Predicates_2000, nullptr, nullptr, nullptr, napi_default, nullptr},   
        {"SUB_DDM_RDB_Predicates_2100", nullptr, SUB_DDM_RDB_Predicates_2100, nullptr, nullptr, nullptr, napi_default, nullptr},    
        {"SUB_DDM_RDB_Predicates_2200", nullptr, SUB_DDM_RDB_Predicates_2200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_2300", nullptr, SUB_DDM_RDB_Predicates_2300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_2400", nullptr, SUB_DDM_RDB_Predicates_2400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_2500", nullptr, SUB_DDM_RDB_Predicates_2500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_2600", nullptr, SUB_DDM_RDB_Predicates_2600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_2700", nullptr, SUB_DDM_RDB_Predicates_2700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_2800", nullptr, SUB_DDM_RDB_Predicates_2800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_2900", nullptr, SUB_DDM_RDB_Predicates_2900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_3000", nullptr, SUB_DDM_RDB_Predicates_3000, nullptr, nullptr, nullptr, napi_default, nullptr},
		{"SUB_DDM_RDB_Predicates_3100", nullptr, SUB_DDM_RDB_Predicates_3100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_3200", nullptr, SUB_DDM_RDB_Predicates_3200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_3300", nullptr, SUB_DDM_RDB_Predicates_3300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_3400", nullptr, SUB_DDM_RDB_Predicates_3400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_3500", nullptr, SUB_DDM_RDB_Predicates_3500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_3600", nullptr, SUB_DDM_RDB_Predicates_3600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_3700", nullptr, SUB_DDM_RDB_Predicates_3700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_3800", nullptr, SUB_DDM_RDB_Predicates_3800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_3900", nullptr, SUB_DDM_RDB_Predicates_3900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_4000", nullptr, SUB_DDM_RDB_Predicates_4000, nullptr, nullptr, nullptr, napi_default, nullptr},
		{"SUB_DDM_RDB_Predicates_4100", nullptr, SUB_DDM_RDB_Predicates_4100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_4200", nullptr, SUB_DDM_RDB_Predicates_4200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_4300", nullptr, SUB_DDM_RDB_Predicates_4300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_4400", nullptr, SUB_DDM_RDB_Predicates_4400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_4500", nullptr, SUB_DDM_RDB_Predicates_4500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_4600", nullptr, SUB_DDM_RDB_Predicates_4600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_4700", nullptr, SUB_DDM_RDB_Predicates_4700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_4800", nullptr, SUB_DDM_RDB_Predicates_4800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_4900", nullptr, SUB_DDM_RDB_Predicates_4900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_5000", nullptr, SUB_DDM_RDB_Predicates_5000, nullptr, nullptr, nullptr, napi_default, nullptr},
		{"SUB_DDM_RDB_Predicates_5100", nullptr, SUB_DDM_RDB_Predicates_5100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_5200", nullptr, SUB_DDM_RDB_Predicates_5200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_5300", nullptr, SUB_DDM_RDB_Predicates_5300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_5400", nullptr, SUB_DDM_RDB_Predicates_5400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_5500", nullptr, SUB_DDM_RDB_Predicates_5500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_5600", nullptr, SUB_DDM_RDB_Predicates_5600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_5800", nullptr, SUB_DDM_RDB_Predicates_5800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_5900", nullptr, SUB_DDM_RDB_Predicates_5900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_6000", nullptr, SUB_DDM_RDB_Predicates_6000, nullptr, nullptr, nullptr, napi_default, nullptr},
		{"SUB_DDM_RDB_Predicates_6100", nullptr, SUB_DDM_RDB_Predicates_6100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_6200", nullptr, SUB_DDM_RDB_Predicates_6200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_6300", nullptr, SUB_DDM_RDB_Predicates_6300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_6400", nullptr, SUB_DDM_RDB_Predicates_6400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_6500", nullptr, SUB_DDM_RDB_Predicates_6500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_6600", nullptr, SUB_DDM_RDB_Predicates_6600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SUB_DDM_RDB_Predicates_6700", nullptr, SUB_DDM_RDB_Predicates_6700, nullptr, nullptr, nullptr, napi_default, nullptr}

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
    .nm_modname = "predicates",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) {
    napi_module_register(&demoModule);
}
