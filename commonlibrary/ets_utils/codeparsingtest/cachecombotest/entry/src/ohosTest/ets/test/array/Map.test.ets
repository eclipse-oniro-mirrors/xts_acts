import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testProxyGetTrapThisIsProxy,
  testProxyMapAllowsArgumentsCalleeInNonStrictMode,
  testProxyMapAllowsConsoleLogInGet,
  testProxyMapAllowsGlobalAccessInGetTrap,
  testProxyMapAllowsWithStatementInGetTrap,
  testProxyMapCallbackIsNotAffectedByProxy,
  testProxyMapCallbackThisUnaffectedByProxy,
  testProxyMapCallsCallbackOnSparseSlots,
  testProxyMapCannotBeCalledOnNullTarget,
  testProxyMapCompletesDespiteSlowGetTrap,
  testProxyMapContinuesDespiteConsoleAssertFailure,
  testProxyMapConvertsBooleanLengthToNumber,
  testProxyMapConvertsLengthObjectWithValueOf,
  testProxyMapDoesNotAccessConstructor,
  testProxyMapDoesNotAccessNegativeZeroIndex,
  testProxyMapDoesNotAwaitPromises,
  testProxyMapDoesNotCauseRecursionInNormalUse,
  testProxyMapDoesNotInvokeGetterFunctions,
  testProxyMapDoesNotInvokeToPrimitive,
  testProxyMapDoesNotTriggerHasTrap,
  testProxyMapDoesNotTriggerOwnKeysTrap,
  testProxyMapDoesNotUseSymbolIterator,
  testProxyMapDynamicModification,
  testProxyMapExecutesInOrder,
  testProxyMapFailsImmediatelyOnLengthGetterThrow,
  testProxyMapFailsOnRevokedProxy,
  testProxyMapGetTrapReceivesStringIndex,
  testProxyMapHandlesCircularReferenceSafely,
  testProxyMapHandlesCrossRealmLikeArray,
  testProxyMapHandlesCustomToStringObjects,
  testProxyMapHandlesDoubleWrappedProxy,
  testProxyMapHandlesHeterogeneousTypes,
  testProxyMapHandlesImplicitUndefinedInGet,
  testProxyMapHandlesObjectElements,
  testProxyMapHandlesStringLength,
  testProxyMapIgnoresApplyTrapForArray,
  testProxyMapIgnoresCustomSymbolIterator,
  testProxyMapIgnoresEnumerableAttribute,
  testProxyMapIgnoresErrorsOnNonIndexProperties,
  testProxyMapIgnoresLegacyNonStandardProperties,
  testProxyMapIgnoresLengthChangeDuringIteration,
  testProxyMapIgnoresMaliciousConstructor,
  testProxyMapIgnoresSymbolProperties,
  testProxyMapIgnoresUnicodeDigitIndices,
  testProxyMapIndexAndArrayArgsUnaffectedByProxy,
  testProxyMapInvalidLengthBecomesZero,
  testProxyMapLengthTrap,
  testProxyMapNestedProxies,
  testProxyMapOnGlobalObjectReturnsEmpty,
  testProxyMapParsesHexadecimalLengthString,
  testProxyMapParsesScientificNotationLength,
  testProxyMapPassesExplicitUndefined,
  testProxyMapPropagatesGetTrapError,
  testProxyMapPropagatesHandlerErrorInNestedRevocable,
  testProxyMapPropagatesNestedProxyError,
  testProxyMapPropagatesNonErrorThrow,
  testProxyMapPropagatesReferenceErrorFromGetTrap,
  testProxyMapReadsFrozenArrayLikeObject,
  testProxyMapReadsLengthGetterOnlyOnce,
  testProxyMapReadsLengthRegardlessOfWritable,
  testProxyMapReceivesUndefinedWhenGetReturnsNothing,
  testProxyMapRecursiveMap,
  testProxyMapRespectsArraySpecies,
  testProxyMapSeesDeletedIndicesAsUndefined,
  testProxyMapSeesMidIterationDeletion,
  testProxyMapShallowRecursiveIsSafe,
  testProxyMapSurvivesEvalErrorInGetTrap,
  testProxyMapThrowsOnInfiniteLength,
  testProxyMapThrowsOnMaxLengthPlusOne,
  testProxyMapTreatsBigIntLengthAsZero,
  testProxyMapTreatsDescriptorAsPlainObject,
  testProxyMapTreatsNaNLengthAsZero,
  testProxyMapTreatsNegativeLengthAsZero,
  testProxyMapTreatsNegativeLengthAsZero1,
  testProxyMapTreatsNestedProxyAsValue,
  testProxyMapTreatsStringNegativeZeroLengthAsZero,
  testProxyMapTreatsThenablesAsPlainObjects,
  testProxyMapTruncatesFloatLength,
  testProxyMapUnaffectedByPrototypeMutationDuringExecution,
  testProxyMapUnaffectedByRuntimeMapModification,
  testProxyMapUsesDynamicallyModifiedValueInGet,
  testProxyMapUsesInitialLengthOnly,
  testProxyMapUsesOriginalMapEvenIfPrototypeModified,
  testProxyMapUsesUpdatedClosureVariable,
  testProxyMapWorksOnArgumentsObject,
  testProxyMapWorksOnArrayLikeObject,
  testProxyMapWorksOnFrozenArray,
  testProxyMapWorksOnStrictModeArguments,
  testProxyMapWorksOnTypedArrayViaCall,
  testProxyMapWorksWhenGetTrapIsArrowFunction,
  testProxyMapWorksWhenPrototypeIsNull,
  testProxyMapWorksWithFrozenHandler
} from './MapTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function MapTest() {
  describe('MapTest', () => {
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
     * @tc.name testCache4_002
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_0200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapLengthTrap();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache4_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_0300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDynamicModification();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache4_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_0400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDoesNotTriggerHasTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_005
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_0500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDoesNotTriggerOwnKeysTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_006
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_0600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIgnoresLengthChangeDuringIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_008
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_0800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapPropagatesGetTrapError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_0900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDoesNotUseSymbolIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapHandlesStringLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapTreatsNegativeLengthAsZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapCallsCallbackOnSparseSlots();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapUsesInitialLengthOnly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapSeesDeletedIndicesAsUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapCallbackThisUnaffectedByProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_016
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapHandlesObjectElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapNestedProxies();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapInvalidLengthBecomesZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_1900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDoesNotAccessConstructor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapUsesDynamicallyModifiedValueInGet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDoesNotInvokeGetterFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapWorksOnArrayLikeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIndexAndArrayArgsUnaffectedByProxy();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache4_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIgnoresErrorsOnNonIndexProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_025
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapThrowsOnInfiniteLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_026
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapTreatsThenablesAsPlainObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_027
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIgnoresApplyTrapForArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapHandlesHeterogeneousTypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_2900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapWorksOnFrozenArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetTrapThisIsProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_031
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapRecursiveMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapExecutesInOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_033
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapTruncatesFloatLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapPassesExplicitUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_035
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapPropagatesNestedProxyError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIgnoresSymbolProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_037
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapReadsLengthRegardlessOfWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_038
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapHandlesCircularReferenceSafely();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_3900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapHandlesImplicitUndefinedInGet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDoesNotCauseRecursionInNormalUse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_041
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapGetTrapReceivesStringIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_042
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapUsesOriginalMapEvenIfPrototypeModified();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapCannotBeCalledOnNullTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapFailsOnRevokedProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapAllowsGlobalAccessInGetTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_046
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapReadsLengthGetterOnlyOnce();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache4_047
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDoesNotAccessNegativeZeroIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_048
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIgnoresMaliciousConstructor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_049
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_4900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapCallbackIsNotAffectedByProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_5000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapWorksWhenPrototypeIsNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_5100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapHandlesCustomToStringObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_5200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapTreatsBigIntLengthAsZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_5500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDoesNotAwaitPromises();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_5600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapAllowsConsoleLogInGet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_5700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapWorksOnArgumentsObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_5800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapPropagatesNonErrorThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapUnaffectedByRuntimeMapModification();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapThrowsOnMaxLengthPlusOne();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIgnoresUnicodeDigitIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapShallowRecursiveIsSafe();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapPropagatesHandlerErrorInNestedRevocable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapDoesNotInvokeToPrimitive();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache4_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapTreatsStringNegativeZeroLengthAsZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapReceivesUndefinedWhenGetReturnsNothing();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_068
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapUsesUpdatedClosureVariable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_6900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapWorksOnTypedArrayViaCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_7000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapConvertsLengthObjectWithValueOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_7200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapAllowsArgumentsCalleeInNonStrictMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_7300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapTreatsNaNLengthAsZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_074
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_7400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapSeesMidIterationDeletion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_075
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_7500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapOnGlobalObjectReturnsEmpty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_076
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_7600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapTreatsDescriptorAsPlainObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_077
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_7700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapParsesScientificNotationLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_078
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_7800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapAllowsWithStatementInGetTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_079
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_7900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapRespectsArraySpecies();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_8000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapCompletesDespiteSlowGetTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_8100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapWorksWithFrozenHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_082
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_8200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapHandlesDoubleWrappedProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_083
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_8300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapPropagatesReferenceErrorFromGetTrap();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache4_084
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_8400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapParsesHexadecimalLengthString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_085
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_8500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapTreatsNestedProxyAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_086
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_8600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapSurvivesEvalErrorInGetTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_088
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_8800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapUnaffectedByPrototypeMutationDuringExecution();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_089
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_8900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapFailsImmediatelyOnLengthGetterThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_090
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIgnoresLegacyNonStandardProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_091
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapWorksOnStrictModeArguments();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_092
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapTreatsNegativeLengthAsZero1();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIgnoresEnumerableAttribute();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_094
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapReadsFrozenArrayLikeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_095
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapContinuesDespiteConsoleAssertFailure();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_096
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapConvertsBooleanLengthToNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_097
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapHandlesCrossRealmLikeArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_098
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapWorksWhenGetTrapIsArrowFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache4_099
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE4_9900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache4_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapIgnoresCustomSymbolIterator();
      expect(result).assertEqual(true);
    });
  })
}