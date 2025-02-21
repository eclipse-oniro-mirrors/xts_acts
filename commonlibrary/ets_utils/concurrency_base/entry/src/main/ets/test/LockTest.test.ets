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
import { skipConditional } from './utils'
import { exclusiveSingleTest, exclusiveMultiTest, exclusiveMultiWorkerTest, sharedSingleTest, sharedMultiTest,
  sharedMultiWorkerTest, isAvailableTest, isNotAvailableTest, queryTest, abortTest, twoLocksSingleTest,
  twoThreadsAcquireOwnLocks, multipleWakeupTest, waitForLock, dontWaitForLock, sequentialLock, sequentialLockWorkerTest,
  sequentialLockInf, sequentialLockUnlocked, sequentialLockUnlocked1, sequentialLockUnlocked3,
  fourThreadsApplyForSameLockExclusive, fourThreadsApplyForSameLockShared, acquireLockTwiceSharedSharedAvailable,
  acquireLockTwiceSharedSharedNotAvailable, acquireLockTwiceSharedExclusiveAvailable,
  acquireLockTwiceSharedExclusiveNotAvailable, acquireLockTwiceExclusiveSharedAvailable,
  acquireLockTwiceExclusiveSharedNotAvailable, acquireLockTwiceExclusiveExclusiveAvailable,
  acquireLockTwiceExclusiveExclusiveNotAvailable } from './LockTest';


export default function LockTest() {
  let printLog = 'LockTest:';
  describe('LockTest', () => {

    afterAll(() => {
      console.info(printLog + 'total case over');
    })

    /**
     * @tc.name: exclusiveSingleTest
     * @tc.desc: checks exclusive single lock
     * @tc.author: konstantin-grebenschikov
     */
    it('exclusiveSingleTest', 0, async (done: Function) => {
      let result: Object = await exclusiveSingleTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: exclusiveMultiTest
     * @tc.desc: checks exclusive multiple locks
     * @tc.author: konstantin-grebenschikov
     */
    it('exclusiveMultiTest', 0, async (done: Function) => {
      let result: Object = await exclusiveMultiTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: exclusiveMultiWorkerTest
     * @tc.desc: checks exclusive multiple locks in workers
     * @tc.author: konstantin-grebenschikov
     */
    it('exclusiveMultiWorkerTest', 0, async (done: Function) => {
      let result: Object = await exclusiveMultiWorkerTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: sharedSingleTest
     * @tc.desc: checks shared single lock
     * @tc.author: konstantin-grebenschikov
     */
    it('sharedSingleTest', 0, async (done: Function) => {
      let result: Object = await sharedSingleTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: sharedMultiTest
     * @tc.desc: checks shared multiple locks
     * @tc.author: konstantin-grebenschikov
     */
    it('sharedMultiTest', 0, async (done: Function) => {
      let result: Object = await sharedMultiTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: sharedMultiWorkerTest
     * @tc.desc: checks shared multiple locks in workers
     * @tc.author: konstantin-grebenschikov
     */
    it('sharedMultiWorkerTest', 0, async (done: Function) => {
      let result: Object = await sharedMultiWorkerTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: isAvailableTest
     * @tc.desc: checks lock option isAvailable set true
     * @tc.author: konstantin-grebenschikov
     */
    it('isAvailableTest', 0, async (done: Function) => {
      let result: Object = await isAvailableTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: isNotAvailableTest
     * @tc.desc: checks lock option isAvailable set false
     * @tc.author: konstantin-grebenschikov
     */
    it('isNotAvailableTest', 0, async (done: Function) => {
      let result: Object = await isNotAvailableTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: queryTest
     * @tc.desc: checks lock query
     * @tc.author: konstantin-grebenschikov
     */
    it('queryTest', 0, async (done: Function) => {
      let result: Object = await queryTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: abortTest
     * @tc.desc: checks lock signal abort
     * @tc.author: konstantin-grebenschikov
     */
    it('abortTest', 0, async (done: Function) => {
      let result: Object = await abortTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: twoLocksSingleTest
     * @tc.desc: checks two exclusive locks
     * @tc.author: konstantin-grebenschikov
     */
    it('twoLocksSingleTest', 0, async (done: Function) => {
      let result: Object = await twoLocksSingleTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: twoThreadsAcquireOwnLocks
     * @tc.desc: checks two threads acquiring own exclusive locks
     * @tc.author: konstantin-grebenschikov
     */
    it('twoThreadsAcquireOwnLocks', 0, async (done: Function) => {
      let result: Object = await twoThreadsAcquireOwnLocks();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: multipleWakeupTest
     * @tc.desc: checks multiple wake ups
     * @tc.author: konstantin-grebenschikov
     */
    it('multipleWakeupTest', 0, async (done: Function) => {
      let result = await multipleWakeupTest();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: waitForLock
     * @tc.desc: checks wait for lock
     * @tc.author: konstantin-grebenschikov
     */
    it('waitForLock', 0, async (done: Function) => {
      let result: Object = await waitForLock();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: dontWaitForLock
     * @tc.desc: checks not waiting for lock
     * @tc.author: konstantin-grebenschikov
     */
    it('dontWaitForLock', 0, async (done: Function) => {
      let result: Object = await dontWaitForLock();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: sequentialLock
     * @tc.desc: checks sequentially acquiring locks
     * @tc.author: konstantin-grebenschikov
     */
    it('sequentialLock', 0, async (done: Function) => {
      let result: Object = await sequentialLock();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: sequentialLockWorkerTest
     * @tc.desc: checks sequentially acquiring locks in workers
     * @tc.author: konstantin-grebenschikov
     */
    it('sequentialLockWorkerTest', 0, async (done: Function) => {
      let result: Object = await skipConditional(
        "sequentialLockWorkerTest in progress", true, sequentialLockWorkerTest);
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: sequentialLockInf
     * @tc.desc: checks use of sequentially acquiring locks in Atomics
     * @tc.author: konstantin-grebenschikov
     */
    it('sequentialLockInf', 0, async (done: Function) => {
      let result: Object = await sequentialLockInf();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: sequentialLockUnlocked
     * @tc.desc: checks sequentially acquiring unlocked lock
     * @tc.author: konstantin-grebenschikov
     */
    it('sequentialLockUnlocked', 0, async (done: Function) => {
      let result: Object = await sequentialLockUnlocked();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: sequentialLockUnlocked1
     * @tc.desc: checks sequentially acquiring unlocked lock in a special case
     * @tc.author: konstantin-grebenschikov
     */
    it('sequentialLockUnlocked1', 0, async (done: Function) => {
      let result: Object = await sequentialLockUnlocked1();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: sequentialLockUnlocked3
     * @tc.desc: checks sequentially acquiring unlocked lock in yet another special case
     * @tc.author: konstantin-grebenschikov
     */
    it('sequentialLockUnlocked3', 0, async (done: Function) => {
      let result: Object = await sequentialLockUnlocked3();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: fourThreadsApplyForSameLockExclusive
     * @tc.desc: checks four threads applying same exclusive lock
     * @tc.author: konstantin-grebenschikov
     */
    it('fourThreadsApplyForSameLockExclusive', 0, async (done: Function) => {
      let result: Object = await fourThreadsApplyForSameLockExclusive();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: fourThreadsApplyForSameLockShared
     * @tc.desc: checks four threads applying same shared lock
     * @tc.author: konstantin-grebenschikov
     */
    it('fourThreadsApplyForSameLockShared', 0, async (done: Function) => {
      let result: Object = await skipConditional(
        "fourThreadsApplyForSameLockShared in progress", true, fourThreadsApplyForSameLockShared);
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: acquireLockTwiceSharedSharedAvailable
     * @tc.desc: checks acquiring lock twice with inner and outer mode shared and option isAvailable true
     * @tc.author: konstantin-grebenschikov
     */
    it('acquireLockTwiceSharedSharedAvailable', 0, async (done: Function) => {
      let result: Object = await acquireLockTwiceSharedSharedAvailable();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: acquireLockTwiceSharedSharedNotAvailable
     * @tc.desc: checks acquiring lock twice with inner and outer mode shared and option isAvailable false
     * @tc.author: konstantin-grebenschikov
     */
    it('acquireLockTwiceSharedSharedNotAvailable', 0, async (done: Function) => {
      let result: Object = await acquireLockTwiceSharedSharedNotAvailable();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: acquireLockTwiceSharedExclusiveAvailable
     * @tc.desc: checks acquiring lock twice with inner mode exclusive, outer mode shared and option isAvailable true
     * @tc.author: konstantin-grebenschikov
     */
    it('acquireLockTwiceSharedExclusiveAvailable', 0, async (done: Function) => {
      let result: Object = await acquireLockTwiceSharedExclusiveAvailable();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: acquireLockTwiceSharedExclusiveNotAvailable
     * @tc.desc: checks acquiring lock twice with inner mode exclusive, outer mode shared and option isAvailable false
     * @tc.author: konstantin-grebenschikov
     */
    it('acquireLockTwiceSharedExclusiveNotAvailable', 0, async (done: Function) => {
      let result: Object = await acquireLockTwiceSharedExclusiveNotAvailable();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: acquireLockTwiceExclusiveSharedAvailable
     * @tc.desc: checks acquiring lock twice with outer mode exclusive, inner mode shared and option isAvailable true
     * @tc.author: konstantin-grebenschikov
     */
    it('acquireLockTwiceExclusiveSharedAvailable', 0, async (done: Function) => {
      let result: Object = await acquireLockTwiceExclusiveSharedAvailable();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: acquireLockTwiceExclusiveSharedNotAvailable
     * @tc.desc: checks acquiring lock twice with outer mode exclusive, inner mode shared and option isAvailable false
     * @tc.author: konstantin-grebenschikov
     */
    it('acquireLockTwiceExclusiveSharedNotAvailable', 0, async (done: Function) => {
      let result: Object = await acquireLockTwiceExclusiveSharedNotAvailable();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: acquireLockTwiceExclusiveExclusiveAvailable
     * @tc.desc: checks acquiring lock twice with inner and outer mode exclusive and option isAvailable true
     * @tc.author: konstantin-grebenschikov
     */
    it('acquireLockTwiceExclusiveExclusiveAvailable', 0, async (done: Function) => {
      let result: Object = await acquireLockTwiceExclusiveExclusiveAvailable();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name: acquireLockTwiceExclusiveExclusiveNotAvailable
     * @tc.desc: checks acquiring lock twice with inner and outer mode exclusive and option isAvailable true
     * @tc.author: konstantin-grebenschikov
     */
    it('acquireLockTwiceExclusiveExclusiveNotAvailable', 0, async (done: Function) => {
      let result: Object = await acquireLockTwiceExclusiveExclusiveNotAvailable();
      expect(result).assertEqual("PASSED");
      done();
    })

  })
}
