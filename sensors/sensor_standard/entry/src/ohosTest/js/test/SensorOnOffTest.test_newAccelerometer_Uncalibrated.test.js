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
import sensor from '@ohos.sensor'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_40() {
describe("SensorJsTest_sensor_40", function () {
    let sensortempcode = true;
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.biasX)).assertEqual("number");
        expect(typeof (data.biasY)).assertEqual("number");
        expect(typeof (data.biasZ)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.biasX)).assertEqual("number");
        expect(typeof (data.biasY)).assertEqual("number");
        expect(typeof (data.biasZ)).assertEqual("number");
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
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
    let invalid  = -1;

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest014
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0140
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_Uncalibrated_SensorJsTest014--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback);
        setTimeout(()=>{
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
            done();
        }, 500);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest015
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0150
     * @tc.desc   Illegal ID passed in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_Uncalibrated_SensorJsTest015--------------');
        function onSensorCallback(data) {
            console.info('newAccelerometer_Uncalibrated_SensorJsTest015 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.on(invalid, onSensorCallback);
        } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest015 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest016
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0160
     * @tc.desc   For normal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------SensorJsTest003--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest016 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest016 off end--------------');
            done();
        }, 500);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest017
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0170
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info('---------newAccelerometer_Uncalibrated_SensorJsTest017--------------');
        function onSensorCallback(data) {
            console.info('newAccelerometer_Uncalibrated_SensorJsTest017  callback in');
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.biasX)).assertEqual("number");
        expect(typeof (data.biasY)).assertEqual("number");
        expect(typeof (data.biasZ)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, onSensorCallback, {'interval': 100000000}, 5);
        } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest017 error:" +error);
            expect(false).assertTrue();
            done();
        }
        setTimeout(()=>{
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest017 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest017 off end--------------');
            done();
        }, 500);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest018
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0180
     * @tc.desc   Once Normal Subscription Scenario Use Case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.once(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback);
        setTimeout(()=>{
            expect(sensortempcode).assertTrue();
            done();
        }, 500);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest019
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0190
     * @tc.desc   Use case of illegal parameter passed into once interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newAccelerometer_Uncalibrated_SensorJsTest019 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(invalid, onceSensorCallback);
        } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest019 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest020
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0200
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        function onceSensorCallback(data) {
            console.info('newAccelerometer_Uncalibrated_SensorJsTest020  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.biasX)).assertEqual("number");
            expect(typeof (data.biasY)).assertEqual("number");
            expect(typeof (data.biasZ)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
            sensor.once(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, onceSensorCallback, 5);
        } catch (error) {
            console.info('newAccelerometer_Uncalibrated_SensorJsTest020 error:' +error);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest021
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0210
     * @tc.desc   Use case of illegal parameter passed into off interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(invalid, callback);
        } catch (error) {
            console.info('newAccelerometer_Uncalibrated_SensorJsTest021 error:' +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest022
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0220
     * @tc.desc   Unsubscribe directly without waiting after starting subscription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newAccelerometer_Uncalibrated_SensorJsTest022 callback in');
            expect(false).assertTrue();
            done();
        }
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, onSensorCallback);
        sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, onSensorCallback);
        setTimeout(()=>{
            expect(sensortempcode).assertTrue();
            done();
        }, 500);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest023
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0230
     * @tc.desc   SensorId1000000 of incoming exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newAccelerometer_Uncalibrated_SensorJsTest023 on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest023 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest024
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0240
     * @tc.desc   Call interface multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, (data)=>{
            console.info("newAccelerometer_Uncalibrated_SensorJsTest024 callback: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.biasX)).assertEqual("number");
            expect(typeof (data.biasY)).assertEqual("number");
            expect(typeof (data.biasZ)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        });
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, (data)=>{
            console.info("newAccelerometer_Uncalibrated_SensorJsTest024 callback2: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.biasX)).assertEqual("number");
            expect(typeof (data.biasY)).assertEqual("number");
            expect(typeof (data.biasZ)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest024 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest024 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest025
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0250
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        try {
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, 5);
        } catch (error) {
            console.info('newAccelerometer_Uncalibrated_SensorJsTest025 error:'+error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest026
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0260
     * @tc.desc   Call on interface and once interface respectively, and use an off interface to close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_Uncalibrated_SensorJsTest026--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, (data)=>{
            console.info("newAccelerometer_Uncalibrated_SensorJsTest026 callback: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.biasX)).assertEqual("number");
            expect(typeof (data.biasY)).assertEqual("number");
            expect(typeof (data.biasZ)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.once(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, (data)=>{
            console.info("newAccelerometer_Uncalibrated_SensorJsTest026 callback2: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.biasX)).assertEqual("number");
            expect(typeof (data.biasY)).assertEqual("number");
            expect(typeof (data.biasZ)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest026 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest026 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest027
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0270
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_Uncalibrated_SensorJsTest027--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, (data)=>{
            console.info("newAccelerometer_Uncalibrated_SensorJsTest027 callback: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.biasX)).assertEqual("number");
            expect(typeof (data.biasY)).assertEqual("number");
            expect(typeof (data.biasZ)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, (data)=>{
            console.info("newAccelerometer_Uncalibrated_SensorJsTest027 callback2: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.biasX)).assertEqual("number");
            expect(typeof (data.biasY)).assertEqual("number");
            expect(typeof (data.biasZ)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest027 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
            console.info('---------newAccelerometer_Uncalibrated_SensorJsTest027 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest028
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0280
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_Uncalibrated_SensorJsTest028--------------');
        try {
            sensor.on();
        } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest028 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.once();
        } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest028 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.off();
        } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest028 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest029
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0290
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest029--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback);
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback2);
        setTimeout(() => {
            console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest029 off in--------------');
            try {
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback);
            } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest029 error:" + error);
            }
            console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest029 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest029 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback2);
            console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest029 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest030
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0300
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest030--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest030 off in--------------');
            try {
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback);
            } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest030 error:" + error);
            }
            console
            console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest030 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest030_2 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback2);
            console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest030_2 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest031
     * @tc.number SUB_SensorsSystem_ACCELEROMETER_UNCALIBRATED_JSTest_0310
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newAccelerometer_Uncalibrated_SensorJsTest031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest031--------------');
        const TAG = 'newAccelerometer_Uncalibrated_SensorJsTest031'
        try{
            const deviceId = -1;
            const result = sensor.getSingleSensorByDeviceSync(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, deviceId);
            if (result.length === 0) {
                console.info('No sensors found, Test case will return true.');
                done()
            } else {
                const sensorInfoParam = {
                    deviceId: result[0].deviceId,
                    sensorIndex: result[0].sensorIndex
                };
                const options = {
                    interval: 100000000,
                    sensorInfoParam: sensorInfoParam
                };
                sensor.on(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, callback, options);
                setTimeout(() => {
                    console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest031 off in--------------');
                    sensor.off(sensor.SensorId.ACCELEROMETER_UNCALIBRATED, sensorInfoParam, callback);
                    console.info('----------------------newAccelerometer_Uncalibrated_SensorJsTest031 off end--------------');
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
     * @tc.name   newAccelerometer_Uncalibrated_SensorJsTest032
     * @tc.number newAccelerometer_Uncalibrated_SensorJsTest032
     * @tc.desc   Illegal ID passed in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it("newAccelerometer_Uncalibrated_SensorJsTest032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_Uncalibrated_SensorJsTest032--------------');
        async function onSensorCallback(data) {
            sensor.on(null, null, null, (data) => {}, { interval: 100000000 });
            sensor.on(undefined, undefined, undefined, (data) => {}, { interval: 100000000 });
            sensor.off(null, null, (data) => {}, { interval: 100000000 });
            sensor.off(undefined, undefined, (data) => {}, { interval: 100000000 });
            sensor.once(null, (data) => {}, { interval: 100000000 });
            sensor.once(undefined, (data) => {}, { interval: 100000000 });
            done();
        }
        try {
            sensor.on(invalid, onSensorCallback);
            sensor.getSingleSensor(sensor.SensorId.FUSION_PRESSURE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(typeof(data)).assertEqual("object");
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorId.AMBIENT_TEMPERATURE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.temperature === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorId.HEART_RATE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.heartRate === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorId.HUMIDITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.humidity === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorId.PROXIMITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.distance === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorId.WEAR_DETECTION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.value === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorId.FUSION_PRESSURE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.fusionPressure === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })

            sensor.once(sensor.SensorId.AMBIENT_TEMPERATURE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.temperature === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorId.HEART_RATE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.heartRate === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorId.HUMIDITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.humidity === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorId.PEDOMETER,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.steps === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorId.PEDOMETER_DETECTION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.scalar === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorId.PROXIMITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.distance === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorId.WEAR_DETECTION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.value === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    expect(data.biasX === 1).assertTrue();
                    expect(data.biasY === 3).assertTrue();
                    expect(data.biasZ === 2).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.intensity === 1).assertTrue();
                    expect(data.colorTemperature === 1).assertTrue();
                    expect(data.infraredLuminance === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_TEMPERATURE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.temperature === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.pressure === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GRAVITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE_UNCALIBRATED,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    expect(data.biasX === 1).assertTrue();
                    expect(data.biasY === 3).assertTrue();
                    expect(data.biasZ === 2).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.status === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.heartRate === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HUMIDITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.humidity === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELERATION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD_UNCALIBRATED,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    expect(data.biasX === 1).assertTrue();
                    expect(data.biasY === 3).assertTrue();
                    expect(data.biasZ === 2).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ORIENTATION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.alpha === 1).assertTrue();
                    expect(data.beta === 1).assertTrue();
                    expect(data.gamma === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PROXIMITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.distance === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    expect(data.w === 6).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.scalar === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_WEAR_DETECTION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.value === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.on('sensorStatusChange',(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.timestamp === 1).assertTrue();
                    expect(data.sensorId === 2).assertTrue();
                    expect(data.sensorIndex === 1).assertTrue();
                    expect(data.isSensorOnline === true).assertTrue();
                    expect(data.deviceId === 1).assertTrue();
                    expect(data.deviceName === device).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    expect(data.biasX === 1).assertTrue();
                    expect(data.biasY === 3).assertTrue();
                    expect(data.biasZ === 2).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_LIGHT,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.intensity === 1).assertTrue();
                    expect(data.colorTemperature === 1).assertTrue();
                    expect(data.infraredLuminance === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_AMBIENT_TEMPERATURE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.temperature === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_BAROMETER,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.pressure === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_GRAVITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_GYROSCOPE_UNCALIBRATED,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    expect(data.biasX === 1).assertTrue();
                    expect(data.biasY === 3).assertTrue();
                    expect(data.biasZ === 2).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HALL,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.status === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.heartRate === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HUMIDITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.humidity === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_LINEAR_ACCELERATION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_MAGNETIC_FIELD_UNCALIBRATED,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    expect(data.biasX === 1).assertTrue();
                    expect(data.biasY === 3).assertTrue();
                    expect(data.biasZ === 2).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ORIENTATION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.alpha === 1).assertTrue();
                    expect(data.beta === 1).assertTrue();
                    expect(data.gamma === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.steps === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.scalar === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PROXIMITY,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.distance === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ROTATION_VECTOR,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.x === 2).assertTrue();
                    expect(data.y === 3).assertTrue();
                    expect(data.z === 5).assertTrue();
                    expect(data.w === 6).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.scalar === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_WEAR_DETECTION,(error, data) => {
                if (error) {
                    done();
                } else {
                    try {
                    expect(data.value === 1).assertTrue();
                    done();
                    } catch (error) {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                    done();
                    }
                }
            })
            let data = await sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.GYROSCOPE);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.AMBIENT_LIGHT);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.BAROMETER);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.HALL);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.PROXIMITY);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.HUMIDITY);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.ORIENTATION);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.GRAVITY);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.LINEAR_ACCELEROMETER);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.ROTATION_VECTOR);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.AMBIENT_TEMPERATURE);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.SIGNIFICANT_MOTION);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.PEDOMETER_DETECTION);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.PEDOMETER);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.HEART_RATE);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.WEAR_DETECTION);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensor(sensor.SensorId.FUSION_PRESSURE);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.ACCELEROMETER);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.GYROSCOPE);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.AMBIENT_LIGHT);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.MAGNETIC_FIELD);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.BAROMETER);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.HALL);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.PROXIMITY);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.HUMIDITY);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.ORIENTATION);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.GRAVITY);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.LINEAR_ACCELEROMETER);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.ROTATION_VECTOR);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.AMBIENT_TEMPERATURE);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.SIGNIFICANT_MOTION);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.PEDOMETER_DETECTION);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.PEDOMETER);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.HEART_RATE);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.WEAR_DETECTION);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
            expect(data !== undefined).assertTrue();
            let data = await sensor.getSingleSensorSync(sensor.SensorId.FUSION_PRESSURE);
            expect(data !== undefined).assertTrue();

            sensor.transformCoordinateSystem([1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5], {
                'x': 1,
                'y': 2
            }, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.transformCoordinateSystem([], {
                'x': 1,
                'y': 2
            }, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.transformCoordinateSystem(null, null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
            })
            sensor.transformCoordinateSystem(undefined, undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
            })
            let data = await sensor.transformCoordinateSystem(null, null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
            })
            let data = await sensor.transformCoordinateSystem(undefined, undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
            })
            let data = await sensor.transformCoordinateSystem(([] , {
                'x': 1,
                'y': 2
            }, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
            }));

            sensor.transformRotationMatrix([], {'x':1, 'y':2}, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.transformRotationMatrix(null, null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.transformRotationMatrix(undefined, undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.transformRotationMatrix([], {'x':1, 'y':2}, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.transformRotationMatrix(null, null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.transformRotationMatrix(undefined, undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            

            sensor.createQuaternion([0, 0, 0], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.createQuaternion([], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.createQuaternion(null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.createQuaternion(undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.createQuaternion([0, 0, 0], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.createQuaternion([], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.createQuaternion(null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.createQuaternion(undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getQuaternion([0, 0, 0], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getQuaternion([], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getQuaternion(null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getQuaternion(undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getQuaternion([0, 0, 0], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getQuaternion([], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getQuaternion(null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getQuaternion(undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getDirection([1, 2, 3, 1, 2, 3, 1, 2, 3, 0], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getDirection([], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getDirection(null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getDirection(undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getDirection([], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getDirection(null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getDirection(undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getOrientation([], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getOrientation(null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getOrientation(undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getOrientation([], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getOrientation(null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getOrientation(undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.createRotationMatrix(gravity[9, 9, 9], geomagnetic[30, 25, 41], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.createRotationMatrix([], [], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.createRotationMatrix(null, null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.createRotationMatrix(undefined, undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.createRotationMatrix(gravity[9, 9, 9], geomagnetic[30, 25, 41], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.createRotationMatrix([], [], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.createRotationMatrix(null, null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.createRotationMatrix(undefined, undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getGeomagneticField(null, null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            sensor.getGeomagneticField(undefined, undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getGeomagneticField(null, null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getGeomagneticField(undefined, undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);   
                }
                done()
            })
            let data = await sensor.getInclination([], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })
            sensor.createRotationMatrix([9, 9, 9], [30, 25, 41], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })
            sensor.createRotationMatrix([], [], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })
            sensor.createRotationMatrix(null, null, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })
            sensor.createRotationMatrix(undefined, undefined, (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })
            let data = await sensor.createRotationMatrix(undefined, [], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })
            let data = await sensor.createRotationMatrix(null, [30, 25, 41], (error, data) => {
                if (error) {
                    expect(false).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })

            let data = await sensor.transformCoordinateSystem([1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5] , { 'x': 1, 'y': 2 })
            expect(data.length > 0).assertTrue();
            sensor.transformCoordinateSystem([1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5], {
                'x': 1,
                'y': 2
            }, (error, data) => {
                if (error) {
                    expect(data.length > 0).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })

            let data = await sensor.transformRotationMatrix([], {'x':1, 'y':2});
            expect(data.length === 0).assertTrue();

            sensor.createQuaternion([0, 0, 0], (error, data) => {
                if (error) {
                    expect(data.length === 0).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })
            let data = await sensor.createQuaternion([0, 0, 0])
            expect(data.length === 0).assertTrue();

            sensor.getQuaternion([0, 0, 0], (error, data) => {
                if (error) {
                    expect(data.length === 0).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })
            let data = await sensor.getQuaternion([0, 0, 0])
            expect(data.length === 0).assertTrue();

            let data = await sensor.getDirection([1,1,1]);
            expect(data.length === 0).assertTrue();

            let data = await sensor.getOrientation([2,2,2])
            expect(data.length === 0).assertTrue();

            sensor.createRotationMatrix([0,1,2], [0,1,2], (error, data) => {
                if (error) {
                    expect(data.rotation !== undefined).assertTrue();
                    expect(data.inclination !== undefined).assertTrue();
                } else {
                    expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                }
                done()
            })
            
        } catch (error) {
            console.info("newAccelerometer_Uncalibrated_SensorJsTest032 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
})}
