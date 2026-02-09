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

#ifndef TRANSACTIONTESTAPI20_TRANSACTIONTEST_H
#define TRANSACTIONTESTAPI20_TRANSACTIONTEST_H

#include "napi/native_api.h"
#include <database/rdb/relational_store.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <sys/stat.h>
#include <vector>

#ifndef TRANSACTION_TEST_H
#define TRANSACTION_TEST_H

namespace TransactionTest {
    extern const char* RDB_TEST;
    extern char g_storeName[20];
    extern char g_bundleName[100];
    extern char g_moduleName[100];
    extern OH_Rdb_Config RDB_CONFIG;
}

#endif // TRANSACTION_TEST_H

extern int g_tSInvalidParamCode;
extern int g_tSAlreadyClosedCode;
extern int g_tSErrorCode;

void InitRdbTransConfigV2(OH_Rdb_ConfigV2 *configV2);
void InitRdbTransConfig();

void AddTransactionTest(std::vector<napi_property_descriptor> &descData);

napi_value TestDestroyOptionsInvalidParam(napi_env env, napi_callback_info info);
napi_value TestDestroyOptionsSuccess(napi_env env, napi_callback_info info);
napi_value TestTransCommitInvalidParam(napi_env env, napi_callback_info info);
napi_value TestCommitTransDatabaseClosed(napi_env env, napi_callback_info info);
napi_value TestTransRollbackInvalidParam(napi_env env, napi_callback_info info);
napi_value TestTransRollbackDatabaseClosed(napi_env env, napi_callback_info info);
napi_value TestInsertInvalidParam(napi_env env, napi_callback_info info);
napi_value TestInsertDatabaseClosed(napi_env env, napi_callback_info info);
napi_value TestTransInsertError(napi_env env, napi_callback_info info);
napi_value TestTransInsertWithConflictResolutionSuccess(napi_env env, napi_callback_info info);
napi_value TestInsertWithConflictResolutionError(napi_env env, napi_callback_info info);
napi_value TestInsertWithConflictResolutionDatabaseClosed(napi_env env, napi_callback_info info);
napi_value TestTransBatchInsertInvalidParam(napi_env env, napi_callback_info info);
napi_value TestTransBatchInsertError(napi_env env, napi_callback_info info);
napi_value TestTransBatchInsertDatabaseClosed(napi_env env, napi_callback_info info);
napi_value TestUpdateInvalidParam(napi_env env, napi_callback_info info);
napi_value TestTransUpdateError(napi_env env, napi_callback_info info);
napi_value TestTransUpdateDatabaseClosed(napi_env env, napi_callback_info info);
napi_value TestUpdateWithConflictResolutionInvalidParam(napi_env env, napi_callback_info info);
napi_value TestTransUpdateWithConflictResolutionError(napi_env env, napi_callback_info info);
napi_value TestTransUpdateWithConflictResolutionDatabaseClosed(napi_env env, napi_callback_info info);
napi_value TestTransDeleteInvalidParam(napi_env env, napi_callback_info info);
napi_value TestTransDeleteError(napi_env env, napi_callback_info info);
napi_value TestTransDeleteDatabaseClosed(napi_env env, napi_callback_info info);
napi_value TestTransExecuteInvalidParam(napi_env env, napi_callback_info info);
napi_value TestTransExecuteError(napi_env env, napi_callback_info info);
napi_value TestTransExecuteDatabaseClosed(napi_env env, napi_callback_info info);
napi_value TestDestroyInvalidParam(napi_env env, napi_callback_info info);
napi_value TestOHRdbTransOptionSetTypeImmediate(napi_env env, napi_callback_info info);
napi_value TestOHRdbTransOptionSetTypeExclusive(napi_env env, napi_callback_info info);

#endif //TRANSACTIONTESTAPI20_TRANSACTIONTEST_H