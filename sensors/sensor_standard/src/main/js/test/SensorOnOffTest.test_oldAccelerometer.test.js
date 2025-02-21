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

export default function SensorJsTest_sensor_3() {
describe("SensorJsTest_sensor_3", function () {
    function callback(data) {
        console.info("old callback" + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("old callback2" + JSON.stringify(data));
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
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let errMessages = ['string is not defined','The parameter invalid'];
    let errMessage;

     /*
     * @tc.number:SUB_SensorsSystem_ACCELEROMETER_JSTest_0010
     * @tc.name: Accelerometer_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest001---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback);
        setTimeout(() => {
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER);
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0020
     * @tc.name: Accelerometer_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest002---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest002 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER);
            console.info('----------------------Accelerometer_SensorJsTest002 off end---------------------------');
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0030
     * @tc.name: Accelerometer_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest003---------------------------');
        function onSensorCallback(data) {
            console.info('Accelerometer_SensorJsTest003  on success');
			expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try {
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, onSensorCallback, { 'interval': 100000000 }, 5);
        } catch (error) {
            console.info("Accelerometer_SensorJsTest003 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0040
     * @tc.name: Accelerometer_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest004---------------------------');
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback);
        setTimeout(() => {
            expect(true).assertTrue();
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0050
     * @tc.name: Accelerometer_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest005---------------------------');
        function onceSensorCallback(data) {
            console.info('Accelerometer_SensorJsTest005  on success');
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try {
            sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, onceSensorCallback, 5);
        } catch (error) {
            console.info("Accelerometer_SensorJsTest005 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0060
     * @tc.name: Accelerometer_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest006---------------------------');
        try {
            sensor.off(string, "");
        } catch (error) {
            console.info("Accelerometer_SensorJsTest006 error:" + error);
            errMessage = error.toString().slice(16, 40);
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

   /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0070
     * @tc.name: Accelerometer_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest007---------------------------');
        function onSensorCallback(data) {
            console.info('Accelerometer_SensorJsTest007 on error');
			expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, onSensorCallback);
        setTimeout(() => {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, onSensorCallback);
            done();
        }, 500);
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0080
     * @tc.name: Accelerometer_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest008---------------------------');
        function onSensorCallback(data) {
            console.info('Accelerometer_SensorJsTest008  on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("Accelerometer_SensorJsTest008 error:" + error);
            errMessage = error.toString().slice(7, 28);
            expect(errMessage).assertEqual(errMessages[1]);
            done();
        }
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0090
     * @tc.name: Accelerometer_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest009---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback2);
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest009 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER);
            console.info('----------------------Accelerometer_SensorJsTest009 off end---------------------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0100
     * @tc.name: Accelerometer_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest010---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback);
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback2);
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest010 off in---------------------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback);
			} catch (error) {
            console.info("Accelerometer_SensorJsTest010 error:" + error);
			}
            console.info('----------------------Accelerometer_SensorJsTest010 off end---------------------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest010 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback2);
            console.info('----------------------Accelerometer_SensorJsTest010 off end---------------------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0110
     * @tc.name: Accelerometer_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest011---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': 100000000 });
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback2);
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest011 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER);
            console.info('----------------------Accelerometer_SensorJsTest011 off end---------------------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0120
     * @tc.name: Accelerometer_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest012---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest012 off in---------------------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback);
			} catch (error) {
            console.info("Accelerometer_SensorJsTest012 error:" + error);
			}
            console.info('----------------------Accelerometer_SensorJsTest012 off end---------------------------');
        }, 500);
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest012 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback2);
            console.info('----------------------Accelerometer_SensorJsTest012 off end---------------------------');
            done();
        }, 1000);
    })

    /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0130
     * @tc.name: Accelerometer_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest013---------------------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest013 off in---------------------------');
            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER);
            console.info('----------------------Accelerometer_SensorJsTest013 off end---------------------------');
            done();
        }, 1000);
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0140
     * @tc.name: Accelerometer_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': undefined });
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback2, { 'interval': undefined });
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest014 off in--------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback);
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback2);
			} catch (error) {
            console.info("Accelerometer_SensorJsTest014 error:" + error);
			expect(false).assertTrue();
			}
            console.info('----------------------Accelerometer_SensorJsTest014 off end--------------');
			done()
        }, 1000);
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0150
     * @tc.name: Accelerometer_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest015--------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, undefined);
        try{
		sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': undefined });
		} catch(error){
			 console.info('Accelerometer_SensorJsTest015 Repeat subscription'+error);
		}
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest015 off in--------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER);
			} catch (error) {
            console.info("Accelerometer_SensorJsTest015 error:" + error);
			expect(false).assertTrue();
			}
			done();
        }, 1000);
    })	

	 /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0160
     * @tc.name: Accelerometer_SensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest016--------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, null);
        try{
		sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': null });
		} catch(error){
			 console.info('Accelerometer_SensorJsTest016 Repeat subscription'+error);
		}
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest016 off in--------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER);
			} catch (error) {
            console.info("Accelerometer_SensorJsTest016 error:" + error);
			expect(false).assertTrue();
			}
			done();
        }, 1000);
    })		
	
	 /*
     * @tc.number: SUB_SensorsSystem_ACCELEROMETER_JSTest_0170
     * @tc.name: Accelerometer_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Accelerometer_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest017--------------');
		sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': null });
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest017 off in--------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER);
			} catch (error) {
            console.info("Accelerometer_SensorJsTest017 error:" + error);
			expect(false).assertTrue();
			}
			done();			
        }, 500);
    })	

	/*
     * @tc.number:SUB_SensorsSystem_ACCELEROMETER_JSTest_0180
     * @tc.name: Accelerometer_SensorJsTest018
     * @tc.desc: Functional Use Cases
     */
    it("Accelerometer_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest018--------------');
        try {
		sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, null);
        setTimeout(() => {
			done();			
        }, 1000);		
		} catch(error){
			console.info('Accelerometer_SensorJsTest018 error:'+error);
			expect(false).assertTrue();
			done();
		}
    })
	
	/*
     * @tc.number:SUB_SensorsSystem_ACCELEROMETER_JSTest_0190
     * @tc.name: Accelerometer_SensorJsTest019
     * @tc.desc: Functional Use Cases
     */
    it("Accelerometer_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Accelerometer_SensorJsTest019--------------');
        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': 100000000 });
        try{
		sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, callback, { 'interval': 100000000 });
		} catch(error){
			 console.info("Accelerometer_SensorJsTest019 catch error:" + error);
		}
        setTimeout(() => {
            console.info('----------------------Accelerometer_SensorJsTest019 off in--------------');
            try {
			sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER);
			} catch (error) {
            console.info("Accelerometer_SensorJsTest019 error:" + error);
			expect(false).assertTrue();
			}
            console.info('----------------------Accelerometer_SensorJsTest019 off end--------------');
			done()
        }, 1000);
    })	
})}
