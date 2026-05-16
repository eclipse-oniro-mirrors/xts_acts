/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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
import { UiDriver, BY } from '@ohos.UiTest'
import featureAbility from '@ohos.ability.featureAbility';

export default function SensorJsTest_sensor_56() {
let PermissionFlag = {
    PERMISSION_USER_SET:1,
    PERMISSION_USER_FIXED:2,
    PERMISSION_SYSTEM_FIXED:4
}

const PERMISSION_DENIED_CODE = 201
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
const PERMISSION_DENIED_MSG = 'Permission denied.'
let tokenID = undefined
let permissionNameUser = 'ohos.permission.ACTIVITY_MOTION'
async function grantPerm(){
    try {
        let accountManager = osAccount.getAccountManager();
        let userId = await accountManager.getOsAccountLocalIdFromProcess();
        console.info("SensorJsTest_sensor_56 userId:"+userId)
        console.info("============SensorJsTest_sensor_56 grant Permission start ============")
        var appInfo = await bundle.getApplicationInfo('ohos.acts.sensors.sensor.function', 0, userId);
        tokenID = appInfo.accessTokenId;
        console.log('SensorJsTest_sensor_56 accessTokenId:' + appInfo.accessTokenId + ', name:' + appInfo.name +
        ' ,bundleName:' + appInfo.process)
        var atManager = abilityAccessCtrl.createAtManager();
        var result = await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
        console.info('SensorJsTest_sensor_56 successful. result: ' + JSON.stringify(result));
        console.info("============SensorJsTest_sensor_56 grant Permission end ============")
    } catch(error) {
        console.error('SensorJsTest_sensor_56 exception in, msg:' + JSON.stringify(error))
    }
}
async function requestPermission() {
    try {
        console.info(`====>sensors getPermission is start`);
        let context = featureAbility.getContext();
        await context.requestPermissionsFromUser(['ohos.permission.ACTIVITY_MOTION'], 0, (data) => {
            console.info("====>sensors requestPermission success data: " + JSON.stringify(data));
        });
    } catch (err) {
        console.error('====>sensors requestPermissionsFromUser fail:' + JSON.stringify(err));
    }
}

async function driveFn() {
    try {
        let driver = await UiDriver.create();
        console.info(`====>sensors test come in driveFn`);
        console.info(`====>sensors test driver is ${JSON.stringify(driver)}`);
        let button = await driver.findComponent(BY.text('允许'));
        console.info(`====>button is ${JSON.stringify(button)}`);
        await button.click();
        await driver.delayMs(1000);
    } catch (err) {
        console.info('====>sensors motion test err code is ' + err);
        return;
    }
}
describe("SensorJsTest_sensor_56", function () {
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
        expect(typeof (data.steps)).assertEqual("number");
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
        expect(typeof (data.steps)).assertEqual("number");
    }

    beforeAll(async function(done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
        await requestPermission();
        console.info('====>sensors requestPermission success');
        await driveFn();
        console.info('====>sensors driveFn success');
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
                console.info('SensorJsTest_sensor_56 error:' + JSON.stringify(error));
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

    /**
     * @tc.name   newPedometer_SensorJsTest001
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0010
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("newPedometer_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest001---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest001 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest001 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest002
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0020
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest002---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest002 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, 5);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest002 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest003
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0030
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest003---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest003 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER, callback);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest003 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest004
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0040
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest004---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest004 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER, callback, 5);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest004 Once fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest005
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0050
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest005---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest005 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorId.PEDOMETER, 5);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest005 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest006
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0060
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest006---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest006 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.off(-1, callback);
                    } catch (error) {
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest007
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0070
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest007---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest007 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else{
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        sensor.on(sensor.SensorId.PEDOMETER, callback2);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest007 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest008
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0080
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest008---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest008 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        sensor.on(sensor.SensorId.PEDOMETER, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest008 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest009
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0090
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest009---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest009 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        sensor.once(sensor.SensorId.PEDOMETER, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest009 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest010
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0100
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                if (error) {
                    console.error('newPedometer_SensorJsTest010 getSingleSensor fail:' +JSON.stringify(error));
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.PEDOMETER, callback);
                    setTimeout(() => {
                        done();
                    }, 4000);
                } catch (error) {
                    console.error('newPedometer_SensorJsTest010 On fail, errorCode:' +JSON.stringify(error));
                    expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                    expect(error.message).assertEqual(PERMISSION_DENIED_MSG);
                    done();
                }
                }
            });
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest011
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0110
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometer_SensorJsTest011--------');
        let errorMessage = ""
        let errorMessages = "ReferenceError: xxx is not defined"
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest011 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('newPedometer_SensorJsTest011  on error');
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof (data.steps)).assertEqual("number");
                        }
                        try {
                            xxx.on(sensor.SensorId.PEDOMETER, onSensorCallback);
                        } catch (error) {
                            console.info("newPedometer_SensorJsTest011 error:" + error);
                            errorMessage = error.toString();
                            expect(errorMessage).assertEqual(errorMessages);
                            done();
                        }
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest011 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest012
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0120
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometer_SensorJsTest012--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest012 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest012 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
        })

    /**
     * @tc.name   newPedometer_SensorJsTest013
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0130
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometer_SensorJsTest013--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest013 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, {'interval': 100000000}, 5);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest013 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest014
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0140
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometer_SensorJsTest014--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest014 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('newPedometer_SensorJsTest014 callback:'+JSON.stringify(data));
                            expect(typeof(data.steps)).assertEqual('number');
                        }
                        sensor.on(sensor.SensorId.PEDOMETER, onSensorCallback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest014 On fail:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

     /**
      * @tc.name   newPedometer_SensorJsTest015
      * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0150
      * @tc.desc   Verification results of the incorrect parameters of the test interface
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
     it("newPedometer_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest015---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest015 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.off(sensor.SensorId.PEDOMETER,5);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest015 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest016
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0160
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometer_SensorJsTest016--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest016 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, (data)=>{
                            console.info("newPedometer_SensorJsTest016 callback: " + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof(data.steps)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': 100000000});
                        sensor.on(sensor.SensorId.PEDOMETER, (data)=>{
                            console.info("newPedometer_SensorJsTest016 callback2: " + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof(data.steps)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest016 Off fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest017
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0170
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------newPedometer_SensorJsTest017--------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest017 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, (data)=>{
                            console.info("newPedometer_SensorJsTest017 callback: " + JSON.stringify(data));
                            if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
                                sensor.SensorAccuracy.ACCURACY_HIGH) {
                                console.info('callback accuracy verified' + JSON.stringify(data));
                                expect(true).assertTrue();
                            } else {
                                console.info('callback invalid accuracy encountered' + JSON.stringify(data));
                                expect(false).assertTrue();
                            }
                            expect(typeof(data.steps)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': -100000000});
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest017 On fail, errorCode:' +JSON.stringify(error));
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        expect(error.message).assertEqual(SERVICE_EXCEPTION_MSG);
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest018
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0180
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest018---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest018 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, { 'interval': undefined });
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest018 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest019
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0190
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest019---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest019 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, { 'interval': undefined });
                        sensor.on(sensor.SensorId.PEDOMETER, callback2, { 'interval': undefined });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest019 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest020
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0200
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest020---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest020 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback, { 'interval': null });
                        sensor.on(sensor.SensorId.PEDOMETER, callback2, { 'interval': null });
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest020 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest021
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0210
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------newPedometer_SensorJsTest021---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest021 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        try{
                        sensor.on(sensor.SensorId.PEDOMETER, callback, undefined);
                        } catch(error){
                            console.info('newPedometer_SensorJsTest021 Repeat subscription'+error);
                        }
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest021 On fail, errorCode:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   newPedometer_SensorJsTest022
     * @tc.number SUB_SensorsSystem_NEWPEDOMETER_JSTest_0220
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("newPedometer_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER, (error, data) => {
                    if (error) {
                        console.error('newPedometer_SensorJsTest022 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.PEDOMETER, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.PEDOMETER, null);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('newPedometer_SensorJsTest022 catch error:' +JSON.stringify(error));
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   SensorOnOff_ErrCode_Test_0029
     * @tc.number SensorOnOff_ErrCode_Test_0029
     * @tc.desc   Verification results of the incorrect parameters of the test interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorOnOff_ErrCode_Test_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try{
                sensor.getSingleSensor(sensor.SensorId.PEDOMETER,(error, data) => {
                    if (error) {
                        console.error('SensorOnOff_ErrCode_Test_0029 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        expect(typeof(data)).assertEqual("object");
                        sensor.once(sensor.SensorId.PEDOMETER, callback, {'interval': -100000000});
                        done();
                    } catch (error) {
                        console.error('SensorOnOff_ErrCode_Test_0029 catch error:' +JSON.stringify(error));
                        expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
                        done();
                    }
                    }
                })
            } catch (error) {
                console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
                expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
                done();
            }
    })

    /**
     * @tc.name   SensorOnOff_ErrCode_Test_0030
     * @tc.number SensorOnOff_ErrCode_Test_0030
     * @tc.desc   Functional Use Cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorOnOff_ErrCode_Test_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SensorOnOff_ErrCode_Test_0030--------------');
        const TAG = 'SensorOnOff_ErrCode_Test_0030'
        try{
            const deviceId = -1;
            const result = sensor.getSingleSensorByDeviceSync(sensor.SensorId.PEDOMETER, deviceId);
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
                sensor.on(sensor.SensorId.PEDOMETER, callback, options);
                setTimeout(() => {
                    console.info('-------------------SensorOnOff_ErrCode_Test_0030 off in------------');
                    sensor.off(sensor.SensorId.PEDOMETER, sensorInfoParam, callback);
                    console.info('-------------------SensorOnOff_ErrCode_Test_0030 off end-----------');
                    done();
                }, 1000);
            }
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})}
