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

import {
  testSymbolElements,
  testSymbolSameDescription,
  testArgumentsObject,
  testCustomArrayLike,
  testThisNull,
  testThisUndefined,
  testThisNumber,
  testThisString,
  testThisBoolean,
  testNoParameters,
  testNoParametersMultipleUndefined,
  testNoParametersEmptyArray,
  testNaNArray,
  testObjectReference,
} from './last_index_of_js_test';

import {
  testDifferentObjectReference,
  testMixedReferenceTypes,
  testFrozenArray,
  testSealedArray,
  testSparseArray,
  testSparseArrayExistingElement,
  testStringFromIndex,
  testNaNFromIndex,
  testObjectFromIndex,
  testArrayFromIndex,
  testGetterModifiesArray,
  testNoSetterTrigger,
  testProxyArray,
  testFindResult,
  testFindFromEnd,
  testFindLastUser,
  testFindLastProduct,
  testMixedDataTypes,
  testCircularReference,
} from './last_index_of_js_test';

import Utils from '../Util.test';

interface TestResult {
  result: boolean | number;
  expected: boolean | number;
}

export default function BuiltinsArrayLastIndexOfJsTest() {
  describe('BuiltinsArrayLastIndexOfJsTest', () => {
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
     * @tc.name   BuiltinsArrayLastIndexOfJsTest0100
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_0100
     * @tc.desc   Test lastIndexOf with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolElements();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest0200
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_0200
     * @tc.desc   Test lastIndexOf with Symbol elements with same description
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSymbolSameDescription();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest0300
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_0300
     * @tc.desc   Test lastIndexOf on arguments object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArgumentsObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest0400
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_0400
     * @tc.desc   Test lastIndexOf on custom array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCustomArrayLike();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest0500
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_0500
     * @tc.desc   Test lastIndexOf with null this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisNull();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest0600
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_0600
     * @tc.desc   Test lastIndexOf with undefined this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest0700
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_0700
     * @tc.desc   Test lastIndexOf with number this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisNumber();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest0800
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_0800
     * @tc.desc   Test lastIndexOf with string this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisString();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest0900
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_0900
     * @tc.desc   Test lastIndexOf with boolean this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testThisBoolean();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1000
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1000
     * @tc.desc   Test lastIndexOf with no parameters (search for undefined)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNoParameters();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1100
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1100
     * @tc.desc   Test lastIndexOf with no parameters in array with multiple undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNoParametersMultipleUndefined();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1200
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1200
     * @tc.desc   Test lastIndexOf with no parameters in empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNoParametersEmptyArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1300
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1300
     * @tc.desc   Test lastIndexOf with NaN elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNaNArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1400
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1400
     * @tc.desc   Test lastIndexOf with object reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectReference();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1500
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1500
     * @tc.desc   Test lastIndexOf with different object reference but same content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testDifferentObjectReference();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1600
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1600
     * @tc.desc   Test lastIndexOf with mixed reference types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMixedReferenceTypes();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1700
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1700
     * @tc.desc   Test lastIndexOf on frozen array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFrozenArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1800
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1800
     * @tc.desc   Test lastIndexOf on sealed array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSealedArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest1900
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_1900
     * @tc.desc   Test lastIndexOf on sparse array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2000
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2000
     * @tc.desc   Test lastIndexOf on sparse array for existing element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testSparseArrayExistingElement();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2100
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2100
     * @tc.desc   Test lastIndexOf with string fromIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testStringFromIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2200
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2200
     * @tc.desc   Test lastIndexOf with object fromIndex (valueOf)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testObjectFromIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2300
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2300
     * @tc.desc   Test lastIndexOf with array fromIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testArrayFromIndex();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2400
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2400
     * @tc.desc   Test lastIndexOf with getter that modifies array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testGetterModifiesArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2500
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2500
     * @tc.desc   Test lastIndexOf does not trigger setter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testNoSetterTrigger();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2600
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2600
     * @tc.desc   Test lastIndexOf on proxy array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testProxyArray();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2700
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2700
     * @tc.desc   Test find element from end and verify with lastIndexOf
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testFindFromEnd();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2800
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2800
     * @tc.desc   Test find element in mixed data types array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testMixedDataTypes();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayLastIndexOfJsTest2900
     * @tc.number SUB_BUILTINS_ARRAY_LAST_INDEX_OF_JS_TEST_2900
     * @tc.desc   Test find circular reference in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayLastIndexOfJsTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: TestResult = testCircularReference();
      expect(result.result).assertEqual(result.expected);
    });
  });
}