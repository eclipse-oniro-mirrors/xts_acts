import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testAlternatingPushPopNoNetChange,
  testComplexPushPopSpliceCombo,
  testComplexSpliceDuringIteration,
  testDuplicateValuesWithSplice,
  testIterateEmptyThenPush,
  testMultipleSpliceCalls,
  testMultipleSpliceInserts,
  testMultipleSpliceSameIndex,
  testOscillatingPopPushOnSingleElement,
  testPopAndPushSameValueInSingleElement,
  testPopBeyondZero,
  testPopDuringIteration,
  testPopOnEmptyDuringIteration,
  testPopThenPushBack,
  testPopThenPushDifferent,
  testPopThenSpliceAtEnd,
  testPopThenSpliceAtStart,
  testPopToEmptyDuringIteration,
  testPopToEmptyThenPushMany,
  testPopToEmptyThenPushWithBreak,
  testPopToSingleThenSpliceMany,
  testPushAndImmediatelySpliceOut,
  testPushAndPopAlternating,
  testPushAndSpliceTogether,
  testPushArrayElement,
  testPushArrayWithNaN,
  testPushBigIntDuringIteration,
  testPushCustomToStringObject,
  testPushDateObject,
  testPushDuringIteration,
  testPushEmptyArray,
  testPushErrorObject,
  testPushFunctionDuringIteration,
  testPushInfinityValues,
  testPushMapObject,
  testPushMultipleDuringIteration,
  testPushMultipleNulls,
  testPushMultipleUndefined,
  testPushNaNDuringIteration,
  testPushNegativeNumber,
  testPushObjectDuringIteration,
  testPushProxyDuringIteration,
  testPushRegExpDuringIteration,
  testPushSameObjectMultipleTimes,
  testPushSameStringMultipleTimes,
  testPushSameValueRepeatedly,
  testPushSymbolDuringIteration,
  testPushThenBreak,
  testPushThenPartialSpliceRemove,
  testPushThenPopImmediately,
  testPushThenPopOnOriginallyEmpty,
  testPushThenSpliceNewElement,
  testPushUndefinedDuringIteration,
  testQueueLikeOperation,
  testSpliceClearDuringIteration,
  testSpliceCurrentElement,
  testSpliceDeleteBeforeCurrent,
  testSpliceDeleteCurrentThenPush,
  testSpliceDeletePrevious,
  testSpliceDuringIteration,
  testSpliceInsertCircularReference,
  testSpliceInsertDuringIteration,
  testSpliceInsertHeterogeneousValues,
  testSpliceInsertMany,
  testSpliceInsertSelfReference,
  testSpliceInsertZeroElements,
  testSpliceMixedTypes,
  testSpliceOutOfRangeDeletion,
  testSpliceRemoveCurrentAndPrevious,
  testSpliceRemoveCurrentValue,
  testSpliceRemoveFirstElementDuringIteration,
  testSpliceRemoveFromCurrentToEnd,
  testSpliceRemoveFromEnd,
  testSpliceRemoveMultipleAhead,
  testSpliceReorderDuringIteration,
  testSpliceReplaceOne,
  testSpliceReplaceWithDifferentType,
  testSpliceWithNegativeIndex
} from './ArraySpliceTest';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayCache3Test() {
  describe('ArrayCache3Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
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
     * @tc.name testCache_Array3_001
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_0100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_002
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_0200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPushDuringIteration();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_Array3_003
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_0300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_004
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_0400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushMultipleDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_005
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_0500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopToEmptyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_006
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_0600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceCurrentElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_007
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_0700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testIterateEmptyThenPush();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_008
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_0800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushSameValueRepeatedly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_009
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_0900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceInsertDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_010
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushAndPopAlternating();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_011
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceRemoveMultipleAhead();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_012
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceClearDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_013
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushThenPopImmediately();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_014
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceReplaceOne();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_015
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleSpliceInserts();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_016
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopThenPushBack();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_017
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testComplexSpliceDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_018
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushArrayElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_019
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_1900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceDeletePrevious();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_020
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushAndSpliceTogether();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_021
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushUndefinedDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_022
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushNaNDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_023
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopBeyondZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_024
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceInsertMany();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_025
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushThenSpliceNewElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_026
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceReorderDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_027
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushObjectDuringIteration();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_Array3_028
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testQueueLikeOperation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_029
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_2900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceRemoveFromCurrentToEnd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_030
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_3000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushAndImmediatelySpliceOut();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_031
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_3100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopOnEmptyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_032
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_3200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAlternatingPushPopNoNetChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_034
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_3400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushFunctionDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_035
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_3500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceDeleteBeforeCurrent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_036
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_3600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceReplaceWithDifferentType();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_037
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_3700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushNegativeNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_038
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_3800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleSpliceCalls();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_039
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_3900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopThenPushDifferent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_040
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_4000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceRemoveCurrentValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_041
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_4100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushSymbolDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_042
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_4200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushBigIntDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_043
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_4300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopAndPushSameValueInSingleElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_044
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_4400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceInsertSelfReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_045
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_4500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushSameObjectMultipleTimes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_046
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_4600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopThenSpliceAtEnd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_047
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_4700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushMultipleUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_048
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_4800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceDeleteCurrentThenPush();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_050
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushArrayWithNaN();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_051
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopToEmptyThenPushMany();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_052
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceMixedTypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_053
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushInfinityValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_054
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDuplicateValuesWithSplice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_055
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushProxyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_056
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopToSingleThenSpliceMany();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_057
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushCustomToStringObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_058
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceRemoveFromEnd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_059
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_5900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_060
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testComplexPushPopSpliceCombo();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_061
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceInsertZeroElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_062
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushThenBreak();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_063
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleSpliceSameIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_064
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopToEmptyThenPushWithBreak();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_065
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceWithNegativeIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_066
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushMultipleNulls();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_067
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceOutOfRangeDeletion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_068
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushThenPartialSpliceRemove();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_069
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_6900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOscillatingPopPushOnSingleElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_070
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceInsertCircularReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_071
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushRegExpDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_072
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushSameStringMultipleTimes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_073
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceRemoveFirstElementDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_074
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushDateObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_075
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPopThenSpliceAtStart();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_076
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushErrorObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_077
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceInsertHeterogeneousValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_078
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushThenPopOnOriginallyEmpty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_079
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_7900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpliceRemoveCurrentAndPrevious();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array3_080
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_CACHE_ARRAY3_8000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array3_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPushMapObject();
      expect(result).assertEqual(true);
    });
  })
}


