/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import relationalStoreAssetResultSetTest from './RelationalStoreAssetResultSetJsunit.test';
import relationalStoreBackupRestorePromiseTest from './RelationalStoreBackupRestoreWithFAContextJsunit.test';
import relationalStoreCustomDirTest from './RelationalStoreCustomDir.test';
import relationalStoreDeleteTest from './RelationalStoreDeleteJsunit.test';
import relationalStoreEncryptTest from './RelationalStoreEncryptionJsunit.test';
import relationalStoreExecuteSqlTest from './RelationalStoreExecuteSqlJsunit.test';
import relationalStoreInsertTest from './RelationalStoreInsertJsunit.test';
import relationalStoreTest from './RelationalStoreJsunit.test';
import relationalStoreUpdateTest from './RelationalStoreUpdateJsunit.test';
import relationalStorePredicatesComplexFiledTest from './RelationalStorePredicatesComplexFiledJsunit.test';
import relationalStorePredicatesJoinTest from './RelationalStorePredicatesJoinJsunit.test';
import relationalStoreTransactionTest from './RelationalStoreTransactionJsunit.test';
import relationalStoreResultSetTest from './RelationalStoreResultSetJsunit.test';
import relationalStorePredicatesTest from './RelationalStorePredicatesJsunit.test';
import rdbStoreAttachEtsunitTest from './RdbStoreAttachEtsunit.test';
import rdbStoreExcuteTest from './RelationalStoreExecuteEtsunit.test';
import RdbStoreValueTypeTest from './RelationalStoreValueTypeBigInt.test';
import RelationalStoreSyncApiTest from './RelationalStoreSyncApiTest.test';
import rdbStoreCorruptJSunitTest from './RdbStoreCorruptJsunit.test';
import rdbstoreLockRowJsunitTest from './RdbstoreLockRowJsunit.test';
import RdbStoreDataChangeTest from './RdbStoreDataChange.test';
import SqlExecutionTimeTest from './RelationStoreSqlExecTimeTest.test';
import RdbStoreReadOnlyTest from './RelationalStoreReadOnlyJsunit.test';
import rdbStorePluginLibsTest from './RelationalStorePluginLibsJsunit.test';
import rdbDecryptTest from './RelationalStoreDecrpy.test';
import relationalStoreMultiTransTest from './relationalStoreMultiTest.test'
import RelationalStoreIcu from './RelationalStoreIcu.test';
import VectorStoreTest from './VectorStore.test';
import rdbrootDirTest from './RelationalStoreRootDir.test';
import RelationalStoreCustom from './RelationalStoreCustom.test';
import RelationalStoreNoneTokenizer from './RelationalStoreNoneTokenizer.test'
import relationalStoreInterfaceTest from './relationalstore.test'
import relationalStoreErrorCode33Test from './relationalStoreErrorCode33Test.test';
import relationalStoreErrorCode02Test from './relationalStoreErrorCode02Test.test';
import relationalStoreErrorCode51Test from './relationalStoreErrorCode51Test.test';
import relationalStoreErrorCode01Test from './relationalStoreErrorCode01Test.test';
import relationalStoreErrorCode32Test from './relationalStoreErrorCode32Test.test';
import RelationalStoreSetDistributedTables from './RelationalStoreSetDistributedTables.test';
import relationalStoreHavingTest from './RelationalStoreHavingTest.test';
import PerfStatEtsTest from './RelationalStorePerfStatEtsTest.test'
import rdbstoreRekeyEtsTest from './RelationalStoreRekeyEtsTest.test'
import rdbStoreSqliteErrorOccurredTest from './RelationalStoreSqliteErrorOccurredTest.test'

export default function testsuite() {
  relationalStoreEncryptTest()
  relationalStoreUpdateTest()
  relationalStoreTest()
  relationalStoreInsertTest()
  relationalStoreExecuteSqlTest()
  relationalStoreDeleteTest()
  relationalStoreCustomDirTest()
  relationalStoreBackupRestorePromiseTest()
  relationalStoreAssetResultSetTest()
  relationalStoreTransactionTest()
  relationalStorePredicatesComplexFiledTest()
  relationalStorePredicatesJoinTest()
  relationalStoreResultSetTest()
  relationalStorePredicatesTest()
  rdbStoreAttachEtsunitTest()
  rdbStoreExcuteTest()
  RdbStoreValueTypeTest()
  RelationalStoreSyncApiTest()
  rdbStoreCorruptJSunitTest()
  rdbstoreLockRowJsunitTest()
  RdbStoreDataChangeTest()
  SqlExecutionTimeTest()
  RdbStoreReadOnlyTest()
  rdbStorePluginLibsTest()
  rdbDecryptTest()
  relationalStoreMultiTransTest();
  RelationalStoreIcu();
  VectorStoreTest();
  rdbrootDirTest();
  RelationalStoreCustom()
  RelationalStoreNoneTokenizer()
  relationalStoreInterfaceTest()
  relationalStoreErrorCode32Test()
  relationalStoreErrorCode33Test()
  relationalStoreErrorCode02Test()
  relationalStoreErrorCode51Test()
  relationalStoreErrorCode01Test()
  RelationalStoreSetDistributedTables()
  relationalStoreHavingTest()
  PerfStatEtsTest()
  rdbstoreRekeyEtsTest()
  rdbStoreSqliteErrorOccurredTest()
}

