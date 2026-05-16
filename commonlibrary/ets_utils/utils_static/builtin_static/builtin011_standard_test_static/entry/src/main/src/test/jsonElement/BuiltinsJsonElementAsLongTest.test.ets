/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BuiltinsJsonElementAsLongTest() {
  describe("BuiltinsJsonElementAsLongTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
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
     * @tc.name    builtinsJsonElementAsLongTest0100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASLONG_TEST_0100
     * @tc.desc    Verify asLong with basic long value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsLongTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue = 12345;
      const jsonElement = jsonx.JsonElement.createLong(testValue);
      
      const result = jsonElement.asLong();
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementAsLongTest0200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASLONG_TEST_0200
     * @tc.desc    Verify asLong with minimum long value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementAsLongTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const minLong = -9223372036854775808;
      const jsonElement = jsonx.JsonElement.createLong(minLong);
      
      const result = jsonElement.asLong();
      expect(result).assertEqual(minLong);
    });

    /**
     * @tc.name    builtinsJsonElementAsLongTest0300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASLONG_TEST_0300
     * @tc.desc    Verify asLong with maximum long value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementAsLongTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const maxLong = 9223372036854775807;
      const jsonElement = jsonx.JsonElement.createLong(maxLong);
      
      const result = jsonElement.asLong();
      expect(result).assertEqual(maxLong);
    });

    /**
     * @tc.name    builtinsJsonElementAsLongTest0400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASLONG_TEST_0400
     * @tc.desc    Verify asLong with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementAsLongTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zeroValue = 0;
      const jsonElement = jsonx.JsonElement.createLong(zeroValue);
      
      const result = jsonElement.asLong();
      expect(result).assertEqual(zeroValue);
    });

    /**
     * @tc.name    builtinsJsonElementAsLongTest0500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASLONG_TEST_0500
     * @tc.desc    Verify asLong with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementAsLongTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const negativeValue = -98765;
      const jsonElement = jsonx.JsonElement.createLong(negativeValue);
      
      const result = jsonElement.asLong();
      expect(result).assertEqual(negativeValue);
    });

    /**
     * @tc.name    builtinsJsonElementAsLongTest0600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASLONG_TEST_0600
     * @tc.desc    Verify asLong with integer value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementAsLongTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const integerValue = 45678;
      const jsonElement = jsonx.JsonElement.createInteger(integerValue);
      
      const result = jsonElement.asLong();
      expect(result).assertEqual(integerValue);
    });

  })
}
