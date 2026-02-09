import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testAccessorDescriptorNotCopiedOnlyValue,
  testAssignCanOverwriteHasOwnPropertyAsDataProperty,
  testAssignOverwritesArgumentsLengthViaProxy,
  testAssignToRevokedProxyThrowsImmediately,
  testBigIntPropertiesCopiedCorrectlyFromProxy,
  testCaseSensitivePropertyAccessInProxyGet,
  testConstructorPropertyAssignmentSafe,
  testConstructorPropertyFromProxySourceCopiedAsValue,
  testCrossRealmBooleanNumberStringCopiedCorrectly,
  testCrossRealmLikeProxySource,
  testDataPropertyConstructorOverridesInheritedOne,
  testDateObjectsPreservedThroughProxyAssign,
  testDeletePropertyTrapNotCalledByObjectAssign,
  testDynamicComputedPropertiesViaProxyGet,
  testEmptyProxySourceAssignsNothing,
  testEmptyStringPropertyNameHandledCorrectly,
  testErrorObjectsPreservedThroughProxyAssign,
  testFrozenArrayAsProxyTargetBlocksIndexAssignment,
  testFrozenNullProtoTargetBlocksAllWritesEvenViaProxy,
  testFrozenProxyAsTargetPreventsAssignment,
  testFunctionPropertiesCopiedByReferenceFromProxySource,
  testFunctionReferencesCopiedNotInvoked,
  testGetterCalledOnlyIfEnumerableAndOwn,
  testGetterInProxySourceIsEvaluatedNotCopied,
  testGetterThrowsRangeErrorDuringAssign,
  testGlobalObjectReferenceCopiedFromProxyGet,
  testHasTrapDoesNotAffectObjectAssign,
  testHasTrapReturnsFalseButPropertyExists,
  testLegacyDefineGetterTreatedAsStringKey,
  testManySymbolPropertiesHandlingInProxySource,
  testMapObjectsPreservedThroughProxyAssign,
  testMissingPropsNotEnumeratedSoNotAssigned,
  testMultiLayerProxyGetDelegation,
  testNegativeNumericStringKeysWorkInProxySet,
  testNegativeZeroPreservedFromProxySource,
  testNestedProxyAsTarget,
  testNestedProxyValuePreservedByReference,
  testNonConfigurableWritablePropertyInProxySource,
  testNonEnumerableSymbolIgnoredByObjectAssign,
  testNonExtensibleProxyTargetBlocksNewProps,
  testNonStrictArgumentsCalleeCanBeAssignedViaProxy,
  testNullAndUndefinedValuesPreservedFromProxySource,
  testNumericStringKeysEnumeratedCorrectly,
  testNumericStringKeysTriggerProxySet,
  testObjectAssignCopiesOwnPropertiesOnlyEvenIfFromProxy,
  testObjectAssignCopiesSymbolPropertiesFromProxySource,
  testObjectAssignDoesNotTriggerProxyOwnKeys,
  testObjectAssignIgnoresNonEnumerablePropertiesInSource,
  testObjectAssignOnlyOwnEnumerableFromProxySource,
  testObjectAssignRespectsPropertyInsertionOrderInProxySet,
  testObjectAssignSkipsNullAndUndefinedSources,
  testObjectAssignWithAccessorPropertiesViaProxy,
  testObjectAssignWithMultipleSourcesAndProxy,
  testObjectAssignWritesToProxyTarget,
  testOwnEnumerableProtoTreatedAsStringKey,
  testPreventedExtensionsProxySourceStillReadable,
  testPromiseCopiedAsPlainObjectFromProxy,
  testProtoPropertyInProxySourceIsIgnored,
  testProxyArgumentsAsTarget,
  testProxyArrayAsSourceCopiesOnlyEnumerableIndices,
  testProxyArrayAsTargetWithObjectAssign,
  testProxyAsBothTargetAndSource,
  testProxyDateAsTarget,
  testProxyDOMElementLikeAsTarget,
  testProxyErrorAsTarget,
  testProxyGetDelegatesToAnotherObject,
  testProxyGetDelegatesToArrayIndices,
  testProxyGetDelegatesToMapButNotEnumerable,
  testProxyGetDelegatesToWeakMapButNotEnumerable,
  testProxyGetNonDeterministicValueReadOncePerProperty,
  testProxyGetReturnsGetterFunctionItself,
  testProxyGetReturnsModifiedValueDuringAssign,
  testProxyGetReturnsPromiseCopiedAsIs,
  testProxyGetReturnsSelfCausingCircularReference,
  testProxyGetReturnsUndefinedStillAssigns,
  testProxyGetTriggeredByObjectAssign,
  testProxyHandlerThisIsUndefinedInStrictMode,
  testProxyMapAsTargetAllowsPropertyAssignment,
  testProxyRegExpAsTarget,
  testProxySetBlocksProtoAssignmentForSecurity,
  testProxySetCanInspectCurrentDescriptor,
  testProxySetCannotChangePropertyNameUsedByAssign,
  testProxySetCannotNormalizePropertyName,
  testProxySetClaimsSuccessButSkipsAssignment,
  testProxySetCounterIncrementsEvenOnFailure,
  testProxySetDeepFreezesAssignedValues,
  testProxySetDeletesOtherPropertyDuringAssign,
  testProxySetFakeSuccessLeavesPropertyUndefined,
  testProxySetHandlesSymbolPropertiesConditionally,
  testProxySetLoggingAllAssignments,
  testProxySetModifiesPropertyName,
  testProxySetMustBeSynchronousForObjectAssign,
  testProxySetReceiverIsProxyItself,
  testProxySetReturningFalseBlocksAssignment,
  testProxySetReturnsFalseInStrictModeCausesTypeError,
  testProxySetSilentlyIgnoresCertainProps,
  testProxySetThisContextIsProxy,
  testProxySetThrowsErrorDuringAssign,
  testProxySetThrowsErrorStopsFurtherAssignment,
  testProxySetThrowsStringErrorWrappedByEngine,
  testProxySetTransformsValueType,
  testProxySetTriggeredByObjectAssign,
  testProxySetUsesReflectSetConsistently,
  testProxySetValidatesPropertyNameFormat,
  testProxySetValidatesValueTypeStrictly,
  testProxySetWithConditionalLogic,
  testProxySetWritesToAlternativeStorageNotTarget,
  testProxySourceFromNullPrototypeEnumeratedCorrectly,
  testProxySourceGetterThrowsDuringEnumeration,
  testProxySourceGetThrowsError,
  testProxySourceWithApplyTrapIgnoredByObjectAssign,
  testProxySourceWithManyProperties,
  testProxySourceWithSymbolIteratorDoesNotAffectAssign,
  testProxyTargetPrototypeDoesNotInterfere,
  testProxyTargetWithNullPrototype,
  testProxyWithDefinePropertyHandlerAffectsAssignment,
  testProxyWithNullHandlerIsInvalidAndThrows,
  testRecursiveObjectAssignInSetDoesNotInfiniteLoop,
  testRecursiveObjectAssignInsideProxySet,
  testRegExpObjectsCopiedByReferenceFromProxySource,
  testRevocableProxyAfterRevokeBlocksAssign,
  testRevocableProxyBeforeRevokeWorksNormally,
  testSealedProxyTargetBlocksNewProperties,
  testSharedArrayBufferReferencePreserved,
  testSpecialNumberValuesCopiedCorrectly,
  testSpecialNumberValuesCopiedCorrectlyFromProxy,
  testStrictModeArgumentsAsProxyTarget,
  testStrictModeArgumentsIndexAssignmentViaProxy,
  testSymbolProtoNotTreatedAsPrototypeSetter,
  testSymbolToStringTagDoesNotAffectObjectAssign,
  testThenableObjectCopiedAsPlainValueFromProxy,
  testToStringValueOfTreatedAsNormalProperties,
  testUnicodePropertyNamesCopiedFromProxySource,
  testValueOfToStringInProxySourceIgnoredByAssign,
  testWebAPIObjectsLikeURLPreservedThroughProxy
} from './AssignTest';

export default function AssignTest() {
  describe('AssignTest', () => {
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
     * @tc.name testCache_object1_001
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_0100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetTriggeredByObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_002
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_0200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetTriggeredByObjectAssign();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object1_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_0300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignWritesToProxyTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_0400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignWithMultipleSourcesAndProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_005
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_0500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetReturningFalseBlocksAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_006
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_0600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignIgnoresNonEnumerablePropertiesInSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_007
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_0700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignCopiesSymbolPropertiesFromProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_008
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_0800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyAsBothTargetAndSource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_0900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignDoesNotTriggerProxyOwnKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithDefinePropertyHandlerAffectsAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenProxyAsTargetPreventsAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignSkipsNullAndUndefinedSources();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetReturnsModifiedValueDuringAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignWithAccessorPropertiesViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyTargetPrototypeDoesNotInterfere();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_016
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetThrowsErrorDuringAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEmptyProxySourceAssignsNothing();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHasTrapDoesNotAffectObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_1900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyArrayAsTargetWithObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignCopiesOwnPropertiesOnlyEvenIfFromProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyTargetWithNullPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetReturnsUndefinedStillAssigns();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetModifiesPropertyName();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object1_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySourceGetThrowsError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_025
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignOnlyOwnEnumerableFromProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_026
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyDateAsTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_027
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetWithConditionalLogic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySourceWithSymbolIteratorDoesNotAffectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_2900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyArgumentsAsTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_3000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySourceWithApplyTrapIgnoredByObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_3200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetUsesReflectSetConsistently();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_033
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_3300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNonExtensibleProxyTargetBlocksNewProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_3400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetterInProxySourceIsEvaluatedNotCopied();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_035
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_3500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHasTrapReturnsFalseButPropertyExists();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_3600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetReceiverIsProxyItself();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_037
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_3700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeletePropertyTrapNotCalledByObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_038
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_3800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapAsTargetAllowsPropertyAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_3900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFunctionPropertiesCopiedByReferenceFromProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_4000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetSilentlyIgnoresCertainProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_041
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_4100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetReturnsPromiseCopiedAsIs();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_4300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProtoPropertyInProxySourceIsIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_4400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRecursiveObjectAssignInsideProxySet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_4500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDynamicComputedPropertiesViaProxyGet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_046
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_4600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyErrorAsTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_047
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_4700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValueOfToStringInProxySourceIgnoredByAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_048
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_4800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetHandlesSymbolPropertiesConditionally();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_049
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_4900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyArrayAsSourceCopiesOnlyEnumerableIndices();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object1_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyRegExpAsTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSpecialNumberValuesCopiedCorrectlyFromProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetTransformsValueType();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_053
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetDelegatesToAnotherObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetFakeSuccessLeavesPropertyUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNonConfigurableWritablePropertyInProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNestedProxyAsTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNegativeZeroPreservedFromProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetThisContextIsProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_059
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_5900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetReturnsGetterFunctionItself();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNumericStringKeysTriggerProxySet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testUnicodePropertyNamesCopiedFromProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyDOMElementLikeAsTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCrossRealmLikeProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetLoggingAllAssignments();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetReturnsSelfCausingCircularReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testBigIntPropertiesCopiedCorrectlyFromProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetWritesToAlternativeStorageNotTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_068
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySourceWithManyProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_6900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetMustBeSynchronousForObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCaseSensitivePropertyAccessInProxyGet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_071
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testStrictModeArgumentsAsProxyTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNullAndUndefinedValuesPreservedFromProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetBlocksProtoAssignmentForSecurity();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object1_074
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetDelegatesToMapButNotEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_075
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructorPropertyAssignmentSafe();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_076
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testAccessorDescriptorNotCopiedOnlyValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_077
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRevocableProxyAfterRevokeBlocksAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_078
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRegExpObjectsCopiedByReferenceFromProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_079
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_7900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetValidatesPropertyNameFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolToStringTagDoesNotAffectObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetNonDeterministicValueReadOncePerProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_082
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetThrowsErrorStopsFurtherAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_083
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testAssignToRevokedProxyThrowsImmediately();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_084
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testToStringValueOfTreatedAsNormalProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_085
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNonEnumerableSymbolIgnoredByObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_086
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetDeletesOtherPropertyDuringAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_087
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySourceFromNullPrototypeEnumeratedCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_088
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNestedProxyValuePreservedByReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_089
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_8900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetDelegatesToArrayIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_090
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSealedProxyTargetBlocksNewProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_091
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSharedArrayBufferReferencePreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_092
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetDeepFreezesAssignedValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMissingPropsNotEnumeratedSoNotAssigned();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_094
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetReturnsFalseInStrictModeCausesTypeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_095
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySourceGetterThrowsDuringEnumeration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_096
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testAssignOverwritesArgumentsLengthViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_097
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testWebAPIObjectsLikeURLPreservedThroughProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_098
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignRespectsPropertyInsertionOrderInProxySet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_099
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_9900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testThenableObjectCopiedAsPlainValueFromProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_100
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_10000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testLegacyDefineGetterTreatedAsStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_101
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_10100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructorPropertyFromProxySourceCopiedAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_102
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_10200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetCannotChangePropertyNameUsedByAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_103
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_10300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testManySymbolPropertiesHandlingInProxySource();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_104
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_10400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenNullProtoTargetBlocksAllWritesEvenViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_106
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_10600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRecursiveObjectAssignInSetDoesNotInfiniteLoop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_107
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_10700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMultiLayerProxyGetDelegation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_108
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_10800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testAssignCanOverwriteHasOwnPropertyAsDataProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_109
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_10900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetterCalledOnlyIfEnumerableAndOwn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_110
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testStrictModeArgumentsIndexAssignmentViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_111
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testOwnEnumerableProtoTreatedAsStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_112
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetValidatesValueTypeStrictly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_113
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPreventedExtensionsProxySourceStillReadable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_114
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetClaimsSuccessButSkipsAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_115
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGlobalObjectReferenceCopiedFromProxyGet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_116
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithNullHandlerIsInvalidAndThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_117
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDateObjectsPreservedThroughProxyAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_118
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetCanInspectCurrentDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_119
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_11900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFunctionReferencesCopiedNotInvoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_120
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_12000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNegativeNumericStringKeysWorkInProxySet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_122
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_12200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetCounterIncrementsEvenOnFailure();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_123
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_12300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolProtoNotTreatedAsPrototypeSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_124
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_12400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenArrayAsProxyTargetBlocksIndexAssignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_125
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_12500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testErrorObjectsPreservedThroughProxyAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_127
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_12700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCrossRealmBooleanNumberStringCopiedCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_128
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_12800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDataPropertyConstructorOverridesInheritedOne();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_129
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_12900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPromiseCopiedAsPlainObjectFromProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_130
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRevocableProxyBeforeRevokeWorksNormally();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_131
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetterThrowsRangeErrorDuringAssign();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object1_132
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetCannotNormalizePropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_133
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNumericStringKeysEnumeratedCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_134
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetThrowsStringErrorWrappedByEngine();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_135
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetDelegatesToWeakMapButNotEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_136
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNonStrictArgumentsCalleeCanBeAssignedViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_137
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMapObjectsPreservedThroughProxyAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_138
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyHandlerThisIsUndefinedInStrictMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_139
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_13900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSpecialNumberValuesCopiedCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object1_140
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT1_14000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object1_140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEmptyStringPropertyNameHandledCorrectly();
      expect(result).assertEqual(true);
    });
  })
}