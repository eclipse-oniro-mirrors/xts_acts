import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testAccessingCopyWithinViaSymbol,
  testApplyTrapIgnoredForMethodCall,
  testApplyTrapNotInvoked,
  testArrayLikeWithManuallyAddedCopyWithin,
  testBigIntArgsThrowTypeError,
  testBlockingCopyWithinAccess,
  testBooleanArgsConvertedInCopyWithin,
  testBoundCopyWithinCalledOnProxy,
  testCachedCopyWithinMethodWorks,
  testConstructTrapNotInvoked,
  testCopyWithinArgsNotProxied,
  testCopyWithinBeyondMaxSafeIntegerIgnored,
  testCopyWithinCalledWithNonObjectThisOnProxy,
  testCopyWithinCallLoggingViaProxy,
  testCopyWithinDoesNotReadOutOfBounds,
  testCopyWithinExpandsArrayLengthViaProxy,
  testCopyWithinIgnoresAccessorPropertiesOnIndices,
  testCopyWithinIsSynchronousDespiteProxyGet,
  testCopyWithinOnArrayLikeProxy,
  testCopyWithinOnEmptyProxyArray,
  testCopyWithinOnNonExtensibleProxy,
  testCopyWithinOnProxyDoesNotMutateOriginal,
  testCopyWithinOnProxyOfFrozenArray,
  testCopyWithinOnSparseArrayThroughProxy,
  testCopyWithinOutOfBounds,
  testCopyWithinPerformsShallowCopyOfNestedProxies,
  testCopyWithinPreservesObjectReferencesThroughProxy,
  testCopyWithinPreservesProxyThis,
  testCopyWithinReadsDeletedSlotAsUndefined,
  testCopyWithinThisIsNotRawArray,
  testCopyWithinToObjectConversionHandled,
  testCopyWithinUsesCurrentValuesNotSnapshot,
  testCopyWithinWithFloatIndices,
  testCopyWithinWithInfinityIndices,
  testCopyWithinWithInterceptedLength,
  testCopyWithinWithModifiedPrototype,
  testCopyWithinWithNaNIndices,
  testCopyWithinWithNegativeIndices,
  testCopyWithinWithNonNumberArgsThroughProxy,
  testCopyWithinWorksOnProtolessProxy,
  testCrossRealmLikeProxy,
  testDefinePropertyNotCalledDuringCopyWithin,
  testDeletePropertyNotCalledDuringCopyWithin,
  testDeletingSourceDuringCopyWithin,
  testDynamicLengthChangeDuringCopyWithin,
  testEnumerateTrapNotUsed,
  testFinalConsistencySanityCheck,
  testFrozenProxyHandlerBlocksWrites,
  testGetOwnPropertyDescriptorTamperingIgnored,
  testGetReturnsGetterFunctionNotInvoked,
  testGetTrapReturnsUndefinedForElements,
  testGetTrapThrowsDuringCopyWithin,
  testHasPropertyNotRequiredByCopyWithin,
  testHasTrapNotCalledDuringCopyWithin,
  testImmutableProxyReturnsNewArrayOnCopyWithin,
  testInOperatorNotUsedInCopyWithin,
  testIsExtensibleFalseAllowsExistingWrites,
  testIsFrozenTrapDoesNotBlockWrites,
  testJSONStringifyReflectsProxyCopyWithinChanges,
  testLargeArrayCopyWithinWithProxy,
  testLargeNegativeTargetIndex,
  testMultipleCopyWithinCallsTrackedCorrectly,
  testNestedProxyWithCopyWithin,
  testNonFunctionCopyWithinThrows,
  testOriginalArrayNotDirectlyMutatedThroughProxy,
  testOwnKeysNotCalledDuringCopyWithin,
  testOwnKeysOrderDoesNotAffectCopyWithin,
  testOwnKeysTamperingDoesNotAffectCopyWithin,
  testPartialMutationOnExceptionDuringCopyWithin,
  testPersistentDataStructureStyleProxy,
  testProxyInterceptsCopyWithin,
  testProxyOfFunctionNotConfusedWithArrayProxy,
  testProxyOverridesCopyWithinBehavior,
  testProxyReflectsChangesDuringCopyWithin,
  testProxySetTrapCalledByCopyWithin,
  testReadOnlyProxyRejectsCopyWithin,
  testRecursiveCopyWithinInterception,
  testReentrantCopyWithinCalls,
  testRevocableProxyBlocksCopyWithinAfterRevoke,
  testSealedArrayProxyAllowsExistingWrites,
  testSetTrapFiltersValuesDuringCopyWithin,
  testSetTrapLiesAboutAssignment,
  testSetTrapRedirectsWriteIndex,
  testSetTrapTransformsWrittenValues,
  testStrictModeSetFalseThrows,
  testStrictModeSetFalseThrowsInCopyWithin,
  testStringIndexWriteHandledCorrectly,
  testSymbolIteratorNotAccessed,
  testSymbolSpeciesNotUsedInCopyWithin,
  testTamperedConstructorDoesNotAffectCopyWithin,
  testTargetIndexUsesOriginalLengthSnapshot,
  testThenableObjectNotTreatedAsPromise,
  testTimeTravelDebuggingViaProxy,
  testWriteAuditLogViaProxyDuringCopyWithin,
  testWriteToNonConfigurableFailsInStrictMode,
  testZeroLengthCopyWithinNoOp
} from './CopyWithinTest';


export default function CopyWithinTest() {
  describe('CopyWithinTest', () => {
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
     * @tc.name testCache1_001
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_0100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyInterceptsCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_002
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_0200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReflectsChangesDuringCopyWithin();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache1_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_0300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetTrapCalledByCopyWithin();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache1_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_0400
     * @tc.desc Testing that copyWithin preserves proxy 'this' context
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinPreservesProxyThis();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_005
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_0500
     * @tc.desc Testing that read-only proxy rejects copyWithin operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testReadOnlyProxyRejectsCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_006
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_0600
     * @tc.desc Testing copyWithin with negative indices through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinWithNegativeIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_007
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_0700
     * @tc.desc Testing that 'has' trap is not called during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testHasTrapNotCalledDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_0900
     * @tc.desc Testing that 'ownKeys' trap is not called during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testOwnKeysNotCalledDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1000
     * @tc.desc Testing copyWithin uses current values (not snapshot) through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinUsesCurrentValuesNotSnapshot();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1100
     * @tc.desc Testing copyWithin on empty proxy array
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testCache1_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinOnEmptyProxyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1200
     * @tc.desc Testing copyWithin with out-of-bounds indices through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinOutOfBounds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1300
     * @tc.desc Testing copyWithin with intercepted 'length' property through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinWithInterceptedLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1400
     * @tc.desc Testing that 'apply' trap is not invoked during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testApplyTrapNotInvoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1500
     * @tc.desc Testing nested proxy with copyWithin operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testNestedProxyWithCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_016
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1600
     * @tc.desc Testing that copyWithin arguments are not proxied
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinArgsNotProxied();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1700
     * @tc.desc Testing that set trap returning false throws in strict mode during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testStrictModeSetFalseThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1800
     * @tc.desc Testing that Symbol.iterator is not accessed during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testSymbolIteratorNotAccessed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_1900
     * @tc.desc Testing copyWithin call logging through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinCallLoggingViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_2000
     * @tc.desc Testing copyWithin on sparse array through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinOnSparseArrayThroughProxy();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache1_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_2100
     * @tc.desc Testing that proxy can override copyWithin behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testProxyOverridesCopyWithinBehavior();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_2200
     * @tc.desc Testing copyWithin behavior when source elements are deleted during operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testDeletingSourceDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_2300
     * @tc.desc Testing copyWithin through proxy with modified Array prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinWithModifiedPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_2400
     * @tc.desc Testing that revocable proxy blocks copyWithin after revocation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testRevocableProxyBlocksCopyWithinAfterRevoke();
      expect(result).assertEqual(true);
    });



    /**
     * @tc.name testCache1_026
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_2600
     * @tc.desc Testing that 'defineProperty' trap is not called during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testDefinePropertyNotCalledDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_2800
     * @tc.desc Testing that multiple copyWithin calls are tracked correctly through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMultipleCopyWithinCallsTrackedCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_2900
     * @tc.desc Testing copyWithin behavior when proxy's get trap returns undefined for elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testGetTrapReturnsUndefinedForElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3000
     * @tc.desc Testing copyWithin on non-extensible proxy array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinOnNonExtensibleProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_031
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3100
     * @tc.desc Testing that copyWithin remains synchronous despite async-like proxy get trap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinIsSynchronousDespiteProxyGet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3200
     * @tc.desc Testing that copyWithin expands array length through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinExpandsArrayLengthViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_033
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3300
     * @tc.desc Testing that proxy's set trap transforms values written by copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testSetTrapTransformsWrittenValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3400
     * @tc.desc Testing copyWithin on proxy wrapping a frozen array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinOnProxyOfFrozenArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_035
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3500
     * @tc.desc Testing error handling when proxy's get trap throws during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testGetTrapThrowsDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3600
     * @tc.desc Testing copyWithin behavior with non-number arguments through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinWithNonNumberArgsThroughProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_037
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3700
     * @tc.desc Testing copyWithin on array-like proxy (non-array target with length)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinOnArrayLikeProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_038
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3800
     * @tc.desc Testing that 'deleteProperty' trap is not called during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testDeletePropertyNotCalledDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_3900
     * @tc.desc Testing that 'in' operator is not used during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testInOperatorNotUsedInCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4000
     * @tc.desc Testing copyWithin performance and correctness on large array through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testLargeArrayCopyWithinWithProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_041
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4100
     * @tc.desc Testing copyWithin with NaN indices through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinWithNaNIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_042
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4200
     * @tc.desc Testing copyWithin with Infinity indices through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinWithInfinityIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4300
     * @tc.desc Testing that copyWithin preserves object references through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinPreservesObjectReferencesThroughProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4400
     * @tc.desc Testing copyWithin behavior when array length changes dynamically during operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testDynamicLengthChangeDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4500
     * @tc.desc Testing reentrant copyWithin calls through proxy (copyWithin calls copyWithin)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testReentrantCopyWithinCalls();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_046
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4600
     * @tc.desc Testing bound copyWithin method called on proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testBoundCopyWithinCalledOnProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_047
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4700
     * @tc.desc Testing that proxy's set trap filters values during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testSetTrapFiltersValuesDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_048
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4800
     * @tc.desc Testing accessing copyWithin via Symbol through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testAccessingCopyWithinViaSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_049
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_4900
     * @tc.desc Testing proxy that blocks copyWithin method access
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testBlockingCopyWithinAccess();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5000
     * @tc.desc Testing that copyWithin's 'this' value is proxy (not raw array)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinThisIsNotRawArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5100
     * @tc.desc Testing that 'apply' trap is ignored for direct copyWithin method calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testApplyTrapIgnoredForMethodCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5200
     * @tc.desc Testing copyWithin with float indices (truncated to integer) through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinWithFloatIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_053
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5300
     * @tc.desc Testing that copyWithin on proxy does not mutate original target array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinOnProxyDoesNotMutateOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5400
     * @tc.desc Testing that set trap returning false throws in strict mode during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testStrictModeSetFalseThrowsInCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5500
     * @tc.desc Testing that ownKeys tampering does not affect copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testOwnKeysTamperingDoesNotAffectCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5600
     * @tc.desc Testing that cached copyWithin method works correctly with proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCachedCopyWithinMethodWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5700
     * @tc.desc Testing copyWithin on cross-realm like proxy (simulated different global context)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testCrossRealmLikeProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5800
     * @tc.desc Testing that isExtensible:false allows copyWithin writes to existing indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testIsExtensibleFalseAllowsExistingWrites();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_059
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_5900
     * @tc.desc Testing that copyWithin does not read out-of-bounds indices through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCopyWithinDoesNotReadOutOfBounds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6000
     * @tc.desc Testing write audit logging via proxy during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testWriteAuditLogViaProxyDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6100
     * @tc.desc Testing recursive interception of copyWithin through nested proxies
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testRecursiveCopyWithinInterception();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6200
     * @tc.desc Testing that Symbol.species is not used during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testSymbolSpeciesNotUsedInCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6300
     * @tc.desc Testing that proxy's set trap redirects write indices during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testSetTrapRedirectsWriteIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6400
     * @tc.desc Testing copyWithin called with non-object 'this' value on proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinCalledWithNonObjectThisOnProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6500
     * @tc.desc Testing that tampered constructor does not affect copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testTamperedConstructorDoesNotAffectCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6600
     * @tc.desc Testing that frozen proxy handler blocks write operations during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testFrozenProxyHandlerBlocksWrites();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6700
     * @tc.desc Testing that get trap returns getter function which is not invoked during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testGetReturnsGetterFunctionNotInvoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_068
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6800
     * @tc.desc Testing that string index writes are handled correctly during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testStringIndexWriteHandledCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_6900
     * @tc.desc Testing copyWithin on persistent data structure style proxy (immutable updates)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testPersistentDataStructureStyleProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7000
     * @tc.desc Testing that hasOwnProperty is not required for copyWithin to work through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testHasPropertyNotRequiredByCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_071
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7100
     * @tc.desc Testing that copyWithin reads deleted slots as undefined through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinReadsDeletedSlotAsUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7200
     * @tc.desc Testing that boolean arguments are converted to numbers during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testBooleanArgsConvertedInCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7300
     * @tc.desc Testing that sealed array proxy allows copyWithin writes to existing indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testSealedArrayProxyAllowsExistingWrites();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_074
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7400
     * @tc.desc Testing that original array is not directly mutated when copyWithin is called on proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testOriginalArrayNotDirectlyMutatedThroughProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_075
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7500
     * @tc.desc Testing that thenable objects are not treated as promises during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testThenableObjectNotTreatedAsPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_076
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7600
     * @tc.desc Testing that zero-length copyWithin call is a no-op through proxy
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testCache1_076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = testZeroLengthCopyWithinNoOp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_077
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7700
     * @tc.desc Testing that proxy of function is not confused with array proxy during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testProxyOfFunctionNotConfusedWithArrayProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_078
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7800
     * @tc.desc Testing copyWithin with large negative target index through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testLargeNegativeTargetIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_079
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_7900
     * @tc.desc Testing that construct trap is not invoked during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testConstructTrapNotInvoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_8000
     * @tc.desc Testing that JSON.stringify reflects changes from copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testJSONStringifyReflectsProxyCopyWithinChanges();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache1_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_8100
     * @tc.desc Testing that target index calculation uses original length snapshot during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testTargetIndexUsesOriginalLengthSnapshot();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_082
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_8200
     * @tc.desc Testing that proxy's set trap lies about successful assignment during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testSetTrapLiesAboutAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_083
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_8300
     * @tc.desc Testing that copyWithin ignores accessor properties on array indices through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinIgnoresAccessorPropertiesOnIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_084
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_8400
     * @tc.desc Testing copyWithin works correctly on protoless proxy (no Array prototype)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinWorksOnProtolessProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_085
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_8500
     * @tc.desc Testing that BigInt arguments throw TypeError during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testBigIntArgsThrowTypeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_086
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_8600
     * @tc.desc Testing that copyWithin performs shallow copy of nested proxies
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinPerformsShallowCopyOfNestedProxies();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_087
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_8700
     * @tc.desc Testing partial mutation behavior when exception is thrown during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testPartialMutationOnExceptionDuringCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_089
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_8900
     * @tc.desc Testing that copyWithin handles object-to-primitive conversion through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinToObjectConversionHandled();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_090
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_9000
     * @tc.desc Testing that isFrozen trap does not block valid writes during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testIsFrozenTrapDoesNotBlockWrites();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_091
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_9100
     * @tc.desc Testing that copyWithin operations beyond Number.MAX_SAFE_INTEGER are ignored
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testCopyWithinBeyondMaxSafeIntegerIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_092
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_9200
     * @tc.desc Testing copyWithin on array-like object with manually added copyWithin method via proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testArrayLikeWithManuallyAddedCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_9300
     * @tc.desc Testing that writing to non-configurable property fails in strict mode during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testWriteToNonConfigurableFailsInStrictMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_094
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_9400
     * @tc.desc Testing that ownKeys order does not affect copyWithin behavior through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testOwnKeysOrderDoesNotAffectCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_095
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_9500
     * @tc.desc Testing that non-function copyWithin property throws during invocation through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testNonFunctionCopyWithinThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_098
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_9800
     * @tc.desc Testing that enumerate trap is not used during copyWithin through proxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testEnumerateTrapNotUsed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_099
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_9900
     * @tc.desc Testing that getOwnPropertyDescriptor tampering is ignored during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testCache1_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = testGetOwnPropertyDescriptorTamperingIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_100
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_10000
     * @tc.desc Testing time-travel debugging capabilities via proxy during copyWithin
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testCache1_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let result: boolean = testTimeTravelDebuggingViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache1_101
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_10100
     * @tc.desc Final consistency sanity check for copyWithin through proxy (end-to-end validation)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFinalConsistencySanityCheck();
      expect(result).assertEqual(true);
    });
  })
}


