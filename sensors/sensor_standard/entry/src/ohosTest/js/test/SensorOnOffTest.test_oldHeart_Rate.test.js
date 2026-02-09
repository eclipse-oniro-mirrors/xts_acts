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

export default function SensorJsTest_sensor_11() {
describe("SensorJsTest_sensor_11", function () {
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
    let errMessages = ['ReferenceError: string is not defined','TypeError: is not callable','ReferenceError: xxx is not defined']
    let errMessage

    /**
     * @tc.name   HeartRate_SensorJsTest001
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0010
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest001--------');
        try {
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE, callback);
        } catch (error) {
            console.info("HeartRate_SensorJsTest001 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
         setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /**
     * @tc.name   HeartRate_SensorJsTest002
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0020
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest002--------');
        try {
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE ,callback, { 'interval': 100000000 });
        } catch (error) {
            console.info("HeartRate_SensorJsTest002 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   HeartRate_SensorJsTest003
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0030
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest003--------');
        function onSensorCallback(data) {
            console.info('HeartRate_SensorJsTest003  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE,
            onSensorCallback, { 'interval': 100000000 }, 5);
        } catch (error) {
            console.info("HeartRate_SensorJsTest003 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   HeartRate_SensorJsTest004
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0040
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest004--------');
        try{
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE, callback);
        } catch (error) {
            console.info("HeartRate_SensorJsTest004 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   HeartRate_SensorJsTest005
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0050
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest005--------');
        function onceSensorCallback(data) {
            console.info('HeartRate_SensorJsTest005 on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE, onceSensorCallback, 5);
        } catch (error) {
            console.info("HeartRate_SensorJsTest005 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   HeartRate_SensorJsTest006
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0060
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest006--------');
        try {
            sensor.off(string, "");
        } catch (error) {
            errMessage
            console.info("HeartRate_SensorJsTest006 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /**
     * @tc.name   HeartRate_SensorJsTest007
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0070
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest007--------');
        function onSensorCallback(data) {
            console.info('HeartRate_SensorJsTest007  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
       try {
           sensor.on(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE, onSensorCallback);
           sensor.off(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE);
            } catch (error) {
            console.info("HeartRate_SensorJsTest007 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   HeartRate_SensorJsTest008
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0080
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest008--------');
        function onSensorCallback(data) {
            console.info('HeartRate_SensorJsTest008  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("HeartRate_SensorJsTest008 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   HeartRate_SensorJsTest009
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0090
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest009--------');
        function onSensorCallback(data) {
            console.info('HeartRate_SensorJsTest009  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.off(invalid, onSensorCallback);
        } catch (error) {
            console.info("HeartRate_SensorJsTest009 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   HeartRate_SensorJsTest010
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0100
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest010--------');
        function onSensorCallback(data) {
            console.info('HeartRate_SensorJsTest010  on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            sensor.xxx(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE, onSensorCallback);
        } catch (error) {
            console.info("HeartRate_SensorJsTest010 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /**
     * @tc.name   HeartRate_SensorJsTest011
     * @tc.number SUB_SensorsSystem_Heart_Rate_JSTest_0110
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("HeartRate_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------HeartRate_SensorJsTest011--------');
        function onSensorCallback(data) {
            console.info('HeartRate_SensorJsTest011 on error');
            expect(typeof (data.heartRate)).assertEqual("number");
        }
        try {
            xxx.on(sensor.SensorType.SENSOR_TYPE_ID_HEART_RATE, onSensorCallback);
        } catch (error) {
            console.info("HeartRate_SensorJsTest011 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })
})
}
