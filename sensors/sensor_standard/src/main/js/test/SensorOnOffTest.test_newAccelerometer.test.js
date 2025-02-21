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

export default function SensorJsTest_sensor_39() {
describe("SensorJsTest_sensor_39", function () {
    function callback(data) {
        console.info("callback" + JSON.stringify(data));
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
          } else {
            console.info('callback invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
          }
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('callback2 accuracy verified' + JSON.stringify(data));
            expect(true).assertTrue();
          } else {
            console.info('callback2 invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
          }		
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
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
	let invalid  = -1;
	
	 /*
     * @tc.number: SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0010
     * @tc.name: newAccelerometer_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest001--------------');
         sensor.on(sensor.SensorId.ACCELEROMETER, callback);
        setTimeout(()=>{
             sensor.off(sensor.SensorId.ACCELEROMETER);
             done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0020
     * @tc.name: newAccelerometer_SensorJsTest002
     * @tc.desc: Illegal ID passed in
     */
    it("newAccelerometer_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest002--------------');
        function onSensorCallback(data) {
            console.info('newAccelerometer_SensorJsTest002 callback in');
            expect(false).assertTrue();
        }
        try {
            sensor.on(invalid, onSensorCallback);
        } catch (error) {
            console.info("newAccelerometer_SensorJsTest002 error:" + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0030
     * @tc.name: newAccelerometer_SensorJsTest003
     * @tc.desc: For normal scenarios
     */
    it("newAccelerometer_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest003--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER, callback, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newAccelerometer_SensorJsTest003 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER);
            console.info('---------newAccelerometer_SensorJsTest003 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0040
     * @tc.name: newAccelerometer_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest004--------------');
        function onSensorCallback(data) {
            console.info('newAccelerometer_SensorJsTest004  callback in');
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }
        try {
            sensor.on(sensor.SensorId.ACCELEROMETER, onSensorCallback, {'interval': 100000000}, 5);
        } catch (error) {
            console.info("newAccelerometer_SensorJsTest004 error:" +error);
            expect(false).assertTrue();
            done();
        }
        setTimeout(()=>{
            console.info('---------newAccelerometer_SensorJsTest004 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER);
            console.info('---------newAccelerometer_SensorJsTest004 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0050
     * @tc.name: newAccelerometer_SensorJsTest005
     * @tc.desc: Once Normal Subscription Scenario Use Case
     */
    it("newAccelerometer_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.once(sensor.SensorId.ACCELEROMETER, callback);
        setTimeout(()=>{
            expect(true).assertTrue();
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0060
     * @tc.name: newAccelerometer_SensorJsTest006
     * @tc.desc: Use case of illegal parameter passed into once interface
     */
    it("newAccelerometer_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newAccelerometer_SensorJsTest006 callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(invalid, onceSensorCallback);
        } catch (error) {
            console.info("newAccelerometer_SensorJsTest006 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0070
     * @tc.name: newAccelerometer_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onceSensorCallback(data) {
            console.info('newAccelerometer_SensorJsTest007 in callback');
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
        try{
            sensor.once(sensor.SensorId.ACCELEROMETER, onceSensorCallback, 5);
        } catch (error) {
            console.info('newAccelerometer_SensorJsTest007 error:' +error);
            expect(false).assertTrue();
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0080
     * @tc.name: newAccelerometer_SensorJsTest008
     * @tc.desc: Use case of illegal parameter passed into off interface
     */
    it("newAccelerometer_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(invalid, callback);
        } catch (error) {
            console.info('newAccelerometer_SensorJsTest008 error:' +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0090
     * @tc.name: newAccelerometer_SensorJsTest009
     * @tc.desc: Unsubscribe directly without waiting after starting subscription
     */
    it("newAccelerometer_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newAccelerometer_SensorJsTest009 callback in' + JSON.stringify(data));
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }
        sensor.on(sensor.SensorId.ACCELEROMETER, onSensorCallback);
        setTimeout(()=>{
			sensor.off(sensor.SensorId.ACCELEROMETER, onSensorCallback);
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0100
     * @tc.name: newAccelerometer_SensorJsTest010
     * @tc.desc:SensorId1000000 of incoming exception
     */
    it("newAccelerometer_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        function onSensorCallback(data) {
            console.info('newAccelerometer_SensorJsTest010 on error'  + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info("newAccelerometer_SensorJsTest010 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0110
     * @tc.name: newAccelerometer_SensorJsTest011
     * @tc.desc:Call interface multiple times
     */
    it("newAccelerometer_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
            console.info("newAccelerometer_SensorJsTest011 callback: " + JSON.stringify(data));
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        });
        sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
            console.info("newAccelerometer_SensorJsTest011 callback2: " + JSON.stringify(data));
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newAccelerometer_SensorJsTest011 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER);
            console.info('---------newAccelerometer_SensorJsTest011 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0120
     * @tc.name: newAccelerometer_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        try {
            sensor.off(sensor.SensorId.ACCELEROMETER, 5);
        } catch (error) {
            console.info('newAccelerometer_SensorJsTest025 error:'+error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0130
     * @tc.name: newAccelerometer_SensorJsTest013
     * @tc.desc:Call on interface and once interface respectively, and use an off interface to close
     */
    it("newAccelerometer_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest013--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
            console.info("newAccelerometer_SensorJsTest013 callback: " + JSON.stringify(data));
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.once(sensor.SensorId.ACCELEROMETER, (data)=>{
            console.info("newAccelerometer_SensorJsTest013 callback2: " + JSON.stringify(data));
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        });
        setTimeout(()=>{
            console.info('---------newAccelerometer_SensorJsTest013 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER);
            console.info('---------newAccelerometer_SensorJsTest013 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0140
     * @tc.name: newAccelerometer_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest014--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
            console.info("newAccelerometer_SensorJsTest014 callback: " + JSON.stringify(data));
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        sensor.on(sensor.SensorId.ACCELEROMETER, (data)=>{
            console.info("newAccelerometer_SensorJsTest014 callback2: " + JSON.stringify(data));
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
            expect(typeof (data.x)).assertEqual("number");
			expect(typeof (data.y)).assertEqual("number");
			expect(typeof (data.z)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }, {'interval': 100000000});
        setTimeout(()=>{
            console.info('---------newAccelerometer_SensorJsTest014 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER);
            console.info('---------newAccelerometer_SensorJsTest014 off end--------------');
            done();
        }, 1000);
    })

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0150
     * @tc.name: newAccelerometer_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newAccelerometer_SensorJsTest015--------------');
        try {
            sensor.on();
        } catch (error) {
			console.info("newAccelerometer_SensorJsTest015 on error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.once();
        } catch (error) {
			console.info("newAccelerometer_SensorJsTest015 once error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.off();
        } catch (error) {
			console.info("newAccelerometer_SensorJsTest015 off error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0160
     * @tc.name: newAccelerometer_SensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest016--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER, callback);
        sensor.on(sensor.SensorId.ACCELEROMETER, callback2);
        setTimeout(() => {
            console.info('----------------------newAccelerometer_SensorJsTest016 off in--------------');
            try {
			sensor.off(sensor.SensorId.ACCELEROMETER, callback);
			} catch (error) {
            console.info("newAccelerometer_SensorJsTest016 error:" + error);
			}
            console.info('----------------------newAccelerometer_SensorJsTest016 off end--------------');
        }, 1000);
        setTimeout(() => {
            console.info('----------------------newAccelerometer_SensorJsTest016 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER, callback2);
            console.info('----------------------newAccelerometer_SensorJsTest016 off end--------------');
            done();
        }, 1000);
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0170
     * @tc.name: newAccelerometer_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest017--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': 100000000 });
        sensor.on(sensor.SensorId.ACCELEROMETER, callback2, { 'interval': 100000000 });
        setTimeout(() => {
            console.info('----------------------newAccelerometer_SensorJsTest017 off in--------------');
            try {
			sensor.off(sensor.SensorId.ACCELEROMETER, callback);
			} catch (error) {
            console.info("newAccelerometer_SensorJsTest017 error:" + error);
			}
            console.info('----------------------newAccelerometer_SensorJsTest017 off end--------------');
        }, 1000);
        setTimeout(() => {
            console.info('----------------------newAccelerometer_SensorJsTest017_2 off in--------------');
            sensor.off(sensor.SensorId.ACCELEROMETER, callback2);
            console.info('----------------------newAccelerometer_SensorJsTest017_2 off end--------------');
            done();
        }, 1000);
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0180
     * @tc.name: newAccelerometer_SensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': undefined });
        sensor.on(sensor.SensorId.ACCELEROMETER, callback2, { 'interval': undefined });
        setTimeout(() => {
            console.info('----------------------newAccelerometer_SensorJsTest018 off in--------------');
            try {
			sensor.off(sensor.SensorId.ACCELEROMETER, callback);
			sensor.off(sensor.SensorId.ACCELEROMETER, callback2);
			} catch (error) {
            console.info("newAccelerometer_SensorJsTest018 error:" + error);
			expect(false).assertTrue();
			}
            console.info('----------------------newAccelerometer_SensorJsTest018 off end--------------');
			done()
        }, 1000);
    })
	
	 /*
     * @tc.number: SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0190
     * @tc.name: newAccelerometer_SensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest019--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER, callback, undefined);
        try{
		sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': undefined });
		} catch(error){
			 console.info('newAccelerometer_SensorJsTest019 Repeat subscription'+error);
		}
        setTimeout(() => {
            console.info('----------------------newAccelerometer_SensorJsTest019 off in--------------');
            try {
			sensor.off(sensor.SensorId.ACCELEROMETER);
			} catch (error) {
            console.info("newAccelerometer_SensorJsTest019 error:" + error);
			expect(false).assertTrue();
			}
			done();
        }, 1000);
    })	

	 /*
     * @tc.number: SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0200
     * @tc.name: newAccelerometer_SensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest020--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER, callback, null);
        try{
		sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': null });
		} catch(error){
			 console.info('newAccelerometer_SensorJsTest020 Repeat subscription'+error);
		}
        setTimeout(() => {
            console.info('----------------------newAccelerometer_SensorJsTest020 off in--------------');
            try {
			sensor.off(sensor.SensorId.ACCELEROMETER);
			} catch (error) {
            console.info("newAccelerometer_SensorJsTest020 error:" + error);
			expect(false).assertTrue();
			}
			done();
        }, 1000);
    })		
	
	 /*
     * @tc.number: SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0210
     * @tc.name: newAccelerometer_SensorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("newAccelerometer_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest021--------------');
		sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': null });
        setTimeout(() => {
            console.info('----------------------newAccelerometer_SensorJsTest021 off in--------------');
            try {
			sensor.off(sensor.SensorId.ACCELEROMETER);
			} catch (error) {
            console.info("newAccelerometer_SensorJsTest021 error:" + error);
			expect(false).assertTrue();
			}
			done();			
        }, 500);
    })	

	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0220
     * @tc.name: newAccelerometer_SensorJsTest022
     * @tc.desc: Functional Use Cases
     */
    it("newAccelerometer_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest022--------------');
        try {
		sensor.off(sensor.SensorId.ACCELEROMETER, null);
        setTimeout(() => {
			done();			
        }, 1000);		
		} catch(error){
			console.info('newAccelerometer_SensorJsTest022 error:'+error);
			expect(false).assertTrue();
			done();
		}
    })
	
	/*
     * @tc.number:SUB_SensorsSystem_NEWACCELEROMETER_JSTest_0230
     * @tc.name: newAccelerometer_SensorJsTest023
     * @tc.desc: Functional Use Cases
     */
    it("newAccelerometer_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newAccelerometer_SensorJsTest023--------------');
        sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': 100000000 });
        try{
		sensor.on(sensor.SensorId.ACCELEROMETER, callback, { 'interval': 100000000 });
		} catch(error){
			 console.info("newAccelerometer_SensorJsTest023 catch error:" + error);
		}
        setTimeout(() => {
            console.info('----------------------newAccelerometer_SensorJsTest023 off in--------------');
            try {
			sensor.off(sensor.SensorId.ACCELEROMETER);
			} catch (error) {
            console.info("newAccelerometer_SensorJsTest023 error:" + error);
			expect(false).assertTrue();
			}
            console.info('----------------------newAccelerometer_SensorJsTest023 off end--------------');
			done()
        }, 1000);
    })	
})}
