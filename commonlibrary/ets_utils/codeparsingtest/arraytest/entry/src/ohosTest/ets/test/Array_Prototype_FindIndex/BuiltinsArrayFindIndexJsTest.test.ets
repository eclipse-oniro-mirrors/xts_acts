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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium/index';
import Utils from '../Util.test';
import { testThisArgAccess, testThisArgObject, testThisInRegularFunction, testThisInArrowFunction } from './findIndex_thisArg_test';
import { testArrayLikeObject, testArrayLikeLength } from './findIndex_arrayLike_test';
import { testMethodChaining } from './findIndex_chaining_test';
import { testBoundFunction, testBindPartialParameters } from './findIndex_bind_test';
import { testGeneratorFunction } from './findIndex_generator_test';
import { testAsyncFunction } from './findIndex_async_test';
import { testArgumentsObject } from './findIndex_arguments_test';
import { testPromiseReturn } from './findIndex_promise_test';
import {
  testThisUndefinedWhenThisArgNotProvided,
  testThisNullWhenThisArgIsNull,
  testThisUndefinedWhenThisArgIsUndefined,
  testNonFunctionCallbackThrowsTypeError,
  testNullCallbackThrowsTypeError,
  testNumberCallbackThrowsTypeError,
  testStringCallbackThrowsTypeError,
  testObjectCallbackThrowsTypeError,
  testDeletedUnvisitedElementsTreatedAsUndefined
} from './findIndex_commented_test';

interface TestResult {
  result: number | boolean | string;
  expected: number | boolean | string;
  iterations?: Array<number> | number;
  expectedIterations?: Array<number> | number;
  modifiedArray?: Array<number>;
  finalArray?: Array<number>;
  errorCaught?: boolean;
  expectedErrorCaught?: boolean;
  errorName?: string;
  expectedErrorName?: string;
  errorMessage?: string;
  expectedErrorMessage?: string;
}

export default function BuiltinsArrayFindIndexJsTest() {
  describe('BuiltinsArrayFindIndexJsTest', () => {
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
     * @tc.name   BuiltinsArrayFindIndexJsTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_0100
     * @tc.desc   Verify callback function can access thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testThisArgAccess();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest0200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_0200
     * @tc.desc   Verify thisArg as object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testThisArgObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest0300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_0300
     * @tc.desc   Verify findIndex on array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testArrayLikeObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest0400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_0400
     * @tc.desc   Verify array-like object length determines traversal range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testArrayLikeLength();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest0500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_0500
     * @tc.desc   Verify method chaining with findIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testMethodChaining();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest0600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_0600
     * @tc.desc   Verify this in regular function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testThisInRegularFunction();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest0700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_0700
     * @tc.desc   Verify this in arrow function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testThisInArrowFunction();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest0800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_0800
     * @tc.desc   Verify bound function as callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testBoundFunction();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest0900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_0900
     * @tc.desc   Verify generator function as callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testGeneratorFunction();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1000
     * @tc.desc   Verify async function as callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testAsyncFunction();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1100
     * @tc.desc   Verify findIndex on arguments object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testArgumentsObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1200
     * @tc.desc   Verify callback returning Promise
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testPromiseReturn();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1300
     * @tc.desc   Verify that this is undefined when thisArg is not provided in strict mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testThisUndefinedWhenThisArgNotProvided();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1400
     * @tc.desc   Verify that this is null when thisArg is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testThisNullWhenThisArgIsNull();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1500
     * @tc.desc   Verify that this is undefined when thisArg is undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testThisUndefinedWhenThisArgIsUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1600
     * @tc.desc   Verify that non-function callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testNonFunctionCallbackThrowsTypeError();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1700
     * @tc.desc   Verify that null callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testNullCallbackThrowsTypeError();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1800
     * @tc.desc   Verify that number callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testNumberCallbackThrowsTypeError();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest1900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_1900
     * @tc.desc   Verify that string callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testStringCallbackThrowsTypeError();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest2000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_2000
     * @tc.desc   Verify that object callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testObjectCallbackThrowsTypeError();
      expect(result.result).assertEqual(result.expected);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFindIndexJsTest2100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_INDEX_JS_TEST_2100
     * @tc.desc   Verify that deleted unvisited elements are treated as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindIndexJsTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testDeletedUnvisitedElementsTreatedAsUndefined();
      expect(result.result).assertEqual(result.expected);
    });

  });
}