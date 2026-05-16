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
import {
  testSymbolElements,
  testCallbackReturnSymbol,
  testCallMethod,
  testApplyMethod,
  testStringCall,
  testArgumentsCall,
  testArrayLikeReturn,
  testSpreadOperator
} from './flatMap_js_test';

import {
  testCallbackHandlesDifferentTypes,
  testThisArgBinding,
  testArrowFunctionIgnoresThisArg,
  testMixedNestingLevels,
  testExpandObjectProperties,
  testEmptyArrayWithThisArg,
  testCallbackNotFunction,
  testCallbackIsNull,
  testCallbackIsUndefined,
  testThisIsNull,
  testThisIsUndefined,
  testFlatMapVsConcat,
  testThisArgAsPrimitiveValue,
  testMixedNestingLevelsFlatMap,
  testSparseArrayWithEmptySlots
} from './flatMap_commented_test';

interface TestResult {
  result: number | boolean | string;
  expected: number | boolean | string;
  errorCaught?: boolean;
  expectedErrorCaught?: boolean;
  errorName?: string;
  expectedErrorName?: string;
  errorMessage?: string;
  expectedErrorMessage?: string;
}

export default function BuiltinsArrayFlatMapJSTest() {
  describe('BuiltinsArrayFlatMapJSTest', () => {
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
     * @tc.name   BuiltinsArrayFlatMapJSTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_0100
     * @tc.desc   Test flatMap with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolElements();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest0200
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_0200
     * @tc.desc   Test flatMap with callback returning Symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallbackReturnSymbol();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest0300
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_0300
     * @tc.desc   Test flatMap called with call method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallMethod();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest0400
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_0400
     * @tc.desc   Test flatMap called with apply method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testApplyMethod();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest0500
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_0500
     * @tc.desc   Test flatMap called on string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testStringCall();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest0600
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_0600
     * @tc.desc   Test flatMap called on arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArgumentsCall();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest0700
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_0700
     * @tc.desc   Test flatMap with array-like objects as return values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayLikeReturn();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest0800
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_0800
     * @tc.desc   Test flatMap with spread operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSpreadOperator();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest0900
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_0900
     * @tc.desc   Test callback function handles different types of elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallbackHandlesDifferentTypes();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1000
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1000
     * @tc.desc   Test thisArg correctly binds this in callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisArgBinding();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1100
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1100
     * @tc.desc   Test arrow function ignores thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrowFunctionIgnoresThisArg();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1200
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1200
     * @tc.desc   Test flatMap handles mixed nesting levels
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMixedNestingLevels();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1300
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1300
     * @tc.desc   Test flatMap expands object properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testExpandObjectProperties();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1400
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1400
     * @tc.desc   Test flatMap handles empty array with thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testEmptyArrayWithThisArg();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1500
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1500
     * @tc.desc   Test flatMap throws TypeError when callback is not a function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallbackNotFunction();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1600
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1600
     * @tc.desc   Test flatMap throws TypeError when callback is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallbackIsNull();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1700
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1700
     * @tc.desc   Test flatMap throws TypeError when callback is undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCallbackIsUndefined();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1800
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1800
     * @tc.desc   Test flatMap throws TypeError when this is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisIsNull();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest1900
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_1900
     * @tc.desc   Test flatMap throws TypeError when this is undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisIsUndefined();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest2000
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_2000
     * @tc.desc   Test flatMap and concat results comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFlatMapVsConcat();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest2100
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_2100
     * @tc.desc   Test thisArg as primitive value is converted to object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisArgAsPrimitiveValue();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest2200
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_2200
     * @tc.desc   Test flatMap handles mixed nesting levels
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMixedNestingLevelsFlatMap();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatMapJSTest2300
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_MAP_J_S_TEST_2300
     * @tc.desc   Test flatMap handles sparse array with real empty slots
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatMapJSTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayWithEmptySlots();
      expect(result.result).assertEqual(result.expected);
    });
  });
}
