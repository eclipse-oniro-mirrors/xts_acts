/*
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include <ios>
#include <string>
#include "hilog/log.h"
#include <unistd.h>
#include <fstream>
#include <string>
#include <ctime>
#include <cstdint>
#include "common.h"
#include <sys/stat.h>
#include <string>
#include <thread>
#include "database/rdb/relational_store.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/oh_rdb_types.h"
#include "napi_async_call.h"
 
 
using namespace NdkTest;

const char *TAG = "testLog";
#define DIRMODE 0770
const char *RDB_TEST_PATH = "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/";
const char CREATE_TABLE_SQL[] =
    "CREATE TABLE store_test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
    "data3 FLOAT, data4 BLOB, data5 TEXT);";
const std::string RDB_TEST_PATH1 =
        "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/rdb/rdb_store_test.db";
const std::string BACKUP_PATH1 = "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/rdb/back_test.db";

static OH_Rdb_ConfigV2 *InitRdbConfig()
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "ohos.acts.relationalstorendktesthvigor");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    return config;
}

static void TestCorruptedHandler(void *context, OH_Rdb_ConfigV2 *config, OH_Rdb_Store *store);
static void TestCorruptedHandler1(void *context, OH_Rdb_ConfigV2 *config, OH_Rdb_Store *store);
static void DestroyDbFile(const std::string &filePath, size_t offset, size_t len, unsigned char ch);
static void DestroyDb(const std::string &filePath);
static void InsertData(int count, OH_Rdb_Store *store);
static void TransInsertData(int count, OH_Rdb_Transaction *trans, const char *table);


void TestCorruptedHandler(void *context, OH_Rdb_ConfigV2 *config, OH_Rdb_Store *store)
{
    std::string restorePath1 = "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/rdb/back_test.db";
    if (store == nullptr) {
        int ret = OH_Rdb_DeleteStoreV2(config);
    } else {
        int errCode = OH_Rdb_Restore(store, restorePath1.c_str());
    }
}

void TestCorruptedHandler1(void *context, OH_Rdb_ConfigV2 *config, OH_Rdb_Store *store)
{
    std::string restorePath1 = "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/rdb/back_test.db";
    if (store == nullptr) {
        return;
    } else {
        return;
    }
}

void DestroyDbFile(const std::string &filePath, size_t offset, size_t len, unsigned char ch)
{
    std::fstream f;
    f.open(filePath.c_str());
    f.seekp(offset, std::ios::beg);
    std::vector<char> buf(len, ch);
    f.write(buf.data(), len);
    f.close();
}

void DestroyDb(const std::string &filePath)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "************************* filePath= %{public}s", filePath.c_str());
    const char *message = "hello";
    const size_t messageLength = 5;
    const size_t seekPosition = 64;
    std::ofstream fsDb(filePath, std::ios_base::binary | std::ios_base::out);
    fsDb.seekp(seekPosition);
    fsDb.write(message, messageLength);
    fsDb.close();
}

void InsertData(int count, OH_Rdb_Store *store)
{
    const int data2Value = 12800;
    const double data3Value = 100.1;
    for (int64_t i = 0; i < count; i++) {
        OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
        valueBucket->putInt64(valueBucket, "id", i + 1);
        valueBucket->putText(valueBucket, "data1", "zhangSan");
        valueBucket->putInt64(valueBucket, "data2", data2Value + i);
        valueBucket->putReal(valueBucket, "data3", data3Value);
        uint8_t arr[] = { 1, 2, 3, 4, 5 };
        int len = sizeof(arr) / sizeof(arr[0]);
        valueBucket->putBlob(valueBucket, "data4", arr, len);
        valueBucket->putText(valueBucket, "data5", "ABCDEFG");
        int errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
        valueBucket->destroy(valueBucket);
    }
}

void TransInsertData(int count, OH_Rdb_Transaction *trans, const char *table)
{
    const int data2Value = 12800;
    const double data3Value = 100.1;
    for (int64_t i = 0; i < count; i++) {
        OH_VBucket *valueBucket2 = OH_Rdb_CreateValuesBucket();
        valueBucket2->putText(valueBucket2, "data1", "zhangSan");
        valueBucket2->putInt64(valueBucket2, "data2", data2Value + i);
        valueBucket2->putReal(valueBucket2, "data3", data3Value);
        uint8_t arr[] = { 1, 2, 3, 4, 5 };
        int len = sizeof(arr) / sizeof(arr[0]);
        valueBucket2->putBlob(valueBucket2, "data4", arr, len);
        valueBucket2->putText(valueBucket2, "data5", "ABCDEFG");
        int64_t rowId = -1;
        int ret = OH_RdbTrans_Insert(trans, table, valueBucket2, &rowId);
        valueBucket2->destroy(valueBucket2);
    }
}

static napi_value async(napi_env env, napi_callback_info info)
{
    auto context = std::make_shared<ContextBase>();
    auto exec = [context]() -> int {
        return 10;
    };
    auto output = [context](napi_env env, napi_value &result) {
        napi_create_int32(env, context->execCode_, &result);
    };
    context->SetAction(env, info, exec, output);
    return AsyncCall::Async(env, context);
}

static napi_value RdbStoreCorruptHandlerTest_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0100 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------------------DestroyDb111");
    DestroyDb(RDB_TEST_PATH1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------------------DestroyDb2222");
    std::fstream f;
    int errCode2 = OH_Rdb_ErrCode::RDB_OK;
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 == NULL, "OH_Rdb_CreateOrOpen is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 != NULL, "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store2, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0100 end------------- ");
    napi_value result;
    napi_create_int32(env, errCode2, &result);
    return result;
}
static napi_value RdbStoreCorruptHandlerTest_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0200 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    OH_Rdb_SetDbType(config1, RDB_CAYLEY);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_ExecuteByTrxId(store1, 0, createTableSql), "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode2 = OH_Rdb_ErrCode::RDB_OK;
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 == NULL, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 != NULL, "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_ExecuteByTrxId(store2, 0, createTableSql), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0200 end------------- ");
    napi_value result;
    napi_create_int32(env, errCode2, &result);
    return result;
}

static napi_value RdbStoreCorruptHandlerTest_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0300 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int countBase = 1000;
    InsertData(countBase, store1);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    OH_VBucket *valueBucket1 = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, valueBucket1 != nullptr, "OH_Rdb_CreateOrOpen store1 is fail.");
    const int data1Value = 1001;
    const int data2Value = 128001;
    const double data3Value = 1001.1;
    valueBucket1->putInt64(valueBucket1, "id", data1Value);
    valueBucket1->putText(valueBucket1, "data1", "zhangSan1");
    valueBucket1->putInt64(valueBucket1, "data2", data2Value);
    valueBucket1->putReal(valueBucket1, "data3", data3Value);
    uint8_t arr1[] = { 1, 2, 3, 4, 5 };
    int len1 = sizeof(arr1) / sizeof(arr1[0]);
    valueBucket1->putBlob(valueBucket1, "data4", arr1, len1);
    valueBucket1->putText(valueBucket1, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(store2, "store_test", valueBucket1);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    errCode = OH_Rdb_Insert(store2, "store_test", valueBucket1);
    const int  codeBase = 1001;
    NAPI_ASSERT(env, errCode == codeBase, "OH_Rdb_CreateOrOpen store2 is fail.");
    valueBucket1->destroy(valueBucket1);
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0300 end------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0400 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int countBase = 1000;
    InsertData(countBase, store1);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    OH_VBucket *valueBucket1 = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, valueBucket1 != nullptr, "OH_Rdb_CreateOrOpen store1 is fail.");
    const int data2Value = 13800;
    const double data3Value = 200.1;
    valueBucket1->putText(valueBucket1, "data1", "liSi");
    valueBucket1->putInt64(valueBucket1, "data2", data2Value);
    valueBucket1->putReal(valueBucket1, "data3", data3Value);
    valueBucket1->putNull(valueBucket1, "data5");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Update(store2, valueBucket1, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    errCode = OH_Rdb_Update(store2, valueBucket1, predicates);
    NAPI_ASSERT(env, errCode == 1000, "OH_Rdb_CreateOrOpen store2 is fail.");
    valueBucket1->destroy(valueBucket1);
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0400 end------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0500 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int countBase = 1000;
    InsertData(countBase, store1);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *data1Value = "zhangSan";
    valueObject->putText(valueObject, data1Value);
    predicates->equalTo(predicates, "data1", valueObject);
    errCode = OH_Rdb_Delete(store2, predicates);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    errCode = OH_Rdb_Delete(store2, predicates);
    NAPI_ASSERT(env, errCode == 1000, "OH_Rdb_CreateOrOpen store2 is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0500 end------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0600 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int countBase = 1000;
    InsertData(countBase, store1);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    char querySql[] = "SELECT * FROM store_test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store2, querySql);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_E_ERROR == cursor->goToNextRow(cursor), "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    cursor = OH_Rdb_ExecuteQuery(store2, querySql);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == cursor->goToNextRow(cursor), "OH_Rdb_CreateOrOpen store2 is fail.");
    cursor->destroy(cursor);
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0600 end------------- ");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value RdbStoreCorruptHandlerTest_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0700 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int countBase = 1000;
    InsertData(countBase, store1);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    OH_Data_VBuckets *rows = OH_VBuckets_Create();
    NAPI_ASSERT(env, rows != nullptr, "OH_Rdb_CreateOrOpen store1 is fail.");
    OH_VBucket *vbs[5];
    for (auto i = 0; i < 5; i++) {
        OH_VBucket *row = OH_Rdb_CreateValuesBucket();
        NAPI_ASSERT(env, row != nullptr, "OH_Rdb_CreateOrOpen store1 is fail.");
        const int dataBase = 1000;
        row->putInt64(row, "id", dataBase + i);
        row->putText(row, "data1", "test_name");
        vbs[i] = row;
        NAPI_ASSERT(env, OH_VBuckets_PutRow(rows, row) == RDB_OK, "OH_Rdb_CreateOrOpen store2 is fail.");
    }
    int64_t changes = -1;
    int ret = OH_Rdb_BatchInsert(store2, "store_test", rows, RDB_CONFLICT_REPLACE, &changes);
    NAPI_ASSERT(env, ret == RDB_E_SQLITE_CORRUPT, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, changes == -1, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    ret = OH_Rdb_BatchInsert(store2, "store_test", rows, RDB_CONFLICT_REPLACE, &changes);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, changes == 5, "OH_Rdb_CreateOrOpen store2 is fail.");
    OH_VBuckets_Destroy(rows);
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0700 end------------- ");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value RdbStoreCorruptHandlerTest_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0800 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int countBase = 1000;
    InsertData(countBase, store1);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    char deleteSql[] = "DELETE FROM store_test WHERE data1 = 'zhangsan';";
    errCode = OH_Rdb_Execute(store2, deleteSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_ERROR, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    errCode = OH_Rdb_Execute(store2, deleteSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen store2 is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0800 end------------- ");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value RdbStoreCorruptHandlerTest_0900(napi_env env, napi_callback_info info)
{
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "store_test";
    OH_RDB_TransOptions *g_options = OH_RdbTrans_CreateOptions();
    NAPI_ASSERT(env, g_options != nullptr, "OH_Rdb_CreateOrOpen store1 is fail.");
    int ret = OH_RdbTransOption_SetType(g_options, RDB_TRANS_DEFERRED);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateOrOpen store2 is fail.");
    ret = OH_Rdb_CreateTransaction(store1, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateOrOpen store2 is fail.");
    const int transCount = 1000;
    TransInsertData(transCount, trans, table);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    ret = OH_Rdb_CreateTransaction(store2, g_options, &trans);
    OH_VBucket *valueBucket1 = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, valueBucket1 != nullptr, "OH_Rdb_CreateOrOpen store2 is fail.");
    const int data2Value = 14800;
    const double data3Value = 300.1;
    valueBucket1->putText(valueBucket1, "data1", "test_name4");
    valueBucket1->putInt64(valueBucket1, "data2", data2Value);
    valueBucket1->putReal(valueBucket1, "data3", data3Value);
    valueBucket1->putText(valueBucket1, "data5", "ABCDEFGHI");
    int64_t rowId = -1;
    ret = OH_RdbTrans_Insert(trans, table, valueBucket1, &rowId);
    NAPI_ASSERT(env, ret == RDB_E_SQLITE_CORRUPT, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, rowId == -1, "OH_Rdb_CreateOrOpen store1 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    ret = OH_Rdb_CreateTransaction(store2, g_options, &trans);
    ret = OH_RdbTrans_Insert(trans, table, valueBucket1, &rowId);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, rowId == 1, "OH_Rdb_CreateOrOpen store1 is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_0900 end------------- ");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
    }

static napi_value RdbStoreCorruptHandlerTest_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1000 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store2 is fail.");
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode2 = OH_Rdb_ErrCode::RDB_OK;
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 == NULL, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 != NULL, "OH_Rdb_CreateOrOpen is fail.");
	NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store2, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1000 end ------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}

static napi_value RdbStoreCorruptHandlerTest_1100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1100 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int countBase = 1000;
    InsertData(countBase, store1);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
 
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    OH_VBucket *valueBucket1 = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, valueBucket1 != nullptr, "OH_Rdb_CreateOrOpen store1 is fail.");
    const int data1Value = 1001;
    const int data2Value = 128001;
    const double data3Value = 1001.1;
    valueBucket1->putInt64(valueBucket1, "id", data1Value);
    valueBucket1->putText(valueBucket1, "data1", "zhangSan1");
    valueBucket1->putInt64(valueBucket1, "data2", data2Value);
    valueBucket1->putReal(valueBucket1, "data3", data3Value);
    uint8_t arr1[] = { 1, 2, 3, 4, 5 };
    int len1 = sizeof(arr1) / sizeof(arr1[0]);
    valueBucket1->putBlob(valueBucket1, "data4", arr1, len1);
    valueBucket1->putText(valueBucket1, "data5", "ABCDEFG");
    errCode = OH_Rdb_Insert(store2, "store_test", valueBucket1);
    NAPI_ASSERT(env, errCode == -1, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    const int  codeBase = 1001;
    errCode = OH_Rdb_Insert(store2, "store_test", valueBucket1);
    NAPI_ASSERT(env, errCode == codeBase, "OH_Rdb_CreateOrOpen store2 is fail.");
    valueBucket1->destroy(valueBucket1);
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1100 end ------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_1200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1200 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
 
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int countBase = 1000;
    InsertData(countBase, store1);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    char querySql[] = "SELECT * FROM store_test";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store2, querySql);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_E_ERROR == cursor->goToNextRow(cursor), "OH_Rdb_ExecuteQuery store1 is fail1.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    cursor = OH_Rdb_ExecuteQuery(store2, querySql);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == cursor->goToNextRow(cursor), "OH_Rdb_ExecuteQuery store1 is fail2.");
    cursor->destroy(cursor);
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1200 end ------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_1300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1300 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    OH_Rdb_Transaction *trans = nullptr;
    const char *table = "store_test";
    OH_RDB_TransOptions *g_options = OH_RdbTrans_CreateOptions();
    NAPI_ASSERT(env, g_options != nullptr, "OH_Rdb_CreateTransaction store1 is fail.");
    int ret = OH_RdbTransOption_SetType(g_options, RDB_TRANS_DEFERRED);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateOrOpen store2 is fail.");
    ret = OH_Rdb_CreateTransaction(store1, g_options, &trans);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, trans != nullptr, "OH_Rdb_CreateTransaction store1 is fail.");
    const int transCount = 1000;
    TransInsertData(transCount, trans, table);
    errCode = OH_Rdb_Backup(store1, BACKUP_PATH1.c_str());
    NAPI_ASSERT(env, errCode == 0, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen is fail.");
    const int fileSize = 8192;
    DestroyDbFile(RDB_TEST_PATH1, fileSize, 1, 0xFF);
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode);
    ret = OH_Rdb_CreateTransaction(store2, g_options, &trans);
    OH_VBucket *valueBucket1 = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, valueBucket1 != nullptr, "OH_Rdb_CreateTransaction store1 is fail.");
    const int data2Value = 14800;
    const double data3Value = 300.1;
    valueBucket1->putText(valueBucket1, "data1", "test_name4");
    valueBucket1->putInt64(valueBucket1, "data2", data2Value);
    valueBucket1->putReal(valueBucket1, "data3", data3Value);
    valueBucket1->putText(valueBucket1, "data5", "ABCDEFGHI");
    int64_t rowId = -1;
    ret = OH_RdbTrans_Insert(trans, table, valueBucket1, &rowId);
    NAPI_ASSERT(env, ret == RDB_E_SQLITE_CORRUPT, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, rowId == -1, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    ret = OH_Rdb_CreateTransaction(store2, g_options, &trans);
    ret = OH_RdbTrans_Insert(trans, table, valueBucket1, &rowId);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, rowId == 1, "OH_Rdb_CreateOrOpen store2 is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1300 end------------- ");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value RdbStoreCorruptHandlerTest_1400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1400 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode2 = OH_Rdb_ErrCode::RDB_OK;
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 == NULL, "OH_Rdb_CreateOrOpen store2 is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 != NULL, "OH_Rdb_CreateOrOpen store2 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store2, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store2 is fail.");
    Rdb_CorruptedHandler handler1 = TestCorruptedHandler1;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler1);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode3 = OH_Rdb_ErrCode::RDB_OK;
    auto store3 = OH_Rdb_CreateOrOpen(config1, &errCode3);
    NAPI_ASSERT(env, store3 == NULL, "OH_Rdb_CreateOrOpen is fail.");
    errCode3 = OH_Rdb_ErrCode::RDB_OK;
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store3 = OH_Rdb_CreateOrOpen(config1, &errCode3);
    NAPI_ASSERT(env, store3 != NULL, "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1400 end------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_1500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1500 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode2 = OH_Rdb_ErrCode::RDB_OK;
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 == NULL, "OH_Rdb_CreateOrOpen is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 != NULL, "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store2, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode3 = OH_Rdb_ErrCode::RDB_OK;
    auto store3 = OH_Rdb_CreateOrOpen(config1, &errCode3);
    NAPI_ASSERT(env, store3 == NULL, "OH_Rdb_CreateOrOpen is fail.");
    errCode3 = OH_Rdb_ErrCode::RDB_OK;
    store3 = OH_Rdb_CreateOrOpen(config1, &errCode3);
    NAPI_ASSERT(env, store3 == NULL, "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1500 end------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1600 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode2 = OH_Rdb_ErrCode::RDB_OK;
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 == NULL, "OH_Rdb_CreateOrOpen is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 != NULL, "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store2, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1600 end------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_1700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1700 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store1, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CloseStore store1 is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode2 = OH_Rdb_ErrCode::RDB_OK;
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 == NULL, "OH_Rdb_CreateOrOpen is fail.");
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 != NULL, "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store2, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1700 end------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_1800(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1800 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = nullptr;
    void *context = nullptr;
    Rdb_CorruptedHandler handler = nullptr;
    Rdb_CorruptedHandler handler1 = TestCorruptedHandler;
    errCode = OH_Rdb_RegisterCorruptedHandler(config, context, handler1);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_RegisterCorruptedHandler is fail1.");
    auto config1 = InitRdbConfig();
    errCode = OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_RegisterCorruptedHandler is fail2.");
    OH_Rdb_UnregisterCorruptedHandler(config, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_RegisterCorruptedHandler is fail4.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_RegisterCorruptedHandler is fail5.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1800 end------------- ");
    int result = 0;
    napi_value ret;
    napi_create_int32(env, result, &ret);
    return ret;
}
static napi_value RdbStoreCorruptHandlerTest_1900(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1900 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    Rdb_CorruptedHandler handler1 = TestCorruptedHandler1;
    auto config1 = InitRdbConfig();
    errCode = OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_RegisterCorruptedHandler(config1, context, handler1);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_UnregisterCorruptedHandler(config1, context, nullptr);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_UnregisterCorruptedHandler(config1, nullptr, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_UnregisterCorruptedHandler(config1, context, nullptr);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_UnregisterCorruptedHandler(config1, nullptr, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_UnregisterCorruptedHandler(config1, context, handler1);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_1900 end------------- ");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value RdbStoreCorruptHandlerTest_2000(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_2000 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_SetTokenizer(config1, Rdb_Tokenizer::RDB_ICU_TOKENIZER), "OH_Rdb_CreateOrOpen is fail.");
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode2 = OH_Rdb_ErrCode::RDB_OK;
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 != NULL, "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store2, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_2000 end ------------- ");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value RdbStoreCorruptHandlerTest_2100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_2100 start ------------- ");
    mkdir(RDB_TEST_PATH, DIRMODE);
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    auto config1 = InitRdbConfig();
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_SetTokenizer(config1, Rdb_Tokenizer::RDB_CUSTOM_TOKENIZER), "OH_Rdb_CreateOrOpen is fail.");
    void *context = nullptr;
    Rdb_CorruptedHandler handler = TestCorruptedHandler;
    OH_Rdb_RegisterCorruptedHandler(config1, context, handler);
    auto store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
    NAPI_ASSERT(env, store1 != NULL, "OH_Rdb_CreateOrOpen store1 is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store1), "OH_Rdb_CreateOrOpen store1 is fail.");
    DestroyDb(RDB_TEST_PATH1);
    int errCode2 = OH_Rdb_ErrCode::RDB_OK;
    auto store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    std::this_thread::sleep_for(std::chrono::seconds(2));
    store2 = OH_Rdb_CreateOrOpen(config1, &errCode2);
    NAPI_ASSERT(env, store2 != NULL, "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_Execute(store2, CREATE_TABLE_SQL), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_UnregisterCorruptedHandler(config1, context, handler);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_CloseStore(store2), "OH_Rdb_CreateOrOpen is fail.");
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_DeleteStoreV2(config1), "OH_Rdb_CreateOrOpen is fail.");
    OH_Rdb_DestroyConfig(config1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "------------- func RdbStoreCorruptHandlerTest_2100 end ------------- ");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "async", nullptr, async, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_0100", nullptr, RdbStoreCorruptHandlerTest_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_0200", nullptr, RdbStoreCorruptHandlerTest_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_0300", nullptr, RdbStoreCorruptHandlerTest_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_0400", nullptr, RdbStoreCorruptHandlerTest_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_0500", nullptr, RdbStoreCorruptHandlerTest_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_0600", nullptr, RdbStoreCorruptHandlerTest_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_0700", nullptr, RdbStoreCorruptHandlerTest_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_0800", nullptr, RdbStoreCorruptHandlerTest_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_0900", nullptr, RdbStoreCorruptHandlerTest_0900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1000", nullptr, RdbStoreCorruptHandlerTest_1000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1100", nullptr, RdbStoreCorruptHandlerTest_1100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1200", nullptr, RdbStoreCorruptHandlerTest_1200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1300", nullptr, RdbStoreCorruptHandlerTest_1300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1400", nullptr, RdbStoreCorruptHandlerTest_1400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1500", nullptr, RdbStoreCorruptHandlerTest_1500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1600", nullptr, RdbStoreCorruptHandlerTest_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1700", nullptr, RdbStoreCorruptHandlerTest_1700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1800", nullptr, RdbStoreCorruptHandlerTest_1800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_1900", nullptr, RdbStoreCorruptHandlerTest_1900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_2000", nullptr, RdbStoreCorruptHandlerTest_2000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "RdbStoreCorruptHandlerTest_2100", nullptr, RdbStoreCorruptHandlerTest_2100, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "corrupted",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}