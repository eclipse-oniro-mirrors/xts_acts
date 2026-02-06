/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
export default function SensorJsTest_sensor_64(){
describe("SensorJsTest_sensor_64", function () {
    beforeAll(function() {
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll called')
    })

    afterAll(function() {
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll called')
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

    let invalid  = -1;
    let TAG  = '';
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
    const CODEARR = [14500101, 14500102]

    /**
     * @tc.name   SensorSyncTest_001
     * @tc.number SUB_SensorsSystem_NEWSENSORSYNC_JSTest_0010
     * @tc.desc   verify sensor sync interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorSyncTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SensorSyncTest_001---------------------------');
        TAG = 'SensorSyncTest_001';
        try {
            let ret = sensor.getSingleSensorSync(sensor.SensorId.ACCELEROMETER);
            console.info(TAG + ' getSingleSensorSync: ' + JSON.stringify(ret));
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            let isIncluded = CODEARR.includes(error.code)
            expect(isIncluded).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   SensorSyncTest_002
     * @tc.number SUB_SensorsSystem_NEWSENSORSYNC_JSTest_0020
     * @tc.desc   verify sensor sync interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorSyncTest_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SensorSyncTest_002---------------------------');
        TAG = 'SensorSyncTest_002';
        try {
            let ret = sensor.getSingleSensorSync(invalid);
            expect(ret).assertEqual(false);
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            let isIncluded = CODEARR.includes(error.code)
            expect(isIncluded).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   SensorSyncTest_003
     * @tc.number SUB_SensorsSystem_NEWSENSORSYNC_JSTest_0030
     * @tc.desc   verify sensor sync interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorSyncTest_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SensorSyncTest_003---------------------------');
        TAG = 'SensorSyncTest_003';
        try {
            let ret = sensor.getSingleSensorSync(undefined);
            console.error(TAG + ' getSingleSensorSync success: ' + JSON.stringify(ret));
            expect(ret).assertEqual(false);
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   SensorSyncTest_004
     * @tc.number SUB_SensorsSystem_NEWSENSORSYNC_JSTest_0040
     * @tc.desc   verify sensor sync interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorSyncTest_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SensorSyncTest_004---------------------------');
        TAG = 'SensorSyncTest_004';
        try {
            let ret = sensor.getSingleSensorSync(null);
            console.error(TAG + ' getSingleSensorSync success: ' + JSON.stringify(ret));
            expect(true).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
    })

    /**
     * @tc.name   SensorSyncTest_005
     * @tc.number SUB_SensorsSystem_NEWSENSORSYNC_JSTest_0050
     * @tc.desc   verify sensor sync interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorSyncTest_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SensorSyncTest_005---------------------------');
        TAG = 'SensorSyncTest_005';
        try {
            let ret = sensor.getSensorListSync();
            for (let i = 0; i < ret.length; i++) {
                console.info(TAG + ' Succeeded in getting sensor: ' + JSON.stringify(ret[i]));
            }
            expect(ret.length > 0).assertTrue();
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            let isIncluded = CODEARR.includes(error.code)
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   SensorSyncTest_006
     * @tc.number SUB_SensorsSystem_NEWSENSORSYNC_JSTest_0060
     * @tc.desc   Allow redundant parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorSyncTest_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SensorSyncTest_006---------------------------');
        TAG = 'SensorSyncTest_006';
        try {
            let ret = sensor.getSensorListSync(invalid);
            console.info(TAG + ' getSensorListSync: ' + JSON.stringify(ret));
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            let isIncluded = CODEARR.includes(error.code)
            expect(isIncluded).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   SensorSyncTest_007
     * @tc.number SUB_SensorsSystem_NEWSENSORSYNC_JSTest_0070
     * @tc.desc   Allow redundant parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorSyncTest_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SensorSyncTest_007---------------------------');
        TAG = 'SensorSyncTest_007';
        try {
            let ret = sensor.getSensorListSync(null);
            console.info(TAG + ' getSensorListSync: ' + JSON.stringify(ret));
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            let isIncluded = CODEARR.includes(error.code)
            expect(isIncluded).assertTrue();
            done();
        }
    })
})}