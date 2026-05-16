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
  Fn01_testMapToObject,
  Fn02_testArrayToObject,
  Fn03_testObjectTransformation,
  Fn04_testEmptyMapToObject,
  Fn05_testNumberKeyArrayToObject,
  Fn06_testBooleanKeyArrayToObject,
  Fn07_testDuplicateKeyInMap,
  Fn08_testDuplicateKeyInArray,
  Fn09_testUndefinedValueInMap,
  Fn100_testMultipleSymbolKeysInMap,
  Fn101_testFilterNonStringKeys,
  Fn102_testLeadingZeroNumberStringKey,
  Fn103_testRegExpWithFlagsValueInMap,
  Fn104_testSetWithSymbolValueInArray,
  Fn105_testDifferentDateKeysInMap,
  Fn107_testLargeBigIntValueInMap,
  Fn108_testDifferentObjectKeysInMap,
  Fn109_testConvertValueToPromiseWithMap,
  Fn10_testNullValueInArray,
  Fn110_testWhitespaceStringKey,
  Fn111_testDifferentTypedArrayValuesInMap,
  Fn112_testDifferentErrorValuesInArray,
  Fn113_testPosNegInfinityKeysInMap,
  Fn115_testNestedMapValueInMap,
  Fn116_testKeyForSymbolKeyInMap,
  Fn117_testFilterFunctionValues,
  Fn118_testEscapeCharKeyInArray,
  Fn119_testEmptySetValueInMap,
  Fn11_testObjectValueInMap,
  Fn120_testArrayBufferWithViewInMap,
  Fn121_testObjectLiteralKeyInArray,
  Fn122_testArrayLiteralKeyInArray,
  Fn123_testObjectLiteralValueInMap,
  Fn124_testArrayLiteralValueInMap,
  Fn125_testBooleanLiteralKeyInArray,
  Fn126_testNumberLiteralKeyInArray,
  Fn127_testStringLiteralValueInMap,
  Fn128_testNullLiteralKeyInArray,
  Fn129_testUndefinedLiteralKeyInArray,
  Fn12_testArrayValueInArray,
  Fn130_testSymbolLiteralValueInMap,
  Fn131_testNestedObjectLiteralValueInArray,
  Fn132_testNestedArrayLiteralValueInArray,
  Fn133_testBigIntLiteralValueInMap,
  Fn134_testRegExpLiteralKeyInArray,
  Fn135_testRegExpLiteralValueInMap,
  Fn136_testDateLiteralValueInArray,
  Fn137_testSetLiteralValueInMap,
  Fn138_testMapLiteralValueInArray,
  Fn139_testFunctionLiteralKeyInArray,
  Fn13_testSymbolKeyInArray,
  Fn140_testFunctionLiteralValueInMap,
  Fn141_testTemplateLiteralKeyInArray,
  Fn142_testTemplateLiteralValueInMap,
  Fn143_testEmptyObjectLiteralKeyInArray,
  Fn144_testEmptyArrayLiteralValueInMap,
  Fn145_testNaNLiteralKeyInArray,
  Fn146_testNaNLiteralValueInMap,
  Fn147_testInfinityLiteralKeyInArray,
  Fn148_testInfinityLiteralValueInMap,
  Fn149_testMixedLiteralKeysInArray,
  Fn14_testMixedKeysInMap,
  Fn150_testMixedLiteralValuesInMap,
  Fn151_testComputedPropNameKeyInArray,
  Fn152_testObjectLiteralWithGetterInMap,
  Fn153_testObjectLiteralWithSetterInArray,
  Fn154_testArrayLiteralWithEmptyInMap,
  Fn155_testArrayLiteralWithNestedObjInArray,
  Fn156_testSharedSymbolLiteralInMap,
  Fn157_testBigIntLiteralWithCalcInArray,
  Fn158_testRegExpLiteralWithDynamicSourceInMap,
  Fn159_testDateLiteralWithCalcInArray,
  Fn15_testFunctionValueInMap,
  Fn160_testSetLiteralWithSymbolInMap,
  Fn161_testMapLiteralWithObjectKeyInArray,
  Fn162_testArrowFunctionWithClosureInMap,
  Fn163_testMultiLineTemplateLiteralInArray,
  Fn164_testEmptyObjectWithProtoInMap,
  Fn165_testArrayFromArrayLikeInArray,
  Fn166_testNaNFromCalcInMap,
  Fn167_testInfinityFromCalcInArray,
  Fn168_testMixedLiteralWithSymbolKeyObjInMap,
  Fn169_testFrozenObjectLiteralInArray,
  Fn16_testDateValueInArray,
  Fn170_testFrozenArrayLiteralInMap,
  Fn171_testFrozenRegExpLiteralInArray,
  Fn173_testSetWithDeletedElemInArray,
  Fn174_testClearedMapLiteralInMap,
  Fn175_testFunctionWithThisBindingInArray,
  Fn176_testTemplateWithExpressionInMap,
  Fn177_testObjectWithNestedArrayInArray,
  Fn178_testSortedArrayLiteralInMap,
  Fn17_testEmptyArrayToObject,
  Fn180_testAllBasicTypesInMap,
  Fn18_testInvalidEntryLength1,
  Fn19_testInvalidEntryLength3,
  Fn20_testNaNKeyInArray,
  Fn21_testInfinityKeyInArray,
  Fn22_testBigIntKeyInMap,
  Fn23_testWithFilter,
  Fn24_testNestedArrayValue,
  Fn25_testObjectKeyInMap,
  Fn26_testRegExpValueInMap,
  Fn27_testSetValueInArray,
  Fn28_testWeakMapKeyError,
  Fn29_testGeneratorIterator,
  Fn30_testEmptyStringKey,
  Fn31_testUndefinedKeyInArray,
  Fn32_testNullKeyInArray,
  Fn33_testSymbolValueInMap,
  Fn34_testKeyRenameWithMap,
  Fn35_testNestedObjectValueInMap,
  Fn36_testNonArrayEntryInArray,
  Fn37_testBigIntValueInArray,
  Fn38_testRegExpKeyInMap,
  Fn39_testDateKeyInArray,
  Fn40_testWithReduce,
  Fn41_testSetKeyInArray,
  Fn42_testFunctionKeyInMap,
  Fn43_testEmptyObjectValueInArray,
  Fn44_testEmptyMapValueInMap,
  Fn45_testLongStringKeyInArray,
  Fn46_testArrayKeyInMap,
  Fn47_testNaNValueInArray,
  Fn48_testInfinityValueInMap,
  Fn49_testWithFind,
  Fn50_testBooleanValueInMap,
  Fn53_testNestedArrayKeyInMap,
  Fn55_testErrorValueInMap,
  Fn56_testMixedKeyTypesInArray,
  Fn57_testWithSlice,
  Fn58_testMixedBigIntNumberInMap,
  Fn59_testPromiseValueInArray,
  Fn60_testTypedArrayValueInMap,
  Fn61_testSymbolKeyInMapUncapturedByKeys,
  Fn62_testTemplateLiteralKeyInArray,
  Fn63_testErrorKeyInMap,
  Fn64_testModifyKeyAndValueWithMap,
  Fn65_testEmptyStringValueInArray,
  Fn66_testTypedArrayKeyInMap,
  Fn67_testNestedTwoLengthArrayEntry,
  Fn68_testPromiseKeyInArray,
  Fn70_testFilterEmptyValuesWithFilter,
  Fn71_testNumberStringKeyConsistency,
  Fn72_testMapKeyInMap,
  Fn73_testSharedSymbolKeyInArray,
  Fn74_testRegExpValueMethodInArray,
  Fn75_testMixedBigIntStringKeyInMap,
  Fn76_testArrayLikeEntryInArray,
  Fn77_testDateValueMethodInMap,
  Fn78_testEmptySetKeyInMap,
  Fn79_testConvertValueToArrayWithMap,
  Fn80_testUndefinedValueVsNonExistent,
  Fn81_testFunctionValueWithParamsInMap,
  Fn82_testSpecialCharKeyInArray,
  Fn83_testSetValueMethodInMap,
  Fn84_testNestedObjectKeyInMap,
  Fn85_testCountValuesWithReduce,
  Fn86_testTypedArrayValuePropsInArray,
  Fn87_testBooleanKeyInMap,
  Fn88_testGeneratorEntryInArray,
  Fn89_testErrorValuePropsInArray,
  Fn90_testMultipleNaNKeysInMap,
  Fn91_testArrayBufferValueInArray,
  Fn92_testDataViewKeyInMap,
  Fn93_testConvertKeyToSymbolWithMap,
  Fn94_testUnicodeCharKeyInArray,
  Fn95_testEmptyArrayBufferKeyInMap,
  Fn96_testMapValueMethodInArray,
  Fn97_testArrowFunctionValueInMap,
  Fn98_testNestedArrayLikeEntry,
  Fn99_testDataViewValueMethodInMap
} from './Object8';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object8Test() {
  describe('Object8Test', () => {
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
     * @tc.name   Object8Test001
     * @tc.number SUB_BUILTINS_Object8_TEST_0100
     * @tc.desc   test object fromEntries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testMapToObject();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object8Test002
     * @tc.number SUB_BUILTINS_Object8_TEST_0200
     * @tc.desc   test object fromEntries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testArrayToObject();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object8Test003
     * @tc.number SUB_BUILTINS_Object8_TEST_0300
     * @tc.desc   test object fromEntries for object transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testObjectTransformation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test004
     * @tc.number SUB_BUILTINS_Object8_TEST_0400
     * @tc.desc   test object fromEntries with empty map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testEmptyMapToObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test005
     * @tc.number SUB_BUILTINS_Object8_TEST_0500
     * @tc.desc   test object fromEntries with number key array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testNumberKeyArrayToObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test006
     * @tc.number SUB_BUILTINS_Object8_TEST_0600
     * @tc.desc   test object fromEntries with boolean key array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testBooleanKeyArrayToObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test007
     * @tc.number SUB_BUILTINS_Object8_TEST_0700
     * @tc.desc   test object fromEntries with duplicate keys in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testDuplicateKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test008
     * @tc.number SUB_BUILTINS_Object8_TEST_0800
     * @tc.desc   test object fromEntries with duplicate keys in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testDuplicateKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test009
     * @tc.number SUB_BUILTINS_Object8_TEST_0900
     * @tc.desc   test object fromEntries with undefined value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testUndefinedValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test010
     * @tc.number SUB_BUILTINS_Object8_TEST_1000
     * @tc.desc   test object fromEntries with null value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testNullValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test011
     * @tc.number SUB_BUILTINS_Object8_TEST_1100
     * @tc.desc   test object fromEntries with object value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testObjectValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test012
     * @tc.number SUB_BUILTINS_Object8_TEST_1200
     * @tc.desc   test object fromEntries with array value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testArrayValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test013
     * @tc.number SUB_BUILTINS_Object8_TEST_1300
     * @tc.desc   test object fromEntries with symbol key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testSymbolKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test014
     * @tc.number SUB_BUILTINS_Object8_TEST_1400
     * @tc.desc   test object fromEntries with mixed keys in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testMixedKeysInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test015
     * @tc.number SUB_BUILTINS_Object8_TEST_1500
     * @tc.desc   test object fromEntries with function value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testFunctionValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test016
     * @tc.number SUB_BUILTINS_Object8_TEST_1600
     * @tc.desc   test object fromEntries with date value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testDateValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test017
     * @tc.number SUB_BUILTINS_Object8_TEST_1700
     * @tc.desc   test object fromEntries with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testEmptyArrayToObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test018
     * @tc.number SUB_BUILTINS_Object8_TEST_1800
     * @tc.desc   test object fromEntries with invalid entry length 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testInvalidEntryLength1();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object8Test019
     * @tc.number SUB_BUILTINS_Object8_TEST_1900
     * @tc.desc   test object fromEntries with invalid entry length 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testInvalidEntryLength3();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object8Test020
     * @tc.number SUB_BUILTINS_Object8_TEST_2000
     * @tc.desc   test object fromEntries with NaN key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testNaNKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test021
     * @tc.number SUB_BUILTINS_Object8_TEST_2100
     * @tc.desc   test object fromEntries with Infinity key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testInfinityKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test022
     * @tc.number SUB_BUILTINS_Object8_TEST_2200
     * @tc.desc   test object fromEntries with BigInt key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testBigIntKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test023
     * @tc.number SUB_BUILTINS_Object8_TEST_2300
     * @tc.desc   test object fromEntries with filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testWithFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test024
     * @tc.number SUB_BUILTINS_Object8_TEST_2400
     * @tc.desc   test object fromEntries with nested array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testNestedArrayValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test025
     * @tc.number SUB_BUILTINS_Object8_TEST_2500
     * @tc.desc   test object fromEntries with object key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testObjectKeyInMap();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object8Test026
     * @tc.number SUB_BUILTINS_Object8_TEST_2600
     * @tc.desc   test object fromEntries with RegExp value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testRegExpValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test027
     * @tc.number SUB_BUILTINS_Object8_TEST_2700
     * @tc.desc   test object fromEntries with Set value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testSetValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test028
     * @tc.number SUB_BUILTINS_Object8_TEST_2800
     * @tc.desc   test object fromEntries with WeakMap key error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testWeakMapKeyError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test029
     * @tc.number SUB_BUILTINS_Object8_TEST_2900
     * @tc.desc   test object fromEntries with generator iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testGeneratorIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test030
     * @tc.number SUB_BUILTINS_Object8_TEST_3000
     * @tc.desc   test object fromEntries with empty string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testEmptyStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test031
     * @tc.number SUB_BUILTINS_Object8_TEST_3100
     * @tc.desc   test object fromEntries with undefined key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testUndefinedKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test032
     * @tc.number SUB_BUILTINS_Object8_TEST_3200
     * @tc.desc   test object fromEntries with null key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testNullKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test033
     * @tc.number SUB_BUILTINS_Object8_TEST_3300
     * @tc.desc   test object fromEntries with Symbol value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testSymbolValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test034
     * @tc.number SUB_BUILTINS_Object8_TEST_3400
     * @tc.desc   test object fromEntries with key rename using map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testKeyRenameWithMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test035
     * @tc.number SUB_BUILTINS_Object8_TEST_3500
     * @tc.desc   test object fromEntries with nested object value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testNestedObjectValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test036
     * @tc.number SUB_BUILTINS_Object8_TEST_3600
     * @tc.desc   test object fromEntries with non-array entry in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testNonArrayEntryInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test037
     * @tc.number SUB_BUILTINS_Object8_TEST_3700
     * @tc.desc   test object fromEntries with BigInt value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testBigIntValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test038
     * @tc.number SUB_BUILTINS_Object8_TEST_3800
     * @tc.desc   test object fromEntries with RegExp key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testRegExpKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test039
     * @tc.number SUB_BUILTINS_Object8_TEST_3900
     * @tc.desc   test object fromEntries with Date key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testDateKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test040
     * @tc.number SUB_BUILTINS_Object8_TEST_4000
     * @tc.desc   test object fromEntries with reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testWithReduce();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test041
     * @tc.number SUB_BUILTINS_Object8_TEST_4100
     * @tc.desc   test object fromEntries with Set key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testSetKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test042
     * @tc.number SUB_BUILTINS_Object8_TEST_4200
     * @tc.desc   test object fromEntries with function key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testFunctionKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test043
     * @tc.number SUB_BUILTINS_Object8_TEST_4300
     * @tc.desc   test object fromEntries with empty object value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testEmptyObjectValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test044
     * @tc.number SUB_BUILTINS_Object8_TEST_4400
     * @tc.desc   test object fromEntries with empty map value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testEmptyMapValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test045
     * @tc.number SUB_BUILTINS_Object8_TEST_4500
     * @tc.desc   test object fromEntries with long string key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testLongStringKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test046
     * @tc.number SUB_BUILTINS_Object8_TEST_4600
     * @tc.desc   test object fromEntries with array key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testArrayKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test047
     * @tc.number SUB_BUILTINS_Object8_TEST_4700
     * @tc.desc   test object fromEntries with NaN value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testNaNValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test048
     * @tc.number SUB_BUILTINS_Object8_TEST_4800
     * @tc.desc   test object fromEntries with Infinity value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testInfinityValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test049
     * @tc.number SUB_BUILTINS_Object8_TEST_4900
     * @tc.desc   test object fromEntries with find
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testWithFind();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test050
     * @tc.number SUB_BUILTINS_Object8_TEST_5000
     * @tc.desc   test object fromEntries with boolean value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testBooleanValueInMap();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object8Test053
     * @tc.number SUB_BUILTINS_Object8_TEST_5300
     * @tc.desc   test object fromEntries with nested array key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testNestedArrayKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test055
     * @tc.number SUB_BUILTINS_Object8_TEST_5500
     * @tc.desc   test object fromEntries with Error value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testErrorValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test056
     * @tc.number SUB_BUILTINS_Object8_TEST_5600
     * @tc.desc   test object fromEntries with mixed key types in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testMixedKeyTypesInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test057
     * @tc.number SUB_BUILTINS_Object8_TEST_5700
     * @tc.desc   test object fromEntries with slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testWithSlice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test058
     * @tc.number SUB_BUILTINS_Object8_TEST_5800
     * @tc.desc   test object fromEntries with mixed BigInt and Number in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testMixedBigIntNumberInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test059
     * @tc.number SUB_BUILTINS_Object8_TEST_5900
     * @tc.desc   test object fromEntries with Promise value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testPromiseValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test060
     * @tc.number SUB_BUILTINS_Object8_TEST_6000
     * @tc.desc   test object fromEntries with TypedArray value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testTypedArrayValueInMap();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object8Test061
     * @tc.number SUB_BUILTINS_Object8_TEST_6100
     * @tc.desc   test object fromEntries with Symbol key in map not captured by Object.keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testSymbolKeyInMapUncapturedByKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test062
     * @tc.number SUB_BUILTINS_Object8_TEST_6200
     * @tc.desc   test object fromEntries with template literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testTemplateLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test063
     * @tc.number SUB_BUILTINS_Object8_TEST_6300
     * @tc.desc   test object fromEntries with Error key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testErrorKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test064
     * @tc.number SUB_BUILTINS_Object8_TEST_6400
     * @tc.desc   test object fromEntries with modifying key and value using map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testModifyKeyAndValueWithMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test065
     * @tc.number SUB_BUILTINS_Object8_TEST_6500
     * @tc.desc   test object fromEntries with empty string value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testEmptyStringValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test066
     * @tc.number SUB_BUILTINS_Object8_TEST_6600
     * @tc.desc   test object fromEntries with TypedArray key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testTypedArrayKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test067
     * @tc.number SUB_BUILTINS_Object8_TEST_6700
     * @tc.desc   test object fromEntries with nested two-length array entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testNestedTwoLengthArrayEntry();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test068
     * @tc.number SUB_BUILTINS_Object8_TEST_6800
     * @tc.desc   test object fromEntries with Promise key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testPromiseKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test070
     * @tc.number SUB_BUILTINS_Object8_TEST_7000
     * @tc.desc   test object fromEntries with filtering empty values using filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testFilterEmptyValuesWithFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test071
     * @tc.number SUB_BUILTINS_Object8_TEST_7100
     * @tc.desc   test object fromEntries with number and string key consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testNumberStringKeyConsistency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test072
     * @tc.number SUB_BUILTINS_Object8_TEST_7200
     * @tc.desc   test object fromEntries with Map key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testMapKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test073
     * @tc.number SUB_BUILTINS_Object8_TEST_7300
     * @tc.desc   test object fromEntries with shared Symbol key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testSharedSymbolKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test074
     * @tc.number SUB_BUILTINS_Object8_TEST_7400
     * @tc.desc   test object fromEntries with RegExp value method in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testRegExpValueMethodInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test075
     * @tc.number SUB_BUILTINS_Object8_TEST_7500
     * @tc.desc   test object fromEntries with mixed BigInt and string key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testMixedBigIntStringKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test076
     * @tc.number SUB_BUILTINS_Object8_TEST_7600
     * @tc.desc   test object fromEntries with array-like entry in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testArrayLikeEntryInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test077
     * @tc.number SUB_BUILTINS_Object8_TEST_7700
     * @tc.desc   test object fromEntries with Date value method in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testDateValueMethodInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test078
     * @tc.number SUB_BUILTINS_Object8_TEST_7800
     * @tc.desc   test object fromEntries with empty Set key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testEmptySetKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test079
     * @tc.number SUB_BUILTINS_Object8_TEST_7900
     * @tc.desc   test object fromEntries with converting value to array using map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testConvertValueToArrayWithMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test080
     * @tc.number SUB_BUILTINS_Object8_TEST_8000
     * @tc.desc   test object fromEntries with undefined value vs non-existent property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testUndefinedValueVsNonExistent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test081
     * @tc.number SUB_BUILTINS_Object8_TEST_8100
     * @tc.desc   test object fromEntries with function value with parameters in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testFunctionValueWithParamsInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test082
     * @tc.number SUB_BUILTINS_Object8_TEST_8200
     * @tc.desc   test object fromEntries with special character key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testSpecialCharKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test083
     * @tc.number SUB_BUILTINS_Object8_TEST_8300
     * @tc.desc   test object fromEntries with Set value method in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testSetValueMethodInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test084
     * @tc.number SUB_BUILTINS_Object8_TEST_8400
     * @tc.desc   test object fromEntries with nested object key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testNestedObjectKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test085
     * @tc.number SUB_BUILTINS_Object8_TEST_8500
     * @tc.desc   test object fromEntries with counting values using reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testCountValuesWithReduce();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test086
     * @tc.number SUB_BUILTINS_Object8_TEST_8600
     * @tc.desc   test object fromEntries with TypedArray value properties in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testTypedArrayValuePropsInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test087
     * @tc.number SUB_BUILTINS_Object8_TEST_8700
     * @tc.desc   test object fromEntries with boolean key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testBooleanKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test088
     * @tc.number SUB_BUILTINS_Object8_TEST_8800
     * @tc.desc   test object fromEntries with generator entry in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testGeneratorEntryInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test089
     * @tc.number SUB_BUILTINS_Object8_TEST_8900
     * @tc.desc   test object fromEntries with Error value properties in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testErrorValuePropsInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test090
     * @tc.number SUB_BUILTINS_Object8_TEST_9000
     * @tc.desc   test object fromEntries with multiple NaN keys in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testMultipleNaNKeysInMap();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object8Test091
     * @tc.number SUB_BUILTINS_Object8_TEST_9100
     * @tc.desc   test object fromEntries with ArrayBuffer value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testArrayBufferValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test092
     * @tc.number SUB_BUILTINS_Object8_TEST_9200
     * @tc.desc   test object fromEntries with DataView key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testDataViewKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test093
     * @tc.number SUB_BUILTINS_Object8_TEST_9300
     * @tc.desc   test object fromEntries with converting key to Symbol using map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testConvertKeyToSymbolWithMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test094
     * @tc.number SUB_BUILTINS_Object8_TEST_9400
     * @tc.desc   test object fromEntries with Unicode character key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testUnicodeCharKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test095
     * @tc.number SUB_BUILTINS_Object8_TEST_9500
     * @tc.desc   test object fromEntries with empty ArrayBuffer key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testEmptyArrayBufferKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test096
     * @tc.number SUB_BUILTINS_Object8_TEST_9600
     * @tc.desc   test object fromEntries with Map value method in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testMapValueMethodInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test097
     * @tc.number SUB_BUILTINS_Object8_TEST_9700
     * @tc.desc   test object fromEntries with arrow function value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testArrowFunctionValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test098
     * @tc.number SUB_BUILTINS_Object8_TEST_9800
     * @tc.desc   test object fromEntries with nested array-like entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testNestedArrayLikeEntry();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test099
     * @tc.number SUB_BUILTINS_Object8_TEST_9900
     * @tc.desc   test object fromEntries with DataView value method in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testDataViewValueMethodInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test100
     * @tc.number SUB_BUILTINS_Object8_TEST_10000
     * @tc.desc   test object fromEntries with multiple Symbol keys in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testMultipleSymbolKeysInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test101
     * @tc.number SUB_BUILTINS_Object8_TEST_10100
     * @tc.desc   test object fromEntries with filtering non-string keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testFilterNonStringKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test102
     * @tc.number SUB_BUILTINS_Object8_TEST_10200
     * @tc.desc   test object fromEntries with leading zero number string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testLeadingZeroNumberStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test103
     * @tc.number SUB_BUILTINS_Object8_TEST_10300
     * @tc.desc   test object fromEntries with RegExp with flags value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testRegExpWithFlagsValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test104
     * @tc.number SUB_BUILTINS_Object8_TEST_10400
     * @tc.desc   test object fromEntries with Set containing Symbol value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testSetWithSymbolValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test105
     * @tc.number SUB_BUILTINS_Object8_TEST_10500
     * @tc.desc   test object fromEntries with different Date keys in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn105_testDifferentDateKeysInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test107
     * @tc.number SUB_BUILTINS_Object8_TEST_10700
     * @tc.desc   test object fromEntries with large BigInt value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testLargeBigIntValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test108
     * @tc.number SUB_BUILTINS_Object8_TEST_10800
     * @tc.desc   test object fromEntries with different Object keys in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testDifferentObjectKeysInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test109
     * @tc.number SUB_BUILTINS_Object8_TEST_10900
     * @tc.desc   test object fromEntries with converting value to Promise using map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testConvertValueToPromiseWithMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test110
     * @tc.number SUB_BUILTINS_Object8_TEST_11000
     * @tc.desc   test object fromEntries with whitespace string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testWhitespaceStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test111
     * @tc.number SUB_BUILTINS_Object8_TEST_11100
     * @tc.desc   test object fromEntries with different TypedArray values in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testDifferentTypedArrayValuesInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test112
     * @tc.number SUB_BUILTINS_Object8_TEST_11200
     * @tc.desc   test object fromEntries with different Error values in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testDifferentErrorValuesInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test113
     * @tc.number SUB_BUILTINS_Object8_TEST_11300
     * @tc.desc   test object fromEntries with positive and negative Infinity keys in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_testPosNegInfinityKeysInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test115
     * @tc.number SUB_BUILTINS_Object8_TEST_11500
     * @tc.desc   test object fromEntries with nested Map value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_testNestedMapValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test116
     * @tc.number SUB_BUILTINS_Object8_TEST_11600
     * @tc.desc   test object fromEntries with key for Symbol key in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_testKeyForSymbolKeyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test117
     * @tc.number SUB_BUILTINS_Object8_TEST_11700
     * @tc.desc   test object fromEntries with filtering function values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_testFilterFunctionValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test118
     * @tc.number SUB_BUILTINS_Object8_TEST_11800
     * @tc.desc   test object fromEntries with escape character key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn118_testEscapeCharKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test119
     * @tc.number SUB_BUILTINS_Object8_TEST_11900
     * @tc.desc   test object fromEntries with empty Set value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_testEmptySetValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test120
     * @tc.number SUB_BUILTINS_Object8_TEST_12000
     * @tc.desc   test object fromEntries with ArrayBuffer with view in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testArrayBufferWithViewInMap();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object8Test121
     * @tc.number SUB_BUILTINS_Object8_TEST_12100
     * @tc.desc   test object fromEntries with object literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_testObjectLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test122
     * @tc.number SUB_BUILTINS_Object8_TEST_12200
     * @tc.desc   test object fromEntries with array literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testArrayLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test123
     * @tc.number SUB_BUILTINS_Object8_TEST_12300
     * @tc.desc   test object fromEntries with object literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testObjectLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test124
     * @tc.number SUB_BUILTINS_Object8_TEST_12400
     * @tc.desc   test object fromEntries with array literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_testArrayLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test125
     * @tc.number SUB_BUILTINS_Object8_TEST_12500
     * @tc.desc   test object fromEntries with boolean literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_testBooleanLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test126
     * @tc.number SUB_BUILTINS_Object8_TEST_12600
     * @tc.desc   test object fromEntries with number literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testNumberLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test127
     * @tc.number SUB_BUILTINS_Object8_TEST_12700
     * @tc.desc   test object fromEntries with string literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testStringLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test128
     * @tc.number SUB_BUILTINS_Object8_TEST_12800
     * @tc.desc   test object fromEntries with null literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_testNullLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test129
     * @tc.number SUB_BUILTINS_Object8_TEST_12900
     * @tc.desc   test object fromEntries with undefined literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testUndefinedLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test130
     * @tc.number SUB_BUILTINS_Object8_TEST_13000
     * @tc.desc   test object fromEntries with Symbol literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn130_testSymbolLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test131
     * @tc.number SUB_BUILTINS_Object8_TEST_13100
     * @tc.desc   test object fromEntries with nested object literal value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn131_testNestedObjectLiteralValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test132
     * @tc.number SUB_BUILTINS_Object8_TEST_13200
     * @tc.desc   test object fromEntries with nested array literal value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testNestedArrayLiteralValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test133
     * @tc.number SUB_BUILTINS_Object8_TEST_13300
     * @tc.desc   test object fromEntries with BigInt literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testBigIntLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test134
     * @tc.number SUB_BUILTINS_Object8_TEST_13400
     * @tc.desc   test object fromEntries with RegExp literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn134_testRegExpLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test135
     * @tc.number SUB_BUILTINS_Object8_TEST_13500
     * @tc.desc   test object fromEntries with RegExp literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testRegExpLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test136
     * @tc.number SUB_BUILTINS_Object8_TEST_13600
     * @tc.desc   test object fromEntries with Date literal value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testDateLiteralValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test137
     * @tc.number SUB_BUILTINS_Object8_TEST_13700
     * @tc.desc   test object fromEntries with Set literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn137_testSetLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test138
     * @tc.number SUB_BUILTINS_Object8_TEST_13800
     * @tc.desc   test object fromEntries with Map literal value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testMapLiteralValueInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test139
     * @tc.number SUB_BUILTINS_Object8_TEST_13900
     * @tc.desc   test object fromEntries with function literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn139_testFunctionLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test140
     * @tc.number SUB_BUILTINS_Object8_TEST_14000
     * @tc.desc   test object fromEntries with function literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn140_testFunctionLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test141
     * @tc.number SUB_BUILTINS_Object8_TEST_14100
     * @tc.desc   test object fromEntries with template literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn141_testTemplateLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test142
     * @tc.number SUB_BUILTINS_Object8_TEST_14200
     * @tc.desc   test object fromEntries with template literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testTemplateLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test143
     * @tc.number SUB_BUILTINS_Object8_TEST_14300
     * @tc.desc   test object fromEntries with empty object literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testEmptyObjectLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test144
     * @tc.number SUB_BUILTINS_Object8_TEST_14400
     * @tc.desc   test object fromEntries with empty array literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn144_testEmptyArrayLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test145
     * @tc.number SUB_BUILTINS_Object8_TEST_14500
     * @tc.desc   test object fromEntries with NaN literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn145_testNaNLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test146
     * @tc.number SUB_BUILTINS_Object8_TEST_14600
     * @tc.desc   test object fromEntries with NaN literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testNaNLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test147
     * @tc.number SUB_BUILTINS_Object8_TEST_14700
     * @tc.desc   test object fromEntries with Infinity literal key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testInfinityLiteralKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test148
     * @tc.number SUB_BUILTINS_Object8_TEST_14800
     * @tc.desc   test object fromEntries with Infinity literal value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testInfinityLiteralValueInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test149
     * @tc.number SUB_BUILTINS_Object8_TEST_14900
     * @tc.desc   test object fromEntries with mixed literal keys in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testMixedLiteralKeysInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test150
     * @tc.number SUB_BUILTINS_Object8_TEST_15000
     * @tc.desc   test object fromEntries with mixed literal values in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn150_testMixedLiteralValuesInMap();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object8Test151
     * @tc.number SUB_BUILTINS_Object8_TEST_15100
     * @tc.desc   test object fromEntries with computed property name key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn151_testComputedPropNameKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test152
     * @tc.number SUB_BUILTINS_Object8_TEST_15200
     * @tc.desc   test object fromEntries with object literal containing getter in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn152_testObjectLiteralWithGetterInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test153
     * @tc.number SUB_BUILTINS_Object8_TEST_15300
     * @tc.desc   test object fromEntries with object literal containing setter in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn153_testObjectLiteralWithSetterInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test154
     * @tc.number SUB_BUILTINS_Object8_TEST_15400
     * @tc.desc   test object fromEntries with array literal containing empty value in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn154_testArrayLiteralWithEmptyInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test155
     * @tc.number SUB_BUILTINS_Object8_TEST_15500
     * @tc.desc   test object fromEntries with array literal containing nested object in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn155_testArrayLiteralWithNestedObjInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test156
     * @tc.number SUB_BUILTINS_Object8_TEST_15600
     * @tc.desc   test object fromEntries with shared Symbol literal in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn156_testSharedSymbolLiteralInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test157
     * @tc.number SUB_BUILTINS_Object8_TEST_15700
     * @tc.desc   test object fromEntries with BigInt literal with calculation in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn157_testBigIntLiteralWithCalcInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test158
     * @tc.number SUB_BUILTINS_Object8_TEST_15800
     * @tc.desc   test object fromEntries with RegExp literal with dynamic source in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn158_testRegExpLiteralWithDynamicSourceInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test159
     * @tc.number SUB_BUILTINS_Object8_TEST_15900
     * @tc.desc   test object fromEntries with Date literal with calculation in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn159_testDateLiteralWithCalcInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test160
     * @tc.number SUB_BUILTINS_Object8_TEST_16000
     * @tc.desc   test object fromEntries with Set literal containing Symbol in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn160_testSetLiteralWithSymbolInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test161
     * @tc.number SUB_BUILTINS_Object8_TEST_16100
     * @tc.desc   test object fromEntries with Map literal containing object key in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn161_testMapLiteralWithObjectKeyInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test162
     * @tc.number SUB_BUILTINS_Object8_TEST_16200
     * @tc.desc   test object fromEntries with arrow function containing closure in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn162_testArrowFunctionWithClosureInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test163
     * @tc.number SUB_BUILTINS_Object8_TEST_16300
     * @tc.desc   test object fromEntries with multi-line template literal in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Fn163_testMultiLineTemplateLiteralInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test164
     * @tc.number SUB_BUILTINS_Object8_TEST_16400
     * @tc.desc   test object fromEntries with empty object containing __proto__ in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn164_testEmptyObjectWithProtoInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test165
     * @tc.number SUB_BUILTINS_Object8_TEST_16500
     * @tc.desc   test object fromEntries with Array.from array-like in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn165_testArrayFromArrayLikeInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test166
     * @tc.number SUB_BUILTINS_Object8_TEST_16600
     * @tc.desc   test object fromEntries with NaN from calculation in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn166_testNaNFromCalcInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test167
     * @tc.number SUB_BUILTINS_Object8_TEST_16700
     * @tc.desc   test object fromEntries with Infinity from calculation in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn167_testInfinityFromCalcInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test168
     * @tc.number SUB_BUILTINS_Object8_TEST_16800
     * @tc.desc   test object fromEntries with mixed literal containing Symbol key object in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn168_testMixedLiteralWithSymbolKeyObjInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test169
     * @tc.number SUB_BUILTINS_Object8_TEST_16900
     * @tc.desc   test object fromEntries with frozen object literal in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testFrozenObjectLiteralInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test170
     * @tc.number SUB_BUILTINS_Object8_TEST_17000
     * @tc.desc   test object fromEntries with frozen array literal in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn170_testFrozenArrayLiteralInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test171
     * @tc.number SUB_BUILTINS_Object8_TEST_17100
     * @tc.desc   test object fromEntries with frozen RegExp literal in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn171_testFrozenRegExpLiteralInArray();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object8Test173
     * @tc.number SUB_BUILTINS_Object8_TEST_17300
     * @tc.desc   test object fromEntries with Set containing deleted element in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn173_testSetWithDeletedElemInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test174
     * @tc.number SUB_BUILTINS_Object8_TEST_17400
     * @tc.desc   test object fromEntries with cleared Map literal in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn174_testClearedMapLiteralInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test175
     * @tc.number SUB_BUILTINS_Object8_TEST_17500
     * @tc.desc   test object fromEntries with function containing this binding in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn175_testFunctionWithThisBindingInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test176
     * @tc.number SUB_BUILTINS_Object8_TEST_17600
     * @tc.desc   test object fromEntries with template literal containing expression in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn176_testTemplateWithExpressionInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test177
     * @tc.number SUB_BUILTINS_Object8_TEST_17700
     * @tc.desc   test object fromEntries with object containing nested array in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn177_testObjectWithNestedArrayInArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test178
     * @tc.number SUB_BUILTINS_Object8_TEST_17800
     * @tc.desc   test object fromEntries with sorted array literal in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn178_testSortedArrayLiteralInMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object8Test180
     * @tc.number SUB_BUILTINS_Object8_TEST_18000
     * @tc.desc   test object fromEntries with all basic types in map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object8Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn180_testAllBasicTypesInMap();
      expect(result).assertEqual(true);
    });

  })
}