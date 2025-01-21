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

export default function SensorJsTest_sensor_61(){
describe("SensorJsTest_sensor_61", function () {
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
        expect(typeof(data.lightIntensity)).assertEqual("number");
        expect(typeof(data.colorTemperature)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("callback2" + JSON.stringify(data));
		if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
			sensor.SensorAccuracy.ACCURACY_HIGH) {
			console.info('callback2 accuracy verified' + JSON.stringify(data));
			expect(true).assertTrue();
		} else {
			console.info('callback2 invalid accuracy encountered' + JSON.stringify(data));
			expect(false).assertTrue();
		}		
        expect(typeof(data.lightIntensity)).assertEqual("number");
        expect(typeof(data.colorTemperature)).assertEqual("number");
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
	let TAG  = '';	
	
	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0010
    * @tc.name: newColor_SensorJsTest001
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('---------newColor_SensorJsTest001--------------');
		TAG = 'newColor_SensorJsTest001'
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG +' error:' + error);
				} else {
					expect(typeof(data)).assertEqual("object");
					sensor.on(sensor.SensorId.COLOR, callback);
						setTimeout(()=>{
							sensor.off(sensor.SensorId.COLOR);
							done();
						}, 500);
				}
			})
		} catch (error) {
            console.info(TAG + ' Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
	
	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0020
    * @tc.name: newColor_SensorJsTest002
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newColor_SensorJsTest002--------------');
		TAG = 'newColor_SensorJsTest002'		
        function onSensorCallback(data) {
            console.info(TAG + ' callback in');
            expect(false).assertTrue();
        }
        try {
            sensor.on(invalid, onSensorCallback);
        } catch (error) {
            console.info(TAG + ' illegal parameter!');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0030
    * @tc.name: newColor_SensorJsTest003
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newColor_SensorJsTest003--------------');
		TAG = 'newColor_SensorJsTest003 '			
        try {
            sensor.off(sensor.SensorId.COLOR, 5);
        } catch (error) {
            console.info(TAG + 'illegal parameter!');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0040
    * @tc.name: newColor_SensorJsTest004
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newColor_SensorJsTest004--------------');
		TAG = 'newColor_SensorJsTest004 '		
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error:' + error);
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");        
					sensor.on(sensor.SensorId.COLOR, callback, {'interval': 100000000});
					setTimeout(()=>{
						console.info('---------newColor_SensorJsTest004 off in--------------');
						sensor.off(sensor.SensorId.COLOR);
						console.info('---------newColor_SensorJsTest004 off end--------------');
						done();
					}, 500);
				}
			})
		} catch (error) {
            console.info(TAG + ' Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0050
    * @tc.name: newColor_SensorJsTest005
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('---------newColor_SensorJsTest005--------------');
		TAG = 'newColor_SensorJsTest005 '		
        function onSensorCallback(data) {
            console.info(TAG + 'callback in,data:' + data);
			expect(typeof(data.lightIntensity)).assertEqual("number");
			expect(typeof(data.colorTemperature)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error');
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");
					sensor.on(sensor.SensorId.COLOR, onSensorCallback, {'interval': 100000000}, 5);
					setTimeout(()=>{
						console.info('---------newColor_SensorJsTest005 off in--------------');
						sensor.off(sensor.SensorId.COLOR);
						console.info('---------newColor_SensorJsTest005 off end--------------');
						done();
					}, 500);	
				}		
			})
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }			
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0060
    * @tc.name: newColor_SensorJsTest006
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest006 '		
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error:' + error);
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");		
					sensor.once(sensor.SensorId.COLOR, callback);
					setTimeout(()=>{
						expect(true).assertTrue();
						done();
					}, 500);
				}
			})
        } catch (error) {
            console.info(TAG + ' Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }				
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0070
    * @tc.name: newColor_SensorJsTest007
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest007 '		
        function onceSensorCallback(data) {
            console.info(TAG + 'callback in');
            expect(false).assertTrue();
            done();
        }
        try {
            sensor.once(invalid, onceSensorCallback);
        } catch (error) {
            console.info(TAG + ' illegal parameter!');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0080
    * @tc.name: newColor_SensorJsTest008
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest008 '		
        function onceSensorCallback(data) {
            console.info(TAG + 'callback in');
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
			expect(typeof(data.lightIntensity)).assertEqual("number");
			expect(typeof(data.colorTemperature)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
            done();
        }
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error');
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");	
					sensor.once(sensor.SensorId.COLOR, onceSensorCallback, 5);
				}
			})
	    } catch (error) {
            console.info(TAG + "error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0090
    * @tc.name: newColor_SensorJsTest009
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest009'		
        try {
            sensor.off(invalid, callback);
        } catch (error) {
            console.info(TAG + ' illegal parameter!');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0100
    * @tc.name: newColor_SensorJsTest010
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest010 '		
        function onSensorCallback(data) {
            console.info(TAG + 'callback in');
			if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
				sensor.SensorAccuracy.ACCURACY_HIGH) {
				console.info('callback accuracy verified' + JSON.stringify(data));
				expect(true).assertTrue();
			} else {
				console.info('callback invalid accuracy encountered' + JSON.stringify(data));
				expect(false).assertTrue();
			}			
			expect(typeof(data.lightIntensity)).assertEqual("number");
			expect(typeof(data.colorTemperature)).assertEqual("number");
			expect(typeof (data.timestamp)).assertEqual("number");
        }
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error:'+error);
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");			
					sensor.on(sensor.SensorId.COLOR, onSensorCallback);
					setTimeout(()=>{
						sensor.off(sensor.SensorId.COLOR, onSensorCallback);
						done();
					}, 500);
				}
			})
		} catch (error) {
            console.info("newColor_SensorJsTest010 error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0110
    * @tc.name: newColor_SensorJsTest011
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest011'		
        function onSensorCallback(data) {
            console.info(TAG + 'on error');
            expect(false).assertTrue();
        }
        try {
            sensor.off(1000000, onSensorCallback);
        } catch (error) {
            console.info(TAG + "error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0120
    * @tc.name: newColor_SensorJsTest012
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest012 '		
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error:' + error);
					expect(false).assertTrue();
				} else {   
					expect(typeof(data)).assertEqual("object");				
					sensor.on(sensor.SensorId.COLOR, (data)=>{
						console.info(TAG + "callback: " + JSON.stringify(data));
						if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
							sensor.SensorAccuracy.ACCURACY_HIGH) {
							console.info('callback accuracy verified' + JSON.stringify(data));
							expect(true).assertTrue();
						} else {
							console.info('callback invalid accuracy encountered' + JSON.stringify(data));
							expect(false).assertTrue();
						}						
						expect(typeof(data.lightIntensity)).assertEqual("number");
						expect(typeof(data.colorTemperature)).assertEqual("number");
						expect(typeof (data.timestamp)).assertEqual("number");
					});
					sensor.on(sensor.SensorId.COLOR, (data)=>{
						console.info(TAG + "callback2: " + JSON.stringify(data));
						if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
							sensor.SensorAccuracy.ACCURACY_HIGH) {
							console.info('callback accuracy verified' + JSON.stringify(data));
							expect(true).assertTrue();
						} else {
							console.info('callback invalid accuracy encountered' + JSON.stringify(data));
							expect(false).assertTrue();
						}						
						expect(typeof(data.lightIntensity)).assertEqual("number");
						expect(typeof(data.colorTemperature)).assertEqual("number");
						expect(typeof (data.timestamp)).assertEqual("number");
					});
					setTimeout(()=>{
						console.info('---------newColor_SensorJsTest012 off in--------------');
						sensor.off(sensor.SensorId.COLOR);
						console.info('---------newColor_SensorJsTest012 off end--------------');
						done();
					}, 1000);
				}
			})
		} catch (error) {
            console.info(TAG + "Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0130
    * @tc.name: newColor_SensorJsTest013
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		TAG = 'newColor_SensorJsTest013 '		
        console.info('---------newColor_SensorJsTest013--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error:' + error);
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");
					sensor.on(sensor.SensorId.COLOR, callback, { 'interval': undefined });
					sensor.on(sensor.SensorId.COLOR, callback2, { 'interval': undefined });
					setTimeout(() => {
						console.info('----------------------newColor_SensorJsTest013 off in--------------');
						try {
						sensor.off(sensor.SensorId.COLOR, callback);
						sensor.off(sensor.SensorId.COLOR, callback2);
						} catch (error) {
						console.info("newColor_SensorJsTest013 error:" + error);
						expect(false).assertTrue();
						}
						console.info('----------------------newColor_SensorJsTest013 off end--------------');
						done()
					}, 1000);
				}
			})
		} catch (error) {
            console.info(TAG + 'Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })	
	
	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0140
    * @tc.name: newColor_SensorJsTest014
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest014 '		
        console.info('---------newColor_SensorJsTest014--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error');
					expect(false).assertTrue();
				} else {  	
					expect(typeof(data)).assertEqual("object");
					sensor.on(sensor.SensorId.COLOR, (data)=>{
						console.info(TAG + "callback: " + JSON.stringify(data));
						if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
							sensor.SensorAccuracy.ACCURACY_HIGH) {
							console.info('callback accuracy verified' + JSON.stringify(data));
							expect(true).assertTrue();
						} else {
							console.info('callback invalid accuracy encountered' + JSON.stringify(data));
							expect(false).assertTrue();
						}						
						expect(typeof(data.lightIntensity)).assertEqual("number");
						expect(typeof(data.colorTemperature)).assertEqual("number");
						expect(typeof (data.timestamp)).assertEqual("number");
					}, {'interval': 100000000});
					sensor.once(sensor.SensorId.COLOR, (data)=>{
						console.info(TAG + "callback2: " + JSON.stringify(data));
						if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
							sensor.SensorAccuracy.ACCURACY_HIGH) {
							console.info('callback accuracy verified' + JSON.stringify(data));
							expect(true).assertTrue();
						} else {
							console.info('callback invalid accuracy encountered' + JSON.stringify(data));
							expect(false).assertTrue();
						}						
						expect(typeof(data.lightIntensity)).assertEqual("number");
						expect(typeof(data.colorTemperature)).assertEqual("number");
						expect(typeof (data.timestamp)).assertEqual("number");
					});
					setTimeout(()=>{
						console.info('---------newColor_SensorJsTest014 off in--------------');
						sensor.off(sensor.SensorId.COLOR);
						console.info('---------newColor_SensorJsTest014 off end--------------');
						done();
					}, 1000);
				}
			})
		} catch (error) {
            console.info(TAG + "Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }	
	})		

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0150
    * @tc.name: newColor_SensorJsTest015
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest015 '		
        console.info('---------newColor_SensorJsTest015--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error:' + error);
					expect(false).assertTrue();
				} else { 
					expect(typeof(data)).assertEqual("object");
					sensor.on(sensor.SensorId.COLOR, (data)=>{
						console.info(TAG + "callback: " + JSON.stringify(data));
						if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
							sensor.SensorAccuracy.ACCURACY_HIGH) {
							console.info('callback accuracy verified' + JSON.stringify(data));
							expect(true).assertTrue();
						} else {
							console.info('callback invalid accuracy encountered' + JSON.stringify(data));
							expect(false).assertTrue();
						}						
						expect(typeof(data.lightIntensity)).assertEqual("number");
						expect(typeof(data.colorTemperature)).assertEqual("number");
						expect(typeof (data.timestamp)).assertEqual("number");
					}, {'interval': 100000000});
					sensor.on(sensor.SensorId.COLOR, (data)=>{
						console.info(TAG + "callback2: " + JSON.stringify(data));
						if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
							sensor.SensorAccuracy.ACCURACY_HIGH) {
							console.info('callback accuracy verified' + JSON.stringify(data));
							expect(true).assertTrue();
						} else {
							console.info('callback invalid accuracy encountered' + JSON.stringify(data));
							expect(false).assertTrue();
						}						
						expect(typeof(data.lightIntensity)).assertEqual("number");
						expect(typeof(data.colorTemperature)).assertEqual("number");
						expect(typeof (data.timestamp)).assertEqual("number");
					}, {'interval': 100000000});
					setTimeout(()=>{
						console.info('---------newColor_SensorJsTest015 off in--------------');
						sensor.off(sensor.SensorId.COLOR);
						console.info('---------newColor_SensorJsTest015 off end--------------');
						done();
					}, 1000);
				}
		})
	} catch (error) {
        console.info(TAG + "Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
	})	

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0160
    * @tc.name: newColor_SensorJsTest016
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest016 '		
        console.info('---------newColor_SensorJsTest016--------------');
        try {
            sensor.on();
        } catch (error) {
			console.info(TAG + "error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.once();
        } catch (error) {
			console.info(TAG + "once error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
        try {
            sensor.off();
        } catch (error) {
			console.info(TAG + "off error:" +error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
	
	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0170
    * @tc.name: newColor_SensorJsTest017
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest017'		
        console.info('----------------------newColor_SensorJsTest017--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + "error:" +error);
					expect(false).assertTrue();
				} else { 
					expect(typeof(data)).assertEqual("object");
					sensor.on(sensor.SensorId.COLOR, callback);
					sensor.on(sensor.SensorId.COLOR, callback2);
					setTimeout(() => {
						console.info('----------------------newColor_SensorJsTest017 off in--------------');
						try {
						sensor.off(sensor.SensorId.COLOR, callback);
						} catch (error) {
							console.info(TAG + "catch error:" +error);
						}
						console.info('----------------------newColor_SensorJsTest017 off end--------------');
					}, 500);
					setTimeout(() => {
						console.info('----------------------newColor_SensorJsTest017 off in--------------');
						sensor.off(sensor.SensorId.COLOR, callback2);
						console.info('----------------------newColor_SensorJsTest017 off end--------------');
						done();
					}, 1000);
				}
			})
	} catch (error) {
        console.info(TAG + "Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
	})
	
	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0180
    * @tc.name: newColor_SensorJsTest018
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest018'		
        console.info('----------------------newColor_SensorJsTest018--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + "error:" +error);
					expect(false).assertTrue();
				} else { 
					expect(typeof(data)).assertEqual("object");
					sensor.on(sensor.SensorId.COLOR, callback, { 'interval': 100000000 });
					sensor.on(sensor.SensorId.COLOR, callback2, { 'interval': 100000000 });
					setTimeout(() => {
						console.info('----------------------newColor_SensorJsTest018 off in--------------');
						try {
						sensor.off(sensor.SensorId.COLOR, callback);
						} catch (error) {
							console.info(TAG + "catch error:" +error);
						}
						console.info('----------------------newColor_SensorJsTest018 off end--------------');
					}, 500);
					setTimeout(() => {
						console.info('----------------------newColor_SensorJsTest018_2 off in--------------');
						sensor.off(sensor.SensorId.COLOR, callback2);
						console.info('----------------------newColor_SensorJsTest018_2 off end--------------');
						done();
					}, 1000);
				}
			})
	} catch (error) {
        console.info(TAG + "Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
	})
	
	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0190
    * @tc.name: newColor_SensorJsTest019
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest019 '		
        console.info('----------------------newColor_SensorJsTest019--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error：'+ error);
					expect(false).assertTrue();
				} else { 
					expect(typeof(data)).assertEqual("object");
					console.info('----------------------newColor_SensorJsTest019 off in--------------');
					try{
						sensor.off(-1, callback);
						console.info('----------------------newColor_SensorJsTest019 off end--------------');
					} catch (error) {
						console.info(TAG + "catch error:" + error);
						expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
						expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
						done();
					}
				}
			})
	} catch (error) {
        console.info(TAG + "Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
	})
	
	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0200
    * @tc.name: newColor_SensorJsTest020
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest020'		
        console.info('----------------------newColor_SensorJsTest020--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error：'+ error);
					expect(false).assertTrue();
				} else { 
					try {
						sensor.on(sensor.SensorId.COLOR, callback, {'interval': -100000000});
						console.info('----------------------newColor_SensorJsTest020 off in---------------------------');
						sensor.off(sensor.SensorId.COLOR);
						console.info('----------------------newColor_SensorJsTest020 off end---------------------------');
						done();
					} catch (error) {
						console.info(TAG + 'On fail, errCode:' + error.code + ' ,msg:' + error.message);
						expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
						expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
						done();
					}
				}
			})
	} catch (error) {
        console.info(TAG + "Device does not support! ");
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
        done();
    }
	})
	
	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0210
    * @tc.name: newColor_SensorJsTest021
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
		TAG = 'newColor_SensorJsTest021 '		
        console.info('---------newColor_SensorJsTest021--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				sensor.on(sensor.SensorId.COLOR, callback);
				setTimeout(()=>{
					sensor.off(sensor.SensorId.COLOR);
					done();
				}, 500);
			})
		} catch (error) {
            console.info(TAG + 'Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0220
    * @tc.name: newColor_SensorJsTest022
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest022'		
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error：' + error);
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");        
					sensor.on(sensor.SensorId.COLOR, callback, undefined);
					try{
					sensor.on(sensor.SensorId.COLOR, callback, { 'interval': undefined });
					} catch(error){
						console.info(TAG + 'Repeat subscription' + error);
					}
					setTimeout(() => {
						console.info('----------------------newColor_SensorJsTest022 off in--------------');
						try {
						sensor.off(sensor.SensorId.COLOR);
						} catch (error) {
							console.info(TAG + 'catch error：' + error);
						expect(false).assertTrue();
						}
						done();
					}, 1000);
				}
			})
		} catch (error) {
            console.info(TAG + 'Device does not support! ');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0230
    * @tc.name: newColor_SensorJsTest023
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest023 '		
        console.info('---------newColor_SensorJsTest023--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error：'+ error);
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");        
					sensor.on(sensor.SensorId.COLOR, callback, null);
					try{
						sensor.on(sensor.SensorId.COLOR, callback, { 'interval': null });
						} catch(error){
							console.info(TAG + 'Repeat subscription'+error);
						}
					setTimeout(() => {
						console.info('----------------------newColor_SensorJsTest023 off in--------------');
						try {
							sensor.off(sensor.SensorId.COLOR);
							} catch (error) {
								console.info(TAG + 'catch error：' + error);
							expect(false).assertTrue();
							}
							done();
					}, 1000);
				}
			})
		} catch (error) {
            console.info(TAG + "Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0240
    * @tc.name: newColor_SensorJsTest024
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest024'		
        console.info('---------newColor_SensorJsTest024--------------');
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error：'+ error);
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");
					sensor.on(sensor.SensorId.COLOR, callback, { 'interval': null });
					setTimeout(() => {
						console.info('----------------------newColor_SensorJsTest024 off in--------------');
						try {
						sensor.off(sensor.SensorId.COLOR);
						} catch (error) {
							console.info(TAG + 'catch error：' + error);
							expect(false).assertTrue();
						}
						done();			
					}, 500);
				}		
			})
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }			
    })

	/*
    * @tc.number:SUB_SensorsSystem_NEWCOLOR_JsTest_0250
    * @tc.name: newColor_SensorJsTest025
    * @tc.desc: Functional Use Cases
    */
    it("newColor_SensorJsTest025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		TAG = 'newColor_SensorJsTest025'		
		try{
		   sensor.getSingleSensor(sensor.SensorId.COLOR,(error, data) => {
				if (error) {
					console.info(TAG + 'error：'+ error);
					expect(false).assertTrue();
				} else {
					expect(typeof(data)).assertEqual("object");		
					sensor.on(sensor.SensorId.COLOR, callback, { 'interval': 100000000 });
					try{
						sensor.on(sensor.SensorId.COLOR, callback, { 'interval': 100000000 });
						} catch(error){
							console.info(TAG + 'catch error：' + error);
						}
					setTimeout(() => {
						console.info('----------------------newColor_SensorJsTest025 off in--------------');
						try {
							sensor.off(sensor.SensorId.COLOR);
							} catch (error) {
						console.info(TAG + " catch error:" + error);
							expect(false).assertTrue();
							}
						console.info('----------------------newColor_SensorJsTest025 off end--------------');
							done()
					}, 1000);
				}
			})
        } catch (error) {
            console.info(TAG + "Device does not support! ");
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }				
    })	
})}
