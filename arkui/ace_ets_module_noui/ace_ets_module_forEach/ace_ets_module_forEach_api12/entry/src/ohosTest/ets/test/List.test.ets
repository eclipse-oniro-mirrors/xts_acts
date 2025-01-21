/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import DataOperationTypeTest from './lazyforeachTest/DataOperationType.test';
import lazyChangeJsunit from './lazyforeachTest/lazyChangeJsunit.test';
import lazyReloadJsunit from './lazyforeachTest/lazyReloadJsunit.test';
import Prefetcher1 from './lazyforeachTest/Prefetcher1.test';
import Prefetcher2 from './lazyforeachTest/Prefetcher2.test';
import appStorageV2 from './StorageTest/appStorageV2.test';
import persistenceV2 from './StorageTest/persistenceV2.test';
export default function testsuite() {
  DataOperationTypeTest()
  lazyChangeJsunit()
  lazyReloadJsunit()
  Prefetcher1()
  Prefetcher2()
  appStorageV2()
  persistenceV2()
}