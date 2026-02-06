/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import vibrator from '@ohos.vibrator'
import deviceInfo from '@ohos.deviceInfo'
import sensor from 'libsensorNdk.so'
import { describe, beforeAll, it, expect, TestType, Size, Level, afterEach } from '@ohos/hypium'

export default function sensorTypeNdkTest() {
  let isAvailable  = false;
  const ABILITYJUDGMENT = canIUse('SystemCapability.Sensors.MiscDevice');
  const SENSOR_SUCCESS = 0;
  const SENSOR_PERMISSION_DENIED = 201;
  const SENSOR_PARAMETER_ERROR = 401;
  const DEVICE_OPERATION_FAILED = 14600101;
  const PARAMETER_ERROR = 401;
  const SENSOR_SERVICE_EXCEPTION = 14500101;
  let TAG = "";

  describe('Sensor_typeNdkTest', () => {
    beforeAll(async (done: Function) => {
      /*
       * @tc.setup: setup invoked before all testcases
       */
      console.info('beforeAll called')
      console.info('VibratorJsTest_misc_2 Device type = ' + deviceInfo.deviceType);
      console.info('VibratorJsTest_misc_2 isAvailable = ' + isAvailable);
      try {
        const vibratorsList = vibrator.getVibratorInfoSync();
        if (ABILITYJUDGMENT === false || vibratorsList.length === 0 ||
          (vibratorsList.length !== 0 && vibratorsList.every(vibrator => !vibrator.isLocalVibrator))) {
          isAvailable = false;
          console.info('Sensor_typeNdkTest isAvailable ' + isAvailable);
          done()
        }else {
          isAvailable = true;
          console.info('Sensor_typeNdkTest isAvailable ' + isAvailable);
          done()
        }
      } catch(error) {
        console.error('Sensor_typeNdkTest exception :' + JSON.stringify(error))
        done()
      }
    });

    afterEach(async (done: Function) => {
      console.info('====>Sensor_typeNdkTest afterEach start');
      try{
        await vibrator.stopVibration()
        console.info("afterEach: Success in stopping vibration. ");
        done();
      } catch (error) {
        console.info("afterEach error: " + JSON.stringify(error));
        done();
      }
    });


    

    /**
     * @tc.name   testSensor_typeNdkTest010
     * @tc.number SEN_MISC_Miscdevice_ETS_010
     * @tc.desc   OH_Sensor_GetInfos test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest010"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.ohSensorGetInfosTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest020
     * @tc.number SEN_MISC_Miscdevice_ETS_020
     * @tc.desc   SENSOR_TYPE_ACCELEROMETER test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest020"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest030
     * @tc.number SEN_MISC_Miscdevice_ETS_030
     * @tc.desc   SENSOR_TYPE_GYROSCOPE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest030"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest2();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest040
     * @tc.number SEN_MISC_Miscdevice_ETS_040
     * @tc.desc   SENSOR_TYPE_MAGNETIC_FIELD test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest040"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest3();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest050
     * @tc.number SEN_MISC_Miscdevice_ETS_050
     * @tc.desc   SENSOR_TYPE_BAROMETER test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest050"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest4();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest060
     * @tc.number SEN_MISC_Miscdevice_ETS_060
     * @tc.desc   SENSOR_TYPE_HALL test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest060"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest5();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest070
     * @tc.number SEN_MISC_Miscdevice_ETS_070
     * @tc.desc   SENSOR_TYPE_PROXIMITY test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest070"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest6();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest080
     * @tc.number SEN_MISC_Miscdevice_ETS_080
     * @tc.desc   SENSOR_TYPE_ORIENTATION test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest080"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest7();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest090
     * @tc.number SEN_MISC_Miscdevice_ETS_090
     * @tc.desc   SENSOR_TYPE_ORIENTATION test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest090"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest8();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest100
     * @tc.number SEN_MISC_Miscdevice_ETS_100
     * @tc.desc   SENSOR_TYPE_ORIENTATION test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest100"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest9();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest110
     * @tc.number SEN_MISC_Miscdevice_ETS_110
     * @tc.desc   SENSOR_TYPE_ORIENTATION test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest110"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest10();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest120
     * @tc.number SEN_MISC_Miscdevice_ETS_120
     * @tc.desc   SENSOR_TYPE_ORIENTATION test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest120"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest11();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest130
     * @tc.number SEN_MISC_Miscdevice_ETS_130
     * @tc.desc   SENSOR_TYPE_ORIENTATION test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest130"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_TypeTest12();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest140
     * @tc.number SEN_MISC_Miscdevice_ETS_140
     * @tc.desc   OH_SensorInfo_GetName test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest140"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorInfo_GetNameTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest150
     * @tc.number SEN_MISC_Miscdevice_ETS_150
     * @tc.desc   OH_SensorInfo_GetName test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest150"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorInfo_GetVendorNameTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest160
     * @tc.number SEN_MISC_Miscdevice_ETS_160
     * @tc.desc   OH_SensorInfo_GetType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest160"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorInfo_GetTypeTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest170
     * @tc.number SEN_MISC_Miscdevice_ETS_170
     * @tc.desc   OH_SensorInfo_GetResolution test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest170"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorInfo_GetResolutionTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest180
     * @tc.number SEN_MISC_Miscdevice_ETS_180
     * @tc.desc   OH_SensorInfo_GetMinSamplingInterval test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest180"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorInfo_GetMinSamplingIntervalTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest190
     * @tc.number SEN_MISC_Miscdevice_ETS_190
     * @tc.desc   OH_SensorInfo_GetMaxSamplingInterval test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest190"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorInfo_GetMaxSamplingIntervalTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest200
     * @tc.number SEN_MISC_Miscdevice_ETS_200
     * @tc.desc   OH_SensorEvent_GetType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest200"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorEvent_GetTypeTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest210
     * @tc.number SEN_MISC_Miscdevice_ETS_210
     * @tc.desc   OH_SensorEvent_GetTimestamp test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest210"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorEvent_GetTimestampTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest220
     * @tc.number SEN_MISC_Miscdevice_ETS_220
     * @tc.desc   OH_SensorEvent_GetAccuracy test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest220"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorEvent_GetAccuracyTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest230
     * @tc.number SEN_MISC_Miscdevice_ETS_230
     * @tc.desc   OH_SensorEvent_GetData test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest230"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorEvent_GetDataTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest240
     * @tc.number SEN_MISC_Miscdevice_ETS_240
     * @tc.desc   OH_Sensor_DestroySubscriptionId test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest240"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_DestroySubscriptionIdTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest250
     * @tc.number SEN_MISC_Miscdevice_ETS_250
     * @tc.desc   OH_Sensor_DestroySubscriptionId test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest250"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_DestroySubscriptionIdTest2();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest260
     * @tc.number SEN_MISC_Miscdevice_ETS_260
     * @tc.desc   OH_SensorSubscriptionId_GetType test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest260"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorSubscriptionId_GetTypeTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest270
     * @tc.number SEN_MISC_Miscdevice_ETS_270
     * @tc.desc   OH_Sensor_DestroySubscriptionAttribute test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest270"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_DestroySubscriptionAttributeTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest280
     * @tc.number SEN_MISC_Miscdevice_ETS_280
     * @tc.desc   OH_Sensor_DestroySubscriptionAttribute test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest280"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_DestroySubscriptionAttributeTest2();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest290
     * @tc.number SEN_MISC_Miscdevice_ETS_290
     * @tc.desc   OH_SensorSubscriptionAttribute_GetSamplingInterval test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest290"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorSubscriptionAttribute_GetSamplingIntervalTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest300
     * @tc.number SEN_MISC_Miscdevice_ETS_300
     * @tc.desc   OH_Sensor_DestroySubscriber test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest300"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_DestroySubscriberTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest310
     * @tc.number SEN_MISC_Miscdevice_ETS_310
     * @tc.desc   OH_Sensor_DestroySubscriber test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest310"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_DestroySubscriberTest2();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest320
     * @tc.number SEN_MISC_Miscdevice_ETS_320
     * @tc.desc   OH_SensorSubscriber_GetCallback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest320"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensorSubscriber_GetCallbackTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SUCCESS);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });


    /**
     * @tc.name   testSensor_typeNdkTest330
     * @tc.number SEN_MISC_Miscdevice_ETS_330
     * @tc.desc   VIBRATOR_USAGE_UNKNOWN test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest330"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        if(isAvailable){
          expect(ret).assertEqual(SENSOR_SUCCESS);
        }else{
          expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        }
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });


    /**
     * @tc.name   testSensor_typeNdkTest340
     * @tc.number SEN_MISC_Miscdevice_ETS_340
     * @tc.desc   VIBRATOR_USAGE_ALARM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest340"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest2();
        console.info(TAG + "Test ret Result ===> " + ret);
        if(isAvailable){
          expect(ret).assertEqual(SENSOR_SUCCESS);
        }else{
          expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        }
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });


    /**
     * @tc.name   testSensor_typeNdkTest350
     * @tc.number SEN_MISC_Miscdevice_ETS_350
     * @tc.desc   VIBRATOR_USAGE_RING test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest350"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest3();
        console.info(TAG + "Test ret Result ===> " + ret);
        if (isAvailable) {
          expect(ret).assertEqual(SENSOR_SUCCESS);
        } else {
          expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        }
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });


    /**
     * @tc.name   testSensor_typeNdkTest360
     * @tc.number SEN_MISC_Miscdevice_ETS_360
     * @tc.desc   VIBRATOR_USAGE_NOTIFICATION test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest360"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest4();
        console.info(TAG + "Test ret Result ===> " + ret);
        if (isAvailable) {
          expect(ret).assertEqual(SENSOR_SUCCESS);
        } else {
          expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        }
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });


    /**
     * @tc.name   testSensor_typeNdkTest370
     * @tc.number SEN_MISC_Miscdevice_ETS_370
     * @tc.desc   VIBRATOR_USAGE_COMMUNICATION test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest370"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest5();
        console.info(TAG + "Test ret Result ===> " + ret);
        if (isAvailable) {
          expect(ret).assertEqual(SENSOR_SUCCESS);
        } else {
          expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        }
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });


    /**
     * @tc.name   testSensor_typeNdkTest380
     * @tc.number SEN_MISC_Miscdevice_ETS_380
     * @tc.desc   VIBRATOR_USAGE_TOUCH test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest380"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest6();
        console.info(TAG + "Test ret Result ===> " + ret);
        if (isAvailable) {
          expect(ret).assertEqual(SENSOR_SUCCESS);
        } else {
          expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        }
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });


    /**
     * @tc.name   testSensor_typeNdkTest390
     * @tc.number SEN_MISC_Miscdevice_ETS_390
     * @tc.desc   VIBRATOR_USAGE_MEDIA and DEVICE_OPERATION_FAILED test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest390"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest7();
        console.info(TAG + "Test ret Result ===> " + ret);
        if (isAvailable) {
          expect(ret).assertEqual(SENSOR_SUCCESS);
        } else {
          expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        }
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest400
     * @tc.number SEN_MISC_Miscdevice_ETS_400
     * @tc.desc   VIBRATOR_USAGE_PHYSICAL_FEEDBACK ande OH_Vibrator_PlayVibration test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest400"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest8();
        console.info(TAG + "Test ret Result ===> " + ret);
        if (isAvailable) {
          expect(ret).assertEqual(SENSOR_SUCCESS);
        } else {
          expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        }
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });


    /**
     * @tc.name   testSensor_typeNdkTest410
     * @tc.number SEN_MISC_Miscdevice_ETS_410
     * @tc.desc   VIBRATOR_USAGE_SIMULATED_REALITY test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest410"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest9();
        console.info(TAG + "Test ret Result ===> " + ret);
        if (isAvailable) {
          expect(ret).assertEqual(SENSOR_SUCCESS);
        } else {
          expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        }
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });


    /**
     * @tc.name   testSensor_typeNdkTest420
     * @tc.number SEN_MISC_Miscdevice_ETS_420
     * @tc.desc   VIBRATOR_USAGE_MAX test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest420"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_AttributeTest10();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest430
     * @tc.number SEN_MISC_Miscdevice_ETS_430
     * @tc.desc   SENSOR_ACCURACY_LOW test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest430"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_AccuracyTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest440
     * @tc.number SEN_MISC_Miscdevice_ETS_440
     * @tc.desc   SENSOR_ACCURACY_MEDIUM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest440"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_AccuracyTest2();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest450
     * @tc.number SEN_MISC_Miscdevice_ETS_450
     * @tc.desc   SENSOR_ACCURACY_LOW test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest450"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_AccuracyTest3();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest460
     * @tc.number SEN_MISC_Miscdevice_ETS_460
     * @tc.desc   OH_Sensor_Subscribe test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest460"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_SubscribeTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SERVICE_EXCEPTION);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest470
     * @tc.number SEN_MISC_Miscdevice_ETS_470
     * @tc.desc   OH_Sensor_Unsubscribe test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest470"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.sensor_UnsubscribeTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(SENSOR_SERVICE_EXCEPTION);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest480
     * @tc.number SEN_MISC_Miscdevice_ETS_480
     * @tc.desc   OH_Vibrator_PlayVibrationCustom test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest480"
      try {
        console.info(TAG + "===> START");
        let ret : number = sensor.vibrator_PlayVibrationCustomTest1();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(PARAMETER_ERROR);
        done()
      } catch (err)  {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest490
     * @tc.number SEN_MISC_Miscdevice_ETS_490
     * @tc.desc   OH_Vibrator_PlayVibrationCustom test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest490"
      try {
        console.info(TAG + "===> START");
        let ret: number = sensor.vibrator_PlayVibrationCustomTest2();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(DEVICE_OPERATION_FAILED);
        done()
      } catch (err) {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   testSensor_typeNdkTest500
     * @tc.number SEN_MISC_Miscdevice_ETS_500
     * @tc.desc   permission_denied test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSensor_typeNdkTest500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "testSensor_typeNdkTest500"
      try {
        console.info(TAG + "===> START");
        let ret: number = sensor.permission_deniedTest();
        console.info(TAG + "Test ret Result ===> " + ret);
        expect(ret).assertEqual(0);
        done()
      } catch (err) {
        console.error(TAG + "Test err ===>" + err);
        done();
      }
    });

    /**
     * @tc.name   SUB_Sensor_NDK_Sensor_Result_0100
     * @tc.number SUB_Sensor_NDK_Sensor_Result_0100
     * @tc.desc   SUB_Sensor_NDK_Sensor_Result_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Sensor_NDK_Sensor_Result_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let result: number = sensor.sensor_Result_0100();
        console.info(`====>SUB_Sensor_NDK_Sensor_Result_0100 result: ${result}`);
        expect(result == 1).assertTrue()
        done();
      } catch (err) {
        console.info(`====>SUB_Sensor_NDK_Sensor_Result_0100 fail, error is ${JSON.stringify(err)}`);
        expect().assertFail()
        done();
      }
    });

  })
}
    