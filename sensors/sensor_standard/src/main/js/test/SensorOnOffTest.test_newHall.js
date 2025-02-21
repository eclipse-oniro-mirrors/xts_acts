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

export default function SensorJsTest_sensor_45() {
describe("SensorJsTest_sensor_45", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        expect(typeof (data.status)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
        expect(typeof (data.status)).assertEqual("number");
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
     * @tc.number:SUB_SensorsSystem_Hall_JSTest_0120
     * @tc.name: newHall_SensorJsTest012
     * @tc.desc: Functional Use Cases
     */
    it("newHall_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newHall_SensorJsTest012--------------');
        sensor.on(sensor.SensorId.HALL, callback);
        setTimeout(()=>{
            sensor.off(sensor.SensorId.HALL);
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0130
     * @tc.name: newHall_SensorJsTest013
     * @tc.desc: Illegal ID passed in
     */
    it("newHall_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHall_SensorJsTest013--------------');
        function onSensorCallback(data) {
            console.info('newHall_SensorJsTest013 callback in');
            expect(false).assertTrue();
        }
        try {
            sensor.on(invalid, onSensorCallback);
        } catch (error) {
            console.info("newHall_SensorJsTest013 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0140
     * @tc.name: newHall_SensorJsTest014
     * @tc.desc: For normal scenarios
     */
    it("newHall_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------SensorJsTest003--------------');
        sensor.on(sensor.SensorId.HALL, callback, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newHall_SensorJsTest014 off in--------------');
            sensor.off(sensor.SensorId.HALL);
            console.info('---------newHall_SensorJsTest014 off end--------------');
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0150
     * @tc.name: newHall_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHall_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info('---------newHall_SensorJsTest015--------------');
        function onSensorCallback(data) {
            console.info('newHall_SensorJsTest015  callback in');
			expect(typeof (data.status)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorId.HALL, onSensorCallback, {'interval': 100000000}, 5);
        } catch (error) {
            console.info("newHall_SensorJsTest015 error:" +error);
            expect(false).assertTrue();
            done();
        }
        setTimeout(()=>{
            console.info('---------newHall_SensorJsTest015 off in--------------');
            sensor.off(sensor.SensorId.HALL);
            console.info('---------newHall_SensorJsTest015 off end--------------');
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0160
     * @tc.name: newHall_SensorJsTest016
     * @tc.desc: Once Normal Subscription Scenario Use Case
     */
    it("newHall_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.once(sensor.SensorId.HALL, callback);
        setTimeout(()=>{
            expect(true).assertTrue();
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0170
     * @tc.name: newHall_SensorJsTest017
     * @tc.desc: Use case of illegal parameter passed into once interface
     */
    it("newHall_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newHall_SensorJsTest017 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(invalid, onceSensorCallback);
        } catch (error) {
            console.info("newHall_SensorJsTest017 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0180
     * @tc.name: newHall_SensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHall_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        function onceSensorCallback(data) {
            console.info('newHall_SensorJsTest018  on error');
			expect(typeof (data.status)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
            sensor.once(sensor.SensorId.HALL, onceSensorCallback, 5);
        } catch (error) {
            console.info('newHall_SensorJsTest018 error:' +error);
            expect(false).assertTrue();
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0190
     * @tc.name: newHall_SensorJsTest019
     * @tc.desc: Use case of illegal parameter passed into off interface
     */
    it("newHall_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(invalid, callback);
        } catch (error) {
            console.info('newHall_SensorJsTest019 error:' +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0200
     * @tc.name: newHall_SensorJsTest020
     * @tc.desc: Unsubscribe directly without waiting after starting subscription
     */
    it("newHall_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newHall_SensorJsTest020 callback in');
            expect(false).assertTrue();
            done();
        }
        sensor.on(sensor.SensorId.HALL, onSensorCallback);
        sensor.off(sensor.SensorId.HALL, onSensorCallback);
        setTimeout(()=>{
            expect(true).assertTrue();
            done();
        }, 500);
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0210
     * @tc.name: newHall_SensorJsTest021
     * @tc.desc:SensorId1000000 of incoming exception
     */
    it("newHall_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newHall_SensorJsTest021 on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newHall_SensorJsTest021 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0220
     * @tc.name: newHall_SensorJsTest022
     * @tc.desc:Call interface multiple times
     */
    it("newHall_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorId.HALL, (data)=>{
            console.info("newHall_SensorJsTest022 callback: " + JSON.stringify(data));
			expect(typeof (data.status)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        });
        sensor.on(sensor.SensorId.HALL, (data)=>{
            console.info("newHall_SensorJsTest022 callback2: " + JSON.stringify(data));
			expect(typeof (data.status)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newHall_SensorJsTest022 off in--------------');
            sensor.off(sensor.SensorId.HALL);
            console.info('---------newHall_SensorJsTest022 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0230
     * @tc.name: newHall_SensorJsTest023
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHall_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        try {
            sensor.off(sensor.SensorId.HALL, 5);
        } catch (error) {
            console.info('newHall_SensorJsTest023 error:'+error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0240
     * @tc.name: newHall_SensorJsTest024
     * @tc.desc:Call on interface and once interface respectively, and use an off interface to close
     */
    it("newHall_SensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHall_SensorJsTest024--------------');
        sensor.on(sensor.SensorId.HALL, (data)=>{
            console.info("newHall_SensorJsTest024 callback: " + JSON.stringify(data));
			expect(typeof (data.status)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.once(sensor.SensorId.HALL, (data)=>{
            console.info("newHall_SensorJsTest024 callback2: " + JSON.stringify(data));
			expect(typeof (data.status)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newHall_SensorJsTest024 off in--------------');
            sensor.off(sensor.SensorId.HALL);
            console.info('---------newHall_SensorJsTest024 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0250
     * @tc.name: newHall_SensorJsTest025
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHall_SensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHall_SensorJsTest025--------------');
        sensor.on(sensor.SensorId.HALL, (data)=>{
            console.info("newHall_SensorJsTest025 callback: " + JSON.stringify(data));
			expect(typeof (data.status)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.on(sensor.SensorId.HALL, (data)=>{
            console.info("newHall_SensorJsTest025 callback2: " + JSON.stringify(data));
			expect(typeof (data.status)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newHall_SensorJsTest025 off in--------------');
            sensor.off(sensor.SensorId.HALL);
            console.info('---------newHall_SensorJsTest025 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_HALL_JSTest_0260
     * @tc.name: newHall_SensorJsTest026
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHall_SensorJsTest026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newHall_SensorJsTest026--------------');
        try {
            sensor.on();
        } catch (error) {
			console.info("newHall_SensorJsTest026 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.once();
        } catch (error) {
			console.info("newHall_SensorJsTest026 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.off();
        } catch (error) {
			console.info("newHall_SensorJsTest026 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0270
     * @tc.name: newHall_SensorJsTest027
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHall_SensorJsTest027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newHall_SensorJsTest027--------------');
        sensor.on(sensor.SensorId.HALL, callback);
        sensor.on(sensor.SensorId.HALL, callback2);
        setTimeout(() => {
            console.info('----------------------newHall_SensorJsTest027 off in--------------');
            try {
			sensor.off(sensor.SensorId.HALL, callback);
			} catch (error) {
            console.info("newHall_SensorJsTest027 error:" + error);
			}
            console.info('----------------------newHall_SensorJsTest027 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newHall_SensorJsTest027 off in--------------');
            sensor.off(sensor.SensorId.HALL, callback2);
            console.info('----------------------newHall_SensorJsTest027 off end--------------');
            done();
        }, 1000);
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_HALL_JSTest_0280
     * @tc.name: newHall_SensorJsTest028
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newHall_SensorJsTest028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newHall_SensorJsTest028--------------');
        sensor.on(sensor.SensorId.HALL, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorId.HALL, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------newHall_SensorJsTest028 off in--------------');
            try {
			sensor.off(sensor.SensorId.HALL, callback);
			} catch (error) {
            console.info("newHall_SensorJsTest028 error:" + error);
			}
            console
            console.info('----------------------newHall_SensorJsTest028 off end--------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------newHall_SensorJsTest028_2 off in--------------');
            sensor.off(sensor.SensorId.HALL, callback2);
            console.info('----------------------newHall_SensorJsTest028_2 off end--------------');
            done();
        }, 1000);
    })
})}
