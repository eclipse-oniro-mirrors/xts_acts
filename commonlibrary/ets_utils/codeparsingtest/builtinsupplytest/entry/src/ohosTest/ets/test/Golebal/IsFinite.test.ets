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
export default function IsFiniteTest() {
  describe('IsFiniteTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   isFiniteTest001
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_0100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = Infinity;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   isFiniteTest002
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_0200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = -Infinity;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   isFiniteTest003
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_0300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = NaN;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest004
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_0400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = 0;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest005
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_0500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = -123;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest006
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_0600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = 3.14159;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest007
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_0700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = -0.5;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest008
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_0800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = 0;
      // const testVal = "0";
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest009
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_0900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // const testVal = "123";
      const testVal = 123;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest010
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // const testVal = "3.14";
      const testVal = 3.14;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest011
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // const testVal = "Infinity";
      const testVal = Infinity;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest012
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = NaN;
      // const testVal = "NaN";
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest013
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = 9007199254740991;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest014
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = 1.23e5;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest015
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = -4.56e-3;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest016
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = 1e309;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest017
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = 123;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest018
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = 1;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest019
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_1900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = -99;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest020
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = 10.001;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   isFiniteTest021
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal = -7.99;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest022
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 100;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest023
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -200;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest024
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -0;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest025
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0.1;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest026
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -0.9;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest027
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 123.456;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest028
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -789.012;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest029
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_2900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 9007199254740989;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest030
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 9007199254740992;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest031
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -9007199254740991;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest032
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1e2;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest033
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -3e4;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest034
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 5.6e-2;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest035
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -8.9e-5;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest036
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest037
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.797e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest038
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 2e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest039
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_3900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -2e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest040
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = NaN;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest041
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Infinity;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest042
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -Infinity;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest043
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 10 + 20;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest044
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 50 - 100;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest045
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 3 * 4.5;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest046
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 10 / 2;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest047
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0 / 0;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest048
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1 / 0;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest049
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_4900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1 / 0;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest050
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MAX_SAFE_INTEGER;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   isFiniteTest051
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MIN_SAFE_INTEGER;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest052
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 999;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest053
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1000;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest054
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.01;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest055
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -2.99;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest056
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0.00001;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest057
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -0.00009;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest058
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1234.5678;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest059
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_5900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -9876.5432;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest060
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 9007199254740992 + 100;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest061
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -9007199254740992 - 50;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest062
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 2.3e6;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest063
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -4.5e8;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest064
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 6.7e-8;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest065
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -8.9e-10;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest066
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.7e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest067
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1.7e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest068
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.8e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest069
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_6900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1.8e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest070
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 20 * 30.5;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest071
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 100 / 3;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest072
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 5 - 10.2;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest073
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = (1 + 2) * (4 / 2);
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest074
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0.1 + 0.2;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest075
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1e20 * 1e20;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest076
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1e20 * 1e20;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest077
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MAX_VALUE;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest078
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.MIN_VALUE;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest079
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_7900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.POSITIVE_INFINITY;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest080
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Number.NEGATIVE_INFINITY;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   isFiniteTest081
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = Math.sqrt(-1); // 负数开方得NaN
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest082
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 10000;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest083
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -5000;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest084
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 3.141;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest085
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -2.718;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest086
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 0.00000001;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest087
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -0.00000009;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest088
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 987654.321;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest089
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_8900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -123456.789;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest090
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 9007199254740992 + 500;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest091
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9100
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -9007199254740992 - 1000;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest092
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9200
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 5.6e9;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest093
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9300
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -7.8e11;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest094
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9400
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 9.1e-12;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest095
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9500
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -2.3e-15;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest096
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9600
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.79e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest097
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9700
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1.79e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   isFiniteTest098
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9800
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 1.798e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest099
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_9900
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = -1.798e308;
      const result = isFinite(testVal);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   isFiniteTest100
     * @tc.number SUB_BUILTINS_ISFINITE_TEST_10000
     * @tc.desc   test isFinite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFiniteTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testVal: number = 150 / 2.5;
      const result = isFinite(testVal);
      expect(result).assertEqual(true);
    });
  })
}

