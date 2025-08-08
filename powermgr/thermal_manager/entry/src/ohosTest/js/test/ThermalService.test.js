/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import thermal from '@ohos.thermal';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function ThermalServiceTest() {
  describe('ThermalServiceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // hdc shell pkill powermgr
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

    /**
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0010
     * @tc.name testPowerManagerServiceTest_0100
     * @tc.desc ThermalService stop test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('ThermalServiceTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'ThermalServiceTest_0100';
      try {
        thermal.registerThermalLevelCallback(level => {
          console.info(`${TAG} level: ${level}`);
        });
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4800101);
        done();
      }
    });

    /**
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0020
     * @tc.name testPowerManagerServiceTest_0200
     * @tc.desc ThermalService stop test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('ThermalServiceTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'ThermalServiceTest_0200';
      try {
        thermal.unregisterThermalLevelCallback(() => {
          console.info(`${TAG} unsubscribe thermal level success.`);
          done();
        });
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4800101);
        done();
      }
    });

    /**
     * @tc.number SUB_PowerSystem_PowerManagerService_JSTest_0030
     * @tc.name testPowerManagerServiceTest_0300
     * @tc.desc ThermalService stop test
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('ThermalServiceTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'ThermalServiceTest_0300';
      try {
        let level = thermal.getLevel();
        console.info(`${TAG} level: ${level}`);
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(4800101);
        done();
      }
    });
  });
}