/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import {sensor} from '@kit.SensorServiceKit'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

function callback(data: sensor.OrientationResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.beta)).assertEqual("number");
  expect(typeof(data.gamma)).assertEqual("number");
  expect(typeof(data.alpha)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("long");
}

function onSensorCallback(data: sensor.OrientationResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.beta)).assertEqual("number");
  expect(typeof(data.gamma)).assertEqual("number");
  expect(typeof(data.alpha)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("long");
}

function onHallCallback(data: sensor.HallResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Hall callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'Hall callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.status)).assertEqual("number");
}

function onAmbientLightCallback(data: sensor.LightResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'AmbientLight callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'AmbientLight callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.intensity)).assertEqual("number");
  expect(typeof(data.colorTemperature)).assertEqual("number");
  expect(typeof(data.infraredLuminance)).assertEqual("number");
}

function onProximityCallback(data: sensor.ProximityResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Proximity callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'Proximity callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.distance)).assertEqual("number");
}

function onWearDetectionCallback(data: sensor.WearDetectionResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'WearDetection callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'WearDetection callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.value)).assertEqual("number");
}

function onSignificantMotionCallback(data: sensor.SignificantMotionResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'SignificantMotion callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'SignificantMotion callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.scalar)).assertEqual("number");
}

function onRotationVectorCallback(data: sensor.RotationVectorResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'RotationVector callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'RotationVector callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
  expect(typeof(data.w)).assertEqual("number");
}

function onPedometerDetectionCallback(data: sensor.PedometerDetectionResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'PedometerDetection callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'PedometerDetection callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.scalar)).assertEqual("number");
}

function onPedometerCallback(data: sensor.PedometerResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Pedometer callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'Pedometer callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.steps)).assertEqual("number");
}

function onMagneticFieldUncalibratedCallback(data: sensor.MagneticFieldUncalibratedResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'MagneticFieldUncalibrated callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'MagneticFieldUncalibrated callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
  expect(typeof(data.biasX)).assertEqual("number");
  expect(typeof(data.biasY)).assertEqual("number");
  expect(typeof(data.biasZ)).assertEqual("number");
}

function onMagneticFieldCallback(data: sensor.MagneticFieldResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'MagneticField callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'MagneticField callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

function onLinearAccelerometerCallback(data: sensor.LinearAccelerometerResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'LinearAccelerometer callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'LinearAccelerometer callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

function onHumidityCallback(data: sensor.HumidityResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Humidity callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'Humidity callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.humidity)).assertEqual("number");
}

function onHeartRateCallback(data: sensor.HeartRateResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'HeartRate callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'HeartRate callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.heartRate)).assertEqual("number");
}

function onGyroscopeUncalibratedCallback(data: sensor.GyroscopeUncalibratedResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'GyroscopeUncalibrated callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'GyroscopeUncalibrated callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
  expect(typeof(data.biasX)).assertEqual("number");
  expect(typeof(data.biasY)).assertEqual("number");
  expect(typeof(data.biasZ)).assertEqual("number");
}

function onGyroscopeCallback(data: sensor.GyroscopeResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Gyroscope callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'Gyroscope callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

function onGravityCallback(data: sensor.GravityResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Gravity callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'Gravity callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

function onBarometerCallback(data: sensor.BarometerResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Barometer callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'Barometer callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.pressure)).assertEqual("number");
}

function onAmbientTemperatureCallback(data: sensor.AmbientTemperatureResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'AmbientTemperature callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'AmbientTemperature callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.temperature)).assertEqual("number");
}

function onAccelerometerUncalibratedCallback(data: sensor.AccelerometerUncalibratedResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'AccelerometerUncalibrated callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'AccelerometerUncalibrated callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
  expect(typeof(data.biasX)).assertEqual("number");
  expect(typeof(data.biasY)).assertEqual("number");
  expect(typeof(data.biasZ)).assertEqual("number");
}

function onAccelerometerCallback(data: sensor.AccelerometerResponse) {
  if (data.accuracy >= sensor.SensorAccuracy.ACCURACY_UNRELIABLE && data.accuracy <=
  sensor.SensorAccuracy.ACCURACY_HIGH) {
    hilog.info(0x0000, 'testTag', 'Accelerometer callback accuracy verified' + JSON.stringify(data));
  } else {
    hilog.info(0x0000, 'testTag', 'Accelerometer callback invalid accuracy encountered' + JSON.stringify(data));
    expect(false).assertTrue();
  }
  expect(typeof(data.x)).assertEqual("number");
  expect(typeof(data.y)).assertEqual("number");
  expect(typeof(data.z)).assertEqual("number");
}

function onFusionPressureCallback(data: sensor.FusionPressureResponse) {
  expect(typeof (data.fusionPressure)).assertEqual("number");
}

export default function SensorJsStaticTest() {
  describe("SensorJsStaticTest", ():void => {
    const PERMISSION_DENIED_CODE = 201;
    const NON_SYSTEM_API_CODE = 202;
    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const SENSOR_NO_SUPPORT_CODE = 14500102
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'
    let sensorList: Array<sensor.Sensor> | undefined = undefined
    let invalid = -1;
    let TAG = '';
    let Available = false;

    beforeAll((done: () => void): Promise<void> =>{
      hilog.info(domain, tag, 'beforeAll called');
      try {
        sensor.getSensorList((err: BusinessError<void> | null, data: Array<sensor.Sensor> | undefined) => {
          hilog.info(0x0000, 'testTag',  `beforeAll Succeeded in getting GetSensorList err.code ${err?.code} ,err.message${err?.message}`);
          sensorList = data
          done();
        });
        hilog.info(0x0000, 'testTag', `beforeAll success ${sensorList}`);
        done();
      } catch (error) {
        hilog.info(0x0000, 'testTag', `beforeAll failed err.code ${error.code} ,err.message${error.message}`);
        done();
      }
    })

    let isAvailable = async (data: sensor.SensorId): Promise<void>=> {
      if (sensorList != undefined) {
        const targetSensor = sensorList?.filter((sensors:sensor.Sensor) => sensors.sensorId === data)
        hilog.info(0x0000, 'testTag', `isAvailable : ${targetSensor},length : ${targetSensor?.length}`);
        if (targetSensor?.length != 0) {
          Available = true
          hilog.info(0x0000, 'testTag', `Available : ${Available}`);
        } else {
          Available = false
          hilog.info(0x0000, 'testTag', `Available : ${Available}`);
        }
      } else {
        hilog.info(0x0000, 'testTag', `sensorList : ${sensorList}`);
      }
    }

    /**
     * @tc.name   orientating_SensorJsTest_static_005
     * @tc.number SUB_SensorsSystem_static_JsTest_0050
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("orientating_SensorJsTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_005--------------');
        await isAvailable(sensor.SensorId.ORIENTATION);
        let InfoParam: sensor.SensorInfoParam = {
          deviceId: -1,
          sensorIndex: 0
        }
        try {
          sensor.onOrientationChange(callback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_005 off in--------------');
            sensor.offOrientationChange(InfoParam);
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_005 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `orientating_SensorJsTest_static_005 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   orientating_SensorJsTest_static_006
     * @tc.number SUB_SensorsSystem_static_JsTest_0060
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("orientating_SensorJsTest_static_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_006--------------');
        await isAvailable(sensor.SensorId.ORIENTATION);
        try {
          sensor.onOrientationChange(onSensorCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_006 off in--------------');
            sensor.offOrientationChange();
            hilog.info(0x0000, 'testTag', '---------orientating_SensorJsTest_static_006 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `orientating_SensorJsTest_static_006 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   orientatingParamError_SensorJsTest_static_050
     * @tc.number SUB_SensorsSystem_static_JsTest_0500
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("orientatingParamError_SensorJsTest_static_050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientatingParamError_SensorJsTest_static_050--------------');
        await isAvailable(sensor.SensorId.ORIENTATION);
        try {
          sensor.onOrientationChange(onSensorCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `orientatingParamError_SensorJsTest_static_050 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   paramTest_SensorJsTest_static_073
     * @tc.number SUB_SensorsSystem_static_JsTest_0730
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("paramTest_SensorJsTest_static_073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------paramTest_SensorJsTest_static_073--------------');
        try {
          let accUnreliable: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_UNRELIABLE;
          let accLow: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_LOW;
          let accMedium: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_MEDIUM;
          let accHigh: sensor.SensorAccuracy = sensor.SensorAccuracy.ACCURACY_HIGH;
          let orientationResponseParam: sensor.OrientationResponse = {
            accuracy: accUnreliable,
            timestamp: 100000000,
            beta: 1.0,
            gamma: 2.0,
            alpha: 3.0,
          };
          expect(orientationResponseParam !== null).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `orientatingParamError_SensorJsTest_static_050 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   getRotationMatrix_SensorJsTest_static_001
     * @tc.number SUB_SensorsSystem_static_JsTest_0010
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getRotationMatrix_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getRotationMatrix_SensorJsTest_static_001--------------');
        try {
          let gravity: double[] = [-0.27775216, 0.5351276, 9.788099];
          let geomagnetic: double[] = [210.87253, -78.6096, -111.44444];
          sensor.getRotationMatrix(gravity, geomagnetic, (err: BusinessError<void> | null, data: sensor.RotationMatrixResponse | undefined) => {
            hilog.info(0x0000, 'testTag', ' Succeeded in getting rotationMatrix: ' + JSON.stringify(data) + '.err:' + err);
            if (data != undefined) {
              expect(data?.rotation != null).assertTrue();
              expect(data?.inclination != null).assertTrue();
            }
            expect(err == null).assertTrue();
            done();
          });
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', ' getRotationMatrix_SensorJsTest_static_001 fail, errCode:' + e.code);
          if (e.code == 401) {
            expect(e.code == 401).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   getRotationMatrix_SensorJsTest_static_002
     * @tc.number SUB_SensorsSystem_static_JsTest_0020
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getRotationMatrix_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getRotationMatrix_SensorJsTest_static_002--------------');
        try {
          let gravity: double[] = [-0.27775216, 0.5351276, 9.788099];
          let geomagnetic: double[] = [210.87253, -78.6096, -111.44444];
          const promise = await sensor.getRotationMatrix(gravity, geomagnetic);
          hilog.info(0x0000, 'testTag', ` GetOrientation success, promise: {JSON.stringify(promise)}`);
          expect(promise != null).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', ' getRotationMatrix_SensorJsTest_static_001 fail, errCode:' + e.code);
          if (e.code == 401) {
            expect(e.code == 401).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   getOrientation_SensorJsTest_static_002
     * @tc.number SUB_SensorsSystem_static_JsTest_0021
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getOrientation_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getOrientation_SensorJsTest_static_002--------------');
        try {
          let preRotationMatrix: double[] = [1, 0, 0, 0, 0.87, -0.50, 0, 0.50, 0.87];
          sensor.getOrientation(preRotationMatrix, (err: BusinessError<void> | null, data: Array<double> | undefined) => {
            hilog.info(0x0000, 'testTag', ' Succeeded in getting orientation: ' + JSON.stringify(data) + '.err:' + err);
            expect(err == null).assertTrue();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetOrientation fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   getOrientation_SensorJsTest_static_003
     * @tc.number SUB_SensorsSystem_static_JsTest_0030
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getOrientation_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getOrientation_SensorJsTest_static_003--------------');
        try {
          let preRotationMatrix: double[] = [1, 0, 0, 0, 0.87, -0.50, 0, 0.50, 0.87];
          const promise = await sensor.getOrientation(preRotationMatrix);
          hilog.info(0x0000, 'testTag', ` GetOrientation success, promise: {JSON.stringify(promise)}`);
          expect(promise != null).assertTrue();
          done();
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetOrientation fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   getRotationMatrixSync_SensorJsTest_static_003
     * @tc.number SUB_SensorsSystem_static_JsTest_0031
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getRotationMatrixSync_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getRotationMatrixSync_SensorJsTest_static_003--------------');
        try {
          let rotationVector: double[] = [0.20046076, 0.21907, 0.73978853, 0.60376877];
          sensor.getRotationMatrix(rotationVector, (err: BusinessError<void> | null, data: Array<double> | undefined) => {
            hilog.info(0x0000, 'testTag', ' Succeeded in getting GetRotationMatrixSync: ' + JSON.stringify(data) + '.err:' + err);
            expect(err == null).assertTrue();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetRotationMatrixSync fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   getRotationMatrixSync_SensorJsTest_static_004
     * @tc.number SUB_SensorsSystem_static_JsTest_0040
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getRotationMatrixSync_SensorJsTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getRotationMatrixSync_SensorJsTest_static_004--------------');
        try {
          let rotationVector: double[] = [0.20046076, 0.21907, 0.73978853, 0.60376877];
          const promise = await sensor.getRotationMatrix(rotationVector);
          hilog.info(0x0000, 'testTag', ` getRotationMatrix success, promise: {JSON.stringify(promise)}`);
          expect(promise != null).assertTrue();
          done();
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetRotationMatrixSync fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   getSensorList_SensorJsTest_static_004
     * @tc.number SUB_SensorsSystem_static_JsTest_0041
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getSensorList_SensorJsTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getSensorList_SensorJsTest_static_004--------------');
        try {
          sensor.getSensorList((err: BusinessError<void> | null, data: Array<sensor.Sensor> | undefined) => {
            hilog.info(0x0000, 'testTag', ' Succeeded in getting GetSensorList: ' + JSON.stringify(data) + '.err:' + err);
            expect(err == null).assertTrue();
            done();
          });
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetSensorList fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   getSensorList_SensorJsTest_static_005
     * @tc.number SUB_SensorsSystem_static_JsTest_0051
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("getSensorList_SensorJsTest_static_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------getSensorList_SensorJsTest_static_005--------------');
        try {
          let data: Array<sensor.Sensor> = await sensor.getSensorList();
          hilog.info(0x0000, 'testTag', ' Succeeded in getting GetSensorList: ' + JSON.stringify(data));
          expect(typeof (data[0].sensorName) == 'string').assertTrue();
          expect(typeof (data[0].vendorName) == 'string').assertTrue();
          expect(typeof (data[0].firmwareVersion) == 'string').assertTrue();
          expect(typeof (data[0].hardwareVersion) == 'string').assertTrue();
          expect(typeof (data[0].sensorId) == 'int').assertTrue();
          expect(typeof (data[0].maxRange) == 'number').assertTrue();
          expect(typeof (data[0].minSamplePeriod) == 'long').assertTrue();
          expect(typeof (data[0].maxSamplePeriod) == 'long').assertTrue();
          expect(typeof (data[0].precision) == 'number').assertTrue();
          expect(typeof (data[0].power) == 'number').assertTrue();
          done();
        } catch (error) {
          hilog.info(0x0000, 'testTag', ' GetSensorList fail, errCode:' + error);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   hall_SensorJsTest_static_007
     * @tc.number SUB_SensorsSystem_static_JsTest_0070
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("hall_SensorJsTest_static_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------hall_SensorJsTest_static_007--------------');
        await isAvailable(sensor.SensorId.HALL);
        try {
          sensor.onHallChange(onHallCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------hall_SensorJsTest_static_007 off in--------------');
            sensor.offHallChange();
            hilog.info(0x0000, 'testTag', '---------hall_SensorJsTest_static_007 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `hall_SensorJsTest_static_007 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   ambientLight_SensorJsTest_static_008
     * @tc.number SUB_SensorsSystem_static_JsTest_0080
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("ambientLight_SensorJsTest_static_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientLight_SensorJsTest_static_008--------------');
        await isAvailable(sensor.SensorId.AMBIENT_LIGHT);
        try {
          sensor.onAmbientLightChange(onAmbientLightCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------ambientLight_SensorJsTest_static_008 off in--------------');
            sensor.offAmbientLightChange();
            hilog.info(0x0000, 'testTag', '---------ambientLight_SensorJsTest_static_008 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `ambientLight_SensorJsTest_static_008 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   proximity_SensorJsTest_static_009
     * @tc.number SUB_SensorsSystem_static_JsTest_0090
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("proximity_SensorJsTest_static_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------proximity_SensorJsTest_static_009--------------');
        await isAvailable(sensor.SensorId.PROXIMITY);
        try {
          sensor.onProximityChange(onProximityCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------proximity_SensorJsTest_static_009 off in--------------');
            sensor.offProximityChange();
            hilog.info(0x0000, 'testTag', '---------proximity_SensorJsTest_static_009 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `proximity_SensorJsTest_static_009 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   wearDetection_SensorJsTest_static_010
     * @tc.number SUB_SensorsSystem_static_JsTest_0100
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("wearDetection_SensorJsTest_static_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------wearDetection_SensorJsTest_static_010--------------');
        await isAvailable(sensor.SensorId.WEAR_DETECTION);
        try {
          sensor.onWearDetectionChange(onWearDetectionCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------wearDetection_SensorJsTest_static_010 off in--------------');
            sensor.offWearDetectionChange();
            hilog.info(0x0000, 'testTag', '---------wearDetection_SensorJsTest_static_010 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `wearDetection_SensorJsTest_static_010 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   significantMotion_SensorJsTest_static_011
     * @tc.number SUB_SensorsSystem_static_JsTest_0110
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("significantMotion_SensorJsTest_static_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------significantMotion_SensorJsTest_static_011--------------');
        await isAvailable(sensor.SensorId.SIGNIFICANT_MOTION);
        try {
          sensor.onSignificantMotionChange(onSignificantMotionCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------significantMotion_SensorJsTest_static_011 off in--------------');
            sensor.offSignificantMotionChange();
            hilog.info(0x0000, 'testTag', '---------significantMotion_SensorJsTest_static_011 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `significantMotion_SensorJsTest_static_011 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   rotationVector_SensorJsTest_static_012
     * @tc.number SUB_SensorsSystem_static_JsTest_0120
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("rotationVector_SensorJsTest_static_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------rotationVector_SensorJsTest_static_012--------------');
        await isAvailable(sensor.SensorId.ROTATION_VECTOR);
        try {
          sensor.onRotationVectorChange(onRotationVectorCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------rotationVector_SensorJsTest_static_012 off in--------------');
            sensor.offRotationVectorChange();
            hilog.info(0x0000, 'testTag', '---------rotationVector_SensorJsTest_static_012 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `rotationVector_SensorJsTest_static_012 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   pedometerDetection_SensorJsTest_static_013
     * @tc.number SUB_SensorsSystem_static_JsTest_0130
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("pedometerDetection_SensorJsTest_static_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerDetection_SensorJsTest_static_013--------------');
        await isAvailable(sensor.SensorId.PEDOMETER_DETECTION);
        try {
          sensor.onPedometerDetectionChange(onPedometerDetectionCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------pedometerDetection_SensorJsTest_static_013 off in--------------');
            sensor.offPedometerDetectionChange();
            hilog.info(0x0000, 'testTag', '---------pedometerDetection_SensorJsTest_static_013 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `pedometerDetection_SensorJsTest_static_013 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   pedometer_SensorJsTest_static_014
     * @tc.number SUB_SensorsSystem_static_JsTest_0140
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("pedometer_SensorJsTest_static_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometer_SensorJsTest_static_014--------------');
        await isAvailable(sensor.SensorId.PEDOMETER);
        try {
          sensor.onPedometerChange(onPedometerCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------pedometer_SensorJsTest_static_014 off in--------------');
            sensor.offPedometerChange();
            hilog.info(0x0000, 'testTag', '---------pedometer_SensorJsTest_static_014 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `pedometer_SensorJsTest_static_014 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   magneticFieldUncalibrated_SensorJsTest_static_015
     * @tc.number SUB_SensorsSystem_static_JsTest_0150
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("magneticFieldUncalibrated_SensorJsTest_static_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibrated_SensorJsTest_static_015--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED);
        try {
          sensor.onMagneticFieldUncalibratedChange(onMagneticFieldUncalibratedCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibrated_SensorJsTest_static_015 off in--------------');
            sensor.offMagneticFieldUncalibratedChange();
            hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibrated_SensorJsTest_static_015 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `magneticFieldUncalibrated_SensorJsTest_static_015 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   magneticField_SensorJsTest_static_016
     * @tc.number SUB_SensorsSystem_static_JsTest_0160
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("magneticField_SensorJsTest_static_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticField_SensorJsTest_static_016--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD);
        try {
          sensor.onMagneticFieldChange(onMagneticFieldCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------magneticField_SensorJsTest_static_016 off in--------------');
            sensor.offMagneticFieldChange();
            hilog.info(0x0000, 'testTag', '---------magneticField_SensorJsTest_static_016 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `magneticField_SensorJsTest_static_016 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   linearAccelerometer_SensorJsTest_static_017
     * @tc.number SUB_SensorsSystem_static_JsTest_0170
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("linearAccelerometer_SensorJsTest_static_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------linearAccelerometer_SensorJsTest_static_017--------------');
        await isAvailable(sensor.SensorId.LINEAR_ACCELEROMETER);
        try {
          sensor.onLinearAccelerometerChange(onLinearAccelerometerCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------linearAccelerometer_SensorJsTest_static_017 off in--------------');
            sensor.offLinearAccelerometerChange();
            hilog.info(0x0000, 'testTag', '---------linearAccelerometer_SensorJsTest_static_017 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `linearAccelerometer_SensorJsTest_static_017 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   humidity_SensorJsTest_static_018
     * @tc.number SUB_SensorsSystem_static_JsTest_0180
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("humidity_SensorJsTest_static_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------humidity_SensorJsTest_static_018--------------');
        await isAvailable(sensor.SensorId.HUMIDITY);
        try {
          sensor.onHumidityChange(onHumidityCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------humidity_SensorJsTest_static_018 off in--------------');
            sensor.offHumidityChange();
            hilog.info(0x0000, 'testTag', '---------humidity_SensorJsTest_static_018 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `humidity_SensorJsTest_static_018 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   heartRate_SensorJsTest_static_019
     * @tc.number SUB_SensorsSystem_static_JsTest_0190
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("heartRate_SensorJsTest_static_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------heartRate_SensorJsTest_static_019--------------');
        await isAvailable(sensor.SensorId.HEART_RATE);
        try {
          sensor.onHeartRateChange(onHeartRateCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------heartRate_SensorJsTest_static_019 off in--------------');
            sensor.offHeartRateChange();
            hilog.info(0x0000, 'testTag', '---------heartRate_SensorJsTest_static_019 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `heartRate_SensorJsTest_static_019 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   gyroscopeUncalibrated_SensorJsTest_static_020
     * @tc.number SUB_SensorsSystem_static_JsTest_0200
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("gyroscopeUncalibrated_SensorJsTest_static_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibrated_SensorJsTest_static_020--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
        try {
          sensor.onGyroscopeUncalibratedChange(onGyroscopeUncalibratedCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibrated_SensorJsTest_static_020 off in--------------');
            sensor.offGyroscopeUncalibratedChange();
            hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibrated_SensorJsTest_static_020 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `gyroscopeUncalibrated_SensorJsTest_static_020 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   gyroscope_SensorJsTest_static_021
     * @tc.number SUB_SensorsSystem_static_JsTest_0210
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("gyroscope_SensorJsTest_static_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscope_SensorJsTest_static_021--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE);
        try {
          sensor.onGyroscopeChange(onGyroscopeCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------gyroscope_SensorJsTest_static_021 off in--------------');
            sensor.offGyroscopeChange();
            hilog.info(0x0000, 'testTag', '---------gyroscope_SensorJsTest_static_021 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `gyroscope_SensorJsTest_static_021 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   gravity_SensorJsTest_static_022
     * @tc.number SUB_SensorsSystem_static_JsTest_0220
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("gravity_SensorJsTest_static_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gravity_SensorJsTest_static_022--------------');
        await isAvailable(sensor.SensorId.GRAVITY);
        try {
          sensor.onGravityChange(onGravityCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------gravity_SensorJsTest_static_022 off in--------------');
            sensor.offGravityChange();
            hilog.info(0x0000, 'testTag', '---------gravity_SensorJsTest_static_022 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `gravity_SensorJsTest_static_022 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   barometer_SensorJsTest_static_023
     * @tc.number SUB_SensorsSystem_static_JsTest_0230
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("barometer_SensorJsTest_static_023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------barometer_SensorJsTest_static_023--------------');
        await isAvailable(sensor.SensorId.BAROMETER);
        try {
          sensor.onBarometerChange(onBarometerCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------barometer_SensorJsTest_static_023 off in--------------');
            sensor.offBarometerChange();
            hilog.info(0x0000, 'testTag', '---------barometer_SensorJsTest_static_023 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `barometer_SensorJsTest_static_023 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   ambientTemperature_SensorJsTest_static_024
     * @tc.number SUB_SensorsSystem_static_JsTest_0240
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("ambientTemperature_SensorJsTest_static_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientTemperature_SensorJsTest_static_024--------------');
        await isAvailable(sensor.SensorId.AMBIENT_TEMPERATURE);
        try {
          sensor.onAmbientTemperatureChange(onAmbientTemperatureCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------ambientTemperature_SensorJsTest_static_024 off in--------------');
            sensor.offAmbientTemperatureChange();
            hilog.info(0x0000, 'testTag', '---------ambientTemperature_SensorJsTest_static_024 off end--------------');
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `ambientTemperature_SensorJsTest_static_024 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   accelerometerUncalibrated_SensorJsTest_static_025
     * @tc.number SUB_SensorsSystem_static_JsTest_0250
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("accelerometerUncalibrated_SensorJsTest_static_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerUncalibrated_SensorJsTest_static_025--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
        try {
          sensor.onAccelerometerUncalibratedChange(onAccelerometerUncalibratedCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------accelerometerUncalibrated_SensorJsTest_static_025 off in--------------');
            sensor.offAccelerometerUncalibratedChange();
            hilog.info(0x0000, 'testTag', '---------accelerometerUncalibrated_SensorJsTest_static_025 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `accelerometerUncalibrated_SensorJsTest_static_025 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   accelerometer_SensorJsTest_static_026
     * @tc.number SUB_SensorsSystem_static_JsTest_0260
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("accelerometer_SensorJsTest_static_026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometer_SensorJsTest_static_026--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER);
        try {
          sensor.onAccelerometerChange(onAccelerometerCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------accelerometer_SensorJsTest_static_026 off in--------------');
            sensor.offAccelerometerChange();
            hilog.info(0x0000, 'testTag', '---------accelerometer_SensorJsTest_static_026 off end--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `accelerometer_SensorJsTest_static_026 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   orientatingOnce_SensorJsTest_static_029
     * @tc.number SUB_SensorsSystem_static_JsTest_0290
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("orientatingOnce_SensorJsTest_static_029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------orientatingOnce_SensorJsTest_static_029--------------');
        await isAvailable(sensor.SensorId.ORIENTATION);
        try {
          sensor.onceOrientationChange(onSensorCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `orientatingOnce_SensorJsTest_static_029 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   hallOnce_SensorJsTest_static_030
     * @tc.number SUB_SensorsSystem_static_JsTest_0300
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("hallOnce_SensorJsTest_static_030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------hallOnce_SensorJsTest_static_030--------------');
        await isAvailable(sensor.SensorId.HALL);
        try {
          sensor.onceHallChange(onHallCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `hallOnce_SensorJsTest_static_030 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   ambientLightOnce_SensorJsTest_static_031
     * @tc.number SUB_SensorsSystem_static_JsTest_0310
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("ambientLightOnce_SensorJsTest_static_031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientLightOnce_SensorJsTest_static_031--------------');
        await isAvailable(sensor.SensorId.AMBIENT_LIGHT);
        try {
          sensor.onceAmbientLightChange(onAmbientLightCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `ambientLightOnce_SensorJsTest_static_031 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   proximityOnce_SensorJsTest_static_032
     * @tc.number SUB_SensorsSystem_static_JsTest_0320
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("proximityOnce_SensorJsTest_static_032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------proximityOnce_SensorJsTest_static_032--------------');
        await isAvailable(sensor.SensorId.PROXIMITY);
        try {
          sensor.onceProximityChange(onProximityCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `proximityOnce_SensorJsTest_static_032 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   wearDetectionOnce_SensorJsTest_static_033
     * @tc.number SUB_SensorsSystem_static_JsTest_0330
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("wearDetectionOnce_SensorJsTest_static_033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------wearDetectionOnce_SensorJsTest_static_033--------------');
        await isAvailable(sensor.SensorId.WEAR_DETECTION);
        try {
          sensor.onceWearDetectionChange(onWearDetectionCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `wearDetectionOnce_SensorJsTest_static_033 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   significantMotionOnce_SensorJsTest_static_034
     * @tc.number SUB_SensorsSystem_static_JsTest_0340
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("significantMotionOnce_SensorJsTest_static_034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------significantMotionOnce_SensorJsTest_static_034--------------');
        await isAvailable(sensor.SensorId.SIGNIFICANT_MOTION);
        try {
          sensor.onceSignificantMotionChange(onSignificantMotionCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `significantMotionOnce_SensorJsTest_static_034 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   rotationVectorOnce_SensorJsTest_static_035
     * @tc.number SUB_SensorsSystem_static_JsTest_0350
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("rotationVectorOnce_SensorJsTest_static_035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------rotationVectorOnce_SensorJsTest_static_035--------------');
        await isAvailable(sensor.SensorId.ROTATION_VECTOR);
        try {
          sensor.onceRotationVectorChange(onRotationVectorCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `rotationVectorOnce_SensorJsTest_static_035 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   pedometerDetectionOnce_SensorJsTest_static_036
     * @tc.number SUB_SensorsSystem_static_JsTest_0360
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("pedometerDetectionOnce_SensorJsTest_static_036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerDetectionOnce_SensorJsTest_static_036--------------');
        await isAvailable(sensor.SensorId.PEDOMETER_DETECTION);
        try {
          sensor.oncePedometerDetectionChange(onPedometerDetectionCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `pedometerDetectionOnce_SensorJsTest_static_036 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   pedometerOnce_SensorJsTest_static_037
     * @tc.number SUB_SensorsSystem_static_JsTest_0370
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("pedometerOnce_SensorJsTest_static_037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerOnce_SensorJsTest_static_037--------------');
        await isAvailable(sensor.SensorId.PEDOMETER);
        try {
          sensor.oncePedometerChange(onPedometerCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `pedometerOnce_SensorJsTest_static_037 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   magneticFieldUncalibratedOnce_SensorJsTest_static_038
     * @tc.number SUB_SensorsSystem_static_JsTest_0380
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("magneticFieldUncalibratedOnce_SensorJsTest_static_038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibratedOnce_SensorJsTest_static_038--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED);
        try {
          sensor.onceMagneticFieldUncalibratedChange(onMagneticFieldUncalibratedCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `magneticFieldUncalibratedOnce_SensorJsTest_static_038 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   magneticFieldOnce_SensorJsTest_static_039
     * @tc.number SUB_SensorsSystem_static_JsTest_0390
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("magneticFieldOnce_SensorJsTest_static_039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldOnce_SensorJsTest_static_039--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD);
        try {
          sensor.onceMagneticFieldChange(onMagneticFieldCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `magneticFieldOnce_SensorJsTest_static_039 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   linearAccelerometerOnce_SensorJsTest_static_040
     * @tc.number SUB_SensorsSystem_static_JsTest_0400
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("linearAccelerometerOnce_SensorJsTest_static_040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------linearAccelerometerOnce_SensorJsTest_static_040--------------');
        await isAvailable(sensor.SensorId.LINEAR_ACCELEROMETER);
        try {
          sensor.onceLinearAccelerometerChange(onLinearAccelerometerCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `linearAccelerometerOnce_SensorJsTest_static_040 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   humidityOnce_SensorJsTest_static_041
     * @tc.number SUB_SensorsSystem_static_JsTest_0410
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("humidityOnce_SensorJsTest_static_041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------humidityOnce_SensorJsTest_static_041--------------');
        await isAvailable(sensor.SensorId.HUMIDITY);
        try {
          sensor.onceHumidityChange(onHumidityCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `humidityOnce_SensorJsTest_static_041 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   heartRateOnce_SensorJsTest_static_042
     * @tc.number SUB_SensorsSystem_static_JsTest_0420
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("heartRateOnce_SensorJsTest_static_042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------heartRateOnce_SensorJsTest_static_042--------------');
        await isAvailable(sensor.SensorId.HEART_RATE);
        try {
          sensor.onceHeartRateChange(onHeartRateCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `heartRateOnce_SensorJsTest_static_042 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   gyroscopeUncalibratedOnce_SensorJsTest_static_043
     * @tc.number SUB_SensorsSystem_static_JsTest_0430
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("gyroscopeUncalibratedOnce_SensorJsTest_static_043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibratedOnce_SensorJsTest_static_043--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
        try {
          sensor.onceGyroscopeUncalibratedChange(onGyroscopeUncalibratedCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `gyroscopeUncalibratedOnce_SensorJsTest_static_043 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   gyroscopeOnce_SensorJsTest_static_044
     * @tc.number SUB_SensorsSystem_static_JsTest_0440
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("gyroscopeOnce_SensorJsTest_static_044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeOnce_SensorJsTest_static_044--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE);
        try {
          sensor.onceGyroscopeChange(onGyroscopeCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `gyroscopeOnce_SensorJsTest_static_044 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   gravityOnce_SensorJsTest_static_045
     * @tc.number SUB_SensorsSystem_static_JsTest_0450
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("gravityOnce_SensorJsTest_static_045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gravityOnce_SensorJsTest_static_045--------------');
        await isAvailable(sensor.SensorId.GRAVITY);
        try {
          sensor.onceGravityChange(onGravityCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `gravityOnce_SensorJsTest_static_045 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   barometerOnce_SensorJsTest_static_046
     * @tc.number SUB_SensorsSystem_static_JsTest_0460
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("barometerOnce_SensorJsTest_static_046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------barometerOnce_SensorJsTest_static_046--------------');
        await isAvailable(sensor.SensorId.BAROMETER);
        try {
          sensor.onceBarometerChange(onBarometerCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `barometerOnce_SensorJsTest_static_046 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   ambientTemperatureOnce_SensorJsTest_static_047
     * @tc.number SUB_SensorsSystem_static_JsTest_0470
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("ambientTemperatureOnce_SensorJsTest_static_047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientTemperatureOnce_SensorJsTest_static_047--------------');
        await isAvailable(sensor.SensorId.AMBIENT_TEMPERATURE);
        try {
          sensor.onceAmbientTemperatureChange(onAmbientTemperatureCallback);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `ambientTemperatureOnce_SensorJsTest_static_047 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   accelerometerUncalibratedOnce_SensorJsTest_static_048
     * @tc.number SUB_SensorsSystem_static_JsTest_0480
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("accelerometerUncalibratedOnce_SensorJsTest_static_048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerUncalibratedOnce_SensorJsTest_static_048--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
        try {
          sensor.onceAccelerometerUncalibratedChange(onAccelerometerUncalibratedCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `accelerometerUncalibratedOnce_SensorJsTest_static_048 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   accelerometerOnce_SensorJsTest_static_049
     * @tc.number SUB_SensorsSystem_static_JsTest_0490
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("accelerometerOnce_SensorJsTest_static_049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerOnce_SensorJsTest_static_049--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER);
        try {
          sensor.onceAccelerometerChange(onAccelerometerCallback);
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `accelerometerOnce_SensorJsTest_static_049 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(e.code == 201).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     * @tc.name   hallParamError_SensorJsTest_static_051
     * @tc.number SUB_SensorsSystem_static_JsTest_0510
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("hallParamError_SensorJsTest_static_051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------hallParamError_SensorJsTest_static_051--------------');
        await isAvailable(sensor.SensorId.HALL);
        try {
          sensor.onHallChange(onHallCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `hallParamError_SensorJsTest_static_051 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.HALL == sensor.SensorId.HALL).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   ambientLightParamError_SensorJsTest_static_052
     * @tc.number SUB_SensorsSystem_static_JsTest_0520
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("ambientLightParamError_SensorJsTest_static_052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientLightParamError_SensorJsTest_static_052--------------');
        await isAvailable(sensor.SensorId.AMBIENT_LIGHT);
        try {
          sensor.onAmbientLightChange(onAmbientLightCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `ambientLightParamError_SensorJsTest_static_052 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.AMBIENT_LIGHT == sensor.SensorId.AMBIENT_LIGHT).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   proximityParamError_SensorJsTest_static_053
     * @tc.number SUB_SensorsSystem_static_JsTest_0530
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("proximityParamError_SensorJsTest_static_053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------proximityParamError_SensorJsTest_static_053--------------');
        await isAvailable(sensor.SensorId.PROXIMITY);
        try {
          sensor.onProximityChange(onProximityCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `proximityParamError_SensorJsTest_static_053 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.PROXIMITY == sensor.SensorId.PROXIMITY).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   wearDetectionParamError_SensorJsTest_static_054
     * @tc.number SUB_SensorsSystem_static_JsTest_0540
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("wearDetectionParamError_SensorJsTest_static_054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------wearDetectionParamError_SensorJsTest_static_054--------------');
        await isAvailable(sensor.SensorId.WEAR_DETECTION);
        try {
          sensor.onWearDetectionChange(onWearDetectionCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `wearDetectionParamError_SensorJsTest_static_054 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.WEAR_DETECTION == sensor.SensorId.WEAR_DETECTION).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   significantMotionParamError_SensorJsTest_static_055
     * @tc.number SUB_SensorsSystem_static_JsTest_0550
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("significantMotionParamError_SensorJsTest_static_055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------significantMotionParamError_SensorJsTest_static_055--------------');
        await isAvailable(sensor.SensorId.SIGNIFICANT_MOTION);
        try {
          sensor.onSignificantMotionChange(onSignificantMotionCallback, { 'interval': -100000000 });
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `significantMotionParamError_SensorJsTest_static_055 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.SIGNIFICANT_MOTION == sensor.SensorId.SIGNIFICANT_MOTION).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   rotationVectorParamError_SensorJsTest_static_056
     * @tc.number SUB_SensorsSystem_static_JsTest_0560
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("rotationVectorParamError_SensorJsTest_static_056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------rotationVectorParamError_SensorJsTest_static_056--------------');
        await isAvailable(sensor.SensorId.ROTATION_VECTOR);
        try {
          sensor.onRotationVectorChange(onRotationVectorCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `rotationVectorParamError_SensorJsTest_static_056 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.ROTATION_VECTOR == sensor.SensorId.ROTATION_VECTOR).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   pedometerDetectionParamError_SensorJsTest_static_057
     * @tc.number SUB_SensorsSystem_static_JsTest_0570
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("pedometerDetectionParamError_SensorJsTest_static_057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerDetectionParamError_SensorJsTest_static_057--------------');
        await isAvailable(sensor.SensorId.PEDOMETER_DETECTION);
        try {
          sensor.onPedometerDetectionChange(onPedometerDetectionCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `pedometerDetectionParamError_SensorJsTest_static_057 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.PEDOMETER_DETECTION == sensor.SensorId.PEDOMETER_DETECTION).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   pedometerParamError_SensorJsTest_static_058
     * @tc.number SUB_SensorsSystem_static_JsTest_0580
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("pedometerParamError_SensorJsTest_static_058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------pedometerParamError_SensorJsTest_static_058--------------');
        await isAvailable(sensor.SensorId.PEDOMETER);
        try {
          sensor.onPedometerChange(onPedometerCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `pedometerParamError_SensorJsTest_static_058 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.PEDOMETER == sensor.SensorId.PEDOMETER).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   magneticFieldUncalibratedParamError_SensorJsTest_static_059
     * @tc.number SUB_SensorsSystem_static_JsTest_0590
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("magneticFieldUncalibratedParamError_SensorJsTest_static_059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldUncalibratedParamError_SensorJsTest_static_059--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED);
        try {
          sensor.onMagneticFieldUncalibratedChange(onMagneticFieldUncalibratedCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `magneticFieldUncalibratedParamError_SensorJsTest_static_059 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED == sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   magneticFieldParamError_SensorJsTest_static_060
     * @tc.number SUB_SensorsSystem_static_JsTest_0600
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("magneticFieldParamError_SensorJsTest_static_060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------magneticFieldParamError_SensorJsTest_static_060--------------');
        await isAvailable(sensor.SensorId.MAGNETIC_FIELD);
        try {
          sensor.onMagneticFieldChange(onMagneticFieldCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `magneticFieldParamError_SensorJsTest_static_060 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.MAGNETIC_FIELD == sensor.SensorId.MAGNETIC_FIELD).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   linearAccelerometerParamError_SensorJsTest_static_061
     * @tc.number SUB_SensorsSystem_static_JsTest_0610
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("linearAccelerometerParamError_SensorJsTest_static_061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------linearAccelerometerParamError_SensorJsTest_static_061--------------');
        await isAvailable(sensor.SensorId.LINEAR_ACCELEROMETER);
        try {
          sensor.onLinearAccelerometerChange(onLinearAccelerometerCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `linearAccelerometerParamError_SensorJsTest_static_061 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.LINEAR_ACCELEROMETER == sensor.SensorId.LINEAR_ACCELEROMETER).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   humidityParamError_SensorJsTest_static_062
     * @tc.number SUB_SensorsSystem_static_JsTest_0620
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("humidityParamError_SensorJsTest_static_062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------humidityParamError_SensorJsTest_static_062--------------');
        await isAvailable(sensor.SensorId.HUMIDITY);
        try {
          sensor.onHumidityChange(onHumidityCallback, { 'interval': -100000000 });
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `humidityParamError_SensorJsTest_static_062 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.HUMIDITY == sensor.SensorId.HUMIDITY).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   heartRateParamError_SensorJsTest_static_063
     * @tc.number SUB_SensorsSystem_static_JsTest_0630
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("heartRateParamError_SensorJsTest_static_063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------heartRateParamError_SensorJsTest_static_063--------------');
        await isAvailable(sensor.SensorId.HEART_RATE);
        try {
          sensor.onHeartRateChange(onHeartRateCallback, { 'interval': -100000000 });
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `heartRateParamError_SensorJsTest_static_063 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.HEART_RATE == sensor.SensorId.HEART_RATE).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   gyroscopeUncalibratedParamError_SensorJsTest_static_064
     * @tc.number SUB_SensorsSystem_static_JsTest_0640
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("gyroscopeUncalibratedParamError_SensorJsTest_static_064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeUncalibratedParamError_SensorJsTest_static_064--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE_UNCALIBRATED);
        try {
          sensor.onGyroscopeUncalibratedChange(onGyroscopeUncalibratedCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `gyroscopeUncalibratedParamError_SensorJsTest_static_064 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.GYROSCOPE_UNCALIBRATED == sensor.SensorId.GYROSCOPE_UNCALIBRATED).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   gyroscopeParamError_SensorJsTest_static_065
     * @tc.number SUB_SensorsSystem_static_JsTest_0650
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("gyroscopeParamError_SensorJsTest_static_065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gyroscopeParamError_SensorJsTest_static_065--------------');
        await isAvailable(sensor.SensorId.GYROSCOPE);
        try {
          sensor.onGyroscopeChange(onGyroscopeCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `gyroscopeParamError_SensorJsTest_static_065 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.GYROSCOPE == sensor.SensorId.GYROSCOPE).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   gravityParamError_SensorJsTest_static_066
     * @tc.number SUB_SensorsSystem_static_JsTest_0660
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("gravityParamError_SensorJsTest_static_066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------gravityParamError_SensorJsTest_static_066--------------');
        await isAvailable(sensor.SensorId.GRAVITY);
        try {
          sensor.onGravityChange(onGravityCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `gravityParamError_SensorJsTest_static_066 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.GRAVITY == sensor.SensorId.GRAVITY).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   barometerParamError_SensorJsTest_static_067
     * @tc.number SUB_SensorsSystem_static_JsTest_0670
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("barometerParamError_SensorJsTest_static_067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------barometerParamError_SensorJsTest_static_067--------------');
        await isAvailable(sensor.SensorId.BAROMETER);
        try {
          sensor.onBarometerChange(onBarometerCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `barometerParamError_SensorJsTest_static_067 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.BAROMETER == sensor.SensorId.BAROMETER).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   ambientTemperatureParamError_SensorJsTest_static_068
     * @tc.number SUB_SensorsSystem_static_JsTest_0680
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("ambientTemperatureParamError_SensorJsTest_static_068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------ambientTemperatureParamError_SensorJsTest_static_068--------------');
        await isAvailable(sensor.SensorId.AMBIENT_TEMPERATURE);
        try {
          sensor.onAmbientTemperatureChange(onAmbientTemperatureCallback, { 'interval': -100000000 });
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `ambientTemperatureParamError_SensorJsTest_static_068 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.AMBIENT_TEMPERATURE == sensor.SensorId.AMBIENT_TEMPERATURE).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   accelerometerUncalibratedParamError_SensorJsTest_static_069
     * @tc.number SUB_SensorsSystem_static_JsTest_0690
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("accelerometerUncalibratedParamError_SensorJsTest_static_069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerUncalibratedParamError_SensorJsTest_static_069--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER_UNCALIBRATED);
        try {
          sensor.onAccelerometerUncalibratedChange(onAccelerometerUncalibratedCallback, { 'interval': -100000000 });
          expect(false).assertTrue();
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `accelerometerUncalibratedParamError_SensorJsTest_static_069 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.ACCELEROMETER_UNCALIBRATED == sensor.SensorId.ACCELEROMETER_UNCALIBRATED).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   accelerometerParamError_SensorJsTest_static_070
     * @tc.number SUB_SensorsSystem_static_JsTest_0700
     * @tc.desc   Verification results of the incorrect parameters of the test interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("accelerometerParamError_SensorJsTest_static_070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------accelerometerParamError_SensorJsTest_static_070--------------');
        await isAvailable(sensor.SensorId.ACCELEROMETER);
        try {
          sensor.onAccelerometerChange(onAccelerometerCallback, { 'interval': -100000000 });
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `accelerometerParamError_SensorJsTest_static_070 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.ACCELEROMETER == sensor.SensorId.ACCELEROMETER).assertTrue();
          done();
        }
      })

    /**
     *
     * @tc.number     SUB_SensorsSystem_static_JsTest_0710
     * @tc.name       fusion_pressure_SensorJsTest_static_071
     * @tc.desc       Verification results of the incorrect parameters of the test interface.
     */
    it("fusion_pressure_SensorJsTest_static_071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------fusion_pressure_SensorJsTest_static_071--------------');
        await isAvailable(sensor.SensorId.FUSION_PRESSURE);
        try {
          sensor.onFusionPressureChange(onFusionPressureCallback, { 'interval': 100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------fusion_pressure_SensorJsTest_static_071 off in--------------');
            sensor.offFusionPressureChange();
            hilog.info(0x0000, 'testTag', '---------fusion_pressure_SensorJsTest_static_071 off end--------------');
            expect(sensor.SensorId.FUSION_PRESSURE == sensor.SensorId.FUSION_PRESSURE).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `fusion_pressure_SensorJsTest_static_071 failed error.code: ${e.code} , error.message: ${e.message}`);
          if (Available) {
            expect(false).assertTrue();
          } else {
            expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          }
          done();
        }
      })

    /**
     *
     * @tc.number     SUB_SensorsSystem_static_JsTest_0720
     * @tc.name       fusionPressureParamError_SensorJsTest_static_072
     * @tc.desc       Verification results of the incorrect parameters of the test interface.
     */
    it("fusionPressureParamError_SensorJsTest_static_072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, 'testTag', '---------fusionPressureParamError_SensorJsTest_static_072--------------');
        await isAvailable(sensor.SensorId.FUSION_PRESSURE);
        try {
          sensor.onFusionPressureChange(onFusionPressureCallback, { 'interval': -100000000 });
          setTimeout(() => {
            hilog.info(0x0000, 'testTag', '---------fusionPressureParamError_SensorJsTest_static_072 timer in--------------');
            expect(false).assertTrue();
            done();
          }, 500);
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(0x0000, 'testTag', `fusionPressureParamError_SensorJsTest_static_072 failed error.code: ${e.code} , error.message: ${e.message}`);
          expect(e.code == SERVICE_EXCEPTION_CODE).assertTrue();
          expect(sensor.SensorId.FUSION_PRESSURE == sensor.SensorId.FUSION_PRESSURE).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GetSensorListSync_SensorJsTest_static_001
     * @tc.number GetSensorListSync_SensorJsTest_static_001
     * @tc.desc   test getSensorListSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetSensorListSync_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetSensorListSync_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      try {
        let ret = sensor.getSensorListSync();
        for (let i = 0; i < ret.length; i++) {
          hilog.info(domain, tag, TAG + " Succeeded in getting sensor: " + JSON.stringify(ret[i]));
        }
        expect(ret != null).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetSensorListSync_SensorJsTest_static_002
     * @tc.number GetSensorListSync_SensorJsTest_static_002
     * @tc.desc   test getSensorListSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetSensorListSync_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetSensorListSync_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      try {
        let sensors: sensor.Sensor[] = sensor.getSensorListSync();
        if (sensors) {
          hilog.info(domain, tag, TAG + 'getSensorListSync sensors: ' + sensors);
          for (let i = 0; i < sensors.length; i++) {
            hilog.info(domain, tag, TAG + ' sensorName: ' + sensors[i].sensorName);
            hilog.info(domain, tag, TAG + ' vendorName: ' + sensors[i].vendorName);
            hilog.info(domain, tag, TAG + ' firmwareVersion: ' + sensors[i].firmwareVersion);
            hilog.info(domain, tag, TAG + ' hardwareVersion: ' + sensors[i].hardwareVersion);
          }
          expect(sensors != null).assertTrue();
        } else {
          expect(sensors == null).assertTrue();
          hilog.info(domain, tag, TAG + 'getSensorListSync sensors is null');
        }
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetSingleSensorSync_SensorJsTest_static_001
     * @tc.number GetSingleSensorSync_SensorJsTest_static_001
     * @tc.desc   test getSensorListSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetSingleSensorSync_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetSingleSensorSync_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      await isAvailable(sensor.SensorId.ACCELEROMETER);
      try {
        let ret = sensor.getSingleSensorSync(sensor.SensorId.ACCELEROMETER);
        hilog.info(domain, tag, TAG + " Succeeded in getting sensor: " + JSON.stringify(ret));
        expect(ret != null).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        if (Available) {
          expect(false).assertTrue();
        } else {
          expect(error.code == SENSOR_NO_SUPPORT_CODE).assertTrue();
        }
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetSingleSensorSync_SensorJsTest_static_002
     * @tc.number GetSingleSensorSync_SensorJsTest_static_002
     * @tc.desc   test getSingleSensorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetSingleSensorSync_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetSingleSensorSync_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      await isAvailable(sensor.SensorId.ACCELEROMETER);
      try {
        let acclSensor: sensor.Sensor = sensor.getSingleSensorSync(sensor.SensorId.ACCELEROMETER);
        if (acclSensor) {
          hilog.info(domain, tag, TAG + 'getSingleSensorSync acclSensor: ' + acclSensor);
          hilog.info(domain, tag, TAG + ' sensorName: ' + acclSensor.sensorName);
          hilog.info(domain, tag, TAG + ' vendorName: ' + acclSensor.vendorName);
          hilog.info(domain, tag, TAG + ' firmwareVersion: ' + acclSensor.firmwareVersion);
          hilog.info(domain, tag, TAG + ' hardwareVersion: ' + acclSensor.hardwareVersion);
          expect(acclSensor != null).assertTrue();
        } else {
          expect(acclSensor == null).assertTrue();
          hilog.info(domain, tag, TAG + 'getSingleSensorSync acclSensor is null');
        }
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ` error.code: ${error.code} , error.message: ${error.message}`);
        if (Available) {
          expect(false).assertTrue();
        } else {
          expect(error.code == SENSOR_NO_SUPPORT_CODE).assertTrue();
        }
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_001
     * @tc.number GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_001
     * @tc.desc   test getGeomagneticInfo AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      try {
        let num0: double = 80;
        let num1: double = 0;
        let num2: double = 0;
        let locationOptions: sensor.LocationOptions = {
          latitude: num0,
          longitude: num1,
          altitude: num2
        };
        let timeMillis: long = 1580486400000;
        const EPS = 0.01;
        const GEOMAGNETIC_COMPONENT_YEAR_RESULT = [
          [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875, 55000.0703125],
          [6554.17041015625, -87.19947052001953, 54649.078125, -0.7622424364089966, 83.16046905517578, 6554.75048828125, 55040.7734375],
          [6537.99169921875, -28.231582641601562, 54692.02734375, -0.24740631878376007, 83.18303680419922, 6538.052734375, 55081.4296875],
          [6521.81201171875, 30.73670768737793, 54734.97265625, 0.2700277864933014, 83.20502471923828, 6521.88427734375, 55122.15625],
          [6505.6328125, 89.70511627197266, 54777.90625, 0.7899921536445618, 83.22642517089844, 6506.2509765625, 55162.9453125]
        ];
        sensor.getGeomagneticInfo(locationOptions, timeMillis, (error, data) => {
          if (error) {
            hilog.info(domain, tag, TAG + ` getGeomagneticInfo error, ${error.code} , ${error.message}`);
            expect(false).assertTrue();
          } else {
            hilog.info(domain, tag, TAG + ' getGeomagneticInfo success');
            if (data) {
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo data: ' + data);
              hilog.info(domain, tag, TAG + ' x: ' + data.x);
              hilog.info(domain, tag, TAG + ' y: ' + data.y);
              hilog.info(domain, tag, TAG + ' z: ' + data.z);
              hilog.info(domain, tag, TAG + ' geomagneticDip: ' + data.geomagneticDip);
              hilog.info(domain, tag, TAG + ' deflectionAngle: ' + data.deflectionAngle);
              hilog.info(domain, tag, TAG + ' levelIntensity: ' + data.levelIntensity);
              hilog.info(domain, tag, TAG + ' totalIntensity: ' + data.totalIntensity);

              expect(Math.abs(data.x - GEOMAGNETIC_COMPONENT_YEAR_RESULT[0][0]) < EPS).assertTrue();
              expect(Math.abs(data.y - GEOMAGNETIC_COMPONENT_YEAR_RESULT[0][1]) < EPS).assertTrue();
              expect(Math.abs(data.z - GEOMAGNETIC_COMPONENT_YEAR_RESULT[0][2]) < EPS).assertTrue();
              expect(Math.abs(data.deflectionAngle - GEOMAGNETIC_COMPONENT_YEAR_RESULT[0][3]) < EPS).assertTrue();
              expect(Math.abs(data.geomagneticDip - GEOMAGNETIC_COMPONENT_YEAR_RESULT[0][4]) < EPS).assertTrue();
              expect(Math.abs(data.levelIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[0][5]) < EPS).assertTrue();
              expect(Math.abs(data.totalIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[0][6]) < EPS).assertTrue();
            } else {
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo data is null');
            }
          }
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, TAG + ' getGeomagneticInfo failed, ' + error);
        expect(true).assertFalse();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_002
     * @tc.number GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_002
     * @tc.desc   test getGeomagneticInfo AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      try {
        let num0: double = Number.NEGATIVE_INFINITY;
        let num1: double = 0;
        let num2: double = 0;
        let locationOptions: sensor.LocationOptions = {
          latitude: num0,
          longitude: num1,
          altitude: num2
        };
        let timeMillis: long = 1580486400000;
        let EPS = 0.01;
        let geomagneticComponent: Array<double> = [
          14425.57421875,
          -4.4076765967073136e+35,
          -52023.21484375,
          -6.76254414480036e-30,
          -90,
          4.4076765967073136e+35,
          Infinity
        ];
        sensor.getGeomagneticInfo(locationOptions, timeMillis, (error, data) => {
          if (error) {
            hilog.info(domain, tag, TAG + ` getGeomagneticInfo error, ${error.code} , ${error.message}`);
            expect(false).assertTrue();
          } else {
            hilog.info(domain, tag, TAG + ' getGeomagneticInfo success');
            if (data) {
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo data: ' + data);
              hilog.info(domain, tag, TAG + ' x: ' + data.x);
              hilog.info(domain, tag, TAG + ' y: ' + data.y);
              hilog.info(domain, tag, TAG + ' z: ' + data.z);
              hilog.info(domain, tag, TAG + ' geomagneticDip: ' + data.geomagneticDip);
              hilog.info(domain, tag, TAG + ' deflectionAngle: ' + data.deflectionAngle);
              hilog.info(domain, tag, TAG + ' levelIntensity: ' + data.levelIntensity);
              hilog.info(domain, tag, TAG + ' totalIntensity: ' + data.totalIntensity);

              expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
              expect(Math.abs(data.y - geomagneticComponent[1]) < EPS).assertTrue()
              expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
              expect(Math.abs(data.geomagneticDip - geomagneticComponent[3]) < EPS).assertTrue()
              expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
              expect(Math.abs(data.levelIntensity - geomagneticComponent[5]) < EPS).assertTrue()
              expect(data.totalIntensity).assertEqual(geomagneticComponent[6])

              hilog.info(domain, tag, TAG + ' getGeomagneticInfo x: ' + (Math.abs(data.x - geomagneticComponent[0])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo y: ' + (Math.abs(data.y - geomagneticComponent[1])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo z: ' + (Math.abs(data.z - geomagneticComponent[2])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo geomagneticDip: ' + (Math.abs(data.geomagneticDip - geomagneticComponent[3])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo deflectionAngle: ' + (Math.abs(data.deflectionAngle - geomagneticComponent[4])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo levelIntensity: ' + (Math.abs(data.levelIntensity - geomagneticComponent[5])));
            } else {
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo data is null');
            }
          }
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, TAG + ' getGeomagneticInfo failed, ' + error);
        expect(true).assertFalse();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_003
     * @tc.number GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_003
     * @tc.desc   test getGeomagneticInfo AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_003";
      hilog.info(domain, tag, TAG + "----------start----------");
      try {
        let num0: double = Number.MAX_VALUE;
        let num1: double = 0;
        let num2: double = 0;
        let locationOptions: sensor.LocationOptions = {
          latitude: num0,
          longitude: num1,
          altitude: num2
        };
        let timeMillis: long = 1580486400000;
        let EPS = 0.01;
        let geomagneticComponent: Array<double> = [1824.141845703125, 2.9950538714314696e+33, 56727.7734375, 1.0852099087396978e-27,
          90, 2.9950538714314696e+33, Infinity]
        sensor.getGeomagneticInfo(locationOptions, timeMillis, (error, data) => {
          if (error) {
            hilog.info(domain, tag, TAG + ` getGeomagneticInfo error, ${error.code} , ${error.message}`);
            expect(false).assertTrue();
          } else {
            hilog.info(domain, tag, TAG + ' getGeomagneticInfo success');
            if (data) {
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo data: ' + data);
              hilog.info(domain, tag, TAG + ' x: ' + data.x);
              hilog.info(domain, tag, TAG + ' y: ' + data.y);
              hilog.info(domain, tag, TAG + ' z: ' + data.z);
              hilog.info(domain, tag, TAG + ' geomagneticDip: ' + data.geomagneticDip);
              hilog.info(domain, tag, TAG + ' deflectionAngle: ' + data.deflectionAngle);
              hilog.info(domain, tag, TAG + ' levelIntensity: ' + data.levelIntensity);
              hilog.info(domain, tag, TAG + ' totalIntensity: ' + data.totalIntensity);

              expect(Math.abs(data.x - geomagneticComponent[0]) < EPS).assertTrue()
              expect(Math.abs(data.y - geomagneticComponent[1]) < EPS).assertTrue()
              expect(Math.abs(data.z - geomagneticComponent[2]) < EPS).assertTrue()
              expect(Math.abs(data.geomagneticDip - geomagneticComponent[3]) < EPS).assertTrue()
              expect(Math.abs(data.deflectionAngle - geomagneticComponent[4]) < EPS).assertTrue()
              expect(Math.abs(data.levelIntensity - geomagneticComponent[5]) < EPS).assertTrue()
              expect(data.totalIntensity).assertEqual(geomagneticComponent[6])

              hilog.info(domain, tag, TAG + ' getGeomagneticInfo x: ' + (Math.abs(data.x - geomagneticComponent[0])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo y: ' + (Math.abs(data.y - geomagneticComponent[1])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo z: ' + (Math.abs(data.z - geomagneticComponent[2])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo geomagneticDip: ' + (Math.abs(data.geomagneticDip - geomagneticComponent[3])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo deflectionAngle: ' + (Math.abs(data.deflectionAngle - geomagneticComponent[4])));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo levelIntensity: ' + (Math.abs(data.levelIntensity - geomagneticComponent[5])));
            } else {
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo data is null');
            }
          }
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, TAG + ' getGeomagneticInfo failed, ' + error);
        expect(true).assertFalse();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_004
     * @tc.number GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_004
     * @tc.desc   test getGeomagneticInfo AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetGeomagneticInfo_AsyncCallback_SensorJsTest_static_004";
      hilog.info(domain, tag, TAG + "----------start----------");
      try {
        let num0: double = 0;
        let num1: double = 0;
        let num2: double = Number.NaN;
        let locationOptions: sensor.LocationOptions = {
          latitude: num0,
          longitude: num1,
          altitude: num2
        };
        let timeMillis: long = 1580486400000;
        sensor.getGeomagneticInfo(locationOptions, timeMillis, (error, data) => {
          if (error) {
            hilog.info(domain, tag, TAG + ` getGeomagneticInfo error, ${error.code} , ${error.message}`);
            expect(false).assertTrue();
          } else {
            hilog.info(domain, tag, TAG + ' getGeomagneticInfo success');
            if (data) {
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo data: ' + data);
              hilog.info(domain, tag, TAG + ' x: ' + data.x);
              hilog.info(domain, tag, TAG + ' y: ' + data.y);
              hilog.info(domain, tag, TAG + ' z: ' + data.z);
              hilog.info(domain, tag, TAG + ' geomagneticDip: ' + data.geomagneticDip);
              hilog.info(domain, tag, TAG + ' deflectionAngle: ' + data.deflectionAngle);
              hilog.info(domain, tag, TAG + ' levelIntensity: ' + data.levelIntensity);
              hilog.info(domain, tag, TAG + ' totalIntensity: ' + data.totalIntensity);

              expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()

              hilog.info(domain, tag, TAG + ' getGeomagneticInfo x: ' + Number.isNaN(data.levelIntensity));
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo z: ' + Number.isNaN(data.totalIntensity));
            } else {
              hilog.info(domain, tag, TAG + ' getGeomagneticInfo data is null');
            }
          }
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, TAG + ' getGeomagneticInfo failed, ' + error);
        expect(true).assertFalse();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetGeomagneticInfo_Promise_SensorJsTest_static_001
     * @tc.number GetGeomagneticInfo_Promise_SensorJsTest_static_001
     * @tc.desc   test getGeomagneticInfo Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetGeomagneticInfo_Promise_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetGeomagneticInfo_Promise_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 0;
      let num1: double = Number.NEGATIVE_INFINITY;
      let num2: double = 0;
      let locationOptions: sensor.LocationOptions = {
        latitude: num0,
        longitude: num1,
        altitude: num2
      };
      let timeMillis: long = 1580486400000;
      try {
        await sensor.getGeomagneticInfo(locationOptions, timeMillis).then((data) => {
          hilog.info(domain, tag, TAG + ' getGeomagneticInfo success');
          expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
          hilog.info(domain, tag, TAG + ' getGeomagneticInfo x: ' + Number.isNaN(data.deflectionAngle));
          hilog.info(domain, tag, TAG + ' getGeomagneticInfo z: ' + Number.isNaN(data.geomagneticDip));
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getGeomagneticInfo failed, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(true).assertFalse();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetGeomagneticInfo_Promise_SensorJsTest_static_002
     * @tc.number GetGeomagneticInfo_Promise_SensorJsTest_static_002
     * @tc.desc   test getGeomagneticInfo Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetGeomagneticInfo_Promise_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetGeomagneticInfo_Promise_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = Number.MAX_VALUE;
      let num1: double = 0;
      let num2: double = 0;
      let locationOptions: sensor.LocationOptions = {
        latitude: num0,
        longitude: num1,
        altitude: num2
      };
      let timeMillis: long = 1580486400000;
      let geomagneticComponent: Array<double> = [1824.141845703125, 2.9950538714314696e+33, 56727.7734375, 1.0852099087396978e-27,
        90, 2.9950538714314696e+33, Infinity]
      try {
        await sensor.getGeomagneticInfo(locationOptions, timeMillis).then((data) => {
          expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
          hilog.info(domain, tag, TAG + ' getGeomagneticInfo success');
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getGeomagneticInfo failed, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(true).assertFalse();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetGeomagneticInfo_Promise_SensorJsTest_static_003
     * @tc.number GetGeomagneticInfo_Promise_SensorJsTest_static_003
     * @tc.desc   test getGeomagneticInfo Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetGeomagneticInfo_Promise_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetGeomagneticInfo_Promise_SensorJsTest_static_003";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 0;
      let num1: double = 0;
      let num2: double = Number.NaN;
      let locationOptions: sensor.LocationOptions = {
        latitude: num0,
        longitude: num1,
        altitude: num2
      };
      let timeMillis: long = 1580486400000;
      try {
        await sensor.getGeomagneticInfo(locationOptions, timeMillis).then((data) => {
          hilog.info(domain, tag, TAG + ' getGeomagneticInfo success');
          expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
          hilog.info(domain, tag, TAG + ' getGeomagneticInfo x: ' + Number.isNaN(data.levelIntensity));
          hilog.info(domain, tag, TAG + ' getGeomagneticInfo z: ' + Number.isNaN(data.totalIntensity));
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getGeomagneticInfo failed, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(true).assertFalse();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetDeviceAltitude_Promise_SensorJsTest_static_001
     * @tc.number GetDeviceAltitude_Promise_SensorJsTest_static_001
     * @tc.desc   test getDeviceAltitude Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetDeviceAltitude_Promise_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetDeviceAltitude_Promise_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      let getGeomagneticDipResult = [0.8760581016540527, 0.862170, -953042337792, 44330]
      try {
        await sensor.getDeviceAltitude(0, 100).then((data) => {
          expect(data).assertEqual(getGeomagneticDipResult[2])
          hilog.info(domain, tag, TAG + ' getDeviceAltitude success');
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getDeviceAltitude failed, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(false).assertTrue();
        done()
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetDeviceAltitude_Promise_SensorJsTest_static_002
     * @tc.number GetDeviceAltitude_Promise_SensorJsTest_static_002
     * @tc.desc   test getDeviceAltitude Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetDeviceAltitude_Promise_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetDeviceAltitude_Promise_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let getGeomagneticDipResult = [0.8760581016540527, 0.862170, -953042337792, 44330]
      try {
        await sensor.getDeviceAltitude(5, 0).then((data) => {
          expect(data).assertEqual(getGeomagneticDipResult[3])
          hilog.info(domain, tag, TAG + ' getDeviceAltitude success');
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getDeviceAltitude failed, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(false).assertTrue();
        done()
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetDeviceAltitude_AsyncCallback_SensorJsTest_static_001
     * @tc.number GetDeviceAltitude_AsyncCallback_SensorJsTest_static_001
     * @tc.desc   test getDeviceAltitude AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetDeviceAltitude_AsyncCallback_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetDeviceAltitude_AsyncCallback_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      let getGeomagneticDipResult = [0.8760581016540527, 0.862170, -953042337792, 44330]
      try {
        sensor.getDeviceAltitude(0, 100, (error, data) => {
          if (error) {
            hilog.info(domain, tag, TAG + ` getDeviceAltitude error, ${error.code} , ${error.message}`);
            expect(false).assertTrue();
          } else {
            expect(data).assertEqual(getGeomagneticDipResult[2])
            hilog.info(domain, tag, TAG + ' getDeviceAltitude success');
          }
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getDeviceAltitude failed, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(false).assertTrue();
        done()
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetDeviceAltitude_AsyncCallback_SensorJsTest_static_002
     * @tc.number GetDeviceAltitude_AsyncCallback_SensorJsTest_static_002
     * @tc.desc   test getDeviceAltitude AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetDeviceAltitude_AsyncCallback_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetDeviceAltitude_AsyncCallback_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let getGeomagneticDipResult = [0.8760581016540527, 0.862170, -953042337792, 44330]
      try {
        sensor.getDeviceAltitude(5, 0, (error, data) => {
          if (error) {
            hilog.info(domain, tag, TAG + ` getDeviceAltitude error, ${error.code} , ${error.message}`);
            expect(false).assertTrue();
          } else {
            expect(data).assertEqual(getGeomagneticDipResult[3])
            hilog.info(domain, tag, TAG + ' getDeviceAltitude success');
          }
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getDeviceAltitude failed, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(false).assertTrue();
        done()
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetInclination_AsyncCallback_SensorJsTest_static_001
     * @tc.number GetInclination_AsyncCallback_SensorJsTest_static_001
     * @tc.desc   test getInclination AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetInclination_AsyncCallback_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetInclination_AsyncCallback_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 1;
      let num1: double = 2;
      let num2: double = 3;
      let num3: double = 4;
      let num4: double = 5;
      let num5: double = 6;
      let num6: double = 7;
      let num7: double = 8;
      let num8: double = 9;
      let inclination: Array<double> = [num0, num1, num2, num3, num4, num5, num6, num7, num8];
      let getGeomagneticDipResult = [0.8760581016540527, 0.862170, -953042337792, 44330]
      try {
        sensor.getInclination(inclination, (error, data) => {
          if (error) {
            hilog.info(domain, tag, TAG + ` getInclination error, ${error.code} , ${error.message}`);
            expect(false).assertTrue();
          } else {
            expect(data).assertEqual(getGeomagneticDipResult[0])
            hilog.info(domain, tag, TAG + ' getDeviceAltitude success');
          }
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getDeviceAltitude failed, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(false).assertTrue();
        done()
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetInclination_AsyncCallback_SensorJsTest_static_002
     * @tc.number GetInclination_AsyncCallback_SensorJsTest_static_002
     * @tc.desc   test getInclination AsyncCallback:getDeviceAltitude failed, errCode: 401 ,msg:Get geomagnetic dip fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetInclination_AsyncCallback_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetInclination_AsyncCallback_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 1;
      let num1: double = 2;
      let num2: double = 3;
      let num3: double = 4;
      let inclination: Array<double> = [num0, num1, num2, num3];
      sensor.getInclination(inclination, (error, data) => {
        if (error) {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(domain, tag, TAG + ' getDeviceAltitude failed, errCode: ' + error.code + ' ,msg:' + error.message);
        } else {
          expect(false).assertTrue();
          hilog.info(domain, tag, TAG + ' getDeviceAltitud fail');
        }
        done();
      });

      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetInclination_AsyncCallback_SensorJsTest_static_003
     * @tc.number GetInclination_AsyncCallback_SensorJsTest_static_003
     * @tc.desc   test getInclination AsyncCallback getInclination error, 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetInclination_AsyncCallback_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetInclination_AsyncCallback_SensorJsTest_static_003";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = -1;
      let inclination: Array<double> = [num0];
      let getGeomagneticDipResult = [0.8760581016540527, 0.862170, -953042337792, 44330]
      sensor.getInclination(inclination, (error, data) => {
        if (error) {
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
          hilog.info(domain, tag, TAG + ` getInclination error, ${error.code}`);
        } else {
          expect(data).assertEqual(getGeomagneticDipResult[0])
          hilog.info(domain, tag, TAG + ' getDeviceAltitud fail');
        }
        done();
      });
      hilog.info(domain, tag, TAG + "----------end----------");
    })


    /**
     * @tc.name   GetInclination_Promise_SensorJsTest_static_001
     * @tc.number GetInclination_Promise_SensorJsTest_static_001
     * @tc.desc   test getInclination Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetInclination_Promise_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetInclination_Promise_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 1;
      let num1: double = 2;
      let num2: double = 3;
      let num3: double = 4;
      let num4: double = 5;
      let num5: double = 6;
      let num6: double = 7;
      let num7: double = 8;
      let num8: double = 9;
      let inclination: Array<double> = [num0, num1, num2, num3, num4, num5, num6, num7, num8];
      let getGeomagneticDipResult = [0.8760581016540527, 0.862170, -953042337792, 44330]
      try {
        await sensor.getInclination(inclination).then((data) => {
          expect(data).assertEqual(getGeomagneticDipResult[0])
          hilog.info(domain, tag, TAG + ' getDeviceAltitude success');
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getDeviceAltitude failed, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(false).assertTrue();
        done()
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetInclination_Promise_SensorJsTest_static_002
     * @tc.number GetInclination_Promise_SensorJsTest_static_002
     * @tc.desc   test getInclination Promise:getDeviceAltitude success, errCode: 401 ,msg:Get geomagnetic dip fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetInclination_Promise_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetInclination_Promise_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 1;
      let num1: double = 2;
      let num2: double = 3;
      let num3: double = 4;
      let inclination: Array<double> = [num0, num1, num2, num3];
      try {
        await sensor.getInclination(inclination).then((data) => {
          hilog.info(domain, tag, TAG + ' getDeviceAltitude fail');
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getDeviceAltitude success, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual("Get geomagnetic dip fail");
        done()
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetInclination_Promise_SensorJsTest_static_003
     * @tc.number GetInclination_Promise_SensorJsTest_static_003
     * @tc.desc   test getInclination Promise: getDeviceAltitude success, errCode: 401 ,msg:Get geomagnetic dip fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetInclination_Promise_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetInclination_Promise_SensorJsTest_static_003";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = -1;
      let inclination: Array<double> = [num0];
      let getGeomagneticDipResult = [0.8760581016540527, 0.862170, -953042337792, 44330]
      try {
        await sensor.getInclination(inclination).then((data) => {
          expect(data).assertEqual(getGeomagneticDipResult[0])
          hilog.info(domain, tag, TAG + ' getDeviceAltitude fail');
          done()
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getDeviceAltitude success, errCode: ' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual("Get geomagnetic dip fail");
        done()
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    })

    /**
     * @tc.name   GetAngleVariation_AsyncCallback_SensorJsTest_static_001
     * @tc.number GetAngleVariation_AsyncCallback_SensorJsTest_static_001
     * @tc.desc   test getAngleVariation AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetAngleVariation_AsyncCallback_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetAngleVariation_AsyncCallback_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 1;
      let num1: double = 2;
      let num2: double = 3;
      let ANGLECHANGE_9_RESULT = [
        [0.7853981852531433, NaN, -0.32175055146217346],  //123123123
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE
        [0.0, -0.0, -0.0],                                //FLOAT.MINVALUE
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE+1
      ];
      let curRotation: Array<Double> = [num0, num1, num2, num0, num1, num2, num0, num1, num2];
      let preRotation: Array<Double> = [num1, num1, num1, num1, num1, num1, num1, num1, num1];

      sensor.getAngleVariation(curRotation, preRotation, (error, data) => {
        if (error) {
          hilog.info(domain, tag, TAG + ' getAngleVariation failed');
          expect(false).assertTrue();
          done();
        } else if (data) {
          // 确保 data 不为 null 或 undefined
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);

          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, TAG + "getAngleVariation [" + i + "] = " + data[i]);
          }

          if (data.length > 0) {
            expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[0][0]);
            hilog.info(domain, tag, TAG + ' data[0] length: ' + data[0]);
            hilog.info(domain, tag, TAG + ' ANGLECHANGE_9_RESULT[0][0] length: ' + ANGLECHANGE_9_RESULT[0][0]);
          }

          if (data.length > 1) {
            expect(Number.isNaN(data[1])).assertTrue();
            hilog.info(domain, tag, TAG + ' data[1] length: ' + data[1]);
          }

          if (data.length > 2) {
            expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[0][2]);
            hilog.info(domain, tag, TAG + ' data[2] length: ' + data[2]);
            hilog.info(domain, tag, TAG + ' ANGLECHANGE_9_RESULT[0][2] length: ' + ANGLECHANGE_9_RESULT[0][2]);
          }
          done();
        } else {
          // 处理 data 为 null 或 undefined 的情况
          hilog.info(domain, tag, TAG + ' data is null or undefined');
          expect(false).assertTrue();
          done();
        }
      });

      hilog.info(domain, tag, TAG + "----------end----------");
    });


    /**
     * @tc.name   GetAngleVariation_AsyncCallback_SensorJsTest_static_002
     * @tc.number GetAngleVariation_AsyncCallback_SensorJsTest_static_002
     * @tc.desc   test getAngleVariation AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetAngleVariation_AsyncCallback_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetAngleVariation_AsyncCallback_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num: double = 3.40282e+38;
      let ANGLECHANGE_9_RESULT = [
        [0.7853981852531433, NaN, -0.32175055146217346],  //123123123
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE
        [0.0, -0.0, -0.0],                                //FLOAT.MINVALUE
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE+1
      ];
      let curRotation: Array<Double> = [num, num, num, num, num, num, num, num, num];
      let preRotation: Array<Double> = [num, num, num, num, num, num, num, num, num];

      sensor.getAngleVariation(curRotation, preRotation, (error, data) => {
        if (error) {
          hilog.info(domain, tag, TAG + ' getAngleVariation failed');
          expect(false).assertTrue();
          done();
        } else if (data) {
          // 确保 data 不为 null 或 undefined
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);

          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, TAG + "getAngleVariation [" + i + "] = " + data[i]);
          }

          if (data.length > 0) {
            expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[1][0]);
            hilog.info(domain, tag, TAG + ' data[0] length: ' + data[0]);
            hilog.info(domain, tag, TAG + ' ANGLECHANGE_9_RESULT[1][0] length: ' + ANGLECHANGE_9_RESULT[1][0]);
          }

          if (data.length > 1) {
            expect(Number.isNaN(data[1])).assertTrue();
            hilog.info(domain, tag, TAG + ' data[1] length: ' + data[1]);
          }

          if (data.length > 2) {
            expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[1][2]);
            hilog.info(domain, tag, TAG + ' data[2] length: ' + data[2]);
            hilog.info(domain, tag, TAG + ' ANGLECHANGE_9_RESULT[1][2] length: ' + ANGLECHANGE_9_RESULT[1][2]);
          }
          done();
        } else {
          // 处理 data 为 null 或 undefined 的情况
          hilog.info(domain, tag, TAG + ' data is null or undefined');
          expect(false).assertTrue();
          done();
        }
      });

      hilog.info(domain, tag, TAG + "----------end----------");
    });


    /**
     * @tc.name   GetAngleVariation_Promise_SensorJsTest_static_001
     * @tc.number GetAngleVariation_Promise_SensorJsTest_static_001
     * @tc.desc   test getAngleVariation Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetAngleVariation_Promise_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetAngleVariation_Promise_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 1;
      let num1: double = 2;
      let num2: double = 3;
      let ANGLECHANGE_9_RESULT = [
        [0.7853981852531433, NaN, -0.32175055146217346],  //123123123
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE
        [0.0, -0.0, -0.0],                                //FLOAT.MINVALUE
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE+1
      ];
      let curRotation: Array<double> = [num0, num1, num2, num0, num1, num2, num0, num1, num2];
      let preRotation: Array<double> = [num1, num1, num1, num1, num1, num1, num1, num1, num1];

      try {
        let data: Array<double> = await sensor.getAngleVariation(curRotation, preRotation);
        if (data) {
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);

          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, TAG + "getAngleVariation [" + i + "] = " + data[i]);
          }

          if (data.length > 0) {
            expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[0][0]);
            hilog.info(domain, tag, TAG + ' data[0]: ' + data[0]);
            hilog.info(domain, tag, TAG + ' ANGLECHANGE_9_RESULT[0][0]: ' + ANGLECHANGE_9_RESULT[0][0]);
          }

          if (data.length > 1) {
            expect(Number.isNaN(data[1])).assertTrue();
            hilog.info(domain, tag, TAG + ' data[1]: ' + data[1]);
          }

          if (data.length > 2) {
            expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[0][2]);
            hilog.info(domain, tag, TAG + ' data[2]: ' + data[2]);
            hilog.info(domain, tag, TAG + ' ANGLECHANGE_9_RESULT[0][2]: ' + ANGLECHANGE_9_RESULT[0][2]);
          }
        } else {
          hilog.info(domain, tag, TAG + ' getAngleVariation returned null or undefined');
          expect(false).assertTrue();
        }
        done();
      } catch (error) {
        hilog.info(domain, tag, TAG + ' getAngleVariation failed, error: ' + error);
        expect(false).assertTrue();
        done();
      }

      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetAngleVariation_Promise_SensorJsTest_static_002
     * @tc.number GetAngleVariation_Promise_SensorJsTest_static_002
     * @tc.desc   test getAngleVariation Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetAngleVariation_Promise_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetAngleVariation_Promise_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num: double = 3.40282e+38;
      let ANGLECHANGE_9_RESULT = [
        [0.7853981852531433, NaN, -0.32175055146217346],  //123123123
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE
        [0.0, -0.0, -0.0],                                //FLOAT.MINVALUE
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE+1
      ];
      let curRotation: Array<double> = [num, num, num, num, num, num, num, num, num];
      let preRotation: Array<double> = [num, num, num, num, num, num, num, num, num];

      try {
        let data: Array<double> = await sensor.getAngleVariation(curRotation, preRotation);
        if (data) {
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);

          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, TAG + "getAngleVariation [" + i + "] = " + data[i]);
          }

          if (data.length > 0) {
            expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[1][0]);
            hilog.info(domain, tag, TAG + ' data[0]: ' + data[0]);
            hilog.info(domain, tag, TAG + ' ANGLECHANGE_9_RESULT[1][0]: ' + ANGLECHANGE_9_RESULT[1][0]);
          }

          if (data.length > 1) {
            expect(Number.isNaN(data[1])).assertTrue();
            hilog.info(domain, tag, TAG + ' data[1]: ' + data[1]);
          }

          if (data.length > 2) {
            expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[1][2]);
            hilog.info(domain, tag, TAG + ' data[2]: ' + data[2]);
            hilog.info(domain, tag, TAG + ' ANGLECHANGE_9_RESULT[1][2]: ' + ANGLECHANGE_9_RESULT[1][2]);
          }
        } else {
          hilog.info(domain, tag, TAG + ' getAngleVariation returned null or undefined');
          expect(false).assertTrue();
        }
        done();
      } catch (error) {
        hilog.info(domain, tag, TAG + ' getAngleVariation failed, error: ' + error);
        expect(false).assertTrue();
        done();
      }

      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   TransformRotationMatrix_AsyncCallback_SensorJsTest_static_001
     * @tc.number TransformRotationMatrix_AsyncCallback_SensorJsTest_static_001
     * @tc.desc   test transformRotationMatrix AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("TransformRotationMatrix_AsyncCallback_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "TransformRotationMatrix_AsyncCallback_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");

      // 使用 number 类型而不是 double
      let num0: double = 1.5;

      let transformCoordinateSystemResult = [
        [1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000],
        [340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
          340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
          340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000],
        [Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity]
      ];

      let rotation: Array<double> = [num0, num0, num0, num0, num0, num0, num0, num0, num0];

      sensor.transformRotationMatrix(rotation, { 'x': 1, 'y': 2 }, (error, data) => {
        if (error) {
          hilog.info(domain, tag, TAG + ' transformRotationMatrix failed, error: ' + error.code + ', ' + error.message);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ' data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertEqual(JSON.stringify(transformCoordinateSystemResult[0]));
          done();
        }
      });

      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   TransformRotationMatrix_AsyncCallback_SensorJsTest_static_002
     * @tc.number TransformRotationMatrix_AsyncCallback_SensorJsTest_static_002
     * @tc.desc   test transformRotationMatrix AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("TransformRotationMatrix_AsyncCallback_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "TransformRotationMatrix_AsyncCallback_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");

      let num0: double = 3.40282e+38;

      let transformCoordinateSystemResult = [
        [1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000],
        [340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
          340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
          340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000],
        [Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity]
      ];

      let rotation: Array<double> = [num0, num0, num0, num0, num0, num0, num0, num0, num0];

      sensor.transformRotationMatrix(rotation, { 'x': 1, 'y': 2 }, (error, data) => {
        if (error) {
          hilog.info(domain, tag, TAG + ' transformRotationMatrix failed, error: ' + error.code + ', ' + error.message);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ' data: ' + JSON.stringify(data));
          expect(JSON.stringify(data)).assertEqual(JSON.stringify(transformCoordinateSystemResult[1]));
          done();
        }
      });

      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   TransformRotationMatrix_Promise_SensorJsTest_static_001
     * @tc.number TransformRotationMatrix_Promise_SensorJsTest_static_001
     * @tc.desc   test transformRotationMatrix Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("TransformRotationMatrix_Promise_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "TransformRotationMatrix_Promise_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");

      let num0: double = 1.5;

      let transformCoordinateSystemResult = [
        [1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000],
        [340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
          340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
          340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000],
        [Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity]
      ];

      let rotation: Array<double> = [num0, num0, num0, num0, num0, num0, num0, num0, num0];

      try {
        let data: Array<double> = await sensor.transformRotationMatrix(rotation, { 'x': 1, 'y': 2 });

        if (data) {
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);

          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, TAG + "transformRotationMatrix [" + i + "] = " + data[i]);
            expect(data[i]).assertEqual(transformCoordinateSystemResult[0][i]);
          }

          done();
        } else {
          hilog.info(domain, tag, TAG + ' transformRotationMatrix returned null or undefined');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' transformRotationMatrix failed, error: ' + error.code + ', ' + error.message);
        expect(false).assertTrue();
        done();
      }

      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   TransformRotationMatrix_Promise_SensorJsTest_static_002
     * @tc.number TransformRotationMatrix_Promise_SensorJsTest_static_002
     * @tc.desc   test transformRotationMatrix Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("TransformRotationMatrix_Promise_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "TransformRotationMatrix_Promise_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");

      let num0: double = 3.40282e+39;

      let transformCoordinateSystemResult = [
        [1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000],
        [340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
          340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
          340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000],
        [Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity]
      ];

      let rotation: Array<double> = [num0, num0, num0, num0, num0, num0, num0, num0, num0];

      try {
        let data: Array<double> = await sensor.transformRotationMatrix(rotation, { 'x': 1, 'y': 3 });

        if (data) {
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);

          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, TAG + "transformRotationMatrix [" + i + "] = " + data[i]);
            expect(data[i]).assertEqual(transformCoordinateSystemResult[2][i]);
          }

          done();
        } else {
          hilog.info(domain, tag, TAG + ' transformRotationMatrix returned null or undefined');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' transformRotationMatrix failed, error: ' + error.code + ', ' + error.message);
        expect(false).assertTrue();
        done();
      }

      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetQuaternion_Promise_SensorJsTest_static_001
     * @tc.number GetQuaternion_Promise_SensorJsTest_static_001
     * @tc.desc   test getQuaternion Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetQuaternion_Promise_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetQuaternion_Promise_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = -0.325;
      let num1: double = -0.562;
      let num2: double = -0.25;
      let rotation: Array<Double> = [num0, num1, num2];
      let result: number[][] = [
        [0.7441122531890869, 0.5199999809265137, -0.335999995470047, -0.25099998712539673],
        [0, 3.402820018375656e+38, 3.402820018375656e+38, 3.402820018375656e+38],
        [1, 0, 0, 0],
        [0.7183529734611511, -0.32499998807907104, -0.5619999766349792, -0.25],
        [0, 0, 0, 0]
      ];
      try {
        let data: Array<double> = await sensor.getQuaternion(rotation);

        if (data) {
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);
          // 使用临时变量存储预期结果，避免复杂的索引表达式
          let expectedResult: number[] = result[3];
          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, TAG + "getQuaternion [" + i + "] = " + data[i]);
            if (i < expectedResult.length) {
              expect(data[i]).assertEqual(expectedResult[i]);
            } else {
              hilog.info(domain, tag, TAG + ' data index ' + i + ' out of expected result range');
            }
          }
          done();
        } else {
          hilog.info(domain, tag, TAG + ' getQuaternion returned null or undefined');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getQuaternion failed, error: ' + error.code + ', ' + error.message);
        expect(false).assertTrue();
        done();
      }

      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetQuaternion_Promise_SensorJsTest_static_002
     * @tc.number GetQuaternion_Promise_SensorJsTest_static_002
     * @tc.desc   test getQuaternion Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetQuaternion_Promise_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetQuaternion_Promise_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 0;
      let rotation: Array<Double> = [num0, num0, num0];
      let result: number[][] = [
        [0.7441122531890869, 0.5199999809265137, -0.335999995470047, -0.25099998712539673],
        [0, 3.402820018375656e+38, 3.402820018375656e+38, 3.402820018375656e+38],
        [1, 0, 0, 0],
        [0.7183529734611511, -0.32499998807907104, -0.5619999766349792, -0.25],
        [0, 0, 0, 0]
      ];
      try {
        let data: Array<double> = await sensor.getQuaternion(rotation);

        if (data) {
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);
          // 使用临时变量存储预期结果，避免复杂的索引表达式
          let expectedResult: number[] = result[2];
          for (let i = 0; i < data.length; i++) {
            hilog.info(domain, tag, TAG + "getQuaternion [" + i + "] = " + data[i]);
            if (i < expectedResult.length) {
              expect(data[i]).assertEqual(expectedResult[i]);
            } else {
              hilog.info(domain, tag, TAG + ' data index ' + i + ' out of expected result range');
            }
          }
          done();
        } else {
          hilog.info(domain, tag, TAG + ' getQuaternion returned null or undefined');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getQuaternion failed, error: ' + error.code + ', ' + error.message);
        expect(false).assertTrue();
        done();
      }

      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetQuaternion_Promise_SensorJsTest_static_003
     * @tc.number GetQuaternion_Promise_SensorJsTest_static_003
     * @tc.desc   test getQuaternion Promise：getQuaternion failed, error: 401, CreateQuaternion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetQuaternion_Promise_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetQuaternion_Promise_SensorJsTest_static_003";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 0.25;
      let num1: double = 0.14;
      let rotation: Array<Double> = [num0, num1];
      const PARAMETER_ERROR_CODE = 401;
      try {
        let data: Array<double> = await sensor.getQuaternion(rotation);
        if (data) {
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ' getQuaternion returned null or undefined');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getQuaternion failed, error: ' + error.code + ', ' + error.message);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
        expect(error.message).assertEqual("CreateQuaternion fail");
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetQuaternion_Promise_SensorJsTest_static_004
     * @tc.number GetQuaternion_Promise_SensorJsTest_static_004
     * @tc.desc   test getQuaternion Promise：getQuaternion failed, error: 401, CreateQuaternion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetQuaternion_Promise_SensorJsTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetQuaternion_Promise_SensorJsTest_static_004";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 0;
      let rotation: Array<Double> = [num0, num0];
      const PARAMETER_ERROR_CODE = 401;
      try {
        let data: Array<double> = await sensor.getQuaternion(rotation);
        if (data) {
          hilog.info(domain, tag, TAG + ' data length: ' + data.length);
          expect(false).assertTrue();
          done();
        } else {
          hilog.info(domain, tag, TAG + ' getQuaternion returned null or undefined');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getQuaternion failed, error: ' + error.code + ', ' + error.message);
        expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
        expect(error.message).assertEqual("CreateQuaternion fail");
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetQuaternion_AsyncCallback_SensorJsTest_static_001
     * @tc.number GetQuaternion_AsyncCallback_SensorJsTest_static_001
     * @tc.desc   test getQuaternion AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetQuaternion_AsyncCallback_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetQuaternion_AsyncCallback_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = -0.325;
      let num1: double = -0.562;
      let num2: double = -0.25;
      let rotation: Array<Double> = [num0, num1, num2];
      let result: number[][] = [
        [0.7441122531890869, 0.5199999809265137, -0.335999995470047, -0.25099998712539673],
        [0, 3.402820018375656e+38, 3.402820018375656e+38, 3.402820018375656e+38],
        [1, 0, 0, 0],
        [0.7183529734611511, -0.32499998807907104, -0.5619999766349792, -0.25],
        [0, 0, 0, 0]
      ]
      try {
        sensor.getQuaternion(rotation, (error, data) => {
          if (data) {
            hilog.info(domain, tag, TAG + ' data length: ' + data.length);
            // 使用临时变量存储预期结果，避免复杂的索引表达式
            let expectedResult: number[] = result[3];
            for (let i = 0; i < data.length; i++) {
              hilog.info(domain, tag, TAG + "getQuaternion [" + i + "] = " + data[i]);
              if (i < expectedResult.length) {
                expect(data[i]).assertEqual(expectedResult[i]);
              } else {
                hilog.info(domain, tag, TAG + ' data index ' + i + ' out of expected result range');
              }
            }
            done();
          } else {
            hilog.info(domain, tag, TAG + ' getQuaternion returned null or undefined');
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getQuaternion failed, error: ' + error.code + ', ' + error.message);
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetQuaternion_AsyncCallback_SensorJsTest_static_002
     * @tc.number GetQuaternion_AsyncCallback_SensorJsTest_static_002
     * @tc.desc   test getQuaternion AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetQuaternion_AsyncCallback_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetQuaternion_AsyncCallback_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 0;
      let rotation: Array<Double> = [num0, num0, num0];
      let result: number[][] = [
        [0.7441122531890869, 0.5199999809265137, -0.335999995470047, -0.25099998712539673],
        [0, 3.402820018375656e+38, 3.402820018375656e+38, 3.402820018375656e+38],
        [1, 0, 0, 0],
        [0.7183529734611511, -0.32499998807907104, -0.5619999766349792, -0.25],
        [0, 0, 0, 0]
      ]
      try {
        sensor.getQuaternion(rotation, (error, data) => {
          if (data) {
            hilog.info(domain, tag, TAG + ' data length: ' + data.length);
            // 使用临时变量存储预期结果，避免复杂的索引表达式
            let expectedResult: number[] = result[2];
            for (let i = 0; i < data.length; i++) {
              hilog.info(domain, tag, TAG + "getQuaternion [" + i + "] = " + data[i]);
              if (i < expectedResult.length) {
                expect(data[i]).assertEqual(expectedResult[i]);
              } else {
                hilog.info(domain, tag, TAG + ' data index ' + i + ' out of expected result range');
              }
            }
            done();
          } else {
            hilog.info(domain, tag, TAG + ' getQuaternion returned null or undefined');
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getQuaternion failed, error: ' + error.code + ', ' + error.message);
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetQuaternion_AsyncCallback_SensorJsTest_static_003
     * @tc.number GetQuaternion_AsyncCallback_SensorJsTest_static_003
     * @tc.desc   test getQuaternion AsyncCallback:getQuaternion failed, error: 401, CreateQuaternion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetQuaternion_AsyncCallback_SensorJsTest_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetQuaternion_AsyncCallback_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 0.25;
      let num1: double = 0.14;
      let rotation: Array<Double> = [num0, num1];
      const PARAMETER_ERROR_CODE = 401;
      sensor.getQuaternion(rotation, (error, data) => {
        if (error) {
          hilog.info(domain, tag, TAG + ' getQuaternion failed, error: ' + error.code + ', ' + error.message);
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
          expect(error.message).assertEqual("CreateQuaternion fail");
          done();
        } else {
          hilog.info(domain, tag, TAG + ' getQuaternion data: ' + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }
      });
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetQuaternion_AsyncCallback_SensorJsTest_static_004
     * @tc.number GetQuaternion_AsyncCallback_SensorJsTest_static_004
     * @tc.desc   test getQuaternion AsyncCallback:getQuaternion failed, error: 401, CreateQuaternion fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetQuaternion_AsyncCallback_SensorJsTest_static_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetQuaternion_AsyncCallback_SensorJsTest_static_004";
      hilog.info(domain, tag, TAG + "----------start----------");
      let num0: double = 0;
      let rotation: Array<Double> = [num0, num0];
      const PARAMETER_ERROR_CODE = 401;
      sensor.getQuaternion(rotation, (error, data) => {
        if (error) {
          hilog.info(domain, tag, TAG + ' getQuaternion failed, error: ' + error.code + ', ' + error.message);
          expect(error.code).assertEqual(PARAMETER_ERROR_CODE)
          expect(error.message).assertEqual("CreateQuaternion fail");
          done();
        } else {
          hilog.info(domain, tag, TAG + ' getQuaternion data: ' + JSON.stringify(data));
          expect(false).assertTrue();
          done();
        }
      });
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetSingleSensor_AsyncCallback_SensorJsTest_static_001
     * @tc.number GetSingleSensor_AsyncCallback_SensorJsTest_static_001
     * @tc.desc   test getSingleSensor AsyncCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetSingleSensor_AsyncCallback_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetSingleSensor_AsyncCallback_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      const SERVICE_EXCEPTION_CODE = 14500101
      const SENSOR_NO_SUPPORT_CODE = 14500102
      try {
        sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, (error, data) => {
          if (error) {
            hilog.info(domain, tag, TAG + ' getSingleSensor failed, error: ' + error.code + ', ' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
          } else {
            try {
              hilog.info(domain, tag, TAG + ' getSingleSensor data: ' + JSON.stringify(data));
              expect(typeof (data)).assertEqual("object");
              done();
            } catch (error) {
              error = error as BusinessError;
              console.info(TAG + ' catch error:' + error);
              hilog.info(domain, tag, TAG + ' getSingleSensor catch errCode: ' + error.code + ' ,msg:' + error.message);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        });
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getSingleSensor errCode: ' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetSingleSensor_AsyncCallback_SensorJsTest_static_002
     * @tc.number GetSingleSensor_AsyncCallback_SensorJsTest_static_002
     * @tc.desc   test getSingleSensor AsyncCallback error: 14500102, The sensor is not supported by the device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetSingleSensor_AsyncCallback_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetSingleSensor_AsyncCallback_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      const SERVICE_EXCEPTION_CODE = 14500101
      const SENSOR_NO_SUPPORT_CODE = 14500102
      try {
        sensor.getSingleSensor(sensor.SensorId.WEAR_DETECTION, (error, data) => {
          if (error) {
            hilog.info(domain, tag, TAG + ' getSingleSensor failed, error: ' + error.code + ', ' + error.message);
            expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
          } else {
            try {
              hilog.info(domain, tag, TAG + ' getSingleSensor data: ' + JSON.stringify(data));
              expect(typeof (data)).assertEqual("object");
              done();
            } catch (error) {
              error = error as BusinessError;
              console.info(TAG + ' catch error:' + error);
              hilog.info(domain, tag, TAG + ' getSingleSensor catch errCode: ' + error.code + ' ,msg:' + error.message);
              expect(error.code).assertEqual(SERVICE_EXCEPTION_CODE);
              done();
            }
          }
        });
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getSingleSensor errCode: ' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetSingleSensor_Promise_SensorJsTest_static_001
     * @tc.number GetSingleSensor_Promise_SensorJsTest_static_001
     * @tc.desc   test getSingleSensor Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetSingleSensor_Promise_SensorJsTest_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetSingleSensor_Promise_SensorJsTest_static_001";
      hilog.info(domain, tag, TAG + "----------start----------");
      const SENSOR_NO_SUPPORT_CODE = 14500102
      try {
        await sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER).then((data) => {
          if (data) {
            expect(typeof (data.sensorName)).assertEqual("string");
            expect(typeof (data.vendorName)).assertEqual("string");
            expect(typeof (data.firmwareVersion)).assertEqual("string");
            expect(typeof (data.hardwareVersion)).assertEqual("string");
            expect(typeof (data.sensorId)).assertEqual("int");
            expect(typeof (data.maxRange)).assertEqual("number");
            expect(typeof (data.minSamplePeriod)).assertEqual("long");
            expect(typeof (data.maxSamplePeriod)).assertEqual("long");
            expect(typeof (data.precision)).assertEqual("number");
            expect(typeof (data.power)).assertEqual("number");
            hilog.info(domain, tag, TAG + ' getSingleSensor success: ');
            done()
          } else {
            hilog.info(domain, tag, TAG + ' illegal parameter!');
            done();
          }
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getSingleSensor errCode: ' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    /**
     * @tc.name   GetSingleSensor_Promise_SensorJsTest_static_002
     * @tc.number GetSingleSensor_Promise_SensorJsTest_static_002
     * @tc.desc   test getSingleSensor errCode: 14500102 ,msg:The sensor is not supported by the device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("GetSingleSensor_Promise_SensorJsTest_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = "GetSingleSensor_Promise_SensorJsTest_static_002";
      hilog.info(domain, tag, TAG + "----------start----------");
      const SENSOR_NO_SUPPORT_CODE = 14500102
      try {
        await sensor.getSingleSensor(sensor.SensorId.WEAR_DETECTION).then((data) => {
          expect(typeof (data.sensorName)).assertEqual("string");
          expect(typeof (data.vendorName)).assertEqual("string");
          expect(typeof (data.firmwareVersion)).assertEqual("string");
          expect(typeof (data.hardwareVersion)).assertEqual("string");
          expect(typeof (data.sensorId)).assertEqual("int");
          expect(typeof (data.maxRange)).assertEqual("number");
          expect(typeof (data.minSamplePeriod)).assertEqual("long");
          expect(typeof (data.maxSamplePeriod)).assertEqual("long");
          expect(typeof (data.precision)).assertEqual("number");
          expect(typeof (data.power)).assertEqual("number");
          done()
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, TAG + ' getSingleSensor errCode: ' + error.code + ' ,msg:' + error.message);
        expect(error.code).assertEqual(SENSOR_NO_SUPPORT_CODE);
        expect(error.message).assertEqual("The sensor is not supported by the device");
        done();
      }
      hilog.info(domain, tag, TAG + "----------end----------");
    });

    const CODEARR = [14500101, 14500102]
    /**
     * @tc.name   SensorSyncTest_001
     * @tc.number SUB_SensorsSystem_NEWSENSORSYNC_JSTest_0020
     * @tc.desc   verify sensor sync func interface (getSingleSensorSyncFunc)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorSyncTest_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('----------------------SensorSyncTest_001---------------------------');
      TAG = 'SensorSyncTest_001';
      try {
        let ret = sensor.getSingleSensorSync(sensor.SensorId.ACCELEROMETER);
        await isAvailable(sensor.SensorId.ACCELEROMETER);
        console.info(TAG + ' getSingleSensorSyncFunc: ' + JSON.stringify(ret));
        done();
      } catch (error ) {
        const sensorError = error as BusinessError;
        console.info(TAG + ' fail, errCode:' + sensorError.code + ' ,msg:' + sensorError.message);
        if (Available) {
          expect(error.code == 14500101).assertTrue();
        } else {
          expect(error.code == 14500102).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SensorSyncTest_002
     * @tc.number SUB_SensorsSystem_NEWSENSORSYNC_JSTest_0050
     * @tc.desc   verify sensor sync interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SensorSyncTest_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('----------------------SensorSyncTest_002---------------------------');
      TAG = 'SensorSyncTest_002';
      try {
        let ret = sensor.getSensorListSync();
        for (let i = 0; i < ret.length; i++) {
          console.info(TAG + ' Succeeded in getting sensor: ' + JSON.stringify(ret[i]));
        }
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testOnOffSensorStatusChange001
     * @tc.number SUB_SENSORS_Sensor_OnOff_JSTest_001
     * @tc.desc   test stop listening on device status changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnOffSensorStatusChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      TAG = 'testOnOffSensorStatusChange001'
      console.info(TAG + ' in');
      const onCallback = (event: sensor.SensorStatusEvent)=> {
        console.info(TAG + ' Callback should not be triggered!');
        console.info(TAG + " event.timestamp:" + event.timestamp);
        console.info(TAG + " event.sensorId:" + event.sensorId);
        console.info(TAG + " event.sensorIndex:" + event.sensorIndex);
        console.info(TAG + " event.isSensorOnline:" + event.isSensorOnline);
        console.info(TAG + " event.deviceId:" + event.deviceId);
        console.info(TAG + " event.deviceName:" + event.deviceName);
      };
      try {
        sensor.onSensorStatusChange(onCallback);
        setTimeout(() => {
          sensor.offSensorStatusChange(onCallback);
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
     * @tc.name   GetSingleSensorByDeviceSync_JSTest_001
     * @tc.number SUB_SensorsSystem_GetSingleSensorByDeviceSync_JSTest_001
     * @tc.desc   Test getSingleSensorByDeviceSync with valid type and deviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSingleSensorByDeviceSync_JSTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
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
          const callback = (data: sensor.AccelerometerResponse) => {
            console.info('Accelerometer data received: ' + JSON.stringify(data));
          };
          let sensorInfoParam = {
            deviceId: 1,
            sensorIndex: 0
          } as sensor.SensorInfoParam;
          const options = {
            interval: 100000000
          } as sensor.Options;
          sensor.onAccelerometerChange(callback, options);
          console.info(TAG + ' Successfully registered sensor listener');
          setTimeout(() => {
            sensor.offAccelerometerChange(sensorInfoParam, callback);
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
     * @tc.name   GetSingleSensorByDeviceSync_JSTest_002
     * @tc.number SUB_SensorsSystem_GetSingleSensorByDeviceSync_JSTest_002
     * @tc.desc   Test getSingleSensorByDeviceSync with invalid type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSingleSensorByDeviceSync_JSTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info("------------------GetSingleSensorByDeviceSync_JSTest_002-------------------------");
      const TAG = 'GetSingleSensorByDeviceSync_JSTest_002'
      try {
        const invalidType = -1 as sensor.SensorId;
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
        expect(true).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   GetSingleSensorByDeviceSync_JSTest_003
     * @tc.number SUB_SensorsSystem_GetSingleSensorByDeviceSync_JSTest_003
     * @tc.desc   Test getSingleSensorByDeviceSync with invalid deviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSingleSensorByDeviceSync_JSTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info("------------------GetSingleSensorByDeviceSync_JSTest_003-------------------------");
      const TAG = 'GetSingleSensorByDeviceSync_JSTest_003';
      try {
        const type = sensor.SensorId.ACCELEROMETER;
        const loopCount = 1000;
        let failCount = 0;
        let testNullDeviceId = -2;
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
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   GetSingleSensorByDeviceSync_JSTest_004
     * @tc.number SUB_SensorsSystem_GetSingleSensorByDeviceSync_JSTest_004
     * @tc.desc   Test getSingleSensorByDeviceSync with invalid type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSingleSensorByDeviceSync_JSTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info("------------------GetSingleSensorByDeviceSync_JSTest_004-------------------------");
      const TAG = '====>GetSingleSensorByDeviceSync_JSTest_004';
      try {
        const type = sensor.SensorId.ACCELEROMETER;
        const deviceId = 10000;
        const result = sensor.getSingleSensorByDeviceSync(type, deviceId);
        console.info(TAG + ` success result.length: ${result.length}  ,result: ${JSON.stringify(result)}`);
        expect(result.length === 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG + ` fail, errCode: ${error.code}  ,msg: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   GetSingleSensorByDeviceSync_JSTest_005
     * @tc.number SUB_SensorsSystem_GetSingleSensorByDeviceSync_JSTest_005
     * @tc.desc   Test getSingleSensorByDeviceSync with invalid type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSingleSensorByDeviceSync_JSTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info("------------------GetSingleSensorByDeviceSync_JSTest_005-------------------------");
      const TAG = '====>GetSingleSensorByDeviceSync_JSTest_005'
      try {
        const type = sensor.SensorId.ACCELEROMETER;
        const deviceId = -1;
        const result = sensor.getSingleSensorByDeviceSync(type, deviceId);
        console.info(TAG + ` success result.length: ${result.length}  ,result: ${JSON.stringify(result)}`);
        if (result.length === 0) {
          console.info(TAG + '====> No sensors found, Test case will return true.');
        } else {
          expect(result.length > 0).assertTrue();
        }
        done();
      } catch (error) {
        console.info(TAG + ` fail, errCode: ${error.code}  ,msg: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   GetSensorListByDeviceSync_JSTest_001
     * @tc.number SUB_SensorsSystem_GetSensorListByDeviceSync_JSTest_0010
     * @tc.desc   Test getSensorListByDeviceSync with valid deviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSensorListByDeviceSync_JSTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info("------------------GetSensorListByDeviceSync_JSTest_001-------------------------");
      const TAG = 'GetSensorListByDeviceSync_JSTest_001'
      try {
        const deviceId = -1 as int;
        const result = sensor.getSensorListByDeviceSync(deviceId);
        console.info(TAG + ' Callback in!' + JSON.stringify(result));
        if (result.length === 0) {
          console.info('No local sensors found. Test case will return true.');
          done();
        } else {
          const sensorInfo = result[0];
          //expect(result[0].deviceId >= -1).assertEqual(true);
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
          const freshResultData = sensor.getSensorListByDeviceSync(deviceId);
          const onSensorCallback = (data: sensor.AccelerometerResponse) => {
            console.info('Accelerometer data received: ' + JSON.stringify(data));
          };
          let sensorInfoParam = {
            deviceId: 1,
            sensorIndex: 0
          } as sensor.SensorInfoParam;
          const options = {
            interval: 100000000
          } as sensor.Options;
          sensor.onAccelerometerChange(onSensorCallback, options);
          setTimeout(() => {
            sensor.offAccelerometerChange(sensorInfoParam, onSensorCallback);
            done();
          }, 500);
        }
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code == 201).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   GetSensorListByDeviceSync_JSTest_002
     * @tc.number SUB_SensorsSystem_GetSensorListByDeviceSync_JSTest_0020
     * @tc.desc   Test getSensorListByDeviceSync without deviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSensorListByDeviceSync_JSTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
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
          const onSensorCallback = (data: sensor.AccelerometerResponse) => {
            console.info('Accelerometer data received: ' + JSON.stringify(data));
          };
          let sensorInfoParam = {
            deviceId: 1,
            sensorIndex: 0
          } as sensor.SensorInfoParam;

          const options = {
            interval: 100000000
          } as sensor.Options;

          sensor.onAccelerometerChange(onSensorCallback, options);
          setTimeout(() => {
            sensor.offAccelerometerChange(sensorInfoParam, onSensorCallback);
            done();
          }, 500);
        }
      } catch (error) {
        console.info(TAG + ' fail, errCode:' + error.code + ' ,msg:' + error.message);
        expect(error.code == 201).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   GetSensorListByDeviceSync_JSTest_003
     * @tc.number SUB_SensorsSystem_GetSensorListByDeviceSync_JSTest_0030
     * @tc.desc   Test getSensorListByDeviceSync with invalid deviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSensorListByDeviceSync_JSTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info("------------------GetSensorListByDeviceSync_JSTest_003-------------------------");
      const TAG = 'GetSensorListByDeviceSync_JSTest_003'
      let testNullDeviceId = -2;
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

    /**
     * @tc.name   GetSensorListByDeviceSync_JSTest_004
     * @tc.number SUB_SensorsSystem_GetSensorListByDeviceSync_JSTest_004
     * @tc.desc   Test getSingleSensorByDeviceSync with invalid type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSensorListByDeviceSync_JSTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info("------------------GetSensorListByDeviceSync_JSTest_004-------------------------");
      const TAG = '====>GetSensorListByDeviceSync_JSTest_004';
      try {
        const deviceId = 10000;
        const result = sensor.getSensorListByDeviceSync(deviceId);
        console.info(TAG + ` success result.length: ${result.length}  ,result: ${JSON.stringify(result)}`);
        expect(result.length === 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG + ` fail, errCode: ${error.code}  ,msg: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   GetSensorListByDeviceSync_JSTest_005
     * @tc.number SUB_SensorsSystem_GetSensorListByDeviceSync_JSTest_005
     * @tc.desc   Test getSingleSensorByDeviceSync with invalid type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('GetSensorListByDeviceSync_JSTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      console.info("------------------GetSensorListByDeviceSync_JSTest_005-------------------------");
      const TAG = '====>GetSensorListByDeviceSync_JSTest_005'
      try {
        const deviceId = -1;
        const result = sensor.getSensorListByDeviceSync(deviceId);
        console.info(TAG + ` success result.length: ${result.length}  ,result: ${JSON.stringify(result)}`);
        if (result.length === 0) {
          console.info(TAG + '====> No sensors found, Test case will return true.');
        } else {
          expect(result.length > 0).assertTrue();
        }
        done();
      } catch (error) {
        console.info(TAG + ` fail, errCode: ${error.code}  ,msg: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}