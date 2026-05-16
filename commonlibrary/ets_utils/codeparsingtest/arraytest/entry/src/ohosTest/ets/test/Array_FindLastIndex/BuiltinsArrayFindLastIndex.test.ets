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

export default function BuiltinsArrayFindLastIndex(): void {
  describe("BuiltinsArrayFindLastIndex", () => {
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
     * @tc.name   BuiltinsArrayFindLastIndex0100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_0100
     * @tc.desc   Verify findLastIndex finds the last element greater than 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexBasicTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex0200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_0200
     * @tc.desc   Verify findLastIndex finds the last occurrence of duplicate value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexBasicTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex0300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_0300
     * @tc.desc   Verify findLastIndex returns -1 when no element matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexBasicTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex0400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_0400
     * @tc.desc   Verify findLastIndex handles various truthy return values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexTruthyTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex0500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_0500
     * @tc.desc   Verify findLastIndex handles various falsy return values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFalsyTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex0600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_0600
     * @tc.desc   Verify findLastIndex works with arrow function callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCallbackTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex0700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_0700
     * @tc.desc   Verify findLastIndex works with named function callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFunctionTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex0800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_0800
     * @tc.desc   Verify findLastIndex works with inline anonymous function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexInlineTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex0900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_0900
     * @tc.desc   Verify findLastIndex correctly uses thisArg parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexThisArgTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1000
     * @tc.desc   Verify findLastIndex callback receives correct element parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexElementParamTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1100
     * @tc.desc   Verify findLastIndex callback receives correct index parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexIndexParamTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1200
     * @tc.desc   Verify findLastIndex callback receives correct array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArrayParamTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1300
     * @tc.desc   Verify findLastIndex on empty array returns -1 without calling callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexEmptyArrayTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1400
     * @tc.desc   Verify findLastIndex on single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSingleElementTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1500
     * @tc.desc   Verify findLastIndex returns correct index and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexReturnValueTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1600
     * @tc.desc   Verify findLastIndex stops iteration after finding match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayFindLastIndex1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexStopIterationTest1600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1700
     * @tc.desc   Verify findLastIndex handles sparse array with empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSparseArrayTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1800
     * @tc.desc   Verify findLastIndex handles array with deleted elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDeleteTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex1900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_1900
     * @tc.desc   Verify findLastIndex can find objects by property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexObjectElementTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2000
     * @tc.desc   Verify findLastIndex works with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNestedArrayTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2100
     * @tc.desc   Verify findLastIndex can find NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNaNTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2200
     * @tc.desc   Verify findLastIndex behavior when array is modified during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexModifyArrayTest2200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2300
     * @tc.desc   Verify findLastIndex returns different result than findIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCompareFindIndexTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2400
     * @tc.desc   Verify findLastIndex returns same result as lastIndexOf for primitive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCompareLastIndexOfTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2500
     * @tc.desc   Verify findLastIndex works correctly with large arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexLargeArrayTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2600
     * @tc.desc   Verify findLastIndex propagates errors thrown in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCallbackErrorTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2700
     * @tc.desc   Verify findLastIndex throws TypeError for invalid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexInvalidCallbackTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2800
     * @tc.desc   Verify findLastIndex works with strings via call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexStringTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex2900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_2900
     * @tc.desc   Verify findLastIndex works with array-like objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArrayLikeTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3000
     * @tc.desc   Verify findLastIndex handles negative length as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNegativeLengthTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3100
     * @tc.desc   Verify findLastIndex truncates float length to integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFloatLengthTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3200
     * @tc.desc   Verify findLastIndex throws TypeError when no callback provided
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNoCallbackTest3200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3300
     * @tc.desc   Verify findLastIndex throws TypeError when callback is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexUndefinedCallbackTest3300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3400
     * @tc.desc   Verify findLastIndex throws TypeError when callback is number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNumberCallbackTest3400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3500
     * @tc.desc   Verify findLastIndex throws TypeError when callback is string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexStringCallbackTest3500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3600
     * @tc.desc   Verify findLastIndex throws TypeError when callback is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexObjectCallbackTest3600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3700
     * @tc.desc   Verify findLastIndex can find Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSymbolTest3700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3800
     * @tc.desc   Verify findLastIndex can find Date objects by value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDateTest3800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex3900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_3900
     * @tc.desc   Verify findLastIndex can use RegExp for matching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexRegExpTest3900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4000
     * @tc.desc   Verify findLastIndex can find Map objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMapTest4000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4100
     * @tc.desc   Verify findLastIndex can find Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSetTest4100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4200
     * @tc.desc   Verify findLastIndex can find function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFunctionElementTest4200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4300
     * @tc.desc   Verify findLastIndex traverses all elements when no match found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexTraverseAllTest4300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4400
     * @tc.desc   Verify findLastIndex returns integer value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexReturnIntegerTest4400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4500
     * @tc.desc   Verify findLastIndex can return index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexZeroIndexTest4500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4600
     * @tc.desc   Verify findLastIndex can return maximum index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMaxIndexTest4600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4700
     * @tc.desc   Verify findLastIndex can find undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexUndefinedElementTest4700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4800
     * @tc.desc   Verify findLastIndex can find null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNullElementTest4800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex4900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_4900
     * @tc.desc   Verify findLastIndex can find Infinity values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexInfinityTest4900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5000
     * @tc.desc   Verify findLastIndex traverses all slots in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSparseTraversalTest5000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5100
     * @tc.desc   Verify findLastIndex handles different element types in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDifferentElementsTest5100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5200
     * @tc.desc   Verify findLastIndex callback can use index for condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexIndexConditionTest5200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5300
     * @tc.desc   Verify findLastIndex callback combines index and element value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexIndexElementComboTest5300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5400
     * @tc.desc   Verify findLastIndex callback can use array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArrayLengthTest5400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5500
     * @tc.desc   Verify findLastIndex callback can access other elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexAccessOtherElementsTest5500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5600
     * @tc.desc   Verify findLastIndex works with partial callback parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexPartialParamsTest5600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5700
     * @tc.desc   Verify findLastIndex callback without parameters still iterates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNoParamsTest5700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5800
     * @tc.desc   Verify findLastIndex works without thisArg parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNoThisArgTest5800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex5900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_5900
     * @tc.desc   Verify findLastIndex with number as thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexThisArgNumberTest5900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6000
     * @tc.desc   Verify findLastIndex with string as thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexThisArgStringTest6000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6100
     * @tc.desc   Verify findLastIndex with null/undefined as thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexThisArgNullUndefinedTest6100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6200
     * @tc.desc   Verify arrow function ignores thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArrowFunctionIgnoresThisArgTest6200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6300
     * @tc.desc   Verify arrow function accesses outer this
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArrowFunctionOuterThisTest6300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6400
     * @tc.desc   Verify method as callback with/without thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMethodAsCallbackTest6400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6500
     * @tc.desc   Verify findLastIndex skips empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSkipEmptySlotsTest6500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6600
     * @tc.desc   Verify findLastIndex with multiple delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMultipleDeleteTest6600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6700
     * @tc.desc   Verify findLastIndex when length greater than actual elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexLengthGreaterThanElementsTest6700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6800
     * @tc.desc   Verify findLastIndex finds last actual element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFindLastActualElementTest6800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex6900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_6900
     * @tc.desc   Verify findLastIndex traverses in reverse order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSparseReverseOrderTest6900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7000
     * @tc.desc   Verify findLastIndex with only last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexOnlyLastElementTest7000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7100
     * @tc.desc   Verify findLastIndex with middle values in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMiddleValuesTest7100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7200
     * @tc.desc   Verify findLastIndex finds object by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexObjectReferenceTest7200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7300
     * @tc.desc   Verify findLastIndex with deep nested property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDeepNestedPropertyTest7300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7400
     * @tc.desc   Verify findLastIndex compares array content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArrayContentTest7400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7500
     * @tc.desc   Verify findLastIndex with multi-dimensional arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMultiDimensionalTest7500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7600
     * @tc.desc   Verify findLastIndex can call function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCallFunctionElementTest7600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7700
     * @tc.desc   Verify findLastIndex with Symbol.description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSymbolDescriptionTest7700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7800
     * @tc.desc   Verify findLastIndex with Date properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDatePropertyTest7800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex7900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_7900
     * @tc.desc   Verify findLastIndex modifies current element during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexModifyCurrentElementTest7900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8000
     * @tc.desc   Verify findLastIndex modification doesn't affect visited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexModifyNotAffectVisitedTest8000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8100
     * @tc.desc   Verify findLastIndex with unshift during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexUnshiftElementTest8100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8200
     * @tc.desc   Verify findLastIndex deleting unvisited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDeleteUnvisitedTest8200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8300
     * @tc.desc   Verify findLastIndex deleting visited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDeleteVisitedTest8300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8400
     * @tc.desc   Verify findLastIndex when setting length to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSetLengthZeroTest8400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8500
     * @tc.desc   Verify findLastIndex behavior when using splice to modify array during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexSpliceClearTest8500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8600
     * @tc.desc   Verify findLastIndex when increasing array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexIncreaseLengthTest8600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8700
     * @tc.desc   Verify findLastIndex when decreasing array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDecreaseLengthTest8700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8800
     * @tc.desc   Verify findLastIndex with arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexArgumentsObjectTest8800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex8900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_8900
     * @tc.desc   Verify findLastIndex with Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexInt32ArrayTest8900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9000
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9000
     * @tc.desc   Verify findLastIndex with Float64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFloat64ArrayTest9000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9100
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9100
     * @tc.desc   Verify findLastIndex with dynamic length object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexDynamicLengthTest9100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9200
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9200
     * @tc.desc   Verify findLastIndex with zero length object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexZeroLengthTest9200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9300
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9300
     * @tc.desc   Verify findLastIndex with numeric keys only object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexNumericKeysOnlyTest9300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9400
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9400
     * @tc.desc   Verify findLastIndex with mixed properties object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexMixedPropertiesTest9400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9500
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9500
     * @tc.desc   Verify findLastIndex throws error when callback function throws an error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexCallbackReturnExceptionTest9500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9600
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9600
     * @tc.desc   Verify findLastIndex accessing non-existent property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexAccessNonExistentPropertyTest9600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9700
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9700
     * @tc.desc   Verify findLastIndex recursive callback calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexRecursiveCallTest9700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9800
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9800
     * @tc.desc   Verify find vs findLastIndex behavior difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFindVsFindLastIndexTest9800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayFindLastIndex9900
     * @tc.number SUB_BUILTINS_ARRAY_FIND_LAST_INDEX_9900
     * @tc.desc   Verify filter vs findLastIndex behavior difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayFindLastIndex9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayFindLastIndexUtils.FindLastIndexFilterVsFindLastIndexTest9900();
      expect(result).assertEqual(true);
    });
  });
}
