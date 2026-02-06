import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  test10_forOfValuesMatchesDirectArrayIteration,
  test17_spreadValuesAfterPush,
  test19_valuesIteratorIsIterable,
  test22_valuesRespectsIndexOrderDespiteDelete,
  test24_valuesProducesShallowCopyMatchingOriginal,
  test25_nativePushUsedEvenIfPrototypeModified,
  test28_pushUndefinedVsSparseHole,
  test29_valuesIteratorProtocolCompliance,
  test30_destructuringValuesAfterPush,
  test33_valuesIgnoresNonIndexProperties,
  test34_valuesHasCorrectToStringTag,
  test37_pushOnFrozenArrayThrows,
  test41_pushSymbolPreservedInValues,
  test42_valuesOnProxiedArrayReflectsPush,
  test46_pushNegativeZeroPreserved,
  test49_valuesMatchesJSONStringifyForSerializableData,
  test52_asyncContextBehaviorSame,
  test53_valuesIterationFollowsAscendingIndices,
  test54_valuesDoesNotTriggerGetters,
  test56_modifyingIteratorValueDoesNotAffectArray,
  test60_valuesSurvivesArrayVariableDeletion,
  test63_valuesAsGeneratorInputWorks,
  test64_nativeValuesPreferredOverShadowed,
  test66_valuesDoesNotInvokeToStringOrValueOf,
  test67_valuesMatchesSliceCall,
  test6_valuesReturnsIterator,
  test70_valuesElementsCanBeWeakMapKeys,
  test71_frozenObjectAsElementWorks,
  test72_iteratorDoesNotPreventGcOfArray,
  test73_valuesMatchesStructuredClone,
  test75_valuesIsNotArrayLikeSimulation,
  test77_valuesWithPromisesWorksInPromiseAll,
  test79_valuesMatchesReflectApplySlice,
  test80_repeatedPushAndValuesNoStateLeak,
  test81_negativeZeroDistinctFromPositiveZero,
  test83_valuesWorksOnSealedArray,
  test84_valuesMatchesArrayFromWithIdentityMap,
  test85_postMessageStyleCloneBehavior,
  test86_valuesDoesNotInvokeSymbolIteratorRecursively,
  test87_valuesUsableWithIntlListFormat,
  test88_proxyCanInterceptPushAndValues,
  test90_valuesMoreReliableThanForIn,
  test95_valuesComposesWithFilter,
  test97_valuesWorksOnFrozenArrayAfterPush,
  test9_pushNullIncludedInValues
} from './ArrayPushTest';

interface GeneratedObjectLiteralInterface_1 {
  id: number;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayCache2Test() {
  describe('ArrayCache2Test', () => {
    beforeEach(async () => {
      await sleep(40);
    })

    /**
     * @tc.name testCache_Array2_001
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_0100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.push(2);
      const result = Array.from(arr.values());
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name testCache_Array2_002
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_0200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      arr.push(1);
      arr.push(2);
      arr.push(3);
      expect(JSON.stringify(Array.from(arr.values()))).assertEqual(JSON.stringify([1, 2, 3]));
    });
    /**
     * @tc.name testCache_Array2_003
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_0300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['a'];
      const iter = arr.values();
      arr.push('b');
      const result = Array.from(iter);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(['a', 'b']));
    });

    /**
     * @tc.name testCache_Array2_004
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_0400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [0];
      arr.push(1, 2, 3);
      expect(JSON.stringify(Array.from(arr.values()))).assertEqual(JSON.stringify([0, 1, 2, 3]));
    });

    /**
     * @tc.name testCache_Array2_005
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_0500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = [];
      arr.push('x');
      expect(Array.from(arr.values()).length === 1 && arr.values().next().value === 'x').assertTrue();
    });

    /**
     * @tc.name testCache_Array2_006
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_0600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test6_valuesReturnsIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_007
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_0700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20];
      arr.push(30);
      const v1 = Array.from(arr.values());
      const v2 = Array.from(arr.values());
      expect(JSON.stringify(v1) === JSON.stringify(v2)).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_008
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_0800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new Array<undefined | number>();
      arr.push(undefined);
      const result = Array.from(arr.values());
      expect(result.length === 1 && result[0] === undefined).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_009
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_0900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test9_pushNullIncludedInValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_010
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test10_forOfValuesMatchesDirectArrayIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_011
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeneratedObjectLiteralInterface_1 = { id: 1 };
      const arr: GeneratedObjectLiteralInterface_1[] = [];
      arr.push(obj);
      const result = Array.from(arr.values())[0];
      expect(result === obj).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_012
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i = 0; i < 5; i++) {
        arr.push(i);
      }
      const expected = [0, 1, 2, 3, 4];
      expect(JSON.stringify(Array.from(arr.values())) === JSON.stringify(expected)).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_013
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['start'];
      arr.push('end');
      const iter = arr.values();
      const v1: string = iter.next().value;
      const v2: string = iter.next().value;
      const done = iter.next().done;
      expect(v1 === 'start' && v2 === 'end' && done === true).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_014
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const oldLen = arr.length;
      arr.push(3);
      const newLen = Array.from(arr.values()).length;
      expect(arr.length === 3 && newLen === 3 && newLen === oldLen + 1).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_015
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[][] = [];
      arr.push([1, 2]);
      const result = Array.from(arr.values())[0];
      expect(Array.isArray(result) && JSON.stringify(result) === JSON.stringify([1, 2])).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_016
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      const iter = arr.values();
      const first: number = iter.next().value;
      arr.push(2);
      const second: number = iter.next().value;
      expect(first === 1 && second === 2 && iter.next().done === true).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_017
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test17_spreadValuesAfterPush();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_018
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [100, 200];
      arr.push(300);
      expect(JSON.stringify(Array.from(arr.values())) === JSON.stringify(arr)).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_019
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_1900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test19_valuesIteratorIsIterable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_020
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.push(2);
      const captured = Array.from(arr.values());
      arr.length = 0;
      expect(JSON.stringify(captured) === JSON.stringify([1, 2])).assertTrue();
    });
    /**
     * @tc.name testCache_Array2_021
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      arr.push(NaN);
      const result = Array.from(arr.values());
      expect(result.length === 1 && Number.isNaN(result[0])).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_022
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test22_valuesRespectsIndexOrderDespiteDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_023
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10];
      const iter = arr.values();
      const first: number = iter.next().value;
      arr.push(20);
      const second: number = iter.next().value;
      expect(first === 10 && second === 20 && iter.next().done === true).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_024
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test24_valuesProducesShallowCopyMatchingOriginal();
      expect(result).assertEqual(true);

    });

    /**
     * @tc.name testCache_Array2_025
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test25_nativePushUsedEvenIfPrototypeModified();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_026
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const values = Array.from(arr.values());
      expect(values.length === 1000 && values[999] === 999).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_027
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const iter = arr.values();
      iter.next();
      arr.length = 0;
      const next = iter.next();
      expect(next.done === true).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_028
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test28_pushUndefinedVsSparseHole();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_029
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_2900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test29_valuesIteratorProtocolCompliance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_030
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_3000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test30_destructuringValuesAfterPush();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_031
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_3100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.push(2);
      const result = Array.from(arr.values());
      expect(JSON.stringify(result) === JSON.stringify([1, 2])).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_032
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_3200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['a'];
      arr.push('b');
      expect(JSON.stringify(Array.from(arr.values())) === JSON.stringify(Array.from(arr))).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_033
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_3300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test33_valuesIgnoresNonIndexProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_034
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_3400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test34_valuesHasCorrectToStringTag();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache_Array2_036
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_3600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.push(2);
      const snapshot = Array.from(arr.values());
      arr.reverse();
      const afterReverse = Array.from(arr.values());
      expect(JSON.stringify(snapshot) === JSON.stringify([1, 2]) &&
        JSON.stringify(afterReverse) === JSON.stringify([2, 1])).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_037
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_3700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test37_pushOnFrozenArrayThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_038
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_3800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.push(2);
      const v1 = Array.from(arr.values());
      const v2 = Array.from(arr.values());
      expect(JSON.stringify(v1) === JSON.stringify(v2) && v1[1] === 2).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_039
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_3900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = ['start'];
      arr.push('middle');
      arr.push('end');
      const fromValues = Array.from(arr.values());
      const fromIndex: string[] = [];
      for (let i = 0; i < arr.length; i++) {
        fromIndex.push(arr[i]);
      }
      expect(JSON.stringify(fromValues) === JSON.stringify(fromIndex)).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_040
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_4000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [100];
      arr.push(200);
      const fromValues = Array.from(arr.values());
      const fromSlice = arr.slice();
      expect(JSON.stringify(fromValues) === JSON.stringify(fromSlice)).assertTrue();
    });
    /**
     * @tc.name testCache_Array2_041
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_4100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test41_pushSymbolPreservedInValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_042
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_4200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test42_valuesOnProxiedArrayReflectsPush();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_043
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_4300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.push(2);
      const iter = arr.values();
      iter.next();
      expect(arr.length === 2 && arr[1] === 2).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_044
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_4400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['a'];
      arr.push('b');
      for (const _ of arr.values()) {
        break;
      }
      const result = Array.from(arr.values());
      expect(JSON.stringify(result) === JSON.stringify(['a', 'b'])).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_045
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_4500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      arr.push(1);
      arr.push(2);
      const iter = arr.values();
      iter.next();
      iter.next();
      const final = iter.next();
      expect(final.done === true && final.value === undefined).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_046
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_4600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test46_pushNegativeZeroPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_048
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_4800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = [];

      arr[1000] = 'far';
      arr.push('end');

      const lastValue = Array.from(arr.values()).pop();
      expect(lastValue === 'end').assertTrue();
    });

    /**
     * @tc.name testCache_Array2_049
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_4900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test49_valuesMatchesJSONStringifyForSerializableData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_050
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = [1];
      arr.push(2);
      const captured = Array.from(arr.values());
      arr = [999];
      expect(JSON.stringify(captured) === JSON.stringify([1, 2])).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_051
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['x'];
      arr.push('y');
      const fromValues = Array.from(arr.values());
      const fromConcat = arr.concat([]);
      expect(JSON.stringify(fromValues) === JSON.stringify(fromConcat)).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_052
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test52_asyncContextBehaviorSame();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_053
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test53_valuesIterationFollowsAscendingIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_054
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test54_valuesDoesNotTriggerGetters();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_055
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      arr.push(3);
      expect(JSON.stringify(Array.from(arr.values())) === JSON.stringify([...arr])).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_056
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test56_modifyingIteratorValueDoesNotAffectArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_057
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.push(2);
      const sum = Array.from(arr.values()).reduce((a, b) => a + b, 0);
      expect(sum === 3).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_058
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const iter = arr.values();
      iter.next();
      arr.length = 2;
      const second: number = iter.next().value;
      const third = iter.next();
      expect(second === 2 && third.done === true).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_059
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_5900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b'];
      arr.push('c');
      expect(JSON.stringify(Array.from(arr.values())) === JSON.stringify(Array.of(...arr))).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_060
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test60_valuesSurvivesArrayVariableDeletion();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_Array2_061
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = [];
      arr.push('🚀');
      arr.push('🙂‍↕️');
      const result = Array.from(arr.values());
      expect(result[0] === '🚀' && result[1] === '🙂‍↕️').assertTrue();
    });

    /**
     * @tc.name testCache_Array2_062
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.push(2);
      const iter = arr.values();
      iter.next();
      iter.next();
      const r1 = iter.next();
      const r2 = iter.next();
      expect(r1.done === true && r2.done === true && r1.value === undefined && r2.value === undefined).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_063
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test63_valuesAsGeneratorInputWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_064
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test64_nativeValuesPreferredOverShadowed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_065
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: bigint[] = [];
      const big = BigInt(9007199254740991n);
      arr.push(big);
      const result = Array.from(arr.values())[0];
      expect(typeof result === 'bigint' && result === big).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_066
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test66_valuesDoesNotInvokeToStringOrValueOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_067
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test67_valuesMatchesSliceCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_068
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = [];
      arr.length = 1000;
      arr.push('tail');
      const last = Array.from(arr.values()).pop();
      expect(last === 'tail').assertTrue();
    });

    /**
     * @tc.name testCache_Array2_069
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_6900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [3, 1];
      arr.push(2);
      arr.sort((a, b) => a - b);
      const result = Array.from(arr.values());
      expect(JSON.stringify(result) === JSON.stringify([1, 2, 3])).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_070
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_7000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test70_valuesElementsCanBeWeakMapKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_071
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_7100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test71_frozenObjectAsElementWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_072
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_7200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test72_iteratorDoesNotPreventGcOfArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_073
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_7300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test73_valuesMatchesStructuredClone();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_074
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_7400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      arr.push(3);
      arr.length = 0;
      const result = Array.from(arr.values());
      expect(result.length === 0).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_075
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_7500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test75_valuesIsNotArrayLikeSimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_077
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_7700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test77_valuesWithPromisesWorksInPromiseAll();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_078
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_7800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['a'];
      arr.push('b');
      arr.push('c');
      arr.splice(1, 1);
      const result = Array.from(arr.values());
      expect(JSON.stringify(result) === JSON.stringify(['a', 'c'])).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_079
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_7900
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test79_valuesMatchesReflectApplySlice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_080
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_8000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test80_repeatedPushAndValuesNoStateLeak();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_081
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_8100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test81_negativeZeroDistinctFromPositiveZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_083
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_8300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test83_valuesWorksOnSealedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_084
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_8400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test84_valuesMatchesArrayFromWithIdentityMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_085
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_8500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test85_postMessageStyleCloneBehavior();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_086
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_8600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test86_valuesDoesNotInvokeSymbolIteratorRecursively();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_087
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_8700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test87_valuesUsableWithIntlListFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_088
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_8800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test88_proxyCanInterceptPushAndValues();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache_Array2_090
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_9000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test90_valuesMoreReliableThanForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_091
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_9100
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const now = new Date();
      const arr: Date[] = [];
      arr.push(now);
      const result = Array.from(arr.values())[0];
      expect(result === now && result instanceof Date).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_092
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_9200
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1];
      arr.push(2);
      const iter = arr.values();
      const first: number = iter.next().value;
      arr.concat([3]);
      const second: number = iter.next().value;
      expect(first === 1 && second === 2).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_093
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_9300
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 1];
      arr.push(2);
      const set = new Set(arr.values());
      expect(set.size === 2 && set.has(1) && set.has(2)).assertTrue();
    });

    /**
     * @tc.name testCache_Array2_094
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_9400
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10];
      arr.push(20);
      const iter = arr.values();
      const r1 = iter.next();
      try {
        r1.value = 999;

        expect(arr[0] === 10).assertTrue();
      } catch (e) {
        expect(arr[0] === 10).assertTrue();
      }
    });

    /**
     * @tc.name testCache_Array2_095
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_9500
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test95_valuesComposesWithFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_096
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_9600
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = [];
      arr.push('same-realm');
      const result = Array.from(arr.values());
      expect(Array.isArray(arr) && result[0] === 'same-realm').assertTrue();
    });

    /**
     * @tc.name testCache_Array2_097
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_9700
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test97_valuesWorksOnFrozenArrayAfterPush();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_Array2_098
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_9800
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['keep'];
      arr.push('remove-me');
      arr.shift();
      const result = Array.from(arr.values());
      expect(result.length === 1 && result[0] === 'remove-me').assertTrue();
    });


    /**
     * @tc.name testCache_Array2_100
     * @tc.number SUB_COMMONLIBRARY_CACHE_BASE_ARRAY2_10000
     * @tc.desc Testing Cache Combo by Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_Array2_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const expected: number[] = [];
      for (let i = 0; i < 1000; i++) {
        const val = Math.random();
        arr.push(val);
        expected.push(val);
      }
      expect(arr.length).assertEqual(expected.length);
      expect(Array.from(arr.values()).length).assertEqual(arr.length);
    });
  })
}

