import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testAddingOwnPropertyToMapDoesNotPolluteEntries,
  testArrayFromEntriesReflectsLatestSetState,
  testAsyncAwaitDoesNotBreakMapEntriesAndSet,
  testBooleanKeysAreDistinctAndNotCoerced,
  testBreakInForOfThenSetLeavesMapConsistent,
  testCircularReferenceAsValueDoesNotBreakEntries,
  testClearThenSetDuringEntriesStopsIteration,
  testClearThenSetDuringIterationDoesNotYieldNewItem,
  testConsoleLogHasNoSideEffectOnMap,
  testCustomInspectSymbolDoesNotAffectMapLogic,
  testCustomIterableObjectAsKeyUsesReferenceNotIterator,
  testCustomToStringDoesNotAffectMapKeyEquality,
  testDateObjectsAsKeysComparedByReference,
  testDeepChainedSetCallsWork,
  testDeleteBigIntKey,
  testDeleteFunctionAsKey,
  testDeleteFutureKeyDuringIterationSkipsIt,
  testDeleteInLargeMapIteration,
  testDeleteOnFrozenMapObject,
  testDeletePersistsAfterThrowInLoop,
  testDeleteRegExpAsKey,
  testDeleteSymbolKeyDuringIteration,
  testDeleteThenClearDuringIteration,
  testDeleteUnaffectedByExternalWeakMap,
  testDeleteWithNestedMapValue,
  testDeleteWithUndefinedValue,
  testDeleteWorksDespitePrototypePollution,
  testDeleteZeroStringVsNumberKey,
  testDestructureEntryThenDelete,
  testDoubleDeleteSameKeyInLoop,
  testEmptyStringAsKeyIsAllowed,
  testEntriesCanBeManuallySerializedAndRestored,
  testEntriesIteratorCannotBeReusedAfterCompletion,
  testEntriesIteratorConformsToIteratorProtocol,
  testEntriesIteratorUnaffectedByCompleteMapReplacement,
  testEntriesOnEmptyMapReturnsDoneImmediately,
  testEntriesOrderMatchesConstructorIterableOrder,
  testEntriesOrderPreservedDespiteSetUpdates,
  testEntriesToArrayThenDeleteDoesNotAffectLoop,
  testEntriesUnaffectedByArrayPrototypePollution,
  testErrorObjectAsKeyStoredByReference,
  testExceptionInIterationDoesNotCorruptMapForLaterSet,
  testExhaustedIteratorDoesNotIncludeLaterSetValues,
  testForAwaitOfOnMapEntriesShouldNotWork,
  testFreezingMapObjectDoesNotPreventSet,
  testFunctionAsKeyStoredByReference,
  testGeneratorYieldingEntriesIsolatedFromExternalSet,
  testGetOrHasCallsDoNotAffectEntriesOrder,
  testGlobalSymbolAsKeyWorksInEntries,
  testInterleavedTwoManualIteratorsWithDelete,
  testIntlFormattedStringAsKeyWorks,
  testLargeMapEntriesIterationWorks,
  testManualIteratorNextAfterSetDoesNotIncludeNewEntry,
  testManualNextWithInterleavedSetSkipsNewKeys,
  testMapBehaviorConformsToECMAScriptStandard,
  testMapBehaviorIsCrossEngineConsistent,
  testMapBehaviorIsDeterministicAcrossRuns,
  testMapBehaviorUnaffectedByTypeSystemErasures,
  testMapEntriesCompatibleWithJSONSchemaArrayFormat,
  testMapEntriesEnableStructuralSharingPattern,
  testMapEntriesFormValidStructuredCloneInput,
  testMapEntriesIterableCanBePassedToOtherFunctions,
  testMapEntriesNotAccessibleViaForInLoop,
  testMapEntriesStructureDiffersFromSetEntries,
  testMapFeatureDetectionIndicatesStandardCompliance,
  testMapHasCorrectToStringTagForDevTools,
  testMapHasEntriesWhileWeakMapDoesNot,
  testMapHoldsStrongReferencesPreventingGarbageCollection,
  testMapInstanceRecognizedAcrossRealmsViaConstructor,
  testMapMustBeConstructedWithNewKeyword,
  testMapRecoversAfterExceptionInIteration,
  testMapRemainsThreadLocalEvenWithSharedMemoryAssumption,
  testMapSetReturnsThisForChainingInStrictMode,
  testMapSizeUpdatesCorrectlyDuringEntriesAndSet,
  testMapSizeUpdatesCorrectlyOnNewVsExistingKeys,
  testMapSmallOperationsReliableUnderResourceConstraints,
  testMapSnapshotAndRestoreViaDeepCloneOfEntries,
  testMapSupportsProtoStringAsKeyUnlikePlainObjects,
  testMapToStringDoesNotInterfereWithEntries,
  testMapUnaffectedByWithStatement,
  testMapWorksConsistentlyInStrictModeContext,
  testMapWorksUnderStrictCSPAssumption,
  testMapWorksWhenGlobalObjectIsFrozen,
  testMessagePortLikeObjectAsKeyByReference,
  testModifyingDestructuredEntryDoesNotAffectMap,
  testMultipleEntriesCallsReturnIndependentFreshIterators,
  testMultipleEntriesReturnIndependentIterators,
  testMultipleNaNKeysCollapseToOneEntry,
  testMultipleSetSameKeyDuringIterationLastValueWinsLater,
  testNestedEntriesLoopWithInnerSetDoesNotAffectOuterCount,
  testNestedMapAsValueIsAccessibleInEntries,
  testNewEntriesIteratorDuringLoop,
  testPromiseAsKeyStoredByReference,
  testReassigningMapVariableDoesNotAffectCurrentIteration,
  testReflectSetDoesNotAffectMapInternals,
  testRegExpAsKeyStoredByReference,
  testRepeatedSetAndEntriesDoesNotCorruptState,
  testSealedObjectAsKeyPreservesIdentity,
  testSetDuringEntriesIterationDoesNotAffectCurrentLoop,
  testSetExistingKeyDuringIterationDoesNotChangeSize,
  testSetFrozenObjectAsValueIsReadableInEntries,
  testSetInAsyncCallbackVisibleInLaterEntries,
  testSetInForEachDoesNotTriggerExtraCallback,
  testSetKeyToUndefinedInIterationWorks,
  testSetManyItemsDuringIterationStillCorrect,
  testSetNegativeZeroAndPositiveZeroTreatedAsSameKey,
  testSetNullValueInIterationHandledCorrectly,
  testSetReturnsThisAndDoesNotBreakIteration,
  testSetSameObjectKeyMultipleTimesAppearsOnceInEntries,
  testSetSameObjectReferencePreservedInEntries,
  testSetThenDeleteSameKeyDuringIterationLeavesMapWithoutIt,
  testSetUndefinedKeyAndValueIsAllowed,
  testSetUnvisitedKeyDuringIterationReflectsNewValue,
  testSetUpdatesValueVisibleInSubsequentEntriesIteration,
  testSetWithBigIntKeyWorksInEntries,
  testSetWithEmojiKeyWorksInEntries,
  testSetWithMaxValueAsKeyWorks,
  testSetWithMinValueAsKeyWorks,
  testSetWithNaNKeyWorksInEntries,
  testSetWithNonLatinUnicodeKeysWorks,
  testSetWithObjectKeyPreservesIdentityInEntries,
  testSetWithSymbolKeyWorksInEntries,
  testSharedMapInstanceReflectsUpdatesAcrossSimulatedModules,
  testSpreadEntriesIntoArrayWorksCorrectly,
  testUniqueSymbolAsKeyIsReferenceBased,
  testUpdatingExistingValueDuringIterationReflectsInEntries
} from './MapSetTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function MapCache2Test() {
  describe('MapCache2Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name testCache_map2_001
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_0100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetDuringEntriesIterationDoesNotAffectCurrentLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_0200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testManualIteratorNextAfterSetDoesNotIncludeNewEntry();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map2_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_0300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testUpdatingExistingValueDuringIterationReflectsInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_0400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetInForEachDoesNotTriggerExtraCallback();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_0500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleEntriesReturnIndependentIterators();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_007
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_0700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetUpdatesValueVisibleInSubsequentEntriesIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_008
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_0800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testClearThenSetDuringEntriesStopsIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_009
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_0900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetUnvisitedKeyDuringIterationReflectsNewValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_010
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testManualNextWithInterleavedSetSkipsNewKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_011
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetReturnsThisAndDoesNotBreakIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_012
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNestedEntriesLoopWithInnerSetDoesNotAffectOuterCount();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesOrderPreservedDespiteSetUpdates();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGeneratorYieldingEntriesIsolatedFromExternalSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_015
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithNaNKeyWorksInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithObjectKeyPreservesIdentityInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleSetSameKeyDuringIterationLastValueWinsLater();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_018
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapSizeUpdatesCorrectlyDuringEntriesAndSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_019
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_1900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetExistingKeyDuringIterationDoesNotChangeSize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesIteratorUnaffectedByCompleteMapReplacement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_021
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetKeyToUndefinedInIterationWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_022
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetNullValueInIterationHandledCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await testAsyncAwaitDoesNotBreakMapEntriesAndSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await testAsyncAwaitDoesNotBreakMapEntriesAndSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_025
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesIteratorConformsToIteratorProtocol();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map2_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testBreakInForOfThenSetLeavesMapConsistent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_027
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testExhaustedIteratorDoesNotIncludeLaterSetValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithSymbolKeyWorksInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_029
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_2900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetSameObjectReferencePreservedInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_030
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_3000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesOrderMatchesConstructorIterableOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_032
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_3200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesOnEmptyMapReturnsDoneImmediately();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_033
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_3300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testExceptionInIterationDoesNotCorruptMapForLaterSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_034
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_3400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeepChainedSetCallsWork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_035
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_3500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapBehaviorIsDeterministicAcrossRuns();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_036
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_3600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesIteratorCannotBeReusedAfterCompletion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_037
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_3700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReassigningMapVariableDoesNotAffectCurrentIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_038
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_3800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetNegativeZeroAndPositiveZeroTreatedAsSameKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_039
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_3900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetManyItemsDuringIterationStillCorrect();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_040
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_4000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testArrayFromEntriesReflectsLatestSetState();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_041
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_4100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithBigIntKeyWorksInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_042
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_4200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetFrozenObjectAsValueIsReadableInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_043
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_4300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedObjectAsKeyPreservesIdentity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_044
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_4400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapWorksConsistentlyInStrictModeContext();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_045
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_4500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesCanBeManuallySerializedAndRestored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_047
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_4700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapUnaffectedByWithStatement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_048
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_4800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesUnaffectedByArrayPrototypePollution();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_049
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_4900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testModifyingDestructuredEntryDoesNotAffectMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_050
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_5000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetSameObjectKeyMultipleTimesAppearsOnceInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_051
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_5100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOrHasCallsDoNotAffectEntriesOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_052
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_5200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapEntriesFormValidStructuredCloneInput();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map2_053
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_5300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapHasEntriesWhileWeakMapDoesNot();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_054
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_5400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCircularReferenceAsValueDoesNotBreakEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_055
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_5500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetUndefinedKeyAndValueIsAllowed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_057
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_5700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapBehaviorConformsToECMAScriptStandard();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_058
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_5800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetInAsyncCallbackVisibleInLaterEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_059
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_5900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapSizeUpdatesCorrectlyOnNewVsExistingKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_060
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_6000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleEntriesCallsReturnIndependentFreshIterators();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_061
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_6100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithEmojiKeyWorksInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_062
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_6200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithNonLatinUnicodeKeysWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_063
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_6300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithMaxValueAsKeyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_064
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_6400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetWithMinValueAsKeyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_065
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_6500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testCustomToStringDoesNotAffectMapKeyEquality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_066
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_6600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteFutureKeyDuringIterationSkipsIt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_067
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_6700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testClearThenSetDuringIterationDoesNotYieldNewItem();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_068
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_6800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapEntriesStructureDiffersFromSetEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_070
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSharedMapInstanceReflectsUpdatesAcrossSimulatedModules();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_071
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetThenDeleteSameKeyDuringIterationLeavesMapWithoutIt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_072
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEmptyStringAsKeyIsAllowed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_073
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testBooleanKeysAreDistinctAndNotCoerced();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_074
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRepeatedSetAndEntriesDoesNotCorruptState();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_075
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpreadEntriesIntoArrayWorksCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_076
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFreezingMapObjectDoesNotPreventSet();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map2_077
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDateObjectsAsKeysComparedByReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_078
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRegExpAsKeyStoredByReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_079
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_7900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapBehaviorUnaffectedByTypeSystemErasures();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_080
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_8000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapInstanceRecognizedAcrossRealmsViaConstructor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_081
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_8100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testLargeMapEntriesIterationWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_082
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_8200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapWorksUnderStrictCSPAssumption();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_083
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_8300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapWorksWhenGlobalObjectIsFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_087
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_8700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapRecoversAfterExceptionInIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_088
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_8800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testIntlFormattedStringAsKeyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_089
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_8900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testCustomIterableObjectAsKeyUsesReferenceNotIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_090
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_9000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapToStringDoesNotInterfereWithEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_091
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_9100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConsoleLogHasNoSideEffectOnMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_092
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_9200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNestedMapAsValueIsAccessibleInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_093
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_9300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFunctionAsKeyStoredByReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_094
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_9400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapSmallOperationsReliableUnderResourceConstraints();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_095
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_9500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapSupportsProtoStringAsKeyUnlikePlainObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_096
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_9600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleNaNKeysCollapseToOneEntry();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_097
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_9700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapFeatureDetectionIndicatesStandardCompliance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_099
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_9900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMessagePortLikeObjectAsKeyByReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_100
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_10000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapBehaviorIsCrossEngineConsistent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_101
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_10100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGlobalSymbolAsKeyWorksInEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_102
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_10200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testUniqueSymbolAsKeyIsReferenceBased();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map2_103
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_10300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectSetDoesNotAffectMapInternals();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_104
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_10400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testAddingOwnPropertyToMapDoesNotPolluteEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_108
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_10800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapSnapshotAndRestoreViaDeepCloneOfEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_109
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_10900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapEntriesEnableStructuralSharingPattern();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_110
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapRemainsThreadLocalEvenWithSharedMemoryAssumption();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_111
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapEntriesCompatibleWithJSONSchemaArrayFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_112
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapMustBeConstructedWithNewKeyword();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_113
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapEntriesNotAccessibleViaForInLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_114
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testCustomInspectSymbolDoesNotAffectMapLogic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_115
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testErrorObjectAsKeyStoredByReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_116
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPromiseAsKeyStoredByReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_117
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapSetReturnsThisForChainingInStrictMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_118
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapHoldsStrongReferencesPreventingGarbageCollection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_119
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_11900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapEntriesIterableCanBePassedToOtherFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_120
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_12000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMapHasCorrectToStringTagForDevTools();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_121
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_12100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNewEntriesIteratorDuringLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_123
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_12300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteWithUndefinedValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_124
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_12400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteSymbolKeyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_125
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_12500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDoubleDeleteSameKeyInLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_126
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_12600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteUnaffectedByExternalWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_127
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_12700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteFunctionAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_128
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_12800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEntriesToArrayThenDeleteDoesNotAffectLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_129
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_12900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteThenClearDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_130
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteZeroStringVsNumberKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_131
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteWorksDespitePrototypePollution();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_132
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteWithNestedMapValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_133
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testForAwaitOfOnMapEntriesShouldNotWork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_134
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteRegExpAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_135
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteInLargeMapIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_136
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDestructureEntryThenDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_137
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteOnFrozenMapObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_138
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteBigIntKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_139
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_13900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeletePersistsAfterThrowInLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map2_140
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP2_14000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map2_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInterleavedTwoManualIteratorsWithDelete();
      expect(result).assertEqual(true);
    });
  })
}



