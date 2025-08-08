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

import battery from '@system.battery';
import batteryInfo from '@ohos.batteryInfo';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function SystemBatteryTest() {
  describe('SystemBatteryTest', () => {
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
     * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0010
     * @tc.name testget_status_success_test
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 1
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('get_status_success_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'get_status_success_test';
      battery.getStatus({
        success: (batteryResponse) => {
          console.info(`${TAG} batteryResponse.charging:${batteryResponse.charging}`);
          console.info(`${TAG} batteryResponse.charging type:${typeof batteryResponse.charging}`);
          expect(typeof batteryResponse.charging).assertEqual('number');
          console.info(`${TAG} batteryResponse.level:${batteryResponse.level}`);
          console.info(`${TAG} batteryInfo.batterySOC:${batteryInfo.batterySOC}`);
          expect(batteryResponse.level * 100).assertClose(batteryInfo.batterySOC, 1);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: () => {
          console.info(`${TAG} getStatus complete`);
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0020
     * @tc.name testget_status_success_null_test
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('get_status_success_null_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'get_status_success_null_test';
      battery.getStatus({
        success: null,
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: () => {
          console.info(`${TAG} getStatus complete`);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0030
     * @tc.name testget_status_success_empty_test
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('get_status_success_empty_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'get_status_success_empty_test';
      battery.getStatus({
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: () => {
          console.info(`${TAG} getStatus complete`);
          done();
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0040
     * @tc.name testget_status_fail_null_test
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('get_status_fail_null_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'get_status_fail_null_test';
      battery.getStatus({
        success: (batteryResponse) => {
          console.info(`${TAG} batteryResponse.charging:${batteryResponse.charging}`);
          console.info(`${TAG} batteryResponse.charging type:${typeof batteryResponse.charging}`);
          expect(typeof batteryResponse.charging).assertEqual('number');
          console.info(`${TAG} batteryResponse.level:${batteryResponse.level}`);
          console.info(`${TAG} batteryInfo.batterySOC:${batteryInfo.batterySOC}`);
          expect(batteryResponse.level * 100).assertClose(batteryInfo.batterySOC, 1);
          done();
        },
        fail: null,
        complete: () => {
          console.info(`${TAG} getStatus complete`);
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0050
     * @tc.name testget_status_fail_empty_test
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('get_status_fail_empty_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'get_status_fail_empty_test';
      battery.getStatus({
        success: (batteryResponse) => {
          console.info(`${TAG} batteryResponse.charging:${batteryResponse.charging}`);
          console.info(`${TAG} batteryResponse.charging type:${typeof batteryResponse.charging}`);
          expect(typeof batteryResponse.charging).assertEqual('number');
          console.info(`${TAG} batteryResponse.level:${batteryResponse.level}`);
          console.info(`${TAG} batteryInfo.batterySOC:${batteryInfo.batterySOC}`);
          expect(batteryResponse.level * 100).assertClose(batteryInfo.batterySOC, 1);
          done();
        },
        complete: () => {
          console.info(`${TAG} getStatus complete`);
        }
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0060
     * @tc.name testget_status_complete_null_test
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('get_status_complete_null_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'get_status_complete_null_test';
      battery.getStatus({
        success: (batteryResponse) => {
          console.info(`${TAG} batteryResponse.charging:${batteryResponse.charging}`);
          console.info(`${TAG} batteryResponse.charging type:${typeof batteryResponse.charging}`);
          expect(typeof batteryResponse.charging).assertEqual('number');
          console.info(`${TAG} batteryResponse.level:${batteryResponse.level}`);
          console.info(`${TAG} batteryInfo.batterySOC:${batteryInfo.batterySOC}`);
          expect(batteryResponse.level * 100).assertClose(batteryInfo.batterySOC, 1);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
        complete: null
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0070
     * @tc.name testget_status_complete_empty_test
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('get_status_complete_empty_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let TAG = 'get_status_complete_empty_test';
      battery.getStatus({
        success: (batteryResponse) => {
          console.info(`${TAG} batteryResponse.charging:${batteryResponse.charging}`);
          console.info(`${TAG} batteryResponse.charging type:${typeof batteryResponse.charging}`);
          expect(typeof batteryResponse.charging).assertEqual('number');
          console.info(`${TAG} batteryResponse.level:${batteryResponse.level}`);
          console.info(`${TAG} batteryInfo.batterySOC:${batteryInfo.batterySOC}`);
          expect(batteryResponse.level * 100).assertClose(batteryInfo.batterySOC, 1);
          done();
        },
        fail: (msg, code) => {
          console.error(`${TAG} fail msg:${msg}`);
          console.error(`${TAG} fail code:${code}`);
          expect().assertFail();
          done();
        },
      });
    });

    /**
     * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0080
     * @tc.name testget_status_all_null
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('get_status_all_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let TAG = 'get_status_all_null';
      battery.getStatus({
        success: null,
        fail: null,
        complete: null,
      });
      console.info(`${TAG} all null`);
      expect(TAG).assertContain('null');
    });

    /**
     * @tc.number SUB_PowerSystem_SystemBattery_JSTest_0090
     * @tc.name testget_status_all_empty
     * @tc.desc Battery acquisition kit
     * @tc.level: Level 3
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('get_status_all_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let TAG = 'get_status_all_empty';
      battery.getStatus();
      console.info(`${TAG} all empty`);
      expect(TAG).assertContain('empty');
    });
  })
}