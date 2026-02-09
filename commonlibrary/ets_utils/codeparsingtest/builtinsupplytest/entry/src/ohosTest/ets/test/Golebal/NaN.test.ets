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

export default function NaNTest() {
  describe('NaNTest', () => {
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
     * @tc.name   NaNTest001
     * @tc.number SUB_BUILTINS_NaN_TEST_0100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = isNaN(NaN);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   NaNTest002
     * @tc.number SUB_BUILTINS_NaN_TEST_0200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = isNaN(Number.NaN);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   NaNTest003
     * @tc.number SUB_BUILTINS_NaN_TEST_0300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest004
     * @tc.number SUB_BUILTINS_NaN_TEST_0400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN("hello world");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest005
     * @tc.number SUB_BUILTINS_NaN_TEST_0500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN + 10;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest006
     * @tc.number SUB_BUILTINS_NaN_TEST_0600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN * 5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest007
     * @tc.number SUB_BUILTINS_NaN_TEST_0700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN > 100;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest008
     * @tc.number SUB_BUILTINS_NaN_TEST_0800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN < -50;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest009
     * @tc.number SUB_BUILTINS_NaN_TEST_0900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [2, 4, NaN, 12];
      const result = arr.indexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   NaNTest010
     * @tc.number SUB_BUILTINS_NaN_TEST_1000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [2, 4, NaN, 12];
      const result = arr.includes(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest011
     * @tc.number SUB_BUILTINS_NaN_TEST_1100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [2, 4, NaN, 12];
      const result = arr.findIndex(n => Number.isNaN(n));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   NaNTest012
     * @tc.number SUB_BUILTINS_NaN_TEST_1200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 0;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   NaNTest013
     * @tc.number SUB_BUILTINS_NaN_TEST_1300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("blabla");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest014
     * @tc.number SUB_BUILTINS_NaN_TEST_1400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number(undefined);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest015
     * @tc.number SUB_BUILTINS_NaN_TEST_1500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.sqrt(-1);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest016
     * @tc.number SUB_BUILTINS_NaN_TEST_1600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 0 * Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest017
     * @tc.number SUB_BUILTINS_NaN_TEST_1700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity / Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest018
     * @tc.number SUB_BUILTINS_NaN_TEST_1800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 7 * NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest019
     * @tc.number SUB_BUILTINS_NaN_TEST_1900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidDate = new Date("blabla");
      const result = invalidDate.getTime();
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest020
     * @tc.number SUB_BUILTINS_NaN_TEST_2000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "";
      const result = str.charCodeAt(1);
      expect(Number.isNaN(result)).assertEqual(true);
    });
    /**
     * @tc.name   NaNTest021
     * @tc.number SUB_BUILTINS_NaN_TEST_2100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 0 * Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest022
     * @tc.number SUB_BUILTINS_NaN_TEST_2200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity / Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest023
     * @tc.number SUB_BUILTINS_NaN_TEST_2300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 7 * NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest024
     * @tc.number SUB_BUILTINS_NaN_TEST_2400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidDate = new Date("blabla");
      const result = invalidDate.getTime();
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest025
     * @tc.number SUB_BUILTINS_NaN_TEST_2500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "";
      const result = str.charCodeAt(1);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest026
     * @tc.number SUB_BUILTINS_NaN_TEST_2600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >= 0;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest027
     * @tc.number SUB_BUILTINS_NaN_TEST_2700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN <= 10;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest028
     * @tc.number SUB_BUILTINS_NaN_TEST_2800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(1n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest029
     * @tc.number SUB_BUILTINS_NaN_TEST_2900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity - Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    //ArkTs会检出永远为false并标红，与Js不同
    /**
     * @tc.name   NaNTest030
     * @tc.number NaNTest030
     * @tc.desc   NaNTest030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN;
      // const result = NaN == NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest031
     * @tc.number SUB_BUILTINS_NaN_TEST_3100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 100 - NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest032
     * @tc.number SUB_BUILTINS_NaN_TEST_3200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(null);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest033
     * @tc.number SUB_BUILTINS_NaN_TEST_3300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN / 2;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest034
     * @tc.number SUB_BUILTINS_NaN_TEST_3400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN, 5, 10, NaN];
      const result = arr.lastIndexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   NaNTest035
     * @tc.number SUB_BUILTINS_NaN_TEST_3500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [3, 6, NaN, 9];
      const result = arr.some(n => Number.isNaN(n));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest036
     * @tc.number SUB_BUILTINS_NaN_TEST_3600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 1;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest037
     * @tc.number SUB_BUILTINS_NaN_TEST_3700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("abc123");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest038
     * @tc.number SUB_BUILTINS_NaN_TEST_3800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.log(-5);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest039
     * @tc.number SUB_BUILTINS_NaN_TEST_3900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 1 ** Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest040
     * @tc.number SUB_BUILTINS_NaN_TEST_4000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN + Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest041
     * @tc.number SUB_BUILTINS_NaN_TEST_4100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidDate = new Date("invalid-date-2024");
      const result = invalidDate.getFullYear();
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest042
     * @tc.number SUB_BUILTINS_NaN_TEST_4200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "a";
      const result = str.charCodeAt(2);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest043
     * @tc.number SUB_BUILTINS_NaN_TEST_4300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN > Infinity;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest044
     * @tc.number SUB_BUILTINS_NaN_TEST_4400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN < -Infinity;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest045
     * @tc.number SUB_BUILTINS_NaN_TEST_4500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(999n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest046
     * @tc.number SUB_BUILTINS_NaN_TEST_4600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity * 0;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest047
     * @tc.number SUB_BUILTINS_NaN_TEST_4700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 10 % NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest048
     * @tc.number SUB_BUILTINS_NaN_TEST_4800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN, 2, 4, NaN, 6];
      const filtered = arr.filter(n => Number.isNaN(n));
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.name   NaNTest049
     * @tc.number SUB_BUILTINS_NaN_TEST_4900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 2;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest050
     * @tc.number SUB_BUILTINS_NaN_TEST_5000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number(new Date("invalid"));
      expect(Number.isNaN(result)).assertEqual(true);
    });
    /**
     * @tc.name   NaNTest051
     * @tc.number SUB_BUILTINS_NaN_TEST_5100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.asin(2);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest052
     * @tc.number SUB_BUILTINS_NaN_TEST_5200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity - NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest053
     * @tc.number SUB_BUILTINS_NaN_TEST_5300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(false);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest054
     * @tc.number SUB_BUILTINS_NaN_TEST_5400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 2 ** NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest055
     * @tc.number SUB_BUILTINS_NaN_TEST_5500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = -NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest056
     * @tc.number SUB_BUILTINS_NaN_TEST_5600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [8, NaN, 16, 24];
      const found = arr.find(n => Number.isNaN(n));
      expect(Number.isNaN(found as number)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest057
     * @tc.number SUB_BUILTINS_NaN_TEST_5700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN, NaN, 10];
      const result = arr.every(n => Number.isNaN(n));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest058
     * @tc.number SUB_BUILTINS_NaN_TEST_5800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** -1;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest059
     * @tc.number SUB_BUILTINS_NaN_TEST_5900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 4;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest060
     * @tc.number SUB_BUILTINS_NaN_TEST_6000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number(() => {});
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest061
     * @tc.number SUB_BUILTINS_NaN_TEST_6100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.acos(2);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest062
     * @tc.number SUB_BUILTINS_NaN_TEST_6200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 0 / 0;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest063
     * @tc.number SUB_BUILTINS_NaN_TEST_6300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN * Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest064
     * @tc.number SUB_BUILTINS_NaN_TEST_6400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidDate = new Date("2024-invalid-month");
      const result = invalidDate.getMonth();
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest065
     * @tc.number SUB_BUILTINS_NaN_TEST_6500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "test";
      const result = str.charCodeAt(-1);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest066
     * @tc.number SUB_BUILTINS_NaN_TEST_6600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >= NaN;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest067
     * @tc.number SUB_BUILTINS_NaN_TEST_6700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN <= 1;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest068
     * @tc.number SUB_BUILTINS_NaN_TEST_6800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(0n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest069
     * @tc.number SUB_BUILTINS_NaN_TEST_6900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity / 0;
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest070
     * @tc.number SUB_BUILTINS_NaN_TEST_7000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(1e309);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest071
     * @tc.number SUB_BUILTINS_NaN_TEST_7100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN & 1;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   NaNTest072
     * @tc.number SUB_BUILTINS_NaN_TEST_7200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN, 5, NaN, 15, NaN];
      const count = arr.reduce((acc, curr) => Number.isNaN(curr) ? acc + 1 : acc, 0);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   NaNTest073
     * @tc.number SUB_BUILTINS_NaN_TEST_7300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 0.5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest074
     * @tc.number SUB_BUILTINS_NaN_TEST_7400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number(new Set([1, 2]));
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest075
     * @tc.number SUB_BUILTINS_NaN_TEST_7500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.tan(Math.PI / 2);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest076
     * @tc.number SUB_BUILTINS_NaN_TEST_7600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = -Infinity + NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest077
     * @tc.number SUB_BUILTINS_NaN_TEST_7700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.NaN === Infinity;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest078
     * @tc.number SUB_BUILTINS_NaN_TEST_7800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN([1, 2, 3]);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest079
     * @tc.number SUB_BUILTINS_NaN_TEST_7900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN << 2;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   NaNTest080
     * @tc.number SUB_BUILTINS_NaN_TEST_8000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >> 1;
      expect(result).assertEqual(0);
    });
    /**
     * @tc.name   NaNTest081
     * @tc.number SUB_BUILTINS_NaN_TEST_8100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, NaN, 3, NaN];
      const flatMapped = arr.flatMap(n => [n]);
      const nanCount = flatMapped.filter(n => Number.isNaN(n)).length;
      expect(nanCount).assertEqual(2);
    });

    /**
     * @tc.name   NaNTest082
     * @tc.number SUB_BUILTINS_NaN_TEST_8200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30, NaN];
      const result = arr.includes(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest083
     * @tc.number SUB_BUILTINS_NaN_TEST_8300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** -2;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest084
     * @tc.number SUB_BUILTINS_NaN_TEST_8400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("Infinityabc");
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest085
     * @tc.number SUB_BUILTINS_NaN_TEST_8500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number(new WeakMap());
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest086
     * @tc.number SUB_BUILTINS_NaN_TEST_8600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.pow(-1, 0.5);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest087
     * @tc.number SUB_BUILTINS_NaN_TEST_8700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (-Infinity) - Infinity;
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest088
     * @tc.number SUB_BUILTINS_NaN_TEST_8800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN / -Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest089
     * @tc.number SUB_BUILTINS_NaN_TEST_8900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidDate = new Date("2024-13-01");
      const result = invalidDate.getDate();
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest090
     * @tc.number SUB_BUILTINS_NaN_TEST_9000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "short string";
      const result = str.charCodeAt(1000);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest091
     * @tc.number SUB_BUILTINS_NaN_TEST_9100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN > -0;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest092
     * @tc.number SUB_BUILTINS_NaN_TEST_9200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN <= Number.MAX_VALUE;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest093
     * @tc.number SUB_BUILTINS_NaN_TEST_9300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(999999n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest094
     * @tc.number SUB_BUILTINS_NaN_TEST_9400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 0 * (-Infinity);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest095
     * @tc.number SUB_BUILTINS_NaN_TEST_9500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj = new Number(NaN);
      const result = Number.isNaN(numObj.valueOf());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest096
     * @tc.number SUB_BUILTINS_NaN_TEST_9600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ^ 5;
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   NaNTest097
     * @tc.number SUB_BUILTINS_NaN_TEST_9700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN, 2, 1, 3].sort((a, b) => (a as number) - (b as number));
      const result = arr.includes(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest098
     * @tc.number SUB_BUILTINS_NaN_TEST_9800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 3;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest099
     * @tc.number SUB_BUILTINS_NaN_TEST_9900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number(Object(undefined));
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest100
     * @tc.number SUB_BUILTINS_NaN_TEST_10000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.log10(-100);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest101
     * @tc.number SUB_BUILTINS_NaN_TEST_10100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.MAX_VALUE + NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest102
     * @tc.number SUB_BUILTINS_NaN_TEST_10200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.NaN === Number.MIN_VALUE;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest103
     * @tc.number SUB_BUILTINS_NaN_TEST_10300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN("NaN");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest104
     * @tc.number SUB_BUILTINS_NaN_TEST_10400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >>> 3;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   NaNTest105
     * @tc.number SUB_BUILTINS_NaN_TEST_10500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN & 0xff;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   NaNTest106
     * @tc.number SUB_BUILTINS_NaN_TEST_10600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [NaN, 4], 5];
      const result = arr.some(item => Array.isArray(item) ? item.includes(NaN) : Number.isNaN(item));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest107
     * @tc.number SUB_BUILTINS_NaN_TEST_10700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 1.5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest108
     * @tc.number SUB_BUILTINS_NaN_TEST_10800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0xabcg", 16);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest109
     * @tc.number SUB_BUILTINS_NaN_TEST_10900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number(new Date().toString() + "invalid");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest110
     * @tc.number SUB_BUILTINS_NaN_TEST_11000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.cbrt(NaN);
      expect(Number.isNaN(result)).assertEqual(true);
    });
    /**
     * @tc.name   NaNTest111
     * @tc.number SUB_BUILTINS_NaN_TEST_11100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity * (-Infinity);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest112
     * @tc.number SUB_BUILTINS_NaN_TEST_11200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN % 5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest113
     * @tc.number SUB_BUILTINS_NaN_TEST_11300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidDate = new Date("2024-02-30T12:00:00");
      const result = invalidDate.getHours();
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest114
     * @tc.number SUB_BUILTINS_NaN_TEST_11400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "";
      const result = str.charCodeAt(0);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest115
     * @tc.number SUB_BUILTINS_NaN_TEST_11500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN < Number.EPSILON;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest116
     * @tc.number SUB_BUILTINS_NaN_TEST_11600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >= -Infinity;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest117
     * @tc.number SUB_BUILTINS_NaN_TEST_11700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(-123n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest118
     * @tc.number SUB_BUILTINS_NaN_TEST_11800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (-Infinity) / Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest119
     * @tc.number SUB_BUILTINS_NaN_TEST_11900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolObj = new Boolean(false);
      const result = Number.isNaN(boolObj.valueOf());
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest120
     * @tc.number SUB_BUILTINS_NaN_TEST_12000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN | 3;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   NaNTest121
     * @tc.number SUB_BUILTINS_NaN_TEST_12100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Obj {
        value:number
      }
      const obj : Obj = { value: NaN };
      const result = Number.isNaN(obj.value);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest122
     * @tc.number SUB_BUILTINS_NaN_TEST_12200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** -0.5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest123
     * @tc.number SUB_BUILTINS_NaN_TEST_12300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.MAX_SAFE_INTEGER + NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest124
     * @tc.number SUB_BUILTINS_NaN_TEST_12400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.expm1(NaN);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest125
     * @tc.number SUB_BUILTINS_NaN_TEST_12500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.MIN_VALUE * NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest126
     * @tc.number SUB_BUILTINS_NaN_TEST_12600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.NaN === -0;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest127
     * @tc.number SUB_BUILTINS_NaN_TEST_12700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN("1,234");
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest128
     * @tc.number SUB_BUILTINS_NaN_TEST_12800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ~NaN;
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   NaNTest129
     * @tc.number SUB_BUILTINS_NaN_TEST_12900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(NaN) ? "is NaN" : "not NaN";
      expect(result).assertEqual("is NaN");
    });

    /**
     * @tc.name   NaNTest130
     * @tc.number SUB_BUILTINS_NaN_TEST_13000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set([1, 2, NaN]);
      const result = set.has(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest131
     * @tc.number SUB_BUILTINS_NaN_TEST_13100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 2.5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest132
     * @tc.number SUB_BUILTINS_NaN_TEST_13200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123.45.67");
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest133
     * @tc.number SUB_BUILTINS_NaN_TEST_13300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number(new WeakSet());
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest134
     * @tc.number SUB_BUILTINS_NaN_TEST_13400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.hypot(NaN, 3);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest135
     * @tc.number SUB_BUILTINS_NaN_TEST_13500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 0 / (-Infinity);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest136
     * @tc.number SUB_BUILTINS_NaN_TEST_13600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN + Number.EPSILON;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest137
     * @tc.number SUB_BUILTINS_NaN_TEST_13700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidDate = new Date("2024-01-01T60:00:00");
      const result = invalidDate.getMinutes();
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest138
     * @tc.number SUB_BUILTINS_NaN_TEST_13800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = "a";
      const result = str.charCodeAt(1);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest139
     * @tc.number SUB_BUILTINS_NaN_TEST_13900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN > 1000;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest140
     * @tc.number SUB_BUILTINS_NaN_TEST_14000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN <= -1000;
      expect(result).assertEqual(false);
    });
    /**
     * @tc.name   NaNTest141
     * @tc.number SUB_BUILTINS_NaN_TEST_14100
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(0n);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest142
     * @tc.number SUB_BUILTINS_NaN_TEST_14200
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity + (-Infinity);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest143
     * @tc.number SUB_BUILTINS_NaN_TEST_14300
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj = new Number(NaN);
      const result = Number.isNaN(numObj);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest144
     * @tc.number SUB_BUILTINS_NaN_TEST_14400
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ^ 0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   NaNTest145
     * @tc.number SUB_BUILTINS_NaN_TEST_14500
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, NaN, 3];
      const sum = arr.reduce((acc, curr) => acc + (curr as number), 0);
      expect(Number.isNaN(sum)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest146
     * @tc.number SUB_BUILTINS_NaN_TEST_14600
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** -3;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest147
     * @tc.number SUB_BUILTINS_NaN_TEST_14700
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.log2(-8);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest148
     * @tc.number SUB_BUILTINS_NaN_TEST_14800
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (-Infinity) * NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   NaNTest149
     * @tc.number SUB_BUILTINS_NaN_TEST_14900
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set([NaN, 10]);
      set.delete(NaN);
      const result = set.has(NaN);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   NaNTest150
     * @tc.number SUB_BUILTINS_NaN_TEST_15000
     * @tc.desc   test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('NaNTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN << 8;
      expect(result).assertEqual(0);
    });

  })
}

