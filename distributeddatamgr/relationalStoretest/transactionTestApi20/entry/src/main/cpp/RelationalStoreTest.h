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

#ifndef TRANSACTIONTESTAPI20_RELATIONALSTORETEST_H
#define TRANSACTIONTESTAPI20_RELATIONALSTORETEST_H

#include "napi/native_api.h"
#include <database/rdb/relational_store.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>

#ifndef RELATIONAL_STORE_TEST_H
#define RELATIONAL_STORE_TEST_H

namespace RelationalStoreTest {
    extern const char* RDB_TEST;
    extern char g_storeName[20];
    extern char g_bundleName[100];
    extern char g_moduleName[100];
    extern OH_Rdb_Config RDB_CONFIG;
}

#endif // RELATIONAL_STORE_TEST_H

extern int g_rSInvalidParamCode;
extern int g_notSupportedCode;
extern int g_rSErrorCode;

void InitRdbConfig();

void AddRelationStoreTest(std::vector<napi_property_descriptor> &descData);

napi_value TestSetDbType(napi_env env, napi_callback_info info);
napi_value TestSetCryptoParam(napi_env env, napi_callback_info info);
napi_value TestSetTokenizerInvalidParam(napi_env env, napi_callback_info info);
napi_value TestSetTokenizerSuccess(napi_env env, napi_callback_info info);
napi_value TestSetPersistentInvalidParam(napi_env env, napi_callback_info info);
napi_value TestSetPersistentSuccess(napi_env env, napi_callback_info info);
napi_value TestIsTokenizerSupportedInvalidParam(napi_env env, napi_callback_info info);
napi_value TestDeleteStoreInvalidParam(napi_env env, napi_callback_info info);
napi_value TestDeleteStoreSuccess(napi_env env, napi_callback_info info);
napi_value TestInsertError(napi_env env, napi_callback_info info);
napi_value TestInsertWithConflictResolutionSuccess(napi_env env, napi_callback_info info);
napi_value TestInsertWithConflictResolutionAbnormalError(napi_env env, napi_callback_info info);
napi_value TestBatchInsertInvalidParam(napi_env env, napi_callback_info info);
napi_value TestBatchInsertError(napi_env env, napi_callback_info info);
napi_value TestUpdateFailed(napi_env env, napi_callback_info info);
napi_value TestUpdateWithConflictResolutionSuccess(napi_env env, napi_callback_info info);
napi_value TestUpdateWithConflictResolutionError(napi_env env, napi_callback_info info);
napi_value TestDeleteInvalidParam(napi_env env, napi_callback_info info);
napi_value TestDeleteFailed(napi_env env, napi_callback_info info);
napi_value TestExecuteInvalidParam(napi_env env, napi_callback_info info);
napi_value TestExecuteV2InvalidParam(napi_env env, napi_callback_info info);
napi_value TestExecuteV2Error(napi_env env, napi_callback_info info);
napi_value TestBeginTransactionInvalidParam(napi_env env, napi_callback_info info);
napi_value TestBeginTransactionSuccess(napi_env env, napi_callback_info info);
napi_value TestRollBackInvalidParam(napi_env env, napi_callback_info info);
napi_value TestRollBackSuccess(napi_env env, napi_callback_info info);
napi_value TestCommitInvalidParam(napi_env env, napi_callback_info info);
napi_value TestCommitSuccess(napi_env env, napi_callback_info info);
napi_value TestBackupInvalidParam(napi_env env, napi_callback_info info);
napi_value TestBackupSuccess(napi_env env, napi_callback_info info);
napi_value TestRestoreInvalidParam(napi_env env, napi_callback_info info);
napi_value TestRestoreSuccess(napi_env env, napi_callback_info info);
napi_value TestGetVersionInvalidParam(napi_env env, napi_callback_info info);
napi_value TestGetVersionSuccess(napi_env env, napi_callback_info info);
napi_value TestSetVersionInvalidParam(napi_env env, napi_callback_info info);
napi_value TestSetVersionSuccess(napi_env env, napi_callback_info info);
napi_value TestLockRowInvalidParam(napi_env env, napi_callback_info info);
napi_value TestUnlockRowInvalidParam(napi_env env, napi_callback_info info);
napi_value TestCreateTransactionInvalidParam(napi_env env, napi_callback_info info);
napi_value TestSetLocaleSuccess(napi_env env, napi_callback_info info);
napi_value TestOHRdbAttachBusy(napi_env env, napi_callback_info info);
napi_value TestOHRdbAttachError(napi_env env, napi_callback_info info);
napi_value TestOHRdbDetachOk(napi_env env, napi_callback_info info);
napi_value TestOHRdbDetachError(napi_env env, napi_callback_info info);
napi_value TestOHRdbSubscribeDetails(napi_env env, napi_callback_info info);
napi_value TestSetTokenizerNotSupported(napi_env env, napi_callback_info info);
napi_value TestRollBackByTrxIdSuccess(napi_env env, napi_callback_info info);
napi_value TestCommitByTrxIdSuccess(napi_env env, napi_callback_info info);
napi_value TestSubscribeSuccess(napi_env env, napi_callback_info info);

#endif //TRANSACTIONTESTAPI20_RELATIONALSTORETEST_H
