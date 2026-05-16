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

export default function BuiltinsBigIntOperatorLeftShiftTest(): void {
  describe("BuiltinsBigIntOperatorLeftShiftTest", () => {
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
     * @tc.name    builtinsBigIntOperatorLeftShiftTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_0100
     * @tc.desc    Verify operatorLeftShift with BigInt(0xdecafafecacefade) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLeftShiftTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorLeftShift(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_0200
     * @tc.desc    Verify operatorLeftShift with BigInt(9007199254740991n) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLeftShiftTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(9007199254740991);
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorLeftShift(bigInt2);
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_0300
     * @tc.desc    Verify operatorLeftShift with simple positive integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntOperatorLeftShiftTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1 = new BigInt(10);  // 1010
      const bigInt2 = new BigInt(2);    // 左移2位
      
      const result = bigInt1.operatorLeftShift(bigInt2);
      const expected = new BigInt(40);  // 101000

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_0400
     * @tc.desc    Verify operatorLeftShift with negative BigInt
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLeftShiftTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-10);
      const bigInt2 = new BigInt(2);
      
      const result = bigInt1.operatorLeftShift(bigInt2);
      const expected = new BigInt(-40);

      expect(result.negative()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_0500
     * @tc.desc    Verify operatorLeftShift with zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLeftShiftTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(100);
      const zero = new BigInt(0);
      
      const result = bigInt.operatorLeftShift(zero);

      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_0600
     * @tc.desc    Verify operatorLeftShift with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLeftShiftTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zero = new BigInt(0);
      const bigInt = new BigInt(100);
      
      const result = zero.operatorLeftShift(bigInt);

      expect(result.equals(zero)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_0700
     * @tc.desc    Verify operatorLeftShift with single bit value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLeftShiftTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(1);  // 1
      const bigInt2 = new BigInt(3);  // 左移3位
      
      const result = bigInt1.operatorLeftShift(bigInt2);
      const expected = new BigInt(8);  // 1000

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_0800
     * @tc.desc    Verify operatorLeftShift with large shift amount (boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorLeftShiftTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt1 = new BigInt(1);
      const bigInt2 = new BigInt(1000);  // 大位移量
      
      const result = bigInt1.operatorLeftShift(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_0900
     * @tc.desc    Verify operatorLeftShift with BigInt(0xdecafafecacefade) and small shift
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorLeftShiftTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(1);  // 左移1位
      
      const result = bigInt1.operatorLeftShift(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_1000
     * @tc.desc    Verify operatorLeftShift with BigInt(9007199254740991n) and small shift (complex boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBigIntOperatorLeftShiftTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const bigInt1 = new BigInt(9007199254740991);
      const bigInt2 = new BigInt(1);  // 左移1位
      
      const result = bigInt1.operatorLeftShift(bigInt2);
      const expected = new BigInt(18014398509481982);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_1100
     * @tc.desc    Verify operatorLeftShift with negative shift amount (boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorLeftShiftTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt1 = new BigInt(10);
      const bigInt2 = new BigInt(-2);  // 负位移量
      
      const result = bigInt1.operatorLeftShift(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorLeftShiftTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_LEFT_SHIFT_TEST_1200
     * @tc.desc    Verify operatorLeftShift with large value and medium shift
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorLeftShiftTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("1000000000000000000000000");
      const bigInt2 = new BigInt(10);  // 左移10位
      
      const result = bigInt1.operatorLeftShift(bigInt2);

      expect(result.positive()).assertTrue();
    });
  });
}
