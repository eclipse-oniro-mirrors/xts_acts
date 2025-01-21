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

import { describe, it, expect } from '@ohos/hypium'

export default function PowerManagerPowerTest() {
describe('PowerManagerPowerTest', function () {
    console.log("*************Power Unit Test Begin*************");

     /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0010
     * @tc.name Power_Reboot_Device_JSTest0010
     * @tc.desc reboot device (deprecated since 9)
     */
    it('Power_Reboot_Device_JSTest0010', 0, function () {
        // Reboot tests are not performed by default
        if (false) {
            try {
                power.rebootDevice('Power_Reboot_Device_JSTest0010');
            } catch (e) {
                console.info('Power_Reboot_Device_JSTest0010 error:' + e);
                expect().assertFail();
            }
        }
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0020
     * @tc.name Power_Is_Screnn_On_Promise_JSTest0020
     * @tc.desc Checks whether the screen of a device is on or off (deprecated since 9)
     */
    it('Power_Is_Screnn_On_Promise_JSTest0020', 0, async function (done) {
        power.wakeupDevice("Power_Is_Screnn_On_Promise_JSTest0020");
        let isScreenOn =  await power.isScreenOn();
        console.info('Power_Is_Screnn_On_Promise_JSTest0020 isScreenOn is ' + isScreenOn);
        expect(isScreenOn).assertTrue();
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0030
     * @tc.name Power_Is_Screnn_On_Callback_JSTest0030
     * @tc.desc Checks whether the screen of a device is on or off (deprecated since 9)
     */
    it('Power_Is_Screnn_On_Callback_JSTest0030', 0, async function (done) {
        power.wakeupDevice("Power_Is_Screnn_On_Callback_JSTest0030");
        power.isScreenOn((error, screenOn) => {
            if (typeof error === "undefined") {
                console.info('Power_Is_Screnn_On_Callback_JSTest0030 screenOn is ' + screenOn);
                expect(screenOn).assertTrue();
                console.info('Power_Is_Screnn_On_Callback_JSTest0030 success');
            } else {
                console.log('Power_Is_Screnn_On_Callback_JSTest0030: ' + error);
                expect().assertFail();
            }
            done();
        })  
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0040
     * @tc.name Power_Is_Active_JSTest0040
     * @tc.desc On and Off Screen and get the current screen on and off
     */
     it('Power_Is_Active_JSTest0040', 0, function () {
        try {
            var isActive = power.isActive();
            console.info('power is active: ' + isActive);
            expect(isActive).assertNotNull();
        } catch(err) {
            console.error('check active status failed, err: ' + err);
        }        
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0050
     * @tc.name Power_Get_Power_Mode_JSTest0050
     * @tc.desc Gets and sets the power mode
     */
     it('Power_Get_Power_Mode_JSTest0050', 0, async function () {
        let currentMode = power.getPowerMode();
        console.info('Power_Get_Power_Mode_JSTest0050 currentMode:' + currentMode);
        expect(currentMode >= power.DevicePowerMode.MODE_NORMAL &&
            currentMode <= power.DevicePowerMode.MODE_EXTREME_POWER_SAVE).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0060
     * @tc.name Power_Device_Power_Mode_MODENORMAL_JSTest0060
     * @tc.desc Get device power mode MODE_NORMAL
     */
     it('Power_Device_Power_Mode_MODENORMAL_JSTest0060', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_NORMAL;
        console.info('MODE_NORMAL = ' + devicePowerMode);
        expect(devicePowerMode === 600).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0070
     * @tc.name Power_Device_Power_Mode_MODEPOWERSAVE_JSTest0080
     * @tc.desc Get device power mode MODE_POWER_SAVE
     */
     it('Power_Device_Power_Mode_MODEPOWERSAVE_JSTest0070', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_POWER_SAVE;
        console.info('MODE_POWER_SAVE = ' + devicePowerMode);
        expect(devicePowerMode === 601).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0080
     * @tc.name Power_Device_pPower_Mode_MODEPERFORMANCE_JSTest0090
     * @tc.desc Get device power mode MODE_PERFORMANCE
     */
     it('Power_Device_pPower_Mode_MODEPERFORMANCE_JSTest0080', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_PERFORMANCE;
        console.info('MODE_PERFORMANCE = ' + devicePowerMode);
        expect(devicePowerMode === 602).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0090
     * @tc.name Power_Device_Power_Mode_MODE_EXTREME_POWER_SAVE_JSTest0090
     * @tc.desc Get device power mode MODE_EXTREME_POWER_SAVE
     */
     it('Power_Device_Power_Mode_MODE_EXTREME_POWER_SAVE_JSTest0090', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_EXTREME_POWER_SAVE;
        console.info('MODE_EXTREME_POWER_SAVE = ' + devicePowerMode);
        expect(devicePowerMode === 603).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0091
     * @tc.name power_Suspend_Device_JSTest091
     * @tc.desc Device suspend interface verification
     */
    it('power_Suspend_Device_JSTest091', 0, async function (done) {
        power.wakeupDevice("power_Suspend_Device_JSTest091");
        power.suspend(undefined);
        let isScreenOn =  await power.isScreenOn();
        console.info('power_Suspend_Device_JSTest091 ' + isScreenOn);
        expect(isScreenOn).assertFalse();
        console.info('suspend success done');
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0092
     * @tc.name power_Suspend_Device_JSTest092
     * @tc.desc Device suspend interface verification
     */
    it('power_Suspend_Device_JSTest092', 0, async function (done) {
        power.wakeupDevice("power_Suspend_Device_JSTest092");
        power.suspend();
        let isScreenOn =  await power.isScreenOn();
        console.info('power_Suspend_Device_JSTest092 ' + isScreenOn);
        expect(isScreenOn).assertFalse();
        console.info('suspend success done');
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0093
     * @tc.name power_Suspend_Device_JSTest093
     * @tc.desc Device suspend interface verification
     */
    it('power_Suspend_Device_JSTest093', 0, async function (done) {
        power.wakeupDevice("power_Suspend_Device_JSTest093");
        power.suspend(false);
        let isScreenOn =  await power.isScreenOn();
        console.info('power_Suspend_Device_JSTest093 ' + isScreenOn);
        expect(isScreenOn).assertFalse();
        console.info('suspend success done');
        done();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerManager_JSTest_0094
     * @tc.name power_Device_IsStandby_JSTest094
     * @tc.desc Device isStandby interface verification
     */
    it('power_Device_IsStandby_JSTest094', 0, function () {
        let isStandby = power.isStandby();
        console.info('power_Device_IsStandby_JSTest094 ' + isStandby);
        expect(isStandby).assertFalse();
    })
})
}
