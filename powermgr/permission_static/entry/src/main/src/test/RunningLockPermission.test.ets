/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import runningLock from '@ohos.runningLock';

let domain: int = 0x0000;
let tag: string = 'RunningLockPermissionTest';

export default function RunningLockPermissionTest() {

  describe("RunningLockPermissionTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testRunningLockPermissionTest_static_0100
     * @tc.number RunningLockPermissionETSTest_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRunningLockPermissionTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockPermissionTest_static_0100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          if (isSupported) {
            let lock: runningLock.RunningLock =
              await runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND);
            hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
            expect().assertFail();
          } else {
            hilog.error(domain, tag, `${TAG} The device does not support this type of lock!`);
          }
        } catch (e) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(201);
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })

    /**
     * @tc.name   testRunningLockPermissionTest_static_0200
     * @tc.number RunningLockPermissionETSTest_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockPermissionTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockPermissionTest_static_0200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          if (isSupported) {
            runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL,
              (error: BusinessError | null, lock: runningLock.RunningLock | undefined) => {
                if (lock !== null && lock !== undefined) {
                  hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
                  expect().assertFail();
                } else {
                  hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
                  expect(error?.code).assertEqual(201);
                }
              });
          } else {
            hilog.error(domain, tag, `${TAG} The device does not support this type of lock!`);
          }
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(201);
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })

    /**
     * @tc.name   testRunningLockPermissionTest_static_0300
     * @tc.number RunningLockPermissionETSTest_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockPermissionTest_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockPermissionTest_static_0300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          if (isSupported) {
            let lock: runningLock.RunningLock =
              await runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE);
            hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
            expect().assertFail();
          } else {
            hilog.error(domain, tag, `${TAG} The device does not support this type of lock!`);
          }
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(201);
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })

    /**
     * @tc.name   testRunningLockPermissionTest_static_0400
     * @tc.number RunningLockPermissionETSTest_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockPermissionTest_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockPermissionTest_static_0400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          if (isSupported) {
            runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE,
              (error: BusinessError | null, lock: runningLock.RunningLock | undefined) => {
                if (lock !== null && lock !== undefined) {
                  hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
                  expect().assertFail();
                } else {
                  hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
                  expect(error?.code).assertEqual(201);
                }
              });
          } else {
            hilog.error(domain, tag, `${TAG} The device does not support this type of lock!`);
          }
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(201);
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })
  })
}