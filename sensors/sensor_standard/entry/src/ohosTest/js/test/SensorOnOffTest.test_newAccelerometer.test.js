/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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

export default function SensorJsTest_sensor_39() {
describe("SensorJsTest_sensor_39", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
          } else {
            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
          }
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback2 accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
          } else {
            console.info('callback2 invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
          }
        console.info("callback2" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
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
    let TAG  = '';
    let invalid  = -1;

    /**
     * @tc.name   newAccelerometer_SensorJsTest001
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0010
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("newAccelerometer_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest001--------------');
        TAG = 'newAccelerometer_SensorJsTest001';
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest002
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0020
     * @tc.desc   Illegal ID passed in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest002--------------');
        TAG = 'newAccelerometer_SensorJsTest002'
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on(invalid, onSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest003
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0030
     * @tc.desc   For normal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest003--------------');
        TAG = 'newAccelerometer_SensorJsTest003'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newAccelerometer_SensorJsTest003 off in--------------');
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        console.info('---------newAccelerometer_SensorJsTest003 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest004
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0040
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest004--------------');
        TAG = 'newAccelerometer_SensorJsTest004'
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on(sensor.SensorId.ACCELEROMETER, onSensorCallback, {'interval': 100000000}, 5);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(false).assertTrue();
                        done();
                    }
                    setTimeout(()=>{
                        console.info('---------newAccelerometer_SensorJsTest004 off in--------------');
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        console.info('---------newAccelerometer_SensorJsTest004 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest005
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0050
     * @tc.desc   Once Normal Subscription Scenario Use Case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newAccelerometer_SensorJsTest005'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.once(sensor.SensorId.ACCELEROMETER, callback);
                        setTimeout(()=>{
                            expect(true).assertTrue();
                            done();
                        }, 1000);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(false).assertTrue();
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest006
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0060
     * @tc.desc   Use case of illegal parameter passed into once interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newAccelerometer_SensorJsTest006'
        function onceSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.once(invalid, onceSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest007
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0070
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newAccelerometer_SensorJsTest007'
        function onceSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
            }
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try{
                        sensor.once(sensor.SensorId.ACCELEROMETER, onceSensorCallback, 5);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(false).assertTrue();
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest008
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0080
     * @tc.desc   Use case of illegal parameter passed into off interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newAccelerometer_SensorJsTest008'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.off(invalid, callback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest009
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0090
     * @tc.desc   Unsubscribe directly without waiting after starting subscription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newAccelerometer_SensorJsTest009'
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                sensor.SensorAccuracy.ACCURACY_HIGH) {
                console.info('callback accuracy verified' + JSON.stringify(data));
                expect(true).assertTrue();
            } else {
                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                expect(false).assertTrue();
                done();
            }
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.ACCELEROMETER, onSensorCallback);
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest010
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0100
     * @tc.desc   SensorId1000000 of incoming exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newAccelerometer_SensorJsTest010'
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.off(1000000, onSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest011
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0110
     * @tc.desc   Call interface multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newAccelerometer_SensorJsTest011'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
                console.info(TAG + ' Callback in!' + JSON.stringify(data));
                if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                    sensor.SensorAccuracy.ACCURACY_HIGH) {
                    console.info('callback accuracy verified' + JSON.stringify(data));
                    expect(true).assertTrue();
                } else {
                    console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                    expect(false).assertTrue();
                }
                expect(typeof (data.x)).assertEqual("number");
                expect(typeof (data.y)).assertEqual("number");
                expect(typeof (data.z)).assertEqual("number");
                expect(typeof (data.timestamp)).assertEqual("number");
            });
                    sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
                        console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                        expect(typeof (data.x)).assertEqual("number");
                            expect(typeof (data.y)).assertEqual("number");
                            expect(typeof (data.z)).assertEqual("number");
                            expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newAccelerometer_SensorJsTest011 off in--------------');
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        console.info('---------newAccelerometer_SensorJsTest011 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest012
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0120
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newAccelerometer_SensorJsTest012'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.off(sensor.SensorId.ACCELEROMETER, 5);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest013
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0130
     * @tc.desc   Call on interface and once interface respectively, and use an off interface to close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest013--------------');
        TAG = 'newAccelerometer_SensorJsTest013'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
                        console.info(TAG + ' Callback in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.once(sensor.SensorId.ACCELEROMETER, (data)=>{
                        console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    });
                    setTimeout(()=>{
                        console.info('---------newAccelerometer_SensorJsTest013 off in--------------');
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        console.info('---------newAccelerometer_SensorJsTest013 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest014
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0140
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest014--------------');
        TAG = 'newAccelerometer_SensorJsTest014'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
                        console.info(TAG + ' Callback in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
                        console.info(TAG + ' Callback2 in!' + JSON.stringify(data));
                        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                            sensor.SensorAccuracy.ACCURACY_HIGH) {
                            console.info('callback accuracy verified' + JSON.stringify(data));
                            expect(true).assertTrue();
                        } else {
                            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                            expect(false).assertTrue();
                        }
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        expect(typeof (data.timestamp)).assertEqual("number");
                    }, {'interval': 100000000});
                    setTimeout(()=>{
                        console.info('---------newAccelerometer_SensorJsTest014 off in--------------');
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        console.info('---------newAccelerometer_SensorJsTest014 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest015
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0150
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest015--------------');
        TAG = 'newAccelerometer_SensorJsTest015'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on();
                    } catch (error) {
                        console.info(TAG + ' on error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    try {
                        sensor.once();
                    } catch (error) {
                        console.info(TAG + ' once error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    try {
                        sensor.off();
                    } catch (error) {
                        console.info(TAG + ' off error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest016
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0160
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest016--------------');
        TAG = 'newAccelerometer_SensorJsTest016'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback);
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback2);
                    setTimeout(() => {
                        console.info('----------------------newAccelerometer_SensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ACCELEROMETER, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newAccelerometer_SensorJsTest016 off end--------------');
                    }, 1000);
                    setTimeout(() => {
                        console.info('----------------------newAccelerometer_SensorJsTest016 off in--------------');
                        sensor.off(sensor.SensorId.ACCELEROMETER, callback2);
                        console.info('----------------------newAccelerometer_SensorJsTest016 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest017
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0170
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest017--------------');
        TAG = 'newAccelerometer_SensorJsTest017'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------newAccelerometer_SensorJsTest017 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ACCELEROMETER, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------newAccelerometer_SensorJsTest017 off end--------------');
                    }, 1000);
                    setTimeout(() => {
                        console.info('----------------------newAccelerometer_SensorJsTest017_2 off in--------------');
                        sensor.off(sensor.SensorId.ACCELEROMETER, callback2);
                        console.info('----------------------newAccelerometer_SensorJsTest017_2 off end--------------');
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest018
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0180
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'newAccelerometer_SensorJsTest018'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------newAccelerometer_SensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ACCELEROMETER, callback);
                            sensor.off(sensor.SensorId.ACCELEROMETER, callback2);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        console.info('----------------------newAccelerometer_SensorJsTest018 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest019
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0190
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest019--------------');
        TAG = 'newAccelerometer_SensorJsTest019'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, undefined);
                    try{
                        sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': undefined });
                     } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newAccelerometer_SensorJsTest019 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ACCELEROMETER);
                        } catch (error) {
                            console.info(TAG + ' off error:' + error);
                            expect(false).assertTrue();
                            }
                            done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest020
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0200
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest020--------------');
        TAG = 'newAccelerometer_SensorJsTest020'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, null);
                    try{
                        sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': null });
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newAccelerometer_SensorJsTest020 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ACCELEROMETER);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest021
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0210
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest021--------------');
        TAG = 'newAccelerometer_SensorJsTest021'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------newAccelerometer_SensorJsTest021 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ACCELEROMETER);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest022
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0220
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest022--------------');
        TAG = 'newAccelerometer_SensorJsTest022'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                    sensor.off(sensor.SensorId.ACCELEROMETER, null);
                    setTimeout(() => {
                        done();
                    }, 1000);
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                        expect(false).assertTrue();
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest023
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0230
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest023--------------');
        TAG = 'newAccelerometer_SensorJsTest023'
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                        sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': 100000000 });
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------newAccelerometer_SensorJsTest023 off in--------------');
                        try {
                            sensor.off(sensor.SensorId.ACCELEROMETER);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        console.info('----------------------newAccelerometer_SensorJsTest023 off end--------------');
                        done()
                    }, 1000);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest024
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0240
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest024--------------');
        const TAG = 'newAccelerometer_SensorJsTest024'
        try{
            const deviceId = -1;
            const result = sensor.getSingleSensorByDeviceSync(sensor.SensorId.ACCELEROMETER, deviceId);
            if (result.length === 0) {
                console.info('No sensors found, Test case will return true.');
                done();
            } else {
                const sensorInfoParam = {
                    deviceId: result[0].deviceId,
                    sensorIndex: result[0].sensorIndex
                };
                const options = {
                    interval: 100000000,
                    sensorInfoParam: sensorInfoParam
                };
                sensor.on(sensor.SensorId.ACCELEROMETER, callback, options);
                setTimeout(() => {
                    console.info('----------------------newAccelerometer_SensorJsTest024 off in--------------');
                    sensor.off(sensor.SensorId.ACCELEROMETER, sensorInfoParam, callback);
                    console.info('----------------------newAccelerometer_SensorJsTest024 off end--------------');
                    done();
                }, 1000);
            }
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_SensorJsTest025
     * @tc.number SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0250
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_SensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest025--------------');
        const TAG = 'newAccelerometer_SensorJsTest025'
        try{
            const result = sensor.getSingleSensorByDeviceSync(sensor.SensorId.ACCELEROMETER);
            if (result.length === 0) {
                console.info('No sensors found, Test case will return true.');
                done();
            } else {
                const sensorInfoParam = {
                    deviceId: result[0].deviceId,
                    sensorIndex: result[0].sensorIndex
                };
                const options = {
                    interval: 100000000,
                    sensorInfoParam: sensorInfoParam
                };
                sensor.on(sensor.SensorId.ACCELEROMETER, callback, options);
                setTimeout(() => {
                    console.info('----------------------newAccelerometer_SensorJsTest025 off in--------------');
                    sensor.off(sensor.SensorId.ACCELEROMETER, sensorInfoParam, callback);
                    console.info('----------------------newAccelerometer_SensorJsTest025 off end--------------');
                    done();
                }, 1000);
            }
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})}
