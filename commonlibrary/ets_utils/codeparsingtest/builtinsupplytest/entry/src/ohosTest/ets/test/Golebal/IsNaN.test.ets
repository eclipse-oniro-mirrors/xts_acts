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

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function IsNaNTest() {
  describe('IsNaNTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
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
     * @tc.name   isNaNTest001
     * @tc.number SUB_BUILTINS_ISNAN_TEST_0100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = NaN;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   isNaNTest002
     * @tc.number SUB_BUILTINS_ISNAN_TEST_0200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = NaN;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   isNaNTest003
     * @tc.number SUB_BUILTINS_ISNAN_TEST_0300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 10;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest004
     * @tc.number SUB_BUILTINS_ISNAN_TEST_0400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -20;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest005
     * @tc.number SUB_BUILTINS_ISNAN_TEST_0500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 3.14;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest006
     * @tc.number SUB_BUILTINS_ISNAN_TEST_0600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1.5;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest007
     * @tc.number SUB_BUILTINS_ISNAN_TEST_0700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest008
     * @tc.number SUB_BUILTINS_ISNAN_TEST_0800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -0;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest009
     * @tc.number SUB_BUILTINS_ISNAN_TEST_0900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 9007199254740991;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest010
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 9007199254740992;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest011
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0 / 0;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest012
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Infinity / Infinity;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest013
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Infinity - Infinity;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest014
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = NaN * 10;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest015
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.2e3;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest016
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.2e3;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest017
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1e308;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest018
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 2e308;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest019
     * @tc.number SUB_BUILTINS_ISNAN_TEST_1900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.sqrt(-1);
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest020
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.log(-10);
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   isNaNTest021
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.asin(2);
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest022
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 10 + 20;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest023
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 100 - 50.5;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest024
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 5 * 6.2;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest025
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 20 / 4;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest026
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0.1 + 0.2;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest027
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MAX_VALUE;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest028
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MIN_VALUE;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest029
     * @tc.number SUB_BUILTINS_ISNAN_TEST_2900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.POSITIVE_INFINITY;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest030
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.NEGATIVE_INFINITY;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest031
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = NaN + 0;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest032
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 100;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest033
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -150;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest034
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0.01;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest035
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -0.99;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest036
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 123.4567;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest037
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -789.0123;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest038
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 10 / 3;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest039
     * @tc.number SUB_BUILTINS_ISNAN_TEST_3900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = (5 + 3) * 2;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest040
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 100 - 200.5;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest041
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Infinity * 0;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest042
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -Infinity * 0;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest043
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = NaN / 5;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest044
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 3.14e5;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest045
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -6.78e-4;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest046
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.79e308;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest047
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1.79e308;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest048
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      const testVal: number = Math.pow(-2, 0.5);
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest049
     * @tc.number SUB_BUILTINS_ISNAN_TEST_4900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.exp(1000);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest050
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.log(0);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   isNaNTest051
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.sin(Infinity);
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest052
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.cos(Infinity);
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest053
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.tan(90 * Math.PI / 180);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest054
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -9007199254740993;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest055
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0.1 + 0.3;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest056
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1e20 * 1e20;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest057
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1e20 * 1e20;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest058
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.EPSILON;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest059
     * @tc.number SUB_BUILTINS_ISNAN_TEST_5900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MAX_VALUE / 2;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest060
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MIN_VALUE * 2;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest061
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = NaN - NaN;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest062
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 500;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest063
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -750;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest064
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.234;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest065
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -5.678;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest066
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 25 * 4.8;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest067
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1000 / 12.5;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest068
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = (15 - 5) / 2;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest069
     * @tc.number SUB_BUILTINS_ISNAN_TEST_6900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Infinity + 100;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest070
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -Infinity - 50;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest071
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = NaN * 0;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest072
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 7.89e7;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest073
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -2.34e-6;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest074
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.797e308;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest075
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1.797e308;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest076
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.sqrt(25);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest077
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.cbrt(-8);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest078
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.log10(0.01);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest079
     * @tc.number SUB_BUILTINS_ISNAN_TEST_7900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.log10(-1);
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest080
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.sin(30 * Math.PI / 180);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   isNaNTest081
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.atan(Infinity);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest082
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.atan2(-1, 0);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest083
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.hypot(3, 4);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest084
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.hypot(NaN, 4);
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest085
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 9007199254740999;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest086
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0.2 + 0.4;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest087
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1e300 * 1e5;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest088
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1e300 * 1e10;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest089
     * @tc.number SUB_BUILTINS_ISNAN_TEST_8900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MAX_VALUE + 1;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest090
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MIN_VALUE - 1;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest091
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9100
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1234;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest092
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9200
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -5678;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest093
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9300
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 3.14 * 10;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest094
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9400
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 100 - 33.33;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest095
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9500
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const testVal: number = Infinity / 10;
        const result = isNaN(testVal);
        expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest096
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9600
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -Infinity / 2;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest097
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9700
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = NaN + 100;
      const result = isNaN(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isNaNTest098
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9800
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 5.12e9;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest099
     * @tc.number SUB_BUILTINS_ISNAN_TEST_9900
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -8.76e-8;
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isNaNTest100
     * @tc.number SUB_BUILTINS_ISNAN_TEST_10000
     * @tc.desc   test isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isNaNTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.sqrt(10000);
      const result = isNaN(testVal);
      expect(result).assertEqual(false);
    });

  })
}

