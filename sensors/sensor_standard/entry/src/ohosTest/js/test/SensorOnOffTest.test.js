/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import sensor from '@ohos.sensor'

export default function SystemParameterTest() {
describe('SystemParameterTest', function () {
    beforeAll(function () {
        console.info('beforeAll called')
    })

    afterAll(function () {
        console.info('afterAll called')
    })

    beforeEach(function () {
        console.info('beforeEach called')
    })

    afterEach(function () {
        console.info('afterEach called')
    })

    let testNullSensorId = -1;
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
    let TAG  = '';

    /**
     * @tc.name   testRegisterSensortest001
     * @tc.number SUB_SENSORS_Sensor_JSTest_0010
     * @tc.desc   test get sensor data by wrong sensor id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegisterSensortest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'testRegisterSensortest001'
        console.info(TAG + ' in');
        function onSensorCallback(data) {
            console.info(TAG + ' Callback in!' + JSON.stringify(data));
            expect(false).assertTrue();
            done();
        }
        try{
           sensor.getSingleSensor(testNullSensorId,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    try {
                        sensor.on(testNullSensorId, onSensorCallback);
                    } catch (error) {
                        console.info(TAG + ' catch error:' + error);
                        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
                        expect(error.message).assertEqual(PARAMETER_ERROR_MSG)
                        done();
                    }
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
        console.info(TAG + ' end');
    })

    /**
     * @tc.name   testRegisterSensortest002
     * @tc.number SUB_SENSORS_Sensor_JSTest_0020
     * @tc.desc   test precision
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRegisterSensortest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'testRegisterSensortest002'
        console.info(TAG + ' in');
        function onSensorCallback(data) {
          if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_HIGH) {
            console.info('accuracy verified' + JSON.stringify(data));
           if (data.accuracy = sensor.SensorAccuracy.ACCURACY_LOW || data.accuracy <=
            sensor.SensorAccuracy.ACCURACY_MEDIUM) {
                console.info('Precision in the middle two terms:' + JSON.stringify(data));
            }
            expect(true).assertTrue();
          } else {
            console.info('invalid accuracy encountered' + JSON.stringify(data));
            expect(false).assertTrue();
          }
        console.info(TAG + ' Callback in!' + JSON.stringify(data));
        expect(typeof (data.x)).assertEqual("number");
        expect(typeof (data.y)).assertEqual("number");
        expect(typeof (data.z)).assertEqual("number");
        expect(typeof (data.timestamp)).assertEqual("number");
        }
        try{
           sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER,(error, data) => {
                if (error) {
                    console.info(TAG + ' error:' + error);
                    done();
                } else {
                    sensor.on(sensor.SensorId.ACCELEROMETER, onSensorCallback);
                    setTimeout(()=>{
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        done();
                    }, 500);
                }
            })
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
            done();
        }
        console.info(TAG + ' end');
    })

    /**
     * @tc.name   testOnOffSensorStatusChange001
     * @tc.number SUB_SENSORS_Sensor_OnOff_JSTest_001
     * @tc.desc   test stop listening on device status changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnOffSensorStatusChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'testOnOffSensorStatusChange001'
        console.info(TAG + ' in');
        const onCallback = (statusEvent) => {
            console.info(TAG + ' Callback should not be triggered!');
            console.info(TAG + " statusEvent.timestamp:" + statusEvent.timestamp);
            console.info(TAG + " statusEvent.sensorId:" + statusEvent.sensorId);
            console.info(TAG + " statusEvent.sensorIndex:" + statusEvent.sensorIndex);
            console.info(TAG + " statusEvent.isSensorOnline:" + statusEvent.isSensorOnline);
            console.info(TAG + " statusEvent.deviceId:" + statusEvent.deviceId);
            console.info(TAG + " statusEvent.deviceName:" + statusEvent.deviceName);
        };
        try {
            sensor.on('sensorStatusChange', onCallback);
            setTimeout(() => {
                sensor.off('sensorStatusChange', onCallback);
                console.info(TAG + ' Successfully stopped listening');
                done();
            }, 1000);
        } catch (error) {
            console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
            expect(false).assertTrue();
            done();
        }
        console.info(TAG + ' end');
    })


    /**
     * @tc.name   testOnOffSensorStatusChange002
     * @tc.number testOnOffSensorStatusChange002
     * @tc.desc   testOnOffSensorStatusChange002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnOffSensorStatusChange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        TAG = 'testOnOffSensorStatusChange002';
        console.info(TAG + ' in');
        const invalidEventType = ' ';
        const callback = (statusEvent) => {
            console.info(TAG + ' Callback should not be triggered!');
            console.info(TAG + " statusEvent.timestamp:" + statusEvent.timestamp);
            console.info(TAG + " statusEvent.sensorId:" + statusEvent.sensorId);
            console.info(TAG + " statusEvent.sensorIndex:" + statusEvent.sensorIndex);
            console.info(TAG + " statusEvent.isSensorOnline:" + statusEvent.isSensorOnline);
            console.info(TAG + " statusEvent.deviceId:" + statusEvent.deviceId);
            console.info(TAG + " statusEvent.deviceName:" + statusEvent.deviceName);
        };
        try {
            sensor.on(invalidEventType, callback);
            console.info(TAG + ' Registration with invalid type unexpectedly succeeded');
            expect(false).assertTrue('Registration should have failed');
            setTimeout(() => {
                sensor.off(invalidEventType, callback);
                done();
            }, 500);
            done();
        } catch (error) {
            console.info(TAG + ' Caught expected error: ' + error.code + ', ' + error.message);
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
        }
        console.info(TAG + ' end');
    })
})}