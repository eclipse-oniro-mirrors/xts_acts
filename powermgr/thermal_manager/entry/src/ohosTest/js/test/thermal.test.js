/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

const MSEC_1000 = 1000;

export default function ThermalTest() {
  describe('ThermalTest', function () {
    console.log("*************Thermal API Test Begin*************");

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0010
     * @tc.name testGet_Thermal_Level_JSTest0010
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Thermal_Level_JSTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      console.info("enter");
      await new Promise((resolve, reject) => {
        setTimeout(() => {
          let level = thermal.getThermalLevel();
          console.info("level is: " + level);
          expect(level >= 0 && level <= 7).assertTrue();
          resolve();
          done();
        }, MSEC_1000 * 4);
      })
    })

    /* @tc.number SUB_PowerSystem_ThermalManager_JSTest_0020
     * @tc.name testSubscribeAndUnsubscribe_Thermal_Level_JSTest0020
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('SubscribeAndUnsubscribe_Thermal_Level_JSTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      thermal.subscribeThermalLevel((level) => {
        console.info("level is: " + level);
        expect(level >= 0 && level <= 7).assertTrue();
        done();
      })
      await new Promise((resolve, reject) => {
        setTimeout(() => {
          thermal.unsubscribeThermalLevel(() => {
            console.info("unsubscribe successfully!");
          });
          resolve();
        }, MSEC_1000 * 4);
      })
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0030
     * @tc.name testGet_Thermal_Level_Cool_JSTest0030
     * @tc.desc Get device thermalLevel COOL
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Thermal_Level_Cool_JSTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let thermalLevel = thermal.ThermalLevel.COOL;
      console.info('ThermalLevel.COOL = ' + thermalLevel);
      expect(thermalLevel === 0).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0040
     * @tc.name testGet_Thermal_Level_Normal_JSTest0040
     * @tc.desc Get device thermalLevel NORMAL
     * @tc.level: Level 1
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Thermal_Level_Normal_JSTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
      let thermalLevel = thermal.ThermalLevel.NORMAL;
      console.info('ThermalLevel.NORMAL = ' + thermalLevel);
      expect(thermalLevel === 1).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0050
     * @tc.name testGet_Thermal_Level_Warm_JSTest0050
     * @tc.desc Get device thermalLevel WARM
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Thermal_Level_Warm_JSTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let thermalLevel = thermal.ThermalLevel.WARM;
      console.info('ThermalLevel.WARM = ' + thermalLevel);
      expect(thermalLevel === 2).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0060
     * @tc.name testGet_Thermal_Level_Hot_JSTest0060
     * @tc.desc Get device thermalLevel HOT
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Thermal_Level_Hot_JSTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let thermalLevel = thermal.ThermalLevel.HOT;
      console.info('ThermalLevel.HOT = ' + thermalLevel);
      expect(thermalLevel === 3).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0070
     * @tc.name testGet_Thermal_Level_OverHeated_JSTest0070
     * @tc.desc Get device thermalLevel OVERHEATED
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Thermal_Level_OverHeated_JSTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let thermalLevel = thermal.ThermalLevel.OVERHEATED;
      console.info('ThermalLevel.OVERHEATED = ' + thermalLevel);
      expect(thermalLevel === 4).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0080
     * @tc.name testGet_Thermal_Level_Warning_JSTest0080
     * @tc.desc Get device thermalLevel WARNING
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Thermal_Level_Warning_JSTest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let thermalLevel = thermal.ThermalLevel.WARNING;
      console.info('ThermalLevel.WARNING = ' + thermalLevel);
      expect(thermalLevel === 5).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0090
     * @tc.name testGet_Thermal_Level_Emergency_JSTest0090
     * @tc.desc Get device thermalLevel EMERGENCY
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Thermal_Level_Emergency_JSTest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let thermalLevel = thermal.ThermalLevel.EMERGENCY;
      console.info('ThermalLevel.EMERGENCY = ' + thermalLevel);
      expect(thermalLevel === 6).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0100
     * @tc.name testGet_Thermal_Level_Escape_JSTest0100
     * @tc.desc Get device thermalLevel ESCAPE
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Thermal_Level_Escape_JSTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
      let thermalLevel = thermal.ThermalLevel.ESCAPE;
      console.info('ThermalLevel.ESCAPE = ' + thermalLevel);
      expect(thermalLevel === 7).assertTrue();
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0110
     * @tc.name testGet_Level_JSTest0110
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Get_Level_JSTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let level = thermal.getLevel();
      console.info("Get_Level_JSTest0110 level is: " + level);
      expect(level >= thermal.ThermalLevel.COOL && level <= thermal.ThermalLevel.ESCAPE).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0120
     * @tc.name testRegister_Thermal_Level_Callback_JSTest0120
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Register_Thermal_Level_Callback_JSTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      try {
        thermal.registerThermalLevelCallback((value) => {
          console.info("Register_Thermal_Level_Callback_JSTest0120 level is: " + value);
          let level = thermal.getLevel();
          expect(level === value).assertTrue();
        })
        done();
      } catch (error) {
        console.info('Register_Thermal_Level_Callback_JSTest0120:' + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0130
     * @tc.name testRegister_Thermal_Level_Callback_JSTest0130
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('Register_Thermal_Level_Callback_JSTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      try {
        thermal.registerThermalLevelCallback('')
        done();
      } catch (error) {
        console.info('Register_Thermal_Level_Callback_JSTest0130 error:' + error);
        // 401: Invalid input parameter
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0140
     * @tc.name testUnRegister_Thermal_Level_Callback_JSTest0140
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('UnRegister_Thermal_Level_Callback_JSTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      try {
        thermal.unregisterThermalLevelCallback('')
        done();
      } catch (error) {
        console.info('UnRegister_Thermal_Level_Callback_JSTest0140 error:' + error);
        // 401: Invalid input parameter
        expect(error.code === 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0150
     * @tc.name testUnRegister_Thermal_Level_Callback_JSTest0150
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('UnRegister_Thermal_Level_Callback_JSTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      try {
        thermal.unregisterThermalLevelCallback()
        done();
      } catch (error) {
        console.info('UnRegister_Thermal_Level_Callback_JSTest0150:' + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0160
     * @tc.name testUnRegister_Thermal_Level_Callback_JSTest0160
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('UnRegister_Thermal_Level_Callback_JSTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      try {
        thermal.unregisterThermalLevelCallback(() => {
          expect(true).assertTrue();
          done();
        })
      } catch (error) {
        console.info('UnRegister_Thermal_Level_Callback_JSTest0160:' + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_PowerSystem_ThermalManager_JSTest_0170
     * @tc.name testUnsubscribe_Thermal_Level_Callback_JSTest0170
     * @tc.desc Thermal acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('Unsubscribe_Thermal_Level_Callback_JSTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      let TAG = 'Unsubscribe_Thermal_Level_Callback_JSTest0170';
      try {
        thermal.unsubscribeThermalLevel();
        console.info(`${TAG} unsubscribeThermalLevel`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${error.code} ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}
