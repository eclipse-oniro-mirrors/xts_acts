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

export default function builtinsJsonElementAsIntegerTest() {
  describe("builtinsJsonElementAsIntegerTest", () => {
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
     * @tc.name    builtinsJsonElementAsIntegerTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0001
     * @tc.desc    Test asInteger with valid integer values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const element1 = jsonx.JsonElement.createInteger(42);
        expect(element1.asInteger()).assertEqual(42);
        const element2 = jsonx.JsonElement.createInteger(0);
        expect(element2.asInteger()).assertEqual(0);
        const element3 = jsonx.JsonElement.createInteger(-100);
        expect(element3.asInteger()).assertEqual(-100);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0002
     * @tc.desc    Test asInteger with integer boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const maxInt = jsonx.JsonElement.createInteger(2147483647);
        expect(maxInt.asInteger()).assertEqual(2147483647);
        const minInt = jsonx.JsonElement.createInteger(-2147483648);
        expect(minInt.asInteger()).assertEqual(-2147483648);
        const zero = jsonx.JsonElement.createInteger(0);
        expect(zero.asInteger()).assertEqual(0);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0003
     * @tc.desc    Test asInteger with double value should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleElement = jsonx.JsonElement.createDouble(3.14);
        let hasError = false;
        try {
          doubleElement.asInteger();
        } catch (e) {
          hasError = true;
          expect(e instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(hasError).assertTrue();

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0004
     * @tc.desc    Test asInteger with various double values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testCases = [
          jsonx.JsonElement.createDouble(1.5),
          jsonx.JsonElement.createDouble(0.0),
          jsonx.JsonElement.createDouble(-1.5),
          jsonx.JsonElement.createDouble(42.0),
          jsonx.JsonElement.createDouble(100.999)
        ];

        for (const elem of testCases) {
          let error = false;
          try {
            elem.asInteger();
          } catch (e) {
            error = true;
          }
          expect(error).assertTrue();
        }

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0005
     * @tc.desc    Test asInteger with string value should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const stringElement = jsonx.JsonElement.createString("123");
        let hasError = false;
        try {
          stringElement.asInteger();
        } catch (e) {
          hasError = true;
          expect(e instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(hasError).assertTrue();

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0006
     * @tc.desc    Test asInteger with boolean value should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const trueElement = jsonx.JsonElement.createBoolean(true);
        let trueError = false;
        try {
          trueElement.asInteger();
        } catch (e) {
          trueError = true;
        }
        expect(trueError).assertTrue();

        const falseElement = jsonx.JsonElement.createBoolean(false);
        let falseError = false;
        try {
          falseElement.asInteger();
        } catch (e) {
          falseError = true;
        }
        expect(falseError).assertTrue();

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0007
     * @tc.desc    Test asInteger with null value should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const nullElement = jsonx.JsonElement.createNull();
        let hasError = false;
        try {
          nullElement.asInteger();
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0008
     * @tc.desc    Test asInteger with undefined value should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const undefinedElement = jsonx.JsonElement.createUndefined();
        let hasError = false;
        try {
          undefinedElement.asInteger();
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0009
     * @tc.desc    Test asInteger with array value should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const arrayElement = jsonx.JsonElement.createArray([]);
        let hasError = false;
        try {
          arrayElement.asInteger();
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0010
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0010
     * @tc.desc    Test asInteger with object value should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const objectElement = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        let hasError = false;
        try {
          objectElement.asInteger();
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0011
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0011
     * @tc.desc    Test asInteger with double special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const testCases = [
          jsonx.JsonElement.createDouble(Infinity),
          jsonx.JsonElement.createDouble(-Infinity),
          jsonx.JsonElement.createDouble(NaN),
          jsonx.JsonElement.createDouble(1.7976931348623157e+308),
          jsonx.JsonElement.createDouble(5e-324)
        ];

        for (const elem of testCases) {
          let error = false;
          try {
            elem.asInteger();
          } catch (e) {
            error = true;
          }
          expect(error).assertTrue();
        }

      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsIntegerTest0012
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_INTEGER_TEST_0012
     * @tc.desc    Test asInteger error messages for three scenarios
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsIntegerTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let error = false;
      try {
        const stringElement = jsonx.JsonElement.createString("test");
        try {
          stringElement.asInteger();
        } catch (e) {
          expect(e instanceof jsonx.JsonTypeError).assertTrue();
          expect(e.message).assertEqual("This value's ValueKind is not Number.");
        }
        const doubleElement = jsonx.JsonElement.createDouble(3.14);
        try {
          doubleElement.asInteger();
        } catch (e) {
          expect(e instanceof jsonx.JsonTypeError).assertTrue();
          expect(e.message).assertEqual("Expected integer, but element contains a double value.");
        }
        const intElement = jsonx.JsonElement.createInteger(42);
        expect(intElement.asInteger()).assertEqual(42);
        const nonNumberTypes = [
          jsonx.JsonElement.createBoolean(true),
          jsonx.JsonElement.createNull(),
          jsonx.JsonElement.createUndefined(),
          jsonx.JsonElement.createArray([]),
          jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>())
        ];
        for (const elem of nonNumberTypes) {
          let elemError = false;
          try {
            elem.asInteger();
          } catch (e) {
            elemError = true;
            expect(e instanceof jsonx.JsonTypeError).assertTrue();
          }
          expect(elemError).assertTrue();
        }
      } catch (e) {
        error = true;
        throw e;
      }
      expect(error).assertFalse();
    });
  })
}