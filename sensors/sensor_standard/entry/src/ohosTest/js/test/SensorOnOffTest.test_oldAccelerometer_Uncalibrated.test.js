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

export default function SensorJsTest_sensor_6() {
describe("SensorJsTest_sensor_6", function () {
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

    let errMessages = ['string is not defined','The parameter invalid'];

    let errMessage;

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest001
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0010
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest001---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback);
        setTimeout(() => {
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED);
            done();
        }, 500);
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest002
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0020
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest002---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest002 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED);
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest002 off end---------------------------');
            done();
        }, 500);
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest003
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0030
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest003---------------------------');
        function onSensorCallback(data) {
            console.info('Accelerometer_Uncalibrated_SensorJsTest003  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.biasX)).assertEqual("number");
            expect(typeof (data.biasY)).assertEqual("number");
            expect(typeof (data.biasZ)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try {
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, onSensorCallback, { 'interval': 100000000 }, 5);
        } catch (error) {
            console.info("Accelerometer_Uncalibrated_SensorJsTest003 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        }
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest004
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0040
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest004---------------------------');
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback);
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest005
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0050
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest005---------------------------');
        function onceSensorCallback(data) {
            console.info('Accelerometer_Uncalibrated_SensorJsTest005  on error');
            expect(typeof (data.x)).assertEqual("number");
            expect(typeof (data.y)).assertEqual("number");
            expect(typeof (data.z)).assertEqual("number");
            expect(typeof (data.biasX)).assertEqual("number");
            expect(typeof (data.biasY)).assertEqual("number");
            expect(typeof (data.biasZ)).assertEqual("number");
            expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try {
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, onceSensorCallback, 5);
        } catch (error) {
            console.info("Accelerometer_Uncalibrated_SensorJsTest005 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest006
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0060
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest006---------------------------');
        try {
            sensor.off(string, "");
        } catch (error) {
            console.info("Accelerometer_Uncalibrated_SensorJsTest006 error:" + error);
            errMessage = error.toString().slice(16, 40);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest007
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0070
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest007---------------------------');
        function onSensorCallback(data) {
            console.info('Accelerometer_Uncalibrated_SensorJsTest007  on error');
            expect(false).assertTrue();
            done();
        }
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, onSensorCallback);
        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, onSensorCallback);
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest008
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0080
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest008---------------------------');
        function onSensorCallback(data) {
            console.info('Accelerometer_Uncalibrated_SensorJsTest008  on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("Accelerometer_Uncalibrated_SensorJsTest008 error:" + error);
            errMessage = error.toString().slice(7, 28);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest009
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0090
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest009---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback2);
        setTimeout(() => {
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest009 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED);
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest009 off end---------------------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest010
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0100
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest010---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback2);
        setTimeout(() => {
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest010 off in---------------------------');
            try {
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback);
            } catch (error) {
            console.info("Accelerometer_Uncalibrated_SensorJsTest010 error:" + error);
            }
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest010 off end---------------------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest010 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback2);
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest010 off end---------------------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest011
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0110
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest011---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback, { 'interval': 100000000 });
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback2);
        setTimeout(() => {
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest011 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED);
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest011 off end---------------------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest012
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0120
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest012---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest012 off in---------------------------');
            try {
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback);
            } catch (error) {
            console.info("Accelerometer_Uncalibrated_SensorJsTest012 error:" + error);
            }
            console
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest012 off end---------------------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest012 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback2);
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest012 off end---------------------------');
            done();
        }, 1000);
    })

    /**
     * @tc.name   Accelerometer_Uncalibrated_SensorJsTest013
     * @tc.number SUB_SensorsSystem_Accelerometer_Uncalibrated_JSTest_0130
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Accelerometer_Uncalibrated_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest013---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest013 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER_UNCALIBRATED);
            console.info('----------------------Accelerometer_Uncalibrated_SensorJsTest013 off end---------------------------');
            done();
        }, 1000);
    })
})}
