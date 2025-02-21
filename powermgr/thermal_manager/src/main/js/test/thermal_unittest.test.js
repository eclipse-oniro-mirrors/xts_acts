/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import thermal from "@ohos.thermal"
import { describe, it, expect } from '@ohos/hypium'
const MSEC_1000 = 1000;

export default function ThermalUnitTest() {
    describe('ThermalUnitTest', function () {
        console.log("*************Thermal API Test Begin*************");

        /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0010
         * @tc.name Get_Thermal_Level_JSTest0010
         * @tc.desc Thermal acquisition kit
         */
        it('Get_Thermal_Level_JSTest0010', 0, async function (done) {
            console.info("enter");
            await new Promise((resolve, reject) => {
                setTimeout(() => {
                    let level = thermal.getThermalLevel();
                    console.info("level is: " + level);
                    expect(level >= 0 && level <= 6).assertTrue();
                    resolve();
                    done();
                }, MSEC_1000 * 4);
            })
        })

        /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0020
         * @tc.name SubscribeAndUnsubscribe_Thermal_Level_JSTest0020
         * @tc.desc Thermal acquisition kit
         */
        it('SubscribeAndUnsubscribe_Thermal_Level_JSTest0020', 0, async function (done) {
            thermal.subscribeThermalLevel((level) => {
                console.info("level is: " + level);
                expect(level >= 0 && level <= 6).assertTrue();
                done();
            })
            await new Promise((resolve, reject) => {
                setTimeout(() => {
                    thermal.unsubscribeThermalLevel(() => {
                        console.info("unsubscribe successfully!");
                    });
                    resolve();
                }, MSEC_1000 * 4);
            })
        })

        /**
         * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0030
         * @tc.name Get_Thermal_Level_Cool_JSTest0030
         * @tc.desc Get device thermalLevel COOL
         */
        it('Get_Thermal_Level_Cool_JSTest0030', 0, function () {
            let thermalLevel = thermal.ThermalLevel.COOL;
            console.info('ThermalLevel.COOL = ' + thermalLevel);
            expect(thermalLevel === 0).assertTrue();
        })

        /**
         * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0040
         * @tc.name Get_Thermal_Level_Normal_JSTest0040
         * @tc.desc Get device thermalLevel NORMAL
         */
        it('Get_Thermal_Level_Normal_JSTest0040', 0, function () {
            let thermalLevel = thermal.ThermalLevel.NORMAL;
            console.info('ThermalLevel.NORMAL = ' + thermalLevel);
            expect(thermalLevel === 1).assertTrue();
        })

        /**
         * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0050
         * @tc.name Get_Thermal_Level_Warm_JSTest0050
         * @tc.desc Get device thermalLevel WARM
         */
        it('Get_Thermal_Level_Warm_JSTest0050', 0, function () {
            let thermalLevel = thermal.ThermalLevel.WARM;
            console.info('ThermalLevel.WARM = ' + thermalLevel);
            expect(thermalLevel === 2).assertTrue();
        })

        /**
         * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0060
         * @tc.name Get_Thermal_Level_Hot_JSTest0060
         * @tc.desc Get device thermalLevel HOT
         */
        it('Get_Thermal_Level_Hot_JSTest0060', 0, function () {
            let thermalLevel = thermal.ThermalLevel.HOT;
            console.info('ThermalLevel.HOT = ' + thermalLevel);
            expect(thermalLevel === 3).assertTrue();
        })

        /**
         * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0070
         * @tc.name Get_Thermal_Level_OverHeated_JSTest0070
         * @tc.desc Get device thermalLevel OVERHEATED
         */
        it('Get_Thermal_Level_OverHeated_JSTest0070', 0, function () {
            let thermalLevel = thermal.ThermalLevel.OVERHEATED;
            console.info('ThermalLevel.OVERHEATED = ' + thermalLevel);
            expect(thermalLevel === 4).assertTrue();
        })

        /**
         * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0080
         * @tc.name Get_Thermal_Level_Warning_JSTest0080
         * @tc.desc Get device thermalLevel WARNING
         */
        it('Get_Thermal_Level_Warning_JSTest0080', 0, function () {
            let thermalLevel = thermal.ThermalLevel.WARNING;
            console.info('ThermalLevel.WARNING = ' + thermalLevel);
            expect(thermalLevel === 5).assertTrue();
        })

        /**
         * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0090
         * @tc.name Get_Thermal_Level_Emergency_JSTest0090
         * @tc.desc Get device thermalLevel EMERGENCY
         */
        it('Get_Thermal_Level_Emergency_JSTest0090', 0, function () {
            let thermalLevel = thermal.ThermalLevel.EMERGENCY;
            console.info('ThermalLevel.EMERGENCY = ' + thermalLevel);
            expect(thermalLevel === 6).assertTrue();
        })

        /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0100
         * @tc.name Get_Level_JSTest0100
         * @tc.desc Thermal acquisition kit
         */
        it('Get_Level_JSTest0100', 0, async function (done) {
            let level = thermal.getLevel();
            console.info("Get_Level_JSTest0100 level is: " + level);
            expect(level >= thermal.ThermalLevel.COOL && level <= thermal.ThermalLevel.EMERGENCY).assertTrue();
            done();
        })

        /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0110
         * @tc.name Register_Thermal_Level_Callback_JSTest0110
         * @tc.desc Thermal acquisition kit
         */
        it('Register_Thermal_Level_Callback_JSTest0110', 0, async function (done) {
            try {
                thermal.registerThermalLevelCallback((value) => {
                    console.info("Register_Thermal_Level_Callback_JSTest0110 level is: " + value);
                    let level = thermal.getLevel();
                    expect(level === value).assertTrue();
                })
            } catch (error) {
                console.info('Register_Thermal_Level_Callback_JSTest0110:' + error);
                expect().assertFail();
            }
            done();
        })

        /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0120
         * @tc.name Register_Thermal_Level_Callback_JSTest0120
         * @tc.desc Thermal acquisition kit
         */
        it('Register_Thermal_Level_Callback_JSTest0120', 0, async function (done) {
            try {
                thermal.registerThermalLevelCallback('')
            } catch (error) {
                console.info('Register_Thermal_Level_Callback_JSTest0120 error:' + error);
                // 401: Invalid input parameter
                expect(error.code === 401).assertTrue();
            }
            done();
        })

        /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0130
        * @tc.name UnRegister_Thermal_Level_Callback_JSTest0130
        * @tc.desc Thermal acquisition kit
        */
        it('UnRegister_Thermal_Level_Callback_JSTest0130', 0, async function (done) {
            try {
                thermal.unregisterThermalLevelCallback('')
            } catch (error) {
                console.info('UnRegister_Thermal_Level_Callback_JSTest0130 error:' + error);
                // 401: Invalid input parameter
                expect(error.code === 401).assertTrue();
            }
            done();
        })

        /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0140
        * @tc.name UnRegister_Thermal_Level_Callback_JSTest0140
        * @tc.desc Thermal acquisition kit
        */
        it('UnRegister_Thermal_Level_Callback_JSTest0140', 0, async function (done) {
            try {
                thermal.unregisterThermalLevelCallback()
            } catch (error) {
                console.info('UnRegister_Thermal_Level_Callback_JSTest0140:' + error);
                expect().assertFail();
            }

            try {
                thermal.unregisterThermalLevelCallback(() => {
                    expect(true).assertTrue();
                })
            } catch (error) {
                console.info('UnRegister_Thermal_Level_Callback_JSTest0140:' + error);
                expect().assertFail();
            }
            done();
        })
    })
}
