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

export default function SensorJsTest_sensor_21() {
describe("SensorJsTest_sensor_21", function () {
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

    let errMessages = ['string is not defined','The parameter invalid'];

    let errMessage;

     /*
     * @tc.number:SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0010
     * @tc.name: SignificantMotion_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest001---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback);
        setTimeout(() => {
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION);
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0020
     * @tc.name: SignificantMotion_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest002---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------SignificantMotion_SensorJsTest002 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION);
            console.info('----------------------SignificantMotion_SensorJsTest002 off end---------------------------');
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0030
     * @tc.name: SignificantMotion_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest003---------------------------');
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback);
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

   /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0040
     * @tc.name: SignificantMotion_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest004---------------------------');
        try {
            sensor.off(string, "");
        } catch (error) {
            console.info("SignificantMotion_SensorJsTest004 error:" + error);
            errMessage = error.toString().slice(16, 40);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0050
     * @tc.name: SignificantMotion_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest005---------------------------');
        function onSensorCallback(data) {
            console.info('SignificantMotion_SensorJsTest005  on error');
            expect(false).assertTrue();
            done();
        }
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, onSensorCallback);
        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, onSensorCallback);
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0060
     * @tc.name: SignificantMotion_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest006---------------------------');
        function onSensorCallback(data) {
            console.info('SignificantMotion_SensorJsTest006 on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("SignificantMotion_SensorJsTest006 error:" + error);
            errMessage = error.toString().slice(7, 28);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0070
     * @tc.name: SignificantMotion_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest007---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback2);
        setTimeout(() => {
            console.info('----------------------SignificantMotion_SensorJsTest007 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION);
            console.info('----------------------SignificantMotion_SensorJsTest007 off end---------------------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0080
     * @tc.name: SignificantMotion_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest008---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback2);
        setTimeout(() => {
            console.info('----------------------SignificantMotion_SensorJsTest008 off in---------------------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback);
			} catch (error) {
            console.info("SignificantMotion_SensorJsTest008 error:" + error);
			}
            console.info('----------------------SignificantMotion_SensorJsTest008 off end---------------------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------SignificantMotion_SensorJsTest008 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback2);
            console.info('----------------------SignificantMotion_SensorJsTest008 off end---------------------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0090
     * @tc.name: SignificantMotion_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest009---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback, { 'interval': 100000000 });
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback2);
        setTimeout(() => {
            console.info('----------------------SignificantMotion_SensorJsTest009 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION);
            console.info('----------------------SignificantMotion_SensorJsTest009 off end---------------------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0100
     * @tc.name: SignificantMotion_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest010---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------SignificantMotion_SensorJsTest010 off in---------------------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback);
			} catch (error) {
            console.info("SignificantMotion_SensorJsTest010 error:" + error);
			}
            console
            console.info('----------------------SignificantMotion_SensorJsTest010 off end---------------------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------SignificantMotion_SensorJsTest010 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback2);
            console.info('----------------------SignificantMotion_SensorJsTest010 off end---------------------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_SIGNIFICANT_MOTION_JSTest_0110
     * @tc.name: SignificantMotion_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("SignificantMotion_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SignificantMotion_SensorJsTest011---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------SignificantMotion_SensorJsTest011 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_SIGNIFICANT_MOTION);
            console.info('----------------------SignificantMotion_SensorJsTest011 off end---------------------------');
            done();
        }, 1000);
    })
})}
