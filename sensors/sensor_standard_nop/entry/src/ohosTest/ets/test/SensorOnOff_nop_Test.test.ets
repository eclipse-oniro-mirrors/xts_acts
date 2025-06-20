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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import sensor from '@ohos.sensor';
import { BusinessError } from '@ohos.base';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const PERMISSION_DENIED_MSG = 'Permission denied.'

function lightCallback(data: sensor.LightResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.infraredLuminance)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function magneticFieldCallback(data: sensor.MagneticFieldResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.x)).assertEqual("number");
  expect(typeof (data.y)).assertEqual("number");
  expect(typeof (data.z)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function barometerCallback(data: sensor.BarometerResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.pressure)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function hallCallback(data: sensor.HallResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.status)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function proximityCallback(data: sensor.ProximityResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.distance)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function humidityCallback(data: sensor.HumidityResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.humidity)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function orientationCallback(data: sensor.OrientationResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.alpha)).assertEqual("number");
  expect(typeof (data.beta)).assertEqual("number");
  expect(typeof (data.gamma)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function gravityCallback(data: sensor.GravityResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.x)).assertEqual("number");
  expect(typeof (data.y)).assertEqual("number");
  expect(typeof (data.z)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function rotationVectorCallback(data: sensor.RotationVectorResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.x)).assertEqual("number");
  expect(typeof (data.y)).assertEqual("number");
  expect(typeof (data.z)).assertEqual("number");
  expect(typeof (data.w)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function ambientTempeeatureCallback(data: sensor.AmbientTemperatureResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.temperature)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function wearDetectionCallback(data: sensor.WearDetectionResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.value)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function significantCallback(data: sensor.SignificantMotionResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.scalar)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function heartRateCallback(data: sensor.HeartRateResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.heartRate)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

function magneticFieldUncalibratedCallback(data: sensor.MagneticFieldUncalibratedResponse) {
  console.info("callback" + JSON.stringify(data));
  expect(typeof (data.x)).assertEqual("number");
  expect(typeof (data.y)).assertEqual("number");
  expect(typeof (data.z)).assertEqual("number");
  expect(typeof (data.biasX)).assertEqual("number");
  expect(typeof (data.biasY)).assertEqual("number");
  expect(typeof (data.biasZ)).assertEqual("number");
  expect(typeof (data.timestamp)).assertEqual("number");
}

export default function SensorOnOff_nop_Test() {
  describe('SensorOnOff_nop_Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test001
     * @tc.name: SensorOnOff_nop_Test001
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.AMBIENT_LIGHT, lightCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.AMBIENT_LIGHT);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test001 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test002
     * @tc.name: SensorOnOff_nop_Test002
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.AMBIENT_LIGHT, lightCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test002 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test003
     * @tc.name: SensorOnOff_nop_Test003
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.MAGNETIC_FIELD, magneticFieldCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.AMBIENT_LIGHT);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test003 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test004
     * @tc.name: SensorOnOff_nop_Test004
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.MAGNETIC_FIELD, magneticFieldCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test004 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test005
     * @tc.name: SensorOnOff_nop_Test005
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.BAROMETER, barometerCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.BAROMETER);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test005 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test006
     * @tc.name: SensorOnOff_nop_Test006
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.BAROMETER, barometerCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test006 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test007
     * @tc.name: SensorOnOff_nop_Test007
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.HALL, hallCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.HALL);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test007 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test008
     * @tc.name: SensorOnOff_nop_Test008
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.HALL, hallCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test008 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test009
     * @tc.name: SensorOnOff_nop_Test009
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.PROXIMITY, proximityCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.PROXIMITY);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test009 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test010
     * @tc.name: SensorOnOff_nop_Test010
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.PROXIMITY, proximityCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test010 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test011
     * @tc.name: SensorOnOff_nop_Test011
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.HUMIDITY, humidityCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.HUMIDITY);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test011 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test012
     * @tc.name: SensorOnOff_nop_Test012
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.HUMIDITY, humidityCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test012 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test013
     * @tc.name: SensorOnOff_nop_Test013
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.ORIENTATION, orientationCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.ORIENTATION);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test013 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test014
     * @tc.name: SensorOnOff_nop_Test014
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.ORIENTATION, orientationCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test014 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test015
     * @tc.name: SensorOnOff_nop_Test015
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.GRAVITY, gravityCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.GRAVITY);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test015 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test016
     * @tc.name: SensorOnOff_nop_Test016
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.GRAVITY, gravityCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test016 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test017
     * @tc.name: SensorOnOff_nop_Test017
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.ROTATION_VECTOR, rotationVectorCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.ROTATION_VECTOR);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test017 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test018
     * @tc.name: SensorOnOff_nop_Test018
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.ROTATION_VECTOR, rotationVectorCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test018 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test019
     * @tc.name: SensorOnOff_nop_Test019
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.AMBIENT_TEMPERATURE, ambientTempeeatureCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.AMBIENT_TEMPERATURE);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test019 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test020
     * @tc.name: SensorOnOff_nop_Test020
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.AMBIENT_TEMPERATURE, ambientTempeeatureCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test020 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test021
     * @tc.name: SensorOnOff_nop_Test021
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED, magneticFieldUncalibratedCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.MAGNETIC_FIELD_UNCALIBRATED);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test021 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test022
     * @tc.name: SensorOnOff_nop_Test022
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.AMBIENT_TEMPERATURE, ambientTempeeatureCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test022 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test023
     * @tc.name: SensorOnOff_nop_Test023
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.SIGNIFICANT_MOTION, significantCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.SIGNIFICANT_MOTION);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test023 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test024
     * @tc.name: SensorOnOff_nop_Test024
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.SIGNIFICANT_MOTION, significantCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test024 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test025
     * @tc.name: SensorOnOff_nop_Test025
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.HEART_RATE, heartRateCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.HEART_RATE);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test025 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test026
     * @tc.name: SensorOnOff_nop_Test026
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.HEART_RATE, heartRateCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test026 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test027
     * @tc.name: SensorOnOff_nop_Test027
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.on(sensor.SensorId.WEAR_DETECTION, wearDetectionCallback);
        setTimeout(() => {
          sensor.off(sensor.SensorId.WEAR_DETECTION);
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test027 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Sensor_nop_Test028
     * @tc.name: SensorOnOff_nop_Test028
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("SensorOnOff_nop_Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sensor.once(sensor.SensorId.WEAR_DETECTION, wearDetectionCallback);
        setTimeout(() => {
          done();
        }, 500);
      } catch (error) {
        console.error('SensorOnOff_nop_Test028 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          expect(e.message).assertEqual(PARAMETER_ERROR_MSG);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          expect(e.message).assertEqual(PERMISSION_DENIED_MSG);
          done()
        }
      }
    })
  })}