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

export default function SensorJsTest_sensor_44() {
describe("SensorJsTest_sensor_44", function () {
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
        console.info('beforeAll caled')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll caled')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach caled')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach caled')
    })

    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
	let invalid  = -1;
	
	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0140
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest014
     * @tc.desc: Functional Use Cases
     */
    it("newGyroscope_Uncalibrated_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newGyroscope_Uncalibrated_SensorJsTest014--------------');
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback);
        setTimeout(()=>{
            sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0150
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest015
     * @tc.desc: Illegal ID passed in
     */
    it("newGyroscope_Uncalibrated_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroscope_Uncalibrated_SensorJsTest015--------------');
        function onSensorCallback(data) {
            console.info('newGyroscope_Uncalibrated_SensorJsTest015 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.on(invalid, onSensorCallback);
        } catch (error) {
            console.info("newGyroscope_Uncalibrated_SensorJsTest015 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0160
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest016
     * @tc.desc: For normal scenarios
     */
    it("newGyroscope_Uncalibrated_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------SensorJsTest003--------------');
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest016 off in--------------');
            sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest016 off end--------------');
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0170
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest030
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newGyroscope_Uncalibrated_SensorJsTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info('---------newGyroscope_Uncalibrated_SensorJsTest030--------------');
        function onSensorCallback(data) {
            console.info('newGyroscope_Uncalibrated_SensorJsTest030  callback in');
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.biasX)).assertEqual("number");
        expect(typeof (data.biasY)).assertEqual("number");
        expect(typeof (data.biasZ)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, onSensorCallback, {'interval': 100000000}, 5);
        } catch (error) {
            console.info("newGyroscope_Uncalibrated_SensorJsTest030 error:" +error);
            expect(false).assertTrue();
            done();
        }
        setTimeout(()=>{
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest030 off in--------------');
            sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest030 off end--------------');
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0180
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest018
     * @tc.desc: Once Normal Subscription Scenario Use Case
     */
    it("newGyroscope_Uncalibrated_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.once(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback);
        setTimeout(()=>{
            expect(true).assertTrue();
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0190
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest019
     * @tc.desc: Use case of illegal parameter passed into once interface
     */
    it("newGyroscope_Uncalibrated_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newGyroscope_Uncalibrated_SensorJsTest019 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(invalid, onceSensorCallback);
        } catch (error) {
            console.info("newGyroscope_Uncalibrated_SensorJsTest019 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0200
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newGyroscope_Uncalibrated_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        function onceSensorCallback(data) {
            console.info('newGyroscope_Uncalibrated_SensorJsTest020  on error');
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
            sensor.once(sensor.SensorId.GYROSCOPE_UNCALIBRATED, onceSensorCallback, 5);
        } catch (error) {
            console.info('newGyroscope_Uncalibrated_SensorJsTest020 error:' +error);
            expect(false).assertTrue();
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0210
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest021
     * @tc.desc: Use case of illegal parameter passed into off interface
     */
    it("newGyroscope_Uncalibrated_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(invalid, callback);
        } catch (error) {
            console.info('newGyroscope_Uncalibrated_SensorJsTest021 error:' +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0220
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest022
     * @tc.desc: Unsubscribe directly without waiting after starting subscription
     */
    it("newGyroscope_Uncalibrated_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newGyroscope_Uncalibrated_SensorJsTest022 callback in');
            expect(false).assertTrue();
            done();
        }
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, onSensorCallback);
        sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED, onSensorCallback);
        setTimeout(()=>{
            expect(true).assertTrue();
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0230
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest023
     * @tc.desc:SensorId1000000 of incoming exception
     */
    it("newGyroscope_Uncalibrated_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newGyroscope_Uncalibrated_SensorJsTest023 on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newGyroscope_Uncalibrated_SensorJsTest023 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0240
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest024
     * @tc.desc:Call interface multiple times
     */
    it("newGyroscope_Uncalibrated_SensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, (data)=>{
            console.info("newGyroscope_Uncalibrated_SensorJsTest024 callback: " + JSON.stringify(data));
			expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.biasX)).assertEqual("number");
			expect(typeof (data.biasY)).assertEqual("number");
			expect(typeof (data.biasZ)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        });
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, (data)=>{
            console.info("newGyroscope_Uncalibrated_SensorJsTest024 callback2: " + JSON.stringify(data));
			expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.biasX)).assertEqual("number");
			expect(typeof (data.biasY)).assertEqual("number");
			expect(typeof (data.biasZ)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest024 off in--------------');
            sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest024 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0250
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest025
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newGyroscope_Uncalibrated_SensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        try {
            sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED, 5);
        } catch (error) {
            console.info('newGyroscope_Uncalibrated_SensorJsTest025 error:'+error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0260
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest026
     * @tc.desc:Call on interface and once interface respectively, and use an off interface to close
     */
    it("newGyroscope_Uncalibrated_SensorJsTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroscope_Uncalibrated_SensorJsTest026--------------');
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, (data)=>{
            console.info("newGyroscope_Uncalibrated_SensorJsTest026 callback: " + JSON.stringify(data));
			expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.biasX)).assertEqual("number");
			expect(typeof (data.biasY)).assertEqual("number");
			expect(typeof (data.biasZ)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.once(sensor.SensorId.GYROSCOPE_UNCALIBRATED, (data)=>{
            console.info("newGyroscope_Uncalibrated_SensorJsTest026 callback2: " + JSON.stringify(data));
			expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.biasX)).assertEqual("number");
			expect(typeof (data.biasY)).assertEqual("number");
			expect(typeof (data.biasZ)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest026 off in--------------');
            sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest026 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0270
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest027
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newGyroscope_Uncalibrated_SensorJsTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroscope_Uncalibrated_SensorJsTest027--------------');
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, (data)=>{
            console.info("newGyroscope_Uncalibrated_SensorJsTest027 callback: " + JSON.stringify(data));
			expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.biasX)).assertEqual("number");
			expect(typeof (data.biasY)).assertEqual("number");
			expect(typeof (data.biasZ)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, (data)=>{
            console.info("newGyroscope_Uncalibrated_SensorJsTest027 callback2: " + JSON.stringify(data));
			expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.biasX)).assertEqual("number");
			expect(typeof (data.biasY)).assertEqual("number");
			expect(typeof (data.biasZ)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest027 off in--------------');
            sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
            console.info('---------newGyroscope_Uncalibrated_SensorJsTest027 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_Gyroscope_Uncalibrated_JSTest_0280
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest028
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newGyroscope_Uncalibrated_SensorJsTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newGyroscope_Uncalibrated_SensorJsTest028--------------');
        try {
            sensor.on();
        } catch (error) {
			console.info("newGyroscope_Uncalibrated_SensorJsTest028 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.once();
        } catch (error) {
			console.info("newGyroscope_Uncalibrated_SensorJsTest028 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.off();
        } catch (error) {
			console.info("newGyroscope_Uncalibrated_SensorJsTest028 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_UNCALIBRATED_JSTest_0290
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest029
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newGyroscope_Uncalibrated_SensorJsTest029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest029--------------');
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback);
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback2);
        setTimeout(() => {
            console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest029 off in--------------');
            try {
			sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback);
			} catch (error) {
            console.info("newGyroscope_Uncalibrated_SensorJsTest029 error:" + error);
			}
            console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest029 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest029 off in--------------');
            sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback2);
            console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest029 off end--------------');
            done();
        }, 1000);
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_GYROSCOPE_UNCALIBRATED_JSTest_0300
     * @tc.name: newGyroscope_Uncalibrated_SensorJsTest030
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newGyroscope_Uncalibrated_SensorJsTest030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest030--------------');
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest030 off in--------------');
            try {
			sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback);
			} catch (error) {
            console.info("newGyroscope_Uncalibrated_SensorJsTest030 error:" + error);
			}
            console
            console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest030 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest030_2 off in--------------');
            sensor.off(sensor.SensorId.GYROSCOPE_UNCALIBRATED, callback2);
            console.info('----------------------newGyroscope_Uncalibrated_SensorJsTest030_2 off end--------------');
            done();
        }, 1000);
    })
})}
