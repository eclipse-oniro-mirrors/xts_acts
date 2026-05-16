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
  Fn01_testNaNEquality,
  Fn02_testSignedZeroInequality,
  Fn03_testReferenceTypeEquality,
  Fn04_testStringSameValue,
  Fn05_testNumberSameValue,
  Fn06_testBooleanSameValue,
  Fn07_testNullEquality,
  Fn08_testUndefinedEquality,
  Fn09_testSymbolSameInstance,
  Fn100_testNaNVsNumberNaN,
  Fn101_testMaxSafeIntegerSame,
  Fn102_testMaxSafeIntegerExceed,
  Fn103_testMinSafeIntegerSame,
  Fn107_testRegExpLastIndexChange,
  Fn108_testFuncDifferentNameSameLogic,
  Fn109_testAnonymousVsNamedFunc,
  Fn10_testBigIntSameValue,
  Fn110_testArrayFromVsOriginal,
  Fn111_testObjectAssignVsOriginal,
  Fn112_testJsonParseVsOriginal,
  Fn113_testSymbolVsWithStringTag,
  Fn114_testBigIntVsMinValue,
  Fn115_testDateNowVsNewDateTimestamp,
  Fn116_testSetValuesIteratorVsSet,
  Fn117_testMapEntriesIteratorVsMap,
  Fn118_testClassStaticVsInstanceProp,
  Fn119_testSubClassVsSuperClassInstance,
  Fn11_testPrimitiveVsWrapper,
  Fn120_testArrayBufferSliceVsOriginal,
  Fn121_testTypedArraySubarrayVsOriginal,
  Fn122_testPromiseAllVsOriginalArray,
  Fn123_testWeakSetAddVsOriginal,
  Fn124_testWeakMapSetVsOriginal,
  Fn125_testStringTrimVsOriginal,
  Fn126_testArrayReverseVsOriginal,
  Fn127_testObjDifferentDescriptorsSameValue,
  Fn128_testPositiveInfinityVsInfinity,
  Fn129_testNegativeInfinityVsNegativeInfinity,
  Fn12_testArrayDifferentInstance,
  Fn130_testSymbolSameDescriptionDifferentInstance,
  Fn131_testArrayFillVsOriginal,
  Fn132_testObjectKeysVsOriginal,
  Fn133_testObjectValuesVsOriginal,
  Fn134_testObjectEntriesVsOriginal,
  Fn135_testStringConcatVsOriginal,
  Fn136_testArrayConcatVsOriginal,
  Fn137_testParseIntVsOriginalStr,
  Fn138_testParseFloatVsOriginalStr,
  Fn139_testBooleanConversionVsOriginalNum,
  Fn13_testFunctionDifferentInstance,
  Fn140_testStringConversionVsOriginalBool,
  Fn141_testNumberConversionVsOriginalBool,
  Fn142_testClassMethodThisChangeInstance,
  Fn143_testProxyVsOriginalObj,
  Fn144_testReflectGetVsOriginalObj,
  Fn145_testReflectSetVsOriginalObj,
  Fn146_testDateSetTimeVsOriginal,
  Fn147_testSetClearVsOriginalInstance,
  Fn148_testMapClearVsOriginalInstance,
  Fn149_testSymbolForVsSymbolSameKey,
  Fn14_testDateSameInstance,
  Fn150_testSymbolKeyForVsSymbolFor,
  Fn151_testBigIntConversionVsOriginalNum,
  Fn152_testBigIntConversionVsOriginalStr,
  Fn153_testArrayFlatVsOriginal,
  Fn154_testArrayFilterVsOriginal,
  Fn155_testArrayMapVsOriginal,
  Fn156_testStringSliceVsOriginal,
  Fn157_testStringSubstringVsOriginal,
  Fn158_testStringSubstrVsOriginal,
  Fn159_testNumberEpsilonVsCloseValue,
  Fn15_testNaNvsFalsyValues,
  Fn160_testEmptyStrVsStringToString,
  Fn161_testStringToUpperVsOriginal,
  Fn162_testStringToLowerVsOriginal,
  Fn163_testArrayPopVsOriginal,
  Fn164_testArrayPushVsOriginal,
  Fn165_testArrayShiftVsOriginal,
  Fn166_testArrayUnshiftVsOriginal,
  Fn167_testNumberToStringVsOriginal,
  Fn168_testBooleanToStringVsOriginal,
  Fn169_testBigIntToStringVsOriginal,
  Fn16_testPositiveZeroVsOthers,
  Fn170_testDateToDateStrVsOriginal,
  Fn171_testDateToTimeStrVsOriginal,
  Fn172_testProxyArrayVsOriginal,
  Fn173_testReflectDeleteVsOriginal,
  Fn174_testFrozenObjReference,
  Fn175_testSealedObjReference,
  Fn176_testClassGetterVsInstance,
  Fn177_testClassSetterVsInstance,
  Fn178_testTypedArraySetVsOriginal,
  Fn17_testNestedObjReference,
  Fn180_testPromiseResolvePrimVsOriginal,
  Fn181_testPromiseRejectErrVsOriginal,
  Fn182_testWeakSetDeleteVsOriginal,
  Fn183_testWeakMapDeleteVsOriginal,
  Fn184_testStringIncludesVsOriginal,
  Fn185_testArrayIncludesVsOriginal,
  Fn186_testSetHasVsOriginal,
  Fn187_testMapHasVsOriginal,
  Fn188_testSymbolValueOfVsOriginal,
  Fn189_testBigIntValueOfVsOriginal,
  Fn18_testRegExpDifferentInstance,
  Fn190_testNumberValueOfVsOriginal,
  Fn191_testArraySortVsOriginal,
  Fn192_testArraySpliceVsOriginal,
  Fn193_testStringReplaceVsOriginal,
  Fn194_testStringMatchVsOriginal,
  Fn195_testRegExpTestVsOriginal,
  Fn196_testRegExpExecVsOriginal,
  Fn197_testGetPrototypeOfVsOriginal,
  Fn198_testSetPrototypeOfVsOriginal,
  Fn199_testFuncCallVsOriginal,
  Fn19_testPrimitiveVsConverted,
  Fn200_testFuncApplyVsOriginal,
  Fn201_testArrayReduceVsOriginal,
  Fn202_testArrayEveryVsOriginal,
  Fn203_testArraySomeVsOriginal,
  Fn204_testSetSizeVsOriginal,
  Fn205_testMapSizeVsOriginal,
  Fn207_testArrayBufferByteLengthVsOriginal,
  Fn208_testTypedArrayByteLengthVsOriginal,
  Fn209_testDateTimezoneOffsetVsOriginal,
  Fn20_testUndefinedVsUninitialized,
  Fn210_testPromiseThenVsOriginal,
  Fn211_testPromiseCatchVsOriginal,
  Fn212_testProxyGetReturnVsProxy,
  Fn213_testProxySetReturnVsProxy,
  Fn214_testReflectConstructVsCtor,
  Fn215_testReflectApplyVsFunc,
  Fn216_testStringPadStartVsOriginal,
  Fn217_testStringPadEndVsOriginal,
  Fn218_testArrayFlatMapVsOriginal,
  Fn219_testDefinePropertyVsOriginal,
  Fn21_testEmptyObjReference,
  Fn220_testDefinePropertiesVsOriginal,
  Fn22_testEmptyArrayReference,
  Fn23_testSymbolVsString,
  Fn24_testBigIntVsNumber,
  Fn25_testDateVsTimestamp,
  Fn26_testTrueVsOne,
  Fn27_testFalseVsZero,
  Fn28_testStrTrueVsBoolTrue,
  Fn29_testStrFalseVsBoolFalse,
  Fn30_testNullVsZero,
  Fn31_testUndefinedVsEmptyStr,
  Fn32_testNestedArrayInstance,
  Fn33_testFunctionVsArrowFunc,
  Fn34_testRegExpDifferentFlags,
  Fn35_testSymbolForSameKey,
  Fn36_testDifferentBigInt,
  Fn37_testInfinityVsNegativeInfinity,
  Fn38_testSameInfinity,
  Fn39_testObjPropChangeReference,
  Fn40_testArrayElemChangeReference,
  Fn41_testTemplateStrVsNormalStr,
  Fn42_testDifferentTemplateVsNormalStr,
  Fn43_testBoolVsBooleanWrapper,
  Fn44_testNullVsBooleanNull,
  Fn45_testUndefinedVsBooleanUndefined,
  Fn46_testNestedObjInnerChange,
  Fn47_testSameSetInstance,
  Fn48_testSameMapInstance,
  Fn49_testDifferentNumberWrapper,
  Fn50_testDifferentStringWrapper,
  Fn51_testInfinityVsNumber,
  Fn52_testNegativeInfinityVsNumber,
  Fn53_testSymbolVsSymbolForDifferentKey,
  Fn54_testBigIntVsStrSameValue,
  Fn55_testDateVsStrDate,
  Fn56_testEmptySetDifferentInstance,
  Fn57_testEmptyMapDifferentInstance,
  Fn58_testSetAddElemReference,
  Fn59_testMapAddEntryReference,
  Fn60_testStrVsObjectWrappedStr,
  Fn61_testNumVsObjectWrappedNum,
  Fn62_testBoolVsObjectWrappedBool,
  Fn63_testNestedSetDifferentInstance,
  Fn64_testNestedMapDifferentInstance,
  Fn65_testFuncDifferentParamsSameLogic,
  Fn66_testGeneratorFuncDifferentInstance,
  Fn67_testAsyncFuncDifferentInstance,
  Fn68_testRegExpVsStrRegExp,
  Fn69_testBigIntVsBigIntResult,
  Fn70_testArrayVsArrayLike,
  Fn71_testStrVsUnicodeSameContent,
  Fn72_testStrVsUnicodeDifferentContent,
  Fn73_testObjProtoChangeReference,
  Fn74_testFrozenObjVsOriginal,
  Fn75_testSealedObjVsOriginal,
  Fn76_testNonExtensibleObjVsOriginal,
  Fn77_testSetDeleteElemReference,
  Fn78_testMapDeleteEntryReference,
  Fn79_testSymbolToStringVsOriginal,
  Fn80_testBigIntToStringVsOriginal,
  Fn81_testClassInstancesDifferent,
  Fn82_testClassInstancesSameReference,
  Fn83_testArrayBufferDifferentInstance,
  Fn84_testArrayBufferSameReference,
  Fn85_testTypedArrayDifferentInstance,
  Fn86_testTypedArraySharedBuffer,
  Fn87_testPromiseDifferentInstanceSameState,
  Fn88_testPromiseSameReference,
  Fn89_testWeakSetDifferentInstance,
  Fn90_testWeakMapDifferentInstance,
  Fn92_testNumberVsScientificNotation,
  Fn93_testNumberVsScientificNotationDifferent,
  Fn94_testFuncVsBoundFunc,
  Fn95_testSymbolVsKeyForString,
  Fn96_testDateVsToISOString,
  Fn97_testEmptyObjVsCreateNullObj,
  Fn98_testArrayVsSpreadNewArray,
  Fn99_testObjVsSpreadNewObj
} from './Object16';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object16Test() {
  describe('Object16Test', () => {
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
     * @tc.name   Object16Test001
     * @tc.number SUB_BUILTINS_Object16_TEST_0100
     * @tc.desc   test object create (direct and inherited property)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testNaNEquality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test002
     * @tc.number SUB_BUILTINS_Object16_TEST_0200
     * @tc.desc   test object create (null prototype)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testSignedZeroInequality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test003
     * @tc.number SUB_BUILTINS_Object16_TEST_0300
     * @tc.desc   test reference type equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testReferenceTypeEquality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test004
     * @tc.number SUB_BUILTINS_Object16_TEST_0400
     * @tc.desc   test string same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testStringSameValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test005
     * @tc.number SUB_BUILTINS_Object16_TEST_0500
     * @tc.desc   test number same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testNumberSameValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test006
     * @tc.number SUB_BUILTINS_Object16_TEST_0600
     * @tc.desc   test boolean same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testBooleanSameValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test007
     * @tc.number SUB_BUILTINS_Object16_TEST_0700
     * @tc.desc   test null equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testNullEquality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test008
     * @tc.number SUB_BUILTINS_Object16_TEST_0800
     * @tc.desc   test undefined equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testUndefinedEquality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test009
     * @tc.number SUB_BUILTINS_Object16_TEST_0900
     * @tc.desc   test symbol same instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testSymbolSameInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test010
     * @tc.number SUB_BUILTINS_Object16_TEST_1000
     * @tc.desc   test bigint same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testBigIntSameValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test011
     * @tc.number SUB_BUILTINS_Object16_TEST_1100
     * @tc.desc   test primitive vs wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testPrimitiveVsWrapper();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test012
     * @tc.number SUB_BUILTINS_Object16_TEST_1200
     * @tc.desc   test array different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testArrayDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test013
     * @tc.number SUB_BUILTINS_Object16_TEST_1300
     * @tc.desc   test function different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testFunctionDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test014
     * @tc.number SUB_BUILTINS_Object16_TEST_1400
     * @tc.desc   test date same instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testDateSameInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test015
     * @tc.number SUB_BUILTINS_Object16_TEST_1500
     * @tc.desc   test NaN vs falsy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testNaNvsFalsyValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test016
     * @tc.number SUB_BUILTINS_Object16_TEST_1600
     * @tc.desc   test positive zero vs others
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testPositiveZeroVsOthers();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test017
     * @tc.number SUB_BUILTINS_Object16_TEST_1700
     * @tc.desc   test nested object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testNestedObjReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test018
     * @tc.number SUB_BUILTINS_Object16_TEST_1800
     * @tc.desc   test regexp different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testRegExpDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test019
     * @tc.number SUB_BUILTINS_Object16_TEST_1900
     * @tc.desc   test primitive vs converted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testPrimitiveVsConverted();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test020
     * @tc.number SUB_BUILTINS_Object16_TEST_2000
     * @tc.desc   test undefined vs uninitialized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testUndefinedVsUninitialized();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test021
     * @tc.number SUB_BUILTINS_Object16_TEST_2100
     * @tc.desc   test empty object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testEmptyObjReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test022
     * @tc.number SUB_BUILTINS_Object16_TEST_2200
     * @tc.desc   test empty array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testEmptyArrayReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test023
     * @tc.number SUB_BUILTINS_Object16_TEST_2300
     * @tc.desc   test symbol vs string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testSymbolVsString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test024
     * @tc.number SUB_BUILTINS_Object16_TEST_2400
     * @tc.desc   test bigint vs number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testBigIntVsNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test025
     * @tc.number SUB_BUILTINS_Object16_TEST_2500
     * @tc.desc   test date vs timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testDateVsTimestamp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test026
     * @tc.number SUB_BUILTINS_Object16_TEST_2600
     * @tc.desc   test true vs one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testTrueVsOne();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test027
     * @tc.number SUB_BUILTINS_Object16_TEST_2700
     * @tc.desc   test false vs zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testFalseVsZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test028
     * @tc.number SUB_BUILTINS_Object16_TEST_2800
     * @tc.desc   test string true vs boolean true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testStrTrueVsBoolTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test029
     * @tc.number SUB_BUILTINS_Object16_TEST_2900
     * @tc.desc   test string false vs boolean false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testStrFalseVsBoolFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test030
     * @tc.number SUB_BUILTINS_Object16_TEST_3000
     * @tc.desc   test null vs zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testNullVsZero();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object16Test031
     * @tc.number SUB_BUILTINS_Object16_TEST_3100
     * @tc.desc   test undefined vs empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testUndefinedVsEmptyStr();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test032
     * @tc.number SUB_BUILTINS_Object16_TEST_3200
     * @tc.desc   test nested array instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testNestedArrayInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test033
     * @tc.number SUB_BUILTINS_Object16_TEST_3300
     * @tc.desc   test function vs arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testFunctionVsArrowFunc();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test034
     * @tc.number SUB_BUILTINS_Object16_TEST_3400
     * @tc.desc   test regexp different flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testRegExpDifferentFlags();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test035
     * @tc.number SUB_BUILTINS_Object16_TEST_3500
     * @tc.desc   test symbol for same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testSymbolForSameKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test036
     * @tc.number SUB_BUILTINS_Object16_TEST_3600
     * @tc.desc   test different bigint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testDifferentBigInt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test037
     * @tc.number SUB_BUILTINS_Object16_TEST_3700
     * @tc.desc   test infinity vs negative infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testInfinityVsNegativeInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test038
     * @tc.number SUB_BUILTINS_Object16_TEST_3800
     * @tc.desc   test same infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testSameInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test039
     * @tc.number SUB_BUILTINS_Object16_TEST_3900
     * @tc.desc   test object property change reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testObjPropChangeReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test040
     * @tc.number SUB_BUILTINS_Object16_TEST_4000
     * @tc.desc   test array element change reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testArrayElemChangeReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test041
     * @tc.number SUB_BUILTINS_Object16_TEST_4100
     * @tc.desc   test template string vs normal string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testTemplateStrVsNormalStr();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test042
     * @tc.number SUB_BUILTINS_Object16_TEST_4200
     * @tc.desc   test different template vs normal string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testDifferentTemplateVsNormalStr();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test043
     * @tc.number SUB_BUILTINS_Object16_TEST_4300
     * @tc.desc   test boolean vs boolean wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testBoolVsBooleanWrapper();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test044
     * @tc.number SUB_BUILTINS_Object16_TEST_4400
     * @tc.desc   test null vs boolean null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testNullVsBooleanNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test045
     * @tc.number SUB_BUILTINS_Object16_TEST_4500
     * @tc.desc   test undefined vs boolean undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testUndefinedVsBooleanUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test046
     * @tc.number SUB_BUILTINS_Object16_TEST_4600
     * @tc.desc   test nested object inner change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testNestedObjInnerChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test047
     * @tc.number SUB_BUILTINS_Object16_TEST_4700
     * @tc.desc   test same set instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testSameSetInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test048
     * @tc.number SUB_BUILTINS_Object16_TEST_4800
     * @tc.desc   test same map instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testSameMapInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test049
     * @tc.number SUB_BUILTINS_Object16_TEST_4900
     * @tc.desc   test different number wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testDifferentNumberWrapper();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test050
     * @tc.number SUB_BUILTINS_Object16_TEST_5000
     * @tc.desc   test different string wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testDifferentStringWrapper();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test051
     * @tc.number SUB_BUILTINS_Object16_TEST_5100
     * @tc.desc   test infinity vs number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn51_testInfinityVsNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test052
     * @tc.number SUB_BUILTINS_Object16_TEST_5200
     * @tc.desc   test negative infinity vs number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testNegativeInfinityVsNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test053
     * @tc.number SUB_BUILTINS_Object16_TEST_5300
     * @tc.desc   test symbol vs symbol for different key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testSymbolVsSymbolForDifferentKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test054
     * @tc.number SUB_BUILTINS_Object16_TEST_5400
     * @tc.desc   test bigint vs string same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testBigIntVsStrSameValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test055
     * @tc.number SUB_BUILTINS_Object16_TEST_5500
     * @tc.desc   test date vs string date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testDateVsStrDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test056
     * @tc.number SUB_BUILTINS_Object16_TEST_5600
     * @tc.desc   test empty set different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testEmptySetDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test057
     * @tc.number SUB_BUILTINS_Object16_TEST_5700
     * @tc.desc   test empty map different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testEmptyMapDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test058
     * @tc.number SUB_BUILTINS_Object16_TEST_5800
     * @tc.desc   test set add element reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testSetAddElemReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test059
     * @tc.number SUB_BUILTINS_Object16_TEST_5900
     * @tc.desc   test map add entry reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testMapAddEntryReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test060
     * @tc.number SUB_BUILTINS_Object16_TEST_6000
     * @tc.desc   test string vs object wrapped string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testStrVsObjectWrappedStr();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object16Test061
     * @tc.number SUB_BUILTINS_Object16_TEST_6100
     * @tc.desc   test number vs object wrapped number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testNumVsObjectWrappedNum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test062
     * @tc.number SUB_BUILTINS_Object16_TEST_6200
     * @tc.desc   test boolean vs object wrapped boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn62_testBoolVsObjectWrappedBool();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test063
     * @tc.number SUB_BUILTINS_Object16_TEST_6300
     * @tc.desc   test nested set different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testNestedSetDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test064
     * @tc.number SUB_BUILTINS_Object16_TEST_6400
     * @tc.desc   test nested map different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testNestedMapDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test065
     * @tc.number SUB_BUILTINS_Object16_TEST_6500
     * @tc.desc   test function different parameters same logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testFuncDifferentParamsSameLogic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test066
     * @tc.number SUB_BUILTINS_Object16_TEST_6600
     * @tc.desc   test generator function different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testGeneratorFuncDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test067
     * @tc.number SUB_BUILTINS_Object16_TEST_6700
     * @tc.desc   test async function different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testAsyncFuncDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test068
     * @tc.number SUB_BUILTINS_Object16_TEST_6800
     * @tc.desc   test regexp vs string regexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testRegExpVsStrRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test069
     * @tc.number SUB_BUILTINS_Object16_TEST_6900
     * @tc.desc   test bigint vs bigint result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testBigIntVsBigIntResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test070
     * @tc.number SUB_BUILTINS_Object16_TEST_7000
     * @tc.desc   test array vs array like
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testArrayVsArrayLike();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test071
     * @tc.number SUB_BUILTINS_Object16_TEST_7100
     * @tc.desc   test string vs unicode same content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testStrVsUnicodeSameContent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test072
     * @tc.number SUB_BUILTINS_Object16_TEST_7200
     * @tc.desc   test string vs unicode different content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testStrVsUnicodeDifferentContent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test073
     * @tc.number SUB_BUILTINS_Object16_TEST_7300
     * @tc.desc   test object prototype change reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testObjProtoChangeReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test074
     * @tc.number SUB_BUILTINS_Object16_TEST_7400
     * @tc.desc   test frozen object vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testFrozenObjVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test075
     * @tc.number SUB_BUILTINS_Object16_TEST_7500
     * @tc.desc   test sealed object vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testSealedObjVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test076
     * @tc.number SUB_BUILTINS_Object16_TEST_7600
     * @tc.desc   test non-extensible object vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testNonExtensibleObjVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test077
     * @tc.number SUB_BUILTINS_Object16_TEST_7700
     * @tc.desc   test set delete element reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testSetDeleteElemReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test078
     * @tc.number SUB_BUILTINS_Object16_TEST_7800
     * @tc.desc   test map delete entry reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testMapDeleteEntryReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test079
     * @tc.number SUB_BUILTINS_Object16_TEST_7900
     * @tc.desc   test symbol to string vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testSymbolToStringVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test080
     * @tc.number SUB_BUILTINS_Object16_TEST_8000
     * @tc.desc   test bigint to string vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testBigIntToStringVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test081
     * @tc.number SUB_BUILTINS_Object16_TEST_8100
     * @tc.desc   test class instances different
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testClassInstancesDifferent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test082
     * @tc.number SUB_BUILTINS_Object16_TEST_8200
     * @tc.desc   test class instances same reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testClassInstancesSameReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test083
     * @tc.number SUB_BUILTINS_Object16_TEST_8300
     * @tc.desc   test array buffer different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testArrayBufferDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test084
     * @tc.number SUB_BUILTINS_Object16_TEST_8400
     * @tc.desc   test array buffer same reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testArrayBufferSameReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test085
     * @tc.number SUB_BUILTINS_Object16_TEST_8500
     * @tc.desc   test typed array different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testTypedArrayDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test086
     * @tc.number SUB_BUILTINS_Object16_TEST_8600
     * @tc.desc   test typed array shared buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testTypedArraySharedBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test087
     * @tc.number SUB_BUILTINS_Object16_TEST_8700
     * @tc.desc   test promise different instance same state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testPromiseDifferentInstanceSameState();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test088
     * @tc.number SUB_BUILTINS_Object16_TEST_8800
     * @tc.desc   test promise same reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testPromiseSameReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test089
     * @tc.number SUB_BUILTINS_Object16_TEST_8900
     * @tc.desc   test weak set different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testWeakSetDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test090
     * @tc.number SUB_BUILTINS_Object16_TEST_9000
     * @tc.desc   test weak map different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testWeakMapDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test092
     * @tc.number SUB_BUILTINS_Object16_TEST_9200
     * @tc.desc   test number vs scientific notation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testNumberVsScientificNotation();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test093
     * @tc.number SUB_BUILTINS_Object16_TEST_9300
     * @tc.desc   test number vs scientific notation different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testNumberVsScientificNotationDifferent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test094
     * @tc.number SUB_BUILTINS_Object16_TEST_9400
     * @tc.desc   test function vs bound function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testFuncVsBoundFunc();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test095
     * @tc.number SUB_BUILTINS_Object16_TEST_9500
     * @tc.desc   test symbol vs key for string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testSymbolVsKeyForString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test096
     * @tc.number SUB_BUILTINS_Object16_TEST_9600
     * @tc.desc   test date vs toISOString result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testDateVsToISOString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test097
     * @tc.number SUB_BUILTINS_Object16_TEST_9700
     * @tc.desc   test empty object vs Object.create(null) object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testEmptyObjVsCreateNullObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test098
     * @tc.number SUB_BUILTINS_Object16_TEST_9800
     * @tc.desc   test array vs spread new array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testArrayVsSpreadNewArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test099
     * @tc.number SUB_BUILTINS_Object16_TEST_9900
     * @tc.desc   test object vs spread new object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testObjVsSpreadNewObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test100
     * @tc.number SUB_BUILTINS_Object16_TEST_10000
     * @tc.desc   test NaN vs Number.NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testNaNVsNumberNaN();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test101
     * @tc.number SUB_BUILTINS_Object16_TEST_10100
     * @tc.desc   test max safe integer same values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testMaxSafeIntegerSame();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test102
     * @tc.number SUB_BUILTINS_Object16_TEST_10200
     * @tc.desc   test max safe integer exceed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testMaxSafeIntegerExceed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test103
     * @tc.number SUB_BUILTINS_Object16_TEST_10300
     * @tc.desc   test min safe integer same values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testMinSafeIntegerSame();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test107
     * @tc.number SUB_BUILTINS_Object16_TEST_10700
     * @tc.desc   test RegExp lastIndex change effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testRegExpLastIndexChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test108
     * @tc.number SUB_BUILTINS_Object16_TEST_10800
     * @tc.desc   test function different name same logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testFuncDifferentNameSameLogic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test109
     * @tc.number SUB_BUILTINS_Object16_TEST_10900
     * @tc.desc   test anonymous vs named function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testAnonymousVsNamedFunc();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test110
     * @tc.number SUB_BUILTINS_Object16_TEST_11000
     * @tc.desc   test Array.from vs original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testArrayFromVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test111
     * @tc.number SUB_BUILTINS_Object16_TEST_11100
     * @tc.desc   test Object.assign vs original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testObjectAssignVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test112
     * @tc.number SUB_BUILTINS_Object16_TEST_11200
     * @tc.desc   test JSON.parse vs original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testJsonParseVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test113
     * @tc.number SUB_BUILTINS_Object16_TEST_11300
     * @tc.desc   test symbol vs object with Symbol.toStringTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_testSymbolVsWithStringTag();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test114
     * @tc.number SUB_BUILTINS_Object16_TEST_11400
     * @tc.desc   test BigInt vs minimum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_testBigIntVsMinValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test115
     * @tc.number SUB_BUILTINS_Object16_TEST_11500
     * @tc.desc   test Date.now() vs new Date() timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_testDateNowVsNewDateTimestamp();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object16Test116
     * @tc.number SUB_BUILTINS_Object16_TEST_11600
     * @tc.desc   test Set values iterator vs Set instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_testSetValuesIteratorVsSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test117
     * @tc.number SUB_BUILTINS_Object16_TEST_11700
     * @tc.desc   test Map entries iterator vs Map instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn117_testMapEntriesIteratorVsMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test118
     * @tc.number SUB_BUILTINS_Object16_TEST_11800
     * @tc.desc   test class static vs instance property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn118_testClassStaticVsInstanceProp();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object16Test119
     * @tc.number SUB_BUILTINS_Object16_TEST_11900
     * @tc.desc   test subclass vs superclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_testSubClassVsSuperClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test120
     * @tc.number SUB_BUILTINS_Object16_TEST_12000
     * @tc.desc   test ArrayBuffer slice vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testArrayBufferSliceVsOriginal();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object16Test121
     * @tc.number SUB_BUILTINS_Object16_TEST_12100
     * @tc.desc   test TypedArray subarray vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_testTypedArraySubarrayVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test122
     * @tc.number SUB_BUILTINS_Object16_TEST_12200
     * @tc.desc   test Promise.all vs original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testPromiseAllVsOriginalArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test123
     * @tc.number SUB_BUILTINS_Object16_TEST_12300
     * @tc.desc   test WeakSet add vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testWeakSetAddVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test124
     * @tc.number SUB_BUILTINS_Object16_TEST_12400
     * @tc.desc   test WeakMap set vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_testWeakMapSetVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test125
     * @tc.number SUB_BUILTINS_Object16_TEST_12500
     * @tc.desc   test string trim vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_testStringTrimVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test126
     * @tc.number SUB_BUILTINS_Object16_TEST_12600
     * @tc.desc   test array reverse vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testArrayReverseVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test127
     * @tc.number SUB_BUILTINS_Object16_TEST_12700
     * @tc.desc   test object different descriptors same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testObjDifferentDescriptorsSameValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test128
     * @tc.number SUB_BUILTINS_Object16_TEST_12800
     * @tc.desc   test positive infinity vs Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_testPositiveInfinityVsInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test129
     * @tc.number SUB_BUILTINS_Object16_TEST_12900
     * @tc.desc   test negative infinity vs NegativeInfinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testNegativeInfinityVsNegativeInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test130
     * @tc.number SUB_BUILTINS_Object16_TEST_13000
     * @tc.desc   test symbol same description different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn130_testSymbolSameDescriptionDifferentInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test131
     * @tc.number SUB_BUILTINS_Object16_TEST_13100
     * @tc.desc   test array fill vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn131_testArrayFillVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test132
     * @tc.number SUB_BUILTINS_Object16_TEST_13200
     * @tc.desc   test Object.keys vs original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testObjectKeysVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test133
     * @tc.number SUB_BUILTINS_Object16_TEST_13300
     * @tc.desc   test Object.values vs original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testObjectValuesVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test134
     * @tc.number SUB_BUILTINS_Object16_TEST_13400
     * @tc.desc   test Object.entries vs original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn134_testObjectEntriesVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test135
     * @tc.number SUB_BUILTINS_Object16_TEST_13500
     * @tc.desc   test string concat vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testStringConcatVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test136
     * @tc.number SUB_BUILTINS_Object16_TEST_13600
     * @tc.desc   test array concat vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testArrayConcatVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test137
     * @tc.number SUB_BUILTINS_Object16_TEST_13700
     * @tc.desc   test parseInt vs original string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn137_testParseIntVsOriginalStr();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test138
     * @tc.number SUB_BUILTINS_Object16_TEST_13800
     * @tc.desc   test parseFloat vs original string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testParseFloatVsOriginalStr();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test139
     * @tc.number SUB_BUILTINS_Object16_TEST_13900
     * @tc.desc   test boolean conversion vs original number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn139_testBooleanConversionVsOriginalNum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test140
     * @tc.number SUB_BUILTINS_Object16_TEST_14000
     * @tc.desc   test string conversion vs original boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn140_testStringConversionVsOriginalBool();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test141
     * @tc.number SUB_BUILTINS_Object16_TEST_14100
     * @tc.desc   test number conversion vs original boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn141_testNumberConversionVsOriginalBool();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test142
     * @tc.number SUB_BUILTINS_Object16_TEST_14200
     * @tc.desc   test class method this change instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testClassMethodThisChangeInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test143
     * @tc.number SUB_BUILTINS_Object16_TEST_14300
     * @tc.desc   test proxy vs original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testProxyVsOriginalObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test144
     * @tc.number SUB_BUILTINS_Object16_TEST_14400
     * @tc.desc   test Reflect.get vs original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn144_testReflectGetVsOriginalObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test145
     * @tc.number SUB_BUILTINS_Object16_TEST_14500
     * @tc.desc   test Reflect.set vs original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn145_testReflectSetVsOriginalObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test146
     * @tc.number SUB_BUILTINS_Object16_TEST_14600
     * @tc.desc   test Date setTime vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testDateSetTimeVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test147
     * @tc.number SUB_BUILTINS_Object16_TEST_14700
     * @tc.desc   test Set clear vs original instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testSetClearVsOriginalInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test148
     * @tc.number SUB_BUILTINS_Object16_TEST_14800
     * @tc.desc   test Map clear vs original instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testMapClearVsOriginalInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test149
     * @tc.number SUB_BUILTINS_Object16_TEST_14900
     * @tc.desc   test Symbol.for vs Symbol same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testSymbolForVsSymbolSameKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test150
     * @tc.number SUB_BUILTINS_Object16_TEST_15000
     * @tc.desc   test Symbol.keyFor vs Symbol.for
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn150_testSymbolKeyForVsSymbolFor();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object16Test151
     * @tc.number SUB_BUILTINS_Object16_TEST_15100
     * @tc.desc   test BigInt conversion vs original number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn151_testBigIntConversionVsOriginalNum();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test152
     * @tc.number SUB_BUILTINS_Object16_TEST_15200
     * @tc.desc   test BigInt conversion vs original string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn152_testBigIntConversionVsOriginalStr();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test153
     * @tc.number SUB_BUILTINS_Object16_TEST_15300
     * @tc.desc   test array flat vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn153_testArrayFlatVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test154
     * @tc.number SUB_BUILTINS_Object16_TEST_15400
     * @tc.desc   test array filter vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn154_testArrayFilterVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test155
     * @tc.number SUB_BUILTINS_Object16_TEST_15500
     * @tc.desc   test array map vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn155_testArrayMapVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test156
     * @tc.number SUB_BUILTINS_Object16_TEST_15600
     * @tc.desc   test string slice vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn156_testStringSliceVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test157
     * @tc.number SUB_BUILTINS_Object16_TEST_15700
     * @tc.desc   test string substring vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn157_testStringSubstringVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test158
     * @tc.number SUB_BUILTINS_Object16_TEST_15800
     * @tc.desc   test string substr vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn158_testStringSubstrVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test159
     * @tc.number SUB_BUILTINS_Object16_TEST_15900
     * @tc.desc   test number epsilon vs close value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn159_testNumberEpsilonVsCloseValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test160
     * @tc.number SUB_BUILTINS_Object16_TEST_16000
     * @tc.desc   test empty string vs String.toString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn160_testEmptyStrVsStringToString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test161
     * @tc.number SUB_BUILTINS_Object16_TEST_16100
     * @tc.desc   test string toUpperCase vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn161_testStringToUpperVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test162
     * @tc.number SUB_BUILTINS_Object16_TEST_16200
     * @tc.desc   test string toLowerCase vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn162_testStringToLowerVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test163
     * @tc.number SUB_BUILTINS_Object16_TEST_16300
     * @tc.desc   test array pop vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn163_testArrayPopVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test164
     * @tc.number SUB_BUILTINS_Object16_TEST_16400
     * @tc.desc   test array push vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn164_testArrayPushVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test165
     * @tc.number SUB_BUILTINS_Object16_TEST_16500
     * @tc.desc   test array shift vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn165_testArrayShiftVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test166
     * @tc.number SUB_BUILTINS_Object16_TEST_16600
     * @tc.desc   test array unshift vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn166_testArrayUnshiftVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test167
     * @tc.number SUB_BUILTINS_Object16_TEST_16700
     * @tc.desc   test number toString() vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn167_testNumberToStringVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test168
     * @tc.number SUB_BUILTINS_Object16_TEST_16800
     * @tc.desc   test boolean toString() vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn168_testBooleanToStringVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test169
     * @tc.number SUB_BUILTINS_Object16_TEST_16900
     * @tc.desc   test BigInt toString() vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testBigIntToStringVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test170
     * @tc.number SUB_BUILTINS_Object16_TEST_17000
     * @tc.desc   test Date toDateString() vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn170_testDateToDateStrVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test171
     * @tc.number SUB_BUILTINS_Object16_TEST_17100
     * @tc.desc   test Date toTimeString() vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn171_testDateToTimeStrVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test172
     * @tc.number SUB_BUILTINS_Object16_TEST_17200
     * @tc.desc   test Proxy array vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn172_testProxyArrayVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test173
     * @tc.number SUB_BUILTINS_Object16_TEST_17300
     * @tc.desc   test Reflect.deleteProperty vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn173_testReflectDeleteVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test174
     * @tc.number SUB_BUILTINS_Object16_TEST_17400
     * @tc.desc   test frozen object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn174_testFrozenObjReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test175
     * @tc.number SUB_BUILTINS_Object16_TEST_17500
     * @tc.desc   test sealed object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn175_testSealedObjReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test176
     * @tc.number SUB_BUILTINS_Object16_TEST_17600
     * @tc.desc   test class getter vs instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn176_testClassGetterVsInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test177
     * @tc.number SUB_BUILTINS_Object16_TEST_17700
     * @tc.desc   test class setter vs instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn177_testClassSetterVsInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test178
     * @tc.number SUB_BUILTINS_Object16_TEST_17800
     * @tc.desc   test TypedArray set() vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn178_testTypedArraySetVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test180
     * @tc.number SUB_BUILTINS_Object16_TEST_18000
     * @tc.desc   test Promise.resolve(primitive) vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn180_testPromiseResolvePrimVsOriginal();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object16Test181
     * @tc.number SUB_BUILTINS_Object16_TEST_18100
     * @tc.desc   test Promise.reject error vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn181_testPromiseRejectErrVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test182
     * @tc.number SUB_BUILTINS_Object16_TEST_18200
     * @tc.desc   test WeakSet delete vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn182_testWeakSetDeleteVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test183
     * @tc.number SUB_BUILTINS_Object16_TEST_18300
     * @tc.desc   test WeakMap delete vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn183_testWeakMapDeleteVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test184
     * @tc.number SUB_BUILTINS_Object16_TEST_18400
     * @tc.desc   test string includes vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn184_testStringIncludesVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test185
     * @tc.number SUB_BUILTINS_Object16_TEST_18500
     * @tc.desc   test array includes vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn185_testArrayIncludesVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test186
     * @tc.number SUB_BUILTINS_Object16_TEST_18600
     * @tc.desc   test Set has vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn186_testSetHasVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test187
     * @tc.number SUB_BUILTINS_Object16_TEST_18700
     * @tc.desc   test Map has vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn187_testMapHasVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test188
     * @tc.number SUB_BUILTINS_Object16_TEST_18800
     * @tc.desc   test Symbol valueOf vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn188_testSymbolValueOfVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test189
     * @tc.number SUB_BUILTINS_Object16_TEST_18900
     * @tc.desc   test BigInt valueOf vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn189_testBigIntValueOfVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test190
     * @tc.number SUB_BUILTINS_Object16_TEST_19000
     * @tc.desc   test Number valueOf vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn190_testNumberValueOfVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test191
     * @tc.number SUB_BUILTINS_Object16_TEST_19100
     * @tc.desc   test array sort vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn191_testArraySortVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test192
     * @tc.number SUB_BUILTINS_Object16_TEST_19200
     * @tc.desc   test array splice vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn192_testArraySpliceVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test193
     * @tc.number SUB_BUILTINS_Object16_TEST_19300
     * @tc.desc   test string replace vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn193_testStringReplaceVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test194
     * @tc.number SUB_BUILTINS_Object16_TEST_19400
     * @tc.desc   test string match vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn194_testStringMatchVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test195
     * @tc.number SUB_BUILTINS_Object16_TEST_19500
     * @tc.desc   test RegExp test vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn195_testRegExpTestVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test196
     * @tc.number SUB_BUILTINS_Object16_TEST_19600
     * @tc.desc   test RegExp exec vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn196_testRegExpExecVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test197
     * @tc.number SUB_BUILTINS_Object16_TEST_19700
     * @tc.desc   test getPrototypeOf vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn197_testGetPrototypeOfVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test198
     * @tc.number SUB_BUILTINS_Object16_TEST_19800
     * @tc.desc   test setPrototypeOf vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn198_testSetPrototypeOfVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test199
     * @tc.number SUB_BUILTINS_Object16_TEST_19900
     * @tc.desc   test function call vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn199_testFuncCallVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test200
     * @tc.number SUB_BUILTINS_Object16_TEST_20000
     * @tc.desc   test function apply vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn200_testFuncApplyVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test201
     * @tc.number SUB_BUILTINS_Object16_TEST_20100
     * @tc.desc   test array reduce vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn201_testArrayReduceVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test202
     * @tc.number SUB_BUILTINS_Object16_TEST_20200
     * @tc.desc   test array every vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn202_testArrayEveryVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test203
     * @tc.number SUB_BUILTINS_Object16_TEST_20300
     * @tc.desc   test array some vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn203_testArraySomeVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test204
     * @tc.number SUB_BUILTINS_Object16_TEST_20400
     * @tc.desc   test Set size vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn204_testSetSizeVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test205
     * @tc.number SUB_BUILTINS_Object16_TEST_20500
     * @tc.desc   test Map size vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn205_testMapSizeVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test207
     * @tc.number SUB_BUILTINS_Object16_TEST_20700
     * @tc.desc   test ArrayBuffer byteLength vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn207_testArrayBufferByteLengthVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test208
     * @tc.number SUB_BUILTINS_Object16_TEST_20800
     * @tc.desc   test TypedArray byteLength vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn208_testTypedArrayByteLengthVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test209
     * @tc.number SUB_BUILTINS_Object16_TEST_20900
     * @tc.desc   test Date timezoneOffset vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn209_testDateTimezoneOffsetVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test210
     * @tc.number SUB_BUILTINS_Object16_TEST_21000
     * @tc.desc   test Promise then vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn210_testPromiseThenVsOriginal();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object16Test211
     * @tc.number SUB_BUILTINS_Object16_TEST_21100
     * @tc.desc   test Promise.catch vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn211_testPromiseCatchVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test212
     * @tc.number SUB_BUILTINS_Object16_TEST_21200
     * @tc.desc   test Proxy get return value vs Proxy instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn212_testProxyGetReturnVsProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test213
     * @tc.number SUB_BUILTINS_Object16_TEST_21300
     * @tc.desc   test Proxy set return value vs Proxy instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn213_testProxySetReturnVsProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test214
     * @tc.number SUB_BUILTINS_Object16_TEST_21400
     * @tc.desc   test Reflect.construct vs constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn214_testReflectConstructVsCtor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test215
     * @tc.number SUB_BUILTINS_Object16_TEST_21500
     * @tc.desc   test Reflect.apply vs function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn215_testReflectApplyVsFunc();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test216
     * @tc.number SUB_BUILTINS_Object16_TEST_21600
     * @tc.desc   test string padStart vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn216_testStringPadStartVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test217
     * @tc.number SUB_BUILTINS_Object16_TEST_21700
     * @tc.desc   test string padEnd vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn217_testStringPadEndVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test218
     * @tc.number SUB_BUILTINS_Object16_TEST_21800
     * @tc.desc   test array flatMap vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn218_testArrayFlatMapVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test219
     * @tc.number SUB_BUILTINS_Object16_TEST_21900
     * @tc.desc   test Object.defineProperty vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn219_testDefinePropertyVsOriginal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object16Test220
     * @tc.number SUB_BUILTINS_Object16_TEST_22000
     * @tc.desc   test Object.defineProperties vs original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object16Test220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn220_testDefinePropertiesVsOriginal();
      expect(result).assertEqual(true);
    });
  })
}