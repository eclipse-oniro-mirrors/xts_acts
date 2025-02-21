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

export default function SensorJsTest_sensor_36() {
describe("SensorJsTest_sensor_36", function () {
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

    let invild;
    let testNullSensorId = -1;
	const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
	let errMessages = ['ReferenceError: xxx is not defined','ReferenceError: string is not defined','TypeError: is not callable']
	let errMessage
	
    /**
    * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0010
    * @tc.name: GetSingleSensor_JSTest_001
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    */
    it('GetSingleSensor_JSTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_001-------------------------");
        sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
            if (error) {
                console.info('GetSingleSensor_JSTest_001 failed');
                expect(false).assertTrue();
            } else {
                console.info("GetSingleSensor_JSTest_001 " + JSON.stringify(data));
                expect(typeof (data.sensorName)).assertEqual("string");
                expect(typeof (data.vendorName)).assertEqual("string");
                expect(typeof (data.firmwareVersion)).assertEqual("string");
                expect(typeof (data.hardwareVersion)).assertEqual("string");
                expect(typeof (data.sensorId)).assertEqual("number");
                expect(typeof (data.maxRange)).assertEqual("number");
                expect(typeof (data.minSamplePeriod)).assertEqual("number");
                expect(typeof (data.maxSamplePeriod)).assertEqual("number");
                expect(typeof (data.precision)).assertEqual("number");
                expect(typeof (data.power)).assertEqual("number");
                setTimeout(() => {
                    done();
                }, 500)
            }
        })
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0020
     * @tc.name: GetSingleSensor_JSTest_002
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
     it('GetSingleSensor_JSTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_002-------------------------");
        try {
            sensor.getSingleSensor()
        } catch (error) {
            console.info('GetSingleSensor_JSTest_002 error:' + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0030
     * @tc.name: GetSingleSensor_JSTest_003
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
     it('GetSingleSensor_JSTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_003-------------------------");
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info('GetSingleSensor_JSTest_003 failed');
                    expect(false).assertTrue();
                } else {
                    console.info("GetSingleSensor_JSTest_003 " + JSON.stringify(data));
					expect(typeof (data.sensorName)).assertEqual("string");
					expect(typeof (data.vendorName)).assertEqual("string");
					expect(typeof (data.firmwareVersion)).assertEqual("string");
					expect(typeof (data.hardwareVersion)).assertEqual("string");
					expect(typeof (data.sensorId)).assertEqual("number");
					expect(typeof (data.maxRange)).assertEqual("number");
					expect(typeof (data.minSamplePeriod)).assertEqual("number");
					expect(typeof (data.maxSamplePeriod)).assertEqual("number");
					expect(typeof (data.precision)).assertEqual("number");
					expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                    }
                },255)
        } catch (error) {
            console.info('GetSingleSensor_JSTest_003 error:' + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

     /**
     * @tc.number: SUB_SensorsSystem_GetSingleSensor_JSTest_0040
     * @tc.name: GetSingleSensor_JSTest_004
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
      it('GetSingleSensor_JSTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_004-------------------------");
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info('GetSingleSensor_JSTest_004 failed');
                    expect(false).assertTrue();
                } else {
                    console.info("GetSingleSensor_JSTest_004 " + JSON.stringify(data));
					expect(typeof (data.sensorName)).assertEqual("string");
					expect(typeof (data.vendorName)).assertEqual("string");
					expect(typeof (data.firmwareVersion)).assertEqual("string");
					expect(typeof (data.hardwareVersion)).assertEqual("string");
					expect(typeof (data.sensorId)).assertEqual("number");
					expect(typeof (data.maxRange)).assertEqual("number");
					expect(typeof (data.minSamplePeriod)).assertEqual("number");
					expect(typeof (data.maxSamplePeriod)).assertEqual("number");
					expect(typeof (data.precision)).assertEqual("number");
					expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                }
                },invild)
        } catch (error) {
            console.info('GetSingleSensor_JSTest_004 error:' + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

     /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0050
     * @tc.name: GetSingleSensor_JSTest_005
	 * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
      it('GetSingleSensor_JSTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_005-------------------------");
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info('GetSingleSensor_JSTest_005 failed');
                    expect(false).assertTrue();
                } else {
                    console.info("GetSingleSensor_JSTest_005 " + JSON.stringify(data));
                    setTimeout(() => {
                        done();
                    }, 500)
                }
            },testNullSensorId)
        } catch (error) {
            console.info('GetSingleSensor_JSTest_005 error:' + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

     /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0060
     * @tc.name: GetSingleSensor_JSTest_006
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
     it('GetSingleSensor_JSTest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_006-------------------------");
        try {
            sensor.getSingleSensor(xxx)
        } catch (error) {
            console.info('GetSingleSensor_JSTest_006 error:' + error);
            errMessage = error.toString();
            expect(errMessage).assertEqual(errMessages[0]);
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0070
     * @tc.name: GetSingleSensor_JSTest_007
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
     it('GetSingleSensor_JSTest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------GetSingleSensor_JSTest_007-------------------------");
        try {
            sensor.getSingleSensor((error, data) => {
                if (error) {
                    console.info('GetSingleSensor_JSTest_007 failed');
                     expect(false).assertTrue();
                } else {
                    console.info("GetSingleSensor_JSTest_007 " + JSON.stringify(data));
					expect(typeof (data.sensorName)).assertEqual("string");
					expect(typeof (data.vendorName)).assertEqual("string");
					expect(typeof (data.firmwareVersion)).assertEqual("string");
					expect(typeof (data.hardwareVersion)).assertEqual("string");
					expect(typeof (data.sensorId)).assertEqual("number");
					expect(typeof (data.maxRange)).assertEqual("number");
					expect(typeof (data.minSamplePeriod)).assertEqual("number");
					expect(typeof (data.maxSamplePeriod)).assertEqual("number");
					expect(typeof (data.precision)).assertEqual("number");
					expect(typeof (data.power)).assertEqual("number");
                    setTimeout(() => {
                        done();
                    }, 500)
                }})
        } catch (error) {
            console.info('GetSingleSensor_JSTest_007 error:' + error);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })

		/**
		 * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0080
		 * @tc.name: GetSingleSensor_JSTest_008
		 * @tc.desc: Verification results of the incorrect parameters of the test interface.
		 */
	it("GetSingleSensor_JSTest_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		console.info("------------------------GetSingleSensor_JSTest_008------------------");
		try {
			sensor.getSingleSensor(testNullSensorId, (error, data) => {
				if (error) {
					console.info('GetSingleSensor_JSTest_008 error' + error);
				} else {
					console.info("GetSingleSensor_JSTest_008 " + JSON.stringify(data));
					expect(false).assertTrue();
				}
			});
		} catch(error) {
			console.info('GetSingleSensor_JSTest_008_1 error' + error);
			expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
			expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
			done();
		}
	})

		/**
		 * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0090
		 * @tc.name: GetSingleSensor_JSTest_009
		 * @tc.desc: Verification results of the incorrect parameters of the test interface.
		 */
	it("GetSingleSensor_JSTest_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		console.info("-------------------GetSingleSensor_JSTest_009----------------------");
		sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER).then((data) => {
			console.info("GetSingleSensor_JSTest_009 success " + JSON.stringify(data));
			expect(typeof (data.sensorName)).assertEqual("string");
			expect(typeof (data.vendorName)).assertEqual("string");
			expect(typeof (data.firmwareVersion)).assertEqual("string");
			expect(typeof (data.hardwareVersion)).assertEqual("string");
			expect(typeof (data.sensorId)).assertEqual("number");
			expect(typeof (data.maxRange)).assertEqual("number");
			expect(typeof (data.minSamplePeriod)).assertEqual("number");
			expect(typeof (data.maxSamplePeriod)).assertEqual("number");
			expect(typeof (data.precision)).assertEqual("number");
			expect(typeof (data.power)).assertEqual("number");
			done()
		}, (error)=>{
			console.info('GetSingleSensor_JSTest_009 failed');
			expect(false).assertTrue();
		});
	})

		/**
		 * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0100
		 * @tc.name: GetSingleSensor_JSTest_010
		 * @tc.desc: Verification results of the incorrect parameters of the test interface.
		 */
	it("GetSingleSensor_JSTest_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		console.info("----------------GetSingleSensor_JSTest_010-----------------------");
		try {
		sensor.getSingleSensor(testNullSensorId).then((data) => {
			console.info("GetSingleSensor_JSTest_010 success" + JSON.stringify(data));
			expect(false).assertTrue();
		}, (error)=>{
			console.info('GetSingleSensor_JSTest_010 error:' + error);
		});
		} catch(error) {
			console.info('GetSingleSensor_JSTest_010_1 error' + error);
			expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
			expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
			done();
		}
	})

		/**
		 * @tc.number:SUB_SensorsSystem_GetSingleSensor_JSTest_0110
		 * @tc.name: GetSingleSensor_JSTest_011
		 * @tc.desc: Verification results of the incorrect parameters of the test interface.
		 */
	 it("GetSingleSensor_JSTest_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
		console.info("-------------------GetSingleSensor_JSTest_011----------------------");
		try {
			sensor.getSingleSensor(null)
		} catch (error) {
			console.info('GetSingleSensor_JSTest_011 error:' + error);
			expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
			expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
			done();
		}
	})
})}
