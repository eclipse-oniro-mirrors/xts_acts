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

export default function BuiltinsBigIntOperatorLessThanTest(): void {
  describe("BuiltinsBigIntOperatorLessThanTest", () => {
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
     * @tc.name    builtinsBigIntOperatorLessThanTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_0100
     * @tc.desc    Verify operatorLessThan with BigInt(100) and BigInt(0xdecafafecacefade)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLessThanTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(100);
      const bigInt2 = new BigInt("0xdecafafecacefade");
      
      const result = bigInt1.operatorLessThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_0200
     * @tc.desc    Verify operatorLessThan with BigInt(100) and BigInt(9007199254740991n)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLessThanTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(100);
      const bigInt2 = new BigInt(9007199254740991);
      
      const result = bigInt1.operatorLessThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_0300
     * @tc.desc    Verify operatorLessThan with simple positive integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntOperatorLessThanTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1 = new BigInt(20);
      const bigInt2 = new BigInt(30);
      
      const result = bigInt1.operatorLessThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_0400
     * @tc.desc    Verify operatorLessThan with larger first value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLessThanTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(20);
      const bigInt2 = new BigInt(10);
      
      const result = bigInt1.operatorLessThan(bigInt2);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_0500
     * @tc.desc    Verify operatorLessThan with negative integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLessThanTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-20);
      const bigInt2 = new BigInt(-10);
      
      const result = bigInt1.operatorLessThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_0600
     * @tc.desc    Verify operatorLessThan with mixed sign integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLessThanTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-20);
      const bigInt2 = new BigInt(10);
      
      const result = bigInt1.operatorLessThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_0700
     * @tc.desc    Verify operatorLessThan with positive and negative
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLessThanTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(20);
      const bigInt2 = new BigInt(-10);
      
      const result = bigInt1.operatorLessThan(bigInt2);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_0800
     * @tc.desc    Verify operatorLessThan with equal values (boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorLessThanTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt1 = new BigInt(100);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorLessThan(bigInt2);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_0900
     * @tc.desc    Verify operatorLessThan with BigInt(0xdecafafecacefade) and itself (self-comparison)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorLessThanTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      
      const result = bigInt.operatorLessThan(bigInt);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_1000
     * @tc.desc    Verify operatorLessThan with BigInt(9007199254740991n) and itself (self-comparison with max safe integer)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBigIntOperatorLessThanTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const bigInt = new BigInt(9007199254740991);
      
      const result = bigInt.operatorLessThan(bigInt);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_1100
     * @tc.desc    Verify operatorLessThan with zero and positive (boundary value)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLessThanTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zero = new BigInt(0);
      const bigInt = new BigInt(100);
      
      const result = zero.operatorLessThan(bigInt);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLessThanTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LESS_THAN_TEST_1200
     * @tc.desc    Verify operatorLessThan with positive and zero (boundary case with zero)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorLessThanTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt = new BigInt(100);
      const zero = new BigInt(0);
      
      const result = bigInt.operatorLessThan(zero);

      expect(result).assertFalse();
    });
  });
}
