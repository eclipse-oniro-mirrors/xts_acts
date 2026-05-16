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

export default function BuiltinsBigIntOperatorBitwiseAndTest(): void {
  describe("BuiltinsBigIntOperatorBitwiseAndTest", () => {
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
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_0100
     * @tc.desc    Verify operatorBitwiseAnd with BigInt(0xdecafafecacefade) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorBitwiseAnd(bigInt2);

      expect(result.positive()).assertTrue();
      expect(result.equals(new BigInt(68))).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_0200
     * @tc.desc    Verify operatorBitwiseAnd with BigInt(9007199254740991n) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(9007199254740991);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorBitwiseAnd(bigInt2);

      expect(result.positive()).assertTrue();
      expect(result.equals(new BigInt(100))).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_0300
     * @tc.desc    Verify operatorBitwiseAnd with simple positive integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntOperatorBitwiseAndTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1 = new BigInt(60);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorBitwiseAnd(bigInt2);
      const expected = new BigInt(20);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_0400
     * @tc.desc    Verify operatorBitwiseAnd with different bit patterns
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(9);
      const bigInt2 = new BigInt(6);
      
      const result = bigInt1.operatorBitwiseAnd(bigInt2);
      const expected = new BigInt(0);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_0500
     * @tc.desc    Verify operatorBitwiseAnd with negative integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-1);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorBitwiseAnd(bigInt2);

      expect(result.positive()).assertTrue();
      expect(result.equals(new BigInt(100))).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_0600
     * @tc.desc    Verify operatorBitwiseAnd with zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      const zero = new BigInt(0);
      
      const result = bigInt.operatorBitwiseAnd(zero);
      const expected = new BigInt(0);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_0700
     * @tc.desc    Verify operatorBitwiseAnd with BigInt(0xdecafafecacefade) and itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      
      const result = bigInt.operatorBitwiseAnd(bigInt);

      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_0800
     * @tc.desc    Verify operatorBitwiseAnd with BigInt(9007199254740991n) and itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(9007199254740991);
      
      const result = bigInt.operatorBitwiseAnd(bigInt);

      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_0900
     * @tc.desc    Verify operatorBitwiseAnd with all ones
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(-1);
      
      const result = bigInt1.operatorBitwiseAnd(bigInt2);

      expect(result.equals(bigInt1)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_1000
     * @tc.desc    Verify operatorBitwiseAnd with mixed sign integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(100);
      const bigInt2 = new BigInt(-1);
      
      const result = bigInt1.operatorBitwiseAnd(bigInt2);

      expect(result.positive()).assertTrue();
      expect(result.equals(new BigInt(100))).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_1100
     * @tc.desc    Verify operatorBitwiseAnd with small values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(0);
      const bigInt2 = new BigInt(1);
      
      const result = bigInt1.operatorBitwiseAnd(bigInt2);
      const expected = new BigInt(0);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseAndTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_AND_TEST_1200
     * @tc.desc    Verify operatorBitwiseAnd with large positive BigInt values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseAndTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("1000000000000000000000000");
      const bigInt2 = new BigInt("1000000000000000000000000");
      
      const result = bigInt1.operatorBitwiseAnd(bigInt2);

      expect(result.equals(bigInt1)).assertTrue();
    });
  });
}
