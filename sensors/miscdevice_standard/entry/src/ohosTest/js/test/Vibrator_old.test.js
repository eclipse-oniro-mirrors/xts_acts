/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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
import vibrator from '@system.vibrator';
import deviceInfo from '@ohos.deviceInfo'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function VibratorJsTest_misc_1() { 
let isAvailable; 
const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice'); 
describe("VibratorJsTest_misc_1", function () {
    beforeAll(async function (done) {
        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll called')   
        console.info('VibratorJsTest_misc_1 Device type = ' + deviceInfo.deviceType);    
        console.info('VibratorJsTest_misc_1 isAvailable = ' + isAvailable);    
        try {
            if (deviceInfo.deviceType === '2in1' || ABILITYJUDGMENT == false) {
                isAvailable = false;
                console.info('VibratorJsTest_misc_1 isAvailable ' + isAvailable);
                done() 
            }else {
                isAvailable = true;
                console.info('VibratorJsTest_misc_1 isAvailable ' + isAvailable);
                done() 
            }
        } catch(error) {
            console.error('VibratorJsTest_misc_1 exception :' + JSON.stringify(error))
            done() 
        }        
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

    const OPERATION_FAIL_CODE = 14600101;
    const PERMISSION_ERROR_CODE = 201;
    const PARAMETER_ERROR_CODE = 401;

    const OPERATION_FAIL_MSG = 'Device operation failed.'
    const PERMISSION_ERROR_MSG = 'Permission denied.'
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    let TAG = "" 
    
    /*
    * @tc.name:SubVibratorJsTest0001
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0190
    * @tc.level:Level 0
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SubVibratorJsTest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------SubVibratorJsTest0001---------------------------');
        TAG = "SubVibratorJsTest0001"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate({
                mode: 'long',
                success: function () {
                    console.info("SubVibratorJsTest0001 success");
                    done();
                },
                fail: function (data, code) {
                    console.log("SubVibratorJsTest0001 is failed, data: " + data + ", code: " + code);
                    expect(false).assertTrue();
                },
                complete: function () {
                    console.log('SubVibratorJsTest0001 is completed');
                }
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:SubVibratorJsTest0002
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0200
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SubVibratorJsTest0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0002---------------------------');
        TAG = "SubVibratorJsTest0002"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("SubVibratorJsTest0002 success");
                    done();
                },
                fail: function (data, code) {
                    console.log("SubVibratorJsTest0002 is failed, data: " + data + ", code: " + code);
                    expect(false).assertTrue();
                },
                complete: function () {
                    console.log('SubVibratorJsTest0002 is completed');
                }
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:SubVibratorJsTest0003
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0210
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SubVibratorJsTest0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0003---------------------------');
        TAG = "SubVibratorJsTest0003"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("SubVibratorJsTest0003 success");
                    done();
                },
                fail: function (data, code) {
                    console.error('SubVibratorJsTest0003 failed. Code: ' + code + '; Data: ' + data);
                    expect(false).assertTrue();
                },
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:SubVibratorJsTest0004
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0220
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SubVibratorJsTest0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0004---------------------------');
        TAG = "SubVibratorJsTest0004"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("SubVibratorJsTest0004 success");
                    done();
                },
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:SubVibratorJsTest0005
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0230
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
     */
    it("SubVibratorJsTest0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0005---------------------------');
        TAG = "SubVibratorJsTest0005"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate({
                success: function () {
                    console.info("SubVibratorJsTest0005 success");
                    done();
                },
                fail: function (data, code) {
                    console.error('SubVibratorJsTest0005 failed. Code: ' + code + '; Data: ' + data);
                    expect(false).assertTrue();
                },
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:SubVibratorJsTest0006
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0240
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SubVibratorJsTest0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0006---------------------------');
        TAG = "SubVibratorJsTest0006"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate({
                mode: 'long',
                inInvalid: 2,
                success: function () {
                    console.info("SubVibratorJsTest0006 success");
                    done();
                },
                fail: function (data, code) {
                    console.error('SubVibratorJsTest0006 failed. Code: ' + code + '; Data: ' + data);
                    expect(false).assertTrue();
                },
            });
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:SubVibratorJsTest0007
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0250
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SubVibratorJsTest0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0007---------------------------');
        TAG = "SubVibratorJsTest0007"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("SubVibratorJsTest0007 success");
                    done();
                },
            }, 25);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:SubVibratorJsTest0008
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0260
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SubVibratorJsTest0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0008---------------------------');
        TAG = "SubVibratorJsTest0008"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("SubVibratorJsTest0008 success");
                },
                fail: function (data, code) {
                    console.error('SubVibratorJsTest0008 failed. Code: ' + code + '; Data: ' + data);
                    expect(false).assertTrue();
                },
            });
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("SubVibratorJsTest0008_1 success");
                },
                fail: function (data, code) {
                    console.error('SubVibratorJsTest0008_1 failed. Code: ' + code + '; Data: ' + data);
                    expect(false).assertTrue();
                },
            });
            setTimeout(() => {
                done();
            }, 500);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:SubVibratorJsTest0009
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0270
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SubVibratorJsTest0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0009---------------------------');
        TAG = "SubVibratorJsTest0009"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate();
            setTimeout(() => {
                done();
            }, 500);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })

    /*
    * @tc.name:SubVibratorJsTest0010
    * @tc.desc:Verification results of the incorrect parameters of the test interface.
    * @tc.number:SUB_SensorSystem_Vibrator_JsTest_0280
    * @tc.level:Level 3
    * @tc.type:Function
    * @tc.size:MediumTest
    */
    it("SubVibratorJsTest0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SubVibratorJsTest0010---------------------------');
        TAG = "SubVibratorJsTest0010"
        console.info(TAG + ' isAvailable ' + isAvailable);
        if (isAvailable) {
            vibrator.vibrate({
                mode: 'short',
                success: function () {
                    console.info("SubVibratorJsTest0010 success");
                    done();
                },
            }, 25);
        } else {
            console.log(TAG + ' is not supported on this device.');
            done();
        }
    })
})
}
