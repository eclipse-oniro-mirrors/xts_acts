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

#include "PredicatesTest.h"
#include "napi/native_api.h"
#include <database/rdb/oh_predicates.h>
#include <database/rdb/relational_store.h>
#include <database/rdb/relational_store_error_code.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>

void AddPredicatesTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOHPredicatesGlobOk", nullptr, TestOHPredicatesGlobOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOHPredicatesNotGlobOk", nullptr, TestOHPredicatesNotGlobOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOHPredicatesNotLikeOk", nullptr, TestOHPredicatesNotLikeOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"testOHPredicatesHavingOk", nullptr, TestOHPredicatesHavingOk, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
}

napi_value TestOHPredicatesGlobOk(napi_env env, napi_callback_info info)
{
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    if (!predicates) {
        return nullptr;
    }
    const char *data5Value = "aBCD*";
    int ret = OH_Predicates_Glob(predicates, "data5", data5Value);
    predicates->destroy(predicates);
    napi_value result;
    napi_create_int32(env, (ret == RDB_OK) ? 0 : -1, &result);
    return result;
}

napi_value TestOHPredicatesNotGlobOk(napi_env env, napi_callback_info info)
{
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    if (!predicates) {
        return nullptr;
    }
    const char *data5Value = "aBCD*";
    int ret = OH_Predicates_NotGlob(predicates, "data5", data5Value);

    napi_value result;
    napi_create_int32(env, (ret == RDB_OK) ? 0 : -1, &result);
    return result;
}

napi_value TestOHPredicatesNotLikeOk(napi_env env, napi_callback_info info)
{
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("store_test");
    if (!predicates) {
        return nullptr;
    }
    const char *data5Value = "BBCD%";
    int ret = OH_Predicates_NotLike(predicates, "data5", data5Value);

    napi_value result;
    napi_create_int32(env, (ret == RDB_OK) ? 0 : -1, &result);
    return result;
}

napi_value TestOHPredicatesHavingOk(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Rdb_ConfigV2 *configV2 = OH_Rdb_CreateConfig();
    const char *rdbTestPatH1 = "/data/storage/el2/database/com.acts.acttransactiontest/entry";
    OH_Rdb_SetDatabaseDir(configV2, rdbTestPatH1);
    OH_Rdb_SetStoreName(configV2, "rdb_store_test.db");
    OH_Rdb_SetBundleName(configV2, "com.acts.acttransactiontest");
    OH_Rdb_SetModuleName(configV2, "");
    OH_Rdb_SetEncrypted(configV2, false);
    OH_Rdb_SetSecurityLevel(configV2, OH_Rdb_SecurityLevel::S1);
    OH_Rdb_SetArea(configV2, RDB_SECURITY_AREA_EL1);
    OH_Rdb_SetDbType(configV2, RDB_SQLITE);
    int errCode = 0;
    OH_Rdb_Store *testRdbStore = OH_Rdb_CreateOrOpen(configV2, &errCode);
    const char *createTableSQL =
        "CREATE TABLE IF NOT EXISTS test_table ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "data5 INTEGER"
        ");";
    OH_Rdb_Execute(testRdbStore, createTableSQL);
    OH_VBucket *valueBucket = OH_Rdb_CreateValuesBucket();
    int64_t int64Value = 123;
    valueBucket->putInt64(valueBucket, "data5", int64Value);
    int64_t rowId = 0;
    OH_Rdb_Insert(testRdbStore, "test_table", valueBucket);
    valueBucket->destroy(valueBucket);
    OH_Predicates *predicates = OH_Rdb_CreatePredicates("test_table");
    const char *groupCol = "data5";
    predicates->groupBy(predicates, &groupCol, 1);
    OH_Data_Values *values = OH_Values_Create();
    int64_t int64Value1 = 100;
    OH_Values_PutInt(values, int64Value1);
    int error = OH_Predicates_Having(predicates, "data5 > ?", values);
    napi_create_int32(env, error == RDB_OK ? 0 : -1, &result);
    OH_Values_Destroy(values);
    predicates->destroy(predicates);
    OH_Rdb_CloseStore(testRdbStore);
    OH_Rdb_DeleteStoreV2(configV2);
    OH_Rdb_DestroyConfig(configV2);
    return result;
}