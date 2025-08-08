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
import runningLock from '@ohos.runningLock'

let domain: number = 0x0000;
let tag: string = 'RunningLockStaticTest';

export default function RunningLockTest() {

  describe("RunningLockTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0010
     * @tc.name testRunningLockTest_static_0100
     * @tc.desc Create lock promise
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testRunningLockTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
            .then((lock: runningLock.RunningLock) => {
              hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
              expect(lock).not().assertUndefined();
              done();
            })
            .catch((error: Error): void => {
              hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
              expect().assertFail();
              done();
            })
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0020
     * @tc.name testRunningLockTest_static_0200
     * @tc.desc Create lock promise
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testRunningLockTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)
            .then((lock: runningLock.RunningLock) => {
              hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
              expect(lock).not().assertUndefined();
              let isHold: boolean = lock.isHolding();
              hilog.info(domain, tag, `${TAG} before hold isHold: ${JSON.stringify(isHold)}`);
              expect(isHold).assertFalse();
              lock.hold(5000);
              isHold = lock.isHolding();
              hilog.info(domain, tag, `${TAG} after hold isHold: ${JSON.stringify(isHold)}`);
              expect(isHold).assertTrue();
              lock.unhold();
              isHold = lock.isHolding();
              hilog.info(domain, tag, `${TAG} after unhold isHold: ${JSON.stringify(isHold)}`);
              expect(isHold).assertFalse();
              done();
            })
            .catch((error: Error): void => {
              hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
              expect().assertFail();
              done();
            })
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0030
     * @tc.name testRunningLockTest_static_0300
     * @tc.desc Create lock callback
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testRunningLockTest_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL,
            (error: BusinessError | null, lock: runningLock.RunningLock | undefined) => {
              if (lock !== null && lock !== undefined) {
                hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
                expect(lock).not().assertUndefined();
                done();
              } else {
                hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
              }
            })
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0040
     * @tc.name testRunningLockTest_static_0400
     * @tc.desc Create lock callback
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testRunningLockTest_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          runningLock.create(TAG, runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL,
            (error: BusinessError | null, lock: runningLock.RunningLock | undefined) => {
              if (lock !== null && lock !== undefined) {
                hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
                expect(lock).not().assertUndefined();
                let isHold: boolean = lock.isHolding();
                hilog.info(domain, tag, `${TAG} before hold isHold: ${JSON.stringify(isHold)}`);
                expect(isHold).assertFalse();
                lock.hold(5000);
                isHold = lock.isHolding();
                hilog.info(domain, tag, `${TAG} after hold isHold: ${JSON.stringify(isHold)}`);
                expect(isHold).assertTrue();
                lock.unhold();
                isHold = lock.isHolding();
                hilog.info(domain, tag, `${TAG} after unhold isHold: ${JSON.stringify(isHold)}`);
                expect(isHold).assertFalse();
                done();
              } else {
                hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
              }
            })
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0050
     * @tc.name testRunningLockTest_static_0500
     * @tc.desc The lock type is PROXIMITY_SCREEN_CONTROL
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testRunningLockTest_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          hilog.info(domain, tag,
            `${TAG} PROXIMITY_SCREEN_CONTROL: ${runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL}`);
          expect(Number(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL)).assertEqual(2);
          done();
        } catch (e : BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'RunningLockStaticTest end');
}