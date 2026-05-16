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

export default function BuiltinsJsonElementCreateBigIntTest() {
  describe("BuiltinsJsonElementCreateBigIntTest", () => {
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
     * @tc.name    builtinsJsonElementCreateBigIntTest0100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_0100
     * @tc.desc    Verify createBigInt with 9007199254740991n as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateBigIntTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue = 9007199254740991n;
      const jsonElement = jsonx.JsonElement.createBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateBigIntTest0200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_0200
     * @tc.desc    Verify createBigInt with zero as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateBigIntTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 0n;
      const jsonElement = jsonx.JsonElement.createBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateBigIntTest0300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_0300
     * @tc.desc    Verify createBigInt with negative bigint as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateBigIntTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = -123456789123456789n;
      const jsonElement = jsonx.JsonElement.createBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateBigIntTest0400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_0400
     * @tc.desc    Verify createBigInt with large bigint as parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementCreateBigIntTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 9007199254740991999999999999n;
      const jsonElement = jsonx.JsonElement.createBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateBigIntTest0500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_0500
     * @tc.desc    Verify tryAsBigInt works correctly with bigint element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateBigIntTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 12345n;
      const jsonElement = jsonx.JsonElement.createBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.tryAsBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateBigIntTest0600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_0600
     * @tc.desc    Verify type safety when accessing bigint as other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateBigIntTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 12345n;
      const jsonElement = jsonx.JsonElement.createBigInt(testValue);
      expect(jsonElement.tryAsDouble()).assertEqual(undefined);
      expect(jsonElement.tryAsString()).assertEqual(undefined);
      expect(jsonElement.tryAsBoolean()).assertEqual(undefined);
    });

    /**
     * @tc.name    builtinsJsonElementCreateBigIntTest0700
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_0700
     * @tc.desc    Verify createBigInt with bigint in object context
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateBigIntTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 987654321n;
      const objElement = new jsonx.JsonElement();
      objElement.setElement('bigintValue', jsonx.JsonElement.createBigInt(testValue));
      
      expect(objElement.jsonType).assertEqual(jsonx.JsonType.JsonObject);
      expect(objElement.getBigInt('bigintValue')).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementCreateBigIntTest0800
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_0800
     * @tc.desc    Verify createBigInt with bigint in array context
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateBigIntTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue1 = 123n;
      const testValue2 = 456n;
      const testValue3 = 789n;
      
      const arrayElement = jsonx.JsonElement.createArray([
        jsonx.JsonElement.createBigInt(testValue1),
        jsonx.JsonElement.createBigInt(testValue2),
        jsonx.JsonElement.createBigInt(testValue3)
      ]);
      
      expect(arrayElement.jsonType).assertEqual(jsonx.JsonType.JsonArray);
      expect(arrayElement.$_get(0).asBigInt()).assertEqual(testValue1);
      expect(arrayElement.$_get(1).asBigInt()).assertEqual(testValue2);
      expect(arrayElement.$_get(2).asBigInt()).assertEqual(testValue3);
    });

    /**
     * @tc.name    builtinsJsonElementCreateBigIntTest0900
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_0900
     * @tc.desc    Verify deep copy of bigint element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateBigIntTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 123456789n;
      const originalElement = jsonx.JsonElement.createBigInt(testValue);
      const copiedElement = new jsonx.JsonElement(originalElement);
      
      expect(copiedElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(copiedElement.asBigInt()).assertEqual(testValue);
      expect(copiedElement.asBigInt()).assertEqual(originalElement.asBigInt());
    });

    /**
     * @tc.name    builtinsJsonElementCreateBigIntTest1000
     * @tc.number  SUB_BUILTINS_JSONELEMENT_CREATEBIGINT_TEST_1000
     * @tc.desc    Verify createBigInt with very small bigint values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementCreateBigIntTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 1n;
      const jsonElement = jsonx.JsonElement.createBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

  })
}