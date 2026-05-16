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

export default function BuiltinsJsonElementAsBigIntTest() {
  describe("BuiltinsJsonElementAsBigIntTest", () => {
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
     * @tc.name    builtinsJsonElementAsBigIntTest0100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASBIGINT_TEST_0100
     * @tc.desc    Verify asBigInt with bigint value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsBigIntTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue = 12345n;
      const bigintElem = jsonx.JsonElement.createBigInt(testValue);
      const result = bigintElem.asBigInt();
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementAsBigIntTest0200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASBIGINT_TEST_0200
     * @tc.desc    Verify asBigInt with integer value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementAsBigIntTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 123;
      const intElem = jsonx.JsonElement.createInteger(testValue);
      const result = intElem.asBigInt();
      expect(result).assertEqual(BigInt(testValue));
    });

    /**
     * @tc.name    builtinsJsonElementAsBigIntTest0300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASBIGINT_TEST_0300
     * @tc.desc    Verify asBigInt with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementAsBigIntTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = -12345n;
      const negativeElem = jsonx.JsonElement.createBigInt(testValue);
      const result = negativeElem.asBigInt();
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementAsBigIntTest0400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASBIGINT_TEST_0400
     * @tc.desc    Verify asBigInt with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementAsBigIntTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 0n;
      const zeroElem = jsonx.JsonElement.createBigInt(testValue);
      const result = zeroElem.asBigInt();
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementAsBigIntTest0500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASBIGINT_TEST_0500
     * @tc.desc    Verify asBigInt with large value (MAX_SAFE_INTEGER)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementAsBigIntTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testValue = 9007199254740991n;
      const largeElem = jsonx.JsonElement.createBigInt(testValue);
      const result = largeElem.asBigInt();
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementAsBigIntTest0600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_ASBIGINT_TEST_0600
     * @tc.desc    Verify asBigInt with very large value (beyond MAX_SAFE_INTEGER)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementAsBigIntTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testValue = 123456789012345678901234567890n;
      const veryLargeElem = jsonx.JsonElement.createBigInt(testValue);
      const result = veryLargeElem.asBigInt();
      expect(result).assertEqual(testValue);
    });

  })
}
