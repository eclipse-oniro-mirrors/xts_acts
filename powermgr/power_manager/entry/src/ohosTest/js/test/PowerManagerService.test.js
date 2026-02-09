/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import power from '@ohos.power';
import runningLock from '@ohos.runningLock';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function PowerManagerServiceTest() {
  describe('PowerManagerServiceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // hdc shell pkill powermgr
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
     * @tc.name   PowerManagerServiceTest_0100
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0010
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_0100';
      try {
        let isActive = power.isActive();
        console.info(`${TAG} isActive: ${isActive}`);
        expect(isActive).assertFalse();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_0200
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0020
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_0200';
      try {
        let mode = power.getPowerMode();
        console.info(`${TAG} mode: ${mode}`);
        expect(mode).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_0300
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0030
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_0300';
      try {
        let isStandby = power.isStandby();
        console.info(`${TAG} isStandby: ${isStandby}`);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_0400
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0040
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_0400';
      try {
        let isSupported = runningLock.isSupported(runningLock.RunningLockType.BACKGROUND);
        console.info(`${TAG} isSupported: ${isSupported}`);
        expect(typeof isSupported).assertEqual('boolean');
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_0500
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0050
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_0500';
      try {
        runningLock.RunningLock.hold(500);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_0600
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0060
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_0600';
      try {
        runningLock.RunningLock.unhold();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_0700
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0070
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_0700';
      try {
        runningLock.RunningLock.isHolding();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_0800
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0080
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_0800';
      try {
        power.shutdown('shutdown_test');
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_0900
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0090
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_0900';
      try {
        power.reboot('reboot_test');
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_1000
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0100
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_1000';
      try {
        power.wakeup('wakeup_test');
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_1100
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0110
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_1100';
      try {
        power.suspend(true);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_1200
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0120
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_1200';
      try {
        power.setPowerMode(power.DevicePowerMode.MODE_PERFORMANCE, (error) => {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(4900101);
          done();
        });
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_1300
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0130
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_1300';
      try {
        power.setPowerMode(power.DevicePowerMode.MODE_PERFORMANCE)
          .then(() => {
            console.info(`${TAG} set power mode to MODE_PERFORMANCE`);
          })
          .catch(error => {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(4900101);
            done();
          })
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_1400
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0140
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_1400';
      try {
        power.setScreenOffTime(3000);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   PowerManagerServiceTest_1500
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0150
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerManagerServiceTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'PowerManagerServiceTest_1500';
      try {
        power.hibernate(true);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   testPowerManagerServiceTest_1600
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0160
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPowerManagerServiceTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'testPowerManagerServiceTest_1600';
      try {
        power.refreshActivity(TAG);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   testPowerManagerServiceTest_1700
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0170
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPowerManagerServiceTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'testPowerManagerServiceTest_1700';
      try {
        power.setPowerKeyFilteringStrategy(power.PowerKeyFilteringStrategy.DISABLE_LONG_PRESS_FILTERING);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
        done();
      }
    });

    /**
     * @tc.name   testPowerManagerServiceTest_1800
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0180
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPowerManagerServiceTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'testPowerManagerServiceTest_1800';
      try {
        power.registerShutdownCallback((isReboot) => {
          console.info(`${TAG} isReboot:${isReboot}`);
        });
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
      } finally {
        console.info(`${TAG} finally`);
        done();
      }
    });

    /**
     * @tc.name   testPowerManagerServiceTest_1900
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0190
     * @tc.desc   PowerManagerService stop test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPowerManagerServiceTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'testPowerManagerServiceTest_1900';
      try {
        power.unregisterShutdownCallback(() => {
          console.info(`${TAG} unregisterShutdownCallback`);
        });
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4900101);
      } finally {
        console.info(`${TAG} finally`);
        done();
      }
    });
  });
}