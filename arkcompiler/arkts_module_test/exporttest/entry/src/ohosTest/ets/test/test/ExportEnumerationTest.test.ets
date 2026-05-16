/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import DefaultObjOrderStatus from '../enumeration/DefaultObjOrderStatus';
import DefaultObjOrderStatus1 from '../enumeration/DefaultObjOrderStatus1';
import DefaultOrderStatus from '../enumeration/DefaultOrderStatus';
import { EnumOrderStatus } from '../enumeration/EnumOrderStatus';
import { OrderStatus1 } from '../enumeration/OrderStatus1';
import { OrderStatus2 } from '../enumeration/OrderStatus2';
import { OrderStatus3 } from '../enumeration/EnumOrderStatus3';
import { EnumOrderStatus4 } from '../enumeration/UtilOrderStatus';
import { OrderStatus5 } from '../enumeration/UtilOrderStatus1';
import { sleep } from '../utils/Utils';

export default function exportEnumerationTest() {
  describe('ExportEnumerationTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(200)
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
     * @tc.name   exportEnumerationTest0100
     * @tc.number SUB_EXPORT_ENUMERATION_TEST_0100
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportEnumerationTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = DefaultOrderStatus.Pending;
      const expectedResult = 'PENDING';
      expect(result).assertEqual(expectedResult)
    });

    /**
     * @tc.name   exportEnumerationTest0101
     * @tc.number SUB_EXPORT_ENUMERATION_TEST_0101
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportEnumerationTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = DefaultObjOrderStatus.OrderStatus.Pending;
      const expectedResult = 'PENDING';
      expect(result).assertEqual(expectedResult)
    });

    /**
     * @tc.name   exportEnumerationTest0102
     * @tc.number SUB_EXPORT_ENUMERATION_TEST_0102
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportEnumerationTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = DefaultObjOrderStatus1.OrderStatus.Pending;
      const expectedResult = 'PENDING';
      expect(result).assertEqual(expectedResult)
    });

    /**
     * @tc.name   exportEnumerationTest0103
     * @tc.number SUB_EXPORT_ENUMERATION_TEST_0103
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportEnumerationTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = EnumOrderStatus.Pending;
      const expectedResult = 'PENDING';
      expect(result).assertEqual(expectedResult)
    });

    /**
     * @tc.name   exportEnumerationTest0104
     * @tc.number SUB_EXPORT_ENUMERATION_TEST_0104
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportEnumerationTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = OrderStatus1.Pending;
      const expectedResult = 'PENDING';
      expect(result).assertEqual(expectedResult)
    });

    /**
     * @tc.name   exportEnumerationTest0105
     * @tc.number SUB_EXPORT_ENUMERATION_TEST_0105
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportEnumerationTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = OrderStatus2.Pending;
      const expectedResult = 'PENDING';
      expect(result).assertEqual(expectedResult)
    });

    /**
     * @tc.name   exportEnumerationTest0106
     * @tc.number SUB_EXPORT_ENUMERATION_TEST_0106
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportEnumerationTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = OrderStatus3.Pending;
      const expectedResult = 'PENDING';
      expect(result).assertEqual(expectedResult)
    });

    /**
     * @tc.name   exportEnumerationTest0107
     * @tc.number SUB_EXPORT_ENUMERATION_TEST_0107
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportEnumerationTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = EnumOrderStatus4.Pending;
      const expectedResult = 'PENDING';
      expect(result).assertEqual(expectedResult)
    });

    /**
     * @tc.name   exportEnumerationTest0108
     * @tc.number SUB_EXPORT_ENUMERATION_TEST_0108
     * @tc.desc   Test find method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportEnumerationTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = OrderStatus5.EnumOrderStatus.Pending;
      const expectedResult = 'PENDING';
      expect(result).assertEqual(expectedResult)
    });
  })
}
