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
import hilog from '@ohos.hilog'
import batteryStats from '@ohos.batteryStatistics'
import { BusinessError } from '@ohos.base'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'BatteryStatisticsTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function BatteryStatisticsTest() {

  describe("BatteryStatisticsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'BatteryStatisticsTest start');
    /**
     * @tc.name   testBatteryStatisticsTest_static_0100
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0010
     * @tc.desc   Test the third-party application call getBatteryStats will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_0100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          batteryStats.getBatteryStats()
            .then((data: batteryStats.BatteryStatsInfo[]) => {
              hilog.error(domain, tag, `${TAG} getBatteryStats Failure`);
              expect().assertFail();
              done();
            })
            .catch((error: Error): void => {
              hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
              expect(error.code).assertEqual(202);
              done();
            });
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_0200
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0020
     * @tc.desc   Test the third-party application call getBatteryStats will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_0200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          batteryStats.getBatteryStats(
            (error: BusinessError | null, data: Array<batteryStats.BatteryStatsInfo> | undefined) => {
              if (error) {
                hilog.error(domain, tag, `${TAG} error: ${JSON.stringify(error)}`);
                expect(error?.code).assertEqual(202);
                done();
              } else {
                hilog.error(domain, tag, `${TAG} getBatteryStats Failure`);
                expect().assertFail();
                done();
              }
            })
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_0300
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0030
     * @tc.desc   Test the third-party application call getAppPowerValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_0300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let value: double = batteryStats.getAppPowerValue(10021);
          hilog.info(domain, tag, `${TAG} value: ${value}`);
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_0400
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0040
     * @tc.desc   Test the third-party application call getAppPowerPercent will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_0400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let percent: double = batteryStats.getAppPowerPercent(10021);
          hilog.info(domain, tag, `${TAG} percent: ${percent}`);
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_0500
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0050
     * @tc.desc   Test the third-party application call getHardwareUnitPowerValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_0500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let value: double =
            batteryStats.getHardwareUnitPowerValue(batteryStats.ConsumptionType.CONSUMPTION_TYPE_USER);
          hilog.info(domain, tag, `${TAG} value: ${value}`);
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_0600
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0060
     * @tc.desc   Test the third-party application call getHardwareUnitPowerPercent will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_0600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let percent: double =
            batteryStats.getHardwareUnitPowerPercent(batteryStats.ConsumptionType.CONSUMPTION_TYPE_WIFI);
          hilog.info(domain, tag, `${TAG} percent: ${percent}`);
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_0700
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0070
     * @tc.desc   batteryStats ConsumptionType type CONSUMPTION_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_0700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let consumptionType: number = batteryStats.ConsumptionType.CONSUMPTION_TYPE_INVALID;
          hilog.info(domain, tag, `${TAG} consumptionType type: ${typeof consumptionType}`);
          expect(consumptionType).assertEqual(-17);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_0800
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0080
     * @tc.desc   batteryStats ConsumptionType type CONSUMPTION_TYPE_APP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_0800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let consumptionType: number = batteryStats.ConsumptionType.CONSUMPTION_TYPE_APP;
          hilog.info(domain, tag, `${TAG} consumptionType type: ${typeof consumptionType}`);
          expect(consumptionType).assertEqual(-16);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_0900
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0090
     * @tc.desc   batteryStats ConsumptionType type CONSUMPTION_TYPE_BLUETOOTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_0900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let consumptionType: number = batteryStats.ConsumptionType.CONSUMPTION_TYPE_BLUETOOTH;
          hilog.info(domain, tag, `${TAG} consumptionType type: ${typeof consumptionType}`);
          expect(consumptionType).assertEqual(-15);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_1000
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0100
     * @tc.desc   batteryStats ConsumptionType type CONSUMPTION_TYPE_IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_1000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let consumptionType: number = batteryStats.ConsumptionType.CONSUMPTION_TYPE_IDLE;
          hilog.info(domain, tag, `${TAG} consumptionType type: ${typeof consumptionType}`);
          expect(consumptionType).assertEqual(-14);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_1100
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0110
     * @tc.desc   batteryStats ConsumptionType type CONSUMPTION_TYPE_PHONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_1100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let consumptionType: number = batteryStats.ConsumptionType.CONSUMPTION_TYPE_PHONE;
          hilog.info(domain, tag, `${TAG} consumptionType type: ${typeof consumptionType}`);
          expect(consumptionType).assertEqual(-13);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_1200
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0120
     * @tc.desc   batteryStats ConsumptionType type CONSUMPTION_TYPE_RADIO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_1200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let consumptionType: number = batteryStats.ConsumptionType.CONSUMPTION_TYPE_RADIO;
          hilog.info(domain, tag, `${TAG} consumptionType type: ${typeof consumptionType}`);
          expect(consumptionType).assertEqual(-12);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_1300
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0130
     * @tc.desc   batteryStats ConsumptionType type CONSUMPTION_TYPE_SCREEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_1300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let consumptionType: number = batteryStats.ConsumptionType.CONSUMPTION_TYPE_SCREEN;
          hilog.info(domain, tag, `${TAG} consumptionType type: ${typeof consumptionType}`);
          expect(consumptionType).assertEqual(-11);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_1400
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0140
     * @tc.desc   batteryStats ConsumptionType type CONSUMPTION_TYPE_USER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_1400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let consumptionType: number = batteryStats.ConsumptionType.CONSUMPTION_TYPE_USER;
          hilog.info(domain, tag, `${TAG} consumptionType type: ${typeof consumptionType}`);
          expect(consumptionType).assertEqual(-10);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testBatteryStatisticsTest_static_1500
     * @tc.number SUB_PowerSystem_BatteryStatistics_ETSTest_0150
     * @tc.desc   batteryStats ConsumptionType type CONSUMPTION_TYPE_WIFI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testBatteryStatisticsTest_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryStatisticsTest_static_1500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let consumptionType: number = batteryStats.ConsumptionType.CONSUMPTION_TYPE_WIFI;
          hilog.info(domain, tag, `${TAG} consumptionType type: ${typeof consumptionType}`);
          expect(consumptionType).assertEqual(-9);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'BatteryStatisticsTest end');
}