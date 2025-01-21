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

export default function SensorJsTest_sensor_8() {
describe("SensorJsTest_sensor_8", function () {
    function callback(data) {
        console.info("old callback" + JSON.stringify(data));
        expect(typeof (data.pressure)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("old callback2" + JSON.stringify(data));
        expect(typeof (data.pressure)).assertEqual("number");
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
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let invalid  = -1;
    let errMessages = ['string is not defined','The parameter invalid'];
    let errMessage;
    let TAG = '';

     /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0010
     * @tc.name: Barometer_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------Barometer_SensorJsTest001---------------------------');
        TAG = "Barometer_SensorJsTest001";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                    setTimeout(() => {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0020
     * @tc.name: Barometer_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest002---------------------------');
        TAG = "Barometer_SensorJsTest002";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest002 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        console.info('----------------------Barometer_SensorJsTest002 off end---------------------------');
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0030
     * @tc.name: Barometer_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest003---------------------------');
        TAG = "Barometer_SensorJsTest003";
        function onSensorCallback(data) {
            console.info(TAG + ' on error');
            expect(typeof (data.pressure)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, onSensorCallback, { 'interval': 100000000 }, 5);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0040
     * @tc.name: Barometer_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest004---------------------------');
        TAG = "Barometer_SensorJsTest004";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                    setTimeout(() => {
                        expect(true).assertTrue();
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0050
     * @tc.name: Barometer_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest005---------------------------');
        TAG = "Barometer_SensorJsTest005";
        function onceSensorCallback(data) {
            console.info('Barometer_SensorJsTest005  on error');
            expect(typeof (data.pressure)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, onceSensorCallback, 5);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0060
     * @tc.name: Barometer_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest006---------------------------');
        TAG = "Barometer_SensorJsTest006";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                   try {
                        sensor.off(string, "");
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        errMessage = error.toString().slice(16, 40);
                        expect(errMessage).assertEqual(errMessages[0]);
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0070
     * @tc.name: Barometer_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest007---------------------------');
        TAG = "Barometer_SensorJsTest007";
        function onSensorCallback(data) {
            console.info(TAG + ' on error');
            expect(typeof (data.pressure)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, onSensorCallback);
                    setTimeout(() => {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, onSensorCallback);
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0080
     * @tc.name: Barometer_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest008---------------------------');
        TAG = "Barometer_SensorJsTest008";
        function onSensorCallback(data) {
            console.info(TAG + ' error:' + error);
            expect(false).assertTrue();
        }
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.off(1000000, onSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        errMessage = error.toString().slice(7, 28);
                        expect(errMessage).assertEqual(errMessages[1]);
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0090
     * @tc.name: Barometer_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest009---------------------------');
        TAG = "Barometer_SensorJsTest009";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest009 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        console.info('----------------------Barometer_SensorJsTest009 off end---------------------------');
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0100
     * @tc.name: Barometer_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest010---------------------------');
        TAG = "Barometer_SensorJsTest010";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest010 off in---------------------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------Barometer_SensorJsTest010 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest010 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                        console.info('----------------------Barometer_SensorJsTest010 off end---------------------------');
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0110
     * @tc.name: Barometer_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest011---------------------------');
        TAG = "Barometer_SensorJsTest011";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    sensor.once(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest011 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        console.info('----------------------Barometer_SensorJsTest011 off end---------------------------');
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0120
     * @tc.name:Barometer_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest012---------------------------');
        TAG = "Barometer_SensorJsTest012";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest012 off in---------------------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                        }
                        console.info('----------------------Barometer_SensorJsTest012 off end---------------------------');
                    }, 500);
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest012 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                        console.info('----------------------Barometer_SensorJsTest012 off end---------------------------');
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

    /*
     * @tc.number: SUB_SensorsSystem_BAROMETER_JSTest_0130
     * @tc.name:Barometer_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Barometer_SensorJsTest013---------------------------');
        TAG = "Barometer_SensorJsTest013";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2, { 'interval': 100000000 });
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest013 off in---------------------------');
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                        console.info('----------------------Barometer_SensorJsTest013 off end---------------------------');
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

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0140
     * @tc.name: Barometer_SensorJsTest014
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------Barometer_SensorJsTest014--------------');
        TAG = "Barometer_SensorJsTest014";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': undefined });
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2, { 'interval': undefined });
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest014 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback);
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback2);
                        } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        console.info('----------------------Barometer_SensorJsTest014 off end--------------');
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

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0150
     * @tc.name: Barometer_SensorJsTest015
     * @tc.desc: Illegal ID passed in
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "Barometer_SensorJsTest015";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, undefined);
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': undefined });
                    } catch(error){
                        console.info(TAG + ' catch error:' + error);
                    }
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest015 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
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

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0160
     * @tc.name: Barometer_SensorJsTest016
     * @tc.desc: For normal scenarios
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------Barometer_SensorJsTest016--------------');
        TAG = "Barometer_SensorJsTest016";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, null);
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': null });
                        } catch(error){
                            console.info(TAG + ' catch error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest016 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
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

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0170
     * @tc.name: Barometer_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------Barometer_SensorJsTest017--------------');
        TAG = "Barometer_SensorJsTest017";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': null });
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest017 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
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

    /*
     * @tc.number:SUB_SensorsSystem_BAROMETER_JSTest_0180
     * @tc.name: Barometer_SensorJsTest018
     * @tc.desc: Once Normal Subscription Scenario Use Case
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Barometer_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = "Barometer_SensorJsTest018";
        try{
           sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    expect(typeof(data)).assertEqual("object");
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                    try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER, callback, { 'interval': 100000000 });
                        } catch(error){
                            console.info(TAG + ' catch1 error:' + error);
                        }
                    setTimeout(() => {
                        console.info('----------------------Barometer_SensorJsTest018 off in--------------');
                        try {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER);
                         } catch (error) {
                            console.info(TAG + ' catch error:' + error);
                            expect(false).assertTrue();
                        }
                        console.info('----------------------Barometer_SensorJsTest018 off end--------------');
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
})}
