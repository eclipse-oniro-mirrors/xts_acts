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

    /*
    * @tc.name:VibratorJsTest015
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0290
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest015"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.startVibration({
                type: "time",
                duration: 1000
            }, {
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    console.info('VibratorJsTest015 vibrator error');
                    expect(false).assertTrue();
                } else {
                    console.info('VibratorJsTest015 vibrator success');
                    expect(true).assertTrue();
                }
                setTimeout(()=>{
                    done();
                }, 500);
            });
            await vibrator.stopVibration();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest016
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0300
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest016"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: "",
                    duration: 1000
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest017
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0320
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest017"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "",
                    count: 3,
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest018
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0340
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest018"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration(null, null);
            } catch (error) {
                console.info(error);
                expect(true).assertTrue();
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest019
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0350
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest019"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            await vibrator.startVibration({
                type: "time",
                duration: 1000,
            }, {
                usage: "unknown"
            }).then(()=>{
                expect(true).assertTrue();
            }).catch((error)=>{
                expect(false).assertTrue();
            });
            await vibrator.stopVibration();
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest020
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0360
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest020"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                await vibrator.startVibration({
                    type: "",
                    duration: 1000
                }, {
                    usage: "unknown"
                }).then(()=>{
                    expect(false).assertTrue();
                }).catch((error)=>{
                    expect(true).assertTrue();
                });
                done();
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest021
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0380
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest021"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "",
                    count: 3,
                }, {
                    usage: "unknown"
                }).then(()=>{
                    expect(false).assertTrue();
                    done();
                }).catch((error)=>{
                    expect(true).assertTrue();
                    done();
                });
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest022
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0400
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest022"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: 1,
                    count: 3,
                }, {
                    usage: ""
                })
            } catch (error) {
                console.info(error);
                expect(true).assertTrue();
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest023
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0410
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest023"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    vibrator.startVibration({
                        type: "time",
                        duration: 100
                    }, {
                        usage: "unknown"
                    }, (error)=>{
                        if (error) {
                            expect(false).assertTrue();
                        } else {
                            expect(true).assertTrue();
                        }
                        setTimeout(()=>{
                            done();
                        }, 500);
                    });
                })
            }

            let promise = new Promise((resolve, reject) => {
                vibrator.startVibration({
                    type: "time",
                    duration: 100
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(false).assertTrue();
                        reject();
                    } else {
                        expect(true).assertTrue();
                        resolve();
                    }
                });
            })

            await promise.then(() =>{
                return vibratePromise();
            }, ()=>{
                console.info("VibratorJsTest023 reject");
            })
            await vibrator.stopVibration();
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest024
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0500
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest024"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.startVibration({
                type: "time",
                duration: 1000
            }, {
                id:0,
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    console.info('VibratorJsTest024 vibrator error');
                    expect(false).assertTrue();
                } else {
                    console.info('VibratorJsTest024 vibrator success');
                    expect(true).assertTrue();
                }
                setTimeout(()=>{
                    done();
                }, 500);
            });
            await vibrator.stopVibration();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest025
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0510
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest025"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: "",
                    duration: 1000
                }, {
                    id:1,
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest026
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0530
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest026"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "",
                    count: 3,
                }, {
                    id:null,
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest027
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0540
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest027"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.startVibration({
                type: "time",
                duration: 1000
            }, {
                usage: "unknown"
            }, (error)=>{
                if (error) {
                    console.info('VibratorJsTest027 startVibration error');
                    expect(false).assertTrue();
                } else {
                    console.info('VibratorJsTest027 startVibration success');
                    expect(true).assertTrue();
                }
                setTimeout(()=>{
                    done();
                }, 500);
            });
            await vibrator.stopVibration();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest028
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0550
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest028"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: "",
                    duration: 1000
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest029
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0570
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest029"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "",
                    count: 3,
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        expect(true).assertTrue();
                    } else {
                        expect(false).assertTrue();
                    }
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest030
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0590
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest030"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration(null, null);
            } catch (error) {
                console.info("VibratorJsTest030 error :" + error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest031
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0600
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest031"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            await vibrator.startVibration({
                type: "time",
                duration: 1000,
            }, {
                usage: "unknown"
            }).then(()=>{
                console.info("VibratorJsTest031 success");
                expect(true).assertTrue();
            }).catch((error)=>{
                console.info("VibratorJsTest031 error :" + error);
                if (error.code == 801) {
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }  
            });
            await vibrator.stopVibration();
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest032
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0610
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest032"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                await vibrator.startVibration({
                    type: "",
                    duration: 1000
                }, {
                    usage: "unknown"
                }).then(()=>{
                    console.info("VibratorJsTest032 success");
                    expect(false).assertTrue();
                }).catch((error)=>{
                    console.info("VibratorJsTest032 error :" + error);
                    expect(true).assertTrue();
                });
                done();
            } catch (error) {
                console.info("VibratorJsTest032 catch error :" + error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest033
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0630
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest033"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: "preset",
                    effectId: "",
                    count: 3,
                }, {
                    usage: "unknown"
                }).then(()=>{
                    console.info("VibratorJsTest033 success");
                    expect(false).assertTrue();
                    done();
                }).catch((error)=>{
                    console.info("VibratorJsTest033 error :" + error);
                    expect(true).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("VibratorJsTest033 catch error :" + error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest034
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0650
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest034"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.startVibration({
                    type: 1,
                    count: 3,
                }, {
                    usage: ""
                })
            } catch (error) {
                console.info("VibratorJsTest034 catch error :" + error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest035
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0660
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest035"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function vibratePromise() {
                return new Promise((resolve, reject) => {
                    vibrator.startVibration({
                        type: "time",
                        duration: 100
                    }, {
                        usage: "unknown"
                    }, (error)=>{
                        if (error) {
                            console.info("VibratorJsTest035 error :" + error);
                            expect(false).assertTrue();
                        } else {
                            console.info("VibratorJsTest035 success");
                            expect(true).assertTrue();
                        }
                        setTimeout(()=>{
                            done();
                        }, 500);
                    });
                })
            }

            let promise = new Promise((resolve, reject) => {
                vibrator.startVibration({
                    type: "time",
                    duration: 100
                }, {
                    usage: "unknown"
                }, (error)=>{
                    if (error) {
                        console.info("VibratorJsTest035 error :" + error);
                        expect(false).assertTrue();
                        reject();
                    } else {
                        console.info("VibratorJsTest035 success");
                        expect(true).assertTrue();
                        resolve();
                    }
                });
            })

            await promise.then(() =>{
                return vibratePromise();
            }, ()=>{
                console.info("VibratorJsTest035 reject");
            })
            await vibrator.stopVibration();
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest036
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0750
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it("VibratorJsTest036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest036"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function vibrateCallback(error) {
                if (error) {
                    console.info('VibratorJsTest036  stop fail');
                    expect(false).assertTrue();
                } else {
                    console.info('VibratorJsTest036  stop off');
                    expect(false).assertTrue();
                }
                setTimeout(()=>{
                    done();
                }, 500);
            }
            try {
                vibrator.stopVibration("", vibrateCallback);
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest037
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0770
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest037"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.stopVibration("").then(() => {
                    console.log("VibratorJsTest037  stop error");
                    expect(false).assertTrue();
                    setTimeout(()=>{
                        done();
                    }, 500);
                }, (error)=>{
                    expect(false).assertTrue();
                    console.log("VibratorJsTest037 stop error");
                    setTimeout(()=>{
                        done();
                    }, 500);
                });
            } catch (error) {
                console.info(error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest038
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0780
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
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

    /*
    * @tc.name:VibratorJsTest039
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1150
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'VibratorJsTest039'
        if(isAvailable){
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
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.soft');
                done();
            }
        } else {
            console.info(TAG + ' This device is not supportEffect');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest040
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1160
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'VibratorJsTest040'
        if(isAvailable){
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
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.hard');
                done();
            }
        } else {
            console.info(TAG + ' This device is not supportEffect');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest041
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1170
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'VibratorJsTest041'
        if(isAvailable){
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
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.sharp');
                done();
            }
        } else {
            console.info(TAG + ' This device is not supportEffect');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest042
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1180
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'VibratorJsTest042'
        if(isAvailable){
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
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.soft');
                done();
            }
        } else {
            console.info(TAG + ' This device is not supportEffect');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest043
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1190
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'VibratorJsTest043'
        if(isAvailable){
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
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.hard');
                done();
            }
        } else {
            console.info(TAG + ' This device is not supportEffect');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest044
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1200
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'VibratorJsTest044'
        if(isAvailable){
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
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                });
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.sharp');
                done();
            }
        } else {
            console.info(TAG + ' This device is not supportEffect');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest045
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1210
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'VibratorJsTest045'
        if(isAvailable){
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
                            console.info(TAG + ' vibrator error');
                        } else {
                            console.info(TAG + 'vibrator success');
                            expect(false).assertTrue();
                        }
                        setTimeout(() => {
                            done();
                        }, 500);
                    });
                } catch (error) {
                    console.info(TAG + " intensity error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done()
                }
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.sharp');
                done();
            }
        } else {
            console.info(TAG + ' This device is not supportEffect');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest046
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_1220
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'VibratorJsTest046'
        if(isAvailable){
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
                            console.info(TAG + ' vibrator error');
                        } else {
                            console.info(TAG + 'vibrator success');
                            expect(false).assertTrue();
                        }
                        setTimeout(() => {
                            done();
                        }, 500);
                    });
                } catch (error) {
                    console.info(TAG + " intensity error: " + JSON.stringify(error));
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    done()
                }
            } else {
                console.info(TAG + ' This device is not supportEffect haptic.effect.sharp');
                done();
            }
        } else {
            console.info(TAG + ' This device is not supportEffect');
            done();
        }
    })
    })}
