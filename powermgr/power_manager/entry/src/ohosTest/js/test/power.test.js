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

const ERROR_CODE = 202;

export default function PowerTest() {
describe('PowerTest', function () {
    console.log("*************Power Test Begin*************");

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0010
     * @tc.name testPower_Is_Screnn_On_Promise_Test
     * @tc.desc Checks whether the screen of a device is on or off (deprecated since 9)
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Power_Is_Screnn_On_Promise_Test', 0, async function (done) {
        let TAG = 'Power_Is_Screnn_On_Promise_Test';
        power.isScreenOn()
        .then(data => {
            console.info(`${TAG} data: ${data}`);
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
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0020
     * @tc.name testPower_Is_Screnn_On_Callback_Test
     * @tc.desc Checks whether the screen of a device is on or off (deprecated since 9)
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Power_Is_Screnn_On_Callback_Test', 0, async function (done) {
        power.isScreenOn((error, screenOn) => {
            if (typeof error === "undefined") {
                console.info('Power_Is_Screnn_On_Callback_Test screenOn is ' + screenOn);
                let isActive = power.isActive();
                expect(screenOn).assertEqual(isActive);
                console.info('Power_Is_Screnn_On_Callback_Test success');
                done();
            } else {
                console.log('Power_Is_Screnn_On_Callback_Test: ' + error);
                expect().assertFail();
                done();
            }
        })
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0030
     * @tc.name testPower_Is_Active_Test
     * @tc.desc On and Off Screen and get the current screen on and off
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Is_Active_Test', 0, function () {
        try {
            var isActive = power.isActive();
            console.info('power is active: ' + isActive);
            expect(isActive).assertNotNull();
        } catch(err) {
            console.error('check active status failed, err: ' + err);
        }        
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0040
     * @tc.name testPower_Get_Power_Mode_Test
     * @tc.desc Gets and sets the power mode
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Get_Power_Mode_Test', 0, async function () {
        let currentMode = power.getPowerMode();
        console.info('Power_Get_Power_Mode_Test currentMode:' + currentMode);
        expect(currentMode >= power.DevicePowerMode.MODE_NORMAL &&
            currentMode <= power.DevicePowerMode.MODE_EXTREME_POWER_SAVE).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0050
     * @tc.name testPower_Device_Power_Mode_MODENORMAL_Test
     * @tc.desc Get device power mode MODE_NORMAL
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Device_Power_Mode_MODENORMAL_Test', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_NORMAL;
        console.info('MODE_NORMAL = ' + devicePowerMode);
        expect(devicePowerMode === 600).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0060
     * @tc.name testPower_Device_Power_Mode_MODEPOWERSAVE_Test
     * @tc.desc Get device power mode MODE_POWER_SAVE
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Device_Power_Mode_MODEPOWERSAVE_Test', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_POWER_SAVE;
        console.info('MODE_POWER_SAVE = ' + devicePowerMode);
        expect(devicePowerMode === 601).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0070
     * @tc.name testPower_Device_Power_Mode_MODEPERFORMANCE_Test
     * @tc.desc Get device power mode MODE_PERFORMANCE
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Device_Power_Mode_MODEPERFORMANCE_Test', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_PERFORMANCE;
        console.info('MODE_PERFORMANCE = ' + devicePowerMode);
        expect(devicePowerMode === 602).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0080
     * @tc.name testPower_Device_Power_Mode_MODE_EXTREME_POWER_SAVE_Test
     * @tc.desc Get device power mode MODE_EXTREME_POWER_SAVE
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
     it('Power_Device_Power_Mode_MODE_EXTREME_POWER_SAVE_Test', 0, function () {
        let devicePowerMode = power.DevicePowerMode.MODE_EXTREME_POWER_SAVE;
        console.info('MODE_EXTREME_POWER_SAVE = ' + devicePowerMode);
        expect(devicePowerMode === 603).assertTrue();
      })

    /**
     * @tc.number SUB_PowerSystem_PowerTest_JSTest_0120
     * @tc.name testpower_Device_IsStandby_Test
     * @tc.desc Device isStandby interface verification
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('power_Device_IsStandby_Test', 0, function () {
        let isStandby = power.isStandby();
        console.info('power_Device_IsStandby_Test ' + isStandby);
        expect(isStandby).assertFalse();
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0070
     * @tc.name testSystem_API_Test_power_Manager_0100
     * @tc.desc Test the third-party application call shutdown will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0100', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0100';
        try {
            power.shutdown("System_API_Test_power_Manager_0100");
        } catch (error) {
            console.info(TAG + ` shutdown err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0080
     * @tc.name testSystem_API_Test_power_Manager_0200
     * @tc.desc Test the third-party application call reboot will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0200', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0200';
        try {
            power.reboot("System_API_Test_power_Manager_0200");
        } catch (error) {
            console.info(TAG + ` reboot err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0090
     * @tc.name testSystem_API_Test_power_Manager_0300
     * @tc.desc Test the third-party application call wakeup will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0300', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0300';
        try {
            power.wakeup("System_API_Test_power_Manager_0300");
        } catch (error) {
            console.info(TAG + ` wakeup err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0100
     * @tc.name testSystem_API_Test_power_Manager_0400
     * @tc.desc Test the third-party application call suspend will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0400', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0400';
        try {
            power.suspend(true);
            console.info(TAG + ' suspend end');
        } catch (error) {
            console.info(TAG + ` suspend err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0110
     * @tc.name testSystem_API_Test_power_Manager_0500
     * @tc.desc Test the third-party application call suspend will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0500', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0500';
        try {
            power.suspend(false);
            console.info(TAG + ' suspend end');
        } catch (error) {
            console.info(TAG + ` suspend err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0111
     * @tc.name testSystem_API_Test_power_Manager_0501
     * @tc.desc Test the third-party application call suspend will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0501', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0501';
        try {
            power.suspend();
            console.info(TAG + ' suspend end');
        } catch (error) {
            console.info(TAG + ` suspend err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0120
     * @tc.name testSystem_API_Test_power_Manager_0600
     * @tc.desc Test the third-party application call setPowerMode will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0600', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0600';
        try {
            power.setPowerMode(power.DevicePowerMode.MODE_PERFORMANCE, (error) => {
                if (typeof error === 'undefined') {
                    console.info('set power mode to MODE_PERFORMANCE');
                    expect().assertFail();
                } else {
                    console.info(TAG + ` setPowerMode err: ${error.code}  ${error.message}`);
                    expect(error.code).assertEqual(ERROR_CODE);
                }
                done();
            });
        } catch (error) {
            console.info(TAG + ` setPowerMode err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0130
     * @tc.name testSystem_API_Test_power_Manager_0700
     * @tc.desc Test the third-party application call setPowerMode will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0700', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0700';
        try {
            power.setPowerMode(power.DevicePowerMode.MODE_PERFORMANCE)
                .then(() => {
                    console.info('set power mode to MODE_PERFORMANCE');
                    expect().assertFail();
                    done();
                })
                .catch((error)=> {
                    console.info(TAG + ` setPowerMode err: ${error.code}  ${error.message}`);
                    expect(error.code).assertEqual(ERROR_CODE);
                    done();
                });
        } catch (error) {
            console.info(TAG + ` setPowerMode err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0140
     * @tc.name testSystem_API_Test_power_Manager_0800
     * @tc.desc Test the third-party application call setPowerMode will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0800', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0800';
        try {
            power.setPowerMode(power.DevicePowerMode.MODE_PERFORMANCE)
                .then(() => {
                    console.info('set power mode to MODE_PERFORMANCE');
                    expect().assertFail();
                    done();
                })
                .catch((error)=> {
                    console.info(TAG + ` setPowerMode err: ${error.code}  ${error.message}`);
                    expect(error.code).assertEqual(ERROR_CODE);
                    done();
                });
        } catch (error) {
            console.info(TAG + ` setPowerMode err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0150
     * @tc.name testSystem_API_Test_power_Manager_0900
     * @tc.desc Test the third-party application call setScreenOffTime will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_0900', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_0900';
        try {
            power.setScreenOffTime(3000);
        } catch(error) {
            console.info(TAG + ` setScreenOffTime err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0160
     * @tc.name testSystem_API_Test_power_Manager_1000
     * @tc.desc Test the third-party application call setScreenOffTime will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_1000', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_1000';
        try {
            power.hibernate(true);
        } catch(error) {
            console.info(TAG + ` hibernate err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0170
     * @tc.name testSystem_API_Test_power_Manager_1100
     * @tc.desc Test the third-party application call setScreenOffTime will be blocked
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('System_API_Test_power_Manager_1100', 0, async function (done) {
        let TAG = 'System_API_Test_power_Manager_1100';
        try {
            power.hibernate(false);
        } catch(error) {
            console.info(TAG + ` hibernate err: ${error.code}  ${error.message}`);
            expect(error.code).assertEqual(ERROR_CODE);
            done();
        }
    })
})
}
