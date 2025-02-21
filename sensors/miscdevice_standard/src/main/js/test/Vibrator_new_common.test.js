/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function VibratorJsTest_misc_2() {
describe("VibratorJsTest_misc_2", function () {
    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
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

    /*
     * @tc.name:VibratorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0010
     */
    it("VibratorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0020
     */
    it("VibratorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0030
     */
    it("VibratorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0040
     */
    it("VibratorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0050
     */
    it("VibratorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0060
     */
    it("VibratorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0090
     */
    it("VibratorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0100
     */
    it("VibratorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0110
     */
    it("VibratorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0120
     */
    it("VibratorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0130
     */
    it("VibratorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0160
     */
    it("VibratorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0170
     */
    it("VibratorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })

    /*
     * @tc.name:VibratorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0180
     */
    it("VibratorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
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
    })
})
}
