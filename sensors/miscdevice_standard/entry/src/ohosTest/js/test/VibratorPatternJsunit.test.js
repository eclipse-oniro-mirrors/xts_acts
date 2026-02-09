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
                const vibratorsList = vibrator.getVibratorInfoSync();
                if (ABILITYJUDGMENT === false || vibratorsList.length === 0 ||
                    (vibratorsList.length !== 0 && vibratorsList.every(vibrator => !vibrator.isLocalVibrator))) {
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

        /**
         * @tc.name   VibratorProgramticHapticTest001
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0100
         * @tc.desc   VibratorEventType CONTINUOUS is 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest001"; 
            try {
                let eventType =  vibrator.VibratorEventType.CONTINUOUS;
                console.info(TAG + ` eventType: ${eventType}`);
                expect(eventType).assertEqual(0);
                done();
            }catch (error){
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest002
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0200
         * @tc.desc   VibratorEventType TRANSIENT is 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest002";
            try {
                let eventType =  vibrator.VibratorEventType.TRANSIENT;
                console.info(TAG + ` eventType: ${eventType}`);
                expect(eventType).assertEqual(1);
                done();
            } catch (error){
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest003
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0300
         * @tc.desc   VibratorCurvePoint Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest003";
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
                console.info(TAG + ` pointsMe: ${JSON.stringify(pointsMe)}`);
                expect(pointsMe != null).assertTrue();
                done();
            } catch (error){
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest004
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0400
         * @tc.desc   VibratorEvent Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest004";
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
                console.info(TAG + ` VibratorEvent: ${JSON.stringify(VibratorEvent)}`);
                expect(VibratorEvent != null).assertTrue();
                done();
            } catch (error){
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest005
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0500
         * @tc.desc   VibratorPatternBuilder Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest005";    
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
                builder.addContinuousEvent(0, 217, param);
                console.info(TAG + " builder.build is " + JSON.stringify(builder.build()));
                expect(param != null).assertTrue();
                done();
            } catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest006
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0600
         * @tc.desc   The number of VibratorCurvePoint events is less than 4
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest006";
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
                expect(false).assertTrue();
                done();
            } catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest007
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0700
         * @tc.desc   The number of VibratorCurvePoint events is greater than 16
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest007";
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
                expect(false).assertTrue();
                done();
            } catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest008
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0800
         * @tc.desc   ContinuousParam Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest008"; 
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
                console.info(TAG + ` param is : ${JSON.stringify(param)}`);
                expect(param != null).assertTrue();
                done();
            } catch (error){
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest009
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_0900
         * @tc.desc   TransientParam Test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest009";
            try {
                let param = vibrator.TransientParam = {
                    intensity: 97,
                    frequency: 34,
                    index: 0
                }
                console.info(TAG + ` param is : ${JSON.stringify(param)}`);
                expect(param != null).assertTrue();
                done();
            } catch (error){
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest010
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1000
         * @tc.desc   VibratorCurvePoint time is 5, intensity is 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest010";   
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    if (error && !isAvailable) {
                        console.info(TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(error.code).assertEqual(14600101);
                        done();
                    } else if (error && isAvailable) {
                        console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(false).assertTrue();
                        done();
                    } else if (error == undefined && !isAvailable) {
                        console.info(TAG + `isAvailable is false but startVibration success`);
                        expect(false).assertTrue();
                        done();
                    }  else {
                        console.info(TAG + ' startVibration success' );
                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest011
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1100
         * @tc.desc   VibratorCurvePoint time is 5, intensity is 1, frequency is 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest011"; 
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    if (error && !isAvailable) {
                        console.info(TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(error.code).assertEqual(14600101);
                        done();
                    } else if (error && isAvailable) {
                        console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(false).assertTrue();
                        done();
                    } else if (error == undefined && !isAvailable) {
                        console.info(TAG + `isAvailable is false but startVibration success`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(TAG + ' startVibration success' );
                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest012
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1200
         * @tc.desc   VibratorCurvePoint time is 5, intensity is 1, frequency is -100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest012";   
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    if (error && !isAvailable) {
                        console.info(TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(error.code).assertEqual(14600101);
                        done();
                    } else if (error && isAvailable) {
                        console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(false).assertTrue();
                        done();
                    } else if (error == undefined && !isAvailable) {
                        console.info(TAG + `isAvailable is false but startVibration success`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(TAG + ' startVibration success' );
                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest013
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1300
         * @tc.desc   VibratorCurvePoint time is 5, intensity is 1, frequency is 100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest013";
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    if (error && !isAvailable) {
                        console.info(TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(error.code).assertEqual(14600101);
                        done();
                    } else if (error && isAvailable) {
                        console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(false).assertTrue();
                        done();
                    } else if (error == undefined && !isAvailable) {
                        console.info(TAG + `isAvailable is false but startVibration success`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(TAG + ' startVibration success' );
                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest014
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1400
         * @tc.desc   VibratorCurvePoint time is 5, intensity is 1, frequency is 101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest014";
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                    expect(false).assertTrue();
                    done();
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest015
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1500
         * @tc.desc   VibratorCurvePoint time is 5, intensity is 2, frequency is 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest015";
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                    expect(false).assertTrue();
                    done();
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest016
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1600
         * @tc.desc   VibratorCurvePoint time is 5, intensity is 2, frequency is -100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest016";  
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                    expect(false).assertTrue();
                    done();
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest017
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1700
         * @tc.desc   VibratorCurvePoint time is 5, intensity is 2, frequency is 100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest017";    
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                    expect(false).assertTrue();
                    done();
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest018
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1800
         * @tc.desc   VibratorCurvePoint time is 5, intensity is 2, frequency is 101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest018"; 
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                    expect(false).assertTrue();
                    done();
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest019
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_1900
         * @tc.desc   VibratorCurvePoint time is 6000, intensity is 1, frequency is 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest019";
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
                builder.addContinuousEvent(0, 5001, param);
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                    expect(false).assertTrue();
                    done();
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest020
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2000
         * @tc.desc   ContinuousParam intensity is 100, frequency is 50,index is 0, points is []
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest020";
            try {
                let param = vibrator.ContinuousParam = {
                    intensity: 100,
                    frequency: 50,
                    index: 0,
                    points:[]
                }
                console.info(TAG + `  param is : ${JSON.stringify(param)}`);
                expect(param != null).assertTrue();
                done();
            }catch (error){
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest021
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2100
         * @tc.desc   ContinuousParam intensity is 100, frequency is 100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest021";
            try {
                let param = vibrator.ContinuousParam = {
                    intensity: 100,
                    frequency: 100
                }
                console.info(TAG + `  param is : ${JSON.stringify(param)}`);
                expect(param != null).assertTrue();
                done();
            }catch (error){
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest022
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2200
         * @tc.desc   ContinuousParam intensity is 100, frequency is 101, index is 0, points is []
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest022";
            try {
                let param = vibrator.ContinuousParam = {
                    intensity: 100,
                    frequency: 101,
                    index: 0,
                    points:[]
                }
                console.info(TAG + `  param is : ${JSON.stringify(param)}`);
                expect(param != null).assertTrue();
                done();
            }catch (error){
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest023
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2300
         * @tc.desc   time is 0,during is 1000
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest023";
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
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
                    if (error && !isAvailable) {
                        console.info(TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(error.code).assertEqual(14600101);
                        done();
                    } else if (error && isAvailable) {
                        console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(false).assertTrue();
                        done();
                    } else if (error == undefined && !isAvailable) {
                        console.info(TAG + `isAvailable is false but startVibration success`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(TAG + ' startVibration success' );
                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest024
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2400
         * @tc.desc   time is 0, during is 5000, intensity is 100, frequency is 50, index is 0, point is pointsMe
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest024";
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
            }

            try {
                vibrator.startVibration({
                    type:"pattern",
                    pattern:builder.build()
                },{
                    usage:"alarm",
                    systemUsage:false
                },(error) => {
                    if (error && !isAvailable) {
                        console.info(TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(error.code).assertEqual(14600101);
                        done();
                    } else if (error && isAvailable) {
                        console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(false).assertTrue();
                        done();
                    } else if (error == undefined && !isAvailable) {
                        console.info(TAG + `isAvailable is false but startVibration success`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(TAG + ' startVibration success' );
                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest025
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2500
         * @tc.desc   time is 0, during is 5000, intensity is 100, frequency is 50, index, point is None
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest025";
            let builder = new vibrator.VibratorPatternBuilder();
            try {
                let param = {
                    intensity:100,
                    frequency:50
                }
                builder.addContinuousEvent(0, 5000, param);
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
            }

            try {
                vibrator.startVibration({
                    type:"pattern",
                    pattern:builder.build()
                },{
                    usage:"alarm",
                    systemUsage:false
                },(error) => {
                    if (error && !isAvailable) {
                        console.info(TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(error.code).assertEqual(14600101);
                        done();
                    } else if (error && isAvailable) {
                        console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(false).assertTrue();
                        done();
                    } else if (error == undefined && !isAvailable) {
                        console.info(TAG + `isAvailable is false but startVibration success`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(TAG + ' startVibration success' );
                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest026
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2600
         * @tc.desc   time is 0, during is 5000, intensity is 100, frequency is 100, index, point is None
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest026";
            let builder = new vibrator.VibratorPatternBuilder();
            try {
                let param = {
                    intensity:100,
                    frequency:100
                }
                builder.addContinuousEvent(0, 5000, param);
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
            }

            try {
                vibrator.startVibration({
                    type:"pattern",
                    pattern:builder.build()
                },{
                    usage:"alarm",
                    systemUsage:false
                },(error) => {
                    if (error && !isAvailable) {
                        console.info(TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(error.code).assertEqual(14600101);
                        done();
                    } else if (error && isAvailable) {
                        console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(false).assertTrue();
                        done();
                    } else if (error == undefined && !isAvailable) {
                        console.info(TAG + `isAvailable is false but startVibration success`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(TAG + ' startVibration success' );
                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   VibratorProgramticHapticTest027
         * @tc.number SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2700
         * @tc.desc   time is 0, during is 5000, intensity is 100, frequency is 50, index is 0, point is pointsMe
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("VibratorProgramticHapticTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "====>VibratorProgramticHapticTest027";
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
                console.info(TAG + `  builder.build is : ${JSON.stringify(builder.build())}`);
            }catch (error){
                console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
            }

            try {
                vibrator.startVibration({
                    type:"pattern",
                    pattern:builder.build()
                },{
                    usage:"alarm",
                    systemUsage:false
                },(error) => {
                    if (error && !isAvailable) {
                        console.info(TAG + ` isAvailable is false error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(error.code).assertEqual(14600101);
                        done();
                    } else if (error && isAvailable) {
                        console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
                        expect(false).assertTrue();
                        done();
                    } else if (error == undefined && !isAvailable) {
                        console.info(TAG + `isAvailable is false but startVibration success`);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info(TAG + ' startVibration success' );
                        expect(true).assertTrue();
                        done();
                    }
                })
            } catch (error) {
                console.info(TAG + ` catch error ,error.code: ${error.code},error.message: ${error.message}`);
                expect(false).assertTrue();
                done();
            }
        })  
    })}