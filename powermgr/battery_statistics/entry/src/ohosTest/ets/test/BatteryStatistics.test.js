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

import batteryStats from '@ohos.batteryStatistics';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function BatteryStatisticsTest() {
  describe('BatteryStatisticsTest', function () {
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
     * @tc.name   System_API_Test_batteryStats_Manager_0100
     * @tc.number System_API_Test_batteryStats_Manager_0100
     * @tc.desc   Test the third-party application call getBatteryStats will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_batteryStats_Manager_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0100';
        let isSupport = canIUse('SystemCapability.PowerManager.BatteryStatistics');
        if (isSupport) {
          try {
            batteryStats.getBatteryStats()
              .then((data) => {
                console.info(`${TAG} BatteryStatsInfo: ${JSON.stringify(data)}`);
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
        } else {
          console.info(`${TAG} SystemCapability.PowerManager.BatteryStatistics isSupport: ${isSupport}`);
          expect(isSupport).assertFalse();
          done();
        }
      })

    /**
     * @tc.name   System_API_Test_batteryStats_Manager_0200
     * @tc.number System_API_Test_batteryStats_Manager_0200
     * @tc.desc   Test the third-party application call getBatteryStats will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_batteryStats_Manager_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0200';
        let isSupport = canIUse('SystemCapability.PowerManager.BatteryStatistics');
        if (isSupport) {
          batteryStats.getBatteryStats((error, data) => {
            if (error) {
              console.error(`${TAG} error: ${JSON.stringify(error)}`);
              expect(error.code).assertEqual(202);
              done();
            } else {
              console.info(`${TAG} BatteryStatsInfo: ${JSON.stringify(data)}`);
              expect().assertFail();
              done();
            }
          });
        } else {
          console.info(`${TAG} SystemCapability.PowerManager.BatteryStatistics isSupport: ${isSupport}`);
          expect(isSupport).assertFalse();
          done();
        }
      })

    /**
     * @tc.name   System_API_Test_batteryStats_Manager_0300
     * @tc.number System_API_Test_batteryStats_Manager_0300
     * @tc.desc   Test the third-party application call getAppPowerValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_batteryStats_Manager_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0300';
        let isSupport = canIUse('SystemCapability.PowerManager.BatteryStatistics');
        if (isSupport) {
          try {
            let value = batteryStats.getAppPowerValue(10021);
            console.info(`${TAG} value: ${value}`);
          } catch (error) {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(202);
            done();
          }
        } else {
          console.info(`${TAG} SystemCapability.PowerManager.BatteryStatistics isSupport: ${isSupport}`);
          expect(isSupport).assertFalse();
          done();
        }
      })

    /**
     * @tc.name   System_API_Test_batteryStats_Manager_0400
     * @tc.number System_API_Test_batteryStats_Manager_0400
     * @tc.desc   Test the third-party application call getAppPowerPercent will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_batteryStats_Manager_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0400';
        let isSupport = canIUse('SystemCapability.PowerManager.BatteryStatistics');
        if (isSupport) {
          try {
            let percent = batteryStats.getAppPowerPercent(10021);
            console.info(`${TAG} percent: ${percent}`);
          } catch (error) {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(202);
            done();
          }
        } else {
          console.info(`${TAG} SystemCapability.PowerManager.BatteryStatistics isSupport: ${isSupport}`);
          expect(isSupport).assertFalse();
          done();
        }
      })

    /**
     * @tc.name   System_API_Test_batteryStats_Manager_0500
     * @tc.number System_API_Test_batteryStats_Manager_0500
     * @tc.desc   Test the third-party application call getHardwareUnitPowerValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_batteryStats_Manager_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0500';
        let isSupport = canIUse('SystemCapability.PowerManager.BatteryStatistics');
        if (isSupport) {
          try {
            let value = batteryStats.getHardwareUnitPowerValue(batteryStats.ConsumptionType.CONSUMPTION_TYPE_USER);
            console.info(`${TAG} value: ${value}`);
          } catch (error) {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(202);
            done();
          }
        } else {
          console.info(`${TAG} SystemCapability.PowerManager.BatteryStatistics isSupport: ${isSupport}`);
          expect(isSupport).assertFalse();
          done();
        }
      })

    /**
     * @tc.name   System_API_Test_batteryStats_Manager_0600
     * @tc.number System_API_Test_batteryStats_Manager_0600
     * @tc.desc   Test the third-party application call getHardwareUnitPowerPercent will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_batteryStats_Manager_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryStats_Manager_0600';
        let isSupport = canIUse('SystemCapability.PowerManager.BatteryStatistics');
        if (isSupport) {
          try {
            let percent = batteryStats.getHardwareUnitPowerPercent(batteryStats.ConsumptionType.CONSUMPTION_TYPE_WIFI);
            console.info(`${TAG} percent: ${percent}`);
          } catch (error) {
            console.error(`${TAG} error: ${JSON.stringify(error)}`);
            expect(error.code).assertEqual(202);
            done();
          }
        } else {
          console.info(`${TAG} SystemCapability.PowerManager.BatteryStatistics isSupport: ${isSupport}`);
          expect(isSupport).assertFalse();
          done();
        }
      })
  })
}
