/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  Fn100_testInfinityKeyHandling,
  Fn101_testNaNKeyHandling,
  Fn102_testAsyncGeneratorProps,
  Fn103_testAsyncFunctionValueProps,
  Fn104_testGeneratorFunctionValueProps,
  Fn105_testNestedProxyEntries,
  Fn106_testProxyWithHasTrap,
  Fn107_testArrayBufferValueProps,
  Fn108_testDataViewValueProps,
  Fn109_testLargeArrayEntries,
  Fn10_testArrayEntries,
  Fn110_testLargeObjectEntries,
  Fn111_testSharedArrayBufferCustomProps,
  Fn112_testUnicodeEscapeSequenceKeys,
  Fn113_testErrorValueProps,
  Fn115_testArrayWithFunctionElements,
  Fn116_testArrayLikeWithFunctionValues,
  Fn117_testDefinePropertiesEnumProps,
  Fn118_testClassStaticGetterEnumProps,
  Fn119_testClassStaticSetterEnumProps,
  Fn11_testArrayLikeObject,
  Fn120_testFrozenArrayEntries,
  Fn121_testSealedArrayEntries,
  Fn122_testNonExtensibleArrayEntries,
  Fn123_testSpaceCharKeys,
  Fn124_testBigIntObjectValueProps,
  Fn125_testBooleanObjectValueProps,
  Fn126_testProxyWithGetTrap,
  Fn127_testEmptyTypedArrayEntries,
  Fn128_testTypedArrayWithZeroValues,
  Fn129_testTypedArrayValueProps,
  Fn12_testDateObjectEntries,
  Fn130_testSymbolKeyWithDescription,
  Fn131_testControlCharKeys,
  Fn132_testSharedArrayBufferValueProps,
  Fn133_testArrayWithSymbolElements,
  Fn134_testArrayLikeWithSymbolValues,
  Fn135_testClassInstanceInheritedEnumProps,
  Fn136_testClassInstanceInheritedNonEnumProps,
  Fn137_testPrototypeObjectPropsFilter,
  Fn138_testRejectedPromiseValueProps,
  Fn13_testRegExpEntries,
  Fn141_testUint8ClampedArrayEntries,
  Fn142_testUint8ClampedArrayValueProps,
  Fn143_testLongStringKeys,
  Fn144_testLongStringValueProps,
  Fn146_testArrayWithCircularElement,
  Fn147_testCircularObjectValueProps,
  Fn148_testClassStaticSymbolNonEnumProps,
  Fn149_testEntriesVsKeysMap,
  Fn14_testFunctionEntries,
  Fn151_testFullWidthNumericKeys,
  Fn155_testClassStaticMethodFilter,
  Fn156_testClassInstanceMethodFilter,
  Fn157_testPrototypeModifiedObject,
  Fn15_testMapInstanceEntries,
  Fn161_testFloat64ArrayEntries,
  Fn162_testFloat64ArrayValueProps,
  Fn163_testMathSymbolKeys,
  Fn164_testLongArrayValueProps,
  Fn165_testProxyWithDefinePropertyTrap,
  Fn168_testClassStaticGetterNonEnumProps,
  Fn169_testEntriesVsKeysValues,
  Fn16_testSetInstanceEntries,
  Fn170_testCrossIframeObjectEntries,
  Fn17_testPropertyOrder,
  Fn18_testNullPrototypeObject,
  Fn19_testNestedObjectEntries,
  Fn1_testBasicObjectEntries,
  Fn20_testNaNValueEntries,
  Fn21_testUndefinedValueEntries,
  Fn22_testCircularReference,
  Fn23_testNumberObjectEntries,
  Fn24_testStringObjectEntries,
  Fn25_testSymbolWrapperKeyFilter,
  Fn26_testArrayEmptySlots,
  Fn28_testDynamicAddedProps,
  Fn29_testDeletedPropsHandling,
  Fn2_testNonObjectConversion,
  Fn30_testPromiseObjectEntries,
  Fn31_testErrorObjectEntries,
  Fn33_testMapPrototypeExtension,
  Fn34_testSetPrototypeExtension,
  Fn35_testArrayPrototypeExtension,
  Fn37_testSetterPropExtraction,
  Fn38_testBigIntObjectEntries,
  Fn39_testBooleanObjectEntries,
  Fn3_testObjectToMap,
  Fn40_testClassInstanceProps,
  Fn41_testClassStaticProps,
  Fn42_testFrozenObjectEntries,
  Fn43_testSealedObjectEntries,
  Fn44_testNonExtensibleObjectEntries,
  Fn45_testNumericStringKeys,
  Fn46_testSpecialCharKeys,
  Fn47_testEmptyStringKey,
  Fn48_testRegExpCustomProps,
  Fn49_testDateCustomProps,
  Fn4_testEmptyObjectEntries,
  Fn50_testArrowFunctionProps,
  Fn51_testGeneratorFunctionProps,
  Fn52_testAsyncFunctionProps,
  Fn53_testWeakMapCustomProps,
  Fn54_testWeakSetCustomProps,
  Fn55_testArrayBufferCustomProps,
  Fn56_testDataViewCustomProps,
  Fn57_testUnicodeCharKeys,
  Fn58_testEscapedCharKeys,
  Fn59_testFunctionValueProps,
  Fn5_testExcludePrototypeProps,
  Fn60_testArrayValueProps,
  Fn61_testObjectValueProps,
  Fn62_testSymbolValueProps,
  Fn63_testBigIntValueProps,
  Fn64_testPromiseValueProps,
  Fn65_testSparseArrayWithDelete,
  Fn66_testArrayLikeWithNonNumericKeys,
  Fn67_testArrayLikeWithZeroLength,
  Fn68_testArrayLikeWithNegativeLength,
  Fn69_testCustomArrayInheritance,
  Fn6_testExcludeNonEnumerableProps,
  Fn70_testCustomObjectInheritance,
  Fn71_testObjectAssignEntries,
  Fn72_testObjectSpreadEntries,
  Fn73_testExcludeNonEnumGetter,
  Fn74_testExcludeNonEnumSetter,
  Fn75_testUndefinedValWithNumericStrKey,
  Fn76_testNullValWithSpecialCharKey,
  Fn77_testNestedArrayValue,
  Fn78_testDeepNestedObjectValue,
  Fn79_testProxyObjectEntries,
  Fn7_testExcludeSymbolKeys,
  Fn84_testEmojiCharKeys,
  Fn85_testMultiLineStringKeys,
  Fn86_testMapValueProps,
  Fn87_testSetValueProps,
  Fn88_testWeakMapValueProps,
  Fn89_testWeakSetValueProps,
  Fn8_testBooleanConversion,
  Fn90_testArrayWithUndefinedElements,
  Fn91_testArrayWithNullElements,
  Fn92_testArrayLikeWithNaNValues,
  Fn93_testNullProtoEmptyObject,
  Fn94_testClassStaticEnumProps,
  Fn95_testClassNonEnumInstanceProps,
  Fn99_testNumericKeysImplicitConversion,
  Fn9_testBigIntConversion
} from './Object6';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object6Test() {
  describe('Object6Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   Object6Test001
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_0100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn1_testBasicObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test002
     * @tc.number SUB_BUILTINS_Object6_TEST_0200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn2_testNonObjectConversion();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object6Test003
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_0300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn3_testObjectToMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test004
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_0400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn4_testEmptyObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test005
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_0500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn5_testExcludePrototypeProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test006
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_0600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn6_testExcludeNonEnumerableProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test007
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_0700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn7_testExcludeSymbolKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test008
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_0800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn8_testBooleanConversion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test009
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_0900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn9_testBigIntConversion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test010
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testArrayEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test011
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testArrayLikeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test012
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testDateObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test013
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testRegExpEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test014
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testFunctionEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test015
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testMapInstanceEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test016
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testSetInstanceEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test017
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testPropertyOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test018
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testNullPrototypeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test019
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_1900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testNestedObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test020
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_2000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testNaNValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test021
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_2100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testUndefinedValueEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test022
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_2200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testCircularReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test023
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_2300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testNumberObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test024
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_2400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testStringObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test025
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_2500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testSymbolWrapperKeyFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test026
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_2600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testArrayEmptySlots();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test028
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_2800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testDynamicAddedProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test029
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_2900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testDeletedPropsHandling();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test030
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_3000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testPromiseObjectEntries();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object6Test031
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_3100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testErrorObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test033
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_3300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testMapPrototypeExtension();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test034
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_3400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testSetPrototypeExtension();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test035
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_3500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testArrayPrototypeExtension();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test037
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_3700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testSetterPropExtraction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test038
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_3800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testBigIntObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test039
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_3900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testBooleanObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test040
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testClassInstanceProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test041
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testClassStaticProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test042
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testFrozenObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test043
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testSealedObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test044
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testNonExtensibleObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test045
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testNumericStringKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test046
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testSpecialCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test047
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testEmptyStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test048
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testRegExpCustomProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test049
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_4900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testDateCustomProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test050
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testArrowFunctionProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test051
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn51_testGeneratorFunctionProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test052
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testAsyncFunctionProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test053
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testWeakMapCustomProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test054
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testWeakSetCustomProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test055
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testArrayBufferCustomProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test056
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testDataViewCustomProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test057
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testUnicodeCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test058
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testEscapedCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test059
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_5900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testFunctionValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test060
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testArrayValueProps();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object6Test061
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testObjectValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test062
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testSymbolValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test063
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testBigIntValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test064
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testPromiseValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test065
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testSparseArrayWithDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test066
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testArrayLikeWithNonNumericKeys();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test067
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testArrayLikeWithZeroLength();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test068
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testArrayLikeWithNegativeLength();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test069
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_6900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testCustomArrayInheritance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test070
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testCustomObjectInheritance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test071
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testObjectAssignEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test072
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testObjectSpreadEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test073
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testExcludeNonEnumGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test074
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testExcludeNonEnumSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test075
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testUndefinedValWithNumericStrKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test076
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testNullValWithSpecialCharKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test077
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testNestedArrayValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test078
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testDeepNestedObjectValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test079
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_7900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testProxyObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test084
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_8400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testEmojiCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test085
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_8500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testMultiLineStringKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test086
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_8600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testMapValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test087
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_8700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testSetValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test088
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_8800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testWeakMapValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test089
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_8900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testWeakSetValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test090
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_9000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testArrayWithUndefinedElements();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object6Test091
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_9100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testArrayWithNullElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test092
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_9200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testArrayLikeWithNaNValues();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test093
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_9300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testNullProtoEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test094
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_9400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testClassStaticEnumProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test095
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_9500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testClassNonEnumInstanceProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test099
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_9900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testNumericKeysImplicitConversion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test100
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testInfinityKeyHandling();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test101
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testNaNKeyHandling();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test102
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testAsyncGeneratorProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test103
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testAsyncFunctionValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test104
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testGeneratorFunctionValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test105
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn105_testNestedProxyEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test106
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_testProxyWithHasTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test107
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testArrayBufferValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test108
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testDataViewValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test109
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_10900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testLargeArrayEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test110
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_11000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testLargeObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test111
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_11100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testSharedArrayBufferCustomProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test112
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_11200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testUnicodeEscapeSequenceKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test113
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_11300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_testErrorValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test115
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_11500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_testArrayWithFunctionElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test116
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_11600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_testArrayLikeWithFunctionValues();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test117
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_11700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_testDefinePropertiesEnumProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test118
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_11800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn118_testClassStaticGetterEnumProps();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test119
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_11900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_testClassStaticSetterEnumProps();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test120
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testFrozenArrayEntries();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object6Test121
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_testSealedArrayEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test122
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testNonExtensibleArrayEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test123
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testSpaceCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test124
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_testBigIntObjectValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test125
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_testBooleanObjectValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test126
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testProxyWithGetTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test127
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testEmptyTypedArrayEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test128
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_testTypedArrayWithZeroValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test129
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_12900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testTypedArrayValueProps();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test130
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_13000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn130_testSymbolKeyWithDescription();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test131
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_13100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn131_testControlCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test132
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_13200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testSharedArrayBufferValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test133
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_13300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testArrayWithSymbolElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test134
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_13400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn134_testArrayLikeWithSymbolValues();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test135
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_13500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testClassInstanceInheritedEnumProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test136
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_13600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testClassInstanceInheritedNonEnumProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test137
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_13700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn137_testPrototypeObjectPropsFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test138
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_13800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testRejectedPromiseValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test141
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_14100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn141_testUint8ClampedArrayEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test142
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_14200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testUint8ClampedArrayValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test143
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_14300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testLongStringKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test144
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_14400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn144_testLongStringValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test146
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_14600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testArrayWithCircularElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test147
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_14700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testCircularObjectValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test148
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_14800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testClassStaticSymbolNonEnumProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test149
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_14900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testEntriesVsKeysMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test151
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_15100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn151_testFullWidthNumericKeys();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object6Test155
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_15500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn155_testClassStaticMethodFilter();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object6Test156
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_15600
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn156_testClassInstanceMethodFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test157
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_15700
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn157_testPrototypeModifiedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test161
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_16100
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn161_testFloat64ArrayEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test162
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_16200
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn162_testFloat64ArrayValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test163
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_16300
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn163_testMathSymbolKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test164
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_16400
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn164_testLongArrayValueProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test165
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_16500
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn165_testProxyWithDefinePropertyTrap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test168
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_16800
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn168_testClassStaticGetterNonEnumProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test169
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_16900
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testEntriesVsKeysValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object6Test170
     * @tc.number SUB_BUILTINS_OBJECT6_TEST_17000
     * @tc.desc   test object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object6Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn170_testCrossIframeObjectEntries();
      expect(result).assertEqual(true);
    });

  })
}