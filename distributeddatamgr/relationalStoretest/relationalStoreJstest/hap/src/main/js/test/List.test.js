/*
* Copyright (c) 2021-2023 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import relationalStoreCloudSyncTest from './RelationalStoreCloudSync.test.js'
import relationalStoreDeleteTest from './RelationalStoreDeleteJsunit.test.js'
import relationalStoreDistributedTest from './RelationalStoreDistributedJsunit.test.js'
import relationalStoreInsertTest from './RelationalStoreInsertJsunit.test.js'
import relationalStorePredicatesJoinTest from './RelationalStorePredicatesJoinJsunit.test.js'
import relationalStorePredicatesTest from './RelationalStorePredicatesJsunit.test.js'
import relationalStoreTest from './RelationalStoreJsunit.test.js'
import relationalStoreResultSetTest from './RelationalStoreResultSetJsunit.test.js'
import relationalStoreExcuteSqlTest from './RelationalStoreExcuteSqlJsunit.test.js'
import relationalStoreTransactionTest from './RelationalStoreTransactionJsunit.test.js'
import relationalStoreUpdateTest from './RelationalStoreUpdateJsunit.test.js'
import relationalStoreQueryTest from './RelationalStoreQuery.test.js'
import relationalStoreEncryptionTest from './RelationalStoreEncryptionJsunit.test.js'
import relationalStorePredicatesComplexFiledTest from './RelationalStorePredicatesComplexFiledJsunit.test.js'
import relationalStoreBackupRestoreWithFAContextTest from './RelationalStoreBackupRestoreWithFAContextJsunit.test.js'
import relationalStoreBackupRestoreCallbackTest from './RelationalStoreBackupRestoreCallbackJsunit.test.js'
import relationalStoreAssetResultSetTest from './RelationalStoreAssetResultSetJsunit.test.js'
import relationalStoreCustomDirTest from './RelationalStoreCustomDir.test.js'
import relationalStoreCloudCursor from './RelationalStoreCloudCursor.test.js'
import relationalStoreCloudDataTest from './RelationalStoreCloudData.test.js'

export default function testsuite() {
    relationalStoreCloudSyncTest()
    relationalStoreDeleteTest()
    relationalStoreDistributedTest()
    relationalStoreInsertTest()
    relationalStorePredicatesJoinTest()
    relationalStorePredicatesTest()
    relationalStoreTest()
    relationalStoreResultSetTest()
    relationalStoreExcuteSqlTest()
    relationalStoreTransactionTest()
    relationalStoreUpdateTest()
    relationalStoreQueryTest()
    relationalStoreEncryptionTest()
    relationalStorePredicatesComplexFiledTest()
    relationalStoreBackupRestoreWithFAContextTest()
    relationalStoreBackupRestoreCallbackTest()
    relationalStoreAssetResultSetTest()
    relationalStoreCustomDirTest()
    relationalStoreCloudCursor()
	relationalStoreCloudDataTest()
}
