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

export default function SensorJsTest_sensor_17() {

let PermissionFlag = {
    PERMISSION_USER_SET:1,
    PERMISSION_USER_FIXED:2,
    PERMISSION_SYSTEM_FIXED:4
}

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const PERMISSION_DENIED_MSG = 'Permission denied.'
const SENSOR_NO_SUPPORT_CODE = 14500102
let tokenID = undefined
let permissionNameUser = 'ohos.permission.ACTIVITY_MOTION'
    async function grantPerm(){
        try {
            let accountManager = osAccount.getAccountManager();
            let userId = await accountManager.getOsAccountLocalIdFromProcess();
            console.info("SensorJsTest_sensor_17 userId:"+userId)
            console.info("============SensorJsTest_sensor_17 grant Permission start ============")
            var appInfo = await bundle.getApplicationInfo('ohos.acts.sensors.sensor.function', 0, userId);
            tokenID = appInfo.accessTokenId;
            console.log('SensorJsTest_sensor_17 accessTokenId:' + appInfo.accessTokenId + ', name:' + appInfo.name +
            ' ,bundleName:' + appInfo.process)
            var atManager = abilityAccessCtrl.createAtManager();
            var result = await atManager.grantUserGrantedPermission(tokenID, permissionNameUser,
            PermissionFlag.PERMISSION_SYSTEM_FIXED)
            console.info('SensorJsTest_sensor_17 successful. result: ' + JSON.stringify(result));
            console.info("============SensorJsTest_sensor_17 grant Permission end ============")
        } catch(error) {
            console.error('SensorJsTest_sensor_17 exception in, msg:' + JSON.stringify(error))
        }
    }
describe("SensorJsTest_sensor_17", function () {
    function callback(data) {
        console.info('old callback success' + JSON.stringify(data));
        expect(typeof(data.scalar)).assertEqual('number');
    }

    function callback2(data) {
        console.info('old callback2 sucess' + JSON.stringify(data));
        expect(typeof(data.scalar)).assertEqual('number');
    }

    beforeAll(async function(done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')
        await grantPerm();
        done();
    })

    afterAll(function() {
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll called')
        let atManager = abilityAccessCtrl.createAtManager();
        atManager.revokeUserGrantedPermission(tokenID, permissionNameUser,
        PermissionFlag.PERMISSION_SYSTEM_FIXED)
            .catch((error) => {
                console.info('SensorJsTest_sensor_17 error:' + JSON.stringify(error));
                expect(error.code).assertEqual(ERR_NOT_HAVE_PERMISSION);
            })
    })

    beforeEach(function() {
        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach called')
    })

    afterEach(function() {
        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach called')
    })

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0010
     * @tc.name:PedometerDetection_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest001---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest001 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest001 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0020
     * @tc.name:PedometerDetection_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest002---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest002 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, 5);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest002 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0030
     * @tc.name:PedometerDetection_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest003---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest003 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest003 Once fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0040
     * @tc.name:PedometerDetection_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest004---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest004 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, 5);
                        setTimeout(() => {
                            expect(true).assertTrue();
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest004 Once fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0050
     * @tc.name:PedometerDetection_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest005---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest005 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, 5);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest005 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0060
     * @tc.name:PedometerDetection_SensorJsTest006
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest006---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest006 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.off(-1, callback);
                    } catch (error) {
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0070
     * @tc.name:PedometerDetection_SensorJsTest007
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest007---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest007 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest007 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0080
     * @tc.name:PedometerDetection_SensorJsTest008
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest008---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest008 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest008 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0090
     * @tc.name:PedometerDetection_SensorJsTest009
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest009---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest009 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest009 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0100
     * @tc.name:PedometerDetection_SensorJsTest010
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                if (error) {
                    console.error('PedometerDetection_SensorJsTest010 getSingleSensor fail:' +JSON.stringify(error));
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                    setTimeout(() => {
                        done();
                    }, 4000);
                } catch (error) {
                    console.error('PedometerDetection_SensorJsTest010 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0110
     * @tc.name:PedometerDetection_SensorJsTest011
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetection_SensorJsTest011--------');
        let errorMessage = ""
        let errorMessages = "ReferenceError: xxx is not defined"
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest011 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('PedometerDetection_SensorJsTest011  on error');
                            expect(typeof (data.scalar)).assertEqual("number");
                        }
                        try {
                            xxx.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, onSensorCallback);
                        } catch (error) {
                            console.info("PedometerDetection_SensorJsTest011 error:" + error);
                            errorMessage = error.toString();
                            expect(errorMessage).assertEqual(errorMessages);
                            done();
                        }
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest011 On fail, errorCode:' +JSON.stringify(error));
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

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0120
     * @tc.name:PedometerDetection_SensorJsTest012
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetection_SensorJsTest012--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest012 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest012 On fail, errorCode:' +JSON.stringify(error));
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

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0130
     * @tc.name:PedometerDetection_SensorJsTest013
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetection_SensorJsTest013--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest013 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, {'interval': 100000000}, 5);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest013 On fail, errorCode:' +JSON.stringify(error));
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

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0140
     * @tc.name:PedometerDetection_SensorJsTest014
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetection_SensorJsTest014--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest014 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        function onSensorCallback(data) {
                            console.info('PedometerDetection_SensorJsTest014 data:' + JSON.stringify(data));
                            expect(typeof(data.scalar)).assertEqual('number');
                        }
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, onSensorCallback, {'interval': 100000000});
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest014 On fail, errorCode:' +JSON.stringify(error));
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

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0150
     * @tc.name:PedometerDetection_SensorJsTest015
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
     it("PedometerDetection_SensorJsTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest015---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest015 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION,5);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest015 Off fail, errorCode:' +JSON.stringify(error));
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

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0160
     * @tc.name:PedometerDetection_SensorJsTest016
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetection_SensorJsTest016--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest016 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (data)=>{
                            console.info("PedometerDetection_SensorJsTest016 callback: " + JSON.stringify(data));
                            expect(typeof(data.scalar)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': 100000000});
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (data)=>{
                            console.info("PedometerDetection_SensorJsTest016 callback2: " + JSON.stringify(data));
                            expect(typeof(data.scalar)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest016 Off fail, errorCode:' +JSON.stringify(error));
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

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0170
     * @tc.name:PedometerDetection_SensorJsTest017
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('--------PedometerDetection_SensorJsTest017--------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest017 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (data)=>{
                            console.info("PedometerDetection_SensorJsTest017 callback: " + JSON.stringify(data));
                            expect(typeof(data.scalar)).assertEqual('number');
                            expect(typeof (data.timestamp)).assertEqual("number");
                        }, {'interval': -100000000});
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest017 On fail, errorCode:' +JSON.stringify(error));
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

     /*
     * @tc.number:SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0180
     * @tc.name:PedometerDetection_SensorJsTest018
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest018---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest018 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, { 'interval': undefined });
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest018 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0190
     * @tc.name:PedometerDetection_SensorJsTest019
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest019---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest019 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, { 'interval': undefined });
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2, { 'interval': undefined });
                        setTimeout(()=>{
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest019 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0200
     * @tc.name:PedometerDetection_SensorJsTest020
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest020---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest020 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, { 'interval': null });
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2, { 'interval': null });
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        }, 4000);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback2);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest020 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0210
     * @tc.name:PedometerDetection_SensorJsTest021
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------PedometerDetection_SensorJsTest021---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest021 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        try{
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback, undefined);
                        } catch(error){
                            console.info('PedometerDetection_SensorJsTest021 Repeat subscription'+error);
                        }
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest021 On fail, errorCode:' +JSON.stringify(error));
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

    /*
     * @tc.number: SUB_SensorsSystem_PEDOMETER_DETECTION_JSTest_0220
     * @tc.name:PedometerDetection_SensorJsTest022
     * @tc.desc:Verification results of the incorrect parameters of the test interface
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("PedometerDetection_SensorJsTest022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            try {
                sensor.getSingleSensor(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, (error, data) => {
                    if (error) {
                        console.error('PedometerDetection_SensorJsTest022 getSingleSensor fail:' +JSON.stringify(error));
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, callback);
                        setTimeout(() => {
                            sensor.off(sensor.SensorType.SENSOR_TYPE_ID_PEDOMETER_DETECTION, null);
                            done();
                        }, 4000);
                    } catch (error) {
                        console.error('PedometerDetection_SensorJsTest022 catch error:' +JSON.stringify(error));
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
})}
