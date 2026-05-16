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
import {describe,beforeAll,beforeEach,afterEach,afterAll,it,expect,TestType,Level, Size } from '@ohos/hypium/index';

import {
  testSymbolInitialValue,
  testSparseArray,
  testSparseArrayVsUndefined,
  testUndefinedArrayResult,
  testSparseArrayIndices,
  testSparseArrayFirstIndex,
  testSparseArrayLastIndex,
  testSparseArrayBeginning,
  testSparseArrayEnd,
  testSparseArrayMiddle,
  testAllEmptySlotsNoInitial,
  testAllEmptySlotsWithInitial,
  testSparseArrayLength,
  testSparseArrayVisitedCount,
  testDynamicSparseArray,
  testSparseObjectArray,
  testSparseArrayFilter,
  testArrayLikeZeroLength,
  testReduceDepthFirstSearch,

} from './reduce_js_test';

import {
  testSparseArrayFilterFirst,
  testSparseArrayFilterSecond,
  testSparseArrayCount,
  testSparseArrayVsNullArray,
  testNullArrayCount,
  testSpreadObjectMerge,
  testSpreadObjectMergeSecond,
  testSpreadObjectMergeThird,
  testSpreadArrayDeduplication,
  testSpreadArrayDeduplicationValues,
  testSpreadMultiDimensionalFlatten,
  testSpreadMultiDimensionalFlattenValues,
  testArgumentsObject,
  testCustomArrayLike,
  testArrayLikeLengthMismatch,
} from './reduce_js_test';

import {
  testArrayLikeNegativeLength,
  testStringObject,
  testArrayLikeDynamicLength,
  testStrictModeThis,
  testProxyArray,
  testProxyModifiedLength,
  testCallbackDeleteElement,
  testCallbackDeleteElementValues,
  testCallbackAddElement,
  testCallbackModifyElement,
  testEmptyArrayNoInitial,
  testEmptyArrayErrorMessage,
  testLargeArray,
  testPromiseReturn,
  testDepthFirstTraversal,
} from './reduce_js_test';

import {
  testDepthFirstTraversalFirst,
  testFactorial,
  testFibonacci,
  testFibonacciFirst,
  testReduceOnNull,
  testReduceOnUndefined,
  testReduceOnNumber,
  testReduceOnBoolean,
  testObjectKeys,
  testObjectValues,
  testObjectEntries,
  testSetDeduplication,
  testMapConversion,
  testFunctionComposition,
  testCurrying,
} from './reduce_js_test';

import {
  testReduceImplementMap,
  testReduceImplementMapValues,
  testMapChain,
  testReduceImplementFilter,
  testFilterChain,
  testReduceFilterAndMap,
  testReduceFilterAndMapValues,
  testReduceImplementForEach,
  testReduceImplementFind,
  testReduceImplementSome,
  testReduceImplementEvery,
  testReduceImplementFlat,
  testReduceImplementFlatMap,
  testReduceImplementSort,
  testSortChain,
  testReduceImplementSlice,
  testReduceImplementConcat,
} from './reduce_js_test';

import {
  testReduceImplementMultiLevelConcat,
  testReduceLeftToRight,
  testReduceLeftToRightFirst,
  testReduceRightRightToLeft,
  testReduceRightRightToLeftFirst,
  testReduceVsReduceRightLeft,
  testReduceVsReduceRightRight,
  testMutableAccumulatorObject,
  testImmutableAccumulatorObject,
  testMutableAccumulatorArray,
  testImmutableAccumulatorArray,
  testPerformanceOptimization,
  testPerformanceOptimizationEven,
  testPerformanceOptimizationProduct,
  testEarlyTermination,
  testReduceNullCallback,
  testReduceUndefinedCallback,
  testReduceNumberCallback,
  testReduceStringCallback
} from './reduce_js_test';

import Utils from '../Util.test';

interface TestResult {
  result: boolean | number;
  expected: boolean | number;
}

export default function BuiltinsArrayReduceJsTest() {
  describe('BuiltinsArrayReduceJsTest', () => {
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
     * @tc.name   BuiltinsArrayReduceJsTest0100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_0100
     * @tc.desc   Test reduce with Symbol initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolInitialValue();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest0200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_0200
     * @tc.desc   Test reduce on sparse array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest0300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_0300
     * @tc.desc   Test reduce with sparse array vs undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayVsUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest0400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_0400
     * @tc.desc   Test reduce with undefined array result is NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testUndefinedArrayResult();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest0500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_0500
     * @tc.desc   Test reduce on sparse array indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayIndices();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest0600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_0600
     * @tc.desc   Test reduce on sparse array first index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayFirstIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest0700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_0700
     * @tc.desc   Test reduce on sparse array last index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayLastIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest0800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_0800
     * @tc.desc   Test reduce on sparse array with empty slots at beginning
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayBeginning();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest0900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_0900
     * @tc.desc   Test reduce on sparse array with empty slots at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayEnd();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1000
     * @tc.desc   Test reduce on sparse array with empty slots in middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayMiddle();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1100
     * @tc.desc   Test reduce on all empty slots without initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testAllEmptySlotsNoInitial();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1200
     * @tc.desc   Test reduce on all empty slots with initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testAllEmptySlotsWithInitial();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1300
     * @tc.desc   Test reduce on sparse array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1400
     * @tc.desc   Test reduce on sparse array visited count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayVisitedCount();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1500
     * @tc.desc   Test reduce on dynamically created sparse array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testDynamicSparseArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1600
     * @tc.desc   Test reduce on sparse object array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseObjectArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1700
     * @tc.desc   Test reduce on sparse array filter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayFilter();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1800
     * @tc.desc   Test reduce on sparse array filter first element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayFilterFirst();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest1900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_1900
     * @tc.desc   Test reduce on sparse array filter second element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayFilterSecond();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2000
     * @tc.desc   Test reduce on sparse array count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayCount();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2100
     * @tc.desc   Test reduce on sparse array vs null array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayVsNullArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2200
     * @tc.desc   Test reduce on null array count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNullArrayCount();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2300
     * @tc.desc   Test reduce with spread operator object merge
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSpreadObjectMerge();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2400
     * @tc.desc   Test reduce with spread operator object merge second property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSpreadObjectMergeSecond();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2500
     * @tc.desc   Test reduce with spread operator object merge third property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSpreadObjectMergeThird();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2600
     * @tc.desc   Test reduce with spread operator array deduplication
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSpreadArrayDeduplication();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2700
     * @tc.desc   Test reduce with spread operator array deduplication values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSpreadArrayDeduplicationValues();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2800
     * @tc.desc   Test reduce with spread operator multi-dimensional array flatten
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSpreadMultiDimensionalFlatten();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest2900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_2900
     * @tc.desc   Test reduce with spread operator multi-dimensional array flatten values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSpreadMultiDimensionalFlattenValues();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3000
     * @tc.desc   Test reduce on arguments object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArgumentsObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3100
     * @tc.desc   Test reduce on custom array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCustomArrayLike();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3200
     * @tc.desc   Test reduce on array-like object with length mismatch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeLengthMismatch();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3300
     * @tc.desc   Test reduce on array-like object with zero length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeZeroLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3400
     * @tc.desc   Test reduce on array-like object with negative length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeNegativeLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3500
     * @tc.desc   Test reduce on string object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testStringObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3600
     * @tc.desc   Test reduce on array-like object with dynamic length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeDynamicLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3700
     * @tc.desc   Test reduce in strict mode this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testStrictModeThis();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3800
     * @tc.desc   Test reduce on Proxy wrapped array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest3900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_3900
     * @tc.desc   Test reduce on Proxy with modified length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyModifiedLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4000
     * @tc.desc   Test reduce with callback deleting element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallbackDeleteElement();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4100
     * @tc.desc   Test reduce with callback deleting element values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallbackDeleteElementValues();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4200
     * @tc.desc   Test reduce with callback adding element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallbackAddElement();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4300
     * @tc.desc   Test reduce with callback modifying element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallbackModifyElement();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4400
     * @tc.desc   Test reduce on empty array without initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testEmptyArrayNoInitial();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4500
     * @tc.desc   Test reduce on large array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testLargeArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4600
     * @tc.desc   Test reduce with Promise return
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = await testPromiseReturn();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4700
     * @tc.desc   Test reduce factorial
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFactorial();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4800
     * @tc.desc   Test reduce fibonacci
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFibonacci();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest4900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_4900
     * @tc.desc   Test reduce fibonacci first value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFibonacciFirst();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5000
     * @tc.desc   Test reduce on null object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceOnNull();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5100
     * @tc.desc   Test reduce on undefined object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceOnUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5200
     * @tc.desc   Test reduce with Object.keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectKeys();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5300
     * @tc.desc   Test reduce with Object.values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectValues();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5400
     * @tc.desc   Test reduce with Object.entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectEntries();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5500
     * @tc.desc   Test reduce with Set deduplication
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSetDeduplication();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5600
     * @tc.desc   Test reduce with Map conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMapConversion();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5700
     * @tc.desc   Test reduce with function composition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFunctionComposition();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5800
     * @tc.desc   Test reduce with currying
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCurrying();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest5900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_5900
     * @tc.desc   Test reduce implementing map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementMap();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6000
     * @tc.desc   Test reduce implementing map values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementMapValues();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6100
     * @tc.desc   Test reduce with map chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMapChain();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6200
     * @tc.desc   Test reduce implementing filter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementFilter();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6300
     * @tc.desc   Test reduce with filter chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFilterChain();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6400
     * @tc.desc   Test reduce implementing filter and map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceFilterAndMap();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6500
     * @tc.desc   Test reduce implementing filter and map values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceFilterAndMapValues();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6600
     * @tc.desc   Test reduce implementing forEach
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementForEach();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6700
     * @tc.desc   Test reduce implementing find
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementFind();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6800
     * @tc.desc   Test reduce implementing some
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementSome();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest6900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_6900
     * @tc.desc   Test reduce implementing every
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementEvery();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7000
     * @tc.desc   Test reduce implementing flat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementFlat();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7100
     * @tc.desc   Test reduce implementing flatMap
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementFlatMap();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7200
     * @tc.desc   Test reduce implementing sort
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementSort();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7300
     * @tc.desc   Test reduce with sort chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSortChain();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7400
     * @tc.desc   Test reduce implementing slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementSlice();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7500
     * @tc.desc   Test reduce implementing concat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementConcat();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7600
     * @tc.desc   Test reduce implementing multi-level concat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImplementMultiLevelConcat();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7700
     * @tc.desc   Test reduce left to right order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceLeftToRight();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7800
     * @tc.desc   Test reduce left to right first value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceLeftToRightFirst();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest7900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_7900
     * @tc.desc   Test reduceRight right to left order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceRightRightToLeft();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8000
     * @tc.desc   Test reduceRight right to left first value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceRightRightToLeftFirst();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8100
     * @tc.desc   Test reduce vs reduceRight left concat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceVsReduceRightLeft();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8200
     * @tc.desc   Test reduce vs reduceRight right concat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceVsReduceRightRight();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8300
     * @tc.desc   Test reduce mutable accumulator object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMutableAccumulatorObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8400
     * @tc.desc   Test reduce immutable accumulator object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testImmutableAccumulatorObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8500
     * @tc.desc   Test reduce mutable accumulator array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMutableAccumulatorArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8600
     * @tc.desc   Test reduce immutable accumulator array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testImmutableAccumulatorArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8700
     * @tc.desc   Test reduce performance optimization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testPerformanceOptimization();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8800
     * @tc.desc   Test reduce performance optimization even count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testPerformanceOptimizationEven();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest8900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_8900
     * @tc.desc   Test reduce performance optimization product
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest8900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testPerformanceOptimizationProduct();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest9000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_9000
     * @tc.desc   Test reduce early termination simulation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest9000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testEarlyTermination();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest9100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_9100
     * @tc.desc   Test reduce with null callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest9100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceNullCallback();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest9200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_9200
     * @tc.desc   Test reduce with undefined callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest9200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceUndefinedCallback();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest9300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_9300
     * @tc.desc   Test reduce with number callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest9300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceNumberCallback();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsTest9400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_TEST_9400
     * @tc.desc   Test reduce with string callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsTest9400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceStringCallback();
      expect(result.result).assertEqual(result.expected);
    });

  });
}
