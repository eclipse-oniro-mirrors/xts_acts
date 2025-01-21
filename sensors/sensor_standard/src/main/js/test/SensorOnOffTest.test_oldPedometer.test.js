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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundle from '@ohos.bundle'
import osAccount from '@ohos.account.osAccount'
import sensor from '@ohos.sensor'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_18() {
let PermissionFlag = {
    PERMISSION_USER_SET:1,
    PERMISSION_USER_FIXED:2,
    PERMISSION_SYSTEM_FIXED:4
}

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const PERMISSION_DENIED_MSG = 'Permission denied.'
let tokenID = undefined
let permissionNameUser = 'ohos.permission.ACTIVITY_MOTION'
async function grantPerm(){
    try {
        let accountManager = osAccount.getAccountManager();
        let userId = await accountManager.getOsAccountLocalIdFromProcess();
        console.info("SensorJsTest_sensor_18 userId:"+userId)
        console.info("============SensorJsTest_sensor_18 grant Permission start ============")
        var appInfo = await bundle.getApplicationInfo('ohos.acts.sensors.sensor.function', 0, userId);
        tokenID = appInfo.accessTokenId;
        console.log('SensorJsTest_sensor_18 accessTokenId:' + appInfo.accessTokenId + ', name:' + appInfo.name +
        ' ,bundleName:' + appInfo.process)
        var atManager = abilityAccessCtrl.createAtManager();
        var result = await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
        console.info('SensorJsTest_sensor_18 successful. result: ' + JSON.stringify(result));
        console.info("============SensorJsTest_sensor_18 grant Permission end ============")
    } catch(error) {
        console.error('SensorJsTest_sensor_18 exception in, msg:' + JSON.stringify(error))
    }
}		
describe("SensorJsTest_sensor_18", function () {
    function callback(data) {
        console.info("SensorJsTest_sensor_18 callback" + JSON.stringify(data));
		expect(typeof (data.steps)).assertEqual("number");
		expect(typeof (data.timestamp)).assertEqual("number");
    }

    function callback2(data) {
        console.info("SensorJsTest_sensor_18 callback2" + JSON.stringify(data));
		expect(typeof (data.steps)).assertEqual("number");
		expect(typeof (data.timestamp)).assertEqual("number");
    }
	
    beforeAll(async function(done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
        await grantPerm();
        done();
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
        let atManager = abilityAccessCtrl.createAtManager();
        atManager.revokeUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
            .catch((error) => {
                console.info('SensorJsTest_sensor_18 error:' + JSON.stringify(error));
                expect(error.code).assertEqual(ERR_NOT_HAVE_PERMISSION);
            })			
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
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
	let invalid  = -1;
	let errMessages = ['ReferenceError: string is not defined','TypeError: is not callable','ReferenceError: xxx is not defined']
	let errMessage
	
     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0010
     * @tc.name: Pedometer_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest001---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest001 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest001 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest001 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0020
     * @tc.name: Pedometer_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest002---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest002 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, 5);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest002 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest002 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0030
     * @tc.name: Pedometer_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest003---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest003 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest003 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest003 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0040
     * @tc.name: Pedometer_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest004---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest004 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, 5);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest004 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest004 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0050
     * @tc.name: Pedometer_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest005---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest005 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, 5);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest005 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest005 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0060
     * @tc.name: Pedometer_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest006---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest006 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.off(-1, callback);
                    } catch (error) {
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest006 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0070
     * @tc.name: Pedometer_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest007---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest007 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest007 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest007 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0080
     * @tc.name: Pedometer_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest008---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest008 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest008 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest008 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0090
     * @tc.name: Pedometer_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest009---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest009 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest009 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest009 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0100
     * @tc.name: Pedometer_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                if (error) {
                    console.error('Pedometer_SensorJsTest010 getSingleSensor fail:' +JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                }
                try {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                    setTimeout(() => {
                        done();
                    }, 4000);
                } catch (error) {
                    console.error('Pedometer_SensorJsTest010 On fail, errorCode:' +JSON.stringify(error));
                    expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                    expect(error.message).assertEqual(PERMISSION_DENIED_MSG);
                    done();
                }
            });
        } catch (error) {
            console.error('Pedometer_SensorJsTest010 Sensor is not support');
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
            done();
        }
    })
	
	/*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0110
     * @tc.name: Pedometer_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------Pedometer_SensorJsTest011--------');
		let errorMessage = ""
		let errorMessages = "ReferenceError: xxx is not defined"
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest011 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {       
						function onSensorCallback(data) {
							console.info('Pedometer_SensorJsTest011  on error');
							expect(typeof (data.steps)).assertEqual("number");
						}
						try {
							xxx.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, onSensorCallback);
						} catch (error) {
							console.info("Pedometer_SensorJsTest011 error:" + error);
							errorMessage = error.toString();
							expect(errorMessage).assertEqual(errorMessages);
							done();
						}
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest011 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest011 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0120
     * @tc.name: Pedometer_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------Pedometer_SensorJsTest012--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest012 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest012 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest012 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
        })
	
     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0130
     * @tc.name: Pedometer_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------Pedometer_SensorJsTest013--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest013 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, {'interval': 100000000}, 5);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest013 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest013 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })
	
     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0140
     * @tc.name: Pedometer_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------Pedometer_SensorJsTest014--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest014 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
						function onSensorCallback(data) {
							console.info('Pedometer_SensorJsTest014 callback:'+JSON.stringify(data));
							expect(typeof(data.steps)).assertEqual('number');
						}						
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, onSensorCallback, {'interval': 100000000});
						setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest014 On fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest014 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })		
	
     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0150
     * @tc.name: Pedometer_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
     it("Pedometer_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest015---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest015 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER,5);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest015 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest015 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0160
     * @tc.name: Pedometer_SensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------Pedometer_SensorJsTest016--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest016 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
						sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (data)=>{
							console.info("Pedometer_SensorJsTest016 callback: " + JSON.stringify(data));
							expect(typeof(data.steps)).assertEqual('number');
							expect(typeof (data.timestamp)).assertEqual("number");
						}, {'interval': 100000000});
						sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (data)=>{
							console.info("Pedometer_SensorJsTest016 callback2: " + JSON.stringify(data));
							expect(typeof(data.steps)).assertEqual('number');
							expect(typeof (data.timestamp)).assertEqual("number");
						});
						setTimeout(()=>{
							sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
							done();
						}, 4000);						
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest016 Off fail, errorCode:' +JSON.stringify(error));
						expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
						expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
						done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest016 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })	

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0170
     * @tc.name: Pedometer_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------Pedometer_SensorJsTest017--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest017 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
						sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (data)=>{
							console.info("Pedometer_SensorJsTest017 callback: " + JSON.stringify(data));
							expect(typeof(data.steps)).assertEqual('number');
							expect(typeof (data.timestamp)).assertEqual("number");
						}, {'interval': -100000000});					
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest017 On fail, errorCode:' +JSON.stringify(error));
						expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
						expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
						done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest017 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_JSTest_0180
     * @tc.name: Pedometer_SensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest018---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest018 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, { 'interval': undefined });
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest018 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest018 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0190
     * @tc.name: Pedometer_SensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest019---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest019 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, { 'interval': undefined });
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2, { 'interval': undefined });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest019 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest019 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0200
     * @tc.name: Pedometer_SensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest020---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest020 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, { 'interval': null });
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2, { 'interval': null });
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest020 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest020 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0210
     * @tc.name: Pedometer_SensorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------Pedometer_SensorJsTest021---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest021 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        try{
						sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback, undefined);
						} catch(error){
							console.info('Pedometer_SensorJsTest021 Repeat subscription'+error);
						}
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest021 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest021 Sensor is not support');
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_JSTest_0220
     * @tc.name: Pedometer_SensorJsTest022
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     */
    it("Pedometer_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('Pedometer_SensorJsTest022 getSingleSensor fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    try {
						sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, callback);
                        setTimeout(() => {
							sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER, null);							
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('Pedometer_SensorJsTest022 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.error('Pedometer_SensorJsTest022 Sensor is not support'+error);
                expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                done();
            }
    })
})}
