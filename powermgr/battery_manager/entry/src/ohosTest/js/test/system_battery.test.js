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

import battery from '@system.battery';
import batteryInfo from '@ohos.batteryInfo';
import { describe, it, expect } from '@ohos/hypium';

function successFunc(data, tag) {
    console.log(tag + ": level: " + data.level + ", charging: " + data.charging);
    let soc = (batteryInfo.batterySOC * 0.01);
    expect(fabs(soc - data.level) <= 1e-9).assertTrue();
    if (batteryInfo.chargingStatus === batteryInfo.BatteryChargeState.ENABLE ||
        batteryInfo.chargingStatus === batteryInfo.BatteryChargeState.FULL) {
        expect(data.charging).assertTrue();
    } else {
        expect(data.charging).assertFalse();
    }
}

function failFunc(data, code, tag) {
    console.log(tag + ": data: " + data + ", code: " + code);
}

function completeFunc(tag) {
    console.log(tag + ": The device information is obtained successfully.");
}

export default function SystemBatteryTest() {
    describe('SystemBatteryTest', function () {
        console.log("*************System Battery Unit Test Begin*************");

        /**
         * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0010
         * @tc.name testget_status_success_test
         * @tc.desc Battery acquisition kit
         * @tc.level: Level 1
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_success_test', 0, function () {
            battery.getStatus({
                success: (data) => {
                    successFunc(data, successTest);
                },
                fail: (data, code) => {
                    failFunc(data, code, successTest);
                    expect().assertFail();
                },
                complete: () => {
                    completeFunc(successTest);
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0020
         * @tc.name testget_status_success_null_test
         * @tc.desc Battery acquisition kit
         * @tc.level: Level 1
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_success_null_test', 0, function () {
            battery.getStatus({
                success: null,
                fail: (data, code) => {
                    failFunc(data, code, successNullTest);
                    expect().assertFail();
                },
                complete: () => {
                    completeFunc(successNullTest);
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0030
         * @tc.name testget_status_success_empty_test
         * @tc.desc Battery acquisition kit
         * @tc.level: Level 1
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_success_empty_test', 0, function () {
            battery.getStatus({
                fail: (data, code) => {
                    failFunc(data, code, successEmptyTest);
                    expect().assertFail();
                },
                complete: () => {
                    completeFunc(successEmptyTest);
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0040
         * @tc.name testget_status_fail_null_test
         * @tc.desc Battery acquisition kit
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_fail_null_test', 0, function () {
            battery.getStatus({
                success: (data) => {
                    expect(data).assertNotNull();
                    successFunc(data, failNullTest);
                },
                fail: null,
                complete: () => {
                    completeFunc(failNullTest);
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0050
         * @tc.name testget_status_fail_empty_test
         * @tc.desc Battery acquisition kit
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_fail_empty_test', 0, function () {
            battery.getStatus({
                success: () => {
                    successFunc(data, failNullTest);
                    expect(data).assertNull();
                },
                complete: () => {
                    completeFunc(failEmptyTest);
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0060
         * @tc.name testget_status_complete_null_test
         * @tc.desc Battery acquisition kit
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_complete_null_test', 0, function () {
            battery.getStatus({
                success: (data) => {
                    successFunc(data, completeNullTest);
                },
                fail: (data, code) => {
                    failFunc(data, code, completeNullTest);
                    expect().assertFail();
                },
                complete: null
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0070
         * @tc.name testget_status_complete_empty_test
         * @tc.desc Battery acquisition kit
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_complete_empty_test', 0, function () {
            battery.getStatus({
                success: (data) => {
                    successFunc(data, completeEmptyTest);
                },
                fail: (data, code) => {
                    failFunc(data, code, completeEmptyTest);
                    expect().assertFail();
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0080
         * @tc.name testget_status_all_null
         * @tc.desc Battery acquisition kit
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_all_null', 0, function () {
            let allNull = false;
            battery.getStatus({
                success: null,
                fail: null,
                complete: null,
            });
            expect(!allNull).assertTrue();
        });

        /**
         * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0090
         * @tc.name testget_status_all_empty
         * @tc.desc Battery acquisition kit
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_all_empty', 0, function () {
            let allNull = false;
            battery.getStatus();
            expect(!allNull).assertTrue();
        });
    })
}