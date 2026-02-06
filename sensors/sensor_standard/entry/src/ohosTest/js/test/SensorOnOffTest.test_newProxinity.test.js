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

export default function SensorJsTest_sensor_54() {
describe("SensorJsTest_sensor_54", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.distance)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        expect(typeof (data.distance)).assertEqual("number");
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

    /**
     * @tc.name   newProxinity_SensorJsTest012
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0120
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest012--------');
        try {
            sensor.on(sensor.SensorId.PROXIMITY, callback);
        } catch (error) {
            console.info("newProxinity_SensorJsTest012 error:" + error);
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
     * @tc.name   newProxinity_SensorJsTest013
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0130
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest013--------');
        try {
            sensor.on(sensor.SensorId.PROXIMITY ,callback, { 'interval': 100000000 });
        } catch (error) {
            console.info("newProxinity_SensorJsTest013 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest014
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0140
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest014--------');
        function onSensorCallback(data) {
            console.info('newProxinity_SensorJsTest014  on error');
            expect(typeof (data.distance)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorId.PROXIMITY,
            onSensorCallback, { 'interval': 100000000 }, 5);
        } catch (error) {
            console.info("newProxinity_SensorJsTest014 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest015
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0150
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest015--------');
        try{
        sensor.once(sensor.SensorId.PROXIMITY, callback);
        } catch (error) {
            console.info("newProxinity_SensorJsTest015 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest016
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0160
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest016--------');
        function onceSensorCallback(data) {
            console.info('newProxinity_SensorJsTest016 on error');
            expect(typeof (data.distance)).assertEqual("number");
        }
        try {
            sensor.once(sensor.SensorId.PROXIMITY, onceSensorCallback, 5);
        } catch (error) {
            console.info("newProxinity_SensorJsTest016 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest017
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0170
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest017--------');
        try {
            sensor.off(string, "");
        } catch (error) {
            errMessage
            console.info("newProxinity_SensorJsTest017 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest018
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0180
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest018--------');
        function onSensorCallback(data) {
            console.info('newProxinity_SensorJsTest018  on error');
            expect(typeof (data.distance)).assertEqual("number");
        }
       try {
           sensor.on(sensor.SensorId.PROXIMITY, onSensorCallback);
           sensor.off(sensor.SensorId.PROXIMITY);
            } catch (error) {
            console.info("newProxinity_SensorJsTest018 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest019
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0190
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest019--------');
        function onSensorCallback(data) {
            console.info('newProxinity_SensorJsTest019  on error');
            expect(typeof (data.distance)).assertEqual("number");
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newProxinity_SensorJsTest019 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest020
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0200
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest020--------');
        function onSensorCallback(data) {
            console.info('newProxinity_SensorJsTest020  on error');
            expect(typeof (data.distance)).assertEqual("number");
        }
        try {
            sensor.off(invalid, onSensorCallback);
        } catch (error) {
            console.info("newProxinity_SensorJsTest020 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest021
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0210
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest021--------');
        function onSensorCallback(data) {
            console.info('newProxinity_SensorJsTest021  on error');
            expect(typeof (data.distance)).assertEqual("number");
        }
        try {
            sensor.xxx(sensor.SensorId.PROXIMITY, onSensorCallback);
        } catch (error) {
            console.info("newProxinity_SensorJsTest021 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest022
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0220
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newProxinity_SensorJsTest022--------');
        function onSensorCallback(data) {
            console.info('newProxinity_SensorJsTest022  on error');
            expect(typeof (data.distance)).assertEqual("number");
        }
        try {
            xxx.on(sensor.SensorId.PROXIMITY, onSensorCallback);
        } catch (error) {
            console.info("newProxinity_SensorJsTest022 error:" + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[2]);
            done();
        }
    })

    /**
     * @tc.name   newProxinity_SensorJsTest023
     * @tc.number SUB_SensorsSystem_Proxinity_JSTest_0230
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newProxinity_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newProxinity_SensorJsTest023--------------');
        const TAG = 'newProxinity_SensorJsTest023'
        try{
            const deviceId = -1;
            const result = sensor.getSingleSensorByDeviceSync(sensor.SensorId.PROXIMITY, deviceId);
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
                sensor.on(sensor.SensorId.PROXIMITY, callback, options);
                setTimeout(() => {
                    console.info('-------------------newProxinity_SensorJsTest023 off in------------');
                    sensor.off(sensor.SensorId.PROXIMITY, sensorInfoParam, callback);
                    console.info('-------------------newProxinity_SensorJsTest023 off end-----------');
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
