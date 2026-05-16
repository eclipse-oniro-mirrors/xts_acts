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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import Utils from '../Util.test';
import {
  testSymbolAsElement,
  testSymbolIterator,
  testSymbolSpecies
} from './from_symbol_test';

import {
  testGeneratorFunction,
  testInfiniteGenerator
} from './from_generator_test';

import {
  testProxyArray,
  testProxyArrayLike
} from './from_proxy_test';

import {
  testMapKeyValueConversion,
  testMapKeysConversion,
  testEmptyMapConversion,
  testInt8ArrayConversion,
  testFloat32ArrayConversion,
  testBigIntTypedArrayConversion,
  testMappingDifference,
  testSubclassFrom,
  testSubclassFromWithMapFn,
  testSubclassFromWithThisArg,
  testCustomConstructorWithLength,
  testCustomConstructorNoParams,
  testPlainObjectAsThis,
  testNullAsThis,
  testConstructorReturningObject,
  testConstructorReturningPrimitive,
  testSetDeduplication,
  testMapToObjectArray,
  testChainOperations,
  testFunctionComposition
} from './from_additional_test';

import {
  testArrowFunctionAsMapFn,
  testArrowFunctionIgnoresThisArg,
  testInlineArrowFunctionAsMapFn,
  testArrowFunctionWithMultipleParams,
  testObjectAsThisArg,
  testArrayAsThisArg,
  testThisArgIsNull,
  testThisArgIsUndefined,
  testThisArgIsPrimitive,
  testArrayLikeWithLength,
  testArrayLikeLengthZero,
  testArrayLikeLengthExceedsIndices,
  testArrayLikeMissingMiddleIndex,
  testArrayLikeOnlyLength,
  testArrayLikeNegativeLength,
  testArrayLikeDecimalLength,
  testLengthBoundaryZero,
  testLengthBoundaryOne,
  testLengthBoundaryLarge,
  testLengthBoundaryNaN
} from './from_additional_test';

import {
  testLengthBoundaryInfinity,
  testLengthBoundaryStringNumber,
  testIndexBoundaryNegative,
  testIndexBoundaryNonInteger,
  testIndexBoundaryString,
  testCircularReferenceArrayLike,
  testFrozenArrayLike,
  testSealedArrayLike,
  testPrototypePropertiesArrayLike
} from './from_additional_test';

interface TestResult {
  result: boolean | string;
  expected: boolean | string | undefined;
}

export default function BuiltinsArrayFromJsTest() {
  describe('BuiltinsArrayFromJsTest', () => {
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
     * @tc.name   BuiltinsArrayFromJsTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_0100
     * @tc.desc   Test Array.from() with Symbol as array element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolAsElement();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest0200
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_0200
     * @tc.desc   Test Array.from() with Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolIterator();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest0300
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_0300
     * @tc.desc   Test Array.from() with Symbol.species
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolSpecies();
      expect(result.result).not().assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest0400
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_0400
     * @tc.desc   Test Array.from() with generator function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testGeneratorFunction();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest0500
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_0500
     * @tc.desc   Test Array.from() with infinite generator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testInfiniteGenerator();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest0600
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_0600
     * @tc.desc   Test Array.from() with Proxy array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest0700
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_0700
     * @tc.desc   Test Array.from() with Proxy array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyArrayLike();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest0800
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_0800
     * @tc.desc   Test Array.from() with Map key-value conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMapKeyValueConversion();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest0900
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_0900
     * @tc.desc   Test Array.from() with Map.keys()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMapKeysConversion();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1000
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1000
     * @tc.desc   Test Array.from() with empty Map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testEmptyMapConversion();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1100
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1100
     * @tc.desc   Test Array.from() with Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testInt8ArrayConversion();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1200
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1200
     * @tc.desc   Test Array.from() with Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFloat32ArrayConversion();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1300
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1300
     * @tc.desc   Test Array.from() with BigInt TypedArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testBigIntTypedArrayConversion();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1400
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1400
     * @tc.desc   Test Array.from() mapping difference with spread
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMappingDifference();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1500
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1500
     * @tc.desc   Test Array.from() on subclass of Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSubclassFrom();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1600
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1600
     * @tc.desc   Test subclass from with mapFn
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSubclassFromWithMapFn();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1700
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1700
     * @tc.desc   Test subclass from with thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSubclassFromWithThisArg();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1800
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1800
     * @tc.desc   Test Array.from.call with custom constructor accepting length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCustomConstructorWithLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest1900
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_1900
     * @tc.desc   Test Array.from.call with custom constructor without parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCustomConstructorNoParams();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2000
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2000
     * @tc.desc   Test Array.from.call with plain object as this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testPlainObjectAsThis();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2100
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2100
     * @tc.desc   Test Array.from.call with null as this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNullAsThis();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2200
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2200
     * @tc.desc   Test constructor returning object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testConstructorReturningObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2300
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2300
     * @tc.desc   Test constructor returning primitive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testConstructorReturningPrimitive();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2400
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2400
     * @tc.desc   Test Set deduplication
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSetDeduplication();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2500
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2500
     * @tc.desc   Test Map to object array conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMapToObjectArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2600
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2600
     * @tc.desc   Test chain operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testChainOperations();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2700
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2700
     * @tc.desc   Test function composition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFunctionComposition();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2800
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2800
     * @tc.desc   Test arrow function as mapFn
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrowFunctionAsMapFn();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest2900
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_2900
     * @tc.desc   Test arrow function ignores thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrowFunctionIgnoresThisArg();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3000
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3000
     * @tc.desc   Test inline arrow function as mapFn
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testInlineArrowFunctionAsMapFn();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3100
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3100
     * @tc.desc   Test arrow function with multiple parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrowFunctionWithMultipleParams();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3200
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3200
     * @tc.desc   Test object as thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectAsThisArg();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3300
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3300
     * @tc.desc   Test array as thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayAsThisArg();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3400
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3400
     * @tc.desc   Test thisArg is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisArgIsNull();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3500
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3500
     * @tc.desc   Test thisArg is undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisArgIsUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3600
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3600
     * @tc.desc   Test thisArg is primitive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisArgIsPrimitive();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3700
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3700
     * @tc.desc   Test array-like object with length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeWithLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3800
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3800
     * @tc.desc   Test array-like with length 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeLengthZero();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest3900
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_3900
     * @tc.desc   Test array-like with length exceeding actual indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeLengthExceedsIndices();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4000
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4000
     * @tc.desc   Test array-like with missing middle index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeMissingMiddleIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4100
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4100
     * @tc.desc   Test array-like with only length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeOnlyLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4200
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4200
     * @tc.desc   Test array-like with negative length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeNegativeLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4300
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4300
     * @tc.desc   Test array-like with decimal length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeDecimalLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4400
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4400
     * @tc.desc   Test length boundary value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLengthBoundaryZero();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4500
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4500
     * @tc.desc   Test length boundary value 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLengthBoundaryOne();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4600
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4600
     * @tc.desc   Test length boundary value large number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLengthBoundaryLarge();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4700
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4700
     * @tc.desc   Test length boundary value NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLengthBoundaryNaN();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4800
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4800
     * @tc.desc   Test length boundary value Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLengthBoundaryInfinity();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest4900
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_4900
     * @tc.desc   Test length boundary value string number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLengthBoundaryStringNumber();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest5000
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_5000
     * @tc.desc   Test index boundary value negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIndexBoundaryNegative();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest5100
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_5100
     * @tc.desc   Test index boundary value non-integer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIndexBoundaryNonInteger();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest5200
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_5200
     * @tc.desc   Test index boundary value string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIndexBoundaryString();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest5300
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_5300
     * @tc.desc   Test circular reference array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCircularReferenceArrayLike();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest5400
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_5400
     * @tc.desc   Test frozen array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFrozenArrayLike();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest5500
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_5500
     * @tc.desc   Test sealed array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSealedArrayLike();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFromJsTest5600
     * @tc.number SUB_BUILTINS_ARRAY_FROM_JS_TEST_5600
     * @tc.desc   Test array-like object with prototype properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFromJsTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testPrototypePropertiesArrayLike();
      expect(result.result).assertEqual(result.expected);
    });

  });
}
