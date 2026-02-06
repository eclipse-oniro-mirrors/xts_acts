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
import * as ArraySort from './ArraySortTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArraySortTest() {
  describe('ArraySortTest', () => {
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
     * @tc.name   ArraySortTest001
     * @tc.number SUB_BUILTINS_ArraySort_TEST_0100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn01_testDefaultStringSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest002
     * @tc.number SUB_BUILTINS_ArraySort_TEST_0200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn02_testNumberAscendingSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest003
     * @tc.number SUB_BUILTINS_ArraySort_TEST_0300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn03_testInPlaceSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest004
     * @tc.number SUB_BUILTINS_ArraySort_TEST_0400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn04_testStringAlphabeticalSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest005
     * @tc.number SUB_BUILTINS_ArraySort_TEST_0500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn05_testNumberDescendingSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest006
     * @tc.number SUB_BUILTINS_ArraySort_TEST_0600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn06_testEmptyArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest007
     * @tc.number SUB_BUILTINS_ArraySort_TEST_0700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn07_testSingleElementSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest008
     * @tc.number SUB_BUILTINS_ArraySort_TEST_0800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn08_testAllSameElementsSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest009
     * @tc.number SUB_BUILTINS_ArraySort_TEST_0900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn09_testNegativeNumbersSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest010
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn10_testZeroInArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest011
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn11_testStringLengthSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest012
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn12_testObjectPropertySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest013
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn13_testMixedStringNumberSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest014
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn14_testCaseSensitiveSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest015
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn15_testCaseInsensitiveSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest016
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn16_testStringReverseSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest017
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn17_testNullInArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest018
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn18_testUndefinedInArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest019
     * @tc.number SUB_BUILTINS_ArraySort_TEST_1900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn19_testMultipleObjectPropertiesSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest020
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn20_testFloatNumbersSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest021
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn21_testLargeIntegersSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest022
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn22_testBooleansInArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest023
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn23_testStringWithNumbersSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest024
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn24_testOriginalArrayReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest025
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn25_testArrowFunctionSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest026
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn26_testSparseArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest027
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn27_testSpecialCharactersSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest028
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn28_testObjectPropertyLengthSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest029
     * @tc.number SUB_BUILTINS_ArraySort_TEST_2900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn29_testNestedArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest030
     * @tc.number SUB_BUILTINS_ArraySort_TEST_3000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn30_testLocaleCompareSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest031
     * @tc.number SUB_BUILTINS_ArraySort_TEST_3100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn31_testNaNInArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest032
     * @tc.number SUB_BUILTINS_ArraySort_TEST_3200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn32_testDateStringSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest033
     * @tc.number SUB_BUILTINS_ArraySort_TEST_3300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn33_testDateObjectSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest034
     * @tc.number SUB_BUILTINS_ArraySort_TEST_3400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn34_testLastCharacterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest035
     * @tc.number SUB_BUILTINS_ArraySort_TEST_3500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn35_testArrayLengthAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest036
     * @tc.number SUB_BUILTINS_ArraySort_TEST_3600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn36_testFunctionExpressionSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest037
     * @tc.number SUB_BUILTINS_ArraySort_TEST_3700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn37_testAbsoluteValueSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest038
     * @tc.number SUB_BUILTINS_ArraySort_TEST_3800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn38_testUnicodeCharactersSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest040
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn40_testObjectPropertyReverseSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest041
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn41_testMixedTypesSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest042
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn42_testVowelCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest043
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn43_test2DArraySecondColumnSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest044
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn44_testMaxValuePosition();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest045
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn45_testMinValuePosition();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest046
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn46_testCompareFunctionReturnZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest047
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn47_testFirstLetterCapitalSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest048
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn48_testRegExpSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest049
     * @tc.number SUB_BUILTINS_ArraySort_TEST_4900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn49_testNestedObjectPropertySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest050
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn50_testBufferSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest051
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn51_testSubstringPresenceSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest052
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn52_testLargeArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest053
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn53_testOccurrenceCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest054
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn54_testCompareFunctionReturnPositive();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest055
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn55_testCompareFunctionReturnNegative();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest056
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn56_testAsciiSumSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest057
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn57_testSetToArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest058
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn58_testObjectCreationTimeSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest059
     * @tc.number SUB_BUILTINS_ArraySort_TEST_5900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn59_testMapValuesSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest060
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn60_testPalindromeSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest061
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn61_testArrayLikeSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest062
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn62_testEvenOddSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest063
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn63_testSymbolSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest064
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn64_testPropertyExistenceSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest065
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn65_testNumericStringSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest066
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn66_testElementTypeSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest067
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn67_testArrayTypePrioritySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest068
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn68_testStringNumbersSumSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest069
     * @tc.number SUB_BUILTINS_ArraySort_TEST_6900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn69_testMiddleElementAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest070
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn70_testObjectStringPropertyLengthSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest071
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn71_testEmptyStringSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest072
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn72_testSquareValueSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest073
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn73_testGeneratorResultSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest074
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn74_testObjectDateStringSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest075
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn75_testStrictlyIncreasingAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest076
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn76_testUpperCaseCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest077
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn77_testArrayOfArraysSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest078
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn78_testObjectMethodReturnSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest079
     * @tc.number SUB_BUILTINS_ArraySort_TEST_7900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn79_testInfinityInArraySort();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   ArraySortTest081
     * @tc.number SUB_BUILTINS_ArraySort_TEST_8100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn81_testEveryAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest082
     * @tc.number SUB_BUILTINS_ArraySort_TEST_8200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn82_testReverseAlphabeticalPropertySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest083
     * @tc.number SUB_BUILTINS_ArraySort_TEST_8300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn83_testSortedCopyEquality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest084
     * @tc.number SUB_BUILTINS_ArraySort_TEST_8400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn84_testFunctionParameterCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest085
     * @tc.number SUB_BUILTINS_ArraySort_TEST_8500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn85_testHexadecimalNumbersSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest086
     * @tc.number SUB_BUILTINS_ArraySort_TEST_8600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn86_testSpecificCharCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest087
     * @tc.number SUB_BUILTINS_ArraySort_TEST_8700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn87_testErrorObjectSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest088
     * @tc.number SUB_BUILTINS_ArraySort_TEST_8800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn88_testPrimeNumberSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest089
     * @tc.number SUB_BUILTINS_ArraySort_TEST_8900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn89_testFirstElementAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest090
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn90_testObjectArrayPropertyLengthSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest091
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn91_testScientificNotationSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest092
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn92_testStringPrefixSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest093
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn93_testWeakMapKeysSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest094
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn94_testNumberDigitCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest095
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn95_testSomeAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest096
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn96_testObjectPropertyCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest097
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn97_testNegativeZeroSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest098
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn98_testLastCharPositionSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest099
     * @tc.number SUB_BUILTINS_ArraySort_TEST_9900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn99_testPromiseArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest100
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn100_testOddFirstSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest101
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn101_testSpreadSortEquality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest102
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn102_testKeysAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest103
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn103_testRegExpSourceSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest104
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn104_testNestedArrayPropertySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest105
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn105_testFindAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest106
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn106_testCaseRatioSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest107
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn107_testMixedDateTimestampSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest108
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn108_testUniqueValueCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest109
     * @tc.number SUB_BUILTINS_ArraySort_TEST_10900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn109_testNoDuplicatesAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest110
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn110_testFunctionReturnTypeSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest111
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn111_testMixedDateStringSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest112
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn112_testCubeValueSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest113
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn113_testFilterAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest114
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn114_testVowelConsonantRatioSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest115
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn115_testMapSetSizeSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest116
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn116_testObjectNumericStringLengthSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest117
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn117_testReduceAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest118
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn118_testAlphanumericMixedSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest119
     * @tc.number SUB_BUILTINS_ArraySort_TEST_11900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn119_testProxyObjectSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest120
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn120_testFactorCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest121
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn121_testLastElementAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest122
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn122_testBooleanPropertySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest123
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn123_testAbsoluteValueDescSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest124
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn124_testFirstLetterPositionSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest125
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn125_testSliceAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest126
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn126_testObjectArrayMaxSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest127
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn127_testInfinityValuesSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest128
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn128_testNumericCharsSumSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest129
     * @tc.number SUB_BUILTINS_ArraySort_TEST_12900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn129_testIndexOfAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest130
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn130_testNestedPropertyLengthSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest131
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn131_testDifferentBaseNumbersSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest132
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn132_testUpperCasePresenceSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest133
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn133_testIncludesAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest134
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn134_testObjectPropertyAverageSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest135
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn135_testEmptyObjectSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest136
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn136_testHighestFrequencyCharSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest137
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn137_testFlatAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest138
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn138_testObjectCreationTimeSymbolSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest139
     * @tc.number SUB_BUILTINS_ArraySort_TEST_13900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn139_testSpecialValuesSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest140
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn140_testSquareRootSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest141
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn141_testConcatAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest142
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn142_testObjectArrayIncludesSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest143
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn143_testMixedRegExpStringSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest144
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn144_testReversedStringSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest145
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn145_testFillAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest146
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn146_testObjectMethodCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest147
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn147_testMixedArrayLikeSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest148
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14800
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn148_testPerfectSquareSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest149
     * @tc.number SUB_BUILTINS_ArraySort_TEST_14900
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn149_testJoinAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest150
     * @tc.number SUB_BUILTINS_ArraySort_TEST_15000
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn150_testObjectDateMonthSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest151
     * @tc.number SUB_BUILTINS_ArraySort_TEST_15100
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn151_testMixedSymbolStringSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest152
     * @tc.number SUB_BUILTINS_ArraySort_TEST_15200
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn152_testUniqueCharCountSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest153
     * @tc.number SUB_BUILTINS_ArraySort_TEST_15300
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn153_testSpliceAfterSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest154
     * @tc.number SUB_BUILTINS_ArraySort_TEST_15400
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn154_testObjectArraySumSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest155
     * @tc.number SUB_BUILTINS_ArraySort_TEST_15500
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn155_testObjectStringIsNumberSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest156
     * @tc.number SUB_BUILTINS_ArraySort_TEST_15600
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn156_testFactorialSort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySortTest157
     * @tc.number SUB_BUILTINS_ArraySort_TEST_15700
     * @tc.desc   test array sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArraySortTest157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArraySort.Fn157_testReverseAfterSort();
      expect(result).assertEqual(true);
    });
  })
}