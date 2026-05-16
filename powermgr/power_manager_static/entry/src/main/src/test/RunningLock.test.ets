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

let domain: int = 0x0000;
let tag: string = 'RunningLockTest';

export default function RunningLockTest() {

  describe("RunningLockTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.name   testRunningLockTest_static_0100
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0010
     * @tc.desc   Create lock promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRunningLockTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_0200
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0020
     * @tc.desc   Create lock promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_0300
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0030
     * @tc.desc   Create lock callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_0400
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0040
     * @tc.desc   Create lock callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_0500
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0050
     * @tc.desc   The lock type is PROXIMITY_SCREEN_CONTROL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          hilog.info(domain, tag,
            `${TAG} PROXIMITY_SCREEN_CONTROL: ${runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL}`);
          let runningLockType: number = runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL;
          hilog.info(domain, tag, `${TAG} runningLockType: ${runningLockType}`);
          expect(runningLockType).assertEqual(2);
          done();
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_0600
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0060
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRunningLockTest_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.PROXIMITY_SCREEN_CONTROL);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          expect(isSupported).assertTrue();
          done();
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_0700
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0070
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(1 as runningLock.RunningLockType);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          expect(isSupported).assertTrue();
          done();
        } catch (e) {
          e = e as Error;
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_0800
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0080
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(2 as runningLock.RunningLockType);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          expect(isSupported).assertTrue();
          done();
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_0900
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0090
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_0900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(3 as runningLock.RunningLockType);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          expect().assertFail();
          done();
        } catch (e) {
          e = e as Error;
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.message).assertContain('No enum RunningLockType');
          done();
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1000
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0100
     * @tc.desc   The lock type is PROXIMITY_SCREEN_CONTROL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          hilog.info(domain, tag,
            `${TAG} BACKGROUND: ${runningLock.RunningLockType.BACKGROUND}`);
          let runningLockType: number = runningLock.RunningLockType.BACKGROUND;
          hilog.info(domain, tag, `${TAG} runningLockType: ${runningLockType}`);
          expect(runningLockType).assertEqual(1);
          done();
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1100
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0110
     * @tc.desc   Create lock promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRunningLockTest_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND)
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
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1200
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0120
     * @tc.desc   Create lock promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND)
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
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1300
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0130
     * @tc.desc   Create lock callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND,
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
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1400
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0140
     * @tc.desc   Create lock callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND,
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
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1500
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0150
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRunningLockTest_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          expect(isSupported).assertTrue();
          done();
        } catch (e) {
          if (e instanceof BusinessError) {
            hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1600
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0160
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(0 as runningLock.RunningLockType);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          expect().assertFail();
          done();
        } catch (e) {
          e = e as Error;
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.message).assertContain('No enum RunningLockType');
          done();
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1700
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0170
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          if (isSupported) {
            let lock: runningLock.RunningLock =
              await runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE);
            hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
            let isRunningLock = lock instanceof runningLock.RunningLock;
            expect(isRunningLock).assertTrue();
          } else {
            hilog.error(domain, tag, `${TAG} The device does not support this type of lock!`);
          }
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1800
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0180
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          if (isSupported) {
            let lock: runningLock.RunningLock =
              await runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE);
            hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
            let isRunningLock = lock instanceof runningLock.RunningLock;
            expect(isRunningLock).assertTrue();
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
          } else {
            hilog.error(domain, tag, `${TAG} The device does not support this type of lock!`);
          }
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_1900
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0190
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_1900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          if (isSupported) {
            runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE,
              (error: BusinessError | null, lock: runningLock.RunningLock | undefined) => {
                if (lock !== null && lock !== undefined) {
                  hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
                  let isRunningLock = lock instanceof runningLock.RunningLock;
                  expect(isRunningLock).assertTrue();
                } else {
                  hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
                  expect().assertFail();
                }
              });
          } else {
            hilog.error(domain, tag, `${TAG} The device does not support this type of lock!`);
          }
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_2000
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0200
     * @tc.desc   RunningLock isSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_2000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isSupported: boolean = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND_USER_IDLE);
          hilog.info(domain, tag, `${TAG} isSupported: ${isSupported}`);
          if (isSupported) {
            runningLock.create(TAG, runningLock.RunningLockType.BACKGROUND_USER_IDLE,
              (error: BusinessError | null, lock: runningLock.RunningLock | undefined) => {
                if (lock !== null && lock !== undefined) {
                  hilog.info(domain, tag, `${TAG} lock: ${JSON.stringify(lock)}`);
                  let isRunningLock = lock instanceof runningLock.RunningLock;
                  expect(isRunningLock).assertTrue();
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
                } else {
                  hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
                  expect().assertFail();
                }
              });
          } else {
            hilog.error(domain, tag, `${TAG} The device does not support this type of lock!`);
          }
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })

    /**
     * @tc.name   testRunningLockTest_static_2100
     * @tc.number SUB_PowerSystem_RunningLock_ETSTest_0210
     * @tc.desc   The lock type is BACKGROUND_USER_IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRunningLockTest_static_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testRunningLockTest_static_2100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          hilog.info(domain, tag,
            `${TAG} BACKGROUND: ${runningLock.RunningLockType.BACKGROUND_USER_IDLE}`);
          let runningLockType: int = runningLock.RunningLockType.BACKGROUND_USER_IDLE;
          hilog.info(domain, tag, `${TAG} runningLockType: ${runningLockType}`);
          expect(runningLockType).assertEqual(129);
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
        } finally {
          hilog.info(domain, tag, `${TAG} finally`);
          done();
        }
      })
  })
}