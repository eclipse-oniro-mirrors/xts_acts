/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, afterAll, it, expect } from '@ohos/hypium'
import {
    setDelayRequestAndCloseWorkerInstantlyTest,
    gcAfterLockAsyncTest,
    doubleExitSharedLockTest,
    pendingSharedRequestAfterGC,
} from './LockTest';


export default function AsyncLockTest() {
  let printLog = 'AsyncLockTest:';
  describe('AsyncLockTest', () => {

    afterAll(() => {
      console.info(printLog + 'total case over');
    })

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_001
    * @tc.name: setDelayRequestAndCloseWorkerInstantlyTest
    * @tc.desc: checks the request in worker should be skipped and the request in main thread should be executed
    * @tc.author: liu-zelin
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 2
    */
    it('setDelayRequestAndCloseWorkerInstantlyTest', 0, async (done: Function) => {
      let result: Object = await setDelayRequestAndCloseWorkerInstantlyTest();
      expect(result).assertEqual('PASSED');
      done();
    });

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_002
     * @tc.name: gcAfterLockAsyncTest
     * @tc.desc: checks that trigger gc immediately after call lockAsync
     * @tc.author: liu-zelin
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('gcAfterLockAsyncTest0', 0, async (done: Function) => {
      let result: Object = await gcAfterLockAsyncTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_003
     * @tc.name: timeoutLockWithEnvDestroyedTest
     * @tc.desc: checks that timeout callback and env destroyed are handled properly
     * @tc.author: diartyz
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('timeoutLockWithEnvDestroyedTest', 0, async (done: Function) => {
      let result: Object = await doubleExitSharedLockTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_004
     * @tc.name: pendingSharedRequestAfterGC
     * @tc.desc: checks that destruction of shared lock after gc
     * @tc.author: diartyz
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('pendingSharedRequestAfterGC', 0, async (done: Function) => {
      let result: Object = await pendingSharedRequestAfterGC();
      expect(result).assertEqual("PASSED");
      done();
    })
  })
}
