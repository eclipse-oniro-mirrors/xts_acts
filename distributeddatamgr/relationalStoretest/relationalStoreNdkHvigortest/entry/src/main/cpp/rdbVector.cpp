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
#include <iostream>
#include <unistd.h>
#include "napi/native_api.h"
#include "hilog/log.h"
#include <string>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <cstdint>
#include "common.h"
#include <sys/stat.h>
#include <sys/types.h>
#include "database/data/oh_data_value.h"
#include "database/data/oh_data_values.h"
#include "database/data/oh_data_values_buckets.h"
#include "database/rdb/relational_store.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/oh_rdb_transaction.h"
#include "database/rdb/relational_store_error_code.h"
#include "database/rdb/oh_values_bucket.h"
#include "database/data/data_asset.h"
#include "database/rdb/oh_value_object.h"
#include "database/rdb/oh_rdb_types.h"
#include "database/rdb/oh_predicates.h"
#include "database/rdb/oh_cursor.h"

#define DIRMODE 0770

const char *TAG = "transaction_ctest";
const char *RDB_TEST_PATH = "/data/storage/el2/database/com.example.buchongndktest/entry/";
static OH_Rdb_Store *g_transStore;
static OH_RDB_TransOptions *g_options;
static OH_Rdb_Config config_;
OH_Rdb_Store *store_;
float test_[] = { 1.2, 2.3 };

static OH_Rdb_ConfigV2 *InitRdbConfig(napi_env env)
{
    OH_Rdb_ConfigV2 *config = OH_Rdb_CreateConfig();
    NAPI_ASSERT(env, config != nullptr, "OH_Rdb_ExecuteQueryV2 is fail.");
    OH_Rdb_SetDatabaseDir(config, RDB_TEST_PATH);
    OH_Rdb_SetStoreName(config, "rdb_vector_test.db");
    OH_Rdb_SetBundleName(config, "com.ohos.example.distributedndk");
    OH_Rdb_SetEncrypted(config, false);
    OH_Rdb_SetSecurityLevel(config, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(config, RDB_SECURITY_AREA_EL1);
    NAPI_ASSERT(env, OH_Rdb_ErrCode::RDB_OK == OH_Rdb_SetDbType(config, RDB_CAYLEY), "OH_Rdb_ExecuteQueryV2 is fail.");
    return config;
}

static void InitRdbConfig()
{
    config_.dataBaseDir = RDB_TEST_PATH;
        config_.storeName = "rdb_store_test.db";
        config_.bundleName = "com.example.buchongndktest";
        config_.moduleName = "";
        config_.securityLevel = OH_Rdb_SecurityLevel::S1;
        config_.isEncrypt = false;
        config_.selfSize = sizeof(OH_Rdb_Config);
        config_.area = RDB_SECURITY_AREA_EL1;
}




static napi_value OH_Cursor_GetFloatVectorCount0100(napi_env env, napi_callback_info info)
{
    char querySql[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    OH_Values_PutInt(values, 1);
    OH_Cursor *cursor = OH_Rdb_ExecuteQueryV2(store_, querySql, values);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_ExecuteQueryV21 is fail.");
    int rowCount = 0;
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount1 is fail.");
    
    float test[2] = { 5.5, 6.6 };
    OH_Data_Values *values1 = OH_Values_Create();
    OH_Values_PutFloatVector(values1, test, 2);
    OH_Values_PutInt(values1, 1);
    auto errCode = OH_Rdb_ExecuteV2(store_, "update test set data1 = ? where id = ?", values1, nullptr);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_ExecuteV2 is fail.");

    cursor = OH_Rdb_ExecuteQueryV2(store_, querySql, values);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_ExecuteQueryV22 is fail.");
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 1, "getRowCount2 is fail.");
    cursor->goToNextRow(cursor);
    size_t count = 0;
    errCode = OH_Cursor_GetFloatVectorCount(cursor, 1, &count);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Cursor_GetFloatVectorCount is fail.");
    float test1[count];
    size_t outLen;
    OH_Cursor_GetFloatVector(cursor, 1, test1, count, &outLen);
    NAPI_ASSERT(env, outLen == 2, "OH_Cursor_GetFloatVector is fail.");
    NAPI_ASSERT(env, test1[0] == test[0], "OH_Cursor_GetFloatVector is fail.");
    NAPI_ASSERT(env, test1[1] == test[1], "OH_Cursor_GetFloatVector is fail.");
    errCode = OH_Rdb_ExecuteV2(store_, "delete from test where id = ?", values, nullptr);
    NAPI_ASSERT(env, errCode == RDB_OK, "OH_Rdb_ExecuteV23 is fail.");
    cursor = OH_Rdb_ExecuteQueryV2(store_, querySql, values);
    NAPI_ASSERT(env, cursor != NULL, "OH_Rdb_ExecuteQueryV22 is fail.");
    cursor->getRowCount(cursor, &rowCount);
    NAPI_ASSERT(env, rowCount == 0, "getRowCount3 is fail.");
    OH_Values_Destroy(values);
    OH_Values_Destroy(values1);
    int returnCode = 0;
    napi_value result;
    napi_create_int32(env, returnCode, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "OH_Cursor_GetFloatVectorCount0100", nullptr, OH_Cursor_GetFloatVectorCount0100, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "rdbvector",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}





