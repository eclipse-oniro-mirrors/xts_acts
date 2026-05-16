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

import thermal from "@ohos.thermal"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function ThermalTest() {
  describe('ThermalTest', function () {
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
      thermal.unsubscribeThermalLevel(() => {
        console.info('afterEach unsubscribeThermalLevel success');
      });
      thermal.unregisterThermalLevelCallback(() => {
        console.info('afterEach unregisterThermalLevelCallback success');
      });
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   Get_Thermal_Level_JSTest0010
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0010
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Get_Thermal_Level_JSTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      let TAG = 'Get_Thermal_Level_JSTest0010';
      try {
        let level = thermal.getThermalLevel();
        console.info(`${TAG} level: ${level}`);
        expect(level).assertLargerOrEqual(thermal.ThermalLevel.COOL);
        expect(level).assertLessOrEqual(thermal.ThermalLevel.ESCAPE);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Subscribe_Thermal_Level_JSTest0020
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0020
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Subscribe_Thermal_Level_JSTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      let TAG = 'Subscribe_Thermal_Level_JSTest0020';
      try {
        thermal.subscribeThermalLevel((level) => {
          console.info(`${TAG} level: ${level}`);
          expect(level).assertLargerOrEqual(thermal.ThermalLevel.COOL);
          expect(level).assertLessOrEqual(thermal.ThermalLevel.ESCAPE);
          done();
        })
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Unsubscribe_Thermal_Level_JSTest0030
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0020
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Unsubscribe_Thermal_Level_JSTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async function (done) {
        let TAG = 'Unsubscribe_Thermal_Level_JSTest0030';
        try {
          thermal.subscribeThermalLevel((level) => {
            console.info(`${TAG} level: ${level}`);
            expect(level).assertLargerOrEqual(thermal.ThermalLevel.COOL);
            expect(level).assertLessOrEqual(thermal.ThermalLevel.ESCAPE);
            thermal.unsubscribeThermalLevel(() => {
              console.info(`${TAG} unsubscribeThermalLevel success`);
            })
            done();
          })
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Get_Thermal_Level_Cool_JSTest0040
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0040
     * @tc.desc   Get device thermalLevel COOL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Get_Thermal_Level_Cool_JSTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      let TAG = 'Get_Thermal_Level_Cool_JSTest0040';
      try {
        let thermalLevel = thermal.ThermalLevel.COOL;
        console.info(`${TAG} thermalLevel: ${thermalLevel}`);
        expect(thermalLevel).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Get_Thermal_Level_Normal_JSTest0050
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0050
     * @tc.desc   Get device thermalLevel NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Get_Thermal_Level_Normal_JSTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async function (done) {
        let TAG = 'Get_Thermal_Level_Normal_JSTest0050';
        try {
          let thermalLevel = thermal.ThermalLevel.NORMAL;
          console.info(`${TAG} thermalLevel: ${thermalLevel}`);
          expect(thermalLevel).assertEqual(1);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Get_Thermal_Level_Warm_JSTest0060
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0060
     * @tc.desc   Get device thermalLevel WARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Get_Thermal_Level_Warm_JSTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'Get_Thermal_Level_Warm_JSTest0060';
      try {
        let thermalLevel = thermal.ThermalLevel.WARM;
        console.info(`${TAG} thermalLevel: ${thermalLevel}`);
        expect(thermalLevel).assertEqual(2);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Get_Thermal_Level_Hot_JSTest0070
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0070
     * @tc.desc   Get device thermalLevel HOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Get_Thermal_Level_Hot_JSTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'Get_Thermal_Level_Hot_JSTest0070';
      try {
        let thermalLevel = thermal.ThermalLevel.HOT;
        console.info(`${TAG} thermalLevel: ${thermalLevel}`);
        expect(thermalLevel).assertEqual(3);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Get_Thermal_Level_OverHeated_JSTest0080
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0080
     * @tc.desc   Get device thermalLevel OVERHEATED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Get_Thermal_Level_OverHeated_JSTest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Get_Thermal_Level_OverHeated_JSTest0080';
        try {
          let thermalLevel = thermal.ThermalLevel.OVERHEATED;
          console.info(`${TAG} thermalLevel: ${thermalLevel}`);
          expect(thermalLevel).assertEqual(4);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Get_Thermal_Level_Warning_JSTest0090
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0090
     * @tc.desc   Get device thermalLevel WARNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Get_Thermal_Level_Warning_JSTest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Get_Thermal_Level_Warning_JSTest0090';
        try {
          let thermalLevel = thermal.ThermalLevel.WARNING;
          console.info(`${TAG} thermalLevel: ${thermalLevel}`);
          expect(thermalLevel).assertEqual(5);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Get_Thermal_Level_Emergency_JSTest0100
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0100
     * @tc.desc   Get device thermalLevel EMERGENCY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Get_Thermal_Level_Emergency_JSTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Get_Thermal_Level_Emergency_JSTest0100';
        try {
          let thermalLevel = thermal.ThermalLevel.EMERGENCY;
          console.info(`${TAG} thermalLevel: ${thermalLevel}`);
          expect(thermalLevel).assertEqual(6);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Get_Thermal_Level_Escape_JSTest0110
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0110
     * @tc.desc   Get device thermalLevel ESCAPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Get_Thermal_Level_Escape_JSTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Get_Thermal_Level_Escape_JSTest0110';
        try {
          let thermalLevel = thermal.ThermalLevel.ESCAPE;
          console.info(`${TAG} thermalLevel: ${thermalLevel}`);
          expect(thermalLevel).assertEqual(7);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Get_Level_JSTest0120
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0120
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Get_Level_JSTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let TAG = 'Get_Level_JSTest0120';
      try {
        let level = thermal.getLevel();
        console.info(`${TAG} level: ${level}`);
        expect(level).assertLargerOrEqual(thermal.ThermalLevel.COOL);
        expect(level).assertLessOrEqual(thermal.ThermalLevel.ESCAPE);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Register_Thermal_Level_Callback_JSTest0130
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0130
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Register_Thermal_Level_Callback_JSTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Register_Thermal_Level_Callback_JSTest0130';
        try {
          thermal.registerThermalLevelCallback((value) => {
            console.info(`${TAG} level: ${value}`);
            expect(value).assertLargerOrEqual(thermal.ThermalLevel.COOL);
            expect(value).assertLessOrEqual(thermal.ThermalLevel.ESCAPE);
            let level = thermal.getLevel();
            expect(level).assertEqual(value);
            done();
          })
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Register_Thermal_Level_Callback_JSTest0140
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0140
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Register_Thermal_Level_Callback_JSTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Register_Thermal_Level_Callback_JSTest0140';
        try {
          thermal.registerThermalLevelCallback('');
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          // 401: Invalid input parameter
          expect(error.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   UnRegister_Thermal_Level_Callback_JSTest0150
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0150
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UnRegister_Thermal_Level_Callback_JSTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'UnRegister_Thermal_Level_Callback_JSTest0150';
        try {
          thermal.unregisterThermalLevelCallback('');
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          // 401: Invalid input parameter
          expect(error.code).assertEqual(401);
          done();
        }
      })

    /**
     * @tc.name   UnRegister_Thermal_Level_Callback_JSTest0160
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0160
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UnRegister_Thermal_Level_Callback_JSTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'UnRegister_Thermal_Level_Callback_JSTest0160';
        try {
          thermal.unregisterThermalLevelCallback();
          console.info(`${TAG} unregisterThermalLevelCallback no parameter`);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   UnRegister_Thermal_Level_Callback_JSTest0170
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0170
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('UnRegister_Thermal_Level_Callback_JSTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'UnRegister_Thermal_Level_Callback_JSTest0170';
        try {
          thermal.registerThermalLevelCallback((value) => {
            console.info(`${TAG} level: ${value}`);
            expect(value).assertLargerOrEqual(thermal.ThermalLevel.COOL);
            expect(value).assertLessOrEqual(thermal.ThermalLevel.ESCAPE);
            let level = thermal.getLevel();
            expect(level).assertEqual(value);
            thermal.unregisterThermalLevelCallback(() => {
              console.info(`${TAG} unregisterThermalLevelCallback success`);
            })
            done();
          })
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   Unsubscribe_Thermal_Level_Callback_JSTest0180
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0180
     * @tc.desc   Thermal acquisition kit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Unsubscribe_Thermal_Level_Callback_JSTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'Unsubscribe_Thermal_Level_Callback_JSTest0180';
        try {
          thermal.unsubscribeThermalLevel();
          console.info(`${TAG} unsubscribeThermalLevel no parameter`);
          done();
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })
  })
}
