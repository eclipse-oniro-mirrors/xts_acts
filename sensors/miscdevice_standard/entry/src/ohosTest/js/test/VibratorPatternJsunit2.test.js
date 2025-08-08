/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export default function VibratorJsTest_misc_11() {
    let isAvailable;
    const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
    describe("VibratorJsTest_misc_11", function () {
        beforeAll(async function (done) {
            /*
            * @tc.setup: setup invoked before all testcases
            */
            console.info('beforeAll called')
            console.info('VibratorJsTest_misc_11 Device type = ' + deviceInfo.deviceType);
            console.info('VibratorJsTest_misc_11 isAvailable = ' + isAvailable);
            try {
                if (deviceInfo.deviceType === '2in1' || ABILITYJUDGMENT === false) {
                    isAvailable = false;
                    console.info('VibratorJsTest_misc_11 isAvailable ' + isAvailable);
                    done();
                }else {
                    isAvailable = true;
                    console.info('VibratorJsTest_misc_11 isAvailable ' + isAvailable);
                    done();
                }
            } catch(error) {
                console.error('VibratorJsTest_misc_11 exception :' + JSON.stringify(error));
                done();
            }
        })

        afterAll(function () {

            /*
             * @tc.teardown: teardown invoked after all testcases
             */
            console.info('afterAll called');
        })

        beforeEach(function () {

            /*
             * @tc.setup: setup invoked before each testcases
             */
            console.info('beforeEach called');
        })

        afterEach(async function (done) {

            /*
             * @tc.teardown: teardown invoked after each testcases
             */
            console.info('afterEach called');
            try{
                vibrator.stopVibration().then(() => {
                    console.info("afterEach: Success in stopping vibration. ");
                    setTimeout(() => {
                        done();
                    }, 500);
                }, (error) => {
                    console.info("afterEach: error in stopping vibration. error: " + JSON.stringify(error));
                    done();
                })
            } catch(error){
                console.info("afterEach error: " + JSON.stringify(error));
                done();
            }
            console.info('afterEach end');
        })

        const PARAMETER_ERROR_CODE = 401;
        let TAG = "";

        /*
        * @tc.name:VibratorProgramticHapticTest043
        * @tc.desc:addContinuousEvent time is 0, events is 129
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4300
        * @tc.level:Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest043";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let pointsMe  = vibrator.VibratorCurvePoint = [
                        {
                            time:0,
                            intensity:0,
                            frequency:-7
                        },
                        {
                            time:22,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:52,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:72,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:92,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:120,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:130,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:150,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:200,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:269,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:300,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:369,
                            intensity:0.19,
                            frequency:-21
                        },
                        {
                            time:400,
                            intensity:0.19,
                            frequency:-7
                        },
                        {
                            time:442,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:500,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:517,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:663,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:725,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:803,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:858,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:900,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:948,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:1000,
                            intensity:0.19,
                            frequency:-21
                        },
                        {
                            time:1020,
                            intensity:0.2,
                            frequency:-7
                        },
                        {
                            time:1042,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:1128,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:1217,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:1363,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:1425,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:1503,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:1658,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:1705,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:1788,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:1834,
                            intensity:0.1,
                            frequency:-21
                        },
                        {
                            time:1869,
                            intensity:0.1,
                            frequency:-7
                        },
                        {
                            time:1934,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:2028,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:2070,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:2103,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:2125,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:2200,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:2259,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:2300,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:2359,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:2400,
                            intensity:0.3,
                            frequency:-21
                        },
                        {
                            time:2459,
                            intensity:0.1,
                            frequency:-7
                        },
                        {
                            time:2500,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:2569,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:2600,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:2639,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:2700,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:2769,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:2800,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:2869,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:2900,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:2930,
                            intensity:0.2,
                            frequency:-21
                        },
                        {
                            time:2980,
                            intensity:0.1,
                            frequency:-7
                        },
                        {
                            time:3002,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:3042,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:3117,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:3163,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:3225,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:3289,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:3320,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:3395,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:3420,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:3440,
                            intensity:0.1,
                            frequency:-21
                        },
                        {
                            time:3450,
                            intensity:0.2,
                            frequency:-7
                        },
                        {
                            time:3460,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:3470,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:3480,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:3490,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:3500,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:3530,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:3550,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:3570,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:3590,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:3610,
                            intensity:1,
                            frequency:-21
                        },
                        {
                            time:3620,
                            intensity:1,
                            frequency:-7
                        },
                        {
                            time:3640,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:3660,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:3680,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:3700,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:3720,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:3740,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:3760,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:3780,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:3800,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:3820,
                            intensity:0.1,
                            frequency:-21
                        },
                        {
                            time:3842,
                            intensity:0.1,
                            frequency:-7
                        },
                        {
                            time:3860,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:3880,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:3900,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:3930,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:3960,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:3990,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:4020,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:4040,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:4060,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:4080,
                            intensity:0.1,
                            frequency:-21
                        },
                        {
                            time:4100,
                            intensity:0.1,
                            frequency:-7
                        },
                        {
                            time:4140,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:4180,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:4200,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:4240,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:4280,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:4300,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:4340,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:4380,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:4400,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:4430,
                            intensity:0.1,
                            frequency:-21
                        },
                        {
                            time:4450,
                            intensity:0.1,
                            frequency:-7
                        },
                        {
                            time:4480,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:4500,
                            intensity:0.94,
                            frequency:-4
                        },
                        {
                            time:4530,
                            intensity:0.63,
                            frequency:-14
                        },
                        {
                            time:4580,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:4600,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:4630,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:4680,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:4700,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:4730,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:4780,
                            intensity:0,
                            frequency:-21
                        },
                        {
                            time:4810,
                            intensity:0.48,
                            frequency:-14
                        },
                        {
                            time:4860,
                            intensity:0.53,
                            frequency:-10
                        },
                        {
                            time:4893,
                            intensity:0.42,
                            frequency:-14
                        },
                        {
                            time:4912,
                            intensity:0.39,
                            frequency:-14
                        },
                        {
                            time:4950,
                            intensity:0.34,
                            frequency:-17
                        },
                        {
                            time:4989,
                            intensity:0.21,
                            frequency:-14
                        },
                        {
                            time:5000,
                            intensity:0,
                            frequency:-21
                        }
                    ]
                    let param = {
                        intensity:97,
                        frequency:10,
                        points:pointsMe,
                        index:0
                    }
                    builder.addContinuousEvent(0, 5000, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                }

                try {
                    vibrator.startVibration({
                        type:"pattern",
                        pattern:builder.build()
                    },{
                        usage:"alarm",
                        systemUsage:false
                    },(error) => {
                        if (error) {
                            console.info(TAG + " vibrate fail:" + JSON.stringify(error));
                            expect(false).assertTrue();
                            done();
                        } else {
                            console.info(TAG + " vibrate success");
                            expect(false).assertTrue();
                            done();
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest044
        * @tc.desc:ContinuousParam intensity is 100, frequency is 50, points index is None
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4400
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest044";
            if(isAvailable){
                try {
                    let param = {
                        intensity:100,
                        frequency:50
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest045
        * @tc.desc:ContinuousParam intensity is 100, frequency is 50, points is pointsMe, index is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4500
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest045";
            if(isAvailable){
                try {
                    let pointsMe  = vibrator.VibratorCurvePoint = [
                        {
                            time:0,
                            intensity:0,
                            frequency:-7
                        },
                        {
                            time:42,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:62,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:122,
                            intensity:0,
                            frequency:-4
                        }
                    ]
                    let param = {
                        intensity:100,
                        frequency:50,
                        points:pointsMe,
                        index:0
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest046
        * @tc.desc:ContinuousParam intensity is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4600
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest046";
            if(isAvailable){
                try {
                    let param = {
                        intensity:0
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest047
        * @tc.desc:ContinuousParam intensity is 101, frequency is 50
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4700
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest047";
            if(isAvailable){
                try {
                    let param = {
                        intensity:101,
                        frequency:50
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest048
        * @tc.desc:ContinuousParam intensity is 101, frequency is 101, points is pointsMe, index is 1
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4800
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest048";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let pointsMe  = vibrator.VibratorCurvePoint = [
                        {
                            time:0,
                            intensity:0,
                            frequency:-7
                        },
                        {
                            time:42,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:62,
                            intensity:1,
                            frequency:-6
                        }
                    ]
                    let param = {
                        intensity:101,
                        frequency:101,
                        index:1,
                        points:pointsMe

                    }
                    builder.addContinuousEvent(0, 62, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                    expect(false).assertTrue();
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest049
        * @tc.desc:TransientParam intensity is 100, frequency is 50, index is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4900
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest049";
            if(isAvailable){
                try {
                    let param = {
                        intensity:100,
                        frequency:50,
                        index:0
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest050
        * @tc.desc:TransientParam intensity is 100, frequency is 50, index is 1
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5000
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest050";
            if(isAvailable){
                try {
                    let param = {
                        intensity:100,
                        frequency:50,
                        index:1
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest051
        * @tc.desc:TransientParam intensity is 100, frequency is 100, index is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5100
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest051";
            if(isAvailable){
                try {
                    let param = {
                        intensity:100,
                        frequency:100,
                        index:0
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest052
        * @tc.desc:TransientParam intensity is 100, frequency is 101, index is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5200
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest052";
            if(isAvailable){
                try {
                    let param = {
                        intensity:100,
                        frequency:101,
                        index:0
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest053
        * @tc.desc:TransientParam intensity is 100, frequency is 101, index is 1
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5300
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest053";
            if(isAvailable){
                try {
                    let param = {
                        intensity:100,
                        frequency:101,
                        index:1
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest054
        * @tc.desc:TransientParam intensity is 0, frequency is 50
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5400
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest054";
            if(isAvailable){
                try {
                    let param = {
                        intensity:0,
                        frequency:50
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest055
        * @tc.desc:TransientParam intensity is 0, frequency is 50, index is 1
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5500
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest055";
            if(isAvailable){
                try {
                    let param = {
                        intensity:0,
                        frequency:100,
                        index:1
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest056
        * @tc.desc:TransientParam intensity is 0, frequency is 100, index is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5600
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest056";
            if(isAvailable){
                try {
                    let param = {
                        intensity:0,
                        frequency:100,
                        index:0
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest057
        * @tc.desc:TransientParam intensity is 0, frequency is 101, index is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5700
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest057";
            if(isAvailable){
                try {
                    let param = {
                        intensity:0,
                        frequency:101,
                        index:0
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest058
        * @tc.desc:TransientParam intensity is 0, frequency is 101, index is 1
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5800
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest058";
            if(isAvailable){
                try {
                    let param = {
                        intensity:0,
                        frequency:101,
                        index:1
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest059
        * @tc.desc:TransientParam intensity is 101
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_5900
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest059";
            if(isAvailable){
                try {
                    let param = {
                        intensity:101
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest060
        * @tc.desc:TransientParam intensity is 101, frequency is 100, index is 1
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6000
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest060";
            if(isAvailable){
                try {
                    let param = {
                        intensity:101,
                        frequency:100,
                        index:1
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest061
        * @tc.desc:TransientParam intensity is 101, frequency is 50
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6100
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest061";
            if(isAvailable){
                try {
                    let param = {
                        intensity:101,
                        frequency:50
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
         * @tc.name:VibratorProgramticHapticTest062
         * @tc.desc:TransientParam intensity is 101, frequency is 101, index is 0
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6200
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest062";
            if(isAvailable){
                try {
                    let param = {
                        intensity:101,
                        frequency:101,
                        index:0
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
         * @tc.name:VibratorProgramticHapticTest063
         * @tc.desc:TransientParam intensity is 101, frequency is 101, index is 1
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6300
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest063";
            if(isAvailable){
                try {
                    let param = {
                        intensity:101,
                        frequency:101,
                        index:1
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " param error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
         * @tc.name:VibratorProgramticHapticTest064
         * @tc.desc:Trigger long and short oscillations, with high priority given to short oscillations
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6400
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest064";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let pointsMe  = vibrator.VibratorCurvePoint = [
                        {
                            time:0,
                            intensity:0,
                            frequency:-7
                        },
                        {
                            time:42,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:128,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:217,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:500,
                            intensity:0.1,
                            frequency:-4
                        }
                    ]
                    let param = {
                        intensity:97,
                        frequency:34,
                        points:pointsMe,
                        index:0
                    }
                    builder.addContinuousEvent(0, 500, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                }
                let builder1 = new vibrator.VibratorPatternBuilder();
                try {
                    builder1.addTransientEvent(60);
                    console.info(TAG + " builder.build1 is:" + JSON.stringify(builder1.build()));
                }catch (error){
                    console.info(TAG + " TransientParam1 error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                }
                function vibratePromise() {
                    return new Promise((resolve, reject) => {
                        vibrator.startVibration({
                            type:"pattern",
                            pattern:builder1.build()
                        }, {
                            usage: "alarm"
                        }, (error)=>{
                            if (error) {
                                console.info(TAG + " error1: " + JSON.stringify(error));
                                expect(false).assertTrue();
                                reject();
                            } else {
                                console.info(TAG + " vibrate builder1 success");
                                resolve();
                            }
                        });
                    })
                }

                let promise = new Promise((resolve, reject) => {
                    vibrator.startVibration({
                        type:"pattern",
                        pattern:builder.build()
                    }, {
                        usage: "unknown"
                    }, (error)=>{
                        if (error) {
                            console.info(TAG + " error: " + JSON.stringify(error));
                            expect(false).assertTrue();
                            reject();
                        } else {
                            console.info(TAG + " vibrate builder1 success");
                            resolve();
                        }
                    });
                })

                await promise.then(() =>{
                    return vibratePromise();
                }, ()=>{
                    console.info(TAG + " reject");
                })
                done();
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
         * @tc.name:VibratorProgramticHapticTest065
         * @tc.desc:Trigger long and short vibrations, with high priority given to long vibrations during their duration
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6500
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest065";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let pointsMe  = vibrator.VibratorCurvePoint = [
                        {
                            time:0,
                            intensity:0,
                            frequency:-1
                        },
                        {
                            time:100,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:300,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:500,
                            intensity:0.1,
                            frequency:-4
                        },
                        {
                            time:800,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:900,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:1000,
                            intensity:0,
                            frequency:-4
                        }
                    ]
                    let param = {
                        intensity:97,
                        frequency:34,
                        points:pointsMe,
                        index:0
                    }
                    builder.addContinuousEvent(0, 1000, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                }
                let builder1 = new vibrator.VibratorPatternBuilder();
                try {
                    builder1.addTransientEvent(30);
                    console.info(TAG + " builder.build1 is:" + JSON.stringify(builder1.build()));
                }catch (error){
                    console.info(TAG + " TransientParam1 error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                }
                function vibratePromise() {
                    return new Promise((resolve, reject) => {
                        vibrator.startVibration({
                            type:"pattern",
                            pattern:builder1.build()
                        }, {
                            usage: "unknown"
                        }, (error)=>{
                            if (error) {
                                console.info(TAG + " error1: " + JSON.stringify(error));
                                resolve();
                            } else {
                                console.info(TAG + " vibrate builder1 success");
                                reject();
                            }
                        });
                    })
                }

                let promise = new Promise((resolve, reject) => {
                    vibrator.startVibration({
                        type:"pattern",
                        pattern:builder.build()
                    }, {
                        usage: "alarm"
                    }, (error)=>{
                        if (error) {
                            console.info(TAG + " error: " + JSON.stringify(error));
                            expect(false).assertTrue();
                            reject();
                        } else {
                            console.info(TAG + " vibrate builder1 success");
                            resolve();
                        }
                    });
                })

                await promise.then(() =>{
                    return vibratePromise();
                }, ()=>{
                    console.info(TAG + " reject");
                })
                done();
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
         * @tc.name:VibratorProgramticHapticTest066
         * @tc.desc:Trigger long and short vibrations. When the priority of long vibrations is high, exceed the duration of long vibrations
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6600
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest066";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let pointsMe  = vibrator.VibratorCurvePoint = [
                        {
                            time:0,
                            intensity:0,
                            frequency:-1
                        },
                        {
                            time:100,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:300,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:500,
                            intensity:0,
                            frequency:-4
                        }
                    ]
                    let param = {
                        intensity:97,
                        frequency:34,
                        points:pointsMe,
                        index:0
                    }
                    builder.addContinuousEvent(0, 500, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                }
                let builder1 = new vibrator.VibratorPatternBuilder();
                try {
                    builder1.addTransientEvent(1000);
                    console.info(TAG + " builder.build1 is:" + JSON.stringify(builder1.build()));
                }catch (error){
                    console.info(TAG + " TransientParam1 error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                }
                function vibratePromise() {
                    return new Promise((resolve, reject) => {
                        setTimeout(() => {
                            vibrator.startVibration({
                                type:"pattern",
                                pattern:builder1.build()
                            }, {
                                usage: "unknown"
                            }, (error)=>{
                                if (error) {
                                    console.info(TAG + " error1: " + JSON.stringify(error));
                                    expect(false).assertTrue();
                                    reject();

                                } else {
                                    console.info(TAG + " vibrate builder1 success");
                                    resolve();
                                }
                            });
                        }, 1000);
                    })
                }

                let promise = new Promise((resolve, reject) => {
                    vibrator.startVibration({
                        type:"pattern",
                        pattern:builder.build()
                    }, {
                        usage: "alarm"
                    }, (error)=>{
                        if (error) {
                            console.info(TAG + " error: " + JSON.stringify(error));
                            expect(false).assertTrue();
                            reject();
                        } else {
                            console.info(TAG + " vibrate builder1 success");
                            resolve();
                        }
                    });
                })

                await promise.then(() =>{
                    return vibratePromise();
                }, ()=>{
                    console.info(TAG + " reject");
                })
                done();
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
         * @tc.name:VibratorProgramticHapticTest067
         * @tc.desc:Trigger short and long vibrations, with long vibrations taking priority over short vibrations
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6700
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest067";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let pointsMe  = vibrator.VibratorCurvePoint = [
                        {
                            time:0,
                            intensity:0,
                            frequency:-7
                        },
                        {
                            time:100,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:300,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:500,
                            intensity:0.1,
                            frequency:-4
                        },
                        {
                            time:800,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:900,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:1009,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:1596,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:1830,
                            intensity:0,
                            frequency:-7
                        },
                        {
                            time:2000,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:2369,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:2600,
                            intensity:0.1,
                            frequency:-4
                        },
                        {
                            time:2860,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:3000,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:4000,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:5000,
                            intensity:0,
                            frequency:-4
                        }
                    ]
                    let param = {
                        intensity:97,
                        frequency:34,
                        points:pointsMe,
                        index:0
                    }
                    builder.addContinuousEvent(15, 5000, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                }
                let builder1 = new vibrator.VibratorPatternBuilder();
                try {
                    builder1.addTransientEvent(0);
                    console.info(TAG + " builder.build1 is:" + JSON.stringify(builder1.build()));
                }catch (error){
                    console.info(TAG + " TransientParam1 error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                }
                function vibratePromise() {
                    return new Promise((resolve, reject) => {
                        vibrator.startVibration({
                            type:"pattern",
                            pattern:builder.build()
                        }, {
                            usage: "alarm"
                        }, (error)=>{
                            if (error) {
                                console.info(TAG + " error: " + JSON.stringify(error));
                                expect(false).assertTrue();
                                reject();
                            } else {
                                console.info(TAG + " vibrate builder success");
                                resolve();
                            }
                        });
                    })
                }

                let promise = new Promise((resolve, reject) => {
                    vibrator.startVibration({
                        type:"pattern",
                        pattern:builder1.build()
                    }, {
                        usage: "unknown"
                    }, (error)=>{
                        if (error) {
                            console.info(TAG + " error1: " + JSON.stringify(error));
                            expect(false).assertTrue();
                            reject();
                        } else {
                            console.info(TAG + " vibrate builder1 success");
                            resolve();
                        }
                    });
                })

                await promise.then(() =>{
                    return vibratePromise();
                }, ()=>{
                    console.info(TAG + " reject");
                })
                done();
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })
    })}