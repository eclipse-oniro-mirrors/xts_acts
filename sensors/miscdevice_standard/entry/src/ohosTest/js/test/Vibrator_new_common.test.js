/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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

export default function VibratorJsTest_misc_2() {
let isAvailable;
const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
describe("VibratorJsTest_misc_2", function () {
    beforeAll(async function (done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
        console.info('VibratorJsTest_misc_2 Device type = ' + deviceInfo.deviceType);
        console.info('VibratorJsTest_misc_2 isAvailable = ' + isAvailable);
        try {
            const vibratorsList = vibrator.getVibratorInfoSync();
            if (ABILITYJUDGMENT === false || vibratorsList.length === 0 ||
                (vibratorsList.length !== 0 && vibratorsList.every(vibrator => !vibrator.isLocalVibrator))) {
                isAvailable = false;
                console.info('VibratorJsTest_misc_2 isAvailable ' + isAvailable);
                done()
            }else {
                isAvailable = true;
                console.info('VibratorJsTest_misc_2 isAvailable ' + isAvailable);
                done()
            }
        } catch(error) {
            console.error('VibratorJsTest_misc_2 exception :' + JSON.stringify(error))
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
    * @tc.name:VibratorJsTest001
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0010
    * @tc.level:Level 0
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = "VibratorJsTest001"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function vibrateCallback(error) {
                if (error) {
                    console.info('VibratorJsTest001  vibrator error');
                    expect(false).assertTrue();
                } else {
                    console.info('VibratorJsTest001  vibrator success');
                    expect(true).assertTrue();
                }
                setTimeout(() => {
                    done();
                }, 500);
            }
            vibrator.vibrate(10, vibrateCallback);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0020
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest002"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function vibrateCallback(error) {
                if (error) {
                    console.info('VibratorJsTest002  vibrator success');
                    expect(true).assertTrue();
                } else {
                    console.info('VibratorJsTest002  vibrator error');
                    expect(false).assertTrue();
                }
                setTimeout(() => {
                    done();
                }, 500);
            }
            vibrator.vibrate(-1, vibrateCallback);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0030
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest003"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function vibrateCallback(error) {
                if (error) {
                    console.info('VibratorJsTest003  vibrator success');
                    expect(true).assertTrue();
                } else {
                    console.info('VibratorJsTest003  vibrator error');
                    expect(false).assertTrue();
                }
                setTimeout(() => {
                    done();
                }, 500);
            }
            vibrator.vibrate(1800000 + 1, vibrateCallback);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0040
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest004"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function vibrateCallback(error) {
                if (error) {
                    console.info('VibratorJsTest004  vibrator error');
                    expect(false).assertTrue();
                } else {
                    console.info('VibratorJsTest004  vibrator success');
                    expect(true).assertTrue();
                }
                setTimeout(() => {
                    done();
                }, 500);
            }
            vibrator.vibrate(1800000, vibrateCallback);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0050
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest005"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function vibrateCallback(error) {
                if (error) {
                    console.info('VibratorJsTest005  vibrator success');
                    expect(true).assertTrue();
                } else {
                    console.info('VibratorJsTest005  vibrator error');
                    expect(false).assertTrue();
                }
                setTimeout(() => {
                    done();
                }, 500);
            }
            vibrator.vibrate("", vibrateCallback);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest006
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0060
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest006"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function vibrateCallback(error) {
                if (error) {
                    console.info('VibratorJsTest006  vibrator success');
                    expect(true).assertTrue();
                } else {
                    console.info('VibratorJsTest006  vibrator error');
                    expect(false).assertTrue();
                }
                setTimeout(() => {
                    done();
                }, 500);
            }
            vibrator.vibrate("xxx", vibrateCallback);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest007
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0090
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest007"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function stopPromise() {
                return new Promise((resolve, reject) => {
                    vibrator.stop("time", (error) => {
                        if (error) {
                            console.info('VibratorJsTest007  stop error');
                            expect(false).assertTrue();
                            setTimeout((err) => {
                                reject(err);
                            }, 500);
                        } else {
                            console.info('VibratorJsTest007  stop success');
                            expect(true).assertTrue();
                            setTimeout(() => {
                                resolve();
                            }, 500);
                        }
                    });
                })
            }

            let promise = new Promise((resolve, reject) => {
                vibrator.vibrate(180000, (error) => {
                    if (error) {
                        console.info('VibratorJsTest007  vibrate error');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err);
                        }, 500);
                    } else {
                        console.info('VibratorJsTest007  vibrate success');
                        expect(true).assertTrue();
                        setTimeout(() => {
                            resolve();
                        }, 500);
                    }
                });
            })

            await promise.then(() => {
                return stopPromise();
            }, () => {
                console.info("VibratorJsTest007 reject");
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest008
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0100
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest008"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                function vibrateCallback(error) {
                    if (error) {
                        console.info('VibratorJsTest008  stop success');
                        expect(true).assertTrue();
                    } else {
                        console.info('VibratorJsTest008  stop off');
                        expect(false).assertTrue();
                    }
                    setTimeout(() => {
                        done();
                    }, 500);
                }
                vibrator.stop("", vibrateCallback);
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
    * @tc.name:VibratorJsTest009
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0110
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest009"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate(1000).then(() => {
                console.log("VibratorJsTest009  vibrate success");
                expect(true).assertTrue();
                setTimeout(() => {
                    done();
                }, 500);
            }, (error) => {
                expect(false).assertTrue();
                console.log("VibratorJsTest009  vibrate error");
                setTimeout(() => {
                    done();
                }, 500);
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest010
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0120
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest010"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate(-1).then(() => {
                console.log("VibratorJsTest010  vibrate error");
                expect(false).assertTrue();
                setTimeout(() => {
                    done();
                }, 500);
            }, (error) => {
                expect(true).assertTrue();
                console.log("VibratorJsTest010  vibrate success");
                setTimeout(() => {
                    done();
                }, 500);
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest011
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0130
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest011"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate(1800000 + 1).then(() => {
                console.log("VibratorJsTest011  vibrate error");
                expect(false).assertTrue();
                setTimeout(() => {
                    done();
                }, 500);
            }, (error) => {
                expect(true).assertTrue();
                console.log("VibratorJsTest011  vibrate success");
                setTimeout(() => {
                    done();
                }, 500);
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest012
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0160
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest012"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            try {
                vibrator.stop("").then(() => {
                    console.log("VibratorJsTest012  stop error");
                    expect(false).assertTrue();
                    setTimeout(() => {
                        done();
                    }, 500);
                }, (error) => {
                    expect(true).assertTrue();
                    console.log("VibratorJsTest012  stop success");
                    setTimeout(() => {
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
    * @tc.name:VibratorJsTest013
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0170
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest013"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate("").then(() => {
                console.log("VibratorJsTest013  vibrate error");
                expect(false).assertTrue();
                setTimeout(() => {
                    done();
                }, 500);
            }, (error) => {
                expect(true).assertTrue();
                console.log("VibratorJsTest013  vibrate success");
                setTimeout(() => {
                    done();
                }, 500);
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:VibratorJsTest014
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0180
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("VibratorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "VibratorJsTest014"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            function stopPromise() {
                return new Promise((resolve, reject) => {
                    vibrator.stop(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_TIME).then(() => {
                        console.log("VibratorJsTest014  stop success");
                        expect(true).assertTrue();
                        setTimeout(() => {
                            resolve();
                        }, 500);
                    }, (error) => {
                        expect(false).assertTrue();
                        console.log("VibratorJsTest014  stop error");
                        setTimeout((err) => {
                            reject(err);
                        }, 500);
                    });
                })
            }

            let promise = new Promise((resolve, reject) => {
                vibrator.vibrate(180000).then(() => {
                    console.log("VibratorJsTest014  vibrate success");
                    expect(true).assertTrue();
                    setTimeout(() => {
                        resolve();
                    }, 500);
                }, (error) => {
                    expect(false).assertTrue();
                    console.log("VibratorJsTest014  vibrate error");
                    setTimeout((err) => {
                        reject(err);
                    }, 500);
                });
            })

            await promise.then(() => {
                return stopPromise();
            }, () => {
                console.info("VibratorJsTest014 reject");
            })
            done();
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })
})
}
