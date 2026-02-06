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
  Fn01_testGetPrototypeOfNormalObject,
  Fn02_testGetPrototypeOfNullPrototypeObject,
  Fn03_testNonObjectCoercion,
  Fn04_testGetPrototypeOfArray,
  Fn05_testGetPrototypeOfFunction,
  Fn06_testGetPrototypeOfDate,
  Fn07_testGetPrototypeOfRegExp,
  Fn08_testGetPrototypeOfBooleanPrimitive,
  Fn09_testGetPrototypeOfStringPrimitive,
  Fn100_testGetPrototypeOfStringIterator,
  Fn101_testGetPrototypeOfCustomIterator,
  Fn102_testGetPrototypeOfProxy,
  Fn103_testGetPrototypeOfProxyArray,
  Fn104_testGetPrototypeOfDateMethod,
  Fn105_testGetPrototypeOfBoundFunctionProto,
  Fn106_testGetPrototypeOfClassStaticMethod,
  Fn107_testGetPrototypeOfClassInstanceMethod,
  Fn108_testGetPrototypeOfObjectKeysArray,
  Fn109_testGetPrototypeOfObjectValuesArray,
  Fn10_testGetPrototypeOfSymbolPrimitive,
  Fn110_testGetPrototypeOfObjectEntriesArray,
  Fn111_testGetPrototypeOfJsonParsedObject,
  Fn112_testGetPrototypeOfJsonParsedArray,
  Fn113_testGetPrototypeOfWeakMapMethod,
  Fn114_testGetPrototypeOfWeakSetMethod,
  Fn11_testGetPrototypeOfCustomClassInstance,
  Fn122_testGetPrototypeOfAsyncGeneratorFunction,
  Fn123_testGetPrototypeOfAsyncFuncPromise,
  Fn126_testGetPrototypeOfDataViewMethod,
  Fn127_testGetPrototypeOfTypedArraySetMethod,
  Fn129_testGetPrototypeOfCopiedProtoObject,
  Fn12_testGetPrototypeOfInheritedClassInstance,
  Fn130_testGetPrototypeOfEmptyArray,
  Fn131_testGetPrototypeOfObjectWithNestedObj,
  Fn132_testGetPrototypeOfObjectWithArray,
  Fn133_testGetPrototypeOfRegExpExecResult,
  Fn134_testGetPrototypeOfDateGetTimeResult,
  Fn135_testGetPrototypeOfMapGetResult,
  Fn136_testGetPrototypeOfSetHasResult,
  Fn137_testGetPrototypeOfCustomErrorInstance,
  Fn138_testGetPrototypeOfCustomErrorPrototype,
  Fn13_testPrototypeChainOfInheritedClass,
  Fn142_testGetPrototypeOfArrayBufferByteLength,
  Fn143_testGetPrototypeOfFrozenObject,
  Fn144_testGetPrototypeOfSealedObject,
  Fn145_testGetPrototypeOfNonExtensibleObject,
  Fn146_testGetPrototypeOfGeneratorNextResult,
  Fn147_testGetPrototypeOfAsyncGeneratorNextPromise,
  Fn148_testGetPrototypeOfTrimmedString,
  Fn149_testGetPrototypeOfToFixedResult,
  Fn14_testGetPrototypeOfObjectPrototype,
  Fn150_testGetPrototypeOfSymbolDescription,
  Fn151_testGetPrototypeOfBigIntToStringResult,
  Fn152_testGetPrototypeOfConcatenatedArray,
  Fn153_testGetPrototypeOfMultiSourceAssignedObject,
  Fn154_testGetPrototypeOfPromiseThenResult,
  Fn155_testGetPrototypeOfPromiseCatchResult,
  Fn156_testGetPrototypeOfPromiseFinallyResult,
  Fn157_testGetPrototypeOfTypedArraySubarray,
  Fn158_testGetPrototypeOfDataViewSetMethod,
  Fn15_testGetPrototypeOfArrayPrototype,
  Fn163_testGetPrototypeOfClassStaticProperty,
  Fn164_testGetPrototypeOfClassInstanceArrayProperty,
  Fn165_testGetPrototypeOfProxyCustomClassInstance,
  Fn166_testGetPrototypeOfErrorStack,
  Fn167_testGetPrototypeOfDateLocaleString,
  Fn168_testGetPrototypeOfMapValuesIterator,
  Fn169_testGetPrototypeOfSetValuesIterator,
  Fn16_testGetPrototypeOfFunctionPrototype,
  Fn170_testGetPrototypeOfArrayKeysIterator,
  Fn171_testGetPrototypeOfSymbolToStringResult,
  Fn172_testGetPrototypeOfBooleanValueOfResult,
  Fn173_testGetPrototypeOfNumberValueOfResult,
  Fn174_testGetPrototypeOfStringValueOfResult,
  Fn175_testGetMiddlePrototypeOfNestedInheritance,
  Fn176_testGetPrototypeOfAsyncFunctionCallMethod,
  Fn177_testGetPrototypeOfAsyncGeneratorReturnPromise,
  Fn17_testGetPrototypeOfObjectCreateWithPrototype,
  Fn180_testGetPrototypeOfArrayBufferSlice,
  Fn181_testGetPrototypeOfInt8ArraySlice,
  Fn183_testGetPrototypeOfPromiseAllSettledResult,
  Fn184_testGetPrototypeOfCustomErrorInherited,
  Fn185_testGetPrototypeOfMapClearMethod,
  Fn186_testGetPrototypeOfSetDeleteMethod,
  Fn187_testGetPrototypeOfFilteredArray,
  Fn188_testGetPrototypeOfReduceResultObject,
  Fn189_testGetPrototypeOfAsyncGeneratorThrowPromise,
  Fn18_testGetPrototypeOfInstanceAfterPrototypeChange,
  Fn195_testGetPrototypeOfUint32ArrayMap,
  Fn196_testGetPrototypeOfDataViewGetFloat32Method,
  Fn197_testGetPrototypeOfProxyMap,
  Fn198_testGetPrototypeOfProxySet,
  Fn199_testGetPrototypeOfCustomIteratorNextResult,
  Fn19_testGetPrototypeOfMap,
  Fn200_testGetPrototypeOfGeneratorThrowResult,
  Fn201_testGetPrototypeOfArrayFindResultObject,
  Fn202_testGetPrototypeOfStringMatchResult,
  Fn203_testGetPrototypeOfStringReplaceResult,
  Fn204_testGetPrototypeOfNumberToExponentialResult,
  Fn205_testGetPrototypeOfBigIntToLocaleStringResult,
  Fn206_testGetPrototypeOfObjectCreateNullInherit,
  Fn209_testGetPrototypeOfClassInstanceCustomMethod,
  Fn20_testGetPrototypeOfSet,
  Fn210_testGetPrototypeOfClassStaticMethodCall,
  Fn211_testGetPrototypeOfFloat32ArraySlice,
  Fn213_testGetPrototypeOfPromiseAnyResult,
  Fn214_testGetPrototypeOfCustomMapInherited,
  Fn215_testGetPrototypeOfWeakMapDeleteMethod,
  Fn216_testGetPrototypeOfWeakSetHasMethod,
  Fn217_testGetPrototypeOfArrayEveryResult,
  Fn218_testGetPrototypeOfArraySomeResult,
  Fn219_testGetPrototypeOfAsyncGeneratorReturnPromiseAgain,
  Fn21_testGetPrototypeOfWeakMap,
  Fn224_testGetPrototypeOfBigInt64ArrayFilter,
  Fn225_testGetPrototypeOfDataViewSetFloat64Method,
  Fn226_testGetPrototypeOfProxyWeakMap,
  Fn227_testGetPrototypeOfProxyWeakSet,
  Fn228_testGetPrototypeOfCustomIteratorSymbolMethod,
  Fn229_testGetPrototypeOfGeneratorReturnResult,
  Fn22_testGetPrototypeOfWeakSet,
  Fn230_testGetPrototypeOfArrayFindIndexResult,
  Fn231_testGetPrototypeOfStringSplitEmptySeparator,
  Fn232_testGetPrototypeOfStringToUpperCaseResult,
  Fn233_testGetPrototypeOfNumberToPrecisionResult,
  Fn234_testGetPrototypeOfBigIntValueOfResult,
  Fn235_testGetTopPrototypeOfThreeLevelInherit,
  Fn238_testGetPrototypeOfInheritedClassMethod,
  Fn239_testGetPrototypeOfClassStaticMethodApply,
  Fn23_testGetPrototypeOfPromise,
  Fn240_testGetPrototypeOfObjectHasOwnPropertyMethod,
  Fn24_testGetPrototypeOfError,
  Fn25_testGetPrototypeOfTypeError,
  Fn26_testGetPrototypeOfObjectLiteral,
  Fn27_testMultiLevelPrototypeChain,
  Fn28_testGetPrototypeOfBigIntPrimitive,
  Fn29_testGetPrototypeOfArrayBuffer,
  Fn30_testGetPrototypeOfTypedArray,
  Fn31_testGetPrototypeOfDataView,
  Fn32_testGetPrototypeOfRegExpConstructor,
  Fn33_testGetPrototypeOfTraditionalFunction,
  Fn34_testGetPrototypeOfArrowFunction,
  Fn35_testGetPrototypeOfClassConstructor,
  Fn36_testGetPrototypeOfInheritedClassConstructor,
  Fn37_testGetPrototypeOfNestedObjectCreate,
  Fn38_testGetPrototypeOfBooleanObject,
  Fn39_testGetPrototypeOfStringObject,
  Fn40_testGetPrototypeOfNumberObject,
  Fn41_testGetPrototypeOfBigIntObject,
  Fn42_testGetPrototypeOfSymbolObject,
  Fn43_testGetPrototypeOfRangeError,
  Fn44_testGetPrototypeOfReferenceError,
  Fn45_testGetPrototypeOfPromiseSubclass,
  Fn46_testGetPrototypeOfPromisePrototype,
  Fn47_testGetPrototypeOfMapPrototype,
  Fn48_testGetPrototypeOfSetPrototype,
  Fn49_testGetPrototypeOfInt32Array,
  Fn50_testGetPrototypeOfFloat64Array,
  Fn51_testGetPrototypeOfTypedArrayPrototype,
  Fn52_testGetPrototypeOfArrayBufferSubclass,
  Fn53_testGetPrototypeOfWeakMapSubclass,
  Fn54_testGetPrototypeOfWeakSetSubclass,
  Fn55_testGetPrototypeAfterSetPrototypeOf,
  Fn56_testGetPrototypeOfErrorPrototype,
  Fn57_testGetPrototypeOfDatePrototype,
  Fn59_testGetPrototypeOfObjectLiteralWithProps,
  Fn60_testGetPrototypeOfTopLevelInheritedClass,
  Fn65_testGetPrototypeOfInt8Array,
  Fn66_testGetPrototypeOfUint16Array,
  Fn67_testGetPrototypeOfInt16Array,
  Fn68_testGetPrototypeOfUint32Array,
  Fn69_testGetPrototypeOfInt32ArrayAgain,
  Fn70_testGetPrototypeOfFloat32Array,
  Fn71_testGetPrototypeOfFloat64ArrayAgain,
  Fn72_testGetPrototypeOfBigInt64Array,
  Fn73_testGetPrototypeOfBigUint64Array,
  Fn74_testGetPrototypeOfCustomClassWithMethod,
  Fn75_testGetPrototypeOfInheritedClassWithMethod,
  Fn76_testPrototypeChainOfInheritedClassWithMethod,
  Fn77_testGetPrototypeOfObjectCreateNull,
  Fn78_testGetTopPrototypeOfNestedObjectCreate,
  Fn79_testGetPrototypeOfRejectedPromise,
  Fn80_testGetPrototypeOfPromiseAll,
  Fn81_testGetPrototypeOfPromiseRace,
  Fn82_testGetPrototypeOfPromiseAllSettled,
  Fn83_testGetPrototypeOfPromiseAny,
  Fn84_testGetPrototypeOfEvalError,
  Fn85_testGetPrototypeOfSyntaxError,
  Fn86_testGetPrototypeOfURIError,
  Fn87_testGetPrototypeOfAssignedObject,
  Fn88_testGetPrototypeOfSlicedArray,
  Fn89_testGetPrototypeOfMappedArray,
  Fn90_testGetTopPrototypeOfMultiLevelInheritance,
  Fn94_testGetPrototypeOfArrayFrom,
  Fn95_testGetPrototypeOfArrayOf,
  Fn96_testGetPrototypeOfSplitArray,
  Fn97_testGetPrototypeOfMapIterator,
  Fn98_testGetPrototypeOfSetIterator,
  Fn99_testGetPrototypeOfArrayIterator
} from './Object13';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object13Test() {
  describe('Object13Test', () => {
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
     * @tc.name   Object13Test001
     * @tc.number SUB_BUILTINS_Object13_TEST_0100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testGetPrototypeOfNormalObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test002
     * @tc.number SUB_BUILTINS_Object13_TEST_0200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testGetPrototypeOfNullPrototypeObject();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object13Test003
     * @tc.number SUB_BUILTINS_Object13_TEST_0300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testNonObjectCoercion();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test004
     * @tc.number SUB_BUILTINS_Object13_TEST_0400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn04_testGetPrototypeOfArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test005
     * @tc.number SUB_BUILTINS_Object13_TEST_0500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn05_testGetPrototypeOfFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test006
     * @tc.number SUB_BUILTINS_Object13_TEST_0600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn06_testGetPrototypeOfDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test007
     * @tc.number SUB_BUILTINS_Object13_TEST_0700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testGetPrototypeOfRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test008
     * @tc.number SUB_BUILTINS_Object13_TEST_0800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testGetPrototypeOfBooleanPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test009
     * @tc.number SUB_BUILTINS_Object13_TEST_0900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testGetPrototypeOfStringPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test010
     * @tc.number SUB_BUILTINS_Object13_TEST_1000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testGetPrototypeOfSymbolPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test011
     * @tc.number SUB_BUILTINS_Object13_TEST_1100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testGetPrototypeOfCustomClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test012
     * @tc.number SUB_BUILTINS_Object13_TEST_1200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testGetPrototypeOfInheritedClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test013
     * @tc.number SUB_BUILTINS_Object13_TEST_1300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn13_testPrototypeChainOfInheritedClass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test014
     * @tc.number SUB_BUILTINS_Object13_TEST_1400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testGetPrototypeOfObjectPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test015
     * @tc.number SUB_BUILTINS_Object13_TEST_1500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testGetPrototypeOfArrayPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test016
     * @tc.number SUB_BUILTINS_Object13_TEST_1600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testGetPrototypeOfFunctionPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test017
     * @tc.number SUB_BUILTINS_Object13_TEST_1700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testGetPrototypeOfObjectCreateWithPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test018
     * @tc.number SUB_BUILTINS_Object13_TEST_1800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn18_testGetPrototypeOfInstanceAfterPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test019
     * @tc.number SUB_BUILTINS_Object13_TEST_1900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testGetPrototypeOfMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test020
     * @tc.number SUB_BUILTINS_Object13_TEST_2000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testGetPrototypeOfSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test021
     * @tc.number SUB_BUILTINS_Object13_TEST_2100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testGetPrototypeOfWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test022
     * @tc.number SUB_BUILTINS_Object13_TEST_2200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testGetPrototypeOfWeakSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test023
     * @tc.number SUB_BUILTINS_Object13_TEST_2300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testGetPrototypeOfPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test024
     * @tc.number SUB_BUILTINS_Object13_TEST_2400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testGetPrototypeOfError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test025
     * @tc.number SUB_BUILTINS_Object13_TEST_2500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testGetPrototypeOfTypeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test026
     * @tc.number SUB_BUILTINS_Object13_TEST_2600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testGetPrototypeOfObjectLiteral();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test027
     * @tc.number SUB_BUILTINS_Object13_TEST_2700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testMultiLevelPrototypeChain();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test028
     * @tc.number SUB_BUILTINS_Object13_TEST_2800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testGetPrototypeOfBigIntPrimitive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test029
     * @tc.number SUB_BUILTINS_Object13_TEST_2900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testGetPrototypeOfArrayBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test030
     * @tc.number SUB_BUILTINS_Object13_TEST_3000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testGetPrototypeOfTypedArray();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object13Test031
     * @tc.number SUB_BUILTINS_Object13_TEST_3100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn31_testGetPrototypeOfDataView();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test032
     * @tc.number SUB_BUILTINS_Object13_TEST_3200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testGetPrototypeOfRegExpConstructor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test033
     * @tc.number SUB_BUILTINS_Object13_TEST_3300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testGetPrototypeOfTraditionalFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test034
     * @tc.number SUB_BUILTINS_Object13_TEST_3400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testGetPrototypeOfArrowFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test035
     * @tc.number SUB_BUILTINS_Object13_TEST_3500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testGetPrototypeOfClassConstructor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test036
     * @tc.number SUB_BUILTINS_Object13_TEST_3600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn36_testGetPrototypeOfInheritedClassConstructor();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test037
     * @tc.number SUB_BUILTINS_Object13_TEST_3700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testGetPrototypeOfNestedObjectCreate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test038
     * @tc.number SUB_BUILTINS_Object13_TEST_3800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn38_testGetPrototypeOfBooleanObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test039
     * @tc.number SUB_BUILTINS_Object13_TEST_3900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testGetPrototypeOfStringObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test040
     * @tc.number SUB_BUILTINS_Object13_TEST_4000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testGetPrototypeOfNumberObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test041
     * @tc.number SUB_BUILTINS_Object13_TEST_4100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testGetPrototypeOfBigIntObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test042
     * @tc.number SUB_BUILTINS_Object13_TEST_4200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn42_testGetPrototypeOfSymbolObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test043
     * @tc.number SUB_BUILTINS_Object13_TEST_4300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testGetPrototypeOfRangeError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test044
     * @tc.number SUB_BUILTINS_Object13_TEST_4400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testGetPrototypeOfReferenceError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test045
     * @tc.number SUB_BUILTINS_Object13_TEST_4500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn45_testGetPrototypeOfPromiseSubclass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test046
     * @tc.number SUB_BUILTINS_Object13_TEST_4600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testGetPrototypeOfPromisePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test047
     * @tc.number SUB_BUILTINS_Object13_TEST_4700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testGetPrototypeOfMapPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test048
     * @tc.number SUB_BUILTINS_Object13_TEST_4800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testGetPrototypeOfSetPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test049
     * @tc.number SUB_BUILTINS_Object13_TEST_4900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn49_testGetPrototypeOfInt32Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test050
     * @tc.number SUB_BUILTINS_Object13_TEST_5000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn50_testGetPrototypeOfFloat64Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test051
     * @tc.number SUB_BUILTINS_Object13_TEST_5100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn51_testGetPrototypeOfTypedArrayPrototype();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test052
     * @tc.number SUB_BUILTINS_Object13_TEST_5200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testGetPrototypeOfArrayBufferSubclass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test053
     * @tc.number SUB_BUILTINS_Object13_TEST_5300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testGetPrototypeOfWeakMapSubclass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test054
     * @tc.number SUB_BUILTINS_Object13_TEST_5400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testGetPrototypeOfWeakSetSubclass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test055
     * @tc.number SUB_BUILTINS_Object13_TEST_5500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testGetPrototypeAfterSetPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test056
     * @tc.number SUB_BUILTINS_Object13_TEST_5600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testGetPrototypeOfErrorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test057
     * @tc.number SUB_BUILTINS_Object13_TEST_5700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testGetPrototypeOfDatePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test059
     * @tc.number SUB_BUILTINS_Object13_TEST_5900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testGetPrototypeOfObjectLiteralWithProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test060
     * @tc.number SUB_BUILTINS_Object13_TEST_6000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn60_testGetPrototypeOfTopLevelInheritedClass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test065
     * @tc.number SUB_BUILTINS_Object13_TEST_6500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn65_testGetPrototypeOfInt8Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test066
     * @tc.number SUB_BUILTINS_Object13_TEST_6600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn66_testGetPrototypeOfUint16Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test067
     * @tc.number SUB_BUILTINS_Object13_TEST_6700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn67_testGetPrototypeOfInt16Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test068
     * @tc.number SUB_BUILTINS_Object13_TEST_6800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testGetPrototypeOfUint32Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test069
     * @tc.number SUB_BUILTINS_Object13_TEST_6900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn69_testGetPrototypeOfInt32ArrayAgain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test070
     * @tc.number SUB_BUILTINS_Object13_TEST_7000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn70_testGetPrototypeOfFloat32Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test071
     * @tc.number SUB_BUILTINS_Object13_TEST_7100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn71_testGetPrototypeOfFloat64ArrayAgain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test072
     * @tc.number SUB_BUILTINS_Object13_TEST_7200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn72_testGetPrototypeOfBigInt64Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test073
     * @tc.number SUB_BUILTINS_Object13_TEST_7300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn73_testGetPrototypeOfBigUint64Array();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test074
     * @tc.number SUB_BUILTINS_Object13_TEST_7400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn74_testGetPrototypeOfCustomClassWithMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test075
     * @tc.number SUB_BUILTINS_Object13_TEST_7500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testGetPrototypeOfInheritedClassWithMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test076
     * @tc.number SUB_BUILTINS_Object13_TEST_7600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn76_testPrototypeChainOfInheritedClassWithMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test077
     * @tc.number SUB_BUILTINS_Object13_TEST_7700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testGetPrototypeOfObjectCreateNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test078
     * @tc.number SUB_BUILTINS_Object13_TEST_7800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testGetTopPrototypeOfNestedObjectCreate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test079
     * @tc.number SUB_BUILTINS_Object13_TEST_7900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn79_testGetPrototypeOfRejectedPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test080
     * @tc.number SUB_BUILTINS_Object13_TEST_8000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testGetPrototypeOfPromiseAll();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test081
     * @tc.number SUB_BUILTINS_Object13_TEST_8100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn81_testGetPrototypeOfPromiseRace();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test082
     * @tc.number SUB_BUILTINS_Object13_TEST_8200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn82_testGetPrototypeOfPromiseAllSettled();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test083
     * @tc.number SUB_BUILTINS_Object13_TEST_8300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn83_testGetPrototypeOfPromiseAny();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test084
     * @tc.number SUB_BUILTINS_Object13_TEST_8400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testGetPrototypeOfEvalError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test085
     * @tc.number SUB_BUILTINS_Object13_TEST_8500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn85_testGetPrototypeOfSyntaxError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test086
     * @tc.number SUB_BUILTINS_Object13_TEST_8600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn86_testGetPrototypeOfURIError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test087
     * @tc.number SUB_BUILTINS_Object13_TEST_8700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn87_testGetPrototypeOfAssignedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test088
     * @tc.number SUB_BUILTINS_Object13_TEST_8800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testGetPrototypeOfSlicedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test089
     * @tc.number SUB_BUILTINS_Object13_TEST_8900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn89_testGetPrototypeOfMappedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test090
     * @tc.number SUB_BUILTINS_Object13_TEST_9000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testGetTopPrototypeOfMultiLevelInheritance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test094
     * @tc.number SUB_BUILTINS_Object13_TEST_9400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testGetPrototypeOfArrayFrom();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test095
     * @tc.number SUB_BUILTINS_Object13_TEST_9500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testGetPrototypeOfArrayOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test096
     * @tc.number SUB_BUILTINS_Object13_TEST_9600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn96_testGetPrototypeOfSplitArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test097
     * @tc.number SUB_BUILTINS_Object13_TEST_9700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn97_testGetPrototypeOfMapIterator();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test098
     * @tc.number SUB_BUILTINS_Object13_TEST_9800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn98_testGetPrototypeOfSetIterator();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test099
     * @tc.number SUB_BUILTINS_Object13_TEST_9900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testGetPrototypeOfArrayIterator();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test100
     * @tc.number SUB_BUILTINS_Object13_TEST_10000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn100_testGetPrototypeOfStringIterator();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test101
     * @tc.number SUB_BUILTINS_Object13_TEST_10100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn101_testGetPrototypeOfCustomIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test102
     * @tc.number SUB_BUILTINS_Object13_TEST_10200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn102_testGetPrototypeOfProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test103
     * @tc.number SUB_BUILTINS_Object13_TEST_10300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testGetPrototypeOfProxyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test104
     * @tc.number SUB_BUILTINS_Object13_TEST_10400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn104_testGetPrototypeOfDateMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test105
     * @tc.number SUB_BUILTINS_Object13_TEST_10500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn105_testGetPrototypeOfBoundFunctionProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test106
     * @tc.number SUB_BUILTINS_Object13_TEST_10600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_testGetPrototypeOfClassStaticMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test107
     * @tc.number SUB_BUILTINS_Object13_TEST_10700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testGetPrototypeOfClassInstanceMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test108
     * @tc.number SUB_BUILTINS_Object13_TEST_10800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn108_testGetPrototypeOfObjectKeysArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test109
     * @tc.number SUB_BUILTINS_Object13_TEST_10900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn109_testGetPrototypeOfObjectValuesArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test110
     * @tc.number SUB_BUILTINS_Object13_TEST_11000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn110_testGetPrototypeOfObjectEntriesArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test111
     * @tc.number SUB_BUILTINS_Object13_TEST_11100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testGetPrototypeOfJsonParsedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test112
     * @tc.number SUB_BUILTINS_Object13_TEST_11200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn112_testGetPrototypeOfJsonParsedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test113
     * @tc.number SUB_BUILTINS_Object13_TEST_11300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn113_testGetPrototypeOfWeakMapMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test114
     * @tc.number SUB_BUILTINS_Object13_TEST_11400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn114_testGetPrototypeOfWeakSetMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test122
     * @tc.number SUB_BUILTINS_Object13_TEST_12200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn122_testGetPrototypeOfAsyncGeneratorFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test123
     * @tc.number SUB_BUILTINS_Object13_TEST_12300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn123_testGetPrototypeOfAsyncFuncPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test126
     * @tc.number SUB_BUILTINS_Object13_TEST_12600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn126_testGetPrototypeOfDataViewMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test127
     * @tc.number SUB_BUILTINS_Object13_TEST_12700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testGetPrototypeOfTypedArraySetMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test129
     * @tc.number SUB_BUILTINS_Object13_TEST_12900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn129_testGetPrototypeOfCopiedProtoObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test130
     * @tc.number SUB_BUILTINS_Object13_TEST_13000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn130_testGetPrototypeOfEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test131
     * @tc.number SUB_BUILTINS_Object13_TEST_13100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn131_testGetPrototypeOfObjectWithNestedObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test132
     * @tc.number SUB_BUILTINS_Object13_TEST_13200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn132_testGetPrototypeOfObjectWithArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test133
     * @tc.number SUB_BUILTINS_Object13_TEST_13300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testGetPrototypeOfRegExpExecResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test134
     * @tc.number SUB_BUILTINS_Object13_TEST_13400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn134_testGetPrototypeOfDateGetTimeResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test135
     * @tc.number SUB_BUILTINS_Object13_TEST_13500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testGetPrototypeOfMapGetResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test136
     * @tc.number SUB_BUILTINS_Object13_TEST_13600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn136_testGetPrototypeOfSetHasResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test137
     * @tc.number SUB_BUILTINS_Object13_TEST_13700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn137_testGetPrototypeOfCustomErrorInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test138
     * @tc.number SUB_BUILTINS_Object13_TEST_13800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn138_testGetPrototypeOfCustomErrorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test142
     * @tc.number SUB_BUILTINS_Object13_TEST_14200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn142_testGetPrototypeOfArrayBufferByteLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test143
     * @tc.number SUB_BUILTINS_Object13_TEST_14300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testGetPrototypeOfFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test144
     * @tc.number SUB_BUILTINS_Object13_TEST_14400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn144_testGetPrototypeOfSealedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test145
     * @tc.number SUB_BUILTINS_Object13_TEST_14500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn145_testGetPrototypeOfNonExtensibleObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test146
     * @tc.number SUB_BUILTINS_Object13_TEST_14600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn146_testGetPrototypeOfGeneratorNextResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test147
     * @tc.number SUB_BUILTINS_Object13_TEST_14700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testGetPrototypeOfAsyncGeneratorNextPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test148
     * @tc.number SUB_BUILTINS_Object13_TEST_14800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn148_testGetPrototypeOfTrimmedString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test149
     * @tc.number SUB_BUILTINS_Object13_TEST_14900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn149_testGetPrototypeOfToFixedResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test150
     * @tc.number SUB_BUILTINS_Object13_TEST_15000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn150_testGetPrototypeOfSymbolDescription();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object13Test151
     * @tc.number SUB_BUILTINS_Object13_TEST_15100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn151_testGetPrototypeOfBigIntToStringResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test152
     * @tc.number SUB_BUILTINS_Object13_TEST_15200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn152_testGetPrototypeOfConcatenatedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test153
     * @tc.number SUB_BUILTINS_Object13_TEST_15300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn153_testGetPrototypeOfMultiSourceAssignedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test154
     * @tc.number SUB_BUILTINS_Object13_TEST_15400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn154_testGetPrototypeOfPromiseThenResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test155
     * @tc.number SUB_BUILTINS_Object13_TEST_15500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn155_testGetPrototypeOfPromiseCatchResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test156
     * @tc.number SUB_BUILTINS_Object13_TEST_15600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn156_testGetPrototypeOfPromiseFinallyResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test157
     * @tc.number SUB_BUILTINS_Object13_TEST_15700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn157_testGetPrototypeOfTypedArraySubarray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test158
     * @tc.number SUB_BUILTINS_Object13_TEST_15800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn158_testGetPrototypeOfDataViewSetMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test163
     * @tc.number SUB_BUILTINS_Object13_TEST_16300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn163_testGetPrototypeOfClassStaticProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test164
     * @tc.number SUB_BUILTINS_Object13_TEST_16400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn164_testGetPrototypeOfClassInstanceArrayProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test165
     * @tc.number SUB_BUILTINS_Object13_TEST_16500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn165_testGetPrototypeOfProxyCustomClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test166
     * @tc.number SUB_BUILTINS_Object13_TEST_16600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn166_testGetPrototypeOfErrorStack();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test167
     * @tc.number SUB_BUILTINS_Object13_TEST_16700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn167_testGetPrototypeOfDateLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test168
     * @tc.number SUB_BUILTINS_Object13_TEST_16800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn168_testGetPrototypeOfMapValuesIterator();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test169
     * @tc.number SUB_BUILTINS_Object13_TEST_16900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testGetPrototypeOfSetValuesIterator();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test170
     * @tc.number SUB_BUILTINS_Object13_TEST_17000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn170_testGetPrototypeOfArrayKeysIterator();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test171
     * @tc.number SUB_BUILTINS_Object13_TEST_17100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn171_testGetPrototypeOfSymbolToStringResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test172
     * @tc.number SUB_BUILTINS_Object13_TEST_17200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn172_testGetPrototypeOfBooleanValueOfResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test173
     * @tc.number SUB_BUILTINS_Object13_TEST_17300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn173_testGetPrototypeOfNumberValueOfResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test174
     * @tc.number SUB_BUILTINS_Object13_TEST_17400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn174_testGetPrototypeOfStringValueOfResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test175
     * @tc.number SUB_BUILTINS_Object13_TEST_17500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn175_testGetMiddlePrototypeOfNestedInheritance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test176
     * @tc.number SUB_BUILTINS_Object13_TEST_17600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn176_testGetPrototypeOfAsyncFunctionCallMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test177
     * @tc.number SUB_BUILTINS_Object13_TEST_17700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn177_testGetPrototypeOfAsyncGeneratorReturnPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test180
     * @tc.number SUB_BUILTINS_Object13_TEST_18000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn180_testGetPrototypeOfArrayBufferSlice();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object13Test181
     * @tc.number SUB_BUILTINS_Object13_TEST_18100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn181_testGetPrototypeOfInt8ArraySlice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test183
     * @tc.number SUB_BUILTINS_Object13_TEST_18300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn183_testGetPrototypeOfPromiseAllSettledResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test184
     * @tc.number SUB_BUILTINS_Object13_TEST_18400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn184_testGetPrototypeOfCustomErrorInherited();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test185
     * @tc.number SUB_BUILTINS_Object13_TEST_18500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn185_testGetPrototypeOfMapClearMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test186
     * @tc.number SUB_BUILTINS_Object13_TEST_18600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn186_testGetPrototypeOfSetDeleteMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test187
     * @tc.number SUB_BUILTINS_Object13_TEST_18700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn187_testGetPrototypeOfFilteredArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test188
     * @tc.number SUB_BUILTINS_Object13_TEST_18800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn188_testGetPrototypeOfReduceResultObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test189
     * @tc.number SUB_BUILTINS_Object13_TEST_18900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn189_testGetPrototypeOfAsyncGeneratorThrowPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test195
     * @tc.number SUB_BUILTINS_Object13_TEST_19500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn195_testGetPrototypeOfUint32ArrayMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test196
     * @tc.number SUB_BUILTINS_Object13_TEST_19600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn196_testGetPrototypeOfDataViewGetFloat32Method();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test197
     * @tc.number SUB_BUILTINS_Object13_TEST_19700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn197_testGetPrototypeOfProxyMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test198
     * @tc.number SUB_BUILTINS_Object13_TEST_19800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn198_testGetPrototypeOfProxySet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test199
     * @tc.number SUB_BUILTINS_Object13_TEST_19900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn199_testGetPrototypeOfCustomIteratorNextResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test200
     * @tc.number SUB_BUILTINS_Object13_TEST_20000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        Fn200_testGetPrototypeOfGeneratorThrowResult();
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual("test");
      }
    });

    /**
     * @tc.name   Object13Test201
     * @tc.number SUB_BUILTINS_Object13_TEST_20100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn201_testGetPrototypeOfArrayFindResultObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test202
     * @tc.number SUB_BUILTINS_Object13_TEST_20200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn202_testGetPrototypeOfStringMatchResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test203
     * @tc.number SUB_BUILTINS_Object13_TEST_20300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn203_testGetPrototypeOfStringReplaceResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test204
     * @tc.number SUB_BUILTINS_Object13_TEST_20400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn204_testGetPrototypeOfNumberToExponentialResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test205
     * @tc.number SUB_BUILTINS_Object13_TEST_20500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn205_testGetPrototypeOfBigIntToLocaleStringResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test206
     * @tc.number SUB_BUILTINS_Object13_TEST_20600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn206_testGetPrototypeOfObjectCreateNullInherit();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   Object13Test209
     * @tc.number SUB_BUILTINS_Object13_TEST_20900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn209_testGetPrototypeOfClassInstanceCustomMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test210
     * @tc.number SUB_BUILTINS_Object13_TEST_21000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn210_testGetPrototypeOfClassStaticMethodCall();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object13Test211
     * @tc.number SUB_BUILTINS_Object13_TEST_21100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn211_testGetPrototypeOfFloat32ArraySlice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test213
     * @tc.number SUB_BUILTINS_Object13_TEST_21300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn213_testGetPrototypeOfPromiseAnyResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test214
     * @tc.number SUB_BUILTINS_Object13_TEST_21400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn214_testGetPrototypeOfCustomMapInherited();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test215
     * @tc.number SUB_BUILTINS_Object13_TEST_21500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn215_testGetPrototypeOfWeakMapDeleteMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test216
     * @tc.number SUB_BUILTINS_Object13_TEST_21600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn216_testGetPrototypeOfWeakSetHasMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test217
     * @tc.number SUB_BUILTINS_Object13_TEST_21700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn217_testGetPrototypeOfArrayEveryResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test218
     * @tc.number SUB_BUILTINS_Object13_TEST_21800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn218_testGetPrototypeOfArraySomeResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test219
     * @tc.number SUB_BUILTINS_Object13_TEST_21900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn219_testGetPrototypeOfAsyncGeneratorReturnPromiseAgain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test224
     * @tc.number SUB_BUILTINS_Object13_TEST_22400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn224_testGetPrototypeOfBigInt64ArrayFilter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test225
     * @tc.number SUB_BUILTINS_Object13_TEST_22500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn225_testGetPrototypeOfDataViewSetFloat64Method();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test226
     * @tc.number SUB_BUILTINS_Object13_TEST_22600
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn226_testGetPrototypeOfProxyWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test227
     * @tc.number SUB_BUILTINS_Object13_TEST_22700
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn227_testGetPrototypeOfProxyWeakSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test228
     * @tc.number SUB_BUILTINS_Object13_TEST_22800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn228_testGetPrototypeOfCustomIteratorSymbolMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test229
     * @tc.number SUB_BUILTINS_Object13_TEST_22900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn229_testGetPrototypeOfGeneratorReturnResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test230
     * @tc.number SUB_BUILTINS_Object13_TEST_23000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn230_testGetPrototypeOfArrayFindIndexResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test231
     * @tc.number SUB_BUILTINS_Object13_TEST_23100
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn231_testGetPrototypeOfStringSplitEmptySeparator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test232
     * @tc.number SUB_BUILTINS_Object13_TEST_23200
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn232_testGetPrototypeOfStringToUpperCaseResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test233
     * @tc.number SUB_BUILTINS_Object13_TEST_23300
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn233_testGetPrototypeOfNumberToPrecisionResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test234
     * @tc.number SUB_BUILTINS_Object13_TEST_23400
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn234_testGetPrototypeOfBigIntValueOfResult();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test235
     * @tc.number SUB_BUILTINS_Object13_TEST_23500
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn235_testGetTopPrototypeOfThreeLevelInherit();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test238
     * @tc.number SUB_BUILTINS_Object13_TEST_23800
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn238_testGetPrototypeOfInheritedClassMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test239
     * @tc.number SUB_BUILTINS_Object13_TEST_23900
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn239_testGetPrototypeOfClassStaticMethodApply();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object13Test240
     * @tc.number SUB_BUILTINS_Object13_TEST_24000
     * @tc.desc   test object create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object13Test240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn240_testGetPrototypeOfObjectHasOwnPropertyMethod();
      expect(result).assertEqual(true);
    });
  })
}