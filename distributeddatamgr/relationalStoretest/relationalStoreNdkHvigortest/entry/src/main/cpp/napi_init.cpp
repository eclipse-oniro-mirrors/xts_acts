/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "common.h"
#include <sys/stat.h>
#include <string>
#include "database/rdb/relational_store.h"
#include "database/rdb/relational_store_error_code.h"

#define DIRMODE 0770
const char *TAG = "testLog";
static  const char *RDB_TEST_PATH = "/data/storage/el2/database/ohos.acts.relationalstorendktesthvigor/entry/";

static void InitRdbConfigV2(OH_Rdb_ConfigV2 *configV2)
{
    OH_Rdb_SetDatabaseDir(configV2, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(configV2, "rdb_store_test.db");
    OH_Rdb_SetBundleName(configV2, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(configV2, "module");
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_SQLITE);
}

static napi_value OH_Rdb_CreateConfig_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_CreateConfig_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_CreateConfig_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_CreateConfig_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDatabaseDir is fail.");
    errcode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetStoreName is fail.");
    errcode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetBundleName is fail.");
    errcode = OH_Rdb_SetModuleName(config, "module");
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetModuleName is fail.");
    errcode = OH_Rdb_SetEncrypted(config, false);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetEncrypted is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel is fail.");
    errcode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea is fail.");
    errcode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDbType is fail.");
    
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_0100 ------------- ");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    
    errCode = OH_Rdb_SetDbType(config, Rdb_DBType::RDB_SQLITE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetDbType RDB_SQLITE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDbType RDB_SQLITE is fail.");
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_0100 ------------- ");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);

    errCode = OH_Rdb_SetDbType(config, Rdb_DBType::DBTYPE_BUTT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetDbType DBTYPE_BUTT   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDbType DBTYPE_BUTT is fail.");
    
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_GetSupportedDbType_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_GetSupportedDbType_0100 ------------- ");
    
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    
    errCode = OH_Rdb_SetDbType(config, Rdb_DBType::RDB_SQLITE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetDbType RDB_SQLITE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDbType RDB_SQLITE is fail.");
    
    int numType = 0;
    int numLan = 1;
    int numHuang = 2;
    const int *supportTypeList = OH_Rdb_GetSupportedDbType(&numType);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_GetSupportedDbType    numType= %{public}d", numType);
    NAPI_ASSERT(env, supportTypeList != nullptr, "OH_Rdb_GetSupportedDbType 1 is fail.");
    NAPI_ASSERT(env, (numType == numLan) || (numType == numHuang), "OH_Rdb_GetSupportedDbType numType is fail.");
    NAPI_ASSERT(env, supportTypeList[0] == Rdb_DBType::RDB_SQLITE, "OH_Rdb_GetSupportedDbType RDB_SQLITE is fail.");
    
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0100 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);

    char createTableSql[] = "CREATE TABLE store_test (id INTEGER PRIMARY KEY AUTOINCREMENT, data1 TEXT, data2 INTEGER, "
                            "data3 FLOAT, data4 BLOB, data5 TEXT);";
    errCode =OH_Rdb_Execute(storeConfigV2TestRdbStore, createTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute createTableSql is fail.");

    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(storeConfigV2TestRdbStore, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CloseStore is fail.");
    errCode = OH_Rdb_DeleteStoreV2(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DeleteStoreV2 is fail.");
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0200  OH_Rdb_CommitByTrxId -------- ");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);

    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, createTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId 111 is fail.");
    int64_t trxId = 0;
    errCode = OH_Rdb_BeginTransWithTrxId(store, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_BeginTransWithTrxId 222 is fail.");

    char insertSql[] = "INSERT INTO t1 VALUES(2, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxId, insertSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");
    errCode = OH_Rdb_CommitByTrxId(store, trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_CommitByTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_CommitByTrxId is fail.");
    char querySql[] = "SELECT * FROM t1;";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");

    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount rowCount is fail.");
    cursor->destroy(cursor);
    char dropSql[] = "DROP TABLE IF EXISTS t1;";
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, dropSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");
    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);

    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0300 OH_Rdb_RollBackByTrxId ------- ");
    int64_t trxId = 0;
    int64_t trxIderr = 0;
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);

    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxIderr, createTableSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId CREATE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId 111 is fail.");
    
    errCode = OH_Rdb_BeginTransWithTrxId(store, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_BeginTransWithTrxId 222 is fail.");

    char insertSql[] = "INSERT INTO t1 VALUES(2, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxId, insertSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId INSERT  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    errCode = OH_Rdb_RollBackByTrxId(store, trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_RollBackByTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId is fail.");

    char querySql[] = "SELECT * FROM t1;";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount rowCount is fail.");
    cursor->destroy(cursor);
    char dropSql[] = "DROP TABLE IF EXISTS t1;";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxId, dropSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");
    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);

    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_Id_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0300 Trxid=-1  ------------- ");
    int64_t trxId = 2;
    int64_t trxIderr = -1;
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);

    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxIderr, createTableSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId CREATE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId 111 is fail.");

    errCode = OH_Rdb_BeginTransWithTrxId(store, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_BeginTransWithTrxId 222 is fail.");
    char insertSql[] = "INSERT INTO t1 VALUES(2, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxIderr, insertSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId INSERT  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    errCode = OH_Rdb_RollBackByTrxId (store, trxIderr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_RollBackByTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId is fail.");
    char querySql[] = "SELECT * FROM t1;";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount rowCount is fail.");
    cursor->destroy(cursor);
    char dropSql[] = "DROP TABLE IF EXISTS t1;";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxIderr, dropSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");

    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);

    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_SQLITE_Id_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_SQLITE_0300 Trxid=2  ------------- ");
    int64_t trxId = 2;
    int64_t trxIderr = 2;
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxIderr, createTableSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId CREATE   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId 111 is fail.");
    
    errCode = OH_Rdb_BeginTransWithTrxId(store, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_BeginTransWithTrxId 222 is fail.");

    char insertSql[] = "INSERT INTO t1 VALUES(2, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxIderr, insertSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_ExecuteByTrxId INSERT  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");
    errCode = OH_Rdb_RollBackByTrxId (store, trxIderr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_RollBackByTrxId 222  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId is fail.");
    char querySql[] = "SELECT * FROM t1;";
    OH_Cursor *cursor = OH_Rdb_ExecuteQuery(store, querySql);
    NAPI_ASSERT(env, cursor != nullptr, "OH_Rdb_ExecuteQuery is fail.");
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount rowCount is fail.");
    cursor->destroy(cursor);
    char dropSql[] = "DROP TABLE IF EXISTS t1;";
    errCode = OH_Rdb_ExecuteByTrxId(store, trxIderr, dropSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId is fail.");
    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);

    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetDatabaseDir(NULL, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDatabaseDir err 1 is fail.");
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetDatabaseDir(nullptr, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDatabaseDir err 2 is fail.");
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetDatabaseDir(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDatabaseDir err 3 is fail.");
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0400 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetDatabaseDir(config, nullptr);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDatabaseDir err 4 is fail.");
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0500 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0600 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, "/data");
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore == nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}


static napi_value OH_Rdb_SetDatabaseDir_Param_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0700 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, "");
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore == nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}


static napi_value OH_Rdb_SetDatabaseDir_Param_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0800 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, " ");
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore == nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_0900 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, "/");
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore == nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDatabaseDir_Param_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDatabaseDir_Param_1000 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, "*&^%$#@!*(()-");
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore == nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetStoreName(NULL, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetStoreName err 1 is fail.");
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetStoreName(nullptr, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetStoreName err 2 is fail.");
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetStoreName(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetStoreName err 3 is fail.");
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0400 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetStoreName(config, nullptr);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetStoreName err 4 is fail.");
    errcode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0500 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "aaaaa");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0600 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    int strLen = 50;
    std::string strname(strLen, 'n');
    errCode = OH_Rdb_SetStoreName(config, strname.c_str());
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0700 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore == nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0800 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, " ");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_0900 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "/");   //"*&^%$#@!*(()-");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore == nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetStoreName_Param_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetStoreName_Param_1000 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "*&^%$#@!*(()-");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);

    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");

    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}


static napi_value OH_Rdb_SetBundleName_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetBundleName(NULL, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetBundleName err 1 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetBundleName(nullptr, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetBundleName err 2 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetBundleName(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetBundleName err 3 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0400 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetBundleName(config, nullptr);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetBundleName err 4 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0500 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "aaaaa");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0600 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    int strLen = 50;
    std::string strname(strLen, 'n');
    errCode = OH_Rdb_SetBundleName(config, strname.c_str());
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}


static napi_value OH_Rdb_SetBundleName_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0700 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0800 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, " ");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_0900 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "/");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetBundleName_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetBundleName_1000 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "_!@#%^*&*(()_+((&^%$%");
    errCode = OH_Rdb_SetModuleName(config, "module");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetModuleName(NULL, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetModuleName err 1 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetModuleName(nullptr, RDB_TEST_PATH);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetModuleName err 2 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetModuleName(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetModuleName err 3 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_0400 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetModuleName(config, nullptr);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetModuleName err 4 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_0500 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "aaaaa");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_0600 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    int strLen = 50;
    std::string strname(strLen, 'n');
    errCode = OH_Rdb_SetModuleName(config, strname.c_str());
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_0700 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_0800 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, " ");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_0900 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "/");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetModuleName_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetModuleName_1000 ------------- ");
    int errCode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errCode = OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    errCode = OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    errCode = OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    errCode = OH_Rdb_SetModuleName(config, "_!@#%^*&*(()_+((&^%$%");
    errCode = OH_Rdb_SetEncrypted(config, false);
    errCode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    errCode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    errCode = OH_Rdb_SetDbType(config, RDB_SQLITE);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto storeConfigV2TestRdbStore = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, storeConfigV2TestRdbStore != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_CloseStore(storeConfigV2TestRdbStore);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_CreateConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetEncrypted_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetEncrypted_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    errcode = OH_Rdb_SetEncrypted(NULL, false);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetEncrypted err 1 is fail.");
    errcode = OH_Rdb_SetEncrypted(nullptr, false);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetEncrypted err 2 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetEncrypted_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetEncrypted_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    
    errcode = OH_Rdb_SetEncrypted(config, NULL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetEncrypted(config, NULL) err 3 errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetEncrypted(config, NULL) err 3 is fail.");
    errcode = OH_Rdb_SetEncrypted(config, "false");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetEncrypted err 4   errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetEncrypted err 4 is fail.");
    errcode = OH_Rdb_SetEncrypted(config, "");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetEncrypted err 5   errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetEncrypted err 5 is fail.");
    errcode = OH_Rdb_SetEncrypted(config, " ");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetEncrypted err 6   errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetEncrypted err 6 is fail.");
    errcode = OH_Rdb_SetEncrypted(config, 0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetEncrypted err 7   errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetEncrypted err 7 is fail.");
    errcode = OH_Rdb_SetEncrypted(config, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetEncrypted err 8   errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetEncrypted err 8 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetEncrypted_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetEncrypted_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_store_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetModuleName(config, "module");
    
    errcode = OH_Rdb_SetEncrypted(config, false);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetEncrypted err 7   errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetEncrypted  7 is fail.");
    errcode = OH_Rdb_SetEncrypted(config, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_SetEncrypted err 7   errcode= %{public}d", errcode);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetModuleName 8 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetSecurityLevel_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetSecurityLevel_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetSecurityLevel(NULL, OH_Rdb_SecurityLevel::S1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetSecurityLevel NULL err  is fail.");
    errcode = OH_Rdb_SetSecurityLevel(nullptr, OH_Rdb_SecurityLevel::S1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetSecurityLevel nullptr err is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig  is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetSecurityLevel_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetSecurityLevel_0200 ------------- ");
    int errcode = 0;
    int level1f = -1;
    int level0 = 0;
    int level5 = 5;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetSecurityLevel NULL err is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, level1f);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetSecurityLevel err -1 is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, level0);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetSecurityLevel err 0 is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, level5);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetSecurityLevel err 5 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig  is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetSecurityLevel_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetSecurityLevel_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    int level1 = 1;
    int level2 = 2;
    int level3 = 3;
    int level4 = 4;
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, level1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel 1 is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, level2);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel 2 is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, level3);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel 3 is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, level4);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel 4 is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel S1 is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S2);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel S2 is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S3);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel S3 is fail.");
    errcode = OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S4);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetSecurityLevel S4 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig  is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetArea_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetArea_0100 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errcode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 1 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetArea_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetArea_0200 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errcode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL2);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 2 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetArea_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetArea_0300 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errcode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL3);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 3 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetArea_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetArea_0400 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errcode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL4);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 4 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetArea_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetArea_0500 ------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    errcode = OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL5);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 5 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetArea_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetArea_Param_0100 param err------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetArea(NULL, 1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetArea (NULL, 1) is fail.");
    errcode = OH_Rdb_SetArea(nullptr, 1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetArea (nullptr, 1) is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetArea_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetArea_Param_0200 param err------------- ");
    int errcode = 0;
    int area1 = -1;
    int area2 = 0;
    int area3 = 6;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetArea(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetArea (config, NULL)  is fail.");
    errcode = OH_Rdb_SetArea(config, area1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetArea -1 is fail.");
    errcode = OH_Rdb_SetArea(config, area2);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetArea 0 is fail.");
    errcode = OH_Rdb_SetArea(config, area3);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetArea 0 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetArea_Param_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetArea_Param_0300 param err------------- ");
    int errcode = 0;
    int area1 = 1;
    int area2 = 2;
    int area3 = 3;
    int area4 = 4;
    int area5 = 5;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetArea(config, area1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 1 is fail.");
    errcode = OH_Rdb_SetArea(config, area2);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 2 is fail.");
    errcode = OH_Rdb_SetArea(config, area3);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 3 is fail.");
    errcode = OH_Rdb_SetArea(config, area4);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 4 is fail.");
    errcode = OH_Rdb_SetArea(config, area5);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetArea 5 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, errcode, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_Param_0100 param err------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetDbType(config, 1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_SetDbType 1 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_Param_0200 param err------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    errcode = OH_Rdb_SetDbType(NULL, 1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDbType(NULL, 1)  is fail.");
    errcode = OH_Rdb_SetDbType(nullptr, 1);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDbType(nullptr, 1) is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OH_Rdb_SetDbType_Param_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_SetDbType_Param_0300 param err------------- ");
    int errcode = 0;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    int type3 = 3;
    int type4 = 4;
    int type0 = 0;
    int type1f = -1;
    errcode = OH_Rdb_SetDbType(config, NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDbType(config, NULL)  is fail.");
    errcode = OH_Rdb_SetDbType(config, type3);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDbType 3 is fail.");
    errcode = OH_Rdb_SetDbType(config, type4);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDbType 4 is fail.");
    errcode = OH_Rdb_SetDbType(config, type0);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDbType 0 is fail.");
    errcode = OH_Rdb_SetDbType(config, type1f);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_SetDbType -1 is fail.");
    errcode = OH_Rdb_DestroyConfig (config);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_DestroyConfig is fail.");
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OH_Rdb_GetSupportedDbType_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_GetSupportedDbType_Param_0100 ------------- ");
    int errCode = 0;
    const int *supportTypeList = OH_Rdb_GetSupportedDbType(NULL);
    NAPI_ASSERT(env, supportTypeList == nullptr, "OH_Rdb_GetSupportedDbType 1 is fail.");
    supportTypeList = OH_Rdb_GetSupportedDbType(nullptr);
    NAPI_ASSERT(env, supportTypeList == nullptr, "OH_Rdb_GetSupportedDbType 1 is fail.");
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_DestroyConfig_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_DestroyConfig_Param_0100 ------------- ");
    int errcode = 0;
    errcode = OH_Rdb_DestroyConfig(NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_DestroyConfig(NULL)  is fail.");
    errcode = OH_Rdb_DestroyConfig(nullptr);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_DestroyConfig(nullptr)  is fail.");
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OH_Rdb_CreateOrOpen_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_CreateOrOpen_Param_0100 ------------- ");
    int errcode = 0;
    auto store = OH_Rdb_CreateOrOpen(NULL, &errcode);
    NAPI_ASSERT(env, store == nullptr, "OH_Rdb_CreateOrOpen NULL is fail.");
    auto store2 = OH_Rdb_CreateOrOpen(nullptr, &errcode);
    NAPI_ASSERT(env, store2 == nullptr, "OH_Rdb_CreateOrOpen  nullptr is fail.");
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OH_Rdb_DeleteStoreV2_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_DeleteStoreV2_Param_0100 ------------- ");
    int errcode = 0;
    errcode = OH_Rdb_DeleteStoreV2(NULL);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_DeleteStoreV2(NULL)  is fail.");
    errcode = OH_Rdb_DeleteStoreV2(nullptr);
    NAPI_ASSERT(env, errcode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_DeleteStoreV2(nullptr)  is fail.");
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OH_Rdb_ExecuteByTrxId_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_ExecuteByTrxId_Param_0100   ------------- ");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");

    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    
    errCode = OH_Rdb_ExecuteByTrxId(NULL, 0, createTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_ExecuteByTrxId NULL is fail.");
    errCode = OH_Rdb_ExecuteByTrxId(nullptr, 0, createTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_ExecuteByTrxId nullptr is fail.");
    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_ExecuteByTrxId_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_ExecuteByTrxId_Param_0200   ------------- ");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");

    int64_t id1f = -1;
    int64_t id1 = 1;
    int64_t id2 = 2;
    char createTableSql[] = "CREATE TABLE t1(id INT PRIMARY KEY, repr floatvector(4));";
    errCode = OH_Rdb_ExecuteByTrxId(store, NULL, createTableSql);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OOH_Rdb_ExecuteByTrxId(store, NULL   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId(store, NULL  is fail.");
    char insertSql10[] = "INSERT INTO t1 VALUES(10, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, insertSql10);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId insertSql10 is fail.");
    char insertSql1[] = "INSERT INTO t1 VALUES(1, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, insertSql1);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId insertSql1 is fail.");
    char insertSql2[] = "INSERT INTO t1 VALUES(2, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, id1f, insertSql2);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId insertSql2 -1 is fail.");
    char insertSql3[] = "INSERT INTO t1 VALUES(3, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, id1, insertSql3);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId insertSql3 1 is fail.");
    char insertSql4[] = "INSERT INTO t1 VALUES(4, '[1, 2, 3, 4]');";
    errCode = OH_Rdb_ExecuteByTrxId(store, id2, insertSql4);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_ExecuteByTrxId insertSql4 2 is fail.");
    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_ExecuteByTrxId_Param_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_ExecuteByTrxId_Param_0300   ------------- ");

    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, "");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OOH_Rdb_ExecuteByTrxId sql err 1   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::E_BASE, "OH_Rdb_ExecuteByTrxId sql err 1  is fail.");
    errCode = OH_Rdb_ExecuteByTrxId(store, 0, "createTableSql");
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OOH_Rdb_ExecuteByTrxId sql err 2  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::E_BASE, "OH_Rdb_ExecuteByTrxId sql err 2 is fail.");
    
    char dropTableSql[] = "DROP TABLE IF EXISTS store_test";
    errCode =OH_Rdb_Execute(store, dropTableSql);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_OK, "OH_Rdb_Execute  dropTableSql is fail.");
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}


static napi_value OH_Rdb_BeginTransWithTrxId_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_BeginTransWithTrxId_Param_0100   ------------- ");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    int64_t trxId = 2;
    errCode = OH_Rdb_BeginTransWithTrxId(NULL, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId NULL  errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_BeginTransWithTrxId  NULL is fail.");
    errCode = OH_Rdb_BeginTransWithTrxId(nullptr, &trxId);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId nullptr   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_BeginTransWithTrxId nullptr is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OH_Rdb_BeginTransWithTrxId_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_BeginTransWithTrxId_Param_0200   ------------- ");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    int64_t trxId = 2;
    errCode = OH_Rdb_BeginTransWithTrxId(store, NULL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId nullptr   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_BeginTransWithTrxId  nullptr is fail.");
    errCode = OH_Rdb_BeginTransWithTrxId(store, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, "OH_Rdb_BeginTransWithTrxId nullptr   errcode= %{public}d", errCode);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_BeginTransWithTrxId  nullptr is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

static napi_value OH_Rdb_CommitByTrxId_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_CommitByTrxId_Param_0100   ------------- ");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    int64_t trxId = 2;
    errCode = OH_Rdb_CommitByTrxId(NULL, trxId);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_CommitByTrxId  NULL is fail.");
    errCode = OH_Rdb_CommitByTrxId(nullptr, trxId);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_CommitByTrxId  nullptr is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_CommitByTrxId_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_CommitByTrxId_Param_0200   ------------- ");

    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(config);
    
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    int64_t trxId1f = -1;
    int64_t trxId0 = 0;
    int64_t trxId1 = 1;
    int64_t trxId2 = 2;
    errCode = OH_Rdb_CommitByTrxId(store, NULL);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_CommitByTrxId NULL 2 is fail.");
    errCode = OH_Rdb_CommitByTrxId(store, trxId1f);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_CommitByTrxId  -1 is fail.");
    errCode = OH_Rdb_CommitByTrxId(store, trxId0);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_CommitByTrxId  0 is fail.");
    errCode = OH_Rdb_CommitByTrxId(store, trxId1);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_CommitByTrxId  1 is fail.");
    errCode = OH_Rdb_CommitByTrxId(store, trxId2);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_CommitByTrxId  2 is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_RollBackByTrxId_Param_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_RollBackByTrxId_Param_0100   ------------- ");
    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    int64_t trxId = 2;
    errCode = OH_Rdb_RollBackByTrxId(NULL, trxId);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_RollBackByTrxId  NULL is fail.");
    errCode = OH_Rdb_RollBackByTrxId(nullptr, trxId);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_INVALID_ARGS, "OH_Rdb_RollBackByTrxId  nullptr is fail.");
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_RollBackByTrxId_Param_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_RollBackByTrxId_Param_0200   ------------- ");

    int errCode = OH_Rdb_ErrCode::RDB_OK;
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_CreateConfig is fail.");
    InitRdbConfigV2(config);
    mkdir(RDB_TEST_PATH, DIRMODE);
    auto store = OH_Rdb_CreateOrOpen(config, &errCode);
    NAPI_ASSERT(env, store != nullptr, "OH_Rdb_CreateOrOpen is fail.");
    
    int64_t trxId1f = -1;
    int64_t trxId0 = 0;
    int64_t trxId1 = 1;
    int64_t trxId2 = 2;
    errCode = OH_Rdb_RollBackByTrxId(store, NULL);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId  NULL 2 is fail.");
    errCode = OH_Rdb_RollBackByTrxId(store, trxId1f);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId  -1 is fail.");
    errCode = OH_Rdb_RollBackByTrxId(store, trxId0);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId  0 is fail.");
    errCode = OH_Rdb_RollBackByTrxId(store, trxId1);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId  1 is fail.");
    errCode = OH_Rdb_RollBackByTrxId(store, trxId2);
    NAPI_ASSERT(env, errCode == OH_Rdb_ErrCode::RDB_E_NOT_SUPPORTED, "OH_Rdb_RollBackByTrxId  2 is fail.");
    
    errCode = OH_Rdb_CloseStore(store);
    errCode = OH_Rdb_DeleteStoreV2(config);
    errCode = OH_Rdb_DestroyConfig(config);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

static napi_value OH_Rdb_DBType_Enum_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, 0, TAG, " func OH_Rdb_DBType_Enum_0100 ------------- ");
    int res = 1;
    int res2 = 2;
    int res3 = 64;
    NAPI_ASSERT(env, res == Rdb_DBType::RDB_SQLITE, "RDB_SQLITE is fail.");
    NAPI_ASSERT(env, res2 == Rdb_DBType::RDB_CAYLEY, "RDB_CAYLEY is fail.");
    NAPI_ASSERT(env, res3 == Rdb_DBType::DBTYPE_BUTT, "DBTYPE_BUTT is fail.");
    napi_value ret;
    napi_create_int32(env, 0, &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OH_Rdb_CreateConfig_0100", nullptr, OH_Rdb_CreateConfig_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_CreateConfig_0200", nullptr, OH_Rdb_CreateConfig_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_0100", nullptr, OH_Rdb_SetDbType_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_0300", nullptr, OH_Rdb_SetDbType_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_GetSupportedDbType_0100", nullptr, OH_Rdb_GetSupportedDbType_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_0100", nullptr, OH_Rdb_SetDbType_SQLITE_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_0200", nullptr, OH_Rdb_SetDbType_SQLITE_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_0300", nullptr, OH_Rdb_SetDbType_SQLITE_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_Id_0100", nullptr, OH_Rdb_SetDbType_SQLITE_Id_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_SQLITE_Id_0200", nullptr, OH_Rdb_SetDbType_SQLITE_Id_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0100", nullptr, OH_Rdb_SetDatabaseDir_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0200", nullptr, OH_Rdb_SetDatabaseDir_Param_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0300", nullptr, OH_Rdb_SetDatabaseDir_Param_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0400", nullptr, OH_Rdb_SetDatabaseDir_Param_0400, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0500", nullptr, OH_Rdb_SetDatabaseDir_Param_0500, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0600", nullptr, OH_Rdb_SetDatabaseDir_Param_0600, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0700", nullptr, OH_Rdb_SetDatabaseDir_Param_0700, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0800", nullptr, OH_Rdb_SetDatabaseDir_Param_0800, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_0900", nullptr, OH_Rdb_SetDatabaseDir_Param_0900, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDatabaseDir_Param_1000", nullptr, OH_Rdb_SetDatabaseDir_Param_1000, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0100", nullptr, OH_Rdb_SetStoreName_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0200", nullptr, OH_Rdb_SetStoreName_Param_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0300", nullptr, OH_Rdb_SetStoreName_Param_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0400", nullptr, OH_Rdb_SetStoreName_Param_0400, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0500", nullptr, OH_Rdb_SetStoreName_Param_0500, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0600", nullptr, OH_Rdb_SetStoreName_Param_0600, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0700", nullptr, OH_Rdb_SetStoreName_Param_0700, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0800", nullptr, OH_Rdb_SetStoreName_Param_0800, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_0900", nullptr, OH_Rdb_SetStoreName_Param_0900, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetStoreName_Param_1000", nullptr, OH_Rdb_SetStoreName_Param_1000, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0100", nullptr, OH_Rdb_SetBundleName_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0200", nullptr, OH_Rdb_SetBundleName_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0300", nullptr, OH_Rdb_SetBundleName_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0400", nullptr, OH_Rdb_SetBundleName_0400, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0500", nullptr, OH_Rdb_SetBundleName_0500, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0600", nullptr, OH_Rdb_SetBundleName_0600, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0700", nullptr, OH_Rdb_SetBundleName_0700, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0800", nullptr, OH_Rdb_SetBundleName_0800, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_0900", nullptr, OH_Rdb_SetBundleName_0900, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetBundleName_1000", nullptr, OH_Rdb_SetBundleName_1000, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_0100", nullptr, OH_Rdb_SetModuleName_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_0200", nullptr, OH_Rdb_SetModuleName_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_0300", nullptr, OH_Rdb_SetModuleName_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_0400", nullptr, OH_Rdb_SetModuleName_0400, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_0500", nullptr, OH_Rdb_SetModuleName_0500, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_0600", nullptr, OH_Rdb_SetModuleName_0600, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_0700", nullptr, OH_Rdb_SetModuleName_0700, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_0800", nullptr, OH_Rdb_SetModuleName_0800, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_0900", nullptr, OH_Rdb_SetModuleName_0900, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetModuleName_1000", nullptr, OH_Rdb_SetModuleName_1000, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetEncrypted_0100", nullptr, OH_Rdb_SetEncrypted_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetEncrypted_0200", nullptr, OH_Rdb_SetEncrypted_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetEncrypted_0300", nullptr, OH_Rdb_SetEncrypted_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetSecurityLevel_0100", nullptr, OH_Rdb_SetSecurityLevel_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetSecurityLevel_0200", nullptr, OH_Rdb_SetSecurityLevel_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetSecurityLevel_0300", nullptr, OH_Rdb_SetSecurityLevel_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetArea_0100", nullptr, OH_Rdb_SetArea_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetArea_0200", nullptr, OH_Rdb_SetArea_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetArea_0300", nullptr, OH_Rdb_SetArea_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetArea_0400", nullptr, OH_Rdb_SetArea_0400, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetArea_0500", nullptr, OH_Rdb_SetArea_0500, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetArea_Param_0100", nullptr, OH_Rdb_SetArea_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetArea_Param_0200", nullptr, OH_Rdb_SetArea_Param_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetArea_Param_0300", nullptr, OH_Rdb_SetArea_Param_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_Param_0100", nullptr, OH_Rdb_SetDbType_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_Param_0200", nullptr, OH_Rdb_SetDbType_Param_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_SetDbType_Param_0300", nullptr, OH_Rdb_SetDbType_Param_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_GetSupportedDbType_Param_0100", nullptr, OH_Rdb_GetSupportedDbType_Param_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Rdb_DestroyConfig_Param_0100", nullptr, OH_Rdb_DestroyConfig_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_CreateOrOpen_Param_0100", nullptr, OH_Rdb_CreateOrOpen_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_DeleteStoreV2_Param_0100", nullptr, OH_Rdb_DeleteStoreV2_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_ExecuteByTrxId_Param_0100", nullptr, OH_Rdb_ExecuteByTrxId_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_ExecuteByTrxId_Param_0200", nullptr, OH_Rdb_ExecuteByTrxId_Param_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_ExecuteByTrxId_Param_0300", nullptr, OH_Rdb_ExecuteByTrxId_Param_0300, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_BeginTransWithTrxId_Param_0100", nullptr, OH_Rdb_BeginTransWithTrxId_Param_0100, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Rdb_BeginTransWithTrxId_Param_0200", nullptr, OH_Rdb_BeginTransWithTrxId_Param_0200, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OH_Rdb_CommitByTrxId_Param_0100", nullptr, OH_Rdb_CommitByTrxId_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_CommitByTrxId_Param_0200", nullptr, OH_Rdb_CommitByTrxId_Param_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_RollBackByTrxId_Param_0100", nullptr, OH_Rdb_RollBackByTrxId_Param_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_RollBackByTrxId_Param_0200", nullptr, OH_Rdb_RollBackByTrxId_Param_0200, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OH_Rdb_DBType_Enum_0100", nullptr, OH_Rdb_DBType_Enum_0100, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
