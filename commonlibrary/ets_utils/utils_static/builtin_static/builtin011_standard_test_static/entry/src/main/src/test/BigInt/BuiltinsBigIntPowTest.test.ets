/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BuiltinsBigIntPowTest(): void {
  describe("BuiltinsBigIntPowTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
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
     * @tc.name    builtinsBigIntPowTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_0100
     * @tc.desc    Verify pow with base 0 and exponent 0 (Level0 smoke test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntPowTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const base = new BigInt(0);
      const exponent = new BigInt(0);
      
      const result = base.pow(exponent);
      const expected = new BigInt(1);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_0200
     * @tc.desc    Verify pow with base 2 and exponent 3
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(2);
      const exponent = new BigInt(3);
      
      const result = base.pow(exponent);
      const expected = new BigInt(8);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_0300
     * @tc.desc    Verify pow with base 1 and any exponent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(1);
      const exponent = new BigInt(100);
      
      const result = base.pow(exponent);
      const expected = new BigInt(1);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_0400
     * @tc.desc    Verify pow with any base and exponent 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(100);
      const exponent = new BigInt(0);
      
      const result = base.pow(exponent);
      const expected = new BigInt(1);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_0500
     * @tc.desc    Verify pow with base 10 and exponent 5
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(10);
      const exponent = new BigInt(5);
      
      const result = base.pow(exponent);
      const expected = new BigInt(100000);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_0600
     * @tc.desc    Verify pow with large base and small exponent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt("1000000000000000000000000");
      const exponent = new BigInt(2);
      
      const result = base.pow(exponent);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_0700
     * @tc.desc    Verify pow with base 2 and large exponent (boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntPowTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const base = new BigInt(2);
      const exponent = new BigInt(100);
      
      const result = base.pow(exponent);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_0800
     * @tc.desc    Verify pow with BigInt(9007199254740991n) as base
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(9007199254740991);
      const exponent = new BigInt(2);
      
      const result = base.pow(exponent);
      const expected = new BigInt("81129638414606663681390495662081");

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_0900
     * @tc.desc    Verify pow with BigInt(0xdecafafecacefade) as base
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt("0xdecafafecacefade");
      const exponent = new BigInt(2);
      
      const result = base.pow(exponent);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_1000
     * @tc.desc    Verify pow with max safe integer boundary (complex boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBigIntPowTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const base = new BigInt("9007199254740991");
      const exponent = new BigInt(3);
      
      const result = base.pow(exponent);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_1100
     * @tc.desc    Verify pow with base 0 and positive exponent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(0);
      const exponent = new BigInt(5);
      
      const result = base.pow(exponent);
      const expected = new BigInt(0);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_1200
     * @tc.desc    Verify pow with base 3 and exponent 4 (medium complexity)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(3);
      const exponent = new BigInt(4);

      const result = base.pow(exponent);
      const expected = new BigInt(81);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest1300
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_1300
     * @tc.desc    Verify pow with negative base and odd exponent returns negative result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(-2);
      const exponent = new BigInt(3);

      const result = base.pow(exponent);
      const expected = new BigInt(-8);

      expect(result.negative()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest1400
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_1400
     * @tc.desc    Verify pow with negative base and even exponent returns positive result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(-2);
      const exponent = new BigInt(4);

      const result = base.pow(exponent);
      const expected = new BigInt(16);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest1500
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_1500
     * @tc.desc    Verify pow with negative base and exponent 0 returns 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(-5);
      const exponent = new BigInt(0);

      const result = base.pow(exponent);
      const expected = new BigInt(1);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest1600
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_1600
     * @tc.desc    Verify pow with negative base and exponent 1 returns same negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(-7);
      const exponent = new BigInt(1);

      const result = base.pow(exponent);
      const expected = new BigInt(-7);

      expect(result.negative()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest1700
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_1700
     * @tc.desc    Verify pow with large negative base and small even exponent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(-100);
      const exponent = new BigInt(2);

      const result = base.pow(exponent);
      const expected = new BigInt(10000);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntPowTest1800
     * @tc.number  SUB_BUILTINS_BIGINT_POW_TEST_1800
     * @tc.desc    Verify pow with large negative base and small odd exponent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntPowTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = new BigInt(-10);
      const exponent = new BigInt(3);

      const result = base.pow(exponent);
      const expected = new BigInt(-1000);

      expect(result.negative()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });
  });
}
