import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testProxyCustomSliceMethod,
  testProxyReadOnlySliceView,
  testProxySliceAboveAverage,
  testProxySliceAdd100ToNumbers,
  testProxySliceAllToString,
  testProxySliceBigIntToString,
  testProxySliceBooleanToNumber,
  testProxySliceCachesSameArgs,
  testProxySliceCallLimit,
  testProxySliceChunkByTwo,
  testProxySliceClampNegativeToZero,
  testProxySliceConsistentResults,
  testProxySliceDateToTimestamp,
  testProxySliceDebugMode,
  testProxySliceDedupeByReference,
  testProxySliceDedupeNullish,
  testProxySliceDedupes,
  testProxySliceDedupIfAllEqual,
  testProxySliceEmptyBecomesNullArray,
  testProxySliceEnsuresEvenLength,
  testProxySliceEvenIndicesOnly,
  testProxySliceFalsyButKeepZeroFalse,
  testProxySliceFillSparseWithUndefined,
  testProxySliceFiltersFalsy,
  testProxySliceFlattenOneLevelAndSkipNestedArrays,
  testProxySliceFormatDates,
  testProxySliceFreezeInReadOnlyMode,
  testProxySliceGlobalDedupeByJSON,
  testProxySliceGroupByTypeIfPrimitive,
  testProxySliceHardCapTen,
  testProxySliceHardLimitTwo,
  testProxySliceJoinIfAllStrings,
  testProxySliceKeepPrimeIndices,
  testProxySliceLastN,
  testProxySliceLazyLikeConsistency,
  testProxySliceLogsCall,
  testProxySliceMaxLengthHalf,
  testProxySliceMaxTwoElements,
  testProxySliceMultiplyByLocalIndex,
  testProxySliceNeverEmpty,
  testProxySliceNoCrossMidpoint,
  testProxySliceNoNegativeIndices,
  testProxySliceNormalizeNegativeZero,
  testProxySliceNullToString,
  testProxySliceNumbersOnly,
  testProxySliceNumbersToBooleans,
  testProxySliceOddsOnly,
  testProxySliceOnGet,
  testProxySliceOnlyFirstHalf,
  testProxySliceOnlyNoArgsAllowed,
  testProxySliceOnlyPositiveIntRange,
  testProxySliceOnReversedSource,
  testProxySliceOnSet,
  testProxySlicePaddedToThree,
  testProxySlicePrefixWithIndex,
  testProxySlicePrependLength,
  testProxySlicePrimitivesOnly,
  testProxySliceRegexToString,
  testProxySliceRejectNonAsciiStrings,
  testProxySliceRejectOddStartIndex,
  testProxySliceRejectsCircular,
  testProxySliceRejectsEmptySource,
  testProxySliceRejectsFunctions,
  testProxySliceRejectsNegativeNumbers,
  testProxySliceRejectsOnlyEmptyObjects,
  testProxySliceRejectsZero,
  testProxySliceRemoveConsecutiveDuplicates,
  testProxySliceReplaceInfinity,
  testProxySliceReplaceNaNWithNull,
  testProxySliceReplaceUndefined,
  testProxySliceReturnsEmptyOnInvalidRange,
  testProxySliceReturnsFrozenArray,
  testProxySliceReverseByGlobalIndex,
  testProxySliceReversed,
  testProxySliceReverseIfNoArgs,
  testProxySliceReverseIfSortedAscendingNumbers,
  testProxySliceRoundNumbers,
  testProxySliceSanitizeFloatSpecialValues,
  testProxySliceSingleElementUnwrapped,
  testProxySliceSkipEvenGlobalIndices,
  testProxySliceSkipIndexDivisibleByThree,
  testProxySliceSkipLongStrings,
  testProxySliceSkipsNullish,
  testProxySliceSkipSymbols,
  testProxySliceSorted,
  testProxySliceSortedUnique,
  testProxySliceStringToLength,
  testProxySliceSumIfAllNumbers,
  testProxySliceTagEvenLength,
  testProxySliceTagObjects,
  testProxySliceToggleBooleanNumber,
  testProxySliceToStrings,
  testProxySliceTransparentPassThrough,
  testProxySliceTriggersSnapshot,
  testProxySliceTrimStrings,
  testProxySliceUppercaseStrings,
  testProxySliceViaSet,
  testProxySliceWithoutEdges,
  testProxySliceWithTimestamp,
  testProxySliceWrapEachItem,
} from './SpliceTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function SpliceTest() {
  describe('SpliceTest', () => {
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
     * @tc.name testCache6_001
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_0100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceOnGet();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_002
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_0200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceOnSet();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache6_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_0300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyCustomSliceMethod();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache6_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_0400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReadOnlySliceView();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_005
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_0500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceLogsCall();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_006
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_0600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceFiltersFalsy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_007
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_0700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceReturnsEmptyOnInvalidRange();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_008
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_0800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceLastN();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_0900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceDedupes();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceNoNegativeIndices();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceReversed();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceMaxTwoElements();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceEvenIndicesOnly();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceToStrings();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceTriggersSnapshot();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_016
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceWithoutEdges();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceNeverEmpty();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSorted();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_1900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceOnlyFirstHalf();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRejectsZero();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySlicePaddedToThree();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache6_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceOddsOnly();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceCallLimit();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSkipsNullish();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_025
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceEnsuresEvenLength();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_026
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceOnlyPositiveIntRange();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_027
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceMultiplyByLocalIndex();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceWrapEachItem();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_2900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceTrimStrings();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceHardLimitTwo();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_031
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRejectsNegativeNumbers();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSortedUnique();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_033
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceAboveAverage();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceTransparentPassThrough();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_035
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceOnlyNoArgsAllowed();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceViaSet();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_037
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRejectsEmptySource();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_038
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceUppercaseStrings();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_3900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceWithTimestamp();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceConsistentResults();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_041
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceNumbersToBooleans();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_042
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRejectsOnlyEmptyObjects();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceDedupeByReference();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceFillSparseWithUndefined();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceReplaceNaNWithNull();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_046
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceMaxLengthHalf();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_047
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceStringToLength();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_048
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceReverseByGlobalIndex();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache6_049
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_4900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSkipEvenGlobalIndices();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceDedupIfAllEqual();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceHardCapTen();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceClampNegativeToZero();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_053
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceDebugMode();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRemoveConsecutiveDuplicates();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRejectsFunctions();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceChunkByTwo();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSingleElementUnwrapped();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRoundNumbers();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_059
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_5900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySlicePrependLength();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceReturnsFrozenArray();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSkipSymbols();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRegexToString();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceNumbersOnly();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceBigIntToString();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceReplaceUndefined();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRejectOddStartIndex();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceBooleanToNumber();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_068
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceJoinIfAllStrings();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_6900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceFalsyButKeepZeroFalse();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceAllToString();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_071
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceFormatDates();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceOnReversedSource();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceTagEvenLength();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache6_074
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceFlattenOneLevelAndSkipNestedArrays();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_075
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceReplaceInfinity();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_076
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySlicePrimitivesOnly();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_077
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceNormalizeNegativeZero();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_078
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceReverseIfNoArgs();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_079
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_7900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySlicePrefixWithIndex();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceLazyLikeConsistency();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceNullToString();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_082
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRejectsCircular();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_083
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceKeepPrimeIndices();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_084
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSkipLongStrings();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_085
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceEmptyBecomesNullArray();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_086
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceAdd100ToNumbers();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_087
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceNoCrossMidpoint();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_088
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceDateToTimestamp();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_089
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_8900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSumIfAllNumbers();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_090
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceGlobalDedupeByJSON();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_091
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceDedupeNullish();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_092
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceRejectNonAsciiStrings();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceGroupByTypeIfPrimitive();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_094
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceFreezeInReadOnlyMode();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_095
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSkipIndexDivisibleByThree();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_096
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceSanitizeFloatSpecialValues();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_097
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceToggleBooleanNumber();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_098
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceTagObjects();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_099
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_9900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceCachesSameArgs();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache6_100
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE6_10000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache6_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceReverseIfSortedAscendingNumbers();
      expect(result).assertEqual(true)
    });
  })
}