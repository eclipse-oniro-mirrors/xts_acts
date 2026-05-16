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

export default function BuiltinsJsonElementTryAsLongTest() {
  describe("BuiltinsJsonElementTryAsLongTest", () => {
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
     * @tc.name    builtinsJsonElementTryAsLongTest0100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_0100
     * @tc.desc    Verify tryAsLong with basic long value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsLongTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue = 12345;
      const jsonElement = jsonx.JsonElement.createLong(testValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest0200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_0200
     * @tc.desc    Verify tryAsLong with minimum long value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementTryAsLongTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const minLong = -9223372036854775808;
      const jsonElement = jsonx.JsonElement.createLong(minLong);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertEqual(minLong);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest0300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_0300
     * @tc.desc    Verify tryAsLong with maximum long value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementTryAsLongTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const maxLong = 9223372036854775807;
      const jsonElement = jsonx.JsonElement.createLong(maxLong);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertEqual(maxLong);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest0400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_0400
     * @tc.desc    Verify tryAsLong with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zeroValue = 0;
      const jsonElement = jsonx.JsonElement.createLong(zeroValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertEqual(zeroValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest0500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_0500
     * @tc.desc    Verify tryAsLong with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const negativeValue = -98765;
      const jsonElement = jsonx.JsonElement.createLong(negativeValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertEqual(negativeValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest0600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_0600
     * @tc.desc    Verify tryAsLong with integer value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const integerValue = 45678;
      const jsonElement = jsonx.JsonElement.createInteger(integerValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertEqual(integerValue);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest0700
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_0700
     * @tc.desc    Verify tryAsLong with bigint value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigintValue = 1234567890123456789n;
      const jsonElement = jsonx.JsonElement.createBigInt(bigintValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest0800
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_0800
     * @tc.desc    Verify tryAsLong with string value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringValue = '12345';
      const jsonElement = jsonx.JsonElement.createString(stringValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest0900
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_0900
     * @tc.desc    Verify tryAsLong with boolean value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanValue = true;
      const jsonElement = jsonx.JsonElement.createBoolean(booleanValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest1000
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_1000
     * @tc.desc    Verify tryAsLong with null value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const jsonElement = jsonx.JsonElement.createNull();
      
      const result = jsonElement.tryAsLong();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest1100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_1100
     * @tc.desc    Verify tryAsLong with object value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objElement = new jsonx.JsonElement();
      objElement.setElement('key', jsonx.JsonElement.createLong(123));
      
      const result = objElement.tryAsLong();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest1200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_1200
     * @tc.desc    Verify tryAsLong with array value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrayElement = jsonx.JsonElement.createArray([jsonx.JsonElement.createLong(123)]);
      
      const result = arrayElement.tryAsLong();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest1300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_1300
     * @tc.desc    Verify tryAsLong with double value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const doubleValue = 123.456;
      const jsonElement = jsonx.JsonElement.createDouble(doubleValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest1400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_1400
     * @tc.desc    Verify tryAsLong with integer double value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const integerDoubleValue = 123.0;
      const jsonElement = jsonx.JsonElement.createDouble(integerDoubleValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest1500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_1500
     * @tc.desc    Verify tryAsLong with zero double value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zeroDoubleValue = 0.0;
      const jsonElement = jsonx.JsonElement.createDouble(zeroDoubleValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsJsonElementTryAsLongTest1600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_TRYASLONG_TEST_1600
     * @tc.desc    Verify tryAsLong with negative double value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementTryAsLongTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const negativeDoubleValue = -123.456;
      const jsonElement = jsonx.JsonElement.createDouble(negativeDoubleValue);
      
      const result = jsonElement.tryAsLong();
      expect(result).assertUndefined();
    });

  })
}
