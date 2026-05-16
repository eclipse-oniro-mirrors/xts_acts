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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsJsonElementTryAsIntegerTest() {
  describe("builtinsJsonElementTryAsIntegerTest", () => {
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
     * @tc.name    builtinsJsonElementTryAsIntegerTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0001
     * @tc.desc    Test tryAsInteger returns correct integer value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createInteger(2147483647);
      const result = element.tryAsInteger();
      expect(result).assertEqual(2147483647);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0002
     * @tc.desc    Test tryAsInteger returns undefined for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createString("test");
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0003
     * @tc.desc    Test tryAsInteger returns undefined for double value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createDouble(3.14);
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0004
     * @tc.desc    Test tryAsInteger returns undefined for boolean true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createBoolean(true);
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0005
     * @tc.desc    Test tryAsInteger returns undefined for boolean false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createBoolean(false);
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0006
     * @tc.desc    Test tryAsInteger returns undefined for null value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createNull();
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0007
     * @tc.desc    Test tryAsInteger returns undefined for undefined element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0008
     * @tc.desc    Test tryAsInteger returns undefined for array element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createArray([]);
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0009
     * @tc.desc    Test tryAsInteger returns undefined for object element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0010
     * @tc.desc    Test tryAsInteger returns zero integer value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createInteger(0);
      const result = element.tryAsInteger();
      expect(result).assertEqual(0);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0011
     * @tc.desc    Test tryAsInteger returns undefined for element with array content
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arrayElements = [
        jsonx.JsonElement.createInteger(1),
        jsonx.JsonElement.createString("two")
      ];
      const element = jsonx.JsonElement.createArray(arrayElements);
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name    builtinsJsonElementTryAsIntegerTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_INTEGER_TEST_0012
     * @tc.desc    Test tryAsInteger returns undefined for element with object content
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsIntegerTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map = new Map<string, jsonx.JsonElement>();
      map.set("key1", jsonx.JsonElement.createInteger(1));
      const element = jsonx.JsonElement.createObject(map);
      const result = element.tryAsInteger();
      expect(result).assertUndefined();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
    });

  })
}