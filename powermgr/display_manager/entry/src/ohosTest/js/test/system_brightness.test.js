/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
import brightness from '@system.brightness';
import { describe, it, expect } from '@ohos/hypium';

const INPUT_ERROR_CODE_CODE = 202;
const SET_VALUE_MSG = "value is not an available number";
const SET_MODE_MSG = "value is not an available number";

export default async function SystemBrightnessTest() {
    describe('SystemBrightnessTest', async function () {
        console.log("System SystemBrightness Test Begin");

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0010
         * @tc.name testget_value_success
         * @tc.desc Get brightness success
         * @tc.level: Level 1
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_value_success', 0, async function (done) {
            let currValue = 100;
            brightness.getValue({
                success: (data) => {
                    currValue = data.value;
                    let value = (data.value > 0) && (data.value <= 255);
                    expect(value).assertTrue();
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0020
         * @tc.name testget_status_test_success_not_must
         * @tc.desc Get brightness
         * @tc.level: Level 1
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_test_success_not_must', 0, async function (done) {
            brightness.getValue({
                fail: (data, code) => {
                    console.log("get_status_test_success_not_must, data: " + data + ", code: " + code);
                    expect().assertFail();
                    done();
                },
                complete: () => {
                    console.log("The device information is obtained successfully. Procedure");
                    done();
                }
            });
        })

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0030
         * @tc.name testget_value_fail_not_must_test
         * @tc.desc Get brightness
         * @tc.level: Level 1
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_value_fail_not_must_test', 0, async function (done) {
            brightness.getValue({
                complete: () => {
                    console.log("The device information is obtained successfully. Procedure");
                    expect(true).assertTrue();
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0040
         * @tc.name testget_status_test_fail_not_must
         * @tc.desc Get brightness
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_status_test_fail_not_must', 0, async function (done) {
            brightness.getValue();
            expect(true).assertTrue();
            done();
        })

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0050
         * @tc.name testset_value_success_value
         * @tc.desc Set brightness success
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('set_value_success_value', 0, async function (done) {
            brightness.setKeepScreenOn({
                keepScreenOn: true,
                success: function () {
                    console.log('handling set keep screen on success.');
                    brightness.setValue({
                        value: 50,
                        success: function () {
                            console.log('set_value_success_value success.');
                            expect(true).assertTrue();
                            done();
                        },
                        fail: function () {
                            console.log('set_value_success_value fail.');
                            expect().assertFail();
                            done();
                        }
                    });
                },
                fail: function (data, code) {
                    console.error('handling set keep screen on fail, code:' + code + ', data: ' + data);
                    done();
                },
                complete: function () {
                    console.error('handling set keep screen on complete.');
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0060
         * @tc.name testset_value_fail
         * @tc.desc Set brightness fail
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('set_value_fail', 0, async function (done) {
            let setValue = "50";
            brightness.setValue({
                value: setValue,
                success: () => {
                    console.log("set_value_fail success");
                    expect().assertFail();
                    done();
                },
                fail: (data, code) => {
                    console.log("set_value_fail, data: " + data + ", code: " + code);
                    expect(code === INPUT_ERROR_CODE_CODE).assertTrue();
                    expect(data === SET_VALUE_MSG).assertTrue();
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0070
         * @tc.name testset_value_undefined
         * @tc.desc Check undefined as input of setValue
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('set_value_undefined', 0, async function (done) {
            brightness.setKeepScreenOn({
                keepScreenOn: true,
                success: function () {
                    console.log('undefined: original:handling set keep screen on success.');
                    let value = brightness.getValue();
                    brightness.setValue(undefined);
                    expect(value == brightness.getValue()).assertTrue();
                    done();
                },
                fail: function (data, code) {
                    console.error('undefined: original:handling set keep screen on fail, code:' + code + ', data: ' + data);
                    done();
                },
                complete: function () {
                    console.error('undefined: original:handling set keep screen on complete.');
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0080
         * @tc.name testget_mode_success
         * @tc.desc Get mode success
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_mode_success', 0, async function (done) {
            brightness.getMode({
                success: (data) => {
                    console.log("get_mode_success: get mode: " + data.mode);
                    expect(data.mode === 0 || data.mode === 1).assertTrue();
                    done();
                }
            });
        })

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0090
         * @tc.name testget_mode_success_null
         * @tc.desc Get mode success is null
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('get_mode_success_null', 0, async function (done) {
            brightness.getMode({
                fail: (data, code) => {
                    console.log("get_mode_success_null, data: " + data + ", code: " + code);
                    expect().assertFail();
                    done();
                },
                complete: () => {
                    console.log("The device information is obtained successfully. Procedure");
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0100
         * @tc.name testset_mode_success
         * @tc.desc set mode success
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('set_mode_success', 0, async function (done) {
            brightness.setMode({
                mode: 0,
                success: () => {
                    console.log("set_mode_success success");
                    expect(true).assertTrue();
                },
                fail: (data, code) => {
                    console.log("set_mode_success, data: " + data + ", code: " + code);
                    expect(code == 200).assertTrue();
                    done();
                },
                complete: () => {
                    console.log("The device information is obtained successfully. Procedure");
                    done();
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0110
         * @tc.name testset_mode_fail
         * @tc.desc set mode fail
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('set_mode_fail', 0, async function (done) {
            brightness.setMode({
                mode: "0",
                success: () => {
                    expect().assertFail();
                    done();
                },
                fail: (data, code) => {
                    console.log("set_mode_fail, data: " + data + ", code: " + code);
                    expect(code === INPUT_ERROR_CODE_CODE).assertTrue();
                    expect(data === SET_MODE_MSG).assertTrue();
                    done();
                },
                complete: () => {
                    console.log("The device information is obtained successfully. Procedure");
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0120
         * @tc.name testset_keep_screen_on_true
         * @tc.desc set keep screen on true
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('set_keep_screen_on_true', 0, async function (done) {
            brightness.setKeepScreenOn({
                keepScreenOn: true,
                success: () => {
                    expect(true).assertTrue();
                    done();
                },
                fail: (data, code) => {
                    console.log("set_keep_screen_on, data: " + data + ", code: " + code);
                    expect().assertFail();
                    done();
                },
                complete: () => {
                    console.log("The device information is obtained successfully. Procedure");
                }
            });
        });

        /**
         * @tc.number SUB_PowerSystem_SystemDisplay_JSTest_0130
         * @tc.name testset_keep_screen_on_false
         * @tc.desc set keep screen on false
         * @tc.level: Level 3
         * @tc.type: Functiontion
         * @tc.size: MediumTest
         */
        it('set_keep_screen_on_false', 0, async function (done) {
            brightness.setKeepScreenOn({
                keepScreenOn: false,
                success: () => {
                    expect(true).assertTrue();
                    done();
                },
                fail: (data, code) => {
                    console.log("set_keep_screen_on_false, data: " + data + ", code: " + code);
                    expect().assertFail();
                    done();
                },
                complete: () => {
                    console.log("The device information is obtained successfully. Procedure");
                }
            });
        });
    })
}