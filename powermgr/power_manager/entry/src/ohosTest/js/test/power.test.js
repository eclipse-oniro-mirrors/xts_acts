/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import power from '@ohos.power';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

function isPowerMode(mode) {
  if (typeof mode !== 'number') {
    return false;
  }
  return (mode >= power.DevicePowerMode.MODE_NORMAL && mode <= power.DevicePowerMode.MODE_EXTREME_POWER_SAVE) ||
    mode == power.DevicePowerMode.MODE_CUSTOM_POWER_SAVE;
}

export default function PowerTest() {
  describe('PowerTest', function () {
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
     * @tc.name   Power_IsScreenOn_Promise_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0010
     * @tc.desc   Checks whether the screen of a device is on or off (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Power_IsScreenOn_Promise_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      let TAG = 'Power_IsScreenOn_Promise_Test';
      power.isScreenOn()
        .then(data => {
          console.info(`${TAG} data: ${data}`);
          console.info(`${TAG} typeof data: ${typeof data}`);
          expect(typeof data).assertEqual('boolean');
          let isActive = power.isActive();
          expect(data).assertEqual(isActive);
          done();
        })
        .catch(error => {
          console.error(`${TAG} error: ${error.code} ${error.message}`);
          expect().assertFail();
          done();
        })
    })

    /**
     * @tc.name   Power_IsScreenOn_Callback_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0020
     * @tc.desc   Checks whether the screen of a device is on or off (deprecated since 9)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Power_IsScreenOn_Callback_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      let TAG = 'Power_IsScreenOn_Callback_Test';
      power.isScreenOn((error, data) => {
        if (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        } else {
          console.info(`${TAG} data: ${data}`);
          console.info(`${TAG} typeof data: ${typeof data}`);
          expect(typeof data).assertEqual('boolean');
          let isActive = power.isActive();
          expect(data).assertEqual(isActive);
          done();
        }
      })
    })

    /**
     * @tc.name   Power_IsActive_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0030
     * @tc.desc   On and Off Screen and get the current screen on and off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Power_IsActive_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let TAG = 'Power_IsActive_Test';
      try {
        let isActive = power.isActive();
        console.info(`${TAG} isActive: ${isActive}`);
        console.info(`${TAG} typeof isActive: ${typeof isActive}`);
        expect(typeof isActive).assertEqual('boolean');
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testPower_GetPowerMode_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0040
     * @tc.desc   Gets and sets the power mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPower_GetPowerMode_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let TAG = 'testPower_GetPowerMode_Test';
      try {
        let currentMode = power.getPowerMode();
        console.info(`${TAG} currentMode: ${currentMode}`);
        expect(isPowerMode(currentMode)).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Power_DevicePowerMode_MODENORMAL_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0050
     * @tc.desc   Get device power mode MODE_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Power_DevicePowerMode_MODENORMAL_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Power_DevicePowerMode_MODENORMAL_Test';
        try {
          let devicePowerMode = power.DevicePowerMode.MODE_NORMAL;
          console.info(`${TAG} devicePowerMode: ${devicePowerMode}`);
          expect(devicePowerMode).assertEqual(600);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Power_DevicePowerMode_MODEPOWERSAVE_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0060
     * @tc.desc   Get device power mode MODE_POWER_SAVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Power_DevicePowerMode_MODEPOWERSAVE_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Power_DevicePowerMode_MODEPOWERSAVE_Test';
        try {
          let devicePowerMode = power.DevicePowerMode.MODE_POWER_SAVE;
          console.info(`${TAG} devicePowerMode: ${devicePowerMode}`);
          expect(devicePowerMode).assertEqual(601);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Power_DevicePowerMode_MODEPERFORMANCE_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0070
     * @tc.desc   Get device power mode MODE_PERFORMANCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Power_DevicePowerMode_MODEPERFORMANCE_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Power_DevicePowerMode_MODEPERFORMANCE_Test';
        try {
          let devicePowerMode = power.DevicePowerMode.MODE_PERFORMANCE;
          console.info(`${TAG} devicePowerMode: ${devicePowerMode}`);
          expect(devicePowerMode).assertEqual(602);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Power_DevicePowerMode_MODE_EXTREME_POWER_SAVE_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0080
     * @tc.desc   Get device power mode MODE_EXTREME_POWER_SAVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Power_DevicePowerMode_MODE_EXTREME_POWER_SAVE_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Power_DevicePowerMode_MODE_EXTREME_POWER_SAVE_Test';
        try {
          let devicePowerMode = power.DevicePowerMode.MODE_EXTREME_POWER_SAVE;
          console.info(`${TAG} devicePowerMode: ${devicePowerMode}`);
          expect(devicePowerMode).assertEqual(603);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Power_DevicePowerMode_MODE_CUSTOM_POWER_SAVE_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0081
     * @tc.desc   Get device power mode MODE_CUSTOM_POWER_SAVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Power_DevicePowerMode_MODE_CUSTOM_POWER_SAVE_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Power_DevicePowerMode_MODE_CUSTOM_POWER_SAVE_Test';
        try {
          let devicePowerMode = power.DevicePowerMode.MODE_CUSTOM_POWER_SAVE;
          console.info(`${TAG} devicePowerMode: ${devicePowerMode}`);
          expect(devicePowerMode).assertEqual(650);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Power_IsStandby_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0090
     * @tc.desc   Device isStandby interface verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Power_IsStandby_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'Power_IsStandby_Test';
      try {
        let isStandby = power.isStandby();
        console.info(`${TAG} isStandby: ${isStandby}`);
        expect(isStandby).assertFalse();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0100
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0080
     * @tc.desc   Test the third-party application call reboot will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0100';
      try {
        power.reboot(TAG);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0200
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0090
     * @tc.desc   Test the third-party application call wakeup will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0200';
      try {
        power.wakeup(TAG);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0300
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0100
     * @tc.desc   Test the third-party application call suspend will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0300';
      try {
        power.suspend(true);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0400
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0110
     * @tc.desc   Test the third-party application call suspend will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0400';
      try {
        power.suspend(false);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0500
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0110
     * @tc.desc   Test the third-party application call suspend will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0500';
      try {
        power.suspend();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0600
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0120
     * @tc.desc   Test the third-party application call setPowerMode will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0600';
      try {
        power.setPowerMode(power.DevicePowerMode.MODE_PERFORMANCE, (error) => {
          if (error) {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(202);
            done();
          } else {
            console.info('set power mode to MODE_PERFORMANCE');
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0601
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0121
     * @tc.desc   Test the third-party application call setPowerMode will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0601';
      try {
        power.setPowerMode(power.DevicePowerMode.MODE_CUSTOM_POWER_SAVE, (error) => {
          if (error) {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(202);
            done();
          } else {
            console.info('set power mode to MODE_CUSTOM_POWER_SAVE');
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0700
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0130
     * @tc.desc   Test the third-party application call setPowerMode will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0700';
      try {
        power.setPowerMode(power.DevicePowerMode.MODE_PERFORMANCE)
          .then(() => {
            console.info('set power mode to MODE_PERFORMANCE');
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(202);
            done();
          });
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0701
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0131
     * @tc.desc   Test the third-party application call setPowerMode will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0701';
      try {
        power.setPowerMode(power.DevicePowerMode.MODE_CUSTOM_POWER_SAVE)
          .then(() => {
            console.info('set power mode to MODE_CUSTOM_POWER_SAVE');
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(202);
            done();
          });
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0800
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0140
     * @tc.desc   Test the third-party application call setPowerMode will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0800';
      try {
        power.setPowerMode(power.DevicePowerMode.MODE_NORMAL)
          .then(() => {
            console.info('set power mode to MODE_NORMAL');
            expect().assertFail();
            done();
          })
          .catch((error) => {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(202);
            done();
          });
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_0900
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0150
     * @tc.desc   Test the third-party application call setScreenOffTime will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_0900';
      try {
        power.setScreenOffTime(3000);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   System_API_Test_Power_Manager_1000
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0160
     * @tc.desc   Test the third-party application call setScreenOffTime will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_Power_Manager_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'System_API_Test_Power_Manager_1000';
      try {
        power.hibernate(true);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   testSystem_API_Test_Power_Manager_1100
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0170
     * @tc.desc   Test the third-party application call setScreenOffTime will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystem_API_Test_Power_Manager_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'testSystem_API_Test_Power_Manager_1100';
      try {
        power.hibernate(false);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   testSystem_API_Test_Power_Manager_1200
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0180
     * @tc.desc   Test the third-party application call refreshActivity will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystem_API_Test_Power_Manager_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'testSystem_API_Test_Power_Manager_1200';
      try {
        power.refreshActivity(TAG);
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   testSystem_API_Test_Power_Manager_1300
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0190
     * @tc.desc   Test the third-party application call setPowerKeyFilteringStrategy will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystem_API_Test_Power_Manager_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'testSystem_API_Test_Power_Manager_1300';
        try {
          power.setPowerKeyFilteringStrategy(power.PowerKeyFilteringStrategy.DISABLE_LONG_PRESS_FILTERING);
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testSystem_API_Test_Power_Manager_1400
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0200
     * @tc.desc   Test the third-party application call refreshActivity will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystem_API_Test_Power_Manager_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'testSystem_API_Test_Power_Manager_1400';
      try {
        power.registerShutdownCallback((isReboot) => {
          console.info(`${TAG} isReboot:${isReboot}`);
        });
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
      } finally {
        console.info(`${TAG} finally`);
        done();
      }
    })

    /**
     * @tc.name   testSystem_API_Test_Power_Manager_1500
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0210
     * @tc.desc   Test the third-party application call refreshActivity will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystem_API_Test_Power_Manager_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'testSystem_API_Test_Power_Manager_1500';
      try {
        power.unregisterShutdownCallback(() => {
          console.info(`${TAG} unregisterShutdownCallback`);
        });
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
      } finally {
        console.info(`${TAG} finally`);
        done();
      }
    })

    /**
     * @tc.name   PowerKeyFilteringStrategy_DISABLE_LONG_PRESS_FILTERING_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0200
     * @tc.desc   Power Key Filtering Strategy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerKeyFilteringStrategy_DISABLE_LONG_PRESS_FILTERING_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'PowerKeyFilteringStrategy_DISABLE_LONG_PRESS_FILTERING_Test';
        try {
          let filteringStrategy = power.PowerKeyFilteringStrategy.DISABLE_LONG_PRESS_FILTERING;
          console.info(`${TAG} filteringStrategy: ${filteringStrategy}`);
          expect(filteringStrategy).assertEqual(0);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   PowerKeyFilteringStrategy_LONG_PRESS_FILTERING_ONCE_Test
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0210
     * @tc.desc   Power Key Filtering Strategy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('PowerKeyFilteringStrategy_LONG_PRESS_FILTERING_ONCE_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'PowerKeyFilteringStrategy_LONG_PRESS_FILTERING_ONCE_Test';
        try {
          let filteringStrategy = power.PowerKeyFilteringStrategy.LONG_PRESS_FILTERING_ONCE;
          console.info(`${TAG} filteringStrategy: ${filteringStrategy}`);
          expect(filteringStrategy).assertEqual(1);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })
  })
}
