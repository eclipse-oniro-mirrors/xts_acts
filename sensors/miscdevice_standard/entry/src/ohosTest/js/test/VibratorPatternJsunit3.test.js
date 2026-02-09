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

export default function VibratorJsTest_misc_12() {
    let isAvailable;
    const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
    describe("VibratorJsTest_misc_12", function () {
        beforeAll(async function (done) {
            /*
            * @tc.setup: setup invoked before all testcases
            */
            console.info('beforeAll called')
            console.info(`VibratorJsTest_misc_12 Device type = ${deviceInfo.deviceType}`);
            console.info(`VibratorJsTest_misc_12 isAvailable = ${isAvailable}`);
            try {
                const vibratorsList = vibrator.getVibratorInfoSync();
                if (ABILITYJUDGMENT === false || vibratorsList.length === 0 ||
                    (vibratorsList.length !== 0 && vibratorsList.every(vibrator => !vibrator.isLocalVibrator))) {
                    isAvailable = false;
                    console.info(`VibratorJsTest_misc_12 isAvailable ${isAvailable}`);
                    done();
                }else {
                    isAvailable = true;
                    console.info(`VibratorJsTest_misc_12 isAvailable ${isAvailable}`);
                    done();
                }
            } catch(error) {
                console.error(`VibratorJsTest_misc_12 exception : ${JSON.stringify(error)}`);
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
                    console.info(`afterEach: error in stopping vibration. error: ${JSON.stringify(error)}`);
                    done();
                })
            } catch(error){
                console.info(`afterEach error: ${JSON.stringify(error)}`);
                done();
            }
            console.info('afterEach end');
        })

        const PARAMETER_ERROR_CODE = 401;
        let TAG = "";

        /**
         * @tc.name   VibratorProgramticHapticTest068
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6800
         * @tc.desc   Trigger short and long vibrations, with short vibrations taking priority over long vibrations
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let TAG = "====>VibratorProgramticHapticTest068";
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
                builder.addContinuousEvent(60, 5000, param);
                console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + ` addContinuousEvent error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
            }
            let builder1 = new vibrator.VibratorPatternBuilder();
            try {
                builder1.addTransientEvent(0);
                console.info(TAG + ` builder.build1 is: ${JSON.stringify(builder1.build())}`);
                await vibrator.startVibration({ type:"pattern", pattern:builder.build() }, { usage: "unknown" });
                await vibrator.startVibration({ type:"pattern", pattern:builder1.build() }, { usage: "alarm" });
                if (!isAvailable) {
                    console.info(TAG + ' isAvailable1 is false error');
                    expect(false).assertTrue();
                    done();
                }
                console.info(TAG + ' startVibration success' );
                expect(true).assertTrue();
                done();
            } catch (error){
                if (error && !isAvailable) {
                    console.info(TAG + ` isAvailable1 is false error: ${JSON.stringify(error)}`);
                    expect(error.code).assertEqual(14600101);
                    done();
                } else {
                    console.info(TAG + ` isAvailable1 is true startVibration error: ${JSON.stringify(error)}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest069
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6900
         * @tc.desc   Simultaneously triggering long vibrations, vibrating according to priority
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let TAG = "====>VibratorProgramticHapticTest069";
            let builder = new vibrator.VibratorPatternBuilder();
            let builder1 = new vibrator.VibratorPatternBuilder();
            let pointsMe  = vibrator.VibratorCurvePoint = [
                {
                    time:0,
                    intensity:0,
                    frequency:-7
                },
                {
                    time:142,
                    intensity:1,
                    frequency:-6
                },
                {
                    time:228,
                    intensity:1,
                    frequency:-4
                },
                {
                    time:317,
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
            let param1 = {
                intensity:97,
                frequency:34,
                points:pointsMe,
                index:0
            }
            try {
                builder.addContinuousEvent(0, 317, param);
                console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
                builder1.addContinuousEvent(0, 317, param1);
                console.info(TAG + ` builder1.build is ${JSON.stringify(builder1.build())}`);
            }catch (error){
                console.info(TAG + ` addContinuousEvent error:: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
            }

            try {
                await vibrator.startVibration({type:"pattern", pattern:builder.build() }, { usage: "unknown" });
                await vibrator.startVibration({ type:"pattern",pattern:builder1.build()}, { usage: "alarm" });
                if (!isAvailable) {
                    console.info(TAG + ' isAvailable1 is false error');
                    expect(false).assertTrue();
                    done();
                }
                console.info(TAG + ' startVibration success' );
                expect(true).assertTrue();
                done();
            } catch (error){
                if (error && !isAvailable) {
                    console.info(TAG + ` isAvailable1 is false error: ${JSON.stringify(error)}`);
                    expect(error.code).assertEqual(14600101);
                    done();
                } else {
                    console.info(TAG + ` isAvailable1 is true startVibration error: ${JSON.stringify(error)}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest070
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7000
         * @tc.desc   Simultaneously triggering short vibrations, vibrating according to priority
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let TAG = "====>VibratorProgramticHapticTest070";
            let builder = new vibrator.VibratorPatternBuilder();
            let builder1 = new vibrator.VibratorPatternBuilder();
            let param = {
                intensity:97,
                frequency:34,
                index:0
            }
            try {
                builder.addTransientEvent(0, param);
                console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
                builder1.addTransientEvent(0, param);
                console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + ` addContinuousEvent error:: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
            }
            try {
                await vibrator.startVibration({ type:"pattern", pattern:builder.build() }, { usage: "unknown" });
                await vibrator.startVibration({ type:"pattern", pattern:builder1.build() }, { usage: "alarm" });
                if (!isAvailable) {
                    console.info(TAG + ' isAvailable1 is false error');
                    expect(false).assertTrue();
                    done();
                }
                console.info(TAG + ' startVibration success' );
                expect(true).assertTrue();
                done();
            } catch (error){
                if (error && !isAvailable) {
                    console.info(TAG + ` isAvailable1 is false error: ${JSON.stringify(error)}`);
                    expect(error.code).assertEqual(14600101);
                    done();
                } else {
                    console.info(TAG + ` isAvailable1 is true startVibration error: ${JSON.stringify(error)}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest071
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7100
         * @tc.desc   addContinuousEvent time is 0,duration is 5000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let TAG = "====>VibratorProgramticHapticTest071";
            let builder = new vibrator.VibratorPatternBuilder();
            try {
                let pointsMe  = vibrator.VibratorCurvePoint = [
                    {
                        time:0,
                        intensity:0,
                        frequency:-7
                    },
                    {
                        time:62,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:82,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:102,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:122,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:142,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:162,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:182,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:202,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:222,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:1242,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:2062,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:2802,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:3002,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:4002,
                        intensity:1,
                        frequency:-6
                    },
                    {
                        time:5000,
                        intensity:0,
                        frequency:-4
                    }
                ]
                let param = vibrator.ContinuousParam = {
                    intensity: 97,
                    frequency: 34,
                    points:pointsMe,
                    index: 0
                }
                builder.addContinuousEvent(0, 5000, param);
                console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + ` TransientParam error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
            try {
                await vibrator.startVibration({ type:"pattern", pattern:builder.build() },{ usage:"alarm" });
                if (!isAvailable) {
                    console.info(TAG + ' isAvailable1 is false error');
                    expect(false).assertTrue();
                    done();
                }
                console.info(TAG + ' startVibration success' );
                expect(true).assertTrue();
                done();
            } catch (error){
                if (error && !isAvailable) {
                    console.info(TAG + ` isAvailable1 is false error: ${JSON.stringify(error)}`);
                    expect(error.code).assertEqual(14600101);
                    done();
                } else {
                    console.info(TAG + ` isAvailable1 is true startVibration error: ${JSON.stringify(error)}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest072
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7200
         * @tc.desc   addContinuousEvent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let TAG = "====>VibratorProgramticHapticTest072";
            let builder = new vibrator.VibratorPatternBuilder();
            try {
                builder.addContinuousEvent(0, 272);
                console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + ` TransientParam error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }

            try {
                await vibrator.startVibration({ type:"pattern", pattern:builder.build() },{ usage:"alarm" });
                if (!isAvailable) {
                    console.info(TAG + ' isAvailable1 is false error');
                    expect(false).assertTrue();
                    done();
                }
                console.info(TAG + ' startVibration success' );
                expect(true).assertTrue();
                done();
            } catch (error){
                if (error && !isAvailable) {
                    console.info(TAG + ` isAvailable1 is false error: ${JSON.stringify(error)}`);
                    expect(error.code).assertEqual(14600101);
                    done();
                } else {
                    console.info(TAG + ` isAvailable1 is true startVibration error: ${JSON.stringify(error)}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest073
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7300
         * @tc.desc   addTransientEvent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let TAG = "====>VibratorProgramticHapticTest073";
            let builder = new vibrator.VibratorPatternBuilder();
            try {
                builder.addTransientEvent(0);
                console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + ` TransientParam error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }

            try {
                await vibrator.startVibration({ type:"pattern", pattern:builder.build() },{ usage:"alarm" });
                if (!isAvailable) {
                    console.info(TAG + ' isAvailable1 is false error');
                    expect(false).assertTrue();
                    done();
                }
                console.info(TAG + ' startVibration success' );
                expect(true).assertTrue();
                done();
            } catch (error){
                if (error && !isAvailable) {
                    console.info(TAG + ` isAvailable1 is false error: ${JSON.stringify(error)}`);
                    expect(error.code).assertEqual(14600101);
                    done();
                } else {
                    console.info(TAG + ` isAvailable1 is true startVibration error: ${JSON.stringify(error)}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest074
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7400
         * @tc.desc   addTransientEvent Cycle 1000 times
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let TAG = "====>VibratorProgramticHapticTest074";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = vibrator.TransientParam ={
                        intensity:100,
                        frequency:100,
                        index:0
                    }
                    builder.addTransientEvent(0, param);
                    console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
                }catch (error){
                    console.info(TAG + ` TransientParam error: ${JSON.stringify(error)}`);
                }

                try {
                    for (let times = 0; times < 1000; times++){
                        vibrator.startVibration({
                            type:"pattern",
                            pattern:builder.build()
                        },{
                            usage:"alarm",
                        },(error) => {
                            if (error) {
                                console.info(TAG + ` vibrate fail: ${JSON.stringify(error)}`);
                            } else {
                                console.info(TAG + " vibrate success, times is:" + times);
                            }
                        })
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                } catch (error) {
                    console.info(TAG + ` Exception error: ${error}`);
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest075
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7500
         * @tc.desc   addContinuousEvent Cycle 1000 times
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let TAG = "====>VibratorProgramticHapticTest075";
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
                            time:62,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:82,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:102,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:122,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:142,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:162,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:182,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:202,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:222,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:242,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:262,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:282,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:302,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:302,
                            intensity:1,
                            frequency:-6
                        },
                        {
                            time:382,
                            intensity:0,
                            frequency:-4
                        }
                    ]
                    let param = vibrator.ContinuousParam = {
                        intensity: 97,
                        frequency: 34,
                        points:pointsMe,
                        index: 0
                    }
                    builder.addContinuousEvent(0, 382, param);
                    console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
                }catch (error){
                    console.info(TAG + ` TransientParam error: ${JSON.stringify(error)}`);
                    expect(false).assertTrue();
                    done();
                }
                try {
                    for(let times = 0; times < 1000; times++){
                        vibrator.startVibration({
                            type:"pattern",
                            pattern:builder.build()
                        },{
                            usage:"alarm",
                        },(error) => {
                            if (error) {
                                console.info(TAG + ` vibrate fail: ${JSON.stringify(error)}`);
                            } else {
                                console.info(TAG + ` vibrate success, times is: ${times}`);
                            }
                        })
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                } catch (error) {
                    console.info(TAG + ` Exception error: ${error}`);
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0050
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0501
         * @tc.desc   VibratorPatternBuilder Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0050";    
            try {
                let builder = new vibrator.VibratorPatternBuilder();
                let pointsMe  = vibrator.VibratorCurvePoint = [
                    {
                        time:0,
                        intensity:0
                    },
                    {
                        time:0.1,
                        frequency:-6
                    },
                    {
                        time:0.2,
                        intensity:1,
                        frequency:-4
                    },
                    {
                        time:0.3,
                        intensity:0,
                        frequency:-4
                    }
                ]
                let param = {
                    intensity:0,
                    frequency:0,
                    points:pointsMe,
                    index:2
                }
                builder.addContinuousEvent(1800000, 1, param);
                let VibratorPattern = builder.build()
                console.info(TAG + " builder.build is " + JSON.stringify(VibratorPattern));
                expect(VibratorPattern != null).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0060
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0601
         * @tc.desc   VibratorPatternBuilder Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0060";    
            try {
                let builder = new vibrator.VibratorPatternBuilder();
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
                        time:128,
                        intensity:1,
                        frequency:-4
                    },
                    {
                        time:217,
                        intensity:0,
                        frequency:-4
                    }
                ]
                let param = {
                    points:pointsMe,
                    index:0
                }
                builder.addContinuousEvent(0, 217, param);
                let VibratorPattern = builder.build()
                console.info(TAG + " builder.build is " + JSON.stringify(VibratorPattern));
                expect(VibratorPattern != null).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0051
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0510
         * @tc.desc   VibratorPatternBuilder Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0051";    
            try {
                let builder = new vibrator.VibratorPatternBuilder();
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
                        time:128,
                        intensity:1,
                        frequency:-4
                    },
                    {
                        time:217,
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
                builder.addContinuousEvent(1800001, 217, param);
                let VibratorPattern = builder.build()
                console.info(TAG + " builder.build is " + JSON.stringify(VibratorPattern));
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0061
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0610
         * @tc.desc   VibratorPatternBuilder Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0061";    
            try {
                let builder = new vibrator.VibratorPatternBuilder();
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
                        time:128,
                        intensity:1,
                        frequency:-4
                    },
                    {
                        time:217,
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
                builder.addContinuousEvent(0, 0, param);
                let VibratorPattern = builder.build()
                console.info(TAG + " builder.build is " + JSON.stringify(VibratorPattern));
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0071
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0710
         * @tc.desc   VibratorPatternBuilder Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0071";    
            try {
                let builder = new vibrator.VibratorPatternBuilder();
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
                        time:128,
                        intensity:1,
                        frequency:-4
                    },
                    {
                        time:217,
                        intensity:0,
                        frequency:-4
                    }
                ]
                let param = {
                    intensity:97,
                    frequency:34,
                    points:pointsMe,
                    index:3
                }
                builder.addContinuousEvent(0, 217, param);
                let VibratorPattern = builder.build()
                console.info(TAG + " builder.build is " + JSON.stringify(VibratorPattern));
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0081
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0810
         * @tc.desc   VibratorPatternBuilder Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0081";    
            try {
                let builder = new vibrator.VibratorPatternBuilder();
                let pointsMe  = vibrator.VibratorCurvePoint = [
                    {
                        time:0,
                        intensity:0,
                        frequency:-7
                    },
                    {
                        time:42,
                        intensity:-1,
                        frequency:-6
                    },
                    {
                        time:128,
                        intensity:1,
                        frequency:-4
                    },
                    {
                        time:217,
                        intensity:0,
                        frequency:-4
                    }
                ]
                let param = {
                    intensity:97,
                    frequency:34,
                    points:pointsMe,
                    index:1
                }
                builder.addContinuousEvent(0, 217, param);
                let VibratorPattern = builder.build()
                console.info(TAG + " builder.build is " + JSON.stringify(VibratorPattern));
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0091
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0910
         * @tc.desc   VibratorPatternBuilder Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0091";    
            try {
                let builder = new vibrator.VibratorPatternBuilder();
                let pointsMe  = vibrator.VibratorCurvePoint = [
                    {
                        time:0,
                        intensity:0,
                        frequency:-7
                    },
                    {
                        time:42,
                        intensity:1,
                        frequency:-101
                    },
                    {
                        time:128,
                        intensity:1,
                        frequency:-4
                    },
                    {
                        time:217,
                        intensity:0,
                        frequency:-4
                    }
                ]
                let param = {
                    intensity:97,
                    frequency:34,
                    points:pointsMe,
                    index:1
                }
                builder.addContinuousEvent(0, 217, param);
                let VibratorPattern = builder.build()
                console.info(TAG + " builder.build is " + JSON.stringify(VibratorPattern));
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0040
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0401
         * @tc.desc   VibratorEvent Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0040";
            try {
                let builder = new vibrator.VibratorPatternBuilder();
                let param = vibrator.TransientParam = {
                    intensity: 0,
                    frequency: 0,
                };
                builder.addTransientEvent(1800000, param);
                let VibratorPattern = builder.build()
                console.info(TAG + ` VibratorPattern: ${JSON.stringify(VibratorPattern)}`);
                expect(VibratorPattern != null).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0041
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0410
         * @tc.desc   VibratorEvent Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0041";
            try {
                let builder = new vibrator.VibratorPatternBuilder();
                let param = vibrator.TransientParam = {
                    index:2
                };
                builder.addTransientEvent(0, param);
                let VibratorPattern = builder.build()
                console.info(TAG + ` VibratorPattern: ${JSON.stringify(VibratorPattern)}`);
                expect(VibratorPattern != null).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0042
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0420
         * @tc.desc   VibratorEvent Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0042";
            try {
                let builder = new vibrator.VibratorPatternBuilder();
                let param = vibrator.TransientParam = {
                    index:2
                };
                builder.addTransientEvent(1800001, param);
                let VibratorPattern = builder.build()
                console.info(TAG + ` VibratorPattern: ${JSON.stringify(VibratorPattern)}`);
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0043
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0430
         * @tc.desc   VibratorEvent Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0043";
            try {
                let builder = new vibrator.VibratorPatternBuilder();
                let param = vibrator.TransientParam = {
                    index:3
                };
                builder.addTransientEvent(0, param);
                let VibratorPattern = builder.build()
                console.info(TAG + ` VibratorPattern: ${JSON.stringify(VibratorPattern)}`);
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0044
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0440
         * @tc.desc   VibratorTime Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0044";
            try {
                let effect = vibrator.VibratorTime = {
                    type: "time",
                    duration: 1
                };
                let attribute = vibrator.VibratorAttribute = {
                    usage: "unknown"
                };
                await vibrator.startVibration(effect, attribute);
                console.info(TAG + ` duration: 1  startVibration success`);
                expect(attribute != null).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                if (isAvailable) {
                    expect(false).assertTrue();
                } else {
                    console.info(TAG + ` device is not supported`);
                    expect(error.code).assertEqual(14600101);
                } 
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0045
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0450
         * @tc.desc   VibratorTime Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0045";
            try {
                let effect = vibrator.VibratorTime = {
                    type: "time",
                    duration: 0
                };
                let attribute = vibrator.VibratorAttribute = {
                    usage: "unknown"
                };
                await vibrator.startVibration(effect, attribute);
                console.info(TAG + ` duration: 0  startVibration success`);
                expect(false).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest0046
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0460
         * @tc.desc   VibratorTime Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest0046";
            try {
                let effect = vibrator.VibratorTime = {
                    type: "time",
                    duration: 1800000
                };
                let attribute = vibrator.VibratorAttribute = {
                    usage: "unknown"
                };
                await vibrator.startVibration(effect, attribute);
                console.info(TAG + ` duration: 1800000  startVibration success`);
                expect(attribute != null).assertTrue();
                done();
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                if (isAvailable) {
                    expect(false).assertTrue();
                } else {
                    console.info(TAG + ` device is not supported`);
                    expect(error.code).assertEqual(14600101);
                }
                done();
            }
        })
    })}