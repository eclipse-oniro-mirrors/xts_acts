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
  Fn01_testDirectAndInheritedProperty,
  Fn02_testObjectCreateNull,
  Fn03_testArrayIndexExistence,
  Fn04_testNullUndefinedOwnProperty,
  Fn05_testDeletedPropertyDetection,
  Fn06_testSymbolPropertyDetection,
  Fn07_testNonEnumerablePropertyDetection,
  Fn08_testNestedObjectOwnProperty,
  Fn09_testDateObjectOwnProperty,
  Fn100_testEmojiTextComboPropertyName,
  Fn101_testSuperscriptSubscriptPropertyName,
  Fn102_testReadableStreamBYOBReaderOwnProperty,
  Fn103_testArrayBufferInstanceValueProperty,
  Fn104_testClassPrivateMethodDetection,
  Fn105_testSpecialSymbolComboPropertyName,
  Fn106_testIntlRelativeTimeFormatOwnProperty,
  Fn108_testPromiseRaceInstanceProperty,
  Fn109_testUnicodeControlCharPropertyName,
  Fn10_testRegExpObjectOwnProperty,
  Fn110_testWeakRefOwnProperty,
  Fn111_testDataViewInstanceValueProperty,
  Fn112_testClassStaticPrivateMethodDetection,
  Fn113_testLangSpecificCharPropertyName,
  Fn114_testTransformStreamControllerOwnProperty,
  Fn116_testIntlPluralRulesOwnProperty,
  Fn117_testBracketComboPropertyName,
  Fn118_testResolvedPromiseInstanceProperty,
  Fn119_testWeakMapSetInstanceValueProperty,
  Fn11_testClassInstanceProperty,
  Fn120_testSpecialSpacePropertyName,
  Fn121_testRomanNumeralPropertyName,
  Fn122_testFinalizationRegistryOwnProperty,
  Fn124_testClassPrivateFieldVsInstanceProp,
  Fn125_testSlashBackslashComboProperty,
  Fn126_testIntlDisplayNamesOwnProperty,
  Fn128_testRejectedPromiseInstanceProperty,
  Fn129_testEmojiModifierPropertyName,
  Fn12_testNumberPropertyName,
  Fn132_testClassStaticFieldVsInstanceField,
  Fn133_testMathSymbolPropertyName,
  Fn134_testReadableStreamControllerOwnProperty,
  Fn135_testOverrideToPrototypeProperty,
  Fn136_testIntlCollatorOwnProperty,
  Fn137_testHashPathPropertyName,
  Fn138_testPromiseAllSettledInstanceProperty,
  Fn13_testEmptyObjectDetection,
  Fn140_testSymbolEmojiComboPropertyName,
  Fn141_testEgyptianNumeralPropertyName,
  Fn142_testWritableStreamControllerOwnProperty,
  Fn143_testFinalizationRegistryInstanceValueProperty,
  Fn144_testClassPrivateStaticFieldDetection,
  Fn145_testColonPathPropertyName,
  Fn146_testIntlNumberFormatRange,
  Fn147_testSealedPropertyValueModify,
  Fn148_testPromiseAnyInstanceProperty,
  Fn149_testSanskritNumeralPropertyName,
  Fn14_testArrayNonIndexProperty,
  Fn151_testTransformStreamInstanceValueProperty,
  Fn152_testClassInheritanceGetterSetter,
  Fn153_testTildeIdentifierPropertyName,
  Fn154_testIntlDateTimeFormatRangeParts,
  Fn156_testIntlLocaleOwnProperty,
  Fn157_testEqualsKeyValuePropertyName,
  Fn158_testPromiseWithResolvers,
  Fn159_testReadableStreamInstanceValueProperty,
  Fn15_testSetObjectOwnProperty,
  Fn160_testSymbolUnicodeComboPropertyName,
  Fn161_testHebrewNumeralPropertyName,
  Fn162_testCompressionStreamOwnProperty,
  Fn163_testWritableStreamInstanceValueProperty,
  Fn164_testClassPrivateMethodVsPrototype,
  Fn165_testSemicolonConfigPropertyName,
  Fn166_testIntlPluralRulesSelectRange,
  Fn167_testPreventExtensionsModifyValue,
  Fn168_testAggregateErrorOwnProperty,
  Fn169_testThaiNumeralPropertyName,
  Fn16_testMapObjectOwnProperty,
  Fn170_testDecompressionStreamOwnProperty,
  Fn171_testCompressionStreamInstanceValueProperty,
  Fn172_testClassStaticMethodVsPrototype,
  Fn173_testQuestionParamPropertyName,
  Fn174_testIntlRelativeTimeFormatParts,
  Fn177_testArabicLetterPropertyName,
  Fn178_testReadableByteStreamControllerOwnProperty,
  Fn179_testDecompressionStreamInstanceValueProperty,
  Fn17_testObjectAssignOwnProperty,
  Fn180_testCombiningCharPropertyName,
  Fn181_testJapaneseKanaPropertyName,
  Fn182_testTextEncoderOwnProperty,
  Fn183_testTextEncoderInstanceValueProperty,
  Fn184_testClassPrivateFieldVsStaticField,
  Fn185_testPipeOptionPropertyName,
  Fn186_testIntlCollatorCompare,
  Fn187_testSealedPropertyDefineDescriptor,
  Fn188_testTextDecoderOwnProperty,
  Fn189_testKoreanHangulPropertyName,
  Fn18_testObjectDefinePropertiesOwnProperty,
  Fn190_testCountQueuingStrategyOwnProperty,
  Fn191_testTextDecoderInstanceValueProperty,
  Fn192_testClassInheritanceStaticField,
  Fn193_testDollarVariablePropertyName,
  Fn194_testIntlDisplayNamesOf,
  Fn195_testFrozenPropertyDefineDescriptor,
  Fn196_testByteLengthQueuingStrategyOwnProperty,
  Fn197_testPercentRatioPropertyName,
  Fn198_testPromiseRaceVsAllSettled,
  Fn199_testCountQueuingStrategyInstanceValueProperty,
  Fn19_testMultiLevelInheritance,
  Fn200_testSymbolMultiLangComboPropertyName,
  Fn20_testFunctionOwnProperty,
  Fn21_testBooleanPropertyName,
  Fn22_testNaNPropertyName,
  Fn23_testClassStaticVsInstance,
  Fn24_testTypedArrayOwnProperty,
  Fn25_testOverriddenPrototypeProperty,
  Fn26_testEmptyStringPropertyName,
  Fn27_testPromiseOwnProperty,
  Fn28_testObjectFromEntriesOwnProperty,
  Fn29_testModifiedPrototypeOwnProperty,
  Fn30_testBigIntPropertyName,
  Fn31_testErrorOwnProperty,
  Fn32_testConfigurablePropertyDetection,
  Fn33_testSpreadOperatorOwnProperty,
  Fn34_testWeakCollectionOwnProperty,
  Fn35_testFunctionValueProperty,
  Fn36_testArrayBufferOwnProperty,
  Fn37_testFrozenObjectOwnProperty,
  Fn38_testSymbolIteratorProperty,
  Fn39_testNestedArrayOwnProperty,
  Fn40_testConsistencyWithGetOwnPropertyNames,
  Fn42_testSpecialCharPropertyName,
  Fn43_testClassPrivateProperty,
  Fn44_testDataViewOwnProperty,
  Fn45_testSealedObjectOwnProperty,
  Fn46_testConsistencyWithObjectKeys,
  Fn47_testRegExpIntrinsicProperties,
  Fn48_testSymbolValueProperty,
  Fn49_testGeneratorOwnProperty,
  Fn50_testPropertyNameConflictWithPrototype,
  Fn52_testMultipleAssignedProperty,
  Fn54_testUnicodePropertyName,
  Fn55_testAsyncFunctionOwnProperty,
  Fn57_testIntlObjectOwnProperty,
  Fn58_testWritablePropertyDetection,
  Fn59_testPrototypeSetToNull,
  Fn60_testPropertyNameAsArrayIndex,
  Fn61_testMapSetModifyNoAffectOwnProp,
  Fn62_testNewlineInPropertyName,
  Fn63_testTypedArrayViewIndex,
  Fn64_testClassInheritanceInstanceProp,
  Fn65_testErrorSubclassOwnProperty,
  Fn66_testBigIntValueProperty,
  Fn68_testPropertyNameConflictWithBuiltIn,
  Fn70_testPreventExtensionsObject,
  Fn71_testGeneratorFunctionOwnProperty,
  Fn72_testTabInPropertyName,
  Fn73_testIntlNumberFormatOwnProperty,
  Fn74_testPromiseValueProperty,
  Fn75_testReadableStreamOwnProperty,
  Fn76_testBackslashInPropertyName,
  Fn77_testClassGetterSetterOwnProperty,
  Fn78_testRegExpValueProperty,
  Fn79_testWritableStreamOwnProperty,
  Fn80_testEmojiInPropertyName,
  Fn81_testFullWidthCharPropertyName,
  Fn82_testTransformStreamOwnProperty,
  Fn83_testErrorInstanceValueProperty,
  Fn84_testClassStaticMethodVsInstanceProp,
  Fn85_testSpaceSpecialCharComboProperty,
  Fn86_testAtomicsRelatedProperty,
  Fn87_testRedefinedPropertyDetection,
  Fn88_testIntlDateTimeFormatParts,
  Fn89_testNonPrintableCharPropertyName,
  Fn90_testPromiseAllInstanceProperty,
  Fn91_testMapSetInstanceValueProperty,
  Fn92_testClassPrivateStaticProperty,
  Fn93_testMixedLangPropertyName,
  Fn94_testReadableStreamReaderOwnProperty,
  Fn95_testTypedArrayInstanceValueProperty,
  Fn96_testClassInheritanceStaticProperty,
  Fn97_testUnderlineNumberComboProperty,
  Fn98_testWritableStreamWriterOwnProperty,
  Fn99_testConsistencyWithGetOwnPropertyDescriptors
} from './Object15';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object15Test() {
  describe('Object15Test', () => {
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
     * @tc.name   Object15Test001
     * @tc.number SUB_BUILTINS_Object15_TEST_0100
     * @tc.desc   test object create (direct and inherited property)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testDirectAndInheritedProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test002
     * @tc.number SUB_BUILTINS_Object15_TEST_0200
     * @tc.desc   test object create (null prototype)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testObjectCreateNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test003
     * @tc.number SUB_BUILTINS_Object15_TEST_0300
     * @tc.desc   test array index existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testArrayIndexExistence();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test004
     * @tc.number SUB_BUILTINS_Object15_TEST_0400
     * @tc.desc   test null/undefined own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testNullUndefinedOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test005
     * @tc.number SUB_BUILTINS_Object15_TEST_0500
     * @tc.desc   test deleted property detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testDeletedPropertyDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test006
     * @tc.number SUB_BUILTINS_Object15_TEST_0600
     * @tc.desc   test symbol property detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testSymbolPropertyDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test007
     * @tc.number SUB_BUILTINS_Object15_TEST_0700
     * @tc.desc   test non-enumerable property detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testNonEnumerablePropertyDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test008
     * @tc.number SUB_BUILTINS_Object15_TEST_0800
     * @tc.desc   test nested object own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testNestedObjectOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test009
     * @tc.number SUB_BUILTINS_Object15_TEST_0900
     * @tc.desc   test date object own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testDateObjectOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test010
     * @tc.number SUB_BUILTINS_Object15_TEST_1000
     * @tc.desc   test regexp object own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testRegExpObjectOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test011
     * @tc.number SUB_BUILTINS_Object15_TEST_1100
     * @tc.desc   test class instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testClassInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test012
     * @tc.number SUB_BUILTINS_Object15_TEST_1200
     * @tc.desc   test number property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testNumberPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test013
     * @tc.number SUB_BUILTINS_Object15_TEST_1300
     * @tc.desc   test empty object detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testEmptyObjectDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test014
     * @tc.number SUB_BUILTINS_Object15_TEST_1400
     * @tc.desc   test array non-index property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testArrayNonIndexProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test015
     * @tc.number SUB_BUILTINS_Object15_TEST_1500
     * @tc.desc   test set object own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testSetObjectOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test016
     * @tc.number SUB_BUILTINS_Object15_TEST_1600
     * @tc.desc   test map object own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testMapObjectOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test017
     * @tc.number SUB_BUILTINS_Object15_TEST_1700
     * @tc.desc   test object assign own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testObjectAssignOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test018
     * @tc.number SUB_BUILTINS_Object15_TEST_1800
     * @tc.desc   test object define properties own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testObjectDefinePropertiesOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test019
     * @tc.number SUB_BUILTINS_Object15_TEST_1900
     * @tc.desc   test multi-level inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testMultiLevelInheritance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test020
     * @tc.number SUB_BUILTINS_Object15_TEST_2000
     * @tc.desc   test function own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testFunctionOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test021
     * @tc.number SUB_BUILTINS_Object15_TEST_2100
     * @tc.desc   test boolean property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testBooleanPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test022
     * @tc.number SUB_BUILTINS_Object15_TEST_2200
     * @tc.desc   test NaN property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testNaNPropertyName();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object15Test023
     * @tc.number SUB_BUILTINS_Object15_TEST_2300
     * @tc.desc   test class static vs instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testClassStaticVsInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test024
     * @tc.number SUB_BUILTINS_Object15_TEST_2400
     * @tc.desc   test typed array own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testTypedArrayOwnProperty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object15Test025
     * @tc.number SUB_BUILTINS_Object15_TEST_2500
     * @tc.desc   test overridden prototype property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testOverriddenPrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test026
     * @tc.number SUB_BUILTINS_Object15_TEST_2600
     * @tc.desc   test empty string property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testEmptyStringPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test027
     * @tc.number SUB_BUILTINS_Object15_TEST_2700
     * @tc.desc   test promise own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testPromiseOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test028
     * @tc.number SUB_BUILTINS_Object15_TEST_2800
     * @tc.desc   test object from entries own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testObjectFromEntriesOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test029
     * @tc.number SUB_BUILTINS_Object15_TEST_2900
     * @tc.desc   test modified prototype own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testModifiedPrototypeOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test030
     * @tc.number SUB_BUILTINS_Object15_TEST_3000
     * @tc.desc   test BigInt property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testBigIntPropertyName();
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   Object15Test031
     * @tc.number SUB_BUILTINS_Object15_TEST_3100
     * @tc.desc   test Error object own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testErrorOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test032
     * @tc.number SUB_BUILTINS_Object15_TEST_3200
     * @tc.desc   test configurable property detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testConfigurablePropertyDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test033
     * @tc.number SUB_BUILTINS_Object15_TEST_3300
     * @tc.desc   test spread operator own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testSpreadOperatorOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test034
     * @tc.number SUB_BUILTINS_Object15_TEST_3400
     * @tc.desc   test weak collection own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testWeakCollectionOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test035
     * @tc.number SUB_BUILTINS_Object15_TEST_3500
     * @tc.desc   test function value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testFunctionValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test036
     * @tc.number SUB_BUILTINS_Object15_TEST_3600
     * @tc.desc   test ArrayBuffer own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testArrayBufferOwnProperty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object15Test037
     * @tc.number SUB_BUILTINS_Object15_TEST_3700
     * @tc.desc   test frozen object own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testFrozenObjectOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test038
     * @tc.number SUB_BUILTINS_Object15_TEST_3800
     * @tc.desc   test Symbol.iterator property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testSymbolIteratorProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test039
     * @tc.number SUB_BUILTINS_Object15_TEST_3900
     * @tc.desc   test nested array own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testNestedArrayOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test040
     * @tc.number SUB_BUILTINS_Object15_TEST_4000
     * @tc.desc   test consistency with getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testConsistencyWithGetOwnPropertyNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test042
     * @tc.number SUB_BUILTINS_Object15_TEST_4200
     * @tc.desc   test special character property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testSpecialCharPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test043
     * @tc.number SUB_BUILTINS_Object15_TEST_4300
     * @tc.desc   test class private property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testClassPrivateProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test044
     * @tc.number SUB_BUILTINS_Object15_TEST_4400
     * @tc.desc   test DataView own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testDataViewOwnProperty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object15Test045
     * @tc.number SUB_BUILTINS_Object15_TEST_4500
     * @tc.desc   test sealed object own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testSealedObjectOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test046
     * @tc.number SUB_BUILTINS_Object15_TEST_4600
     * @tc.desc   test consistency with Object.keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testConsistencyWithObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test047
     * @tc.number SUB_BUILTINS_Object15_TEST_4700
     * @tc.desc   test RegExp intrinsic properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testRegExpIntrinsicProperties();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object15Test048
     * @tc.number SUB_BUILTINS_Object15_TEST_4800
     * @tc.desc   test Symbol value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testSymbolValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test049
     * @tc.number SUB_BUILTINS_Object15_TEST_4900
     * @tc.desc   test Generator own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testGeneratorOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test050
     * @tc.number SUB_BUILTINS_Object15_TEST_5000
     * @tc.desc   test property name conflict with prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testPropertyNameConflictWithPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test052
     * @tc.number SUB_BUILTINS_Object15_TEST_5200
     * @tc.desc   test multiple assigned property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testMultipleAssignedProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test054
     * @tc.number SUB_BUILTINS_Object15_TEST_5400
     * @tc.desc   test Unicode property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testUnicodePropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test055
     * @tc.number SUB_BUILTINS_Object15_TEST_5500
     * @tc.desc   test async function own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testAsyncFunctionOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test057
     * @tc.number SUB_BUILTINS_Object15_TEST_5700
     * @tc.desc   test Intl object own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testIntlObjectOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test058
     * @tc.number SUB_BUILTINS_Object15_TEST_5800
     * @tc.desc   test writable property detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testWritablePropertyDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test059
     * @tc.number SUB_BUILTINS_Object15_TEST_5900
     * @tc.desc   test prototype set to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testPrototypeSetToNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test060
     * @tc.number SUB_BUILTINS_Object15_TEST_6000
     * @tc.desc   test property name as array index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testPropertyNameAsArrayIndex();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object15Test061
     * @tc.number SUB_BUILTINS_Object15_TEST_6100
     * @tc.desc   test Map/Set modify no affect own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testMapSetModifyNoAffectOwnProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test062
     * @tc.number SUB_BUILTINS_Object15_TEST_6200
     * @tc.desc   test newline in property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testNewlineInPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test063
     * @tc.number SUB_BUILTINS_Object15_TEST_6300
     * @tc.desc   test TypedArray view index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testTypedArrayViewIndex();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object15Test064
     * @tc.number SUB_BUILTINS_Object15_TEST_6400
     * @tc.desc   test class inheritance instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testClassInheritanceInstanceProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test065
     * @tc.number SUB_BUILTINS_Object15_TEST_6500
     * @tc.desc   test Error subclass own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testErrorSubclassOwnProperty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object15Test066
     * @tc.number SUB_BUILTINS_Object15_TEST_6600
     * @tc.desc   test BigInt value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testBigIntValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test068
     * @tc.number SUB_BUILTINS_Object15_TEST_6800
     * @tc.desc   test property name conflict with built-in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testPropertyNameConflictWithBuiltIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test070
     * @tc.number SUB_BUILTINS_Object15_TEST_7000
     * @tc.desc   test prevent extensions object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testPreventExtensionsObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test071
     * @tc.number SUB_BUILTINS_Object15_TEST_7100
     * @tc.desc   test GeneratorFunction own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testGeneratorFunctionOwnProperty();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object15Test072
     * @tc.number SUB_BUILTINS_Object15_TEST_7200
     * @tc.desc   test tab in property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testTabInPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test073
     * @tc.number SUB_BUILTINS_Object15_TEST_7300
     * @tc.desc   test Intl.NumberFormat own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testIntlNumberFormatOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test074
     * @tc.number SUB_BUILTINS_Object15_TEST_7400
     * @tc.desc   test Promise value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testPromiseValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test075
     * @tc.number SUB_BUILTINS_Object15_TEST_7500
     * @tc.desc   test ReadableStream own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testReadableStreamOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test076
     * @tc.number SUB_BUILTINS_Object15_TEST_7600
     * @tc.desc   test backslash in property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testBackslashInPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test077
     * @tc.number SUB_BUILTINS_Object15_TEST_7700
     * @tc.desc   test class getter/setter own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testClassGetterSetterOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test078
     * @tc.number SUB_BUILTINS_Object15_TEST_7800
     * @tc.desc   test RegExp value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testRegExpValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test079
     * @tc.number SUB_BUILTINS_Object15_TEST_7900
     * @tc.desc   test WritableStream own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testWritableStreamOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test080
     * @tc.number SUB_BUILTINS_Object15_TEST_8000
     * @tc.desc   test emoji in property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testEmojiInPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test081
     * @tc.number SUB_BUILTINS_Object15_TEST_8100
     * @tc.desc   test full-width character property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testFullWidthCharPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test082
     * @tc.number SUB_BUILTINS_Object15_TEST_8200
     * @tc.desc   test TransformStream own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testTransformStreamOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test083
     * @tc.number SUB_BUILTINS_Object15_TEST_8300
     * @tc.desc   test Error instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testErrorInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test084
     * @tc.number SUB_BUILTINS_Object15_TEST_8400
     * @tc.desc   test class static method vs instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testClassStaticMethodVsInstanceProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test085
     * @tc.number SUB_BUILTINS_Object15_TEST_8500
     * @tc.desc   test space and special character combo property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testSpaceSpecialCharComboProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test086
     * @tc.number SUB_BUILTINS_Object15_TEST_8600
     * @tc.desc   test Atomics related property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testAtomicsRelatedProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test087
     * @tc.number SUB_BUILTINS_Object15_TEST_8700
     * @tc.desc   test redefined property detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testRedefinedPropertyDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test088
     * @tc.number SUB_BUILTINS_Object15_TEST_8800
     * @tc.desc   test Intl.DateTimeFormat parts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testIntlDateTimeFormatParts();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test089
     * @tc.number SUB_BUILTINS_Object15_TEST_8900
     * @tc.desc   test non-printable character property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testNonPrintableCharPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test090
     * @tc.number SUB_BUILTINS_Object15_TEST_9000
     * @tc.desc   test Promise.all instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testPromiseAllInstanceProperty();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object15Test091
     * @tc.number SUB_BUILTINS_Object15_TEST_9100
     * @tc.desc   test Map/Set instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testMapSetInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test092
     * @tc.number SUB_BUILTINS_Object15_TEST_9200
     * @tc.desc   test class private static property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testClassPrivateStaticProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test093
     * @tc.number SUB_BUILTINS_Object15_TEST_9300
     * @tc.desc   test mixed language property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testMixedLangPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test094
     * @tc.number SUB_BUILTINS_Object15_TEST_9400
     * @tc.desc   test ReadableStreamReader own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testReadableStreamReaderOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test095
     * @tc.number SUB_BUILTINS_Object15_TEST_9500
     * @tc.desc   test TypedArray instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testTypedArrayInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test096
     * @tc.number SUB_BUILTINS_Object15_TEST_9600
     * @tc.desc   test class inheritance static property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testClassInheritanceStaticProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test097
     * @tc.number SUB_BUILTINS_Object15_TEST_9700
     * @tc.desc   test underline and number combo property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testUnderlineNumberComboProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test098
     * @tc.number SUB_BUILTINS_Object15_TEST_9800
     * @tc.desc   test WritableStreamWriter own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testWritableStreamWriterOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test099
     * @tc.number SUB_BUILTINS_Object15_TEST_9900
     * @tc.desc   test consistency with getOwnPropertyDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testConsistencyWithGetOwnPropertyDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test100
     * @tc.number SUB_BUILTINS_Object15_TEST_10000
     * @tc.desc   test emoji and text combo property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testEmojiTextComboPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test101
     * @tc.number SUB_BUILTINS_Object15_TEST_10100
     * @tc.desc   test superscript and subscript property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testSuperscriptSubscriptPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test102
     * @tc.number SUB_BUILTINS_Object15_TEST_10200
     * @tc.desc   test ReadableStreamBYOBReader own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testReadableStreamBYOBReaderOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test103
     * @tc.number SUB_BUILTINS_Object15_TEST_10300
     * @tc.desc   test ArrayBuffer instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testArrayBufferInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test104
     * @tc.number SUB_BUILTINS_Object15_TEST_10400
     * @tc.desc   test class private method detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testClassPrivateMethodDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test105
     * @tc.number SUB_BUILTINS_Object15_TEST_10500
     * @tc.desc   test special symbol combo property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn105_testSpecialSymbolComboPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test106
     * @tc.number SUB_BUILTINS_Object15_TEST_10600
     * @tc.desc   test Intl.RelativeTimeFormat own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_testIntlRelativeTimeFormatOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test108
     * @tc.number SUB_BUILTINS_Object15_TEST_10800
     * @tc.desc   test Promise.race instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testPromiseRaceInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test109
     * @tc.number SUB_BUILTINS_Object15_TEST_10900
     * @tc.desc   test Unicode control character property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testUnicodeControlCharPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test110
     * @tc.number SUB_BUILTINS_Object15_TEST_11000
     * @tc.desc   test WeakRef own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testWeakRefOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test111
     * @tc.number SUB_BUILTINS_Object15_TEST_11100
     * @tc.desc   test DataView instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testDataViewInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test112
     * @tc.number SUB_BUILTINS_Object15_TEST_11200
     * @tc.desc   test class static private method detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testClassStaticPrivateMethodDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test113
     * @tc.number SUB_BUILTINS_Object15_TEST_11300
     * @tc.desc   test language specific character property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_testLangSpecificCharPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test114
     * @tc.number SUB_BUILTINS_Object15_TEST_11400
     * @tc.desc   test TransformStreamController own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_testTransformStreamControllerOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test116
     * @tc.number SUB_BUILTINS_Object15_TEST_11600
     * @tc.desc   test Intl.PluralRules own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_testIntlPluralRulesOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test117
     * @tc.number SUB_BUILTINS_Object15_TEST_11700
     * @tc.desc   test bracket combo property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_testBracketComboPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test118
     * @tc.number SUB_BUILTINS_Object15_TEST_11800
     * @tc.desc   test resolved Promise instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn118_testResolvedPromiseInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test119
     * @tc.number SUB_BUILTINS_Object15_TEST_11900
     * @tc.desc   test WeakMap/Set instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_testWeakMapSetInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test120
     * @tc.number SUB_BUILTINS_Object15_TEST_12000
     * @tc.desc   test special space property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testSpecialSpacePropertyName();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object15Test121
     * @tc.number SUB_BUILTINS_Object15_TEST_12100
     * @tc.desc   test Roman numeral property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_testRomanNumeralPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test122
     * @tc.number SUB_BUILTINS_Object15_TEST_12200
     * @tc.desc   test FinalizationRegistry own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testFinalizationRegistryOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test124
     * @tc.number SUB_BUILTINS_Object15_TEST_12400
     * @tc.desc   test class private field vs instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_testClassPrivateFieldVsInstanceProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test125
     * @tc.number SUB_BUILTINS_Object15_TEST_12500
     * @tc.desc   test slash and backslash combo property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_testSlashBackslashComboProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test126
     * @tc.number SUB_BUILTINS_Object15_TEST_12600
     * @tc.desc   test Intl.DisplayNames own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testIntlDisplayNamesOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test128
     * @tc.number SUB_BUILTINS_Object15_TEST_12800
     * @tc.desc   test rejected Promise instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_testRejectedPromiseInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test129
     * @tc.number SUB_BUILTINS_Object15_TEST_12900
     * @tc.desc   test emoji modifier property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testEmojiModifierPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test132
     * @tc.number SUB_BUILTINS_Object15_TEST_13200
     * @tc.desc   test class static field vs instance field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testClassStaticFieldVsInstanceField();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test133
     * @tc.number SUB_BUILTINS_Object15_TEST_13300
     * @tc.desc   test math symbol property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testMathSymbolPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test134
     * @tc.number SUB_BUILTINS_Object15_TEST_13400
     * @tc.desc   test ReadableStreamController own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn134_testReadableStreamControllerOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test135
     * @tc.number SUB_BUILTINS_Object15_TEST_13500
     * @tc.desc   test override to prototype property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testOverrideToPrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test136
     * @tc.number SUB_BUILTINS_Object15_TEST_13600
     * @tc.desc   test Intl.Collator own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testIntlCollatorOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test137
     * @tc.number SUB_BUILTINS_Object15_TEST_13700
     * @tc.desc   test hash and path property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn137_testHashPathPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test138
     * @tc.number SUB_BUILTINS_Object15_TEST_13800
     * @tc.desc   test Promise.allSettled instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testPromiseAllSettledInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test140
     * @tc.number SUB_BUILTINS_Object15_TEST_14000
     * @tc.desc   test Symbol and emoji combo property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn140_testSymbolEmojiComboPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test141
     * @tc.number SUB_BUILTINS_Object15_TEST_14100
     * @tc.desc   test Egyptian numeral property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn141_testEgyptianNumeralPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test142
     * @tc.number SUB_BUILTINS_Object15_TEST_14200
     * @tc.desc   test WritableStreamController own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testWritableStreamControllerOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test143
     * @tc.number SUB_BUILTINS_Object15_TEST_14300
     * @tc.desc   test FinalizationRegistry instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testFinalizationRegistryInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test144
     * @tc.number SUB_BUILTINS_Object15_TEST_14400
     * @tc.desc   test class private static field detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn144_testClassPrivateStaticFieldDetection();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test145
     * @tc.number SUB_BUILTINS_Object15_TEST_14500
     * @tc.desc   test colon and path property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn145_testColonPathPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test146
     * @tc.number SUB_BUILTINS_Object15_TEST_14600
     * @tc.desc   test Intl.NumberFormatRange own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testIntlNumberFormatRange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test147
     * @tc.number SUB_BUILTINS_Object15_TEST_14700
     * @tc.desc   test sealed property value modify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testSealedPropertyValueModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test148
     * @tc.number SUB_BUILTINS_Object15_TEST_14800
     * @tc.desc   test Promise.any instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testPromiseAnyInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test149
     * @tc.number SUB_BUILTINS_Object15_TEST_14900
     * @tc.desc   test Sanskrit numeral property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testSanskritNumeralPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test151
     * @tc.number SUB_BUILTINS_Object15_TEST_15100
     * @tc.desc   test TransformStream instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn151_testTransformStreamInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test152
     * @tc.number SUB_BUILTINS_Object15_TEST_15200
     * @tc.desc   test class inheritance getter/setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn152_testClassInheritanceGetterSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test153
     * @tc.number SUB_BUILTINS_Object15_TEST_15300
     * @tc.desc   test tilde identifier property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn153_testTildeIdentifierPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test154
     * @tc.number SUB_BUILTINS_Object15_TEST_15400
     * @tc.desc   test Intl.DateTimeFormat range parts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn154_testIntlDateTimeFormatRangeParts();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test156
     * @tc.number SUB_BUILTINS_Object15_TEST_15600
     * @tc.desc   test Intl.Locale own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn156_testIntlLocaleOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test157
     * @tc.number SUB_BUILTINS_Object15_TEST_15700
     * @tc.desc   test equals key value property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn157_testEqualsKeyValuePropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test158
     * @tc.number SUB_BUILTINS_Object15_TEST_15800
     * @tc.desc   test Promise with resolvers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn158_testPromiseWithResolvers();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test159
     * @tc.number SUB_BUILTINS_Object15_TEST_15900
     * @tc.desc   test ReadableStream instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn159_testReadableStreamInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test160
     * @tc.number SUB_BUILTINS_Object15_TEST_16000
     * @tc.desc   test Symbol and Unicode combo property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn160_testSymbolUnicodeComboPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test161
     * @tc.number SUB_BUILTINS_Object15_TEST_16100
     * @tc.desc   test Hebrew numeral property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn161_testHebrewNumeralPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test162
     * @tc.number SUB_BUILTINS_Object15_TEST_16200
     * @tc.desc   test CompressionStream own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn162_testCompressionStreamOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test163
     * @tc.number SUB_BUILTINS_Object15_TEST_16300
     * @tc.desc   test WritableStream instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn163_testWritableStreamInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test164
     * @tc.number SUB_BUILTINS_Object15_TEST_16400
     * @tc.desc   test class private method vs prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn164_testClassPrivateMethodVsPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test165
     * @tc.number SUB_BUILTINS_Object15_TEST_16500
     * @tc.desc   test semicolon config property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn165_testSemicolonConfigPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test166
     * @tc.number SUB_BUILTINS_Object15_TEST_16600
     * @tc.desc   test Intl.PluralRules select range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn166_testIntlPluralRulesSelectRange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test167
     * @tc.number SUB_BUILTINS_Object15_TEST_16700
     * @tc.desc   test prevent extensions modify value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn167_testPreventExtensionsModifyValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test168
     * @tc.number SUB_BUILTINS_Object15_TEST_16800
     * @tc.desc   test AggregateError own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn168_testAggregateErrorOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test169
     * @tc.number SUB_BUILTINS_Object15_TEST_16900
     * @tc.desc   test Thai numeral property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testThaiNumeralPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test170
     * @tc.number SUB_BUILTINS_Object15_TEST_17000
     * @tc.desc   test DecompressionStream own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn170_testDecompressionStreamOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test171
     * @tc.number SUB_BUILTINS_Object15_TEST_17100
     * @tc.desc   test CompressionStream instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn171_testCompressionStreamInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test172
     * @tc.number SUB_BUILTINS_Object15_TEST_17200
     * @tc.desc   test class static method vs prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn172_testClassStaticMethodVsPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test173
     * @tc.number SUB_BUILTINS_Object15_TEST_17300
     * @tc.desc   test question param property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn173_testQuestionParamPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test174
     * @tc.number SUB_BUILTINS_Object15_TEST_17400
     * @tc.desc   test Intl.RelativeTimeFormat parts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn174_testIntlRelativeTimeFormatParts();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test177
     * @tc.number SUB_BUILTINS_Object15_TEST_17700
     * @tc.desc   test Arabic letter property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn177_testArabicLetterPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test178
     * @tc.number SUB_BUILTINS_Object15_TEST_17800
     * @tc.desc   test ReadableByteStreamController own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn178_testReadableByteStreamControllerOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test179
     * @tc.number SUB_BUILTINS_Object15_TEST_17900
     * @tc.desc   test DecompressionStream instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn179_testDecompressionStreamInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test180
     * @tc.number SUB_BUILTINS_Object15_TEST_18000
     * @tc.desc   test combining character property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn180_testCombiningCharPropertyName();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object15Test181
     * @tc.number SUB_BUILTINS_Object15_TEST_18100
     * @tc.desc   test Japanese Kana property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn181_testJapaneseKanaPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test182
     * @tc.number SUB_BUILTINS_Object15_TEST_18200
     * @tc.desc   test TextEncoder own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn182_testTextEncoderOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test183
     * @tc.number SUB_BUILTINS_Object15_TEST_18300
     * @tc.desc   test TextEncoder instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn183_testTextEncoderInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test184
     * @tc.number SUB_BUILTINS_Object15_TEST_18400
     * @tc.desc   test class private field vs static field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn184_testClassPrivateFieldVsStaticField();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test185
     * @tc.number SUB_BUILTINS_Object15_TEST_18500
     * @tc.desc   test pipe option property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn185_testPipeOptionPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test186
     * @tc.number SUB_BUILTINS_Object15_TEST_18600
     * @tc.desc   test Intl.Collator compare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn186_testIntlCollatorCompare();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test187
     * @tc.number SUB_BUILTINS_Object15_TEST_18700
     * @tc.desc   test sealed property define descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn187_testSealedPropertyDefineDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test188
     * @tc.number SUB_BUILTINS_Object15_TEST_18800
     * @tc.desc   test TextDecoder own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn188_testTextDecoderOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test189
     * @tc.number SUB_BUILTINS_Object15_TEST_18900
     * @tc.desc   test Korean Hangul property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn189_testKoreanHangulPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test190
     * @tc.number SUB_BUILTINS_Object15_TEST_19000
     * @tc.desc   test CountQueuingStrategy own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn190_testCountQueuingStrategyOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test191
     * @tc.number SUB_BUILTINS_Object15_TEST_19100
     * @tc.desc   test TextDecoder instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn191_testTextDecoderInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test192
     * @tc.number SUB_BUILTINS_Object15_TEST_19200
     * @tc.desc   test class inheritance static field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn192_testClassInheritanceStaticField();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test193
     * @tc.number SUB_BUILTINS_Object15_TEST_19300
     * @tc.desc   test dollar variable property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn193_testDollarVariablePropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test194
     * @tc.number SUB_BUILTINS_Object15_TEST_19400
     * @tc.desc   test Intl.DisplayNames of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn194_testIntlDisplayNamesOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test195
     * @tc.number SUB_BUILTINS_Object15_TEST_19500
     * @tc.desc   test frozen property define descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn195_testFrozenPropertyDefineDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test196
     * @tc.number SUB_BUILTINS_Object15_TEST_19600
     * @tc.desc   test ByteLengthQueuingStrategy own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn196_testByteLengthQueuingStrategyOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test197
     * @tc.number SUB_BUILTINS_Object15_TEST_19700
     * @tc.desc   test percent ratio property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn197_testPercentRatioPropertyName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test198
     * @tc.number SUB_BUILTINS_Object15_TEST_19800
     * @tc.desc   test Promise.race vs Promise.allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn198_testPromiseRaceVsAllSettled();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test199
     * @tc.number SUB_BUILTINS_Object15_TEST_19900
     * @tc.desc   test CountQueuingStrategy instance value property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn199_testCountQueuingStrategyInstanceValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object15Test200
     * @tc.number SUB_BUILTINS_Object15_TEST_20000
     * @tc.desc   test Symbol and multi-language combo property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object15Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn200_testSymbolMultiLangComboPropertyName();
      expect(result).assertEqual(true);
    });
  })
}