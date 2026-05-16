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

export default function BuiltinsJsonElementSetBigIntTest() {
  describe("BuiltinsJsonElementSetBigIntTest", () => {
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
     * @tc.name    builtinsJsonElementSetBigIntTest0100
     * @tc.number  SUB_BUILTINS_JSONELEMENT_SETBIGINT_TEST_0100
     * @tc.desc    Verify setBigInt with basic bigint value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementSetBigIntTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValue = 12345n;
      const jsonElement = new jsonx.JsonElement();
      jsonElement.setBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementSetBigIntTest0200
     * @tc.number  SUB_BUILTINS_JSONELEMENT_SETBIGINT_TEST_0200
     * @tc.desc    Verify setBigInt with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementSetBigIntTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = 0n;
      const jsonElement = new jsonx.JsonElement();
      jsonElement.setBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementSetBigIntTest0300
     * @tc.number  SUB_BUILTINS_JSONELEMENT_SETBIGINT_TEST_0300
     * @tc.desc    Verify setBigInt with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementSetBigIntTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = -12345n;
      const jsonElement = new jsonx.JsonElement();
      jsonElement.setBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementSetBigIntTest0400
     * @tc.number  SUB_BUILTINS_JSONELEMENT_SETBIGINT_TEST_0400
     * @tc.desc    Verify setBigInt with large value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementSetBigIntTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 9007199254740991n;
      const jsonElement = new jsonx.JsonElement();
      jsonElement.setBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementSetBigIntTest0500
     * @tc.number  SUB_BUILTINS_JSONELEMENT_SETBIGINT_TEST_0500
     * @tc.desc    Verify setBigInt with very large value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsJsonElementSetBigIntTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const testValue = 123456789012345678901234567890n;
      const jsonElement = new jsonx.JsonElement();
      jsonElement.setBigInt(testValue);
      expect(jsonElement.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
      expect(jsonElement.asBigInt()).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementSetBigIntTest0600
     * @tc.number  SUB_BUILTINS_JSONELEMENT_SETBIGINT_TEST_0600
     * @tc.desc    Verify setBigInt in object context
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementSetBigIntTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testValue = 98765n;
      const objElement = new jsonx.JsonElement();
      const bigintElement = new jsonx.JsonElement();
      bigintElement.setBigInt(testValue);
      objElement.setElement('bigintValue', bigintElement);
      
      expect(objElement.jsonType).assertEqual(jsonx.JsonType.JsonObject);
      expect(objElement.getBigInt('bigintValue')).assertEqual(testValue);
    });

    /**
     * @tc.name    builtinsJsonElementSetBigIntTest0700
     * @tc.number  SUB_BUILTINS_JSONELEMENT_SETBIGINT_TEST_0700
     * @tc.desc    Verify setBigInt in array context
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsJsonElementSetBigIntTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testValue1 = 123n;
      const testValue2 = 456n;
      const testValue3 = 789n;
      
      const bigintElement1 = new jsonx.JsonElement();
      bigintElement1.setBigInt(testValue1);
      
      const bigintElement2 = new jsonx.JsonElement();
      bigintElement2.setBigInt(testValue2);
      
      const bigintElement3 = new jsonx.JsonElement();
      bigintElement3.setBigInt(testValue3);
      
      const arrayElement = jsonx.JsonElement.createArray([
        bigintElement1,
        bigintElement2,
        bigintElement3
      ]);
      
      expect(arrayElement.jsonType).assertEqual(jsonx.JsonType.JsonArray);
      expect(arrayElement.$_get(0).asBigInt()).assertEqual(testValue1);
      expect(arrayElement.$_get(1).asBigInt()).assertEqual(testValue2);
      expect(arrayElement.$_get(2).asBigInt()).assertEqual(testValue3);
    });

    /**
     * @tc.name    builtinsJsonElementSetBigIntTest0800
     * @tc.number  SUB_BUILTINS_JSONELEMENT_SETBIGINT_TEST_0800
     * @tc.desc    Verify setBigInt overrides existing value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsJsonElementSetBigIntTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const initialValue = 123n;
      const updatedValue = 456n;
      const jsonElement = new jsonx.JsonElement();
      jsonElement.setBigInt(initialValue);
      expect(jsonElement.asBigInt()).assertEqual(initialValue);
      jsonElement.setBigInt(updatedValue);
      expect(jsonElement.asBigInt()).assertEqual(updatedValue);
    });

  })
}
