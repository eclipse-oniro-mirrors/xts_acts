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

export default function builtinsJsonElementCreateArrayTest() {
  describe("builtinsJsonElementCreateArrayTest", () => {
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
     * @tc.name    builtinsJsonElementCreateArrayTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_ARRAY_TEST_0001
     * @tc.desc    Test createArray method with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateArrayTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const result = jsonx.JsonElement.createArray([]);
        expect(result.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        const array = result.asArray();
        expect(array.length).assertEqual(0);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateArrayTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_ARRAY_TEST_0002
     * @tc.desc    Test createArray method with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateArrayTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const elements = [
          jsonx.JsonElement.createString("hello"),
          jsonx.JsonElement.createString("world")
        ];
        const result = jsonx.JsonElement.createArray(elements);
        expect(result.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        const array = result.asArray();
        expect(array.length).assertEqual(2);
        expect(array[0].asString()).assertEqual("hello");
        expect(array[1].asString()).assertEqual("world");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateArrayTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_ARRAY_TEST_0003
     * @tc.desc    Test createArray method with number elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateArrayTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const elements = [
          jsonx.JsonElement.createInteger(1),
          jsonx.JsonElement.createInteger(2),
          jsonx.JsonElement.createInteger(3)
        ];
        const result = jsonx.JsonElement.createArray(elements);
        expect(result.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        const array = result.asArray();
        expect(array.length).assertEqual(3);
        expect(array[0].asInteger()).assertEqual(1);
        expect(array[1].asInteger()).assertEqual(2);
        expect(array[2].asInteger()).assertEqual(3);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateArrayTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_ARRAY_TEST_0004
     * @tc.desc    Test createArray method with double elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateArrayTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const elements = [
          jsonx.JsonElement.createDouble(1.5),
          jsonx.JsonElement.createDouble(2.7),
          jsonx.JsonElement.createDouble(3.14)
        ];
        const result = jsonx.JsonElement.createArray(elements);
        expect(result.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        const array = result.asArray();
        expect(array.length).assertEqual(3);
        expect(array[0].asDouble()).assertClose(1.5, 0.0001);
        expect(array[1].asDouble()).assertClose(2.7, 0.0001);
        expect(array[2].asDouble()).assertClose(3.14, 0.0001);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateArrayTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_ARRAY_TEST_0005
     * @tc.desc    Test createArray method with boolean elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateArrayTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const elements = [
          jsonx.JsonElement.createBoolean(true),
          jsonx.JsonElement.createBoolean(false),
          jsonx.JsonElement.createBoolean(true)
        ];
        const result = jsonx.JsonElement.createArray(elements);
        expect(result.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        const array = result.asArray();
        expect(array.length).assertEqual(3);
        expect(array[0].asBoolean()).assertTrue();
        expect(array[1].asBoolean()).assertFalse();
        expect(array[2].asBoolean()).assertTrue();
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateArrayTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_ARRAY_TEST_0006
     * @tc.desc    Test createArray method with null and undefined elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateArrayTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const elements = [
          jsonx.JsonElement.createNull(),
          new jsonx.JsonElement(),
          jsonx.JsonElement.createNull()
        ];
        const result = jsonx.JsonElement.createArray(elements);
        expect(result.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        const array = result.asArray();
        expect(array.length).assertEqual(3);
        expect(array[0].jsonType).assertEqual(jsonx.JsonType.JsonNull);
        expect(array[1].jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
        expect(array[2].jsonType).assertEqual(jsonx.JsonType.JsonNull);
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateArrayTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_ARRAY_TEST_0007
     * @tc.desc    Test createArray method with nested array elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateArrayTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const innerArray = jsonx.JsonElement.createArray([
          jsonx.JsonElement.createString("nested")
        ]);
        const elements = [
          jsonx.JsonElement.createString("outer"),
          innerArray
        ];
        const result = jsonx.JsonElement.createArray(elements);
        expect(result.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        const array = result.asArray();
        expect(array.length).assertEqual(2);
        expect(array[0].asString()).assertEqual("outer");
        expect(array[1].jsonType).assertEqual(jsonx.JsonType.JsonArray);
        const nestedArray = array[1].asArray();
        expect(nestedArray.length).assertEqual(1);
        expect(nestedArray[0].asString()).assertEqual("nested");
      } catch (error) { throw error; }
    });

    /**
     * @tc.name    builtinsJsonElementCreateArrayTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_CREATE_ARRAY_TEST_0008
     * @tc.desc    Test createArray method with object elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementCreateArrayTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const obj1 = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>([
          ["name", jsonx.JsonElement.createString("Alice")]
        ]));
        const obj2 = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>([
          ["name", jsonx.JsonElement.createString("Bob")]
        ]));
        const elements = [obj1, obj2];
        const result = jsonx.JsonElement.createArray(elements);
        expect(result.jsonType).assertEqual(jsonx.JsonType.JsonArray);
        const array = result.asArray();
        expect(array.length).assertEqual(2);
        expect(array[0].jsonType).assertEqual(jsonx.JsonType.JsonObject);
        expect(array[0].$_get("name").asString()).assertEqual("Alice");
        expect(array[1].jsonType).assertEqual(jsonx.JsonType.JsonObject);
        expect(array[1].$_get("name").asString()).assertEqual("Bob");
      } catch (error) { throw error; }
    });
  })
}