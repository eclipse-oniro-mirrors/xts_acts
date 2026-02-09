/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, afterAll, it, expect, TestType, Level, Size, afterEach } from "../../../hypium/index";
import {
  gcAfterLockAsyncTest,
  doubleExitSharedLockTest,
  pendingSharedRequestAfterGC,
  setDelayRequestAndCloseWorkerInstantlyTest
} from '../testability/pages/LockTest';
import { sleep } from '../testability/pages/utils';

export default function AsyncLockTest() {
  let printLog = 'AsyncLockTest:';
  describe('AsyncLockTest', (): void => {
    afterEach(() => {
      await sleep(20);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_0010
     * @tc.name setDelayRequestAndCloseWorkerInstantlyTest
     * @tc.desc checks the request in worker should be skipped and the request in main thread should be executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('setDelayRequestAndCloseWorkerInstantlyTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result: Object = await setDelayRequestAndCloseWorkerInstantlyTest();
        expect(result).assertEqual('PASSED');
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_0020
     * @tc.name gcAfterLockAsyncTest
     * @tc.desc checks that trigger gc immediately after call lockAsync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('gcAfterLockAsyncTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result: Object = await gcAfterLockAsyncTest();
        expect(result).assertEqual("PASSED");
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_0030
     * @tc.name timeoutLockWithEnvDestroyedTest
     * @tc.desc checks that timeout callback and env destroyed are handled properly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('timeoutLockWithEnvDestroyedTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result: Object = await doubleExitSharedLockTest();
        expect(result).assertEqual("PASSED");
        done();
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_ASYNCLOCK_0040
     * @tc.name pendingSharedRequestAfterGC
     * @tc.desc checks that destruction of shared lock after gc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('pendingSharedRequestAfterGC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let result = await pendingSharedRequestAfterGC();
        expect(result).assertEqual("PASSED");
        done();
      })
  })
}
