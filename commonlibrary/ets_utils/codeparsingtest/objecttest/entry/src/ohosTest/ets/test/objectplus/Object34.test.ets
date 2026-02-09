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
  Fn01_testValueOfReturnsSelf,
  Fn02_testCustomValueOfReturnsPrimitive,
  Fn03_testForcedNumberCallsValueOf,
  Fn04_testFallbackToToStringWhenNoValueOf,
  Fn05_testToPrimitivePriorityOverValueOf,
  Fn06_testArrayValueOfReturnsSelf,
  Fn07_testDateValueOfReturnsTimestamp,
  Fn08_testValueOfReturnsObjectFallbackToString,
  Fn09_testBooleanObjectValueOfReturnsPrimitive,
  Fn100_testValueOfReturnInfinityString,
  Fn101_testIntlDisplayNamesValueOfReturnsSelf,
  Fn102_testValueOfReturnSingleElemArray,
  Fn103_testValueOfReturnMultiElemArray,
  Fn104_testIntlDateTimeFormatValueOfStrictEqual,
  Fn105_testValueOfReturnFunctionCompare,
  Fn106_testCustomValueOfForParseInt,
  Fn107_testCustomValueOfForParseFloat,
  Fn109_testValueOfReturnFalseStringForcedBool,
  Fn10_testStringObjectValueOfReturnsPrimitive,
  Fn110_testIntlNumberFormatValueOfNotEqual,
  Fn111_testValueOfReturnSymbolIterator,
  Fn112_testLocalStorageValueOfReturnsSelf,
  Fn113_testCustomValueOfForNegativeSubtraction,
  Fn114_testIntlCollatorValueOfStrictEqual,
  Fn115_testValueOfReturnSpacedString,
  Fn116_testCustomValueOfForIfCondition,
  Fn117_testNavigatorValueOfReturnsSelf,
  Fn118_testValueOfReturnNegativeBigInt,
  Fn119_testCustomValueOfForDecimalMultiplication,
  Fn11_testNumberObjectValueOfReturnsPrimitive,
  Fn121_testValueOfReturnNaNString,
  Fn122_testIntlPluralRulesValueOfNotEqual,
  Fn123_testCustomValueOfForIsNaN,
  Fn124_testCanvasContextValueOfReturnsSelf,
  Fn125_testValueOfReturnNaNArray,
  Fn126_testCustomValueOfForStringNumberConcat,
  Fn127_testIntlDisplayNamesValueOfStrictEqual,
  Fn128_testValueOfReturnFunctionTypeof,
  Fn12_testCallValueOfWithPrimitive,
  Fn130_testCustomValueOfForGreaterOrEqual,
  Fn131_testValueOfReturnSciNotationString,
  Fn13_testValueOfReturnsNullForcedConvert,
  Fn14_testValueOfReturnsUndefinedForcedConvert,
  Fn15_testMapValueOfReturnsSelf,
  Fn16_testSetValueOfReturnsSelf,
  Fn17_testFunctionValueOfReturnsSelf,
  Fn18_testCustomValueOfForAddition,
  Fn19_testObjectCompareWithoutValueOf,
  Fn20_testCustomValueOfForComparison,
  Fn22_testValueOfThrowErrorPropagation,
  Fn23_testInheritedObjValueOfFromProto,
  Fn24_testValueOfReturnBigInt,
  Fn25_testDateCompareWithNumber,
  Fn26_testEmptyObjValueOfStrictEqual,
  Fn27_testValueOfReturnEmptyString,
  Fn28_testRegExpValueOfReturnsSelf,
  Fn29_testCustomValueOfForSubtraction,
  Fn30_testNullCallValueOf,
  Fn31_testUndefinedCallValueOf,
  Fn32_testValueOfReturnNaN,
  Fn33_testValueOfReturnInfinity,
  Fn34_testClassStaticValueOf,
  Fn35_testNestedObjValueOf,
  Fn36_testCustomValueOfForMultiplication,
  Fn37_testUint8ArrayValueOfReturnsSelf,
  Fn38_testFloat64ArrayValueOfReturnsSelf,
  Fn39_testJsonStringifyNotTriggerValueOf,
  Fn40_testCustomValueOfForDivision,
  Fn41_testModifyProtoValueOf,
  Fn42_testInstanceValueOfOverrideProto,
  Fn43_testValueOfReturnBoolean,
  Fn44_testArrayBufferValueOfReturnsSelf,
  Fn45_testCustomValueOfForModulo,
  Fn46_testProxyValueOfTriggerGet,
  Fn47_testValueOfReturnTrueString,
  Fn48_testValueOfReturnEmptyObjForcedBool,
  Fn49_testBigIntObjectValueOfReturnsPrimitive,
  Fn50_testCustomValueOfForBitwiseAnd,
  Fn51_testCustomValueOfForBitwiseOr,
  Fn52_testDateCompareWithDate,
  Fn53_testValueOfReturnSymbolForcedNumber,
  Fn54_testDataViewValueOfReturnsSelf,
  Fn55_testCustomValueOfForIncrement,
  Fn56_testCustomValueOfForDecrement,
  Fn57_testBrokenProtoObjValueOf,
  Fn58_testValueOfReturnFunctionFallbackToString,
  Fn60_testCustomValueOfForExponentiation,
  Fn61_testValueOfReturnNaNCompare,
  Fn63_testCustomValueOfForStringConcat,
  Fn64_testValueOfReturnUndefinedCompare,
  Fn65_testValueOfReturnNullCompare,
  Fn67_testCustomValueOfForTernary,
  Fn68_testValueOfReturnArrayFallbackToString,
  Fn69_testIntlDateTimeFormatValueOfReturnsSelf,
  Fn70_testCustomValueOfForLogicalAnd,
  Fn71_testCustomValueOfForLogicalOr,
  Fn72_testValueOfReturnRegExpForcedNumber,
  Fn74_testCustomValueOfForNumberFunction,
  Fn75_testCustomValueOfForStringFunction,
  Fn76_testValueOfReturnMapFallbackToString,
  Fn77_testIntlNumberFormatValueOfReturnsSelf,
  Fn78_testCustomValueOfForLeftShift,
  Fn79_testCustomValueOfForRightShift,
  Fn81_testValueOfReturnBigIntBeyondSafeInt,
  Fn82_testCustomValueOfForBooleanFunction,
  Fn83_testIntlCollatorValueOfReturnsSelf,
  Fn84_testValueOfReturnSetFallbackToString,
  Fn85_testCustomValueOfForUnsignedRightShift,
  Fn87_testValueOfReturnEmptyStringCompare,
  Fn88_testValueOfReturnUndefinedForcedBool,
  Fn89_testIntlPluralRulesValueOfReturnsSelf,
  Fn90_testCustomValueOfForBitwiseXor,
  Fn91_testValueOfReturnNullForcedBool,
  Fn93_testCustomValueOfForCommaOperator,
  Fn94_testIntlRelativeTimeFormatValueOfReturnsSelf,
  Fn95_testValueOfReturnZeroString,
  Fn96_testValueOfReturnMixedString,
  Fn97_testIntlLocaleValueOfReturnsSelf,
  Fn98_testCustomValueOfForUnaryPlus,
  Fn99_testCustomValueOfForUnaryMinus,
  primitiveSym21,
  valueOfResult21
} from './Object34';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object34Test() {
  describe('Object34Test', () => {
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
     * @tc.name   Object34Test001
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_0100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn01_testValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test002
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_0200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn02_testCustomValueOfReturnsPrimitive();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object34Test003
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_0300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn03_testForcedNumberCallsValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test004
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_0400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn04_testFallbackToToStringWhenNoValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test005
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_0500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn05_testToPrimitivePriorityOverValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test006
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_0600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn06_testArrayValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test007
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_0700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn07_testDateValueOfReturnsTimestamp();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test008
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_0800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn08_testValueOfReturnsObjectFallbackToString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test009
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_0900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn09_testBooleanObjectValueOfReturnsPrimitive();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test010
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_01000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn10_testStringObjectValueOfReturnsPrimitive();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test011
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn11_testNumberObjectValueOfReturnsPrimitive();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test012
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn12_testCallValueOfWithPrimitive();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test013
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn13_testValueOfReturnsNullForcedConvert();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test014
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn14_testValueOfReturnsUndefinedForcedConvert();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test015
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn15_testMapValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test016
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn16_testSetValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test017
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn17_testFunctionValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test018
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn18_testCustomValueOfForAddition();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test019
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn19_testObjectCompareWithoutValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test020
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn20_testCustomValueOfForComparison();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object34Test021
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(valueOfResult21 === primitiveSym21).assertEqual(true);
      expect(typeof valueOfResult21 === "symbol").assertEqual(true);
    });

    /**
     * @tc.name   Object34Test022
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn22_testValueOfThrowErrorPropagation();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test023
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn23_testInheritedObjValueOfFromProto();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test024
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn24_testValueOfReturnBigInt();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a BigInt value to a number");
      }
    });

    /**
     * @tc.name   Object34Test025
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn25_testDateCompareWithNumber();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test026
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn26_testEmptyObjValueOfStrictEqual();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test027
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn27_testValueOfReturnEmptyString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test028
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn28_testRegExpValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test029
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_2900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn29_testCustomValueOfForSubtraction();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test030
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn30_testNullCallValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test031
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn31_testUndefinedCallValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test032
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn32_testValueOfReturnNaN();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test033
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn33_testValueOfReturnInfinity();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test034
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn34_testClassStaticValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test035
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn35_testNestedObjValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test036
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn36_testCustomValueOfForMultiplication();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test037
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn37_testUint8ArrayValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test038
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn38_testFloat64ArrayValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test039
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_3900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn39_testJsonStringifyNotTriggerValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test040
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn40_testCustomValueOfForDivision();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object34Test041
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn41_testModifyProtoValueOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test042
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn42_testInstanceValueOfOverrideProto();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test043
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn43_testValueOfReturnBoolean();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test044
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn44_testArrayBufferValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test045
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn45_testCustomValueOfForModulo();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object34Test046
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn46_testProxyValueOfTriggerGet();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test047
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn47_testValueOfReturnTrueString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test048
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn48_testValueOfReturnEmptyObjForcedBool();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test049
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_4900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn49_testBigIntObjectValueOfReturnsPrimitive();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test050
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_5000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn50_testCustomValueOfForBitwiseAnd();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test051
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_5100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn51_testCustomValueOfForBitwiseOr();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test052
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_5200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn52_testDateCompareWithDate();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test053
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_5300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn53_testValueOfReturnSymbolForcedNumber();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test054
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_5400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn54_testDataViewValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test055
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_5500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn55_testCustomValueOfForIncrement();
      } catch (e) {
        expect(e.message).assertContain("Assignment to const");
      }
    });

    /**
     * @tc.name   Object34Test056
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_5600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn56_testCustomValueOfForDecrement();
      } catch (e) {
        expect(e.message).assertContain("Assignment to const");
      }
    });

    /**
     * @tc.name   Object34Test057
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_5700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn57_testBrokenProtoObjValueOf();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a illegal value to a Primitive");
      }
    });

    /**
     * @tc.name   Object34Test058
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_5800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn58_testValueOfReturnFunctionFallbackToString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test060
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_6000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn60_testCustomValueOfForExponentiation();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test061
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_6100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn61_testValueOfReturnNaNCompare();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test063
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_6300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn63_testCustomValueOfForStringConcat();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test064
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_6400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn64_testValueOfReturnUndefinedCompare();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test065
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_6500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn65_testValueOfReturnNullCompare();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test067
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_6700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn67_testCustomValueOfForTernary();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test068
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_6800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn68_testValueOfReturnArrayFallbackToString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test069
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_6900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn69_testIntlDateTimeFormatValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test070
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_7000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn70_testCustomValueOfForLogicalAnd();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object34Test071
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_7100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn71_testCustomValueOfForLogicalOr();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object34Test072
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_7200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn72_testValueOfReturnRegExpForcedNumber();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test074
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_7400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn74_testCustomValueOfForNumberFunction();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test075
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_7500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn75_testCustomValueOfForStringFunction();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object34Test076
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_7600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn76_testValueOfReturnMapFallbackToString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test077
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_7700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn77_testIntlNumberFormatValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test078
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_7800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn78_testCustomValueOfForLeftShift();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test079
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_7900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn79_testCustomValueOfForRightShift();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test081
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_8100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn81_testValueOfReturnBigIntBeyondSafeInt();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a BigInt value to a number");
      }
    });

    /**
     * @tc.name   Object34Test082
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_8200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn82_testCustomValueOfForBooleanFunction();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object34Test083
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_8300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn83_testIntlCollatorValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test084
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_8400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn84_testValueOfReturnSetFallbackToString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test085
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_8500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn85_testCustomValueOfForUnsignedRightShift();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test087
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_8700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn87_testValueOfReturnEmptyStringCompare();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test088
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_8800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn88_testValueOfReturnUndefinedForcedBool();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test089
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_8900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn89_testIntlPluralRulesValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test090
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_9000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn90_testCustomValueOfForBitwiseXor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test091
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_9100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn91_testValueOfReturnNullForcedBool();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test093
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_9300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn93_testCustomValueOfForCommaOperator();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test094
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_9400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn94_testIntlRelativeTimeFormatValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test095
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_9500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn95_testValueOfReturnZeroString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test096
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_9600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn96_testValueOfReturnMixedString();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object34Test097
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_9700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn97_testIntlLocaleValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test098
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_9800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn98_testCustomValueOfForUnaryPlus();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test099
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_9900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn99_testCustomValueOfForUnaryMinus();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test100
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_1000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn100_testValueOfReturnInfinityString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test101
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_10100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn101_testIntlDisplayNamesValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test102
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_10200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn102_testValueOfReturnSingleElemArray();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object34Test103
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_10300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn103_testValueOfReturnMultiElemArray();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test104
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_10400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn104_testIntlDateTimeFormatValueOfStrictEqual();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test105
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_10500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn105_testValueOfReturnFunctionCompare();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test106
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_10600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn106_testCustomValueOfForParseInt();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object34Test107
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_10700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn107_testCustomValueOfForParseFloat();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object34Test109
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_10900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn109_testValueOfReturnFalseStringForcedBool();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test110
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn110_testIntlNumberFormatValueOfNotEqual();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test111
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn111_testValueOfReturnSymbolIterator();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test112
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn112_testLocalStorageValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test113
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn113_testCustomValueOfForNegativeSubtraction();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test114
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn114_testIntlCollatorValueOfStrictEqual();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test115
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn115_testValueOfReturnSpacedString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test116
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn116_testCustomValueOfForIfCondition();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object34Test117
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn117_testNavigatorValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test118
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn118_testValueOfReturnNegativeBigInt();
      } catch (e) {
        expect(e.message).assertContain("Cannot convert a BigInt value to a number");
      }
    });

    /**
     * @tc.name   Object34Test119
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_11900
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn119_testCustomValueOfForDecimalMultiplication();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test121
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_12100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn121_testValueOfReturnNaNString();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test122
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_12200
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn122_testIntlPluralRulesValueOfNotEqual();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test123
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_12300
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn123_testCustomValueOfForIsNaN();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test124
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_12400
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn124_testCanvasContextValueOfReturnsSelf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test125
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_12500
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn125_testValueOfReturnNaNArray();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test126
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_12600
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn126_testCustomValueOfForStringNumberConcat();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test127
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_12700
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn127_testIntlDisplayNamesValueOfStrictEqual();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test128
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_12800
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn128_testValueOfReturnFunctionTypeof();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test130
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_13000
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn130_testCustomValueOfForGreaterOrEqual();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object34Test131
     * @tc.number SUB_BUILTINS_OBJECT34_TEST_13100
     * @tc.desc   test object valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object34Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn131_testValueOfReturnSciNotationString();
      expect(res).assertEqual(true);
    });
  })
}