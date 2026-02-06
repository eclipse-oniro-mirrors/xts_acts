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

export default function SensorJsTest_getSensorListbyDevice() {
describe("SensorJsTest_getSensorListbyDevice", function () {
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
     * @tc.number:SUB_SensorsSystem_GetSensorListByDeviceSync_JSTest_0010
     * @tc.name: GetSensorListByDeviceSync_JSTest_001
     * @tc.desc: Test getSensorListByDeviceSync with valid deviceId
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('GetSensorListByDeviceSync_JSTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info("------------------GetSensorListByDeviceSync_JSTest_001-------------------------");
        const TAG = 'GetSensorListByDeviceSync_JSTest_001'
        try {
            const deviceId = -1;
            const result = sensor.getSensorListByDeviceSync(deviceId);
            console.info(TAG + ' Callback in!' + JSON.stringify(result));
            if (result.length === 0) {
                console.info('No local sensors found. Test case will return true.');
                done();
            } else {
                const sensorInfo = result[0];
                expect(result[0].deviceId >= -1).assertEqual(true);
                console.info(TAG + " getSensorListByDeviceSync sensorName:" + result[0].sensorName);
                console.info(TAG + " getSensorListByDeviceSync vendorName:" + result[0].vendorName);
                console.info(TAG + " getSensorListByDeviceSync firmwareVersion:" + result[0].firmwareVersion);
                console.info(TAG + " getSensorListByDeviceSync hardwareVersion:" + result[0].hardwareVersion);
                console.info(TAG + " getSensorListByDeviceSync sensorId:" + result[0].sensorId);
                console.info(TAG + " getSensorListByDeviceSync maxRange:" + result[0].maxRange);
                console.info(TAG + " getSensorListByDeviceSync minSamplePeriod:" + result[0].minSamplePeriod);
                console.info(TAG + " getSensorListByDeviceSync maxSamplePeriod:" + result[0].maxSamplePeriod);
                console.info(TAG + " getSensorListByDeviceSync precision:" + result[0].precision);
                console.info(TAG + " getSensorListByDeviceSync power:" + result[0].power);
                console.info(TAG + " getSensorListByDeviceSync sensorIndex:" + result[0].sensorIndex);
                console.info(TAG + " getSensorListByDeviceSync deviceId:" + result[0].deviceId);
                console.info(TAG + " getSensorListByDeviceSync deviceName:" + result[0].deviceName);
                console.info(TAG + " getSensorListByDeviceSync isLocalSensor:" + result[0].isLocalSensor);
                const freshResultData = sensor.getSensorListByDeviceSync(deviceId);
                expect(freshResultData[0].deviceId >= -1).assertEqual(true);
                expect(freshResultData[0].deviceId === result[0].deviceId).assertEqual(true);
                const onSensorCallback = (data) => {
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
                sensor.on(sensorInfo.sensorId, onSensorCallback, options);
                setTimeout(() => {
                    sensor.off(sensorInfo.sensorId, sensorInfoParam, onSensorCallback);
                    done();
                }, 500);
            }
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorListByDeviceSync_JSTest_0020
     * @tc.name: GetSensorListByDeviceSync_JSTest_002
     * @tc.desc: Test getSensorListByDeviceSync without deviceId
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('GetSensorListByDeviceSync_JSTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info("------------------GetSensorListByDeviceSync_JSTest_002-------------------------");
        const TAG = 'GetSensorListByDeviceSync_JSTest_002'
        try {
            const result = sensor.getSensorListByDeviceSync();
            console.info(TAG + ' Callback in!' + JSON.stringify(result));
            if (result.length === 0) {
                console.info('No local sensors found. Test case will return true.');
                done();
            } else {
                const sensorInfo = result[0];
                const onSensorCallback = (data) => {
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
                sensor.on(sensorInfo.sensorId, onSensorCallback, options);
                setTimeout(() => {
                    sensor.off(sensorInfo.sensorId, sensorInfoParam, onSensorCallback);
                    done();
                }, 500);
            }
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })

    /**
     * @tc.number:SUB_SensorsSystem_GetSensorListByDeviceSync_JSTest_0030
     * @tc.name: GetSensorListByDeviceSync_JSTest_003
     * @tc.desc: Test getSensorListByDeviceSync with invalid deviceId
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('GetSensorListByDeviceSync_JSTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function (done) {
        console.info("------------------GetSensorListByDeviceSync_JSTest_003-------------------------");
        const TAG = 'GetSensorListByDeviceSync_JSTest_003'
        try {
            const result = sensor.getSensorListByDeviceSync(testNullDeviceId);
            console.info(TAG + ' Callback in!' + JSON.stringify(result));
            if (result.length === 0) {
                console.info('No local sensors found. Test case will return true.');
            } else {
                console.info('Expected empty array but got non - empty array.');
                expect(false).assertTrue();
            }
            done();
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
    })
})}