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

#include "CursorTest.h"
#include "napi/native_api.h"
#include <cstdint>
#include <database/rdb/oh_cursor.h>
#include <database/rdb/relational_store.h>
#include <database/rdb/relational_store_error_code.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <database/rdb/oh_rdb_crypto_param.h>

namespace CursorTest {
    const char* RDB_TEST = "/data/storage/el2/database/com.acts.acttransactiontest/entry";
    char g_storeName[20] = "rdb_store_test.db";
    char g_bundleName[100] = "com.acts.acttransactiontest";
    char g_moduleName[100] = "";
    OH_Rdb_Config RDB_CONFIG;
}

void InitCursorConfig()
{
    CursorTest::RDB_CONFIG.dataBaseDir = CursorTest::RDB_TEST;
    CursorTest::RDB_CONFIG.storeName = CursorTest::g_storeName;
    CursorTest::RDB_CONFIG.bundleName = CursorTest::g_bundleName;
    CursorTest::RDB_CONFIG.moduleName = CursorTest::g_moduleName;
    CursorTest::RDB_CONFIG.securityLevel = OH_Rdb_SecurityLevel::S1;
    CursorTest::RDB_CONFIG.isEncrypt = false;
    CursorTest::RDB_CONFIG.selfSize = sizeof(OH_Rdb_Config);
    CursorTest::RDB_CONFIG.area = RDB_SECURITY_AREA_EL1;
}

void AddCursorTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"testOHCursorGetFloatVectorCountArgs", nullptr, TestOHCursorGetFloatVectorCountArgs, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOHCursorGetFloatVectorCountError", nullptr, TestOHCursorGetFloatVectorCountError, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOHCursorGetFloatVectorArgs", nullptr, TestOHCursorGetFloatVectorArgs, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOHCursorGetFloatVectorError", nullptr, TestOHCursorGetFloatVectorError, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
}

napi_value TestOHCursorGetFloatVectorCountArgs(napi_env env, napi_callback_info info)
{
    InitCursorConfig();
    int errCode1 = 0;
    OH_Rdb_Store *testStore = nullptr;
    testStore = OH_Rdb_GetOrOpen(&CursorTest::RDB_CONFIG, &errCode1);
    OH_Data_Values *values = OH_Values_Create();
    OH_Values_PutInt(values, 1);
    
    size_t count = 0;
    auto errCode = OH_Cursor_GetFloatVectorCount(nullptr, 1, &count);
    OH_Values_Destroy(values);
    OH_Rdb_CloseStore(testStore);
    OH_Rdb_DeleteStore(&CursorTest::RDB_CONFIG);
    napi_value result;
    napi_create_int32(env, errCode == RDB_E_INVALID_ARGS ? 0 : -1, &result);
    return result;
}

napi_value TestOHCursorGetFloatVectorCountError(napi_env env, napi_callback_info info)
{
    InitCursorConfig();
    int errCode1 = 0;
    OH_Rdb_Store *store = nullptr;
    store = OH_Rdb_GetOrOpen(&CursorTest::RDB_CONFIG, &errCode1);
    char querySql[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    OH_Values_PutInt(values, 1);
    
    OH_Cursor *cursor = OH_Rdb_ExecuteQueryV2(store, querySql, values);
    OH_Data_Values *values1 = OH_Values_Create();
    auto errCode = OH_Rdb_ExecuteV2(store, "update test set data1 = ? where id = ?", values1, nullptr);

    size_t count = 0;
    errCode = OH_Cursor_GetFloatVectorCount(cursor, 1, &count);
    OH_Values_Destroy(values);
    OH_Values_Destroy(values1);
    cursor->destroy(cursor);
    OH_Rdb_CloseStore(store);
    OH_Rdb_DeleteStore(&CursorTest::RDB_CONFIG);
    
    napi_value result;
    napi_create_int32(env, errCode == RDB_E_ERROR ? 0 : errCode, &result);
    return result;
}

napi_value TestOHCursorGetFloatVectorArgs(napi_env env, napi_callback_info info)
{
    InitCursorConfig();
    int errCode1 = 0;
    OH_Rdb_Store *store = nullptr;
    store = OH_Rdb_GetOrOpen(&CursorTest::RDB_CONFIG, &errCode1);
    char querySql[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    OH_Values_PutInt(values, 1);
    
    OH_Cursor *cursor = OH_Rdb_ExecuteQueryV2(store, querySql, values);
    OH_Data_Values *values1 = OH_Values_Create();
    auto errCode = OH_Rdb_ExecuteV2(store, "update test set data1 = ? where id = ?", values1, nullptr);

    size_t count = 0;
    errCode = OH_Cursor_GetFloatVectorCount(cursor, 1, &count);
    float test1[count];
    size_t outLen;
    errCode = OH_Cursor_GetFloatVector(nullptr, 1, test1, count, &outLen);
    OH_Values_Destroy(values);
    OH_Values_Destroy(values1);
    cursor->destroy(cursor);
    OH_Rdb_CloseStore(store);
    OH_Rdb_DeleteStore(&CursorTest::RDB_CONFIG);
    napi_value result;
    napi_create_int32(env, errCode == RDB_E_INVALID_ARGS ? 0 : -1, &result);
    return result;
}

napi_value TestOHCursorGetFloatVectorError(napi_env env, napi_callback_info info)
{
    InitCursorConfig();
    int errCode1 = 0;
    OH_Rdb_Store *store = nullptr;
    store = OH_Rdb_GetOrOpen(&CursorTest::RDB_CONFIG, &errCode1);
    char querySql[] = "select * from test where id = ?;";
    OH_Data_Values *values = OH_Values_Create();
    OH_Values_PutInt(values, 1);
    OH_Cursor *cursor = OH_Rdb_ExecuteQueryV2(store, querySql, values);
    OH_Data_Values *values1 = OH_Values_Create();
    auto errCode = OH_Rdb_ExecuteV2(store, "update test set data1 = ? where id = ?", values1, nullptr);
    size_t outLen;
    float test1[2] = { 5.5, 6.6 };
    int32_t columnIndex = 10;
    size_t inLen = 2;
    errCode = OH_Cursor_GetFloatVector(cursor, columnIndex, test1, inLen, &outLen);
    OH_Values_Destroy(values);
    OH_Values_Destroy(values1);
    cursor->destroy(cursor);
    OH_Rdb_CloseStore(store);
    OH_Rdb_DeleteStore(&CursorTest::RDB_CONFIG);
    napi_value result;
    napi_create_int32(env, errCode == RDB_E_ERROR ? 0 : errCode, &result);
    return result;
}