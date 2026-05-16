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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';
import * as ArrayFindLastIndexUtils from './ArrayFindLastIndexUtils';
import hilog from '@ohos.hilog';

export default function BuiltinsArrayFindLastIndexExtendedTest(): void {
  describe("BuiltinsArrayFindLastIndexExtendedTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(async () => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_0100
     * @tc.desc   Verify findLastIndex finds first element in large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexLargeArrayBoundaryTest14200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_0200
     * @tc.desc   Verify findLastIndex finds last element in large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexLargeArrayLastElementTest14300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_0300
     * @tc.desc   Verify findLastIndex handles multiple delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMultipleDeleteTest14400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_0400
     * @tc.desc   Verify findLastIndex performance with worst case scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayFindLastIndexExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSparseArrayOnlyLastTest14500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_0500
     * @tc.desc   Verify findLastIndex finds element in sparse array with middle values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSparseArrayMiddleTest14600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_0600
     * @tc.desc   Verify findLastIndex skips empty slots and finds actual value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSkipEmptySlotsFindValueTest14700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_0700
     * @tc.desc   Verify findLastIndex finds last error log entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexLogSearchTest14800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_0800
     * @tc.desc   Verify findLastIndex finds last user purchase action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexUserActionTest14900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_0900
     * @tc.desc   Verify findLastIndex finds last sale item in cart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCartSaleTest15000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1000
     * @tc.desc   Verify findLastIndex with array length at limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexUnreadMessageTest15100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1100
     * @tc.desc   Verify findLastIndex finds last game checkpoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexGameCheckpointTest15200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1200
     * @tc.desc   Verify findLastIndex finds last high priority task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexHighPriorityTaskTest15300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1300
     * @tc.desc   Verify findLastIndex finds object by deep nested property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDeepNestedObjectTest15400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1400
     * @tc.desc   Verify findLastIndex passes correct array reference to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArrayIncludeTest15500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1500
     * @tc.desc   Verify findLastIndex works with multi-dimensional arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMultiDimensionalArrayTest15600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1600
     * @tc.desc   Verify findLastIndex finds array by content comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArrayContentComparisonTest15700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1700
     * @tc.desc   Verify findLastIndex works with string startsWith and thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexStringStartsWithTest15800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1800
     * @tc.desc   Verify findLastIndex works with dynamic length object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDynamicLengthObjectTest15900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_1900
     * @tc.desc   Verify findLastIndex stops execution on first successful return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexEmptyArrayLikeTest16000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2000
     * @tc.desc   Verify findLastIndex handles object with only numeric keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexOnlyNumericKeysTest16100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2100
     * @tc.desc   Verify findLastIndex handles mixed properties object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMixedPropertiesTest9400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2200
     * @tc.desc   Verify findLastIndex handles recursive callback calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexRecursiveCallTest16300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2300
     * @tc.desc   Verify findLastIndex callback can return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCallbackReturnUndefinedTest16400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2400
     * @tc.desc   Verify findLast and findLastIndex return undefined and -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFindLastWithUndefinedTest16500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2500
     * @tc.desc   Verify findLastIndex index and element combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexIndexElementCombinationTest16600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2600
     * @tc.desc   Verify findLastIndex callback receives all correct parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCallbackUseAllParamsTest16700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2700
     * @tc.desc   Verify findLastIndex handles different types of elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDifferentTypesElementsTest16800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2800
     * @tc.desc   Verify findLastIndex handles negative length object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNegativeLengthObjectTest16900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_2900
     * @tc.desc   Verify findLastIndex with array containing all primitive types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFloatLengthObjectTest17000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3000
     * @tc.desc   Verify findLastIndex handles zero length object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexZeroLengthObjectTest17100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3100
     * @tc.desc   Verify findLastIndex throws TypeError when modifying readonly property in strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexStrictModeReadonlyTest17200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3200
     * @tc.desc   Verify findLastIndex works with arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArgumentsLikeTest17300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3300
     * @tc.desc   Verify some vs findLastIndex behavior difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSomeVsFindLastIndexTest10000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3400
     * @tc.desc   Verify findLastIndex works with string characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexStringSearchTest10100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3500
     * @tc.desc   Verify findLastIndex thisArg is correctly passed to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFindLastWithIndexTest10200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3600
     * @tc.desc   Verify findLast returns undefined and findLastIndex returns -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNotFindDifferenceTest10300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3700
     * @tc.desc   Verify comparison between indexOf and findLastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexOfComparisonTest10400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3800
     * @tc.desc   Verify findLastIndex with complex condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexComplexConditionTest10500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest3900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_3900
     * @tc.desc   Verify findLastIndex thisArg is used with regular functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNaNComparisonTest10600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4000
     * @tc.desc   Verify comparison with lastIndexOf for objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexLastIndexOfComparisonTest10700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4100
     * @tc.desc   Verify some short-circuit behavior vs findLastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSomeShortCircuitTest10800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4200
     * @tc.desc   Verify findLastIndex thisArg with bound function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexGetLastByFilterTest10900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4300
     * @tc.desc   Verify forEach manual search vs findLastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexForEachManualTest11000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4400
     * @tc.desc   Verify for loop reverse vs findLastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexForLoopTest11100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4500
     * @tc.desc   Verify forEach cannot exit early vs findLastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexForEachNoExitTest11200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4600
     * @tc.desc   Verify findLastIndex finds last high price in history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexPriceHistoryTest11300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4700
     * @tc.desc   Verify findLastIndex thisArg with constructor function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFormValidationTest11400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4800
     * @tc.desc   Verify findLastIndex finds last required field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexRequiredFieldTest11500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest4900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_4900
     * @tc.desc   Verify findLastIndex finds last cart product by ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCartProductTest11600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5000
     * @tc.desc   Verify findLastIndex finds last message by user
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMessageUserTest11700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5100
     * @tc.desc   Verify findLastIndex finds last file by type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFileTypeTest11800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5200
     * @tc.desc   Verify findLastIndex thisArg with sealed object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFileSizeTest11900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5300
     * @tc.desc   Verify findLastIndex finds last combat log kill action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCombatLogTest12000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5400
     * @tc.desc   Verify findLastIndex finds last sensor data anomaly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSensorDataTest12100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5500
     * @tc.desc   Verify findLastIndex finds last temperature peak
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexTemperatureTest12200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5600
     * @tc.desc   Verify findLastIndex finds last incomplete task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexTaskIncompleteTest12300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5700
     * @tc.desc   Verify findLastIndex thisArg with WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexWaypointsTest12400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5800
     * @tc.desc   Verify findLastIndex finds last rest stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexRestStopTest12500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest5900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_5900
     * @tc.desc   Verify findLastIndex finds last admin permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexPermissionTest12600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6000
     * @tc.desc   Verify findLastIndex finds last write permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexWritePermissionTest12700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6100
     * @tc.desc   Verify findLastIndex handles array modification during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexModifyDuringIterationTest12800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6200
     * @tc.desc   Verify findLastIndex with object as thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexThisArgObjectTest12900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6300
     * @tc.desc   Verify findLastIndex strict mode this value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexStrictModeThisTest13000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6400
     * @tc.desc   Verify findLastIndex with boolean as this value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexBooleanThisArgTest13100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6500
     * @tc.desc   Verify findLastIndex with number as this value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNumberThisArgTest13200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6600
     * @tc.desc   Verify findLastIndex thisArg with DataView
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexRegExpElementTest13300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6700
     * @tc.desc   Verify findLastIndex handles circular reference object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCircularReferenceTest13400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6800
     * @tc.desc   Verify findLastIndex returns same index for unique element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexUniqueElementTest13500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest6900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_6900
     * @tc.desc   Verify findLastIndex and findIndex both return -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNotFindBothTest13600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest7000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_7000
     * @tc.desc   Verify same condition different results for findIndex and findLastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSameConditionTest13700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest7100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_7100
     * @tc.desc   Verify findLastIndex handles MAX_SAFE_INTEGER index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = ArrayFindLastIndexUtils.FindLastIndexMaxSafeIntegerTest13800();
      hilog.info(0x0000, 'TestTag', 'FindLastIndexMaxSafeIntegerTest13800 result: %{public}s', String(result));
      expect(result).assertEqual(-1);   // note fix
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest7200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_7200
     * @tc.desc   Verify findLastIndex thisArg with WebAssembly (if available)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayFindLastIndexExtendedTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCallbackThrowsTest13900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest7300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_7300
     * @tc.desc   Verify findLastIndex throws TypeError when called on null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexThisArgNullCallTest14000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndexExtendedTest7400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_EXTENDED_TEST_7400
     * @tc.desc   Verify findLastIndex throws TypeError when called on undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndexExtendedTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexThisArgUndefinedCallTest14100();
      expect(result).assertEqual(true);
    });
  });
}
