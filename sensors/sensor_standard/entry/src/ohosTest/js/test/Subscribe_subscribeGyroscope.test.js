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
import sensor from '@system.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_29() {
describe("SensorJsTest_sensor_29", function () {
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

    let GyroscopeId = 2
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0010
     * @tc.name:subscribeGyroscope_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeGyroscope_SensorJsTest001---------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest002 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest002 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscope_SensorJsTest002 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0020
     * @tc.name:subscribeGyroscope_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest002 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'ui',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest002 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscope_SensorJsTest002 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0030
     * @tc.name:subscribeGyroscope_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest003 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest003 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscope_SensorJsTest003 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0040
     * @tc.name:subscribeGyroscope_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest004 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest004 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscope_SensorJsTest004 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });

                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest004_1 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscope_SensorJsTest004_1 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                    sensor.unsubscribeGyroscope();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0050
     * @tc.name:subscribeGyroscope_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest005 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest005 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeGyroscope_SensorJsTest005 is failed, data: " + data + ", code: " + code);
                            expect(code).assertEqual(202);
                            done();
                        },
                    });
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0060
     * @tc.name:subscribeGyroscope_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscope_SensorJsTest006---------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest006 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest006 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                            done();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0070
     * @tc.name:subscribeGyroscope_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscope_SensorJsTest007---------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest008 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                            interval: 'normal',
                            success: function (data) {
                                console.info("subscribeGyroscope_SensorJsTest007 success" + JSON.stringify(data));
                                expect(typeof (data.x)).assertEqual("number");
                                expect(typeof (data.y)).assertEqual("number");
                                expect(typeof (data.z)).assertEqual("number");
                                done();
                            },
                            fail: function (data, code) {
                                console.log("subscribeGyroscope_SensorJsTest007 is failed, data: " + data + ", code: " + code);
                                expect(false).assertTrue();
                            },
                        });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0080
     * @tc.name:subscribeGyroscope_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------subscribeGyroscope_SensorJsTest008---------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest008 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest008 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

   /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0090
     * @tc.name:subscribeGyroscope_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest009 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'ui',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest009 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0100
     * @tc.name:subscribeGyroscope_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscope_SensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest010 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest010 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeGyroscope();
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0110
     * @tc.name:subscribeGyroscope_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscope_SensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest011 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest011 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });

                    sensor.subscribeGyroscope({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest011_1 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeGyroscope();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0120
     * @tc.name:subscribeGyroscope_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscope_SensorJsTest012---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest012 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest012 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                    done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0130
     * @tc.name:subscribeGyroscope_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscope_SensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest013 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest013 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeGyroscope();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeGyroscope_JSTest_0140
     * @tc.name:subscribeGyroscope_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeGyroscope_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeGyroscope_SensorJsTest014---------------------------');
        try{
           sensor.getSingleSensor(GyroscopeId ,(error, data) => {
                if (error) {
                    console.info('subscribeGyroscope_SensorJsTest014 error');
                    done();
                } else {
                    sensor.subscribeGyroscope({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeGyroscope_SensorJsTest014 success" + JSON.stringify(data));
                            expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeGyroscope();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})}
