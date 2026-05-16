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

export default function builtinsJsonElementJsonTypeTest() {
  describe("builtinsJsonElementJsonTypeTest", () => {
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
     * @tc.name    builtinsJsonElementJsonTypeTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0001
     * @tc.desc    Test JsonElement default jsonType (should be JsonUndefined)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(new jsonx.JsonElement().jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0002
     * @tc.desc    Test JsonElement jsonType for string value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createString("test").jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0003
     * @tc.desc    Test JsonElement jsonType for double value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createDouble(123.456).jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0004
     * @tc.desc    Test JsonElement jsonType for integer value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createInteger(123).jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0005
     * @tc.desc    Test JsonElement jsonType for boolean true value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createBoolean(true).jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0006
     * @tc.desc    Test JsonElement jsonType for boolean false value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createBoolean(false).jsonType).assertEqual(jsonx.JsonType.JsonFalse);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0007
     * @tc.desc    Test JsonElement jsonType for null value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createNull().jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0008
     * @tc.desc    Test JsonElement jsonType for undefined value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createUndefined().jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0009
     * @tc.desc    Test JsonElement jsonType for array value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = [jsonx.JsonElement.createString("test")];
      expect(jsonx.JsonElement.createArray(arr).jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0010
     * @tc.desc    Test JsonElement jsonType for object value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const map = new Map<string, jsonx.JsonElement>();
      map.set("key", jsonx.JsonElement.createString("value"));
      expect(jsonx.JsonElement.createObject(map).jsonType).assertEqual(jsonx.JsonType.JsonObject);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0011
     * @tc.desc    Test JsonElement jsonType with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(jsonx.JsonElement.createArray([]).jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name    builtinsJsonElementJsonTypeTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_JSON_TYPE_TEST_0012
     * @tc.desc    Test JsonElement jsonType with empty object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementJsonTypeTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

  })
}