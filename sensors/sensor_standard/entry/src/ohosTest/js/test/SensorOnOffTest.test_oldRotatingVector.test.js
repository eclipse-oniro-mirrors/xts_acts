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
import sensor from '@ohos.sensor'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_20() {
describe("SensorJsTest_sensor_20", function () {
    function callback(data) {
        console.info("old callback" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.w)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("old callback2" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.w)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

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

    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
    let errMessages = ['string is not defined','The parameter invalid'];
    let errMessage;

    /**
     * @tc.name   RotatingVector_SensorJsTest001
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0010
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest001---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
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

    /**
     * @tc.name   RotatingVector_SensorJsTest002
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0020
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest002---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                setTimeout(() => {
                    console.info('----------------------RotatingVector_SensorJsTest002 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                    console.info('----------------------RotatingVector_SensorJsTest002 off end---------------------------');
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

    /**
     * @tc.name   RotatingVector_SensorJsTest003
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0030
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest003---------------------------');
        function onSensorCallback(data) {
            console.info('RotatingVector_SensorJsTest003  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, onSensorCallback, { 'interval': 100000000 }, 5);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   RotatingVector_SensorJsTest004
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0040
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest004---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                setTimeout(() => {
                    expect(true).assertTrue();
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

    /**
     * @tc.name   RotatingVector_SensorJsTest005
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0050
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest005---------------------------');
        function onceSensorCallback(data) {
            console.info('RotatingVector_SensorJsTest005  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, onceSensorCallback, 5);
                } catch (error) {
                    console.info("RotatingVector_SensorJsTest005 error:" + error);
                    expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                    expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                    done();
                }
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   RotatingVector_SensorJsTest006
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0060
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest006---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                   try {
                        sensor.off(string, "");
                    } catch (error) {
                        console.info("RotatingVector_SensorJsTest006 error:" + error);
                        errMessage = error.toString().slice(16, 40);
                        expect(errMessage).assertEqual(errMessages[0]);
                        done();
                    }
                    }
                })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   RotatingVector_SensorJsTest007
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0070
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest007---------------------------');
        function onSensorCallback(data) {
            console.info('RotatingVector_SensorJsTest007  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, onSensorCallback);
                setTimeout(() => {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, onSensorCallback);
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

    /**
     * @tc.name   RotatingVector_SensorJsTest008
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0080
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest008---------------------------');
        function onSensorCallback(data) {
            console.info('RotatingVector_SensorJsTest008  on error');
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                try {
                    sensor.off(1000000, onSensorCallback);
                } catch (error) {
                    console.info("RotatingVector_SensorJsTest008 error:" + error);
                    errMessage = error.toString().slice(7, 28);
                    expect(errMessage).assertEqual(errMessages[1]);
                    done();
                }
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   RotatingVector_SensorJsTest009
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0090
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest009---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                setTimeout(() => {
                    console.info('----------------------RotatingVector_SensorJsTest009 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                    console.info('----------------------RotatingVector_SensorJsTest009 off end---------------------------');
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

    /**
     * @tc.name   RotatingVector_SensorJsTest010
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0100
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest010---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                setTimeout(() => {
                    console.info('----------------------RotatingVector_SensorJsTest010 off in---------------------------');
                    try {
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                    } catch (error) {
                    console.info("RotatingVector_SensorJsTest010 error:" + error);
                    }
                    console.info('----------------------RotatingVector_SensorJsTest010 off end---------------------------');
                }, 500);
                setTimeout(() => {
                    console.info('----------------------RotatingVector_SensorJsTest010 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                    console.info('----------------------RotatingVector_SensorJsTest010 off end---------------------------');
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

    /**
     * @tc.name   RotatingVector_SensorJsTest011
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0110
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest011---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
               sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                setTimeout(() => {
                    console.info('----------------------RotatingVector_SensorJsTest011 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                    console.info('----------------------RotatingVector_SensorJsTest011 off end---------------------------');
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

    /**
     * @tc.name   RotatingVector_SensorJsTest012
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0120
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest012---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------RotatingVector_SensorJsTest012 off in---------------------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                        } catch (error) {
                        console.info("RotatingVector_SensorJsTest012 error:" + error);
                        }
                        console.info('----------------------RotatingVector_SensorJsTest012 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------RotatingVector_SensorJsTest012 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                        console.info('----------------------RotatingVector_SensorJsTest012 off end---------------------------');
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

    /**
     * @tc.name   RotatingVector_SensorJsTest013
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0130
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------RotatingVector_SensorJsTest013---------------------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
               sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2, { 'interval': 100000000 });
                setTimeout(() => {
                    console.info('----------------------RotatingVector_SensorJsTest013 off in---------------------------');
                    sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                    console.info('----------------------RotatingVector_SensorJsTest013 off end---------------------------');
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

    /**
     * @tc.name   RotatingVector_SensorJsTest014
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0140
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------RotatingVector_SensorJsTest014--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest014 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------RotatingVector_SensorJsTest014 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback);
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback2);
                        } catch (error) {
                        console.info("RotatingVector_SensorJsTest014 error:" + error);
                        expect(false).assertTrue();
                        }
                        console.info('----------------------RotatingVector_SensorJsTest014 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   RotatingVector_SensorJsTest015
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0150
     * @tc.desc   Illegal ID passed in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest015 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, undefined);
                    try{
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': undefined });
                    } catch(error){
                        console.info('RotatingVector_SensorJsTest015 Repeat subscription'+error);
                    }
                    setTimeout(() => {
                        console.info('----------------------RotatingVector_SensorJsTest015 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                        } catch (error) {
                        console.info("RotatingVector_SensorJsTest015 error:" + error);
                        expect(false).assertTrue();
                        }
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

    /**
     * @tc.name   RotatingVector_SensorJsTest016
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0160
     * @tc.desc   For normal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------RotatingVector_SensorJsTest016--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest016 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, null);
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': null });
                        } catch(error){
                            console.info('RotatingVector_SensorJsTest016 Repeat subscription'+error);
                        }
                    setTimeout(() => {
                        console.info('----------------------RotatingVector_SensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                            } catch (error) {
                        console.info("RotatingVector_SensorJsTest016 error:" + error);
                            expect(false).assertTrue();
                            }
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

    /**
     * @tc.name   RotatingVector_SensorJsTest017
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0170
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------RotatingVector_SensorJsTest017--------------');
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest017 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------RotatingVector_SensorJsTest017 off in--------------');
                        try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                        } catch (error) {
                        console.info("RotatingVector_SensorJsTest017 error:" + error);
                        expect(false).assertTrue();
                        }
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

    /**
     * @tc.name   RotatingVector_SensorJsTest018
     * @tc.number SUB_SensorsSystem_ROTATION_VECTOR_JSTest_0180
     * @tc.desc   Once Normal Subscription Scenario Use Case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("RotatingVector_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    console.info('RotatingVector_SensorJsTest018 error');
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info("RotatingVector_SensorJsTest018 catch error:" + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------RotatingVector_SensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR);
                            } catch (error) {
                        console.info("RotatingVector_SensorJsTest018 error:" + error);
                            expect(false).assertTrue();
                            }
                        console.info('----------------------RotatingVector_SensorJsTest018 off end--------------');
                            done()
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