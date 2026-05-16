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

export default function BuiltinsBigIntConstructorTest(): void {
  describe('BuiltinsBigIntConstructorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name  bigIntConstructorTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_0100
     * @tc.desc  Test constructor() creates BigInt instance with value 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero).assertInstanceOf('BigInt');
      expect(bigintZero == 0n).assertTrue();
      expect(bigintZero.toString()).assertEqual("0");
    });

    /**
     * @tc.name  bigIntConstructorTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_0200
     * @tc.desc  Test constructor() result equals(0n) returns true, equals(1n)/equals(-1n) returns false
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.equals(0n)).assertTrue();
      expect(bigintZero.equals(1n)).assertFalse();
      expect(bigintZero.equals(-1n)).assertFalse();
    });

    /**
     * @tc.name  bigIntConstructorTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_0300
     * @tc.desc  Test constructor() result comparison: 0n < 1n, 0n > -1n, 0n <= 0n, 0n >= 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.operatorLessThan(1n)).assertTrue();
      expect(bigintZero.operatorGreaterThan(-1n)).assertTrue();
      expect(bigintZero.operatorLessThanEqual(0n)).assertTrue();
      expect(bigintZero.operatorGreaterThanEqual(0n)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_0400
     * @tc.desc  Test constructor() result arithmetic: 0n + 1n = 1n, 0n - 1n = -1n, 0n * 5n = 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.operatorAdd(1n).equals(1n)).assertTrue();
      expect(bigintZero.operatorSubtract(1n).equals(-1n)).assertTrue();
      expect(bigintZero.operatorMultiply(5n).equals(0n)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_0500
     * @tc.desc  Test constructor() result division and module: 0n / 5n = 0n, 0n % 5n = 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.operatorDivide(5n).equals(0n)).assertTrue();
      expect(bigintZero.operatorModule(5n).equals(0n)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_0600
     * @tc.desc  Test constructor() result number conversion: doubleValue() = 0.0, getLong() = 0L, getULong() = 0L
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.doubleValue()).assertEqual(0.0);
      expect(bigintZero.getLong()).assertEqual(0 as long);
      expect(bigintZero.getULong()).assertEqual(0 as long);
    });

    /**
     * @tc.name  bigIntConstructorTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_0700
     * @tc.desc  Test constructor() result sign check: negative() = false, positive() = true
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.negative()).assertFalse();
      expect(bigintZero.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_0800
     * @tc.desc  Test constructor() result bit operations: ~0n = -1n, 0n | 5n = 5n, 0n & 5n = 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.operatorBitwiseNot().equals(-1n)).assertTrue();
      expect(bigintZero.operatorBitwiseOr(5n).equals(5n)).assertTrue();
      expect(bigintZero.operatorBitwiseAnd(5n).equals(0n)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_0900
     * @tc.desc  Test constructor() result shift operations: 0n << 5n = 0n, 0n >> 5n = 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.operatorLeftShift(5n).equals(0n)).assertTrue();
      expect(bigintZero.operatorRightShift(5n).equals(0n)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_1000
     * @tc.desc  Test constructor() result increment/decrement/negate: ++0n = 1n, --0n = -1n, -0n = 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.operatorIncrement().equals(1n)).assertTrue();
      expect(bigintZero.operatorDecrement().equals(-1n)).assertTrue();
      expect(bigintZero.negate().equals(0n)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_1100
     * @tc.desc  Test constructor() result pow: 0n^0n = 1n, 0n^5n = 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(bigintZero.pow(0n).equals(1n)).assertTrue();
      expect(bigintZero.pow(5n).equals(0n)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_TEST_1200
     * @tc.desc  Test constructor() result static methods: asIntN(64, 0n) = 0n, asUintN(64, 0n) = 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigintZero: BigInt = new BigInt();

      expect(BigInt.asIntN(64, bigintZero).equals(0n)).assertTrue();
      expect(BigInt.asUintN(64, bigintZero).equals(0n)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorByteTest1300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BYTE_TEST_1300
     * @tc.desc  Test constructor(d: byte) with positive value 42 - verify sign and value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorByteTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: byte = 42 as byte;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(42))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
      expect(bigIntValue.toString()).assertEqual("42");
    });

    /**
     * @tc.name  bigIntConstructorByteTest1400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BYTE_TEST_1400
     * @tc.desc  Test constructor(d: byte) with negative value -42 - verify sign and value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorByteTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: byte = -42 as byte;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-42))).assertTrue();
      expect(bigIntValue.positive()).assertFalse();
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("-42");
    });

    /**
     * @tc.name  bigIntConstructorByteTest1500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BYTE_TEST_1500
     * @tc.desc  Test constructor(d: byte) with zero - verify sign=0 and empty bytes
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorByteTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: byte = 0 as byte;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
      expect(bigIntValue.doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.name  bigIntConstructorByteTest1600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BYTE_TEST_1600
     * @tc.desc  Test constructor(d: byte) with boundary maximum 127 (Int8Array upper bound)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorByteTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: byte = 127 as byte;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(127))).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(127 as long);
      expect(bigIntValue.doubleValue()).assertEqual(127.0);
      expect(bigIntValue.toString(2)).assertEqual("1111111");
    });

    /**
     * @tc.name  bigIntConstructorByteTest1700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BYTE_TEST_1700
     * @tc.desc  Test constructor(d: byte) with boundary minimum -128 (Int8Array lower bound)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorByteTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: byte = -128 as byte;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-128))).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(-128 as long);
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.operatorBitwiseAnd(new BigInt(255)).equals(new BigInt(128))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorByteTest1800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BYTE_TEST_1800
     * @tc.desc  Test constructor(d: byte) arithmetic operations with constructed value 100
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorByteTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: byte = 100 as byte;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.operatorAdd(new BigInt(28)).equals(new BigInt(128))).assertTrue();
      expect(bigIntValue.operatorSubtract(new BigInt(50)).equals(new BigInt(50))).assertTrue();
      expect(bigIntValue.operatorMultiply(new BigInt(2)).equals(new BigInt(200))).assertTrue();
      expect(bigIntValue.operatorDivide(new BigInt(4)).equals(new BigInt(25))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorByteTest1900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BYTE_TEST_1900
     * @tc.desc  Test constructor(d: byte) with -1 - verify correct two's complement handling
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorByteTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: byte = -1 as byte;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-1))).assertTrue();
      expect(bigIntValue.operatorBitwiseNot().equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.operatorAdd(new BigInt(1)).equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.negate().equals(new BigInt(1))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorByteTest2000
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BYTE_TEST_2000
     * @tc.desc  Test constructor(d: byte) value conversion and comparison with other types
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorByteTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: byte = 64 as byte;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.operatorGreaterThan(new BigInt(63))).assertTrue();
      expect(bigIntValue.operatorLessThan(new BigInt(65))).assertTrue();
      expect(bigIntValue.operatorGreaterThanEqual(new BigInt(64))).assertTrue();

      expect(bigIntValue.operatorLeftShift(new BigInt(1)).equals(new BigInt(128))).assertTrue();
      expect(bigIntValue.operatorRightShift(new BigInt(1)).equals(new BigInt(32))).assertTrue();

      expect(bigIntValue.equals(new BigInt(64))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorShortTest2100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_SHORT_TEST_2100
     * @tc.desc  Test constructor(d: short) with positive value 1000 - verify sign and value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorShortTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: short = 1000 as short;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(1000))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
      expect(bigIntValue.toString()).assertEqual("1000");
    });

    /**
     * @tc.name  bigIntConstructorShortTest2200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_SHORT_TEST_2200
     * @tc.desc  Test constructor(d: short) with negative value -1000 - verify sign and value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorShortTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: short = -1000 as short;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-1000))).assertTrue();
      expect(bigIntValue.positive()).assertFalse();
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("-1000");
    });

    /**
     * @tc.name  bigIntConstructorShortTest2300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_SHORT_TEST_2300
     * @tc.desc  Test constructor(d: short) with zero - verify sign=0 and value 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorShortTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: short = 0 as short;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
      expect(bigIntValue.doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.name  bigIntConstructorShortTest2400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_SHORT_TEST_2400
     * @tc.desc  Test constructor(d: short) with boundary maximum 32767 (Int16Array upper bound)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorShortTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: short = 32767 as short;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(32767))).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(32767 as long);
      expect(bigIntValue.doubleValue()).assertEqual(32767.0);
      expect(bigIntValue.toString(16)).assertEqual("7fff");
    });

    /**
     * @tc.name  bigIntConstructorShortTest2500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_SHORT_TEST_2500
     * @tc.desc  Test constructor(d: short) with boundary minimum -32768 (Int16Array lower bound)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorShortTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: short = -32768 as short;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-32768))).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(-32768 as long);
      expect(bigIntValue.negative()).assertTrue();

      expect(bigIntValue.operatorBitwiseAnd(new BigInt(65535)).equals(new BigInt(32768))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorShortTest2600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_SHORT_TEST_2600
     * @tc.desc  Test constructor(d: short) arithmetic operations with constructed value 1234
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorShortTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: short = 1234 as short;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.operatorAdd(new BigInt(766)).equals(new BigInt(2000))).assertTrue();
      expect(bigIntValue.operatorSubtract(new BigInt(234)).equals(new BigInt(1000))).assertTrue();
      expect(bigIntValue.operatorMultiply(new BigInt(2)).equals(new BigInt(2468))).assertTrue();
      expect(bigIntValue.operatorDivide(new BigInt(2)).equals(new BigInt(617))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorShortTest2700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_SHORT_TEST_2700
     * @tc.desc  Test constructor(d: short) with -1 - verify two's complement bit operations
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorShortTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: short = -1 as short;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-1))).assertTrue();
      expect(bigIntValue.operatorBitwiseNot().equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.operatorAdd(new BigInt(1)).equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.negate().equals(new BigInt(1))).assertTrue();

      expect(bigIntValue.operatorBitwiseAnd(new BigInt(65535)).equals(new BigInt(65535))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorShortTest2800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_SHORT_TEST_2800
     * @tc.desc  Test constructor(d: short) value conversion and comparison with other numeric types
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorShortTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: short = 4096 as short;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.operatorGreaterThan(new BigInt(4095))).assertTrue();
      expect(bigIntValue.operatorLessThan(new BigInt(4097))).assertTrue();
      expect(bigIntValue.operatorGreaterThanEqual(new BigInt(4096))).assertTrue();

      expect(bigIntValue.operatorLeftShift(new BigInt(1)).equals(new BigInt(8192))).assertTrue();
      expect(bigIntValue.operatorRightShift(new BigInt(2)).equals(new BigInt(1024))).assertTrue();

      expect(bigIntValue.equals(new BigInt(4096 as int))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorIntTest2900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_INT_TEST_2900
     * @tc.desc  Test constructor(d: int) with positive value 100000 - verify sign and value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorIntTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: int = 100000 as int;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(100000))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
      expect(bigIntValue.toString()).assertEqual("100000");
    });

    /**
     * @tc.name  bigIntConstructorIntTest3000
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_INT_TEST_3000
     * @tc.desc  Test constructor(d: int) with negative value -100000 - verify sign and value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorIntTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: int = -100000 as int;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-100000))).assertTrue();
      expect(bigIntValue.positive()).assertFalse();
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("-100000");
    });

    /**
     * @tc.name  bigIntConstructorIntTest3100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_INT_TEST_3100
     * @tc.desc  Test constructor(d: int) with zero - verify sign=0 and value 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorIntTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: int = 0 as int;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
      expect(bigIntValue.doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.name  bigIntConstructorIntTest3200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_INT_TEST_3200
     * @tc.desc  Test constructor(d: int) with boundary maximum 2147483647 (Int32Array upper bound, 2^31-1)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorIntTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: int = 2147483647 as int;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(2147483647))).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(2147483647 as long);
      expect(bigIntValue.doubleValue()).assertEqual(2147483647.0);
      expect(bigIntValue.toString(16)).assertEqual("7fffffff");
      expect(bigIntValue.toString(2)).assertEqual("1111111111111111111111111111111");
    });

    /**
     * @tc.name  bigIntConstructorIntTest3300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_INT_TEST_3300
     * @tc.desc  Test constructor(d: int) with boundary minimum -2147483648 (Int32Array lower bound, -2^31)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorIntTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: int = -2147483648 as int;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-2147483648))).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(-2147483648 as long);
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.operatorBitwiseAnd(new BigInt(4294967295)).equals(new BigInt(2147483648))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorIntTest3400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_INT_TEST_3400
     * @tc.desc  Test constructor(d: int) arithmetic operations with constructed value 123456789
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorIntTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: int = 123456789 as int;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.operatorAdd(new BigInt(876543211)).equals(new BigInt(1000000000))).assertTrue();
      expect(bigIntValue.operatorSubtract(new BigInt(23456789)).equals(new BigInt(100000000))).assertTrue();
      expect(bigIntValue.operatorMultiply(new BigInt(2)).equals(new BigInt(246913578))).assertTrue();
      expect(bigIntValue.operatorDivide(new BigInt(3)).equals(new BigInt(41152263))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorIntTest3500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_INT_TEST_3500
     * @tc.desc  Test constructor(d: int) with -1 - verify 32-bit two's complement behavior
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorIntTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: int = -1 as int;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-1))).assertTrue();
      expect(bigIntValue.operatorBitwiseNot().equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.operatorAdd(new BigInt(1)).equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.operatorBitwiseAnd(new BigInt(4294967295)).equals(new BigInt(4294967295))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorIntTest3600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_INT_TEST_3600
     * @tc.desc  Test constructor(d: int) value conversion and shift operations with large int value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorIntTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: int = 1073741824 as int;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.operatorGreaterThan(new BigInt(1073741823))).assertTrue();
      expect(bigIntValue.operatorLessThan(new BigInt(1073741825))).assertTrue();

      expect(bigIntValue.operatorLeftShift(new BigInt(1)).equals(new BigInt(2147483648))).assertTrue();
      expect(bigIntValue.operatorRightShift(new BigInt(1)).equals(new BigInt(536870912))).assertTrue();

      expect(bigIntValue.equals(new BigInt(1073741824 as long))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorLongTest3700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_3700
     * @tc.desc  Test constructor(d: long) with positive value 1000000000 - verify sign and value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = 1000000000 as long;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(1000000000))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
      expect(bigIntValue.toString()).assertEqual("1000000000");
    });

    /**
     * @tc.name  bigIntConstructorLongTest3800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_3800
     * @tc.desc  Test constructor(d: long) with negative value -1000000000 - verify sign and value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = -1000000000 as long;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-1000000000))).assertTrue();
      expect(bigIntValue.positive()).assertFalse();
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("-1000000000");
    });

    /**
     * @tc.name  bigIntConstructorLongTest3900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_3900
     * @tc.desc  Test constructor(d: long) with zero - verify sign=0 and value 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = 0 as long;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
      expect(bigIntValue.getLong()).assertEqual(0 as long);
    });

    /**
     * @tc.name  bigIntConstructorLongTest4000
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_4000
     * @tc.desc  Test constructor(d: long) with boundary maximum 9223372036854775807 (Long.MAX_VALUE, 2^63-1)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = 9223372036854775807 as long;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt("9223372036854775807"))).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(9223372036854775807 as long);
      expect(bigIntValue.doubleValue()).assertClose(9223372036854775807.0, 1);
      expect(bigIntValue.toString(16).toLowerCase()).assertEqual("7fffffffffffffff");
      expect(bigIntValue.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorLongTest4100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_4100
     * @tc.desc  Test constructor(d: long) with boundary minimum -9223372036854775808 (Long.MIN_VALUE, -2^63)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = -9223372036854775808 as long;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt("-9223372036854775808"))).assertTrue();
      expect(bigIntValue.getLong()).assertEqual(-9223372036854775808 as long);
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.toString(16).toLowerCase()).assertEqual("-8000000000000000");
    });

    /**
     * @tc.name  bigIntConstructorLongTest4200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_4200
     * @tc.desc  Test constructor(d: long) arithmetic operations with large long value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = 9007199254740992 as long;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.operatorAdd(new BigInt(1)).equals(new BigInt("9007199254740993"))).assertTrue();
      expect(bigIntValue.operatorMultiply(new BigInt(2)).equals(new BigInt("18014398509481984"))).assertTrue();
      expect(bigIntValue.operatorSubtract(new BigInt(9007199254740992 as long)).equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorLongTest4300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_4300
     * @tc.desc  Test constructor(d: long) with -1 - verify 64-bit two's complement behavior
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = -1 as long;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-1))).assertTrue();
      expect(bigIntValue.operatorBitwiseNot().equals(new BigInt(0))).assertTrue();

      const mask64: BigInt = new BigInt("18446744073709551615");
      expect(bigIntValue.operatorBitwiseAnd(mask64).equals(mask64)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorLongTest4400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_4400
     * @tc.desc  Test constructor(d: long) with powers of two and shift operations
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: long = 4611686018427387904 as long;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.toString()).assertEqual("4611686018427387904");

      expect(bigIntValue.operatorLeftShift(new BigInt(1)).equals(new BigInt("9223372036854775808"))).assertTrue();
      expect(bigIntValue.operatorRightShift(new BigInt(1)).equals(new BigInt(2305843009213693952 as long))).assertTrue();

      expect(bigIntValue.operatorLessThan(new BigInt(9223372036854775807 as long))).assertTrue();
      expect(bigIntValue.operatorGreaterThan(new BigInt(0 as long))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorLongTest4500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_4500
     * @tc.desc  Test constructor(d: long) precision consistency with string constructor for MAX_VALUE
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longMax: long = 9223372036854775807 as long;
      const fromLong: BigInt = new BigInt(longMax);
      const fromString: BigInt = new BigInt("9223372036854775807");

      expect(fromLong.equals(fromString)).assertTrue();
      expect(fromLong.toString()).assertEqual(fromString.toString());

      const doubleVal: double = fromLong.doubleValue();

      expect(doubleVal).assertClose(9223372036854775807.0, 1000);
    });

    /**
     * @tc.name  bigIntConstructorLongTest4600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_LONG_TEST_4600
     * @tc.desc  Test constructor(d: long) boundary overflow behavior: MAX_VALUE + 1 = MIN_VALUE (if treated as long)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorLongTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longMax: BigInt = new BigInt(9223372036854775807 as long);
      const longMin: BigInt = new BigInt(-9223372036854775808 as long);

      const maxPlusOne: BigInt = longMax.operatorAdd(new BigInt(1));
      const minMinusOne: BigInt = longMin.operatorSubtract(new BigInt(1));

      expect(maxPlusOne.equals(new BigInt("9223372036854775808"))).assertTrue();
      expect(minMinusOne.equals(new BigInt("-9223372036854775809"))).assertTrue();

      expect(maxPlusOne.operatorGreaterThan(longMax)).assertTrue();
      expect(minMinusOne.operatorLessThan(longMin)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest4700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_4700
     * @tc.desc  Test constructor(d: double) with positive integer 12345 - normal safe integer path
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: double = 12345.0 as double;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(12345))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("12345");
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest4800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_4800
     * @tc.desc  Test constructor(d: double) with negative integer -99999 - verify sign handling
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: double = -99999.0 as double;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(-99999))).assertTrue();
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("-99999");
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest4900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_4900
     * @tc.desc  Test constructor(d: double) with zero and negative zero - both should result in 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: double = 0.0 as double;
      const negZero: double = -0.0 as double;

      const bigIntZero: BigInt = new BigInt(zero);
      const bigIntNegZero: BigInt = new BigInt(negZero);

      expect(bigIntZero.equals(new BigInt(0))).assertTrue();
      expect(bigIntNegZero.equals(new BigInt(0))).assertTrue();
      expect(bigIntZero.equals(bigIntNegZero)).assertTrue();
      expect(bigIntZero.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest5000
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_5000
     * @tc.desc  Test constructor(d: double) with Number.MAX_SAFE_INTEGER (9007199254740991) - boundary of safe integer
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: double = 9007199254740991.0 as double;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt("9007199254740991"))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("9007199254740991");

      expect(bigIntValue.doubleValue()).assertClose(9007199254740991.0, 1);
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest5100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_5100
     * @tc.desc  Test constructor(d: double) with Number.MIN_SAFE_INTEGER (-9007199254740991) - negative boundary
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: double = -9007199254740991.0 as double;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt("-9007199254740991"))).assertTrue();
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("-9007199254740991");
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest5200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_5200
     * @tc.desc  Test constructor(d: double) throws RangeError for non-integer values (1.5)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: double = 1.5 as double;

      try {
        const bigIntValue: BigInt = new BigInt(val);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
        expect((e as Error).message).assertContain("cannot be converted to a BigInt because it is not an integer");
      }
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest5300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_5300
     * @tc.desc  Test constructor(d: double) throws RangeError for Infinity and NaN
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const infinityVal: double = Infinity as double;
      const negInfinityVal: double = -Infinity as double;
      const nanVal: double = NaN as double;

      try {
        new BigInt(infinityVal);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }

      try {
        new BigInt(negInfinityVal);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }

      try {
        new BigInt(nanVal);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest5400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_5400
     * @tc.desc  Test constructor(d: double) with scientific notation (1e3, 2.5e-2 as integers)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const scientificPos: double = 1e3 as double;
      const scientificNeg: double = -2.5e3 as double;

      const bigIntPos: BigInt = new BigInt(scientificPos);
      const bigIntNeg: BigInt = new BigInt(scientificNeg);

      expect(bigIntPos.equals(new BigInt(1000))).assertTrue();
      expect(bigIntNeg.equals(new BigInt(-2500))).assertTrue();

      try {
        new BigInt(2.5e-2 as double);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest5500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_5500
     * @tc.desc  Test constructor(d: double) throws RangeError for Number.MIN_VALUE (5e-324)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minVal: double = 5e-324 as double;

      try {
        new BigInt(minVal);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest5600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_5600
     * @tc.desc  Test constructor(d: double) throws RangeError for Number.EPSILON (2.220446049250313e-16)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const epsilon: double = 2.220446049250313e-16 as double;

      try {
        new BigInt(epsilon);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest5700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_5700
     * @tc.desc  Test constructor(d: double) with integer at double precision boundary (9007199254740992 = 2^53)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const atPrecisionLimit: double = 9007199254740992.0 as double;
      const bigIntValue: BigInt = new BigInt(atPrecisionLimit);

      expect(bigIntValue.toString()).assertEqual("9007199254740992");
      expect(bigIntValue.equals(new BigInt("9007199254740992"))).assertTrue();

      const beyondPrecision: double = 9007199254740993.0 as double;
      const bigIntBeyond: BigInt = new BigInt(beyondPrecision);

      expect(bigIntBeyond.toString()).assertEqual("9007199254740992");
      expect(bigIntBeyond.equals(bigIntValue)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorDoubleTest5800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_DOUBLE_TEST_5800
     * @tc.desc  Test constructor(d: double) with large integer value (1e18) through fromDoubleInteger path
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorDoubleTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const largeVal: double = 1e18 as double;
      const bigIntValue: BigInt = new BigInt(largeVal);

      expect(bigIntValue.toString()).assertEqual("1000000000000000000");
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.operatorDivide(new BigInt(1000000)).equals(new BigInt(1000000000000))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorStringTest5900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_5900
     * @tc.desc  Test constructor(d: string) with positive integer "123456789"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "123456789";
      const bigIntValue: BigInt = new BigInt(str);

      expect(bigIntValue.equals(new BigInt(123456789))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("123456789");
      expect(bigIntValue.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorStringTest6000
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6000
     * @tc.desc  Test constructor(d: string) with negative integer "-987654321"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "-987654321";
      const bigIntValue: BigInt = new BigInt(str);

      expect(bigIntValue.equals(new BigInt(-987654321))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("-987654321");
      expect(bigIntValue.negative()).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorStringTest6100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6100
     * @tc.desc  Test constructor(d: string) with zero values "0", "+0", "-0"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero1: BigInt = new BigInt("0");
      const zero2: BigInt = new BigInt("+0");
      const zero3: BigInt = new BigInt("-0");

      expect(zero1.equals(new BigInt(0))).assertTrue();
      expect(zero2.equals(new BigInt(0))).assertTrue();
      expect(zero3.equals(new BigInt(0))).assertTrue();
      expect(zero1.equals(zero2)).assertTrue();
      expect(zero1.equals(zero3)).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorStringTest6200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6200
     * @tc.desc  Test constructor(d: string) with empty string "" - should return 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "";
      const bigIntValue: BigInt = new BigInt(str);

      expect(bigIntValue.equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("0");
    });

    /**
     * @tc.name  bigIntConstructorStringTest6300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6300
     * @tc.desc  Test constructor(d: string) with whitespace trim "   42   "
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "   42   ";
      const bigIntValue: BigInt = new BigInt(str);

      expect(bigIntValue.equals(new BigInt(42))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("42");
    });

    /**
     * @tc.name  bigIntConstructorStringTest6400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6400
     * @tc.desc  Test constructor(d: string) with hexadecimal "0xff", "0XFF", "0xdeadbeef"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hex1: BigInt = new BigInt("0xff");
      const hex2: BigInt = new BigInt("0XFF");
      const hex3: BigInt = new BigInt("0xdeadbeef");

      expect(hex1.equals(new BigInt(255))).assertTrue();
      expect(hex2.equals(new BigInt(255))).assertTrue();
      expect(hex3.equals(new BigInt(3735928559))).assertTrue();
      expect(hex3.toString(16).toLowerCase()).assertEqual("deadbeef");
    });

    /**
     * @tc.name  bigIntConstructorStringTest6500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6500
     * @tc.desc  Test constructor(d: string) with binary "0b1010", "0B11110000"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bin1: BigInt = new BigInt("0b1010");
      const bin2: BigInt = new BigInt("0B11110000");

      expect(bin1.equals(new BigInt(10))).assertTrue();
      expect(bin2.equals(new BigInt(240))).assertTrue();
      expect(bin1.toString(2)).assertEqual("1010");
    });

    /**
     * @tc.name  bigIntConstructorStringTest6600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6600
     * @tc.desc  Test constructor(d: string) with octal "0o755", "0O777"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const oct1: BigInt = new BigInt("0o755");
      const oct2: BigInt = new BigInt("0O777");

      expect(oct1.equals(new BigInt(493))).assertTrue();
      expect(oct2.equals(new BigInt(511))).assertTrue();
      expect(oct2.toString(8)).assertEqual("777");
    });

    /**
     * @tc.name  bigIntConstructorStringTest6700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6700
     * @tc.desc  Test constructor(d: string) with scientific notation "1e3", "-5e3", "1.5e3"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sci1: BigInt = new BigInt("1e3");
      const sci2: BigInt = new BigInt("-5e3");
      const sci3: BigInt = new BigInt("1.5e3");

      expect(sci1.equals(new BigInt(1000))).assertTrue();
      expect(sci2.equals(new BigInt(-5000))).assertTrue();
      expect(sci3.equals(new BigInt(1500))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorStringTest6800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6800
     * @tc.desc  Test constructor(d: string) with underscore separators "1_000_000_000"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "1_000_000_000";
      const bigIntValue: BigInt = new BigInt(str);

      expect(bigIntValue.equals(new BigInt(1000000000))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("1000000000");
    });

    /**
     * @tc.name  bigIntConstructorStringTest6900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_6900
     * @tc.desc  Test constructor(d: string) with extremely large number beyond Number range
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hugeStr: string = "1234567890123456789012345678901234567890";
      const bigIntValue: BigInt = new BigInt(hugeStr);

      expect(bigIntValue.toString()).assertEqual(hugeStr);
      expect(bigIntValue.operatorGreaterThan(new BigInt(Number.MAX_SAFE_INTEGER as double))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorStringTest7000
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_7000
     * @tc.desc  Test constructor(d: string) throws Error for non-integer string "123.456"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str: string = "123.456";

      try {
        new BigInt(str);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntConstructorStringTest7100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_7100
     * @tc.desc  Test constructor(d: string) throws Error for keyword strings "NaN", "Infinity", "-Infinity"
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        new BigInt("NaN");
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }

      try {
        new BigInt("Infinity");
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }

      try {
        new BigInt("-Infinity");
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntConstructorStringTest7200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_7200
     * @tc.desc  Test constructor(d: string) throws Error for strings with illegal characters (文档特殊字符检查)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      try {
        new BigInt("123abc");
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }

      try {
        new BigInt("0xGG");
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }

      try {
        new BigInt("abc");
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }

      try {
        new BigInt("12#34");
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntConstructorStringTest7300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_STRING_TEST_7300
     * @tc.desc  Test constructor(d: string) with leading zeros "000123" and whitespace-only "   "
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorStringTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const withZeros: BigInt = new BigInt("000123");
      expect(withZeros.equals(new BigInt(123))).assertTrue();
      expect(withZeros.toString()).assertEqual("123");

      const whitespaceOnly: BigInt = new BigInt("   ");
      expect(whitespaceOnly.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorBooleanTest7400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BOOLEAN_TEST_7400
     * @tc.desc  Test constructor(d: boolean) with true - verify value is 1n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBooleanTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: boolean = true;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(1))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("1");
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
    });

    /**
     * @tc.name  bigIntConstructorBooleanTest7500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BOOLEAN_TEST_7500
     * @tc.desc  Test constructor(d: boolean) with false - verify value is 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBooleanTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const val: boolean = false;
      const bigIntValue: BigInt = new BigInt(val);

      expect(bigIntValue.equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("0");
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
    });

    /**
     * @tc.name  bigIntConstructorBooleanTest7600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BOOLEAN_TEST_7600
     * @tc.desc  Test constructor(d: boolean) arithmetic: true + 1n = 2n, false + 1n = 1n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBooleanTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fromTrue: BigInt = new BigInt(true);
      const fromFalse: BigInt = new BigInt(false);

      expect(fromTrue.operatorAdd(new BigInt(1)).equals(new BigInt(2))).assertTrue();
      expect(fromFalse.operatorAdd(new BigInt(1)).equals(new BigInt(1))).assertTrue();
      expect(fromTrue.operatorMultiply(new BigInt(5)).equals(new BigInt(5))).assertTrue();
      expect(fromFalse.operatorMultiply(new BigInt(5)).equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorBooleanTest7700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BOOLEAN_TEST_7700
     * @tc.desc  Test constructor(d: boolean) bit operations: ~true = -2n, ~false = -1n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBooleanTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fromTrue: BigInt = new BigInt(true);
      const fromFalse: BigInt = new BigInt(false);

      expect(fromTrue.operatorBitwiseNot().equals(new BigInt(-2))).assertTrue();
      expect(fromFalse.operatorBitwiseNot().equals(new BigInt(-1))).assertTrue();
      expect(fromTrue.operatorBitwiseAnd(new BigInt(1)).equals(new BigInt(1))).assertTrue();
      expect(fromFalse.operatorBitwiseOr(new BigInt(1)).equals(new BigInt(1))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorBooleanTest7800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BOOLEAN_TEST_7800
     * @tc.desc  Test constructor(d: boolean) comparison with numeric BigInt and conversion methods
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBooleanTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fromTrue: BigInt = new BigInt(true);
      const fromFalse: BigInt = new BigInt(false);

      expect(fromTrue.operatorGreaterThan(fromFalse)).assertTrue();
      expect(fromFalse.operatorLessThan(fromTrue)).assertTrue();
      expect(fromTrue.operatorGreaterThanEqual(new BigInt(1))).assertTrue();

      expect(fromTrue.getLong()).assertEqual(1 as long);
      expect(fromFalse.getLong()).assertEqual(0 as long);
      expect(fromTrue.doubleValue()).assertEqual(1.0);
      expect(fromFalse.doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.name  bigIntConstructorBooleanTest7900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BOOLEAN_TEST_7900
     * @tc.desc  Test constructor(d: boolean) increment/decrement and pow operations
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBooleanTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const fromTrue: BigInt = new BigInt(true);
      const fromFalse: BigInt = new BigInt(false);

      expect(fromTrue.operatorIncrement().equals(new BigInt(2))).assertTrue();
      expect(fromFalse.operatorIncrement().equals(new BigInt(1))).assertTrue();
      expect(fromTrue.operatorDecrement().equals(new BigInt(0))).assertTrue();

      expect(fromTrue.pow(new BigInt(100)).equals(new BigInt(1))).assertTrue();
      expect(fromFalse.pow(new BigInt(5)).equals(new BigInt(0))).assertTrue();
      expect(fromFalse.pow(new BigInt(0)).equals(new BigInt(1))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorBigIntTest8000
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BIGINT_TEST_8000
     * @tc.desc  Test constructor(d: BigInt) with positive value - verify deep copy of positive BigInt
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBigIntTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(123456789);
      const copy: BigInt = new BigInt(original);

      expect(copy.equals(original)).assertTrue();
      expect(copy.toString()).assertEqual("123456789");
      expect(copy.positive()).assertTrue();
      expect(copy.negative()).assertFalse();
    });

    /**
     * @tc.name  bigIntConstructorBigIntTest8100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BIGINT_TEST_8100
     * @tc.desc  Test constructor(d: BigInt) with negative value - verify deep copy of negative BigInt
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBigIntTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(-987654321);
      const copy: BigInt = new BigInt(original);

      expect(copy.equals(original)).assertTrue();
      expect(copy.toString()).assertEqual("-987654321");
      expect(copy.negative()).assertTrue();
      expect(copy.positive()).assertFalse();
    });

    /**
     * @tc.name  bigIntConstructorBigIntTest8200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BIGINT_TEST_8200
     * @tc.desc  Test constructor(d: BigInt) with zero - verify copy of zero BigInt
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBigIntTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(0);
      const copy: BigInt = new BigInt(original);

      expect(copy.equals(original)).assertTrue();
      expect(copy.equals(new BigInt(0))).assertTrue();
      expect(copy.toString()).assertEqual("0");
      expect(copy.positive()).assertTrue();
      expect(copy.negative()).assertFalse();
    });

    /**
     * @tc.name  bigIntConstructorBigIntTest8300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BIGINT_TEST_8300
     * @tc.desc  Test constructor(d: BigInt) with huge number beyond long range - verify copy preserves value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBigIntTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hugeStr: string = "123456789012345678901234567890";
      const original: BigInt = new BigInt(hugeStr);
      const copy: BigInt = new BigInt(original);

      expect(copy.toString()).assertEqual(hugeStr);
      expect(copy.equals(original)).assertTrue();
      expect(copy.operatorGreaterThan(new BigInt(Number.MAX_SAFE_INTEGER as double))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorBigIntTest8400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BIGINT_TEST_8400
     * @tc.desc  Test constructor(d: BigInt) chain copy - verify copy of copy works correctly
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBigIntTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(99999);
      const copy1: BigInt = new BigInt(original);
      const copy2: BigInt = new BigInt(copy1);

      expect(copy2.equals(original)).assertTrue();
      expect(copy2.equals(copy1)).assertTrue();
      expect(copy2.getLong()).assertEqual(99999 as long);
    });

    /**
     * @tc.name  bigIntConstructorBigIntTest8500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_BIGINT_TEST_8500
     * @tc.desc  Test constructor(d: BigInt) copied instance operates independently in arithmetic
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorBigIntTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original: BigInt = new BigInt(100);
      const copy: BigInt = new BigInt(original);

      const modified: BigInt = copy.operatorAdd(new BigInt(50));

      expect(original.equals(new BigInt(100))).assertTrue();
      expect(copy.equals(new BigInt(100))).assertTrue();
      expect(modified.equals(new BigInt(150))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorFixedArrayTest8600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_FIXEDARRAY_TEST_8600
     * @tc.desc  Test constructor(v: FixedArray<int>, sign: int) with single element positive
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorFixedArrayTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: FixedArray<int> = new FixedArray<int>(1);
      bytes[0] = 42;
      const bigIntValue: BigInt = new BigInt(bytes, 1);

      expect(bigIntValue.equals(new BigInt(42))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("42");
    });

    /**
     * @tc.name  bigIntConstructorFixedArrayTest8700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_FIXEDARRAY_TEST_8700
     * @tc.desc  Test constructor(v: FixedArray<int>, sign: int) with single element negative
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorFixedArrayTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: FixedArray<int> = new FixedArray<int>(1);
      bytes[0] = 42;
      const bigIntValue: BigInt = new BigInt(bytes, -1);

      expect(bigIntValue.equals(new BigInt(-42))).assertTrue();
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.toString()).assertEqual("-42");
    });

    /**
     * @tc.name  bigIntConstructorFixedArrayTest8800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_FIXEDARRAY_TEST_8800
     * @tc.desc  Test constructor(v: FixedArray<int>, sign: int) with empty array results in zero
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorFixedArrayTest8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: FixedArray<int> = new FixedArray<int>(0);
      const bigIntValue: BigInt = new BigInt(bytes, 0);

      expect(bigIntValue.equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("0");
      expect(bigIntValue.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorFixedArrayTest8900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_FIXEDARRAY_TEST_8900
     * @tc.desc  Test constructor(v: FixedArray<int>, sign: int) strips leading zeros (trailing zeros in little-endian)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorFixedArrayTest8900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: FixedArray<int> = new FixedArray<int>(3);
      bytes[0] = 42;
      bytes[1] = 0;
      bytes[2] = 0;
      const bigIntValue: BigInt = new BigInt(bytes, 1);

      expect(bigIntValue.equals(new BigInt(42))).assertTrue();
      expect(bigIntValue.toString()).assertEqual("42");
    });

    /**
     * @tc.name  bigIntConstructorFixedArrayTest9000
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_FIXEDARRAY_TEST_9000
     * @tc.desc  Test constructor(v: FixedArray<int>, sign: int) with all zeros forces sign to 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorFixedArrayTest9000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: FixedArray<int> = new FixedArray<int>(2);
      bytes[0] = 0;
      bytes[1] = 0;
      const bigIntValue: BigInt = new BigInt(bytes, 1);

      expect(bigIntValue.equals(new BigInt(0))).assertTrue();
      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.negative()).assertFalse();
    });

    /**
     * @tc.name  bigIntConstructorFixedArrayTest9100
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_FIXEDARRAY_TEST_9100
     * @tc.desc  Test constructor(v: FixedArray<int>, sign: int) with multi-byte large value
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorFixedArrayTest9100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: FixedArray<int> = new FixedArray<int>(2);
      bytes[0] = 1;
      bytes[1] = 2;
      const bigIntValue: BigInt = new BigInt(bytes, 1);

      const expected: BigInt = new BigInt("8589934593");
      expect(bigIntValue.equals(expected)).assertTrue();
      expect(bigIntValue.toString()).assertEqual("8589934593");
    });

    /**
     * @tc.name  bigIntConstructorFixedArrayTest9200
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_FIXEDARRAY_TEST_9200
     * @tc.desc  Test constructor(v: FixedArray<int>, sign: int) with max uint32 single element and negative sign
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntConstructorFixedArrayTest9200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: FixedArray<int> = new FixedArray<int>(1);
      bytes[0] = -1;
      const bigIntValue: BigInt = new BigInt(bytes, -1);

      expect(bigIntValue.equals(new BigInt("-4294967295"))).assertTrue();
      expect(bigIntValue.negative()).assertTrue();
      expect(bigIntValue.toString(16).toLowerCase()).assertEqual("-ffffffff");
    });

    /**
     * @tc.name  bigIntConstructorPrecisionLossTest9300
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_PRECISION_LOSS_TEST_9300
     * @tc.desc  Test constructor from double beyond MAX_SAFE_INTEGER loses precision (9007199254740993 becomes 9007199254740992)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL1
     */
    it('bigIntConstructorPrecisionLossTest9300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const beyondSafe: double = 9007199254740993.0 as double;
      const bigIntValue: BigInt = new BigInt(beyondSafe);

      expect(bigIntValue.toString()).assertEqual("9007199254740992");
      expect(bigIntValue.equals(new BigInt("9007199254740992"))).assertTrue();
      expect(bigIntValue.equals(new BigInt("9007199254740993"))).assertFalse();
    });

    /**
     * @tc.name  bigIntConstructorPrecisionLossTest9400
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_PRECISION_LOSS_TEST_9400
     * @tc.desc  Test constructor from very large double loses precision (1e20 has limited precision)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('bigIntConstructorPrecisionLossTest9400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const largeDouble: double = 1e20 as double;
      const bigIntValue: BigInt = new BigInt(largeDouble);

      expect(bigIntValue.toString()).assertEqual("100000000000000000000");
      expect(bigIntValue.equals(new BigInt("100000000000000000000"))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorPrecisionLossTest9500
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_PRECISION_LOSS_TEST_9500
     * @tc.desc  Test constructor from double at precision boundary (2^53 = 9007199254740992) preserves value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('bigIntConstructorPrecisionLossTest9500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const atPrecisionBoundary: double = 9007199254740992.0 as double;
      const bigIntValue: BigInt = new BigInt(atPrecisionBoundary);

      expect(bigIntValue.toString()).assertEqual("9007199254740992");
      expect(bigIntValue.equals(new BigInt("9007199254740992"))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorPrecisionLossTest9600
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_PRECISION_LOSS_TEST_9600
     * @tc.desc  Test constructor from double 2^53 + 2 is representable but 2^53 + 1 is not
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('bigIntConstructorPrecisionLossTest9600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const two53Plus2: double = 9007199254740994.0 as double;
      const bigIntValue: BigInt = new BigInt(two53Plus2);

      expect(bigIntValue.toString()).assertEqual("9007199254740994");
      expect(bigIntValue.equals(new BigInt("9007199254740994"))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorPrecisionLossTest9700
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_PRECISION_LOSS_TEST_9700
     * @tc.desc  Test constructor from negative double beyond MIN_SAFE_INTEGER loses precision
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('bigIntConstructorPrecisionLossTest9700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const negBeyondSafe: double = -9007199254740993.0 as double;
      const bigIntValue: BigInt = new BigInt(negBeyondSafe);

      expect(bigIntValue.toString()).assertEqual("-9007199254740992");
      expect(bigIntValue.equals(new BigInt("-9007199254740992"))).assertTrue();
      expect(bigIntValue.equals(new BigInt("-9007199254740993"))).assertFalse();
    });

    /**
     * @tc.name  bigIntConstructorPrecisionLossTest9800
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_PRECISION_LOSS_TEST_9800
     * @tc.desc  Test constructor from Number.MAX_VALUE results in approximate value due to precision loss
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('bigIntConstructorPrecisionLossTest9800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxVal: double = 1.7976931348623157e+308 as double;
      const bigIntValue: BigInt = new BigInt(maxVal);

      expect(bigIntValue.positive()).assertTrue();
      expect(bigIntValue.operatorGreaterThan(new BigInt("100000000000000000000000000000000000000"))).assertTrue();
    });

    /**
     * @tc.name  bigIntConstructorPrecisionLossTest9900
     * @tc.number  SUB_BUILTINS_BIGINT_CONSTRUCTOR_PRECISION_LOSS_TEST_9900
     * @tc.desc  Test string constructor preserves full precision for numbers beyond double range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('bigIntConstructorPrecisionLossTest9900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const preciseStr: string = "1234567890123456789012345678901234567890";
      const fromString: BigInt = new BigInt(preciseStr);

      expect(fromString.toString()).assertEqual(preciseStr);

      const beyondDoubleRange: string = "99999999999999999999999999999999999999999999999999";
      const hugeBigInt: BigInt = new BigInt(beyondDoubleRange);
      expect(hugeBigInt.toString()).assertEqual(beyondDoubleRange);
    });

  });
};