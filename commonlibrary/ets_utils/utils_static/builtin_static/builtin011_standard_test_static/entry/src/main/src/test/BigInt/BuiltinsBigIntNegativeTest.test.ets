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

export default function BuiltinsBigIntNegativeTest(): void {
  describe("BuiltinsBigIntNegativeTest", () => {
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
     * @tc.name    builtinsBigIntNegativeTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_0100
     * @tc.desc    Verify negative() returns false for positive BigInt
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntNegativeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const positiveBigInt = new BigInt(123);
      expect(positiveBigInt.negative()).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_0200
     * @tc.desc    Verify negative() returns true for negative BigInt
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntNegativeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negativeBigInt = new BigInt(-123);
      expect(negativeBigInt.negative()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_0300
     * @tc.desc    Verify negative() returns false for zero BigInt
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsBigIntNegativeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zeroBigInt = new BigInt(0);
      expect(zeroBigInt.negative()).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_0400
     * @tc.desc    Verify negative() returns false for positive BigInt from string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const positiveBigInt = new BigInt("9999999999999999999999999999");
      expect(positiveBigInt.negative()).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_0500
     * @tc.desc    Verify negative() returns true for negative BigInt from string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const negativeBigInt = new BigInt("-9999999999999999999999999999");
      expect(negativeBigInt.negative()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_0600
     * @tc.desc    Verify negative() returns false for positive BigInt from boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const positiveBigInt = new BigInt(true);
      expect(positiveBigInt.negative()).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_0700
     * @tc.desc    Verify negative() returns false for positive BigInt from byte
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const positiveBigInt = new BigInt(127 as byte);
      expect(positiveBigInt.negative()).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_0800
     * @tc.desc    Verify negative() returns true for negative BigInt from byte
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const negativeBigInt = new BigInt(-128 as byte);
      expect(negativeBigInt.negative()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_0900
     * @tc.desc    Verify negative() returns false for positive BigInt from double
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const positiveBigInt = new BigInt(123.0);
      expect(positiveBigInt.negative()).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_1000
     * @tc.desc    Verify negative() returns true for negative BigInt from double
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const negativeBigInt = new BigInt(-123.0);
      expect(negativeBigInt.negative()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_1100
     * @tc.desc    Verify negative() returns false for positive BigInt from long
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const positiveBigInt = new BigInt(999999999999999999 as long);
      expect(positiveBigInt.negative()).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_1200
     * @tc.desc    Verify negative() returns true for negative BigInt from long
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const negativeBigInt = new BigInt(-999999999999999999 as long);
      expect(negativeBigInt.negative()).assertTrue();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest1300
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_1300
     * @tc.desc    Verify negative() returns false for zero BigInt from boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zeroBigInt = new BigInt(false);
      expect(zeroBigInt.negative()).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest1400
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_1400
     * @tc.desc    Verify negative() returns false for positive BigInt from copy constructor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const original = new BigInt(456);
      const copied = new BigInt(original);
      expect(copied.negative()).assertFalse();
    });

    /**
     * @tc.name    builtinsBigIntNegativeTest1500
     * @tc.number  SUB_BUILTINS_BIGINT_NEGATIVE_TEST_1500
     * @tc.desc    Verify negative() returns true for negative BigInt from copy constructor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsBigIntNegativeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const original = new BigInt(-456);
      const copied = new BigInt(original);
      expect(copied.negative()).assertTrue();
    });
  });
}