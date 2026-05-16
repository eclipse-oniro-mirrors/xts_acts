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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium/index';
import { testSymbolParameter, testBigIntParameter } from './concat_symbol_bigint_test';
import { testSymbolElement } from './concat_symbol_element_test';
import { testSymbolSpecies, testSymbolSpeciesCustom, testSymbolSpeciesNull, testSymbolSpeciesUndefined, testSymbolSpeciesInheritance } from './concat_symbol_species_test';
import { testSymbolToPrimitive } from './concat_symbol_to_primitive_test';
import { testProxyArray, testProxyObject } from './concat_proxy_test';
import { testArrayLikeObjects, testPlainObjects, testDynamicModification, testMixedArrayAndObjects, testArrayLikeLargeLength, testArrayLikeNegativeLength, testArrayLikeStringLength, testArrayLikeNaNLength } from './concat_commented_test';
import Utils from '../Util.test';

interface TestResult {
  result: boolean | string | number;
  expected: boolean | string | number | undefined;
}

export default function BuiltinsArrayConcatJsTest() {
  describe('BuiltinsArrayConcatJsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name   BuiltinsArrayConcatJsTest0100
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_0100
     * @tc.desc   Test concat with Symbol parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolParameter();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest0200
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_0200
     * @tc.desc   Test concat with BigInt parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testBigIntParameter();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest0300
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_0300
     * @tc.desc   Test concat with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolElement();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest0400
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_0400
     * @tc.desc   Test Symbol.species with default Array return
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolSpecies();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest0500
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_0500
     * @tc.desc   Test Symbol.species with custom type return
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolSpeciesCustom();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest0600
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_0600
     * @tc.desc   Test Symbol.species returns null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolSpeciesNull();
      expect(result.result).not().assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest0700
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_0700
     * @tc.desc   Test Symbol.species returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolSpeciesUndefined();
      expect(result.result).not().assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest0800
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_0800
     * @tc.desc   Test Symbol.species with inheritance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolSpeciesInheritance();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest0900
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_0900
     * @tc.desc   Test Symbol.toPrimitive custom conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolToPrimitive();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest1000
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_1000
     * @tc.desc   Test concat with Proxy array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest1100
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_1100
     * @tc.desc   Test concat with Proxy object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest1200
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_1200
     * @tc.desc   Test concat with array-like objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeObjects();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest1300
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_1300
     * @tc.desc   Test concat with plain objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testPlainObjects();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest1400
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_1400
     * @tc.desc   Test concat with mixed array and objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMixedArrayAndObjects();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest1500
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_1500
     * @tc.desc   Test concat with array-like object with large length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeLargeLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest1600
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_1600
     * @tc.desc   Test concat with array-like object with negative length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeNegativeLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest1700
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_1700
     * @tc.desc   Test concat with array-like object with string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeStringLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayConcatJsTest1800
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_JS_TEST_1800
     * @tc.desc   Test concat with array-like object with NaN length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayConcatJsTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeNaNLength();
      expect(result.result).assertEqual(result.expected);
    });

  });
}