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

export default function ParseIntTest() {
  describe('ParseIntTest', () => {
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
     * @tc.name   parseIntTest001
     * @tc.number SUB_BUILTINS_ParseInt_TEST_0100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0xF", 16);
      expect(result).assertEqual(15);
    });
    /**
     * @tc.name   parseIntTest002
     * @tc.number SUB_BUILTINS_ParseInt_TEST_0200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("F", 16);
      expect(result).assertEqual(15);
    });
    /**
     * @tc.name   parseIntTest003
     * @tc.number SUB_BUILTINS_ParseInt_TEST_0300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("17", 8);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest004
     * @tc.number SUB_BUILTINS_ParseInt_TEST_0400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("015", 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest005
     * @tc.number SUB_BUILTINS_ParseInt_TEST_0500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("15,123", 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest006
     * @tc.number SUB_BUILTINS_ParseInt_TEST_0600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("FXX123", 16);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest007
     * @tc.number SUB_BUILTINS_ParseInt_TEST_0700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1111", 2);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest008
     * @tc.number SUB_BUILTINS_ParseInt_TEST_0800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("15 * 3", 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest009
     * @tc.number SUB_BUILTINS_ParseInt_TEST_0900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("15e2", 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest010
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("15px", 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest011
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("12", 13);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest012
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("Hello", 8);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest013
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("546", 2);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest014
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-F", 16);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.name   parseIntTest015
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-0F", 16);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.name   parseIntTest016
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-0XF", 16);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.name   parseIntTest017
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-17", 8);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.name   parseIntTest018
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-15", 10);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.name   parseIntTest019
     * @tc.number SUB_BUILTINS_ParseInt_TEST_1900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-1111", 2);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.name   parseIntTest020
     * @tc.number SUB_BUILTINS_ParseInt_TEST_2000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-15e1", 10);
      expect(result).assertEqual(-15);
    });
    /**
     * @tc.name   parseIntTest021
     * @tc.number SUB_BUILTINS_ParseInt_TEST_2100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-12", 13);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.name   parseIntTest022
     * @tc.number SUB_BUILTINS_ParseInt_TEST_2200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0e0", 16);
      expect(result).assertEqual(224);
    });

    /**
     * @tc.name   parseIntTest023
     * @tc.number SUB_BUILTINS_ParseInt_TEST_2300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("900719925474099267n");
      expect(result).assertEqual(900719925474099300);
    });

    /**
     * @tc.name   parseIntTest024
     * @tc.number SUB_BUILTINS_ParseInt_TEST_2400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("123_456", 10);
      expect(result).assertEqual(123);
    });

    //todo 参数只能为string
    /**
     * @tc.name   parseIntTest025
     * @tc.number parseIntTest025
     * @tc.desc   parseIntTest025
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("  25", 10);
      expect(result).assertEqual(25);
    });

    /**
     * @tc.name   parseIntTest026
     * @tc.number SUB_BUILTINS_ParseInt_TEST_2600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("  0x1A", 16);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.name   parseIntTest027
     * @tc.number SUB_BUILTINS_ParseInt_TEST_2700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1010", 2);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   parseIntTest028
     * @tc.number SUB_BUILTINS_ParseInt_TEST_2800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("32", 8);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.name   parseIntTest029
     * @tc.number SUB_BUILTINS_ParseInt_TEST_2900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("25.99", 10);
      expect(result).assertEqual(25);
    });

    /**
     * @tc.name   parseIntTest030
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0XfA", 16);
      expect(result).assertEqual(250);
    });

    /**
     * @tc.name   parseIntTest031
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("123", 1);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest032
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("123", 37);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest033
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0x10", 0);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name   parseIntTest034
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("20", 0);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   parseIntTest035
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("+0x15", 16);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.name   parseIntTest036
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-0x15", 16);
      expect(result).assertEqual(-21);
    });

    /**
     * @tc.name   parseIntTest037
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("z", 36);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.name   parseIntTest038
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1z", 36);
      expect(result).assertEqual(71);
    });

    /**
     * @tc.name   parseIntTest039
     * @tc.number SUB_BUILTINS_ParseInt_TEST_3900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1e3", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   parseIntTest040
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1012", 2);
      expect(result).assertEqual(5);
    });
    /**
     * @tc.name   parseIntTest041
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("78", 8);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   parseIntTest042
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("g12", 16);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest043
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("", 10);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest044
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("   ", 10);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest045
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("123px", 10);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.name   parseIntTest046
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-456em", 10);
      expect(result).assertEqual(-456);
    });

    /**
     * @tc.name   parseIntTest047
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("10", 36);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.name   parseIntTest048
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("35", 36);
      expect(result).assertEqual(113);
    });

    /**
     * @tc.name   parseIntTest049
     * @tc.number SUB_BUILTINS_ParseInt_TEST_4900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("\t67", 10);
      expect(result).assertEqual(67);
    });

    /**
     * @tc.name   parseIntTest050
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("\n0x2B", 16);
      expect(result).assertEqual(43);
    });

    /**
     * @tc.name   parseIntTest051
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("+1101", 2);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.name   parseIntTest052
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-45", 8);
      expect(result).assertEqual(-37);
    });

    /**
     * @tc.name   parseIntTest053
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0x3c", 16);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   parseIntTest054
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0X3c", 16);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   parseIntTest055
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("123", NaN);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   parseIntTest056
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("123", Infinity);
      expect(Number.isNaN(result)).assertEqual(false);
    });

    /**
     * @tc.name   parseIntTest057
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0b10", 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   parseIntTest058
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0o10", 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   parseIntTest059
     * @tc.number SUB_BUILTINS_ParseInt_TEST_5900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("a", 36);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   parseIntTest060
     * @tc.number SUB_BUILTINS_ParseInt_TEST_6000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("A", 36);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   parseIntTest061
     * @tc.number SUB_BUILTINS_ParseInt_TEST_6100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("89#abc", 10);
      expect(result).assertEqual(89);
    });

    /**
     * @tc.name   parseIntTest062
     * @tc.number SUB_BUILTINS_ParseInt_TEST_6200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1001xyz", 2);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   parseIntTest063
     * @tc.number SUB_BUILTINS_ParseInt_TEST_6300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("67.8", 8);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.name   parseIntTest064
     * @tc.number SUB_BUILTINS_ParseInt_TEST_6400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1a.3", 16);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.name   parseIntTest065
     * @tc.number SUB_BUILTINS_ParseInt_TEST_6500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1704067200000", 10);
      expect(result).assertEqual(1704067200000);
    });

    /**
     * @tc.name   parseIntTest067
     * @tc.number SUB_BUILTINS_ParseInt_TEST_6700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1_2z", 36);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   parseIntTest068
     * @tc.number SUB_BUILTINS_ParseInt_TEST_6800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("\r49", 10);
      expect(result).assertEqual(49);
    });

    /**
     * @tc.name   parseIntTest069
     * @tc.number SUB_BUILTINS_ParseInt_TEST_6900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("\v0x1F", 16);
      expect(result).assertEqual(31);
    });

    /**
     * @tc.name   parseIntTest070
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("123一二三", 10);
      expect(result).assertEqual(123);
    });
    /**
     * @tc.name   parseIntTest071
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1a中文", 16);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.name   parseIntTest072
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("zz", 36);
      expect(result).assertEqual(1295);
    });

    /**
     * @tc.name   parseIntTest073
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1zz", 36);
      expect(result).assertEqual(2591);
    });

    /**
     * @tc.name   parseIntTest074
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-1011", 2);
      expect(result).assertEqual(-11);
    });

    /**
     * @tc.name   parseIntTest075
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("+72", 8);
      expect(result).assertEqual(58);
    });

    /**
     * @tc.name   parseIntTest076
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0x10", 2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   parseIntTest077
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("a1", 8);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest078
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1a", 36);
      expect(result).assertEqual(46);
    });

    /**
     * @tc.name   parseIntTest079
     * @tc.number SUB_BUILTINS_ParseInt_TEST_7900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("78(9)", 16);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.name   parseIntTest080
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("63@xyz", 10);
      expect(result).assertEqual(63);
    });

    /**
     * @tc.name   parseIntTest081
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("2D ", 16);
      expect(result).assertEqual(45);
    });

    /**
     * @tc.name   parseIntTest082
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("z9", 36);
      expect(result).assertEqual(1269);
    });

    /**
     * @tc.name   parseIntTest083
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1,234", 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   parseIntTest084
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("3a.7", 16);
      expect(result).assertEqual(58);
    });

    /**
     * @tc.name   parseIntTest085
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("101x0", 2);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   parseIntTest086
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("100", 36);
      expect(result).assertEqual(1296);
    });

    /**
     * @tc.name   parseIntTest087
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("\u200B88", 10);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest088
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("　0x45", 16);
      expect(result).assertEqual(69);
    });

    /**
     * @tc.name   parseIntTest089
     * @tc.number SUB_BUILTINS_ParseInt_TEST_8900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("+1100abc", 2);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   parseIntTest090
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-64xyz", 8);
      expect(result).assertEqual(-52);
    });

    /**
     * @tc.name   parseIntTest091
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("012", 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   parseIntTest092
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0x5g", 16);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   parseIntTest093
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-2e5", 10);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.name   parseIntTest094
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("+0X7A", 16);
      expect(result).assertEqual(122);
    });

    /**
     * @tc.name   parseIntTest095
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("2b", 36);
      expect(result).assertEqual(83);
    });

    /**
     * @tc.name   parseIntTest096
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("zzzz", 36);
      expect(result).assertEqual(1679615);
    });

    /**
     * @tc.name   parseIntTest097
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0000", 2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   parseIntTest098
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("000", 8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   parseIntTest099
     * @tc.number SUB_BUILTINS_ParseInt_TEST_9900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0x0", 16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   parseIntTest100
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-99~12", 10);
      expect(result).assertEqual(-99);
    });
    /**
     * @tc.name   parseIntTest101
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("  6F  ", 16);
      expect(result).assertEqual(111);
    });

    /**
     * @tc.name   parseIntTest102
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("z0", 36);
      expect(result).assertEqual(1260);
    });

    /**
     * @tc.name   parseIntTest103
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1z0", 36);
      expect(result).assertEqual(2556);
    });

    /**
     * @tc.name   parseIntTest104
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("123个", 10);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.name   parseIntTest105
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("ab中文", 16);
      expect(result).assertEqual(171);
    });

    /**
     * @tc.name   parseIntTest106
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0001101", 2);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.name   parseIntTest107
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("00072", 8);
      expect(result).assertEqual(58);
    });

    /**
     * @tc.name   parseIntTest108
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("000x3F", 16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   parseIntTest109
     * @tc.number SUB_BUILTINS_ParseInt_TEST_10900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("35", 36);
      expect(result).assertEqual(113);
    });

    /**
     * @tc.name   parseIntTest110
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt(" \t102", 10);
      expect(result).assertEqual(102);
    });

    /**
     * @tc.name   parseIntTest111
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("\n\r0x64", 16);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   parseIntTest112
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-001101", 2);
      expect(result).assertEqual(-13);
    });

    /**
     * @tc.name   parseIntTest113
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("+0065", 8);
      expect(result).assertEqual(53);
    });

    /**
     * @tc.name   parseIntTest114
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0x8h", 16);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name   parseIntTest115
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("12x3", 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   parseIntTest116
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("+45#78", 10);
      expect(result).assertEqual(45);
    });

    /**
     * @tc.name   parseIntTest117
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("-0X9C", 16);
      expect(result).assertEqual(-156);
    });

    /**
     * @tc.name   parseIntTest118
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("3a", 36);
      expect(result).assertEqual(118);
    });

    /**
     * @tc.name   parseIntTest119
     * @tc.number SUB_BUILTINS_ParseInt_TEST_11900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("3A", 36);
      expect(result).assertEqual(118);
    });

    /**
     * @tc.name   parseIntTest120
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1111", 2);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   parseIntTest121
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("777", 8);
      expect(result).assertEqual(511);
    });

    /**
     * @tc.name   parseIntTest122
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("fff", 16);
      expect(result).assertEqual(4095);
    });

    /**
     * @tc.name   parseIntTest123
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("67/89", 10);
      expect(result).assertEqual(67);
    });

    /**
     * @tc.name   parseIntTest124
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("(a3)", 16);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest125
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("z9", 36);
      expect(result).assertEqual(1269);
    });

    /**
     * @tc.name   parseIntTest126
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1z9", 36);
      expect(result).assertEqual(2565);
    });

    /**
     * @tc.name   parseIntTest127
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("98kg", 10);
      expect(result).assertEqual(98);
    });

    /**
     * @tc.name   parseIntTest128
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("dE$", 16);
      expect(result).assertEqual(222);
    });

    /**
     * @tc.name   parseIntTest129
     * @tc.number SUB_BUILTINS_ParseInt_TEST_12900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("101000", 2);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.name   parseIntTest130
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("52000", 8);
      expect(result).assertEqual(21504);
    });
    /**
     * @tc.name   parseIntTest131
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("3A000", 16);
      expect(result).assertEqual(237568);
    });

    /**
     * @tc.name   parseIntTest132
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("zzz", 36);
      expect(result).assertEqual(46655);
    });

    /**
     * @tc.name   parseIntTest133
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1zzz", 36);
      expect(result).assertEqual(93311);
    });

    /**
     * @tc.name   parseIntTest134
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("\u2009115", 10);
      expect(result).assertEqual(115);
    });

    /**
     * @tc.name   parseIntTest135
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("\u30000x7B", 16);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.name   parseIntTest136
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("+ 1001", 2);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest137
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("- 63", 8);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest138
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0Xa3", 0);
      expect(result).assertEqual(163);
    });

    /**
     * @tc.name   parseIntTest139
     * @tc.number SUB_BUILTINS_ParseInt_TEST_13900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("0b11", 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   parseIntTest140
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("78?90", 10);
      expect(result).assertEqual(78);
    });

    /**
     * @tc.name   parseIntTest141
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14100
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("c@d", 16);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   parseIntTest142
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14200
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("99~11", 10);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.name   parseIntTest143
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14300
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("00e2h", 16);
      expect(result).assertEqual(226);
    });

    /**
     * @tc.name   parseIntTest144
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14400
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("#f2", 16);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest145
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14500
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("z1", 36);
      expect(result).assertEqual(1261);
    });

    /**
     * @tc.name   parseIntTest146
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14600
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("1z1", 36);
      expect(result).assertEqual(2557);
    });

    /**
     * @tc.name   parseIntTest147
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14700
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("$123", 10);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest148
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14800
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("€ab", 16);
      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   parseIntTest149
     * @tc.number SUB_BUILTINS_ParseInt_TEST_14900
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("10(1)", 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   parseIntTest150
     * @tc.number SUB_BUILTINS_ParseInt_TEST_15000
     * @tc.desc   test parseInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('parseIntTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = parseInt("45(6)", 8);
      expect(result).assertEqual(37);
    });
  })
}

