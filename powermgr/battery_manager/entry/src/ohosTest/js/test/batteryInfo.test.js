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

import batteryInfo from '@ohos.batteryInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function BatteryInfoTest() {
  describe('BatteryInfoTest', () => {
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
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0010
     * @tc.name testbattery_soc_JSTest
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('battery_soc_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let TAG = 'battery_soc_JSTest';
      try {
        let batterySoc = batteryInfo.batterySOC;
        console.info(`${TAG} batterySoc: ${batterySoc}`);
        console.info(`${TAG} batterySoc type: ${typeof batterySoc}`);
        expect(typeof batterySoc).assertEqual('number');
        expect(batterySoc).assertLargerOrEqual(0);
        expect(batterySoc).assertLessOrEqual(100);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0020
     * @tc.name testcharging_status_JSTest
     * @tc.desc Battery charging kit
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('charging_status_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let TAG = 'charging_status_JSTest';
      try {
        let chargingStatus = batteryInfo.chargingStatus;
        console.info(`${TAG} chargingStatus: ${chargingStatus}`);
        expect(chargingStatus).assertLargerOrEqual(batteryInfo.BatteryChargeState.NONE);
        expect(chargingStatus).assertLessOrEqual(batteryInfo.BatteryChargeState.FULL);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0030
     * @tc.name testhealth_status_JSTest
     * @tc.desc Get Battery Health Get KIT
     * @tc.level: Level 1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('health_status_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let TAG = 'health_status_JSTest';
      try {
        let healthStatus = batteryInfo.healthStatus;
        console.info(`${TAG} healthStatus: ${healthStatus}`);
        expect(healthStatus).assertLargerOrEqual(batteryInfo.BatteryHealthState.UNKNOWN);
        expect(healthStatus).assertLessOrEqual(batteryInfo.BatteryHealthState.DEAD);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0040
     * @tc.name testplugged_type_JSTest
     * @tc.desc Obtaining the SUB Connection Type KIT
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('plugged_type_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'plugged_type_JSTest';
      try {
        let pluggedType = batteryInfo.pluggedType;
        console.info(`${TAG} pluggedType: ${pluggedType}`);
        expect(pluggedType).assertLargerOrEqual(batteryInfo.BatteryPluggedType.NONE);
        expect(pluggedType).assertLessOrEqual(batteryInfo.BatteryPluggedType.WIRELESS);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0050
     * @tc.name testvoltage_JSTest
     * @tc.desc Obtaining the Voltage Interface KIT
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('voltage_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'voltage_JSTest';
      try {
        let voltage = batteryInfo.voltage;
        console.info(`${TAG} voltage: ${voltage}`);
        expect(typeof voltage).assertEqual('number');
        expect(voltage).assertLargerOrEqual(-1);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0060
     * @tc.name testtechnology_JSTest
     * @tc.desc Obtaining the Battery Technology Interface KIT
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('technology_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'technology_JSTest';
      try {
        let technology = batteryInfo.technology;
        console.info(`${TAG} technology: ${technology}`);
        console.info(`${TAG} technology type: ${typeof technology}`);
        expect(typeof technology).assertEqual('string');
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0070
     * @tc.name testbattery_temperature_JSTest
     * @tc.desc BatteryTemperature values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('battery_temperature_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'battery_temperature_JSTest';
      try {
        let batteryTemperature = batteryInfo.batteryTemperature;
        console.info(`${TAG} batteryTemperature: ${batteryTemperature}`);
        console.info(`${TAG} batteryTemperature type: ${typeof batteryTemperature}`);
        expect(typeof batteryTemperature).assertEqual('number');
        expect(batteryTemperature).assertLessOrEqual(700);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0080
     * @tc.name testenum_health_state_JSTest_unknown
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_unknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_health_state_JSTest_unknown';
      try {
        let batteryHealthState = batteryInfo.BatteryHealthState.UNKNOWN;
        console.info(`${TAG} batteryHealthState: ${batteryHealthState}`);
        expect(batteryHealthState).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0090
     * @tc.name testenum_health_state_JSTest_good
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_good', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_health_state_JSTest_good';
      try {
        let batteryHealthState = batteryInfo.BatteryHealthState.GOOD;
        console.info(`${TAG} batteryHealthState: ${batteryHealthState}`);
        expect(batteryHealthState).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0100
     * @tc.name testenum_health_state_JSTest_overheat
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_overheat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_health_state_JSTest_overheat';
      try {
        let batteryHealthState = batteryInfo.BatteryHealthState.OVERHEAT;
        console.info(`${TAG} batteryHealthState: ${batteryHealthState}`);
        expect(batteryHealthState).assertEqual(2);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0110
     * @tc.name testenum_health_state_JSTest_overvoltage
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_overvoltage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_health_state_JSTest_overvoltage';
      try {
        let batteryHealthState = batteryInfo.BatteryHealthState.OVERVOLTAGE;
        console.info(`${TAG} batteryHealthState: ${batteryHealthState}`);
        expect(batteryHealthState).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0120
     * @tc.name testenum_health_state_JSTest_cold
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_cold', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_health_state_JSTest_cold';
      try {
        let batteryHealthState = batteryInfo.BatteryHealthState.COLD;
        console.info(`${TAG} batteryHealthState: ${batteryHealthState}`);
        expect(batteryHealthState).assertEqual(4);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0130
     * @tc.name testenum_health_state_JSTest_dead
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_dead', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_health_state_JSTest_dead';
      try {
        let batteryHealthState = batteryInfo.BatteryHealthState.DEAD;
        console.info(`${TAG} batteryHealthState: ${batteryHealthState}`);
        expect(batteryHealthState).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0140
     * @tc.name testenum_charge_state_JSTest_none
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_charge_state_JSTest_none', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_charge_state_JSTest_none';
      try {
        let batteryChargeState = batteryInfo.BatteryChargeState.NONE;
        console.info(`${TAG} batteryChargeState: ${batteryChargeState}`);
        expect(batteryChargeState).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0150
     * @tc.name testenum_charge_state_JSTest_enable
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_charge_state_JSTest_enable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_charge_state_JSTest_enable';
      try {
        let batteryChargeState = batteryInfo.BatteryChargeState.ENABLE;
        console.info(`${TAG} batteryChargeState: ${batteryChargeState}`);
        expect(batteryChargeState).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0160
     * @tc.name testenum_charge_state_JSTest_disable
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_charge_state_JSTest_disable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_charge_state_JSTest_disable';
      try {
        let batteryChargeState = batteryInfo.BatteryChargeState.DISABLE;
        console.info(`${TAG} batteryChargeState: ${batteryChargeState}`);
        expect(batteryChargeState).assertEqual(2);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0170
     * @tc.name testenum_charge_state_JSTest_full
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_charge_state_JSTest_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_charge_state_JSTest_disable';
      try {
        let batteryChargeState = batteryInfo.BatteryChargeState.DISABLE;
        console.info(`${TAG} batteryChargeState: ${batteryChargeState}`);
        expect(batteryChargeState).assertEqual(2);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0180
     * @tc.name testenum_plugged_type_JSTest_none
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_plugged_type_JSTest_none', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_plugged_type_JSTest_none';
      try {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.NONE;
        console.info(`${TAG} batteryPluggedType: ${batteryPluggedType}`);
        expect(batteryPluggedType).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0190
     * @tc.name testenum_plugged_type_JSTest_ac
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_plugged_type_JSTest_ac', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_plugged_type_JSTest_ac';
      try {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.AC;
        console.info(`${TAG} batteryPluggedType: ${batteryPluggedType}`);
        expect(batteryPluggedType).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0200
     * @tc.name testenum_plugged_type_JSTest_usb
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_plugged_type_JSTest_usb', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_plugged_type_JSTest_usb';
      try {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.USB;
        console.info(`${TAG} batteryPluggedType: ${batteryPluggedType}`);
        expect(batteryPluggedType).assertEqual(2);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0210
     * @tc.name testenum_plugged_type_JSTest_wireless
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_plugged_type_JSTest_wireless', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_plugged_type_JSTest_wireless';
      try {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.WIRELESS;
        console.info(`${TAG} batteryPluggedType: ${batteryPluggedType}`);
        expect(batteryPluggedType).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0220
     * @tc.name testis_battery_present_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('is_battery_present_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'is_battery_present_JSTest';
      try {
        let isBatteryPresent = batteryInfo.isBatteryPresent;
        console.info(`${TAG} isBatteryPresent: ${isBatteryPresent}`);
        console.info(`${TAG} isBatteryPresent type: ${typeof isBatteryPresent}`);
        expect(typeof isBatteryPresent).assertEqual('boolean');
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0230
     * @tc.name testbatterylevel_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('batterylevel_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'is_battery_present_JSTest';
      try {
        let batteryLevel = batteryInfo.batteryCapacityLevel;
        console.info(`${TAG} batteryLevel: ${batteryLevel}`);
        console.info(`${TAG} batteryLevel type: ${typeof batteryLevel}`);
        expect(batteryLevel).assertLargerOrEqual(batteryInfo.BatteryCapacityLevel.LEVEL_FULL);
        expect(batteryLevel).assertLessOrEqual(batteryInfo.BatteryCapacityLevel.LEVEL_SHUTDOWN);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0240
     * @tc.name testenum_level_state_JSTest_full
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_full', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_level_state_JSTest_full';
      try {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_FULL;
        console.info(`${TAG} batteryLevelState: ${batteryLevelState}`);
        expect(batteryLevelState).assertEqual(1);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0250
     * @tc.name testenum_level_state_JSTest_high
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_high', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_level_state_JSTest_high';
      try {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_HIGH;
        console.info(`${TAG} batteryLevelState: ${batteryLevelState}`);
        expect(batteryLevelState).assertEqual(2);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0260
     * @tc.name testenum_level_state_JSTest_normal
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_level_state_JSTest_normal';
      try {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_NORMAL;
        console.info(`${TAG} batteryLevelState: ${batteryLevelState}`);
        expect(batteryLevelState).assertEqual(3);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0270
     * @tc.name testenum_level_state_JSTest_low
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_low', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_level_state_JSTest_low';
      try {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_LOW;
        console.info(`${TAG} batteryLevelState: ${batteryLevelState}`);
        expect(batteryLevelState).assertEqual(4);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0280
     * @tc.name testenum_level_state_JSTest_warning
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_warning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_level_state_JSTest_warning';
      try {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_WARNING;
        console.info(`${TAG} batteryLevelState: ${batteryLevelState}`);
        expect(batteryLevelState).assertEqual(5);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0290
     * @tc.name testenum_level_state_JSTest_critical
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_critical', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_level_state_JSTest_critical';
      try {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_CRITICAL;
        console.info(`${TAG} batteryLevelState: ${batteryLevelState}`);
        expect(batteryLevelState).assertEqual(6);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0300
     * @tc.name testenum_level_state_JSTest_shutdown
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_shutdown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'enum_level_state_JSTest_shutdown';
      try {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_SHUTDOWN;
        console.info(`${TAG} batteryLevelState: ${batteryLevelState}`);
        expect(batteryLevelState).assertEqual(7);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0310
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_SOC_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_SOC_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function () {
        let TAG = 'CommonEventBatteryChangedCode_EXTRA_SOC_JSTest';
        try {
          let commonEventBatteryChangedKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_SOC;
          console.info(`${TAG} commonEventBatteryChangedKey: ${commonEventBatteryChangedKey}`);
          expect(commonEventBatteryChangedKey).assertEqual('soc');
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0320
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_CHARGE_STATE_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_CHARGE_STATE_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function () {
        let TAG = 'CommonEventBatteryChangedCode_EXTRA_CHARGE_STATE_JSTest';
        try {
          let commonEventBatteryChangedKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_CHARGE_STATE;
          console.info(`${TAG} commonEventBatteryChangedKey: ${commonEventBatteryChangedKey}`);
          expect(commonEventBatteryChangedKey).assertEqual('chargeState');
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0330
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_HEALTH_STATE_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_HEALTH_STATE_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function () {
        let TAG = 'CommonEventBatteryChangedCode_EXTRA_HEALTH_STATE_JSTest';
        try {
          let commonEventBatteryChangedKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_HEALTH_STATE;
          console.info(`${TAG} commonEventBatteryChangedKey: ${commonEventBatteryChangedKey}`);
          expect(commonEventBatteryChangedKey).assertEqual('healthState');
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0340
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_PLUGGED_TYPE_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_PLUGGED_TYPE_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function () {
        let TAG = 'CommonEventBatteryChangedCode_EXTRA_PLUGGED_TYPE_JSTest';
        try {
          let commonEventBatteryChangedKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_PLUGGED_TYPE;
          console.info(`${TAG} commonEventBatteryChangedKey: ${commonEventBatteryChangedKey}`);
          expect(commonEventBatteryChangedKey).assertEqual('pluggedType');
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0350
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_VOLTAGE_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_VOLTAGE_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function () {
        let TAG = 'CommonEventBatteryChangedCode_EXTRA_VOLTAGE_JSTest';
        try {
          let commonEventBatteryChangedKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_VOLTAGE;
          console.info(`${TAG} commonEventBatteryChangedKey: ${commonEventBatteryChangedKey}`);
          expect(commonEventBatteryChangedKey).assertEqual('voltage');
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0360
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_TECHNOLOGY_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_TECHNOLOGY_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function () {
        let TAG = 'CommonEventBatteryChangedCode_EXTRA_TECHNOLOGY_JSTest';
        try {
          let commonEventBatteryChangedKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_TECHNOLOGY;
          console.info(`${TAG} commonEventBatteryChangedKey: ${commonEventBatteryChangedKey}`);
          expect(commonEventBatteryChangedKey).assertEqual('technology');
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0370
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_TEMPERATURE_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_TEMPERATURE_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function () {
        let TAG = 'CommonEventBatteryChangedCode_EXTRA_TEMPERATURE_JSTest';
        try {
          let commonEventBatteryChangedKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_TEMPERATURE;
          console.info(`${TAG} commonEventBatteryChangedKey: ${commonEventBatteryChangedKey}`);
          expect(commonEventBatteryChangedKey).assertEqual('temperature');
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0380
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_PRESENT_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_PRESENT_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function () {
        let TAG = 'CommonEventBatteryChangedCode_EXTRA_PRESENT_JSTest';
        try {
          let commonEventBatteryChangedKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_PRESENT;
          console.info(`${TAG} commonEventBatteryChangedKey: ${commonEventBatteryChangedKey}`);
          expect(commonEventBatteryChangedKey).assertEqual('present');
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0390
     * @tc.name testCommonEventBatteryChangedCode_CAPACITY_LEVEL_JSTest
     * @tc.desc Battery Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_CAPACITY_LEVEL_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      function () {
        let TAG = 'CommonEventBatteryChangedCode_CAPACITY_LEVEL_JSTest';
        try {
          let commonEventBatteryChangedKey = batteryInfo.CommonEventBatteryChangedKey.EXTRA_CAPACITY_LEVEL;
          console.info(`${TAG} commonEventBatteryChangedKey: ${commonEventBatteryChangedKey}`);
          expect(commonEventBatteryChangedKey).assertEqual('capacityLevel');
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0400
     * @tc.name nowCurrent_JSTest
     * @tc.desc Battery nowCurrent Interface Test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('nowCurrent_JSTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let TAG = 'battery_soc_JSTest';
      try {
        let nowCurrent = batteryInfo.nowCurrent;
        console.info(`${TAG} nowCurrent: ${nowCurrent}`);
        console.info(`${TAG} nowCurrent type: ${typeof nowCurrent}`);
        expect(typeof nowCurrent).assertEqual('number');
        expect(nowCurrent).assertLargerOrEqual(-10000);
        expect(nowCurrent).assertLessOrEqual(10000);
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0010
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0100
     * @tc.desc Test the third-party application call setBatteryConfig will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0100';
        let sceneName = 'batteryInfo';
        let sceneValue = '1';
        try {
          let result = batteryInfo.setBatteryConfig(sceneName, sceneValue);
          console.info(`${TAG} result: ${result}`);
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0020
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0200
     * @tc.desc Test the third-party application call getBatteryConfig will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0200';
        let sceneName = 'batteryInfo';
        try {
          let result = batteryInfo.getBatteryConfig(sceneName);
          console.info(`${TAG} result: ${result}`);
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0030
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0300
     * @tc.desc Test the third-party application call isBatteryConfigSupported will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0300';
        let sceneName = 'batteryInfo';
        try {
          let result = batteryInfo.isBatteryConfigSupported(sceneName);
          console.info(`${TAG} result: ${result}`);
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0040
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0400
     * @tc.desc Test the third-party application call estimatedRemainingChargeTime will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0400';
        try {
          let estimatedRemainingChargeTimeInfo = batteryInfo.estimatedRemainingChargeTime;
          console.info(`${TAG} estimatedRemainingChargeTimeInfo: ${estimatedRemainingChargeTimeInfo}`);
          expect(estimatedRemainingChargeTimeInfo).assertEqual(-1);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0500
     * @tc.desc Test the third-party application call totalEnergy will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0500';
        try {
          let totalEnergyInfo = batteryInfo.totalEnergy;
          console.info(`${TAG} totalEnergyInfo: ${totalEnergyInfo}`);
          expect(totalEnergyInfo).assertEqual(-1);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0030
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0600
     * @tc.desc Test the third-party application call remainingEnergy will be blocked
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0600';
        try {
          let remainingEnergyInfo = batteryInfo.remainingEnergy;
          console.info(`${TAG} remainingEnergyInfo: ${remainingEnergyInfo}`);
          expect(remainingEnergyInfo).assertEqual(-1);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${error.code} ${error.message}}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })
  })
}
