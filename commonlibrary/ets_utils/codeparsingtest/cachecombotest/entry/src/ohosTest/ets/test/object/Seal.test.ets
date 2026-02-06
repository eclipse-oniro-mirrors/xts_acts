import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testDeepNestedProxySealedInnermostObject,
  testDoubleProxyOnSealedObjectWorksConsistently,
  testDoubleSealViaProxyNoEffect,
  testFrozenHandlerStillOperatesOnSealedTarget,
  testFrozenObjectIsAlsoSealedAndProxyRespectsIt,
  testMultipleProxiesShareSameSealedTargetState,
  testMultipleSealViaProxyNoError,
  testNestedProxySealedObjectIsSealedStillTrue,
  testProxyOfSealedObjectIsStillReportedAsSealed,
  testReflectDeletePropertyOnSealedProxyReturnsFalse,
  testReflectSetOnSealedProxyReturnsFalseForNewProp,
  testSealedArrayProxyCanModifyExistingIndex,
  testSealedArrayProxyCannotAddNewIndex,
  testSealedArrayProxyCannotShrinkLengthBelowItems,
  testSealedArrayProxyLengthAccessWorks,
  testSealedConstructorProxyConstructTrapWorks,
  testSealedFunctionProxyApplyTrapWorks,
  testSealedNonFunctionProxyApplyConstructSafe,
  testSealedObjectAsPrototypeViaProxyWorks,
  testSealedPropertiesAreNonConfigurable,
  testSealedProxyAccessInNestedFunctionWorks,
  testSealedProxyAccessorPropertiesStillWork,
  testSealedProxyAllowsExistingPropertyUpdate,
  testSealedProxyBlocksNewPropertyAddition,
  testSealedProxyBlocksObjectAssignExtension,
  testSealedProxyCanAccessInheritedConstructor,
  testSealedProxyCanCustomizeToStringTag,
  testSealedProxyCanModifyNestedObjectProperties,
  testSealedProxyCannotModifyProtoViaUnderscore,
  testSealedProxyCannotRedefineAccessorProperty,
  testSealedProxyCannotRedefineConfigurable,
  testSealedProxyDefinePropertiesCannotAddNew,
  testSealedProxyDefinePropertyCannotChangeWritable,
  testSealedProxyDeletePropertyTrapCalledForNonExistentProp,
  testSealedProxyDestructuringAssignmentWorks,
  testSealedProxyForInDoesNotEnumerateSymbolProperties,
  testSealedProxyForInMatchesOriginal,
  testSealedProxyForInTriggersGetTrap,
  testSealedProxyGetCanTransformValueWithoutMutatingTarget,
  testSealedProxyGetFromPrototypeStillWorks,
  testSealedProxyGetOwnPropertyDescriptorIntercepted,
  testSealedProxyGetOwnPropertyDescriptorMustMatchNonConfigurable,
  testSealedProxyGetReturnsComputedObject,
  testSealedProxyGetTrapCalledForNonExistentProperty,
  testSealedProxyGetTrapInvoked,
  testSealedProxyGetTrapRespectsPrototypeChainInTarget,
  testSealedProxyGetTrapThisIsProxyNotTarget,
  testSealedProxyHasTrapLiesAboutNonExistentProperty,
  testSealedProxyHasTrapThrowsCausesInToThrow,
  testSealedProxyHasTrapWorks,
  testSealedProxyIsExtensibleReturnsFalse,
  testSealedProxyJSONStringifyIgnoresNonEnumerable,
  testSealedProxyJSONStringifyUnchanged,
  testSealedProxyNonFunctionSafe,
  testSealedProxyObjectKeysUnchanged,
  testSealedProxyOnNullPrototypeObject,
  testSealedProxyOwnKeysIncludesNonEnumerableButForInDoesNot,
  testSealedProxyOwnKeysOrderMatchesOriginal,
  testSealedProxyOwnKeysReflectsExactKeys,
  testSealedProxyPreventExtensionsTrapCalled,
  testSealedProxyPreventExtensionsTrapReturnsFalseButStillNotExtensible,
  testSealedProxyPreventsExtension,
  testSealedProxyReflectOwnKeysMatchesManualEnumeration,
  testSealedProxySafeInTryCatch,
  testSealedProxySetPrototypeOfFails,
  testSealedProxySetPrototypeOfViaObjectMethodFails,
  testSealedProxySetTrapCannotModifyPrototypeViaTarget,
  testSealedProxySetTrapCanThrowToBlockUpdate,
  testSealedProxySetTrapModifiesTargetDirectly,
  testSealedProxySetTrapReturnsFalseThrowsInStrictMode,
  testSealedProxySetTrapSideEffectOnOtherProperty,
  testSealedProxySetTrapThrowPreventsUpdate,
  testSealedProxySetTrapThrowsStringError,
  testSealedProxySpreadOperatorOnlyCopiesOwnEnumerable,
  testSealedProxyStillInheritsFromPrototype,
  testSealedProxyWithCustomSymbolIteratorWorks,
  testSealingTargetDoesNotAffectProxyHandler
} from './SealTest';
function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}
export default function SealTest() {
  describe('SealTest', () => {
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
     * @tc.name testCache_object6_002
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_0200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyPreventsExtension();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_0400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyAllowsExistingPropertyUpdate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_005
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_0500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyBlocksNewPropertyAddition();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_006
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_0600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyHasTrapWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_007
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_0700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyGetOwnPropertyDescriptorIntercepted();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_008
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_0800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedPropertiesAreNonConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_0900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyCannotRedefineConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_1000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyOwnKeysReflectsExactKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_1100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyOfSealedObjectIsStillReportedAsSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_1200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyGetTrapInvoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_1400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyPreventExtensionsTrapCalled();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_1500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySetPrototypeOfFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_016
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_1600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyIsExtensibleReturnsFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_1700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDoubleSealViaProxyNoEffect();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_1800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyNonFunctionSafe();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_1900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyGetCanTransformValueWithoutMutatingTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_2000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyForInMatchesOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_2200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyGetTrapCalledForNonExistentProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_2300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyObjectKeysUnchanged();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_2400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySetTrapCanThrowToBlockUpdate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_026
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_2600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSealedNonFunctionProxyApplyConstructSafe();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_027
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_2700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyStillInheritsFromPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_2900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectSetOnSealedProxyReturnsFalseForNewProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_3000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectDeletePropertyOnSealedProxyReturnsFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_3200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleSealViaProxyNoError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_3400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyForInTriggersGetTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_035
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_3500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyJSONStringifyUnchanged();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_3900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedArrayProxyLengthAccessWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_041
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_4100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDoubleProxyOnSealedObjectWorksConsistently();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_042
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_4200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedArrayProxyCanModifyExistingIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_4300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedArrayProxyCannotAddNewIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_4400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySetTrapThrowPreventsUpdate();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object6_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_4500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyCanModifyNestedObjectProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_046
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_4600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyGetFromPrototypeStillWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_047
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_4700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyReflectOwnKeysMatchesManualEnumeration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_049
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_4900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyCannotModifyProtoViaUnderscore();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_5000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSealedProxyDefinePropertyCannotChangeWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_5200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyJSONStringifyIgnoresNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_5400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNestedProxySealedObjectIsSealedStillTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_5500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySetTrapModifiesTargetDirectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_5600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyCanCustomizeToStringTag();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_5800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyBlocksObjectAssignExtension();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_059
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_5900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyPreventExtensionsTrapReturnsFalseButStillNotExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyDestructuringAssignmentWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyAccessorPropertiesStillWork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyCannotRedefineAccessorProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedObjectAsPrototypeViaProxyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyOwnKeysOrderMatchesOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySetTrapSideEffectOnOtherProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFrozenObjectIsAlsoSealedAndProxyRespectsIt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyGetTrapRespectsPrototypeChainInTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_068
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedFunctionProxyApplyTrapWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_6900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedConstructorProxyConstructTrapWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_7000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealingTargetDoesNotAffectProxyHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_071
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_7100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyGetOwnPropertyDescriptorMustMatchNonConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_7200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySetTrapReturnsFalseThrowsInStrictMode();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_7300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyHasTrapLiesAboutNonExistentProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_074
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_7400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySpreadOperatorOnlyCopiesOwnEnumerable();
      expect(result).assertEqual(true);
    });



    /**
     * @tc.name testCache_object6_077
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_7700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyOwnKeysIncludesNonEnumerableButForInDoesNot();
      expect(result).assertEqual(true);
    });



    /**
     * @tc.name testCache_object6_079
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_7900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyGetTrapThisIsProxyNotTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_8000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultipleProxiesShareSameSealedTargetState();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_8100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyOnNullPrototypeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_082
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_8200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySetTrapCannotModifyPrototypeViaTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_083
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_8300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySetPrototypeOfViaObjectMethodFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_084
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_8400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyGetReturnsComputedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_087
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_8700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyCanAccessInheritedConstructor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_089
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_8900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyDefinePropertiesCannotAddNew();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_090
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_9000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyDeletePropertyTrapCalledForNonExistentProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_092
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_9200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyAccessInNestedFunctionWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_9300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFrozenHandlerStillOperatesOnSealedTarget();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache_object6_095
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_9500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySetTrapThrowsStringError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_096
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_9600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxySafeInTryCatch();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_097
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_9700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyHasTrapThrowsCausesInToThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_099
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_9900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedProxyWithCustomSymbolIteratorWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object6_100
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT6_10000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object6_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeepNestedProxySealedInnermostObject();
      expect(result).assertEqual(true);
    });

  })
}