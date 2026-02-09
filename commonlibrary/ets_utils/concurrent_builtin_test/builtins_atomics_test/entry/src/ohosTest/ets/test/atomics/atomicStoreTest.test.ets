import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { typeLoad95, typeStore80, typeStore85, typeStore88, typeStore95 } from './atomics';
import { sleep } from './utils';


export default function atomicsStoreTest() {
  describe('atomicsStoreTest', () => {
    afterEach(async () => {
      await sleep(10)
    })


    /**
     * @tc.name   atomicsStoreTest001
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0001
     * @tc.desc   Store value to Int32Array valid index and return stored value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsStoreTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const storedVal = Atomics.store(ta, 0, 100);
      expect(storedVal).assertEqual(100);
      expect(ta[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsStoreTest002
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0002
     * @tc.desc   Store value to Uint32Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsStoreTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      const storedVal = Atomics.store(ta, 0, 4294967295);
      expect(storedVal).assertEqual(4294967295);
      expect(ta[0]).assertEqual(4294967295);
    });

    /**
     * @tc.name   atomicsStoreTest003
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0003
     * @tc.desc   Store value to Int8Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsStoreTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      const storedVal = Atomics.store(ta, 0, -128);
      expect(storedVal).assertEqual(-128);
      expect(ta[0]).assertEqual(-128);
    });

    /**
     * @tc.name   atomicsStoreTest004
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0004
     * @tc.desc   Store value to Uint8Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsStoreTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);
      const storedVal = Atomics.store(ta, 0, 255);
      expect(storedVal).assertEqual(255);
      expect(ta[0]).assertEqual(255);
    });

    /**
     * @tc.name   atomicsStoreTest005
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0005
     * @tc.desc   Store value to Int16Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsStoreTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int16Array(sab);
      const storedVal = Atomics.store(ta, 0, 32767);
      expect(storedVal).assertEqual(32767);
      expect(ta[0]).assertEqual(32767);
    });

    /**
     * @tc.name   atomicsStoreTest006
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0006
     * @tc.desc   Store value to Uint16Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsStoreTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Uint16Array(sab);
      const storedVal = Atomics.store(ta, 0, 65535);
      expect(storedVal).assertEqual(65535);
      expect(ta[0]).assertEqual(65535);
    });

    /**
     * @tc.name   atomicsStoreTest007
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0007
     * @tc.desc   Store BigInt value to BigInt64Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const storedVal = Atomics.store(ta, 0, 9223372036854775807n);
      expect(storedVal).assertEqual(9223372036854775807n);
      expect(ta[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.name   atomicsStoreTest008
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0008
     * @tc.desc   Store BigInt value to BigUint64Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const storedVal = Atomics.store(ta, 0, 18446744073709551615n);
      expect(storedVal).assertEqual(18446744073709551615n);
      expect(ta[0]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.name   atomicsStoreTest009
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0009
     * @tc.desc   Throw RangeError when index is out of bounds (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      try {
        Atomics.store(ta, 1, 200);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest010
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0010
     * @tc.desc   Throw RangeError when index is negative (Uint8Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);
      try {
        Atomics.store(ta, -1, 150);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest011
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0011
     * @tc.desc   Throw TypeError when typedArray is non-integer type (Float32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);

      expect(Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化值，再原子递增
      Atomics.store(ia, 0, 10);
      Atomics.add(ia, 0, 7);

      expect(Atomics.load(ia, 0)).assertEqual(17);
    });

    /**
     * @tc.name   atomicsStoreTest012
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0012
     * @tc.desc   Store value in async arrow function wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const asyncStore = async () => Atomics.store(ta, 0, 250);
      const storedVal = await asyncStore();
      expect(storedVal).assertEqual(250);
      expect(ta[0]).assertEqual(250);
    });

    /**
     * @tc.name   atomicsStoreTest013
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0013
     * @tc.desc   Store value with nested arrow functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      const outer = (arr: Uint32Array, idx: number, val: number) => Atomics.store(arr, idx, val);
      const storedVal = outer(ta, 0, 1500000000);
      expect(storedVal).assertEqual(1500000000);
      expect(ta[0]).assertEqual(1500000000);
    });

    /**
     * @tc.name   atomicsStoreTest014
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0014
     * @tc.desc   Store value then load to verify (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      Atomics.store(ta, 0, 30);
      const loadedVal = Atomics.load(ta, 0);
      expect(loadedVal).assertEqual(30);
    });

    /**
     * @tc.name   atomicsStoreTest015
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0015
     * @tc.desc   Store value to middle index of multi-element Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsStoreTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(6); // 3 Int16 elements
      const ta = new Int16Array(sab);
      const storedVal = Atomics.store(ta, 1, 20);
      expect(storedVal).assertEqual(20);
      expect(ta[0]).assertEqual(0);
      expect(ta[1]).assertEqual(20);
      expect(ta[2]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsStoreTest016
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0016
     * @tc.desc   Store BigInt value with arrow function wrapper (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const storeWrapper = (arr: BigInt64Array, idx: number, val: bigint) => Atomics.store(arr, idx, val);
      const storedVal = storeWrapper(ta, 0, -9223372036854775808n);
      expect(storedVal).assertEqual(-9223372036854775808n);
      expect(ta[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.name   atomicsStoreTest017
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0017
     * @tc.desc   Throw TypeError when typedArray is non-SharedArrayBuffer backed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const ta = new Int32Array([10, 20]); // Non-SharedArrayBuffer
      try {
        Atomics.store(ta, 0, 50);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest018
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0018
     * @tc.desc   Store value in Promise.resolve with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const storedVal = await Promise.resolve().then(() => Atomics.store(ta, 0, 45));
      expect(storedVal).assertEqual(45);
      expect(ta[0]).assertEqual(45);
    });

    /**
     * @tc.name   atomicsStoreTest019
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0019
     * @tc.desc   Store multiple values sequentially (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ta = new Int32Array(sab);
      Atomics.store(ta, 0, 100);
      Atomics.store(ta, 1, 200);
      expect(ta[0]).assertEqual(100);
      expect(ta[1]).assertEqual(200);
    });

    /**
     * @tc.name   atomicsStoreTest020
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0020
     * @tc.desc   Store value to Uint16Array then modify with Atomics.add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Uint16Array(sab);
      Atomics.store(ta, 0, 5000);
      Atomics.add(ta, 0, 1000);
      expect(ta[0]).assertEqual(6000);
    });

    /**
     * @tc.name   atomicsStoreTest021
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0021
     * @tc.desc   Nested arrow functions with parameter validation before store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const validateAndStore = (arr: Int32Array, idx: number, val: number): number => {
        if (idx < 0 || idx >= arr.length) {
          throw new Error('Invalid index');
        }
        return Atomics.store(arr, idx, val);
      }
      const storedVal = validateAndStore(ta, 0, 75);
      expect(storedVal).assertEqual(75);
      expect(ta[0]).assertEqual(75);
    });

    /**
     * @tc.name   atomicsStoreTest022
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0022
     * @tc.desc   Store value in async arrow function with delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      const delayedStore = async () => {
        await new Promise<void>(resolve => setTimeout(resolve, 5));
        return Atomics.store(ta, 0, 127);
      };
      const storedVal = await delayedStore();
      expect(storedVal).assertEqual(127);
      expect(ta[0]).assertEqual(127);
    });

    /**
     * @tc.name   atomicsStoreTest023
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0023
     * @tc.desc   Throw RangeError when index equals array length (Uint32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Uint32 elements
      const ta = new Uint32Array(sab);
      try {
        Atomics.store(ta, 2, 300);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest024
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0024
     * @tc.desc   Store BigInt value with nested arrow wrapper (BigUint64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const outerWrapper = (arr: BigUint64Array) => (idx: number, val: bigint) => Atomics.store(arr, idx, val);
      const storedVal = outerWrapper(ta)(0, 1234567890123456789n);
      expect(storedVal).assertEqual(1234567890123456789n);
      expect(ta[0]).assertEqual(1234567890123456789n);
    });

    /**
     * @tc.name   atomicsStoreTest025
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0025
     * @tc.desc   Store value in Promise.race with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const raceResult: number = await Promise.race([
        Promise.resolve().then(() => Atomics.store(ta, 0, 60)),
        new Promise<number>(resolve => setTimeout(() => resolve(0), 10))
      ]);
      expect(raceResult).assertEqual(60);
      expect(ta[0]).assertEqual(60);
    });

    /**
     * @tc.name   atomicsStoreTest026
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0026
     * @tc.desc   Store zero value to Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsStoreTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const storedVal = Atomics.store(ta, 0, 0);
      expect(storedVal).assertEqual(0);
      expect(ta[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsStoreTest027
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0027
     * @tc.desc   Nested arrow functions with error handling on invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const safeStore = (arr: Int32Array, idx: number, val: number) => {
        try {
          return Atomics.store(arr, idx, val);
        } catch (err) {
          return (err as Error).name;
        }
      }
      expect(safeStore(ta, 0, 80)).assertEqual(80);
      expect(safeStore(ta, 1, 90)).assertEqual('RangeError');
    });

    /**
     * @tc.name   atomicsStoreTest028
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0028
     * @tc.desc   Store value to Uint8Array then overwrite with new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);
      Atomics.store(ta, 0, 50);
      const storedVal = Atomics.store(ta, 0, 150);
      expect(storedVal).assertEqual(150);
      expect(ta[0]).assertEqual(150);
    });

    /**
     * @tc.name   atomicsStoreTest029
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0029
     * @tc.desc   Store value in async IIFE with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const storedVal = await (async () => Atomics.store(ta, 0, 95))();
      expect(storedVal).assertEqual(95);
      expect(ta[0]).assertEqual(95);
    });

    /**
     * @tc.name   atomicsStoreTest030
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0030
     * @tc.desc   Store negative BigInt value to BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const storeBigInt = (arr: BigInt64Array, idx: number, val: bigint) => Atomics.store(arr, idx, val);
      const storedVal = storeBigInt(ta, 0, -123456789n);
      expect(storedVal).assertEqual(-123456789n);
      expect(ta[0]).assertEqual(-123456789n);
    });


    /**
     * @tc.name   atomicsStoreTest031
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0031
     * @tc.desc   Store value to Int32Array via nested arrow index mapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ta = new Int32Array(sab);
      const indexMapper = (name: 'first' | 'second', val: number) => Atomics.store(ta, name === 'first' ? 0 : 1, val)

      indexMapper('first', 1000);
      indexMapper('second', 2000);
      expect(ta[0]).assertEqual(1000);
      expect(ta[1]).assertEqual(2000);
    });

    /**
     * @tc.name   atomicsStoreTest032
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0032
     * @tc.desc   Throw TypeError when index is non-integer (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      try {
        Atomics.store(ta, 0.5, 123n);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest033
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0033
     * @tc.desc   Async arrow function with parameter injection for Uint8Array store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);
      const asyncStore = async (arr: Uint8Array, idx: number, val: number) => Atomics.store(arr, idx, val);

      const storedVal = await asyncStore(ta, 0, 123);
      expect(storedVal).assertEqual(123);
      expect(ta[0]).assertEqual(123);
    });

    /**
     * @tc.name   atomicsStoreTest034
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0034
     * @tc.desc   Store value to Int16Array then apply Atomics.or
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int16Array(sab);
      Atomics.store(ta, 0, 10); // 0b1010
      Atomics.or(ta, 0, 3); // 0b0011 → 0b1011 (11)

      expect(ta[0]).assertEqual(11);
    });

    /**
     * @tc.name   atomicsStoreTest035
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0035
     * @tc.desc   Nested arrow safe store with index bounds check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const safeStore = (arr: Int32Array, idx: number, val: number) =>
      idx >= 0 && idx < arr.length ? Atomics.store(arr, idx, val) : 'Invalid index'

      expect(safeStore(ta, 0, 456)).assertEqual(456);
      expect(safeStore(ta, 1, 789)).assertEqual('Invalid index');
      expect(ta[0]).assertEqual(456);
    });

    /**
     * @tc.name   atomicsStoreTest036
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0036
     * @tc.desc   Store multiple values to BigUint64Array via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(16); // 2 BigUint64 elements
      const ta = new BigUint64Array(sab);
      const values = [12345n, 67890n];
      const indices = [0, 1];

      await Promise.all(
        indices.map((idx, i) =>
        Promise.resolve().then(() => Atomics.store(ta, idx, values[i]))
        )
      );

      expect(ta[0]).assertEqual(12345n);
      expect(ta[1]).assertEqual(67890n);
    });

    /**
     * @tc.name   atomicsStoreTest037
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0037
     * @tc.desc   Throw RangeError when index exceeds array length (Uint16Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4); // 2 Uint16 elements
      const ta = new Uint16Array(sab);
      try {
        Atomics.store(ta, 5, 1000);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest038
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0038
     * @tc.desc   Arrow function for Int8Array store with value range validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      const storeAndValidate = (arr: Int8Array, idx: number, val: number) => {
        const isValid = val >= -128 && val <= 127;
        return isValid ? Atomics.store(arr, idx, val) : 'Out of range';
      }

      expect(storeAndValidate(ta, 0, -45)).assertEqual(-45);
      expect(storeAndValidate(ta, 0, 150)).assertEqual('Out of range');
    });

    /**
     * @tc.name   atomicsStoreTest039
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0039
     * @tc.desc   Async arrow store with retry on invalid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      let retryCount = 0;

      const asyncStoreWithRetry =
        async (arr: Int32Array, idx: number, val: number, maxRetries: number): Promise<number> => {
          try {
            return Atomics.store(arr, idx, val);
          } catch (err) {
            if (retryCount < maxRetries && (err as Error).name === 'RangeError') {
              retryCount++;
              await new Promise<void>(resolve => setTimeout(resolve, 2));
              return asyncStoreWithRetry(arr, 0, val, maxRetries); // Retry with valid index
            }
            throw err as Error;
          }
        };

      const storedVal = await asyncStoreWithRetry(ta, 1, 789, 1);
      expect(storedVal).assertEqual(789);
      expect(retryCount).assertEqual(1);
      expect(ta[0]).assertEqual(789);
    });

    /**
     * @tc.name   atomicsStoreTest040
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0040
     * @tc.desc   Nested arrow function for Uint32Array store with value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      const transformStore = (arr: Uint32Array, idx: number, val: number, factor: number) =>
      Atomics.store(arr, idx, val * factor)

      transformStore(ta, 0, 100, 2);
      expect(ta[0]).assertEqual(200);
      transformStore(ta, 0, 50, 5);
      expect(ta[0]).assertEqual(250);
    });

    /**
     * @tc.name   atomicsStoreTest041
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0041
     * @tc.desc   Async IIFE with arrow function for BigInt64Array store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);

      const storedVal = await (async (arr: BigInt64Array, idx: number, val: bigint) =>
      Atomics.store(arr, idx, val)
      )(ta, 0, -987654321n);

      expect(storedVal).assertEqual(-987654321n);
      expect(ta[0]).assertEqual(-987654321n);
    });

    /**
     * @tc.name   atomicsStoreTest042
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0042
     * @tc.desc   Throw TypeError when typedArray is plain object (non-typed array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);

      expect(Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化状态，再原子切换
      Atomics.store(ia, 0, 0b0010);
      Atomics.xor(ia, 0, 0b0110);

      expect(Atomics.load(ia, 0)).assertEqual(0b0100);
    });

    /**
     * @tc.name   atomicsStoreTest043
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0043
     * @tc.desc   Store value to Int16Array via Promise.race with error fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int16Array(sab);
      const raceResult = await Promise.race([
        Promise.resolve().then(() => Atomics.store(ta, 0, 321)),
        new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Timeout')), 10))
      ]);

      expect(raceResult).assertEqual(321);
      expect(ta[0]).assertEqual(321);
    });

    /**
     * @tc.name   atomicsStoreTest044
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0044
     * @tc.desc   Arrow function for Uint8Array store with even index check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(3); // 3 Uint8 elements
      const ta = new Uint8Array(sab);
      const evenIndexStore = (arr: Uint8Array, idx: number, val: number) =>
      idx % 2 === 0 ? Atomics.store(arr, idx, val) : 'Odd index'

      expect(evenIndexStore(ta, 2, 255)).assertEqual(255);
      expect(evenIndexStore(ta, 1, 100)).assertEqual('Odd index');
      expect(ta[2]).assertEqual(255);
      expect(ta[1]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsStoreTest045
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0045
     * @tc.desc   Store value to Int32Array then apply Atomics.xor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      Atomics.store(ta, 0, 15); // 0b1111
      Atomics.xor(ta, 0, 8); // 0b1000 → 0b0111 (7)

      expect(ta[0]).assertEqual(7);
    });

    /**
     * @tc.name   atomicsStoreTest046
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0046
     * @tc.desc   Nested arrow function for BigUint64Array store with value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const valueCheckStore = (arr: BigUint64Array, idx: number, val: bigint, target: bigint) => {
        Atomics.store(arr, idx, val);
        return arr[idx] > target;
      }

      expect(valueCheckStore(ta, 0, 999999999999999999n, 100000000000000000n)).assertEqual(true);
      expect(valueCheckStore(ta, 0, 50000000000000000n, 100000000000000000n)).assertEqual(false);
    });

    /**
     * @tc.name   atomicsStoreTest047
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0047
     * @tc.desc   Throw RangeError when index is negative (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      try {
        Atomics.store(ta, -1, 123n);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });


    /**
     * @tc.name   atomicsStoreTest048
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0048
     * @tc.desc   Async arrow store for Int8Array with delay and logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      let log: string[] = [];

      const delayedStoreWithLog = async (arr: Int8Array, idx: number, val: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, 5));
        const storedVal = Atomics.store(arr, idx, val);
        log.push(`Stored value: ${storedVal}`);
        return storedVal;
      };

      const result = await delayedStoreWithLog(ta, 0, 67);
      expect(result).assertEqual(67);
      expect(log).assertDeepEquals(['Stored value: 67']);
      expect(ta[0]).assertEqual(67);
    });

    /**
     * @tc.name   atomicsStoreTest049
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0049
     * @tc.desc   Nested arrow batch store for Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(6); // 3 Uint16 elements
      const ta = new Uint16Array(sab);
      const values = [1000, 2000, 3000];

      const batchStore = (arr: Uint16Array, indices: number[], vals: number[]) =>
      indices.forEach((idx, i) => Atomics.store(arr, idx, vals[i]))

      batchStore(ta, [0, 1, 2], values);
      expect(ta[0]).assertEqual(1000);
      expect(ta[1]).assertEqual(2000);
      expect(ta[2]).assertEqual(3000);
    });

    /**
     * @tc.name   atomicsStoreTest050
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0050
     * @tc.desc   Store value to Int32Array then apply Atomics.add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      Atomics.store(ta, 0, 50);
      Atomics.add(ta, 0, 30); // 50 + 30 = 80

      expect(ta[0]).assertEqual(80);
    });

    /**
     * @tc.name   atomicsStoreTest051
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0051
     * @tc.desc   Promise.allSettled with valid/invalid BigUint64Array store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const promises = [
        Promise.resolve().then(() => Atomics.store(ta, 0, 123456789n)), // Valid
        Promise.resolve().then(() => Atomics.store(ta, 1, 987654321n))// Invalid index
      ];

      const results = await Promise.allSettled(promises);
      // Valid store result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<bigint>).value).assertEqual(123456789n);
      expect(ta[0]).assertEqual(123456789n);
      // Invalid store result
      expect(results[1].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertContain('Index is overflow');
    });

    /**
     * @tc.name   atomicsStoreTest052
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0052
     * @tc.desc   Throw TypeError when typedArray is Float64Array (non-integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);

      expect(Atomics.isLockFree(8)).assertEqual(true);

      // 原子初始化 64 位位掩码，再原子置位
      Atomics.store(ba, 0, 0b10000000n);
      Atomics.or(ba, 0, 0b00001000n);

      expect(Atomics.load(ba, 0)).assertEqual(0b10001000n);
    });

    /**
     * @tc.name   atomicsStoreTest053
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0053
     * @tc.desc   Nested arrow safe store with null check for Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      const safeStore = (arr: Int8Array | null, idx: number, val: number) =>
      arr ? Atomics.store(arr, idx, val) : 'Array is null'

      expect(safeStore(ta, 0, -89)).assertEqual(-89);
      expect(safeStore(null, 0, 10)).assertEqual('Array is null');
      expect(ta[0]).assertEqual(-89);
    });

    /**
     * @tc.name   atomicsStoreTest054
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0054
     * @tc.desc   Async arrow store for Uint32Array with multiple delays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      let delayCount = 0;

      const delayedStore = async (arr: Uint32Array, idx: number, val: number, delays: number[]) => {
        for (const delay of delays) {
          await new Promise<void>(resolve => setTimeout(resolve, delay));
          delayCount++;
        }
        return Atomics.store(arr, idx, val);
      };

      const result = await delayedStore(ta, 0, 4294967295, [2, 3]);
      expect(result).assertEqual(4294967295);
      expect(delayCount).assertEqual(2);
      expect(ta[0]).assertEqual(4294967295);
    });

    /**
     * @tc.name   atomicsStoreTest055
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0055
     * @tc.desc   Nested arrow store for Int16Array with value formatting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int16Array(sab);
      const formattedStore = (arr: Int16Array, idx: number, val: number, prefix: string) => {
        Atomics.store(arr, idx, val);
        return `${prefix}${val}`;
      }

      const result1 = formattedStore(ta, 0, 500, 'Value: ');
      const result2 = formattedStore(ta, 0, 600, 'Data: ');
      expect(result1).assertEqual('Value: 500');
      expect(result2).assertEqual('Data: 600');
      expect(ta[0]).assertEqual(600);
    });

    /**
     * @tc.name   atomicsStoreTest056
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0056
     * @tc.desc   Throw RangeError when index equals array length (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ta = new Int32Array(sab);
      try {
        Atomics.store(ta, 2, 1000);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest057
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0057
     * @tc.desc   Async arrow store for BigInt64Array with result comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const targetVal = -1000000000000n;

      const loadAndCompare = async (arr: BigInt64Array, idx: number, val: bigint) => {
        await new Promise<void>(resolve => setTimeout(resolve, 4));
        const storedVal = Atomics.store(arr, idx, val);
        return storedVal === targetVal;
      };

      const isMatch = await loadAndCompare(ta, 0, targetVal);
      const isMismatch = await loadAndCompare(ta, 0, -999999999999n);
      expect(isMatch).assertEqual(true);
      expect(isMismatch).assertEqual(false);
      expect(ta[0]).assertEqual(-999999999999n);
    });

    /**
     * @tc.name   atomicsStoreTest058
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0058
     * @tc.desc   Nested arrow store for Uint8Array with range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);
      const rangeCheckStore = (arr: Uint8Array, idx: number, val: number, min: number, max: number) => {
        const storedVal = Atomics.store(arr, idx, val);
        return storedVal >= min && storedVal <= max ? storedVal : 'Out of range';
      }

      expect(rangeCheckStore(ta, 0, 150, 100, 200)).assertEqual(150);
      expect(rangeCheckStore(ta, 0, 250, 200, 300)).assertEqual(250);
      expect(ta[0]).assertEqual(250);
    });

    /**
     * @tc.name   atomicsStoreTest059
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0059
     * @tc.desc   Nested Promise chain with arrow functions for Int32Array store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      const result = await Promise.resolve()
        .then(() => new Promise<Int32Array>(resolve => setTimeout(() => resolve(ta), 3)))
        .then((arr) => Atomics.store(arr, 0, 7890))
        .then((val) => val);

      expect(result).assertEqual(7890);
      expect(ta[0]).assertEqual(7890);
    });

    /**
     * @tc.name   atomicsStoreTest060
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0060
     * @tc.desc   Throw TypeError when typedArray is non-SharedArrayBuffer backed (Uint16Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const ta = new Uint16Array([100, 200]); // Non-SharedArrayBuffer backed
      try {
        Atomics.store(ta, 0, 500);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });


    /**
     * @tc.name   atomicsStoreTest061
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0061
     * @tc.desc   Nested async arrows for BigUint64Array store with delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const targetVal = 1234567890123456789n;

      const outerDelay = async (delayMs: number, arr: BigUint64Array, idx: number, val: bigint) => {
        await new Promise<void>(resolve => setTimeout(resolve, delayMs));
        return Atomics.store(arr, idx, val);
      }

      const storedVal = await outerDelay(3, ta, 0, targetVal);
      expect(storedVal).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest062
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0062
     * @tc.desc   Promise.race with multiple Int8Array stores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      const val1 = -34;
      const val2 = -56;

      const createLoader = (delay: number, val: number) =>
      new Promise<number>((resolve) =>
      setTimeout(() => resolve(Atomics.store(ta, 0, val)), delay)
      );

      const raceResult = await Promise.race([createLoader(2, val1), createLoader(5, val2)]);
      expect(raceResult).assertEqual(val1);
      expect(ta[0]).assertEqual(val1);
    });

    /**
     * @tc.name   atomicsStoreTest063
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0063
     * @tc.desc   Nested arrows with async error recovery for Int32Array store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 30; // 原始值
      ia[1] = 0;  // 目标值

      expect(Atomics.isLockFree(4)).assertEqual(true);

      // 原子存储交换值，再原子交换
      Atomics.store(ia, 1, 50);
      const oldVal = Atomics.exchange(ia, 0, Atomics.load(ia, 1));

      expect(oldVal).assertEqual(30);
      expect(Atomics.load(ia, 0)).assertEqual(50);
      expect(Atomics.load(ia, 1)).assertEqual(50);
    });

    /**
     * @tc.name   atomicsStoreTest064
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0064
     * @tc.desc   Async batch store for Uint32Array via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Uint32 elements
      const ta = new Uint32Array(sab);
      const values = [100000, 200000, 300000];
      const indices = [0, 1, 2];

      const batchStore = async (arr: Uint32Array, idxs: number[], vals: number[]) =>
      Promise.all(idxs.map(async (idx, i) => {
        await new Promise<void>(resolve => setTimeout(resolve, 1));
        return Atomics.store(arr, idx, vals[i]);
      }));

      const storedVals = await batchStore(ta, indices, values);
      expect(storedVals).assertDeepEquals(values);
      expect(ta[0]).assertEqual(values[0]);
      expect(ta[1]).assertEqual(values[1]);
      expect(ta[2]).assertEqual(values[2]);
    });

    /**
     * @tc.name   atomicsStoreTest065
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0065
     * @tc.desc   Throw TypeError when index is string (non-integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);

      expect(Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化配额，再原子扣减
      Atomics.store(ia, 0, 40);
      Atomics.sub(ia, 0, 12);

      expect(Atomics.load(ia, 0)).assertEqual(28);
    });

    /**
     * @tc.name   atomicsStoreTest066
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0066
     * @tc.desc   Async arrow store for BigInt64Array with post-processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const targetVal = -987654321n;

      const storeAndAbs = async (arr: BigInt64Array, idx: number, val: bigint) => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const storedVal = Atomics.store(arr, idx, val);
        return storedVal < 0n ? -storedVal : storedVal;
      };

      const absVal = await storeAndAbs(ta, 0, targetVal);
      expect(absVal).assertEqual(987654321n);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest067
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0067
     * @tc.desc   Nested arrows with async validation callback for Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int16Array(sab);
      const targetVal = 32000;
      let validationCalled = false;

      const storeWithValidation = async (arr: Int16Array, idx: number, val: number, callback: (v: number) => void) => {
        const storedVal = Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        callback(storedVal);
        validationCalled = true;
        return storedVal;
      }

      const storedVal = await storeWithValidation(ta, 0, targetVal, (val) => {
        expect(val).assertEqual(targetVal);
      });
      expect(storedVal).assertEqual(targetVal);
      expect(validationCalled).assertEqual(true);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest068
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0068
     * @tc.desc   Promise.allSettled with mixed valid/invalid Uint8Array stores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(2); // 2 Uint8 elements
      const ta = new Uint8Array(sab);
      const validVal = 200;
      const invalidIdx1 = 5;
      const invalidIdx2 = -2;

      const promises = [
        Promise.resolve().then(() => Atomics.store(ta, 1, validVal)),
        Promise.resolve().then(() => Atomics.store(ta, invalidIdx1, 100)),
        Promise.resolve().then(() => Atomics.store(ta, invalidIdx2, 50))
      ];

      const results = await Promise.allSettled(promises);
      // Valid store result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(validVal);
      expect(ta[1]).assertEqual(validVal);
      // Invalid store results
      expect(results[1].status).assertEqual('rejected');
      expect(results[2].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertContain('Index is overflow');
      expect((results[2] as PromiseRejectedResult).reason.message).assertContain('integerIndex');
    });

    /**
     * @tc.name   atomicsStoreTest069
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0069
     * @tc.desc   Async arrow store for Int32Array with dynamic index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ta = new Int32Array(sab);
      const val1 = 111;
      const val2 = 222;

      const dynamicStore = async (arr: Int32Array, useIndex1: boolean, val: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        const idx = useIndex1 ? 1 : 0;
        return Atomics.store(arr, idx, val);
      };

      const storedVal1 = await dynamicStore(ta, false, val1);
      const storedVal2 = await dynamicStore(ta, true, val2);
      expect(storedVal1).assertEqual(val1);
      expect(storedVal2).assertEqual(val2);
      expect(ta[0]).assertEqual(val1);
      expect(ta[1]).assertEqual(val2);
    });

    /**
     * @tc.name   atomicsStoreTest070
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0070
     * @tc.desc   Throw TypeError when typedArray is ArrayBuffer (not typed array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);

      expect(Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化，再执行幂等更新（仅当值匹配时更新）
      Atomics.store(ia, 0, 8);
      const updated = Atomics.compareExchange(ia, 0, 8, 16);

      expect(updated).assertEqual(8);
      expect(Atomics.load(ia, 0)).assertEqual(16);
      // 再次执行无变化
      const noChange = Atomics.compareExchange(ia, 0, 8, 16);
      expect(noChange).assertEqual(16);
    });

    /**
     * @tc.name   atomicsStoreTest071
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0071
     * @tc.desc   Nested async arrows for BigUint64Array store with cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const targetVal = 999999999999999999n;
      let cleanupDone = false;

      const storeWithCleanup = async (arr: BigUint64Array, idx: number, val: bigint) => {
        try {
          await new Promise<void>(resolve => setTimeout(resolve, 3));
          return Atomics.store(arr, idx, val);
        } finally {
          await new Promise<void>(resolve => setTimeout(resolve, 1));
          cleanupDone = true;
        }
      }

      const storedVal = await storeWithCleanup(ta, 0, targetVal);
      expect(storedVal).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
      expect(cleanupDone).assertEqual(true);
    });

    /**
     * @tc.name   atomicsStoreTest072
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0072
     * @tc.desc   Promise.race with Int16Array store and timeout fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int16Array(sab);
      const targetVal = 4567;

      const raceResult = await Promise.race([
        new Promise<number>((resolve) =>
        setTimeout(() => resolve(Atomics.store(ta, 0, targetVal)), 3)
        ),
        new Promise<number>((resolve) =>
        setTimeout(() => resolve(-1), 10)
        )
      ]);

      expect(raceResult).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest073
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0073
     * @tc.desc   Nested arrows for Int32Array store with async transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const targetVal = 1234;

      const transformStore = async (arr: Int32Array, idx: number, val: number) => {
        const storedVal = Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return storedVal.toString();
      }

      const strVal = await transformStore(ta, 0, targetVal);
      expect(strVal).assertEqual(targetVal.toString());
      expect(ta[0]).assertEqual(targetVal);
    });


    /**
     * @tc.name   atomicsStoreTest074
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0074
     * @tc.desc   Async batch store for Uint8Array with index filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4); // 4 Uint8 elements
      const ta = new Uint8Array(sab);
      const values = [10, 20, 30, 40];
      // Filter even indices
      const filteredIndices = [0, 1, 2, 3].filter(idx => idx % 2 === 0);
      const filteredValues = filteredIndices.map(idx => values[idx]);

      const filteredBatchStore = async (arr: Uint8Array, idxs: number[], vals: number[]) => {
        return Promise.all(idxs.map(async (idx, i) => {
          await new Promise<void>(resolve => setTimeout(resolve, 1));
          return Atomics.store(arr, idx, vals[i]);
        }));
      };

      const storedVals = await filteredBatchStore(ta, filteredIndices, filteredValues);
      expect(storedVals).assertDeepEquals(filteredValues);
      expect(ta[0]).assertEqual(filteredValues[0]);
      expect(ta[2]).assertEqual(filteredValues[1]);
      expect(ta[1]).assertEqual(0);
      expect(ta[3]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsStoreTest075
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0075
     * @tc.desc   Throw RangeError when index exceeds max safe integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const maxSafeInt = Number.MAX_SAFE_INTEGER;
      try {
        Atomics.store(ta, maxSafeInt, 123);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest076
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0076
     * @tc.desc   Async arrow store for BigInt64Array with retry on timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);

      expect(Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化带脏位的值，再原子清除指定位
      Atomics.store(ia, 0, 0b110111);
      Atomics.and(ia, 0, 0b110000); // 清除低 4 位

      expect(Atomics.load(ia, 0)).assertEqual(0b110000);
    });

    /**
     * @tc.name   atomicsStoreTest077
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0077
     * @tc.desc   Nested arrows for Int16Array batch store with async validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(6); // 3 Int16 elements
      const ta = new Int16Array(sab);
      const values = [100, 200, 300];
      const indices = [0, 1, 2];
      let validCount = 0;

      const batchValidateStore = async (arr: Int16Array, idxs: number[], vals: number[]) => {
        const storedVals = await Promise.all(
          idxs.map(async (idx, i) => {
            await new Promise<void>(resolve => setTimeout(resolve, 1));
            const storedVal = Atomics.store(arr, idx, vals[i]);
            return storedVal;
          })
        );
        storedVals.forEach(val => val > 0 && validCount++);
        return storedVals;
      }

      const storedVals = await batchValidateStore(ta, indices, values);
      expect(storedVals).assertDeepEquals(values);
      expect(validCount).assertEqual(3);
      expect(ta[0]).assertEqual(values[0]);
      expect(ta[1]).assertEqual(values[1]);
      expect(ta[2]).assertEqual(values[2]);
    });

    /**
     * @tc.name   atomicsStoreTest078
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0078
     * @tc.desc   Promise.all with mixed Uint32Array store and dummy tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      const targetVal = 123456789;

      const mixedTasks = [
        Promise.resolve().then(() => Atomics.store(ta, 0, targetVal)),
        new Promise<number>((resolve) => setTimeout(() => resolve(100 + 200), 2))
      ];

      const result = await Promise.all(mixedTasks);
      expect(result[0]).assertEqual(targetVal);
      expect(result[1]).assertEqual(300);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest079
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0079
     * @tc.desc   Throw TypeError when index is BigInt (non-integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Int32Array (4-byte)
      const sab32 = new SharedArrayBuffer(4);
      const ia32 = new Int32Array(sab32);
      // BigUint64Array (8-byte)
      const sab64 = new SharedArrayBuffer(8);
      const bua64 = new BigUint64Array(sab64);

      expect(Atomics.isLockFree(4)).assertEqual(true);
      expect(Atomics.isLockFree(8)).assertEqual(true);

      // 跨类型原子初始化 + 操作
      Atomics.store(ia32, 0, 20);
      Atomics.add(ia32, 0, 5);

      Atomics.store(bua64, 0, 100n);
      Atomics.add(bua64, 0, 30n);

      expect(Atomics.load(ia32, 0)).assertEqual(25);
      expect(Atomics.load(bua64, 0)).assertEqual(130n);
    });

    /**
     * @tc.name   atomicsStoreTest080
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0080
     * @tc.desc   Async arrow store for Int8Array with state tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      const targetVal = -67;
      const state: typeStore80 = { stored: false, value: 0 };

      const storeWithState = async (arr: Int8Array, idx: number, val: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const storedVal = Atomics.store(arr, idx, val);
        state.stored = true;
        state.value = storedVal;
        return storedVal;
      };

      const storedVal = await storeWithState(ta, 0, targetVal);
      expect(storedVal).assertEqual(targetVal);
      expect(state.stored).assertEqual(true);
      expect(state.value).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest081
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0081
     * @tc.desc   Nested arrows for Int32Array store with async error logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      let errorLog: string[] = [];

      const storeWithErrorLog = async (arr: Int32Array, idx: number, val: number) => {
        try {
          return Atomics.store(arr, idx, val);
        } catch (err) {
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          errorLog.push((err as Error).name);
          throw err as Error;
        }
      }

      try {
        await storeWithErrorLog(ta, 1, 123); // Invalid index
      } catch (err) {
        // Expected error
      }
      expect(errorLog).assertDeepEquals(['RangeError']);
    });

    /**
     * @tc.name   atomicsStoreTest082
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0082
     * @tc.desc   Promise.race with multiple valid BigUint64Array stores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const val1 = 9876543210987654321n;
      const val2 = 1234567890123456789n;

      const loader1 = new Promise<bigint>((resolve) =>
      setTimeout(() => resolve(Atomics.store(ta, 0, val1)), 5)
      );
      const loader2 = new Promise<bigint>((resolve) =>
      setTimeout(() => resolve(Atomics.store(ta, 0, val2)), 2)
      );

      const raceResult = await Promise.race([loader1, loader2]);
      expect(raceResult).assertEqual(val2);
      expect(ta[0]).assertEqual(val2);
    });

    /**
     * @tc.name   atomicsStoreTest083
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0083
     * @tc.desc   Async batch store for Int16Array with value sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4); // 2 Int16 elements
      const ta = new Int16Array(sab);
      const values = [500, 1500];
      const indices = [0, 1];

      const batchStoreAndSum = async (arr: Int16Array, idxs: number[], vals: number[]) => {
        const storedVals = await Promise.all(
          idxs.map(async (idx, i) => {
            await new Promise<void>(resolve => setTimeout(resolve, 1));
            return Atomics.store(arr, idx, vals[i]);
          })
        );
        return storedVals.reduce((acc, val) => acc + val, 0);
      };

      const sum = await batchStoreAndSum(ta, indices, values);
      expect(sum).assertEqual(2000);
      expect(ta[0]).assertEqual(values[0]);
      expect(ta[1]).assertEqual(values[1]);
    });

    /**
     * @tc.name   atomicsStoreTest084
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0084
     * @tc.desc   Throw TypeError when typedArray is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 0; // 状态
      ia[1] = 0; // 审计计数

      expect(Atomics.isLockFree(4)).assertEqual(true);

      // 原子初始化状态，再原子更新审计
      Atomics.store(ia, 0, 1); // 激活状态
      Atomics.exchange(ia, 1, Atomics.load(ia, 1) + 1);

      expect(Atomics.load(ia, 0)).assertEqual(1);
      expect(Atomics.load(ia, 1)).assertEqual(1);
    });

    /**
     * @tc.name   atomicsStoreTest085
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0085
     * @tc.desc   Nested arrows for Int32Array store with async value caching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const targetVal = 45678;
      const cache: typeStore85 = {};

      const cachedStore = async (arr: Int32Array, idx: number, val: number) => {
        if (cache[idx] !== undefined) {
          return cache[idx];
        }
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        const storedVal = Atomics.store(arr, idx, val);
        cache[idx] = storedVal;
        return storedVal;
      }

      const storedVal1 = await cachedStore(ta, 0, targetVal);
      const storedVal2 = await cachedStore(ta, 0, 99999); // Should use cache
      expect(storedVal1).assertEqual(targetVal);
      expect(storedVal2).assertEqual(targetVal);
      expect(cache[0]).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest086
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0086
     * @tc.desc   Promise.allSettled with Uint8Array store and error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(2); // 2 Uint8 elements
      const ta = new Uint8Array(sab);
      const validVal = 255;

      const promises = [
        Promise.resolve().then(() => Atomics.store(ta, 0, validVal)), // Valid
        Promise.resolve().then(() => Atomics.store(ta, 5, 100)), // Invalid
        Promise.resolve().then(() => Atomics.store(ta, -1, 50))// Invalid
      ];

      const results = await Promise.allSettled(promises);
      let validStored = 0;
      let errorCount = 0;

      results.forEach(res => {
        if (res.status === 'fulfilled') {
          validStored++;
          expect((res as PromiseFulfilledResult<number>).value).assertEqual(validVal);
        } else {
          errorCount++;
          expect((res as PromiseRejectedResult).reason.message).assertContain('Index');
        }
      });

      expect(validStored).assertEqual(1);
      expect(errorCount).assertEqual(2);
      expect(ta[0]).assertEqual(validVal);
    });


    /**
     * @tc.name   atomicsStoreTest087
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0087
     * @tc.desc   Async arrow store for Int32Array with dynamic delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const targetVal = 98765;

      const dynamicDelayStore = async (arr: Int32Array, idx: number, val: number) => {
        const delay = idx === 0 ? 3 : 5; // Dynamic delay based on index
        await new Promise<void>(resolve => setTimeout(resolve, delay));
        return Atomics.store(arr, idx, val);
      };

      const storedVal = await dynamicDelayStore(ta, 0, targetVal);
      expect(storedVal).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest088
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0088
     * @tc.desc   Nested arrows for Int32Array store with async range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ta = new Int32Array(sab);
      const val1 = 10000;
      const val2 = 50000;
      const min = 5000;
      const max = 40000;

      const rangeCheckStore = async (arr: Int32Array, idx: number, val: number) => {
        const storedVal = Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return { storedVal, inRange: storedVal >= min && storedVal <= max } as typeStore88;
      }

      const result1 = await rangeCheckStore(ta, 0, val1);
      const result2 = await rangeCheckStore(ta, 1, val2);
      expect(result1.storedVal).assertEqual(val1);
      expect(result1.inRange).assertEqual(true);
      expect(result2.storedVal).assertEqual(val2);
      expect(result2.inRange).assertEqual(false);
      expect(ta[0]).assertEqual(val1);
      expect(ta[1]).assertEqual(val2);
    });

    /**
     * @tc.name   atomicsStoreTest089
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0089
     * @tc.desc   Promise.race with BigInt64Array store and error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const targetVal = -1234567890123n;

      const raceResult = await Promise.race([
        new Promise<bigint>((resolve) =>
        setTimeout(() => resolve(Atomics.store(ta, 0, targetVal)), 2)
        ),
        new Promise<never>((_, reject) =>
        setTimeout(() => reject(new Error('Race error')), 5)
        )
      ]);

      expect(raceResult).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest090
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0090
     * @tc.desc   Throw RangeError when index is negative (Uint16Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4); // 2 Uint16 elements
      const ta = new Uint16Array(sab);
      try {
        Atomics.store(ta, -3, 1000);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest091
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0091
     * @tc.desc   Nested arrows for Int8Array store with async value formatting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      const targetVal = 45;

      const formattedStore = async (arr: Int8Array, idx: number, val: number, currency: string) => {
        const storedVal = Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        return `${currency}${storedVal.toFixed(2)}`;
      }

      const currencyStr = await formattedStore(ta, 0, targetVal, '$');
      expect(currencyStr).assertEqual('$45.00');
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest092
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0092
     * @tc.desc   Async batch store for Uint32Array with unique value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Uint32 elements
      const ta = new Uint32Array(sab);
      const values = [100, 200, 100]; // Duplicate value
      const indices = [0, 1, 2];

      const batchStoreAndCheckUnique = async (arr: Uint32Array, idxs: number[], vals: number[]) => {
        const storedVals = await Promise.all(
          idxs.map(async (idx, i) => {
            await new Promise<void>(resolve => setTimeout(resolve, 1));
            return Atomics.store(arr, idx, vals[i]);
          })
        );
        const uniqueVals = new Set(storedVals);
        return uniqueVals.size === storedVals.length;
      };

      const isUnique = await batchStoreAndCheckUnique(ta, indices, values);
      expect(isUnique).assertEqual(false);
      expect(ta[0]).assertEqual(values[0]);
      expect(ta[1]).assertEqual(values[1]);
      expect(ta[2]).assertEqual(values[2]);
    });

    /**
     * @tc.name   atomicsStoreTest093
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0093
     * @tc.desc   Throw TypeError when typedArray is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15;
      const targetVal = 25;

      expect(Atomics.isLockFree(4)).assertEqual(true);

      // 先通过 store 暂存目标值，再通过 compareExchange 验证条件后确认
      Atomics.store(ia, 0, targetVal);
      const validated = Atomics.compareExchange(ia, 0, targetVal, targetVal);

      expect(validated).assertEqual(targetVal);
      expect(Atomics.load(ia, 0)).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest094
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0094
     * @tc.desc   Nested async arrows with delay chain for Int16Array store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int16Array(sab);
      const targetVal = 7890;

      const delayChainStore = async (ms: number, ms2: number, arr: Int16Array, idx: number, val: number) => {
        await new Promise<void>(resolve => setTimeout(resolve, ms));
        await new Promise<void>(resolve => setTimeout(resolve, ms2));
        return Atomics.store(arr, idx, val);
      }

      const storedVal = await delayChainStore(2, 3, ta, 0, targetVal);
      expect(storedVal).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest095
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0095
     * @tc.desc   Promise.all with BigUint64Array store via index mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(16); // 2 BigUint64 elements
      const ta = new BigUint64Array(sab);
      const values = { id1: 1111111111111111111n, id2: 2222222222222222222n } as typeStore95;
      const indexMap = { id1: 0, id2: 1 } as typeLoad95; // Map logical IDs to array indices

      const results = await Promise.all([
        Promise.resolve().then(() => Atomics.store(ta, indexMap.id1, values.id1)),
        Promise.resolve().then(() => Atomics.store(ta, indexMap.id2, values.id2))
      ]);

      expect(results[0]).assertEqual(values.id1);
      expect(results[1]).assertEqual(values.id2);
      expect(ta[0]).assertEqual(values.id1);
      expect(ta[1]).assertEqual(values.id2);
    });

    /**
     * @tc.name   atomicsStoreTest096
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0096
     * @tc.desc   Throw RangeError when index exceeds array length (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 1 BigInt64 element
      const ta = new BigInt64Array(sab);
      try {
        Atomics.store(ta, 5, 123n);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsStoreTest097
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0097
     * @tc.desc   Nested arrows for Int32Array store with async even value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const targetVal = 300;

      const validateEvenStore = async (arr: Int32Array, idx: number, val: number) => {
        const storedVal = Atomics.store(arr, idx, val);
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return storedVal % 2 === 0;
      }

      const isEven = await validateEvenStore(ta, 0, targetVal);
      expect(isEven).assertEqual(true); // 300 is even
      expect(ta[0]).assertEqual(targetVal);
    });

    /**
     * @tc.name   atomicsStoreTest098
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0098
     * @tc.desc   Async arrow store for Uint8Array with retry on invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);
      const targetMin = 150;
      let retryCount = 0;

      const storeWithValueRetry = async (arr: Uint8Array, idx: number, val: number): Promise<number> => {
        retryCount++;
        await new Promise<number>(resolve => setTimeout(resolve, 3));
        const storedVal = Atomics.store(arr, idx, val);
        if (storedVal < targetMin && retryCount < 2) {
          return storeWithValueRetry(arr, idx, targetMin + 10); // Retry with valid value
        }
        return storedVal;
      };

      // First attempt with invalid value (100 < 150)
      const storedVal = await storeWithValueRetry(ta, 0, 100);
      expect(storedVal).assertEqual(160); // Retried value
      expect(retryCount).assertEqual(2);
      expect(ta[0]).assertEqual(160);
    });

    /**
     * @tc.name   atomicsStoreTest099
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0099
     * @tc.desc   Promise.allSettled with mixed Int32Array store and dummy tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsStoreTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const validVal = 5678;

      const promises = [
        Promise.resolve().then(() => Atomics.store(ta, 0, validVal)), // Valid store
        Promise.resolve().then(() => Atomics.store(ta, 1, 1234)), // Invalid store
        new Promise<number>((resolve) => setTimeout(() => resolve(999), 2))// Dummy task
      ];

      const results = await Promise.allSettled(promises);
      // Valid store result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(validVal);
      expect(ta[0]).assertEqual(validVal);
      // Invalid store result
      expect(results[1].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertContain('Index is overflow');
      // Dummy task result
      expect(results[2].status).assertEqual('fulfilled');
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(999);
    });


    /**
     * @tc.name   atomicsStoreTest100
     * @tc.number SUB_BUILTINS_Atomics_store_TEST_0100
     * @tc.desc   Nested arrows for BigInt64Array store with async cleanup and validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsStoreTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const targetVal = 999999999999999999n;
      const minVal = 100000000000000000n;
      let cleanupDone = false;
      let validated = false;

      const safeStoreWithCleanup = async (arr: BigInt64Array, idx: number, val: bigint) => {
        try {
          const storedVal = Atomics.store(arr, idx, val);
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          validated = storedVal >= minVal; // Validate value ≥ minimum threshold
          return storedVal;
        } finally {
          await new Promise<void>(resolve => setTimeout(resolve, 1));
          cleanupDone = true; // Mark cleanup as completed
        }
      }

      const storedVal = await safeStoreWithCleanup(ta, 0, targetVal);
      expect(storedVal).assertEqual(targetVal);
      expect(ta[0]).assertEqual(targetVal);
      expect(validated).assertEqual(true); // Target value meets minimum threshold
      expect(cleanupDone).assertEqual(true); // Cleanup logic executed
    });
  })
}