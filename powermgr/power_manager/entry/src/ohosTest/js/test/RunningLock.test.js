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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0010
     * @tc.name testRunningLockTest_0100
     * @tc.desc createRunningLock(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.level: Level 1
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0020
     * @tc.name testRunningLockTest_0200
     * @tc.desc createRunningLock(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.level: Level 1
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0030
     * @tc.name testRunningLockTest_0300
     * @tc.desc createRunningLock(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.level: Level 1
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0040
     * @tc.name testRunningLockTest_0400
     * @tc.desc createRunningLock(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0050
     * @tc.name testRunningLockTest_0500
     * @tc.desc createRunningLock(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0060
     * @tc.name testRunningLockTest_0600
     * @tc.desc isSupported(type: RunningLockType): boolean;
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0070
     * @tc.name testRunningLockTest_0700
     * @tc.desc isSupported(type: RunningLockType): boolean;
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0080
     * @tc.name testRunningLockTest_0800
     * @tc.desc isSupported(type: RunningLockType): boolean;
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0090
     * @tc.name testRunningLockTest_0900
     * @tc.desc isSupported(type: RunningLockType): boolean;
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0100
     * @tc.name testRunningLockTest_1000
     * @tc.desc isSupported(type: RunningLockType): boolean;
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0110
     * @tc.name testRunningLockTest_1100
     * @tc.desc isSupported(type: RunningLockType): boolean;
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0120
     * @tc.name testRunningLockTest_1200
     * @tc.desc isSupported(type: RunningLockType): boolean;
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0130
     * @tc.name testRunningLockTest_1300
     * @tc.desc isSupported(type: RunningLockType): boolean;
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0140
     * @tc.name testRunningLockTest_1400
     * @tc.desc create(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0150
     * @tc.name testRunningLockTest_1500
     * @tc.desc create(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0160
     * @tc.name testRunningLockTest_1600
     * @tc.desc create(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0170
     * @tc.name testRunningLockTest_1700
     * @tc.desc create(name: string, type: RunningLockType): Promise<RunningLock>
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0180
     * @tc.name testRunningLockTest_1800
     * @tc.desc create(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0190
     * @tc.name testRunningLockTest_1900
     * @tc.desc create(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0200
     * @tc.name testRunningLockTest_2000
     * @tc.desc create(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0210
     * @tc.name testRunningLockTest_2100
     * @tc.desc create(name: string, type: RunningLockType, callback: AsyncCallback<RunningLock>): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0220
     * @tc.name testRunningLockTest_2200
     * @tc.desc hold lock, is holding
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0230
     * @tc.name testRunningLockTest_2300
     * @tc.desc hold(timeout: number): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0240
     * @tc.name testRunningLockTest_2400
     * @tc.desc hold(timeout: number): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0250
     * @tc.name testRunningLockTest_2500
     * @tc.desc hold(timeout: number): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0260
     * @tc.name testRunningLockTest_2600
     * @tc.desc hold(timeout: number): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0270
     * @tc.name testRunningLockTest_2700
     * @tc.desc hold(timeout: number): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0280
     * @tc.name testRunningLockTest_2800
     * @tc.desc hold(timeout: number): void
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0290
     * @tc.name testRunningLockTest_2900
     * @tc.desc Create lock input invalid value
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0300
     * @tc.name testRunningLockTest_3000
     * @tc.desc Create lock input invalid value
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0310
     * @tc.name testRunningLockTest_3100
     * @tc.desc The lock type is BACKGROUND
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0320
     * @tc.name testRunningLockTest_3200
     * @tc.desc The lock type is BACKGROUND
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0330
     * @tc.name testRunningLockTest_3300
     * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0340
     * @tc.name testRunningLockTest_3400
     * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0350
     * @tc.name testRunningLockTest_3500
     * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0360
     * @tc.name testRunningLockTest_3600
     * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0370
     * @tc.name testRunningLockTest_3700
     * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0380
     * @tc.name testRunningLockTest_3800
     * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0390
     * @tc.name testRunningLockTest_3900
     * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0400
     * @tc.name testRunningLockTest_4000
     * @tc.desc Checks whether the specified RunningLockType is supported (deprecated since 9)
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0410
     * @tc.name testRunningLockTest_4100
     * @tc.desc Checks whether the specified RunningLockType is supported.
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0420
     * @tc.name testRunningLockTest_4200
     * @tc.desc Checks whether the specified RunningLockType is supported.
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0430
     * @tc.name testRunningLockTest_4300
     * @tc.desc Checks whether the specified RunningLockType is supported.
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0440
     * @tc.name testRunningLockTest_4400
     * @tc.desc Checks whether the specified RunningLockType is supported.
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0450
     * @tc.name testRunningLockTest_4500
     * @tc.desc Checks whether the specified RunningLockType is supported.
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0460
     * @tc.name testRunningLockTest_4600
     * @tc.desc Checks whether the specified RunningLockType is supported.
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_PowerSystem_RunningLock_JSTest_0470
     * @tc.name testRunningLockTest_4700
     * @tc.desc Checks whether the specified RunningLockType is supported.
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
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
  })
}
