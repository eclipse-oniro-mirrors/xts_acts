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

#ifndef TRANSACTIONTESTAPI20_RDBERRORCODETEST_H
#define TRANSACTIONTESTAPI20_RDBERRORCODETEST_H

#include "napi/native_api.h"
#include <database/rdb/relational_store.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

#ifndef RDB_ERROR_CODE_TEST_H
#define RDB_ERROR_CODE_TEST_H

namespace RdbErrorCodeTest {
    extern const char* RDB_TEST;
    extern char g_storeName[20];
    extern char g_bundleName[100];
    extern char g_moduleName[100];
    extern OH_Rdb_Config RDB_CONFIG;
}

#endif // RDB_ERROR_CODE_TEST_H

extern int g_rEmptyTableNameCode;
extern int g_rInvalidColumnTypeCode;
extern int g_rNoRowInQueryCode;
extern int g_rNoTransInSessionCode;
extern int g_rInvalidObjectTypeCode;
extern int g_rType;

void InitRdbErrorCodeConfig();
void InitRdbErrorCodeConfigV2(OH_Rdb_ConfigV2 *configV2);
void InitRdbSqliteConfigV2(OH_Rdb_ConfigV2 *configV2);

void AddRdbErrorCodeTest(std::vector<napi_property_descriptor> &descData);

napi_value TestRdbError(napi_env env, napi_callback_info info);
napi_value TestEmptyTableName(napi_env env, napi_callback_info info);
napi_value TestInvalidColumnType(napi_env env, napi_callback_info info);
napi_value TestNoRowInQuery(napi_env env, napi_callback_info info);
napi_value TestNoTransactionInSession(napi_env env, napi_callback_info info);
napi_value TestInvalidColumnIndex(napi_env env, napi_callback_info info);
napi_value TestAlreadyClosed(napi_env env, napi_callback_info info);
napi_value TestNotSupportedAttachInWalMode(napi_env env, napi_callback_info info);
napi_value TestAttachDatabaseBusy(napi_env env, napi_callback_info info);
napi_value TestGoToNextRowResultClosed(napi_env env, napi_callback_info info);
napi_value TestGoToNextRowAfterLast(napi_env env, napi_callback_info info);
napi_value TestInvalidObjectType(napi_env env, napi_callback_info info);

#endif //TRANSACTIONTESTAPI20_RDBERRORCODETEST_H