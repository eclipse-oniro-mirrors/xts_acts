/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export default function SensorJsTest_getSingleSensorbyDevice() {
describe("SensorJsTest_getSingleSensorbyDevice", function () {
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

    let testNullDeviceId = -2;
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let errMessages = ['ReferenceError: xxx is not defined', 'ReferenceError: string is not defined', 'TypeError: is not callable'];
    let errMessage;
    let TAG = '';

    /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensorByDeviceSync_JSTest_001
     * @tc.name: GetSingleSensorByDeviceSync_JSTest_001
     * @tc.desc: Test getSingleSensorByDeviceSync with valid type and deviceId
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('GetSingleSensorByDeviceSync_JSTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info("------------------GetSingleSensorByDeviceSync_JSTest_001-------------------------");
        const TAG = 'GetSingleSensorByDeviceSync_JSTest_001'
        try {
            const type = sensor.SensorId.ACCELEROMETER;
            const deviceId = 1;
            const result = sensor.getSingleSensorByDeviceSync(type, deviceId);
            console.info(TAG + ' Callback in!' + JSON.stringify(result));
            if (result.length === 0) {
                console.info('No sensors found, Test case will return true.');
                done();
            } else {
                const sensorInfo = result[0];
                const callback = (data) => {
                    console.info('Accelerometer data received: ' + JSON.stringify(data));
                };
                const sensorInfoParam = {
                    deviceId: sensorInfo.deviceId,
                    sensorIndex: sensorInfo.sensorIndex
                };
                const options = {
                    interval: 100000000,
                    sensorInfoParam: sensorInfoParam
                };
                sensor.on(sensorInfo.sensorId, callback, options);
                console.info(TAG + ' Successfully registered sensor listener');
                setTimeout(() => {
                    sensor.off(sensorInfo.sensorId, sensorInfoParam, callback);
                    console.info(TAG + ' Successfully unregistered sensor listener');
                    done();
                }, 2000);
            }
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensorByDeviceSync_JSTest_002
     * @tc.name: GetSingleSensorByDeviceSync_JSTest_002
     * @tc.desc: Test getSingleSensorByDeviceSync with invalid type
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('GetSingleSensorByDeviceSync_JSTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info("------------------GetSingleSensorByDeviceSync_JSTest_002-------------------------");
        const TAG = 'GetSingleSensorByDeviceSync_JSTest_002'
        try {
            const invalidType = -1;
            const deviceId = 1;
            const result = sensor.getSingleSensorByDeviceSync(invalidType, deviceId);
            if (Array.isArray(result) && result.length === 0) {
                console.info('No sensors found, Test case will return true.');
            } else {
                console.info('Expected empty result but got non - empty result.');
                expect(false).assertTrue();
            }
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSingleSensorByDeviceSync_JSTest_003
     * @tc.name: GetSingleSensorByDeviceSync_JSTest_003
     * @tc.desc: Test getSingleSensorByDeviceSync with invalid deviceId
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('GetSingleSensorByDeviceSync_JSTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info("------------------GetSingleSensorByDeviceSync_JSTest_003-------------------------");
        const TAG = 'GetSingleSensorByDeviceSync_JSTest_003'
        try {
            const type = sensor.SensorId.ACCELEROMETER;
            const loopCount = 1000;
            let failCount = 0;
            for (let i = 0; i < loopCount; i++) {
                const result = sensor.getSingleSensorByDeviceSync(type, testNullDeviceId);
                if (Array.isArray(result) && result.length === 0) {
                    console.info(` No sensors found, Test case will return true.`);
                } else {
                    console.info(` Expected empty result but got non-empty result.`);
                    ++failCount;
                    expect(failCount).assertEqual(0);
                }
            }
            expect(failCount).assertEqual(0);
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message)
            done();
        }
    })
})}