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

export default function builtinsJsonElementTryAsDoubleTest() {
  describe("builtinsJsonElementTryAsDoubleTest", () => {
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
     * @tc.name    builtinsJsonElementTryAsDoubleTest0001
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_DOUBLE_TEST_0001
     * @tc.desc    Test tryAsDouble with integer JsonElement (should return double value)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsDoubleTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const intElement = jsonx.JsonElement.createInteger(42);
        const result = intElement.tryAsDouble();
        expect(result).assertEqual(42.0);
        expect(result !== undefined).assertTrue();
        const maxInt = jsonx.JsonElement.createInteger(2147483647);
        expect(maxInt.tryAsDouble()).assertEqual(2147483647.0);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryAsDoubleTest0002
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_DOUBLE_TEST_0002
     * @tc.desc    Test tryAsDouble with double JsonElement (should return double value)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsDoubleTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const doubleElement = jsonx.JsonElement.createDouble(3.14159);
        expect(doubleElement.tryAsDouble()).assertEqual(3.14159);
        const maxDouble = jsonx.JsonElement.createDouble(1.7976931348623157e+308);
        expect(maxDouble.tryAsDouble()).assertEqual(1.7976931348623157e+308);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryAsDoubleTest0003
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_DOUBLE_TEST_0003
     * @tc.desc    Test tryAsDouble with double special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsDoubleTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const inf = jsonx.JsonElement.createDouble(Infinity);
        expect(inf.tryAsDouble()).assertEqual(Infinity);
        const negInf = jsonx.JsonElement.createDouble(-Infinity);
        expect(negInf.tryAsDouble()).assertEqual(-Infinity);
        const nan = jsonx.JsonElement.createDouble(NaN);
        const nanResult = nan.tryAsDouble();
        expect(nanResult !== undefined).assertTrue();
        expect(isNaN(nanResult!)).assertTrue();
        const minDouble = jsonx.JsonElement.createDouble(5e-324);
        expect(minDouble.tryAsDouble()).assertEqual(5e-324);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryAsDoubleTest0004
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_DOUBLE_TEST_0004
     * @tc.desc    Test tryAsDouble with string JsonElement (should return undefined)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsDoubleTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const strElement = jsonx.JsonElement.createString("123.45");
        const result = strElement.tryAsDouble();
        expect(result).assertUndefined();
        const testStrings = [
          jsonx.JsonElement.createString("NaN"),
          jsonx.JsonElement.createString("Infinity"),
          jsonx.JsonElement.createString(""),
          jsonx.JsonElement.createString("true")
        ];
        for (const elem of testStrings) {
          expect(elem.tryAsDouble()).assertUndefined();
        }
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryAsDoubleTest0005
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_DOUBLE_TEST_0005
     * @tc.desc    Test tryAsDouble with boolean JsonElement (should return undefined)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsDoubleTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const trueElement = jsonx.JsonElement.createBoolean(true);
        expect(trueElement.tryAsDouble()).assertUndefined();
        const falseElement = jsonx.JsonElement.createBoolean(false);
        expect(falseElement.tryAsDouble()).assertUndefined();
        let noException = true;
        try {
          trueElement.tryAsDouble();
          falseElement.tryAsDouble();
        } catch (e) {
          noException = false;
        }
        expect(noException).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryAsDoubleTest0006
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_DOUBLE_TEST_0006
     * @tc.desc    Test tryAsDouble with null JsonElement (should return undefined)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsDoubleTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const nullElement = jsonx.JsonElement.createNull();
        expect(nullElement.tryAsDouble()).assertUndefined();
        expect(nullElement.jsonType).assertEqual(jsonx.JsonType.JsonNull);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryAsDoubleTest0007
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_DOUBLE_TEST_0007
     * @tc.desc    Test tryAsDouble with undefined JsonElement (should return undefined)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsDoubleTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const undefinedElement = jsonx.JsonElement.createUndefined();
        expect(undefinedElement.tryAsDouble()).assertUndefined();
        const emptyElement = new jsonx.JsonElement();
        expect(emptyElement.tryAsDouble()).assertUndefined();
        expect(emptyElement.jsonType).assertEqual(jsonx.JsonType.JsonUndefined);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryAsDoubleTest0008
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_DOUBLE_TEST_0008
     * @tc.desc    Test tryAsDouble with array JsonElement (should return undefined)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsDoubleTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const emptyArray = jsonx.JsonElement.createArray([]);
        expect(emptyArray.tryAsDouble()).assertUndefined();
        const numberArray = jsonx.JsonElement.createArray([
          jsonx.JsonElement.createInteger(1),
          jsonx.JsonElement.createDouble(2.0)
        ]);
        expect(numberArray.tryAsDouble()).assertUndefined();
        expect(emptyArray.jsonType).assertEqual(jsonx.JsonType.JsonArray);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });

    /**
     * @tc.name    builtinsJsonElementTryAsDoubleTest0009
     * @tc.number  BUILTINS_JSON_ELEMENT_TRY_AS_DOUBLE_TEST_0009
     * @tc.desc    Test tryAsDouble with object JsonElement (should return undefined)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsJsonElementTryAsDoubleTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        const emptyObject = jsonx.JsonElement.createObject(new Map<string, jsonx.JsonElement>());
        expect(emptyObject.tryAsDouble()).assertUndefined();
        const numberObject = jsonx.JsonElement.createObject(
          new Map<string, jsonx.JsonElement>([
            ["value", jsonx.JsonElement.createDouble(123.45)]
          ])
        );
        expect(numberObject.tryAsDouble()).assertUndefined();
        expect(emptyObject.jsonType).assertEqual(jsonx.JsonType.JsonObject);
      } catch (error) {
        expect(false).assertTrue();
        throw error;
      }
    });
  })
}