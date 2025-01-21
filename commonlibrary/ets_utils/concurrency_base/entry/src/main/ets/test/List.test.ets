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

import ConcurrencyBaseTest from './ConcurrencyBase.test.ets'
import SendableChainTest from './SendablesChain.test.ets'
import SendableGroupTest from './SendablesGroup.test.ets'
import SendableGroupWithAllocTest from './SendablesGroupWithAlloc.test.ets'
import LockTest from './LockTest.test.ets'
import TaskPoolTest from './TaskPoolTest.test.ets'
import TaskGroupTest from './TaskGroupTest.test.ets'
import SendablesTest from './SendablesTest.test.ets'
import SendablesTestWithAlloc from './SendablesTestWithAlloc.test.ets'
import PixMapTest from './PixMapTest.test.ets'

export default function testsuite() {
    ConcurrencyBaseTest();
    SendableChainTest();
    SendableGroupTest();
    SendableGroupWithAllocTest();
    LockTest();
    TaskPoolTest();
    TaskGroupTest();
    SendablesTest();
    SendablesTestWithAlloc();
    PixMapTest();
}
