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
#include "database/rdb/oh_rdb_crypto_param.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/relational_store.h"
#include "database/data/oh_data_value.h"
#include "database/data/oh_data_values.h"
#include "database/rdb/oh_predicates.h"

OH_Rdb_Store *storeTestRdbStore_;
OH_Rdb_Store *predicatesTestRdbStore_;
const char *RDB_TEST_PATH = "/data/storage/el2/database/com.example.buchongndktest/entry/";
const char *RDB_TEST_PATH1 = "/data/storage/el2/database";
static napi_value OH_Rdb_Predicates_NotLike0100(napi_env env, napi_callback_info)
{

    int ret = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    const char *field = "data5";
    const char *dataValue = "BBCD%";
    ret = OH_Predicates_NotLike(nullptr, field, dataValue);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_NotLike1 is fail.");
    ret = OH_Predicates_NotLike(predicates, nullptr, dataValue);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_NotLike2 is fail.");
    ret = OH_Predicates_NotLike(predicates, field, nullptr);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_NotLike3 is fail.");
    const char *field1 = "";
    const char *dataValue1 = "";
    ret = OH_Predicates_NotLike(predicates, field1, dataValue);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Predicates_NotLike4 is fail.");
    
    ret = OH_Predicates_NotLike(predicates, field, dataValue1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Predicates_NotLike5 is fail.");
    predicates->destroy(predicates);
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_Predicates_Glob0100(napi_env env, napi_callback_info)
{
    int ret = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    const char *field = "data5";
    const char *dataValue = "aBCD*";
    ret = OH_Predicates_Glob(nullptr, field, dataValue);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Glob1 is fail.");

    ret = OH_Predicates_Glob(predicates, nullptr, dataValue);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Glob2 is fail.");

    ret = OH_Predicates_Glob(predicates, field, nullptr);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Glob3 is fail.");

    const char *field1 = "";
    const char *dataValue1 = "";
    ret = OH_Predicates_Glob(predicates, field1, dataValue);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Predicates_Glob4 is fail.");
    ret = OH_Predicates_Glob(predicates, field, dataValue1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Predicates_Glob5 is fail.");

    predicates->destroy(predicates);
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_Predicates_NotGlob0100(napi_env env, napi_callback_info)
{
    int ret = 0;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    const char *field = "data5";
    const char *dataValue = "aBCD*";
    ret = OH_Predicates_NotGlob(nullptr, field, dataValue);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_NotGlob1 is fail.");
    ret = OH_Predicates_NotGlob(predicates, nullptr, dataValue);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_NotGlob2 is fail.");
    ret = OH_Predicates_NotGlob(predicates, field, nullptr);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_NotGlob3 is fail.");

    const char *field1 = "";
    const char *dataValue1 = "";
    ret = OH_Predicates_NotGlob(predicates, field1, dataValue);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Predicates_NotGlob4 is fail.");
    ret = OH_Predicates_NotGlob(predicates, field, dataValue1);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Predicates_NotGlob5 is fail.");
    predicates->destroy(predicates);

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_Predicates_Having0100(napi_env env, napi_callback_info)
{
      int ret = 0;
      OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
      OH_Data_Values *values = OH_Values_Create();
      int64_t Value1 = 100;
      OH_Values_PutInt(values, Value1);
      const char *condictions = "data5";
      ret = OH_Predicates_Having(nullptr, condictions, values);
      NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Having1 is fail.");
      ret = OH_Predicates_Having(predicates, nullptr, values);
      NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Having2 is fail.");
      ret = OH_Predicates_Having(predicates, condictions, nullptr);
      NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Having3 is fail.");
      const char *condictions1 = "";
      ret = OH_Predicates_Having(predicates, condictions1, values);
      NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Predicates_Having4 is fail.");
      predicates->destroy(predicates);
      ret = OH_Values_Destroy(values);
      NAPI_ASSERT(env, ret == RDB_OK, "OH_Value_Destroy is fail.");
      napi_value result;
      napi_create_int32(env, 0, &result);
      return result;
}


static napi_value OH_Rdb_SetCryptoParam0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2 *confg = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, confg != nullptr, "OH_Rdb_SetCryptoParam is fail.");

    OH_Rdb_CryptoParam *crypto = OH_Rdb_CreateCryptoParam();
    NAPI_ASSERT(env, crypto != NULL, "OH_Rdb_SetCryptoParam is fail.");

    auto ret = OH_Rdb_SetCryptoParam(nullptr, crypto);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_SetCryptoParam is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_InsertWithConflictResolution0100(napi_env env, napi_callback_info)
{
    OH_Rdb_Store *store = storeTestRdbStore_;
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putInt64(valueBucket, "id", 2);
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putText(valueBucket, "data5", "ABCDEFGH");
    int64_t rowId = 0;
    int errCode = OH_Rdb_InsertWithConflictResolution(nullptr, "store_test", valueBucket, RDB_CONFLICT_ROLLBACK, &rowId);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_InsertWithConflictResolution1 is fail.");
    const char *table = "";
    errCode = OH_Rdb_InsertWithConflictResolution(store, table, valueBucket, RDB_CONFLICT_ROLLBACK, &rowId);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_InsertWithConflictResolution2 is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_UpdateWithConflictResolution0100(napi_env env, napi_callback_info)
{
    OH_Rdb_Store *store = storeTestRdbStore_;
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    NAPI_ASSERT(env, predicates != NULL, "OH_Rdb_CreatePredicates is fail.");

    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    NAPI_ASSERT(env, valueObject != NULL, "OH_Rdb_CreateValueObject is fail.");
    const char *dataValue1 = "zhangSan";
    valueObject->putText(valueObject, dataValue1);
    predicates->equalTo(predicates, "data1", valueObject);
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    NAPI_ASSERT(env, valueBucket != NULL, "OH_Rdb_CreateValueObject is fail.");
    valueBucket->putText(valueBucket, "data1", "liSi");
    valueBucket->putInt64(valueBucket, "data2", 13800);
    valueBucket->putReal(valueBucket, "data3", 200.1);
    valueBucket->putNull(valueBucket, "data5");

    int64_t chgs = 0;
    int errCode = OH_Rdb_UpdateWithConflictResolution(nullptr, valueBucket, predicates, RDB_CONFLICT_ROLLBACK, &chgs);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_CreateValueObject is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}
static napi_value OH_Rdb_Attach0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2* config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH1);
    OH_Rdb_SetStoreName(config, "Rdb_Test.db");
    OH_Rdb_SetBundleName(config, "ohos.acts.relationalstorendktesthvigor");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S3);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL2);
    size_t attachedNumber = 0;
    const char *attachName = "rdb_attach_test";
    int64_t waitTime = 3;
    auto ret = OH_Rdb_Attach(nullptr, nullptr, attachName, waitTime, &attachedNumber);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_Attach1 is fail.");
    const char *attachName1 = "";
    ret = OH_Rdb_Attach(storeTestRdbStore_, config, attachName1, waitTime, &attachedNumber);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_Attach2 is fail.");

    ret = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, ret == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}
static napi_value OH_Rdb_Detach0100(napi_env env, napi_callback_info)
{
    size_t attachedNumber = 0;
    const char *attachName = "rdb_attach_test";
    int64_t waitTime = 3;
    auto ret = OH_Rdb_Detach(nullptr, attachName, waitTime, &attachedNumber);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_Detach1 is fail.");
    const char *attachName1 = "";
    ret = OH_Rdb_Detach(storeTestRdbStore_, attachName1, waitTime, &attachedNumber);
    NAPI_ASSERT(env, ret == RDB_E_INVALID_ARGS, "OH_Rdb_Detach2 is fail.");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_Setlocale0100(napi_env env, napi_callback_info)
{
    const char *locale = "zh";
    int errCode = OH_Rdb_SetLocale(nullptr, locale);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_SetLocale1 is fail.");
    errCode = OH_Rdb_SetLocale(storeTestRdbStore_, nullptr);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_SetLocale2 is fail.");
    const char *locale1 = "";
    errCode = OH_Rdb_SetLocale(storeTestRdbStore_, locale1);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_SetLocale3 is fail.");
    const char *locale2 = "kkkk";
    errCode = OH_Rdb_SetLocale(storeTestRdbStore_, locale2);
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Rdb_SetLocale4 is fail.");


    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OH_Rdb_LockRow_0100(napi_env env, napi_callback_info)
{
    OH_Rdb_ConfigV2* config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH1);
    OH_Rdb_SetStoreName(config, "Rdb_Test.db");
    OH_Rdb_SetBundleName(config, "ohos.acts.relationalstorendktesthvigor");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S3);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL2);
    int errCode = 0;
    OH_Rdb_Store *store1 = OH_Rdb_CreateOrOpen(config, &errCode);
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, "
    "AGE INTEGER, SALARY FLOAT, CODES BLOB);";
    errCode = OH_Rdb_Execute(store1, createTableSql);
    Rdb_DistributedConfig distributedConfig1{ .version = 1, .isAutoSync = true };
    const int tableCount = 1;
    const char *table[tableCount];
    int age = 18;
    float sal = 100.5;
    table[0] = "EMPLOYEE";
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    valueBucket->putText(valueBucket, "NAME", "Lisa");
    valueBucket->putInt64(valueBucket, "AGE", age);
    valueBucket->putReal(valueBucket, "SALARY", sal);
    uint8_t arr[] = {1, 2, 3, 4, 5};
    int len = sizeof(arr) / sizeof(arr[0]);
    valueBucket->putBlob(valueBucket, "CODES", arr, len);
    OH_Rdb_Insert(store1, "EMPLOYEE", valueBucket);
    valueBucket->clear(valueBucket);
    errCode = OH_Rdb_SetDistributedTables(store1, table, tableCount, RDB_DISTRIBUTED_CLOUD, &distributedConfig1);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_SetDistributedTables is fail");
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("EMPLOYEE");
    OH_VObject *valueObject = OH_Rdb_CreateValueObject();
    const char *name = "Lisa";
    valueObject->putText(valueObject, name);
    predicates->equalTo(predicates, "NAME", valueObject);
    errCode = OH_Rdb_LockRow(store1, predicates);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_LockRow is fail");
    errCode = OH_Rdb_UnlockRow(store1, predicates);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_LockRow is fail");

    OH_Cursor *cursor = OH_Rdb_QueryLockedRow(store1, nullptr, nullptr, 0);
    NAPI_ASSERT(env, cursor == nullptr, "OH_Rdb_LockRow1 is fail");

    cursor = OH_Rdb_FindModifyTime(store1, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, cursor == nullptr, "OH_Rdb_LockRow2 is fail");

    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    valueObject->destroy(valueObject);
    valueBucket->destroy(valueBucket);
    predicates->destroy(predicates);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value OH_Rdb_CreateTransaction_0100(napi_env env, napi_callback_info)
{
    int errorCode = 14800000;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "Rdb_Test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    int errCode = 0;
    OH_Rdb_Store *store1 = OH_Rdb_CreateOrOpen(config, &errCode);
    char createTableSql[] = "CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, "
    "AGE INTEGER, SALARY FLOAT, CODES BLOB);";
    errCode = OH_Rdb_Execute(store1, createTableSql);
    OH_RDB_TransOptions *options = OH_RdbTrans_CreateOptions();
    OH_RdbTransOption_SetType(options, RDB_TRANS_EXCLUSIVE);
    OH_Rdb_Transaction *trans = nullptr;
    OH_Rdb_Transaction *trans1 = nullptr;
    errCode = OH_Rdb_CreateTransaction(store1, options, &trans);
    errCode = OH_Rdb_CreateTransaction(store1, options, &trans1);
    NAPI_ASSERT(env, errCode == errorCode, "OH_Rdb_CreateTransaction is fail");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    errCode = OH_RdbTrans_Destroy(trans);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_Destroy is fail.");
    errCode = OH_RdbTrans_DestroyOptions(options);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_RdbTrans_DestroyOptions is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_NotSupport0100(napi_env env, napi_callback_info)
{
    int errCode = 0;
    int numType = 0;
    int numLan = 1;
    int numHuang = 2;
    const int *supportTypeList = OH_Rdb_GetSupportedDbType(&numType);
    NAPI_ASSERT(env, supportTypeList != nullptr, "OH_Rdb_GetSupportedDbType 1 is fail.");
    NAPI_ASSERT(env, (numType == numLan) || (numType == numHuang), "OH_Rdb_GetSupportedDbType numType is fail.");
    if (numType == 1) {
       napi_value result;
       napi_create_int32(env, 1, &result);
       return result;
    } else {
        OH_Rdb_ConfigV2* config1 = OH_Rdb_CreateConfig();
        OH_Rdb_SetDatabaseDir(config1, RDB_TEST_PATH);
        OH_Rdb_SetStoreName(config1, "Rdb_Test.db");
        OH_Rdb_SetBundleName(config1, "com.ohos.example.distributedndk");
        OH_Rdb_SetEncrypted(config1, false);
        OH_Rdb_SetSecurityLevel(config1, OH_Rdb_SecurityLevel::S1);
        OH_Rdb_SetArea(config1, RDB_SECURITY_AREA_EL1);
        OH_Rdb_SetDbType(config1, RDB_CAYLEY);
        OH_Rdb_Store *store1 = OH_Rdb_CreateOrOpen(config1, &errCode);
       char createTableSql1[] = "CREATE TABLE IF NOT EXISTS EMPLOYEE (id INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, "
       "AGE INTEGER, SALARY FLOAT, CODES BLOB);";
       errCode = OH_Rdb_Execute(store1, createTableSql1);
       NAPI_ASSERT(env, errCode == RDB_E_NOT_SUPPORTED, "OH_Rdb_Execute is fail");

        OH_Rdb_ConfigV2* config2 = OH_Rdb_CreateConfig();
        OH_Rdb_SetDatabaseDir(config2, RDB_TEST_PATH);
        OH_Rdb_SetStoreName(config2, "Rdb_Test111.db");
        OH_Rdb_SetBundleName(config2, "com.ohos.example.distributedndk");
        OH_Rdb_SetEncrypted(config2, false);
        OH_Rdb_SetSecurityLevel(config2, OH_Rdb_SecurityLevel::S1);
        OH_Rdb_SetArea(config2, RDB_SECURITY_AREA_EL1);
        OH_Rdb_SetDbType(config2, RDB_CAYLEY);
        OH_Rdb_SetReadOnly(config2, true);
        OH_Rdb_Store *store2 = OH_Rdb_CreateOrOpen(config2, &errCode);
        int64_t trxId = 0;
        errCode = OH_Rdb_ExecuteByTrxId(store2, trxId, createTableSql1);
        NAPI_ASSERT(env, errCode == RDB_E_NOT_SUPPORTED, "OH_Rdb_Execute is fail");
       errCode = OH_Rdb_DeleteStoreV2(config1);
       NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
       errCode = OH_Rdb_DestroyConfig(config1);
       NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
       errCode = OH_Rdb_DeleteStoreV2(config2);
       NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
       errCode = OH_Rdb_DestroyConfig(config2);
       NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_DestroyConfig is fail.");
       napi_value result;
       napi_create_int32(env, errCode, &result);
       return result;
    }
}
static napi_value OH_Rdb_ColumnType_0100(napi_env env, napi_callback_info)
{
    OH_Data_Value *value = OH_Value_Create();
    int errCode = 0;
    uint64_t bigInt[] = {1, 2, 3, 4, 5};
    int sign = 1;
    errCode = OH_Value_PutUnlimitedInt(value, sign, bigInt, sizeof(bigInt) / sizeof(bigInt[0]));
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Value_PutUnlimitedInt is fail.");
   
    OH_ColumnType columnType;
    errCode = OH_Value_GetType(value, &columnType);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Value_GetType is fail.");
    NAPI_ASSERT(env, columnType == OH_ColumnType::TYPE_UNLIMITED_INT, "OH_Value_GetType is fail.");
    int sign1 = 4;
    errCode = OH_Value_PutUnlimitedInt(value, sign1, bigInt, sizeof(bigInt) / sizeof(bigInt[0]));
    NAPI_ASSERT(env, errCode == RDB_E_INVALID_ARGS, "OH_Value_PutUnlimitedInt is fail.");

    errCode = OH_Value_Destroy(value);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Value_Destroy is fail.");
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
static napi_value OH_Rdb_ErrCode_0100(napi_env env, napi_callback_info)
{
    int errCode = 14800002;
    NAPI_ASSERT(env, errCode == RDB_E_CANNOT_UPDATE_READONLY, "RDB_E_CANNOT_UPDATE_READONLY is fail.");

    int errCode1 = 14800003;
    NAPI_ASSERT(env, errCode1 == RDB_E_REMOVE_FILE, "RDB_E_REMOVE_FILE is fail.");

    int errCode2 = 14800006;
    NAPI_ASSERT(env, errCode2 == RDB_E_EMPTY_VALUES_BUCKET, "RDB_E_EMPTY_VALUES_BUCKET is fail.");

    int errCode3 = 14800007;
    NAPI_ASSERT(env, errCode3 == RDB_E_EXECUTE_IN_STEP_QUERY, "RDB_E_EXECUTE_IN_STEP_QUERY is fail.");

    int errCode4 = 14800010;
    NAPI_ASSERT(env, errCode4 == RDB_E_EMPTY_FILE_NAME, "RDB_E_EMPTY_FILE_NAME is fail.");

    int errCode5 = 14800011;
    NAPI_ASSERT(env, errCode5 == RDB_E_INVALID_FILE_PATH, "RDB_E_INVALID_FILE_PATH is fail.");

    int errCode6 = 14800012;
    NAPI_ASSERT(env, errCode6 == RDB_E_TRANSACTION_IN_EXECUTE, "RDB_E_TRANSACTION_IN_EXECUTE is fail.");

    int errCode7 = 14800013;
    NAPI_ASSERT(env, errCode7 == RDB_E_INVALID_STATEMENT, "RDB_E_INVALID_STATEMENT is fail.");

    int errCode8 = 14800014;
    NAPI_ASSERT(env, errCode8 == RDB_E_EXECUTE_WRITE_IN_READ_CONNECTION, "RDB_E_EXECUTE_WRITE_IN_READ_CONNECTION is fail.");

    int errCode9 = 14800015;
    NAPI_ASSERT(env, errCode9 == RDB_E_BEGIN_TRANSACTION_IN_READ_CONNECTION, "RDB_E_BEGIN_TRANSACTION_IN_READ_CONNECTION is fail.");

    int errCodeValue = 14800017;
    NAPI_ASSERT(env, errCodeValue == RDB_E_MORE_STEP_QUERY_IN_ONE_SESSION, "RDB_E_MORE_STEP_QUERY_IN_ONE_SESSION is fail.");

    int errCodeValue1 = 14800019;
    NAPI_ASSERT(env, errCodeValue1 == RDB_E_INVALID_BIND_ARGS_COUNT, "RDB_E_INVALID_BIND_ARGS_COUNT is fail.");

    int errCodeValue2 = 14800021;
    NAPI_ASSERT(env, errCodeValue2 == RDB_E_INVALID_CONFLICT_FLAG, "RDB_E_INVALID_CONFLICT_FLAG is fail.");

    int errCodeValue3 = 14800022;
    NAPI_ASSERT(env, errCodeValue3 == RDB_E_HAVING_CLAUSE_NOT_IN_GROUP_BY, "RDB_E_HAVING_CLAUSE_NOT_IN_GROUP_BY is fail.");

    int errCodeValue4 = 14800023;
    NAPI_ASSERT(env, errCodeValue4 == RDB_E_NOT_SUPPORTED_BY_STEP_RESULT_SET, "RDB_E_NOT_SUPPORTED_BY_STEP_RESULT_SET is fail.");

    int errCodeValue5 = 14800024;
    NAPI_ASSERT(env, errCodeValue5 == RDB_E_STEP_RESULT_SET_CROSS_THREADS, "RDB_E_STEP_RESULT_SET_CROSS_THREADS is fail.");

    int errCodeValue6 = 14800025;
    NAPI_ASSERT(env, errCodeValue6 == RDB_E_STEP_RESULT_QUERY_NOT_EXECUTED, "RDB_E_STEP_RESULT_QUERY_NOT_EXECUTED is fail.");

    int errCodeValue7 = 14800027;
    NAPI_ASSERT(env, errCodeValue7 == RDB_E_STEP_RESULT_QUERY_EXCEEDED, "RDB_E_STEP_RESULT_QUERY_EXCEEDED is fail.");

    int errCodeValue8 = 14800028;
    NAPI_ASSERT(env, errCodeValue8 == RDB_E_STATEMENT_NOT_PREPARED, "RDB_E_STATEMENT_NOT_PREPARED is fail.");

    int errCodeValue9 = 14800029;
    NAPI_ASSERT(env, errCodeValue9 == RDB_E_EXECUTE_RESULT_INCORRECT, "RDB_E_EXECUTE_RESULT_INCORRECT is fail.");

    int errCodeVal = 14800031;
    NAPI_ASSERT(env, errCodeVal == RDB_E_RELATIVE_PATH, "RDB_E_RELATIVE_PATH is fail.");

    int errCodeVal1 = 14800032;
    NAPI_ASSERT(env, errCodeVal1 == RDB_E_EMPTY_NEW_ENCRYPT_KEY, "RDB_E_EMPTY_NEW_ENCRYPT_KEY is fail.");

    int errCodeVal2 = 14800033;
    NAPI_ASSERT(env, errCodeVal2 == RDB_E_CHANGE_UNENCRYPTED_TO_ENCRYPTED, "RDB_E_CHANGE_UNENCRYPTED_TO_ENCRYPTED is fail.");

    int errCodeVal3 = 14800034;
    NAPI_ASSERT(env, errCodeVal3 == RDB_E_CHANGE_ENCRYPT_KEY_IN_BUSY, "RDB_E_CHANGE_ENCRYPT_KEY_IN_BUSY is fail.");

    int errCodeVal4 = 14800035;
    NAPI_ASSERT(env, errCodeVal4 == RDB_E_STEP_STATEMENT_NOT_INIT, "RDB_E_STEP_STATEMENT_NOT_INIT is fail.");

    int errCodeVal5 = 14800038;
    NAPI_ASSERT(env, errCodeVal5 == RDB_E_SQLITE_SQL_BUILDER_NORMALIZE_FAIL, "RDB_E_SQLITE_SQL_BUILDER_NORMALIZE_FAIL is fail.");

    int errCodeVal6 = 14800039;
    NAPI_ASSERT(env, errCodeVal6 == RDB_E_STORE_SESSION_NOT_GIVE_CONNECTION_TEMPORARILY, "RDB_E_STORE_SESSION_NOT_GIVE_CONNECTION_TEMPORARILY is fail.");

    int errCodeVal7 = 14800040;
    NAPI_ASSERT(env, errCodeVal7 == RDB_E_STORE_SESSION_NO_CURRENT_TRANSACTION, "RDB_E_STORE_SESSION_NO_CURRENT_TRANSACTION is fail.");

    int errCodeVal8 = 14800041;
    NAPI_ASSERT(env, errCodeVal8 == RDB_E_NOT_SUPPORT, "RDB_E_NOT_SUPPORT is fail.");

    int errCodeVal9 = 14800042;
    NAPI_ASSERT(env, errCodeVal9 == RDB_E_INVALID_PARCEL, "RDB_E_INVALID_PARCEL is fail.");

    int errCodeVa = 14800043;
    NAPI_ASSERT(env, errCodeVa == RDB_E_QUERY_IN_EXECUTE, "RDB_E_QUERY_IN_EXECUTE is fail.");

    int errCodeVa1 = 14800044;
    NAPI_ASSERT(env, errCodeVa1 == RDB_E_SET_PERSIST_WAL, "RDB_E_SET_PERSIST_WAL is fail.");

    int errCodeVa2 = 14800045;
    NAPI_ASSERT(env, errCodeVa2 == RDB_E_DB_NOT_EXIST, "RDB_E_DB_NOT_EXIST is fail.");

    int errCodeVa3 = 14800046; 
    NAPI_ASSERT(env, errCodeVa3 == RDB_E_ARGS_READ_CON_OVERLOAD, "RDB_E_ARGS_READ_CON_OVERLOAD is fail.");

    int errCodeVa4 = 14800047;
    NAPI_ASSERT(env, errCodeVa4 == RDB_E_WAL_SIZE_OVER_LIMIT, "RDB_E_WAL_SIZE_OVER_LIMIT is fail.");

    int errCodeVa5 = 14800048;
    NAPI_ASSERT(env, errCodeVa5 == RDB_E_CON_OVER_LIMIT, "RDB_E_CON_OVER_LIMIT is fail.");

    int errCodeVa6 = 14800053;
    NAPI_ASSERT(env, errCodeVa6 == RDB_E_SQLITE_PERM, "RDB_E_SQLITE_PERM is fail.");

    int errCodeVa7 = 14800055;
    NAPI_ASSERT(env, errCodeVa7 == RDB_E_SQLITE_LOCKED, "RDB_E_SQLITE_LOCKED is fail.");

    int errCodeVa8 = 14800056;
    NAPI_ASSERT(env, errCodeVa8 == RDB_E_SQLITE_NOMEM, "RDB_E_SQLITE_NOMEM is fail.");

    int errCodeVa9 = 14800057;
    NAPI_ASSERT(env, errCodeVa9 == RDB_E_SQLITE_READONLY, "RDB_E_SQLITE_READONLY is fail.");

    int errCodeVb = 14800058;
    NAPI_ASSERT(env, errCodeVb == RDB_E_SQLITE_IOERR, "RDB_E_SQLITE_IOERR is fail.");

    int errCodeVb1 = 14800059;
    NAPI_ASSERT(env, errCodeVb1 == RDB_E_SQLITE_FULL, "RDB_E_SQLITE_FULL is fail.");

    int errCodeVb2 = 14800060;
    NAPI_ASSERT(env, errCodeVb2 == RDB_E_SQLITE_CANT_OPEN, "RDB_E_SQLITE_CANT_OPEN is fail.");

    int errCodeVb3 = 14800061;
    NAPI_ASSERT(env, errCodeVb3 == RDB_E_SQLITE_TOO_BIG, "RDB_E_SQLITE_TOO_BIG is fail.");

    int errCodeVb4 = 14800062;
    NAPI_ASSERT(env, errCodeVb4 == RDB_E_SQLITE_MISMATCH, "RDB_E_SQLITE_MISMATCH is fail.");

    int errCodeVb5 = 14800066;
    NAPI_ASSERT(env, errCodeVb5 == RDB_E_SUB_LIMIT_REACHED, "RDB_E_SUB_LIMIT_REACHED is fail.");

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "OH_Rdb_Predicates_NotLike0100", nullptr, OH_Rdb_Predicates_NotLike0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Predicates_Glob0100", nullptr, OH_Rdb_Predicates_Glob0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Predicates_NotGlob0100", nullptr, OH_Rdb_Predicates_NotGlob0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Predicates_Having0100", nullptr, OH_Rdb_Predicates_Having0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_SetCryptoParam0100", nullptr, OH_Rdb_SetCryptoParam0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_InsertWithConflictResolution0100", nullptr, OH_Rdb_InsertWithConflictResolution0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_UpdateWithConflictResolution0100", nullptr, OH_Rdb_UpdateWithConflictResolution0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Attach0100", nullptr, OH_Rdb_Attach0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Detach0100", nullptr, OH_Rdb_Detach0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_Setlocale0100", nullptr, OH_Rdb_Setlocale0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_LockRow_0100", nullptr, OH_Rdb_LockRow_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_CreateTransaction_0100", nullptr, OH_Rdb_CreateTransaction_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_NotSupport0100", nullptr, OH_Rdb_NotSupport0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_ColumnType_0100", nullptr, OH_Rdb_ColumnType_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_Rdb_ErrCode_0100", nullptr, OH_Rdb_ErrCode_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "interfacetest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

