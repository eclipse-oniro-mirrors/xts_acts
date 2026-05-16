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

export default function builtinsJsonElementIteratorTest() {
  describe("builtinsJsonElement$_iteratorTest", () => {
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
     * @tc.name    builtinsJsonElementIteratorTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_ITERATOR_TEST_0001
     * @tc.desc    Test $_iterator() method with empty object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementIteratorTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testMap = new Map<string, jsonx.JsonElement>();
        const testObject = jsonx.JsonElement.createObject(testMap);
        const iterator = testObject.$_iterator();
        let count = 0;
        for (const _ of iterator) {
          count++;
        }
        expect(count).assertEqual(0);
      } catch (error) {
        console.error("Empty iterator test failed:", error);
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementIteratorTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_ITERATOR_TEST_0002
     * @tc.desc    Test $_iterator() method throws error on non-object types (string)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementIteratorTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testString = jsonx.JsonElement.createString("test");
        let errorThrown = false;
        try {
          testString.$_iterator();
        } catch (error) {
          errorThrown = true;
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
          expect(error.message).assertEqual("This value's ValueKind is not Object.");
        }
        expect(errorThrown).assertTrue();
      } catch (error) {
        console.error("Non-object iterator test failed:", error);
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementIteratorTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_ITERATOR_TEST_0003
     * @tc.desc    Test $_iterator() method throws error on non-object types (number)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementIteratorTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testInteger = jsonx.JsonElement.createInteger(42);
        const testDouble = jsonx.JsonElement.createDouble(3.14);
        let errorThrown1 = false;
        try {
          testInteger.$_iterator();
        } catch (error) {
          errorThrown1 = true;
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(errorThrown1).assertTrue();
        let errorThrown2 = false;
        try {
          testDouble.$_iterator();
        } catch (error) {
          errorThrown2 = true;
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(errorThrown2).assertTrue();
      } catch (error) {
        console.error("Number iterator test failed:", error);
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementIteratorTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_ITERATOR_TEST_0004
     * @tc.desc    Test $_iterator() method throws error on non-object types (boolean/null/undefined)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementIteratorTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testBoolean = jsonx.JsonElement.createBoolean(true);
        const testNull = jsonx.JsonElement.createNull();
        const testUndefined = jsonx.JsonElement.createUndefined();
        let errorThrown1 = false;
        try {
          testBoolean.$_iterator();
        } catch (error) {
          errorThrown1 = true;
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(errorThrown1).assertTrue();
        let errorThrown2 = false;
        try {
          testNull.$_iterator();
        } catch (error) {
          errorThrown2 = true;
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(errorThrown2).assertTrue();
        let errorThrown3 = false;
        try {
          testUndefined.$_iterator();
        } catch (error) {
          errorThrown3 = true;
          expect(error instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(errorThrown3).assertTrue();
      } catch (error) {
        console.error("Boolean/null/undefined iterator test failed:", error);
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementIteratorTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_ITERATOR_TEST_0005
     * @tc.desc    Test $_iterator() method successfully iterates object properties
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementIteratorTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const entries: Array<[string, jsonx.JsonElement]> = [
          ["name", jsonx.JsonElement.createString("John")],
          ["age", jsonx.JsonElement.createInteger(30)],
          ["isStudent", jsonx.JsonElement.createBoolean(false)],
          ["score", jsonx.JsonElement.createDouble(85.5)]
        ];
        const testObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>(entries));
        const iterator = testObject.$_iterator();
        let iterationCount: number = 0;
        const foundKeys: string[] = [];
        const stringValues: Map<string, string> = new Map<string, string>();
        const numberValues: Map<string, number> = new Map<string, number>();
        const booleanValues: Map<string, boolean> = new Map<string, boolean>();
        for (const entry of iterator) {
          const key: string = entry[0];
          const value: jsonx.JsonElement = entry[1];
          iterationCount++;
          foundKeys.push(key);
          switch (value.jsonType) {
            case jsonx.JsonType.JsonString:
              stringValues.set(key, value.asString());
              break;
            case jsonx.JsonType.JsonNumber:
              const intValue = value.tryAsInteger();
              if (intValue !== undefined) {
                numberValues.set(key, intValue);
              } else {
                numberValues.set(key, value.asDouble());
              }
              break;
            case jsonx.JsonType.JsonFalse:
            case jsonx.JsonType.JsonTrue:
              booleanValues.set(key, value.asBoolean());
              break;
          }
        }
        expect(iterationCount).assertEqual(4);
        expect(stringValues.get("name")).assertEqual("John");
        expect(numberValues.get("age")).assertEqual(30);
        expect(booleanValues.get("isStudent")).assertFalse();
        expect(numberValues.get("score")).assertClose(85.5, 0.1);
        expect(foundKeys[0]).assertEqual("name");
        expect(foundKeys[1]).assertEqual("age");
        expect(foundKeys[2]).assertEqual("isStudent");
        expect(foundKeys[3]).assertEqual("score");
      } catch (error) {
        console.error("Iterator success test failed:", error);
        throw error;
      }
    });
  })
}