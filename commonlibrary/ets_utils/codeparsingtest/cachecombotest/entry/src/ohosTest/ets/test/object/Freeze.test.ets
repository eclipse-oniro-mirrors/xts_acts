import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testApplyOnFrozenArrowFunction,
  testCallApplyOnMethodOfFrozenObject,
  testCannotModifyProtoOfFrozenViaProxy,
  testConstructOnNonFunctionFrozenThrows,
  testDefineNonConfigurablePropOnFrozenFails,
  testDefinePropertyOnFrozenViaProxyFails,
  testEvalCannotModifyFrozenViaProxy,
  testForInOnProxyOfFrozen,
  testFreezingMapInstanceItself,
  testFreezingNullThrowsButProxyCanWrap,
  testFreezingProxyDoesNotFreezeTarget,
  testFreezingTheProxyInstance,
  testFrozenArrayIteratorWorksViaProxy,
  testFrozenArrayMethodsFailViaProxy,
  testFrozenCircularObjectWithProxy,
  testFrozenClassInstanceWithPrivateField,
  testFrozenModuleNamespaceLikeObject,
  testFrozenObjectAsMapKeyStableHash,
  testFrozenObjectAsProxyHandler,
  testFrozenObjectAsWeakMapKeyWithProxy,
  testFrozenObjectCannotBeThawed,
  testFrozenObjectInheritsPrototypePropsViaProxy,
  testFrozenObjectInPostMessageSimulation,
  testFrozenObjectInWeakSetWithProxy,
  testFrozenObjectIsAlreadyPreventedExtensions,
  testFrozenObjectIsAlsoSealed,
  testFrozenObjectKeepsNonEnumerablePropsAccessibleViaProxy,
  testFrozenObjectResistsProtoPollution,
  testFrozenPropsAreNonConfigurable,
  testFrozenPrototypePreventsMethodOverrideViaProxy,
  testFrozenProxyHandlerStillWorks,
  testGetOwnPropertyDescriptorConsistency,
  testGetOwnPropertyNamesOnProxyOfFrozen,
  testGetterStillWorksOnFrozenObjectViaProxy,
  testHasTrapOnFrozenForNonExistentProp,
  testJSONStringifyWorksOnProxyOfFrozen,
  testObjectAssignOnProxyOfFrozenFails,
  testObjectIsFrozenWorksOnProxyOfFrozen,
  testObjectStaticMethodsWorkOnProxyOfFrozen,
  testOwnKeysConsistentWithGetOwnPropertyDescriptor,
  testOwnKeysIncludesNonEnumerableAndSymbolOnFrozen,
  testPreventExtensionsOnAlreadyFrozen,
  testProxyApplyWorksOnFrozenFunction,
  testProxyConstructOnFrozenClass,
  testProxyDoesNotFabricatePropsOnFrozen,
  testProxyGetOwnPropertyDescriptorOnFrozen,
  testProxyGetPrototypeOfWorksOnFrozen,
  testProxyGetWorksOnFrozenObject,
  testProxyHasWorksOnFrozenObject,
  testProxyInterceptsGetterOnFrozenObject,
  testProxyIsExtensibleReturnsFalseForFrozen,
  testProxyOwnKeysReflectsFrozenKeys,
  testProxyWithThrowAndFreeze,
  testReflectConstructWithFrozenClass,
  testReflectSetFailsOnFrozenViaProxy,
  testSetPrototypeOfOnFrozenFails,
  testSetPrototypeOfToNullFailsOnFrozen,
  testShallowFreezeDoesNotFreezeNestedObjects,
  testSpreadOperatorReadsButDoesNotModifyFrozenViaProxy,
  testStrictModeAssignmentThrowsViaProxy,
  testStructuredCloneOfFrozenObject,
  testSymbolToStringTagOnFrozenViaProxy,
  testTemplateStringAccessOnProxyOfFrozen,
  testThisInFrozenTargetProxyHandler,
  testWithStatementOnProxyOfFrozen,
  testWithStatementSecurityWithFrozenProxy
} from './FreezeTest';

export default function FreezeTest() {
  describe('FreezeTest', () => {
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
     * @tc.name testCache_object2_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_0300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithThrowAndFreeze();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_006
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_0600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenPropsAreNonConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_007
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_0700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetWorksOnFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_1000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenArrayMethodsFailViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_1100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOwnKeysReflectsFrozenKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_1200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetPrototypeOfOnFrozenFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_1300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDefinePropertyOnFrozenViaProxyFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_1400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectIsAlreadyPreventedExtensions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_1500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testShallowFreezeDoesNotFreezeNestedObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_1700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyHasWorksOnFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_1900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetOwnPropertyDescriptorOnFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_2000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testStrictModeAssignmentThrowsViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_2100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectInheritsPrototypePropsViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_2200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCannotModifyProtoOfFrozenViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_2300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetterStillWorksOnFrozenObjectViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_2800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyApplyWorksOnFrozenFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_2900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectIsAlsoSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_3000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyIsExtensibleReturnsFalseForFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_031
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_3100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDefineNonConfigurablePropOnFrozenFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_3200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetPrototypeOfWorksOnFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_3400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectAssignOnProxyOfFrozenFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_035
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_3500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenArrayIteratorWorksViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_3600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSpreadOperatorReadsButDoesNotModifyFrozenViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_038
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_3800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructOnNonFunctionFrozenThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_3900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectKeepsNonEnumerablePropsAccessibleViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_4000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testJSONStringifyWorksOnProxyOfFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_042
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_4200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectCannotBeThawed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_4300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFreezingProxyDoesNotFreezeTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_4400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectAsWeakMapKeyWithProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_4500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testReflectSetFailsOnFrozenViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_049
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_4900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenCircularObjectWithProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_5000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectStaticMethodsWorkOnProxyOfFrozen();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object2_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_5100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFreezingNullThrowsButProxyCanWrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_5200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testWithStatementOnProxyOfFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_053
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_5300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolToStringTagOnFrozenViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_5400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testHasTrapOnFrozenForNonExistentProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_5500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFreezingMapInstanceItself();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_5600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testEvalCannotModifyFrozenViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_5700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetOwnPropertyDescriptorConsistency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_5800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testOwnKeysIncludesNonEnumerableAndSymbolOnFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_6000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFreezingTheProxyInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_6100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenClassInstanceWithPrivateField();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_6200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenPrototypePreventsMethodOverrideViaProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_6300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenProxyHandlerStillWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_6400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testForInOnProxyOfFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_6500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenModuleNamespaceLikeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_6700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testStructuredCloneOfFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_6900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetOwnPropertyNamesOnProxyOfFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_7000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testThisInFrozenTargetProxyHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_7200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPreventExtensionsOnAlreadyFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_075
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_7500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyOnFrozenArrowFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_078
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_7800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyInterceptsGetterOnFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_079
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_7900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyConstructOnFrozenClass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_8000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectInWeakSetWithProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_8100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectResistsProtoPollution();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_083
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_8300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectInPostMessageSimulation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_084
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_8400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectAsMapKeyStableHash();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_085
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_8500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyDoesNotFabricatePropsOnFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_087
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_8700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectIsFrozenWorksOnProxyOfFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_088
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_8800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFrozenObjectAsProxyHandler();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_089
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_8900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testReflectConstructWithFrozenClass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_091
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_9100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testOwnKeysConsistentWithGetOwnPropertyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_092
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_9200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testTemplateStringAccessOnProxyOfFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_9300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetPrototypeOfToNullFailsOnFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_095
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_9500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testWithStatementSecurityWithFrozenProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object2_097
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT2_9700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object2_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testCallApplyOnMethodOfFrozenObject();
      expect(result).assertEqual(true);
    });

  })
}