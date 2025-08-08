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

export default function VibratorJsTest_misc_9() {
    let isAvailable;
    const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
    describe("VibratorJsTest_misc_9", function () {
        beforeAll(async function (done) {
            /*
            * @tc.setup: setup invoked before all testcases
            */
            console.info('beforeAll called')
            console.info('VibratorJsTest_misc_9 Device type = ' + deviceInfo.deviceType);
            console.info('VibratorJsTest_misc_9 isAvailable = ' + isAvailable);
            try {
                if (deviceInfo.deviceType === '2in1' || ABILITYJUDGMENT === false) {
                    isAvailable = false;
                    console.info('VibratorJsTest_misc_9 isAvailable ' + isAvailable);
                    done();
                }else {
                    isAvailable = true;
                    console.info('VibratorJsTest_misc_9 isAvailable ' + isAvailable);
                    done();
                }
            } catch(error) {
                console.error('VibratorJsTest_misc_9 exception :' + JSON.stringify(error));
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
        * @tc.name:VibratorProgramticHapticTest001
        * @tc.desc:VibratorEventType CONTINUOUS is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0100
        * @tc.level:Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            TAG = "VibratorProgramticHapticTest001";
            console.info(TAG + ' Device type = ' + deviceInfo.deviceType);
            console.info(TAG +  ' isAvailable = ' + isAvailable);
            if(isAvailable){
                let eventType =  vibrator.VibratorEventType.CONTINUOUS;
                try {
                    expect(eventType).assertEqual(0);
                    console.log(TAG + " eventType:" + eventType);
                    setTimeout(() => {
                        done();
                    }, 500);
                }catch (error){
                    console.info(TAG + " error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest002
        * @tc.desc:VibratorEventType TRANSIENT is 1
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0200
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest002";
            if(isAvailable){
                let eventType =  vibrator.VibratorEventType.TRANSIENT;
                try {
                    expect(eventType).assertEqual(1);
                    console.log(TAG + " eventType:" + eventType);
                    setTimeout(() => {
                        done();
                    }, 500);
                }catch (error){
                    console.info(TAG + " error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest003
        * @tc.desc:VibratorCurvePoint Test
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0300
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest003";
            if(isAvailable){
                try {
                    let pointsMe = vibrator.VibratorCurvePoint = [
                        { time: 0, intensity: 0, frequency: -7 },
                        { time: 42, intensity: 1, frequency: -6 },
                        { time: 128, intensity: 0.94, frequency: -4 },
                        { time: 217, intensity: 0.63, frequency: -14 },
                        { time: 763, intensity: 0.48, frequency: -14 },
                        { time: 1125, intensity: 0.53, frequency: -10 },
                        { time: 1503, intensity: 0.42, frequency: -14 },
                        { time: 1858, intensity: 0.39, frequency: -14 },
                        { time: 2295, intensity: 0.34, frequency: -17 },
                        { time: 2448, intensity: 0.21, frequency: -14 },
                        { time: 2468, intensity: 0, frequency: -21 }
                    ]
                    console.info(TAG + " pointsMe: " + JSON.stringify(pointsMe));
                    setTimeout(() => {
                        done();
                    }, 500);
                }catch (error){
                    console.info(TAG + " error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest004
        * @tc.desc:VibratorEvent Test
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0400
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest004";
            if(isAvailable){
                try {
                    let pointsMe = vibrator.VibratorCurvePoint = [
                        { time: 0, intensity: 0, frequency: -7 },
                        { time: 42, intensity: 1, frequency: -6 },
                        { time: 128, intensity: 0.94, frequency: -4 },
                        { time: 217, intensity: 0, frequency: -21 }
                    ]
                    let VibratorEvent = vibrator.ContinuousParam = {
                        intensity: 97,
                        frequency: 34,
                        points:pointsMe,
                        index: 0,
                        duration:35
                    }
                    console.info(TAG + " VibratorEvent: " + JSON.stringify(VibratorEvent));
                    setTimeout(() => {
                        done();
                    }, 500);
                }catch (error){
                    console.info(TAG + " error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest005
        * @tc.desc:VibratorPatternBuilder Test
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0500
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest005";
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
                    builder.addContinuousEvent(0, 217, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                    done();
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest006
        * @tc.desc:The number of VibratorCurvePoint events is less than 4
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0600
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest006";
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
                            time:217,
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
                    builder.addContinuousEvent(0, 217, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                    done();
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest007
        * @tc.desc:The number of VibratorCurvePoint events is greater than 16
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0700
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest007";
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
                            time:322,
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
                    builder.addContinuousEvent(0, 322, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                    done();
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest008
        * @tc.desc:ContinuousParam Test
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0800
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest008";
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
                            time:322,
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
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest009
        * @tc.desc:TransientParam Test
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0900
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest009";
            if(isAvailable){
                try {
                    let param = vibrator.TransientParam = {
                        intensity: 97,
                        frequency: 34,
                        index: 0
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest010
        * @tc.desc:VibratorCurvePoint time is 5, intensity is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1000
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest010";
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
                            time:5,
                            intensity:0,
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
                    builder.addContinuousEvent(5, 217, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
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
        * @tc.name:VibratorProgramticHapticTest011
        * @tc.desc:VibratorCurvePoint time is 5, intensity is 1, frequency is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1100
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest011";
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
                            time:5,
                            intensity:1,
                            frequency:0
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
                    builder.addContinuousEvent(0, 217, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
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
        * @tc.name:VibratorProgramticHapticTest012
        * @tc.desc:VibratorCurvePoint time is 5, intensity is 1, frequency is -100
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1200
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest012";
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
                            time:5,
                            intensity:1,
                            frequency:-100
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
                    builder.addContinuousEvent(0, 217, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
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
        * @tc.name:VibratorProgramticHapticTest013
        * @tc.desc:VibratorCurvePoint time is 5, intensity is 1, frequency is 100
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1300
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest013";
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
                            time:5,
                            intensity:1,
                            frequency:100
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
                    builder.addContinuousEvent(0, 217, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
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
                            console.info(TAG + " vibrate success.");
                            setTimeout(() => {
                                done();
                            }, 500);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error)
                    expect(false).assertTrue();
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest014
        * @tc.desc:VibratorCurvePoint time is 5, intensity is 1, frequency is 101
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1400
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest014";
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
                            time:5,
                            intensity:1,
                            frequency:101
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
                    builder.addContinuousEvent(0, 217, param);
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
                            setTimeout(() => {
                                done();
                            }, 500);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest015
        * @tc.desc:VibratorCurvePoint time is 5, intensity is 2, frequency is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1500
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest015";
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
                            time:5,
                            intensity:2,
                            frequency:0
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
                    builder.addContinuousEvent(0, 217, param);
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
                            setTimeout(() => {
                                done();
                            }, 500);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest016
        * @tc.desc:VibratorCurvePoint time is 5, intensity is 2, frequency is -100
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1600
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest016";
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
                            time:5,
                            intensity:2,
                            frequency:-100
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
                    builder.addContinuousEvent(0, 217, param);
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
                            setTimeout(() => {
                                done();
                            }, 500);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest017
        * @tc.desc:VibratorCurvePoint time is 5, intensity is 2, frequency is 100
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1700
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest017";
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
                            time:5,
                            intensity:2,
                            frequency:100
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
                    builder.addContinuousEvent(5, 217, param);
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
                            setTimeout(() => {
                                done();
                            }, 500);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest018
        * @tc.desc:VibratorCurvePoint time is 5, intensity is 2, frequency is 101
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1800
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest018";
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
                            time:5,
                            intensity:2,
                            frequency:101
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
                    builder.addContinuousEvent(0, 217, param);
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
                            setTimeout(() => {
                                done();
                            }, 500);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest019
        * @tc.desc:VibratorCurvePoint time is 6000, intensity is 1, frequency is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1900
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest019";
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
                            time:128,
                            intensity:1,
                            frequency:0
                        },
                        {
                            time:217,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:6000,
                            intensity:1,
                            frequency:0
                        }
                    ]
                    let param = {
                        intensity:97,
                        frequency:34,
                        points:pointsMe,
                        index:0
                    }
                    builder.addContinuousEvent(0, 6000, param);
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
                            setTimeout(() => {
                                done();
                            }, 500);
                        }
                    })
                } catch (error) {
                    console.info(TAG + " Exception error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest020
        * @tc.desc:ContinuousParam intensity is 100, frequency is 50,index is 0, points is []
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2000
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest020";
            if(isAvailable){
                try {
                    let param = vibrator.ContinuousParam = {
                        intensity: 100,
                        frequency: 50,
                        index: 0,
                        points:[]
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest021
        * @tc.desc:ContinuousParam intensity is 100, frequency is 100
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2100
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest021";
            if(isAvailable){
                try {
                    let param = vibrator.ContinuousParam = {
                        intensity: 100,
                        frequency: 100
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest022
        * @tc.desc:ContinuousParam intensity is 100, frequency is 101, index is 0, points is []
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2200
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest022";
            if(isAvailable){
                try {
                    let param = vibrator.ContinuousParam = {
                        intensity: 100,
                        frequency: 101,
                        index: 0,
                        points:[]
                    }
                    console.info(TAG + " param is " + JSON.stringify(param));
                    done();
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest023
        * @tc.desc: time is 0,during is 1000
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2300
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest023";
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
                            time:168,
                            intensity:0.1,
                            frequency:-4
                        },
                        {
                            time:239,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:309,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:359,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:396,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:430,
                            intensity:0,
                            frequency:-7
                        },
                        {
                            time:462,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:500,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:600,
                            intensity:0.1,
                            frequency:-4
                        },
                        {
                            time:700,
                            intensity:1,
                            frequency:-1
                        },
                        {
                            time:800,
                            intensity:1,
                            frequency:-4
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
                        intensity:50,
                        frequency:10,
                        points:pointsMe,
                        index:0
                    }
                    builder.addContinuousEvent(0, 1000, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
                    expect(false).assertTrue();
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
                            setTimeout(() => {
                                done();
                            }, 1000);
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
        * @tc.name:VibratorProgramticHapticTest024
        * @tc.desc: time is 0, during is 5000, intensity is 100, frequency is 50, index is 0, point is pointsMe
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2400
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest024";
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
                        intensity:100,
                        frequency:50,
                        points:pointsMe,
                        index:0
                    }
                    builder.addContinuousEvent(0, 5000, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
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
                            setTimeout(() => {
                                done();
                            }, 6000);
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
        * @tc.name:VibratorProgramticHapticTest025
        * @tc.desc: time is 0, during is 5000, intensity is 100, frequency is 50, index, point is None
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2500
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest025";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = {
                        intensity:100,
                        frequency:50
                    }
                    builder.addContinuousEvent(0, 5000, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
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
                            setTimeout(() => {
                                done();
                            }, 6000);
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
        * @tc.name:VibratorProgramticHapticTest026
        * @tc.desc: time is 0, during is 5000, intensity is 100, frequency is 100, index, point is None
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2600
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest026";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = {
                        intensity:100,
                        frequency:100
                    }
                    builder.addContinuousEvent(0, 5000, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
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
                            setTimeout(() => {
                                done();
                            }, 6000);
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
        * @tc.name:VibratorProgramticHapticTest027
        * @tc.desc: time is 0, during is 5000, intensity is 100, frequency is 50, index is 0, point is pointsMe
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2700
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest027";
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
                        intensity:100,
                        frequency:100,
                        points:pointsMe,
                        index:0
                    }
                    builder.addContinuousEvent(0, 5000, param);
                    console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " addContinuousEvent error: " + JSON.stringify(error));
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
                            setTimeout(() => {
                                done();
                            }, 6000);
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
    })}