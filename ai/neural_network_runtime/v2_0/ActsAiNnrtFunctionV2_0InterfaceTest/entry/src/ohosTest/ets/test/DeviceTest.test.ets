/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import nnrt_function_v2_0_interface_test from 'libnnrt_function_v2_0_interface_test.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

export default function DeviceTest() {
  describe('DeviceTest', () => {
    beforeAll(() => {
      console.info('DeviceTest: beforeAll called');
    });

    afterAll(() => {
      console.info('DeviceTest: afterAll called');
    });

    beforeEach(() => {
      console.info('DeviceTest: beforeEach called');
    });

    afterEach(() => {
      console.info('DeviceTest: afterEach called');
    });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0100
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0100
   * @tc.desc   Test OH_NNDevice_GetAllDevicesID with null devicesID parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level3
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceID_0100', Level.LEVEL3, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(0);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0200
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0200
   * @tc.desc   Test OH_NNDevice_GetAllDevicesID with initialized devicesID parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level3
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceID_0200', Level.LEVEL3, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(1);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0300
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0300
   * @tc.desc   Test OH_NNDevice_GetAllDevicesID with null deviceCount parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level3
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceID_0300', Level.LEVEL3, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(2);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0400
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0400
   * @tc.desc   Test OH_NNDevice_GetAllDevicesID with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level2
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceID_0400', Level.LEVEL2, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(3);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0100
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0100
   * @tc.desc   Test OH_NNDevice_GetName with invalid device ID
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level3
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceName_0100', Level.LEVEL3, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(4);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0200
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0200
   * @tc.desc   Test OH_NNDevice_GetName with null name parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level3
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceName_0200', Level.LEVEL3, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(5);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0300
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0300
   * @tc.desc   Test OH_NNDevice_GetName with initialized name parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level3
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceName_0300', Level.LEVEL3, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(6);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0100
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0100
   * @tc.desc   Test OH_NNDevice_GetType with null type parameter
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level3
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceType_0100', Level.LEVEL3, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(8);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0200
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0200
   * @tc.desc   Test OH_NNDevice_GetType with invalid device ID
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level3
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceType_0200', Level.LEVEL3, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(9);
    expect(result).assertEqual(0);
  });

  /**
   * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0300
   * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0300
   * @tc.desc   Test OH_NNDevice_GetType with valid parameters
   * @tc.type   FUNC
   * @tc.size   MediumTest
   * @tc.level  Level1
   */
  it('SUB_AI_NNRt_Func_North_Device_DeviceType_0300', Level.LEVEL3, () => {
    let result = nnrt_function_v2_0_interface_test.nnrtDeviceTest(10);
    expect(result).assertEqual(0);
  });

  });
}
