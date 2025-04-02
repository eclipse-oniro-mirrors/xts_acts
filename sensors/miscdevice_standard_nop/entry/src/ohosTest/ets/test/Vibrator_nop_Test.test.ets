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
import { BusinessError } from '@ohos.base';
import vibrator from '@ohos.vibrator';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function vibrator_nop_Test() {
  describe('SensorTest_vibrator_1_nop', () => {
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
     * @tc.number:SUB_SensorsSystem_Vibrator_Sensor_nop_Test01
     * @tc.name: Vibrator_Sensor_nop_Test01
     * @tc.desc:Using the startVibration (callback) method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Vibrator_Sensor_nop_Test01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------Vibrator_Sensor_nop_Test01--------');
      try {
        vibrator.startVibration({
          type: 'time',
          duration: 1000,
        }, {
          id: 0,
          usage: 'alarm'
        }, (error: BusinessError) => {
          if (error) {
            console.error(`Failed to start vibration. Code: ${error.code}, message: ${error.message}`);
            if (error.code === PARAMETER_ERROR_CODE) {
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              done()
            } else {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done()
            }
          }
          console.info('Succeed in starting vibration');
        });
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.error(`An unexpected error occurred. Code: ${e.code}, message: ${e.message}`);
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Vibrator_Sensor_nop_Test02
     * @tc.name: Vibrator_Sensor_nop_Test01
     * @tc.desc:Using the startVibration (promise) method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Vibrator_Sensor_nop_Test02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------Vibrator_Sensor_nop_Test01--------');
      try {
        vibrator.startVibration({
          type: 'time',
          duration: 1000
        }, {
          id: 0,
          usage: 'alarm'
        }).then(() => {
          console.info('Succeed in starting vibration');
        }, (error: BusinessError) => {
          if (error.code === PARAMETER_ERROR_CODE) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done()
          } else {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done()
          }
          console.error(`Failed to start vibration. Code: ${error.code}, message: ${error.message}`);
        });
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.error(`An unexpected error occurred. Code: ${e.code}, message: ${e.message}`);
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Vibrator_Sensor_nop_Test03
     * @tc.name: Vibrator_Sensor_nop_Test01
     * @tc.desc:Using the stopVibration (callback) method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Vibrator_Sensor_nop_Test03", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------Vibrator_Sensor_nop_Test01--------');
      try {
        // 按照VIBRATOR_STOP_MODE_TIME模式停止振动
        vibrator.stopVibration(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_TIME, (error: BusinessError) => {
          if (error) {
            console.error(`Failed to stop vibration. Code: ${error.code}, message: ${error.message}`);
            if (error.code === PARAMETER_ERROR_CODE) {
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              done()
            } else {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done()
            }
          }
          console.info('Succeed in stopping vibration');
        })
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.error(`An unexpected error occurred. Code: ${e.code}, message: ${e.message}`);
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Vibrator_Sensor_nop_Test04
     * @tc.name: Vibrator_Sensor_nop_Test01
     * @tc.desc:Using the stopVibration (promise) method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Vibrator_Sensor_nop_Test04", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------Vibrator_Sensor_nop_Test01--------');
      try {
        // 按照VIBRATOR_STOP_MODE_TIME模式停止振动
        vibrator.stopVibration(vibrator.VibratorStopMode.VIBRATOR_STOP_MODE_TIME).then(() => {
          console.info('Succeed in stopping vibration');
        }, (error: BusinessError) => {
          if (error.code === PARAMETER_ERROR_CODE) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done()
          } else {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done()
          }
          console.error(`Failed to stop vibration. Code: ${error.code}, message: ${error.message}`);
        });
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.error(`An unexpected error occurred. Code: ${e.code}, message: ${e.message}`);
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Vibrator_Sensor_nop_Test05
     * @tc.name: Vibrator_Sensor_nop_Test01
     * @tc.desc:Using the stopVibration (promise) method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Vibrator_Sensor_nop_Test05", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------Vibrator_Sensor_nop_Test01--------');
      try {
        // 按照VIBRATOR_STOP_MODE_TIME模式停止振动
        vibrator.stopVibration().then(() => {
          console.info('Succeed in stopping vibration');
        }, (error: BusinessError) => {
          if (error.code === PARAMETER_ERROR_CODE) {
            expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
            done()
          } else {
            expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
            done()
          }
          console.error(`Failed to stop vibration. Code: ${error.code}, message: ${error.message}`);
        });
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.error(`An unexpected error occurred. Code: ${e.code}, message: ${e.message}`);
      }
    })

    /*
     * @tc.number:SUB_SensorsSystem_Vibrator_Sensor_nop_Test06
     * @tc.name: Vibrator_Sensor_nop_Test01
     * @tc.desc:Using the stopVibration (callback) method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("Vibrator_Sensor_nop_Test06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------Vibrator_Sensor_nop_Test01--------');
      try {
        // 停止所有模式的马达振动
        vibrator.stopVibration((error: BusinessError) => {
          if (error) {
            if (error.code === PARAMETER_ERROR_CODE) {
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              done()
            } else {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done()
            }
            console.error(`Failed to stop vibration. Code: ${error.code}, message: ${error.message}`);
            return;
          }
          console.info('Succeed in stopping vibration');
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`An unexpected error occurred. Code: ${e.code}, message: ${e.message}`);
      }
    })
  })
}