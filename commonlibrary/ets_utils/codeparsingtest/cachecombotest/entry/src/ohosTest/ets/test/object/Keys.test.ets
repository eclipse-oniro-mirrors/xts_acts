import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testArgumentsAndCallerAsRegularPropertiesIncluded,
  testArgumentsOnPlainObjectIncludedIfEnumerable,
  testArrayConstructorNotEnumerableSoNotInKeys,
  testCallerOnPlainObjectIncludedIfEnumerable,
  testConstructorOnNullProtoObjectIncludedIfEnumerable,
  testConstructorPropertyIncludedIfEnumerable,
  testConstructorWithoutDescriptorIgnored,
  testCrossRealmLikeObjectKeysConsistent,
  testDataPropertyReadOnlyButEnumerableIncluded,
  testDateConstructorNotEnumerableSoNotInKeys,
  testDeletedPropertySkippedEvenIfInOwnKeys,
  testDynamicallyGeneratedPropertyNamesWork,
  testDynamicEnumerableDescriptorHandledCorrectly,
  testEmptyStringPropertyNameIncluded,
  testEmptySymbolIgnoredByObjectKeys,
  testEnumerableAccessorPropertyIncluded,
  testEnumerableAsStringTreatedAsFalse,
  testEnumerableFalseFilteredOutDespiteOwnKeys,
  testErrorMessageEnumerableIncluded,
  testEvalAsEnumerablePropertyIncluded,
  testFloatStringKeyPreserved,
  testFrozenObjectKeysUnaffected,
  testGetOwnPropertyDescriptorThrowsCausesObjectKeysToThrow,
  testGetOwnPropertyDescriptorThrowsNonErrorCausesThrow,
  testHasOwnPropertyAsEnumerablePropertyIncluded,
  testHugeNumericStringKeyPreserved,
  testInheritedConstructorNotIncluded,
  testInheritedHasOwnPropertyNotIncluded,
  testInheritedNonConfigurablePropertySkipped,
  testInheritedPropertiesNotIncludedEvenWithProxy,
  testInheritedToStringNotIncluded,
  testInheritedValueOfNotIncluded,
  testLargeNumberOfPropertiesHandledCorrectly,
  testLengthAsRegularEnumerablePropertyIncluded,
  testMaxBMPUnicodePropertyNamePreserved,
  testNegativeIndexAsStringKeyIncluded,
  testNegativeInfinityStringKeyPreserved,
  testNegativeZeroStringKeyPreserved,
  testNestedProxyObjectKeysWorks,
  testNonArrayLengthEnumerableIncluded,
  testNonEnumerableProtoNotIncluded,
  testNonExistentPropertyDescriptorSkippedByObjectKeys,
  testNullCharacterPropertyNamePreserved,
  testNumericStringKeyNonEnumerableFiltered,
  testObjectKeysDoesNotInvokeGetter,
  testObjectKeysIgnoresSymbolFromOwnKeys,
  testObjectKeysPreservesOwnKeysOrder,
  testOwnKeysIncludesPrototypePropertyButSkipped,
  testOwnKeysReturnsEmptyHidesAllProperties,
  testOwnKeysReturnsLengthWithoutDescriptorIgnored,
  testOwnKeysThrowsErrorCausesObjectKeysToThrow,
  testPropertyDescriptorWithoutEnumerableTreatedAsNonEnumerable,
  testProtoAndPrototypeBothIncludedIfEnumerable,
  testProtoOnNullPrototypeObjectIncludedIfEnumerable,
  testProtoPropertyIncludedIfEnumerableAndInOwnKeys,
  testPrototypeAsEnumerablePropertyIncluded,
  testProtoWithDataDescriptorEnumerableIncluded,
  testProxyArrayKeysOnlyStringIndices,
  testProxyOfEmptyObjectReturnsEmptyKeys,
  testProxyOfFrozenObjectKeysConsistent,
  testProxyOwnKeysAffectsObjectKeys,
  testProxyOwnKeysCanHideEnumerableProperties,
  testProxySyntheticPropertiesInObjectKeys,
  testSealedObjectKeysUnaffectedByProxy,
  testSpecialCharacterPropertyNamesPreserved,
  testStringInfinityPropertyNameIncluded,
  testStringNaNPropertyNameIncluded,
  testStringProtoNonEnumerableIgnored,
  testStringProtoPropertyIncludedIfEnumerable,
  testStringUndefinedPropertyNameIncluded,
  testSymbolIteratorIgnoredByObjectKeys,
  testSymbolPropertyMistakenlyReturnedAsStringIgnored,
  testSymbolToStringTagIgnoredByObjectKeys,
  testSymbolWithEmptyDescriptionIgnored,
  testToStringAsEnumerablePropertyIncluded,
  testUnicodePropertyNamesPreserved,
  testUnicodeZWJPropertyNamePreserved,
  testValueOfAsEnumerablePropertyIncluded,
  testWhitespacePropertyNamesPreserved,
  testZeroOnNonArrayObjectIncludedAsString,
  testZeroStringKeyPreserved
} from './KeysTest';

export default function KeysTest() {
  describe('KeysTest', () => {
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
     * @tc.name testCache_object5_001
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_0100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyOwnKeysAffectsObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_002
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_0200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxySyntheticPropertiesInObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_003
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_0300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyOwnKeysCanHideEnumerableProperties();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object5_004
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_0400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testObjectKeysIgnoresSymbolFromOwnKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_007
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_0700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNonExistentPropertyDescriptorSkippedByObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_009
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_0900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysThrowsErrorCausesObjectKeysToThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_010
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInheritedPropertiesNotIncludedEvenWithProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_011
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysReturnsLengthWithoutDescriptorIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_012
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysReturnsEmptyHidesAllProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_013
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEnumerableFalseFilteredOutDespiteOwnKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_014
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyOfFrozenObjectKeysConsistent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_015
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProtoPropertyIncludedIfEnumerableAndInOwnKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_016
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testObjectKeysPreservesOwnKeysOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_017
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysIncludesPrototypePropertyButSkipped();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_018
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOwnPropertyDescriptorThrowsCausesObjectKeysToThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_019
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_1900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyOfEmptyObjectReturnsEmptyKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_020
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_2000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructorPropertyIncludedIfEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_021
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_2100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyArrayKeysOnlyStringIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_022
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_2200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNonEnumerableProtoNotIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_023
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_2300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testUnicodePropertyNamesPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_024
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_2400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructorWithoutDescriptorIgnored();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object5_025
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_2500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEnumerableAccessorPropertyIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_028
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_2800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNumericStringKeyNonEnumerableFiltered();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_029
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_2900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEmptyStringPropertyNameIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_030
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_3000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testLengthAsRegularEnumerablePropertyIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_031
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_3100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDataPropertyReadOnlyButEnumerableIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_032
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_3200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testObjectKeysDoesNotInvokeGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_033
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_3300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSpecialCharacterPropertyNamesPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_034
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_3400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDynamicEnumerableDescriptorHandledCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_035
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_3500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testToStringAsEnumerablePropertyIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_036
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_3600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInheritedNonConfigurablePropertySkipped();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_038
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_3800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPropertyDescriptorWithoutEnumerableTreatedAsNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_039
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_3900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSealedObjectKeysUnaffectedByProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_040
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_4000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testLargeNumberOfPropertiesHandledCorrectly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_042
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_4200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNestedProxyObjectKeysWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_043
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_4300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testStringProtoPropertyIncludedIfEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_044
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_4400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSymbolPropertyMistakenlyReturnedAsStringIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_045
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_4500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testCrossRealmLikeObjectKeysConsistent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_046
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_4600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testZeroStringKeyPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_047
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_4700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEnumerableAsStringTreatedAsFalse();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name testCache_object5_049
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_4900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNegativeIndexAsStringKeyIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_050
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_5000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFloatStringKeyPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_051
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_5100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInheritedConstructorNotIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_052
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_5200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeletedPropertySkippedEvenIfInOwnKeys();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name testCache_object5_053
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_5300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasOwnPropertyAsEnumerablePropertyIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_054
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_5400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testUnicodeZWJPropertyNamePreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_055
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_5500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOwnPropertyDescriptorThrowsNonErrorCausesThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_057
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_5700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testValueOfAsEnumerablePropertyIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_058
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_5800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEmptySymbolIgnoredByObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_059
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_5900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPrototypeAsEnumerablePropertyIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_060
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_6000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testArgumentsAndCallerAsRegularPropertiesIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_061
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_6100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInheritedToStringNotIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_062
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_6200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testStringProtoNonEnumerableIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_064
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_6400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testArrayConstructorNotEnumerableSoNotInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_065
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_6500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNonArrayLengthEnumerableIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_066
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_6600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSymbolIteratorIgnoredByObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_068
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_6800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNullCharacterPropertyNamePreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_069
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_6900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testEvalAsEnumerablePropertyIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_070
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_7000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testStringUndefinedPropertyNameIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_071
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_7100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testStringNaNPropertyNameIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_072
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_7200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testStringInfinityPropertyNameIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_073
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_7300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNegativeZeroStringKeyPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_074
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_7400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProtoAndPrototypeBothIncludedIfEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_075
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_7500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructorOnNullProtoObjectIncludedIfEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_076
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_7600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInheritedHasOwnPropertyNotIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_077
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_7700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testInheritedValueOfNotIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_078
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_7800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testWhitespacePropertyNamesPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_081
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_8100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProtoOnNullPrototypeObjectIncludedIfEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_082
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_8200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testFrozenObjectKeysUnaffected();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_084
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_8400
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMaxBMPUnicodePropertyNamePreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_085
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_8500
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDynamicallyGeneratedPropertyNamesWork();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_086
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_8600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testArgumentsOnPlainObjectIncludedIfEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_087
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_8700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testCallerOnPlainObjectIncludedIfEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_089
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_8900
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSymbolToStringTagIgnoredByObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_090
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_9000
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testZeroOnNonArrayObjectIncludedAsString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_091
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_9100
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHugeNumericStringKeyPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_092
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_9200
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProtoWithDataDescriptorEnumerableIncluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_093
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_9300
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSymbolWithEmptyDescriptionIgnored();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_096
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_9600
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNegativeInfinityStringKeyPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_097
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_9700
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDateConstructorNotEnumerableSoNotInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name testCache_object5_098
     * @tc.number SUB_COMMONLIBRARY_FASTBUFFER_BASE_CACHE_OBJECT5_9800
     * @tc.desc Testing Cache Combo by Object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testCache_object5_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testErrorMessageEnumerableIncluded();
      expect(result).assertEqual(true);
    });
  })
}