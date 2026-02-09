/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
  actualResult22,
  actualResult42,
  actualResult81,
  actualResult92,
  expectedResult22,
  expectedResult42,
  expectedResult81,
  expectedResult92,
  Fn01_testToStringDefaultBehavior,
  Fn02_testToStringCustomOverride,
  Fn03_testToStringDetectArrayType,
  Fn04_testToStringWithCustomTag,
  Fn06_testToStringDetectDateType,
  Fn07_testToStringDetectRegExpType,
  Fn08_testToStringDetectFunctionType,
  Fn09_testToStringDetectBooleanObjectType,
  Fn100_testToStringReturnRegExpObject,
  Fn101_testToStringDetectResolvedPromiseType,
  Fn102_testToStringTagWithArrayNullElement,
  Fn103_testToStringReturnErrorObject,
  Fn104_testToStringDetectRejectedPromiseType,
  Fn105_testToStringTagWithNestedArray,
  Fn106_testToStringOverriddenByToJSON,
  Fn107_testToStringDetectZeroLengthArrayBuffer,
  Fn108_testToStringTagWithBigInt,
  Fn109_testToStringReturnTypedArray,
  Fn10_testToStringDetectNumberObjectType,
  Fn111_testToStringTagWithNaN,
  Fn112_testToStringInMultiLevelInheritance,
  Fn114_testToStringTagWithInfinity,
  Fn115_testToStringReturnReadableStream,
  Fn116_testToStringDetectWeakRefWithCollectedTarget,
  Fn117_testToStringTagWithNegativeZero,
  Fn118_testToStringReturnFinalizationRegistry,
  Fn119_testToStringDetectDataViewWithEmptyBuffer,
  Fn11_testToStringDetectStringObjectType,
  Fn120_testToStringTagWithBooleanTrue,
  Fn121_testToStringInStaticProperty,
  Fn122_testToStringDetectEmptySet,
  Fn123_testToStringTagWithNumberZero,
  Fn124_testToStringReturnMapObject,
  Fn125_testToStringDetectEmptyMap,
  Fn126_testToStringTagWithFloatNumber,
  Fn127_testToStringInArrayJoin,
  Fn128_testToStringDetectEmptyWeakMap,
  Fn129_testToStringTagWithStringNull,
  Fn12_testToStringInheritDefault,
  Fn13_testToStringTagWithNull,
  Fn14_testToStringTagWithUndefined,
  Fn15_testToStringTagWithNumber,
  Fn16_testArrayOwnToString,
  Fn17_testDateOwnToString,
  Fn18_testToStringReturnNonString,
  Fn19_testToStringThrowError,
  Fn20_testToStringDetectMapWithApply,
  Fn21_testToStringDetectSetWithApply,
  Fn23_testToStringDetectWeakMapType,
  Fn24_testToStringDetectWeakSetType,
  Fn25_testToStringReturnEmptyString,
  Fn26_testToStringInheritFromParent,
  Fn27_testToStringDetectPromiseType,
  Fn28_testToStringDetectArrayBufferType,
  Fn29_testToStringTagWithFunction,
  Fn30_testToStringReferenceInstanceProp,
  Fn31_testToStringDetectDataViewType,
  Fn32_testToStringDetectInt8ArrayType,
  Fn33_testToStringReturnUndefined,
  Fn34_testToStringTagWithArray,
  Fn35_testToStringDetectUint16ArrayType,
  Fn36_testToStringOverrideParentInChild,
  Fn37_testToStringDetectFloat32ArrayType,
  Fn38_testToStringReturnNull,
  Fn39_testToStringTagWithBoolean,
  Fn40_testToStringDetectBigIntType,
  Fn41_testToStringInStringConcatenation,
  Fn43_testToStringTagWithNestedObject,
  Fn44_testToStringReturnBigInt,
  Fn45_testToStringDetectErrorType,
  Fn46_testToStringInJsonStringify,
  Fn47_testToStringDetectTypeErrorType,
  Fn48_testToStringTagWithEmptyArray,
  Fn49_testToStringReturnFunction,
  Fn52_testToStringInTemplateLiteral,
  Fn53_testToStringTagWithSpacedString,
  Fn55_testToStringReturnNaN,
  Fn57_testToStringTagWithUnicode,
  Fn58_testToStringReturnInfinity,
  Fn59_testToStringDetectReadableStreamType,
  Fn60_testToStringTagWithGetter,
  Fn61_testToStringInStaticMethod,
  Fn62_testToStringDetectWeakRefType,
  Fn63_testToStringTagNonEnumerable,
  Fn64_testToStringReturnEmptyObject,
  Fn65_testToStringDetectFinalizationRegistryType,
  Fn66_testToStringTagReadOnly,
  Fn67_testToStringInArray,
  Fn68_testToStringDetectInt32ArrayType,
  Fn69_testToStringTagWithSpecialChars,
  Fn70_testToStringReturnUndefinedInConcatenation,
  Fn71_testToStringDetectUint32ArrayType,
  Fn72_testToStringTagWithFuncOverrideToString,
  Fn73_testToStringReturnNullInTemplate,
  Fn74_testToStringDetectFloat64ArrayType,
  Fn75_testToStringTagWithArrayElementsOverrideToString,
  Fn76_testToStringReturnBigIntInConcatenation,
  Fn77_testToStringDetectUint8ArrayType,
  Fn78_testToStringTagWithNestedObjOverrideToString,
  Fn79_testToStringReturnNaNInTemplate,
  Fn80_testToStringDetectUint8ClampedArrayType,
  Fn82_testToStringReturnInfinityInConcatenation,
  Fn83_testToStringDetectInt16ArrayType,
  Fn84_testToStringTagGetterThrowError,
  Fn85_testToStringAsMapKey,
  Fn86_testToStringDetectSharedDataViewType,
  Fn87_testToStringTagWithEscapedChars,
  Fn88_testToStringReturnEmptyFunction,
  Fn89_testToStringDetectSetWithComplexElements,
  Fn90_testToStringTagInheritFromPrototype,
  Fn91_testToStringReturnArrowFunction,
  Fn93_testToStringTagWithEmptyString,
  Fn94_testToStringCallSelfInInstanceMethod,
  Fn95_testToStringDetectWeakMapWithDOMKey,
  Fn96_testToStringTagWithSymbolSpecialDesc,
  Fn97_testToStringReturnDateObject,
  Fn98_testToStringDetectWeakSetWithClassInstance,
  Fn99_testToStringTagWithArrayUndefinedElement
} from './Object33';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object33Test() {
  describe('Object33Test', () => {
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
     * @tc.name   Object33Test001
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_0100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn01_testToStringDefaultBehavior();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test002
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_0200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn02_testToStringCustomOverride();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object33Test003
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_0300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn03_testToStringDetectArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test004
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_0400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn04_testToStringWithCustomTag();
      expect(res).assertEqual(true);
    });


    /**
     * @tc.name   Object33Test006
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_0600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn06_testToStringDetectDateType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test007
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_0700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn07_testToStringDetectRegExpType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test008
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_0800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn08_testToStringDetectFunctionType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test009
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_0900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn09_testToStringDetectBooleanObjectType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test010
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_01000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn10_testToStringDetectNumberObjectType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test011
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn11_testToStringDetectStringObjectType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test012
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn12_testToStringInheritDefault();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test013
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn13_testToStringTagWithNull();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test014
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn14_testToStringTagWithUndefined();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test015
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn15_testToStringTagWithNumber();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test016
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn16_testArrayOwnToString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test017
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn17_testDateOwnToString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test018
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn18_testToStringReturnNonString();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test019
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn19_testToStringThrowError();
      } catch (e) {
        expect(e.message).assertContain("Custom toString error");
      }
    });

    /**
     * @tc.name   Object33Test020
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn20_testToStringDetectMapWithApply();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object33Test021
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn21_testToStringDetectSetWithApply();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test022
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(actualResult22 == expectedResult22).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test023
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn23_testToStringDetectWeakMapType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test024
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn24_testToStringDetectWeakSetType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test025
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn25_testToStringReturnEmptyString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test026
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn26_testToStringInheritFromParent();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test027
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn27_testToStringDetectPromiseType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test028
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn28_testToStringDetectArrayBufferType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test029
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_2900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn29_testToStringTagWithFunction();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test030
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn30_testToStringReferenceInstanceProp();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test031
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn31_testToStringDetectDataViewType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test032
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn32_testToStringDetectInt8ArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test033
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn33_testToStringReturnUndefined();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test034
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn34_testToStringTagWithArray();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test035
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn35_testToStringDetectUint16ArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test036
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn36_testToStringOverrideParentInChild();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test037
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn37_testToStringDetectFloat32ArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test038
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn38_testToStringReturnNull();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test039
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_3900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn39_testToStringTagWithBoolean();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test040
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn40_testToStringDetectBigIntType();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object33Test041
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn41_testToStringInStringConcatenation();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test042
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(actualResult42 === expectedResult42).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test043
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn43_testToStringTagWithNestedObject();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test044
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn44_testToStringReturnBigInt();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test045
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn45_testToStringDetectErrorType();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object33Test046
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn46_testToStringInJsonStringify();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test047
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn47_testToStringDetectTypeErrorType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test048
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn48_testToStringTagWithEmptyArray();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test049
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_4900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn49_testToStringReturnFunction();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test052
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_5200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn52_testToStringInTemplateLiteral();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test053
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_5300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn53_testToStringTagWithSpacedString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test055
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_5500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn55_testToStringReturnNaN();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test057
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_5700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn57_testToStringTagWithUnicode();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test058
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_5800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn58_testToStringReturnInfinity();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test059
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_5900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn59_testToStringDetectReadableStreamType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test060
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn60_testToStringTagWithGetter();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test061
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn61_testToStringInStaticMethod();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test062
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn62_testToStringDetectWeakRefType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test063
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn63_testToStringTagNonEnumerable();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test064
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn64_testToStringReturnEmptyObject();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test065
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn65_testToStringDetectFinalizationRegistryType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test066
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn66_testToStringTagReadOnly();
      } catch (e) {
        expect(e.message)
          .assertContain("Cannot assign to read only property");
      }
    });

    /**
     * @tc.name   Object33Test067
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn67_testToStringInArray();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test068
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn68_testToStringDetectInt32ArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test069
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_6900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn69_testToStringTagWithSpecialChars();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test070
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_7000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn70_testToStringReturnUndefinedInConcatenation();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test071
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_7100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn71_testToStringDetectUint32ArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test072
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_7200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn72_testToStringTagWithFuncOverrideToString();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test073
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_72300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn73_testToStringReturnNullInTemplate();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test074
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_7400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn74_testToStringDetectFloat64ArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test075
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_7500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn75_testToStringTagWithArrayElementsOverrideToString();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test076
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_7600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn76_testToStringReturnBigIntInConcatenation();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test077
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_7700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn77_testToStringDetectUint8ArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test078
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_7800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn78_testToStringTagWithNestedObjOverrideToString();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test079
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_7900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn79_testToStringReturnNaNInTemplate();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test080
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn80_testToStringDetectUint8ClampedArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test081
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(actualResult81 === expectedResult81).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test082
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn82_testToStringReturnInfinityInConcatenation();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test083
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn83_testToStringDetectInt16ArrayType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test084
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn84_testToStringTagGetterThrowError();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test085
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn85_testToStringAsMapKey();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test086
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn86_testToStringDetectSharedDataViewType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test087
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn87_testToStringTagWithEscapedChars();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test088
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn88_testToStringReturnEmptyFunction();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test089
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_8900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn89_testToStringDetectSetWithComplexElements();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test090
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn90_testToStringTagInheritFromPrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test091
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn91_testToStringReturnArrowFunction();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test092
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(actualResult92 === expectedResult92).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test093
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn93_testToStringTagWithEmptyString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test094
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn94_testToStringCallSelfInInstanceMethod();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test095
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn95_testToStringDetectWeakMapWithDOMKey();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test096
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn96_testToStringTagWithSymbolSpecialDesc();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test097
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn97_testToStringReturnDateObject();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test098
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn98_testToStringDetectWeakSetWithClassInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test099
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_9900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn99_testToStringTagWithArrayUndefinedElement();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test100
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_1000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn100_testToStringReturnRegExpObject();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test101
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_10100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn101_testToStringDetectResolvedPromiseType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test102
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_10200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn102_testToStringTagWithArrayNullElement();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test103
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_10300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn103_testToStringReturnErrorObject();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test104
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_10400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn104_testToStringDetectRejectedPromiseType();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test105
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_10500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn105_testToStringTagWithNestedArray();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test106
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_10600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn106_testToStringOverriddenByToJSON();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test107
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_10700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn107_testToStringDetectZeroLengthArrayBuffer();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test108
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_10800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn108_testToStringTagWithBigInt();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test109
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_10900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn109_testToStringReturnTypedArray();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test111
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_11100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn111_testToStringTagWithNaN();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test112
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_11200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn112_testToStringInMultiLevelInheritance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test114
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_11400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn114_testToStringTagWithInfinity();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test115
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_11500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn115_testToStringReturnReadableStream();
      } catch (e) {
        expect(e.message).assertEqual("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test116
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_11600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn116_testToStringDetectWeakRefWithCollectedTarget();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test117
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_11700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn117_testToStringTagWithNegativeZero();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test118
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_11800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn118_testToStringReturnFinalizationRegistry();
      } catch (e) {
        expect(e.message).assertEqual("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test119
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_11900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn119_testToStringDetectDataViewWithEmptyBuffer();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test120
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12000
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn120_testToStringTagWithBooleanTrue();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test121
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12100
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn121_testToStringInStaticProperty();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test122
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12200
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn122_testToStringDetectEmptySet();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test123
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12300
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn123_testToStringTagWithNumberZero();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test124
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12400
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn124_testToStringReturnMapObject();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object33Test125
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12500
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn125_testToStringDetectEmptyMap();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test126
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12600
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn126_testToStringTagWithFloatNumber();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object33Test127
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12700
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn127_testToStringInArrayJoin();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test128
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12800
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn128_testToStringDetectEmptyWeakMap();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object33Test129
     * @tc.number SUB_BUILTINS_OBJECT33_TEST_12900
     * @tc.desc   test object toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object33Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn129_testToStringTagWithStringNull();
      expect(res).assertEqual(true);
    });
  })
}