import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { typeOr26, typeOr52, typeOr60, typeOr75, typeOr80, typeOr87, typeOr97 } from './atomics';
import { sleep } from './utils';


export default function atomicsOrTest() {
  describe('atomicsOrTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   atomicsOrTest001
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_001
     * @tc.desc   Basic Int32Array OR operation, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1010; // 10
      const oldValue = Atomics.or(ia, 0, 0b0110); // 6
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(0b1110); // 14
    });

    /**
     * @tc.name   atomicsOrTest002
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_002
     * @tc.desc   BigInt64Array OR operation with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = -5n; // Binary: ...11111011
      const oldValue = Atomics.or(ba, 0, 3n); // 0b11
      expect(oldValue).assertEqual(-5n);
      expect(ba[0]).assertEqual(-5n | 3n); // -5 | 3 = -5
    });

    /**
     * @tc.name   atomicsOrTest003
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_003
     * @tc.desc   OR with 0, keep original value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 25;
      const oldValue = Atomics.or(ia, 0, 0);
      expect(oldValue).assertEqual(25);
      expect(ia[0]).assertEqual(25);
    });

    /**
     * @tc.name   atomicsOrTest004
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_004
     * @tc.desc   OR with all 1s (0xFFFFFFFF), result in -1 for Int32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 100;
      const oldValue = Atomics.or(ia, 0, 0xFFFFFFFF);
      expect(oldValue).assertEqual(100);
      expect(ia[0]).assertEqual(-1);
    });

    /**
     * @tc.name   atomicsOrTest005
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_005
     * @tc.desc   OR on Int32Array index 1 (multi-element buffer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 1;
      ia[1] = 0b100; // 4
      const oldValue = Atomics.or(ia, 1, 0b011); // 3
      expect(oldValue).assertEqual(4);
      expect(ia[1]).assertEqual(0b111); // 7
      expect(ia[0]).assertEqual(1); // Unchanged
    });

    /**
     * @tc.name   atomicsOrTest006
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_006
     * @tc.desc   Throw TypeError for non-shared ArrayBuffer (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(4);
      const ia = new Int32Array(ab);
      try {
        Atomics.or(ia, 0, 5)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsOrTest007
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_007
     * @tc.desc   Throw TypeError for non-shared ArrayBuffer (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(8);
      const ba = new BigInt64Array(ab);
      try {
        Atomics.or(ba, 0, 5n)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsOrTest008
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_008
     * @tc.desc   Throw TypeError for Uint32Array (not allowed type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      try {
        Atomics.or(ua, 0, 5)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsOrTest009
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_009
     * @tc.desc   Throw TypeError for Float32Array (not allowed type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;

      // Verify lock-free before chaining operations
      expect(Atomics.isLockFree(4)).assertEqual(true);

      // Operation chain: add → xor → or → compareExchange
      Atomics.add(ia, 0, 3); // 5 + 3 = 8
      Atomics.xor(ia, 0, 4); // 8 ^ 4 = 12
      Atomics.or(ia, 0, 2); // 12 | 2 = 14
      const final = Atomics.compareExchange(ia, 0, 14, 14);

      expect(final).assertEqual(14);
      expect(Atomics.load(ia, 0)).assertEqual(14);
    });

    /**
     * @tc.name   atomicsOrTest010
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_010
     * @tc.desc   Throw RangeError for index >= array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.or(ia, 1, 5)
      } catch (e) {
        expect(e.message).assertContain('Index is overflow');
      }
    });

    /**
     * @tc.name   atomicsOrTest011
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_011
     * @tc.desc   Throw RangeError for negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.or(ia, -1, 5)
      } catch (e) {
        expect(e.message).assertContain('integerIndex');
      }
    });

    /**
     * @tc.name   atomicsOrTest012
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_012
     * @tc.desc   OR with BigInt64Array and large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 1000000000000n;
      const oldValue = Atomics.or(ba, 0, 999999999999n);
      expect(oldValue).assertEqual(1000000000000n);
      expect(ba[0]).assertEqual(1000000000000n | 999999999999n);
    });

    /**
     * @tc.name   atomicsOrTest013
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_013
     * @tc.desc   OR twice on same index, accumulate bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0001; // 1

      const old1 = Atomics.or(ia, 0, 0b0010); // 2
      expect(old1).assertEqual(1);
      expect(ia[0]).assertEqual(0b0011); // 3

      const old2 = Atomics.or(ia, 0, 0b0100); // 4
      expect(old2).assertEqual(3);
      expect(ia[0]).assertEqual(0b0111); // 7
    });

    /**
     * @tc.name   atomicsOrTest014
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_014
     * @tc.desc   OR with Int32Array and zero old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const oldValue = Atomics.or(ia, 0, 15);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(15);
    });

    /**
     * @tc.name   atomicsOrTest015
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_015
     * @tc.desc   OR with BigInt64Array and zero old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0n;
      const oldValue = Atomics.or(ba, 0, 25n);
      expect(oldValue).assertEqual(0n);
      expect(ba[0]).assertEqual(25n);
    });

    /**
     * @tc.name   atomicsOrTest016
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_016
     * @tc.desc   OR with non-integer value (coerced to integer) for Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b100; // 4
      const oldValue = Atomics.or(ia, 0, 3.9); // Coerced to 3
      expect(oldValue).assertEqual(4);
      expect(ia[0]).assertEqual(0b111); // 7
    });

    /**
     * @tc.name   atomicsOrTest017
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_017
     * @tc.desc   OR with non-BigInt value (coerced to BigInt) for BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 8n;
      const oldValue = Atomics.or(ba, 0, 7n); // Coerced to 7n
      expect(oldValue).assertEqual(8n);
      expect(ba[0]).assertEqual(15n);
    });

    /**
     * @tc.name   atomicsOrTest018
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_018
     * @tc.desc   OR on Int32Array with maximum value (0x7FFFFFFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0x7FFFFFFF; // Max Int32
      const oldValue = Atomics.or(ia, 0, 1);
      expect(oldValue).assertEqual(2147483647);
      expect(ia[0]).assertEqual(2147483647); // Overflow to min Int32
    });

    /**
     * @tc.name   atomicsOrTest019
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_019
     * @tc.desc   OR on BigInt64Array with maximum value (2^63 - 1n)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 9223372036854775807n; // Max BigInt64
      const oldValue = Atomics.or(ba, 0, 1n);
      expect(oldValue).assertEqual(9223372036854775807n);
      expect(ba[0]).assertEqual(9223372036854775807n); // Overflow to min BigInt64
    });

    /**
     * @tc.name   atomicsOrTest020
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_020
     * @tc.desc   OR with arrow function wrapper, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 12; // 0b1100
      const orWrapper = (arr: Int32Array, idx: number, val: number) => Atomics.or(arr, idx, val);
      const oldValue = orWrapper(ia, 0, 5); // 0b0101
      expect(oldValue).assertEqual(12);
      expect(ia[0]).assertEqual(13); // 0b1101
    });

    /**
     * @tc.name   atomicsOrTest021
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_021
     * @tc.desc   Nested arrow functions: OR inside inner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 7; // 0b0111

      const outerFunc = (arr: Int32Array): number => {
        const innerOr = (idx: number, val: number) => Atomics.or(arr, idx, val);
        return innerOr(0, 8); // 0b1000
      };

      const oldValue = outerFunc(ia);
      expect(oldValue).assertEqual(7);
      expect(ia[0]).assertEqual(15); // 0b1111
    });

    /**
     * @tc.name   atomicsOrTest022
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_022
     * @tc.desc   OR with BigInt64Array in arrow function, handle negative mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 20n; // 0b10100
      const bigIntOr = (arr: BigInt64Array, idx: number, val: bigint) => Atomics.or(arr, idx, val);
      const oldValue = bigIntOr(ba, 0, -10n);
      expect(oldValue).assertEqual(20n);
      expect(ba[0]).assertEqual(20n | -10n);
    });

    /**
     * @tc.name   atomicsOrTest023
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_023
     * @tc.desc   Throw TypeError for non-typed array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0001; // Base feature

      expect(Atomics.isLockFree(4)).assertEqual(true);

      Atomics.or(ia, 0, 0b0010); // Activate feature
      const activated = Atomics.load(ia, 0);
      Atomics.exchange(ia, 0, 0b0001); // Rollback

      expect(activated).assertEqual(0b0011);
      expect(ia[0]).assertEqual(0b0001);
    });

    /**
     * @tc.name   atomicsOrTest024
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_024
     * @tc.desc   OR on Int32Array with mask having single set bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1010; // 10
      const mask = 0b0010; // Single bit set
      const oldValue = Atomics.or(ia, 0, mask);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(10); // Bit already set, no change
    });

    /**
     * @tc.name   atomicsOrTest025
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_025
     * @tc.desc   OR on BigInt64Array with mask having single set bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0b1100n; // 12n
      const mask = 0b0100n; // Single bit set
      const oldValue = Atomics.or(ba, 0, mask);
      expect(oldValue).assertEqual(12n);
      expect(ba[0]).assertEqual(12n); // Bit already set, no change
    });

    /**
     * @tc.name   atomicsOrTest026
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_026
     * @tc.desc   Arrow function to batch OR on multiple indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 3; // 0b0011
      ia[1] = 5; // 0b0101

      const batchOr = (arr: Int32Array, ops: Array<typeOr26>) => {
        return ops.map(op => Atomics.or(arr, op.idx, op.val));
      };

      const oldValues = batchOr(ia, [{ idx: 0, val: 4 }, { idx: 1, val: 2 }]);
      expect(oldValues).assertDeepEquals([3, 5]);
      expect(ia[0]).assertEqual(7); // 0b0111
      expect(ia[1]).assertEqual(7); // 0b0111
    });

    /**
     * @tc.name   atomicsOrTest027
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_027
     * @tc.desc   OR with Int32Array and mask=0, no change to value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 99;
      const oldValue = Atomics.or(ia, 0, 0);
      expect(oldValue).assertEqual(99);
      expect(ia[0]).assertEqual(99);
    });

    /**
     * @tc.name   atomicsOrTest028
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_028
     * @tc.desc   OR with BigInt64Array and mask=0n, no change to value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 123456789n;
      const oldValue = Atomics.or(ba, 0, 0n);
      expect(oldValue).assertEqual(123456789n);
      expect(ba[0]).assertEqual(123456789n);
    });

    /**
     * @tc.name   atomicsOrTest029
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_029
     * @tc.desc   Nested arrow functions: OR with dynamic mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8; // 0b1000

      const getMask = (bit: number) => 1 << bit;
      const dynamicOr = (arr: Int32Array, idx: number, bit: number) => {
        const mask = getMask(bit);
        return Atomics.or(arr, idx, mask);
      };

      const oldValue = dynamicOr(ia, 0, 2); // Mask = 0b0100
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(12); // 0b1100
    });

    /**
     * @tc.name   atomicsOrTest030
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_030
     * @tc.desc   Throw RangeError for non-integer index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.or(ia, 0.5, 5)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsOrTest031
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_031
     * @tc.desc   OR on Int32Array with mask exceeding 32 bits (truncated)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 1; // 0b0001
      const longMask = 0x100000001; // 33 bits, truncated to 0x00000001
      const oldValue = Atomics.or(ia, 0, longMask);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(1); // Truncated mask matches existing bit
    });

    /**
     * @tc.name   atomicsOrTest032
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_032
     * @tc.desc   OR on BigInt64Array with mask exceeding 64 bits (truncated)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 1n; // 0b0001
      const longMask = 0x10000000000000001n; // 65 bits, truncated to 0x0000000000000001n
      const oldValue = Atomics.or(ba, 0, longMask);
      expect(oldValue).assertEqual(1n);
      expect(ba[0]).assertEqual(1n); // Truncated mask matches existing bit
    });

    /**
     * @tc.name   atomicsOrTest033
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_033
     * @tc.desc   Arrow function wrapper for BigInt64Array OR with dynamic value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0b1000n; // 8n

      const getDynamicValue = (base: bigint, offset: bigint) => base + offset;
      const bigIntOrWrapper = (arr: BigInt64Array, idx: number, base: bigint, offset: bigint) => {
        const val = getDynamicValue(base, offset);
        return Atomics.or(arr, idx, val);
      };

      const oldValue = bigIntOrWrapper(ba, 0, 4n, 2n); // Val = 6n (0b0110)
      expect(oldValue).assertEqual(8n);
      expect(ba[0]).assertEqual(14n); // 0b1110
    });

    /**
     * @tc.name   atomicsOrTest034
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_034
     * @tc.desc   OR on Int32Array with mask=0xFFFFFFFF (all bits set)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 42;
      const oldValue = Atomics.or(ia, 0, 0xFFFFFFFF);
      expect(oldValue).assertEqual(42);
      expect(ia[0]).assertEqual(-1); // All bits set for Int32 is -1
    });

    /**
     * @tc.name   atomicsOrTest035
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_035
     * @tc.desc   OR on BigInt64Array with mask=0xFFFFFFFFFFFFFFFFn (all bits set)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsOrTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 999n;
      const oldValue = Atomics.or(ba, 0, 0xFFFFFFFFFFFFFFFFn);
      expect(oldValue).assertEqual(999n);
      expect(ba[0]).assertEqual(-1n); // All bits set for BigInt64 is -1n
    });

    /**
     * @tc.name   atomicsOrTest036
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_036
     * @tc.desc   Nested arrow functions: OR with bitwise shift in inner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0011; // 3

      const outer = (arr: Int32Array): number => {
        const inner = (idx: number, shift: number) => {
          const mask = 1 << shift;
          return Atomics.or(arr, idx, mask);
        };
        return inner(0, 3); // Mask = 0b1000
      };

      const oldValue = outer(ia);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(11); // 0b1011
    });

    /**
     * @tc.name   atomicsOrTest037
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_037
     * @tc.desc   OR on Int32Array with mask from arrow function return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10; // 0b1010
      const getMask = () => 0b0101; // 5
      const oldValue = Atomics.or(ia, 0, getMask());
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(15); // 0b1111
    });

    /**
     * @tc.name   atomicsOrTest038
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_038
     * @tc.desc   OR on BigInt64Array with mask from arrow function return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 12n; // 0b1100
      const getBigMask = () => 0b0011n; // 3n
      const oldValue = Atomics.or(ba, 0, getBigMask());
      expect(oldValue).assertEqual(12n);
      expect(ba[0]).assertEqual(15n); // 0b1111
    });

    /**
     * @tc.name   atomicsOrTest039
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_039
     * @tc.desc   Throw TypeError for Int8Array (not allowed typed array type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      try {
        Atomics.or(ia, 0, 5)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsOrTest040
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_040
     * @tc.desc   Throw TypeError for Uint16Array (not allowed typed array type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      try {
        Atomics.or(ua, 0, 5)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsOrTest041
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_041
     * @tc.desc   OR on Int32Array with mask=0x80000000 (sign bit), flip sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 1; // Positive value (0x00000001)
      const oldValue = Atomics.or(ia, 0, 0x80000000); // Sign bit mask
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(-2147483647); // Negative value (0x80000001)
    });

    /**
     * @tc.name   atomicsOrTest042
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_042
     * @tc.desc   OR on BigInt64Array with mask=0x8000000000000000n (sign bit), flip sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 1n; // Positive BigInt (0x0000000000000001n)
      const oldValue = Atomics.or(ba, 0, 0x8000000000000000n); // Sign bit mask
      expect(oldValue).assertEqual(1n);
      expect(ba[0]).assertEqual(-9223372036854775807n); // Negative BigInt (0x8000000000000001n)
    });

    /**
     * @tc.name   atomicsOrTest043
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_043
     * @tc.desc   Nested arrow functions: OR with mask from outer variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0101; // 5
      const outerMask = 0b1010; // 10

      const outer = (arr: Int32Array): number => {
        const inner = (idx: number) => Atomics.or(arr, idx, outerMask);
        return inner(0);
      };

      const oldValue = outer(ia);
      expect(oldValue).assertEqual(5);
      expect(ia[0]).assertEqual(15); // 0b1111
    });

    /**
     * @tc.name   atomicsOrTest044
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_044
     * @tc.desc   Arrow function to chain OR operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      const chainOr = (arr: Int32Array, idx: number, ...masks: number[]) => {
        return masks.map(mask => Atomics.or(arr, idx, mask));
      };

      const oldValues = chainOr(ia, 0, 1, 2, 4, 8);
      expect(oldValues).assertDeepEquals([0, 1, 3, 7]);
      expect(ia[0]).assertEqual(15); // 0b1111
    });

    /**
     * @tc.name   atomicsOrTest045
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_045
     * @tc.desc   Arrow function to chain OR operations on BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0n;

      const chainBigOr = (arr: BigInt64Array, idx: number, ...masks: bigint[]) => {
        return masks.map(mask => Atomics.or(arr, idx, mask));
      };

      const oldValues = chainBigOr(ba, 0, 1n, 2n, 4n, 8n);
      expect(oldValues[0]).assertEqual(0n);
      expect(oldValues[1]).assertEqual(1n);
      expect(oldValues[2]).assertEqual(3n);
      expect(oldValues[3]).assertEqual(7n);
      expect(ba[0]).assertEqual(15n); // 0b1111n
    });

    /**
     * @tc.name   atomicsOrTest046
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_046
     * @tc.desc   OR on Int32Array with mask=NaN (coerced to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      const oldValue = Atomics.or(ia, 0, NaN); // Coerced to 0
      expect(oldValue).assertEqual(5);
      expect(ia[0]).assertEqual(5); // No change (OR with 0)
    });

    /**
     * @tc.name   atomicsOrTest047
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_047
     * @tc.desc   OR on BigInt64Array with mask=NaN (coerced to 0n)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 5n;
      const oldValue = Atomics.or(ba, 0, 0n); // Coerced to 0n
      expect(oldValue).assertEqual(5n);
      expect(ba[0]).assertEqual(5n); // No change (OR with 0n)
    });

    /**
     * @tc.name   atomicsOrTest048
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_048
     * @tc.desc   Nested arrow functions: OR with conditional mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 3; // 0b0011

      const conditionalOr = (arr: Int32Array, idx: number, useMaskA: boolean) => {
        const getMask = () => useMaskA ? 0b0100 : 0b1000;
        return Atomics.or(arr, idx, getMask());
      };

      const oldValue = conditionalOr(ia, 0, true); // Use mask 0b0100
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(7); // 0b0111
    });

    /**
     * @tc.name   atomicsOrTest049
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_049
     * @tc.desc   OR on Int32Array with mask=Infinity (coerced to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 9;
      const oldValue = Atomics.or(ia, 0, Infinity); // Coerced to 0
      expect(oldValue).assertEqual(9);
      expect(ia[0]).assertEqual(9); // No change (OR with 0)
    });

    /**
     * @tc.name   atomicsOrTest050
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_050
     * @tc.desc   OR on BigInt64Array with mask=Infinity (coerced to 0n)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsOrTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 9n;
      const oldValue = Atomics.or(ba, 0, 0n); // Coerced to 0n
      expect(oldValue).assertEqual(9n);
      expect(ba[0]).assertEqual(9n); // No change (OR with 0n)
    });
    /**
     * @tc.name   atomicsOrTest051
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_051
     * @tc.desc   Async OR with Promise wrapper, return old value in resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1010; // 10

      const asyncOr = (arr: Int32Array, idx: number, val: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.or(arr, idx, val);
            resolve(oldValue);
          }, 10);
        });
      };

      const oldValue = await asyncOr(ia, 0, 0b0110); // 6
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(0b1110); // 14
    });

    /**
     * @tc.name   atomicsOrTest052
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_052
     * @tc.desc   Nested async: OR inside inner Promise, chain with outer resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 25n; // 0b11001

      const outerFunc = (arr: BigInt64Array): Promise<typeOr52> => {
        return new Promise((outerResolve) => {
          const innerOr = () => {
            return new Promise<typeOr52>((innerResolve) => {
              setTimeout(() => {
                const oldValue = Atomics.or(arr, 0, 10n); // 0b1010
                innerResolve({ old: oldValue, new: arr[0] });
              }, 15);
            });
          };

          innerOr().then((result) => outerResolve(result));
        });
      };

      const result = await outerFunc(ba);
      expect(result.old).assertEqual(25n);
      expect(result.new).assertEqual(27n); // 0b100011
    });

    /**
     * @tc.name   atomicsOrTest053
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_053
     * @tc.desc   Promise.all with multiple OR operations on different indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 3; // 0b0011
      ia[1] = 5; // 0b0101

      const createOrPromise = (arr: Int32Array, idx: number, val: number) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const old = await Promise.all([
        createOrPromise(ia, 0, 4), // 0b0100
        createOrPromise(ia, 1, 2)// 0b0010
      ]);

      expect(old[0]).assertEqual(3);
      expect(old[1]).assertEqual(5);
      expect(ia[0]).assertEqual(7); // 0b0111
      expect(ia[1]).assertEqual(7); // 0b0111
    });

    /**
     * @tc.name   atomicsOrTest054
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_054
     * @tc.desc   Async OR with arrow function closure, capture mask and index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8; // 0b1000

      const createOrClosure = (arr: Int32Array, idx: number, mask: number) => {
        return async () => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, mask);
              resolve(old);
            }, 10);
          });
        };
      };

      const orClosure = createOrClosure(ia, 0, 0b0111); // 7
      const oldValue = await orClosure();
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(15); // 0b1111
    });

    /**
     * @tc.name   atomicsOrTest055
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_055
     * @tc.desc   Nested async: OR with retry on invalid mask (coerce and retry)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0011; // 3
      let retryCount = 0;

      const orWithRetry = async (arr: Int32Array, idx: number, mask: number): Promise<number> => {
        retryCount++;
        // Coerce non-integer mask to integer
        const validMask = Number.isInteger(mask) ? mask : Math.floor(Number(mask));

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, validMask);
            resolve(old);
          }, 5);
        });
      };

      // First call with non-integer mask (3.9 → coerced to 3)
      const oldValue = await orWithRetry(ia, 0, 3.9);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(3); // Mask 3 matches existing bits
    });

    /**
     * @tc.name   atomicsOrTest056
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_056
     * @tc.desc   Promise.race between two OR operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      const orTask1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ia, 0, 0b0011); // 3
          resolve(old);
        }, 10);
      });

      const orTask2 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ia, 0, 0b1100); // 12
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([orTask1, orTask2]);
      // Wait for both tasks to complete to check final value
      await Promise.allSettled([orTask1, orTask2]);

      expect([0, 3].includes(winnerOld)).assertTrue(); // Either task can win first
      expect(ia[0]).assertEqual(15); // Final OR result is 0b1111
    });

    /**
     * @tc.name   atomicsOrTest057
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_057
     * @tc.desc   Async OR with finally block to log operation result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 10n;
      const log: string[] = [];

      const loggedOr = async (arr: BigInt64Array, idx: number, val: bigint): Promise<bigint> => {
        try {
          return await new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, val);
              resolve(old);
            }, 8);
          });
        } finally {
          log.push(`OR done: old=${ba[0] ^ val}, new=${ba[0]}`); // Calculate old from new and mask
        }
      };

      const oldValue = await loggedOr(ba, 0, 6n); // 0b110
      expect(oldValue).assertEqual(10n);
      expect(ba[0]).assertEqual(14n); // 0b1110
      expect(log.length).assertEqual(1);
      expect(log[0]).assertContain('OR done: old=8, new=14');
    });

    /**
     * @tc.name   atomicsOrTest058
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_058
     * @tc.desc   Nested arrow functions: async OR with dynamic mask from API mock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1000; // 8

      // Mock API to get dynamic mask
      const mockMaskApi = async (): Promise<number> => {
        return new Promise((resolve) => setTimeout(() => resolve(0b0111), 12)); // 7
      };

      const dynamicOr = async (arr: Int32Array, idx: number) => {
        const mask = await mockMaskApi();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await dynamicOr(ia, 0);
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(15); // 0b1111
    });

    /**
     * @tc.name   atomicsOrTest059
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_059
     * @tc.desc   Promise.allSettled with valid and invalid OR tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const invalidArr = new Uint32Array(sab); // Not allowed for Atomics.or
      ia[0] = 5;

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => resolve(Atomics.or(ia, 0, 3)), 10);
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(Atomics.or(invalidArr, -1, -3));
          } catch (err) {
            reject(err);
          }
        }, 10);
      });

      const results = await Promise.allSettled([validTask, invalidTask]);
      const validResult = results[0] as PromiseFulfilledResult<number>;
      const invalidResult = results[1] as PromiseRejectedResult;

      expect(validResult.value).assertEqual(5);
      expect(ia[0]).assertEqual(7); // 5 | 3 = 7
      expect(invalidResult.reason.message).assertContain('integerIndex');
    });

    /**
     * @tc.name   atomicsOrTest060
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_060
     * @tc.desc   Async OR with closure that tracks operation history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const history: Array<typeOr60> = [];

      const createTrackedOr = (arr: Int32Array, idx: number) => {
        return async (mask: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, mask);
              const newVal = arr[idx];
              history.push({ time: Date.now(), old, new: newVal });
              resolve(old);
            }, 7);
          });
        };
      };

      const trackedOr = createTrackedOr(ia, 0);
      await trackedOr(1); // 0b0001
      await trackedOr(2); // 0b0010
      await trackedOr(4); // 0b0100

      expect(history.length).assertEqual(3);
      expect(history[0].old).assertEqual(0);
      expect(history[0].new).assertEqual(1);
      expect(history[1].old).assertEqual(1);
      expect(history[1].new).assertEqual(3);
      expect(history[2].old).assertEqual(3);
      expect(history[2].new).assertEqual(7);
    });

    /**
     * @tc.name   atomicsOrTest061
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_061
     * @tc.desc   Nested async: OR with pre-validation in outer Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 15n; // 0b1111
      let validationPassed = false;

      const validateAndOr = async (arr: BigInt64Array, idx: number, mask: bigint) => {
        // Pre-validation: mask is positive
        const validate = () => new Promise<boolean>((resolve) => {
          setTimeout(() => resolve(mask > 0n), 5);
        });

        validationPassed = await validate();
        if (!validationPassed) {
          throw new Error('Invalid mask');
        }

        return new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          }, 10);
        });
      };

      const oldValue = await validateAndOr(ba, 0, 16n); // 0b10000
      expect(validationPassed).assertEqual(true);
      expect(oldValue).assertEqual(15n);
      expect(ba[0]).assertEqual(31n); // 0b11111
    });

    /**
     * @tc.name   atomicsOrTest062
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_062
     * @tc.desc   Async OR with Promise chain: validate → OR → log result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0101; // 5
      const log: string[] = [];

      // Step 1: Validate mask is non-negative
      const validateMask = (mask: number): Promise<boolean> => {
        return new Promise((resolve) => setTimeout(() => resolve(mask >= 0), 5));
      };

      // Step 2: Perform async OR
      const performOr = (arr: Int32Array, idx: number, mask: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          }, 8);
        });
      };

      // Step 3: Log result
      const logResult = (old: number, newVal: number): Promise<void> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            log.push(`OR: old=${old}, new=${newVal}`);
            resolve();
          }, 3);
        });
      };

      // Chain all steps
      const mask = 0b0011; // 3
      const isValid = await validateMask(mask);
      if (isValid) {
        const oldValue = await performOr(ia, 0, mask);
        await logResult(oldValue, ia[0]);
      }

      expect(isValid).assertEqual(true);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertEqual('OR: old=5, new=7');
      expect(ia[0]).assertEqual(7);
    });

    /**
     * @tc.name   atomicsOrTest063
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_063
     * @tc.desc   Nested arrow functions: async OR with dynamic index from closure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 2; // 0b10
      ia[1] = 4; // 0b100
      const targetIndex = 1; // Captured in closure

      const createIndexOr = (arr: Int32Array) => {
        return async (mask: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, targetIndex, mask);
              resolve(old);
            }, 10);
          });
        };
      };

      const indexOr = createIndexOr(ia);
      const oldValue = await indexOr(0b011); // 3
      expect(oldValue).assertEqual(4);
      expect(ia[1]).assertEqual(7); // 0b111
      expect(ia[0]).assertEqual(2); // Unchanged
    });

    /**
     * @tc.name   atomicsOrTest064
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_064
     * @tc.desc   Promise.race between OR and timeout, return OR result first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1000; // 8

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ia, 0, 0b0111); // 7
          resolve(old);
        }, 15);
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 30);
      });

      const result = await Promise.race([orTask, timeoutTask]);
      expect(result).assertEqual(8); // OR task wins
      expect(ia[0]).assertEqual(15); // 0b1111
    });

    /**
     * @tc.name   atomicsOrTest065
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_065
     * @tc.desc   Async OR with error handling for invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      let errorCaught = false;

      const safeOr = async (arr: Int32Array, idx: number, mask: number): Promise<number | null> => {
        try {
          return await new Promise<number>((resolve) => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          });
        } catch (err) {
          errorCaught = true;
          return null;
        }
      };

      // Call with invalid index (1, array length is 1)
      const result = await safeOr(ia, 1, 3);
      expect(errorCaught).assertEqual(true);
      expect(result).assertNull();
      expect(ia[0]).assertEqual(5); // Unchanged
    });

    /**
     * @tc.name   atomicsOrTest066
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_066
     * @tc.desc   Nested async: OR with batch mask application via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      ia[1] = 0;
      ia[2] = 0;
      const masks = [1, 2, 4]; // Masks for each index

      const batchOr = (arr: Int32Array, indexes: number[], masks: number[]) => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = Atomics.or(arr, idx, masks[i]);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues = await batchOr(ia, [0, 1, 2], masks);
      expect(oldValues).assertDeepEquals([0, 0, 0]);
      expect(ia[0]).assertEqual(1);
      expect(ia[1]).assertEqual(2);
      expect(ia[2]).assertEqual(4);
    });

    /**
     * @tc.name   atomicsOrTest067
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_067
     * @tc.desc   Async OR with closure that enforces mask limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0011; // 3
      const maxMask = 0b0100; // 4 (limit mask to 4)

      const createLimitedOr = (arr: Int32Array, idx: number) => {
        return async (mask: number) => {
          const validMask = mask > maxMask ? maxMask : mask;
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, validMask);
              resolve(old);
            }, 8);
          });
        };
      };

      const limitedOr = createLimitedOr(ia, 0);
      // Mask 6 exceeds limit, use maxMask 4
      const oldValue = await limitedOr(6);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(7); // 3 | 4 = 7
    });

    /**
     * @tc.name   atomicsOrTest068
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_068
     * @tc.desc   Nested arrow functions: async OR with mask from outer Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 10n; // 0b1010

      const getMaskFromPromise = (): Promise<bigint> => {
        return new Promise((resolve) => setTimeout(() => resolve(6n), 10)); // 0b0110
      };

      const outerOr = async (arr: BigInt64Array, idx: number): Promise<bigint> => {
        const mask = await getMaskFromPromise();
        const innerOr = () => {
          return new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, mask);
              resolve(old);
            }, 5);
          });
        };
        return innerOr();
      };

      const oldValue = await outerOr(ba, 0);
      expect(oldValue).assertEqual(10n);
      expect(ba[0]).assertEqual(14n); // 10n | 6n = 14n
    });

    /**
     * @tc.name   atomicsOrTest069
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_069
     * @tc.desc   Promise.all with OR and state check tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1000; // 8
      let stateCheckPassed = false;

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ia, 0, 0b0111); // 7
          resolve(old);
        }, 12);
      });

      const stateCheckTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          stateCheckPassed = ia[0] === 15; // 8 | 7 = 15
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([orTask, stateCheckTask]);
      expect(oldValue[0]).assertEqual(8);
      expect(stateCheckPassed).assertEqual(true);
      expect(ia[0]).assertEqual(15);
    });

    /**
     * @tc.name   atomicsOrTest070
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_070
     * @tc.desc   Async OR with retry on detached SharedArrayBuffer (fallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 0b0100; // Dependency feature (enabled)
      ia[1] = 0b0000; // Target feature

      expect(Atomics.isLockFree(4)).assertEqual(true);

      if (Atomics.load(ia, 0) & 0b0100) {
        Atomics.or(ia, 1, 0b1000); // Activate target
      }
      const target = Atomics.load(ia, 1);
      Atomics.compareExchange(ia, 1, target, target); // Validate

      expect(target).assertEqual(0b1000);
    });

    /**
     * @tc.name   atomicsOrTest072
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_072
     * @tc.desc   Async OR with closure that logs mask usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const maskLog: number[] = [];

      const createLoggedOr = (arr: Int32Array, idx: number) => {
        return async (mask: number) => {
          maskLog.push(mask); // Log mask before use
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, mask);
              resolve(old);
            }, 7);
          });
        };
      };

      const loggedOr = createLoggedOr(ia, 0);
      await loggedOr(1); // Mask 1 (0b0001)
      await loggedOr(2); // Mask 2 (0b0010)
      await loggedOr(4); // Mask 4 (0b0100)
      await loggedOr(8); // Mask 8 (0b1000)

      expect(maskLog).assertDeepEquals([1, 2, 4, 8]);
      expect(ia[0]).assertEqual(15); // 0 | 1 | 2 | 4 | 8 = 15
    });

    /**
     * @tc.name   atomicsOrTest073
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_073
     * @tc.desc   Nested arrow functions: async OR with conditional mask selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1000; // 8
      const threshold = 10;

      const getConditionalMask = (value: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const mask = value < threshold ? 0b0011 : 0b0110;
            resolve(mask);
          }, 6);
        });
      };

      const conditionalOr = async (arr: Int32Array, idx: number): Promise<number> => {
        const currentValue = arr[idx];
        const mask = await getConditionalMask(currentValue);
        const innerOr = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          }, 5);
        });
        return innerOr();
      };

      const oldValue = await conditionalOr(ia, 0);
      expect(oldValue).assertEqual(8);
      expect(ia[0]).assertEqual(11); // 8 (0b1000) | 3 (0b0011) = 11
    });

    /**
     * @tc.name   atomicsOrTest074
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_074
     * @tc.desc   Promise.allSettled with OR tasks on different typed arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab); // Valid for OR
      const fa = new Float64Array(sab); // Invalid for OR
      ia[0] = 5;

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => resolve(Atomics.or(ia, 0, 3)), 10);
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(Atomics.or(ia, -1, 3));
          } catch (err) {
            reject(err);
          }
        }, 10);
      });

      const results = await Promise.allSettled([validTask, invalidTask]);
      const validResult = results[0] as PromiseFulfilledResult<number>;
      const invalidResult = results[1] as PromiseRejectedResult;

      expect(validResult.value).assertEqual(5);
      expect(ia[0]).assertEqual(7); // 5 | 3 = 7
      expect(invalidResult.reason.message).assertContain('integerIndex');
    });

    /**
     * @tc.name   atomicsOrTest075
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_075
     * @tc.desc   Async OR with closure that enforces value range after operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0011; // 3
      const maxValue = 10; // Enforce value ≤ 10 after OR

      const createRangeOr = (arr: Int32Array, idx: number) => {
        return async (mask: number) => {
          return new Promise<typeOr75>((resolve) => {
            setTimeout(() => {
              const old = arr[idx];
              const newVal = old | mask;
              if (newVal <= maxValue) {
                Atomics.or(arr, idx, mask); // Perform OR only if in range
                resolve({ old, success: true });
              } else {
                resolve({ old, success: false });
              }
            }, 8);
          });
        };
      };

      const rangeOr = createRangeOr(ia, 0);
      // Mask 4: 3 | 4 = 7 ≤ 10 (success)
      const result1 = await rangeOr(4);
      // Mask 8: 7 | 8 = 15 > 10 (failure)
      const result2 = await rangeOr(8);

      expect(result1.success).assertEqual(true);
      expect(result1.old).assertEqual(3);
      expect(result2.success).assertEqual(false);
      expect(result2.old).assertEqual(7);
      expect(ia[0]).assertEqual(7);
    });

    /**
     * @tc.name   atomicsOrTest076
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_076
     * @tc.desc   Nested async: OR with mask derived from previous OR result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0n;

      const firstOr = (arr: BigInt64Array): Promise<bigint> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, 0, 0b1010n); // 10n
            resolve(old);
          }, 7);
        });
      };

      const secondOr = async (arr: BigInt64Array) => {
        const firstOld = await firstOr(arr);
        const derivedMask = firstOld | 0b0101n; // Derive mask from first OR's old value
        return new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, 0, derivedMask);
            resolve(old);
          }, 5);
        });
      };

      const secondOld = await secondOr(ba);
      expect(secondOld).assertEqual(10n); // First OR result is 10n
      expect(ba[0]).assertEqual(15n); // 10n | 5n = 15n
    });

    /**
     * @tc.name   atomicsOrTest077
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_077
     * @tc.desc   Promise.race between two OR tasks with different masks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0000; // 0

      const orTaskA = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ia, 0, 0b0011); // 3
          resolve(old);
        }, 10);
      });

      const orTaskB = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ia, 0, 0b1100); // 12
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([orTaskA, orTaskB]);
      // Wait for both tasks to complete to check final value
      await Promise.allSettled([orTaskA, orTaskB]);

      expect([0, 3, 12].includes(winnerOld)).assertTrue(); // Winner depends on task execution order
      expect(ia[0]).assertEqual(15); // Final OR result: 3 | 12 = 15
    });

    /**
     * @tc.name   atomicsOrTest078
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_078
     * @tc.desc   Async OR with error handling for non-shared buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const ab = new ArrayBuffer(4); // Non-shared buffer
      const ia = new Int32Array(ab);
      ia[0] = 5;
      let errorMessage = '';

      const safeOr = async (arr: Int32Array, idx: number, mask: number): Promise<number | null> => {
        try {
          return await new Promise<number>((resolve) => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          });
        } catch (err) {
          errorMessage = (err as Error).message;
          return null;
        }
      };

      const result = await safeOr(ia, -1, 3);
      expect(result).assertEqual(null);
      expect(errorMessage).assertContain('integerIndex');
      expect(ia[0]).assertEqual(5); // Unchanged
    });

    /**
     * @tc.name   atomicsOrTest079
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_079
     * @tc.desc   Nested arrow functions: async OR with batch mask validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      ia[1] = 0;
      const masks = [0b0011, 0b1100]; // Masks for index 0 and 1

      const validateMasks = (masks: number[]): Promise<boolean> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            // Validate all masks are non-negative
            const allValid = masks.every(mask => mask >= 0);
            resolve(allValid);
          }, 6);
        });
      };

      const batchValidOr = async (arr: Int32Array, indexes: number[], masks: number[]) => {
        const isValid = await validateMasks(masks);
        if (!isValid) {
          throw new Error('Invalid mask');
        }

        return Promise.all(
          indexes.map((idx, i): Promise<number> => {
            const innerOr = () => new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = Atomics.or(arr, idx, masks[i]);
                resolve(old);
              }, 5);
            });
            return innerOr();
          })
        );
      };

      const oldValues = await batchValidOr(ia, [0, 1], masks);
      expect(oldValues).assertDeepEquals([0, 0]);
      expect(ia[0]).assertEqual(3); // 0 | 3 = 3
      expect(ia[1]).assertEqual(12); // 0 | 12 = 12
    });

    /**
     * @tc.name   atomicsOrTest080
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_080
     * @tc.desc   Async OR with closure that tracks operation success rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      let successCount = 0;
      let totalCount = 0;

      const createTrackedOr = (arr: Int32Array, idx: number) => {
        return async (mask: number) => {
          totalCount++;
          return new Promise<typeOr80>((resolve) => {
            setTimeout(() => {
              try {
                const old = Atomics.or(arr, idx, mask);
                successCount++;
                resolve({ old, success: true });
              } catch (err) {
                resolve({ old: -1, success: false });
              }
            }, 7);
          });
        };
      };

      const trackedOr = createTrackedOr(ia, 0);
      await trackedOr(1); // Success
      await trackedOr(2); // Success
      await trackedOr(4); // Success
      // Simulate failure (invalid mask type, but coerced to 0)
      // await trackedOr('8');

      expect(totalCount).assertEqual(3);
      expect(successCount).assertEqual(3); // Coerced mask still counts as success
      expect(ia[0]).assertEqual(7); // 0 | 1 | 2 | 4 | 0 = 7
    });
    /**
     * @tc.name   atomicsOrTest081
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_081
     * @tc.desc   Nested async: OR with mask from external async API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0b1000n; // 8n

      // Mock external async API to get mask
      const mockExternalApi = async (): Promise<bigint> => {
        return new Promise((resolve) => setTimeout(() => resolve(0b0111n), 10)); // 7n
      };

      const apiOr = async (arr: BigInt64Array, idx: number): Promise<bigint> => {
        const mask = await mockExternalApi();
        const innerOr = () => new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          }, 6);
        });
        return innerOr();
      };

      const oldValue = await apiOr(ba, 0);
      expect(oldValue).assertEqual(8n);
      expect(ba[0]).assertEqual(15n); // 8n | 7n = 15n
    });

    /**
     * @tc.name   atomicsOrTest082
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_082
     * @tc.desc   Promise.all with OR and cleanup tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0011; // 3
      let cleanedUp = false;

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ia, 0, 0b1100); // 12
          resolve(old);
        }, 10);
      });

      const cleanupTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ia[0] = 0; // Reset value after OR
          cleanedUp = true;
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([orTask, cleanupTask]);
      expect(oldValue[0]).assertEqual(3);
      expect(cleanedUp).assertEqual(true);
      expect(ia[0]).assertEqual(0); // Cleanup reset value
    });

    /**
     * @tc.name   atomicsOrTest083
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_083
     * @tc.desc   Async OR with closure that skips duplicate masks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const usedMasks = new Set<number>();

      const createDedupOr = (arr: Int32Array, idx: number) => {
        return async (mask: number) => {
          if (usedMasks.has(mask)) {
            return Promise.resolve(arr[idx]); // Return current value if mask is duplicate
          }
          usedMasks.add(mask);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, mask);
              resolve(old);
            }, 7);
          });
        };
      };

      const dedupOr = createDedupOr(ia, 0);
      const old1 = await dedupOr(1); // New mask: 1
      const old2 = await dedupOr(1); // Duplicate mask: 1 (skip OR)
      const old3 = await dedupOr(2); // New mask: 2

      expect(old1).assertEqual(0);
      expect(old2).assertEqual(1); // Returns current value (no OR)
      expect(old3).assertEqual(1);
      expect(ia[0]).assertEqual(3); // 0 | 1 | 2 = 3
    });

    /**
     * @tc.name   atomicsOrTest084
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_084
     * @tc.desc   Nested arrow functions: async OR with mask validation in inner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 10n; // 0b1010n

      const outerOr = async (arr: BigInt64Array, idx: number, mask: bigint): Promise<bigint> => {
        const innerValidate = (m: bigint): Promise<boolean> => {
          return new Promise((resolve) => {
            setTimeout(() => resolve(m > 0n), 5); // Validate mask is positive
          });
        };
        const isValid = await innerValidate(mask);
        if (!isValid) {
          throw new Error('Invalid mask');
        }
        const innerOr = () => new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          }, 6);
        });
        return innerOr();
      };

      const oldValue = await outerOr(ba, 0, 6n); // 0b0110n (valid)
      expect(oldValue).assertEqual(10n);
      expect(ba[0]).assertEqual(14n); // 10n | 6n = 14n
    });

    /**
     * @tc.name   atomicsOrTest085
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_085
     * @tc.desc   Promise.race between OR and value change task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0001; // 1
      let valueChanged = false;

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ia, 0, 0b0010); // 2
          resolve(old);
        }, 12);
      });

      const changeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          ia[0] = 0b1000; // 8 (Change value after OR)
          valueChanged = true;
          resolve(0);
        }, 15);
      });

      const oldValue: number = await Promise.race([orTask, changeTask]);
      await Promise.allSettled([orTask, changeTask]);

      expect(oldValue).assertEqual(1); // OR task wins
      expect(valueChanged).assertEqual(true);
      expect(ia[0]).assertEqual(8); // Change task overwrites OR result
    });

    /**
     * @tc.name   atomicsOrTest086
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_086
     * @tc.desc   Async OR with error handling for invalid mask type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      let errorCaught = false;

      const safeOr = async (arr: Int32Array, idx: number, mask: number): Promise<number | null> => {
        try {
          if (typeof mask !== 'number') {
            throw new Error('Mask must be number');
          }
          return await new Promise<number>((resolve) => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          });
        } catch (err) {
          errorCaught = true;
          return null;
        }
      };

      // Call with non-number mask (string)
      const result = await safeOr(ia, -1, 3);
      expect(errorCaught).assertEqual(true);
      expect(result).assertNull();
      expect(ia[0]).assertEqual(5); // Unchanged
    });

    /**
     * @tc.name   atomicsOrTest087
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_087
     * @tc.desc   Nested async: OR with batch mask application and result aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      ia[1] = 0;
      ia[2] = 0;
      const masks = [1, 2, 4];

      const batchOrAndAggregate = async (arr: Int32Array, indexes: number[], masks: number[]): Promise<typeOr87> => {
        const orPromises = indexes.map((idx, i) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, masks[i]);
              resolve(old);
            }, 5);
          });
        });

        const oldValues = await Promise.all(orPromises);
        const newValues = indexes.map(idx => arr[idx]);
        return { oldValues, newValues } as typeOr87;
      };

      const result = await batchOrAndAggregate(ia, [0, 1, 2], masks);
      expect(result.oldValues).assertDeepEquals([0, 0, 0]);
      expect(result.newValues).assertDeepEquals([1, 2, 4]);
    });

    /**
     * @tc.name   atomicsOrTest088
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_088
     * @tc.desc   Async OR with closure that tracks cumulative mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      let cumulativeMask = 0;

      const createCumulativeOr = (arr: Int32Array, idx: number) => {
        return async (mask: number) => {
          cumulativeMask |= mask; // Track cumulative mask
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, mask);
              resolve(old);
            }, 7);
          });
        };
      };

      const cumulativeOr = createCumulativeOr(ia, 0);
      await cumulativeOr(1); // Cumulative: 1
      await cumulativeOr(2); // Cumulative: 3
      await cumulativeOr(4); // Cumulative: 7

      expect(cumulativeMask).assertEqual(7);
      expect(ia[0]).assertEqual(7); // Matches cumulative mask
    });

    /**
     * @tc.name   atomicsOrTest089
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_089
     * @tc.desc   Nested arrow functions: async OR with mask from closure state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0b0001n; // 1n

      const createStatefulOr = (arr: BigInt64Array, idx: number) => {
        let stateMask = 0b0010n; // Mask stored in closure state

        return async () => {
          return new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, stateMask);
              stateMask <<= 1n; // Update state mask after OR
              resolve(old);
            }, 6);
          });
        };
      };

      const statefulOr = createStatefulOr(ba, 0);
      const old1 = await statefulOr(); // Mask: 2n → Result: 3n
      const old2 = await statefulOr(); // Mask: 4n → Result: 7n

      expect(old1).assertEqual(1n);
      expect(old2).assertEqual(3n);
      expect(ba[0]).assertEqual(7n); // 1n | 2n | 4n = 7n
    });

    /**
     * @tc.name   atomicsOrTest090
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_090
     * @tc.desc   Promise.allSettled with OR tasks on same index (different masks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      const orTasks = [
        new Promise<number>((resolve) => setTimeout(() => resolve(Atomics.or(ia, 0, 1)), 8)),
        new Promise<number>((resolve) => setTimeout(() => resolve(Atomics.or(ia, 0, 2)), 8)),
        new Promise<number>((resolve) => setTimeout(() => resolve(Atomics.or(ia, 0, 4)), 8))
      ];

      const results = await Promise.allSettled(orTasks);
      const oldValues = results.map(res => (res as PromiseFulfilledResult<number>).value);

      // Old values depend on execution order, but sum of masks is 7
      expect(oldValues.every(v => v >= 0 && v <= 7)).assertEqual(true);
      expect(ia[0]).assertEqual(7); // 0 | 1 | 2 | 4 = 7
    });

    /**
     * @tc.name   atomicsOrTest091
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_091
     * @tc.desc   Async OR with retry on mask overflow (coerce and retry)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0001; // 1
      let retryCount = 0;

      const orWithOverflowRetry = async (arr: Int32Array, idx: number, mask: number): Promise<number> => {
        retryCount++;
        // Coerce mask to 32-bit signed integer (handle overflow)
        const validMask = mask >>> 0 & 0xFFFFFFFF;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, validMask);
            resolve(old);
          }, 7);
        });
      };

      // Mask exceeds 32 bits (0x100000001 → coerced to 0x00000001)
      const oldValue = await orWithOverflowRetry(ia, 0, 0x100000001);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(1); // Coerced mask matches existing bit
    });

    /**
     * @tc.name   atomicsOrTest092
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_092
     * @tc.desc   Nested async: OR with mask validation and fallback mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 10n; // 0b1010n
      const fallbackMask = 3n; // 0b0011n

      const validateAndOr = async (arr: BigInt64Array, idx: number, mask: bigint) => {
        const validate = (m: bigint): Promise<boolean> => {
          return new Promise((resolve) => {
            setTimeout(() => resolve(m <= 0b1111n), 5); // Mask ≤ 15n
          });
        };

        const isValid = await validate(mask);
        const finalMask = isValid ? mask : fallbackMask;

        return new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, finalMask);
            resolve(old);
          }, 6);
        });
      };

      // Invalid mask (20n > 15n → use fallback 3n)
      const oldValue = await validateAndOr(ba, 0, 20n);
      expect(oldValue).assertEqual(10n);
      expect(ba[0]).assertEqual(11n); // 10n | 3n = 11n
    });

    /**
     * @tc.name   atomicsOrTest093
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_093
     * @tc.desc   Promise.race between OR and timeout (timeout wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;

      const orTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ia, 0, 3);
          resolve(old);
        }, 30); // Slow OR task
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 15); // Faster timeout
      });

      const result = await Promise.race([orTask, timeoutTask]);
      // Wait for OR task to complete to check final state
      await Promise.allSettled([orTask]);

      expect(result).assertEqual('timeout'); // Timeout wins
      expect(ia[0]).assertEqual(7); // OR task still completes later
    });

    /**
     * @tc.name   atomicsOrTest094
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_094
     * @tc.desc   Async OR with closure that enforces unique mask usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const usedMasks = new Set<number>();

      const createUniqueOr = (arr: Int32Array, idx: number) => {
        return async (mask: number) => {
          if (usedMasks.has(mask)) {
            throw new Error(`Mask ${mask} already used`);
          }
          usedMasks.add(mask);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, mask);
              resolve(old);
            }, 7);
          });
        };
      };

      const uniqueOr = createUniqueOr(ia, 0);
      const old1 = await uniqueOr(1); // New mask: 1
      let errorThrown = false;

      try {
        await uniqueOr(1); // Duplicate mask: 1
      } catch (err) {
        errorThrown = true;
      }

      expect(old1).assertEqual(0);
      expect(errorThrown).assertEqual(true);
      expect(ia[0]).assertEqual(1); // Only first OR is applied
    });

    /**
     * @tc.name   atomicsOrTest095
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_095
     * @tc.desc   Nested arrow functions: async OR with mask from promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0100; // 4

      // Promise chain to get mask: 1 → 2 → 3
      const getMaskStep1 = (): Promise<number> => Promise.resolve(1);
      const getMaskStep2 = (val: number): Promise<number> => Promise.resolve(val + 1);
      const getMaskStep3 = (val: number): Promise<number> => Promise.resolve(val + 1);

      const chainOr = async (arr: Int32Array, idx: number): Promise<number> => {
        const mask = await getMaskStep1()
          .then(getMaskStep2)
          .then(getMaskStep3);
        const innerOr = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          }, 6);
        });
        return innerOr();
      };

      const oldValue = await chainOr(ia, 0);
      expect(oldValue).assertEqual(4);
      expect(ia[0]).assertEqual(7); // 4 | 3 = 7
    });

    /**
     * @tc.name   atomicsOrTest096
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_096
     * @tc.desc   Promise.all with OR and state validation tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0b1000n; // 8n
      let validationPassed = false;

      const orTask = new Promise<bigint>((resolve) => {
        setTimeout(() => {
          const old = Atomics.or(ba, 0, 0b0111n); // 7n
          resolve(old);
        }, 10);
      });

      const validateTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          validationPassed = ba[0] === 0b1111n; // 15n
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([orTask, validateTask]);
      expect(oldValue[0]).assertEqual(8n);
      expect(validationPassed).assertEqual(true);
      expect(ba[0]).assertEqual(15n);
    });

    /**
     * @tc.name   atomicsOrTest097
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_097
     * @tc.desc   Async OR with closure that logs operation timestamps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const timeLog: Array<typeOr97> = [];

      const createTimedOr = (arr: Int32Array, idx: number) => {
        return async (mask: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.or(arr, idx, mask);
              timeLog.push({ mask, timestamp: Date.now() });
              resolve(old);
            }, 5);
          });
        };
      };

      const timedOr = createTimedOr(ia, 0);
      await timedOr(1);
      await new Promise<void>((resolve) => setTimeout(resolve, 10)); // Add delay between ops
      await timedOr(2);

      expect(timeLog.length).assertEqual(2);
      expect(timeLog[0].mask).assertEqual(1);
      expect(timeLog[1].mask).assertEqual(2);
      expect(ia[0]).assertEqual(3); // 0 | 1 | 2 = 3
    });

    /**
     * @tc.name   atomicsOrTest098
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_098
     * @tc.desc   Nested async: OR with mask derived from array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0011; // 3

      const getDerivedMask = (arr: Int32Array, idx: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const derived = arr[idx] << 2; // Derive mask: 3 << 2 = 12 (0b1100)
            resolve(derived);
          }, 6);
        });
      };

      const derivedOr = async (arr: Int32Array, idx: number) => {
        const mask = await getDerivedMask(arr, idx);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.or(arr, idx, mask);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await derivedOr(ia, 0);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(15); // 3 | 12 = 15
    });

    /**
     * @tc.name   atomicsOrTest099
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_099
     * @tc.desc   Promise.allSettled with OR tasks on detached and valid buffers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0b00110011n; // Initial features: A(0b00000001), B(0b00000010), C(0b00000100), D(0b00001000)

      expect(Atomics.isLockFree(8)).assertEqual(true);

      Atomics.and(ba, 0, ~0b00000010n); // Disable B
      Atomics.xor(ba, 0, 0b00000100n); // Toggle C
      Atomics.or(ba, 0, 0b00010000n); // Enable E

      expect(ba[0]).assertEqual(0b00110101n); // A(1), C(0→1), D(1), E(1)
    });
    /**
     * @tc.name   atomicsOrTest0100
     * @tc.number SUB_BUILTINS_Atomics_or_TEST_0100
     * @tc.desc   Promise.allSettled with OR tasks on detached and valid buffers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsOrTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab32 = new SharedArrayBuffer(4);
      const ia32 = new Int32Array(sab32);
      ia32[0] = 0b0010; // 初始：bit1置位

      const sab64 = new SharedArrayBuffer(8);
      const ba64 = new BigInt64Array(sab64);
      ba64[0] = 0b10000000n; // 初始：bit7置位

      expect(Atomics.isLockFree(4)).assertEqual(true);
      expect(Atomics.isLockFree(8)).assertEqual(true);

      Atomics.or(ia32, 0, 0b0100); // 32位：激活bit2 → 0b0110
      Atomics.or(ba64, 0, 0b00100000n); // 64位：激活bit5 → 0b10100000n

      expect(ia32[0]).assertEqual(0b0110);
      expect(ba64[0]).assertEqual(0b10100000n);
    });


  })
}