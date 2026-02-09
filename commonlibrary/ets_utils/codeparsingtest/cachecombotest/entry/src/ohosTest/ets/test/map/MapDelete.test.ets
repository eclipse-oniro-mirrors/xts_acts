import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testAccessSizeAfterDeleteInIteration,
  testArrayFromEntriesWithFilterAndDelete,
  testDeleteAbortControllerAsKey,
  testDeleteAllRemainingDuringIteration,
  testDeleteArgumentsObjectAsKey,
  testDeleteArrowFunctionAsKey,
  testDeleteAsyncFunctionAsKey,
  testDeleteAtomicsAsKey,
  testDeleteBeforeAndAfterJSONRoundTrip,
  testDeleteBigIntKey,
  testDeleteBlobAsKey,
  testDeleteBufferAsKey,
  testDeleteCanvasDataURLAsKey,
  testDeleteClassExpressionAsKey,
  testDeleteClassInstanceAsKey,
  testDeleteConsoleAsKey,
  testDeleteCrossRealmMap,
  testDeleteCryptoKeyAsKey,
  testDeleteCSSStyleSheetAsKey,
  testDeleteCurrentDuringEntriesIteration,
  testDeleteCurrentThenBreak,
  testDeleteCustomElementAsKey,
  testDeleteDataViewAsKey,
  testDeleteDateObjectAsKey,
  testDeleteDateObjectWhoseTimeChanges,
  testDeleteDOMElementAsKey,
  testDeleteErrorObjectAsKey,
  testDeleteEventTargetAsKey,
  testDeleteFrozenObjectAsKey,
  testDeleteFunctionAsKey,
  testDeleteFutureEntryDuringIteration,
  testDeleteGeneratorFunctionAsKey,
  testDeleteGlobalObjectAsKey,
  testDeleteGlobalSymbolAsKey,
  testDeleteImportNamespaceAsKey,
  testDeleteInLargeMapIteration,
  testDeleteInLRUCacheSimulation,
  testDeleteInMicrotaskDuringSynchronousIteration,
  testDeleteInsideWithStatement,
  testDeleteInStrictModeFunction,
  testDeleteIntersectionObserverAsKey,
  testDeleteIntlObjectAsKey,
  testDeleteInWorkerLikeContext,
  testDeleteJSONAsKey,
  testDeleteKeySharedAcrossMaps,
  testDeleteKeyThatIsAlsoInWeakMap,
  testDeleteKeyThatIsOnlyReferencedByMap,
  testDeleteMapAsItsOwnKey,
  testDeleteMathAsKey,
  testDeleteMessagePortAsKey,
  testDeleteMultiLayerProxyAsKey,
  testDeleteMutationObserverAsKey,
  testDeleteNaNKeyDuringIteration,
  testDeleteNegativeZeroKey,
  testDeleteNestedMapAsValue,
  testDeleteNonExistentKeyDuringIteration,
  testDeleteObjectInWeakSetAsKey,
  testDeleteObjectKeyDuringIteration,
  testDeleteObjectWithSideEffectGetterAsKey,
  testDeleteOnAssignedObject,
  testDeleteOnCreateWithDescriptors,
  testDeleteOnCustomMapSubclass,
  testDeleteOnFrozenMapObject,
  testDeleteOnMapFromGenerator,
  testDeleteOnMapInPrototypeChain,
  testDeleteOnNullPrototypeObject,
  testDeleteOnObjectWithBatchDefinedProps,
  testDeleteOnObjectWithNonConfigurableKey,
  testDeleteOnProxyAsConstructor,
  testDeleteOnProxyWithTrappedDefineProperty,
  testDeleteOnProxyWithTrappedDeleteProperty,
  testDeleteOnProxyWithTrappedDescriptor,
  testDeleteOnProxyWithTrappedGetProto,
  testDeleteOnProxyWithTrappedHas,
  testDeleteOnProxyWithTrappedIsExtensible,
  testDeleteOnProxyWithTrappedOwnKeys,
  testDeleteOnProxyWithTrappedPreventExtensions,
  testDeleteOnProxyWithTrappedSet,
  testDeleteOnProxyWithTrappedSetProto,
  testDeleteOnSealedMapObject,
  testDeleteOnSetPrototypeOfObject,
  testDeletePastEntryDuringIteration,
  testDeletePerformanceObserverAsKey,
  testDeletePersistsAfterThrowInLoop,
  testDeletePersistsThroughFinallyBlock,
  testDeletePrevAndNextDuringIteration,
  testDeletePreventedExtensionObjectAsKey,
  testDeleteProtoStringAsKey,
  testDeleteProxyAppliedFunctionAsKey,
  testDeleteProxyAsKey,
  testDeleteRAFHandleAsKey,
  testDeleteRecursiveProxySelfAsKey,
  testDeleteRecursiveStructureAsKey,
  testDeleteReflectAsKey,
  testDeleteRegExpAsKey,
  testDeleteResizeObserverAsKey,
  testDeleteSetAsKey,
  testDeleteSharedArrayBufferAsKey,
  testDeleteSimulatedSetDuringIteration,
  testDeleteSparseArrayAsKey,
  testDeleteSpyDuringIteration,
  testDeleteStringAndNumberKeysThatLookEqual,
  testDeleteSymbolKeyDuringIteration,
  testDeleteTextEncoderAsKey,
  testDeleteThenClearDuringIteration,
  testDeleteTimestampObjectAsKey,
  testDeleteTypedArrayAsKey,
  testDeleteUnaffectedByExternalWeakMap,
  testDeleteUnaffectedByJSONStringify,
  testDeleteURLObjectAsKey,
  testDeleteViaExternalFunctionDuringIteration,
  testDeleteViaExternalProcessingFunction,
  testDeleteViaExternalReferenceDuringIteration,
  testDeleteViaReflectApplyDuringIteration,
  testDeleteWasmMemoryAsKey,
  testDeleteWebAssemblyInstanceAsKey,
  testDeleteWhilePrototypeSizeIsOverridden,
  testDeleteWhileWeakRefExists,
  testDeleteWithImmutableIteratorAssertion,
  testDeleteWithManualIteratorCapture,
  testDeleteWithNestedMapValue,
  testDeleteWithNullProtoObjectKey,
  testDeleteWithPromiseValue,
  testDeleteWithPropertyGetterSetterKey,
  testDeleteWithUndefinedValue,
  testDeleteWithWeakMapAssociation,
  testDeleteWorksDespitePrototypePollution,
  testDeleteZeroStringVsNumberKey,
  testDestructureEntriesToMultipleVarsThenDelete,
  testDestructureEntryThenDelete,
  testDestructuringThenDelete,
  testDoubleDeleteSameKeyInLoop,
  testEmptyMapEntriesDelete,
  testEntriesToArrayThenDeleteDoesNotAffectLoop,
  testFinalComprehensiveDeleteIteration,
  testFinalObjectMethodConsistencyDuringDelete,
  testForAwaitOfOnMapEntriesShouldNotWork,
  testForInOnMapEntriesDoesNothing,
  testHasAfterDeleteInIteration,
  testInterleavedMultipleEntriesCallsWithDelete,
  testInterleavedTwoManualIteratorsWithDelete,
  testIteratorDoneAfterDeleteLastItem,
  testManualIteratorWithDelete,
  testManualWhileLoopWithBulkDelete,
  testNestedIterationWithDelete,
  testNewEntriesIteratorDuringLoop,
  testRepeatedDeleteCurrentKey,
  testSpreadEntriesThenDeleteDoesNotSkip,
  testUltimateBoundaryDeleteIteration
} from './MapDeleteTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function MapCache1Test() {
  describe('MapCache1Test', () => {
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
     * @tc.name testCache_map1_001
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_0100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteCurrentDuringEntriesIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_0200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteFutureEntryDuringIteration();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map1_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_0300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeletePastEntryDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_0400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEmptyMapEntriesDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_0500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteNonExistentKeyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_006
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_0600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRepeatedDeleteCurrentKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_007
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_0700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteViaExternalReferenceDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_008
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_0800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteAllRemainingDuringIteration();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache_map1_010
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_1000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeletePrevAndNextDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_011
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_1100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteCurrentThenBreak();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_012
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_1200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDestructuringThenDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_1300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testAccessSizeAfterDeleteInIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_1400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHasAfterDeleteInIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_1600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testManualIteratorWithDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_1700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteObjectKeyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_018
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_1800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteNaNKeyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_019
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_1900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteNegativeZeroKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_2000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNestedIterationWithDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_021
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_2100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNewEntriesIteratorDuringLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_2300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWithUndefinedValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_2400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteSymbolKeyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_025
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_2500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDoubleDeleteSameKeyInLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_2600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteUnaffectedByExternalWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_027
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_2700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteFunctionAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_2800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEntriesToArrayThenDeleteDoesNotAffectLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_029
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_2900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteThenClearDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_030
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteZeroStringVsNumberKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_031
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWorksDespitePrototypePollution();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_032
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWithNestedMapValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_033
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testForAwaitOfOnMapEntriesShouldNotWork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_034
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteRegExpAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_035
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteInLargeMapIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_036
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDestructureEntryThenDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_037
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnFrozenMapObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_038
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteBigIntKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_039
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_3900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeletePersistsAfterThrowInLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_040
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_4000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInterleavedTwoManualIteratorsWithDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_042
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_4200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnCustomMapSubclass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_043
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_4300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteDOMElementAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_044
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_4400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteKeySharedAcrossMaps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_045
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_4500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSpreadEntriesThenDeleteDoesNotSkip();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_046
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_4600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWithPromiseValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_047
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_4700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWithNullProtoObjectKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_048
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_4800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testIteratorDoneAfterDeleteLastItem();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_049
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_4900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteDateObjectAsKey();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map1_050
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testManualWhileLoopWithBulkDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_051
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteUnaffectedByJSONStringify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_052
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteErrorObjectAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_053
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteKeyThatIsOnlyReferencedByMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_054
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayFromEntriesWithFilterAndDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_055
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testForInOnMapEntriesDoesNothing();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_056
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteGlobalObjectAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_057
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteCrossRealmMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_058
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteArgumentsObjectAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_059
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_5900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteSpyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_060
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_6000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteInStrictModeFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_061
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_6100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteMapAsItsOwnKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_062
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_6200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWhilePrototypeSizeIsOverridden();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_063
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_6300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInterleavedMultipleEntriesCallsWithDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_064
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_6400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteFrozenObjectAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_066
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_6600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteProtoStringAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_067
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_6700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteInMicrotaskDuringSynchronousIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_068
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_6800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteStringAndNumberKeysThatLookEqual();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_069
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_6900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnSealedMapObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_070
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_7000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteViaReflectApplyDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_071
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_7100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteIntlObjectAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_072
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_7200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDestructureEntriesToMultipleVarsThenDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_073
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_7300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnMapFromGenerator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_074
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_7400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWebAssemblyInstanceAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_075
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_7500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeletePersistsThroughFinallyBlock();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map1_076
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_7600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteConsoleAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_078
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_7800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteAtomicsAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_079
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_7900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteInsideWithStatement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_080
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteViaExternalFunctionDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_081
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWhileWeakRefExists();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_082
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteURLObjectAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_083
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteBufferAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_084
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteNestedMapAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_085
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteSetAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_086
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteViaExternalProcessingFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_087
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnMapInPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_088
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteTimestampObjectAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_089
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_8900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteSimulatedSetDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_090
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_9000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await testDeleteCryptoKeyAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_091
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_9100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteWithManualIteratorCapture();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_092
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_9200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteClassInstanceAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_093
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_9300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteBeforeAndAfterJSONRoundTrip();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_095
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_9500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteBlobAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_096
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_9600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWithWeakMapAssociation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_098
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_9800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteProxyAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_099
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_9900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteRecursiveStructureAsKey();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map1_100
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFinalComprehensiveDeleteIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_101
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteInWorkerLikeContext();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_102
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWithPropertyGetterSetterKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_103
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteSparseArrayAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_104
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteTypedArrayAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_105
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteDataViewAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_106
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteSharedArrayBufferAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_107
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteTextEncoderAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_108
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeletePerformanceObserverAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_109
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_10900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteResizeObserverAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_110
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteIntersectionObserverAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_111
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteMutationObserverAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_112
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteAbortControllerAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_113
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteRAFHandleAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_114
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteCustomElementAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_115
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteEventTargetAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_116
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteMessagePortAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_117
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteCanvasDataURLAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_118
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteCSSStyleSheetAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_119
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_11900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteWasmMemoryAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_120
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_12000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteWithImmutableIteratorAssertion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_121
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_12100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteInLRUCacheSimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_122
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_12200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteRecursiveProxySelfAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_124
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_12400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteMultiLayerProxyAsKey();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map1_125
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_12500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteGlobalSymbolAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_126
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_12600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteKeyThatIsAlsoInWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_127
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_12700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeletePreventedExtensionObjectAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_128
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_12800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteObjectWithSideEffectGetterAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_129
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_12900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteDateObjectWhoseTimeChanges();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_130
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteMathAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_131
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteJSONAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_132
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteReflectAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_133
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteGeneratorFunctionAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_134
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteAsyncFunctionAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_135
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteArrowFunctionAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_136
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteClassExpressionAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_137
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteImportNamespaceAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_138
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteProxyAppliedFunctionAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_139
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_13900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteObjectInWeakSetAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_140
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_14000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testUltimateBoundaryDeleteIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_141
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_14100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnObjectWithNonConfigurableKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_142
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_14200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnObjectWithBatchDefinedProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_145
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_14500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnNullPrototypeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_146
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_14600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnSetPrototypeOfObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_147
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_14700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnAssignedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_148
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_14800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnCreateWithDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_149
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_14900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedHas();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_150
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_151
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15100
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedOwnKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_152
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15200
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedSetProto();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_map1_153
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15300
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedIsExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_154
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15400
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedPreventExtensions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_155
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15500
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedDeleteProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_156
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15600
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedDefineProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_157
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15700
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedGetProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_158
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15800
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyWithTrappedSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_159
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_15900
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeleteOnProxyAsConstructor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_map1_160
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_MAP1_16000
     * @tc.desc Testing Cache Combo by map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_map1_160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFinalObjectMethodConsistencyDuringDelete();
      expect(result).assertEqual(true);
    });

  })
}



