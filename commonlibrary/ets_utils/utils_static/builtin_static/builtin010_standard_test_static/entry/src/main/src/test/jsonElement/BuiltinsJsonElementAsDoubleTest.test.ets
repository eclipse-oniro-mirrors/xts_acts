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

export default function builtinsJsonElementAsDoubleTest() {
  describe("builtinsJsonElementAsDoubleTest", () => {
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
     * @tc.name    builtinsJsonElementAsDoubleTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_DOUBLE_TEST_0001
     * @tc.desc    Test asDouble with integer boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsDoubleTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const maxInt = jsonx.JsonElement.createInteger(2147483647);
        expect(maxInt.asDouble()).assertEqual(2147483647.0);

        const minInt = jsonx.JsonElement.createInteger(-2147483648);
        expect(minInt.asDouble()).assertEqual(-2147483648.0);

        const zero = jsonx.JsonElement.createInteger(0);
        expect(zero.asDouble()).assertEqual(0.0);

        const negativeZero = jsonx.JsonElement.createInteger(-0);
        expect(negativeZero.asDouble()).assertEqual(-0.0);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsDoubleTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_DOUBLE_TEST_0002
     * @tc.desc    Test asDouble with double special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsDoubleTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const inf = jsonx.JsonElement.createDouble(Infinity);
        expect(inf.asDouble()).assertEqual(Infinity);
        const negInf = jsonx.JsonElement.createDouble(-Infinity);
        expect(negInf.asDouble()).assertEqual(-Infinity);
        const nan = jsonx.JsonElement.createDouble(NaN);
        expect(isNaN(nan.asDouble())).assertTrue();
        const maxDouble = jsonx.JsonElement.createDouble(1.7976931348623157e+308);
        expect(maxDouble.asDouble()).assertEqual(1.7976931348623157e+308);
        const minDouble = jsonx.JsonElement.createDouble(5e-324);
        expect(minDouble.asDouble()).assertEqual(5e-324);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsDoubleTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_DOUBLE_TEST_0003
     * @tc.desc    Test asDouble with string JsonElement should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsDoubleTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const strElement = jsonx.JsonElement.createString("123.45");
        let hasError = false;
        try {
          strElement.asDouble();
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
     * @tc.name    builtinsJsonElementAsDoubleTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_DOUBLE_TEST_0004
     * @tc.desc    Test asDouble with boolean JsonElement should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsDoubleTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const trueElement = jsonx.JsonElement.createBoolean(true);
        let trueError = false;
        try {
          trueElement.asDouble();
        } catch (e) {
          trueError = true;
          expect(e instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(trueError).assertTrue();
        const falseElement = jsonx.JsonElement.createBoolean(false);
        let falseError = false;
        try {
          falseElement.asDouble();
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
     * @tc.name    builtinsJsonElementAsDoubleTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_DOUBLE_TEST_0005
     * @tc.desc    Test asDouble with null and undefined JsonElement should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsDoubleTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const nullElement = jsonx.JsonElement.createNull();
        let nullError = false;
        try {
          nullElement.asDouble();
        } catch (e) {
          nullError = true;
          expect(e instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(nullError).assertTrue();
        const undefinedElement = jsonx.JsonElement.createUndefined();
        let undefinedError = false;
        try {
          undefinedElement.asDouble();
        } catch (e) {
          undefinedError = true;
        }
        expect(undefinedError).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsDoubleTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_DOUBLE_TEST_0006
     * @tc.desc    Test asDouble with array JsonElement should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsDoubleTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const emptyArray = jsonx.JsonElement.createArray([]);
        let arrayError1 = false;
        try {
          emptyArray.asDouble();
        } catch (e) {
          arrayError1 = true;
          expect(e instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(arrayError1).assertTrue();

        const numberArray = jsonx.JsonElement.createArray([
          jsonx.JsonElement.createInteger(1),
          jsonx.JsonElement.createDouble(2.0)
        ]);
        let arrayError2 = false;
        try {
          numberArray.asDouble();
        } catch (e) {
          arrayError2 = true;
        }
        expect(arrayError2).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsDoubleTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_DOUBLE_TEST_0007
     * @tc.desc    Test asDouble with object JsonElement should throw JsonTypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsDoubleTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const emptyObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        let objError1 = false;
        try {
          emptyObject.asDouble();
        } catch (e) {
          objError1 = true;
          expect(e instanceof jsonx.JsonTypeError).assertTrue();
        }
        expect(objError1).assertTrue();
        const numberObject = jsonx.JsonElement.createObject(
          new Map<string, jsonx.JsonElement>([
            ["value", jsonx.JsonElement.createDouble(123.45)]
          ])
        );
        let objError2 = false;
        try {
          numberObject.asDouble();
        } catch (e) {
          objError2 = true;
        }
        expect(objError2).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementAsDoubleTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_AS_DOUBLE_TEST_0008
     * @tc.desc    Test asDouble with precision and rounding issues
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementAsDoubleTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const precise1 = jsonx.JsonElement.createDouble(0.1 + 0.2);
        expect(precise1.asDouble()).assertEqual(0.30000000000000004);
        const precise2 = jsonx.JsonElement.createDouble(1.005 * 100);
        expect(precise2.asDouble()).assertEqual(100.49999999999999);
        const bigIntAsDouble = jsonx.JsonElement.createDouble(9007199254740993);
        expect(bigIntAsDouble.asDouble()).assertEqual(9007199254740992);
        const tiny = jsonx.JsonElement.createDouble(Number.MIN_VALUE / 2);
        expect(tiny.asDouble()).assertEqual(0);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

  })
}