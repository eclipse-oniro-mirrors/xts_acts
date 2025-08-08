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

export default function SensorJsTest_sensor_36() {
describe("SensorJsTest_sensor_36", function () {
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

    let invild;
    let testNullSensorId = -1;
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
    let errMessages = ['ReferenceError: xxx is not defined','ReferenceError: string is not defined','TypeError: is not callable'];
    let errMessage;
    let TAG  = '';

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0010
    * @tc.name: GetSingleSensor_JSTest_001
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it('GetSingleSensor_JSTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_001-------------------------");
        TAG = 'GetSingleSensor_JSTest_001'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(typeof (data.sensorName)).assertEqual("string");
                    expect(typeof (data.vendorName)).assertEqual("string");
                    expect(typeof (data.firmwareVersion)).assertEqual("string");
                    expect(typeof (data.hardwareVersion)).assertEqual("string");
                    expect(typeof (data.sensorId)).assertEqual("number");
                    expect(typeof (data.maxRange)).assertEqual("number");
                    expect(typeof (data.minSamplePeriod)).assertEqual("number");
                    expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                    expect(typeof (data.precision)).assertEqual("number");
                    expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0020
    * @tc.name: GetSingleSensor_JSTest_002
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it('GetSingleSensor_JSTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_002-------------------------");
        TAG = 'GetSingleSensor_JSTest_002'
        try{
             sensor.getSingleSensor()
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0030
    * @tc.name: GetSingleSensor_JSTest_003
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it('GetSingleSensor_JSTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_003-------------------------");
        TAG = 'GetSingleSensor_JSTest_003'
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(typeof (data.sensorName)).assertEqual("string");
                    expect(typeof (data.vendorName)).assertEqual("string");
                    expect(typeof (data.firmwareVersion)).assertEqual("string");
                    expect(typeof (data.hardwareVersion)).assertEqual("string");
                    expect(typeof (data.sensorId)).assertEqual("number");
                    expect(typeof (data.maxRange)).assertEqual("number");
                    expect(typeof (data.minSamplePeriod)).assertEqual("number");
                    expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                    expect(typeof (data.precision)).assertEqual("number");
                    expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                    }
                },255)
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number: SUB_SensorsSystem_GetSingleSensor_JSTest_0040
    * @tc.name: GetSingleSensor_JSTest_004
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
      it('GetSingleSensor_JSTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_004-------------------------");
        TAG = 'GetSingleSensor_JSTest_004'
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(typeof (data.sensorName)).assertEqual("string");
                    expect(typeof (data.vendorName)).assertEqual("string");
                    expect(typeof (data.firmwareVersion)).assertEqual("string");
                    expect(typeof (data.hardwareVersion)).assertEqual("string");
                    expect(typeof (data.sensorId)).assertEqual("number");
                    expect(typeof (data.maxRange)).assertEqual("number");
                    expect(typeof (data.minSamplePeriod)).assertEqual("number");
                    expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                    expect(typeof (data.precision)).assertEqual("number");
                    expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                }
                },invild)
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0050
    * @tc.name: GetSingleSensor_JSTest_005
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
      it('GetSingleSensor_JSTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_005-------------------------");
        TAG = 'GetSingleSensor_JSTest_005'
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    setTimeout(() => {
                        done();
                    }, 500)
                }
            },testNullSensorId)
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0060
    * @tc.name: GetSingleSensor_JSTest_006
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it('GetSingleSensor_JSTest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_006-------------------------");
        TAG = 'GetSingleSensor_JSTest_006'
        try{
            try {
                sensor.getSingleSensor(xxx)
            } catch (error) {
                console.info(TAG + ' catch error:' + error);
                errMessage = error.toString();
                expect(errMessage).assertEqual(errMessages[0]);
                done();
            }
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0070
    * @tc.name: GetSingleSensor_JSTest_007
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it('GetSingleSensor_JSTest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_007-------------------------");
        TAG = 'GetSingleSensor_JSTest_007'
        try {
            sensor.getSingleSensor((error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(typeof (data.sensorName)).assertEqual("string");
                    expect(typeof (data.vendorName)).assertEqual("string");
                    expect(typeof (data.firmwareVersion)).assertEqual("string");
                    expect(typeof (data.hardwareVersion)).assertEqual("string");
                    expect(typeof (data.sensorId)).assertEqual("number");
                    expect(typeof (data.maxRange)).assertEqual("number");
                    expect(typeof (data.minSamplePeriod)).assertEqual("number");
                    expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                    expect(typeof (data.precision)).assertEqual("number");
                    expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                }
           })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0080
    * @tc.name: GetSingleSensor_JSTest_008
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensor_JSTest_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------------GetSingleSensor_JSTest_008------------------");
        TAG = 'GetSingleSensor_JSTest_008'
        try {
            sensor.getSingleSensor(testNullSensorId, (error, data) => {
                if (error) {
                    console.info(TAG + 'error:' + error);
                    done();
                } else {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data));
                    expect(false).assertTrue();
                }
            });
        } catch(error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0090
    * @tc.name: GetSingleSensor_JSTest_009
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensor_JSTest_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("-------------------GetSingleSensor_JSTest_009----------------------");
        TAG = 'GetSingleSensor_JSTest_009'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER).then((data) => {
                console.info(TAG + ' Callback in!' + JSON.stringify(data));
                expect(typeof (data.sensorName)).assertEqual("string");
                expect(typeof (data.vendorName)).assertEqual("string");
                expect(typeof (data.firmwareVersion)).assertEqual("string");
                expect(typeof (data.hardwareVersion)).assertEqual("string");
                expect(typeof (data.sensorId)).assertEqual("number");
                expect(typeof (data.maxRange)).assertEqual("number");
                expect(typeof (data.minSamplePeriod)).assertEqual("number");
                expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                expect(typeof (data.precision)).assertEqual("number");
                expect(typeof (data.power)).assertEqual("number");
                done()
            }, (error)=>{
                console.info(TAG + ' illegal parameter!');
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0100
    * @tc.name: GetSingleSensor_JSTest_010
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensor_JSTest_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("----------------GetSingleSensor_JSTest_010-----------------------");
        TAG = 'GetSingleSensor_JSTest_010'
        try {
        sensor.getSingleSensor(testNullSensorId).then((data) => {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
        }, (error)=>{
            console.info(TAG + ' illegal parameter!');
            done();
        });
        } catch(error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0110
    * @tc.name: GetSingleSensor_JSTest_011
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
     it("GetSingleSensor_JSTest_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("-------------------GetSingleSensor_JSTest_011----------------------");
        TAG = 'GetSingleSensor_JSTest_011'
        try{
            try {
                sensor.getSingleSensor(null)
            } catch (error) {
                console.info(TAG + ' illegal parameter!');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0120
    * @tc.name: GetSingleSensor_JSTest_012
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensor_JSTest_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'GetSingleSensor_JSTest_012'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, undefined).then((data) => {
                console.info(TAG + ' Callback in!' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' illegal parameter!');
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0130
    * @tc.name: GetSingleSensor_JSTest_013
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensor_JSTest_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'GetSingleSensor_JSTest_013'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, null).then((data) => {
                console.info(TAG + ' Callback in!' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' illegal parameter!');
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0140
    * @tc.name: GetSingleSensor_JSTest_014
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("GetSingleSensor_JSTest_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'GetSingleSensor_JSTest_014'
        try{
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, "abc").then((data) => {
                console.info(TAG + ' Callback in!' + JSON.stringify(data));
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' illegal parameter!');
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})}
