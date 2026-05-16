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

export default function BuiltinsBigIntOperatorRightShiftTest(): void {
  describe("BuiltinsBigIntOperatorRightShiftTest", () => {
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
     * @tc.name    builtinsBigIntOperatorRightShiftTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_0100
     * @tc.desc    Verify operatorRightShift with BigInt(0xdecafafecacefade) and BigInt(100)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorRightShiftTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(100);
      
      const result = bigInt1.operatorRightShift(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_0200
     * @tc.desc    Verify operatorRightShift with BigInt(9007199254740991n) and BigInt(1)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorRightShiftTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(9007199254740991);
      const bigInt2 = new BigInt(1);
      
      const result = bigInt1.operatorRightShift(bigInt2);
      const expected = new BigInt(4503599627370495);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_0300
     * @tc.desc    Verify operatorRightShift with simple positive integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntOperatorRightShiftTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1 = new BigInt(40);  // 101000
      const bigInt2 = new BigInt(2);    // 右移2位
      
      const result = bigInt1.operatorRightShift(bigInt2);
      const expected = new BigInt(10);  // 1010

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_0400
     * @tc.desc    Verify operatorRightShift with negative BigInt
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorRightShiftTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(-40);
      const bigInt2 = new BigInt(2);
      
      const result = bigInt1.operatorRightShift(bigInt2);
      const expected = new BigInt(-10);

      expect(result.negative()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_0500
     * @tc.desc    Verify operatorRightShift with zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorRightShiftTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt = new BigInt(100);
      const zero = new BigInt(0);
      
      const result = bigInt.operatorRightShift(zero);

      expect(result.equals(bigInt)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_0600
     * @tc.desc    Verify operatorRightShift with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorRightShiftTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zero = new BigInt(0);
      const bigInt = new BigInt(100);
      
      const result = zero.operatorRightShift(bigInt);

      expect(result.equals(zero)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_0700
     * @tc.desc    Verify operatorRightShift with single bit value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorRightShiftTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt(8);  // 1000
      const bigInt2 = new BigInt(3);  // 右移3位
      
      const result = bigInt1.operatorRightShift(bigInt2);
      const expected = new BigInt(1);  // 1

      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_0800
     * @tc.desc    Verify operatorRightShift with large shift amount (boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorRightShiftTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt1 = new BigInt(100);
      const bigInt2 = new BigInt(1000);  // 大位移量
      
      const result = bigInt1.operatorRightShift(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_0900
     * @tc.desc    Verify operatorRightShift with BigInt(0xdecafafecacefade) and small shift
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorRightShiftTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt1 = new BigInt("0xdecafafecacefade");
      const bigInt2 = new BigInt(1);  // 右移1位
      
      const result = bigInt1.operatorRightShift(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_1000
     * @tc.desc    Verify operatorRightShift with BigInt(9007199254740991n) and small shift (complex boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL3
     */
    it('builtinsBigIntOperatorRightShiftTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      const bigInt1 = new BigInt(9007199254740991);
      const bigInt2 = new BigInt(1);  // 右移1位
      
      const result = bigInt1.operatorRightShift(bigInt2);
      const expected = new BigInt(4503599627370495);

      expect(result.positive()).assertTrue();
      expect(result.equals(expected)).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_1100
     * @tc.desc    Verify operatorRightShift with negative shift amount (boundary case)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsBigIntOperatorRightShiftTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bigInt1 = new BigInt(10);
      const bigInt2 = new BigInt(-2);  // 负位移量
      
      const result = bigInt1.operatorRightShift(bigInt2);

      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntOperatorRightShiftTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_OPERATOR_RIGHT_SHIFT_TEST_1200
     * @tc.desc    Verify operatorRightShift with large value and medium shift
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntOperatorRightShiftTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigInt1 = new BigInt("1000000000000000000000000");
      const bigInt2 = new BigInt(10);  // 右移10位
      
      const result = bigInt1.operatorRightShift(bigInt2);

      expect(result.positive()).assertTrue();
    });
  });
}
