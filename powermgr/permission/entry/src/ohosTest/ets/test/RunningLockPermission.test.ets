/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import runningLock from '@ohos.runningLock';

const PERMISSION_DENIED_CODE = 201

export default function RunningLockPermissionTest() {
  describe('RunningLockPermissionTest', () => {
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

    /*
     * @tc.number  RunningLockPermissionTest_0100
     * @tc.name   testRunningLockPermissionTest_0100
     * @tc.desc    Function test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('RunningLockPermissionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'RunningLockPermissionTest_0100';
      runningLock.create('running_lock_test', runningLock.RunningLockType.BACKGROUND, (error: BusinessError, lock: runningLock.RunningLock) => {
        console.info(`${TAG} lock:${lock}`);
        if (lock === undefined) {
          console.error(TAG + ` err: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
    });

    /*
     * @tc.number  RunningLockPermissionTest_0200
     * @tc.name   testRunningLockPermissionTest_0200
     * @tc.desc    Function test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('RunningLockPermissionTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'RunningLockPermissionTest_0200';
      try {
        runningLock.create('running_lock_test', runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
          .then((lock) => {
            console.info(`${TAG} lock: ${lock}`);
            expect().assertFail();
            done();
          })
          .catch((error: BusinessError) => {
            console.error(TAG + ` err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          })
          .finally(() => {
            console.info(`${TAG} runningLock.create finally`);
          })
      } catch (error) {
        console.error(TAG + ` err: ${error.code}  ${error.message}`);
        expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
        done();
      }
    });

    /*
     * @tc.number  RunningLockPermissionTest_0300
     * @tc.name   testRunningLockPermissionTest_0300
     * @tc.desc    Function test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('RunningLockPermissionTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'RunningLockPermissionTest_0300';
      let lock = new runningLock.RunningLock();
      console.info(`${TAG} lock: ${lock}`);
      console.info(`${TAG} lock: ${JSON.stringify(lock)}`)
      if (lock !== undefined) {
        try {
          lock.hold(500);
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertUndefined();
          done();
        } catch (error) {
          console.error(TAG + ` err: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }
      } else {
        expect(lock).assertUndefined();
        done();
      }
    });

    /*
     * @tc.number  RunningLockPermissionTest_0400
     * @tc.name   testRunningLockPermissionTest_0400
     * @tc.desc    Function test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('RunningLockPermissionTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'RunningLockPermissionTest_0400';
      let lock = new runningLock.RunningLock();
      console.info(`${TAG} lock: ${lock}`);
      if (lock !== undefined) {
        try {
          lock.unhold();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertUndefined();
          done();
        } catch (error) {
          console.error(TAG + ` err: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }
      } else {
        expect(lock).assertUndefined();
        done();
      }
    });

    /*
     * @tc.number  RunningLockPermissionTest_0500
     * @tc.name   testRunningLockPermissionTest_0500
     * @tc.desc    Function test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('RunningLockPermissionTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'RunningLockPermissionTest_0500';
      runningLock.createRunningLock('running_lock_test', runningLock.RunningLockType.BACKGROUND,
        (error: BusinessError, lock: runningLock.RunningLock) => {
          console.info(`${TAG} lock:${lock}`);
          if (lock === undefined) {
            console.info(`${TAG} error:${error}`);
            expect(lock).assertUndefined();
            done();
          } else {
            expect().assertFail();
            done();
          }
      });
    });

    /*
     * @tc.number  RunningLockPermissionTest_0600
     * @tc.name   testRunningLockPermissionTest_0600
     * @tc.desc    Function test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('RunningLockPermissionTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'RunningLockPermissionTest_0600';
      try {
        await runningLock.createRunningLock('running_lock_test', runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
          .then((lock) => {
            console.info(`${TAG} lock: ${lock}`);
            expect().assertFail();
            done();
          })
          .catch((error: BusinessError) => {
            console.error(`${TAG} error: ${error.message}`);
            expect(error.message).assertEqual('runningLock create failed');
            done();
          })
          .finally(() => {
            console.info(`${TAG} runningLock.create finally`);
          });
        done();
      } catch (error) {
        console.error(`${TAG} error: ${error.message}`);
        expect(error.message).assertEqual('runningLock create failed');
        done();
      }
    });

    /*
     * @tc.number  RunningLockPermissionTest_0700
     * @tc.name   testRunningLockPermissionTest_0700
     * @tc.desc    Function test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('RunningLockPermissionTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: Function) => {
      let TAG = 'RunningLockPermissionTest_0700';
      let lock = new runningLock.RunningLock();
      console.info(`${TAG} lock: ${lock}`);
      console.info(`${TAG} lock: ${JSON.stringify(lock)}`)
      if (lock !== undefined) {
        try {
          lock.lock(500);
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertUndefined();
          done();
        } catch (error) {
          console.error(TAG + ` err: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }
      }else {
        expect(lock).assertUndefined();
        done();
      }
    });

    /*
     * @tc.number  RunningLockPermissionTest_0800
     * @tc.name   testRunningLockPermissionTest_0800
     * @tc.desc    Function test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('RunningLockPermissionTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'RunningLockPermissionTest_0800';
      let lock = new runningLock.RunningLock();
      console.info(`${TAG} lock: ${lock}`);
      if (lock !== undefined) {
        try {
          lock.unlock();
          let isHolding = lock.isHolding();
          console.info(`${TAG} isHolding: ${isHolding}`);
          expect(isHolding).assertUndefined();
          done();
        } catch (error) {
          console.error(TAG + ` err: ${error.code}  ${error.message}`);
          expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }
      } else {
        expect(lock).assertUndefined();
        done();
      }
    });
  })
}