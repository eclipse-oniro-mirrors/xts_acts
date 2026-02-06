import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  test01_deleteNextElementDuringIteration,
  test02_deleteCurrentElementDuringIteration,
  test03_deletePreviousElementDuringIteration,
  test04_iterateEmptySet,
  test05_singleElementDeleteSelf,
  test06_deleteNonExistentElementMultipleTimes,
  test07_deleteAndReaddSameElementDuringIteration,
  test08_deleteObjectElementDuringIteration,
  test09_setWithNaNHandling,
  test100_exoticObjectLikeArguments,
  test101_setInSharedMemoryContext,
  test102_frozenObjectInSet,
  test103_reflectDeletePropertyOnSetDoesNothing,
  test104_iteratorDoesNotBacktrackAfterDeletion,
  test105_sandboxedEnvironmentSimulation,
  test106_errorObjectInSet,
  test107_readdSameObjectReference,
  test108_deleteDuringConstructionNotPossibleButSimulated,
  test109_domElementInSet,
  test10_positiveZeroAndNegativeZeroAreEqual,
  test110_nanEqualityInSet,
  test111_forInDoesNotIterateSetEntries,
  test113_wasmUnrelatedContext,
  test114_intlCollatorInSet,
  test115_singleThreadConcurrencySimulation,
  test116_atomicsLikeObjectInSet,
  test117_moduleTopLevelSimulation,
  test118_performanceObserverLikeObject,
  test119_setIgnoresIndexAssignment,
  test11_clearSetDuringIteration,
  test120_maxSafeIntegerInSet,
  test12_nestedLoopsOnSameSet,
  test13_symbolElementsInSet,
  test14_dateObjectsInSet,
  test15_regexpObjectsInSet,
  test16_functionElementsInSet,
  test17_circularReferenceObjectInSet,
  test18_deleteMultipleElementsDuringIteration,
  test19_deleteSkippedFutureElement,
  test20_forOfSetDirectly,
  test21_falsyValuesInSet,
  test22_strictModeDeletion,
  test23_deleteUndefinedIfPresent,
  test24_setFromDeduplicatedArray,
  test25_deleteInsideTryCatch,
  test26_recursiveDeletion,
  test27_insertionOrderPreserved,
  test28_sizeUpdatesImmediatelyAfterDelete,
  test29_stringObjectVsPrimitive,
  test30_simulateWorkerContext,
  test31_destructuringEntries,
  test32_asyncFunctionButSyncLogic,
  test33_hasReturnsFalseImmediatelyAfterDelete,
  test34_readdedElementGoesToEnd,
  test35_distinctObjectsWithSameContent,
  test36_freezeSetObjectDoesNotPreventDeletion,
  test37_modifySetAfterConvertingToEntriesArray,
  test38_keysValuesEntriesConsistency,
  test40_largeSetDeletion,
  test41_deletedElementNotSeenLaterInSameIteration,
  test42_setForEachDeleteBehavior,
  test43_forEachVsForOfDeletionDifference,
  test44_setWithInfinity,
  test45_negativeZeroEqualsPositiveZeroInSet,
  test47_deleteReturnsBoolean,
  test48_addThenDeleteInSameIteration,
  test49_setAsMapKeyButTestSetItself,
  test53_multipleIteratorsConcurrent,
  test54_generatorYieldAndDelete,
  test55_proxyObjectInSet,
  test56_deleteThenAddDifferentValue,
  test57_entriesReturnsKeyValuePairWithValueTwice,
  test58_deleteInFinallyBlock,
  test59_reflectApplyDelete,
  test60_setIteratorIsWellKnownSymbol,
  test61_setWithInfinityAndNegativeInfinity,
  test62_setWithNullProtoObjects,
  test63_deleteDuringIterationOverFrozenEntriesArray,
  test64_setInStrictModeFunction,
  test66_setWithGlobalThisAsElement,
  test67_deletingSameElementFromTwoSetsIndependently,
  test68_setEntriesIteratorAfterClear,
  test71_setConstructedFromString,
  test72_setWithArrayAsElement,
  test73_setAfterBeingUsedAsWeakSetKey,
  test74_setWithPromiseObjects,
  test75_setInNestedClosureWithDelete,
  test76_setWithGetterOnlyPropertyObject,
  test77_setEntriesIgnoresCustomProps,
  test78_duplicatedObjectReferences,
  test79_gcSimulation,
  test80_numericStringAndNumberDistinct,
  test81_crossEnvironmentCompatibility,
  test82_allFalsyValues,
  test83_stringifyDoesNotAffectSet,
  test84_classInstanceInSet,
  test85_generatorFunctionDeletion,
  test86_duplicateNaNHandling,
  test87_newIteratorEachTime,
  test88_bigIntInSet,
  test89_errorAfterDelete,
  test90_wellKnownSymbolInSet,
  test91_setConstructedFromSet,
  test92_nonEnumerablePropsIgnored,
  test95_spreadMultipleTimes,
  test96_topLevelAwaitSimulation,
  test97_moduleScopeSimulation,
  test98_dynamicPropertyAccess,
  test99_iteratorExhaustedAfterUse
} from './SetDeleteTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function SetCache2Test() {
  describe('SetCache2Test', () => {
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
     * @tc.name testCache_set2_001
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_0100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test01_deleteNextElementDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_0200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test02_deleteCurrentElementDuringIteration();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_set2_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_0300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test03_deletePreviousElementDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_0400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test04_iterateEmptySet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_0500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test05_singleElementDeleteSelf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_006
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_0600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test06_deleteNonExistentElementMultipleTimes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_007
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_0700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test07_deleteAndReaddSameElementDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_008
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_0800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test08_deleteObjectElementDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_009
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_0900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test09_setWithNaNHandling();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_010
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test10_positiveZeroAndNegativeZeroAreEqual();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_011
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test11_clearSetDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_012
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test12_nestedLoopsOnSameSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test13_symbolElementsInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test14_dateObjectsInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_015
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test15_regexpObjectsInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test16_functionElementsInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test17_circularReferenceObjectInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_018
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test18_deleteMultipleElementsDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_019
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_1900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test19_deleteSkippedFutureElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test20_forOfSetDirectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_021
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test21_falsyValuesInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_022
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test22_strictModeDeletion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test23_deleteUndefinedIfPresent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test24_setFromDeduplicatedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_025
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test25_deleteInsideTryCatch();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test26_recursiveDeletion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_027
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test27_insertionOrderPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test28_sizeUpdatesImmediatelyAfterDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_029
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_2900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test29_stringObjectVsPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_030
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_3000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test30_simulateWorkerContext();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_031
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_3100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test31_destructuringEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_032
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_3200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test32_asyncFunctionButSyncLogic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_033
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_3300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test33_hasReturnsFalseImmediatelyAfterDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_034
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_3400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test34_readdedElementGoesToEnd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_035
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_3500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test35_distinctObjectsWithSameContent();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_set2_036
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_3600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test36_freezeSetObjectDoesNotPreventDeletion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_037
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_3700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test37_modifySetAfterConvertingToEntriesArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_038
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_3800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test38_keysValuesEntriesConsistency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_040
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_4000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test40_largeSetDeletion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_041
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_4100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test41_deletedElementNotSeenLaterInSameIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_042
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_4200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test42_setForEachDeleteBehavior();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_043
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_4300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test43_forEachVsForOfDeletionDifference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_044
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_4400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test44_setWithInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_045
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_4500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test45_negativeZeroEqualsPositiveZeroInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_047
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_4700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test47_deleteReturnsBoolean();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_048
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_4800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test48_addThenDeleteInSameIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_049
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_4900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test49_setAsMapKeyButTestSetItself();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_053
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_5300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test53_multipleIteratorsConcurrent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_054
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_5400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test54_generatorYieldAndDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_055
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_5500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test55_proxyObjectInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_056
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_5600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test56_deleteThenAddDifferentValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_057
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_5700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test57_entriesReturnsKeyValuePairWithValueTwice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_058
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_5800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test58_deleteInFinallyBlock();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_059
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_5900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test59_reflectApplyDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_060
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_6000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test60_setIteratorIsWellKnownSymbol();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_set2_061
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_6100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test61_setWithInfinityAndNegativeInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_062
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_6200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test62_setWithNullProtoObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_063
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_6300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test63_deleteDuringIterationOverFrozenEntriesArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_064
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_6400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test64_setInStrictModeFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_066
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_6600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test66_setWithGlobalThisAsElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_067
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_6700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test67_deletingSameElementFromTwoSetsIndependently();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_068
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_6800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test68_setEntriesIteratorAfterClear();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_071
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_7100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test71_setConstructedFromString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_072
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_7200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test72_setWithArrayAsElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_073
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_7300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test73_setAfterBeingUsedAsWeakSetKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_074
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_7400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test74_setWithPromiseObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_075
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_7500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test75_setInNestedClosureWithDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_076
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_7600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test76_setWithGetterOnlyPropertyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_077
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_7700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test77_setEntriesIgnoresCustomProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_078
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_7800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test78_duplicatedObjectReferences();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_079
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_7900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test79_gcSimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_080
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test80_numericStringAndNumberDistinct();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_081
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test81_crossEnvironmentCompatibility();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_082
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test82_allFalsyValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_083
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test83_stringifyDoesNotAffectSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_084
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test84_classInstanceInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_085
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test85_generatorFunctionDeletion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_086
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test86_duplicateNaNHandling();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_087
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test87_newIteratorEachTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_088
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test88_bigIntInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_089
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_8900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test89_errorAfterDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_090
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_9000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test90_wellKnownSymbolInSet();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_set2_091
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_9100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test91_setConstructedFromSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_092
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_9200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test92_nonEnumerablePropsIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_095
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_9500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test95_spreadMultipleTimes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_096
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_9600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test96_topLevelAwaitSimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_097
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_9700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test97_moduleScopeSimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_098
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_9800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test98_dynamicPropertyAccess();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_099
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_9900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test99_iteratorExhaustedAfterUse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_100
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test100_exoticObjectLikeArguments();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_101
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test101_setInSharedMemoryContext();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_102
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test102_frozenObjectInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_103
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test103_reflectDeletePropertyOnSetDoesNothing();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_104
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test104_iteratorDoesNotBacktrackAfterDeletion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_105
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test105_sandboxedEnvironmentSimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_106
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test106_errorObjectInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_107
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test107_readdSameObjectReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_108
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test108_deleteDuringConstructionNotPossibleButSimulated();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_109
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_10900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test109_domElementInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_110
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_11000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test110_nanEqualityInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_111
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_11100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test111_forInDoesNotIterateSetEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_113
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_11300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test113_wasmUnrelatedContext();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_114
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_11400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test114_intlCollatorInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_115
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_11500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test115_singleThreadConcurrencySimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_116
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_11600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test116_atomicsLikeObjectInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_117
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_11700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test117_moduleTopLevelSimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_118
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_11800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test118_performanceObserverLikeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_119
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_11900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test119_setIgnoresIndexAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set2_120
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET2_12000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set2_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = test120_maxSafeIntegerInSet();
      expect(result).assertEqual(true);
    });
  })
}



