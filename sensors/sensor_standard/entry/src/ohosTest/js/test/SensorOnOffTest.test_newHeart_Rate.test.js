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
export default function SensorJsTest_sensor_52() {
describe("SensorJsTest_sensor_52", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.heartRate)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        expect(typeof (data.heartRate)).assertEqual("number");
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
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_CODE = 14500101
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
    let invalid  = -1;
    let errMessages = ['ReferenceError: string is not defined','TypeError: is not callable',
    'ReferenceError: xxx is not defined']
    let errMessage

     /*
     * @tc.number:SUB_SensorsSystem_Heart_Rate_JSTest_0120
     * @tc.name: newHeartRate_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest012--------');
        try {
            sensor.on(sensor.SensorId.HEART_RATE, callback);
        } catch (error) {
            console.info("newHeartRate_SensorJsTest012 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
         setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0130
     * @tc.name: newHeartRate_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest013--------');
        try {
            sensor.on(sensor.SensorId.HEART_RATE ,callback, { 'interval': 100000000 });
        } catch (error) {
            console.info("newHeartRate_SensorJsTest013 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0140
     * @tc.name: newHeartRate_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest014--------');
        function onSensorCallback(data) {
            console.info('newHeartRate_SensorJsTest014  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorId.HEART_RATE,
            onSensorCallback, { 'interval': 100000000 }, 5);
        } catch (error) {
            console.info("newHeartRate_SensorJsTest014 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0150
     * @tc.name: newHeartRate_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest015--------');
        try{
        sensor.once(sensor.SensorId.HEART_RATE, callback);
        } catch (error) {
            console.info("newHeartRate_SensorJsTest015 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0160
     * @tc.name: newHeartRate_SensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest016--------');
        function onceSensorCallback(data) {
            console.info('newHeartRate_SensorJsTest016 on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.once(sensor.SensorId.HEART_RATE, onceSensorCallback, 5);
        } catch (error) {
            console.info("newHeartRate_SensorJsTest016 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0170
     * @tc.name: newHeartRate_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest017--------');
        try {
            sensor.off(string, "");
        } catch (error) {
            errMessage
            console.info("newHeartRate_SensorJsTest017 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0180
     * @tc.name: newHeartRate_SensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest018--------');
        function onSensorCallback(data) {
            console.info('newHeartRate_SensorJsTest018  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
       try {
           sensor.on(sensor.SensorId.HEART_RATE, onSensorCallback);
           sensor.off(sensor.SensorId.HEART_RATE);
            } catch (error) {
            console.info("newHeartRate_SensorJsTest018 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0190
     * @tc.name: newHeartRate_SensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest019--------');
        function onSensorCallback(data) {
            console.info('newHeartRate_SensorJsTest019  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newHeartRate_SensorJsTest019 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

     /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0200
     * @tc.name: newHeartRate_SensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest020--------');
        function onSensorCallback(data) {
            console.info('newHeartRate_SensorJsTest020  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.off(invalid, onSensorCallback);
        } catch (error) {
            console.info("newHeartRate_SensorJsTest020 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0210
     * @tc.name: newHeartRate_SensorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest021--------');
        function onSensorCallback(data) {
            console.info('newHeartRate_SensorJsTest021  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.xxx(sensor.SensorId.HEART_RATE, onSensorCallback);
        } catch (error) {
            console.info("newHeartRate_SensorJsTest021 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_Heart_Rate_JSTest_0220
     * @tc.name: newHeartRate_SensorJsTest022
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHeartRate_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newHeartRate_SensorJsTest022--------');
        function onSensorCallback(data) {
            console.info('newHeartRate_SensorJsTest022  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            xxx.on(sensor.SensorId.HEART_RATE, onSensorCallback);
        } catch (error) {
            console.info("newHeartRate_SensorJsTest022 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Heart_Rate_JSTest_0230
     * @tc.name: newHeartRate_SensorJsTest023
     * @tc.desc: Functional Use Cases
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("newHeartRate_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newHeartRate_SensorJsTest023--------------');
        const TAG = 'newHeartRate_SensorJsTest023'
        try{
            const deviceId = -1;
            const result = sensor.getSingleSensorByDeviceSync(sensor.SensorId.HEART_RATE, deviceId);
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
                sensor.on(sensor.SensorId.HEART_RATE, callback, options);
                setTimeout(() => {
                    console.info('--------------------newHeartRate_SensorJsTest023 off in------------');
                    sensor.off(sensor.SensorId.HEART_RATE, sensorInfoParam, callback);
                    console.info('--------------------newHeartRate_SensorJsTest023 off end------------');
                    done();
                }, 1000);
            }
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})
}
