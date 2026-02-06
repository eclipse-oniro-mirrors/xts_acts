/*
 * Copyright (C) 2021-2025 Huawei Device Co., Ltd.
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
import vibrator from '@ohos.vibrator'
import deviceInfo from '@ohos.deviceInfo'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function VibratorJsTest_misc_3() {
let isAvailable;
const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
describe("VibratorJsTest_misc_3", function () {
    beforeAll(async function (done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
        console.info('VibratorJsTest_misc_3 Device type = ' + deviceInfo.deviceType);
        console.info('VibratorJsTest_misc_3 isAvailable = ' + isAvailable);
        try {
            const vibratorsList = vibrator.getVibratorInfoSync();
            if (ABILITYJUDGMENT === false || vibratorsList.length === 0 ||
                (vibratorsList.length !== 0 && vibratorsList.every(vibrator => !vibrator.isLocalVibrator))) {
                isAvailable = false;
                console.info('VibratorJsTest_misc_3 isAvailable ' + isAvailable);
                done()
            }else {
                isAvailable = true;
                console.info('VibratorJsTest_misc_3 isAvailable ' + isAvailable);
                done()
            }
        } catch(error) {
            console.error('VibratorJsTest_misc_3 exception :' + JSON.stringify(error))
            done()
        }
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach called')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })

    const DEVICE_OPERATION_FAILED = 14600101;
    const PERMISSION_ERROR_CODE = 201;
    const PARAMETER_ERROR_CODE = 401;

    const DEVICE_OPERATION_MSG = 'Device operation failed.'
    const PERMISSION_ERROR_MSG = 'Permission denied.'
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    let TAG = ""

    /**
     * @tc.name   VibratorJsTest015
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0290
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest015"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            vibrator.startVibration({
                type: "time",
                duration: 1000
            }, {
                usage: "unknown"
            },async (error)=>{
                if (error && !isAvailable) {
                    console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                    expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                } else if (error && isAvailable) {
                    console.info(TAG + ` isAvailable is true error: ${JSON.stringify(error.code)}`);
                    expect(false).assertTrue();
                } else {
                    await vibrator.stopVibration();
                    console.info(TAG + ' startVibration success');
                    expect(true).assertTrue();
                }
                setTimeout(()=>{
                    done();
                }, 500);
            });

        } catch (error) {
            console.info(TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest016
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0300
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest016"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            vibrator.startVibration({
                type: "",
                duration: 1000
            }, {
                usage: "unknown"
            }, (error)=>{
                console.info(TAG + ` startVibration into callback: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            });
        } catch (error) {
            console.info(TAG + ` startVibration error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest017
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0320
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest017"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            vibrator.startVibration({
                type: "preset",
                effectId: "",
                count: 3,
            }, {
                usage: "unknown"
            }, (error)=>{
                console.info(TAG + ` startVibration into callback: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                setTimeout(()=>{
                    done();
                }, 500);
            });
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest018
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0340
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest018"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            vibrator.startVibration(null, null);
            console.info(TAG + ' startVibration success');
            expect(false).assertTrue();
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest019
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0350
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest019"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            await vibrator.startVibration({ type: "time", duration: 1000, }, { usage: "unknown" });
            if (!isAvailable) {
                console.info(TAG + ' isAvailable1 is false not error');
                expect(false).assertTrue();
                done();
            }
            await vibrator.stopVibration();
            console.info(TAG + ` startVibration success`);
            expect(true).assertTrue();
            done();
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
            } else {
                console.info(TAG + ` startVibration or stopVibration error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
            }
            done();
        }

    })

    /**
     * @tc.name   VibratorJsTest020
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0360
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest020"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            await vibrator.startVibration({ type: "", duration: 1000 }, { usage: "unknown" });
            console.info(TAG + ` startVibration success`);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest021
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0380
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest021"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            await vibrator.startVibration({ type: "preset", effectId: "", count: 3, }, { usage: "unknown" })
            console.info(TAG + ` startVibration success`);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest022
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0400
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest022"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            await vibrator.startVibration({ type: 1, count: 3, }, { usage: "" })
            console.info(TAG + ` startVibration success`);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest023
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0410
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest023"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try{
            await vibrator.startVibration({ type: "time", duration: 100 }, { usage: "unknown" });
            console.info(TAG + ` startVibration  first success`);
            await vibrator.startVibration({ type: "time", duration: 100 }, { usage: "unknown" });
            console.info(TAG + ` startVibration  second success`);
            await vibrator.stopVibration();
            console.info(TAG + ` stopVibration success`);
            if (!isAvailable) {
                console.info(TAG + ' isAvailable1 is false not error');
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest024
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0500
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest024"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try{
            vibrator.startVibration({
                type: "time",
                duration: 1000
            }, {
                id:0,
                usage: "unknown"
            },async (error)=>{
                if (error && !isAvailable) {
                    console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                    expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                } else if (error && isAvailable) {
                    console.info(TAG + ` isAvailable is true error: ${JSON.stringify(error.code)}`);
                    expect(false).assertTrue();
                } else {
                    await vibrator.stopVibration();
                    console.info(TAG + ' startVibration success');
                    expect(true).assertTrue();
                }
                setTimeout( ()=>{
                    done();
                }, 500);
            });
        } catch (error) {
            console.info(TAG + ` startVibration or stopVibration error: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest025
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0510
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest025"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            vibrator.startVibration({
                type: "",
                duration: 1000
            }, {
                id:1,
                usage: "unknown"
            }, (error)=>{
                console.info(TAG + ` startVibration into callback: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            });
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest026
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0530
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest026"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            vibrator.startVibration({
                type: "preset",
                effectId: "",
                count: 3,
            }, {
                id:null,
                usage: "unknown"
            }, (error)=>{
                console.info(TAG + ` startVibration into callback: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            });
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest027
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0540
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest027"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try{
            vibrator.startVibration({
                type: "time",
                duration: 1000
            }, {
                usage: "unknown"
            },async (error)=>{
                if (error && !isAvailable) {
                    console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                    expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                } else if (error && isAvailable) {
                    console.info(TAG + ` isAvailable is true error: ${JSON.stringify(error.code)}`);
                    expect(false).assertTrue();
                } else {
                    await vibrator.stopVibration();
                    console.info(TAG + ' startVibration success');
                    expect(true).assertTrue();
                }
                setTimeout(async ()=>{
                    done();
                }, 500);
            });
        } catch (error) {
            console.info(TAG + ` startVibration or stopVibration error: ${JSON.stringify(error.code)}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest028
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0550
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest028"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            vibrator.startVibration({
                type: "",
                duration: 1000
            }, {
                usage: "unknown"
            }, (error)=>{
                console.info(TAG + ` startVibration into callback: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            });
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest029
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0570
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest029"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            vibrator.startVibration({
                type: "preset",
                effectId: "",
                count: 3,
            }, {
                usage: "unknown"
            }, (error)=>{
                console.info(TAG + ` startVibration into callback: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            });
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest030
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0590
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest030"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            await vibrator.startVibration(null, null);
            console.info(TAG + ` startVibration success`);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest031
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0600
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest031"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try{
            await vibrator.startVibration({ type: "time", duration: 1000, }, { usage: "unknown" });
            await vibrator.stopVibration();
            console.info(TAG + ' startVibration success');
            if (!isAvailable) {
                console.info(TAG + ' isAvailable1 is false not error');
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest032
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0610
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest032"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            await vibrator.startVibration({ type: "", duration: 1000 }, { usage: "unknown" });
            console.info(TAG + ` startVibration success`);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest033
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0630
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest033"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            await vibrator.startVibration({ type: "preset", effectId: "", count: 3, }, { usage: "unknown" });
            console.info(TAG + ` startVibration success`);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest034
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0650
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest034"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            await vibrator.startVibration({ type: 1, count: 3, }, { usage: "" });
            console.info(TAG + ` startVibration success`);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest035
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0660
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest035"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try{
            await vibrator.startVibration({ type: "time", duration: 100 }, { usage: "unknown" });
            console.info(TAG + ` startVibration  first success`);
            await vibrator.startVibration({ type: "time", duration: 100 }, { usage: "unknown" });
            console.info(TAG + ` startVibration  second success`);
            await vibrator.stopVibration();
            console.info(TAG + ` stopVibration success`);
            if (!isAvailable) {
                console.info(TAG + ' isAvailable1 is false not error');
                expect(false).assertTrue();
                done();
            }
            expect(true).assertTrue();
            done();
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` startVibration  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest036
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0750
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest036"
        console.info(TAG + ' isAvailable ' + isAvailable);
        function vibrateCallback(error) {
            try{
                console.info(TAG + ` stopVibration into callback: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
            } catch (error){
                console.info(TAG + ` stopVibration fail: ${JSON.stringify(error.code)}`);
                done();
            }
        }
        try {
            vibrator.stopVibration("", vibrateCallback);
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest037
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0770
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "====>VibratorJsTest037"
        console.info(TAG + ' isAvailable ' + isAvailable);
        try {
            await vibrator.stopVibration("");
            console.info(TAG + ` startVibration success`);
            expect(false).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest038
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_0780
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest038"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function stopPromise() {
                return new Promise((resolve, reject) => {
                    vibrator.stopVibration("time").then(() => {
                        console.log("VibratorJsTest038 stop success");
                        expect(true).assertTrue();
                        setTimeout(()=>{
                            resolve();
                        }, 500);
                    }, (error)=>{
                        expect(false).assertTrue();
                        console.log("VibratorJsTest038 stop error");
                        setTimeout(()=>{
                            reject();
                        }, 500);
                    });
                })
            }

            let promise = new Promise((resolve, reject) => {
                vibrator.vibrate(180000).then(() => {
                    console.log("VibratorJsTest038 vibrate success");
                    expect(true).assertTrue();
                    setTimeout(()=>{
                        resolve();
                    }, 500);
                }, (error)=>{
                    expect(false).assertTrue();
                    console.log("VibratorJsTest038  vibrate error");
                    setTimeout(()=>{
                        reject();
                    }, 500);
                });
            })

            await promise.then(() =>{
                return stopPromise();
            }, ()=>{
                console.info("VibratorJsTest038 reject");
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /**
     * @tc.name   VibratorJsTest039
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1150
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = '====>VibratorJsTest039'
        try {
            let ret = vibrator.isSupportEffectSync("haptic.effect.soft");
            if (ret) {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "haptic.effect.soft",
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator error');
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator success');
                        expect(true).assertTrue();
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.soft');
                done();
            }
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` isSupportEffectSync  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest040
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1160
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = '====>VibratorJsTest040'
        try {
            let ret = vibrator.isSupportEffectSync("haptic.effect.hard");
            if (ret) {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "haptic.effect.hard",
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator error');
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator success');
                        expect(true).assertTrue();
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.hard');
                done();
            }
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` isSupportEffectSync  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest041
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1170
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = '====>VibratorJsTest041'
        try {
            let ret = vibrator.isSupportEffectSync("haptic.effect.sharp");
            if (ret) {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "haptic.effect.sharp",
                    count: 1,
                    intensity: 50,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator error');
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator success');
                        expect(true).assertTrue();
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.sharp');
                done();
            }
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` isSupportEffectSync  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest042
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1180
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = '====>VibratorJsTest042'
        try {
            let ret = vibrator.isSupportEffectSync("haptic.effect.soft");
            if (ret) {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "haptic.effect.soft",
                    count: 3,
                    intensity: 100,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator error');
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + 'vibrator success');
                        expect(true).assertTrue();
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.soft');
                done();
            }
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` isSupportEffectSync  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest043
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1190
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = '====>VibratorJsTest043'
        try {
            let ret = vibrator.isSupportEffectSync("haptic.effect.hard");
            if (ret) {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "haptic.effect.hard",
                    count: 3,
                    intensity: 1,
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator error');
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator success');
                        expect(true).assertTrue();
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.hard');
                done();
            }
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` isSupportEffectSync  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest044
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1200
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = '====>VibratorJsTest044'
        try {
            let ret = vibrator.isSupportEffectSync("haptic.effect.sharp");
            if (ret) {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "haptic.effect.sharp",
                    count: 3,
                    intensity: "1",
                }, {
                    usage: "unknown"
                }, (error) => {
                    if (error) {
                        console.info(TAG + ' vibrator error');
                        expect(false).assertTrue();
                    } else {
                        console.info(TAG + ' vibrator success');
                        expect(true).assertTrue();
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.sharp');
                done();
            }
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` isSupportEffectSync  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest045
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1210
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = '====>VibratorJsTest045'
        try {
            let ret = vibrator.isSupportEffectSync("haptic.effect.sharp");
            if (ret) {
                try {
                    vibrator.startVibration({
                        type: "preset",
                        effectId: "haptic.effect.sharp",
                        count: 1,
                        intensity: 0,
                    }, {
                        usage: "unknown"
                    }, (error) => {
                        if (error) {
                            console.info(TAG + ` startVibration into callback: ${JSON.stringify(error.code)}`);
                            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                            done();
                        } else {
                            console.info(TAG + " vibrate success");
                            expect(false).assertTrue();
                            done();
                        }
                    });
                } catch (error) {
                    console.info(TAG + " intensity error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done()
                }
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.sharp');
                done();
            }
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` isSupportEffectSync  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })

    /**
     * @tc.name   VibratorJsTest046
     * @tc.number SUB_SensorSystem_Vibrator_JsTest_1220
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("VibratorJsTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = '====>VibratorJsTest046'
        try {
            let ret = vibrator.isSupportEffectSync("haptic.effect.sharp");
            if (ret) {
                try {
                    vibrator.startVibration({
                        type: "preset",
                        effectId: "haptic.effect.sharp",
                        count: 3,
                        intensity: 101,
                    }, {
                        usage: "unknown"
                    }, (error) => {
                        if (error) {
                            console.info(TAG + ` startVibration into callback: ${JSON.stringify(error.code)}`);
                            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                            done();
                        } else {
                            console.info(TAG + " vibrate success");
                            expect(false).assertTrue();
                            done();
                        }
                    });
                } catch (error) {
                    console.info(TAG + " intensity error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done()
                }
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.sharp');
                done();
            }
        } catch (error) {
            if (error && !isAvailable) {
                console.info(TAG + ` isAvailable is false error: ${JSON.stringify(error.code)}`);
                expect(error.code).assertEqual(DEVICE_OPERATION_FAILED);
                done();
            } else {
                console.info(TAG + ` isSupportEffectSync  error: ${JSON.stringify(error.code)}`);
                expect(false).assertTrue();
                done();
            }
        }
    })
    })}
