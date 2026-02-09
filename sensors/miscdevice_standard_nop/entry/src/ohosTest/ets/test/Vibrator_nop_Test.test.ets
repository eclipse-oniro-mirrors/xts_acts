/*
 * Copyright (C) 2024-2025 Huawei Device Co., Ltd.
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
import resourceManager from "@ohos.resourceManager";
import common from '@ohos.app.ability.common';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function vibrator_nop_Test() {
  describe('SensorTest_vibrator_1_nop', () => {
    let TAG = '';
    let baseContext: common.Context;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((done: Function) => {
      try {
        let context: common.Context | undefined = AppStorage.get('context');
        if (context !== undefined){
          baseContext = context;
          console.info('====>beforeAll requestDownloadJSUnit baseContext:'+JSON.stringify(baseContext));
          done();
        } else {
          console.info('====>beforeAll requestDownloadJSUnit baseContext is undefined');
          done();
        }
      } catch (err) {
        console.info('====>beforeAll requestDownloadJSUnit catch err:'+JSON.stringify(err));
        done();
      }
    });
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

    /**
     * @tc.name   Vibrator_Sensor_nop_Test01
     * @tc.number SUB_SensorsSystem_Vibrator_Sensor_nop_Test01
     * @tc.desc   Using the startVibration (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   Vibrator_Sensor_nop_Test02
     * @tc.number SUB_SensorsSystem_Vibrator_Sensor_nop_Test02
     * @tc.desc   Using the startVibration (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   Vibrator_Sensor_nop_Test03
     * @tc.number SUB_SensorsSystem_Vibrator_Sensor_nop_Test03
     * @tc.desc   Using the stopVibration (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   Vibrator_Sensor_nop_Test04
     * @tc.number SUB_SensorsSystem_Vibrator_Sensor_nop_Test04
     * @tc.desc   Using the stopVibration (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   Vibrator_Sensor_nop_Test05
     * @tc.number SUB_SensorsSystem_Vibrator_Sensor_nop_Test05
     * @tc.desc   Using the stopVibration (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   Vibrator_Sensor_nop_Test06
     * @tc.number SUB_SensorsSystem_Vibrator_Sensor_nop_Test06
     * @tc.desc   Using the stopVibration (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Vibrator_Sensor_nop_Test06", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------Vibrator_Sensor_nop_Test06--------');
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

    /**
     * @tc.name   Vibrator_Sensor_nop_Test07
     * @tc.number SUB_SensorsSystem_Vibrator_Sensor_nop_Test07
     * @tc.desc   Using the stopVibration (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("Vibrator_Sensor_nop_Test07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('--------Vibrator_Sensor_nop_Test07--------');
      try {
        try {
          vibrator.stopVibrationSync();
          console.info("Vibrator_Sensor_nop_Test07 stopVibrationSync success");
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.info("Vibrator_Sensor_nop_Test07 stopVibrationSync error:" + JSON.stringify(error));
          expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          done()
        }
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`An unexpected error occurred. Code: ${e.code}, message: ${e.message}`);
      }
    })

    /**
     * @tc.name   SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_2100
     * @tc.number SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_2100
     * @tc.desc   Using the startVibration (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_2100"; 
      console.info(TAG + 'start');
      let builder = new vibrator.VibratorPatternBuilder();
      try {
        let pointsMe: vibrator.VibratorCurvePoint[] = [
          {
            time:0,
            intensity:0,
            frequency:-7
          },
          {
            time:42,
            intensity:1,
            frequency:-6
          },
          {
            time:128,
            intensity:0.94,
            frequency:-4
          },
          {
            time:217,
            intensity:0.63,
            frequency:-14
          },
          {
            time:763,
            intensity:0.48,
            frequency:-14
          }
        ]
        let param: vibrator.ContinuousParam = {
          intensity:97,
          frequency:34,
          points:pointsMe,
          index:0
        }
        builder.addContinuousEvent(0, 2468, param);
        console.info(TAG + ` builder.build is: ${JSON.stringify(builder.build())}`);
      } catch (error){
        console.info(TAG + `addContinuousEvent catch error ,error.code: ${error.code},error.message: ${error.message}`);
      }
      try {
        let pattern: vibrator.VibratorPattern = builder.build();
        vibrator.startVibration({
          type:"pattern",
          pattern:pattern
        }, {
          usage:"alarm",
          systemUsage:false
        }, (error) => {
          if (error) {
            console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
            expect(error.code).assertEqual(201);
            done();
          } else {
            console.info(TAG + ' startVibration success');
            expect(false).assertTrue();
            done();
          }
        })
      } catch (error) {
        console.info(TAG + `startVibration catch error ,error.code: ${error.code},error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1200
     * @tc.number SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1200
     * @tc.desc   Using the startVibration (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1200"; 
      console.info(TAG + 'start');
      try {
        vibrator.startVibration({
          type: 'preset',
          effectId: 'haptic.notice.warning',
          count: 50,
          intensity: 50,
        }, {
          usage: 'unknown'
        }, (error) => {
          if (error) {
            console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
            expect(error.code).assertEqual(201);
            done();
          } else {
            console.info(TAG + ' startVibration success');
            expect(false).assertTrue();
            done();
          }
        })
      } catch (error) {
          console.info(TAG + `startVibration catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
          done();
      }
    })

    /**
     * @tc.name   SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1400
     * @tc.number SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1400
     * @tc.desc   Using the vibrate (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1400"; 
      console.info(TAG + 'start');
      try {
        vibrator.vibrate(vibrator.EffectId.EFFECT_CLOCK_TIMER, (error) => {
          if (error) {
            console.info(TAG + ` vibrate error: error.code: ${error.code},error.message: ${error.message}`);
            expect(error.code).assertEqual(201);
            done();
          } else {
            console.info(TAG + ' vibrate success');
            expect(false).assertTrue();
            done();
          }
        })
      } catch (error) {
          console.info(TAG + `vibrate catch error ,error.code: ${error.code},error.message: ${error.message}`);
          expect(false).assertTrue();
          done();
      }
    })

    /**
     * @tc.name   SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1600
     * @tc.number SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1600
     * @tc.desc   Using the startVibration (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = "====>SUB_SensorsSystem_SensorDFXCapability_Dfx_IDL_1600"; 
      console.info(TAG + 'start');
      const fileName: string = 'vibrator.json'
      try {
        let rawFd: resourceManager.RawFileDescriptor | undefined = baseContext.resourceManager.getRawFdSync(fileName);
        vibrator.startVibration({
          type: 'file',
          hapticFd: {fd: rawFd.fd, offset: rawFd.offset, length: rawFd.length}
        }, {
          id: 0,
          usage: 'alarm'
        }, (error) => {
          if (error) {
            console.info(TAG + ` startVibration error: error.code: ${error.code},error.message: ${error.message}`);
            expect(error.code).assertEqual(201);
            done();
          } else {
            console.info(TAG + ' startVibration success');
            expect(false).assertTrue();
            done();
          }
        })
      } catch (error) {
        console.info(TAG + `startVibration catch error ,error.code: ${error.code},error.message: ${error.message}`);
        expect(false).assertTrue();
        done();
      } finally {
        baseContext.resourceManager.closeRawFdSync(fileName);
        console.info(TAG + ' closeRawFdSync success');
        done();
      }
    })
  })
}