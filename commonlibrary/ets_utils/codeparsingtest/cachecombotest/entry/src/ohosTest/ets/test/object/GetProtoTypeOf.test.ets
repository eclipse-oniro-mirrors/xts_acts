import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testAccessingTargetPrototypeInsideTrapIsSafe,
  testDeepPrototypeChainWithProxy,
  testDeletingGetPrototypeOfTrapRestoresDefault,
  testFrozenHandlerStillAllowsGetPrototypeOf,
  testFrozenProxyGetPrototypeOf,
  testGetPrototypeOfBehaviorIsStrictModeInvariant,
  testGetPrototypeOfConsistentWithProtoGetter,
  testGetPrototypeOfDoesNotAffectExtensibility,
  testGetPrototypeOfDoesNotAffectIsFrozenStatus,
  testGetPrototypeOfDoesNotAlterPropertyDescriptors,
  testGetPrototypeOfDoesNotTriggerApplyOrConstruct,
  testGetPrototypeOfDoesNotTriggerDefinePropertyTrap,
  testGetPrototypeOfDoesNotTriggerGetTrap,
  testGetPrototypeOfDoesNotTriggerHasTrap,
  testGetPrototypeOfDoesNotTriggerOwnKeysTrap,
  testGetPrototypeOfDoesNotUnwrapNestedProxiesInChain,
  testGetPrototypeOfIgnoresPropertyDescriptorFlags,
  testGetPrototypeOfIndependentOfPrototypeProperty,
  testGetPrototypeOfIndependentOfToString,
  testGetPrototypeOfIsPureReadOperation,
  testGetPrototypeOfReturnsProxyWhoseTargetIsFunction,
  testGetPrototypeOfReturnsProxyWithItsOwnTrapNotInvoked,
  testGetPrototypeOfTrapAccessesGlobalThisSafely,
  testGetPrototypeOfTrapCalledEveryTime,
  testGetPrototypeOfTrapConsistentlyReturnsNull,
  testGetPrototypeOfTrapDoesNotAffectTargetPrototype,
  testGetPrototypeOfTrapInvalidReturnValue,
  testGetPrototypeOfTrapIsBoundFunction,
  testGetPrototypeOfTrapReceivesNoArguments,
  testGetPrototypeOfTrapReturnsAnotherProxy,
  testGetPrototypeOfTrapReturnsBuiltInPrototype,
  testGetPrototypeOfTrapReturnsCircularPrototype,
  testGetPrototypeOfTrapReturnsCrossContextLikeObject,
  testGetPrototypeOfTrapReturnsCrossRealmLikeObject,
  testGetPrototypeOfTrapReturnsCustomObject,
  testGetPrototypeOfTrapReturnsFrozenObject,
  testGetPrototypeOfTrapReturnsIterableObjectDoesNotInvokeIterator,
  testGetPrototypeOfTrapReturnsJSONPrototype,
  testGetPrototypeOfTrapReturnsNull,
  testGetPrototypeOfTrapReturnsNullProtoObject,
  testGetPrototypeOfTrapReturnsObjectInheritingFromNull,
  testGetPrototypeOfTrapReturnsObjectLiteral,
  testGetPrototypeOfTrapReturnsObjectWithGetterDoesNotInvokeIt,
  testGetPrototypeOfTrapReturnsObjectWithNonConfigurableProps,
  testGetPrototypeOfTrapReturnsObjectWithSymbolToStringTag,
  testGetPrototypeOfTrapReturnsSubclassPrototype,
  testGetPrototypeOfTrapReturnsSymbolThrows,
  testGetPrototypeOfTrapReturnsUndefined,
  testGetPrototypeOfTrapReturnsUndefinedThrowsTypeError,
  testGetPrototypeOfTrapThisBinding,
  testGetPrototypeOfTrapThrowsError,
  testGetPrototypeOfWorksEvenIfTargetVariableIsDeleted,
  testHandlerGetPrototypeOfUndefined,
  testHandlerIsAlsoAProxy,
  testHandlerIsProxyAndDelegatesGetPrototypeOf,
  testHandlerIsTargetItself,
  testHandlerMutationAffectsFutureGetPrototypeOfCalls,
  testMassProxyGetPrototypeOfConsistency,
  testModifyingHandlerInsideGetPrototypeOfTrapDoesNotAffectCurrentCall,
  testMultipleProxiesEachTriggerTrap,
  testNestedProxyGetPrototypeOf,
  testNoGetPrototypeOfTrapFallback,
  testObjectAndReflectGetPrototypeOfConsistencyOnProxy,
  testOuterProxyTrapOverridesInner,
  testProxyAsPrototypeDoesNotAlterItsOwnGetPrototypeOf,
  testProxyGetPrototypeOfTrap,
  testProxyOfArgumentsObjectPrototype,
  testProxyOfArrayPrototype,
  testProxyOfClassInstancePrototype,
  testProxyOfClassWithPrivateFieldSimulation,
  testProxyOfDOMLikeObjectPrototype,
  testProxyOfErrorObjectPrototype,
  testProxyOfErrorWithCustomStackPrototype,
  testProxyOfFunctionPrototype,
  testProxyOfNullPrototypeObject,
  testProxyOfNumberWrapperPrototype,
  testProxyOfPromiseInstancePrototype,
  testProxyOfRegExpPrototype,
  testProxyOfSharedArrayBufferPrototype,
  testProxyOfStrictModeArgumentsPrototype,
  testProxyOnNonExtensibleTargetGetPrototypeOf,
  testProxyPrototypeIsAccessible,
  testProxySetAsOwnPrototype,
  testProxyUsedAsPrototypeStillHasCorrectGetPrototypeOf,
  testProxyWithNullHandler,
  testProxyWithNullTargetThrowsAtConstruction,
  testReflectAndObjectGetPrototypeOfConsistent,
  testRevokedProxyGetPrototypeOfThrows,
  testSetPrototypeOfOnProxyFails,
  testTargetPrototypeIsProxy,
  testTargetPrototypeUnaffectedByProxy,
  testTrapOverridesNullPrototypeTarget,
  testTrapReturnsActualTargetPrototype
} from './GetProtoTypeOfTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function GetProtoTypeOfTest() {
  describe('GetProtoTypeOfTest', () => {
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
     * @tc.name testCache_object3_001
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_0100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyPrototypeIsAccessible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_002
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_0200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetPrototypeOfTrap();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object3_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_0300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testTargetPrototypeUnaffectedByProxy();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object3_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_0400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_005
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_0500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapInvalidReturnValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_006
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_0600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOnNonExtensibleTargetGetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_007
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_0700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenProxyGetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_008
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_0800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNestedProxyGetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_0900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNoGetPrototypeOfTrapFallback();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_1000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapThisBinding();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_1100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapDoesNotAffectTargetPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_1200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testReflectAndObjectGetPrototypeOfConsistent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_1300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithNullHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_1400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_1500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfNullPrototypeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_1700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapCalledEveryTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_1800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetPrototypeOfOnProxyFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_1900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfIndependentOfPrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testOuterProxyTrapOverridesInner();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object3_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRevokedProxyGetPrototypeOfThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testTrapReturnsActualTargetPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfArrayPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsCustomObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_025
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfDoesNotTriggerGetTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_026
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHandlerGetPrototypeOfUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_027
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfFunctionPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapThrowsError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_2900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeepPrototypeChainWithProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyUsedAsPrototypeStillHasCorrectGetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_031
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithNullTargetThrowsAtConstruction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsSubclassPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_033
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMultipleProxiesEachTriggerTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHandlerIsAlsoAProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_035
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfIsPureReadOperation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsCrossRealmLikeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_037
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfErrorObjectPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_038
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsBuiltInPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_3900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReceivesNoArguments();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfConsistentWithProtoGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_041
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyAsPrototypeDoesNotAlterItsOwnGetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_042
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfDoesNotTriggerApplyOrConstruct();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testTargetPrototypeIsProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsCircularPrototype();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object3_046
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfDoesNotUnwrapNestedProxiesInChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_047
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapIsBoundFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_048
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfArgumentsObjectPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_049
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_4900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testAccessingTargetPrototypeInsideTrapIsSafe();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapConsistentlyReturnsNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfIgnoresPropertyDescriptorFlags();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfRegExpPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_053
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsObjectWithSymbolToStringTag();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHandlerMutationAffectsFutureGetPrototypeOfCalls();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfDoesNotAffectExtensibility();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsAnotherProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testTrapOverridesNullPrototypeTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfIndependentOfToString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_059
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_5900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDeletingGetPrototypeOfTrapRestoresDefault();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_6000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfBehaviorIsStrictModeInvariant();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_6100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsNullProtoObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_6200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAndReflectGetPrototypeOfConsistencyOnProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_6300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfPromiseInstancePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_6400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsJSONPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_6500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySetAsOwnPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_6600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testModifyingHandlerInsideGetPrototypeOfTrapDoesNotAffectCurrentCall();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_6700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfClassInstancePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_6900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsObjectWithGetterDoesNotInvokeIt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenHandlerStillAllowsGetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_071
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfNumberWrapperPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfDoesNotTriggerHasTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfReturnsProxyWithItsOwnTrapNotInvoked();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object3_074
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfStrictModeArgumentsPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_075
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfWorksEvenIfTargetVariableIsDeleted();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_076
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsCrossContextLikeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_077
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfDoesNotAlterPropertyDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_078
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsSymbolThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_079
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_7900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfDOMLikeObjectPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_8000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMassProxyGetPrototypeOfConsistency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_8100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHandlerIsTargetItself();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_082
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_8200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfDoesNotTriggerOwnKeysTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_083
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_8300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsObjectWithNonConfigurableProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_085
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_8500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapAccessesGlobalThisSafely();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_086
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_8600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsObjectLiteral();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_089
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_8900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfClassWithPrivateFieldSimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_090
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_9000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfDoesNotAffectIsFrozenStatus();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_091
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_9100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsObjectInheritingFromNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_092
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_9200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfSharedArrayBufferPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_9300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfDoesNotTriggerDefinePropertyTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_094
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_9400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfReturnsProxyWhoseTargetIsFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_095
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_9500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOfErrorWithCustomStackPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_096
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_9600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHandlerIsProxyAndDelegatesGetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_097
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_9700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsIterableObjectDoesNotInvokeIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object3_100
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT3_10000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object3_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetPrototypeOfTrapReturnsUndefinedThrowsTypeError();
      expect(result).assertEqual(true);
    });
  })
}