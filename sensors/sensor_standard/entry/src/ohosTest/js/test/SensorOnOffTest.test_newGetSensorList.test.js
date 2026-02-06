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
import sensor from '@ohos.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_35() {
describe("SensorJsTest_sensor_35", function () {
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

    let errMessage;
    let invild = -1;
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
    let TAG  = ''

    /**
     * @tc.name   getSensorLists_SensorJsTest001
     * @tc.number SUB_SensorsSystem_GetSensorLists_JSTest_0010
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getSensorLists_SensorJsTest001",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        TAG = 'getSensorLists_SensorJsTest001';
        try{
            sensor.getSensorList().then((data) => {
            for (let i = 0; i < data.length; i++) {
                console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
            }
            expect(data.length > 0).assertTrue();
            done();
            }, (error)=>{
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   getSensorLists_SensorJsTest002
     * @tc.number SUB_SensorsSystem_GetSensorLists_JSTest_0020
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getSensorLists_SensorJsTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'getSensorLists_SensorJsTest002';
        try{
            sensor.getSensorList((error, data) => {
            if (error) {
                console.info(TAG + ' error:' + error);
                done();
            } else {
                for (let i =0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(data.length > 0).assertTrue();
                done();
            }
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   getSensorLists_SensorJsTest003
     * @tc.number SUB_SensorsSystem_GetSensorLists_JSTest_0030
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getSensorLists_SensorJsTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'getSensorLists_SensorJsTest003';
        try{
            sensor.getSensorList(null).then(data => {
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

/**
 * @tc.name   getSensorLists_SensorJsTest004
 * @tc.number SUB_SensorsSystem_GetSensorLists_JSTest_0040
 * @tc.desc   Verification results of the incorrect parameters of the test interface.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it("getSensorLists_SensorJsTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    TAG = 'getSensorLists_SensorJsTest004';
    try{
        sensor.getSensorList(errMessage).then(data => {
            for (let i = 0; i < data.length; i++) {
                console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
            }
            expect(true).assertTrue();
            done();
        }, (error) => {
            console.info(TAG + ' error:' + error);
            done();
        });
    } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
    }
})

/**
 * @tc.name   getSensorLists_SensorJsTest005
 * @tc.number SUB_SensorsSystem_GetSensorLists_JSTest_0050
 * @tc.desc   Verification results of the incorrect parameters of the test interface.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it("getSensorLists_SensorJsTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    TAG = 'getSensorLists_SensorJsTest005';
    try{
        sensor.getSensorList('xxx').then(data => {
            console.info("--getSensorLists_SensorJsTest005 callback in--" + data.length);
            for (let i = 0; i < data.length; i++) {
                console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
            }
            expect(true).assertTrue();
            done();
        }, (error) => {
            console.info(TAG + ' error:' + error);
            done();
        });
    } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
    }
})

    /**
     * @tc.name   getSensorLists_SensorJsTest006
     * @tc.number SUB_SensorsSystem_GetSensorLists_JSTest_0060
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getSensorLists_SensorJsTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'getSensorLists_SensorJsTest006';
        try{
            sensor.getSensorList(invild).then(data => {
                console.info("--getSensorLists_SensorJsTest006 callback in--" + data.length);
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   getSensorLists_SensorJsTest007
     * @tc.number SUB_SensorsSystem_GetSensorLists_JSTest_0070
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getSensorLists_SensorJsTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'getSensorLists_SensorJsTest007';
        try{
            sensor.getSensorList(xxx).then(data => {
                console.info("--getSensorLists_SensorJsTest007 callback in--" + data.length);
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            done();
        }
    })

    /**
     * @tc.name   getSensorLists_SensorJsTest008
     * @tc.number SUB_SensorsSystem_GetSensorLists_JSTest_0080
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getSensorLists_SensorJsTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'getSensorLists_SensorJsTest008';
        try{
            sensor.getSensorList(undefined).then((data) => {
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.name   getSensorLists_SensorJsTest009
     * @tc.number SUB_SensorsSystem_GetSensorLists_JSTest_0090
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getSensorLists_SensorJsTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'getSensorLists_SensorJsTest009';
        try{
            sensor.getSensorList(null).then((data) => {
                for (let i = 0; i < data.length; i++) {
                    console.info(TAG + ' Callback in!' + JSON.stringify(data[i]));
                }
                expect(true).assertTrue();
                done();
            }, (error) => {
                console.info(TAG + ' error:' + error);
                done();
            });
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})}
