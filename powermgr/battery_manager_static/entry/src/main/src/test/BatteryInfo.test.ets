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
import batteryInfo from '@ohos.batteryInfo'
import { BusinessError } from '@ohos.base'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'BatteryInfoStaticTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function BatteryInfoTest() {

  describe("BatteryInfoTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'BatteryInfoTest start');
    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0010
     * @tc.name testBatteryInfoTest_static_0100
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_0100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let soc = batteryInfo.batterySOC();
          hilog.info(domain, tag, `${TAG} soc: ${JSON.stringify(soc)}`);
          hilog.info(domain, tag, `${TAG} soc type: ${typeof soc}`);
          expect(new Number(soc)).assertLargerOrEqual(0);
          expect(new Number(soc)).assertLessOrEqual(100);
          expect(typeof soc).assertEqual('number');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0020
     * @tc.name testBatteryInfoTest_static_0200
     * @tc.desc Battery charging kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_0200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let chargingStatus = batteryInfo.chargingStatus();
          hilog.info(domain, tag, `${TAG} chargingStatus: ${JSON.stringify(chargingStatus)}`);
          expect(new Number(chargingStatus)).assertLargerOrEqual(batteryInfo.BatteryChargeState.NONE);
          expect(new Number(chargingStatus)).assertLessOrEqual(batteryInfo.BatteryChargeState.FULL);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0030
     * @tc.name testBatteryInfoTest_static_0300
     * @tc.desc Get Battery Health Get KIT
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_0300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let healthStatus = batteryInfo.healthStatus();
          hilog.info(domain, tag, `${TAG} healthStatus: ${JSON.stringify(healthStatus)}`);
          expect(new Number(healthStatus)).assertLargerOrEqual(batteryInfo.BatteryHealthState.UNKNOWN);
          expect(new Number(healthStatus)).assertLessOrEqual(batteryInfo.BatteryHealthState.DEAD);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0040
     * @tc.name testBatteryInfoTest_static_0400
     * @tc.desc Obtaining the SUB Connection Type KIT
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_0400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let pluggedType = batteryInfo.pluggedType();
          hilog.info(domain, tag, `${TAG} pluggedType: ${JSON.stringify(pluggedType)}`);
          expect(new Number(pluggedType)).assertLargerOrEqual(batteryInfo.BatteryPluggedType.NONE);
          expect(new Number(pluggedType)).assertLessOrEqual(batteryInfo.BatteryPluggedType.WIRELESS);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0050
     * @tc.name testBatteryInfoTest_static_0500
     * @tc.desc Obtaining the Voltage Interface KIT
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_0500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let voltage = batteryInfo.voltage();
          hilog.info(domain, tag, `${TAG} voltage: ${JSON.stringify(voltage)}`);
          hilog.info(domain, tag, `${TAG} voltage type: ${typeof voltage}`);
          expect(new Number(voltage)).assertLargerOrEqual(-1);
          expect(typeof voltage).assertEqual('number');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0060
     * @tc.name testBatteryInfoTest_static_0600
     * @tc.desc Obtaining the Battery Technology Interface KIT
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_0600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let technology = batteryInfo.technology();
          hilog.info(domain, tag, `${TAG} technology: ${JSON.stringify(technology)}`);
          hilog.info(domain, tag, `${TAG} technology type: ${typeof technology}`);
          expect(typeof technology).assertEqual('string');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0070
     * @tc.name testBatteryInfoTest_static_0700
     * @tc.desc BatteryTemperature values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_0700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryTemperature = batteryInfo.batteryTemperature();
          hilog.info(domain, tag, `${TAG} batteryTemperature: ${JSON.stringify(batteryTemperature)}`);
          hilog.info(domain, tag, `${TAG} batteryTemperature type: ${typeof batteryTemperature}`);
          expect(new Number(batteryTemperature)).assertLessOrEqual(700);
          expect(typeof batteryTemperature).assertEqual('number');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0080
     * @tc.name testBatteryInfoTest_static_0800
     * @tc.desc isBatteryPresent values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_0800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let isBatteryPresent = batteryInfo.isBatteryPresent();
          hilog.info(domain, tag, `${TAG} batteryTemperature: ${JSON.stringify(isBatteryPresent)}`);
          hilog.info(domain, tag, `${TAG} batteryTemperature type: ${typeof isBatteryPresent}`);
          expect(typeof isBatteryPresent).assertEqual('boolean');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0090
     * @tc.name testBatteryInfoTest_static_0900
     * @tc.desc batteryCapacityLevel values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_0900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryLevel = batteryInfo.batteryCapacityLevel();
          hilog.info(domain, tag, `${TAG} batteryLevel: ${JSON.stringify(batteryLevel)}`);
          expect(new Number(batteryLevel)).assertLargerOrEqual(batteryInfo.BatteryCapacityLevel.LEVEL_FULL);
          expect(new Number(batteryLevel)).assertLessOrEqual(batteryInfo.BatteryCapacityLevel.LEVEL_SHUTDOWN);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0100
     * @tc.name testBatteryInfoTest_static_1000
     * @tc.desc nowCurrent values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let nowCurrent = batteryInfo.nowCurrent();
          hilog.info(domain, tag, `${TAG} nowCurrent: ${JSON.stringify(nowCurrent)}`);
          hilog.info(domain, tag, `${TAG} nowCurrent type: ${typeof nowCurrent}`);
          expect(new Number(nowCurrent)).assertLargerOrEqual(-10000);
          expect(new Number(nowCurrent)).assertLessOrEqual(10000);
          expect(typeof nowCurrent).assertEqual('number');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0110
     * @tc.name testBatteryInfoTest_static_1100
     * @tc.desc totalEnergy values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let totalEnergyInfo = batteryInfo.totalEnergy();
          hilog.info(domain, tag, `${TAG} totalEnergyInfo: ${JSON.stringify(totalEnergyInfo)}`);
          hilog.info(domain, tag, `${TAG} totalEnergyInfo type: ${typeof totalEnergyInfo}`);
          expect(new Number(totalEnergyInfo)).assertEqual(-1);
          expect(typeof totalEnergyInfo).assertEqual('number');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0120
     * @tc.name testBatteryInfoTest_static_1200
     * @tc.desc estimatedRemainingChargeTime values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let estimatedRemainingChargeTimeInfo = batteryInfo.estimatedRemainingChargeTime();
          hilog.info(domain, tag,
            `${TAG} estimatedRemainingChargeTimeInfo: ${JSON.stringify(estimatedRemainingChargeTimeInfo)}`);
          hilog.info(domain, tag,
            `${TAG} estimatedRemainingChargeTimeInfo type: ${typeof estimatedRemainingChargeTimeInfo}`);
          expect(new Number(estimatedRemainingChargeTimeInfo)).assertEqual(-1);
          expect(typeof estimatedRemainingChargeTimeInfo).assertEqual('number');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0130
     * @tc.name testBatteryInfoTest_static_1300
     * @tc.desc remainingEnergy values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let remainingEnergyInfo = batteryInfo.remainingEnergy();
          hilog.info(domain, tag, `${TAG} remainingEnergyInfo: ${JSON.stringify(remainingEnergyInfo)}`);
          hilog.info(domain, tag, `${TAG} remainingEnergyInfo type: ${typeof remainingEnergyInfo}`);
          expect(new Number(remainingEnergyInfo)).assertEqual(-1);
          expect(typeof remainingEnergyInfo).assertEqual('number');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0140
     * @tc.name testBatteryInfoTest_static_1400
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryPluggedTypeNone = batteryInfo.BatteryPluggedType.NONE;
          hilog.info(domain, tag, `${TAG} batteryPluggedTypeNone: ${JSON.stringify(batteryPluggedTypeNone)}`);
          expect(new Number(batteryPluggedTypeNone)).assertEqual(0);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0150
     * @tc.name testBatteryInfoTest_static_1500
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryPluggedTypeAc = batteryInfo.BatteryPluggedType.AC;
          hilog.info(domain, tag, `${TAG} batteryPluggedTypeAc: ${JSON.stringify(batteryPluggedTypeAc)}`);
          expect(new Number(batteryPluggedTypeAc)).assertEqual(1);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0160
     * @tc.name testBatteryInfoTest_static_1600
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryPluggedTypeUsb = batteryInfo.BatteryPluggedType.USB;
          hilog.info(domain, tag, `${TAG} batteryPluggedTypeUsb: ${JSON.stringify(batteryPluggedTypeUsb)}`);
          expect(new Number(batteryPluggedTypeUsb)).assertEqual(2);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0170
     * @tc.name testBatteryInfoTest_static_1700
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryPluggedTypeWireless = batteryInfo.BatteryPluggedType.WIRELESS;
          hilog.info(domain, tag, `${TAG} batteryPluggedTypeWireless: ${JSON.stringify(batteryPluggedTypeWireless)}`);
          expect(new Number(batteryPluggedTypeWireless)).assertEqual(3);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0180
     * @tc.name testBatteryInfoTest_static_1800
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryChargeStateNone = batteryInfo.BatteryChargeState.NONE;
          hilog.info(domain, tag, `${TAG} batteryChargeStateNone: ${JSON.stringify(batteryChargeStateNone)}`);
          expect(new Number(batteryChargeStateNone)).assertEqual(0);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0190
     * @tc.name testBatteryInfoTest_static_1900
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_1900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryChargeStateEnable = batteryInfo.BatteryChargeState.ENABLE;
          hilog.info(domain, tag, `${TAG} batteryChargeStateEnable: ${JSON.stringify(batteryChargeStateEnable)}`);
          expect(new Number(batteryChargeStateEnable)).assertEqual(1);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0200
     * @tc.name testBatteryInfoTest_static_2000
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryChargeStateDisable = batteryInfo.BatteryChargeState.DISABLE;
          hilog.info(domain, tag, `${TAG} batteryChargeStateDisable: ${JSON.stringify(batteryChargeStateDisable)}`);
          expect(new Number(batteryChargeStateDisable)).assertEqual(2);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0210
     * @tc.name testBatteryInfoTest_static_2100
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryChargeStateFull = batteryInfo.BatteryChargeState.FULL;
          hilog.info(domain, tag, `${TAG} batteryChargeStateFull: ${JSON.stringify(batteryChargeStateFull)}`);
          expect(new Number(batteryChargeStateFull)).assertEqual(3);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0220
     * @tc.name testBatteryInfoTest_static_2200
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryHealthStateUnknown = batteryInfo.BatteryHealthState.UNKNOWN;
          hilog.info(domain, tag, `${TAG} batteryHealthStateUnknown: ${JSON.stringify(batteryHealthStateUnknown)}`);
          expect(new Number(batteryHealthStateUnknown)).assertEqual(0);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0230
     * @tc.name testBatteryInfoTest_static_2300
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryHealthStateGood = batteryInfo.BatteryHealthState.GOOD;
          hilog.info(domain, tag, `${TAG} batteryHealthStateGood: ${JSON.stringify(batteryHealthStateGood)}`);
          expect(new Number(batteryHealthStateGood)).assertEqual(1);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0240
     * @tc.name testBatteryInfoTest_static_2400
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryHealthStateOverheat = batteryInfo.BatteryHealthState.OVERHEAT;
          hilog.info(domain, tag, `${TAG} batteryHealthStateOverheat: ${JSON.stringify(batteryHealthStateOverheat)}`);
          expect(new Number(batteryHealthStateOverheat)).assertEqual(2);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0250
     * @tc.name testBatteryInfoTest_static_2500
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryHealthStateOvervoltage = batteryInfo.BatteryHealthState.OVERVOLTAGE;
          hilog.info(domain, tag,
            `${TAG} batteryHealthStateOvervoltage: ${JSON.stringify(batteryHealthStateOvervoltage)}`);
          expect(new Number(batteryHealthStateOvervoltage)).assertEqual(3);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0260
     * @tc.name testBatteryInfoTest_static_2600
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryHealthStateCold = batteryInfo.BatteryHealthState.COLD;
          hilog.info(domain, tag, `${TAG} batteryHealthStateCold: ${JSON.stringify(batteryHealthStateCold)}`);
          expect(new Number(batteryHealthStateCold)).assertEqual(4);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0270
     * @tc.name testBatteryInfoTest_static_2700
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryHealthStateDead = batteryInfo.BatteryHealthState.DEAD;
          hilog.info(domain, tag, `${TAG} batteryHealthStateDead: ${JSON.stringify(batteryHealthStateDead)}`);
          expect(new Number(batteryHealthStateDead)).assertEqual(5);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0280
     * @tc.name testBatteryInfoTest_static_2800
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryCapacityLevelFull = batteryInfo.BatteryCapacityLevel.LEVEL_FULL;
          hilog.info(domain, tag, `${TAG} batteryCapacityLevelFull: ${JSON.stringify(batteryCapacityLevelFull)}`);
          expect(new Number(batteryCapacityLevelFull)).assertEqual(0);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0290
     * @tc.name testBatteryInfoTest_static_2900
     * @tc.desc BatteryCapacityLevel Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_2900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryCapacityLevelHigh = batteryInfo.BatteryCapacityLevel.LEVEL_HIGH;
          hilog.info(domain, tag, `${TAG} batteryCapacityLevelHigh: ${JSON.stringify(batteryCapacityLevelHigh)}`);
          expect(new Number(batteryCapacityLevelHigh)).assertEqual(1);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0300
     * @tc.name testBatteryInfoTest_static_3000
     * @tc.desc BatteryCapacityLevel Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryCapacityLevelNormal = batteryInfo.BatteryCapacityLevel.LEVEL_NORMAL;
          hilog.info(domain, tag, `${TAG} batteryCapacityLevelNormal: ${JSON.stringify(batteryCapacityLevelNormal)}`);
          expect(new Number(batteryCapacityLevelNormal)).assertEqual(2);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0310
     * @tc.name testBatteryInfoTest_static_3100
     * @tc.desc BatteryCapacityLevel Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryCapacityLevelLow = batteryInfo.BatteryCapacityLevel.LEVEL_LOW;
          hilog.info(domain, tag, `${TAG} batteryCapacityLevelLow: ${JSON.stringify(batteryCapacityLevelLow)}`);
          expect(new Number(batteryCapacityLevelLow)).assertEqual(3);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0320
     * @tc.name testBatteryInfoTest_static_3200
     * @tc.desc BatteryCapacityLevel Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryCapacityLevelWarning = batteryInfo.BatteryCapacityLevel.LEVEL_WARNING;
          hilog.info(domain, tag, `${TAG} batteryCapacityLevelWarning: ${JSON.stringify(batteryCapacityLevelWarning)}`);
          expect(new Number(batteryCapacityLevelWarning)).assertEqual(4);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0330
     * @tc.name testBatteryInfoTest_static_3300
     * @tc.desc BatteryCapacityLevel Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryCapacityLevelCritical = batteryInfo.BatteryCapacityLevel.LEVEL_CRITICAL;
          hilog.info(domain, tag,
            `${TAG} batteryCapacityLevelCritical: ${JSON.stringify(batteryCapacityLevelCritical)}`);
          expect(new Number(batteryCapacityLevelCritical)).assertEqual(5);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0340
     * @tc.name testBatteryInfoTest_static_3400
     * @tc.desc BatteryCapacityLevel Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let batteryCapacityLevelShutdown = batteryInfo.BatteryCapacityLevel.LEVEL_SHUTDOWN;
          hilog.info(domain, tag,
            `${TAG} batteryCapacityLevelShutdown: ${JSON.stringify(batteryCapacityLevelShutdown)}`);
          expect(new Number(batteryCapacityLevelShutdown)).assertEqual(6);
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0350
     * @tc.name testBatteryInfoTest_static_3500
     * @tc.desc CommonEventBatteryChangedKey Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let commonEventBatteryChangedKeySoc = batteryInfo.CommonEventBatteryChangedKey.EXTRA_SOC;
          hilog.info(domain, tag,
            `${TAG} commonEventBatteryChangedKeySoc: ${JSON.stringify(commonEventBatteryChangedKeySoc)}`);
          expect(new String(commonEventBatteryChangedKeySoc)).assertEqual('soc');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0360
     * @tc.name testBatteryInfoTest_static_3600
     * @tc.desc CommonEventBatteryChangedKey Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let commonEventBatteryChangedKeyChargeState = batteryInfo.CommonEventBatteryChangedKey.EXTRA_CHARGE_STATE;
          hilog.info(domain, tag,
            `${TAG} commonEventBatteryChangedKeyChargeState: ${JSON.stringify(commonEventBatteryChangedKeyChargeState)}`);
          expect(new String(commonEventBatteryChangedKeyChargeState)).assertEqual('chargeState');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0370
     * @tc.name testBatteryInfoTest_static_3700
     * @tc.desc CommonEventBatteryChangedKey Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3700';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let commonEventBatteryChangedKeyHealthState = batteryInfo.CommonEventBatteryChangedKey.EXTRA_HEALTH_STATE;
          hilog.info(domain, tag,
            `${TAG} commonEventBatteryChangedKeyHealthState: ${JSON.stringify(commonEventBatteryChangedKeyHealthState)}`);
          expect(new String(commonEventBatteryChangedKeyHealthState)).assertEqual('healthState');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0380
     * @tc.name testBatteryInfoTest_static_3800
     * @tc.desc CommonEventBatteryChangedKey Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3800';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let commonEventBatteryChangedKeyPluggedType = batteryInfo.CommonEventBatteryChangedKey.EXTRA_PLUGGED_TYPE;
          hilog.info(domain, tag,
            `${TAG} commonEventBatteryChangedKeyPluggedType: ${JSON.stringify(commonEventBatteryChangedKeyPluggedType)}`);
          expect(new String(commonEventBatteryChangedKeyPluggedType)).assertEqual('pluggedType');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0390
     * @tc.name testBatteryInfoTest_static_3900
     * @tc.desc CommonEventBatteryChangedKey Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_3900';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let commonEventBatteryChangedKeyVoltage = batteryInfo.CommonEventBatteryChangedKey.EXTRA_VOLTAGE;
          hilog.info(domain, tag,
            `${TAG} commonEventBatteryChangedKeyVoltage: ${JSON.stringify(commonEventBatteryChangedKeyVoltage)}`);
          expect(new String(commonEventBatteryChangedKeyVoltage)).assertEqual('voltage');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0400
     * @tc.name testBatteryInfoTest_static_4000
     * @tc.desc CommonEventBatteryChangedKey Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_4000';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let commonEventBatteryChangedKeyTechnology = batteryInfo.CommonEventBatteryChangedKey.EXTRA_TECHNOLOGY;
          hilog.info(domain, tag,
            `${TAG} commonEventBatteryChangedKeyTechnology: ${JSON.stringify(commonEventBatteryChangedKeyTechnology)}`);
          expect(new String(commonEventBatteryChangedKeyTechnology)).assertEqual('technology');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0410
     * @tc.name testBatteryInfoTest_static_4100
     * @tc.desc CommonEventBatteryChangedKey Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_4100';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let commonEventBatteryChangedKeyTemperature = batteryInfo.CommonEventBatteryChangedKey.EXTRA_TEMPERATURE;
          hilog.info(domain, tag,
            `${TAG} commonEventBatteryChangedKeyTemperature: ${JSON.stringify(commonEventBatteryChangedKeyTemperature)}`);
          expect(new String(commonEventBatteryChangedKeyTemperature)).assertEqual('temperature');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0420
     * @tc.name testBatteryInfoTest_static_4200
     * @tc.desc CommonEventBatteryChangedKey Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_4200';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let commonEventBatteryChangedKeyPresent = batteryInfo.CommonEventBatteryChangedKey.EXTRA_PRESENT;
          hilog.info(domain, tag,
            `${TAG} commonEventBatteryChangedKeyPresent: ${JSON.stringify(commonEventBatteryChangedKeyPresent)}`);
          expect(new String(commonEventBatteryChangedKeyPresent)).assertEqual('present');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0430
     * @tc.name testBatteryInfoTest_static_4300
     * @tc.desc CommonEventBatteryChangedKey Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_4300';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let commonEventBatteryChangedKeyCapacityLevel = batteryInfo.CommonEventBatteryChangedKey.EXTRA_CAPACITY_LEVEL;
          hilog.info(domain, tag,
            `${TAG} commonEventBatteryChangedKeyCapacityLevel: ${JSON.stringify(commonEventBatteryChangedKeyCapacityLevel)}`);
          expect(new String(commonEventBatteryChangedKeyCapacityLevel)).assertEqual('capacityLevel');
          done();
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0440
     * @tc.name testBatteryInfoTest_static_4400
     * @tc.desc setBatteryConfig Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_4400';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let sceneName = 'batteryInfo';
          let sceneValue = '1';
          let result = batteryInfo.setBatteryConfig(sceneName, sceneValue);
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0450
     * @tc.name testBatteryInfoTest_static_4500
     * @tc.desc getBatteryConfig Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_4500';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let sceneName = 'batteryInfo';
          let result = batteryInfo.getBatteryConfig(sceneName);
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_ETSTest_0460
     * @tc.name testBatteryInfoTest_static_4600
     * @tc.desc isBatteryConfigSupported Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("testBatteryInfoTest_static_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'testBatteryInfoTest_static_4600';
        hilog.info(domain, tag, `${TAG} start`);
        try {
          let sceneName = 'batteryInfo';
          let result = batteryInfo.isBatteryConfigSupported(sceneName);
        } catch (e: BusinessError) {
          hilog.error(domain, tag, `${TAG} e: ${JSON.stringify(e)}`);
          expect(e.code).assertEqual(202);
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'BatteryInfoTest end');
}