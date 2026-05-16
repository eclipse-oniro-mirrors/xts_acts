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
import power from '@ohos.power';


export default function PowerPermissionTest() {
  describe('PowerPermissionTest', () => {
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

    /**
     * @tc.name   PowerPermissionTest_0100
     * @tc.number PowerPermissionTest_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PowerPermissionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let TAG = 'PowerPermissionTest_0100'
      try {
        power.rebootDevice('reboot_test');
        let isActive = power.isActive();
        console.info(`${TAG} isActive:${typeof isActive}`);
        expect(typeof isActive).assertEqual('boolean');
        done();
      } catch (error) {
        console.error(TAG + ` err: ${error.code}  ${error.message}`);
        expect(error.code).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.name   getPowerConfig_Test_0200
     * @tc.number SUB_power_getPowerConfig_Test_0200
     * @tc.desc   Test the third-party application call refreshActivity will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getPowerConfig_Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'getPowerConfig_Test_0200';
      try {
        let configVal = power.getPowerConfig('scene_name_test');
        console.info('get power config success, configVal: ' + configVal);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })

    /**
     * @tc.name   setPowerConfig_Test_0300
     * @tc.number SUB_power_setPowerConfig_Test_0300
     * @tc.desc   Test the third-party application call refreshActivity will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('setPowerConfig_Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let TAG = 'setPowerConfig_Test_0300';
      try {
        power.setPowerConfig('scene_name_test', 'value_test');
        console.info('set power config success');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    })



  })
}