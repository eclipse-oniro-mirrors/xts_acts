import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testEntriesWithPopDuringIteration,
  testEntriesIteratorReflectsPopChanges,
  testMultiplePopDuringEntriesIteration,
  testPopToEmptyDuringEntries,
  testEntriesIteratorSharesArrayReference,
  testPopBeforeStartingEntriesIteration,
  testPopReturnValueUnaffectedByEntries,
  testPopOnEmptyThenEntries,
  testPopCausesElementSkipInEntries,
  testManualEntriesNextWithPop,
  testEntriesAfterPopStillCorrect,
  testRepeatedPopThenEntries,
  testPopDoesNotAlterObjectReferencesInEntries,
  testEntriesAndPopOnSparseArray,
  testEntriesUsesCurrentLengthAfterPop,
  testEntriesPopInStrictMode,
  testNewEntriesAfterPopDiffersFromOld,
  testPopAffectsSymbolIteratorConsistently,
  testFrozenArrayPopFailsButEntriesWorks,
  testPopThenPushDuringEntriesIteration,
  testEntriesIteratorHasSymbolIteratorProperty,
  testPopUntilOneElementDuringEntries,
  testPopUndefinedThenEntries,
  testPopAffectsLengthDuringIteration,
  testForInVsEntriesWithPop,
  testPopObjectReferenceDuringEntries,
  testIndexContinuityAfterPop,
  testNextMethodAfterPop,
  testValueTypePreservedAfterPop,
  testPopWithNullUndefinedValues,
  testRecreateEntriesAfterPop,
  testEntriesAfterManyPops,
  testNoAccessToRemovedElements,
  testArrayFromEntriesAfterPop,
  testPopPerformanceInLongArrayEntries,
  testDuplicateValuesAfterPop,
  testCheckLengthImmediatelyAfterPop,
  testOrderPreservedAfterPop,
  testPopFunctionArrayDuringEntries,
  testPopThenUnshiftDuringEntries,
  testModifyElementsAfterPop,
  testPopNestedArrayDuringEntries,
  testPopBooleanArray,
  testSliceAfterPopDuringEntries,
  testToStringAfterPopAndEntries,
  testPopLargeNumberArray,
  testStringMethodsAfterPop,
  testEveryAfterPopInIteration,
  testPopSpecialValues,
  testConcatAfterPopInEntries,
  testIndexOfAfterPop,
  testFilterAfterPopInIteration,
  testPopDateArray,
  testIncludesAfterPopInEntries,
  testJoinAfterPop,
  testMapAfterPopInIteration,
  testPopRegexArray,
  testReduceAfterPopInEntries,
  testPopSetArray,
  testPopThenSpliceDuringEntries,
  testPopSymbolArray,
  testLengthDescriptorAfterPopInEntries,
  testPopMapArray,
  testFindAfterPopInEntries,
  testPrototypeChainAfterPop,
  testSomeAfterPopInEntries,
  testPopBigIntArray,
  testCopyWithinAfterPopInEntries,
  testPopErrorArray,
  testFillAfterPopInEntries,
  testJSONSerializationAfterPop,
  testHasOwnPropertyAfterPopInEntries,
  testPopPromiseArray,
  testReverseAfterPopInEntries,
  testPopProxyArray,
  testFlatAfterPopInEntries,
  testPopURLArray,
  testSortAfterPopInEntries,
  testConstructorAfterPop,
  testToLocaleStringAfterPopInEntries,
  testCompareTimestampsAfterPop,
  testEqualityAfterPopInEntries,
  testRegexFlagsAfterPop,
  testValuesAfterPopInEntries,
  testKeysAfterPop,
  testForEachAfterPopInEntries,
  testClassInstanceAfterPop,
  testFlatMapAfterPopInEntries,
  testMixedNullOrUndefAfterPop,
  testValueOfAfterPopInEntries,
  testExecuteArrowFunctionsAfterPop,
  testAtAfterPopInEntries,
  testLargeObjectPropertiesAfterPop,
  testReduceRightAfterPopInEntries,
  testCircularReferenceAfterPop,
  testFindIndexAfterPopInEntries,
  testTypedArrayAfterPop,
  testIsPrototypeOfAfterPopInEntries,
  testValuesPop_WithSymbolValues,
  testValuesPop_ProxyArray,
  testValuesPop_NewIteratorAfterPop,
  testValuesPop_LargeButSafeLength,
  testValuesPop_SealedArray,
  testValuesPop_FrozenArrayPopFailsButValuesWorks,
  testValuesPop_LargeArrayPopOne,
  testValuesPop_SparseArray,
  testValuesPop_NaNHandling,
  testValuesPop_ObjectReferenceStable
} from './ArrayPopTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayCache1Test() {
  describe('ArrayCache1Test', () => {
    beforeEach(async () => {
      await sleep(50);
    })

    /**
     * @tc.name testCache_Array1_001
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_0100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const iter = arr.values();
      iter.next();
      iter.next();
      arr.pop();
      const third = iter.next();
      const fourth = iter.next();
      expect(third.value).assertEqual(3);
      expect(fourth.done).assertEqual(true);

    });

    /**
     * @tc.name testCache_Array1_002
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_0200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30];
      const iter = arr.values();
      iter.next();

      arr.pop();
      arr.pop();
      arr.pop();
      const nextAfterEmpty = iter.next();
      expect(nextAfterEmpty.done).assertEqual(true);
      expect(nextAfterEmpty.value).assertEqual(undefined);
    });

    /**
     * @tc.name testCache_Array1_003
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_0300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      let count = 0;
      const visited: number[] = [];

      for (const value of arr.values()) {
        count++;
        visited.push(value);
        arr.pop();
      }
      expect(count).assertEqual(3);
      expect(JSON.stringify(visited)).assertEqual("[1,2,3]");
    });

    /**
     * @tc.name testCache_Array1_004
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_0400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [];
      const iter = arr.values();
      const result = iter.next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.name testCache_Array1_005
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_0500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [42];
      arr.pop();
      const iter = arr.values();
      const result = iter.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_006
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_0600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      while (arr.length > 0) {
        arr.pop();
      }
      let count = 0;
      for (const _ of arr.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name testCache_Array1_007
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_0700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20];
      const iter1 = arr.values();
      const iter2 = arr.values();

      iter1.next();
      arr.pop();

      const r1 = iter1.next();
      const r2 = iter2.next();

      expect(r1.done).assertEqual(true);
      expect(r2.value).assertEqual(10);
    });

    /**
     * @tc.name testCache_Array1_008
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_0800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const iter = arr.values();
      iter.next();
      arr.pop();
      arr.push(99);
      const second = iter.next();
      const third = iter.next();
      expect(second.value).assertEqual(2);
      expect(third.value).assertEqual(99);
    });

    /**
     * @tc.name testCache_Array1_009
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_0900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [5, 6, 7, 8];
      const iter = arr.values();
      iter.next();
      arr.pop();
      arr.pop();
      arr.pop();
      const next = iter.next();
      expect(next.done).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_010
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const visited: number[] = [];
      let popped = false;

      for (const v of arr.values()) {
        visited.push(v);
        if (!popped) {
          arr.pop();
          popped = true;
        }
      }
      expect(JSON.stringify(visited)).assertEqual("[1,2,3]");
    });

    /**
     * @tc.name testCache_Array1_011
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const iter = arr.values();
      let count = 0;
      for (const _ of iter) {
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testCache_Array1_012
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const iter = arr.values();
      arr.pop();
      const r1 = iter.next();
      const r2 = iter.next();
      const r3 = iter.next();
      expect(r1.done).assertEqual(true);
      expect(r2.done).assertEqual(true);
      expect(r3.done).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_013
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [100, 200, 300];
      const iter = arr.values();
      const first: number = iter.next().value;
      arr.pop();
      const second: number = iter.next().value;
      expect(first).assertEqual(100);
      expect(second).assertEqual(200);
    });

    /**
     * @tc.name testCache_Array1_014
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [7, 8, 9];
      const iter = arr.values();
      expect(iter.next().value).assertEqual(7);
      expect(iter.next().value).assertEqual(8);

      arr.pop();
      const third = iter.next();
      expect(third.done).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_015
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [undefined, null, 0];
      const iter = arr.values();
      arr.pop();

      const v1 = iter.next();
      const v2 = iter.next();
      const v3 = iter.next();

      expect(v1.value).assertEqual(undefined);
      expect(v2.value).assertEqual(null);
      expect(v3.done).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_016
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b', 'c'];
      const all: string[] = [];
      for (const v of arr.values()) {
        all.push(v);
      }
      const popped = arr.pop();

      expect(popped).assertEqual('c');
      expect(all[2]).assertEqual('c');
    });

    /**
     * @tc.name testCache_Array1_017
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const iter = arr.values();
      const results: number[] = [];
      results.push(iter.next().value);
      arr.pop();
      results.push(iter.next().value);
      arr.pop();
      results.push(iter.next().value);
      arr.pop();
      const final = iter.next();
      expect(JSON.stringify(results)).assertEqual("[1,2,3]");
      expect(final.done).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_018
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30];
      const iter = arr.values();
      iter.next();
      arr[1] = 200;
      const second: number = iter.next().value;
      expect(second).assertEqual(200);
    });

    /**
     * @tc.name testCache_Array1_019
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_1900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_FrozenArrayPopFailsButValuesWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_020
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_2000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_LargeArrayPopOne();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_021
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_2100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_SparseArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_022
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_2200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.pop();
      arr.pop();
      arr.pop();

      const iter = arr.values();
      const r = iter.next();
      expect(r.done).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_024
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_2400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const iter = arr.values();
      iter.next();
      arr.pop();
      arr.pop();
      arr.push(99);

      const r = iter.next();
      expect(r.done).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_025
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_2500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      let count = 0;
      for (const v of arr.values()) {
        count++;
        if (count === 1) {
          break;
        }
      }
      arr.pop();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testCache_Array1_026
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_2600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const originalLength = arr.length;
      arr.values();
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.name testCache_Array1_027
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_2700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_NaNHandling();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_028
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_2800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_ObjectReferenceStable();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache_Array1_030
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_3000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const iter = arr.values();
      const first: number = iter.next().value;

      arr.pop();

      const second: number = iter.next().value;
      const thirdDone = iter.next().done;

      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(thirdDone).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_031
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_3100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const iter = arr.values();
      iter.next();
      arr.length = 2;

      const second: number = iter.next().value;
      const third = iter.next().done;

      expect(second).assertEqual(2);
      expect(third).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_032
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_3200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const iter = arr.values();
      const nextFunc = iter.next;
      let errorCaught = false;
      try {
        nextFunc();
      } catch (e) {
        errorCaught = true;
      }
      const result = iter.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.name testCache_Array1_034
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_3400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const outerVisited: number[] = [];

      for (const outer of arr.values()) {
        outerVisited.push(outer);
        if (outer === 1) {
          for (const _ of arr.values()) {
            arr.pop();
            break;
          }
        }
      }
      expect(JSON.stringify(outerVisited)).assertEqual("[1,2]");
    });

    /**
     * @tc.name testCache_Array1_035
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_3500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_NewIteratorAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_036
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_3600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_WithSymbolValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_037
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_3700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_ProxyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_039
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_3900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [];
      const iter1 = arr.values();
      const iter2 = arr.values();
      expect(iter1 === iter2).assertEqual(false);
    });

    /**
     * @tc.name testCache_Array1_040
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [100];
      const iter = arr.values();
      arr.pop();
      const r = iter.next();
      expect(r.done).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_041
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_LargeButSafeLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_042
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesPop_SealedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_043
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesWithPopDuringIteration();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache_Array1_044
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesIteratorReflectsPopChanges();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_Array1_045
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMultiplePopDuringEntriesIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_046
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopToEmptyDuringEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_047
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesIteratorSharesArrayReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_048
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopBeforeStartingEntriesIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_049
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_4900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopReturnValueUnaffectedByEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_050
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopOnEmptyThenEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_051
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopCausesElementSkipInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_052
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testManualEntriesNextWithPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_053
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesAfterPopStillCorrect();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_054
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRepeatedPopThenEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_055
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopDoesNotAlterObjectReferencesInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_056
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesAndPopOnSparseArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_057
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesUsesCurrentLengthAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_058
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesPopInStrictMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_059
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_5900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNewEntriesAfterPopDiffersFromOld();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_060
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopAffectsSymbolIteratorConsistently();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_061
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenArrayPopFailsButEntriesWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_062
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopThenPushDuringEntriesIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_063
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesIteratorHasSymbolIteratorProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_064
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopUntilOneElementDuringEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_065
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopUndefinedThenEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_066
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopAffectsLengthDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_067
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testForInVsEntriesWithPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_068
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopObjectReferenceDuringEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_069
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_6900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testIndexContinuityAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_070
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNextMethodAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_071
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValueTypePreservedAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_072
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopWithNullUndefinedValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_073
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRecreateEntriesAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_074
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesAfterManyPops();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_075
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNoAccessToRemovedElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_076
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayFromEntriesAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_077
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopPerformanceInLongArrayEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_078
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDuplicateValuesAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_079
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_7900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCheckLengthImmediatelyAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_080
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testOrderPreservedAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_081
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopFunctionArrayDuringEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_082
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopThenUnshiftDuringEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_083
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testModifyElementsAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_084
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopNestedArrayDuringEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_085
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopBooleanArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_086
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceAfterPopDuringEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_087
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testToStringAfterPopAndEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_088
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopLargeNumberArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_089
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_8900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testStringMethodsAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_090
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEveryAfterPopInIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_091
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopSpecialValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_092
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConcatAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_093
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testIndexOfAfterPop();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_Array1_094
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFilterAfterPopInIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_095
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopDateArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_096
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testIncludesAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_097
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testJoinAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_098
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMapAfterPopInIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_099
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_9900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopRegexArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_100
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testReduceAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_101
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopSetArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_102
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopThenSpliceDuringEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_103
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopSymbolArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_104
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testLengthDescriptorAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_105
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopMapArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_106
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFindAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_107
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPrototypeChainAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_108
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSomeAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_109
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_10900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopBigIntArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_110
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_111
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopErrorArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_112
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFillAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_113
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testJSONSerializationAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_114
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHasOwnPropertyAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_115
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopPromiseArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_116
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testReverseAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_117
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopProxyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_118
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFlatAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_119
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_11900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPopURLArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_120
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSortAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_121
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructorAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_122
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testToLocaleStringAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_123
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCompareTimestampsAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_124
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEqualityAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_125
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRegexFlagsAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_126
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValuesAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_127
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testKeysAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_128
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testForEachAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_129
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_12900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testClassInstanceAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_130
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFlatMapAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_131
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMixedNullOrUndefAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_132
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValueOfAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_133
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testExecuteArrowFunctionsAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_134
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testAtAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_135
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testLargeObjectPropertiesAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_136
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testReduceRightAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_137
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCircularReferenceAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_138
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFindIndexAfterPopInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_139
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_13900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testTypedArrayAfterPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array1_140
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY1_14000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array1_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testIsPrototypeOfAfterPopInEntries();
      expect(result).assertEqual(true);
    });
  })
}

