import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testNestedProxies,
  testProxyAccessOrderLengthFirst,
  testProxyApplyTrapIgnored,
  testProxyCircularReferenceSafe,
  testProxyConstructTrapIgnored,
  testProxyDynamicLengthReadOnce,
  testProxyElementWithCustomToStringNotInvoked,
  testProxyElementWithSymbolToPrimitiveNotInvoked,
  testProxyGetOwnPropertyDescriptorTrap,
  testProxyGetterReturnsChangingValue,
  testProxyGetThrowsAfterLengthRead,
  testProxyGetThrowsOnMissingIndex,
  testProxyHandlerGetThrows,
  testProxyHandlerIsAlsoProxy,
  testProxyHasTrapNotInvoked,
  testProxyHasTrapNotUsedEvenWhenDefined,
  testProxyInheritsLengthFromPrototype,
  testProxyIteratorUndefinedStillArrayLike,
  testProxyLengthBigIntThrows,
  testProxyLengthBooleanConverted,
  testProxyLengthBooleanObjectConverted,
  testProxyLengthExceedsMaxArraySize,
  testProxyLengthInfinityThrows,
  testProxyLengthNullBecomesZero,
  testProxyLengthWithCustomValueOf,
  testProxyMapFnAccessesProxyAgain,
  testProxyMapFnThisBinding,
  testProxyMapFnThrowsError,
  testProxyNegativeLength,
  testProxyNoDOMDependency,
  testProxyNonAsciiIndicesIgnored,
  testProxyNonEnumerableIndicesStillRead,
  testProxyNonIntegerLength,
  testProxyNonIntegerStringIndexIgnored,
  testProxyNumericIndexValues,
  testProxyOwnKeysNotUsedByArrayFrom,
  testProxyOwnKeysWithExtraKeysIgnored,
  testProxyPrefersArrayLikeOverIterator,
  testProxyReturnsErrorObjects,
  testProxyReturnsFunctionsAsElements,
  testProxyReturnsGlobalAsElement,
  testProxyReturnsMapAsElement,
  testProxyReturnsNaNAsElement,
  testProxyReturnsNestedArrays,
  testProxyReturnsNonExtensibleObject,
  testProxyReturnsNullAsElement,
  testProxyReturnsObjectWithPrivateField,
  testProxyReturnsPromises,
  testProxyReturnsRegExp,
  testProxyReturnsResolvedPromiseAsValue,
  testProxyReturnsSymbolsInArray,
  testProxyReturnsThenableObject,
  testProxyRevocableAlreadyRevoked,
  testProxyRevocableNotRevoked,
  testProxySimulatesArgumentsObject,
  testProxySimulatesCrossRealmObject,
  testProxySimulatesFileList,
  testProxySimulatesNodeList,
  testProxySimulatesPrimitiveLikeBehavior,
  testProxyStringLengthFloatTruncated,
  testProxySymbolIndexIgnored,
  testProxyVeryLargeLengthDoesNotCrashPrematurely,
  testProxyWithArrayFromAndMapFunction,
  testProxyWithArrayFromGetTrap,
  testProxyWithGetterProperties,
  testProxyWithIteratorInsteadOfLength,
  testProxyWithNullPrototypeTarget,
  testProxyZeroLength
} from './FromTest';

export default function FromTest() {
  describe('FromTest', () => {
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
     * @tc.name testCache3_001
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_0100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithArrayFromGetTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_0300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithArrayFromAndMapFunction();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache3_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_0400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetOwnPropertyDescriptorTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_005
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_0500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyNonIntegerLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_006
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_0600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyNegativeLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_007
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_0700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithIteratorInsteadOfLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_008
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_0800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyPrefersArrayLikeOverIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_0900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyNumericIndexValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_1000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOwnKeysNotUsedByArrayFrom();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_1100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyHasTrapNotInvoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_1200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyDynamicLengthReadOnce();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_1300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsFunctionsAsElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_1400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyZeroLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_016
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_1600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySymbolIndexIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_1700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsPromises();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_1800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySimulatesArgumentsObject();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache3_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_1900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetThrowsOnMissingIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_2000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapFnAccessesProxyAgain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_2100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithGetterProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_2200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyApplyTrapIgnored();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache3_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_2400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyLengthNullBecomesZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_025
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_2500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyLengthInfinityThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_026
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_2600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySimulatesPrimitiveLikeBehavior();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_027
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_2700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsNestedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_2800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapFnThisBinding();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_2900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyAccessOrderLengthFirst();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_3200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyNonEnumerableIndicesStillRead();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_3400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySimulatesNodeList();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_3600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyLengthBigIntThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_037
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_3700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyIteratorUndefinedStillArrayLike();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_038
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_3800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyCircularReferenceSafe();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_3900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyLengthBooleanConverted();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_4000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyMapFnThrowsError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_041
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_4100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyNonAsciiIndicesIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_4300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNestedProxies();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_4400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyInheritsLengthFromPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_4500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsResolvedPromiseAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_046
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_4600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySimulatesFileList();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_047
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_4700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsSymbolsInArray();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache3_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithNullPrototypeTarget();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsGlobalAsElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyNoDOMDependency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_053
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyLengthWithCustomValueOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsErrorObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyHandlerIsAlsoProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_056
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsNaNAsElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyLengthExceedsMaxArraySize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_059
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_5900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyConstructTrapIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyElementWithCustomToStringNotInvoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyNonIntegerStringIndexIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyHasTrapNotUsedEvenWhenDefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_063
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetThrowsAfterLengthRead();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxySimulatesCrossRealmObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyVeryLargeLengthDoesNotCrashPrematurely();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsNonExtensibleObject();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache3_067
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOwnKeysWithExtraKeysIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_068
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6800
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsObjectWithPrivateField();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_6900
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyStringLengthFloatTruncated();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_7000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsNullAsElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_071
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_7100
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyRevocableNotRevoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_7200
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyRevocableAlreadyRevoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_7300
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsMapAsElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_074
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_7400
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyLengthBooleanObjectConverted();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_075
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_7500
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyReturnsThenableObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_076
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_7600
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetterReturnsChangingValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_077
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_7700
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyElementWithSymbolToPrimitiveNotInvoked();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache3_080
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE3_8000
     * @tc.desc Testing Cache Combo
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache3_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyHandlerGetThrows();
      expect(result).assertEqual(true);
    });
  })
}