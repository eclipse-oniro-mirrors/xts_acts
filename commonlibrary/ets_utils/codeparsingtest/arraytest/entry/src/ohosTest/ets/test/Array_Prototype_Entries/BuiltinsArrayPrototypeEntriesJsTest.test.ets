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
import Utils from '../Util.test';
import { testSymbolIterator, testAsyncIterator } from './entries_symbol_test';
import { testGeneratorWrapper } from './entries_generator_test';
import { testEntriesToMap, testEntriesToObject } from './entries_conversion_test';
import { testProxyEntries, testProxyGetIntercept, testProxyLengthIntercept } from './entries_proxy_test';
import { testPrototypeModification, testIteratorPrototypeModification } from './entries_prototype_test';
import { testBasicForOfLoop, testLoopBreak, testLoopContinue, testArraySpread, testFunctionParamSpread, testCustomIterable } from './entries_iteration_test';
import {
  testMiddleEmptySlot,
  testLeadingEmptySlots,
  testTrailingEmptySlots,
  testAllEmptySlots,
  testAlternatingEmptySlots,
  testLongIntervalEmptySlots,
  testEmptySlotVsUndefined,
  testMixedEmptySlotsAndUndefined,
  testIteratorThrow
} from './entries_sparse_test';

import {
  testArrayLikeObject,
  testArgumentsObject,
  testStringAsArrayLike,
  testEmptyString,
  testSpecialCharString,
  testInt8Array,
  testFloat32Array,
  testObjectWithLength,
  testObjectWithNegativeLength,
  testObjectWithNonNumericLength,
  testObjectWithFractionalLength,
  testEmptyObject
} from './entries_generic_test';

import {
  testNullHandling,
  testUndefinedHandling,
  testMultipleNextCalls,
  testIteratorNotReusable,
  testManualIteration,
  testNestedIterators,
  testGeneratorCombination,
  testMultipleIndependentIterators,
  testIndependentIteratorProgress,
  testCrossIteration,
  testIteratorReferenceSharing,
  testIteratorAsParameter
} from './entries_generic_test';

import {
  testIteratorStateSaving,
  testIteratorPauseAndResume,
  testThisAsPrimitive,
  testThisAsBoolean,
  testThisAsSymbol,
  testLengthAsInfinity,
  testLengthAsNegativeInfinity,
  testLengthAsNaN,
  testGetterThrowsError,
  testIndexGetterThrowsError,
  testCustomIteratorThrowsError,
  testNextReturnsInvalidValue
} from './entries_generic_test';

import {
  testSymbolElements,
  testSymbolAsPropertyKey,
  testGetters,
  testSettersAndGetters,
  testBigIntElements,
  testDateElements,
  testRegExpElements,
  testMaxSafeIntegerLength,
  testNegativeIndex,
  testNonIntegerIndex,
  testLargeIndex,
  testBasicDestructuring,
  testIgnoreIndex,
  testIgnoreValue,
  testFromIterator,
  testDataMapping,
  testSymbolArray,
  testCreateLookup,
  testIndexedMapping
} from './entries_generic_test';

interface TestResult {
  result: boolean | string | number;
  expected: boolean | string | number | undefined;
}

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function BuiltinsArrayPrototypeEntriesJsTest() {
  describe('BuiltinsArrayPrototypeEntriesJsTest', () => {
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
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_0100
     * @tc.desc   Test entries iterator Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolIterator();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_0200
     * @tc.desc   Test entries iterator async iterator is undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testAsyncIterator();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_0300
     * @tc.desc   Test generator function wrapping entries iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testGeneratorWrapper();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_0400
     * @tc.desc   Test converting entries to Map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testEntriesToMap();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_0500
     * @tc.desc   Test converting entries to Object using Object.fromEntries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testEntriesToObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_0600
     * @tc.desc   Test iterator throw() method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIteratorThrow();
      expect(result.result).not().assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_0700
     * @tc.desc   Test Proxy array entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyEntries();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_0800
     * @tc.desc   Test Proxy intercepting get operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyGetIntercept();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_0900
     * @tc.desc   Test Proxy intercepting length access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyLengthIntercept();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1000
     * @tc.desc   Test modifying Array.prototype.entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testPrototypeModification();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1100
     * @tc.desc   Test modifying iterator prototype next method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIteratorPrototypeModification();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1200
     * @tc.desc   Test basic for...of loop with entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testBasicForOfLoop();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1300
     * @tc.desc   Test for...of loop with break statement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLoopBreak();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1400
     * @tc.desc   Test for...of loop with continue statement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLoopContinue();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1500
     * @tc.desc   Test array spread operator with entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArraySpread();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1600
     * @tc.desc   Test function parameter spread with entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFunctionParamSpread();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1700
     * @tc.desc   Test custom iterable with Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCustomIterable();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1800
     * @tc.desc   Test sparse array with middle empty slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMiddleEmptySlot();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_1900
     * @tc.desc   Test sparse array with leading empty slots
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLeadingEmptySlots();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2000
     * @tc.desc   Test sparse array with trailing empty slots
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testTrailingEmptySlots();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2100
     * @tc.desc   Test sparse array with all empty slots
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testAllEmptySlots();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2200
     * @tc.desc   Test sparse array with alternating empty slots
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testAlternatingEmptySlots();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2300
     * @tc.desc   Test sparse array with long interval empty slots
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLongIntervalEmptySlots();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2400
     * @tc.desc   Test empty slot vs explicit undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testEmptySlotVsUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2500
     * @tc.desc   Test mixed empty slots and explicit undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMixedEmptySlotsAndUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2600
     * @tc.desc   Test array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2700
     * @tc.desc   Test arguments object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArgumentsObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2800
     * @tc.desc   Test string as array-like
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testStringAsArrayLike();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_2900
     * @tc.desc   Test empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testEmptyString();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3000
     * @tc.desc   Test string with special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSpecialCharString();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3100
     * @tc.desc   Test Int8Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testInt8Array();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3200
     * @tc.desc   Test Float32Array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFloat32Array();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3300
     * @tc.desc   Test object with length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectWithLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3400
     * @tc.desc   Test object with negative length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectWithNegativeLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3500
     * @tc.desc   Test object with non-numeric length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectWithNonNumericLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3600
     * @tc.desc   Test object with fractional length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectWithFractionalLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3700
     * @tc.desc   Test empty object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testEmptyObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3800
     * @tc.desc   Test null handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNullHandling();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_3900
     * @tc.desc   Test undefined handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testUndefinedHandling();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4000
     * @tc.desc   Test multiple next() calls after iteration completes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMultipleNextCalls();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4100
     * @tc.desc   Test iterator is not reusable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIteratorNotReusable();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4200
     * @tc.desc   Test manual iteration control
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testManualIteration();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4300
     * @tc.desc   Test nested iterators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNestedIterators();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4400
     * @tc.desc   Test generator combination with entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testGeneratorCombination();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4500
     * @tc.desc   Test multiple independent iterators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMultipleIndependentIterators();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4600
     * @tc.desc   Test independent iterator progress
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIndependentIteratorProgress();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4700
     * @tc.desc   Test cross iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCrossIteration();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4800
     * @tc.desc   Test iterator reference sharing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIteratorReferenceSharing();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_4900
     * @tc.desc   Test iterator as parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIteratorAsParameter();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5000
     * @tc.desc   Test iterator state saving
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIteratorStateSaving();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5100
     * @tc.desc   Test iterator pause and resume
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIteratorPauseAndResume();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5200
     * @tc.desc   Test this as primitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisAsPrimitive();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5300
     * @tc.desc   Test this as boolean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisAsBoolean();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5400
     * @tc.desc   Test this as symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisAsSymbol();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5500
     * @tc.desc   Test length as infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLengthAsInfinity();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5600
     * @tc.desc   Test length as negative infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLengthAsNegativeInfinity();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5700
     * @tc.desc   Test length as NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLengthAsNaN();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5800
     * @tc.desc   Test getter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testGetterThrowsError();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_5900
     * @tc.desc   Test index getter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIndexGetterThrowsError();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6000
     * @tc.desc   Test custom iterator throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCustomIteratorThrowsError();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6100
     * @tc.desc   Test next returns invalid value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNextReturnsInvalidValue();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6200
     * @tc.desc   Test symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolElements();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6300
     * @tc.desc   Test symbol as property key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolAsPropertyKey();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6400
     * @tc.desc   Test getters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testGetters();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6500
     * @tc.desc   Test setters and getters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSettersAndGetters();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6600
     * @tc.desc   Test bigint elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testBigIntElements();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6700
     * @tc.desc   Test date elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testDateElements();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6800
     * @tc.desc   Test regexp elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testRegExpElements();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_6900
     * @tc.desc   Test max safe integer length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMaxSafeIntegerLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7000
     * @tc.desc   Test negative index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNegativeIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7100
     * @tc.desc   Test non-integer index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNonIntegerIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7200
     * @tc.desc   Test large index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLargeIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7300
     * @tc.desc   Test basic destructuring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testBasicDestructuring();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7400
     * @tc.desc   Test ignore index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIgnoreIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7500
     * @tc.desc   Test ignore value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIgnoreValue();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7600
     * @tc.desc   Test from iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFromIterator();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7700
     * @tc.desc   Test data mapping
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testDataMapping();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7800
     * @tc.desc   Test symbol array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest7900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_7900
     * @tc.desc   Test create lookup
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCreateLookup();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeEntriesJsTest8000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_JS_TEST_8000
     * @tc.desc   Test indexed mapping
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesJsTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testIndexedMapping();
      expect(result.result).assertEqual(result.expected);
    });

  });
}
