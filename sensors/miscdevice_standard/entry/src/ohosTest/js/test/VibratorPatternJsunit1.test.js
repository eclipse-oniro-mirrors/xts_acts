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

export default function VibratorJsTest_misc_10() {
    let isAvailable;
    const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
    describe("VibratorJsTest_misc_10", function () {
        beforeAll(async function (done) {
            /*
            * @tc.setup: setup invoked before all testcases
            */
            console.info('beforeAll called')
            console.info('VibratorJsTest_misc_10 Device type = ' + deviceInfo.deviceType);
            console.info('VibratorJsTest_misc_10 isAvailable = ' + isAvailable);
            try {
                if (deviceInfo.deviceType === '2in1' || ABILITYJUDGMENT === false) {
                    isAvailable = false;
                    console.info('VibratorJsTest_misc_10 isAvailable ' + isAvailable);
                    done();
                }else {
                    isAvailable = true;
                    console.info('VibratorJsTest_misc_10 isAvailable ' + isAvailable);
                    done();
                }
            } catch(error) {
                console.error('VibratorJsTest_misc_10 exception :' + JSON.stringify(error));
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
        * @tc.name:VibratorProgramticHapticTest028
        * @tc.desc: time is 0, during is 5000, intensity is 100, frequency is 101, index, point is None
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2800
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest028";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = {
                        intensity:100,
                        frequency:101
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
                    setTimeout(() => {
                        done();
                    }, 500);
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest029
        * @tc.desc: time is 0, during is 5000, intensity is 100, frequency is 101, index is 0, point is pointsMe
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_2900
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest029";
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
                        frequency:101,
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
                    setTimeout(() => {
                        done();
                    }, 500);
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest030
        * @tc.desc: time is 0, during is 5000, intensity is 101, frequency is 50, index is 0, point is pointsMe
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3000
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest030";
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
                        intensity:101,
                        frequency:50,
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
        * @tc.name:VibratorProgramticHapticTest031
        * @tc.desc: time is 0, during is 5000, intensity is 101, frequency is 50, index, point is None
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3100
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest031";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = {
                        intensity:101,
                        frequency:50
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
        * @tc.name:VibratorProgramticHapticTest032
        * @tc.desc: time is 0, during is 6000, intensity is 101, frequency is 50, index, point is None
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3200
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest031";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = {
                        intensity:101,
                        frequency:50
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
        * @tc.name:VibratorProgramticHapticTest033
        * @tc.desc: time is 0, during is 6000, intensity is 101, frequency is 50, index is 0, point is pointsMe
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3300
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest033";
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
                            time:4500,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:6000,
                            intensity:0,
                            frequency:-4
                        }
                    ]
                    let param = {
                        intensity:101,
                        frequency:50,
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
        * @tc.name:VibratorProgramticHapticTest034
        * @tc.desc: time is 0, during is 6000, intensity is 100, frequency is 50, index is 0, point is pointsMe
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3400
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest034";
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
                            time:4500,
                            intensity:1,
                            frequency:-4
                        },
                        {
                            time:6000,
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
        * @tc.name:VibratorProgramticHapticTest035
        * @tc.desc:time is 0, intensity is 100, frequency is 50, index is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3500
        * @tc.level:Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest035";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = vibrator.TransientParam ={
                        intensity:100,
                        frequency:50,
                        index:0
                    }
                    builder.addTransientEvent(0, param);
                    console.info(TAG + " builder.build is:" + JSON.stringify(builder.build()));
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
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
        * @tc.name:VibratorProgramticHapticTest036
        * @tc.desc:addContinuousEvent time is 0, during is 5000, No options for optional parameters
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3600
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest036";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    builder.addContinuousEvent(0, 5000);
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
        * @tc.name:VibratorProgramticHapticTest037
        * @tc.desc:addTransientEvent time is 0, intensity is 100, frequency is 100
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3700
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest037";
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
        * @tc.name:VibratorProgramticHapticTest038
        * @tc.desc:addTransientEvent time is 0, intensity is 100, frequency is 101, index is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3800
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest038";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = vibrator.TransientParam ={
                        intensity:100,
                        frequency:101,
                        index:0
                    }
                    builder.addTransientEvent(0, param);
                    console.info(TAG + " builder.build is:" + JSON.stringify(builder.build()));
                    expect(false).assertTrue();
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
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
                            console.info(TAG + " vibrate success");;
                            expect(false).assertTrue();
                            done();
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
        * @tc.name:VibratorProgramticHapticTest039
        * @tc.desc:addTransientEvent time is 0, intensity is 101, frequency is 50, index is 0
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_3900
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest039";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = vibrator.TransientParam ={
                        intensity:101,
                        frequency:50,
                        index:0
                    }
                    builder.addTransientEvent(0, param);
                    console.info(TAG + " builder.build is:" + JSON.stringify(builder.build()));
                    expect(false).assertTrue();
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
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
                            done();
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
        * @tc.name:VibratorProgramticHapticTest040
        * @tc.desc:addTransientEvent time is 0, intensity is 101, frequency is 50, index is 0, duration is 6000
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4000
        * @tc.level:Level 0
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest040";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = vibrator.TransientParam ={
                        intensity:101,
                        frequency:50,
                        index:0
                    }
                    builder.addTransientEvent(0, 6000, param);
                    console.info(TAG + " builder.build is:" + JSON.stringify(builder.build()));
                    expect(false).assertTrue();
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
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
        * @tc.name:VibratorProgramticHapticTest041
        * @tc.desc:addTransientEvent time is 0, intensity is 100, duration is 6000
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4100
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest041";
            if(isAvailable){
                let builder = new vibrator.VibratorPatternBuilder();
                try {
                    let param = vibrator.TransientParam ={
                        intensity:100
                    }
                    builder.addTransientEvent(0, 6000, param);
                    console.info(TAG + " builder.build is:" + JSON.stringify(builder.build()));
                    expect(false).assertTrue();
                }catch (error){
                    console.info(TAG + " TransientParam error: " + JSON.stringify(error));
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
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done();
                }
            } else {
                console.log(TAG + ' is not supported on this device.');
                done();
            }
        })

        /*
        * @tc.name:VibratorProgramticHapticTest042
        * @tc.desc:addContinuousEvent time is 0, events is 128
        * @tc.number:SUB_SensorSystem_SmallComponentService_Miscdevice_ProgramticHaptic_4200
        * @tc.level:Level 3
        * @tc.type:Function
        * @tc.size:MediumTest
        */
        it("VibratorProgramticHapticTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            TAG = "VibratorProgramticHapticTest042";
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
                        intensity:50,
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
    })}