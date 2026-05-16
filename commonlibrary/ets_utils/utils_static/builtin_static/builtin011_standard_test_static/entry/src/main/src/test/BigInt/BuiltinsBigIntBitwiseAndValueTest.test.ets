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

export default function BuiltinsBigIntBitwiseAndValueTest(): void {
  describe('BuiltinsBigIntBitwiseAndValueTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.name  bigIntValueOfTest0100
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0100
     * @tc.desc  Test valueOf() returns same instance for positive number constructed BigInt - verify reference equality
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const original: BigInt = new BigInt(100);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(100))).assertTrue();
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0200
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0200
     * @tc.desc  Test valueOf() with zero value (boundary) - verify reference equality and zero state
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const original: BigInt = new BigInt(0);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(0))).assertTrue();
      expect(result.getLong()).assertEqual(0);
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0300
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0300
     * @tc.desc  Test valueOf() with negative value - verify sign preservation and reference equality
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const original: BigInt = new BigInt(-999);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.negative()).assertTrue();
      expect(result.equals(new BigInt(-999))).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0400
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0400
     * @tc.desc  Test valueOf() with large number from string (exceeds Number.MAX_SAFE_INTEGER boundary)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const largeStr: string = "18446744073709551616";
      const original: BigInt = new BigInt(largeStr);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(largeStr))).assertTrue();
      expect(result.toString()).assertEqual(largeStr);
    });

    /**
     * @tc.name  bigIntValueOfTest0500
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0500
     * @tc.desc  Test valueOf() with boolean true constructed BigInt - verify value preservation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const original: BigInt = new BigInt(true);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(1))).assertTrue();
      expect(result.getLong()).assertEqual(1);
    });

    /**
     * @tc.name  bigIntValueOfTest0600
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0600
     * @tc.desc  Test valueOf() with boolean false constructed BigInt - verify zero equivalence
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const original: BigInt = new BigInt(false);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(0))).assertTrue();
      expect(result.equals(new BigInt(false))).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0700
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0700
     * @tc.desc  Test valueOf() with Long.MAX_VALUE (9223372036854775807) - verify upper boundary preservation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const maxLong: Long = Long.MAX_VALUE;
      const original: BigInt = new BigInt(maxLong);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.getLong()).assertEqual(maxLong);
      expect(result.equals(new BigInt("9223372036854775807"))).assertTrue();
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntValueOfTest0800
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0800
     * @tc.desc  Test valueOf() with Long.MIN_VALUE (-9223372036854775808) - verify lower boundary and negative sign
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const minLong: Long = Long.MIN_VALUE;
      const original: BigInt = new BigInt(minLong);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.negative()).assertTrue();
      expect(result.equals(new BigInt("-9223372036854775808"))).assertTrue();
      expect(result.getLong()).assertEqual(minLong);
    });

    /**
     * @tc.name  bigIntValueOfTest0900
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_0900
     * @tc.desc  Test valueOf() with double constructor (integer value 123.0) - verify type conversion stability
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const doubleVal: Double = 123.0;
      const original: BigInt = new BigInt(doubleVal);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(123))).assertTrue();
      expect(result.getLong()).assertEqual(123);
    });

    /**
     * @tc.name  bigIntValueOfTest1000
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_1000
     * @tc.desc  Test valueOf() with hexadecimal string constructor (0xFF) - verify radix parsing preservation
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const hexStr: string = "0xFF";
      const original: BigInt = new BigInt(hexStr);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(255))).assertTrue();
      expect(result.toString(16).toLowerCase()).assertEqual("ff");
    });

    /**
     * @tc.name  bigIntValueOfTest1100
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_1100
     * @tc.desc  Test valueOf() with negative zero (-0) - verify sign normalization to positive zero
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const negZero: Double = -0.0;
      const original: BigInt = new BigInt(negZero);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(new BigInt(0))).assertTrue();
      expect(result.positive()).assertTrue();
      expect(result.negative()).assertFalse();
    });

    /**
     * @tc.name  bigIntValueOfTest1200
     * @tc.number  SUB_BUILTINS_BIGINT_VALUEOF_TEST_1200
     * @tc.desc  Test valueOf() with BigInt copy constructor - verify reference equality on copied instance
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntValueOfTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const source: BigInt = new BigInt("999999999999999999999");
      const original: BigInt = new BigInt(source);
      const result: BigInt = original.valueOf();

      expect(result === original).assertTrue();
      expect(result.equals(source)).assertTrue();
      expect(result.toString()).assertEqual("999999999999999999999");
    });

    /**
     * @tc.name  bigIntAsIntNTest1300
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1300
     * @tc.desc  Test asIntN(bits: long, num: BigInt) with bits=0 - returns 0n regardless of num
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(999);
      const result: BigInt = BigInt.asIntN(Double.toLong(0), num);

      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest1400
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1400
     * @tc.desc  Test asIntN(bits: long, num: BigInt) with num=0 - returns 0n regardless of bits
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const zero: BigInt = new BigInt(0);
      const result: BigInt = BigInt.asIntN(Double.toLong(64), zero);

      expect(result.equals(zero)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest1500
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1500
     * @tc.desc  Test asIntN(bits: long, num: BigInt) with bits<0 - throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      try {
        BigInt.asIntN(Double.toLong(-1), num);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
        const err: RangeError = e as RangeError;
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.name  bigIntAsIntNTest1600
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1600
     * @tc.desc  Test asIntN(bits: long, num: BigInt) with bits exceeding Double.MAX_SAFE_INTEGER - throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      const tooLargeBits: Long = Double.toLong(9007199254740992);
      try {
        BigInt.asIntN(tooLargeBits, num);
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof RangeError).assertTrue();
      }
    });

    /**
     * @tc.name  bigIntAsIntNTest1700
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1700
     * @tc.desc  Test asIntN(bits: long, num: BigInt) when bits > num.bitLength - returns num unchanged
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(255);
      const result: BigInt = BigInt.asIntN(Double.toLong(16), num);

      expect(result.equals(num)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest1800
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1800
     * @tc.desc  Test asIntN(8, num) with byte boundary values - 127 (max) and -128 (min)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const maxByte: BigInt = new BigInt(127);
      const minByte: BigInt = new BigInt(-128);

      const resultMax: BigInt = BigInt.asIntN(Double.toLong(8), maxByte);
      const resultMin: BigInt = BigInt.asIntN(Double.toLong(8), minByte);

      expect(resultMax.equals(maxByte)).assertTrue();
      expect(resultMin.equals(minByte)).assertTrue();
      expect(resultMax.getLong()).assertEqual(127);
      expect(resultMin.getLong()).assertEqual(-128);
    });

    /**
     * @tc.name  bigIntAsIntNTest1900
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_1900
     * @tc.desc  Test asIntN(8, num) with overflow truncation - 255 becomes -1 (signed interpretation)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const overflowVal: BigInt = new BigInt(255);
      const result: BigInt = BigInt.asIntN(Double.toLong(8), overflowVal);

      expect(result.equals(new BigInt(-1))).assertTrue();
      expect(result.getLong()).assertEqual(-1);
      expect(result.negative()).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2000
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2000
     * @tc.desc  Test asIntN(16, num) with short boundary values - 32767 and -32768
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const maxShort: BigInt = new BigInt(32767);
      const minShort: BigInt = new BigInt(-32768);
      const overflowShort: BigInt = new BigInt(65535);

      expect(BigInt.asIntN(Double.toLong(16), maxShort).equals(maxShort)).assertTrue();
      expect(BigInt.asIntN(Double.toLong(16), minShort).equals(minShort)).assertTrue();
      expect(BigInt.asIntN(Double.toLong(16), overflowShort).equals(new BigInt(-1))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2100
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2100
     * @tc.desc  Test asIntN(32, num) with int boundary values - 2147483647 and -2147483648
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const maxInt: BigInt = new BigInt(2147483647);
      const minInt: BigInt = new BigInt(-2147483648);
      const largeNum: BigInt = new BigInt("2147483648");

      expect(BigInt.asIntN(Double.toLong(32), maxInt).equals(maxInt)).assertTrue();
      expect(BigInt.asIntN(Double.toLong(32), minInt).equals(minInt)).assertTrue();
      expect(BigInt.asIntN(Double.toLong(32), largeNum).equals(minInt)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2200
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2200
     * @tc.desc  Test asIntN(64, num) with long boundary values and wrap-around
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const maxLong: BigInt = new BigInt("9223372036854775807");
      const minLong: BigInt = new BigInt("-9223372036854775808");
      const overflowLong: BigInt = new BigInt("9223372036854775808");

      expect(BigInt.asIntN(Double.toLong(64), maxLong).equals(maxLong)).assertTrue();
      expect(BigInt.asIntN(Double.toLong(64), minLong).equals(minLong)).assertTrue();
      expect(BigInt.asIntN(Double.toLong(64), overflowLong).equals(minLong)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2300
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2300
     * @tc.desc  Test asIntN with large num exceeding bits - verify modulo 2^bits behavior for positive
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt("12345678901234567890");
      const result: BigInt = BigInt.asIntN(Double.toLong(8), num);

      expect(result.equals(new BigInt(-46))).assertTrue();
      expect(result.getLong()).assertEqual(-46);
    });

    /**
     * @tc.name  bigIntAsIntNTest2400
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2400
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with integral Number - verify consistency with long version
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(255);
      const bitsNum: number = 8;
      const resultNum: BigInt = BigInt.asIntN(Number.toLong(bitsNum), num);
      const resultLong: BigInt = BigInt.asIntN(Double.toLong(8), num);

      expect(resultNum.equals(resultLong)).assertTrue();
      expect(resultNum.equals(new BigInt(-1))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2500
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2500
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with positive fractional Number (8.9) - verify truncation toward zero
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(255);
      const bitsNum: number = 8.9;
      const result: BigInt = BigInt.asIntN(Double.toLong(bitsNum), num);
      expect(result.equals(new BigInt(-1))).assertTrue();
      expect(result.equals(BigInt.asIntN(Double.toLong(8), num))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2600
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2600
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with negative fractional Number (-8.9) - truncates to -8 and throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(255);
      const bitsNum: number = -8.9;
      let thrown: boolean = false;

      try {
        BigInt.asIntN(Double.toLong(bitsNum), num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2700
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2700
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with Number.MAX_SAFE_INTEGER boundary
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      const maxSafe: number = 9007199254740991;
      const result: BigInt = BigInt.asIntN(Number.toLong(maxSafe), num);
      expect(result.equals(num)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2800
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2800
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with NaN - verify toLong() conversion results in bits=0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(999);
      const nanBits: number = NaN;
      const result: BigInt = BigInt.asIntN(Number.toLong(nanBits), num);
      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest2900
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_2900
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with Infinity - throws RangeError (exceeds MAX_SAFE_INTEGER)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      const infBits: number = Infinity;
      let thrown: boolean = false;

      try {
        BigInt.asIntN(Number.toLong(infBits), num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest3000
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_3000
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with -Infinity - throws RangeError (exceeds limit or bits<0)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      const negInfBits: number = -Infinity;
      let thrown: boolean = false;

      try {
        BigInt.asIntN(Number.toLong(negInfBits), num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsIntNTest3100
     * @tc.number  SUB_BUILTINS_BIGINT_ASINTN_TEST_3100
     * @tc.desc  Test asIntN(bits: Number, num: BigInt) with -0 - treated as bits=0, returns 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsIntNTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(999);
      const negZeroBits: number = -0;
      const result: BigInt = BigInt.asIntN(Number.toLong(negZeroBits), num);
      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3200
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3200
     * @tc.desc  Test asUintN(bits: long, num: BigInt) with bits=0 - returns 0n regardless of num
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(999);
      const result: BigInt = BigInt.asUintN(Double.toLong(0), num);

      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3300
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3300
     * @tc.desc  Test asUintN(bits: long, num: BigInt) with num=0 - returns 0n regardless of bits
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const zero: BigInt = new BigInt(0);
      const result: BigInt = BigInt.asUintN(Double.toLong(64), zero);

      expect(result.equals(zero)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3400
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3400
     * @tc.desc  Test asUintN(bits: long, num: BigInt) with bits<0 - throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      let thrown: boolean = false;

      try {
        BigInt.asUintN(Double.toLong(-1), num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3500
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3500
     * @tc.desc  Test asUintN(bits: long, num: BigInt) with bits exceeding Double.MAX_SAFE_INTEGER - throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      const tooLargeBits: Long = Double.toLong(9007199254740992);
      let thrown: boolean = false;

      try {
        BigInt.asUintN(tooLargeBits, num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3600
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3600
     * @tc.desc  Test asUintN(bits: long, num: BigInt) when bits sufficient and num positive - returns num unchanged
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(255);
      const result: BigInt = BigInt.asUintN(Double.toLong(16), num);

      expect(result.equals(num)).assertTrue();
      expect(result.positive()).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3700
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3700
     * @tc.desc  Test asUintN(8, num) with Uint8 boundary - 0, 255 (max), 256 wraps to 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const min: BigInt = new BigInt(0);
      const max: BigInt = new BigInt(255);
      const overflow: BigInt = new BigInt(256);

      expect(BigInt.asUintN(Double.toLong(8), min).equals(min)).assertTrue();
      expect(BigInt.asUintN(Double.toLong(8), max).equals(max)).assertTrue();
      expect(BigInt.asUintN(Double.toLong(8), overflow).equals(min)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3800
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3800
     * @tc.desc  Test asUintN(16, num) with Uint16 boundary - 65535 (max), 65536 wraps to 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const max: BigInt = new BigInt(65535);
      const overflow: BigInt = new BigInt(65536);

      expect(BigInt.asUintN(Double.toLong(16), max).equals(max)).assertTrue();
      expect(BigInt.asUintN(Double.toLong(16), overflow).equals(new BigInt(0))).assertTrue();
      expect(BigInt.asUintN(Double.toLong(16), new BigInt(65537)).equals(new BigInt(1))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest3900
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_3900
     * @tc.desc  Test asUintN(32, num) with Uint32 boundary - 4294967295 (max), 4294967296 wraps to 0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const max: BigInt = new BigInt("4294967295");
      const overflow: BigInt = new BigInt("4294967296");

      expect(BigInt.asUintN(Double.toLong(32), max).equals(max)).assertTrue();
      expect(BigInt.asUintN(Double.toLong(32), overflow).equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4000
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4000
     * @tc.desc  Test asUintN(64, num) with negative number - verify two's complement wrap to large positive (ulong behavior)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const negOne: BigInt = new BigInt(-1);
      const negLong: BigInt = new BigInt("-9223372036854775808");

      expect(BigInt.asUintN(Double.toLong(64), negOne).equals(new BigInt("18446744073709551615"))).assertTrue();
      expect(BigInt.asUintN(Double.toLong(64), negLong).equals(new BigInt("9223372036854775808"))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4100
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4100
     * @tc.desc  Test asUintN with large num exceeding bits - verify modulo 2^bits behavior (mask operation)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const largeNum: BigInt = new BigInt("12345678901234567890");
      const result: BigInt = BigInt.asUintN(Double.toLong(8), largeNum);

      expect(result.equals(new BigInt(210))).assertTrue();
      expect(result.positive()).assertTrue();
      expect(result.getLong()).assertEqual(210);
    });

    /**
     * @tc.name  bigIntAsUintNTest4200
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4200
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with integral Number - verify consistency with long version
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(255);
      const bitsNum: number = 8;
      const resultNum: BigInt = BigInt.asUintN(Number.toLong(bitsNum), num);
      const resultLong: BigInt = BigInt.asUintN(Double.toLong(8), num);

      expect(resultNum.equals(resultLong)).assertTrue();
      expect(resultNum.equals(new BigInt(255))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4300
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4300
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with positive fractional Number (8.9) - verify truncation toward zero
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(300);
      const bitsNum: number = 8.9;
      const result: BigInt = BigInt.asUintN(Double.toLong(bitsNum), num);
      expect(result.equals(new BigInt(44))).assertTrue();
      expect(result.equals(BigInt.asUintN(Double.toLong(8), num))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4400
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4400
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with negative fractional Number (-8.9) - truncates to -8 and throws RangeError
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      const bitsNum: number = -8.9;
      let thrown: boolean = false;

      try {
        BigInt.asUintN(Double.toLong(bitsNum), num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4500
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4500
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with Number.MAX_SAFE_INTEGER boundary
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      const maxSafe: number = 9007199254740991;
      const result: BigInt = BigInt.asUintN(Number.toLong(maxSafe), num);
      expect(result.equals(num)).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4600
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4600
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with NaN - verify toLong() conversion results in bits=0
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(999);
      const nanBits: number = NaN;
      const result: BigInt = BigInt.asUintN(Number.toLong(nanBits), num);
      expect(result.equals(new BigInt(0))).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4700
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4700
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with Infinity - throws RangeError (exceeds MAX_SAFE_INTEGER)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      const infBits: number = Infinity;
      let thrown: boolean = false;

      try {
        BigInt.asUintN(Number.toLong(infBits), num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4800
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4800
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with -Infinity - throws RangeError (exceeds limit or bits<0)
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(100);
      const negInfBits: number = -Infinity;
      let thrown: boolean = false;

      try {
        BigInt.asUintN(Number.toLong(negInfBits), num);
      } catch (e) {
        thrown = true;
        expect(e instanceof RangeError).assertTrue();
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.name  bigIntAsUintNTest4900
     * @tc.number  SUB_BUILTINS_BIGINT_ASUINTN_TEST_4900
     * @tc.desc  Test asUintN(bits: Number, num: BigInt) with -0 - treated as bits=0, returns 0n
     * @tc.type  FUNCTION
     * @tc.size  SMALLTEST
     * @tc.level LEVEL0
     */
    it('bigIntAsUintNTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const num: BigInt = new BigInt(999);
      const negZeroBits: number = -0;
      const result: BigInt = BigInt.asUintN(Number.toLong(negZeroBits), num);
      expect(result.equals(new BigInt(0))).assertTrue();
    });
  });
}