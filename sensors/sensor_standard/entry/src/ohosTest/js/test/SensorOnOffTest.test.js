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
    let sensorList = undefined;
    let Available = false;
    let isAvailable = async (data) => {
        if (sensorList != undefined) {
            const targetSensor = sensorList?.filter((sensors) => sensors.sensorId === data);
            console.info(`====> isAvailable : ${targetSensor},length : ${targetSensor?.length}`);
            if (targetSensor?.length != 0) {
                Available = true;
                console.info(`====> Available : ${Available}`);
            } else {
                Available = false;
                console.info(`====> Available : ${Available}`);
            }
        } else {
            console.info(`====> sensorList : ${sensorList}`);
        }
    }
    beforeAll(function (done) {
        try {
            sensor.getSensorList((err, data) => {
                console.info(`====> beforeAll Succeeded in getting GetSensorList err.code ${err?.code} ,err.message${err?.message}`);
                sensorList = data;
                console.info(`====> beforeAll success ${sensorList}`);
                done();
            });  
        } catch (error) {
            console.info(`====> beforeAll failed err.code ${error.code} ,err.message${error.message}`);
            done();
        }
        console.info(`====> beforeAll end`);
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
    let sensortempcode = true;
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
            expect(sensortempcode).assertTrue();
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


    


    /**
     * @tc.name   SUB_SENSORS_Sensor_Supplemental_0010
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0010
     * @tc.desc   getSingleSensorByDeviceSync get null param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SUB_SENSORS_Sensor_Supplemental_0010-------------------------");
        await isAvailable(sensor.SensorId.FUSION_PRESSURE);
        const TAG = '====>SUB_SENSORS_Sensor_Supplemental_0010';
        try {
            const type = sensor.SensorId.FUSION_PRESSURE;
            const result = sensor.getSingleSensorByDeviceSync(type, null);
            console.info(TAG + ` success result.length: ${result.length}  ,result: ${JSON.stringify(result)}`);
            if (Available) {
                expect(result.length).assertLarger(0);
            } else {
                expect(result.length === 0).assertTrue();
            };
            done();
        } catch (error) {
            console.info(TAG + ` fail, errCode: ${error.code}  ,msg: ${error.message}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   SUB_SENSORS_Sensor_Supplemental_0020
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0020
     * @tc.desc   getSingleSensorByDeviceSync get undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SUB_SENSORS_Sensor_Supplemental_0020-------------------------");
        await isAvailable(sensor.SensorId.FUSION_PRESSURE);
        const TAG = '====>SUB_SENSORS_Sensor_Supplemental_0020';
        try {
            const type = sensor.SensorId.FUSION_PRESSURE;
            const result = sensor.getSingleSensorByDeviceSync(type, undefined);
            console.info(TAG + ` success result.length: ${result.length}  ,result: ${JSON.stringify(result)}`);
            if (Available) {
                expect(result.length).assertLarger(0);
            } else {
                expect(result.length === 0).assertTrue();
            };
            done();
        } catch (error) {
            console.info(TAG + ` fail, errCode: ${error.code}  ,msg: ${error.message}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   SUB_SENSORS_Sensor_Supplemental_0030
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0030
     * @tc.desc   getSensorListByDeviceSync get null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SUB_SENSORS_Sensor_Supplemental_0030-------------------------");
        const TAG = '====>SUB_SENSORS_Sensor_Supplemental_0030';
        try {
            const sensorList = sensor.getSensorListByDeviceSync(null);
            console.info(TAG + `sensorList length: ${sensorList.length}`);
            expect(sensorList.length >= 0).assertTrue();
            done();
        } catch (error) {
            console.error(TAG + `Failed to get sensorList. Code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name   SUB_SENSORS_Sensor_Supplemental_0040
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0040
     * @tc.desc   getSensorListByDeviceSync get undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info("------------------SUB_SENSORS_Sensor_Supplemental_0040-------------------------");
        const TAG = '====>SUB_SENSORS_Sensor_Supplemental_0040';
        try {
            const sensorList = sensor.getSensorListByDeviceSync(undefined);
            console.info(TAG + `sensorList length: ${sensorList.length}`);
            expect(sensorList.length >= 0).assertTrue();
            done();
        } catch (err) {
            console.error(TAG + `Failed to get sensorList. Code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0050
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0050
     * @tc.desc getGeomagneticField with callback and null locationOptions.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + 'SUB_SENSORS_Sensor_Supplemental_0050 start');
        try {
            sensor.getGeomagneticField(null, null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0050 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(TAG + ` SUB_SENSORS_Sensor_Supplemental_0060 error code: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0060
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0060
     * @tc.desc getGeomagneticField with callback and null locationOptions.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + 'SUB_SENSORS_Sensor_Supplemental_0060 start');
        try {
            sensor.getGeomagneticField(null, null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0060 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(TAG + ` SUB_SENSORS_Sensor_Supplemental_0060 error code: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0070
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0070
     * @tc.desc getGeomagneticField with undefined timeMillis parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        let TAG = '====>'
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0070 start');
        try {
            await sensor.getGeomagneticField(undefined, undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0070 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(TAG + ` SUB_SENSORS_Sensor_Supplemental_0070 error code: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0080
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0080
     * @tc.desc getGeomagneticField with undefined timeMillis parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        let TAG = '====>'
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0080 start');
        try {
            await sensor.getGeomagneticField(undefined, undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0080 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(TAG + ` SUB_SENSORS_Sensor_Supplemental_0080 error code: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0090
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0090
     * @tc.desc getGeomagneticInfo with callback and null locationOptions.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0090 start');
        try {
            sensor.getGeomagneticInfo(null, null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0090 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(TAG + ` SUB_SENSORS_Sensor_Supplemental_0090 error code: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0100
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0100
     * @tc.desc getGeomagneticInfo with callback and undefined locationOptions.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0100 start');
        try {
            sensor.getGeomagneticInfo(undefined, undefined, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0100 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(TAG + ` SUB_SENSORS_Sensor_Supplemental_0100 error code: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0110
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0110
     * @tc.desc getGeomagneticInfo with null locationOptions parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0110 start');
        try {
            await sensor.getGeomagneticInfo(null, null);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0110 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(TAG + ` SUB_SENSORS_Sensor_Supplemental_0110 error code: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0120
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0120
     * @tc.desc getGeomagneticInfo with undefined locationOptions parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0120 start');
        try {
            await sensor.getGeomagneticInfo(undefined, undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0120 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(TAG + ` SUB_SENSORS_Sensor_Supplemental_0120 error code: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_SENSORS_Sensor_Supplemental_0130
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0130
     * @tc.desc   getAltitude get null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('====>SUB_SENSORS_Sensor_Supplemental_0130 start')
        try {
            sensor.getAltitude(null, null, (error, data) => {
                console.info("====>SUB_SENSORS_Sensor_Supplemental_0130 getAltitude into callback")
                expect(false).assertTrue();
                done()
            })
        }catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0130 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    })

    /**
     * @tc.name   SUB_SENSORS_Sensor_Supplemental_0140
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0140
     * @tc.desc   getAltitude get undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('====>SUB_SENSORS_Sensor_Supplemental_0140 start')
        try {
            sensor.getAltitude(undefined, undefined, (error, data) => {
                console.info("====>SUB_SENSORS_Sensor_Supplemental_0140 getAltitude into callback")
                expect(false).assertTrue();
                done()
            })
        }catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0140 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    })

    /**
     * @tc.name   SUB_SENSORS_Sensor_Supplemental_0150
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0150
     * @tc.desc   getAltitude get null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('====>SUB_SENSORS_Sensor_Supplemental_0150 start')
        try {
            await sensor.getAltitude(null, null);
            console.info("====>SUB_SENSORS_Sensor_Supplemental_0150 getAltitude success")
            expect(false).assertTrue();
            done()
        }catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0150 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    })

    /**
     * @tc.name   SUB_SENSORS_Sensor_Supplemental_0160
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0160
     * @tc.desc   getAltitude get undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('====>SUB_SENSORS_Sensor_Supplemental_0160 start')
        try {
            await sensor.getAltitude(undefined, undefined);
            console.info("====>SUB_SENSORS_Sensor_Supplemental_0160 getAltitude success")
            expect(false).assertTrue();
            done()
        }catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0160 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    })

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0170
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0170
     * @tc.desc getDeviceAltitude with callback and null seaPressure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0170 start');
        try {
            sensor.getDeviceAltitude(null, null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0170 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0170 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0180
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0180
     * @tc.desc getDeviceAltitude with callback and undefined seaPressure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0180 start');
        try {
            sensor.getDeviceAltitude(undefined, undefined, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0180 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0180 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0190
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0190
     * @tc.desc getDeviceAltitude with null seaPressure parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0190 start');
        try {
            await sensor.getDeviceAltitude(null, null);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0190 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0190 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0200
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0200
     * @tc.desc getDeviceAltitude with undefined seaPressure parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0200 start');
        try {
            await sensor.getDeviceAltitude(undefined, undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0200 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0200 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0210
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0210
     * @tc.desc getGeomagneticDip with callback and null inclinationMatrix.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0210 start');
        try {
            sensor.getGeomagneticDip(null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0210 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0210 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0220
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0220
     * @tc.desc getGeomagneticDip with callback and undefined inclinationMatrix.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0220 start');
        try {
            sensor.getGeomagneticDip(undefined, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0220 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0220 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0230
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0230
     * @tc.desc getGeomagneticDip with callback and empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0230 start');
        try {
            sensor.getGeomagneticDip([], (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0230 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0230 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0240
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0240
     * @tc.desc getGeomagneticDip with null inclinationMatrix parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0240 start');
        try {
            await sensor.getGeomagneticDip(null);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0240 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0240 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0250
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0250
     * @tc.desc getGeomagneticDip with undefined inclinationMatrix parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0250 start');
        try {
            await sensor.getGeomagneticDip(undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0250 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0250 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0260
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0260
     * @tc.desc getGeomagneticDip with empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0260 start');
        try {
            await sensor.getGeomagneticDip([]);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0260 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0260 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0270
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0270
     * @tc.desc getInclination with callback and null inclinationMatrix.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0270 start');
        try {
            sensor.getInclination(null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0270 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0270 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0280
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0280
     * @tc.desc getInclination with callback and undefined inclinationMatrix.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0280 start');
        try {
            sensor.getInclination(undefined, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0280 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0280 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0290
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0290
     * @tc.desc getInclination with callback and empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0290 start');
        try {
            sensor.getInclination([], (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0290 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0290 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0300
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0300
     * @tc.desc getInclination with null inclinationMatrix parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0300 start');
        try {
            await sensor.getInclination(null);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0300 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0300 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0310
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0310
     * @tc.desc getInclination with undefined inclinationMatrix parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0310 start');
        try {
            await sensor.getInclination(undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0310 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0310 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0320
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0320
     * @tc.desc getInclination with empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0320 start');
        try {
            await sensor.getInclination([]);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0320 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0320 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0330
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0330
     * @tc.desc getAngleModify with callback and null currentRotationMatrix.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0330 start');
        try {
            sensor.getAngleModify(null, null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0330 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0330 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0340
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0340
     * @tc.desc getAngleModify with callback and undefined currentRotationMatrix.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0340 start');
        try {
            sensor.getAngleModify(undefined, undefined, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0340 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0340 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0350
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0350
     * @tc.desc getAngleModify with callback and empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0350 start');
        try {
            sensor.getAngleModify([], [], (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0350 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0350 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0360
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0360
     * @tc.desc getAngleModify with null currentRotationMatrix parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0360 start');
        try {
            await sensor.getAngleModify(null, null);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0360 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0360 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0370
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0370
     * @tc.desc getAngleModify with undefined currentRotationMatrix parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0370 start');
        try {
            await sensor.getAngleModify(undefined, undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0370 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0370 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0380
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0380
     * @tc.desc getAngleModify with empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0380 start');
        try {
            await sensor.getAngleModify([], []);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0380 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0380 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0390
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0390
     * @tc.desc getAngleVariation with callback and null currentRotationMatrix.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0390 start');
        try {
            sensor.getAngleVariation(null, null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0390 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0390 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0400
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0400
     * @tc.desc getAngleVariation with callback and undefined currentRotationMatrix.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0400 start');
        try {
            sensor.getAngleVariation(undefined, undefined, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0400 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0400 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0410
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0410
     * @tc.desc getAngleVariation with callback and empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0410 start');
        try {
            sensor.getAngleVariation([], [], (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0410 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0410 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0420
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0420
     * @tc.desc getAngleVariation with null preRotationMatrix parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0420 start');
        try {
            await sensor.getAngleVariation(null, null);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0420 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0420 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0430
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0430
     * @tc.desc getAngleVariation with undefined preRotationMatrix parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0430 start');
        try {
            await sensor.getAngleVariation(undefined, undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0430 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0430 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0440
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0440
     * @tc.desc getAngleVariation with empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0440 start');
        try {
            await sensor.getAngleVariation([], []);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0440 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0440 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0450
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0450
     * @tc.desc createRotationMatrix with callback and null gravity.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0450 start');
        try {
            sensor.createRotationMatrix(null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0450 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0450 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0460
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0460
     * @tc.desc createRotationMatrix with callback and null gravity.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0460 start');
        try {
            sensor.createRotationMatrix(undefined, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0460 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0460 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0470
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0470
     * @tc.desc createRotationMatrix with callback and empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0470 start');
        try {
            sensor.createRotationMatrix([], (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0470 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0470 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0480
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0480
     * @tc.desc createRotationMatrix with null gravity and geomagnetic parameters.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0480 start');
        try {
            await sensor.createRotationMatrix(null);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0480 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0480 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0490
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0490
     * @tc.desc createRotationMatrix with undefined gravity and geomagnetic parameters.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0490 start');
        try {
            await sensor.createRotationMatrix(undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0490 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0490 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0500
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0500
     * @tc.desc createRotationMatrix with empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0500 start');
        try {
            await sensor.createRotationMatrix([]);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0500 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0500 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0510
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0510
     * @tc.desc getRotationMatrix with callback and null rotationVector.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0510 start');
        try {
            sensor.getRotationMatrix(null, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0510 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0510 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0520
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0520
     * @tc.desc getRotationMatrix with callback and undefined rotationVector.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0520 start');
        try {
            sensor.getRotationMatrix(undefined, (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0520 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0520 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0530
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0530
     * @tc.desc getRotationMatrix with callback and empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0530 start');
        try {
            sensor.getRotationMatrix([], (error, data) => {
                console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0530 should not enter callback');
                expect(false).assertTrue();
                done();
            });
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0530 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0540
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0540
     * @tc.desc getRotationMatrix with null rotationVector parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0540 start');
        try {
            await sensor.getRotationMatrix(null);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0540 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0540 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0550
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0550
     * @tc.desc getRotationMatrix with undefined rotationVector parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0550 start');
        try {
            await sensor.getRotationMatrix(undefined);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0550 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0550 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });

    /**
     * @tc.name SUB_SENSORS_Sensor_Supplemental_0560
     * @tc.number SUB_SENSORS_Sensor_Supplemental_0560
     * @tc.desc getRotationMatrix with empty arr parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('SUB_SENSORS_Sensor_Supplemental_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0560 start');
        try {
            await sensor.getRotationMatrix([]);
            console.info(TAG + ' SUB_SENSORS_Sensor_Supplemental_0560 failed, should throw error');
            expect(false).assertTrue();
            done();
        } catch (err) {
            console.info(`====>SUB_SENSORS_Sensor_Supplemental_0560 result.length: ${err.code}`);
            expect(err.code === 401).assertTrue();
            done()
        }
    });
})}