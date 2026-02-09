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

import rdbStoreDeleteTest from './RdbstoreDeleteJsunit.test.js'
import rdbStoreDistributedTest from './RdbStoreDistributedJsunit.test.js'
import rdbstoreInsertTest from './RdbstoreInsertJsunit.test.js'
import rdbStorePredicatesJoinTest from './RdbstorePredicatesJoinJsunit.test.js'
import rdbPredicatesTest from './RdbstorePredicatesJsunit.test.js'
import rdbStoreTest from './RdbstoreRdbstoreJsunit.test.js'
import rdbResultSetTest from './RdbStoreResultSetJsunit.test.js'
import rdbstoreStoreExcuteSqlTest from './RdbstoreStoreExcuteSqlJsunit.test.js'
import rdbstoreTransactionTest from './RdbstoreTransactionJsunit.test.js'
import rdbStoreUpdateTest from './RdbstoreUpdateJsunit.test.js'
import rdbStoreEncryptionTest from './RdbstoreEncryptionJsunit.test.js'
import rdbStorePredicatesComplexFiledTest from './RdbstorePredicatesComplexFiledJsunit.test.js'

export default function testsuite() {
    rdbStoreDeleteTest()
    rdbStoreDistributedTest()
    rdbstoreInsertTest()
    rdbStorePredicatesJoinTest()
    rdbPredicatesTest()
    rdbStoreTest()
    rdbResultSetTest()
    rdbstoreStoreExcuteSqlTest()
    rdbstoreTransactionTest()
    rdbStoreUpdateTest()
    rdbStoreEncryptionTest()
    rdbStorePredicatesComplexFiledTest()
}
