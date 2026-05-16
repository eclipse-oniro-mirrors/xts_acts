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

export default function BuiltinsBigIntOperatorBitwiseXorTest(): void {
  describe("BuiltinsBigIntOperatorBitwiseXorTest", () => {
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
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_0100
     * @tc.desc    Verify operatorBitwiseXor with BigInt(0xdecafafecacefade) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorBitwiseXor(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_0200
     * @tc.desc    Verify operatorBitwiseXor with BigInt(9007199254740991n) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(9007199254740991);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorBitwiseXor(bigInt2);

      expect(result.positive()).assertTrue();
      expect(result.equals(new BigInt(9007199254740891))).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_0300
     * @tc.desc    Verify operatorBitwiseXor with simple positive integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntOperatorBitwiseXorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1 = new BigInt(60);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorBitwiseXor(bigInt2);
      const expected = new BigInt(40);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_0400
     * @tc.desc    Verify operatorBitwiseXor with different bit patterns
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(9);
      const bigInt2 = new BigInt(6);
      
      const result = bigInt1.operatorBitwiseXor(bigInt2);
      const expected = new BigInt(15);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_0500
     * @tc.desc    Verify operatorBitwiseXor with negative integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-1);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorBitwiseXor(bigInt2);

      expect(result.negative()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_0600
     * @tc.desc    Verify operatorBitwiseXor with zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      const zero = new BigInt(0);
      
      const result = bigInt.operatorBitwiseXor(zero);

      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_0700
     * @tc.desc    Verify operatorBitwiseXor with BigInt(0xdecafafecacefade) and itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      
      const result = bigInt.operatorBitwiseXor(bigInt);
      const expected = new BigInt(0);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_0800
     * @tc.desc    Verify operatorBitwiseXor with BigInt(9007199254740991n) and itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(9007199254740991);
      
      const result = bigInt.operatorBitwiseXor(bigInt);
      const expected = new BigInt(0);

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_0900
     * @tc.desc    Verify operatorBitwiseXor with all ones
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(-1);
      
      const result = bigInt1.operatorBitwiseXor(bigInt2);

      expect(result.negative()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_1000
     * @tc.desc    Verify operatorBitwiseXor with mixed sign integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(100);
      const bigInt2 = new BigInt(-1);
      
      const result = bigInt1.operatorBitwiseXor(bigInt2);

      expect(result.negative()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_1100
     * @tc.desc    Verify operatorBitwiseXor with small values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(0);
      const bigInt2 = new BigInt(1);
      
      const result = bigInt1.operatorBitwiseXor(bigInt2);
      const expected = new BigInt(1);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorBitwiseXorTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_BITWISE_XOR_TEST_1200
     * @tc.desc    Verify operatorBitwiseXor with large positive BigInt values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorBitwiseXorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("1000000000000000000000000");
      const bigInt2 = new BigInt("1000000000000000000000000");
      
      const result = bigInt1.operatorBitwiseXor(bigInt2);
      const expected = new BigInt(0);

      expect(result.equals(expected)).assertTrue();
    });
  });
}
