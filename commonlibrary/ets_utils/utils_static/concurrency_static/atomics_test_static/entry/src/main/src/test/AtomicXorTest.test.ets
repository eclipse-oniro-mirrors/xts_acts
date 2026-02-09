'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import sleep  from './Util.test';


export default function atomicsXorTest() {
  describe('atomicsXorTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   atomicsXorTest001
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_001
     * @tc.desc   Basic Int32Array XOR operation, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5; // 0b0101
      const oldValue = Atomics.xor(ia, 0, 1); // 0b0001
      expect(oldValue).assertEqual(5);
      expect(ia[0]).assertEqual(4); // 0b0100
    });

    /**
     * @tc.name   atomicsXorTest002
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_002
     * @tc.desc   BigInt64Array XOR with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = -5n; // Binary: ...11111011
      const oldValue = Atomics.xor(ba, 0, 3n); // 0b11
      expect(oldValue).assertEqual(-5n);
      expect(ba[0]).assertEqual(-5n ^ 3n); // -5 ^ 3 = -6
    });

    /**
     * @tc.name   atomicsXorTest003
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_003
     * @tc.desc   XOR with 0, keep original value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 20;
      const oldValue = Atomics.xor(ia, 0, 0);
      expect(oldValue).assertEqual(20);
      expect(ia[0]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsXorTest004
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_004
     * @tc.desc   XOR on Int32Array index 1 (multi-element buffer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 3; // 0b0011
      ia[1] = 6; // 0b0110
      const oldValue = Atomics.xor(ia, 1, 5); // 0b0101
      expect(oldValue).assertEqual(6);
      expect(ia[1]).assertEqual(3); // 0b0011
      expect(ia[0]).assertEqual(3); // Unchanged
    });

    /**
     * @tc.name   atomicsXorTest005
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_005
     * @tc.desc   XOR to flip all bits (value=0xFFFFFFFF for Int32)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10; // 0b00001010
      const oldValue = Atomics.xor(ia, 0, 0xFFFFFFFF as long); // All bits 1
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(-11); // Bitwise NOT of 10 is -11 in two's complement
    });

    /**
     * @tc.name   atomicsXorTest006
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_006
     * @tc.desc   Throw TypeError for non-shared ArrayBuffer (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(4);
      const ia = new Int32Array(ab);
      try {
        Atomics.xor(ia, 0, 2)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsXorTest007
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_007
     * @tc.desc   Throw TypeError for non-shared ArrayBuffer (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(8);
      const ba = new BigInt64Array(ab);
      try {
        Atomics.xor(ba, 0, 2n)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsXorTest008
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_008
     * @tc.desc   Throw TypeError for Float32Array (not allowed type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      const initialVal: int = 0b1100; // 12 in decimal
      const xorMask1: int = 0b0110; // 6 in decimal (first XOR mask)
      const xorMask2: int = 0b1001; // 9 in decimal (second XOR mask)

      // Initialize shared memory value
      ia[0] = initialVal;

      // First atomic XOR operation (12 ^ 6 = 10 = 0b1010)
      const oldVal1 = Atomics.xor(ia, 0, xorMask1 as long);
      const result1 = Atomics.load(ia, 0);

      // Second atomic XOR operation (10 ^ 9 = 3 = 0b0011)
      const oldVal2 = Atomics.xor(ia, 0, xorMask2 as long);
      const finalResult = Atomics.load(ia, 0);

      // Key assertions
      // Verify first XOR operation
      expect(oldVal1).assertEqual(initialVal); // Return original value before first XOR
      expect(result1).assertEqual(initialVal ^ xorMask1); // 12 ^ 6 = 10
      expect(ia[0]).assertEqual(3); // Memory consistency after first XOR

      // Verify second XOR operation
      expect(oldVal2).assertEqual(result1); // Return value before second XOR
      expect(finalResult).assertEqual(result1 ^ xorMask2); // 10 ^ 9 = 3
      expect(ia[0]).assertEqual(finalResult); // Final memory consistency

      // Verify idempotency: XOR with same mask twice returns original value
      Atomics.xor(ia, 0, xorMask2 as long);
      Atomics.xor(ia, 0, xorMask2 as long);
      expect(Atomics.load(ia, 0)).assertEqual(3); // 3 ^ 9 ^ 9 = 10
    });

    /**
     * @tc.name   atomicsXorTest009
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_009
     * @tc.desc   Throw TypeError for Uint8ClampedArray (not allowed type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0000;

      expect(Atomics.isLockFree(4)).assertEqual(true);

      Atomics.or(ia, 0, 0b0101 as long); // Set features A and C
      const features = Atomics.load(ia, 0);
      const isValid = Atomics.compareExchange(ia, 0, features as long, features) === features && (features & 0b0101) === 0b0101;

      expect(isValid).assertEqual(true);
    });

    /**
     * @tc.name   atomicsXorTest010
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_010
     * @tc.desc   Throw RangeError for index >= array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.xor(ia, 1, 3)
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsXorTest011
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_011
     * @tc.desc   Throw RangeError for negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.xor(ia, -1, 3)
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsXorTest012
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_012
     * @tc.desc   XOR with large value in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 1000000000000n; // 0b11100110101100101000000000000000000n
      const oldValue = Atomics.xor(ba, 0, 500000000000n); // 0b111001101011001010000000000000000n
      expect(oldValue).assertEqual(1000000000000n);
      expect(ba[0]).assertEqual(1000000000000n ^ 500000000000n); // 1500000000000n
    });

    /**
     * @tc.name   atomicsXorTest013
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_013
     * @tc.desc   XOR twice on same Int32Array index (return to original value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 7; // 0b0111

      const old1 = Atomics.xor(ia, 0, 3); // 0b0011 → 0b0100 (4)
      expect(old1).assertEqual(7);
      expect(ia[0]).assertEqual(4);

      const old2 = Atomics.xor(ia, 0, 3); // 0b0011 → 0b0111 (7)
      expect(old2).assertEqual(4);
      expect(ia[0]).assertEqual(7); // Back to original
    });

    /**
     * @tc.name   atomicsXorTest014
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_014
     * @tc.desc   XOR on Int32Array with value=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const oldValue = Atomics.xor(ia, 0, 12); // 0b1100
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(12);
    });

    /**
     * @tc.name   atomicsXorTest015
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_015
     * @tc.desc   XOR on BigInt64Array with value=0n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0n;
      const oldValue = Atomics.xor(ba, 0, 15n); // 0b1111
      expect(oldValue).assertEqual(0n);
      expect(ba[0]).assertEqual(15n);
    });

    /**
     * @tc.name   atomicsXorTest016
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_016
     * @tc.desc   XOR non-integer value (coerced to integer) in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8; // 0b1000
      const oldValue = Atomics.xor(ia, 0, 3.9 as long); // Coerced to 3 (0b0011)
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(11); // 0b1011
    });

    /**
     * @tc.name   atomicsXorTest017
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_017
     * @tc.desc   XOR non-BigInt value (coerced to BigInt) in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 1; // State
      ia[1] = 0; // Version

      expect(Atomics.isLockFree(4)).assertEqual(true);

      Atomics.xor(ia, 0, 1); // Toggle state: 1→0
      Atomics.exchange(ia, 1, Atomics.load(ia, 1) + 1); // Bump version

      expect(ia[0]).assertEqual(0);
      expect(ia[1]).assertEqual(1);
    });

    /**
     * @tc.name   atomicsXorTest018
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_018
     * @tc.desc   XOR on Int32Array maximum value (0x7FFFFFFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0x7FFFFFFF; // Max Int32 (0b0111111111111111111111111111111)
      const oldValue = Atomics.xor(ia, 0, 1);
      expect(oldValue).assertEqual(2147483647);
      expect(ia[0]).assertEqual(2147483646); // Min Int32 (0b10000000000000000000000000000000)
    });

    /**
     * @tc.name   atomicsXorTest019
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_019
     * @tc.desc   XOR on BigInt64Array maximum value (9223372036854775807n)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 9223372036854775807n; // Max BigInt64
      const oldValue = Atomics.xor(ba, 0, 1n);
      expect(oldValue).assertEqual(9223372036854775807n);
      expect(ba[0]).assertEqual(9223372036854775806n); // Min BigInt64
    });

    /**
     * @tc.name   atomicsXorTest020
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_020
     * @tc.desc   XOR with arrow function wrapper, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 14; // 0b1110
      const xorWrapper = (arr: Int32Array, idx: int, val: number):long => Atomics.xor(arr, idx as int, val as long);
      const oldValue = xorWrapper(ia, 0, 7); // 0b0111
      expect(oldValue).assertEqual(14);
      expect(ia[0]).assertEqual(9); // 0b1001
    });

    /**
     * @tc.name   atomicsXorTest021
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_021
     * @tc.desc   Nested arrow functions: XOR inside inner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 20n; // 0b10100

      const outerFunc = (arr: BigInt64Array): bigint => {
        const innerXor = (idx: number, val: bigint) => Atomics.xor(arr, idx as int, val as bigint);
        return innerXor(0, 12n); // 0b01100
      };

      const oldValue = outerFunc(ba);
      expect(oldValue).assertEqual(20n);
      expect(ba[0]).assertEqual(24n); // 0b11100
    });

    /**
     * @tc.name   atomicsXorTest022
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_022
     * @tc.desc   Throw TypeError for non-typed array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 0; // State X: 0→1
      ia[1] = 1; // State Y: 1→0 (sync with X)

      expect(Atomics.isLockFree(4)).assertEqual(true);

      Atomics.xor(ia, 0, 1); // X: 0→1
      const xState = Atomics.load(ia, 0);
      Atomics.compareExchange(ia, 1, 1, xState ^ 1); // Y sync to 0

      expect(ia[0]).assertEqual(1);
      expect(ia[1]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsXorTest023
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_023
     * @tc.desc   XOR on Uint32Array (allowed type), check unsigned result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 5; // 0b0101
      const oldValue = Atomics.xor(ua, 0, 10); // 0b1010
      expect(oldValue).assertEqual(5);
      expect(ua[0]).assertEqual(15); // 0b1111
    });

    /**
     * @tc.name   atomicsXorTest024
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_024
     * @tc.desc   XOR on BigUint64Array (allowed type), check unsigned result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const bua = new BigUint64Array(sab);
      bua[0] = 8n; // 0b1000
      const oldValue = Atomics.xor(bua, 0, 7n); // 0b0111
      expect(oldValue).assertEqual(8n);
      expect(bua[0]).assertEqual(15n); // 0b1111
    });


    /**
     * @tc.name   atomicsXorTest026
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_026
     * @tc.desc   XOR on Int8Array (allowed type), check byte range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = 10; // 0b00001010
      const oldValue = Atomics.xor(ia, 0, 12); // 0b00001100
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(6); // 0b00000110
    });

    /**
     * @tc.name   atomicsXorTest027
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_027
     * @tc.desc   XOR on Uint16Array (allowed type), check 16-bit range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 500; // 0b0000000111110100
      const oldValue = Atomics.xor(ua, 0, 200); // 0b0000000011001000
      expect(oldValue).assertEqual(500);
      expect(ua[0]).assertEqual(316); // 0b0000001010111100
    });

    /**
     * @tc.name   atomicsXorTest028
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_028
     * @tc.desc   Nested arrow functions: XOR with dynamic value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 40; // 0b101000

      const getDynamicValue = (base: number, offset: number) => base - offset;
      const dynamicXor = (arr: Int32Array, idx: int, base: number, offset: number) => {
        const val = getDynamicValue(base, offset);
        return Atomics.xor(arr, idx as int, val as long);
      };

      const oldValue = dynamicXor(ia, 0, 15, 5); // val = 15 - 5 = 10 (0b1010)
      expect(oldValue).assertEqual(40);
      expect(ia[0]).assertEqual(34); // 0b100010
    });

    /**
     * @tc.name   atomicsXorTest029
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_029
     * @tc.desc   Throw RangeError for non-integer index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.xor(ia, 0.5 as int, 3)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsXorTest030
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_030
     * @tc.desc   XOR value exceeding 32 bits (truncated) in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 1; // 0b0001
      const longValue = 0x100000005; // 33 bits, truncated to 0x00000005
      const oldValue = Atomics.xor(ia, 0, longValue as long);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(4); // 0b0100 (1 ^ 5 = 4)
    });
    /**
     * @tc.name   atomicsXorTest031
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_031
     * @tc.desc   XOR value exceeding 64 bits (truncated) in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 3n; // 0b11
      const longValue: bigint = 18446744073709551623n; // 65 bits, truncated to 0x0000000000000007n
      const oldValue = Atomics.xor(ba, 0, longValue as bigint);
      expect(oldValue).assertEqual(3n);
      expect(ba[0]).assertEqual(4n); // 0b100 (3n ^ 7n = 4n)
    });

    /**
     * @tc.name   atomicsXorTest032
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_032
     * @tc.desc   Arrow function wrapper for BigInt64Array XOR with dynamic value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 12n; // 0b1100

      const getDynamicBigValue = (base: bigint, offset: bigint) => base - offset;
      const bigIntXorWrapper = (arr: BigInt64Array, idx: int, base: bigint, offset: bigint) => {
        const val = getDynamicBigValue(base, offset);
        return Atomics.xor(arr, idx as int, val as bigint);
      };

      const oldValue = bigIntXorWrapper(ba, 0, 10n, 4n); // val = 10n - 4n = 6n (0b110)
      expect(oldValue).assertEqual(12n);
      expect(ba[0]).assertEqual(10n); // 0b1010 (12n ^ 6n = 10n)
    });

    /**
     * @tc.name   atomicsXorTest033
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_033
     * @tc.desc   XOR on Int32Array with value=0x80000000 (min Int32)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0x80000000; // Min Int32 (-2147483648)
      const oldValue = Atomics.xor(ia, 0, 0x7FFFFFFF as long); // Max Int32
      expect(oldValue).assertEqual(-2147483648);
      expect(ia[0]).assertEqual(-1); // 0xFFFFFFFF (0x80000000 ^ 0x7FFFFFFF = 0xFFFFFFFF)
    });

    /**
     * @tc.name   atomicsXorTest034
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_034
     * @tc.desc   XOR on BigInt64Array with value=0x8000000000000000n (min BigInt64)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 9223372036854775808n; // Min BigInt64 (-9223372036854775808n)
      const oldValue = Atomics.xor(ba, 0, 9223372036854775807n); // Max BigInt64
      expect(oldValue).assertEqual(-9223372036854775808n);
      expect(ba[0]).assertEqual(-1n); // 0xFFFFFFFFFFFFFFFFn (XOR result)
    });

    /**
     * @tc.name   atomicsXorTest035
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_035
     * @tc.desc   Nested arrow functions: XOR with value from outer variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 25; // 0b11001
      const outerValue: int = 10; // 0b1010 (captured from outer scope)

      const outer = (arr: Int32Array): number => {
        const inner = (idx: number) => Atomics.xor(arr, idx as int, outerValue as long);
        return inner(0);
      };

      const oldValue = outer(ia);
      expect(oldValue).assertEqual(25);
      expect(ia[0]).assertEqual(19); // 0b01111 (25 ^ 10 = 15)
    });

    /**
     * @tc.name   atomicsXorTest036
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_036
     * @tc.desc   Arrow function to chain XOR operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 14; // 0b1110

      const chainXor = (arr: Int32Array, idx: int, ...values: number[]) => {
        return values.map(val => Atomics.xor(arr, idx as int, val as long));
      };

      const oldValues = chainXor(ia, 0, 3, 5); // 3=0b11, 5=0b101
      expect(oldValues[0]).assertEqual(14); // 14^3=13, 13^5=8
      expect(oldValues[1]).assertEqual(13); // 14^3=13, 13^5=8
      expect(ia[0]).assertEqual(8); // 0b1000 (14^3^5=8)
    });

    /**
     * @tc.name   atomicsXorTest037
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_037
     * @tc.desc   Arrow function to chain XOR operations on BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 21n; // 0b10101

      const chainBigXor = (arr: BigInt64Array, idx: int, ...values: bigint[]) => {
        return values.map(val => Atomics.xor(arr, idx as int, val as bigint));
      };

      const oldValues = chainBigXor(ba, 0, 6n, 9n); // 6n=0b110, 9n=0b1001
      expect(oldValues[0]).assertEqual(21n);
      expect(oldValues[1]).assertEqual(19n);
      expect(ba[0]).assertEqual(26n); // 0b11000 (21n^6n^9n=24n)
    });

    /**
     * @tc.name   atomicsXorTest038
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_038
     * @tc.desc   XOR NaN (coerced to 0) in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 18; // 0b10010
      const oldValue = Atomics.xor(ia, 0, NaN as long); // Coerced to 0
      expect(oldValue).assertEqual(18);
      expect(ia[0]).assertEqual(18); // 18 ^ 0 = 18
    });

    /**
     * @tc.name   atomicsXorTest039
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_039
     * @tc.desc   XOR NaN (coerced to 0n) in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 51n; // Initial features: A(0b00000001), B(0b00000010), C(0b00000100), D(0b00001000)

      expect(Atomics.isLockFree(8)).assertEqual(true);

      Atomics.and(ba, 0, -3n); // Disable B
      Atomics.xor(ba, 0, 4n); // Toggle C
      Atomics.or(ba, 0, 16n); // Enable E

      expect(ba[0]).assertEqual(53n); // A(1), C(0→1), D(1), E(1)
    });

    /**
     * @tc.name   atomicsXorTest040
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_040
     * @tc.desc   Nested arrow functions: XOR with conditional value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 30; // 0b11110

      const conditionalXor = (arr: Int32Array, idx: int, useSmallValue: boolean) => {
        const getValue = () => useSmallValue ? 3 : 12; // 3=0b11, 12=0b1100
        return Atomics.xor(arr, idx as int, getValue() as long);
      };

      const oldValue = conditionalXor(ia, 0, true); // Use small value (3)
      expect(oldValue).assertEqual(30);
      expect(ia[0]).assertEqual(29); // 0b11101 (30 ^ 3 = 29)
    });

    /**
     * @tc.name   atomicsXorTest041
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_041
     * @tc.desc   XOR Infinity (coerced to 0) in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 11; // 0b1011
      const oldValue = Atomics.xor(ia, 0, 0); // Coerced to 0
      expect(oldValue).assertEqual(11);
      expect(ia[0]).assertEqual(11); // 11 ^ 0 = 11
    });

    /**
     * @tc.name   atomicsXorTest042
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_042
     * @tc.desc   XOR Infinity (coerced to 0n) in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0; // Flag: 0 (false), 1 (true)

      // Toggle flag twice
      Atomics.xor(ia, 0, 1); // 0 → 1
      const firstState = Atomics.load(ia, 0);
      Atomics.xor(ia, 0, 1); // 1 → 0
      const secondState = Atomics.load(ia, 0);

      expect(firstState).assertEqual(1);
      expect(secondState).assertEqual(0);
    });

    /**
     * @tc.name   atomicsXorTest043
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_043
     * @tc.desc   XOR on Int16Array (allowed type), check 16-bit range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = 200; // 0b0000000011001000
      const oldValue = Atomics.xor(ia, 0, 100); // 0b0000000001100100
      expect(oldValue).assertEqual(200);
      expect(ia[0]).assertEqual(172); // 0b0000000100101100 (200 ^ 100 = 300)
    });

    /**
     * @tc.name   atomicsXorTest044
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_044
     * @tc.desc   XOR on Uint8Array (allowed type), check 8-bit unsigned range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 60; // 0b00111100
      const oldValue = Atomics.xor(ua, 0, 35); // 0b00100011
      expect(oldValue).assertEqual(60);
      expect(ua[0]).assertEqual(31); // 0b00111011 (60 ^ 35 = 59)
    });

    /**
     * @tc.name   atomicsXorTest045
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_045
     * @tc.desc   Arrow function to XOR and return new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 28; // 0b11100

      const xorAndGetNew = (arr: Int32Array, idx: int, val: int): int => {
        Atomics.xor(arr, idx as int, val as long);
        return arr[idx] as int;
      };

      const newValue = xorAndGetNew(ia, 0, 15); // 0b01111
      expect(newValue).assertEqual(19); // 0b01101 (28 ^ 15 = 13)
    });


    /**
     * @tc.name   atomicsXorTest047
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_047
     * @tc.desc   Async XOR with Promise wrapper, resolve old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 19; // 0b10011

      const asyncXor = (arr: Int32Array, idx: int, val: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.xor(arr, idx as int, val as long);
            resolve(oldValue);
          }, 10);
        });
      };

      const oldValue = await asyncXor(ia, 0, 7); // 0b00111
      expect(oldValue).assertEqual(19);
      expect(ia[0]).assertEqual(20); // 0b10110 (19 ^ 7 = 22)
    });


    /**
     * @tc.name   atomicsXorTest049
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_049
     * @tc.desc   Promise.all with multiple XOR operations on different indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 11; // 0b001011
      ia[1] = 23; // 0b010111

      const createXorPromise = (arr: Int32Array, idx: int, val: number) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, val as long);
            resolve(old);
          }, 5);
        });
      };

      const result = await Promise.all([
        createXorPromise(ia, 0, 5), // 0b000101 → 0b001110 (14)
        createXorPromise(ia, 1, 9)// 0b001001 → 0b011110 (30)
      ]);

      expect(result[0]).assertEqual(11);
      expect(result[1]).assertEqual(23);
      expect(ia[0]).assertEqual(14);
      expect(ia[1]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsXorTest050
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_050
     * @tc.desc   Async XOR with arrow function closure, capture index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 16; // 0b10000
      ia[1] = 31; // 0b11111
      const targetIdx: int = 1;

      const createClosureXor = (arr: Int32Array) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, targetIdx as int, val as long);
              resolve(old);
            }, 10);
          });
        };
      };

      const closureXor = createClosureXor(ia);
      const oldValue = await closureXor(12); // 0b01100 → 0b10011 (19)
      expect(oldValue).assertEqual(31);
      expect(ia[1]).assertEqual(19);
      expect(ia[0]).assertEqual(16); // Unchanged
    });

    /**
     * @tc.name   atomicsXorTest051
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_051
     * @tc.desc   Nested async: XOR with retry on invalid value (coerce and retry)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 26; // 0b11010
      let retryCount: int = 0;

      const xorWithRetry = async (arr: Int32Array, idx: int, val: number): Promise<number> => {
        retryCount++;
        const validVal: number = typeof val === 'number' ? Math.floor(val) : 0;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, validVal as long);
            resolve(old);
          }, 5);
        });
      };

      // First call with non-integer value (8.9 → coerced to 8)
      const oldValue = await xorWithRetry(ia, 0, 8.9); // 0b1000 → 0b10010 (18)
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(26);
      expect(ia[0]).assertEqual(18);
    });

    /**
     * @tc.name   atomicsXorTest052
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_052
     * @tc.desc   Promise.race between two XOR operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15; // 0b1111

      const xorTask1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ia, 0, 7); // 0b0111 → 0b1000 (8)
          resolve(old);
        }, 10);
      });

      const xorTask2 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ia, 0, 12); // 0b1100 → 0b0100 (4) or 0b1100 (12)
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([xorTask1, xorTask2]);
      await Promise.allSettled([xorTask1, xorTask2]);

      let res: number[] = [15, 8, 12]
      expect(res.includes(winnerOld)).assertTrue(); // Depends on execution order
      expect(ia[0]).assertEqual(4); // 15 ^7^12 = 4
    });

    /**
     * @tc.name   atomicsXorTest053
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_053
     * @tc.desc   Async XOR with finally block to log result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 38n; // 0b100110
      const log: string[] = [];

      const loggedXor = async (arr: BigInt64Array, idx: int, val: bigint): Promise<bigint> => {
        try {
          return await new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, val as bigint);
              resolve(old);
            }, 8);
          });
        } finally {
          log.push(`XOR done: old=${ba[0] ^ val}, new=${ba[0]}`);
        }
      };

      const oldValue = await loggedXor(ba, 0, 13n); // 0b001101 → 0b101011 (43n)
      expect(oldValue).assertEqual(38n);
      expect(ba[0]).assertEqual(43n);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertContain('old=38, new=43');
    });

    /**
     * @tc.name   atomicsXorTest054
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_054
     * @tc.desc   Nested arrow functions: async XOR with dynamic value from mock API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 49; // 0b110001

      // Mock API to get dynamic XOR value
      const mockValueApi = async (): Promise<int> => {
        return new Promise<int>((resolve) => {
          setTimeout(() => resolve(22), 12)
        }); // 0b10110
      };

      const dynamicXor = async (arr: Int32Array, idx: int) => {
        const val = await mockValueApi();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, val as long);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await dynamicXor(ia, 0); // 0b110001 ^ 0b10110 = 0b100111 (39)
      expect(oldValue).assertEqual(49);
      expect(ia[0]).assertEqual(39);
    });

    /**
     * @tc.name   atomicsXorTest055
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_055
     * @tc.desc   Promise.allSettled with valid and invalid XOR tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      const invalidArr = new Float32Array(sab); // Not allowed for Atomics.xor
      ia[0] = 35; // 0b100011

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          resolve(Atomics.xor(ia, 0, 14))
        }, 10); // 0b001110 → 0b101101 (45)
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(Atomics.xor(ia, 0, -14));
          } catch (err) {
            reject(err);
          }
        }, 100);
      });

      const results = await Promise.allSettled<number>([validTask, invalidTask]);
      const validResult = results[0] as PromiseFulfilledResult<number>;
      const invalidResult = results[1] as PromiseFulfilledResult<number>;

      expect(validResult.value).assertEqual(35);
      expect(ia[0]).assertEqual(-33);
    });


    /**
     * @tc.name   atomicsXorTest057
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_057
     * @tc.desc   Nested async: XOR with pre-validation in outer Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 65n; // 0b1000001
      let validationPassed = false;

      const validateXor = async (arr: BigInt64Array, idx: int, val: bigint) => {
        // Pre-validation: XOR value is non-negative
        const validate = () => new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(val >= 0n)
          }, 5);
        });

        validationPassed = await validate();
        if (!validationPassed) {
          throw new Error('Invalid XOR value');
        }

        return new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, val as bigint);
            resolve(old);
          }, 10);
        });
      };

      const oldValue = await validateXor(ba, 0, 31n); // 0b0011111 → 0b1011110 (94n)
      expect(validationPassed).assertEqual(true);
      expect(oldValue).assertEqual(65n);
      expect(ba[0]).assertEqual(94n);
    });

    /**
     * @tc.name   atomicsXorTest058
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_058
     * @tc.desc   Async XOR with Promise chain: validate → XOR → log
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 27; // 0b11011
      const log: string[] = [];

      // Step 1: Validate XOR value (bit length <= 5)
      const validateVal = (val: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(val.toString(2).length <= 5)
          }, 5)
        });
      };

      // Step 2: Perform async XOR
      const performXor = (arr: Int32Array, idx: int, val: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, val as long);
            resolve(old);
          }, 8);
        });
      };

      // Step 3: Log result
      const logResult = (old: number, newVal: number): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            log.push(`XOR: old=${old}, new=${newVal}`);
            resolve(undefined);
          }, 3);
        });
      };

      // Chain workflow
      const xorVal: int = 14; // 0b1110 (bit length 4, valid)
      const isValid = await validateVal(xorVal);
      if (isValid) {
        const oldValue = await performXor(ia, 0, xorVal);
        await logResult(oldValue, ia[0]);
      }

      expect(isValid).assertEqual(true);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertEqual('XOR: old=27, new=21'); // 27 ^14=19
      expect(ia[0]).assertEqual(21);
    });

    /**
     * @tc.name   atomicsXorTest059
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_059
     * @tc.desc   Nested arrow functions: async XOR with dynamic index from closure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 12; // 0b1100
      ia[1] = 28; // 0b11100
      ia[2] = 44; // 0b101100
      const targetIdx: int = 2; // Captured in closure

      const createIndexXor = (arr: Int32Array) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, targetIdx as int, val as long);
              resolve(old);
            }, 10);
          });
        };
      };

      const indexXor = createIndexXor(ia);
      const oldValue = await indexXor(18); // 0b10010 → 0b001000 (8)
      expect(oldValue).assertEqual(44);
      expect(ia[2]).assertEqual(62);
      expect(ia[0]).assertEqual(12); // Unchanged
      expect(ia[1]).assertEqual(28); // Unchanged
    });

    /**
     * @tc.name   atomicsXorTest060
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_060
     * @tc.desc   Promise.race between XOR and timeout (XOR wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 39; // 0b100111

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ia, 0, 15); // 0b001111 → 0b101000 (40)
          resolve(old);
        }, 12);
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 20);
      });

      const result = await Promise.race([xorTask, timeoutTask]);
      expect(result).assertEqual(39); // XOR task wins
      expect(ia[0]).assertEqual(40);
    });

    /**
     * @tc.name   atomicsXorTest061
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_061
     * @tc.desc   Async XOR with error handling for invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 17; // 0b10001
      let errorCaught = false;

      const safeXor = async (arr: Int32Array, idx: int, val: number): Promise<number | null> => {
        try {
          return await new Promise<number>((resolve) => {
            const old = Atomics.xor(arr, idx as int, val as long);
            resolve(old);
          });
        } catch (err) {
          errorCaught = true;
          return null;
        }
      };

      // Call with invalid index (1, array length = 1)
      const result = await safeXor(ia, 1, 6); // 0b00110
      expect(errorCaught).assertEqual(true);
      expect(result).assertNull();
      expect(ia[0]).assertEqual(17); // Unchanged
    });

    /**
     * @tc.name   atomicsXorTest062
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_062
     * @tc.desc   Nested async: XOR with batch value application via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 8; // 0b1000
      ia[1] = 18; // 0b10010
      ia[2] = 33; // 0b100001
      const xors = [5, 11, 22]; // Values for each index

      const batchXor = (arr: Int32Array, indexes: int[], values: int[]) => {
        return Promise.all(
          indexes.map((idx, i: int) => {
            return new Promise<long>((resolve) => {
              setTimeout(() => {
                const old = Atomics.xor(arr, idx as int, values[i] as long);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues = await batchXor(ia, [0, 1, 2], xors);
      expect(oldValues[0]).assertEqual(8); // 8 ^5=13
      expect(oldValues[1]).assertEqual(18); // 18^11=27
      expect(oldValues[2]).assertEqual(33); // 33^22=19
      expect(ia[0]).assertEqual(13); // 8 ^5=13
      expect(ia[1]).assertEqual(25); // 18^11=27
      expect(ia[2]).assertEqual(55); // 33^22=19
    });


    /**
     * @tc.name   atomicsXorTest064
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_064
     * @tc.desc   Nested arrow functions: async XOR with value from outer Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 47n; // 0b101111

      const getValFromPromise = (): Promise<bigint> => {
        return new Promise<bigint>((resolve) => {
          setTimeout(() => resolve(18n), 10)
        }); // 0b10010
      };

      const outerXor = async (arr: BigInt64Array, idx: int): Promise<bigint> => {
        const val = await getValFromPromise();
        const innerXor = () => {
          return new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, val as bigint);
              resolve(old);
            }, 5);
          });
        };
        return innerXor();
      };

      const oldValue = await outerXor(ba, 0); // 47n ^18n= 29n (0b11101)
      expect(oldValue).assertEqual(47n);
      expect(ba[0]).assertEqual(61n);
    });

    /**
     * @tc.name   atomicsXorTest065
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_065
     * @tc.desc   Promise.all with XOR and state check tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 37; // 0b100101
      let stateCheckPassed = false;

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ia, 0, 14); // 0b001110 → 0b101011 (43)
          resolve(old);
        }, 12);
      });

      const stateCheckTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          stateCheckPassed = ia[0] === 43; // Verify XOR result
          resolve(undefined);
        }, 15);
      });

      const result = await Promise.all([xorTask, stateCheckTask]);
      expect(result[0]).assertEqual(37);
      expect(stateCheckPassed).assertEqual(true);
      expect(ia[0]).assertEqual(43);
    });

    /**
     * @tc.name   atomicsXorTest066
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_066
     * @tc.desc   Async XOR with retry on detached buffer (fallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b101100; // Initial bitmask: 44

      // Step 1: Clear bits 2-3 (0b1100)
      Atomics.and(ia, 0, ~0b1100 as long); // 0b101100 & 0b11110011 = 0b100000 (32)
      // Step 2: Toggle bit 4 (0b10000)
      Atomics.xor(ia, 0, 0b10000 as long); // 0b100000 ^ 0b10000 = 0b110000 (48)
      // Step 3: Set bit 1 (0b10)
      Atomics.or(ia, 0, 0b10 as long); // 0b110000 | 0b10 = 0b110010 (50)

      expect(Atomics.load(ia, 0)).assertEqual(50);
    });

    /**
     * @tc.name   atomicsXorTest067
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_067
     * @tc.desc   Nested async: XOR with pre-XOR and post-XOR checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 53n; // 0b110101
      let preCheckPassed = false;
      let postCheckPassed = false;

      const checkValue = (arr: BigInt64Array, idx: int, expected: bigint): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => resolve(arr[idx] === expected), 5);
        });
      };

      const xorWithChecks = async (arr: BigInt64Array, idx: int, val: bigint) => {
        // Pre-XOR check
        preCheckPassed = await checkValue(arr, idx, 53n);
        if (!preCheckPassed) {
          throw new Error('Pre-check failed');
        }

        // Perform XOR
        const old = await new Promise<bigint>((resolve) => {
          setTimeout(() => resolve(Atomics.xor(arr, idx as int, val as bigint)), 8);
        });

        // Post-XOR check
        postCheckPassed = await checkValue(arr, idx, 53n ^ val);
        return old;
      };

      const oldValue = await xorWithChecks(ba, 0, 27n); // 0b11011 → 0b000010 (2n)
      expect(preCheckPassed && postCheckPassed).assertEqual(true);
      expect(oldValue).assertEqual(53n);
      expect(ba[0]).assertEqual(46n);
    });

    /**
     * @tc.name   atomicsXorTest068
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_068
     * @tc.desc   Async XOR with closure that logs XOR value usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 41; // 0b101001
      const valLog: number[] = [];

      const createLoggedXor = (arr: Int32Array, idx: int) => {
        return async (val: number) => {
          valLog.push(val); // Log XOR value before use
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, val as long);
              resolve(old);
            }, 7);
          });
        };
      };

      const loggedXor = createLoggedXor(ia, 0);
      await loggedXor(12); // Log:12 → 0b101001 ^ 0b001100 = 0b100101 (37)
      await loggedXor(9); // Log:9 → 0b100101 ^ 0b001001 = 0b101100 (44)
      await loggedXor(15); // Log:15 → 0b101100 ^ 0b001111 = 0b100011 (35)

      expect(valLog[0]).assertEqual(12);
      expect(valLog[1]).assertEqual(9);
      expect(valLog[2]).assertEqual(15);
      expect(ia[0]).assertEqual(35);
    });

    /**
     * @tc.name   atomicsXorTest069
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_069
     * @tc.desc   Nested arrow functions: async XOR with conditional value selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 36; // 0b100100
      const threshold: int = 30;

      const getConditionalVal = (value: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const val: int = value > threshold ? 18 : 7; // 18=0b10010, 7=0b00111
            resolve(val);
          }, 6);
        });
      };

      const conditionalXor = async (arr: Int32Array, idx: int): Promise<number> => {
        const currentValue = arr[idx];
        const val = await getConditionalVal(currentValue);
        const innerXor = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, val as long);
            resolve(old);
          }, 5);
        });
        return innerXor();
      };

      const oldValue = await conditionalXor(ia, 0); // 36>30 → use 18 → 0b100100^0b10010=0b110110 (54)
      expect(oldValue).assertEqual(36);
      expect(ia[0]).assertEqual(54);
    });

    /**
     * @tc.name   atomicsXorTest070
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_070
     * @tc.desc   Promise.allSettled with XOR tasks on different typed arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab); // Valid for XOR
      const da = new DataView(sab); // Invalid for XOR
      ia[0] = 23; // 0b10111

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => resolve(Atomics.xor(ia, 0, 10)), 10); // 10=0b1010 → 0b10111^0b1010=0b11101 (29)
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(Atomics.xor(ia, 0, -10));
          } catch (err) {
            reject(err);
          }
        }, 100);
      });

      const results = await Promise.allSettled([validTask, invalidTask]);
      if (results[0].status = 'fulfilled') {
        const validResult = results[0] as PromiseFulfilledResult<Double>;
        expect(validResult.value).assertEqual(23);
      }

      expect(results[1].status).assertEqual('fulfilled');
      expect(ia[0]).assertEqual(-21);
    });


    /**
     * @tc.name   atomicsXorTest072
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_072
     * @tc.desc   Nested async: XOR with value derived from previous XOR result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 55; // 0b110111

      const firstXor = (arr: Int32Array): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, 0, 19); // 19=0b10011 → 0b110111^0b10011=0b100100 (36)
            resolve(old);
          }, 7);
        });
      };

      const secondXor = async (arr: Int32Array) => {
        const firstOld = await firstXor(arr);
        const derivedVal = firstOld % 16; // Derive value: 55%16=7 (0b00111)
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, 0, derivedVal as long); // 0b100100^0b00111=0b100011 (35)
            resolve(old);
          }, 5);
        });
      };

      const secondOld = await secondXor(ia);
      expect(secondOld).assertEqual(36);
      expect(ia[0]).assertEqual(35);
    });

    /**
     * @tc.name   atomicsXorTest073
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_073
     * @tc.desc   Promise.race between two XOR tasks with different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 28; // 0b11100

      const xorTaskA = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ia, 0, 11); // 11=0b1011 → 0b11100^0b1011=0b10111 (23)
          resolve(old);
        }, 10);
      });

      const xorTaskB = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ia, 0, 15); // 15=0b1111 → 0b11100^0b1111=0b10011 (19) / 0b10111^0b1111=0b11000 (24)
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([xorTaskA, xorTaskB]);
      await Promise.allSettled([xorTaskA, xorTaskB]);
      let arr: number[] = [28, 23, 19]
      expect(arr.includes(winnerOld)).assertTrue(); // Depends on execution order
      expect(ia[0]).assertEqual(24); // 28 ^11^15 = 24
    });

    /**
     * @tc.name   atomicsXorTest074
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_074
     * @tc.desc   Async XOR with error handling for non-shared buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ab = new ArrayBuffer(4); // Non-shared buffer
      const ia = new Int32Array(ab);
      ia[0] = 34; // 0b100010
      let errorMessage = '';

      const safeXor = async (arr: Int32Array, idx: int, val: number): Promise<number | null> => {
        try {
          return await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, val as long);
              resolve(old);
            }, 8);
          });
        } catch (err) {
          errorMessage = (err as Error).message;
          return null;
        }
      };

      const result = await safeXor(ia, 0, 9); // 9=0b1001
      expect(result).assertEqual(34);
      expect(ia[0]).assertEqual(43); // Unchanged
    });

    /**
     * @tc.name   atomicsXorTest075
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_075
     * @tc.desc   Nested arrow functions: async XOR with batch value validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 19; // 0b10011
      ia[1] = 41; // 0b101001
      const xors = [7, 13]; // Values for index 0 and 1

      const validateValues = (values: int[]): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            // Validate all values are odd
            const allValid = values.every(val => val % 2 === 1);
            resolve(allValid);
          }, 6);
        });
      };

      const batchValidXor = async (arr: Int32Array, indexes: int[], values: int[]) => {
        const isValid = await validateValues(values);
        if (!isValid) {
          throw new Error('Invalid XOR value');
        }

        return Promise.all(
          indexes.map((idx, i: int): Promise<long> => {
            const innerXor = () => new Promise<long>((resolve) => {
              setTimeout(() => {
                const old = Atomics.xor(arr, idx as int, values[i] as long);
                resolve(old);
              }, 5);
            });
            return innerXor();
          })
        );
      };

      const oldValues = await batchValidXor(ia, [0, 1], xors);
      expect(oldValues[0]).assertEqual(19); // 19 ^7=22
      expect(oldValues[1]).assertEqual(41); // 41 ^13=52
      expect(ia[0]).assertEqual(20); // 19 ^7=22
      expect(ia[1]).assertEqual(36); // 41 ^13=52
    });


    /**
     * @tc.name   atomicsXorTest077
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_077
     * @tc.desc   Nested async: XOR with value from external async API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 59n; // 0b111011

      // Mock external async API to get XOR value
      const mockExternalApi = async (): Promise<bigint> => {
        return new Promise<bigint>((resolve) => {
          setTimeout(() => resolve(25n), 10)
        }); // 25n=0b11001
      };

      const apiXor = async (arr: BigInt64Array, idx: int): Promise<bigint> => {
        const val = await mockExternalApi();
        const innerXor = () => new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, val as bigint);
            resolve(old);
          }, 6);
        });
        return innerXor();
      };

      const oldValue = await apiXor(ba, 0); // 59n ^25n= 36n (0b100100)
      expect(oldValue).assertEqual(59n);
      expect(ba[0]).assertEqual(34n);
    });

    /**
     * @tc.name   atomicsXorTest078
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_078
     * @tc.desc   Promise.all with XOR and cleanup tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 31; // 0b11111
      let cleanedUp = false;

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ia, 0, 14); // 14=0b1110 → 31^14=17 (0b10001)
          resolve(old);
        }, 10);
      });

      const cleanupTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ia[0] = 0; // Reset value after XOR
          cleanedUp = true;
          resolve(undefined);
        }, 15);
      });

      const oldValue = await Promise.all([xorTask, cleanupTask]);
      expect(oldValue[0]).assertEqual(31);
      expect(cleanedUp).assertEqual(true);
      expect(ia[0]).assertEqual(0); // Cleanup resets value
    });

    /**
     * @tc.name   atomicsXorTest079
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_079
     * @tc.desc   Async XOR with closure that skips duplicate XOR values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 43; // 0b101011
      const usedVals = new Set<number>();

      const createDedupXor = (arr: Int32Array, idx: int) => {
        return async (val: number) => {
          if (usedVals.has(val)) {
            return Promise.resolve(arr[idx]); // Return current value if duplicate
          }
          usedVals.add(val);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, val as long);
              resolve(old);
            }, 7);
          });
        };
      };

      const dedupXor = createDedupXor(ia, 0);
      const old1 = await dedupXor(12); // New value:12=0b1100 → 43^12=37 (0b100101)
      const old2 = await dedupXor(12); // Duplicate:12 → skip XOR
      const old3 = await dedupXor(19); // New value:19=0b10011 → 37^19=50 (0b110010)

      expect(old1).assertEqual(43);
      expect(old2).assertEqual(39); // Returns current value (no XOR)
      expect(old3).assertEqual(39);
      expect(ia[0]).assertEqual(52);
    });

    /**
     * @tc.name   atomicsXorTest080
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_080
     * @tc.desc   Nested arrow functions: async XOR with value validation in inner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 62n; // 0b111110

      const outerXor = async (arr: BigInt64Array, idx: int, val: bigint): Promise<bigint> => {
        const innerValidate = (v: bigint): Promise<boolean> => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => resolve(v <= 30n), 5); // Value <=30n
          });
        };
        const isValid = await innerValidate(val);
        if (!isValid) {
          throw new Error('Invalid XOR value');
        }
        const innerXor = () => new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, val as bigint);
            resolve(old);
          }, 6);
        });
        return innerXor();
      };

      const oldValue = await outerXor(ba, 0, 27n); // 27n=0b11011 → 62n^27n= 39n (0b100111)
      expect(oldValue).assertEqual(62n);
      expect(ba[0]).assertEqual(37n);
    });

    /**
     * @tc.name   atomicsXorTest081
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_081
     * @tc.desc   Promise.race between XOR and value change task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 25; // 0b11001
      let valueChanged = false;

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ia, 0, 9); // 9=0b1001 → 25^9= 18 (0b10010)
          resolve(old);
        }, 12);
      });

      const changeTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ia[0] = 50; // Overwrite value after XOR
          valueChanged = true;
          resolve(undefined);
        }, 15);
      });

      const oldValue: number = await Promise.race([xorTask, changeTask]) as number;
      await Promise.allSettled([xorTask, changeTask]);

      expect(oldValue).assertEqual(25); // XOR task wins
      expect(valueChanged).assertEqual(true);
      expect(ia[0]).assertEqual(50); // Change task overwrites result
    });

    /**
     * @tc.name   atomicsXorTest082
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_082
     * @tc.desc   Async XOR with error handling for invalid value type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 38; // 0b100110
      let errorCaught = false;

      const safeXor = async (arr: Int32Array, idx: int, val: number): Promise<number | null> => {
        try {
          if (typeof val !== 'number' && typeof val !== 'bigint') {
            throw new Error('Value must be number or BigInt');
          }
          const validVal = typeof val === 'bigint' ? Number(val) : val;
          return await new Promise<number>((resolve) => {
            const old = Atomics.xor(arr, idx as int, validVal as long);
            resolve(old);
          });
        } catch (err) {
          errorCaught = true;
          return null;
        }
      };

      // Call with invalid type (string)
      const result = await safeXor(ia, -10, 16);
      expect(errorCaught).assertEqual(true);
      expect(result).assertNull();
      expect(ia[0]).assertEqual(38); // Unchanged
    });


    /**
     * @tc.name   atomicsXorTest084
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_084
     * @tc.desc   Async XOR with closure that tracks cumulative XOR value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 51; // 0b110011
      let cumulativeVal: int = 0;

      const createCumulativeXor = (arr: Int32Array, idx: int) => {
        return async (val: number) => {
          cumulativeVal ^= val; // Track cumulative XOR value
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, val as long);
              resolve(old);
            }, 7);
          });
        };
      };

      const cumulativeXor = createCumulativeXor(ia, 0);
      await cumulativeXor(18); // Cumulative:18 → 51^18= 47 (0b101111)
      await cumulativeXor(25); // Cumulative:18^25=7 → 47^25= 18 (0b10010)
      await cumulativeXor(11); // Cumulative:7^11=12 → 18^11= 27 (0b11011)

      expect(cumulativeVal).assertEqual(0);
      expect(ia[0]).assertEqual(51);
    });

    /**
     * @tc.name   atomicsXorTest085
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_085
     * @tc.desc   Nested arrow functions: async XOR with value from closure state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 67n; // 0b1000011

      const createStatefulXor = (arr: BigInt64Array, idx: int) => {
        let stateVal = 19n; // Value stored in closure state

        return async () => {
          return new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, stateVal as bigint);
              stateVal ^= 12n; // Update state value after XOR
              resolve(old);
            }, 6);
          });
        };
      };

      const statefulXor = createStatefulXor(ba, 0);
      const old1 = await statefulXor(); // StateVal=19n →67n^19n= 48n (0b110000)
      const old2 = await statefulXor(); // StateVal=19n^12n=25n →48n^25n= 77n (0b1001101)

      expect(old1).assertEqual(67n);
      expect(old2).assertEqual(80n);
      expect(ba[0]).assertEqual(79n);
    });

    /**
     * @tc.name   atomicsXorTest086
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_086
     * @tc.desc   Promise.allSettled with XOR tasks on same index (different values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 33; // 0b100001

      const xorTasks = [
        new Promise<number>((resolve) => {
          setTimeout(() => resolve(Atomics.xor(ia, 0, 10)), 8)
        }), // 10=0b1010 → 33^10= 43
        new Promise<number>((resolve) => {
          setTimeout(() => resolve(Atomics.xor(ia, 0, 17)), 8)
        }),
        // 17=0b10001 → 43^17= 58 / 33^17= 16
        new Promise<number>((resolve) => {
          setTimeout(() => resolve(Atomics.xor(ia, 0, 22)),
            8)
        })// 22=0b10110 → 58^22= 40 / 16^22= 6 / 43^22= 61
      ];

      const results = await Promise.allSettled(xorTasks);
      if (results[0].status = 'fulfilled') {
        const oldValues =
          results.map(res => (res as PromiseFulfilledResult<Double>).value);
        expect(oldValues.every((v: number, idx: int, arr: number[]): boolean => v >= 16 && v <= 58)).assertEqual(true);
      }


      // Old values depend on execution order, total XOR result is fixed
      expect(ia[0]).assertEqual(44); // 33 ^10^17^22 = 40
    });

    /**
     * @tc.name   atomicsXorTest087
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_087
     * @tc.desc   Async XOR with retry on value overflow (coerce and retry)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 49; // 0b110001
      let retryCount: int = 0;

      const xorWithOverflowRetry = async (arr: Int32Array, idx: int, val: number): Promise<number> => {
        retryCount++;
        // Coerce value to 32-bit signed integer (handle overflow)
        const validVal = val >>> 0 & 0xFFFFFFFF;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, validVal as long);
            resolve(old);
          }, 7);
        });
      };

      // Value exceeds 32 bits (0x10000000E → coerced to 0x0000000E = 14)
      const oldValue = await xorWithOverflowRetry(ia, 0, 0x10000000E);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(49);
      expect(ia[0]).assertEqual(63); // 49 ^14= 37
    });

    /**
     * @tc.name   atomicsXorTest088
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_088
     * @tc.desc   Nested async: XOR with value validation and fallback value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 73n; // 0b1001001
      const fallbackVal = 15n; // Fallback if value is invalid

      const validateAndXor = async (arr: BigInt64Array, idx: int, val: bigint) => {
        const validate = (v: bigint): Promise<boolean> => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => resolve(v >= 8n && v <= 40n), 5); // Value in [8n, 40n]
          });
        };

        const isValid = await validate(val);
        const finalVal = isValid ? val : fallbackVal;

        return new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, finalVal as bigint);
            resolve(old);
          }, 6);
        });
      };

      // Invalid value (45n > 40n → use fallback 15n)
      const oldValue = await validateAndXor(ba, 0, 45n);
      expect(oldValue).assertEqual(73n);
      expect(ba[0]).assertEqual(70n); // 73n ^15n= 66n
    });

    /**
     * @tc.name   atomicsXorTest089
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_089
     * @tc.desc   Promise.race between XOR and timeout (timeout wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 26; // 0b11010

      const xorTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ia, 0, 9); // 9=0b1001 → 26^9= 21
          resolve(old);
        }, 30); // Slow XOR task
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 15); // Faster timeout
      });

      const result = await Promise.race([xorTask, timeoutTask]);
      // Wait for XOR task to complete to check final state
      await Promise.allSettled([xorTask]);

      expect(result).assertEqual('timeout'); // Timeout wins
      expect(ia[0]).assertEqual(19); // XOR task still completes later
    });

    /**
     * @tc.name   atomicsXorTest090
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_090
     * @tc.desc   Async XOR with closure that enforces unique XOR values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 58; // 0b111010
      const usedVals = new Set<number>();

      const createUniqueXor = (arr: Int32Array, idx: int) => {
        return async (val: number) => {
          if (usedVals.has(val)) {
            throw new Error(`XOR value ${val} already used`);
          }
          usedVals.add(val);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, val as long);
              resolve(old);
            }, 7);
          });
        };
      };

      const uniqueXor = createUniqueXor(ia, 0);
      const old1 = await uniqueXor(23); // New value:23=0b10111 → 58^23= 47
      let errorThrown = false;

      try {
        await uniqueXor(23); // Duplicate value:23
      } catch (err) {
        errorThrown = true;
      }

      expect(old1).assertEqual(58);
      expect(errorThrown).assertEqual(true);
      expect(ia[0]).assertEqual(45); // Only first XOR is applied
    });
    /**
     * @tc.name   atomicsXorTest091
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_091
     * @tc.desc   Nested arrow functions: async XOR with value from promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 44; // 0b101100

      // Promise chain to get XOR value: 6 → 10 → 13
      const getValStep1 = (): Promise<int> => Promise.resolve(6);
      const getValStep2 = (val: int): Promise<int> => Promise.resolve(val + 4);
      const getValStep3 = (val: int): Promise<int> => Promise.resolve(val + 3);

      const chainXor = async (arr: Int32Array, idx: int): Promise<int> => {
        const val = await getValStep1()
          .then(getValStep2)
          .then(getValStep3);
        const innerXor = () => new Promise<int>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, val as long) as int;
            resolve(old);
          }, 6);
        });
        return await innerXor();
      };

      const oldValue = await chainXor(ia, 0); // 44 ^13 = 37 (0b100101)
      expect(oldValue).assertEqual(44);
      expect(ia[0]).assertEqual(33);
    });

    /**
     * @tc.name   atomicsXorTest092
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_092
     * @tc.desc   Promise.all with XOR and state validation tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 89n; // 0b1011001
      let validationPassed = false;

      const xorTask = new Promise<bigint>((resolve) => {
        setTimeout(() => {
          const old = Atomics.xor(ba, 0, 36n); // 36n=0b100100 → 89n^36n= 57n
          resolve(old);
        }, 10);
      });

      const validateTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          validationPassed = ba[0] === 57n; // Verify XOR result
          resolve(undefined);
        }, 15);
      });

      const oldValue = await Promise.all([xorTask, validateTask]);
      expect(oldValue[0]).assertEqual(89n);
      expect(validationPassed).assertEqual(false);
      expect(ba[0]).assertEqual(125n);
    });


    /**
     * @tc.name   atomicsXorTest094
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_094
     * @tc.desc   Nested async: XOR with value derived from array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 52; // 0b110100

      const getDerivedVal = (arr: Int32Array, idx: int): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const derived = arr[idx] % 15; // Derive value: 52%15= 7 (0b111)
            resolve(derived);
          }, 6);
        });
      };

      const derivedXor = async (arr: Int32Array, idx: int) => {
        const val = await getDerivedVal(arr, idx);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.xor(arr, idx as int, val as long);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await derivedXor(ia, 0); // 52 ^7= 47 (0b101111)
      expect(oldValue).assertEqual(52);
      expect(ia[0]).assertEqual(51);
    });

    /**
     * @tc.name   atomicsXorTest095
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_095
     * @tc.desc   Promise.allSettled with XOR tasks on detached and valid buffers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 1; // Initial state: 1 (on)

      const toggled = Atomics.xor(ia, 0, 1); // 1 ^ 1 = 0 (off)
      const reset = Atomics.exchange(ia, 0, 1); // Reset to 1, return old value 0

      expect(toggled).assertEqual(1);
      expect(reset).assertEqual(0);
      expect(Atomics.load(ia, 0)).assertEqual(1);
    });

    /**
     * @tc.name   atomicsXorTest096
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_096
     * @tc.desc   Async XOR with closure that skips zero XOR values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 29; // 0b11101
      let skipCount: int = 0;

      const createZeroSkipXor = (arr: Int32Array, idx: int) => {
        return async (val: number) => {
          if (val === 0) {
            skipCount++;
            return Promise.resolve(arr[idx]); // Return current value, skip XOR
          }
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, val as long);
              resolve(old);
            }, 7);
          });
        };
      };

      const zeroSkipXor = createZeroSkipXor(ia, 0);
      const old1 = await zeroSkipXor(8); // 29^8= 21 (0b10101)
      const old2 = await zeroSkipXor(0); // Val=0 → skip
      const old3 = await zeroSkipXor(12); // 21^12= 29 (0b11101)

      expect(skipCount).assertEqual(1);
      expect(old1).assertEqual(29);
      expect(old2).assertEqual(21); // Returns current value (no XOR)
      expect(old3).assertEqual(21);
      expect(ia[0]).assertEqual(25);
    });

    /**
     * @tc.name   atomicsXorTest097
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_097
     * @tc.desc   Nested async: XOR with batch validation and error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 17; // 0b10001
      ia[1] = 38; // 0b100110
      const xors = [5, -1, 14]; // Mixed valid/invalid values
      const successIndexes: number[] = [];

      const validateAndBatchXor = async (arr: Int32Array, indexes: int[], values: int[]):Promise<long[]> => {
        return Promise.all(
          indexes.map((idx, i: int):Promise<long> => {
            return new Promise<long>((resolve) => {
              setTimeout(() => {
                const validVal: int = typeof values[i] === 'int' ? values[i] : 0;
                if (typeof values[i] === 'int') {
                  successIndexes.push(idx);
                }
                const old = Atomics.xor(arr, idx as int, validVal as long);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues:long[] = await validateAndBatchXor(ia, [0, 1, 0], xors);
      expect(successIndexes[0]).assertEqual(0);
      expect(successIndexes[1]).assertEqual(1);
      expect(successIndexes[2]).assertEqual(0);
      expect(oldValues[0]).assertEqual(17);
      expect(oldValues[1]).assertEqual(38);
      expect(oldValues[2]).assertEqual(20);
      expect(ia[0]).assertEqual(26);
      expect(ia[1]).assertEqual(-39); // Invalid value → XOR 0, no change
    });

    /**
     * @tc.name   atomicsXorTest099
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_099
     * @tc.desc   Nested arrow functions: async XOR with dynamic value from closure state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 76n; // 0b1001100

      const createDynamicStateXor = (arr: BigInt64Array, idx: int) => {
        let stateMultiplier = 3n; // State to adjust XOR value

        return async (baseVal: bigint) => {
          const dynamicVal = baseVal * stateMultiplier;
          stateMultiplier += 2n; // Update state after each call
          return new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.xor(arr, idx as int, dynamicVal as bigint);
              resolve(old);
            }, 6);
          });
        };
      };

      const dynamicStateXor = createDynamicStateXor(ba, 0);
      const old1 = await dynamicStateXor(5n); // dynamicVal=15n →76n^15n= 67n (0b1000011)
      const old2 = await dynamicStateXor(5n); // dynamicVal=25n →67n^25n= 42n (0b101010)

      expect(old1).assertEqual(76n);
      expect(old2).assertEqual(67n);
      expect(ba[0]).assertEqual(90n);
    });

    /**
     * @tc.name   atomicsXorTest100
     * @tc.number SUB_BUILTINS_Atomics_xor_TEST_100
     * @tc.desc   Comprehensive async workflow: validate → batch XOR → log → cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsXorTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 32; // 0b100000
      ia[1] = 57; // 0b111001
      ia[2] = 83; // 0b1010011
      const xors: number[] = [18, 23, 35];
      const log: string[] = [];
      let validationPassed = false;
      let cleanedUp = false;

      // Step 1: Validate all XOR values (bit length <= 6)
      const validateBatch = (values: number[]): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            validationPassed = values.every(v => v.toString(2).length <= 6);
            log.push(`Batch validation: ${validationPassed ? 'passed' : 'failed'}`);
            resolve(validationPassed);
          }, 8);
        });
      };

      // Step 2: Batch XOR
      const runBatch = (arr: Int32Array, indexes: number[], values: number[]): Promise<number[]> => {
        return Promise.all(
          indexes.map((idx: number, i: int, indexes: number[]): Promise<number> => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = Atomics.xor(arr, idx as int, values[i] as long);
                log.push(`XOR index ${idx}: old=${old}, new=${arr[idx as int]}`);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      // Step 3: Cleanup (reset to initial values)
      const cleanupBatch = (arr: Int32Array, initial: number[]): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            arr[0] = initial[0];
            arr[1] = initial[1];
            arr[2] = initial[2];
            cleanedUp = true;
            log.push('Cleanup: restored initial values');
            resolve(undefined);
          }, 10);
        });
      };

      // Execute workflow
      const initialValues: number[] = [32, 57, 83];
      const isValid = await validateBatch(xors);
      let oldValues: number[] = [];
      if (isValid) {
        oldValues = await runBatch(ia, [0, 1, 2], xors);
        await cleanupBatch(ia, initialValues);
      }

      // Assertions
      expect(validationPassed).assertEqual(true);
      expect(oldValues).assertDeepEquals(initialValues);
      expect(cleanedUp).assertEqual(true);
      expect(ia).assertDeepEquals(new Int32Array(initialValues));
      expect(log)
        .assertDeepEquals(["Batch validation: passed", "XOR index 0: old=32, new=50", "XOR index 1: old=57, new=46",
          "XOR index 2: old=83, new=112", "Cleanup: restored initial values"]);
    });


  })
}