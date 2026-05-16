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

export default function BuiltinsBigIntOperatorGreaterThanTest(): void {
  describe("BuiltinsBigIntOperatorGreaterThanTest", () => {
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
     * @tc.name    builtinsBigIntOperatorGreaterThanTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_0100
     * @tc.desc    Verify operatorGreaterThan with BigInt(0xdecafafecacefade) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorGreaterThanTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorGreaterThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_0200
     * @tc.desc    Verify operatorGreaterThan with BigInt(9007199254740991n) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorGreaterThanTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(9007199254740991);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorGreaterThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_0300
     * @tc.desc    Verify operatorGreaterThan with simple positive integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntOperatorGreaterThanTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1 = new BigInt(30);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorGreaterThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_0400
     * @tc.desc    Verify operatorGreaterThan with smaller first value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorGreaterThanTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(10);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorGreaterThan(bigInt2);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_0500
     * @tc.desc    Verify operatorGreaterThan with negative integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorGreaterThanTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-10);
      const bigInt2 = new BigInt(-20);
      
      const result = bigInt1.operatorGreaterThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_0600
     * @tc.desc    Verify operatorGreaterThan with mixed sign integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorGreaterThanTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(10);
      const bigInt2 = new BigInt(-20);
      
      const result = bigInt1.operatorGreaterThan(bigInt2);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_0700
     * @tc.desc    Verify operatorGreaterThan with negative and positive
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorGreaterThanTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-10);
      const bigInt2 = new BigInt(20);
      
      const result = bigInt1.operatorGreaterThan(bigInt2);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_0800
     * @tc.desc    Verify operatorGreaterThan with equal values (boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorGreaterThanTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt1 = new BigInt(100);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorGreaterThan(bigInt2);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_0900
     * @tc.desc    Verify operatorGreaterThan with BigInt(0xdecafafecacefade) and itself (self-comparison)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorGreaterThanTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt = new BigInt("0xdecafafecacefade");
      
      const result = bigInt.operatorGreaterThan(bigInt);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_1000
     * @tc.desc    Verify operatorGreaterThan with BigInt(9007199254740991n) and itself (self-comparison with max safe integer)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBigIntOperatorGreaterThanTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const bigInt = new BigInt(9007199254740991);
      
      const result = bigInt.operatorGreaterThan(bigInt);

      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_1100
     * @tc.desc    Verify operatorGreaterThan with zero (boundary value)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorGreaterThanTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(100);
      const zero = new BigInt(0);
      
      const result = bigInt.operatorGreaterThan(zero);

      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorGreaterThanTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_GREATER_THAN_TEST_1200
     * @tc.desc    Verify operatorGreaterThan with zero and positive (boundary case with zero)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorGreaterThanTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const zero = new BigInt(0);
      const bigInt = new BigInt(100);
      
      const result = zero.operatorGreaterThan(bigInt);

      expect(result).assertFalse();
    });
  });
}
