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

export default function SensorJsTest_sensor_51() {
describe("SensorJsTest_sensor_51", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
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
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
    let invalid  = -1;

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0140
     * @tc.name: newLinear_Accelerometer_SensorJsTest014
     * @tc.desc: Functional Use Cases
     */
    it("newLinear_Accelerometer_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newLinear_Accelerometer_SensorJsTest014--------------');
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, callback);
        setTimeout(()=>{
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER);
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0150
     * @tc.name: newLinear_Accelerometer_SensorJsTest015
     * @tc.desc: Illegal ID passed in
     */
    it("newLinear_Accelerometer_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newLinear_Accelerometer_SensorJsTest015--------------');
        function onSensorCallback(data) {
            console.info('newLinear_Accelerometer_SensorJsTest015 callback in');
            expect(false).assertTrue();
        }
        try {
            sensor.on(invalid, onSensorCallback);
        } catch (error) {
            console.info("newLinear_Accelerometer_SensorJsTest015 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0160
     * @tc.name: newLinear_Accelerometer_SensorJsTest016
     * @tc.desc: For normal scenarios
     */
    it("newLinear_Accelerometer_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------SensorJsTest003--------------');
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, callback, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newLinear_Accelerometer_SensorJsTest016 off in--------------');
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER);
            console.info('---------newLinear_Accelerometer_SensorJsTest016 off end--------------');
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0170
     * @tc.name: newLinear_Accelerometer_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newLinear_Accelerometer_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newLinear_Accelerometer_SensorJsTest017--------------');
        function onSensorCallback(data) {
            console.info('newLinear_Accelerometer_SensorJsTest017  callback in');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, onSensorCallback, {'interval': 100000000}, 5);
        } catch (error) {
            console.info("newLinear_Accelerometer_SensorJsTest017 error:" +error);
            expect(false).assertTrue();
            done();
        }
        setTimeout(()=>{
            console.info('---------newLinear_Accelerometer_SensorJsTest017 off in--------------');
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER);
            console.info('---------newLinear_Accelerometer_SensorJsTest017 off end--------------');
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0180
     * @tc.name: newLinear_Accelerometer_SensorJsTest018
     * @tc.desc: Once Normal Subscription Scenario Use Case
     */
    it("newLinear_Accelerometer_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.once(sensor.SensorId.LINEAR_ACCELEROMETER, callback);
        setTimeout(()=>{
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0190
     * @tc.name: newLinear_Accelerometer_SensorJsTest019
     * @tc.desc: Use case of illegal parameter passed into once interface
     */
    it("newLinear_Accelerometer_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newLinear_Accelerometer_SensorJsTest019 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(invalid, onceSensorCallback);
        } catch (error) {
            console.info("newLinear_Accelerometer_SensorJsTest019 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0200
     * @tc.name: newLinear_Accelerometer_SensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newLinear_Accelerometer_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newLinear_Accelerometer_SensorJsTest020  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
            sensor.once(sensor.SensorId.LINEAR_ACCELEROMETER, onceSensorCallback, 5);
        } catch (error) {
            console.info('newLinear_Accelerometer_SensorJsTest020 error:' +error);
            expect(false).assertTrue();
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0210
     * @tc.name: newLinear_Accelerometer_SensorJsTest021
     * @tc.desc: Use case of illegal parameter passed into off interface
     */
    it("newLinear_Accelerometer_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(invalid, callback);
        } catch (error) {
            console.info('newLinear_Accelerometer_SensorJsTest021 error:' +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0220
     * @tc.name: newLinear_Accelerometer_SensorJsTest022
     * @tc.desc: Unsubscribe directly without waiting after starting subscription
     */
    it("newLinear_Accelerometer_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newLinear_Accelerometer_SensorJsTest022 callback in');
            expect(false).assertTrue();
            done();
        }
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, onSensorCallback);
        sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER, onSensorCallback);
        setTimeout(()=>{
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0230
     * @tc.name: newLinear_Accelerometer_SensorJsTest023
     * @tc.desc:SensorId1000000 of incoming exception
     */
    it("newLinear_Accelerometer_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newLinear_Accelerometer_SensorJsTest023 on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newLinear_Accelerometer_SensorJsTest023 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0240
     * @tc.name: newLinear_Accelerometer_SensorJsTest024
     * @tc.desc:Call interface multiple times
     */
    it("newLinear_Accelerometer_SensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, (data)=>{
            console.info("newLinear_Accelerometer_SensorJsTest024 callback: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        });
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, (data)=>{
            console.info("newLinear_Accelerometer_SensorJsTest024 callback2: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newLinear_Accelerometer_SensorJsTest024 off in--------------');
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER);
            console.info('---------newLinear_Accelerometer_SensorJsTest024 off end--------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0250
     * @tc.name: newLinear_Accelerometer_SensorJsTest025
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newLinear_Accelerometer_SensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER, 5);
        } catch (error) {
            console.info('newLinear_Accelerometer_SensorJsTest025 error:'+error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0260
     * @tc.name: newLinear_Accelerometer_SensorJsTest026
     * @tc.desc:Call on interface and once interface respectively, and use an off interface to close
     */
    it("newLinear_Accelerometer_SensorJsTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newLinear_Accelerometer_SensorJsTest026--------------');
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, (data)=>{
            console.info("newLinear_Accelerometer_SensorJsTest026 callback: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.once(sensor.SensorId.LINEAR_ACCELEROMETER, (data)=>{
            console.info("newLinear_Accelerometer_SensorJsTest026 callback2: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newLinear_Accelerometer_SensorJsTest026 off in--------------');
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER);
            console.info('---------newLinear_Accelerometer_SensorJsTest026 off end--------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0270
     * @tc.name: newLinear_Accelerometer_SensorJsTest027
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newLinear_Accelerometer_SensorJsTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newLinear_Accelerometer_SensorJsTest027--------------');
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, (data)=>{
            console.info("newLinear_Accelerometer_SensorJsTest027 callback: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, (data)=>{
            console.info("newLinear_Accelerometer_SensorJsTest027 callback2: " + JSON.stringify(data));
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newLinear_Accelerometer_SensorJsTest027 off in--------------');
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER);
            console.info('---------newLinear_Accelerometer_SensorJsTest027 off end--------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number:SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0280
     * @tc.name: newLinear_Accelerometer_SensorJsTest028
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newLinear_Accelerometer_SensorJsTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newLinear_Accelerometer_SensorJsTest028--------------');
        try {
            sensor.on();
        } catch (error) {
            console.info("newLinear_Accelerometer_SensorJsTest028 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.once();
        } catch (error) {
            console.info("newLinear_Accelerometer_SensorJsTest028 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.off();
        } catch (error) {
            console.info("newLinear_Accelerometer_SensorJsTest028 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0290
     * @tc.name: newLinear_Accelerometer_SensorJsTest029
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newLinear_Accelerometer_SensorJsTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newLinear_Accelerometer_SensorJsTest029--------------');
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, callback);
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, callback2);
        setTimeout(() => {
            console.info('----------------------newLinear_Accelerometer_SensorJsTest029 off in--------------');
            try {
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER, callback);
            } catch (error) {
            console.info("newLinear_Accelerometer_SensorJsTest029 error:" + error);
            }
            console.info('----------------------newLinear_Accelerometer_SensorJsTest029 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newLinear_Accelerometer_SensorJsTest029 off in--------------');
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER, callback2);
            console.info('----------------------newLinear_Accelerometer_SensorJsTest029 off end--------------');
            done();
        }, 1000);
    })

     /*
     * @tc.number: SUB_SensorsSystem_LINEAR_ACCELEROMETER_JSTest_0300
     * @tc.name: newLinear_Accelerometer_SensorJsTest030
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newLinear_Accelerometer_SensorJsTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newLinear_Accelerometer_SensorJsTest030--------------');
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorId.LINEAR_ACCELEROMETER, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------newLinear_Accelerometer_SensorJsTest030 off in--------------');
            try {
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER, callback);
            } catch (error) {
            console.info("newLinear_Accelerometer_SensorJsTest030 error:" + error);
            }
            console
            console.info('----------------------newLinear_Accelerometer_SensorJsTest030 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newLinear_Accelerometer_SensorJsTest030_2 off in--------------');
            sensor.off(sensor.SensorId.LINEAR_ACCELEROMETER, callback2);
            console.info('----------------------newLinear_Accelerometer_SensorJsTest030_2 off end--------------');
            done();
        }, 1000);
    })
})}
