/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { describe, it, expect } from '@ohos/hypium'

const ERROR_CODE = 202;

export default function BatteryInfoTest() {
describe('BatteryInfoTest', function () {
    console.log("*************Battery Unit Test Begin*************");

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0010
     * @tc.name testbattery_soc_JSTest
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('battery_soc_JSTest', 0, function () {
        let batterySoc = batteryInfo.batterySOC;
        console.info('batterySoc = ' + batterySoc);
        expect(batterySoc >= -1 && batterySoc <= 100).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0020
     * @tc.name testcharging_status_JSTest
     * @tc.desc Battery charging kit
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('charging_status_JSTest', 0, function () {
        let chargingStatus = batteryInfo.chargingStatus;
        console.info('chargingStatus = ' + chargingStatus);
        expect(chargingStatus >= 0 && chargingStatus <= 4).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0030
     * @tc.name testhealth_status_JSTest
     * @tc.desc Get Battery Health Get KIT
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('health_status_JSTest', 0, function () {
        let healthStatus = batteryInfo.healthStatus;
        console.info('healthStatus = ' + healthStatus);
        expect(healthStatus >= 0 && healthStatus <= 6).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0040
     * @tc.name testplugged_type_JSTest
     * @tc.desc Obtaining the SUB Connection Type KIT
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('plugged_type_JSTest', 0, function () {
        let pluggedType = batteryInfo.pluggedType;
        console.info('pluggedType = ' + pluggedType);
        expect(pluggedType >= 0 && pluggedType <= 4).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0050
     * @tc.name testvoltage_JSTest
     * @tc.desc Obtaining the Voltage Interface KIT
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('voltage_JSTest', 0, function () {
        let voltage = batteryInfo.voltage;
        console.info('voltage = ' + voltage);
        expect(voltage >= -1).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0060
     * @tc.name testtechnology_JSTest
     * @tc.desc Obtaining the Battery Technology Interface KIT
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('technology_JSTest', 0, function () {
        let technology = batteryInfo.technology;
        console.info('technology = ' + technology);
        expect(technology !== null).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0070
     * @tc.name testbattery_temperature_JSTest
     * @tc.desc BatteryTemperature values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('battery_temperature_JSTest', 0, function () {
        let batteryTemperature = batteryInfo.batteryTemperature;
        console.info('batteryTemperature = ' + batteryTemperature);
        expect(batteryTemperature <= 700).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0080
     * @tc.name testenum_health_state_JSTest_unknown
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_unknown', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.UNKNOWN;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 0).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0090
     * @tc.name testenum_health_state_JSTest_good
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_good', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.GOOD;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 1).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0100
     * @tc.name testenum_health_state_JSTest_overheat
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_overheat', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.OVERHEAT;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 2).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0110
     * @tc.name testenum_health_state_JSTest_overvoltage
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_overvoltage', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.OVERVOLTAGE;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 3).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0120
     * @tc.name testenum_health_state_JSTest_cold
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_cold', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.COLD;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 4).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0130
     * @tc.name testenum_health_state_JSTest_dead
     * @tc.desc BatteryHealthState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_health_state_JSTest_dead', 0, function () {
        let batteryHealthState = batteryInfo.BatteryHealthState.DEAD;
        console.info('batteryHealthState = ' + batteryHealthState);
        expect(batteryHealthState == 5).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0140
     * @tc.name testenum_charge_state_JSTest_none
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_charge_state_JSTest_none', 0, function () {
        let batteryChargeState = batteryInfo.BatteryChargeState.NONE;
        console.info('batteryChargeState = ' + batteryChargeState);
        expect(batteryChargeState == 0).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0150
     * @tc.name testenum_charge_state_JSTest_enable
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_charge_state_JSTest_enable', 0, function () {
        let batteryChargeState = batteryInfo.BatteryChargeState.ENABLE;
        console.info('batteryChargeState = ' + batteryChargeState);
        expect(batteryChargeState == 1).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0160
     * @tc.name testenum_charge_state_JSTest_disable
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_charge_state_JSTest_disable', 0, function () {
        let batteryChargeState = batteryInfo.BatteryChargeState.DISABLE;
        console.info('batteryChargeState = ' + batteryChargeState);
        expect(batteryChargeState == 2).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0170
     * @tc.name testenum_charge_state_JSTest_full
     * @tc.desc BatteryChargeState values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_charge_state_JSTest_full', 0, function () {
        let batteryChargeState = batteryInfo.BatteryChargeState.FULL;
        console.info('batteryChargeState = ' + batteryChargeState);
        expect(batteryChargeState == 3).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0180
     * @tc.name testenum_plugged_type_JSTest_none
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_plugged_type_JSTest_none', 0, function () {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.NONE;
        console.info('batteryPluggedType = ' + batteryPluggedType);
        expect(batteryPluggedType == 0).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0190
     * @tc.name testenum_plugged_type_JSTest_ac
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_plugged_type_JSTest_ac', 0, function () {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.AC;
        console.info('batteryPluggedType = ' + batteryPluggedType);
        expect(batteryPluggedType == 1).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0200
     * @tc.name testenum_plugged_type_JSTest_usb
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_plugged_type_JSTest_usb', 0, function () {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.USB;
        console.info('batteryPluggedType = ' + batteryPluggedType);
        expect(batteryPluggedType == 2).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0210
     * @tc.name testenum_plugged_type_JSTest_wireless
     * @tc.desc BatteryPluggedType values Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_plugged_type_JSTest_wireless', 0, function () {
        let batteryPluggedType = batteryInfo.BatteryPluggedType.WIRELESS;
        console.info('batteryPluggedType = ' + batteryPluggedType);
        expect(batteryPluggedType == 3).assertTrue()
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0220
     * @tc.name testis_battery_present_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('is_battery_present_JSTest', 0, function () {
        let isBatteryPresent = batteryInfo.isBatteryPresent;
        console.info('isBatteryPresent = ' + isBatteryPresent);
        if (isBatteryPresent) {
            expect(isBatteryPresent).assertTrue();
        } else {
            expect(isBatteryPresent).assertFalse();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0230
     * @tc.name testbatterylevel_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('batterylevel_JSTest', 0, function () {
        let batteryLevel = batteryInfo.batteryCapacityLevel;
        console.info('batteryLevel = ' + batteryLevel);
        expect(batteryLevel >= batteryInfo.BatteryCapacityLevel.LEVEL_FULL &&
            batteryLevel <= batteryInfo.BatteryCapacityLevel.LEVEL_SHUTDOWN).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0240
     * @tc.name testenum_level_state_JSTest_full
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_full', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_FULL;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 1).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0250
     * @tc.name testenum_level_state_JSTest_high
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_high', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_HIGH;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 2).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0260
     * @tc.name testenum_level_state_JSTest_normal
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_normal', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_NORMAL;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 3).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0270
     * @tc.name testenum_level_state_JSTest_low
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_low', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_LOW;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 4).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0280
     * @tc.name testenum_level_state_JSTest_warning
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_warning', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_WARNING;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 5).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0290
     * @tc.name testenum_level_state_JSTest_critical
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_critical', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_CRITICAL;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 6).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0300
     * @tc.name testenum_level_state_JSTest_shutdown
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('enum_level_state_JSTest_shutdown', 0, function () {
        let batteryLevelState = batteryInfo.BatteryCapacityLevel.LEVEL_SHUTDOWN;
        console.info('batteryLevelState = ' + batteryLevelState);
        expect(batteryLevelState == 7).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0310
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_SOC_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_SOC_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_SOC = '
            + batteryInfo.CommonEventBatteryChangedKey.EXTRA_SOC);
        expect(batteryInfo.CommonEventBatteryChangedKey.EXTRA_SOC == 'soc').assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0320
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_CHARGE_STATE_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_CHARGE_STATE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_CHARGE_STATE = '
            + batteryInfo.CommonEventBatteryChangedKey.EXTRA_CHARGE_STATE);
        expect(batteryInfo.CommonEventBatteryChangedKey.EXTRA_CHARGE_STATE == 'chargeState').assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0330
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_HEALTH_STATE_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_HEALTH_STATE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_HEALTH_STATE = '
            + batteryInfo.CommonEventBatteryChangedKey.EXTRA_HEALTH_STATE);
        expect(batteryInfo.CommonEventBatteryChangedKey.EXTRA_HEALTH_STATE == 'healthState').assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0340
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_PLUGGED_TYPE_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_PLUGGED_TYPE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_PLUGGED_TYPE = '
            + batteryInfo.CommonEventBatteryChangedKey.EXTRA_PLUGGED_TYPE);
        expect(batteryInfo.CommonEventBatteryChangedKey.EXTRA_PLUGGED_TYPE == 'pluggedType').assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0350
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_VOLTAGE_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_VOLTAGE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_VOLTAGE = '
            + batteryInfo.CommonEventBatteryChangedKey.EXTRA_VOLTAGE);
        expect(batteryInfo.CommonEventBatteryChangedKey.EXTRA_VOLTAGE == 'voltage').assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0360
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_TECHNOLOGY_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_TECHNOLOGY_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_TECHNOLOGY = '
            + batteryInfo.CommonEventBatteryChangedKey.EXTRA_TECHNOLOGY);
        expect(batteryInfo.CommonEventBatteryChangedKey.EXTRA_TECHNOLOGY == 'technology').assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0370
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_TEMPERATURE_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_TEMPERATURE_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_TEMPERATURE = '
            + batteryInfo.CommonEventBatteryChangedKey.EXTRA_TEMPERATURE);
        expect(batteryInfo.CommonEventBatteryChangedKey.EXTRA_TEMPERATURE == 'temperature').assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0380
     * @tc.name testCommonEventBatteryChangedCode_EXTRA_PRESENT_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_EXTRA_PRESENT_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_EXTRA_PRESENT = '
            + batteryInfo.CommonEventBatteryChangedKey.EXTRA_PRESENT);
        expect(batteryInfo.CommonEventBatteryChangedKey.EXTRA_PRESENT == 'present').assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0390
     * @tc.name testCommonEventBatteryChangedCode_CAPACITY_LEVEL_JSTest
     * @tc.desc Battry Present Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('CommonEventBatteryChangedCode_CAPACITY_LEVEL_JSTest', 0, function () {
        console.info('CommonEventBatteryChangedCode_CAPACITY_LEVEL = '
            + batteryInfo.CommonEventBatteryChangedKey.EXTRA_CAPACITY_LEVEL);
        expect(batteryInfo.CommonEventBatteryChangedKey.EXTRA_CAPACITY_LEVEL == 'capacityLevel').assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_JSTest_0400
     * @tc.name nowCurrent_JSTest
     * @tc.desc Battery nowCurrent Interface Test
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('nowCurrent_JSTest', 0, function () {
        let nowCurrent = batteryInfo.nowCurrent;
        console.info('nowCurrent = ' + nowCurrent);
        expect(nowCurrent >= -10000 && nowCurrent <= 10000).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0010
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0100
     * @tc.desc Test the third-party application call setBatteryConfig will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0100', 0, async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0100';
        let sceneName = 'batteryInfo';
        let sceneValue = '1';
        try {
            let result = batteryInfo.setBatteryConfig(sceneName, sceneValue);
            console.info(TAG + " result: " + result);
        } catch (error) {
            console.info(TAG + ` setBatteryConfig err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0020
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0200
     * @tc.desc Test the third-party application call getBatteryConfig will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0200', 0, async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0200';
        let sceneName = 'batteryInfo';
        try {
            let result = batteryInfo.getBatteryConfig(sceneName);
            console.info(TAG + " result: " + result);
        } catch (error) {
            console.info(TAG + ` getBatteryConfig err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0030
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0300
     * @tc.desc Test the third-party application call isBatteryConfigSupported will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0300', 0, async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0300';
        let sceneName = 'batteryInfo';
        try {
            let result = batteryInfo.isBatteryConfigSupported(sceneName);
            console.info(TAG + " result: " + result);
        } catch (error) {
            console.info(TAG + ` isBatteryConfigSupported err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0030
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0400
     * @tc.desc Test the third-party application call estimatedRemainingChargeTime will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0400', 0, async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0400';
        try {
            let estimatedRemainingChargeTimeInfo = batteryInfo.estimatedRemainingChargeTime;
            console.info(TAG + " estimatedRemainingChargeTimeInfo: " + estimatedRemainingChargeTimeInfo);
            expect(estimatedRemainingChargeTimeInfo).assertEqual(-1);
            done();
        } catch (error) {
            console.info(TAG + ` estimatedRemainingChargeTime err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0030
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0500
     * @tc.desc Test the third-party application call totalEnergy will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0500', 0, async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0500';
        try {
            let totalEnergyInfo = batteryInfo.totalEnergy;
            console.info(TAG + " totalEnergyInfo: " + totalEnergyInfo);
            expect(totalEnergyInfo).assertEqual(-1);
            done();
        } catch (error) {
            console.info(TAG + ` totalEnergy err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0030
     * @tc.name testSystem_API_Test_batteryInfo_Manager_0600
     * @tc.desc Test the third-party application call remainingEnergy will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_batteryInfo_Manager_0600', 0, async function (done) {
        let TAG = 'System_API_Test_batteryInfo_Manager_0600';
        try {
            let remainingEnergyInfo = batteryInfo.remainingEnergy;
            console.info(TAG + " remainingEnergyInfo: " + remainingEnergyInfo);
            expect(remainingEnergyInfo).assertEqual(-1);
            done();
        } catch (error) {
            console.info(TAG + ` remainingEnergy err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })
})
}
