import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testArgumentsObjectWithSetPrototypeOf,
  testArrayPrototypeChangePreservesLength,
  testBehaviorConsistentWithWorkerEnvironmentSimulation,
  testConstructTrapModifiesInstancePrototype,
  testConstructTrapNewTargetPreservedAfterPrototypeChange,
  testConstructTrapRespectsPrototypeChain,
  testConstructTrapReturningPrimitiveInNonStrictMode,
  testConstructTrapReturningPrimitiveThrows,
  testCustomGetOwnPropertyDescriptorUnaffectedByPrototypeChange,
  testDeepPrototypeChainWithProxy,
  testDefineNonWritablePropertyUnaffectedByPrototypeChange,
  testDefinePropertyAccessorBoundToTargetNotPrototype,
  testDefinePropertyOnProxyDoesNotAffectPrototypeSetter,
  testDefinePropertyOnProxyIndependentOfPrototype,
  testDeleteNonExistentPropertyLeavesPrototypeIntact,
  testDeletePropertyDoesNotTriggerPrototypeSetter,
  testDeletePropertyRevealsPrototypeProperty,
  testDeleteThenRedefinePropertyWorks,
  testDirectProtoAssignmentOnProxy,
  testErrorProxyWithModifiedPrototype,
  testForInExcludesDeletedPropertyAfterSetPrototypeOf,
  testFrozenTargetRejectsSetPrototypeOfEvenWithHandler,
  testGetMethodBoundToProxyThisAccessesPrototype,
  testGetOwnPropertyDescriptorAfterDeleteReturnsUndefined,
  testGetOwnPropertyDescriptorIgnoresPrototype,
  testGetOwnPropertyDescriptorIgnoresPrototypeDescriptors,
  testGetOwnPropertyDescriptorTrapReturnsUndefined,
  testGetOwnPropertyNamesIgnoresAllPrototypeLayers,
  testGetPrototypeOfAfterFailedSetPrototypeOf,
  testGetPrototypeOfTrapReflectsChange,
  testGetProtoViaUnderscoreUnderscoreProto,
  testGetTrapAccessingArgumentsCalleeInStrictMode,
  testGetTrapCanReadCurrentPrototypeViaGetPrototypeOf,
  testGetTrapInvokesPrototypeGetter,
  testGetTrapReadsNonConfigurablePrototypeProperty,
  testGetTrapReturnsPromiseUnaffectedByPrototype,
  testGetTrapSupportsSuperLikeAccess,
  testGlobalThisProxySimulationUnaffectedBySetPrototypeOf,
  testHandlerIsAlsoProxy,
  testHasAfterDeleteAndSetPrototypeOf,
  testHasTrapDetectsNonEnumerablePrototypeProperty,
  testHasTrapReturnsTrueForInheritedSymbol,
  testHasTrapTrueForNonEnumerableInheritedSymbol,
  testHasTrapWithSymbolFromPrototype,
  testIsExtensibleAfterPreventExtensionsAndSetPrototypeOf,
  testIsExtensibleTrapDoesNotBreakSetPrototypeOf,
  testIsExtensibleTrapLiesButSetPrototypeOfStillFails,
  testIsExtensibleTrapOverridesReality,
  testLengthPropertyAccessUnaffectedByPrototypeChange,
  testModuleNamespaceLikeObjectWithSetPrototypeOf,
  testMultiLayerProxyPrototypeChain,
  testMultiplePrototypeGettersResolutionOrder,
  testMultipleSetPrototypeOfCallsWorkWithProxy,
  testNestedProxyRespectsPrototypeChange,
  testOwnKeysExcludesPrototypeProperties,
  testOwnKeysExtraKeyNotEnumeratedInForIn,
  testOwnKeysReturningInvalidKeyThrows,
  testOwnKeysVsForInConsistencyHandledCorrectly,
  testOwnKeysWithSymbolUnaffectedByPrototypeChange,
  testPrototypeChainWithProxyPrototype,
  testProxyAsPromisePrototypePreservesThen,
  testProxyAsPrototypeAffectsChildObjects,
  testProxyAsPrototypeDoesNotInterceptChildSetPrototypeOf,
  testProxyAsPrototypeDoesNotInterfereWithChildForIn,
  testProxyHasReflectsPrototypeChange,
  testProxyReflectsDynamicPrototypeChange,
  testProxySetIgnoresPrototypeChain,
  testProxySetPrototypeOfBehaviorMatchesDirectObject,
  testRecursiveGetDoesNotCrashWithPrototypeChain,
  testRecursiveGetInHandlerDoesNotCrash,
  testReflectGetInHandlerUsesCorrectReceiver,
  testReflectGetWithSuperLikeAccessInHandler,
  testRevokedProxyRejectsSetPrototypeOf,
  testSetPrototypeOfFromNullPrototypeToNormal,
  testSetPrototypeOfFromNullToNormal,
  testSetPrototypeOfOnNonExtensibleProxyThrowsInStrictMode,
  testSetPrototypeOfOnNullTargetFails,
  testSetPrototypeOfOnProxyWithoutTrap,
  testSetPrototypeOfOnRevokedProxyTargetFails,
  testSetPrototypeOfOnSealedObjectFails,
  testSetPrototypeOfRejectsPrototypeCycle,
  testSetPrototypeOfSucceedsWhenTargetExtensibleEvenIfProtoFrozen,
  testSetPrototypeOfToAnotherProxy,
  testSetPrototypeOfToNullWorksOnProxy,
  testSetPrototypeOfToSamePrototypeIsNoOp,
  testSetPrototypeOfTrapAllowsChange,
  testSetPrototypeOfTrapReturningFalseThrows,
  testSetterDefinedOnProxyBoundToTargetAfterPrototypeChange,
  testToStringTagInheritedAfterSetPrototypeOf
} from './SetProtoTypeOfTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function SetProtoTypeOfTest() {
  describe('SetProtoTypeOfTest', () => {
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
     * @tc.name testCache_object4_001
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_0100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyReflectsDynamicPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_002
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_0200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxySetIgnoresPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_0300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyHasReflectsPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_0400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetPrototypeOfTrapReflectsChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_005
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_0500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfTrapAllowsChange();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache_object4_008
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_0800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructTrapRespectsPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_0900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeletePropertyRevealsPrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_1000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysExcludesPrototypeProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_1100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOwnPropertyDescriptorIgnoresPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_1200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDefinePropertyOnProxyIndependentOfPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_1300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testIsExtensibleAfterPreventExtensionsAndSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_1500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetTrapSupportsSuperLikeAccess();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_016
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_1600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyAsPrototypeAffectsChildObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_1700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleSetPrototypeOfCallsWorkWithProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_1800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasTrapWithSymbolFromPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_1900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfFromNullToNormal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRecursiveGetInHandlerDoesNotCrash();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfOnProxyWithoutTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteNonExistentPropertyLeavesPrototypeIntact();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testArrayPrototypeChangePreservesLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyAsPrototypeDoesNotInterceptChildSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_025
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOwnPropertyNamesIgnoresAllPrototypeLayers();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_026
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetTrapCanReadCurrentPrototypeViaGetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_027
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfOnNonExtensibleProxyThrowsInStrictMode();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object4_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasTrapDetectsNonEnumerablePrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_2900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfOnNullTargetFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetMethodBoundToProxyThisAccessesPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_031
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNestedProxyRespectsPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysVsForInConsistencyHandledCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_033
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOwnPropertyDescriptorTrapReturnsUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfOnSealedObjectFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_035
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testIsExtensibleTrapDoesNotBreakSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPrototypeChainWithProxyPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_037
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDefinePropertyOnProxyDoesNotAffectPrototypeSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_038
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeletePropertyDoesNotTriggerPrototypeSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_3900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxySetPrototypeOfBehaviorMatchesDirectObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_4000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructTrapModifiesInstancePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_041
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_4100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetProtoViaUnderscoreUnderscoreProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_042
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_4200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDirectProtoAssignmentOnProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_4300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetTrapInvokesPrototypeGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_4400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasAfterDeleteAndSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_4500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysWithSymbolUnaffectedByPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_047
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_4700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetPrototypeOfAfterFailedSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_048
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_4800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDefinePropertyAccessorBoundToTargetNotPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_049
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_4900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetTrapReturnsPromiseUnaffectedByPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_5000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeepPrototypeChainWithProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_5100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testIsExtensibleTrapOverridesReality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_5200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfFromNullPrototypeToNormal();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object4_053
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_5300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testForInExcludesDeletedPropertyAfterSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_5400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testCustomGetOwnPropertyDescriptorUnaffectedByPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_5500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testErrorProxyWithModifiedPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_5600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructTrapReturningPrimitiveThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_5700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testArgumentsObjectWithSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_059
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_5900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectGetInHandlerUsesCorrectReceiver();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfToAnotherProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetTrapReadsNonConfigurablePrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfTrapReturningFalseThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyAsPrototypeDoesNotInterfereWithChildForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testToStringTagInheritedAfterSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFrozenTargetRejectsSetPrototypeOfEvenWithHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRecursiveGetDoesNotCrashWithPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRevokedProxyRejectsSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_068
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasTrapReturnsTrueForInheritedSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_6900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfToNullWorksOnProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_7000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDefineNonWritablePropertyUnaffectedByPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_071
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_7100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultiplePrototypeGettersResolutionOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_7200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructTrapNewTargetPreservedAfterPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_7300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOwnPropertyDescriptorAfterDeleteReturnsUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_075
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_7500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testIsExtensibleTrapLiesButSetPrototypeOfStillFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_076
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_7600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectGetWithSuperLikeAccessInHandler();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache_object4_078
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_7800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysExtraKeyNotEnumeratedInForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_079
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_7900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfToSamePrototypeIsNoOp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_8000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testLengthPropertyAccessUnaffectedByPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_8100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfRejectsPrototypeCycle();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_083
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_8300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testModuleNamespaceLikeObjectWithSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_084
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_8400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHandlerIsAlsoProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_085
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_8500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfSucceedsWhenTargetExtensibleEvenIfProtoFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_087
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_8700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyAsPromisePrototypePreservesThen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_088
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_8800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysReturningInvalidKeyThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_090
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_9000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetTrapAccessingArgumentsCalleeInStrictMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_091
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_9100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultiLayerProxyPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_092
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_9200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetterDefinedOnProxyBoundToTargetAfterPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_9300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasTrapTrueForNonEnumerableInheritedSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_094
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_9400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGlobalThisProxySimulationUnaffectedBySetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_095
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_9500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructTrapReturningPrimitiveInNonStrictMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_096
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_9600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOwnPropertyDescriptorIgnoresPrototypeDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_097
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_9700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfOnRevokedProxyTargetFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_099
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_9900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteThenRedefinePropertyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object4_100
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT4_10000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object4_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testBehaviorConsistentWithWorkerEnvironmentSimulation();
      expect(result).assertEqual(true);
    });
  })
}