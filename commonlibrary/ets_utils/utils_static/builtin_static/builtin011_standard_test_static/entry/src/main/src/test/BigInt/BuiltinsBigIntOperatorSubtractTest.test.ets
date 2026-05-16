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

export default function BuiltinsBigIntOperatorSubtractTest(): void {
  describe("BuiltinsBigIntOperatorSubtractTest", () => {
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
     * @tc.name    builtinsBigIntOperatorSubtractTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_0100
     * @tc.desc    Verify operatorSubtract with BigInt(0xdecafafecacefade) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorSubtract(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_0200
     * @tc.desc    Verify operatorSubtract with BigInt(9007199254740991n) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(9007199254740991);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorSubtract(bigInt2);

      expect(result.positive()).assertTrue();
      expect(result.equals(new BigInt(9007199254740891))).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_0300
     * @tc.desc    Verify operatorSubtract with simple positive integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntOperatorSubtractTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1 = new BigInt(30);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorSubtract(bigInt2);
      const expected = new BigInt(10);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_0400
     * @tc.desc    Verify operatorSubtract with negative integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-10);
      const bigInt2 = new BigInt(-20);
      
      const result = bigInt1.operatorSubtract(bigInt2);
      const expected = new BigInt(10);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_0500
     * @tc.desc    Verify operatorSubtract with mixed sign integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(30);
      const bigInt2 = new BigInt(-20);
      
      const result = bigInt1.operatorSubtract(bigInt2);
      const expected = new BigInt(50);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_0600
     * @tc.desc    Verify operatorSubtract with negative minus positive
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-10);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorSubtract(bigInt2);
      const expected = new BigInt(-30);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_0700
     * @tc.desc    Verify operatorSubtract with BigInt(0xdecafafecacefade) and zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      const zero = new BigInt(0);
      
      const result = bigInt.operatorSubtract(zero);

      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_0800
     * @tc.desc    Verify operatorSubtract with zero and BigInt(0xdecafafecacefade)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zero = new BigInt(0);
      const bigInt = new BigInt("0xdecafafecacefade");
      
      const result = zero.operatorSubtract(bigInt);

      expect(result.negative()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_0900
     * @tc.desc    Verify operatorSubtract with BigInt(9007199254740991n) and zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(9007199254740991);
      const zero = new BigInt(0);
      
      const result = bigInt.operatorSubtract(zero);

      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_1000
     * @tc.desc    Verify operatorSubtract with BigInt(9007199254740991n) and itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(9007199254740991);
      
      const result = bigInt.operatorSubtract(bigInt);
      const expected = new BigInt(0);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_1100
     * @tc.desc    Verify operatorSubtract with BigInt(0xdecafafecacefade) and itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      
      const result = bigInt.operatorSubtract(bigInt);
      const expected = new BigInt(0);
      
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorSubtractTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_SUBTRACT_TEST_1200
     * @tc.desc    Verify operatorSubtract with large positive BigInt
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorSubtractTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("1000000000000000000000000000000");
      const bigInt2 = new BigInt("999999999999999999999999999999");
      
      const result = bigInt1.operatorSubtract(bigInt2);
      const expected = new BigInt(1);
      
      expect(result.equals(expected)).assertTrue();
    });
  });
}