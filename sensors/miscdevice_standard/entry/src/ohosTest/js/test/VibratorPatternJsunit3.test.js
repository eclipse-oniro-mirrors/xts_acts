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
            console.info('VibratorJsTest_misc_12 Device type = ' + deviceInfo.deviceType);
            console.info('VibratorJsTest_misc_12 isAvailable = ' + isAvailable);
            try {
                const vibratorsList = vibrator.getVibratorInfoSync();
                if (ABILITYJUDGMENT === false || vibratorsList.length === 0 ||
                    (vibratorsList.length !== 0 && vibratorsList.every(vibrator => !vibrator.isLocalVibrator))) {
                    isAvailable = false;
                    console.info('VibratorJsTest_misc_12 isAvailable ' + isAvailable);
                    done();
                }else {
                    isAvailable = true;
                    console.info('VibratorJsTest_misc_12 isAvailable ' + isAvailable);
                    done();
                }
            } catch(error) {
                console.error('VibratorJsTest_misc_12 exception :' + JSON.stringify(error));
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
         * @tc.name:VibratorProgramticHapticTest068
         * @tc.desc:Trigger short and long vibrations, with short vibrations taking priority over long vibrations
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6800
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest068";
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
                    builder.addContinuousEvent(60, 5000, param);
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
                        setTimeout(() => {
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
                                    console.info(TAG + " vibrate builder success");
                                    resolve();
                                }
                            });
                        }, 1000);
                    })
                }

                let promise = new Promise((resolve, reject) => {
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
         * @tc.name:VibratorProgramticHapticTest069
         * @tc.desc:Simultaneously triggering long vibrations, vibrating according to priority
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_6900
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest069";
            if(isAvailable){
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
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                    builder1.addContinuousEvent(0, 317, param1);
                    console.info(TAG + " builder1.build is " + JSON.stringify(builder1.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
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
                            console.info(TAG + " vibrate builder success");
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
         * @tc.name:VibratorProgramticHapticTest070
         * @tc.desc:Simultaneously triggering short vibrations, vibrating according to priority
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7000
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest070";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                let builder1 = new vibrator.VibratorPatternBuilder();
                let param = {
                    intensity:97,
                    frequency:34,
                    index:0
                }
                try {
                    builder.addTransientEvent(0, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                    builder1.addTransientEvent(0, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
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
                                setTimeout(() => {
                                }, 500);
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
                            console.info(TAG + " vibrate builder success");
                            setTimeout(() => {
                                done();
                            }, 30);
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
         * @tc.name:VibratorProgramticHapticTest071
         * @tc.desc:addContinuousEvent time is 0,duration is 5000
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7100
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest071";
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
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
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
                            console.info(TAG + " vibrate fail:" + JSON.stringify(error))
                            expect(false).assertTrue();
                            done();
                        } else {
                            console.info(TAG + " vibrate success");
                            setTimeout(() => {
                                done();
                            }, 5000);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })
        /*
         * @tc.name:VibratorProgramticHapticTest072
         * @tc.desc:addContinuousEvent
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7200
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest072";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    builder.addContinuousEvent(0, 272);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
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
                            console.info(TAG + " vibrate fail:" + JSON.stringify(error))
                            expect(false).assertTrue();
                            done();
                        } else {
                            console.info(TAG + " vibrate success");
                            setTimeout(() => {
                                done();
                            }, 500);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
         * @tc.name:VibratorProgramticHapticTest073
         * @tc.desc:addTransientEvent
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7300
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest073";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    builder.addTransientEvent(0);
                    console.info(TAG + " builder.build is:" + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
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
                            console.info(TAG + " vibrate fail:" + JSON.stringify(error))
                            expect(false).assertTrue();
                            done();
                        } else {
                            console.info(TAG + " vibrate success");
                            setTimeout(() => {
                                done();
                            }, 500);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
         * @tc.name:VibratorProgramticHapticTest074
         * @tc.desc:addTransientEvent Cycle 1000 times
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7400
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest074";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = vibrator.TransientParam ={
                        intensity:100,
                        frequency:100,
                        index:0
                    }
                    builder.addTransientEvent(0, param);
                    console.info(TAG + " builder.build is:" + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
                }

                try {
                    for (let times = 0; times < 1000; times++){
                        vibrator.startVibration({
                            type:"pattern",
                            pattern:builder.build()
                        },{
                            usage:"alarm",
                            systemUsage:false
                        },(error) => {
                            if (error) {
                                console.info(TAG + " vibrate fail:" + JSON.stringify(error));
                            } else {
                                console.info(TAG + " vibrate success, times is:" + times);
                            }
                        })
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
         * @tc.name:VibratorProgramticHapticTest075
         * @tc.desc:addContinuousEvent Cycle 1000 times
         * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_7500
         * @tc.level:Level 3
         * @tc.type:Function
         * @tc.size:MediumTest
         */
        it("VibratorProgramticHapticTest075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest075";
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
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
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
                            systemUsage:false
                        },(error) => {
                            if (error) {
                                console.info(TAG + " vibrate fail:" + JSON.stringify(error));
                            } else {
                                console.info(TAG + " vibrate success, times is:" + times);
                            }
                        })
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })
    })}