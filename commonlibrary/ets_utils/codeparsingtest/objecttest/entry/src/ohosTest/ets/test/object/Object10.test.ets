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
  Fn01_testGetDataPropertyDescriptors,
  Fn02_testGetAccessorPropertyDescriptors,
  Fn03_testGetNonEnumerableAndEmptyObjDescriptors,
  Fn04_testSymbolPropertyDescriptors,
  Fn05_testWritableFalseDescriptor,
  Fn06_testConfigurableFalseDescriptor,
  Fn07_testArrayDescriptors,
  Fn08_testGetterOnlyDescriptor,
  Fn09_testSetterOnlyDescriptor,
  Fn100_testPromiseAllPropDescriptor,
  Fn101_testRegExpExecPropDescriptor,
  Fn102_testStringMatchPropDescriptor,
  Fn103_testObjectAssignDescriptor,
  Fn104_testWeakMapSetReturnDescriptor,
  Fn105_testWeakSetAddReturnDescriptor,
  Fn106_testArraySliceDescriptor,
  Fn107_testFunctionBindProtoDescriptor,
  Fn108_testObjectHasOwnProtoDescriptor,
  Fn109_testEnumerableForInDescriptor,
  Fn10_testExcludePrototypeDescriptors,
  Fn110_testNonEnumerableForInDescriptor,
  Fn113_testArrayJoinNoAffectDescriptor,
  Fn114_testInt8ArrayPropDescriptor,
  Fn115_testAccessorExternalVarDescriptor,
  Fn116_testDefinePropertiesDescriptor,
  Fn119_testArraySortDescriptor,
  Fn11_testDateDescriptors,
  Fn120_testArrayFromDescriptor,
  Fn121_testEnumerableObjectValuesDescriptor,
  Fn122_testNonEnumerableObjectValuesDescriptor,
  Fn123_testPromiseRacePropDescriptor,
  Fn124_testPromiseRejectPropDescriptor,
  Fn125_testInt32ArrayPropDescriptor,
  Fn126_testConfigurableModifyDescriptor,
  Fn127_testNonConfigurableNoModifyDescriptor,
  Fn128_testFloat32ArrayPropDescriptor,
  Fn129_testArrayFilterDescriptor,
  Fn12_testFunctionDescriptors,
  Fn130_testArrayMapDescriptor,
  Fn131_testFloat64ArrayPropDescriptor,
  Fn132_testDestructuringAssignDescriptor,
  Fn133_testSymbolAsyncIteratorDescriptor,
  Fn136_testArrayReduceNoAffectDescriptor,
  Fn137_testUint16ArrayPropDescriptor,
  Fn138_testInt16ArrayPropDescriptor,
  Fn139_testGetAndValueConflictDescriptor,
  Fn13_testEmptyLiteralDescriptors,
  Fn140_testSetAndWritableConflictDescriptor,
  Fn141_testMockDOMElementDescriptor,
  Fn142_testJSONParseResultDescriptor,
  Fn143_testJSONStringifyParamDescriptor,
  Fn144_testMapClearDescriptor,
  Fn145_testSetDeleteDescriptor,
  Fn146_testAccessorReturnObjDescriptor,
  Fn147_testUint8ClampedArrayPropDescriptor,
  Fn148_testBigUint64ArrayPropDescriptor,
  Fn149_testBigInt64ArrayPropDescriptor,
  Fn14_testNestedObjOuterDescriptors,
  Fn150_testObjectKeysNoAffectDescriptor,
  Fn151_testGeneratorReturnDescriptor,
  Fn152_testAsyncGeneratorDescriptor,
  Fn153_testArrayConcatDescriptor,
  Fn154_testArrayEveryNoAffectDescriptor,
  Fn155_testArraySomeNoAffectDescriptor,
  Fn158_testAccessorArrowThisDescriptor,
  Fn159_testEnumerableObjectEntriesDescriptor,
  Fn15_testNonEnumerableAccessor,
  Fn160_testNonEnumerableObjectEntriesDescriptor,
  Fn163_testArrayFindNoAffectDescriptor,
  Fn164_testArrayFindIndexNoAffectDescriptor,
  Fn165_testMapHasNoAffectDescriptor,
  Fn166_testSetHasNoAffectDescriptor,
  Fn167_testAccessorReturnFuncDescriptor,
  Fn168_testNestedArrayDescriptor,
  Fn169_testFrozenPropDescriptorFlags,
  Fn16_testDescriptorUnchangedAfterModify,
  Fn170_testSealedPropDescriptorFlags,
  Fn173_testArrayBufferSliceDescriptor,
  Fn174_testDataViewSetFloat32Descriptor,
  Fn175_testAccessorPromiseDependentDescriptor,
  Fn176_testTypedArraySubarrayDescriptor,
  Fn177_testArrayFlatDescriptor,
  Fn178_testArrayFlatMapDescriptor,
  Fn179_testWeakMapGetNoAffectDescriptor,
  Fn180_testWeakSetHasNoAffectDescriptor,
  Fn181_testGetPrototypeNoAffectDescriptor,
  Fn182_testPromiseAllSettledPropDescriptor,
  Fn183_testPromiseAnyPropDescriptor,
  Fn184_testArrayReverseRefDescriptor,
  Fn186_testSymbolIsConcatSpreadableDescriptor,
  Fn187_testMockDOMEventDescriptor,
  Fn188_testArrayUnshiftRefDescriptor,
  Fn189_testTypedArraySetDescriptor,
  Fn18_testDefaultDescriptorFlags,
  Fn190_testPreventExtensionsDescriptor,
  Fn191_testAsyncGeneratorIteratorDescriptor,
  Fn192_testArraySpliceRefDescriptor,
  Fn195_testAccessorReturnPromiseDescriptor,
  Fn196_testArrayFromMapDescriptor,
  Fn197_testSetValuesIteratorDescriptor,
  Fn198_testMapEntriesIteratorDescriptor,
  Fn199_testEnumerableForOfArrayDescriptor,
  Fn19_testMapDescriptors,
  Fn200_testNonEnumerableForOfArrayLikeDescriptor,
  Fn204_testDataViewSetInt16Descriptor,
  Fn205_testAccessorWeakMapDependentDescriptor,
  Fn206_testTypedArrayReverseDescriptor,
  Fn207_testArrayCopyWithinDescriptor,
  Fn208_testArrayFillRangeDescriptor,
  Fn209_testWeakMapDeleteDescriptor,
  Fn20_testFrozenObjDescriptors,
  Fn210_testWeakSetDeleteDescriptor,
  Fn211_testIsFrozenNoAffectDescriptor,
  Fn212_testPromiseFinallyPropDescriptor,
  Fn213_testCustomSymbolIteratorDescriptor,
  Fn214_testArrayWithDescriptor,
  Fn215_testSymbolToPrimitiveDescriptor,
  Fn216_testMockDOMStyleDescriptor,
  Fn217_testArrayFlatDepthDescriptor,
  Fn218_testTypedArrayFillDescriptor,
  Fn219_testIsSealedNoAffectDescriptor,
  Fn21_testNullValueDescriptor,
  Fn220_testAsyncGeneratorReturnDescriptor,
  Fn221_testArrayFilterEmptyDescriptor,
  Fn224_testAccessorReturnWeakSetDescriptor,
  Fn226_testArrayMapEmptyDescriptor,
  Fn227_testSetPrototypeValuesDescriptor,
  Fn228_testMapPrototypeKeysDescriptor,
  Fn229_testEnumerableReflectOwnKeysDescriptor,
  Fn22_testUndefinedValueDescriptor,
  Fn230_testNonEnumerableReflectOwnKeysDescriptor,
  Fn23_testSetDescriptors,
  Fn24_testClassInstanceDescriptors,
  Fn25_testClassStaticDescriptors,
  Fn27_testAccessorThisBinding,
  Fn28_testEnumerableConfigFalseDescriptor,
  Fn29_testNonEnumerableWritableFalseDescriptor,
  Fn30_testRegExpLastIndexDescriptor,
  Fn31_testFunctionLengthDescriptor,
  Fn32_testProtoDescriptor,
  Fn33_testArrowFunctionDescriptor,
  Fn34_testGeneratorFunctionDescriptor,
  Fn35_testSealedObjDescriptors,
  Fn36_testBigIntValueDescriptor,
  Fn38_testNestedSymbolDescriptor,
  Fn39_testAccessorDependentDescriptor,
  Fn40_testSparseArrayDescriptors,
  Fn41_testErrorInstanceDescriptors,
  Fn42_testPromiseDescriptors,
  Fn43_testDescriptorCountMatchKeys,
  Fn44_testNonEnumerableExcludeKeys,
  Fn45_testAccessorNoValueWritable,
  Fn46_testDataNoGetSet,
  Fn47_testModifiedAccessorDescriptor,
  Fn48_testSymbolAccessorDescriptor,
  Fn49_testArrayPushDescriptor,
  Fn50_testDeletePropDescriptor,
  Fn51_testNaNValueDescriptor,
  Fn52_testInfinityValueDescriptor,
  Fn53_testClassInstanceMethodDescriptor,
  Fn54_testClassProtoMethodDescriptor,
  Fn55_testWeakMapDescriptors,
  Fn56_testWeakSetDescriptors,
  Fn57_testAccessorThisOwnPropDescriptor,
  Fn58_testArrayUnshiftDescriptor,
  Fn59_testArrayPopDescriptor,
  Fn60_testStringObjectDescriptors,
  Fn63_testNestedFunctionDescriptor,
  Fn66_testRegExpPropDescriptor,
  Fn67_testDatePropDescriptor,
  Fn68_testErrorThrowingAccessorDescriptor,
  Fn69_testArraySpliceDescriptor,
  Fn70_testMapPropDescriptor,
  Fn71_testSetPropDescriptor,
  Fn72_testDescriptorMatchSingleGet,
  Fn73_testEmptyFunctionDescriptors,
  Fn74_testArrowFunctionNoPrototypeDescriptor,
  Fn75_testGeneratorFunctionPrototypeDescriptor,
  Fn76_testPromisePropDescriptor,
  Fn77_testErrorPropDescriptor,
  Fn78_testRedefinedPropDescriptor,
  Fn79_testModifiedTypedArrayDescriptor,
  Fn80_testAssignedPropValueDescriptor,
  Fn81_testSymbolToStringTagDescriptor,
  Fn82_testArrayFillDescriptor,
  Fn86_testDefinePropertyDescriptor,
  Fn87_testBoundFunctionDescriptor,
  Fn88_testArrayBufferPropDescriptor,
  Fn89_testDataViewPropDescriptor,
  Fn91_testSetIteratorPropDescriptor,
  Fn92_testMapIteratorPropDescriptor,
  Fn93_testExcludeProtoMethodsDescriptor,
  Fn94_testGeneratorIteratorPropDescriptor,
  Fn95_testArrayReverseDescriptor,
  Fn96_testUint32ArrayPropDescriptor,
  Fn98_testOverwriteDataWithAccessorDescriptor
} from './Object10';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object10Test() {
  describe('Object10Test', () => {
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
     * @tc.name   Object10Test001
     * @tc.number SUB_BUILTINS_Object10_TEST_0100
     * @tc.desc   test object getOwnPropertyDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testGetDataPropertyDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test002
     * @tc.number SUB_BUILTINS_Object10_TEST_0200
     * @tc.desc   test object getOwnPropertyDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testGetAccessorPropertyDescriptors();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object10Test003
     * @tc.number SUB_BUILTINS_Object10_TEST_0300
     * @tc.desc   test object getOwnPropertyDescriptors for non-enumerable properties and empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testGetNonEnumerableAndEmptyObjDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test004
     * @tc.number SUB_BUILTINS_Object10_TEST_0400
     * @tc.desc   test object getOwnPropertyDescriptors for symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testSymbolPropertyDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test005
     * @tc.number SUB_BUILTINS_Object10_TEST_0500
     * @tc.desc   test object getOwnPropertyDescriptors for writable: false descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testWritableFalseDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test006
     * @tc.number SUB_BUILTINS_Object10_TEST_0600
     * @tc.desc   test object getOwnPropertyDescriptors for configurable: false descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testConfigurableFalseDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test007
     * @tc.number SUB_BUILTINS_Object10_TEST_0700
     * @tc.desc   test object getOwnPropertyDescriptors for array objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testArrayDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test008
     * @tc.number SUB_BUILTINS_Object10_TEST_0800
     * @tc.desc   test object getOwnPropertyDescriptors for getter-only properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testGetterOnlyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test009
     * @tc.number SUB_BUILTINS_Object10_TEST_0900
     * @tc.desc   test object getOwnPropertyDescriptors for setter-only properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testSetterOnlyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test010
     * @tc.number SUB_BUILTINS_Object10_TEST_1000
     * @tc.desc   test object getOwnPropertyDescriptors excludes prototype properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testExcludePrototypeDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test011
     * @tc.number SUB_BUILTINS_Object10_TEST_1100
     * @tc.desc   test object getOwnPropertyDescriptors for Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testDateDescriptors();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object10Test012
     * @tc.number SUB_BUILTINS_Object10_TEST_1200
     * @tc.desc   test object getOwnPropertyDescriptors for Function objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testFunctionDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test013
     * @tc.number SUB_BUILTINS_Object10_TEST_1300
     * @tc.desc   test object getOwnPropertyDescriptors for empty literal objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testEmptyLiteralDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test014
     * @tc.number SUB_BUILTINS_Object10_TEST_1400
     * @tc.desc   test object getOwnPropertyDescriptors for nested object outer properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testNestedObjOuterDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test015
     * @tc.number SUB_BUILTINS_Object10_TEST_1500
     * @tc.desc   test object getOwnPropertyDescriptors for non-enumerable accessor properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testNonEnumerableAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test016
     * @tc.number SUB_BUILTINS_Object10_TEST_1600
     * @tc.desc   test object getOwnPropertyDescriptors remains unchanged after modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testDescriptorUnchangedAfterModify();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object10Test018
     * @tc.number SUB_BUILTINS_Object10_TEST_1800
     * @tc.desc   test object getOwnPropertyDescriptors default flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testDefaultDescriptorFlags();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test019
     * @tc.number SUB_BUILTINS_Object10_TEST_1900
     * @tc.desc   test object getOwnPropertyDescriptors for Map objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testMapDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test020
     * @tc.number SUB_BUILTINS_Object10_TEST_2000
     * @tc.desc   test object getOwnPropertyDescriptors for frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testFrozenObjDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test021
     * @tc.number SUB_BUILTINS_Object10_TEST_2100
     * @tc.desc   test object getOwnPropertyDescriptors for null value properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testNullValueDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test022
     * @tc.number SUB_BUILTINS_Object10_TEST_2200
     * @tc.desc   test object getOwnPropertyDescriptors for undefined value properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testUndefinedValueDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test023
     * @tc.number SUB_BUILTINS_Object10_TEST_2300
     * @tc.desc   test object getOwnPropertyDescriptors for Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testSetDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test024
     * @tc.number SUB_BUILTINS_Object10_TEST_2400
     * @tc.desc   test object getOwnPropertyDescriptors for class instance objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testClassInstanceDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test025
     * @tc.number SUB_BUILTINS_Object10_TEST_2500
     * @tc.desc   test object getOwnPropertyDescriptors for class static properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testClassStaticDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test027
     * @tc.number SUB_BUILTINS_Object10_TEST_2700
     * @tc.desc   test object getOwnPropertyDescriptors for accessor this binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testAccessorThisBinding();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test028
     * @tc.number SUB_BUILTINS_Object10_TEST_2800
     * @tc.desc   test object getOwnPropertyDescriptors for enumerable: true, configurable: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testEnumerableConfigFalseDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test029
     * @tc.number SUB_BUILTINS_Object10_TEST_2900
     * @tc.desc   test object getOwnPropertyDescriptors for non-enumerable and writable: false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testNonEnumerableWritableFalseDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test030
     * @tc.number SUB_BUILTINS_Object10_TEST_3000
     * @tc.desc   test object getOwnPropertyDescriptors for RegExp lastIndex property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testRegExpLastIndexDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test031
     * @tc.number SUB_BUILTINS_Object10_TEST_3100
     * @tc.desc   test object getOwnPropertyDescriptors for function length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testFunctionLengthDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test032
     * @tc.number SUB_BUILTINS_Object10_TEST_3200
     * @tc.desc   test object getOwnPropertyDescriptors for __proto__ property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testProtoDescriptor();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object10Test033
     * @tc.number SUB_BUILTINS_Object10_TEST_3300
     * @tc.desc   test object getOwnPropertyDescriptors for arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testArrowFunctionDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test034
     * @tc.number SUB_BUILTINS_Object10_TEST_3400
     * @tc.desc   test object getOwnPropertyDescriptors for generator function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testGeneratorFunctionDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test035
     * @tc.number SUB_BUILTINS_Object10_TEST_3500
     * @tc.desc   test object getOwnPropertyDescriptors for sealed objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testSealedObjDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test036
     * @tc.number SUB_BUILTINS_Object10_TEST_3600
     * @tc.desc   test object getOwnPropertyDescriptors for BigInt value properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testBigIntValueDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test038
     * @tc.number SUB_BUILTINS_Object10_TEST_3800
     * @tc.desc   test object getOwnPropertyDescriptors for nested Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testNestedSymbolDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test039
     * @tc.number SUB_BUILTINS_Object10_TEST_3900
     * @tc.desc   test object getOwnPropertyDescriptors for dependent accessor properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testAccessorDependentDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test040
     * @tc.number SUB_BUILTINS_Object10_TEST_4000
     * @tc.desc   test object getOwnPropertyDescriptors for sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testSparseArrayDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test041
     * @tc.number SUB_BUILTINS_Object10_TEST_4100
     * @tc.desc   test object getOwnPropertyDescriptors for Error instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testErrorInstanceDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test042
     * @tc.number SUB_BUILTINS_Object10_TEST_4200
     * @tc.desc   test object getOwnPropertyDescriptors for Promise objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testPromiseDescriptors();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object10Test043
     * @tc.number SUB_BUILTINS_Object10_TEST_4300
     * @tc.desc   test object getOwnPropertyDescriptors count matches Object.keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testDescriptorCountMatchKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test044
     * @tc.number SUB_BUILTINS_Object10_TEST_4400
     * @tc.desc   test object getOwnPropertyDescriptors excludes non-enumerable from keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testNonEnumerableExcludeKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test045
     * @tc.number SUB_BUILTINS_Object10_TEST_4500
     * @tc.desc   test accessor descriptors have no value or writable properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testAccessorNoValueWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test046
     * @tc.number SUB_BUILTINS_Object10_TEST_4600
     * @tc.desc   test data descriptors have no get or set properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testDataNoGetSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test047
     * @tc.number SUB_BUILTINS_Object10_TEST_4700
     * @tc.desc   test modified accessor descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testModifiedAccessorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test048
     * @tc.number SUB_BUILTINS_Object10_TEST_4800
     * @tc.desc   test symbol accessor descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testSymbolAccessorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test049
     * @tc.number SUB_BUILTINS_Object10_TEST_4900
     * @tc.desc   test array push method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testArrayPushDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test050
     * @tc.number SUB_BUILTINS_Object10_TEST_5000
     * @tc.desc   test descriptor after property deletion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testDeletePropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test051
     * @tc.number SUB_BUILTINS_Object10_TEST_5100
     * @tc.desc   test object getOwnPropertyDescriptors for NaN value properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn51_testNaNValueDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test052
     * @tc.number SUB_BUILTINS_Object10_TEST_5200
     * @tc.desc   test object getOwnPropertyDescriptors for Infinity value properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testInfinityValueDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test053
     * @tc.number SUB_BUILTINS_Object10_TEST_5300
     * @tc.desc   test object getOwnPropertyDescriptors for class instance methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testClassInstanceMethodDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test054
     * @tc.number SUB_BUILTINS_Object10_TEST_5400
     * @tc.desc   test object getOwnPropertyDescriptors for class prototype methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testClassProtoMethodDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test055
     * @tc.number SUB_BUILTINS_Object10_TEST_5500
     * @tc.desc   test object getOwnPropertyDescriptors for WeakMap objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testWeakMapDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test056
     * @tc.number SUB_BUILTINS_Object10_TEST_5600
     * @tc.desc   test object getOwnPropertyDescriptors for WeakSet objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testWeakSetDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test057
     * @tc.number SUB_BUILTINS_Object10_TEST_5700
     * @tc.desc   test accessor descriptors with this binding to own properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testAccessorThisOwnPropDescriptor();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object10Test058
     * @tc.number SUB_BUILTINS_Object10_TEST_5800
     * @tc.desc   test array unshift method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn58_testArrayUnshiftDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test059
     * @tc.number SUB_BUILTINS_Object10_TEST_5900
     * @tc.desc   test array pop method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testArrayPopDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test060
     * @tc.number SUB_BUILTINS_Object10_TEST_6000
     * @tc.desc   test object getOwnPropertyDescriptors for String objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testStringObjectDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test063
     * @tc.number SUB_BUILTINS_Object10_TEST_6300
     * @tc.desc   test object getOwnPropertyDescriptors for nested functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn63_testNestedFunctionDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test066
     * @tc.number SUB_BUILTINS_Object10_TEST_6600
     * @tc.desc   test object getOwnPropertyDescriptors for RegExp properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testRegExpPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test067
     * @tc.number SUB_BUILTINS_Object10_TEST_6700
     * @tc.desc   test object getOwnPropertyDescriptors for Date properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testDatePropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test068
     * @tc.number SUB_BUILTINS_Object10_TEST_6800
     * @tc.desc   test accessor descriptors that throw errors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testErrorThrowingAccessorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test069
     * @tc.number SUB_BUILTINS_Object10_TEST_6900
     * @tc.desc   test array splice method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testArraySpliceDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test070
     * @tc.number SUB_BUILTINS_Object10_TEST_7000
     * @tc.desc   test object getOwnPropertyDescriptors for Map properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testMapPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test071
     * @tc.number SUB_BUILTINS_Object10_TEST_7100
     * @tc.desc   test object getOwnPropertyDescriptors for Set properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testSetPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test072
     * @tc.number SUB_BUILTINS_Object10_TEST_7200
     * @tc.desc   test descriptors match single property getOwnPropertyDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testDescriptorMatchSingleGet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test073
     * @tc.number SUB_BUILTINS_Object10_TEST_7300
     * @tc.desc   test object getOwnPropertyDescriptors for empty functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testEmptyFunctionDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test074
     * @tc.number SUB_BUILTINS_Object10_TEST_7400
     * @tc.desc   test arrow functions have no prototype descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testArrowFunctionNoPrototypeDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test075
     * @tc.number SUB_BUILTINS_Object10_TEST_7500
     * @tc.desc   test generator function prototype descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testGeneratorFunctionPrototypeDescriptor();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object10Test076
     * @tc.number SUB_BUILTINS_Object10_TEST_7600
     * @tc.desc   test object getOwnPropertyDescriptors for Promise properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testPromisePropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test077
     * @tc.number SUB_BUILTINS_Object10_TEST_7700
     * @tc.desc   test object getOwnPropertyDescriptors for Error properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testErrorPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test078
     * @tc.number SUB_BUILTINS_Object10_TEST_7800
     * @tc.desc   test redefined property descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testRedefinedPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test079
     * @tc.number SUB_BUILTINS_Object10_TEST_7900
     * @tc.desc   test modified TypedArray descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testModifiedTypedArrayDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test080
     * @tc.number SUB_BUILTINS_Object10_TEST_8000
     * @tc.desc   test descriptor for assigned property values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testAssignedPropValueDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test081
     * @tc.number SUB_BUILTINS_Object10_TEST_8100
     * @tc.desc   test object getOwnPropertyDescriptors for Symbol.toStringTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testSymbolToStringTagDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test082
     * @tc.number SUB_BUILTINS_Object10_TEST_8200
     * @tc.desc   test array fill method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testArrayFillDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test086
     * @tc.number SUB_BUILTINS_Object10_TEST_8600
     * @tc.desc   test descriptors from Object.defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testDefinePropertyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test087
     * @tc.number SUB_BUILTINS_Object10_TEST_8700
     * @tc.desc   test object getOwnPropertyDescriptors for bound functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testBoundFunctionDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test088
     * @tc.number SUB_BUILTINS_Object10_TEST_8800
     * @tc.desc   test object getOwnPropertyDescriptors for ArrayBuffer properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testArrayBufferPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test089
     * @tc.number SUB_BUILTINS_Object10_TEST_8900
     * @tc.desc   test object getOwnPropertyDescriptors for DataView properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testDataViewPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test091
     * @tc.number SUB_BUILTINS_Object10_TEST_9100
     * @tc.desc   test object getOwnPropertyDescriptors for Set iterator properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn91_testSetIteratorPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test092
     * @tc.number SUB_BUILTINS_Object10_TEST_9200
     * @tc.desc   test object getOwnPropertyDescriptors for Map iterator properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn92_testMapIteratorPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test093
     * @tc.number SUB_BUILTINS_Object10_TEST_9300
     * @tc.desc   test descriptors exclude prototype methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn93_testExcludeProtoMethodsDescriptor();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object10Test094
     * @tc.number SUB_BUILTINS_Object10_TEST_9400
     * @tc.desc   test object getOwnPropertyDescriptors for generator iterator properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testGeneratorIteratorPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test095
     * @tc.number SUB_BUILTINS_Object10_TEST_9500
     * @tc.desc   test array reverse method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testArrayReverseDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test096
     * @tc.number SUB_BUILTINS_Object10_TEST_9600
     * @tc.desc   test object getOwnPropertyDescriptors for Uint32Array properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testUint32ArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test098
     * @tc.number SUB_BUILTINS_Object10_TEST_9800
     * @tc.desc   test overwriting data with accessor descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testOverwriteDataWithAccessorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test100
     * @tc.number SUB_BUILTINS_Object10_TEST_10000
     * @tc.desc   test object getOwnPropertyDescriptors for Promise.all properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testPromiseAllPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test101
     * @tc.number SUB_BUILTINS_Object10_TEST_10100
     * @tc.desc   test object getOwnPropertyDescriptors for RegExp exec properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testRegExpExecPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test102
     * @tc.number SUB_BUILTINS_Object10_TEST_10200
     * @tc.desc   test object getOwnPropertyDescriptors for String match properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testStringMatchPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test103
     * @tc.number SUB_BUILTINS_Object10_TEST_10300
     * @tc.desc   test object getOwnPropertyDescriptors for Object.assign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testObjectAssignDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test104
     * @tc.number SUB_BUILTINS_Object10_TEST_10400
     * @tc.desc   test WeakMap set return value descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testWeakMapSetReturnDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test105
     * @tc.number SUB_BUILTINS_Object10_TEST_10500
     * @tc.desc   test WeakSet add return value descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn105_testWeakSetAddReturnDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test106
     * @tc.number SUB_BUILTINS_Object10_TEST_10600
     * @tc.desc   test array slice method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_testArraySliceDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test107
     * @tc.number SUB_BUILTINS_Object10_TEST_10700
     * @tc.desc   test function bind prototype descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testFunctionBindProtoDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test108
     * @tc.number SUB_BUILTINS_Object10_TEST_10800
     * @tc.desc   test Object.hasOwn prototype descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testObjectHasOwnProtoDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test109
     * @tc.number SUB_BUILTINS_Object10_TEST_10900
     * @tc.desc   test enumerable properties appear in for...in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testEnumerableForInDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test110
     * @tc.number SUB_BUILTINS_Object10_TEST_11000
     * @tc.desc   test non-enumerable properties excluded from for...in
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testNonEnumerableForInDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test113
     * @tc.number SUB_BUILTINS_Object10_TEST_11300
     * @tc.desc   test array join does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_testArrayJoinNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test114
     * @tc.number SUB_BUILTINS_Object10_TEST_11400
     * @tc.desc   test object getOwnPropertyDescriptors for Int8Array properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_testInt8ArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test115
     * @tc.number SUB_BUILTINS_Object10_TEST_11500
     * @tc.desc   test accessor descriptors with external variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_testAccessorExternalVarDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test116
     * @tc.number SUB_BUILTINS_Object10_TEST_11600
     * @tc.desc   test descriptors from Object.defineProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn116_testDefinePropertiesDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test119
     * @tc.number SUB_BUILTINS_Object10_TEST_11900
     * @tc.desc   test array sort method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_testArraySortDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test120
     * @tc.number SUB_BUILTINS_Object10_TEST_12000
     * @tc.desc   test object getOwnPropertyDescriptors for Array.from
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testArrayFromDescriptor();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object10Test121
     * @tc.number SUB_BUILTINS_Object10_TEST_12100
     * @tc.desc   test enumerable properties in Object.values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn121_testEnumerableObjectValuesDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test122
     * @tc.number SUB_BUILTINS_Object10_TEST_12200
     * @tc.desc   test non-enumerable properties excluded from Object.values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testNonEnumerableObjectValuesDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test123
     * @tc.number SUB_BUILTINS_Object10_TEST_12300
     * @tc.desc   test object getOwnPropertyDescriptors for Promise.race properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testPromiseRacePropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test124
     * @tc.number SUB_BUILTINS_Object10_TEST_12400
     * @tc.desc   test object getOwnPropertyDescriptors for Promise.reject properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn124_testPromiseRejectPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test125
     * @tc.number SUB_BUILTINS_Object10_TEST_12500
     * @tc.desc   test object getOwnPropertyDescriptors for Int32Array properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn125_testInt32ArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test126
     * @tc.number SUB_BUILTINS_Object10_TEST_12600
     * @tc.desc   test configurable properties can be modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testConfigurableModifyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test127
     * @tc.number SUB_BUILTINS_Object10_TEST_12700
     * @tc.desc   test non-configurable properties cannot be modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testNonConfigurableNoModifyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test128
     * @tc.number SUB_BUILTINS_Object10_TEST_12800
     * @tc.desc   test object getOwnPropertyDescriptors for Float32Array properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn128_testFloat32ArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test129
     * @tc.number SUB_BUILTINS_Object10_TEST_12900
     * @tc.desc   test array filter method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testArrayFilterDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test130
     * @tc.number SUB_BUILTINS_Object10_TEST_13000
     * @tc.desc   test array map method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn130_testArrayMapDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test131
     * @tc.number SUB_BUILTINS_Object10_TEST_13100
     * @tc.desc   test object getOwnPropertyDescriptors for Float64Array properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn131_testFloat64ArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test132
     * @tc.number SUB_BUILTINS_Object10_TEST_13200
     * @tc.desc   test destructuring assignment with descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testDestructuringAssignDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test133
     * @tc.number SUB_BUILTINS_Object10_TEST_13300
     * @tc.desc   test object getOwnPropertyDescriptors for Symbol.asyncIterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testSymbolAsyncIteratorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test136
     * @tc.number SUB_BUILTINS_Object10_TEST_13600
     * @tc.desc   test array reduce does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testArrayReduceNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test137
     * @tc.number SUB_BUILTINS_Object10_TEST_13700
     * @tc.desc   test object getOwnPropertyDescriptors for Uint16Array properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn137_testUint16ArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test138
     * @tc.number SUB_BUILTINS_Object10_TEST_13800
     * @tc.desc   test object getOwnPropertyDescriptors for Int16Array properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testInt16ArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test139
     * @tc.number SUB_BUILTINS_Object10_TEST_13900
     * @tc.desc   test conflict between get and value in descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn139_testGetAndValueConflictDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test140
     * @tc.number SUB_BUILTINS_Object10_TEST_14000
     * @tc.desc   test conflict between set and writable in descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn140_testSetAndWritableConflictDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test141
     * @tc.number SUB_BUILTINS_Object10_TEST_14100
     * @tc.desc   test object getOwnPropertyDescriptors for mock DOM elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn141_testMockDOMElementDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test142
     * @tc.number SUB_BUILTINS_Object10_TEST_14200
     * @tc.desc   test descriptors of JSON.parse results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testJSONParseResultDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test143
     * @tc.number SUB_BUILTINS_Object10_TEST_14300
     * @tc.desc   test descriptors of JSON.stringify parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testJSONStringifyParamDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test144
     * @tc.number SUB_BUILTINS_Object10_TEST_14400
     * @tc.desc   test Map clear method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn144_testMapClearDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test145
     * @tc.number SUB_BUILTINS_Object10_TEST_14500
     * @tc.desc   test Set delete method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn145_testSetDeleteDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test146
     * @tc.number SUB_BUILTINS_Object10_TEST_14600
     * @tc.desc   test accessor descriptors returning objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testAccessorReturnObjDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test147
     * @tc.number SUB_BUILTINS_Object10_TEST_14700
     * @tc.desc   test object getOwnPropertyDescriptors for Uint8ClampedArray properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testUint8ClampedArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test148
     * @tc.number SUB_BUILTINS_Object10_TEST_14800
     * @tc.desc   test object getOwnPropertyDescriptors for BigUint64Array properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testBigUint64ArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test149
     * @tc.number SUB_BUILTINS_Object10_TEST_14900
     * @tc.desc   test object getOwnPropertyDescriptors for BigInt64Array properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testBigInt64ArrayPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test150
     * @tc.number SUB_BUILTINS_Object10_TEST_15000
     * @tc.desc   test Object.keys does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn150_testObjectKeysNoAffectDescriptor();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object10Test151
     * @tc.number SUB_BUILTINS_Object10_TEST_15100
     * @tc.desc   test object getOwnPropertyDescriptors for generator return method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn151_testGeneratorReturnDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test152
     * @tc.number SUB_BUILTINS_Object10_TEST_15200
     * @tc.desc   test object getOwnPropertyDescriptors for async generator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn152_testAsyncGeneratorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test153
     * @tc.number SUB_BUILTINS_Object10_TEST_15300
     * @tc.desc   test array concat method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn153_testArrayConcatDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test154
     * @tc.number SUB_BUILTINS_Object10_TEST_15400
     * @tc.desc   test array every does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn154_testArrayEveryNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test155
     * @tc.number SUB_BUILTINS_Object10_TEST_15500
     * @tc.desc   test array some does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn155_testArraySomeNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test158
     * @tc.number SUB_BUILTINS_Object10_TEST_15800
     * @tc.desc   test accessor descriptors with arrow function this binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn158_testAccessorArrowThisDescriptor();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object10Test159
     * @tc.number SUB_BUILTINS_Object10_TEST_15900
     * @tc.desc   test enumerable properties in Object.entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn159_testEnumerableObjectEntriesDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test160
     * @tc.number SUB_BUILTINS_Object10_TEST_16000
     * @tc.desc   test non-enumerable properties excluded from Object.entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn160_testNonEnumerableObjectEntriesDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test163
     * @tc.number SUB_BUILTINS_Object10_TEST_16300
     * @tc.desc   test array find does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn163_testArrayFindNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test164
     * @tc.number SUB_BUILTINS_Object10_TEST_16400
     * @tc.desc   test array findIndex does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn164_testArrayFindIndexNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test165
     * @tc.number SUB_BUILTINS_Object10_TEST_16500
     * @tc.desc   test Map has does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn165_testMapHasNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test166
     * @tc.number SUB_BUILTINS_Object10_TEST_16600
     * @tc.desc   test Set has does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn166_testSetHasNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test167
     * @tc.number SUB_BUILTINS_Object10_TEST_16700
     * @tc.desc   test accessor descriptors returning functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn167_testAccessorReturnFuncDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test168
     * @tc.number SUB_BUILTINS_Object10_TEST_16800
     * @tc.desc   test object getOwnPropertyDescriptors for nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn168_testNestedArrayDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test169
     * @tc.number SUB_BUILTINS_Object10_TEST_16900
     * @tc.desc   test property descriptor flags of frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testFrozenPropDescriptorFlags();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test170
     * @tc.number SUB_BUILTINS_Object10_TEST_17000
     * @tc.desc   test property descriptor flags of sealed objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn170_testSealedPropDescriptorFlags();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test173
     * @tc.number SUB_BUILTINS_Object10_TEST_17300
     * @tc.desc   test ArrayBuffer slice method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn173_testArrayBufferSliceDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test174
     * @tc.number SUB_BUILTINS_Object10_TEST_17400
     * @tc.desc   test DataView setFloat32 method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn174_testDataViewSetFloat32Descriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test175
     * @tc.number SUB_BUILTINS_Object10_TEST_17500
     * @tc.desc   test accessor descriptors dependent on Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn175_testAccessorPromiseDependentDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test176
     * @tc.number SUB_BUILTINS_Object10_TEST_17600
     * @tc.desc   test TypedArray subarray method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn176_testTypedArraySubarrayDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test177
     * @tc.number SUB_BUILTINS_Object10_TEST_17700
     * @tc.desc   test array flat method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn177_testArrayFlatDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test178
     * @tc.number SUB_BUILTINS_Object10_TEST_17800
     * @tc.desc   test array flatMap method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn178_testArrayFlatMapDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test179
     * @tc.number SUB_BUILTINS_Object10_TEST_17900
     * @tc.desc   test WeakMap get does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn179_testWeakMapGetNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test180
     * @tc.number SUB_BUILTINS_Object10_TEST_18000
     * @tc.desc   test WeakSet has does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn180_testWeakSetHasNoAffectDescriptor();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object10Test181
     * @tc.number SUB_BUILTINS_Object10_TEST_18100
     * @tc.desc   test Object.getPrototypeOf does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn181_testGetPrototypeNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test182
     * @tc.number SUB_BUILTINS_Object10_TEST_18200
     * @tc.desc   test object getOwnPropertyDescriptors for Promise.allSettled properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn182_testPromiseAllSettledPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test183
     * @tc.number SUB_BUILTINS_Object10_TEST_18300
     * @tc.desc   test object getOwnPropertyDescriptors for Promise.any properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn183_testPromiseAnyPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test184
     * @tc.number SUB_BUILTINS_Object10_TEST_18400
     * @tc.desc   test array reverse reference impact on descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn184_testArrayReverseRefDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test186
     * @tc.number SUB_BUILTINS_Object10_TEST_18600
     * @tc.desc   test object getOwnPropertyDescriptors for Symbol.isConcatSpreadable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn186_testSymbolIsConcatSpreadableDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test187
     * @tc.number SUB_BUILTINS_Object10_TEST_18700
     * @tc.desc   test object getOwnPropertyDescriptors for mock DOM Event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn187_testMockDOMEventDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test188
     * @tc.number SUB_BUILTINS_Object10_TEST_18800
     * @tc.desc   test array unshift reference impact on descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn188_testArrayUnshiftRefDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test189
     * @tc.number SUB_BUILTINS_Object10_TEST_18900
     * @tc.desc   test TypedArray set method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn189_testTypedArraySetDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test190
     * @tc.number SUB_BUILTINS_Object10_TEST_19000
     * @tc.desc   test Object.preventExtensions impact on descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn190_testPreventExtensionsDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test191
     * @tc.number SUB_BUILTINS_Object10_TEST_19100
     * @tc.desc   test object getOwnPropertyDescriptors for async generator iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn191_testAsyncGeneratorIteratorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test192
     * @tc.number SUB_BUILTINS_Object10_TEST_19200
     * @tc.desc   test array splice reference impact on descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn192_testArraySpliceRefDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test195
     * @tc.number SUB_BUILTINS_Object10_TEST_19500
     * @tc.desc   test accessor descriptors returning Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn195_testAccessorReturnPromiseDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test196
     * @tc.number SUB_BUILTINS_Object10_TEST_19600
     * @tc.desc   test array from Map impact on descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn196_testArrayFromMapDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test197
     * @tc.number SUB_BUILTINS_Object10_TEST_19700
     * @tc.desc   test object getOwnPropertyDescriptors for Set values iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn197_testSetValuesIteratorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test198
     * @tc.number SUB_BUILTINS_Object10_TEST_19800
     * @tc.desc   test object getOwnPropertyDescriptors for Map entries iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn198_testMapEntriesIteratorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test199
     * @tc.number SUB_BUILTINS_Object10_TEST_19900
     * @tc.desc   test enumerable properties in for...of (array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn199_testEnumerableForOfArrayDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test200
     * @tc.number SUB_BUILTINS_Object10_TEST_20000
     * @tc.desc   test non-enumerable properties excluded from for...of (array-like)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn200_testNonEnumerableForOfArrayLikeDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test204
     * @tc.number SUB_BUILTINS_Object10_TEST_20400
     * @tc.desc   test DataView setInt16 method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn204_testDataViewSetInt16Descriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test205
     * @tc.number SUB_BUILTINS_Object10_TEST_20500
     * @tc.desc   test accessor descriptors dependent on WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn205_testAccessorWeakMapDependentDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test206
     * @tc.number SUB_BUILTINS_Object10_TEST_20600
     * @tc.desc   test TypedArray reverse method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn206_testTypedArrayReverseDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test207
     * @tc.number SUB_BUILTINS_Object10_TEST_20700
     * @tc.desc   test array copyWithin method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn207_testArrayCopyWithinDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test208
     * @tc.number SUB_BUILTINS_Object10_TEST_20800
     * @tc.desc   test array fill range method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn208_testArrayFillRangeDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test209
     * @tc.number SUB_BUILTINS_Object10_TEST_20900
     * @tc.desc   test WeakMap delete method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn209_testWeakMapDeleteDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test210
     * @tc.number SUB_BUILTINS_Object10_TEST_21000
     * @tc.desc   test WeakSet delete method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn210_testWeakSetDeleteDescriptor();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object10Test211
     * @tc.number SUB_BUILTINS_Object10_TEST_21100
     * @tc.desc   test Object.isFrozen does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn211_testIsFrozenNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test212
     * @tc.number SUB_BUILTINS_Object10_TEST_21200
     * @tc.desc   test object getOwnPropertyDescriptors for Promise.finally properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn212_testPromiseFinallyPropDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test213
     * @tc.number SUB_BUILTINS_Object10_TEST_21300
     * @tc.desc   test object getOwnPropertyDescriptors for custom Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn213_testCustomSymbolIteratorDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test214
     * @tc.number SUB_BUILTINS_Object10_TEST_21400
     * @tc.desc   test array created with custom descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn214_testArrayWithDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test215
     * @tc.number SUB_BUILTINS_Object10_TEST_21500
     * @tc.desc   test object getOwnPropertyDescriptors for Symbol.toPrimitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn215_testSymbolToPrimitiveDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test216
     * @tc.number SUB_BUILTINS_Object10_TEST_21600
     * @tc.desc   test object getOwnPropertyDescriptors for mock DOM Style
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn216_testMockDOMStyleDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test217
     * @tc.number SUB_BUILTINS_Object10_TEST_21700
     * @tc.desc   test array flat with custom depth descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn217_testArrayFlatDepthDescriptor();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object10Test218
     * @tc.number SUB_BUILTINS_Object10_TEST_21800
     * @tc.desc   test TypedArray fill method descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn218_testTypedArrayFillDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test219
     * @tc.number SUB_BUILTINS_Object10_TEST_21900
     * @tc.desc   test Object.isSealed does not affect descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn219_testIsSealedNoAffectDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test220
     * @tc.number SUB_BUILTINS_Object10_TEST_22000
     * @tc.desc   test object getOwnPropertyDescriptors for async generator return method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await Fn220_testAsyncGeneratorReturnDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test221
     * @tc.number SUB_BUILTINS_Object10_TEST_22100
     * @tc.desc   test array filter with empty result descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn221_testArrayFilterEmptyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test224
     * @tc.number SUB_BUILTINS_Object10_TEST_22400
     * @tc.desc   test accessor descriptors returning WeakSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn224_testAccessorReturnWeakSetDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test226
     * @tc.number SUB_BUILTINS_Object10_TEST_22600
     * @tc.desc   test array map with empty result descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn226_testArrayMapEmptyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test227
     * @tc.number SUB_BUILTINS_Object10_TEST_22700
     * @tc.desc   test object getOwnPropertyDescriptors for Set prototype values method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn227_testSetPrototypeValuesDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test228
     * @tc.number SUB_BUILTINS_Object10_TEST_22800
     * @tc.desc   test object getOwnPropertyDescriptors for Map prototype keys method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn228_testMapPrototypeKeysDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test229
     * @tc.number SUB_BUILTINS_Object10_TEST_22900
     * @tc.desc   test enumerable properties in Reflect.ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn229_testEnumerableReflectOwnKeysDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object10Test230
     * @tc.number SUB_BUILTINS_Object10_TEST_23000
     * @tc.desc   test non-enumerable properties in Reflect.ownKeys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object10Test230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn230_testNonEnumerableReflectOwnKeysDescriptor();
      expect(result).assertEqual(true);
    });
  })
}