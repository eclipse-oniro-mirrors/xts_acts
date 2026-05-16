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
import { testSymbolElements, testSymbolDepth } from './flat_symbol_test';
import { testSetObjects, testMapObjects } from './flat_set_map_test';
import { testTypedArray, testArgumentsObject } from './flat_typedarray_test';
import { testArrayLikeObjects, testArraySelfReference, testCircularReferences, testExtremelyDeepNestedArray, testEmptySlotsInOneDimensionalArray, testEmptySlotsInNestedArrays, testDepthOneRemovesOuterEmptySlots, testInfinityDepthRemovesAllEmptySlots, testArrayWithOnlyEmptySlots, testEmptySlotsVsUndefined, testStringNumberAsDepth, testObjectAsDepth, testBooleanAsDepth } from './flat_commented_test';

interface TestResult {
  result?: boolean | string | number;
  expected?: boolean | string | number | undefined;
  type?: string;
  expectedType?: string;
  isSet?: boolean;
  expectedIsSet?: boolean;
  isMap?: boolean;
  expectedIsMap?: boolean;
  isView?: boolean;
  expectedIsView?: boolean;
  isArray?: boolean;
  expectedIsArray?: boolean;
  errorCaught?: boolean;
  expectedErrorCaught?: boolean;
  errorType?: boolean;
  expectedErrorType?: boolean;
  isEqual?: boolean;
  expectedIsEqual?: boolean;
  errorName?: string;
  expectedErrorName?: string;
}

export default function BuiltinsArrayFlatJsTest() {
  describe('BuiltinsArrayFlatJsTest', () => {
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
     * @tc.name   BuiltinsArrayFlatJsTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_0100
     * @tc.desc   Verify flat() handles Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testSymbolElements();
      expect(result.result).assertEqual(result.expected);
      expect(result.type).assertEqual(result.expectedType);
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest0200
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_0200
     * @tc.desc   Verify flat() handles Symbol as depth parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testSymbolDepth();
      expect(result.errorCaught).assertEqual(result.expectedErrorCaught);
      expect(result.errorName).assertEqual(result.expectedErrorName);
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest0300
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_0300
     * @tc.desc   Verify flat() handles Set objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testSetObjects();
      expect(result.result).assertEqual(result.expected);
      expect(result.isSet).assertEqual(result.expectedIsSet);
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest0400
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_0400
     * @tc.desc   Verify flat() handles Map objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testMapObjects();
      expect(result.result).assertEqual(result.expected);
      expect(result.isMap).assertEqual(result.expectedIsMap);
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest0500
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_0500
     * @tc.desc   Verify flat() handles TypedArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testTypedArray();
      expect(result.result).assertEqual(result.expected);
      expect(result.isView).assertEqual(result.expectedIsView);
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest0600
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_0600
     * @tc.desc   Verify flat() handles arguments object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testArgumentsObject();
      expect(result.result).assertEqual(result.expected);
      expect(result.isArray).assertEqual(result.expectedIsArray);
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest0700
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_0700
     * @tc.desc   Verify flat() handles array-like objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testArrayLikeObjects();
      expect(result.result).assertEqual(result.expected);
      expect(result.isArray).assertEqual(result.expectedIsArray);
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest0800
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_0800
     * @tc.desc   Verify flat() handles array self-reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testArraySelfReference();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest0900
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_0900
     * @tc.desc   Verify flat() handles circular references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testCircularReferences();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest1000
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_1000
     * @tc.desc   Verify flat() handles extremely deep nested array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testExtremelyDeepNestedArray();
      expect(result.result).assertEqual(result.expected);
      expect(result.isEqual).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest1100
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_1100
     * @tc.desc   Verify flat() removes empty slots in one-dimensional array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testEmptySlotsInOneDimensionalArray();
      expect(result.result).assertEqual(result.expected);
      expect(result.isEqual).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest1200
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_1200
     * @tc.desc   Verify flat() removes empty slots in nested arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testEmptySlotsInNestedArrays();
      expect(result.result).assertEqual(result.expected);
      expect(result.isEqual).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest1300
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_1300
     * @tc.desc   Verify Infinity depth removes all empty slots
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testInfinityDepthRemovesAllEmptySlots();
      expect(result.result).assertEqual(result.expected);
      expect(result.isEqual).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest1400
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_1400
     * @tc.desc   Verify flat() on array with only empty slots
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testArrayWithOnlyEmptySlots();
      expect(result.result).assertEqual(result.expected);
      expect(result.isEqual).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest1500
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_1500
     * @tc.desc   Verify flat() removes empty slots but keeps explicit undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result = testEmptySlotsVsUndefined();
      expect(result.result1Length).assertEqual(result.expectedResult1Length);
      expect(result.result2Length).assertEqual(result.expectedResult2Length);
      expect(result.result1Equal).assertTrue();
      expect(result.result2Equal).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest1600
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_1600
     * @tc.desc   Verify flat handles string number as depth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testStringNumberAsDepth();
      expect(result.result).assertEqual(result.expected);
      expect(result.isEqual).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest1700
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_1700
     * @tc.desc   Verify flat handles object as depth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: TestResult = testObjectAsDepth();
      expect(result.result).assertEqual(result.expected);
      expect(result.isEqual).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayFlatJsTest1800
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_JS_TEST_1800
     * @tc.desc   Verify flat handles boolean as depth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFlatJsTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result = testBooleanAsDepth();
      expect(result.result1Equal).assertTrue();
      expect(result.result2Equal).assertTrue();
    });
  });
}
