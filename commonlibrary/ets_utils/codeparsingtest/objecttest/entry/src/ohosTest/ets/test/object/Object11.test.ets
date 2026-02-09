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
  Fn01_testAllOwnProperties,
  Fn02_testPropertyOrder,
  Fn03_testPrimitiveCoercion,
  Fn04_testArrayProperties,
  Fn05_testEmptyObject,
  Fn06_testFunctionProperties,
  Fn07_testDateProperties,
  Fn08_testClassInstance,
  Fn09_testNonExtensibleObject,
  Fn100_testArrayBufferCopy,
  Fn101_testMapValueProperty,
  Fn102_testSetValueProperty,
  Fn104_testArrayConcat,
  Fn105_testUnicodeKey,
  Fn106_testGeneratorNext,
  Fn107_testDefineNonEnumerableProperty,
  Fn108_testPendingPromise,
  Fn109_testArrayFilter,
  Fn10_testSealedObject,
  Fn110_testMixedKeyTypeOrder,
  Fn111_testArrayMap,
  Fn112_testHyphenatedNumberKeys,
  Fn114_testErrorValueProperty,
  Fn115_testTypedArraySubarrayLength,
  Fn116_testObjectCreateWithProto,
  Fn118_testArrayReduce,
  Fn119_testMixedSymbolLetterKeys,
  Fn11_testFrozenObject,
  Fn120_testPromiseResolveObj,
  Fn121_testDataViewRead,
  Fn122_testBigIntValueProperty,
  Fn123_testArraySpliceDelete,
  Fn125_testDecimalStringKeys,
  Fn127_testPreventExtensionsModifyValue,
  Fn128_testArrayEvery,
  Fn129_testCombinedEmojiKeys,
  Fn12_testStringWrapper,
  Fn132_testTypedArrayFill,
  Fn133_testSealedObjectModifyValue,
  Fn134_testArraySome,
  Fn135_testUnderscoredNumberKeys,
  Fn138_testArrayFlat,
  Fn139_testControlCharKeys,
  Fn13_testBooleanWrapper,
  Fn140_testPromiseRejectError,
  Fn141_testArrayFlatMap,
  Fn142_testParenthesesKeys,
  Fn145_testTypedArrayCopyWithin,
  Fn146_testObjectCreateNullAddProp,
  Fn148_testArrayFind,
  Fn149_testSlashInKeys,
  Fn14_testNullUndefinedCoercion,
  Fn150_testPromiseAllSettled,
  Fn151_testDataViewByteOffset,
  Fn152_testRegExpValueProperty,
  Fn153_testArrayFindIndex,
  Fn155_testColonInKeys,
  Fn158_testArrayForEach,
  Fn159_testQuotesInKeys,
  Fn160_testArrayBufferSliceOffsetLength,
  Fn162_testTypedArrayReverse,
  Fn164_testArrayJoin,
  Fn165_testAsteriskInKeys,
  Fn168_testArraySlice,
  Fn169_testEqualsInKeys,
  Fn16_testNestedObject,
  Fn170_testPromiseAny,
  Fn171_testArrayToReversed,
  Fn172_testPercentInKeys,
  Fn175_testTypedArrayToSorted,
  Fn178_testArrayToSpliced,
  Fn179_testAmpersandInKeys,
  Fn17_testMathObject,
  Fn181_testDataViewToLocaleString,
  Fn183_testArrayWith,
  Fn185_testPlusInKeys,
  Fn187_testDefineGetterProperty,
  Fn188_testArrayEntries,
  Fn189_testQuestionInKeys,
  Fn18_testRegExpObject,
  Fn190_testArrayBufferToLocaleString,
  Fn191_testArrayBufferValueProp,
  Fn192_testTypedArrayWith,
  Fn194_testArrayKeys,
  Fn195_testExclamationInKeys,
  Fn197_testDataViewValueProp,
  Fn198_testArrayValues,
  Fn199_testUnderscoreChineseKeys,
  Fn19_testMapInstance,
  Fn200_testPromiseFinally,
  Fn201_testArrayNestedFlatMap,
  Fn202_testBracketsInKeys,
  Fn205_testTypedArrayCrossCopyWithin,
  Fn206_testPreventExtensionsModifySymbol,
  Fn208_testArrayFindLast,
  Fn209_testBracesInKeys,
  Fn20_testSetInstance,
  Fn210_testPromiseResolvePromise,
  Fn211_testDataViewMultiTypeWrite,
  Fn212_testGeneratorValueProperty,
  Fn213_testArrayFindLastIndex,
  Fn215_testAtSymbolChineseKeys,
  Fn217_testDefineSetterProperty,
  Fn218_testArrayReduceRight,
  Fn219_testDollarInKeys,
  Fn21_testArrayHoles,
  Fn221_testWeakMapValueProperty,
  Fn222_testTypedArraySort,
  Fn224_testArraySomeEmpty,
  Fn225_testHashInKeys,
  Fn227_testWeakSetValueProperty,
  Fn228_testArrayFilterEmpty,
  Fn229_testTildeInKeys,
  Fn22_testGetterSetterProperty,
  Fn230_testPromiseRejectNonError,
  Fn23_testErrorObject,
  Fn24_testPromiseInstance,
  Fn25_testNumberWrapperNoProto,
  Fn26_testSpecialCharKeys,
  Fn27_testClassStaticProperty,
  Fn28_testTypedArray,
  Fn29_testEmptyArray,
  Fn30_testDeletedProperty,
  Fn31_testRegExpCaptureGroup,
  Fn32_testWeakMapInstance,
  Fn33_testWeakSetInstance,
  Fn35_testUndefinedValueProperty,
  Fn36_testArrayLengthChange,
  Fn37_testInstanceProtoOverride,
  Fn38_testDataView,
  Fn39_testAssignAddedProperty,
  Fn40_testGeneratorInstance,
  Fn41_testLongNumberStringKeys,
  Fn42_testEmptyFunction,
  Fn44_testNonConfigurableProperty,
  Fn45_testArrayPush,
  Fn46_testSymbolKeyExcluded,
  Fn47_testClassStaticGetter,
  Fn48_testArrayBuffer,
  Fn49_testObjectWithNestedArray,
  Fn51_testArrayUnshift,
  Fn52_testErrorSubclass,
  Fn53_testMixedKeyOrder,
  Fn54_testSetWithElements,
  Fn55_testMapWithEntries,
  Fn56_testBigIntPrimitiveCoercion,
  Fn58_testDefineProperties,
  Fn59_testEmptyTypedArray,
  Fn60_testFunctionValueProperty,
  Fn61_testArraySpliceAdd,
  Fn62_testReadonlyArray,
  Fn63_testChineseKey,
  Fn64_testPromiseReject,
  Fn65_testArrayFrom,
  Fn66_testObjectCreateNull,
  Fn67_testTypedArraySet,
  Fn68_testNestedObjValue,
  Fn69_testGeneratorPrototype,
  Fn70_testSpecialSymbolKeys,
  Fn71_testArrayBufferSlice,
  Fn72_testHasOwnPropertyMatch,
  Fn73_testEmptyDataView,
  Fn74_testZeroAndNonZeroKeys,
  Fn75_testClassInheritanceStatic,
  Fn76_testArrayFill,
  Fn80_testEmptyGenerator,
  Fn81_testArrayPop,
  Fn82_testErrorStackProperty,
  Fn83_testLongStringKey,
  Fn84_testPromiseAllInstance,
  Fn85_testTypedArraySubarray,
  Fn87_testEmptyWeakMap,
  Fn88_testEmptyWeakSet,
  Fn89_testArrayShift,
  Fn90_testDateValueProperty,
  Fn92_testClassProtoMethodExcluded,
  Fn93_testArrayReverse,
  Fn94_testLeadingZeroNumberKeys,
  Fn95_testDataViewModify,
  Fn97_testPromiseRaceInstance,
  Fn98_testArraySort,
  Fn99_testEmojiKey
} from './Object11';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object11Test() {
  describe('Object11Test', () => {
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
     * @tc.name   Object11Test001
     * @tc.number SUB_BUILTINS_Object11_TEST_0100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testAllOwnProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test002
     * @tc.number SUB_BUILTINS_Object11_TEST_0200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testPropertyOrder();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object11Test003
     * @tc.number SUB_BUILTINS_Object11_TEST_0300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testPrimitiveCoercion();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test004
     * @tc.number SUB_BUILTINS_Object11_TEST_0400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testArrayProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test005
     * @tc.number SUB_BUILTINS_Object11_TEST_0500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test006
     * @tc.number SUB_BUILTINS_Object11_TEST_0600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testFunctionProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test007
     * @tc.number SUB_BUILTINS_Object11_TEST_0700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testDateProperties();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test008
     * @tc.number SUB_BUILTINS_Object11_TEST_0800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test009
     * @tc.number SUB_BUILTINS_Object11_TEST_0900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testNonExtensibleObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test010
     * @tc.number SUB_BUILTINS_Object11_TEST_1000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testSealedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test011
     * @tc.number SUB_BUILTINS_Object11_TEST_1100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test012
     * @tc.number SUB_BUILTINS_Object11_TEST_1200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testStringWrapper();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test013
     * @tc.number SUB_BUILTINS_Object11_TEST_1300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testBooleanWrapper();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test014
     * @tc.number SUB_BUILTINS_Object11_TEST_1400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testNullUndefinedCoercion();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test016
     * @tc.number SUB_BUILTINS_Object11_TEST_1600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testNestedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test017
     * @tc.number SUB_BUILTINS_Object11_TEST_1700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testMathObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test018
     * @tc.number SUB_BUILTINS_Object11_TEST_1800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testRegExpObject();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test019
     * @tc.number SUB_BUILTINS_Object11_TEST_1900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testMapInstance();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test020
     * @tc.number SUB_BUILTINS_Object11_TEST_2000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testSetInstance();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test021
     * @tc.number SUB_BUILTINS_Object11_TEST_2100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testArrayHoles();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test022
     * @tc.number SUB_BUILTINS_Object11_TEST_2200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testGetterSetterProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test023
     * @tc.number SUB_BUILTINS_Object11_TEST_2300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testErrorObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test024
     * @tc.number SUB_BUILTINS_Object11_TEST_2400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testPromiseInstance();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test025
     * @tc.number SUB_BUILTINS_Object11_TEST_2500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testNumberWrapperNoProto();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test026
     * @tc.number SUB_BUILTINS_Object11_TEST_2600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testSpecialCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test027
     * @tc.number SUB_BUILTINS_Object11_TEST_2700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testClassStaticProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test028
     * @tc.number SUB_BUILTINS_Object11_TEST_2800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testTypedArray();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test029
     * @tc.number SUB_BUILTINS_Object11_TEST_2900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test030
     * @tc.number SUB_BUILTINS_Object11_TEST_3000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testDeletedProperty();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object11Test031
     * @tc.number SUB_BUILTINS_Object11_TEST_3100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testRegExpCaptureGroup();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test032
     * @tc.number SUB_BUILTINS_Object11_TEST_3200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testWeakMapInstance();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test033
     * @tc.number SUB_BUILTINS_Object11_TEST_3300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testWeakSetInstance();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test035
     * @tc.number SUB_BUILTINS_Object11_TEST_3500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testUndefinedValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test036
     * @tc.number SUB_BUILTINS_Object11_TEST_3600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testArrayLengthChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test037
     * @tc.number SUB_BUILTINS_Object11_TEST_3700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testInstanceProtoOverride();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test038
     * @tc.number SUB_BUILTINS_Object11_TEST_3800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testDataView();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test039
     * @tc.number SUB_BUILTINS_Object11_TEST_3900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testAssignAddedProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test040
     * @tc.number SUB_BUILTINS_Object11_TEST_4000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testGeneratorInstance();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test041
     * @tc.number SUB_BUILTINS_Object11_TEST_4100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testLongNumberStringKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test042
     * @tc.number SUB_BUILTINS_Object11_TEST_4200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testEmptyFunction();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test044
     * @tc.number SUB_BUILTINS_Object11_TEST_4400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testNonConfigurableProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test045
     * @tc.number SUB_BUILTINS_Object11_TEST_4500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testArrayPush();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test046
     * @tc.number SUB_BUILTINS_Object11_TEST_4600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testSymbolKeyExcluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test047
     * @tc.number SUB_BUILTINS_Object11_TEST_4700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testClassStaticGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test048
     * @tc.number SUB_BUILTINS_Object11_TEST_4800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testArrayBuffer();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test049
     * @tc.number SUB_BUILTINS_Object11_TEST_4900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testObjectWithNestedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test051
     * @tc.number SUB_BUILTINS_Object11_TEST_5100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn51_testArrayUnshift();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test052
     * @tc.number SUB_BUILTINS_Object11_TEST_5200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testErrorSubclass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test053
     * @tc.number SUB_BUILTINS_Object11_TEST_5300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testMixedKeyOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test054
     * @tc.number SUB_BUILTINS_Object11_TEST_5400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testSetWithElements();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test055
     * @tc.number SUB_BUILTINS_Object11_TEST_5500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testMapWithEntries();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test056
     * @tc.number SUB_BUILTINS_Object11_TEST_5600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testBigIntPrimitiveCoercion();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test058
     * @tc.number SUB_BUILTINS_Object11_TEST_5800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testDefineProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test059
     * @tc.number SUB_BUILTINS_Object11_TEST_5900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testEmptyTypedArray();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test060
     * @tc.number SUB_BUILTINS_Object11_TEST_6000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testFunctionValueProperty();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object11Test061
     * @tc.number SUB_BUILTINS_Object11_TEST_6100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testArraySpliceAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test062
     * @tc.number SUB_BUILTINS_Object11_TEST_6200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testReadonlyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test063
     * @tc.number SUB_BUILTINS_Object11_TEST_6300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testChineseKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test064
     * @tc.number SUB_BUILTINS_Object11_TEST_6400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testPromiseReject();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test065
     * @tc.number SUB_BUILTINS_Object11_TEST_6500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testArrayFrom();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test066
     * @tc.number SUB_BUILTINS_Object11_TEST_6600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testObjectCreateNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test067
     * @tc.number SUB_BUILTINS_Object11_TEST_6700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testTypedArraySet();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test068
     * @tc.number SUB_BUILTINS_Object11_TEST_6800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testNestedObjValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test069
     * @tc.number SUB_BUILTINS_Object11_TEST_6900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testGeneratorPrototype();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test070
     * @tc.number SUB_BUILTINS_Object11_TEST_7000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testSpecialSymbolKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test071
     * @tc.number SUB_BUILTINS_Object11_TEST_7100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testArrayBufferSlice();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test072
     * @tc.number SUB_BUILTINS_Object11_TEST_7200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testHasOwnPropertyMatch();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test073
     * @tc.number SUB_BUILTINS_Object11_TEST_7300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testEmptyDataView();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test074
     * @tc.number SUB_BUILTINS_Object11_TEST_7400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testZeroAndNonZeroKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test075
     * @tc.number SUB_BUILTINS_Object11_TEST_7500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testClassInheritanceStatic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test076
     * @tc.number SUB_BUILTINS_Object11_TEST_7600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testArrayFill();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test080
     * @tc.number SUB_BUILTINS_Object11_TEST_8000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testEmptyGenerator();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test081
     * @tc.number SUB_BUILTINS_Object11_TEST_8100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testArrayPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test082
     * @tc.number SUB_BUILTINS_Object11_TEST_8200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testErrorStackProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test083
     * @tc.number SUB_BUILTINS_Object11_TEST_8300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testLongStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test084
     * @tc.number SUB_BUILTINS_Object11_TEST_8400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testPromiseAllInstance();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test085
     * @tc.number SUB_BUILTINS_Object11_TEST_8500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testTypedArraySubarray();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test087
     * @tc.number SUB_BUILTINS_Object11_TEST_8700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testEmptyWeakMap();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test088
     * @tc.number SUB_BUILTINS_Object11_TEST_8800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testEmptyWeakSet();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test089
     * @tc.number SUB_BUILTINS_Object11_TEST_8900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testArrayShift();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test090
     * @tc.number SUB_BUILTINS_Object11_TEST_9000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testDateValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test092
     * @tc.number SUB_BUILTINS_Object11_TEST_9200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testClassProtoMethodExcluded();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test093
     * @tc.number SUB_BUILTINS_Object11_TEST_9300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testArrayReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test094
     * @tc.number SUB_BUILTINS_Object11_TEST_9400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testLeadingZeroNumberKeys();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test095
     * @tc.number SUB_BUILTINS_Object11_TEST_9500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testDataViewModify();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test097
     * @tc.number SUB_BUILTINS_Object11_TEST_9700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testPromiseRaceInstance();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test098
     * @tc.number SUB_BUILTINS_Object11_TEST_9800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test099
     * @tc.number SUB_BUILTINS_Object11_TEST_9900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testEmojiKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test100
     * @tc.number SUB_BUILTINS_Object11_TEST_10000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testArrayBufferCopy();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test101
     * @tc.number SUB_BUILTINS_Object11_TEST_10100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testMapValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test102
     * @tc.number SUB_BUILTINS_Object11_TEST_10200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testSetValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test104
     * @tc.number SUB_BUILTINS_Object11_TEST_10400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testArrayConcat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test105
     * @tc.number SUB_BUILTINS_Object11_TEST_10500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn105_testUnicodeKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test106
     * @tc.number SUB_BUILTINS_Object11_TEST_10600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_testGeneratorNext();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test107
     * @tc.number SUB_BUILTINS_Object11_TEST_10700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testDefineNonEnumerableProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test108
     * @tc.number SUB_BUILTINS_Object11_TEST_10800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testPendingPromise();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test109
     * @tc.number SUB_BUILTINS_Object11_TEST_10900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testArrayFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test110
     * @tc.number SUB_BUILTINS_Object11_TEST_11000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testMixedKeyTypeOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test111
     * @tc.number SUB_BUILTINS_Object11_TEST_11100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testArrayMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test112
     * @tc.number SUB_BUILTINS_Object11_TEST_11200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testHyphenatedNumberKeys();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test114
     * @tc.number SUB_BUILTINS_Object11_TEST_11400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_testErrorValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test115
     * @tc.number SUB_BUILTINS_Object11_TEST_11500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_testTypedArraySubarrayLength();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test116
     * @tc.number SUB_BUILTINS_Object11_TEST_11600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_testObjectCreateWithProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test118
     * @tc.number SUB_BUILTINS_Object11_TEST_11800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn118_testArrayReduce();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test119
     * @tc.number SUB_BUILTINS_Object11_TEST_11900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_testMixedSymbolLetterKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test120
     * @tc.number SUB_BUILTINS_Object11_TEST_12000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testPromiseResolveObj();
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   Object11Test121
     * @tc.number SUB_BUILTINS_Object11_TEST_12100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_testDataViewRead();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test122
     * @tc.number SUB_BUILTINS_Object11_TEST_12200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testBigIntValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test123
     * @tc.number SUB_BUILTINS_Object11_TEST_12300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testArraySpliceDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test125
     * @tc.number SUB_BUILTINS_Object11_TEST_12500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_testDecimalStringKeys();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test127
     * @tc.number SUB_BUILTINS_Object11_TEST_12700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testPreventExtensionsModifyValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test128
     * @tc.number SUB_BUILTINS_Object11_TEST_12800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_testArrayEvery();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test129
     * @tc.number SUB_BUILTINS_Object11_TEST_12900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testCombinedEmojiKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test132
     * @tc.number SUB_BUILTINS_Object11_TEST_13200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testTypedArrayFill();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test133
     * @tc.number SUB_BUILTINS_Object11_TEST_13300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testSealedObjectModifyValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test134
     * @tc.number SUB_BUILTINS_Object11_TEST_13400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn134_testArraySome();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test135
     * @tc.number SUB_BUILTINS_Object11_TEST_13500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testUnderscoredNumberKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test138
     * @tc.number SUB_BUILTINS_Object11_TEST_13800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testArrayFlat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test139
     * @tc.number SUB_BUILTINS_Object11_TEST_13900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn139_testControlCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test140
     * @tc.number SUB_BUILTINS_Object11_TEST_14000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn140_testPromiseRejectError();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test141
     * @tc.number SUB_BUILTINS_Object11_TEST_14100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn141_testArrayFlatMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test142
     * @tc.number SUB_BUILTINS_Object11_TEST_14200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testParenthesesKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test145
     * @tc.number SUB_BUILTINS_Object11_TEST_14500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn145_testTypedArrayCopyWithin();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test146
     * @tc.number SUB_BUILTINS_Object11_TEST_14600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testObjectCreateNullAddProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test148
     * @tc.number SUB_BUILTINS_Object11_TEST_14800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testArrayFind();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test149
     * @tc.number SUB_BUILTINS_Object11_TEST_14900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testSlashInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test150
     * @tc.number SUB_BUILTINS_Object11_TEST_15000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn150_testPromiseAllSettled();
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   Object11Test151
     * @tc.number SUB_BUILTINS_Object11_TEST_15100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn151_testDataViewByteOffset();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test152
     * @tc.number SUB_BUILTINS_Object11_TEST_15200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn152_testRegExpValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test153
     * @tc.number SUB_BUILTINS_Object11_TEST_15300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn153_testArrayFindIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test155
     * @tc.number SUB_BUILTINS_Object11_TEST_15500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn155_testColonInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test158
     * @tc.number SUB_BUILTINS_Object11_TEST_15800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn158_testArrayForEach();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test159
     * @tc.number SUB_BUILTINS_Object11_TEST_15900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn159_testQuotesInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test160
     * @tc.number SUB_BUILTINS_Object11_TEST_16000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn160_testArrayBufferSliceOffsetLength();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test162
     * @tc.number SUB_BUILTINS_Object11_TEST_16200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn162_testTypedArrayReverse();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test164
     * @tc.number SUB_BUILTINS_Object11_TEST_16400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn164_testArrayJoin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test165
     * @tc.number SUB_BUILTINS_Object11_TEST_16500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn165_testAsteriskInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test168
     * @tc.number SUB_BUILTINS_Object11_TEST_16800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn168_testArraySlice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test169
     * @tc.number SUB_BUILTINS_Object11_TEST_16900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testEqualsInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test170
     * @tc.number SUB_BUILTINS_Object11_TEST_17000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn170_testPromiseAny();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test171
     * @tc.number SUB_BUILTINS_Object11_TEST_17100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn171_testArrayToReversed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test172
     * @tc.number SUB_BUILTINS_Object11_TEST_17200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn172_testPercentInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test175
     * @tc.number SUB_BUILTINS_Object11_TEST_17500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn175_testTypedArrayToSorted();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test178
     * @tc.number SUB_BUILTINS_Object11_TEST_17800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn178_testArrayToSpliced();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test179
     * @tc.number SUB_BUILTINS_Object11_TEST_17900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn179_testAmpersandInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test181
     * @tc.number SUB_BUILTINS_Object11_TEST_18100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn181_testDataViewToLocaleString();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test183
     * @tc.number SUB_BUILTINS_Object11_TEST_18300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn183_testArrayWith();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test185
     * @tc.number SUB_BUILTINS_Object11_TEST_18500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn185_testPlusInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test187
     * @tc.number SUB_BUILTINS_Object11_TEST_18700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn187_testDefineGetterProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test188
     * @tc.number SUB_BUILTINS_Object11_TEST_18800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn188_testArrayEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test189
     * @tc.number SUB_BUILTINS_Object11_TEST_18900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn189_testQuestionInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test190
     * @tc.number SUB_BUILTINS_Object11_TEST_19000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn190_testArrayBufferToLocaleString();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test191
     * @tc.number SUB_BUILTINS_Object11_TEST_19100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn191_testArrayBufferValueProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test192
     * @tc.number SUB_BUILTINS_Object11_TEST_19200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn192_testTypedArrayWith();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test194
     * @tc.number SUB_BUILTINS_Object11_TEST_19400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn194_testArrayKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test195
     * @tc.number SUB_BUILTINS_Object11_TEST_19500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn195_testExclamationInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test197
     * @tc.number SUB_BUILTINS_Object11_TEST_19700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn197_testDataViewValueProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test198
     * @tc.number SUB_BUILTINS_Object11_TEST_19800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn198_testArrayValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test199
     * @tc.number SUB_BUILTINS_Object11_TEST_19900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn199_testUnderscoreChineseKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test200
     * @tc.number SUB_BUILTINS_Object11_TEST_20000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn200_testPromiseFinally();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test201
     * @tc.number SUB_BUILTINS_Object11_TEST_20100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn201_testArrayNestedFlatMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test202
     * @tc.number SUB_BUILTINS_Object11_TEST_20200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn202_testBracketsInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test205
     * @tc.number SUB_BUILTINS_Object11_TEST_20500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn205_testTypedArrayCrossCopyWithin();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test206
     * @tc.number SUB_BUILTINS_Object11_TEST_20600
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn206_testPreventExtensionsModifySymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test208
     * @tc.number SUB_BUILTINS_Object11_TEST_20800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn208_testArrayFindLast();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test209
     * @tc.number SUB_BUILTINS_Object11_TEST_20900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn209_testBracesInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test210
     * @tc.number SUB_BUILTINS_Object11_TEST_21000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn210_testPromiseResolvePromise();
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   Object11Test211
     * @tc.number SUB_BUILTINS_Object11_TEST_21100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn211_testDataViewMultiTypeWrite();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test212
     * @tc.number SUB_BUILTINS_Object11_TEST_21200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn212_testGeneratorValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test213
     * @tc.number SUB_BUILTINS_Object11_TEST_21300
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn213_testArrayFindLastIndex();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test215
     * @tc.number SUB_BUILTINS_Object11_TEST_21500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn215_testAtSymbolChineseKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test217
     * @tc.number SUB_BUILTINS_Object11_TEST_21700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn217_testDefineSetterProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test218
     * @tc.number SUB_BUILTINS_Object11_TEST_21800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn218_testArrayReduceRight();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test219
     * @tc.number SUB_BUILTINS_Object11_TEST_21900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn219_testDollarInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test221
     * @tc.number SUB_BUILTINS_Object11_TEST_22100
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn221_testWeakMapValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test222
     * @tc.number SUB_BUILTINS_Object11_TEST_22200
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn222_testTypedArraySort();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object11Test224
     * @tc.number SUB_BUILTINS_Object11_TEST_22400
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn224_testArraySomeEmpty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test225
     * @tc.number SUB_BUILTINS_Object11_TEST_22500
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn225_testHashInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test227
     * @tc.number SUB_BUILTINS_Object11_TEST_22700
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn227_testWeakSetValueProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test228
     * @tc.number SUB_BUILTINS_Object11_TEST_22800
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn228_testArrayFilterEmpty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test229
     * @tc.number SUB_BUILTINS_Object11_TEST_22900
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn229_testTildeInKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object11Test230
     * @tc.number SUB_BUILTINS_Object11_TEST_23000
     * @tc.desc   test object getOwnPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object11Test230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn230_testPromiseRejectNonError();
      expect(result).assertEqual(false);
    });
  })
}