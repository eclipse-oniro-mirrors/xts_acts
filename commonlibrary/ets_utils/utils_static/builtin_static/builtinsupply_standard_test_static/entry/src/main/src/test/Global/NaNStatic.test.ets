/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

interface Obj {
  value:number
}

export default function NaNTest() {
  describe('NaNTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll( async() => {
      await sleep(50);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_0100
     * @tc.name NaNTest001
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = isNaN(NaN);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_0200
     * @tc.name NaNTest002
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = isNaN(Number.NaN);
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_0300
     * @tc.name NaNTest003
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_0500
     * @tc.name NaNTest005
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN + 10;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_0600
     * @tc.name NaNTest006
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN * 5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_0700
     * @tc.name NaNTest007
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN > 100;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_0800
     * @tc.name NaNTest008
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN < -50;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_0900
     * @tc.name NaNTest009
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [2, 4, NaN, 12];
      const result = arr.indexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_1000
     * @tc.name NaNTest010
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [2, 4, NaN, 12];
      const result = arr.includes(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_1100
     * @tc.name NaNTest011
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr : number[] = [2, 4, NaN, 12];
      const result = arr.findIndex(n => Number.isNaN(n));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_1200
     * @tc.name NaNTest012
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN ** 0;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_1300
     * @tc.name NaNTest013
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("blabla");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_1500
     * @tc.name NaNTest015
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.sqrt(-1);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_1600
     * @tc.name NaNTest016
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 0 * Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_1700
     * @tc.name NaNTest017
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = Infinity / Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_1800
     * @tc.name NaNTest018
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 7 * NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_2100
     * @tc.name NaNTest021
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 0 * Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_2200
     * @tc.name NaNTest022
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = Infinity / Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_2300
     * @tc.name NaNTest023
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 7 * NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_2600
     * @tc.name NaNTest026
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >= 0;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_2700
     * @tc.name NaNTest027
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN <= 10;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_2900
     * @tc.name NaNTest029
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity - Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_3000
     * @tc.name NaNTest030
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_3100
     * @tc.name NaNTest031
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 100 - NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_3300
     * @tc.name NaNTest033
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN / 2.0;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_3400
     * @tc.name NaNTest034
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN, 5, 10, NaN];
      const result = arr.lastIndexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_3500
     * @tc.name NaNTest035
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [3, 6, NaN, 9];
      const result = arr.some(n => Number.isNaN(n));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_3600
     * @tc.name NaNTest036
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN ** 1;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_3700
     * @tc.name NaNTest037
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("abc123");
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_3800
     * @tc.name NaNTest038
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.log(-5);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_3900
     * @tc.name NaNTest039
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 1 ** Infinity;
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_4000
     * @tc.name NaNTest040
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN + Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_4100
     * @tc.name NaNTest041
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidDate = new Date("invalid-date-2024");
      const result = invalidDate.getFullYear();
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_4300
     * @tc.name NaNTest043
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN > Infinity;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_4400
     * @tc.name NaNTest044
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN < -Infinity;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_4600
     * @tc.name NaNTest046
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = Infinity * 0;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_4700
     * @tc.name NaNTest047
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = 10 % NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_4800
     * @tc.name NaNTest048
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr :number[] = [NaN, 2, 4, NaN, 6];
      const filtered = arr.filter(n => Number.isNaN(n));
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_4900
     * @tc.name NaNTest049
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN ** 2;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_5100
     * @tc.name NaNTest051
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.asin(2);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_5200
     * @tc.name NaNTest052
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity - NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_5400
     * @tc.name NaNTest054
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 2 ** NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_5500
     * @tc.name NaNTest055
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = -NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_5600
     * @tc.name NaNTest056
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr : number[] = [8, NaN, 16, 24];
      const found = arr.find(n => Number.isNaN(n));
      expect(Number.isNaN(found as number)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_5700
     * @tc.name NaNTest057
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr : number[] = [NaN, NaN, 10];
      const result = arr.every(n => Number.isNaN(n));
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_5800
     * @tc.name NaNTest058
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** -1;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_5900
     * @tc.name NaNTest059
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN ** 4;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_6100
     * @tc.name NaNTest061
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.acos(2);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_6200
     * @tc.name NaNTest062
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 0.0 / 0;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_6300
     * @tc.name NaNTest063
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN * Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_6600
     * @tc.name NaNTest066
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >= NaN;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_6700
     * @tc.name NaNTest067
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN <= 1;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_6900
     * @tc.name NaNTest069
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = Infinity / 0.0;
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_7100
     * @tc.name NaNTest071
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN & 1;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_7200
     * @tc.name NaNTest072
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr :number [] = [NaN, 5, NaN, 15, NaN];
      const count = arr.reduce((acc: number, curr) => Number.isNaN(curr) ? acc + 1 : acc, 0);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_7300
     * @tc.name NaNTest073
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 0.5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_7500
     * @tc.name NaNTest075
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.tan(Math.PI / 2.0);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_7600
     * @tc.name NaNTest076
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = -Infinity + NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_7700
     * @tc.name NaNTest077
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.NaN === Infinity;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_7900
     * @tc.name NaNTest079
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN << 2;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_8000
     * @tc.name NaNTest080
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >> 1;
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_8100
     * @tc.name NaNTest081
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr : number[] = [1, NaN, 3, NaN];
      const flatMapped = arr.flatMap(n => [n]);
      const nanCount = flatMapped.filter((n:Any) => Number.isNaN(n as Number)).length;
      expect(nanCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_8200
     * @tc.name NaNTest082
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30, NaN];
      const result = arr.includes(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_8300
     * @tc.name NaNTest083
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** -2;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_8400
     * @tc.name NaNTest084
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("Infinityabc");
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_8600
     * @tc.name NaNTest086
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.pow(-1, 0.5);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_8700
     * @tc.name NaNTest087
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (-Infinity) - Infinity;
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_8800
     * @tc.name NaNTest088
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN / -Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_9100
     * @tc.name NaNTest091
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN > -0;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_9200
     * @tc.name NaNTest092
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN <= Number.MAX_VALUE;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_9400
     * @tc.name NaNTest094
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 0 * (-Infinity);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_9500
     * @tc.name NaNTest095
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj = new Number(NaN);
      const result = Number.isNaN(numObj.valueOf());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_9600
     * @tc.name NaNTest096
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ^ 5;
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_9700
     * @tc.name NaNTest097
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [NaN, 2.0, 1.0, 3.0].sort((a:number, b:number) => a - b>0?1:-1);
      const result = arr.includes(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_9800
     * @tc.name NaNTest098
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = NaN ** 3;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_10000
     * @tc.name NaNTest100
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.log10(-100);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_10100
     * @tc.name NaNTest101
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.MAX_VALUE + NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_10200
     * @tc.name NaNTest102
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.NaN === Number.MIN_VALUE;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_10400
     * @tc.name NaNTest104
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >>> 3;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_10500
     * @tc.name NaNTest105
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN & 0xff;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_10600
     * @tc.name NaNTest106
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr : (number|number[])[]= [[1, 2], [NaN, 4], 5];
      const result = arr.some((item) => Array.isArray(item) ? (item as Array<number>).includes(NaN) : Number.isNaN(item as number));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_10700
     * @tc.name NaNTest107
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 1.5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_10800
     * @tc.name NaNTest108
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0xabcg", 16);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_11000
     * @tc.name NaNTest110
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.cbrt(NaN);
      expect(Number.isNaN(result)).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_11100
     * @tc.name NaNTest111
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity * (-Infinity);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_11200
     * @tc.name NaNTest112
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN % 5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_11300
     * @tc.name NaNTest113
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const invalidDate = new Date("2024-02-30T12:00:00");
      const result = invalidDate.getHours();
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_11500
     * @tc.name NaNTest115
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN < Number.EPSILON;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_11600
     * @tc.name NaNTest116
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN >= -Infinity;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_11800
     * @tc.name NaNTest118
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = (-Infinity) / Infinity;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_12000
     * @tc.name NaNTest120
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN | 3;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_12100
     * @tc.name NaNTest121
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj : Obj = { value: NaN };
      const result = Number.isNaN(obj.value);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_12200
     * @tc.name NaNTest122
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** -0.5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_12300
     * @tc.name NaNTest123
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.MAX_SAFE_INTEGER + NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_12400
     * @tc.name NaNTest124
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.expm1(NaN);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_12500
     * @tc.name NaNTest125
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.MIN_VALUE * NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_12600
     * @tc.name NaNTest126
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.NaN === -0;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_12800
     * @tc.name NaNTest128
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ~NaN;
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_12900
     * @tc.name NaNTest129
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Number.isNaN(NaN) ? "is NaN" : "not NaN";
      expect(result).assertEqual("is NaN");
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_13000
     * @tc.name NaNTest130
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set<number>([1, 2, NaN]);
      const result = set.has(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_13100
     * @tc.name NaNTest131
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** 2.5;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_13200
     * @tc.name NaNTest132
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseFloat("123.45.67");
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_13400
     * @tc.name NaNTest134
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.hypot(NaN, 3);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_13500
     * @tc.name NaNTest135
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: number = 0.0 / (-Infinity);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_13600
     * @tc.name NaNTest136
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN + Number.EPSILON;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_13900
     * @tc.name NaNTest139
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN > 1000;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_14000
     * @tc.name NaNTest140
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN <= -1000;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_14200
     * @tc.name NaNTest142
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Infinity + (-Infinity);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_14300
     * @tc.name NaNTest143
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj = new Number(NaN);
      const result = Number.isNaN(numObj);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_14400
     * @tc.name NaNTest144
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ^ 0;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_14500
     * @tc.name NaNTest145
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1.0, 2.0, NaN, 3.0];
      const sum = arr.reduce((acc, curr) => acc + curr, 0.);
      expect(Number.isNaN(sum)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_14600
     * @tc.name NaNTest146
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN ** -3;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_14700
     * @tc.name NaNTest147
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Math.log2(-8);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_14800
     * @tc.name NaNTest148
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = (-Infinity) * NaN;
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_14900
     * @tc.name NaNTest149
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set<number>([NaN, 10]);
      set.delete(NaN);
      const result = set.has(NaN);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_NaN_TEST_15000
     * @tc.name NaNTest150
     * @tc.desc test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NaNTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = NaN << 8;
      expect(result).assertEqual(0);
    });

  })
}

