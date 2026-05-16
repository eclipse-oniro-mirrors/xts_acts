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
//database/rdb/oh_rdb_transaction.h
export const testDestroyOptionsInvalidParam: () => number;
export const testDestroyOptionsSuccess: () => number;
export const testTransCommitInvalidParam: () => number;
export const testCommitTransDatabaseClosed: () => number;
export const testTransRollbackInvalidParam: () => number;
export const testTransRollbackDatabaseClosed: () => number;
export const testInsertInvalidParam: () => number;
export const testInsertDatabaseLocked: () => number;
export const testInsertDatabaseClosed: () => number;
export const testTransInsertError: () => number;
export const testTransInsertWithConflictResolutionSuccess: () => number;
export const testInsertWithConflictResolutionError: () => number;
export const testInsertWithConflictResolutionDatabaseClosed: () => number;
export const testInsertWithConflictResolutionDatabaseLocked: () => number;
export const testTransBatchInsertInvalidParam: () => number;
export const testTransBatchInsertError: () => number;
export const testTransBatchInsertDatabaseClosed: () => number;
export const testTransBatchInsertDatabaseLocked: () => number;
export const testUpdateInvalidParam: () => number;
export const testTransUpdateError: () => number;
export const testTransUpdateDatabaseClosed: () => number;
export const testTransUpdateDatabaseLocked: () => number;
export const testUpdateWithConflictResolutionInvalidParam: () => number;
export const testTransUpdateWithConflictResolutionError: () => number;
export const testTransUpdateWithConflictResolutionDatabaseClosed: () => number;
export const testTransUpdateWithConflictResolutionDatabaseLocked: () => number;
export const testTransDeleteInvalidParam: () => number;
export const testTransDeleteError: () => number;
export const testTransDeleteDatabaseClosed: () => number;
export const testTransDeleteDatabaseLocked: () => number;
export const testTransExecuteInvalidParam: () => number;
export const testTransExecuteError: () => number;
export const testTransExecuteDatabaseClosed: () => number;
export const testTransExecuteDatabaseLocked: () => number;
export const testDestroyInvalidParam: () => number;
export const testOHRdbTransOptionSetTypeImmediate: () => number;
export const testOHRdbTransOptionSetTypeExclusive: () => number;
//database/rdb/oh_values_bucket.h
export const testPutAssetInvalidParam: () => number;
export const testPutAssetSuccess: () => number;
export const testPutAssetsInvalidParam: () => number;
export const testPutAssetsSuccess: () => number;
export const testPutFloatVectorInvalidParam: () => number;
export const testPutUnlimitedIntInvalidParam: () => number;
//database/rdb/relational_store.h
export const testSetDbType: () => number;
export const testSetCryptoParam: () => number;
export const testSetTokenizerInvalidParam: () => number;
export const testSetTokenizerSuccess: () => number;
export const testSetPersistentInvalidParam: () => number;
export const testSetPersistentSuccess: () => number;
export const testIsTokenizerSupportedInvalidParam: () => number;
export const testDeleteStoreInvalidParam: () => number;
export const testDeleteStoreSuccess: () => number;
export const testInsertError: () => number;
export const testInsertWithConflictResolutionSuccess: () => number;
export const testInsertWithConflictResolutionAbnormalError: () => number;
export const testInsertWithConflictResolution: () => number;
export const testBatchInsertInvalidParam: () => number;
export const testBatchInsertError: () => number;
export const testBatchInsertDatabaseClosed: () => number;
export const testUpdateFailed: () => number;
export const testUpdateWithConflictResolutionSuccess: () => number;
export const testUpdateWithConflictResolutionError: () => number;
export const testDeleteInvalidParam: () => number;
export const testDeleteFailed: () => number;
export const testExecuteInvalidParam: () => number;
export const testExecuteV2InvalidParam: () => number;
export const testExecuteV2Error: () => number;
export const testExecuteV2DatabaseClosed: () => number;
export const testExecuteByTrxIdNotSupport: () => number;
export const testBeginTransactionInvalidParam: () => number;
export const testBeginTransactionSuccess: () => number;
export const testRollBackInvalidParam: () => number;
export const testRollBackSuccess: () => number;
export const testCommitInvalidParam: () => number;
export const testCommitDatabaseClosed: () => number;
export const testCommitSuccess: () => number;
export const testRollBackByTrxIdSuccess: () => number;
export const testCommitByTrxIdSuccess: () => number;
export const testBackupInvalidParam: () => number;
export const testBackupSuccess: () => number;
export const testRestoreInvalidParam: () => number;
export const testRestoreSuccess: () => number;
export const testGetVersionInvalidParam: () => number;
export const testGetVersionSuccess: () => number;
export const testSetVersionInvalidParam: () => number;
export const testSetVersionSuccess: () => number;
export const testSetDistributedTablesSuccess: () => number;
export const testLockRowInvalidParam: () => number;
export const testLockRowSuccess: () => number;
export const testUnlockRowInvalidParam: () => number;
export const testUnlockRowSuccess: () => number;
export const testCreateTransactionInvalidParam: () => number;
export const testCreateTransactionError: () => number;
export const testSetLocaleSuccess: () => number;
export const testOHRdbAttachBusy: () => number;
export const testOHRdbAttachError: () => number;
export const testOHRdbDetachOk: () => number;
export const testOHRdbDetachError: () => number;
export const testOHRdbSubscribeDetails: () => number;
export const testSetTokenizerNotSupported: () => number;
export const testSubscribeSuccess: () => number;

//database/rdb/relational_store_error_code.h
export const testRdbError: () => number;
export const testEmptyTableName: () => number;
export const testInvalidColumnType: () => number;
export const testNoRowInQuery: () => number;
export const testNoTransactionInSession: () => number;
export const testInvalidColumnIndex: () => number;
export const testAlreadyClosed: () => number;
export const testNotSupportedAttachInWalMode: () => number;
export const testAttachDatabaseBusy: () => number;
export const testGoToNextRowResultClosed: () => number;
export const testGoToNextRowAfterLast: () => number;
export const testInvalidObjectType: () => number;
//database/rdb/oh_rdb_crypto_param.h
export const testOHCryptoSetHmacAlgoSha1: () => number;
export const testOHCryptoSetHmacAlgoSha256: () => number;
export const testOHCryptoSetEncryptionAlgo256Gcm: () => number;
export const testOHCryptoSetKdfAlgoKdfSha1: () => number;
export const testOHCryptoSetKdfAlgoKdgShs256: () => number;
//database/rdb/oh_predicates.h
export const testOHPredicatesGlobOk: () => number;
export const testOHPredicatesNotGlobOk: () => number;
export const testOHPredicatesNotLikeOk: () => number;
export const testOHPredicatesHavingOk: () => number;
//database/rdb/oh_cursor.h
export const testOHCursorGetFloatVectorCountArgs: () => number;
export const testOHCursorGetFloatVectorCountError: () => number;
export const testOHCursorGetFloatVectorArgs: () => number;
export const testOHCursorGetFloatVectorError: () => number;

