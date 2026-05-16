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

export default function BuiltinsJsonElementCreateLongTest() {
  describe("BuiltinsJsonElementCreateLongTest", () => {
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
     * @tc.name    builtinsJsonElementCreateLongTest0100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_0100
     * @tc.desc    Verify createLong with minimum long value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementCreateLongTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const minLong = -9223372036854775808;
      const jsonElement = jsonx.JsonElement.createLong(minLong);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(minLong);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest0200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_0200
     * @tc.desc    Verify createLong with maximum long value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementCreateLongTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const maxLong = 9223372036854775807;
      const jsonElement = jsonx.JsonElement.createLong(maxLong);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(maxLong);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest0300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_0300
     * @tc.desc    Verify createLong with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateLongTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zero = 0;
      const jsonElement = jsonx.JsonElement.createLong(zero);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(zero);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest0400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_0400
     * @tc.desc    Verify createLong with positive normal value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateLongTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const positiveValue = 123456789;
      const jsonElement = jsonx.JsonElement.createLong(positiveValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(positiveValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest0500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_0500
     * @tc.desc    Verify createLong with negative normal value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateLongTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const negativeValue = -123456789;
      const jsonElement = jsonx.JsonElement.createLong(negativeValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(negativeValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest0600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_0600
     * @tc.desc    Verify createLong with near minimum value (check precision)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementCreateLongTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const nearMin = -9223372036854775807;
      const jsonElement = jsonx.JsonElement.createLong(nearMin);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(nearMin);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest0700
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_0700
     * @tc.desc    Verify createLong with near maximum value (check precision)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementCreateLongTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const nearMax = 9223372036854775806;
      const jsonElement = jsonx.JsonElement.createLong(nearMax);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(nearMax);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest0800
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_0800
     * @tc.desc    Verify createLong with large positive value (check precision)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementCreateLongTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const largeValue = 1234567890123456789;
      const jsonElement = jsonx.JsonElement.createLong(largeValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(largeValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest0900
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_0900
     * @tc.desc    Verify createLong with large negative value (check precision)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementCreateLongTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const largeNegativeValue = -1234567890123456789;
      const jsonElement = jsonx.JsonElement.createLong(largeNegativeValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(largeNegativeValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest1000
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_1000
     * @tc.desc    Verify createLong with value just below max safe integer (check precision)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateLongTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const justBelowMaxSafe = 9007199254740991;
      const jsonElement = jsonx.JsonElement.createLong(justBelowMaxSafe);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(justBelowMaxSafe);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest1100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_1100
     * @tc.desc    Verify createLong with value just above max safe integer (check precision)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementCreateLongTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const justAboveMaxSafe = 9007199254740992;
      const jsonElement = jsonx.JsonElement.createLong(justAboveMaxSafe);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asLong()).assertEqual(justAboveMaxSafe);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest1200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_1200
     * @tc.desc    Verify createLong in object context
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateLongTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 987654321;
      const objElement = new jsonx.JsonElement();
      objElement.setElement('longValue', jsonx.JsonElement.createLong(testValue));
      
      expect(objElement.jsonType).assertEqual(jsonx.JsonType.JsonObject);
      expect(objElement.getLong('longValue')).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateLongTest1300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATELONG_TEST_1300
     * @tc.desc    Verify createLong in array context
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateLongTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue1 = 123;
      const testValue2 = 456;
      const testValue3 = 789;
      
      const arrayElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createLong(testValue1),
        jsonx.JsonElement.createLong(testValue2),
        jsonx.JsonElement.createLong(testValue3)
      ]);
      
      expect(arrayElement.jsonType).assertEqual(jsonx.JsonType.JsonArray);
      expect(arrayElement.$_get(0).asLong()).assertEqual(testValue1);
      expect(arrayElement.$_get(1).asLong()).assertEqual(testValue2);
      expect(arrayElement.$_get(2).asLong()).assertEqual(testValue3);
    });

  })
}
