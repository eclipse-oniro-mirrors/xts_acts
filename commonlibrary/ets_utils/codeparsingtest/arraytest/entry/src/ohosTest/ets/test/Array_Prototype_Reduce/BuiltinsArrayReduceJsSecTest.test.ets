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
  testReduceNullCallback,
  testReduceUndefinedCallback,
  testReduceNumberCallback,
  testReduceStringCallback,
  testReduceObjectCallback,
  testReduceArrayCallback,
  testReduceNoParameters,
  testReduceObjectInitialValue,
  testReduceUndefinedInitialValue,
  testReduceMaxValue,
  testReduceIndexSignatureObject,
  testReduceMergeObjectArray,
  testReduceDeepFlatten,
  testReduceMixedNumberString,
} from './reduce_js_test';

import {
  testReduceMixedTypes,
  testReduceNonExistentMethod,
  testReduceCallbackReturnsUndefined,
  testReduceThisUndefined,
  testReduceCallbackDeletesElement,
  testReduceCharFrequencyClass,
  testReduceCharFrequency,
  testReduceGroupByProperty,
  testReduceFlattenDeeplyNested,
  testReduceMutableSumObj,
  testReduceImmutableSumResult,
  testReduceDepthFirstSearch,
  testReduceFactorial,
  testReduceFibonacci,
  testReduceMap,
  testReduceArrayLike,
  testReduceNestedObjectSum
} from './reduce_js_test';

import Utils from '../Util.test';

interface TestResult {
  result: boolean | number;
  expected: boolean | number;
}

export default function BuiltinsArrayReduceJsSecTest() {
  describe('BuiltinsArrayReduceJsSecTest', () => {
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
     * @tc.name   BuiltinsArrayReduceJsSecTest0100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_0100
     * @tc.desc   Test reduce with null callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceNullCallback();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest0200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_0200
     * @tc.desc   Test reduce with undefined callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceUndefinedCallback();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest0300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_0300
     * @tc.desc   Test reduce with number callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceNumberCallback();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest0400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_0400
     * @tc.desc   Test reduce with string callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceStringCallback();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest0500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_0500
     * @tc.desc   Test reduce with object callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceObjectCallback();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest0600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_0600
     * @tc.desc   Test reduce with array callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceArrayCallback();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest0700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_0700
     * @tc.desc   Test reduce with no parameters throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceNoParameters();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest0800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_0800
     * @tc.desc   Test reduce with object initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceObjectInitialValue();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest0900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_0900
     * @tc.desc   Test reduce with undefined initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceUndefinedInitialValue();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1000
     * @tc.desc   Test reduce with index signature object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceIndexSignatureObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1100
     * @tc.desc   Test reduce to merge object array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceMergeObjectArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1200
     * @tc.desc   Test reduce for deep flatten
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceDeepFlatten();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1300
     * @tc.desc   Test reduce with mixed number and string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceMixedNumberString();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1400
     * @tc.desc   Test reduce with mixed types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceMixedTypes();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1500
     * @tc.desc   Test reduce with non-existent method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceNonExistentMethod();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1600
     * @tc.desc   Test reduce with callback that returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceCallbackReturnsUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1700
     * @tc.desc   Test reduce with this undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceThisUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1800
     * @tc.desc   Test reduce with callback that deletes element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceCallbackDeletesElement();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest1900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_1900
     * @tc.desc   Test reduce for char frequency using class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceCharFrequencyClass();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2000
     * @tc.desc   Test reduce for char frequency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceCharFrequency();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2100
     * @tc.desc   Test reduce for group by property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceGroupByProperty();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2200
     * @tc.desc   Test reduce for flattening deeply nested array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceFlattenDeeplyNested();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2300
     * @tc.desc   Test reduce with mutable sum object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceMutableSumObj();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2400
     * @tc.desc   Test reduce with immutable sum result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceImmutableSumResult();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2500
     * @tc.desc   Test reduce for factorial
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceFactorial();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2600
     * @tc.desc   Test reduce for fibonacci
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceFibonacci();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2700
     * @tc.desc   Test reduce with Map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceMap();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2800
     * @tc.desc   Test reduce with array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceArrayLike();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayReduceJsSecTest2900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_JS_SEC_TEST_2900
     * @tc.desc   Test reduce for nested object sum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReduceJsSecTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testReduceNestedObjectSum();
      expect(result.result).assertEqual(result.expected);
    });

  });
}