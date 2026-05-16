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

export default function builtinsJsonElementAsArrayTest() {
  describe("builtinsJsonElementAsArrayTest", () => {
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
     * @tc.name    builtinsJsonElementAsArrayTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0001
     * @tc.desc    Test asArray returns correct array value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arrayElements = [
        jsonx.JsonElement.createString("item1"),
        jsonx.JsonElement.createInteger(2)
      ];
      const element = jsonx.JsonElement.createArray(arrayElements);
      const result = element.asArray();
      expect(result.length).assertEqual(2);
      expect(result[0].asString()).assertEqual("item1");
      expect(result[1].asInteger()).assertEqual(2);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name    builtinsJsonElementAsArrayTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0002
     * @tc.desc    Test asArray returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createArray([]);
      const result = element.asArray();
      expect(result.length).assertEqual(0);
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonArray);
    });

    /**
     * @tc.name    builtinsJsonElementAsArrayTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0003
     * @tc.desc    Test asArray throws JsonTypeError for integer type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createInteger(42);

      let errorThrown = false;
      try {
        element.asArray();
      } catch (error) {
        errorThrown = true;
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      }

      expect(errorThrown).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name    builtinsJsonElementAsArrayTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0004
     * @tc.desc    Test asArray throws JsonTypeError for double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createDouble(3.14);

      let errorThrown = false;
      try {
        element.asArray();
      } catch (error) {
        errorThrown = true;
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      }

      expect(errorThrown).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNumber);
    });

    /**
     * @tc.name    builtinsJsonElementAsArrayTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0005
     * @tc.desc    Test asArray throws JsonTypeError for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createString("test");

      let errorThrown = false;
      try {
        element.asArray();
      } catch (error) {
        errorThrown = true;
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      }

      expect(errorThrown).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonString);
    });

    /**
     * @tc.name    builtinsJsonElementAsArrayTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0006
     * @tc.desc    Test asArray throws JsonTypeError for boolean true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createBoolean(true);

      let errorThrown = false;
      try {
        element.asArray();
      } catch (error) {
        errorThrown = true;
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      }

      expect(errorThrown).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonTrue);
    });

    /**
     * @tc.name    builtinsJsonElementAsArrayTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0007
     * @tc.desc    Test asArray throws JsonTypeError for boolean false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createBoolean(false);

      let errorThrown = false;
      try {
        element.asArray();
      } catch (error) {
        errorThrown = true;
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      }

      expect(errorThrown).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonFalse);
    });

    /**
     * @tc.name    builtinsJsonElementAsArrayTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0008
     * @tc.desc    Test asArray throws JsonTypeError for null value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createNull();

      let errorThrown = false;
      try {
        element.asArray();
      } catch (error) {
        errorThrown = true;
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      }

      expect(errorThrown).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonNull);
    });

    /**
     * @tc.name    builtinsJsonElementAsArrayTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0009
     * @tc.desc    Test asArray throws JsonTypeError for undefined element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = new jsonx.JsonElement();

      let errorThrown = false;
      try {
        element.asArray();
      } catch (error) {
        errorThrown = true;
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      }

      expect(errorThrown).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
    });

    /**
     * @tc.name    builtinsJsonElementAsArrayTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_ARRAY_TEST_0010
     * @tc.desc    Test asArray throws JsonTypeError for object element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsArrayTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const element = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());

      let errorThrown = false;
      try {
        element.asArray();
      } catch (error) {
        errorThrown = true;
        expect(error instanceof jsonx.JsonTypeError).assertTrue();
      }

      expect(errorThrown).assertTrue();
      expect(element.jsonType).assertEqual(jsonx.JsonType.JsonObject);
    });

  })
}