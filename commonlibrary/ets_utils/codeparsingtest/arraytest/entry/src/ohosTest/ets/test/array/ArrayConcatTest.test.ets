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
import * as ArrayConcat from './ArrayConcatTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayConcatTest() {
  describe('ArrayConcatTest', () => {
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
     * @tc.name   ArrayConcatTestTest001
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_0100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn01_testConcatTwoArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest002
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_0200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn02_testConcatMultipleParams();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest003
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_0300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn03_testConcatNestedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest004
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_0400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn04_concatEmptyAndNonEmpty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest005
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_0500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn05_concatMultipleEmptyArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest006
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_0600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn06_concatWithNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest007
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_0700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn07_concatWithUndefined();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest008
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_0800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn08_concatWithBooleans();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest009
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_0900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn09_concatWithNumbers();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest010
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn10_concatWithStrings();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest011
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn11_concatWithObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest012
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn12_concatWithArguments();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest013
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn13_concatWithArrayLike();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest014
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn14_concatWithIterable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest015
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn15_concatSparseArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest016
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn16_verifyResultLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest017
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn17_concatWithDateObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest018
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn18_concatWithRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest019
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_1900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn19_concatWithFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest020
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn20_concatThreeLevelNestedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest021
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn21_concatWithNoArguments();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest022
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn22_concatWithSingleNonArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest023
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn23_concatWithMultipleNonArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest024
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn24_concatLargeArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest025
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn25_concatWithSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest026
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn26_concatWithBigInts();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest027
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn27_concatWithUndefinedElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest028
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn28_concatWithNullElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest029
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_2900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn29_verifyObjectReferences();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest030
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn30_verifyPrimitiveValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest031
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn31_concatEmptyArrayAtStart();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest032
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn32_concatFourLevelNestedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest033
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn33_concatNonIterableArrayLike();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest034
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn34_concatWithEmptyString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest035
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn35_concatWithLongString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest036
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn36_concatWithZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest037
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn37_concatWithNaN();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest038
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn38_concatWithInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest039
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_3900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn39_concatWithEmptyArrayElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest040
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn40_concatMultiDimensionalArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest041
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn41_concatWithObjectContainingArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest042
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn42_concatWithCircularReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest043
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn43_concatWithMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest044
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn44_concatWithSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest045
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn45_concatWithWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest046
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn46_concatWithWeakSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest047
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn47_concatWithRegExpObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest048
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn48_concatWithErrorObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest049
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_4900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn49_concatWithJson();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest050
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn50_concatWithDateObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest051
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn51_concatWithArrayBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest052
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn52_concatWithTypedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest053
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn53_concatWithGenerator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest054
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn54_concatWithPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest055
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn55_concatWithAsyncFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest056
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn56_concatWithArrowFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest057
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn57_concatWithClassInstances();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest058
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn58_concatWithNumberObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest059
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_5900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn59_concatWithStringObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest060
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn60_concatWithBooleanObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest061
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn61_concatWithEmptyObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest062
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn62_concatWithArrayPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest063
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn63_concatWithUndefinedAndNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest064
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn64_concatWithMultipleNestedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest065
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn65_concatSparseAndDenseElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest066
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn66_concatWithArraysOfFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest067
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn67_concatWithArraysOfRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest068
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn68_concatWithArraysOfDates();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest069
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_6900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn69_concatWithMixedObjectTypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest070
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn70_concatWithEmptyParameters();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest071
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn71_concatWithSingleEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest072
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn72_concatWithMultipleEmptyArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest073
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn73_concatWithZeroAndNegativeZero();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest074
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn74_concatWithTrueAndFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest075
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn75_concatWithArraysOfBigInt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest076
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn76_concatWithArraysOfSymbols();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest077
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn77_concatWithEmptyAndNonEmptyStrings();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest078
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn78_concatWithVariousNumbers();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest079
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_7900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn79_concatThreeLevelNestedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest080
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn80_concatFourLevelNestedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest081
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn81_concatWithCircularObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest082
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn82_concatWithMapAndSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest083
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn83_concatWithWeakMapAndWeakSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest084
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn84_concatWithErrorObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest085
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn85_concatWithBuiltInObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest086
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn86_concatWithCustomObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest087
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn87_concatWithArrayBufferAndTypedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest088
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn88_concatWithGeneratorAndPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest089
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_8900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn89_concatWithVariousFunctionTypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest090
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn90_concatWithClassInstances();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest091
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn91_concatWithWrapperObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest092
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn92_concatWithEmptyAndNonEmptyObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest093
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn93_concatWithPrototypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest094
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn94_concatVeryLargeArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest095
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn95_concatVerySmallArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest096
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn96_concatWithMixedSpecialValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest097
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn97_concatWithRegExpWithFlags();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest098
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn98_concatWithDifferentDates();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest099
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_9900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn99_concatWithSameObjectReferences();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest100
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn100_concatWithSimilarObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest101
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn101_concatWithDifferentFunctionTypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest102
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn102_concatWithArrowAndRegularFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest103
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn103_concatWithClassesAndConstructors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest104
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn104_concatWithStaticAndInstanceMethods();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest105
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn105_concatWithSymbolProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest106
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn106_concatWithNonEnumerableProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest107
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn107_concatWithMixedEnumerableProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest108
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn108_concatWithGettersAndSetters();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest109
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_10900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn109_concatWithProxyObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest110
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn110_concatWithProxyContainingArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest111
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn111_concatWithDifferentEncodedStrings();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest112
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn112_concatWithSymbolKeyObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest113
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn113_concatWithReadOnlyObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest114
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn114_concatWithObjectsWithManyProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest115
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn115_concatWithFunctionReturnValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest116
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn116_concatWithDynamicallyGeneratedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest117
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn117_concatWithObjectsWithComputedProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest118
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn118_concatWithRegExpResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest119
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_11900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn119_concatWithDateStrings();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest120
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_12000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn120_concatWithArrayBufferViews();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest121
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_12100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn121_concatWithArraysOfTypedArrays();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest123
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_12300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn123_concatWithBigIntOperations();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest124
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_12400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn124_concatWithBoundFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest125
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_12500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn125_concatWithGeneratorResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest126
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_12600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn126_concatWithPromiseStates();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest127
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_12700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn127_concatWithSettledPromises();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest128
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_12800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn128_concatWithClassStaticProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest129
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_12900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn129_concatWithClassInstanceMethods();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest130
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_13000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn130_concatWithTypeConversionResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest131
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_13100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn131_concatWithModuleExports();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest132
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_13200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn132_concatWithConfigObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest133
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_13300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn133_concatWithNestedConfigObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest134
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_13400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn134_concatWithErrorStacks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest135
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_13500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn135_concatWithTimerIds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest136
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_13600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn136_concatWithBufferObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest137
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_13700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn137_concatWithArithmeticResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest138
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_13800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn138_concatWithQueryStringParsed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest140
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn140_concatWithSetOperations();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest141
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn141_concatWithMapOperations();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest142
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn142_concatWithMathResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest143
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn143_concatWithDateCalculations();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest144
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn144_concatWithStringOperations();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest145
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn145_concatWithArrayMethodResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest146
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn146_concatWithObjectMethodResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest147
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn147_concatWithFunctionParameters();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest148
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn148_concatWithFunctionReturnValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest149
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_14900
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn149_concatWithAsyncFunctionResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest150
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_15000
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn150_concatWithGeneratorIteration();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest151
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_15100
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn151_concatWithProxyFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest152
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_15200
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn152_concatWithReflectResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest153
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_15300
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn153_concatWithSymbolMethodResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest154
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_15400
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn154_concatWithTypeCheckResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest155
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_15500
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn155_concatWithErrorHandlingResults();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest156
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_15600
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn156_concatWithBitwiseOperations();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest157
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_15700
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn157_concatWithLogicalOperations();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayConcatTestTest158
     * @tc.number SUB_BUILTINS_ArrayConcat_TEST_15800
     * @tc.desc   test array concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayConcatTestTest158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayConcat.Fn158_concatWithComparisonResults();
      expect(result).assertEqual(true);
    });

  })
}