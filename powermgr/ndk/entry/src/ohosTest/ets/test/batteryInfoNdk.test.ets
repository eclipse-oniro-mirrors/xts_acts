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

import batteryInfoNdk from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import batteryInfo from '@ohos.batteryInfo';

const PluggedType = [
  'NONE',
  'AC',
  'USB',
  'WIRELESS'
];

export default function batteryInfoNdkTest() {
  describe('batteryInfoNdkTest', () => {
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
     * @tc.number SUB_PowerSystem_BatteryInfo_NdkTest_0100
     * @tc.name Test testNapi BatteryInfo.
     * @tc.desc Test testNapi BatteryInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_PowerSystem_BatteryInfo_NdkTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let TAG = 'SUB_PowerSystem_BatteryInfo_NdkTest_0100';
        try {
          let capacity = batteryInfoNdk.getCapacity();
          console.info(TAG + ` capacity: ${capacity}`);
          expect(capacity).assertEqual(batteryInfo.batterySOC);
          done();
        } catch (error) {
          console.info(TAG + ` getCapacity err: ${error.code}  ${error.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_NdkTest_0200
     * @tc.name Test testNapi BatteryInfo.
     * @tc.desc Test testNapi BatteryInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('SUB_PowerSystem_BatteryInfo_NdkTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let TAG = 'SUB_PowerSystem_BatteryInfo_NdkTest_0200';
        try {
          let pluggedType = batteryInfoNdk.getPluggedType();
          console.info(TAG + ` pluggedType: ${pluggedType}`);
          let pt = PluggedType[batteryInfo.pluggedType];
          console.info(TAG + ` pt: ${pt}`);
          expect(pluggedType).assertEqual(pt.toString());
          done();
        } catch (error) {
          console.info(TAG + ` getPluggedType err: ${error.code}  ${error.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_NdkTest_0300
     * @tc.name Test testNapi BatteryInfo.
     * @tc.desc Test testNapi BatteryInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_PowerSystem_BatteryInfo_NdkTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let TAG = 'SUB_PowerSystem_BatteryInfo_NdkTest_0300';
        try {
          let commonEventKeyCapacity = batteryInfoNdk.commonEventKeyCapacity();
          console.info(TAG + ` commonEventKeyCapacity: ${commonEventKeyCapacity}`);
          expect(commonEventKeyCapacity).assertEqual(batteryInfo.CommonEventBatteryChangedKey.EXTRA_SOC);
          done();
        } catch (error) {
          console.info(TAG + ` commonEventKeyCapacity err: ${error.code}  ${error.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_NdkTest_0400
     * @tc.name Test testNapi BatteryInfo.
     * @tc.desc Test testNapi BatteryInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_PowerSystem_BatteryInfo_NdkTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let TAG = 'SUB_PowerSystem_BatteryInfo_NdkTest_0400';
        try {
          let commonEventKeyChargeState = batteryInfoNdk.commonEventKeyChargeState();
          console.info(TAG + ` commonEventKeyChargeState: ${commonEventKeyChargeState}`);
          expect(commonEventKeyChargeState).assertEqual(batteryInfo.CommonEventBatteryChangedKey.EXTRA_CHARGE_STATE);
          done();
        } catch (error) {
          console.info(TAG + ` commonEventKeyChargeState err: ${error.code}  ${error.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_NdkTest_0500
     * @tc.name Test testNapi BatteryInfo.
     * @tc.desc Test testNapi BatteryInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_PowerSystem_BatteryInfo_NdkTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let TAG = 'SUB_PowerSystem_BatteryInfo_NdkTest_0500';
        try {
          let commonEventKeyPluggedType = batteryInfoNdk.commonEventKeyPluggedType();
          console.info(TAG + ` commonEventKeyPluggedType: ${commonEventKeyPluggedType}`);
          expect(commonEventKeyPluggedType).assertEqual(batteryInfo.CommonEventBatteryChangedKey.EXTRA_PLUGGED_TYPE);
          done();
        } catch (error) {
          console.info(TAG + ` commonEventKeyPluggedType err: ${error.code}  ${error.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_NdkTest_0600
     * @tc.name Test testNapi BatteryInfo.
     * @tc.desc Test testNapi BatteryInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_PowerSystem_BatteryInfo_NdkTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let TAG = 'SUB_PowerSystem_BatteryInfo_NdkTest_0600';
        try {
          let none = batteryInfoNdk.BatteryInfo_BatteryPluggedType.NONE;
          console.info(`${TAG} none:${none}`);
          expect(none).assertEqual(batteryInfo.BatteryPluggedType.NONE);
          done();
        } catch (error) {
          console.info(TAG + ` error: ${error.code}  ${error.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_NdkTest_0700
     * @tc.name Test testNapi BatteryInfo.
     * @tc.desc Test testNapi BatteryInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_PowerSystem_BatteryInfo_NdkTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let TAG = 'SUB_PowerSystem_BatteryInfo_NdkTest_0700';
        try {
          let ac = batteryInfoNdk.BatteryInfo_BatteryPluggedType.AC;
          console.info(`${TAG} ac:${ac}`);
          expect(ac).assertEqual(batteryInfo.BatteryPluggedType.AC);
          done();
        } catch (error) {
          console.info(TAG + ` error: ${error.code}  ${error.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_NdkTest_0800
     * @tc.name Test testNapi BatteryInfo.
     * @tc.desc Test testNapi BatteryInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_PowerSystem_BatteryInfo_NdkTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let TAG = 'SUB_PowerSystem_BatteryInfo_NdkTest_0800';
        try {
          let usb = batteryInfoNdk.BatteryInfo_BatteryPluggedType.USB;
          console.info(`${TAG} usb:${usb}`);
          expect(usb).assertEqual(batteryInfo.BatteryPluggedType.USB);
          done();
        } catch (error) {
          console.info(TAG + ` error: ${error.code}  ${error.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number SUB_PowerSystem_BatteryInfo_NdkTest_0900
     * @tc.name Test testNapi BatteryInfo.
     * @tc.desc Test testNapi BatteryInfo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_PowerSystem_BatteryInfo_NdkTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let TAG = 'SUB_PowerSystem_BatteryInfo_NdkTest_0900';
        try {
          let wireless = batteryInfoNdk.BatteryInfo_BatteryPluggedType.WIRELESS;
          console.info(`${TAG} wireless:${wireless}`);
          expect(wireless).assertEqual(batteryInfo.BatteryPluggedType.WIRELESS);
          done();
        } catch (error) {
          console.info(TAG + ` error: ${error.code}  ${error.message}`);
          expect().assertFail();
          done();
        }
      });
  })
}