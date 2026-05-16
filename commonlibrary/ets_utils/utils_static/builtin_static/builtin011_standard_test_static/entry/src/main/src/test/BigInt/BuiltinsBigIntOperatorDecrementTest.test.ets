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

export default function BuiltinsBigIntOperatorDecrementTest(): void {
  describe("BuiltinsBigIntOperatorDecrementTest", () => {
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
     * @tc.name    builtinsBigIntOperatorDecrementTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_0100
     * @tc.desc    Verify operatorDecrement with simple positive integer (Level0 smoke test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntOperatorDecrementTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt = new BigInt(1);
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt(0);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_0200
     * @tc.desc    Verify operatorDecrement with simple positive integer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorDecrementTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(10);
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt(9);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_0300
     * @tc.desc    Verify operatorDecrement with negative integer
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorDecrementTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(-10);
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt(-11);

      expect(result.negative()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_0400
     * @tc.desc    Verify operatorDecrement with zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorDecrementTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(0);
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt(-1);

      expect(result.negative()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_0500
     * @tc.desc    Verify operatorDecrement with one
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorDecrementTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(1);
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt(0);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_0600
     * @tc.desc    Verify operatorDecrement with large value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorDecrementTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("1000000000000000000000000");
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt("999999999999999999999999");

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_0700
     * @tc.desc    Verify operatorDecrement with BigInt(9007199254740991n) (max safe integer)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorDecrementTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt = new BigInt(9007199254740991);
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt(9007199254740990);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_0800
     * @tc.desc    Verify operatorDecrement with BigInt(0xdecafafecacefade)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorDecrementTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      
      const result = bigInt.operatorDecrement();

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_0900
     * @tc.desc    Verify operatorDecrement with very large negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorDecrementTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt = new BigInt("-1000000000000000000000000");
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt("-1000000000000000000000001");

      expect(result.negative()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_1000
     * @tc.desc    Verify operatorDecrement with max safe integer boundary (complex boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBigIntOperatorDecrementTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const bigInt = new BigInt("9007199254740991");
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt("9007199254740990");

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_1100
     * @tc.desc    Verify operatorDecrement with negative one (small boundary)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorDecrementTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(-1);
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt(-2);

      expect(result.negative()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorDecrementTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_DECREMENT_TEST_1200
     * @tc.desc    Verify operatorDecrement with large hex value (complex boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorDecrementTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt = new BigInt("0x10000000000000000");
      
      const result = bigInt.operatorDecrement();
      const expected = new BigInt("0xffffffffffffffff");

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });
  });
}
