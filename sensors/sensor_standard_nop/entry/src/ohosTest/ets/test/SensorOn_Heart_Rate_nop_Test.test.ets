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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import sensor from '@ohos.sensor';
import { BusinessError } from '@ohos.base';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = "Service exception.Possible causes:" +
        "1. Sensor hdf service exception;2. Sensor service ipc exception;3. Sensor data channel exception."
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function heart_rate_nop_Test() {
  describe('SensorTest_sensor_6_nop', () => {
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
     * @tc.number:SUB_SensorsSystem_Heart_Rate_Sensor_nop_Test016
     * @tc.name: Heart_Rate_Sensor_nop_Test01
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Heart_Rate_Sensor_nop_Test01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------Heart_Rate_Sensor_nop_Test01--------');
      try {
        sensor.on(sensor.SensorId.HEART_RATE, ()=>{}, {
          'interval': 100000000
        });
        setTimeout(() => {
          sensor.off(sensor.SensorId.HEART_RATE);
          done();
        }, 4000);
      } catch (error) {
        console.error('Heart_Rate_Sensor_nop_Test01 catch error:' + JSON.stringify(error));
        let e: BusinessError = error as BusinessError;
        if(e.code === PARAMETER_ERROR_CODE){
          expect(e.code).assertEqual(PARAMETER_ERROR_CODE);
          done()
        }else {
          expect(e.code).assertEqual(PERMISSION_DENIED_CODE);
          done()
        }
      }
    })
  })
}