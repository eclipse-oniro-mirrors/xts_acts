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

export default function SensorJsTest_sensor_31() {
describe("SensorJsTest_sensor_31", function () {
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

    let LightId = 5
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0010
     * @tc.name:subscribeLight_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest001 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest001 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLight_SensorJsTest001 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
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
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0020
     * @tc.name:subscribeLight_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest002 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'ui',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest002 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLight_SensorJsTest002 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
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
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0030
     * @tc.name:subscribeLight_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest003---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest003 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest003 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLight_SensorJsTest003 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
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
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0040
     * @tc.name:subscribeLight_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest004 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest004 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLight_SensorJsTest004 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });

                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest004_1 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: function (data, code) {
                            console.log("subscribeLight_SensorJsTest004_1 is failed, data: " + data + ", code: " + code);
                            expect(false).assertTrue();
                        },
                    });
                    setTimeout(() => {
                    sensor.unsubscribeLight();
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
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0050
     * @tc.name:subscribeLight_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest005 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest005 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                            done();
                        },
                        fail: function (data, code) {
                            console.log("subscribeLight_SensorJsTest005 is failed, data: " + data + ", code: " + code);
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
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0060
     * @tc.name:subscribeLight_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest006 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest006 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
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
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0070
     * @tc.name:subscribeLight_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest007---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest007 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest007 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeLight();
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
     * @tc.number:SUB_SensorsSystem_SubscribeLight_JSTest_0080
     * @tc.name:subscribeLight_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest008---------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest008 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'game',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest008 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
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
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0090
     * @tc.name:subscribeLight_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest009 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'ui',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest009 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
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
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0100
     * @tc.name:subscribeLight_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest010 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest010 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                        sensor.unsubscribeLight();
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
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0110
     * @tc.name:subscribeLight_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest011 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest011 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: undefined,
                    });

                    sensor.subscribeLight({
                        interval: 'normal',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest011_1 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeLight();
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
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0120
     * @tc.name:subscribeLight_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest012---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest012 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest012 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
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
     * @tc.number:SUB_SensorsSystem_SubscribeAccelerometer_JSTest_0130
     * @tc.name:subscribeLight_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeLight_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeLight_SensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(LightId ,(error, data) => {
                if (error) {
                    console.info('subscribeLight_SensorJsTest013 error');
                    done();
                } else {
                    sensor.subscribeLight({
                        interval: 'xxx',
                        success: function (data) {
                            console.info("subscribeLight_SensorJsTest013 success" + JSON.stringify(data));
                            expect(typeof (data.intensity)).assertEqual("number");
                            expect(typeof (data.colorTemperature)).assertEqual("number");
                            expect(typeof (data.infraredLuminance)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeLight();
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
