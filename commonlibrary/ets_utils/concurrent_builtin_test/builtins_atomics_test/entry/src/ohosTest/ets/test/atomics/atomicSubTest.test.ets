import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  typeSub25,
  typeSub46,
  typeSub56,
  typeSub63,
  typeSub71,
  typeSub76,
  typeSub83,
  typeSub93,
  typeSub98
} from './atomics';
import { sleep } from './utils';


interface GeneratedTypeLiteralInterface_2 {
  old: bigint;
  new: bigint;
}

export default function atomicsSubTest() {
  describe('atomicsSubTest', () => {
    afterEach(async () => {
      await sleep(10)
    })
    /**
     * @tc.name   atomicsSubTest001
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_001
     * @tc.desc   Basic Int32Array subtraction, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const oldValue = Atomics.sub(ia, 0, 3);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(7);
    });

    /**
     * @tc.name   atomicsSubTest002
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_002
     * @tc.desc   BigInt64Array subtraction with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 20n;
      const oldValue = Atomics.sub(ba, 0, 5n);
      expect(oldValue).assertEqual(20n);
      expect(ba[0]).assertEqual(15n);
    });

    /**
     * @tc.name   atomicsSubTest003
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_003
     * @tc.desc   Subtract 0, keep original value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15;
      const oldValue = Atomics.sub(ia, 0, 0);
      expect(oldValue).assertEqual(15);
      expect(ia[0]).assertEqual(15);
    });

    /**
     * @tc.name   atomicsSubTest004
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_004
     * @tc.desc   Subtract from Int32Array index 1 (multi-element buffer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 12;
      const oldValue = Atomics.sub(ia, 1, 4);
      expect(oldValue).assertEqual(12);
      expect(ia[1]).assertEqual(8);
      expect(ia[0]).assertEqual(5); // Unchanged
    });

    /**
     * @tc.name   atomicsSubTest005
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_005
     * @tc.desc   Subtract to get negative result in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 3;
      const oldValue = Atomics.sub(ia, 0, 5);
      expect(oldValue).assertEqual(3);
      expect(ia[0]).assertEqual(-2);
    });

    /**
     * @tc.name   atomicsSubTest006
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_006
     * @tc.desc   Throw TypeError for non-shared ArrayBuffer (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(4);
      const ia = new Int32Array(ab);
      try {
        Atomics.sub(ia, 0, 2)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsSubTest007
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_007
     * @tc.desc   Throw TypeError for non-shared ArrayBuffer (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 25; // Counter A
      ia[1] = 35; // Counter B

      // Atomic snapshot of both counters (load + exchange to lock temporarily)
      const snapshotA = Atomics.load(ia, 0);
      const lockB = Atomics.exchange(ia, 1, -1); // Lock B
      const snapshotB = lockB === -1 ? Atomics.load(ia, 1) : lockB;
      Atomics.exchange(ia, 1, snapshotB); // Unlock B

      expect(snapshotA).assertEqual(25);
      expect(snapshotB).assertEqual(35);
      expect(Atomics.load(ia, 1)).assertEqual(35);
    });

    /**
     * @tc.name   atomicsSubTest008
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_008
     * @tc.desc   Throw TypeError for Float32Array (not allowed type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 50; // Resource pool
      ia[1] = 0;  // Consumption audit

      // Consume 15 resources
      Atomics.sub(ia, 0, 15);
      const consumed = 15;
      // Audit consumption (atomic exchange to record)
      Atomics.exchange(ia, 1, Atomics.load(ia, 1) + consumed);

      expect(Atomics.load(ia, 0)).assertEqual(35);
      expect(Atomics.load(ia, 1)).assertEqual(15);
      // Consume remaining
      Atomics.sub(ia, 0, 35);
      Atomics.exchange(ia, 1, 50);
      expect(Atomics.load(ia, 0)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsSubTest009
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_009
     * @tc.desc   Throw TypeError for Uint8ClampedArray (not allowed type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 4;  // Value X
      ia[1] = 6;  // Value Y
      ia[2] = 10; // Checksum (X + Y)

      // Update X and Y, then validate checksum
      Atomics.add(ia, 0, 3); // X:4→7
      Atomics.sub(ia, 1, 2); // Y:6→4
      const newChecksum = Atomics.load(ia, 0) + Atomics.load(ia, 1);
      const checksumValid = Atomics.compareExchange(ia, 2, 10, newChecksum) === 10;

      expect(checksumValid).assertEqual(true);
      expect(Atomics.load(ia, 2)).assertEqual(11); // 7+4=11
      // Reset for consistency
      Atomics.exchange(ia, 0, 4);
      Atomics.exchange(ia, 1, 6);
      Atomics.exchange(ia, 2, 10);
      expect(Atomics.load(ia, 2)).assertEqual(10);
    });

    /**
     * @tc.name   atomicsSubTest010
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_010
     * @tc.desc   Throw RangeError for index >= array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.sub(ia, 1, 3)
      } catch (e) {
        expect(e.message).assertContain('Index is overflow');
      }
    });

    /**
     * @tc.name   atomicsSubTest011
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_011
     * @tc.desc   Throw RangeError for negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.sub(ia, -1, 3)
      } catch (e) {
        expect(e.message).assertContain('integerIndex');
      }
    });

    /**
     * @tc.name   atomicsSubTest012
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_012
     * @tc.desc   Subtract large value in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 1000000000000n;
      const oldValue = Atomics.sub(ba, 0, 500000000000n);
      expect(oldValue).assertEqual(1000000000000n);
      expect(ba[0]).assertEqual(500000000000n);
    });

    /**
     * @tc.name   atomicsSubTest013
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_013
     * @tc.desc   Subtract twice on same Int32Array index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 20;

      const old1 = Atomics.sub(ia, 0, 5);
      expect(old1).assertEqual(20);
      expect(ia[0]).assertEqual(15);

      const old2 = Atomics.sub(ia, 0, 3);
      expect(old2).assertEqual(15);
      expect(ia[0]).assertEqual(12);
    });

    /**
     * @tc.name   atomicsSubTest014
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_014
     * @tc.desc   Subtract from Int32Array with value=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const oldValue = Atomics.sub(ia, 0, 8);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(-8);
    });

    /**
     * @tc.name   atomicsSubTest015
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_015
     * @tc.desc   Subtract from BigInt64Array with value=0n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0n;
      const oldValue = Atomics.sub(ba, 0, 10n);
      expect(oldValue).assertEqual(0n);
      expect(ba[0]).assertEqual(-10n);
    });

    /**
     * @tc.name   atomicsSubTest016
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_016
     * @tc.desc   Subtract non-integer value (coerced to integer) in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const oldValue = Atomics.sub(ia, 0, 3.8); // Coerced to 3
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(7);
    });

    /**
     * @tc.name   atomicsSubTest017
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_017
     * @tc.desc   Subtract non-BigInt value (coerced to BigInt) in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 3;  // Val1
      ia[1] = 5;  // Val2
      ia[2] = 8;  // Sum (Val1+Val2)

      // Validate lock-free support for batch operations
      expect(Atomics.isLockFree(4)).assertEqual(true);

      // Lock-free batch update
      Atomics.add(ia, 0, 2); // Val1: 3→5
      Atomics.sub(ia, 1, 1); // Val2:5→4
      const newSum = Atomics.load(ia, 0) + Atomics.load(ia, 1);
      Atomics.compareExchange(ia, 2, 8, newSum); // Update sum lock-free

      expect(Atomics.load(ia, 0)).assertEqual(5);
      expect(Atomics.load(ia, 1)).assertEqual(4);
      expect(Atomics.load(ia, 2)).assertEqual(9);
    });

    /**
     * @tc.name   atomicsSubTest018
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_018
     * @tc.desc   Subtract from Int32Array maximum value (0x7FFFFFFF)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0x7FFFFFFF; // Max Int32
      const oldValue = Atomics.sub(ia, 0, 1);
      expect(oldValue).assertEqual(0x7FFFFFFF);
      expect(ia[0]).assertEqual(0x7FFFFFFE);
    });

    /**
     * @tc.name   atomicsSubTest019
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_019
     * @tc.desc   Subtract from BigInt64Array maximum value (9223372036854775807n)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsSubTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 9223372036854775807n; // Max BigInt64
      const oldValue = Atomics.sub(ba, 0, 100n);
      expect(oldValue).assertEqual(9223372036854775807n);
      expect(ba[0]).assertEqual(9223372036854775707n);
    });

    /**
     * @tc.name   atomicsSubTest020
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_020
     * @tc.desc   Subtract with arrow function wrapper, return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 18;
      const subWrapper = (arr: Int32Array, idx: number, val: number) => Atomics.sub(arr, idx, val);
      const oldValue = subWrapper(ia, 0, 6);
      expect(oldValue).assertEqual(18);
      expect(ia[0]).assertEqual(12);
    });

    /**
     * @tc.name   atomicsSubTest021
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_021
     * @tc.desc   Nested arrow functions: subtract inside inner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 50n;

      const outerFunc = (arr: BigInt64Array): bigint => {
        const innerSub = (idx: number, val: bigint) => Atomics.sub(arr, idx, val);
        return innerSub(0, 15n);
      };

      const oldValue = outerFunc(ba);
      expect(oldValue).assertEqual(50n);
      expect(ba[0]).assertEqual(35n);
    });

    /**
     * @tc.name   atomicsSubTest022
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_022
     * @tc.desc   Throw TypeError for non-typed array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 6;
      const min = 0;

      // Confirm lock-free before lock-free operation
      expect(Atomics.isLockFree(4)).assertEqual(true);

      // Lock-free subtract with underflow check
      Atomics.sub(ia, 0, 8); // 6 - 8 = -2
      const current = Atomics.load(ia, 0);
      const corrected = Atomics.compareExchange(ia, 0, current, current < min ? min : current);

      expect(corrected).assertEqual(-2);
      expect(Atomics.load(ia, 0)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsSubTest023
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_023
     * @tc.desc   Subtract from Uint32Array (allowed type), check unsigned result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 5;
      const oldValue = Atomics.sub(ua, 0, 10); // Underflow, wraps to unsigned max
      expect(oldValue).assertEqual(5);
      expect(ua[0]).assertEqual(4294967291); // 5 - 10 = -5 → unsigned 4294967291
    });

    /**
     * @tc.name   atomicsSubTest024
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_024
     * @tc.desc   Subtract from BigUint64Array (allowed type), check unsigned result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const bua = new BigUint64Array(sab);
      bua[0] = 8n;
      const oldValue = Atomics.sub(bua, 0, 15n); // Underflow, wraps to unsigned max
      expect(oldValue).assertEqual(8n);
      expect(bua[0]).assertEqual(18446744073709551609n); // 8n - 15n → unsigned wrap
    });

    /**
     * @tc.name   atomicsSubTest025
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_025
     * @tc.desc   Arrow function to batch subtract on multiple indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 20;
      ia[1] = 30;

      const batchSub = (arr: Int32Array, ops: Array<typeSub25>) => {
        return ops.map(op => Atomics.sub(arr, op.idx, op.val));
      };

      const oldValues = batchSub(ia, [{ idx: 0, val: 5 }, { idx: 1, val: 8 }]);
      expect(oldValues).assertDeepEquals([20, 30]);
      expect(ia[0]).assertEqual(15);
      expect(ia[1]).assertEqual(22);
    });

    /**
     * @tc.name   atomicsSubTest026
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_026
     * @tc.desc   Subtract with Int8Array (allowed type), check byte range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = 10;
      const oldValue = Atomics.sub(ia, 0, 15); // Underflow to Int8 range
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(-5);
    });

    /**
     * @tc.name   atomicsSubTest027
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_027
     * @tc.desc   Subtract with Uint16Array (allowed type), check 16-bit range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 500;
      const oldValue = Atomics.sub(ua, 0, 1000); // Underflow, wraps to 16-bit unsigned
      expect(oldValue).assertEqual(500);
      expect(ua[0]).assertEqual(65036); // 500 - 1000 = -500 → unsigned 65036
    });

    /**
     * @tc.name   atomicsSubTest028
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_028
     * @tc.desc   Nested arrow functions: subtract with dynamic value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 40;

      const getDynamicValue = (base: number, offset: number) => base - offset;
      const dynamicSub = (arr: Int32Array, idx: number, base: number, offset: number) => {
        const val = getDynamicValue(base, offset);
        return Atomics.sub(arr, idx, val);
      };

      const oldValue = dynamicSub(ia, 0, 15, 5); // val = 15 - 5 = 10
      expect(oldValue).assertEqual(40);
      expect(ia[0]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsSubTest029
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_029
     * @tc.desc   Throw RangeError for non-integer index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.sub(ia, 0.5, 3);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsSubTest030
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_030
     * @tc.desc   Subtract value exceeding 32 bits (truncated) in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 100;
      const longValue = 0x100000005; // 33 bits, truncated to 0x00000005
      const oldValue = Atomics.sub(ia, 0, longValue);
      expect(oldValue).assertEqual(100);
      expect(ia[0]).assertEqual(95); // 100 - 5 = 95
    });
    /**
     * @tc.name   atomicsSubTest031
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_031
     * @tc.desc   Subtract value exceeding 64 bits (truncated) in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 200n;
      const longValue = 0x10000000000000005n; // 65 bits, truncated to 0x0000000000000005n
      const oldValue = Atomics.sub(ba, 0, longValue);
      expect(oldValue).assertEqual(200n);
      expect(ba[0]).assertEqual(195n); // 200n - 5n = 195n
    });

    /**
     * @tc.name   atomicsSubTest032
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_032
     * @tc.desc   Arrow function wrapper for BigInt64Array subtract with dynamic value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 150n;

      const getDynamicBigValue = (base: bigint, offset: bigint) => base - offset;
      const bigIntSubWrapper = (arr: BigInt64Array, idx: number, base: bigint, offset: bigint) => {
        const val = getDynamicBigValue(base, offset);
        return Atomics.sub(arr, idx, val);
      };

      const oldValue = bigIntSubWrapper(ba, 0, 40n, 10n); // val = 40n - 10n = 30n
      expect(oldValue).assertEqual(150n);
      expect(ba[0]).assertEqual(120n); // 150n - 30n = 120n
    });

    /**
     * @tc.name   atomicsSubTest033
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_033
     * @tc.desc   Subtract from Int32Array with value=0x80000000 (min Int32)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0x80000000; // Min Int32 (-2147483648)
      const oldValue = Atomics.sub(ia, 0, 1); // Overflow to max Int32
      expect(oldValue).assertEqual(-2147483648);
      expect(ia[0]).assertEqual(2147483647); // -2147483648 - 1 = 2147483647 (wrap)
    });

    /**
     * @tc.name   atomicsSubTest034
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_034
     * @tc.desc   Subtract from BigInt64Array with value=0x8000000000000000n (min BigInt64)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0x8000000000000000n; // Min BigInt64 (-9223372036854775808n)
      const oldValue = Atomics.sub(ba, 0, 1n); // Overflow to max BigInt64
      expect(oldValue).assertEqual(-9223372036854775808n);
      expect(ba[0]).assertEqual(9223372036854775807n); // -9223372036854775808n -1n = 9223372036854775807n (wrap)
    });

    /**
     * @tc.name   atomicsSubTest035
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_035
     * @tc.desc   Nested arrow functions: subtract with value from outer variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 80;
      const outerValue = 25; // Captured from outer scope

      const outer = (arr: Int32Array): number => {
        const inner = (idx: number) => Atomics.sub(arr, idx, outerValue);
        return inner(0);
      };

      const oldValue = outer(ia);
      expect(oldValue).assertEqual(80);
      expect(ia[0]).assertEqual(55); // 80 - 25 = 55
    });

    /**
     * @tc.name   atomicsSubTest036
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_036
     * @tc.desc   Arrow function to chain subtract operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 100;

      const chainSub = (arr: Int32Array, idx: number, ...values: number[]) => {
        return values.map(val => Atomics.sub(arr, idx, val));
      };

      const oldValues = chainSub(ia, 0, 10, 20, 15);
      expect(oldValues).assertDeepEquals([100, 90, 70]);
      expect(ia[0]).assertEqual(55); // 100 -10-20-15 = 55
    });

    /**
     * @tc.name   atomicsSubTest037
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_037
     * @tc.desc   Arrow function to chain subtract operations on BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 200n;

      const chainBigSub = (arr: BigInt64Array, idx: number, ...values: bigint[]) => {
        return values.map(val => Atomics.sub(arr, idx, val));
      };

      const oldValues = chainBigSub(ba, 0, 30n, 40n, 25n);
      expect(oldValues[0]).assertEqual(200n);
      expect(oldValues[1]).assertEqual(170n);
      expect(oldValues[2]).assertEqual(130n);
      expect(ba[0]).assertEqual(105n); // 200n -30n-40n-25n = 105n
    });

    /**
     * @tc.name   atomicsSubTest038
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_038
     * @tc.desc   Subtract NaN (coerced to 0) in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 45;
      const oldValue = Atomics.sub(ia, 0, NaN); // Coerced to 0
      expect(oldValue).assertEqual(45);
      expect(ia[0]).assertEqual(45); // 45 - 0 = 45
    });

    /**
     * @tc.name   atomicsSubTest039
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_039
     * @tc.desc   Subtract NaN (coerced to 0n) in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 30; // Resource pool
      ia[1] = 0;  // Allocated amount

      expect(Atomics.isLockFree(4)).assertEqual(true);

      // Allocate 10 resources (lock-free)
      Atomics.sub(ia, 0, 10);
      const allocated = 10;
      // Record allocation (lock-free)
      Atomics.exchange(ia, 1, allocated);

      // Rollback allocation (lock-free)
      Atomics.add(ia, 0, allocated);
      Atomics.exchange(ia, 1, 0);

      expect(Atomics.load(ia, 0)).assertEqual(30);
      expect(Atomics.load(ia, 1)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsSubTest040
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_040
     * @tc.desc   Nested arrow functions: subtract with conditional value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 70;

      const conditionalSub = (arr: Int32Array, idx: number, useSmallValue: boolean) => {
        const getValue = () => useSmallValue ? 10 : 25;
        return Atomics.sub(arr, idx, getValue());
      };

      const oldValue = conditionalSub(ia, 0, true); // Use small value (10)
      expect(oldValue).assertEqual(70);
      expect(ia[0]).assertEqual(60); // 70 - 10 = 60
    });

    /**
     * @tc.name   atomicsSubTest041
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_041
     * @tc.desc   Subtract Infinity (coerced to 0) in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 30;
      const oldValue = Atomics.sub(ia, 0, Infinity); // Coerced to 0
      expect(oldValue).assertEqual(30);
      expect(ia[0]).assertEqual(30); // 30 - 0 = 30
    });

    /**
     * @tc.name   atomicsSubTest042
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_042
     * @tc.desc   Subtract Infinity (coerced to 0n) in BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -10; // Debt

      expect(Atomics.isLockFree(4)).assertEqual(true);

      Atomics.sub(ia, 0, -6); // Repay 6: -10 +6 = -4
      const remaining = Atomics.load(ia, 0);
      Atomics.compareExchange(ia, 0, remaining, 0); // Clear remaining debt

      expect(ia[0]).assertEqual(0);
    });


    /**
     * @tc.name   atomicsSubTest043
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_043
     * @tc.desc   Subtract from Int16Array (allowed type), check 16-bit range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = 500;
      const oldValue = Atomics.sub(ia, 0, 1000); // Underflow to Int16 range
      expect(oldValue).assertEqual(500);
      expect(ia[0]).assertEqual(-500); // 500 - 1000 = -500 (within Int16 range)
    });

    /**
     * @tc.name   atomicsSubTest044
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_044
     * @tc.desc   Subtract from Uint8Array (allowed type), check 8-bit unsigned range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 50;
      const oldValue = Atomics.sub(ua, 0, 100); // Underflow, wraps to 8-bit unsigned
      expect(oldValue).assertEqual(50);
      expect(ua[0]).assertEqual(206); // 50 - 100 = -50 → unsigned 206
    });

    /**
     * @tc.name   atomicsSubTest045
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_045
     * @tc.desc   Arrow function to subtract and return new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 90;

      const subAndGetNew = (arr: Int32Array, idx: number, val: number) => {
        Atomics.sub(arr, idx, val);
        return arr[idx];
      };

      const newValue = subAndGetNew(ia, 0, 35);
      expect(newValue).assertEqual(55); // 90 - 35 = 55
    });

    /**
     * @tc.name   atomicsSubTest046
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_046
     * @tc.desc   Arrow function to subtract and return old+new value object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsSubTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 120n;

      const subAndGetBoth = (arr: BigInt64Array, idx: number, val: bigint) => {
        const oldValue = Atomics.sub(arr, idx, val);
        const newValue = arr[idx];
        return { oldValue, newValue } as typeSub46;
      };

      const result = subAndGetBoth(ba, 0, 45n);
      expect(result.oldValue).assertEqual(120n);
      expect(result.newValue).assertEqual(75n);
    });

    /**
     * @tc.name   atomicsSubTest047
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_047
     * @tc.desc   Async subtract with Promise wrapper, resolve old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 85;

      const asyncSub = (arr: Int32Array, idx: number, val: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.sub(arr, idx, val);
            resolve(oldValue);
          }, 10);
        });
      };

      const oldValue = await asyncSub(ia, 0, 25);
      expect(oldValue).assertEqual(85);
      expect(ia[0]).assertEqual(60);
    });

    /**
     * @tc.name   atomicsSubTest048
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_048
     * @tc.desc   Nested async: subtract inside inner Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 200n;

      const outerFunc = (arr: BigInt64Array): Promise<GeneratedTypeLiteralInterface_2> => {
        return new Promise((outerResolve) => {
          const innerSub = () => {
            return new Promise<GeneratedTypeLiteralInterface_2>((innerResolve) => {
              setTimeout(() => {
                const oldValue = Atomics.sub(arr, 0, 75n);
                innerResolve({ old: oldValue, new: arr[0] } as GeneratedTypeLiteralInterface_2);
              }, 15);
            });
          };

          innerSub().then((result) => outerResolve(result));
        });
      };

      const result = await outerFunc(ba);
      expect(result.old).assertEqual(200n);
      expect(result.new).assertEqual(125n);
    });

    /**
     * @tc.name   atomicsSubTest049
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_049
     * @tc.desc   Promise.all with multiple subtract operations on different indexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 60;
      ia[1] = 90;

      const createSubPromise = (arr: Int32Array, idx: number, val: number) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const old = await Promise.all([
        createSubPromise(ia, 0, 15),
        createSubPromise(ia, 1, 30)
      ]);

      expect(old[0]).assertEqual(60);
      expect(old[1]).assertEqual(90);
      expect(ia[0]).assertEqual(45);
      expect(ia[1]).assertEqual(60);
    });

    /**
     * @tc.name   atomicsSubTest050
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_050
     * @tc.desc   Async subtract with arrow function closure, capture index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 40;
      ia[1] = 70;
      const targetIdx = 1;

      const createClosureSub = (arr: Int32Array) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, targetIdx, val);
              resolve(old);
            }, 10);
          });
        };
      };

      const closureSub = createClosureSub(ia);
      const oldValue = await closureSub(25);
      expect(oldValue).assertEqual(70);
      expect(ia[1]).assertEqual(45);
      expect(ia[0]).assertEqual(40); // Unchanged
    });

    /**
     * @tc.name   atomicsSubTest051
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_051
     * @tc.desc   Nested async: subtract with retry on invalid value (coerce and retry)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50;
      let retryCount = 0;

      const subWithRetry = async (arr: Int32Array, idx: number, val: number): Promise<number> => {
        retryCount++;
        const validVal = typeof val === 'number' ? Math.floor(val) : 0;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, validVal);
            resolve(old);
          }, 5);
        });
      };

      // First call with non-integer value (12.7 → coerced to 12)
      const oldValue = await subWithRetry(ia, 0, 12.7);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(38);
    });

    /**
     * @tc.name   atomicsSubTest052
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_052
     * @tc.desc   Promise.race between two subtract operations on same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 100;

      const subTask1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ia, 0, 20);
          resolve(old);
        }, 10);
      });

      const subTask2 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ia, 0, 30);
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([subTask1, subTask2]);
      await Promise.allSettled([subTask1, subTask2]);

      expect([100, 80].includes(winnerOld)).assertTrue(); // Either task wins first
      expect(ia[0]).assertEqual(50); // 100 -20-30 = 50
    });

    /**
     * @tc.name   atomicsSubTest053
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_053
     * @tc.desc   Async subtract with finally block to log result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 150n;
      const log: string[] = [];

      const loggedSub = async (arr: BigInt64Array, idx: number, val: bigint): Promise<bigint> => {
        try {
          return await new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, val);
              resolve(old);
            }, 8);
          });
        } finally {
          log.push(`Sub done: old=${ba[0] + val}, new=${ba[0]}`);
        }
      };

      const oldValue = await loggedSub(ba, 0, 40n);
      expect(oldValue).assertEqual(150n);
      expect(ba[0]).assertEqual(110n);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertContain('old=150, new=110');
    });

    /**
     * @tc.name   atomicsSubTest054
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_054
     * @tc.desc   Nested arrow functions: async subtract with dynamic value from mock API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 75;

      // Mock API to get dynamic subtract value
      const mockValueApi = async (): Promise<number> => {
        return new Promise((resolve) => setTimeout(() => resolve(25), 12));
      };

      const dynamicSub = async (arr: Int32Array, idx: number) => {
        const val = await mockValueApi();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await dynamicSub(ia, 0);
      expect(oldValue).assertEqual(75);
      expect(ia[0]).assertEqual(50);
    });

    /**
     * @tc.name   atomicsSubTest055
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_055
     * @tc.desc   Promise.allSettled with valid and invalid subtract tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const invalidArr = new Float32Array(sab); // Not allowed for Atomics.sub
      ia[0] = 60;

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => resolve(Atomics.sub(ia, 0, 15)), 10);
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(Atomics.sub(ia, 0, -15));
          } catch (err) {
            reject(err);
          }
        }, 10);
      });

      const results = await Promise.allSettled([validTask, invalidTask]);
      const validResult = results[0] as PromiseFulfilledResult<number>;
      const invalidResult = results[1] as PromiseRejectedResult;

      expect(validResult.value).assertEqual(60);
      expect(ia[0]).assertEqual(60);
    });

    /**
     * @tc.name   atomicsSubTest056
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_056
     * @tc.desc   Async subtract with closure that tracks operation history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 120;
      const history: Array<typeSub56> = [];

      const createTrackedSub = (arr: Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, val);
              const newVal = arr[idx];
              history.push({ time: Date.now(), old, new: newVal });
              resolve(old);
            }, 7);
          });
        };
      };

      const trackedSub = createTrackedSub(ia, 0);
      await trackedSub(30); // 120 → 90
      await trackedSub(20); // 90 → 70
      await trackedSub(15); // 70 → 55

      expect(history.length).assertEqual(3);
      expect(history[0].old).assertEqual(120);
      expect(history[0].new).assertEqual(90);
      expect(history[1].old).assertEqual(90);
      expect(history[1].new).assertEqual(70);
      expect(history[2].old).assertEqual(70);
      expect(history[2].new).assertEqual(55);
    });

    /**
     * @tc.name   atomicsSubTest057
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_057
     * @tc.desc   Nested async: subtract with pre-validation in outer Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 90n;
      let validationPassed = false;

      const validateSub = async (arr: BigInt64Array, idx: number, val: bigint) => {
        // Pre-validation: subtract value is positive
        const validate = () => new Promise<boolean>((resolve) => {
          setTimeout(() => resolve(val > 0n), 5);
        });

        validationPassed = await validate();
        if (!validationPassed) {
          throw new Error('Invalid subtract value');
        }

        return new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          }, 10);
        });
      };

      const oldValue = await validateSub(ba, 0, 35n); // Valid positive value
      expect(validationPassed).assertEqual(true);
      expect(oldValue).assertEqual(90n);
      expect(ba[0]).assertEqual(55n);
    });

    /**
     * @tc.name   atomicsSubTest058
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_058
     * @tc.desc   Async subtract with Promise chain: validate → subtract → log
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 80;
      const log: string[] = [];

      // Step 1: Validate subtract value
      const validateVal = (val: number): Promise<boolean> => {
        return new Promise((resolve) => setTimeout(() => resolve(val <= 50), 5));
      };

      // Step 2: Perform async subtract
      const performSub = (arr: Int32Array, idx: number, val: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          }, 8);
        });
      };

      // Step 3: Log result
      const logResult = (old: number, newVal: number): Promise<void> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            log.push(`Sub: old=${old}, new=${newVal}`);
            resolve();
          }, 3);
        });
      };

      // Chain workflow
      const subVal = 30;
      const isValid = await validateVal(subVal);
      if (isValid) {
        const oldValue = await performSub(ia, 0, subVal);
        await logResult(oldValue, ia[0]);
      }

      expect(isValid).assertEqual(true);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertEqual('Sub: old=80, new=50');
      expect(ia[0]).assertEqual(50);
    });

    /**
     * @tc.name   atomicsSubTest059
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_059
     * @tc.desc   Nested arrow functions: async subtract with dynamic index from closure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 25;
      ia[1] = 50;
      ia[2] = 75;
      const targetIdx = 2; // Captured in closure

      const createIndexSub = (arr: Int32Array) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, targetIdx, val);
              resolve(old);
            }, 10);
          });
        };
      };

      const indexSub = createIndexSub(ia);
      const oldValue = await indexSub(20);
      expect(oldValue).assertEqual(75);
      expect(ia[2]).assertEqual(55);
      expect(ia[0]).assertEqual(25); // Unchanged
      expect(ia[1]).assertEqual(50); // Unchanged
    });

    /**
     * @tc.name   atomicsSubTest060
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_060
     * @tc.desc   Promise.race between subtract and timeout (subtract wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 65;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ia, 0, 15);
          resolve(old);
        }, 12);
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 20);
      });

      const result = await Promise.race([subTask, timeoutTask]);
      expect(result).assertEqual(65); // Subtract task wins
      expect(ia[0]).assertEqual(50);
    });

    /**
     * @tc.name   atomicsSubTest061
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_061
     * @tc.desc   Async subtract with error handling for invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 40;
      let errorCaught = false;

      const safeSub = async (arr: Int32Array, idx: number, val: number): Promise<number | null> => {
        try {
          return await new Promise<number>((resolve) => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          });
        } catch (err) {
          errorCaught = true;
          return null;
        }
      };

      // Call with invalid index (1, array length = 1)
      const result = await safeSub(ia, 1, 10);
      expect(errorCaught).assertEqual(true);
      expect(result).assertNull();
      expect(ia[0]).assertEqual(40); // Unchanged
    });

    /**
     * @tc.name   atomicsSubTest062
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_062
     * @tc.desc   Nested async: subtract with batch value application via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 30;
      ia[1] = 60;
      ia[2] = 90;
      const subs = [5, 15, 25]; // Values for each index

      const batchSub = (arr: Int32Array, indexes: number[], values: number[]) => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = Atomics.sub(arr, idx, values[i]);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues = await batchSub(ia, [0, 1, 2], subs);
      expect(oldValues).assertDeepEquals([30, 60, 90]);
      expect(ia[0]).assertEqual(25); // 30 - 5
      expect(ia[1]).assertEqual(45); // 60 - 15
      expect(ia[2]).assertEqual(65); // 90 - 25
    });

    /**
     * @tc.name   atomicsSubTest063
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_063
     * @tc.desc   Async subtract with closure that enforces value limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50;
      const minValue = 20; // Enforce result ≥ 20

      const createLimitedSub = (arr: Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<typeSub63>((resolve) => {
            setTimeout(() => {
              const old = arr[idx];
              const newVal = old - val;
              if (newVal >= minValue) {
                Atomics.sub(arr, idx, val); // Perform subtract only if in limit
                resolve({ old, success: true });
              } else {
                resolve({ old, success: false });
              }
            }, 8);
          });
        };
      };

      const limitedSub = createLimitedSub(ia, 0);
      // Valid: 50 - 25 = 25 ≥ 20
      const result1 = await limitedSub(25);
      // Invalid: 25 - 10 = 15 < 20
      const result2 = await limitedSub(10);

      expect(result1.success).assertEqual(true);
      expect(result1.old).assertEqual(50);
      expect(result2.success).assertEqual(false);
      expect(result2.old).assertEqual(25);
      expect(ia[0]).assertEqual(25);
    });

    /**
     * @tc.name   atomicsSubTest064
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_064
     * @tc.desc   Nested arrow functions: async subtract with value from outer Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 120n;

      const getValFromPromise = (): Promise<bigint> => {
        return new Promise((resolve) => setTimeout(() => resolve(45n), 10));
      };

      const outerSub = async (arr: BigInt64Array, idx: number): Promise<bigint> => {
        const val = await getValFromPromise();
        const innerSub = () => {
          return new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, val);
              resolve(old);
            }, 5);
          });
        };
        return innerSub();
      };

      const oldValue = await outerSub(ba, 0);
      expect(oldValue).assertEqual(120n);
      expect(ba[0]).assertEqual(75n); // 120n - 45n
    });

    /**
     * @tc.name   atomicsSubTest065
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_065
     * @tc.desc   Promise.all with subtract and state check tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 70;
      let stateCheckPassed = false;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ia, 0, 20);
          resolve(old);
        }, 12);
      });

      const stateCheckTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          stateCheckPassed = ia[0] === 50; // 70 - 20 = 50
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([subTask, stateCheckTask]);
      expect(oldValue[0]).assertEqual(70);
      expect(stateCheckPassed).assertEqual(true);
      expect(ia[0]).assertEqual(50);
    });

    /**
     * @tc.name   atomicsSubTest066
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_066
     * @tc.desc   Async subtract with retry on detached buffer (fallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8;
      const floor = 3;

      expect(Atomics.isLockFree(4)).assertEqual(true);

      let current = Atomics.load(ia, 0);
      while (current > floor && Atomics.compareExchange(ia, 0, current, current - 2) !== current) {
        current = Atomics.load(ia, 0);
      }
      Atomics.sub(ia, 0, 1); // Final decrement (if above floor)

      expect(ia[0]).assertEqual(Math.max(current - 2 - 1, floor));
    });
    /**
     * @tc.name   atomicsSubTest067
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_067
     * @tc.desc   Nested async: subtract with pre-subtract and post-subtract checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 85n;
      let preCheckPassed = false;
      let postCheckPassed = false;

      const checkValue = (arr: BigInt64Array, idx: number, expected: bigint): Promise<boolean> => {
        return new Promise((resolve) => {
          setTimeout(() => resolve(arr[idx] === expected), 5);
        });
      };

      const subWithChecks = async (arr: BigInt64Array, idx: number, val: bigint) => {
        // Pre-subtract check
        preCheckPassed = await checkValue(arr, idx, 85n);
        if (!preCheckPassed) {
          throw new Error('Pre-check failed');
        }

        // Perform subtract
        const old = await new Promise<bigint>((resolve) => {
          setTimeout(() => resolve(Atomics.sub(arr, idx, val)), 8);
        });

        // Post-subtract check
        postCheckPassed = await checkValue(arr, idx, 85n - val);
        return old;
      };

      const oldValue = await subWithChecks(ba, 0, 30n);
      expect(preCheckPassed && postCheckPassed).assertEqual(true);
      expect(oldValue).assertEqual(85n);
      expect(ba[0]).assertEqual(55n); // 85n - 30n
    });

    /**
     * @tc.name   atomicsSubTest068
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_068
     * @tc.desc   Async subtract with closure that logs subtract value usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 100;
      const valLog: number[] = [];

      const createLoggedSub = (arr: Int32Array, idx: number) => {
        return async (val: number) => {
          valLog.push(val); // Log subtract value before use
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const loggedSub = createLoggedSub(ia, 0);
      await loggedSub(20); // Log: 20
      await loggedSub(15); // Log: 15
      await loggedSub(10); // Log: 10

      expect(valLog).assertDeepEquals([20, 15, 10]);
      expect(ia[0]).assertEqual(55); // 100 -20-15-10 = 55
    });

    /**
     * @tc.name   atomicsSubTest069
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_069
     * @tc.desc   Nested arrow functions: async subtract with conditional value selection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 90;
      const threshold = 50;

      const getConditionalVal = (value: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const val = value > threshold ? 25 : 15;
            resolve(val);
          }, 6);
        });
      };

      const conditionalSub = async (arr: Int32Array, idx: number): Promise<number> => {
        const currentValue = arr[idx];
        const val = await getConditionalVal(currentValue);
        const innerSub = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          }, 5);
        });
        return innerSub();
      };

      const oldValue = await conditionalSub(ia, 0);
      expect(oldValue).assertEqual(90);
      expect(ia[0]).assertEqual(65); // 90 > 50 → subtract 25 (90-25=65)
    });

    /**
     * @tc.name   atomicsSubTest070
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_070
     * @tc.desc   Promise.allSettled with subtract tasks on different typed arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab); // Valid for subtract
      const da = new DataView(sab); // Invalid for subtract
      ia[0] = 75;

      const validTask = new Promise<number>((resolve) => {
        setTimeout(() => resolve(Atomics.sub(ia, 0, 20)), 10);
      });

      const invalidTask = new Promise<number>((resolve, reject) => {
        setTimeout(() => {
          try {
            resolve(Atomics.sub(ia, 0, 20));
          } catch (err) {
            reject(err);
          }
        }, 10);
      });

      const results = await Promise.allSettled([validTask, invalidTask]);
      const validResult = results[0] as PromiseFulfilledResult<number>;
      const invalidResult = results[1] as PromiseRejectedResult;

      expect(validResult.value).assertEqual(75);
      expect(ia[0]).assertEqual(35);
    });

    /**
     * @tc.name   atomicsSubTest071
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_071
     * @tc.desc   Async subtract with closure that enforces result range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 60n;
      const minResult = 30n; // Result ≥ 30n
      const maxResult = 50n; // Result ≤ 50n

      const createRangeSub = (arr: BigInt64Array, idx: number) => {
        return async (val: bigint) => {
          return new Promise<typeSub71>((resolve) => {
            setTimeout(() => {
              const old = arr[idx];
              const newVal = old - val;
              if (newVal >= minResult && newVal <= maxResult) {
                Atomics.sub(arr, idx, val); // Perform subtract only if in range
                resolve({ old, success: true });
              } else {
                resolve({ old, success: false });
              }
            }, 8);
          });
        };
      };

      const rangeSub = createRangeSub(ba, 0);
      // Valid: 60n - 15n = 45n (30n ≤ 45n ≤ 50n)
      const result1 = await rangeSub(15n);
      // Invalid: 45n - 20n = 25n < 30n
      const result2 = await rangeSub(20n);

      expect(result1.success).assertEqual(true);
      expect(result1.old).assertEqual(60n);
      expect(result2.success).assertEqual(false);
      expect(result2.old).assertEqual(45n);
      expect(ba[0]).assertEqual(45n);
    });

    /**
     * @tc.name   atomicsSubTest072
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_072
     * @tc.desc   Nested async: subtract with value derived from previous subtract result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 80;

      const firstSub = (arr: Int32Array): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, 0, 20); // 80 → 60
            resolve(old);
          }, 7);
        });
      };

      const secondSub = async (arr: Int32Array) => {
        const firstOld = await firstSub(arr);
        const derivedVal = firstOld / 4; // Derive value: 80 / 4 = 20
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, 0, derivedVal); // 60 → 40
            resolve(old);
          }, 5);
        });
      };

      const secondOld = await secondSub(ia);
      expect(secondOld).assertEqual(60); // First subtract result is 60
      expect(ia[0]).assertEqual(40); // 60 - 20 = 40
    });

    /**
     * @tc.name   atomicsSubTest073
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_073
     * @tc.desc   Promise.race between two subtract tasks with different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 95;

      const subTaskA = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ia, 0, 30); // 95 → 65
          resolve(old);
        }, 10);
      });

      const subTaskB = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ia, 0, 25); // 95→70 or 65→40
          resolve(old);
        }, 10);
      });

      const winnerOld = await Promise.race([subTaskA, subTaskB]);
      await Promise.allSettled([subTaskA, subTaskB]);

      expect([95, 65, 70].includes(winnerOld)).assertTrue(); // Depends on execution order
      expect(ia[0]).assertEqual(40); // 95 -30-25 = 40
    });

    /**
     * @tc.name   atomicsSubTest074
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_074
     * @tc.desc   Async subtract with error handling for non-shared buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const ab = new ArrayBuffer(4); // Non-shared buffer
      const ia = new Int32Array(ab);
      ia[0] = 55;
      let errorMessage = '';

      const safeSub = async (arr: Int32Array, idx: number, val: number): Promise<number | null> => {
        try {
          return await new Promise<number>((resolve) => {
              const old = Atomics.sub(arr, idx, val);
              resolve(old);
          });
        } catch (err) {
          errorMessage = (err as Error).message;
          return null;
        }
      };

      const result = await safeSub(ia, -10, 15);
      expect(result).assertNull();
      expect(errorMessage).assertContain('integerIndex');
      expect(ia[0]).assertEqual(55); // Unchanged
    });

    /**
     * @tc.name   atomicsSubTest075
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_075
     * @tc.desc   Nested arrow functions: async subtract with batch value validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 40;
      ia[1] = 60;
      const subs = [10, 15]; // Values for index 0 and 1

      const validateValues = (values: number[]): Promise<boolean> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            // Validate all values are positive
            const allValid = values.every(val => val > 0);
            resolve(allValid);
          }, 6);
        });
      };

      const batchValidSub = async (arr: Int32Array, indexes: number[], values: number[]) => {
        const isValid = await validateValues(values);
        if (!isValid) {
          throw new Error('Invalid subtract value');
        }

        return Promise.all(
          indexes.map((idx, i): Promise<number> => {
            const innerSub = () => new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = Atomics.sub(arr, idx, values[i]);
                resolve(old);
              }, 5);
            });
            return innerSub();
          })
        );
      };

      const oldValues = await batchValidSub(ia, [0, 1], subs);
      expect(oldValues).assertDeepEquals([40, 60]);
      expect(ia[0]).assertEqual(30); // 40 - 10 = 30
      expect(ia[1]).assertEqual(45); // 60 - 15 = 45
    });

    /**
     * @tc.name   atomicsSubTest076
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_076
     * @tc.desc   Async subtract with closure that tracks operation success rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 50; // Total quota
      ia[1] = 0;  // Used quota

      expect(Atomics.isLockFree(4)).assertEqual(true);

      const consume = 12;
      Atomics.sub(ia, 0, consume);
      Atomics.exchange(ia, 1, Atomics.load(ia, 1) + consume);

      expect(ia[0]).assertEqual(38);
      expect(ia[1]).assertEqual(12);
    });

    /**
     * @tc.name   atomicsSubTest077
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_077
     * @tc.desc   Nested async: subtract with value from external async API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 110n;

      // Mock external async API to get subtract value
      const mockExternalApi = async (): Promise<bigint> => {
        return new Promise((resolve) => setTimeout(() => resolve(35n), 10));
      };

      const apiSub = async (arr: BigInt64Array, idx: number): Promise<bigint> => {
        const val = await mockExternalApi();
        const innerSub = () => new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          }, 6);
        });
        return innerSub();
      };

      const oldValue = await apiSub(ba, 0);
      expect(oldValue).assertEqual(110n);
      expect(ba[0]).assertEqual(75n); // 110n - 35n = 75n
    });

    /**
     * @tc.name   atomicsSubTest078
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_078
     * @tc.desc   Promise.all with subtract and cleanup tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 65;
      let cleanedUp = false;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ia, 0, 20);
          resolve(old);
        }, 10);
      });

      const cleanupTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          ia[0] = 0; // Reset value after subtract
          cleanedUp = true;
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([subTask, cleanupTask]);
      expect(oldValue[0]).assertEqual(65);
      expect(cleanedUp).assertEqual(true);
      expect(ia[0]).assertEqual(0); // Cleanup resets value
    });

    /**
     * @tc.name   atomicsSubTest079
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_079
     * @tc.desc   Async subtract with closure that skips duplicate subtract values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 90;
      const usedVals = new Set<number>();

      const createDedupSub = (arr: Int32Array, idx: number) => {
        return async (val: number) => {
          if (usedVals.has(val)) {
            return Promise.resolve(arr[idx]); // Return current value if duplicate
          }
          usedVals.add(val);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const dedupSub = createDedupSub(ia, 0);
      const old1 = await dedupSub(15); // New value: 15 → 90→75
      const old2 = await dedupSub(15); // Duplicate: 15 → skip subtract
      const old3 = await dedupSub(20); // New value: 20 →75→55

      expect(old1).assertEqual(90);
      expect(old2).assertEqual(75); // Returns current value (no subtract)
      expect(old3).assertEqual(75);
      expect(ia[0]).assertEqual(55); // 90 -15-20 = 55
    });

    /**
     * @tc.name   atomicsSubTest080
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_080
     * @tc.desc   Nested arrow functions: async subtract with value validation in inner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 80n;

      const outerSub = async (arr: BigInt64Array, idx: number, val: bigint): Promise<bigint> => {
        const innerValidate = (v: bigint): Promise<boolean> => {
          return new Promise((resolve) => {
            setTimeout(() => resolve(v <= 50n), 5); // Value ≤ 50n
          });
        };
        const isValid = await innerValidate(val);
        if (!isValid) {
          throw new Error('Invalid subtract value');
        }
        const innerSub = () => new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          }, 6);
        });
        return innerSub();
      };

      const oldValue = await outerSub(ba, 0, 30n); // Valid value (30n ≤50n)
      expect(oldValue).assertEqual(80n);
      expect(ba[0]).assertEqual(50n); // 80n -30n =50n
    });

    /**
     * @tc.name   atomicsSubTest081
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_081
     * @tc.desc   Promise.race between subtract and value change task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50;
      let valueChanged = false;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ia, 0, 15); // 50→35
          resolve(old);
        }, 12);
      });

      const changeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          ia[0] = 100; // Overwrite value after subtract
          valueChanged = true;
          resolve(0);
        }, 15);
      });

      const oldValue = await Promise.race([subTask, changeTask]);
      await Promise.allSettled([subTask, changeTask]);

      expect(oldValue).assertEqual(50); // Subtract task wins
      expect(valueChanged).assertEqual(true);
      expect(ia[0]).assertEqual(100); // Change task overwrites result
    });

    /**
     * @tc.name   atomicsSubTest082
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_082
     * @tc.desc   Async subtract with error handling for invalid value type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 1; // Flag
      ia[1] = 0; // Audit

      expect(Atomics.isLockFree(4)).assertEqual(true);

      Atomics.xor(ia, 0, 1); // Toggle: 1→0
      Atomics.exchange(ia, 1, Atomics.load(ia, 1) + 1); // Audit

      expect(ia[0]).assertEqual(0);
      expect(ia[1]).assertEqual(1);
    });

    /**
     * @tc.name   atomicsSubTest083
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_083
     * @tc.desc   Nested async: subtract with batch value application and result aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 40;
      ia[1] = 70;
      ia[2] = 100;
      const subs = [10, 25, 30];

      const batchSubAndAggregate = async (arr: Int32Array, indexes: number[], values: number[]) => {
        const subPromises = indexes.map((idx, i) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, values[i]);
              resolve(old);
            }, 5);
          });
        });

        const oldValues = await Promise.all(subPromises);
        const newValues = indexes.map(idx => arr[idx]);
        return { oldValues, newValues } as typeSub83;
      };

      const values = await batchSubAndAggregate(ia, [0, 1, 2], subs);
      expect(values.oldValues).assertDeepEquals([40, 70, 100]);
      expect(values.newValues).assertDeepEquals([30, 45, 70]); // 40-10, 70-25, 100-30
    });

    /**
     * @tc.name   atomicsSubTest084
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_084
     * @tc.desc   Async subtract with closure that tracks cumulative subtract value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 120;
      let cumulativeVal = 0;

      const createCumulativeSub = (arr: Int32Array, idx: number) => {
        return async (val: number) => {
          cumulativeVal += val; // Track total subtracted value
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const cumulativeSub = createCumulativeSub(ia, 0);
      await cumulativeSub(25); // Cumulative:25 → 120→95
      await cumulativeSub(30); // Cumulative:55 →95→65
      await cumulativeSub(15); // Cumulative:70 →65→50

      expect(cumulativeVal).assertEqual(70);
      expect(ia[0]).assertEqual(50); // 120 -70 =50
    });

    /**
     * @tc.name   atomicsSubTest085
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_085
     * @tc.desc   Nested arrow functions: async subtract with value from closure state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 90n;

      const createStatefulSub = (arr: BigInt64Array, idx: number) => {
        let stateVal = 15n; // Value stored in closure state

        return async () => {
          return new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, stateVal);
              stateVal += 10n; // Update state value after subtract
              resolve(old);
            }, 6);
          });
        };
      };

      const statefulSub = createStatefulSub(ba, 0);
      const old1 = await statefulSub(); // StateVal=15n →90n→75n
      const old2 = await statefulSub(); // StateVal=25n →75n→50n

      expect(old1).assertEqual(90n);
      expect(old2).assertEqual(75n);
      expect(ba[0]).assertEqual(50n); // 90n -15n-25n =50n
    });

    /**
     * @tc.name   atomicsSubTest086
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_086
     * @tc.desc   Promise.allSettled with subtract tasks on same index (different values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 80;

      const subTasks = [
        new Promise<number>((resolve) => setTimeout(() => resolve(Atomics.sub(ia, 0, 15)), 8)),
        new Promise<number>((resolve) => setTimeout(() => resolve(Atomics.sub(ia, 0, 20)), 8)),
        new Promise<number>((resolve) => setTimeout(() => resolve(Atomics.sub(ia, 0, 10)), 8))
      ];

      const results = await Promise.allSettled(subTasks);
      const oldValues = results.map(res => (res as PromiseFulfilledResult<number>).value);

      // Old values depend on execution order, but total subtracted is 45
      expect(oldValues.every(v => v >= 35 && v <= 80)).assertEqual(true);
      expect(ia[0]).assertEqual(35); // 80 -15-20-10 = 35
    });

    /**
     * @tc.name   atomicsSubTest087
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_087
     * @tc.desc   Async subtract with retry on value overflow (coerce and retry)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50;
      let retryCount = 0;

      const subWithOverflowRetry = async (arr: Int32Array, idx: number, val: number): Promise<number> => {
        retryCount++;
        // Coerce value to 32-bit signed integer (handle overflow)
        const validVal = val >>> 0 & 0xFFFFFFFF;

        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, validVal);
            resolve(old);
          }, 7);
        });
      };

      // Value exceeds 32 bits (0x10000000A → coerced to 0x0000000A = 10)
      const oldValue = await subWithOverflowRetry(ia, 0, 0x10000000A);
      expect(retryCount).assertEqual(1);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(40); // 50 - 10 = 40
    });

    /**
     * @tc.name   atomicsSubTest088
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_088
     * @tc.desc   Nested async: subtract with value validation and fallback value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 75n;
      const fallbackVal = 10n; // Fallback if value is invalid

      const validateAndSub = async (arr: BigInt64Array, idx: number, val: bigint) => {
        const validate = (v: bigint): Promise<boolean> => {
          return new Promise((resolve) => {
            setTimeout(() => resolve(v >= 5n && v <= 30n), 5); // Value in [5n, 30n]
          });
        };

        const isValid = await validate(val);
        const finalVal = isValid ? val : fallbackVal;

        return new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, finalVal);
            resolve(old);
          }, 6);
        });
      };

      // Invalid value (35n > 30n → use fallback 10n)
      const oldValue = await validateAndSub(ba, 0, 35n);
      expect(oldValue).assertEqual(75n);
      expect(ba[0]).assertEqual(65n); // 75n - 10n = 65n
    });

    /**
     * @tc.name   atomicsSubTest089
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_089
     * @tc.desc   Promise.race between subtract and timeout (timeout wins)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 60;

      const subTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ia, 0, 25);
          resolve(old);
        }, 30); // Slow subtract task
      });

      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => resolve('timeout'), 15); // Faster timeout
      });

      const result = await Promise.race([subTask, timeoutTask]);
      // Wait for subtract task to complete to check final state
      await Promise.allSettled([subTask]);

      expect(result).assertEqual('timeout'); // Timeout wins
      expect(ia[0]).assertEqual(35); // Subtract task still completes later
    });

    /**
     * @tc.name   atomicsSubTest090
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_090
     * @tc.desc   Async subtract with closure that enforces unique subtract values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 95;
      const usedVals = new Set<number>();

      const createUniqueSub = (arr: Int32Array, idx: number) => {
        return async (val: number) => {
          if (usedVals.has(val)) {
            throw new Error(`Subtract value ${val} already used`);
          }
          usedVals.add(val);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const uniqueSub = createUniqueSub(ia, 0);
      const old1 = await uniqueSub(20); // New value: 20 → 95→75
      let errorThrown = false;

      try {
        await uniqueSub(20); // Duplicate value: 20
      } catch (err) {
        errorThrown = true;
      }

      expect(old1).assertEqual(95);
      expect(errorThrown).assertEqual(true);
      expect(ia[0]).assertEqual(75); // Only first subtract is applied
    });

    /**
     * @tc.name   atomicsSubTest091
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_091
     * @tc.desc   Nested arrow functions: async subtract with value from promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 85;

      // Promise chain to get subtract value: 5 → 10 → 15
      const getValStep1 = (): Promise<number> => Promise.resolve(5);
      const getValStep2 = (val: number): Promise<number> => Promise.resolve(val + 5);
      const getValStep3 = (val: number): Promise<number> => Promise.resolve(val + 5);

      const chainSub = async (arr: Int32Array, idx: number): Promise<number> => {
        const val = await getValStep1()
          .then(getValStep2)
          .then(getValStep3);
        const innerSub = () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          }, 6);
        });
        return innerSub();
      };

      const oldValue = await chainSub(ia, 0);
      expect(oldValue).assertEqual(85);
      expect(ia[0]).assertEqual(70); // 85 - 15 = 70
    });

    /**
     * @tc.name   atomicsSubTest092
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_092
     * @tc.desc   Promise.all with subtract and state validation tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 100n;
      let validationPassed = false;

      const subTask = new Promise<bigint>((resolve) => {
        setTimeout(() => {
          const old = Atomics.sub(ba, 0, 30n);
          resolve(old);
        }, 10);
      });

      const validateTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          validationPassed = ba[0] === 70n; // 100n - 30n = 70n
          resolve();
        }, 15);
      });

      const oldValue = await Promise.all([subTask, validateTask]);
      expect(oldValue[0]).assertEqual(100n);
      expect(validationPassed).assertEqual(true);
      expect(ba[0]).assertEqual(70n);
    });

    /**
     * @tc.name   atomicsSubTest093
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_093
     * @tc.desc   Async subtract with closure that logs operation timestamps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 90;
      const timeLog: Array<typeSub93> = [];

      const createTimedSub = (arr: Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, val);
              timeLog.push({ val, timestamp: Date.now() });
              resolve(old);
            }, 5);
          });
        };
      };

      const timedSub = createTimedSub(ia, 0);
      await timedSub(15);
      await new Promise<void>((resolve) => setTimeout(resolve, 10)); // Add delay between ops
      await timedSub(20);

      expect(timeLog.length).assertEqual(2);
      expect(timeLog[0].val).assertEqual(15);
      expect(timeLog[1].val).assertEqual(20);
      expect(timeLog[1].timestamp - timeLog[0].timestamp).assertLargerOrEqual(10); // Delay between timestamps
      expect(ia[0]).assertEqual(55); // 90 -15-20 = 55
    });

    /**
     * @tc.name   atomicsSubTest094
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_094
     * @tc.desc   Nested async: subtract with value derived from array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 60;

      const getDerivedVal = (arr: Int32Array, idx: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const derived = arr[idx] / 4; // Derive value: 60 / 4 = 15
            resolve(derived);
          }, 6);
        });
      };

      const derivedSub = async (arr: Int32Array, idx: number) => {
        const val = await getDerivedVal(arr, idx);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.sub(arr, idx, val);
            resolve(old);
          }, 5);
        });
      };

      const oldValue = await derivedSub(ia, 0);
      expect(oldValue).assertEqual(60);
      expect(ia[0]).assertEqual(45); // 60 - 15 = 45
    });

    /**
     * @tc.name   atomicsSubTest095
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_095
     * @tc.desc   Promise.allSettled with subtract tasks on detached and valid buffers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 4;  // X
      ia[1] = 6;  // Y
      ia[2] = 10; // X+Y

      expect(Atomics.isLockFree(4)).assertEqual(true);

      Atomics.add(ia, 0, 2); // X:4→6
      Atomics.add(ia, 1, 3); // Y:6→9
      const newSum = Atomics.load(ia, 0) + Atomics.load(ia, 1);
      Atomics.compareExchange(ia, 2, 10, newSum); // Update sum

      expect(ia[0]).assertEqual(6);
      expect(ia[1]).assertEqual(9);
      expect(ia[2]).assertEqual(15);
    });

    /**
     * @tc.name   atomicsSubTest096
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_096
     * @tc.desc   Async subtract with closure that skips zero subtract values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 80;
      let skipCount = 0;

      const createZeroSkipSub = (arr: Int32Array, idx: number) => {
        return async (val: number) => {
          if (val === 0) {
            skipCount++;
            return Promise.resolve(arr[idx]); // Return current value, skip subtract
          }
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, val);
              resolve(old);
            }, 7);
          });
        };
      };

      const zeroSkipSub = createZeroSkipSub(ia, 0);
      const old1 = await zeroSkipSub(15); // Val≠0 → 80→65
      const old2 = await zeroSkipSub(0); // Val=0 → skip
      const old3 = await zeroSkipSub(20); // Val≠0 →65→45

      expect(skipCount).assertEqual(1);
      expect(old1).assertEqual(80);
      expect(old2).assertEqual(65); // Returns current value (no subtract)
      expect(old3).assertEqual(65);
      expect(ia[0]).assertEqual(45); // 80 -15-20 = 45
    });

    /**
     * @tc.name   atomicsSubTest097
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_097
     * @tc.desc   Nested async: subtract with batch validation and error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 50;
      ia[1] = 70;
      const subs: number[] = [10, 0, 15]; // Mixed valid/invalid values
      const successIndexes: number[] = [];

      const validateAndBatchSub = async (arr: Int32Array, indexes: number[], values: number[]) => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const validVal = typeof values[i] === 'number' ? values[i] : 0;
                if (typeof values[i] === 'number') {
                  successIndexes.push(idx);
                }
                const old = Atomics.sub(arr, idx, validVal);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      const oldValues = await validateAndBatchSub(ia, [0, 1, 0], subs);
      expect(successIndexes).assertDeepEquals([0, 1,0]); // Valid values at indexes 0 and 2
      expect(oldValues).assertDeepEquals([50, 70, 40]); // Old values for each subtract
      expect(ia[0]).assertEqual(25); // 50 -10-15 = 25
      expect(ia[1]).assertEqual(70); // Invalid value → subtract 0, no change
    });

    /**
     * @tc.name   atomicsSubTest098
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_098
     * @tc.desc   Async subtract with closure that tracks value change history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 90;
      const changeHistory: Array<typeSub98> = [];

      const createHistorySub = (arr: Int32Array, idx: number) => {
        return async (val: number) => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const before = arr[idx];
              const old = Atomics.sub(arr, idx, val);
              const after = arr[idx];
              changeHistory.push({ before, after, val });
              resolve(old);
            }, 7);
          });
        };
      };

      const historySub = createHistorySub(ia, 0);
      await historySub(20); // 90→70, val=20
      await historySub(15); //70→55, val=15

      expect(changeHistory.length).assertEqual(2);
      expect(changeHistory[0]).assertDeepEquals({ before: 90, after: 70, val: 20 });
      expect(changeHistory[1]).assertDeepEquals({ before: 70, after: 55, val: 15 });
      expect(ia[0]).assertEqual(55);
    });

    /**
     * @tc.name   atomicsSubTest099
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_099
     * @tc.desc   Nested arrow functions: async subtract with dynamic value from closure state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 120n;

      const createDynamicStateSub = (arr: BigInt64Array, idx: number) => {
        let stateMultiplier = 2n; // State to adjust subtract value

        return async (baseVal: bigint) => {
          const dynamicVal = baseVal * stateMultiplier;
          stateMultiplier += 1n; // Update state after each call
          return new Promise<bigint>((resolve) => {
            setTimeout(() => {
              const old = Atomics.sub(arr, idx, dynamicVal);
              resolve(old);
            }, 6);
          });
        };
      };

      const dynamicStateSub = createDynamicStateSub(ba, 0);
      const old1 = await dynamicStateSub(10n); // dynamicVal=20n →120n→100n
      const old2 = await dynamicStateSub(10n); // dynamicVal=30n →100n→70n

      expect(old1).assertEqual(120n);
      expect(old2).assertEqual(100n);
      expect(ba[0]).assertEqual(70n); // 120n -20n-30n =70n
    });

    /**
     * @tc.name   atomicsSubTest100
     * @tc.number SUB_BUILTINS_Atomics_sub_TEST_100
     * @tc.desc   Comprehensive async workflow: validate → batch subtract → log → cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsSubTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 60;
      ia[1] = 90;
      ia[2] = 120;
      const subs = [15, 25, 30];
      const log: string[] = [];
      let validationPassed = false;
      let cleanedUp = false;

      // Step 1: Validate all subtract values
      const validateBatch = (values: number[]): Promise<boolean> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            validationPassed = values.every(v => v > 0);
            log.push(`Batch validation: ${validationPassed ? 'passed' : 'failed'}`);
            resolve(validationPassed);
          }, 8);
        });
      };

      // Step 2: Batch subtract
      const runBatch = (arr: Int32Array, indexes: number[], values: number[]): Promise<number[]> => {
        return Promise.all(
          indexes.map((idx, i) => {
            return new Promise<number>((resolve) => {
              setTimeout(() => {
                const old = Atomics.sub(arr, idx, values[i]);
                log.push(`Sub index ${idx}: old=${old}, new=${arr[idx]}`);
                resolve(old);
              }, 5);
            });
          })
        );
      };

      // Step 3: Cleanup (reset to initial values)
      const cleanupBatch = (arr: Int32Array, initial: number[]): Promise<void> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            arr[0] = initial[0];
            arr[1] = initial[1];
            arr[2] = initial[2];
            cleanedUp = true;
            log.push('Cleanup: restored initial values');
            resolve();
          }, 10);
        });
      };

      // Execute workflow
      const initialValues = [60, 90, 120];
      const isValid = await validateBatch(subs);
      let oldValues: number[] = [];
      if (isValid) {
        oldValues = await runBatch(ia, [0, 1, 2], subs);
        await cleanupBatch(ia, initialValues);
      }

      // Assertions
      expect(validationPassed).assertEqual(true);
      expect(oldValues).assertDeepEquals(initialValues);
      expect(cleanedUp).assertEqual(true);
      expect(ia).assertDeepEquals(new Int32Array(initialValues));
      expect(log).assertDeepEquals([
        'Batch validation: passed',
        'Sub index 0: old=60, new=45',
        'Sub index 1: old=90, new=65',
        'Sub index 2: old=120, new=90',
        'Cleanup: restored initial values'
      ]);
    });
  })
}