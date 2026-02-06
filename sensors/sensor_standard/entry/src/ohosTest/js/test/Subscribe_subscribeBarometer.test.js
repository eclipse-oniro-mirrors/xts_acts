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
import sensor from '@system.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_26() {
describe("SensorJsTest_sensor_26", function () {
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

    let BarometerId = 8
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0010
     * @tc.name:subscribeBarometer_SensorJsTest001
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometer_SensorJsTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest001---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometer_SensorJsTest005 error');
                    done();
                } else {
                sensor.subscribeBarometer({
                    success: function (data) {
                        console.info("subscribeBarometer_SensorJsTest001 success" + JSON.stringify(data));
                        expect(typeof (data.pressure)).assertEqual("number");
                    },
                    fail: function (data, code) {
                        console.error('subscribeBarometer_SensorJsTest001 failed. Code: ' + code + '; Data: ' + data);
                        expect(code).assertEqual(1001);
                    },
                });
                setTimeout(() => {
                  sensor.unsubscribeBarometer();
                  done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0020
     * @tc.name: subscribeBarometer_SensorJsTest002
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometer_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest002---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometer_SensorJsTest005 error');
                    done();
                } else {
                sensor.subscribeBarometer({
                    success: function (data) {
                        console.info("subscribeBarometer_SensorJsTest002 success:" + JSON.stringify(data));
                        expect(typeof (data.pressure)).assertEqual("number");
                    },
                    fail: function (data, code) {
                        console.error('subscribeBarometer_SensorJsTest002 failed. Code: ' + code + '; Data: ' + data);
                        expect(code).assertEqual(1001);
                    },
                });
                sensor.subscribeBarometer({
                    success: function (data) {
                        console.info("subscribeBarometer_SensorJsTest002_1 success:" + JSON.stringify(data));
                        expect(typeof (data.pressure)).assertEqual("number");
                    },
                    fail: function (data, code) {
                        console.error('subscribeBarometer_SensorJsTest002_1 failed. Code: ' + code + '; Data: ' + data);
                        expect(code).assertEqual(1001);
                    },
                });
                setTimeout(() => {
                   sensor.unsubscribeBarometer();
                   done();
                }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

     /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0030
     * @tc.name: subscribeBarometer_SensorJsTest003
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometer_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest003---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometer_SensorJsTest005 error');
                    done();
                } else {
               sensor.subscribeBarometer({
                    success: function (data) {
                        console.info("subscribeBarometer_SensorJsTest003 success:" + JSON.stringify(data));
                        expect(typeof (data.pressure)).assertEqual("number");
                    },
                    fail: function (data, code) {
                        console.error('subscribeBarometer_SensorJsTest003 failed. Code: ' + code + '; Data: ' + data);
                        expect(code).assertEqual(1001);
                    },
                });
                setTimeout(() => {
                    sensor.unsubscribeBarometer();
                    done();
                }, 500);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0040
     * @tc.name: subscribeBarometer_SensorJsTest004
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometer_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest004---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometer_SensorJsTest004 error');
                    done();
                } else {
                    sensor.subscribeBarometer({
                        success: function (data) {
                            console.info("subscribeBarometer_SensorJsTest004 success" + JSON.stringify(data));
                            expect(typeof (data.pressure)).assertEqual("number");
                        },
                        fail: undefined,
                    });

                    sensor.subscribeBarometer({
                        success: function (data) {
                            console.info("subscribeBarometer_SensorJsTest004_1 success" + JSON.stringify(data));
                            expect(typeof (data.pressure)).assertEqual("number");
                        },
                        fail: null,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeBarometer();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /*
     * @tc.number:SUB_SensorsSystem_SubscribeBarometer_JSTest_0050
     * @tc.name: subscribeBarometer_SensorJsTest005
     * @tc.desc:Verification results of the incorrect parameters of the test interface.
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("subscribeBarometer_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------subscribeBarometer_SensorJsTest005---------------------------');
        try{
           sensor.getSingleSensor(BarometerId ,(error, data) => {
                if (error) {
                    console.info('subscribeBarometer_SensorJsTest005 error');
                    done();
                } else {
                    sensor.subscribeBarometer({
                        success: function (data) {
                            console.info("subscribeBarometer_SensorJsTest005 success" + JSON.stringify(data));
                            expect(typeof (data.pressure)).assertEqual("number");
                        },
                        fail: undefined,
                    });
                    setTimeout(() => {
                    sensor.unsubscribeBarometer();
                    done();
                    }, 1000);
                }
            })
        } catch (error) {
            console.info('getSingleSensor fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})}
