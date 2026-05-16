/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import runningLock from '@ohos.runningLock'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function RunningLockTest() {
  describe('RunningLockTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   RunningLockTest_0100
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0010
     * @tc.desc   createRunningLock(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RunningLockTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      let TAG = 'RunningLockTest_0100'
      runningLock.createRunningLock(TAG, runningLock.RunningLockType.BACKGROUND)
        .then(lock => {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isUsed = lock.isUsed();
          console.info(`${TAG} isUsed: ${isUsed}`);
          expect(isUsed).assertFalse();
          lock.lock(1000);
          isUsed = lock.isUsed();
          console.info(`${TAG} locked isUsed: ${isUsed}`);
          expect(isUsed).assertTrue();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_0200
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0020
     * @tc.desc   createRunningLock(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RunningLockTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      let TAG = 'RunningLockTest_0200'
      runningLock.createRunningLock(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
        .then(lock => {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isUsed = lock.isUsed();
          console.info(`${TAG} isUsed: ${isUsed}`);
          expect(isUsed).assertFalse();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
        .finally(() => {
          console.info(`${TAG} finally!`);
        })
    })

    /**
     * @tc.name   RunningLockTest_0300
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0030
     * @tc.desc   createRunningLock(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('RunningLockTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      let TAG = 'RunningLockTest_0300'
      runningLock.createRunningLock(TAG, runningLock.RunningLockType.BACKGROUND)
        .then(lock => {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isUsed = lock.isUsed();
          console.info(`${TAG} isUsed: ${isUsed}`);
          expect(isUsed).assertFalse();
          lock.lock(2000);
          isUsed = lock.isUsed();
          console.info(`${TAG} locked isUsed: ${isUsed}`);
          expect(isUsed).assertTrue();
          lock.unlock();
          isUsed = lock.isUsed();
          console.info(`${TAG} unlocked isUsed: ${isUsed}`);
          expect(isUsed).assertFalse();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_0400
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0040
     * @tc.desc   createRunningLock(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_0400'
      runningLock.createRunningLock(TAG, runningLock.RunningLockType.BACKGROUND, (error, lock) => {
        if (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isUsed = lock.isUsed();
          console.info(`${TAG} isUsed: ${isUsed}`);
          expect(isUsed).assertFalse();
          lock.lock(1000);
          isUsed = lock.isUsed();
          console.info(`${TAG} locked isUsed: ${isUsed}`);
          expect(isUsed).assertTrue();
          done();
        }
      })
    })

    /**
     * @tc.name   RunningLockTest_0500
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0050
     * @tc.desc   createRunningLock(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_0500'
      runningLock.createRunningLock(TAG, runningLock.RunningLockType.BACKGROUND, (error, lock) => {
        if (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isUsed = lock.isUsed();
          console.info(`${TAG} isUsed: ${isUsed}`);
          expect(isUsed).assertFalse();
          lock.lock(1000);
          isUsed = lock.isUsed();
          console.info(`${TAG} locked isUsed: ${isUsed}`);
          expect(isUsed).assertTrue();
          lock.unlock();
          isUsed = lock.isUsed();
          console.info(`${TAG} unlocked isUsed: ${isUsed}`);
          expect(isUsed).assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   RunningLockTest_0600
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0060
     * @tc.desc   isSupported(type: RunningLockType): boolean;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_0600';
      try {
        let background = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND);
        console.info(`${TAG} background: ${background}`);
        expect(background).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_0700
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0070
     * @tc.desc   isSupported(type: RunningLockType): boolean;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_0700';
      try {
        let proximity = runningLock.isSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL);
        console.info(`${TAG} proximity: ${proximity}`);
        expect(proximity).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_0800
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0080
     * @tc.desc   isSupported(type: RunningLockType): boolean;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_0800';
      try {
        let other = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND - 1);
        console.info(`${TAG} other: ${other}`);
        expect(other).assertFalse();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_0900
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0090
     * @tc.desc   isSupported(type: RunningLockType): boolean;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_0900';
      try {
        let other = runningLock.isSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL + 1);
        console.info(`${TAG} other: ${other}`);
        expect(other).assertFalse();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_1000
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0100
     * @tc.desc   isSupported(type: RunningLockType): boolean;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1000';
      try {
        let isSupported = runningLock.isSupported('PROXIMITY_SCREEN_CONTROL');
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertUndefined();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_1100
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0110
     * @tc.desc   isSupported(type: RunningLockType): boolean;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1100';
      try {
        let isSupported = runningLock.isSupported(false);
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertUndefined();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_1200
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0120
     * @tc.desc   isSupported(type: RunningLockType): boolean;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1200';
      try {
        let isSupported = runningLock.isSupported({
          RunningLockType: runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL
        });
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertUndefined();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_1300
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0130
     * @tc.desc   isSupported(type: RunningLockType): boolean;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1300';
      try {
        let isSupported = runningLock.isSupported();
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertUndefined();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_1400
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0140
     * @tc.desc   create(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1400'
      runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND)
        .then(lock => {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          lock.hold(0);
          isHolding = lock.isHolding();
          console.info(`${TAG} hold isHolding: ${isHolding}`);
          expect(isHolding).assertTrue();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_1500
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0150
     * @tc.desc   create(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1500'
      runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
        .then(lock => {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          lock.hold(1000);
          isHolding = lock.isHolding();
          console.info(`${TAG} hold isHolding: ${isHolding}`);
          expect(isHolding).assertTrue();
          lock.unhold();
          isHolding = lock.isHolding();
          console.info(`${TAG} unhold isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_1600
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0160
     * @tc.desc   create(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1600'
      runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
        .then(lock => {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          lock.unhold();
          isHolding = lock.isHolding();
          console.info(`${TAG} unhold isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_1700
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0170
     * @tc.desc   create(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1700'
      runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND)
        .then(lock => {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          lock.hold(-1);
          isHolding = lock.isHolding();
          console.info(`${TAG} hold isHolding: ${isHolding}`);
          expect(isHolding).assertTrue();
          lock.unhold();
          isHolding = lock.isHolding();
          console.info(`${TAG} unhold isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_1800
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0180
     * @tc.desc   create(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1800'
      runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL, (error, lock) => {
        if (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          lock.hold(0);
          isHolding = lock.isHolding();
          console.info(`${TAG} hold isHolding: ${isHolding}`);
          expect(isHolding).assertTrue();
          done();
        }
      })
    })

    /**
     * @tc.name   RunningLockTest_1900
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0190
     * @tc.desc   create(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_1900'
      runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND, (error, lock) => {
        if (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          lock.hold(1000);
          isHolding = lock.isHolding();
          console.info(`${TAG} hold isHolding: ${isHolding}`);
          expect(isHolding).assertTrue();
          lock.unhold();
          isHolding = lock.isHolding();
          console.info(`${TAG} unhold isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   RunningLockTest_2000
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0200
     * @tc.desc   create(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2000'
      runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL, (error, lock) => {
        if (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          lock.unhold();
          isHolding = lock.isHolding();
          console.info(`${TAG} unhold isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   RunningLockTest_2100
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0210
     * @tc.desc   create(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2100'
      runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL, (error, lock) => {
        if (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          expect(lock).not().assertUndefined();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          lock.hold(-1);
          isHolding = lock.isHolding();
          console.info(`${TAG} hold isHolding: ${isHolding}`);
          expect(isHolding).assertTrue();
          lock.unhold();
          isHolding = lock.isHolding();
          console.info(`${TAG} unhold isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          done();
        }
      })
    })

    /**
     * @tc.name   RunningLockTest_2200
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0220
     * @tc.desc   hold lock, is holding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2200';
      runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
        .then((lock) => {
          expect(lock).not().assertUndefined();
          let holding = lock.isHolding();
          console.info(`${TAG} holding: ${holding}`);
          expect(holding).assertFalse();
          lock.hold('hold');
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          done();
        })
        .catch((error) => {
          console.error(`${TAG} error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        })
        .finally(() => {
          console.info(`${TAG} finally`);
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_2300
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0230
     * @tc.desc   hold(timeout: number): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2300';
      runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL, (error, lock) => {
        if (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}`);
          expect().assertFail();
          done();
        } else {
          expect(lock).not().assertUndefined();
          let holding = lock.isHolding();
          console.info(`${TAG} holding: ${holding}`);
          expect(holding).assertFalse();
          try {
            lock.hold({
              timeout: 500
            });
          } catch (error) {
            console.error(`${TAG} error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(401);
            let isHolding = lock.isHolding();
            console.info(`${TAG} isHolding: ${isHolding}`);
            expect(isHolding).assertFalse();
            done();
          }
        }
      })
    })

    /**
     * @tc.name   RunningLockTest_2400
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0240
     * @tc.desc   hold(timeout: number): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2400';
      runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
        .then((lock) => {
          expect(lock).not().assertUndefined();
          let holding = lock.isHolding();
          console.info(`${TAG} holding: ${holding}`);
          expect(holding).assertFalse();
          lock.hold(true);
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          done();
        })
        .catch((error) => {
          console.error(`${TAG} error: ${error.code} ${error.message}`);
          expect(error.code).assertEqual(401);
          done();
        })
        .finally(() => {
          console.info(`${TAG} finally`);
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_2500
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0250
     * @tc.desc   hold(timeout: number): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2500';
      try {
        runningLock.create(100, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
          .then((lock) => {
            expect(lock).not().assertUndefined();
            let holding = lock.isHolding();
            console.info(`${TAG} holding: ${holding}`);
            expect(holding).assertFalse();
            lock.hold(0);
            let isHolding = lock.isHolding();
            console.info(`${TAG} isHolding: ${isHolding}`);
            expect(isHolding).assertFalse();
            done();
          })
          .catch((error) => {
            console.error(`${TAG} error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(401);
            done();
          })
          .finally(() => {
            console.info(`${TAG} finally`);
            done();
          })
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_2600
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0260
     * @tc.desc   hold(timeout: number): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2600';
      try {
        runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND - 1)
          .then((lock) => {
            expect(lock).not().assertUndefined();
            let holding = lock.isHolding();
            console.info(`${TAG} holding: ${holding}`);
            expect(holding).assertFalse();
            lock.hold(0);
            let isHolding = lock.isHolding();
            console.info(`${TAG} isHolding: ${isHolding}`);
            expect(isHolding).assertFalse();
            done();
          })
          .catch((error) => {
            console.error(`${TAG} error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(401);
            done();
          })
          .finally(() => {
            console.info(`${TAG} finally`);
            done();
          })
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_2700
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0270
     * @tc.desc   hold(timeout: number): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2700';
      try {
        runningLock.create(false, runningLock.RunningLockType.BACKGROUND, (error, lock) => {
          if (error) {
            console.error(`${TAG} error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(401);
            done();
          } else {
            expect(lock).not().assertUndefined();
            let holding = lock.isHolding();
            console.info(`${TAG} holding: ${holding}`);
            expect(holding).assertFalse();
            lock.hold(0);
            let isHolding = lock.isHolding();
            console.info(`${TAG} isHolding: ${isHolding}`);
            expect(isHolding).assertFalse();
            done();
          }
        })
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_2800
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0280
     * @tc.desc   hold(timeout: number): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2800';
      try {
        runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL + 1)
          .then((lock) => {
            expect(lock).not().assertUndefined();
            let holding = lock.isHolding();
            console.info(`${TAG} holding: ${holding}`);
            expect(holding).assertFalse();
            lock.hold(0);
            let isHolding = lock.isHolding();
            console.info(`${TAG} isHolding: ${isHolding}`);
            expect(isHolding).assertFalse();
            done();
          })
          .catch((error) => {
            console.error(`${TAG} error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(401);
            done();
          })
          .finally(() => {
            console.info(`${TAG} finally`);
            done();
          })
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_2900
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0290
     * @tc.desc   Create lock input invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_2900';
      try {
        runningLock.create(runningLock.RunningLockType.BACKGROUND,
          runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL + 1, (error, lock) => {
            console.error(`${TAG} error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(401);
            console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
            expect(lock).assertUndefined();
            done();
          });
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        // 401: Invalid input parameter
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_3000
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0300
     * @tc.desc   Create lock input invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3000';
      try {
        runningLock.create(false, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL + 1)
          .then((lock) => {
            expect(lock).not().assertUndefined();
            let holding = lock.isHolding();
            console.info(`${TAG} holding: ${holding}`);
            expect(holding).assertFalse();
            lock.hold(0);
            let isHolding = lock.isHolding();
            console.info(`${TAG} isHolding: ${isHolding}`);
            expect(isHolding).assertFalse();
            done();
          })
          .catch((error) => {
            console.error(`${TAG} error: ${error.code} ${error.message}`);
            expect(error.code).assertEqual(401);
            done();
          })
          .finally(() => {
            console.info(`${TAG} finally`);
            done();
          })
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_3100
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0310
     * @tc.desc   The lock type is BACKGROUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3100';
      try {
        let runningLockType = runningLock.RunningLockType.BACKGROUND;
        console.info(`${TAG} runningLockType: ${runningLockType}`);
        expect(runningLockType).assertEqual(1);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_3200
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0320
     * @tc.desc   The lock type is BACKGROUND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3200';
      try {
        let runningLockType = runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL;
        console.info(`${TAG} runningLockType: ${runningLockType}`);
        expect(runningLockType).assertEqual(2);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_3300
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0330
     * @tc.desc   Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3300';
      runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND)
        .then(supported => {
          console.info(`${TAG} supported: ${supported}`);
          expect(supported).assertTrue();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_3400
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0340
     * @tc.desc   Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3400';
      runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
        .then(supported => {
          console.info(`${TAG} supported: ${supported}`);
          expect(supported).assertTrue();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_3500
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0350
     * @tc.desc   Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3500';
      runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND, (error, isSupported) => {
        if (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${TAG} isSupported: ${isSupported}`);
          expect(isSupported).assertTrue();
          done();
        }
      })
    })

    /**
     * @tc.name   RunningLockTest_3600
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0360
     * @tc.desc   Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3600';
      runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL,
        (error, isSupported) => {
          if (error) {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${TAG} isSupported: ${isSupported}`);
            expect(isSupported).assertTrue();
            done();
          }
        })
    })

    /**
     * @tc.name   RunningLockTest_3700
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0370
     * @tc.desc   Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3700';
      runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND - 1,
        (error, isSupported) => {
          if (error) {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${TAG} isSupported: ${isSupported}`);
            expect(isSupported).assertFalse();
            done();
          }
        })
    })

    /**
     * @tc.name   RunningLockTest_3800
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0380
     * @tc.desc   Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3800';
      runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL + 1,
        (error, isSupported) => {
          if (error) {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${TAG} isSupported: ${isSupported}`);
            expect(isSupported).assertFalse();
            done();
          }
        })
    })

    /**
     * @tc.name   RunningLockTest_3900
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0390
     * @tc.desc   Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_3900';
      runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.BACKGROUND - 1)
        .then(supported => {
          console.info(`${TAG} supported: ${supported}`);
          expect(supported).assertFalse();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_4000
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0400
     * @tc.desc   Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_4000';
      runningLock.isRunningLockTypeSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL + 1)
        .then(supported => {
          console.info(`${TAG} supported: ${supported}`);
          expect(supported).assertFalse();
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   RunningLockTest_4100
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0410
     * @tc.desc   Checks whether the specified RunningLockType is supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_4100';
      try {
        let isSupported = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND);
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_4200
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0420
     * @tc.desc   Checks whether the specified RunningLockType is supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_4200';
      try {
        let isSupported = runningLock.isSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL);
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_4300
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0430
     * @tc.desc   Checks whether the specified RunningLockType is supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_4300';
      try {
        let isSupported = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND - 1);
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertFalse();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_4400
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0440
     * @tc.desc   Checks whether the specified RunningLockType is supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_4400';
      try {
        let isSupported = runningLock.isSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL + 1);
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertFalse();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_4500
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0450
     * @tc.desc   Checks whether the specified RunningLockType is supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_4500';
      try {
        let isSupported = runningLock.isSupported('PROXIMITY_SCREEN_CONTROL');
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertUndefined();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_4600
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0460
     * @tc.desc   Checks whether the specified RunningLockType is supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_4600';
      try {
        let isSupported = runningLock.isSupported(true);
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertUndefined();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   RunningLockTest_4700
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0470
     * @tc.desc   Checks whether the specified RunningLockType is supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RunningLockTest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'RunningLockTest_4700';
      try {
        let isSupported = runningLock.isSupported({
          type: runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL
        });
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(isSupported).assertUndefined();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0480
     * @tc.name testRunningLockTest_4800
     * @tc.desc test BACKGROUND_USER_IDLE
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testRunningLockTest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'testRunningLockTest_4800';
      try {
        let backgroundUserIdle = runningLock.RunningLockType.BACKGROUND_USER_IDLE;
        console.info(`${TAG} backgroundUserIdle: ${backgroundUserIdle}`);
        expect(backgroundUserIdle).assertEqual(129);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        console.info(`${TAG} finally`);
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0490
     * @tc.name testRunningLockTest_4900
     * @tc.desc test BACKGROUND_USER_IDLE
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testRunningLockTest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'testRunningLockTest_4900';
      try {
        let isSupported = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
        console.info(`${TAG} isSupported: ${isSupported}`);
        if (isSupported) {
          let lock = await runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE);
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          console.info(`${TAG} lock: ${lock instanceof runningLock.RunningLock}`);
          let isRunningLock = lock instanceof runningLock.RunningLock;
          expect(isRunningLock).assertTrue();
        } else {
          console.error(`${TAG} The device does not support this type of lock!`);
        }
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        console.info(`${TAG} finally`);
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0500
     * @tc.name testRunningLockTest_5000
     * @tc.desc test BACKGROUND_USER_IDLE
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testRunningLockTest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'testRunningLockTest_5000';
      try {
        let isSupported = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
        console.info(`${TAG} isSupported: ${isSupported}`);
        if (isSupported) {
          let lock = await runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE);
          console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
          console.info(`${TAG} lock: ${lock instanceof runningLock.RunningLock}`);
          let isRunningLock = lock instanceof runningLock.RunningLock;
          expect(isRunningLock).assertTrue();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
          lock.hold(500);
          isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertTrue();
          lock.unhold();
          isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertFalse();
        } else {
          console.error(`${TAG} The device does not support this type of lock!`);
        }
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        console.info(`${TAG} finally`);
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0510
     * @tc.name testRunningLockTest_5100
     * @tc.desc test BACKGROUND_USER_IDLE
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testRunningLockTest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'testRunningLockTest_5100';
      try {
        let isSupported = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
        console.info(`${TAG} isSupported: ${isSupported}`);
        if (isSupported) {
          runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE, (error, lock) => {
            if (error) {
              console.error(`${TAG} error: ${JSON.stringify(error)}`);
              expect().assertFail();
            } else {
              console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
              console.info(`${TAG} lock: ${lock instanceof runningLock.RunningLock}`);
              let isRunningLock = lock instanceof runningLock.RunningLock;
              expect(isRunningLock).assertTrue();
            }
          });
        } else {
          console.error(`${TAG} The device does not support this type of lock!`);
        }
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        console.info(`${TAG} finally`);
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0520
     * @tc.name testRunningLockTest_5200
     * @tc.desc test BACKGROUND_USER_IDLE
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('testRunningLockTest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'testRunningLockTest_5200';
      try {
        let isSupported = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
        console.info(`${TAG} isSupported: ${isSupported}`);
        if (isSupported) {
          runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE, (error, lock) => {
            if (error) {
              console.error(`${TAG} error: ${JSON.stringify(error)}`);
              expect().assertFail();
            } else {
              console.info(`${TAG} lock: ${JSON.stringify(lock)}`);
              console.info(`${TAG} lock: ${lock instanceof runningLock.RunningLock}`);
              let isRunningLock = lock instanceof runningLock.RunningLock;
              expect(isRunningLock).assertTrue();
              let isHolding = lock.isHolding();
              console.info(`${TAG} isHolding: ${isHolding}`);
              expect(isHolding).assertFalse();
              lock.hold(1500);
              isHolding = lock.isHolding();
              console.info(`${TAG} isHolding: ${isHolding}`);
              expect(isHolding).assertTrue();
              lock.unhold();
              isHolding = lock.isHolding();
              console.info(`${TAG} isHolding: ${isHolding}`);
              expect(isHolding).assertFalse();
            }
          });
        } else {
          console.error(`${TAG} The device does not support this type of lock!`);
        }
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        console.info(`${TAG} finally`);
        done();
      }
    })
  })
} 