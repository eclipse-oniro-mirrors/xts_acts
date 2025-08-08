/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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
import relationalStoreCloudSyncEtsTest from './relationalStoreCloudSyncEts.test.ets'
import relationalStoreDistributedTest from './relationalStoreDistributedEtsunit.test.ets'
import relationalStoreTest from './relationalStoreEtsunit.test.ets'
import relationalStoreResultSetTest from './relationalStoreTestResultsetEtsunit.test.ets'
import relationalStoreEmitTest from './relationalStoreEmit.test'
import relationalStoreDifferenceCustomDirMultipleTest from './relationalStoreDifferenceCustomDirMultiple.test'
import relationalStoreAsyncDownloadAssetTest from './relationalStoreAsyncDownloadAssetEts.test'
import relationalStoreSetDistributedTablesTest from './relationalStoreSetDistributedTables.test'
import cloudDataSetStrategyEtsTest from './CloudDataSetStrategyEts.test'
import relationalStoreRagStatusTest from './RelationalStoreRagStatus.test'
export default function testsuite() {
  relationalStoreCloudSyncEtsTest()
  relationalStoreDistributedTest()
  relationalStoreTest()
  relationalStoreResultSetTest()
  relationalStoreEmitTest()
  relationalStoreDifferenceCustomDirMultipleTest()
  relationalStoreAsyncDownloadAssetTest()
  relationalStoreSetDistributedTablesTest()
  cloudDataSetStrategyEtsTest()
  relationalStoreRagStatusTest()
}
