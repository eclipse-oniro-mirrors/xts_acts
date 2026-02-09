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
#include <sys/stat.h>
#include <sys/types.h>
#include <string>

#include "common.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/relational_store.h"
#include "database/rdb/oh_rdb_transaction.h"
#include "database/rdb/oh_rdb_types.h"
#include "database/data/oh_data_values_buckets.h"


const char *TAG = "returning_test";
const char *RDB_TEST_PATH = "/data/storage/el2/database/com.example.buchongndktest/entry/";

const char *CREATE_TABLE_SQL =
        "CREATE TABLE IF NOT EXISTS store_test (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER, "
        "SALARY REAL, CODES BLOB, HEIGHT REAL, SEX TEXT, DATAS ASSETS, FLOATS FLOATVECTOR)";
const char *QUERY_SQL = "SELECT * FROM store_test";

static  OH_VBucket *CreateAndSetValueBucket()
{
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    const int id = 1;
    valueBucket->putInt64(valueBucket, "ID", id);
    valueBucket->putText(valueBucket, "NAME", "Lisa");
    const int age = 18;
    valueBucket->putInt64(valueBucket, "AGE", age);
    const float salary = 100.5;
    valueBucket->putReal(valueBucket, "SALARY", salary);
    uint8_t arr[] = { 1, 2, 3, 4, 5 };
    int blobLen = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "CODES", arr, blobLen);
    const float height = 172;
    valueBucket->putReal(valueBucket, "HEIGHT", height);
    valueBucket->putText(valueBucket, "SEX", "MALE");

    const int assetsCount = 2;
    Data_Asset **assets = OH_Data_Asset_CreateMultiple(assetsCount);
    OH_Data_Asset_SetName(assets[0], "asset1");
    OH_Data_Asset_SetName(assets[1], "asset2");
    OH_VBucket_PutAssets(valueBucket, "DATAS", assets, assetsCount);

    const int floatsSize = 3;
    float floatArr[floatsSize] = { 1.0, 2.0, 3.0 };
    OH_VBucket_PutFloatVector(valueBucket, "FLOATS", floatArr, floatsSize);
    return valueBucket;
}
static napi_value OH_Rdb_BatchInsertWithReturning0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_returningtest.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    OH_RDB_ReturningContext *returningContext = OH_RDB_CreateReturningContext();
    NAPI_ASSERT(env, returningContext != nullptr, "OH_RDB_CreateReturningContext is fail.");
    const char *fields[] = {"NAME"};
    int32_t len = sizeof(fields) / sizeof(fields[0]);
    errCode = OH_RDB_SetReturningFields(returningContext, fields, len);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetReturningFields is fail.");
    errCode = OH_RDB_SetMaxReturningCount(returningContext, 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetMaxReturningCount is fail.");
    OH_Data_VBuckets *rows = OH_VBuckets_Create();
    NAPI_ASSERT(env, rows != nullptr, "OH_VBuckets_Create is fail.");
    errCode = OH_VBuckets_PutRow(rows, valueBucket);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_VBuckets_PutRow is fail.");
        
    errCode = OH_Rdb_BatchInsertWithReturning(store, "abc", rows, Rdb_ConflictResolution::RDB_CONFLICT_REPLACE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_SQLITE_ERROR, "OH_Rdb_BatchInsertWithReturning is fail9.");
    
    errCode = OH_Rdb_BatchInsertWithReturning(store, "store_test", rows, Rdb_ConflictResolution::RDB_CONFLICT_ABORT, returningContext);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_BatchInsertWithReturning is fail.");

    OH_Cursor *cursor = OH_RDB_GetReturningValues(returningContext);
    NAPI_ASSERT(env, cursor != nullptr, "OH_RDB_GetReturningValues is fail2.");
    
    int64_t errCode1 = OH_RDB_GetChangedCount(returningContext);
    NAPI_ASSERT(env, errCode1 == 1, "OH_RDB_GetChangedCount is fail2.");
    
    errCode = OH_Rdb_BatchInsertWithReturning(nullptr, "store_test", rows, Rdb_ConflictResolution::RDB_CONFLICT_NONE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail1.");
    errCode = OH_Rdb_BatchInsertWithReturning(store, nullptr, rows, Rdb_ConflictResolution::RDB_CONFLICT_ROLLBACK, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail2.");
    errCode = OH_Rdb_BatchInsertWithReturning(store, "store_test", nullptr, Rdb_ConflictResolution::RDB_CONFLICT_FAIL, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail3.");

    const Rdb_ConflictResolution conflictResolution1 = static_cast<Rdb_ConflictResolution>(0);
    errCode = OH_Rdb_BatchInsertWithReturning(store, "store_test", nullptr, conflictResolution1, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail4.");

    OH_Data_VBuckets *rows1 = OH_VBuckets_Create();
    errCode = OH_Rdb_BatchInsertWithReturning(store, "store_test", rows1, Rdb_ConflictResolution::RDB_CONFLICT_IGNORE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail5.");

    const Rdb_ConflictResolution conflictResolution2 = static_cast<Rdb_ConflictResolution>(7);
    errCode = OH_Rdb_BatchInsertWithReturning(store, "store_test", nullptr, conflictResolution2, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail6.");
    
    errCode = OH_Rdb_BatchInsertWithReturning(nullptr, "", rows, Rdb_ConflictResolution::RDB_CONFLICT_REPLACE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail7.");

    errCode = OH_Rdb_BatchInsertWithReturning(store, "store_test", rows, Rdb_ConflictResolution::RDB_CONFLICT_REPLACE, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail8.");

    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    OH_RDB_DestroyReturningContext(returningContext);
    returningContext = nullptr;
    NAPI_ASSERT(env, returningContext == nullptr, "OH_RDB_DestroyReturningContext is fail.");
    errCode = OH_VBuckets_Destroy(rows);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_VBuckets_Destroy is fail1.");
    errCode = OH_VBuckets_Destroy(rows1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_VBuckets_Destroy is fail2.");
    valueBucket->destroy(valueBucket);
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_UpdateWithReturning0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_returningtest.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_RDB_ReturningContext *returningContext = OH_RDB_CreateReturningContext();
    NAPI_ASSERT(env, returningContext != nullptr, "OH_RDB_CreateReturningContext is fail.");
    const char *fields[] = {"NAME"};
    int32_t len = sizeof(fields) / sizeof(fields[0]);
    errCode = OH_RDB_SetReturningFields(returningContext, fields, len);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetReturningFields is fail.");
    errCode = OH_RDB_SetMaxReturningCount(returningContext, 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetMaxReturningCount is fail.");
    OH_VBucket *valueBucket1 = OH_Rdb_CreateValuesBucket();
    valueBucket1->putText(valueBucket1, "NAME", "xixixi");
    const int age = 18;
    valueBucket1->putInt64(valueBucket1, "AGE", age);
    const float salary = 100.5;
    valueBucket1->putReal(valueBucket1, "SALARY", salary);
    uint8_t arr[] = { 1, 2, 3, 4, 5 };
    int blobLen = sizeof(arr) / sizeof(arr[0]);
    valueBucket1->putBlob(valueBucket1, "CODES", arr, blobLen);
    const float height = 172;
    valueBucket1->putReal(valueBucket1, "HEIGHT", height);
    valueBucket1->putText(valueBucket1, "SEX", "MALE");

    const int assetsCount = 2;
    Data_Asset **assets = OH_Data_Asset_CreateMultiple(assetsCount);
    OH_Data_Asset_SetName(assets[0], "asset1");
    OH_Data_Asset_SetName(assets[1], "asset2");
    OH_VBucket_PutAssets(valueBucket1, "DATAS", assets, assetsCount);

    const int floatsSize = 3;
    float floatArr[floatsSize] = { 1.0, 2.0, 3.0 };
    OH_VBucket_PutFloatVector(valueBucket1, "FLOATS", floatArr, floatsSize);

   
    OH_VObject *valueObject1 = OH_Rdb_CreateValueObject();
    const char *value1 = "Lisa";
    valueObject1->putText(valueObject1, value1);
    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates("abc");
    predicates1->equalTo(predicates1, "NAME", valueObject1);
    errCode = OH_Rdb_UpdateWithReturning(store, valueBucket1, predicates1, Rdb_ConflictResolution::RDB_CONFLICT_REPLACE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_SQLITE_ERROR, "OH_Rdb_UpdateWithReturning is fail4.");

    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *value = "Lisa";
    valueObject->putText(valueObject, value);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    predicates->equalTo(predicates, "NAME", valueObject);

    errCode = OH_Rdb_UpdateWithReturning(store, valueBucket1, predicates, Rdb_ConflictResolution::RDB_CONFLICT_REPLACE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_UpdateWithReturning is fail.");
    OH_Cursor *cursor = OH_RDB_GetReturningValues(returningContext);
    NAPI_ASSERT(env, cursor != nullptr, "OH_RDB_GetReturningValues is fail2.");
    
    int64_t errCode1 = OH_RDB_GetChangedCount(returningContext);
    NAPI_ASSERT(env, errCode1 == 1, "OH_RDB_GetChangedCount is fail2.");

    errCode = OH_Rdb_UpdateWithReturning(nullptr, valueBucket1, predicates, Rdb_ConflictResolution::RDB_CONFLICT_ABORT, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail1.");

    OH_VBucket *valueBucket2 = OH_Rdb_CreateValuesBucket();
    errCode = OH_Rdb_UpdateWithReturning(store, valueBucket2, predicates, Rdb_ConflictResolution::RDB_CONFLICT_NONE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail1.");

    errCode = OH_Rdb_UpdateWithReturning(store, nullptr, predicates, Rdb_ConflictResolution::RDB_CONFLICT_FAIL, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail2.");

    errCode = OH_Rdb_UpdateWithReturning(store, valueBucket1, nullptr, Rdb_ConflictResolution::RDB_CONFLICT_IGNORE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail3.");

    errCode = OH_Rdb_UpdateWithReturning(store, valueBucket1, predicates, Rdb_ConflictResolution::RDB_CONFLICT_ROLLBACK, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail4.");

    const Rdb_ConflictResolution conflictResolution1 = static_cast<Rdb_ConflictResolution>(0);
    errCode = OH_Rdb_UpdateWithReturning(store, valueBucket1, predicates, conflictResolution1, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail5.");

    const Rdb_ConflictResolution conflictResolution2 = static_cast<Rdb_ConflictResolution>(7);
    errCode = OH_Rdb_UpdateWithReturning(store, valueBucket1, predicates, conflictResolution2, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_BatchInsertWithReturning is fail6.");


    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    OH_RDB_DestroyReturningContext(returningContext);
    returningContext = nullptr;
    valueBucket->destroy(valueBucket);
    valueBucket1->destroy(valueBucket1);
    valueBucket2->destroy(valueBucket2);
    predicates->destroy(predicates);
    predicates = nullptr;
    predicates1->destroy(predicates1);
    predicates1 = nullptr;
    valueObject->destroy(valueObject);
    valueObject = nullptr;
    valueObject1->destroy(valueObject1);
    valueObject1 = nullptr;
    OH_Data_Asset_DestroyMultiple(assets, assetsCount);
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_DeleteWithReturning0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_returningtest.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_RDB_ReturningContext *returningContext = OH_RDB_CreateReturningContext();
    NAPI_ASSERT(env, returningContext != nullptr, "OH_RDB_CreateReturningContext is fail.");
    const char *fields[] = {"NAME"};
    int32_t len = sizeof(fields) / sizeof(fields[0]);
    errCode = OH_RDB_SetReturningFields(returningContext, fields, len);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetReturningFields is fail.");
    errCode = OH_RDB_SetMaxReturningCount(returningContext, 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetMaxReturningCount is fail.");
    OH_VObject *valueObject1 = OH_Rdb_CreateValueObject();
    const char *value1 = "Lisa";
    valueObject1->putText(valueObject1, value1);
    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates("abc");
    predicates1->equalTo(predicates1, "NAME", valueObject1);
    errCode = OH_Rdb_DeleteWithReturning(store, predicates1, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_SQLITE_ERROR, "OH_Rdb_DeleteWithReturning is fail4.");

    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *value = "Lisa";
    valueObject->putText(valueObject, value);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    predicates->equalTo(predicates, "NAME", valueObject);
    errCode = OH_Rdb_DeleteWithReturning(store, predicates, returningContext);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteWithReturning is fail.");
    OH_Cursor *cursor = OH_RDB_GetReturningValues(returningContext);
    NAPI_ASSERT(env, cursor != nullptr, "OH_RDB_GetReturningValues is fail2.");
    
    int64_t errCode1 = OH_RDB_GetChangedCount(returningContext);
    NAPI_ASSERT(env, errCode1 == 1, "OH_RDB_GetChangedCount is fail2.");
    errCode = OH_Rdb_DeleteWithReturning(nullptr, predicates, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_DeleteWithReturning is fail1.");
    errCode = OH_Rdb_DeleteWithReturning(store, nullptr, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_DeleteWithReturning is fail2.");
    errCode = OH_Rdb_DeleteWithReturning(store, predicates, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_DeleteWithReturning is fail3.");

    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    OH_RDB_DestroyReturningContext(returningContext);
    returningContext = nullptr;
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    predicates = nullptr;
    predicates1->destroy(predicates1);
    predicates1 = nullptr;
    valueObject->destroy(valueObject);
    valueObject = nullptr;
    valueObject1->destroy(valueObject1);
    valueObject1 = nullptr;
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_RdbTrans_BatchInsertWithReturning0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_returningtest.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    OH_RDB_ReturningContext *returningContext = OH_RDB_CreateReturningContext();
    NAPI_ASSERT(env, returningContext != nullptr, "OH_RDB_CreateReturningContext is fail.");
    const char *fields[] = {"NAME"};
    int32_t len = sizeof(fields) / sizeof(fields[0]);
    errCode = OH_RDB_SetReturningFields(returningContext, fields, len);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetReturningFields is fail.");
    errCode = OH_RDB_SetMaxReturningCount(returningContext, 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetMaxReturningCount is fail.");
    OH_Data_VBuckets *rows = OH_VBuckets_Create();
    NAPI_ASSERT(env, rows != nullptr, "OH_VBuckets_Create is fail.");
    errCode = OH_VBuckets_PutRow(rows, valueBucket);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_VBuckets_PutRow is fail.");
    OH_RDB_TransOptions *options = OH_RdbTrans_CreateOptions();
    OH_Rdb_Transaction *trans = nullptr;
    errCode = OH_Rdb_CreateTransaction(store, options, &trans);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    errCode = OH_RdbTransOption_SetType(options, RDB_TRANS_DEFERRED);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTransOption_SetType is fail.");

    errCode = OH_RdbTrans_BatchInsertWithReturning(trans, "abc", rows, Rdb_ConflictResolution::RDB_CONFLICT_ABORT, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_SQLITE_ERROR, "OH_RdbTrans_BatchInsertWithReturning is fail9.");
    
    errCode = OH_RdbTrans_BatchInsertWithReturning(trans, "store_test", rows, Rdb_ConflictResolution::RDB_CONFLICT_ABORT, returningContext);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_BatchInsertWithReturning is fail.");
    
    OH_Cursor *cursor = OH_RDB_GetReturningValues(returningContext);
    NAPI_ASSERT(env, cursor != nullptr, "OH_RDB_GetReturningValues is fail2.");
    
    int64_t errCode1 = OH_RDB_GetChangedCount(returningContext);
    NAPI_ASSERT(env, errCode1 == 1, "OH_RDB_GetChangedCount is fail2.");
    
    errCode = OH_RdbTrans_BatchInsertWithReturning(nullptr, "store_test", rows, Rdb_ConflictResolution::RDB_CONFLICT_NONE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_BatchInsertWithReturning is fail1.");
    errCode = OH_RdbTrans_BatchInsertWithReturning(trans, nullptr, rows, Rdb_ConflictResolution::RDB_CONFLICT_ROLLBACK, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_BatchInsertWithReturning is fail2.");
    errCode = OH_RdbTrans_BatchInsertWithReturning(trans, "store_test", nullptr, Rdb_ConflictResolution::RDB_CONFLICT_REPLACE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_BatchInsertWithReturning is fail3.");

    const Rdb_ConflictResolution conflictResolution1 = static_cast<Rdb_ConflictResolution>(0);
    errCode = OH_RdbTrans_BatchInsertWithReturning(trans, "store_test", nullptr, conflictResolution1, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_BatchInsertWithReturning is fail4.");

    OH_Data_VBuckets *rows1 = OH_VBuckets_Create();
    errCode = OH_RdbTrans_BatchInsertWithReturning(trans, "store_test", rows1, Rdb_ConflictResolution::RDB_CONFLICT_FAIL, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_BatchInsertWithReturning is fail5.");

    const Rdb_ConflictResolution conflictResolution2 = static_cast<Rdb_ConflictResolution>(7);
    errCode = OH_RdbTrans_BatchInsertWithReturning(trans, "store_test", nullptr, conflictResolution2, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_BatchInsertWithReturning is fail6.");
    
    errCode = OH_RdbTrans_BatchInsertWithReturning(nullptr, "", rows, Rdb_ConflictResolution::RDB_CONFLICT_IGNORE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_BatchInsertWithReturning is fail7.");

    errCode = OH_RdbTrans_BatchInsertWithReturning(trans, "store_test", rows, Rdb_ConflictResolution::RDB_CONFLICT_REPLACE, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_BatchInsertWithReturning is fail8.");
    

    
    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_RdbTrans_DestroyOptions(options);
    options = nullptr;
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_DestroyOptions is fail.");
    errCode = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_Destroy is fail.");
    OH_RDB_DestroyReturningContext(returningContext);
    returningContext = nullptr;
    errCode = OH_VBuckets_Destroy(rows);
    errCode = OH_VBuckets_Destroy(rows1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_VBuckets_Destroy is fail.");
    valueBucket->destroy(valueBucket);
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_RdbTrans_UpdateWithReturning0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_returningtest.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_RDB_ReturningContext *returningContext = OH_RDB_CreateReturningContext();
    NAPI_ASSERT(env, returningContext != nullptr, "OH_RDB_CreateReturningContext is fail.");
    const char *fields[] = {"NAME"};
    int32_t len = sizeof(fields) / sizeof(fields[0]);
    errCode = OH_RDB_SetReturningFields(returningContext, fields, len);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetReturningFields is fail.");
    errCode = OH_RDB_SetMaxReturningCount(returningContext, 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetMaxReturningCount is fail.");
    OH_VBucket *valueBucket1 = OH_Rdb_CreateValuesBucket();
    valueBucket1->putText(valueBucket1, "NAME", "xixixi");
    const int age = 18;
    valueBucket1->putInt64(valueBucket1, "AGE", age);
    const float salary = 100.5;
    valueBucket1->putReal(valueBucket1, "SALARY", salary);
    uint8_t arr[] = { 1, 2, 3, 4, 5 };
    int blobLen = sizeof(arr) / sizeof(arr[0]);
    valueBucket1->putBlob(valueBucket1, "CODES", arr, blobLen);
    const float height = 172;
    valueBucket1->putReal(valueBucket1, "HEIGHT", height);
    valueBucket1->putText(valueBucket1, "SEX", "MALE");

    const int assetsCount = 2;
    Data_Asset **assets = OH_Data_Asset_CreateMultiple(assetsCount);
    OH_Data_Asset_SetName(assets[0], "asset1");
    OH_Data_Asset_SetName(assets[1], "asset2");
    OH_VBucket_PutAssets(valueBucket1, "DATAS", assets, assetsCount);

    const int floatsSize = 3;
    float floatArr[floatsSize] = { 1.0, 2.0, 3.0 };
    OH_VBucket_PutFloatVector(valueBucket1, "FLOATS", floatArr, floatsSize);


    OH_RDB_TransOptions *options = OH_RdbTrans_CreateOptions();
    OH_Rdb_Transaction *trans = nullptr;
    errCode = OH_Rdb_CreateTransaction(store, options, &trans);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    errCode = OH_RdbTransOption_SetType(options, RDB_TRANS_DEFERRED);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTransOption_SetType is fail.");

    OH_VObject *valueObject1 = OH_Rdb_CreateValueObject();
    const char *value1 = "Lisa";
    valueObject1->putText(valueObject1, value1);
    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates("abc");
    predicates1->equalTo(predicates1, "NAME", valueObject1);
    errCode = OH_RdbTrans_UpdateWithReturning(trans, valueBucket1, predicates1, Rdb_ConflictResolution::RDB_CONFLICT_ROLLBACK, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_SQLITE_ERROR, "OH_RdbTrans_UpdateWithReturning is fail7.");

    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    char *value = "Lisa";
    valueObject->putText(valueObject, value);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    predicates->equalTo(predicates, "NAME", valueObject);
    errCode = OH_RdbTrans_UpdateWithReturning(trans, valueBucket1, predicates, Rdb_ConflictResolution::RDB_CONFLICT_REPLACE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_UpdateWithReturning is fail.");
    OH_Cursor *cursor = OH_RDB_GetReturningValues(returningContext);
    NAPI_ASSERT(env, cursor != nullptr, "OH_RDB_GetReturningValues is fail2.");
    
    int64_t errCode1 = OH_RDB_GetChangedCount(returningContext);
    NAPI_ASSERT(env, errCode1 == 1, "OH_RDB_GetChangedCount is fail2.");
    
    errCode = OH_RdbTrans_UpdateWithReturning(nullptr, valueBucket1, predicates, Rdb_ConflictResolution::RDB_CONFLICT_ABORT, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_UpdateWithReturning is fail1.");
    
    OH_VBucket *valueBucket2 = OH_Rdb_CreateValuesBucket();
    errCode = OH_RdbTrans_UpdateWithReturning(trans, valueBucket2, predicates, Rdb_ConflictResolution::RDB_CONFLICT_NONE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_UpdateWithReturning is fail1.");

    errCode = OH_RdbTrans_UpdateWithReturning(trans, nullptr, predicates, Rdb_ConflictResolution::RDB_CONFLICT_FAIL, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_UpdateWithReturning is fail2.");

    errCode = OH_RdbTrans_UpdateWithReturning(trans, valueBucket1, nullptr, Rdb_ConflictResolution::RDB_CONFLICT_IGNORE, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_UpdateWithReturning is fail3.");

    errCode = OH_RdbTrans_UpdateWithReturning(trans, valueBucket1, predicates, Rdb_ConflictResolution::RDB_CONFLICT_ROLLBACK, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_UpdateWithReturning is fail4.");

    const Rdb_ConflictResolution conflictResolution1 = static_cast<Rdb_ConflictResolution>(0);
    errCode = OH_RdbTrans_UpdateWithReturning(trans, valueBucket1, predicates, conflictResolution1, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_UpdateWithReturning is fail5.");

    const Rdb_ConflictResolution conflictResolution2 = static_cast<Rdb_ConflictResolution>(7);
    errCode = OH_RdbTrans_UpdateWithReturning(trans, valueBucket1, predicates, conflictResolution2, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_UpdateWithReturning is fail6.");

    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_RdbTrans_DestroyOptions(options);
    options = nullptr;
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_DestroyOptions is fail.");
    errCode = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_Destroy is fail.");
    OH_RDB_DestroyReturningContext(returningContext);
    returningContext = nullptr;
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_VBuckets_Destroy is fail.");
    valueBucket1->destroy(valueBucket1);
    valueBucket2->destroy(valueBucket2);
    predicates->destroy(predicates);
    predicates = nullptr;
    predicates1->destroy(predicates1);
    predicates1 = nullptr;
    valueObject->destroy(valueObject);
    valueObject = nullptr;
    valueObject1->destroy(valueObject1);
    valueObject1 = nullptr;
    OH_Data_Asset_DestroyMultiple(assets, assetsCount);
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_RdbTrans_DeleteWithReturning0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_returningtest.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    errCode = OH_Rdb_Execute(store, CREATE_TABLE_SQL);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_Execute is fail.");
    OH_VBucket *valueBucket = CreateAndSetValueBucket();
    errCode = OH_Rdb_Insert(store, "store_test", valueBucket);
    NAPI_ASSERT(env, errCode == 1, "OH_Rdb_Insert is fail.");
    OH_RDB_ReturningContext *returningContext = OH_RDB_CreateReturningContext();
    NAPI_ASSERT(env, returningContext != nullptr, "OH_RDB_CreateReturningContext is fail.");
    const char *fields[] = {"NAME"};
    int32_t len = sizeof(fields) / sizeof(fields[0]);
    errCode = OH_RDB_SetReturningFields(returningContext, fields, len);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetReturningFields is fail.");
    errCode = OH_RDB_SetMaxReturningCount(returningContext, 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetMaxReturningCount is fail.");
    OH_RDB_TransOptions *options = OH_RdbTrans_CreateOptions();
    OH_Rdb_Transaction *trans = nullptr;
    errCode = OH_Rdb_CreateTransaction(store, options, &trans);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CreateTransaction is fail.");
    errCode = OH_RdbTransOption_SetType(options, RDB_TRANS_DEFERRED);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTransOption_SetType is fail.");

    OH_VObject *valueObject1 = OH_Rdb_CreateValueObject();
    const char *value1 = "Lisa";
    valueObject1->putText(valueObject1, value1);
    OH_Predicates *predicates1 = OH_Rdb_CreatePredicates("abc");
    predicates1->equalTo(predicates1, "NAME", valueObject1);
    errCode = OH_RdbTrans_DeleteWithReturning(trans, predicates1, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_SQLITE_ERROR, "OH_RdbTrans_DeleteWithReturning is fail4.");

    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *value = "Lisa";
    valueObject->putText(valueObject, value);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    predicates->equalTo(predicates, "NAME", valueObject);
    errCode = OH_RdbTrans_DeleteWithReturning(trans, predicates, returningContext);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_DeleteWithReturning is fail.");
    OH_Cursor *cursor = OH_RDB_GetReturningValues(returningContext);
    NAPI_ASSERT(env, cursor != nullptr, "OH_RDB_GetReturningValues is fail2.");
    
    int64_t errCode1 = OH_RDB_GetChangedCount(returningContext);
    NAPI_ASSERT(env, errCode1 == 1, "OH_RDB_GetChangedCount is fail2.");
    
    errCode = OH_RdbTrans_DeleteWithReturning(nullptr, predicates, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_DeleteWithReturning is fail1.");
    errCode = OH_RdbTrans_DeleteWithReturning(trans, nullptr, returningContext);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_DeleteWithReturning is fail2.");
    errCode = OH_RdbTrans_DeleteWithReturning(trans, predicates, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RdbTrans_DeleteWithReturning is fail3.");
    

    errCode = OH_Rdb_CloseStore(store);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_RdbTrans_DestroyOptions(options);
    options = nullptr;
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_DestroyOptions is fail.");
    errCode = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_Destroy is fail.");
    OH_RDB_DestroyReturningContext(returningContext);
    returningContext = nullptr;
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    predicates = nullptr;
    predicates1->destroy(predicates1);
    predicates1 = nullptr;
    valueObject->destroy(valueObject);
    valueObject = nullptr;
    valueObject1->destroy(valueObject1);
    valueObject1 = nullptr;
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_RDB_SetReturningFields0100(napi_env env, napi_callback_info)
{
    OH_RDB_ReturningContext *context = OH_RDB_CreateReturningContext();
    int errCode = OH_RDB_SetMaxReturningCount(context, 1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetMaxReturningCount is fail.");

    errCode = OH_RDB_SetMaxReturningCount(context, 0);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RDB_SetMaxReturningCount1 is fail.");

    errCode = OH_RDB_SetMaxReturningCount(context, 0X7FFF);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RDB_SetMaxReturningCount2 is fail.");

    errCode = OH_RDB_SetMaxReturningCount(nullptr, 1);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RDB_SetMaxReturningCount3 is fail.");

    const char *columns[] = { "NAME", "AGE", "SALARY" };
    int32_t len = sizeof(columns) / sizeof(columns[0]);

    errCode = OH_RDB_SetReturningFields(context, columns, len);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RDB_SetReturningFields is fail1.");

    errCode = OH_RDB_SetReturningFields(nullptr, columns, len);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RDB_SetReturningFields is fail2.");

    errCode = OH_RDB_SetReturningFields(context, nullptr, len);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RDB_SetReturningFields is fail3.");


    errCode = OH_RDB_SetReturningFields(context, columns, -1);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RDB_SetReturningFields is fail4.");


    const char *columns1[] = { "NAME", "*", "SALARY" };
    int32_t len1 = sizeof(columns1) / sizeof(columns1[0]);
    errCode = OH_RDB_SetReturningFields(context, columns1, len1);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RDB_SetReturningFields is fail5.");


    const char *columns2[] = { "NAME", nullptr, "SALARY" };
    int32_t len2 = sizeof(columns2) / sizeof(columns2[0]);
    errCode = OH_RDB_SetReturningFields(context, columns2, len2);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RDB_SetReturningFields is fail6.");

    const char *columns3[] = {};
    int32_t len3 = sizeof(columns3) / sizeof(columns3[0]);
    errCode = OH_RDB_SetReturningFields(context, columns3, len3);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_RDB_SetReturningFields is fail7.");


    OH_Cursor *cursor1 = OH_RDB_GetReturningValues(nullptr);
    NAPI_ASSERT(env, cursor1 == nullptr, "OH_RDB_GetReturningValues is fail1.");
    
    int64_t errCode1 = OH_RDB_GetChangedCount(nullptr);
    NAPI_ASSERT(env, errCode1 == -1, "OH_RDB_GetChangedCount is fail1.");
    
    OH_RDB_DestroyReturningContext(nullptr);
    NAPI_ASSERT(env, context != nullptr, "OH_RDB_DestroyReturningContext is fail1.");

    OH_RDB_DestroyReturningContext(context);
    context = nullptr;
    NAPI_ASSERT(env, context == nullptr, "OH_RDB_DestroyReturningContext is fail2.");

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "OH_Rdb_BatchInsertWithReturning0100", nullptr, OH_Rdb_BatchInsertWithReturning0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_UpdateWithReturning0100", nullptr, OH_Rdb_UpdateWithReturning0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_DeleteWithReturning0100", nullptr, OH_Rdb_DeleteWithReturning0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_BatchInsertWithReturning0100", nullptr, OH_RdbTrans_BatchInsertWithReturning0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_UpdateWithReturning0100", nullptr, OH_RdbTrans_UpdateWithReturning0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RdbTrans_DeleteWithReturning0100", nullptr, OH_RdbTrans_DeleteWithReturning0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_RDB_SetReturningFields0100", nullptr, OH_RDB_SetReturningFields0100, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "returningtest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

