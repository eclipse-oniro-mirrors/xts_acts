import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testChainedCallsAfterProxySlice,
  testCustomErrorOnSliceInProxy,
  testCustomSliceBehaviorInProxy,
  testDeletedSlicePropertyReturnsUndefined,
  testMultipleSliceCallsAreIndependent,
  testNestedProxiesPreserveSliceBehavior,
  testProxyInterceptsSliceCorrectly,
  testProxySliceMatchesNativeBehaviorExactly,
  testProxyUsesNativeSliceDespitePrototypePollution,
  testSliceAcceptsStringIndices,
  testSliceAndConcatAreIndependent,
  testSliceAndSymbolIteratorCoexist,
  testSliceAutoDeduplicatesResult,
  testSliceBlocksSensitiveData,
  testSliceCallCountTrackedViaProxy,
  testSliceCalledWithProxyAsThis,
  testSliceCallStackCaptured,
  testSliceCallTimestampRecorded,
  testSliceCoexistsWithModernJSAPIs,
  testSliceCompliesWithECMAScriptSpec,
  testSliceConsistentInStrictAndNonStrictMode,
  testSliceDoesNotDependOnOwnKeys,
  testSliceDoesNotLeakMemoryViaClosure,
  testSliceDoesNotTriggerUnnecessaryReactivity,
  testSliceEquivalentToArrayFrom,
  testSliceHandlesInvalidArgsGracefully,
  testSliceHandlesNegativeZeroIndex,
  testSliceHandlesRecursiveArraySafely,
  testSliceHandlesTamperedLength,
  testSliceIgnoresHasTrap,
  testSliceIgnoresSymbolProperties,
  testSliceInStrictModeDoesNotMutate,
  testSliceInterceptedEvenIfNonConfigurable,
  testSliceIsLocaleIndependent,
  testSliceLazyEvaluationViaProxy,
  testSliceMaintainsStrictEqualityOfElements,
  testSliceMaxLengthEnforcedByProxy,
  testSliceNotAppliedToTypedArrayViaProxy,
  testSliceOnCustomArraySubclassPreservesConstructor,
  testSliceOnEmptyArrayReturnsEmpty,
  testSliceOnFrozenArrayViaProxy,
  testSliceOnFrozenProxyThrows,
  testSliceOnLargeArrayDoesNotCrash,
  testSliceOnLazySequenceProxy,
  testSliceOnlyAllowedFromZero,
  testSliceOnlyAllowedOnEvenIndices,
  testSliceOnlyEnabledInDevMode,
  testSliceOnProxyDoesNotMutateOriginal,
  testSliceOnRevokedProxyThrows,
  testSliceOnSealedArray,
  testSliceParamsAutoClampedByProxy,
  testSlicePreservesSparseArrayHoles,
  testSlicePreservesUnicodeCharacters,
  testSlicePreventsDoSByLimitingOutputSize,
  testSlicePropertySetToNonFunction,
  testSliceReflectsDeletedIndices,
  testSliceRejectsBigIntArguments,
  testSliceRespectsArrayGetters,
  testSliceResultDoesNotInheritProxyHandler,
  testSliceReturnsEmptyArray,
  testSliceReturnsHistoricalVersion,
  testSliceReturnsMockedValue,
  testSliceReturnsNonArrayType,
  testSliceStableUnderDeepCallStack,
  testSliceStillWorksOnFrozenProxy,
  testSliceSupportsRollbackViaSnapshot,
  testSliceThisBindingIsCorrect,
  testSliceThisFixedViaBindInHandler,
  testSliceThrottledByProxy,
  testSliceTriggersReactiveDependencyTracking,
  testSliceUsesReflectGetFallback,
  testSliceWithInfinityArguments,
  testSliceWithLoggingSideEffect,
  testSliceWithNaNIndices,
  testSliceWithNegativeIndicesInProxy,
  testSliceWithoutArgsReturnsShallowCopy,
  testSliceWithProxyElements,
  testSliceWorksDespiteGlobalWindowPollution,
  testSliceWorksInIsolatedContextSimulation,
  testSliceWorksOnArgumentsObject,
  testSliceWorksOnArrayLikeViaProxy,
  testSliceWorksOnDOMNodeListLikeObject,
  testSliceWorksOnFileListLikeObject
} from './SliceTest';

export default function SliceTest() {
  describe('SliceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.name testCache5_001
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_0100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyInterceptsSliceCorrectly();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_002
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_0200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCustomSliceBehaviorInProxy();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache5_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_0300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnProxyDoesNotMutateOriginal();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache5_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_0400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWithNegativeIndicesInProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_005
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_0500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWithoutArgsReturnsShallowCopy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_006
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_0600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMultipleSliceCallsAreIndependent();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_007
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_0700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceCallCountTrackedViaProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_008
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_0800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeletedSlicePropertyReturnsUndefined();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_0900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCustomErrorOnSliceInProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceReturnsMockedValue();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceReturnsEmptyArray();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceThisBindingIsCorrect();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnEmptyArrayReturnsEmpty();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceParamsAutoClampedByProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSlicePreservesSparseArrayHoles();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_016
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceUsesReflectGetFallback();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceInStrictModeDoesNotMutate();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceReturnsNonArrayType();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_1900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceHandlesInvalidArgsGracefully();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySliceMatchesNativeBehaviorExactly();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyUsesNativeSliceDespitePrototypePollution();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache5_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnFrozenArrayViaProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNestedProxiesPreserveSliceBehavior();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceMaxLengthEnforcedByProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_025
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceCallTimestampRecorded();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_026
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceBlocksSensitiveData();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_027
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceRespectsArrayGetters();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceAutoDeduplicatesResult();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_2900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceThisFixedViaBindInHandler();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_3000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceLazyEvaluationViaProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_031
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_3100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceAndSymbolIteratorCoexist();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_3200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWithLoggingSideEffect();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_033
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_3300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWorksInIsolatedContextSimulation();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_3400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnlyAllowedFromZero();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_3600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWorksOnArrayLikeViaProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_3900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceInterceptedEvenIfNonConfigurable();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_4000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testChainedCallsAfterProxySlice();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_041
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_4100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnLargeArrayDoesNotCrash();
      expect(result).assertEqual(true)
    });
    /**
     * @tc.name testCache5_042
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_4200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceIgnoresSymbolProperties();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_4300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceThrottledByProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_4400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnRevokedProxyThrows();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_046
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_4600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWorksOnArgumentsObject();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_048
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_4800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceHandlesTamperedLength();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_5000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceNotAppliedToTypedArrayViaProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_5100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceIsLocaleIndependent();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_5200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceHandlesRecursiveArraySafely();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_053
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_5300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceCallStackCaptured();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_5400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceConsistentInStrictAndNonStrictMode();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_5500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWithProxyElements();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_5600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSlicePropertySetToNonFunction();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_5700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceDoesNotLeakMemoryViaClosure();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_5800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWorksDespiteGlobalWindowPollution();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_6000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceEquivalentToArrayFrom();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_6200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceIgnoresHasTrap();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_6300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnlyAllowedOnEvenIndices();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_6400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceDoesNotDependOnOwnKeys();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_6600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnSealedArray();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_6700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceTriggersReactiveDependencyTracking();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_068
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_6800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceResultDoesNotInheritProxyHandler();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_7000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceStableUnderDeepCallStack();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_071
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_7100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceDoesNotTriggerUnnecessaryReactivity();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_7200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWithNaNIndices();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_7300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnLazySequenceProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_074
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_7400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceReflectsDeletedIndices();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_076
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_7600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceAndConcatAreIndependent();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_077
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_7700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceReturnsHistoricalVersion();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_078
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_7800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceCalledWithProxyAsThis();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_079
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_7900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSlicePreventsDoSByLimitingOutputSize();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_8000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceCompliesWithECMAScriptSpec();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_8100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceHandlesNegativeZeroIndex();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_082
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_8200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceRejectsBigIntArguments();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_083
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_8300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnCustomArraySubclassPreservesConstructor();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_085
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_8500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWorksOnDOMNodeListLikeObject();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_086
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_8600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceSupportsRollbackViaSnapshot();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_087
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_8700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWithInfinityArguments();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_089
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_8900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceAcceptsStringIndices();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_091
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_9100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceCoexistsWithModernJSAPIs();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_9300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSlicePreservesUnicodeCharacters();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_094
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_9400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnlyEnabledInDevMode();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_095
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_9500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceOnFrozenProxyThrows();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_096
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_9600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceStillWorksOnFrozenProxy();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_097
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_9700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceWorksOnFileListLikeObject();
      expect(result).assertEqual(true)
    });

    /**
     * @tc.name testCache5_100
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE5_10000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache5_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSliceMaintainsStrictEqualityOfElements();
      expect(result).assertEqual(true)
    });

  })
}