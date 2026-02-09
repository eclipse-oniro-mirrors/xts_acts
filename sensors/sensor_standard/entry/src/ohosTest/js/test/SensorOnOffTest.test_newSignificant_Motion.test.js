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

export default function SensorJsTest_sensor_50() {
describe("SensorJsTest_sensor_50", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.scalar)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        expect(typeof (data.scalar)).assertEqual("number");
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
     * @tc.name   newSignificant_Motion_SensorJsTest012
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0120
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("newSignificant_Motion_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newSignificant_Motion_SensorJsTest012--------------');
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, callback);
        setTimeout(()=>{
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION);
            done();
        }, 500);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest013
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0130
     * @tc.desc   Illegal ID passed in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newSignificant_Motion_SensorJsTest013--------------');
        function onSensorCallback(data) {
            console.info('newSignificant_Motion_SensorJsTest013 callback in');
            expect(false).assertTrue();
        }
        try {
            sensor.on(invalid, onSensorCallback);
        } catch (error) {
            console.info("newSignificant_Motion_SensorJsTest013 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest014
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0140
     * @tc.desc   For normal scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newSignificant_Motion_SensorJsTest014--------------');
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, callback, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newSignificant_Motion_SensorJsTest014 off in--------------');
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION);
            console.info('---------newSignificant_Motion_SensorJsTest014 off end--------------');
            done();
        }, 500);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest015
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0150
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info('---------newSignificant_Motion_SensorJsTest015--------------');
        function onSensorCallback(data) {
            console.info('newSignificant_Motion_SensorJsTest015  callback in');
            expect(typeof (data.scalar)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, onSensorCallback, {'interval': 100000000}, 5);
        } catch (error) {
            console.info("newSignificant_Motion_SensorJsTest015 error:" +error);
            expect(false).assertTrue();
            done();
        }
        setTimeout(()=>{
            console.info('---------newSignificant_Motion_SensorJsTest015 off in--------------');
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION);
            console.info('---------newSignificant_Motion_SensorJsTest015 off end--------------');
            done();
        }, 500);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest016
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0160
     * @tc.desc   Once Normal Subscription Scenario Use Case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.once(sensor.SensorId.SIGNIFICANT_MOTION, callback);
        setTimeout(()=>{
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest017
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0170
     * @tc.desc   Use case of illegal parameter passed into once interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newSignificant_Motion_SensorJsTest017 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(invalid, onceSensorCallback);
        } catch (error) {
            console.info("newSignificant_Motion_SensorJsTest017 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest018
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0180
     * @tc.desc   Use case of illegal parameter passed into off interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(invalid, callback);
        } catch (error) {
            console.info('newSignificant_Motion_SensorJsTest018 error:' +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest019
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0190
     * @tc.desc   Unsubscribe directly without waiting after starting subscription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newSignificant_Motion_SensorJsTest019 callback in');
            expect(false).assertTrue();
            done();
        }
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, onSensorCallback);
        sensor.off(sensor.SensorId.SIGNIFICANT_MOTION, onSensorCallback);
        setTimeout(()=>{
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest020
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0200
     * @tc.desc   SensorId1000000 of incoming exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newSignificant_Motion_SensorJsTest020 on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newSignificant_Motion_SensorJsTest020 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest021
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0210
     * @tc.desc   Call interface multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, (data)=>{
            console.info("newSignificant_Motion_SensorJsTest021 callback: " + JSON.stringify(data));
            expect(typeof (data.scalar)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        });
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, (data)=>{
            console.info("newSignificant_Motion_SensorJsTest021 callback2: " + JSON.stringify(data));
            expect(typeof (data.scalar)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newSignificant_Motion_SensorJsTest021 off in--------------');
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION);
            console.info('---------newSignificant_Motion_SensorJsTest021 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest022
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0220
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        try {
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION, 5);
        } catch (error) {
            console.info('newSignificant_Motion_SensorJsTest022 error:'+error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest023
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0230
     * @tc.desc   Call on interface and once interface respectively, and use an off interface to close
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newSignificant_Motion_SensorJsTest023--------------');
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, (data)=>{
            console.info("newSignificant_Motion_SensorJsTest023 callback: " + JSON.stringify(data));
            expect(typeof (data.scalar)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.once(sensor.SensorId.SIGNIFICANT_MOTION, (data)=>{
            console.info("newSignificant_Motion_SensorJsTest023 callback2: " + JSON.stringify(data));
            expect(typeof (data.scalar)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newSignificant_Motion_SensorJsTest023 off in--------------');
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION);
            console.info('---------newSignificant_Motion_SensorJsTest023 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest024
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0240
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newSignificant_Motion_SensorJsTest024--------------');
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, (data)=>{
            console.info("newSignificant_Motion_SensorJsTest024 callback: " + JSON.stringify(data));
            expect(typeof (data.scalar)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, (data)=>{
            console.info("newSignificant_Motion_SensorJsTest024 callback2: " + JSON.stringify(data));
            expect(typeof (data.scalar)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newSignificant_Motion_SensorJsTest024 off in--------------');
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION);
            console.info('---------newSignificant_Motion_SensorJsTest024 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest025
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0250
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newSignificant_Motion_SensorJsTest025--------------');
        try {
            sensor.on();
        } catch (error) {
            console.info("newSignificant_Motion_SensorJsTest025 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.once();
        } catch (error) {
            console.info("newSignificant_Motion_SensorJsTest025 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.off();
        } catch (error) {
            console.info("newSignificant_Motion_SensorJsTest025 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest026
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0260
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newSignificant_Motion_SensorJsTest026--------------');
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, callback);
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, callback2);
        setTimeout(() => {
            console.info('----------------------newSignificant_Motion_SensorJsTest026 off in--------------');
            try {
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION, callback);
            } catch (error) {
            console.info("newSignificant_Motion_SensorJsTest026 error:" + error);
            }
            console.info('----------------------newSignificant_Motion_SensorJsTest026 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newSignificant_Motion_SensorJsTest026 off in--------------');
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION, callback2);
            console.info('----------------------newSignificant_Motion_SensorJsTest026 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest027
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0270
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newSignificant_Motion_SensorJsTest027--------------');
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------newSignificant_Motion_SensorJsTest027 off in--------------');
            try {
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION, callback);
            } catch (error) {
            console.info("newSignificant_Motion_SensorJsTest027 error:" + error);
            }
            console
            console.info('----------------------newSignificant_Motion_SensorJsTest027 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newSignificant_Motion_SensorJsTest027_2 off in--------------');
            sensor.off(sensor.SensorId.SIGNIFICANT_MOTION, callback2);
            console.info('----------------------newSignificant_Motion_SensorJsTest027_2 off end--------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   newSignificant_Motion_SensorJsTest028
     * @tc.number SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0280
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newSignificant_Motion_SensorJsTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newSignificant_Motion_SensorJsTest028--------------');
        const TAG = 'newSignificant_Motion_SensorJsTest028'
        try{
            const deviceId = -1;
            const result = sensor.getSingleSensorByDeviceSync(sensor.SensorId.SIGNIFICANT_MOTION, deviceId);
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
                sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, callback, options);
                setTimeout(() => {
                    console.info('-------------------newSignificant_Motion_SensorJsTest028 off in------------');
                    sensor.off(sensor.SensorId.SIGNIFICANT_MOTION, sensorInfoParam, callback);
                    console.info('-------------------newSignificant_Motion_SensorJsTest028 off end-----------');
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
