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
import * as Object32 from './Object32';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object32Test() {
  describe('Object32Test', () => {
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
     * @tc.name   Object32Test001
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0100
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn01_ObjectToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test003
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0300
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn03_NumberToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test004
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0400
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn04_DateEnUsShortDate();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test005
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0500
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn05_DateDeDeShortDate();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test006
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0600
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn06_NumberZhCnUsdCurrency();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test007
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0700
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn07_NumberEnUsEurCurrency();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test008
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_00800
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn08_NumberZhCnPercent();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test009
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_00900
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn09_BigIntZhCnThousandSeparator();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test010
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_01000
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn10_EmptyArrayToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test011
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1100
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn11_SingleElemArrayNumber();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test012
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_01200
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn12_ArrayWithNullUndefined();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test013
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_01300
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn13_DateEnUsShortTime();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test014
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1400
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn14_DateJaJpMediumTime();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test015
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_01500
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn15_NumberMinFractionDigits();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test016
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1600
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn16_NumberMaxFractionDigits();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test017
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_01700
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn17_NumberEnUsThousandSeparator();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test018
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1800
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn18_NumberDeDeDecimalSeparator();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test019
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1900
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn19_BigIntEnUsThousandSeparator();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test020
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_02000
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn20_ArrayMixedTypeJaJp();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test022
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_2200
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn22_NumberZhCnCnyCurrency();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test023
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_2300
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn23_NumberEnGbGbpCurrency();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test024
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_2400
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn24_NumberDeDePercent();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test026
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_2600
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn26_DateEnUsLongDate();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test027
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_2700
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn27_EmptyObjectToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test028
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_2800
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn28_CustomObjOverrideToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test029
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_2900
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn29_ArrayWithNaNInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test032
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_3200
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn32_LargeBigIntZhCnLocalize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test034
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_3400
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn34_NestedArrayToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test035
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_3500
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn35_NumberMinIntegerDigits();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test036
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_3600
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn36_CurrencyMinFractionDigitsZero();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test037
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_3700
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn37_DateNewYorkTimezone();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test038
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_3800
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn38_NumberFrFrThousandSeparator();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test039
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_3900
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn39_BigIntFrFrLocalize();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test040
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_4000
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn40_ArrayWithBoolean();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test041
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_4100
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn41_DateZhCnLongMonth();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test042
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_4200
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn42_DateZhCnShortMonth();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test043
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_4300
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn43_PercentMinFractionDigits();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test046
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_4600
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn46_DateZhCnLongWeekday();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test047
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_4700
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn47_DateZhCnShortWeekday();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test048
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_4800
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn48_ArrayWithEmptyString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test049
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_4900
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn49_NegativeBigIntLocalize();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test050
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_5000
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn50_InfinityEnUsToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test051
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_5100
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn51_NaNDeDeToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test052
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_5200
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn52_InheritedCustomToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test053
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_5300
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn53_ArrayJaJpSeparator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test054
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0540
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn54_DateEnUsHour12Format();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test055
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0550
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn55_NumberZhCnCompactFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test056
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0560
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn56_BigIntEnGbLocalize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test057
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0570
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn57_DateLeapYearFeb29();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test058
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0580
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn58_NumberNegativeInfinityLocalize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test059
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0590
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn59_ArrayWithCustomObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test061
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0610
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn61_NumberEurFrFrCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test062
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0620
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn62_BigIntZeroLocalize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test063
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0630
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn63_DateEnGbDateOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test064
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0640
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn64_NumberSignificantDigits();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test065
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0650
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn65_ArrayWithNestedCustomObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test066
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0660
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn66_DateTimeZoneNameShort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test067
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0670
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn67_NumberJpyJaJpCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test068
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0680
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn68_BigIntNegativeFrFr();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test069
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0690
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn69_DateMonthYearDisplay();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test070
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_00700
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn70_NumberPercentMaxFractionZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test071
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0710
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn71_ArrayWithSymbolBoolean();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test072
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0720
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn72_DateEuropeLondonTimezone();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test073
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0730
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn73_NumberCurrencyNarrowSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test074
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0740
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn74_BigIntLargeValueEnUs();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test075
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0750
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn75_DateWeekdayDateCombination();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test076
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0760
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn76_NumberScientificMinExponent();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test078
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0780
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn78_DateTimeZoneNameLong();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test079
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0790
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn79_NumberCurrencyMinFractionThree();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test080
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0800
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn80_BigIntDeDeLocalize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test081
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0810
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn81_DateEdgeDate0001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test082
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0820
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn82_NumberPercentJaJp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test083
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0830
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn83_ArrayWithNullBooleanMixed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test086
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0860
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn86_BigIntNegativeDeDe();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test088
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0880
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn88_NumberCompactEnUs();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test090
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0900
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn90_DatePacificNewYorkTimezone();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test091
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0910
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn91_NumberNegativePercentZhCn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test092
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0920
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn92_BigIntLargeValueZhCn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test093
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0930
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn93_DateMonthNameEnUs();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test094
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0940
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn94_NumberScientificEnUs();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test095
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0950
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn95_ArrayWithMultipleCustomObjects();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test097
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0970
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn97_NumberCurrencyFrFr();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test098
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0980
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn98_BigIntPositiveJaJp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test099
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_0990
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn99_DateYearOnlyDisplay();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test100
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1000
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn100_CustomDateSubclassToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test101
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1010
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn101_DateEsEsShortDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test102
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1020
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn102_NumberRuRuThousandSeparator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test103
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1030
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn103_ArrayWithRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test104
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1040
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn104_DateArEgLongDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test105
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1050
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn105_NumberPtBrBrlCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test106
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1060
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn106_BigIntEsEsLocalize();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test107
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1070
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn107_DateEnGb24hTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test108
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1080
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn108_Number4SignificantDigits();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test109
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1090
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn109_ArrayWithMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test110
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_01100
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn110_DateZhTwShortDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test111
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1110
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn111_NumberArSaDigits();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test112
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1120
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn112_EmptyMapToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test113
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1130
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn113_DateFrCaDateTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test114
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1140
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn114_NumberEnAuAudCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test115
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1150
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn115_SetToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test116
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1160
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn116_DateDeAtMediumDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test117
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1170
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn117_NumberZhHkHkdCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test118
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1180
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn118_ArrayDateRegExpMixed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test119
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1190
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn119_DateItItLongTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test120
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1200
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn120_NumberNlNlPercent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test121
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1210
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn121_WeakMapToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test123
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1230
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn123_NumberSvSeSekCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test124
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1240
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn124_ArraySetMapMixed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test125
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1250
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn125_DatePlPlLongDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test126
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1260
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn126_NumberTrTrThousandSeparator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test127
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1270
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn127_DateTimeFormatConsistency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test128
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1280
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn128_DateHiInShortDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test129
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1290
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn129_NumberEnCaCadCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test130
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1300
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn130_ArrayWithError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test131
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1310
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn131_DateThThBuddhistEra();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test132
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1320
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn132_NumberCsCzCzkCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test133
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1330
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn133_ArrayLikeToLocaleString();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test135
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1350
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn135_NumberDaDkPercent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test136
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1360
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn136_NestedArrayMixedTypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test137
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1370
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn137_DateArSaIslamicCalendar();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test138
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1380
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn138_NumberHeIlIlsCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test139
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1390
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn139_ProxyToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test140
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_01400
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn140_DateHuHuShortTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test141
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1410
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn141_NumberRoRoThousandSeparator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test142
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1420
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn142_ArrayWithSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test143
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1430
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn143_DateViVnLongDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test144
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1440
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn144_NumberIdIdIdrCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test145
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1450
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn145_ArrayLikeDefaultToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test146
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1460
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn146_DateFaIrPersianCalendar();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test148
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1480
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn148_DateCaEsShortDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test149
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1490
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn149_NumberBgBgFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test150
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1500
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn150_ArrayWithWeakSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test151
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1510
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn151_DateNlNlLongDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test152
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1520
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn152_NumberSkSkEurCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test153
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1530
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn153_TypedArrayToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test156
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1560
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn156_ArrayWithDataView();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test157
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1570
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn157_DateArSaTimeFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test158
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1580
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn158_NumberSlSiPercent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test159
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1590
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn159_SharedArrayBufferToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test161
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1610
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn161_NumberHrHrFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test163
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1630
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn163_DateEsMxLongDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test164
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1640
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn164_NumberLtLtEurCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test165
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1650
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn165_CustomErrorToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test166
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1660
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn166_DateMsMyDateFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test167
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1670
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn167_NumberLvLvFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test169
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1690
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn169_DateFrChDateTime();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test170
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1700
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn170_NumberEtEePercent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test171
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1710
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn171_PromiseToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test173
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1730
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn173_NumberBnBdFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test175
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1750
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn175_DateDeChTimeFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test176
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1760
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn176_NumberKmKhPercent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test179
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1790
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn179_NumberTaInFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test181
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1810
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn181_DateHuHuLongDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test182
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1820
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn182_NumberMlInInrCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test183
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1830
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn183_CustomMapToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test184
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1840
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn184_DateHyAmDateFormat();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object32Test186
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1860
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn186_ArrayWithWeakRef();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test187
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1870
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn187_DateKaGeTimeFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test188
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1880
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn188_NumberNeNpNprCurrency();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test189
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1890
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn189_FinalizationRegistryToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test192
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1920
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn192_ArrayWithArrayBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test193
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1930
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn193_DateTrTrLongDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test195
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1950
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn195_CustomSetToLocaleString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test196
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1960
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn196_DateUrPkDateFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test197
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1970
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn197_NumberMnMnFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test198
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1980
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn198_ArrayWithJson();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test199
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_1990
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn199_DateFaIrTimeFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object32Test200
     * @tc.number SUB_BUILTINS_OBJECT32_TEST_2000
     * @tc.desc   test object toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object32Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object32.Fn200_NumberSiLkLkrCurrency();
      expect(result).assertEqual(true);
    });
  })
}