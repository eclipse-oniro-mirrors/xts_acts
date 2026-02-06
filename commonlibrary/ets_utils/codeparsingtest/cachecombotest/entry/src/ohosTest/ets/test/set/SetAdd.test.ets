import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testAddCalledOnNonSetThrowsTypeError,
  testAddCalledWithNullOrUndefinedThisThrowsTypeError,
  testAddDuringEntriesIterationDoesNotAffectCurrentLoop,
  testAddIgnoresExtraArgumentsBeyondFirst,
  testAddInFinallyDoesNotAffectEntriesCreatedInTry,
  testAddingDuplicateDuringIterationHasNoEffectOnCount,
  testAddingFunctionToSetAndIteratingEntries,
  testAddingManyElementsDuringIterationDoesNotBreakCurrentLoop,
  testAddingNaNDuringIterationDoesNotAffectCurrentLoop,
  testAddingNestedSetAndIteratingParentEntries,
  testAddingObjectWithCustomToStringDoesNotAffectEntriesKeys,
  testAddingSameObjectReferenceDuringIteration,
  testAddingSetItselfDuringIteration,
  testAddInsideForEachDoesNotTriggerExtraIteration,
  testAddInStrictModeHasNoSideEffectsBeyondSet,
  testAddIsNotGenericAndRequiresRealSetInstance,
  testAddPersistsEvenIfIterationThrows,
  testAddReturnsThisAndEntriesWorksOnChainedResult,
  testAddReturnsThisExactlyForChaining,
  testAddSideEffectPersistsEvenIfExceptionThrownInIteration,
  testArrayBufferAsSetValueInEntriesAfterAdd,
  testArrayFromWithMapperUnaffectedByMidAdd,
  testAsyncAddDoesNotAffectSyncEntries,
  testAwaitingSetEntriesDoesNotThrowButYieldsIterator,
  testBasicDeduplicationInEntriesAfterDuplicateAdd,
  testBigIntInSetEntriesAfterAdd,
  testBreakInForOfDoesNotCorruptSetStateForSubsequentAdd,
  testChainedAddThenEntriesReflectsAllValuesInOrder,
  testChainedAddThenImmediateEntriesReflectsAllValues,
  testClassExpressionAsSetValueInEntries,
  testClearThenAddDuringIterationStillCompletesOriginal,
  testCryptoKeyLikeObjectInSetEntries,
  testDateObjectInSetMaintainsIdentityInEntries,
  testDeleteAllThenAddNewDuringIterationCompletesOriginal,
  testDeleteThenAddSameValueDuringIteration,
  testDifferentSymbolsWithSameDescriptionAreDistinctInSet,
  testDuplicatePrimitiveAddsDoNotIncreaseEntriesLength,
  testDuplicateStringLiteralsDeduplicatedInEntries,
  testEachEntriesCallReturnsNewIndependentIterator,
  testEmptySetEntriesIteratorUnaffectedByLaterAdd,
  testEntriesCalledOnNonSetThrowsTypeError,
  testEntriesCorrectAfterMultipleAdds,
  testEntriesIncludesAllElementsAddedBeforeCall,
  testEntriesIncludesInitialIterableAndLaterAdded,
  testEntriesIncludesUndefinedAfterAdd,
  testEntriesIteratorIsSnapshotAtCreationTime,
  testEntriesStructureRemainsKeyValueIdenticalAfterAdd,
  testErrorObjectInSetPreservesIdentityInEntries,
  testForAwaitOfOnEntriesThrowsButAddStillWorks,
  testFreezingSetPrototypeDoesNotPreventInstanceAdd,
  testFrozenSetAddThrowsButEntriesWorks,
  testFrozenSetAddThrowsButExistingIteratorStillWorks,
  testGeneratorFunctionAsSetValueInEntries,
  testGeneratorYieldsEntriesUnaffectedByLaterAdd,
  testGeneratorYieldsEntriesWithReferenceIntegrity,
  testGlobalThisPollutionDoesNotAffectSetEntries,
  testIndependentIterationsReflectStateAtTimeOfCall,
  testInsertionOrderPreservedAcrossMixedTypesInEntries,
  testInsertionOrderPreservedInEntriesDespiteMidAdd,
  testInsertionOrderStrictlyPreservedInEntriesAfterRapidAdd,
  testInstanceWithPrivateFieldsCanBeAddedToSet,
  testIntlObjectInSetEntriesAfterAdd,
  testIteratorNextUnaffectedByInterleavedAdd,
  testLargeIntegerPrecisionPreservedInSetEntries,
  testManualNextAfterAddDoesNotIncludeNewElement,
  testManualSerializationOfEntriesPreservesValues,
  testModifiedAddPrototypeDoesNotBreakEntriesSnapshotSemantics,
  testModuleNamespaceObjectCanBeAddedToSet,
  testMultipleEntriesReflectCurrentStateAfterAdd,
  testMultipleIteratorsIndependentEvenWhenInterleaved,
  testMultipleSetsIndependentDuringConcurrentEntriesAndAdd,
  testMultipleUndefinedAddsResultInSingleEntry,
  testNestedEntriesIterationsAreIndependent,
  testNewEntriesAfterAddIncludesNewElement,
  testNonExtensibleObjectCanBeAddedAndRetrievedViaEntries,
  testNullAndUndefinedAreDistinctInSetEntries,
  testNullPrototypeObjectInSetEntries,
  testPromiseObjectInSetMaintainsIdentityInEntries,
  testProxyAroundSetConstructorDoesNotBreakEntriesSemantics,
  testProxyObjectInSetEntriesReturnsProxyNotTarget,
  testRecursiveAddInsideSizeGetterDoesNotCauseInfiniteLoop,
  testRegExpLiteralInSetPreservesFlagsAndSource,
  testRegExpObjectInSetEntriesAfterAdd,
  testReturnedIteratorDoesNotAccessSetDataAfterReturn,
  testSameSymbolAddedMultipleTimesAppearsOnceInEntries,
  testSealedSetCanStillAddAndEntriesReflectsNewValuesAfterCall,
  testSetAddIsNotEnumerableButEntriesIsMethod,
  testSetBehaviorUnaffectedByPostMessageExistence,
  testSetCanStoreAnotherSetsEntriesIterator,
  testSetConstructedEmptyThenAddWorksFine,
  testSetConstructedFromAnotherSetThenAddNewValue,
  testSetConstructedFromStringSplitsIntoCharacters,
  testSetContainingItselfCanBeSafelyIteratedWithEntries,
  testSetEntriesFormatIsKeyValueIdenticalUnlikeMap,
  testSetEntriesFormatMatchesSpecKeyValueIdentical,
  testSetEntriesIteratorDoesNotCreateStrongReferenceCycle,
  testSetEntriesIteratorDoesNotLeakReferencesAfterConsumption,
  testSetEntriesIteratorHasCorrectPrototypeChain,
  testSetEntriesIteratorHasCorrectToStringTag,
  testSetEntriesIteratorHasStandardIteratorMethods,
  testSetEntriesIteratorIsConsumedAfterFirstUse,
  testSetEntriesIteratorToStringTagIsConsistentAcrossRealms,
  testSetEntriesUnaffectedByCustomSymbolIteratorInScope,
  testSetFromDuplicateArrayThenAddUniqueValue,
  testSetHasEntriesMethodWhileWeakSetDoesNot,
  testSetInsertionOrderIndependentOfObjectReflectionAPIs,
  testSetMethodsAreStandardAndUnmodified,
  testSetSharedAcrossModuleBoundaryMaintainsEntriesConsistency,
  testSetSizeUpdatesImmediatelyButEntriesSnapshotUnchanged,
  testSetSizeUpdatesSynchronouslyDuringAdd,
  testSetWithCrossContextLikeObjectMaintainsReference,
  testSetWithNullPrototypeCanStillUseEntriesIfMethodAccessedDirectly,
  testSetWorksEvenIfGlobalThisIsFrozen,
  testSetWorksNormallyInMainThreadEvenIfSharedArrayBufferExists,
  testSpreadEntriesSnapshotUnaffectedByLaterAdd,
  testStrictModeObjectReferencePreservedInEntries,
  testSymbolValueInEntriesAfterAdd,
  testTamperingWithSetPrototypeSizeDoesNotAffectEntries,
  testTimeoutAsyncAddDoesNotAffectSyncEntries,
  testUndefinedAndVoid0TreatedIdenticallyInSet,
  testZeroAndNegativeZeroTreatedAsSameDuringAddInIteration
} from './SetAddTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function SetCache1Test() {
  describe('SetCache1Test', () => {
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
     * @tc.name testCache_set1_001
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_0100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testAddDuringEntriesIterationDoesNotAffectCurrentLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_0200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesIteratorIsSnapshotAtCreationTime();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_set1_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_0300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleEntriesReflectCurrentStateAfterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_0400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testManualNextAfterAddDoesNotIncludeNewElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_0500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddingDuplicateDuringIterationHasNoEffectOnCount();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_006
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_0600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesStructureRemainsKeyValueIdenticalAfterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_007
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_0700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddInsideForEachDoesNotTriggerExtraIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_008
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_0800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInsertionOrderPreservedInEntriesDespiteMidAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_009
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_0900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEmptySetEntriesIteratorUnaffectedByLaterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_010
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_1000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testIndependentIterationsReflectStateAtTimeOfCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_011
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_1100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteThenAddSameValueDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_012
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_1200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesIncludesAllElementsAddedBeforeCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_1300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNestedEntriesIterationsAreIndependent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_1400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpreadEntriesSnapshotUnaffectedByLaterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_015
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_1500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNewEntriesAfterAddIncludesNewElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_1600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAsyncAddDoesNotAffectSyncEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_1700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetMethodsAreStandardAndUnmodified();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_018
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_1800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddReturnsThisAndEntriesWorksOnChainedResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesCorrectAfterMultipleAdds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_021
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddingNaNDuringIterationDoesNotAffectCurrentLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_022
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesIncludesUndefinedAfterAdd();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_set1_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddingSameObjectReferenceDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddPersistsEvenIfIterationThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_025
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testIteratorNextUnaffectedByInterleavedAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddingFunctionToSetAndIteratingEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_027
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSymbolValueInEntriesAfterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testClearThenAddDuringIterationStillCompletesOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_029
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_2900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDuplicatePrimitiveAddsDoNotIncreaseEntriesLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_030
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_3000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGeneratorYieldsEntriesUnaffectedByLaterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_031
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_3100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddingNestedSetAndIteratingParentEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_033
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_3300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFrozenSetAddThrowsButEntriesWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_035
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_3500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    //
    it('testCache_set1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddingManyElementsDuringIterationDoesNotBreakCurrentLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_036
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_3600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesFormatMatchesSpecKeyValueIdentical();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_037
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_3700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testTimeoutAsyncAddDoesNotAffectSyncEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_038
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_3800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testArrayFromWithMapperUnaffectedByMidAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_039
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_3900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesIncludesInitialIterableAndLaterAdded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_040
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_4000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInsertionOrderStrictlyPreservedInEntriesAfterRapidAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_041
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_4100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddingSetItselfDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_042
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_4200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testForAwaitOfOnEntriesThrowsButAddStillWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_043
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_4300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testModifiedAddPrototypeDoesNotBreakEntriesSnapshotSemantics();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_044
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_4400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleSetsIndependentDuringConcurrentEntriesAndAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_045
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_4500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleUndefinedAddsResultInSingleEntry();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_046
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_4600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testTamperingWithSetPrototypeSizeDoesNotAffectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_047
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_4700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRegExpObjectInSetEntriesAfterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_049
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_4900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetHasEntriesMethodWhileWeakSetDoesNot();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_050
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_5000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testStrictModeObjectReferencePreservedInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_051
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_5100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testChainedAddThenImmediateEntriesReflectsAllValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_052
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_5200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteAllThenAddNewDuringIterationCompletesOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_053
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_5300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetFromDuplicateArrayThenAddUniqueValue();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_set1_054
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_5400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesUnaffectedByCustomSymbolIteratorInScope();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_055
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_5500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNullAndUndefinedAreDistinctInSetEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_056
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_5600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGlobalThisPollutionDoesNotAffectSetEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_057
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_5700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testBigIntInSetEntriesAfterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_059
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_5900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleIteratorsIndependentEvenWhenInterleaved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_060
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_6000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesIteratorHasCorrectToStringTag();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_061
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_6100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDuplicateStringLiteralsDeduplicatedInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_062
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_6200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddingObjectWithCustomToStringDoesNotAffectEntriesKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_063
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_6300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedSetCanStillAddAndEntriesReflectsNewValuesAfterCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_065
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_6500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyObjectInSetEntriesReturnsProxyNotTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_066
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_6600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testArrayBufferAsSetValueInEntriesAfterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_067
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_6700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesIteratorIsConsumedAfterFirstUse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_068
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_6800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testZeroAndNegativeZeroTreatedAsSameDuringAddInIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_069
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_6900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetConstructedEmptyThenAddWorksFine();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_070
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testIntlObjectInSetEntriesAfterAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_071
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetAddIsNotEnumerableButEntriesIsMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_072
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testErrorObjectInSetPreservesIdentityInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_073
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNullPrototypeObjectInSetEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_074
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testLargeIntegerPrecisionPreservedInSetEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_075
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetSizeUpdatesImmediatelyButEntriesSnapshotUnchanged();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_076
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testCryptoKeyLikeObjectInSetEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_077
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesCalledOnNonSetThrowsTypeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_078
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddCalledOnNonSetThrowsTypeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_079
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_7900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGeneratorYieldsEntriesWithReferenceIntegrity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_080
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_8000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetSharedAcrossModuleBoundaryMaintainsEntriesConsistency();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_set1_081
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_8100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSameSymbolAddedMultipleTimesAppearsOnceInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_082
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_8200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDifferentSymbolsWithSameDescriptionAreDistinctInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_084
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_8400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesIteratorHasStandardIteratorMethods();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_087
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_8700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFrozenSetAddThrowsButExistingIteratorStillWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_088
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_8800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testManualSerializationOfEntriesPreservesValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_090
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_9000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDateObjectInSetMaintainsIdentityInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_091
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_9100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testUndefinedAndVoid0TreatedIdenticallyInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_094
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_9400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithCrossContextLikeObjectMaintainsReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_095
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_9500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWorksEvenIfGlobalThisIsFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_096
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_9600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInsertionOrderPreservedAcrossMixedTypesInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_097
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_9700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testChainedAddThenEntriesReflectsAllValuesInOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_098
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_9800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddSideEffectPersistsEvenIfExceptionThrownInIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_099
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_9900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetConstructedFromAnotherSetThenAddNewValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_100
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_10000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesIteratorDoesNotLeakReferencesAfterConsumption();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_101
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_10100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testBasicDeduplicationInEntriesAfterDuplicateAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_103
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_10300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesIteratorHasCorrectPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_104
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_10400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddIgnoresExtraArgumentsBeyondFirst();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_105
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_10500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetContainingItselfCanBeSafelyIteratedWithEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_106
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_10600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyAroundSetConstructorDoesNotBreakEntriesSemantics();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_107
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_10700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithNullPrototypeCanStillUseEntriesIfMethodAccessedDirectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_108
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_10800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetSizeUpdatesSynchronouslyDuringAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_110
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_11000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGeneratorFunctionAsSetValueInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_111
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_11100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEachEntriesCallReturnsNewIndependentIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_112
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_11200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAwaitingSetEntriesDoesNotThrowButYieldsIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_113
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_11300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesFormatIsKeyValueIdenticalUnlikeMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_114
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_11400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWorksNormallyInMainThreadEvenIfSharedArrayBufferExists();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_115
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_11500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddIsNotGenericAndRequiresRealSetInstance();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_set1_116
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_11600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddInFinallyDoesNotAffectEntriesCreatedInTry();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_117
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_11700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetCanStoreAnotherSetsEntriesIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_118
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_11800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFreezingSetPrototypeDoesNotPreventInstanceAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_120
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_12000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testModuleNamespaceObjectCanBeAddedToSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_121
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_12100
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReturnedIteratorDoesNotAccessSetDataAfterReturn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_122
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_12200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddInStrictModeHasNoSideEffectsBeyondSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_123
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_12300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNonExtensibleObjectCanBeAddedAndRetrievedViaEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_125
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_12500
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRecursiveAddInsideSizeGetterDoesNotCauseInfiniteLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_126
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_12600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPromiseObjectInSetMaintainsIdentityInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_127
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_12700
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testBreakInForOfDoesNotCorruptSetStateForSubsequentAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_128
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_12800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesIteratorDoesNotCreateStrongReferenceCycle();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_129
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_12900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddReturnsThisExactlyForChaining();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_130
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_13000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetConstructedFromStringSplitsIntoCharacters();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_132
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_13200
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testClassExpressionAsSetValueInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_133
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_13300
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetBehaviorUnaffectedByPostMessageExistence();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_134
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_13400
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetInsertionOrderIndependentOfObjectReflectionAPIs();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_136
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_13600
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRegExpLiteralInSetPreservesFlagsAndSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_138
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_13800
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetEntriesIteratorToStringTagIsConsistentAcrossRealms();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_139
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_13900
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddCalledWithNullOrUndefinedThisThrowsTypeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_set1_140
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_SET1_14000
     * @tc.desc Testing Cache Combo by set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_set1_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInstanceWithPrivateFieldsCanBeAddedToSet();
      expect(result).assertEqual(true);
    });
  })
}



