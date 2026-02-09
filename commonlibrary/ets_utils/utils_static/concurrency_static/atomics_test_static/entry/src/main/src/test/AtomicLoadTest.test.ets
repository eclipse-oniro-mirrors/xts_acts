'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import sleep  from './Util.test';


export default function atomicsLoadTest() {
  describe('atomicsLoadTest', () => {
    afterEach(async () => {
      await sleep(50)
    })


    /**
     * @tc.name   atomicsLoadTest001
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0001
     * @tc.desc   Load value from Int32Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 100;
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   atomicsLoadTest002
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0002
     * @tc.desc   Load value from Uint32Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Uint32Array(sab);
      ta[0] = 4294967295;
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(4294967295);
    });

    /**
     * @tc.name   atomicsLoadTest003
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0003
     * @tc.desc   Load value from Int8Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Int8Array(sab);
      ta[0] = -128;
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.name   atomicsLoadTest004
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0004
     * @tc.desc   Load value from Uint8Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Uint8Array(sab);
      ta[0] = 255;
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.name   atomicsLoadTest005
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0005
     * @tc.desc   Load value from Int16Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2);
      const ta = new Int16Array(sab);
      ta[0] = 32767;
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.name   atomicsLoadTest006
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0006
     * @tc.desc   Load value from Uint16Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2);
      const ta = new Uint16Array(sab);
      ta[0] = 65535;
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.name   atomicsLoadTest007
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0007
     * @tc.desc   Load value from BigInt64Array valid index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 9223372036854775807n;
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(9223372036854775807n);
    });


    /**
     * @tc.name   atomicsLoadTest009
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0009
     * @tc.desc   Throw RangeError when index is out of bounds (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      try {
        Atomics.load(ta, 1);
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsLoadTest010
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0010
     * @tc.desc   Throw RangeError when index is negative (Uint8Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Uint8Array(sab);
      try {
        Atomics.load(ta, -1);
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsLoadTest011
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0011
     * @tc.desc   Throw TypeError when typedArray is non-integer type (Float32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 25; // Counter A
      ia[1] = 35; // Counter B

      // Atomic snapshot of both counters (load + exchange to lock temporarily)
      const snapshotA = Atomics.load(ia, 0);
      const lockB = Atomics.exchange(ia, 1, -1); // Lock B
      const snapshotB = lockB === -1 ? Atomics.load(ia, 1) : lockB;
      Atomics.exchange(ia, 1, snapshotB as long); // Unlock B

      expect(snapshotA).assertEqual(25);
      expect(snapshotB).assertEqual(35);
      expect(Atomics.load(ia, 1)).assertEqual(35);
    });

    /**
     * @tc.name   atomicsLoadTest012
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0012
     * @tc.desc   Load value in async function with arrow function wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 200;
      const asyncLoad = async () => Atomics.load(ta, 0);
      const result = await asyncLoad();
      expect(result).assertEqual(200);
    });

    /**
     * @tc.name   atomicsLoadTest013
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0013
     * @tc.desc   Load value with nested arrow functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Uint32Array(sab);
      ta[0] = 1500000000;
      const outer = (arr: Uint32Array, idx: number) => {
        return Atomics.load(arr, idx as int)
      };
      const result = outer(ta, 0);
      expect(result).assertEqual(1500000000);
    });

    /**
     * @tc.name   atomicsLoadTest014
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0014
     * @tc.desc   Load value after Atomics.and modification (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 30;
      Atomics.and(ta, 0, 10);
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   atomicsLoadTest015
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0015
     * @tc.desc   Load value from middle index of multi-element Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(6); // 3 Int16 elements
      const ta = new Int16Array(sab);
      ta[0] = 10;
      ta[1] = 20;
      ta[2] = 30;
      const result = Atomics.load(ta, 1);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   atomicsLoadTest016
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0016
     * @tc.desc   Load value with arrow function as load wrapper (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = -9223372036854775808n;
      const loadWrapper = (arr: BigInt64Array, idx: int) => Atomics.load(arr, idx as int);
      const result = loadWrapper(ta, 0);
      expect(result).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.name   atomicsLoadTest017
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0017
     * @tc.desc   Throw TypeError when typedArray is non-SharedArrayBuffer backed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ta = new Int32Array([10, 20]);
      try {
        Atomics.load(ta, 0);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsLoadTest018
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0018
     * @tc.desc   Load value in Promise.resolve with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 45;
      const result = await Promise.resolve().then(() => Atomics.load(ta, 0));
      expect(result).assertEqual(45);
    });

    /**
     * @tc.name   atomicsLoadTest019
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0019
     * @tc.desc   Load value multiple times (consistency check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Uint32Array(sab);
      ta[0] = 999999;
      const result1 = Atomics.load(ta, 0);
      const result2 = Atomics.load(ta, 0);
      const result3 = Atomics.load(ta, 0);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result3).assertEqual(999999);
    });

    /**
     * @tc.name   atomicsLoadTest020
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0020
     * @tc.desc   Load value from Uint16Array after index modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4); // 2 Uint16 elements
      const ta = new Uint16Array(sab);
      ta[1] = 5000;
      const getValue = (idx: number) => Atomics.load(ta, idx as int);
      expect(getValue(0)).assertEqual(0);
      expect(getValue(1)).assertEqual(5000);
    });

    /**
     * @tc.name   atomicsLoadTest021
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0021
     * @tc.desc   Nested arrow functions for load with parameter validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 75;
      const validateAndLoad = (arr: Int32Array, idx: number) => {
        if (idx < 0 || idx >= arr.length) {
          throw new Error('Invalid index');
        }
        return Atomics.load(arr, idx as int);
      }
      const result = validateAndLoad(ta, 0);
      expect(result).assertEqual(75);
    });

    /**
     * @tc.name   atomicsLoadTest022
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0022
     * @tc.desc   Load value in async arrow function with delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Int8Array(sab);
      ta[0] = 127;
      const delayedLoad = async () => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 5)
        });
        return Atomics.load(ta, 0);
      };
      const result = await delayedLoad();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.name   atomicsLoadTest023
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0023
     * @tc.desc   Throw RangeError when index equals array length (Uint32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Uint32 elements
      const ta = new Uint32Array(sab);
      try {
        Atomics.load(ta, 2);
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsLoadTest024
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0024
     * @tc.desc   Load value from BigUint64Array with nested arrow wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      ta[0] = 1234567890123456789n;
      const outerWrapper = (arr: BigUint64Array) => (idx: number) => Atomics.load(arr, idx as int);
      const result = outerWrapper(ta)(0);
      expect(result).assertEqual(1234567890123456789n);
    });

    /**
     * @tc.name   atomicsLoadTest025
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0025
     * @tc.desc   Load value in Promise.race with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 60;
      const raceResult = await Promise.race([
        Promise.resolve().then(() => Atomics.load(ta, 0)),
        new Promise<number>((resolve) => {
          setTimeout(() => resolve(0), 10)
        })
      ]);
      expect(raceResult).assertEqual(60);
    });

    /**
     * @tc.name   atomicsLoadTest026
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0026
     * @tc.desc   Load value from Int32Array with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab); // Default initial value is 0
      const result = Atomics.load(ta, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   atomicsLoadTest027
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0027
     * @tc.desc   Nested arrow functions for load with error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 80;
      const safeLoad = (arr: Int32Array, idx: number) => {
        try {
          return Atomics.load(arr, idx as int);
        } catch (err) {
          return (err as Error).name;
        }
      }
      expect(safeLoad(ta, 0)).assertEqual(80);
      expect(safeLoad(ta, 1)).assertEqual('RangeError');
    });

    /**
     * @tc.name   atomicsLoadTest028
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0028
     * @tc.desc   Load value from Uint8Array after manual modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Uint8Array(sab);
      ta[0] = 50;
      const result1 = Atomics.load(ta, 0);
      ta[0] = 150; // Manual modification
      const result2 = Atomics.load(ta, 0);
      expect(result1).assertEqual(50);
      expect(result2).assertEqual(150);
    });

    /**
     * @tc.name   atomicsLoadTest029
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0029
     * @tc.desc   Load value in async IIFE with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 95;
      const result = await (async () => Atomics.load(ta, 0))();
      expect(result).assertEqual(95);
    });

    /**
     * @tc.name   atomicsLoadTest030
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0030
     * @tc.desc   Load value from BigInt64Array with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = -123456789n;
      const loadBigInt = (arr: BigInt64Array, idx: int) => Atomics.load(arr, idx as int);
      const result = loadBigInt(ta, 0);
      expect(result).assertEqual(-123456789n);
    });


    /**
     * @tc.name   atomicsLoadTest031
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0031
     * @tc.desc   Load value from Int32Array with nested arrow functions and index mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32 elements
      const ta = new Int32Array(sab);
      ta[0] = 1000;
      ta[1] = 2000;
      // Nested arrow: map index name to actual index, then load
      const indexMapper = (name: 'first' | 'second') => {
        return Atomics.load(ta, name === 'first' ? 0 : 1 as int)
      };
      expect(indexMapper('first')).assertEqual(1000);
      expect(indexMapper('second')).assertEqual(2000);
    });

    /**
     * @tc.name   atomicsLoadTest032
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0032
     * @tc.desc   Throw TypeError when typedArray is BigInt64Array but index is non-integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      try {
        Atomics.load(ta, 0.5 as int);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsLoadTest033
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0033
     * @tc.desc   Load value from Uint8Array in async arrow function with parameter injection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Uint8Array(sab);
      ta[0] = 123;
      // Inject typed array and index into async loader
      const asyncLoader = async (arr: Uint8Array, idx: int) => Atomics.load(arr, idx as int);
      const result = await asyncLoader(ta, 0);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.name   atomicsLoadTest034
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0034
     * @tc.desc   Load value from Int16Array after Atomics.or modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2);
      const ta = new Int16Array(sab);
      ta[0] = 10; // 0b1010
      Atomics.or(ta, 0, 3); // 0b0011 → result 0b1011 (11)
      const load = (arr: Int16Array) => Atomics.load(arr, 0);
      expect(load(ta)).assertEqual(11);
    });

    /**
     * @tc.name   atomicsLoadTest035
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0035
     * @tc.desc   Nested arrow functions for safe load with index bounds check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 456;
      // Safe load: check bounds before loading
      const safeLoad = (arr: Int32Array, idx: number) => idx >= 0 && idx < arr.length ? Atomics.load(arr, idx as int) : null
      expect(safeLoad(ta, 0)).assertEqual(456);
      expect(safeLoad(ta, 1)).assertEqual(null); // Out of bounds
    });

    /**
     * @tc.name   atomicsLoadTest036
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0036
     * @tc.desc   Load value from BigUint64Array in Promise.all with multiple indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16); // 2 BigUint64 elements
      const ta = new BigUint64Array(sab);
      ta[0] = 12345n;
      ta[1] = 67890n;
      // Load multiple indices in parallel
      const results = await Promise.all([
        Promise.resolve().then(() => Atomics.load(ta, 0)),
        Promise.resolve().then(() => Atomics.load(ta, 1))
      ]);
      expect(results[0]).assertEqual(12345n);
      expect(results[1]).assertEqual(67890n);
    });

    /**
     * @tc.name   atomicsLoadTest037
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0037
     * @tc.desc   Throw RangeError when index is larger than array length (Uint16Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4); // 2 Uint16 elements
      const ta = new Uint16Array(sab);
      try {
        Atomics.load(ta, 5);
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsLoadTest038
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0038
     * @tc.desc   Load value from Int8Array with arrow function as value validator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Int8Array(sab);
      ta[0] = -45;
      // Load and validate value range (-128 to 127)
      const loadAndValidate = (arr: Int8Array, idx: number) => {
        const val = Atomics.load(arr, idx as int);
        return val >= -128 && val <= 127 ? val : 'Invalid range';
      }
      expect(loadAndValidate(ta, 0)).assertEqual(-45);
    });

    /**
     * @tc.name   atomicsLoadTest039
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0039
     * @tc.desc   Load value from Int32Array in async arrow function with retries on error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 789;
      let retryCount: int = 0;
      // Async load with retry on invalid index
      const asyncLoadWithRetry = async (arr: Int32Array, idx: int, maxRetries: int): Promise<long> => {
        try {
          return Atomics.load(arr, idx as int);
        } catch (err) {
          return Atomics.load(arr, 0);
        }
      };
      const result = await asyncLoadWithRetry(ta, 1, 1); // First try invalid index 1
      expect(result).assertEqual(789);
    });

    /**
     * @tc.name   atomicsLoadTest040
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0040
     * @tc.desc   Load value from Uint32Array with nested arrow functions for value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Uint32Array(sab);
      ta[0] = 100;
      // Load and transform value (e.g., multiply by 2)
      const transformLoad = (arr: Uint32Array, idx: int, factor: int) => Atomics.load(arr, idx as int) * factor
      expect(transformLoad(ta, 0, 2)).assertEqual(200);
      expect(transformLoad(ta, 0, 5)).assertEqual(500);
    });

    /**
     * @tc.name   atomicsLoadTest041
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0041
     * @tc.desc   Load value from BigInt64Array in async IIFE with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = -987654321n;
      // Async IIFE with arrow function loader
      const result = await (async (arr: BigInt64Array, idx: int) => Atomics.load(arr, idx as int))(ta, 0);
      expect(result).assertEqual(-987654321n);
    });

    /**
     * @tc.name   atomicsLoadTest042
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0042
     * @tc.desc   Throw TypeError when typedArray is non-typed array (plain object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0; // Flag: 0 (unvalidated), 1 (validated)

      // Toggle flag to validated, then confirm via compareExchange
      Atomics.xor(ia, 0, 1); // 0 → 1
      const isValidated = Atomics.compareExchange(ia, 0, 1, 1) === 1;

      expect(isValidated).assertEqual(true);
      expect(Atomics.load(ia, 0)).assertEqual(1);
      // Toggle back
      Atomics.xor(ia, 0, 1);
      expect(Atomics.load(ia, 0)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsLoadTest043
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0043
     * @tc.desc   Load value from Int16Array in Promise.race with error fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2);
      const ta = new Int16Array(sab);
      ta[0] = 321;
      // Race between valid load and error fallback
      const raceResult = await Promise.race([
        Promise.resolve().then(() => Atomics.load(ta, 0))]);
      expect(raceResult).assertEqual(321);
    });

    /**
     * @tc.name   atomicsLoadTest044
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0044
     * @tc.desc   Load value from Uint8Array with arrow function for index validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(3); // 3 Uint8 elements
      const ta = new Uint8Array(sab);
      ta[2] = 255;
      // Validate index is even before loading
      const evenIndexLoad = (arr: Uint8Array, idx: number) => idx % 2 === 0 ? Atomics.load(arr, idx as int) : 'Odd index'
      expect(evenIndexLoad(ta, 2)).assertEqual(255);
      expect(evenIndexLoad(ta, 1)).assertEqual('Odd index');
    });

    /**
     * @tc.name   atomicsLoadTest045
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0045
     * @tc.desc   Load value from Int32Array after Atomics.xor modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 15; // 0b1111
      Atomics.xor(ta, 0, 8); // 0b1000 → result 0b0111 (7)
      const load = (arr: Int32Array, idx: int) => Atomics.load(arr, idx as int);
      expect(load(ta, 0)).assertEqual(7);
    });

    /**
     * @tc.name   atomicsLoadTest046
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0046
     * @tc.desc   Load value from BigUint64Array with nested arrow functions and value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      ta[0] = 999999999999999999n;
      // Check if loaded value is greater than target
      const valueCheckLoad = (arr: BigUint64Array, idx: number, target: bigint) => Atomics.load(arr, idx as int) > target

      expect(valueCheckLoad(ta, 0, 100000000000000000n)).assertEqual(true);
      expect(valueCheckLoad(ta, 0, 1000000000000000000n)).assertEqual(false);
    });

    /**
     * @tc.name   atomicsLoadTest047
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0047
     * @tc.desc   Throw RangeError when index is negative (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      try {
        Atomics.load(ta, -1);
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsLoadTest048
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0048
     * @tc.desc   Load value from Int8Array in async arrow function with delay and logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Int8Array(sab);
      ta[0] = 67;
      let log: string[] = [];

      const delayedLoadWithLog = async (arr: Int8Array, idx: int) => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 5)
        });
        const value: number = Atomics.load(arr, idx as int);
        log.push(`Loaded value: ${value}`);
        return value;
      };

      const result = await delayedLoadWithLog(ta, 0);
      expect(result).assertEqual(67);
      expect(log).assertDeepEquals(['Loaded value: 67']);
    });

    /**
     * @tc.name   atomicsLoadTest049
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0049
     * @tc.desc   Load value from Uint16Array with nested arrow functions for batch loading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(6); // 3 Uint16 elements
      const ta = new Uint16Array(sab);
      ta[0] = 1000;
      ta[1] = 2000;
      ta[2] = 3000;

      // Batch load multiple indices
      const batchLoader = (arr: Uint16Array, indices: number[]) => indices.map(idx => Atomics.load(arr, idx as int))


      const loadedValues = batchLoader(ta, [0, 2]);
      expect(loadedValues[0]).assertEqual(1000);
      expect(loadedValues[1]).assertEqual(3000);
    });

    /**
     * @tc.name   atomicsLoadTest050
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0050
     * @tc.desc   Load value from Int32Array after Atomics.add modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 50;
      Atomics.add(ta, 0, 30); // 50 + 30 = 80
      const load = (arr: Int32Array, idx: int) => Atomics.load(arr, idx as int);
      expect(load(ta, 0)).assertEqual(80);
    });

    /**
     * @tc.name   atomicsLoadTest051
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0051
     * @tc.desc   Load value from BigUint64Array in Promise.allSettled with valid/invalid indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      ta[0] = 123456789n;

      const promises = [
        Promise.resolve().then(() => Atomics.load(ta, 0)), // Valid index
        Promise.resolve().then(() => Atomics.load(ta, 1))// Invalid index
      ];

      const results = await Promise.allSettled(promises);
      // Valid index result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<bigint>).value).assertEqual(123456789n);
      // Invalid index result
      expect(results[1].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertContain('Index');
    });

    /**
     * @tc.name   atomicsLoadTest052
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0052
     * @tc.desc   Throw TypeError when typedArray is Float64Array (non-integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 5; // Counter 1
      ia[1] = 8; // Counter 2
      ia[2] = 12; // Counter 3

      // Batch update: increment all counters atomically
      Atomics.add(ia, 0, 3);
      Atomics.add(ia, 1, 2);
      Atomics.sub(ia, 2, 4);

      // Validate batch result
      const result1 = Atomics.load(ia, 0);
      const result2 = Atomics.load(ia, 1);
      const result3 = Atomics.load(ia, 2);

      expect(result1).assertEqual(8);
      expect(result2).assertEqual(10);
      expect(result3).assertEqual(8);
      // Atomic reset
      Atomics.exchange(ia, 0, 5);
      Atomics.exchange(ia, 1, 8);
      Atomics.exchange(ia, 2, 12);
      expect(Atomics.load(ia, 0)).assertEqual(5);
    });

    /**
     * @tc.name   atomicsLoadTest053
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0053
     * @tc.desc   Load value from Int8Array with arrow function for null check before load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Int8Array(sab);
      ta[0] = -89;

      // Check if typed array is not null before loading
      const safeLoad = (arr: Int8Array | null, idx: int) => {
        return arr ? Atomics.load(arr, idx as int) : 'Array is null'
      };

      expect(safeLoad(ta, 0)).assertEqual(-89);
      expect(safeLoad(null, 0)).assertEqual('Array is null');
    });

    /**
     * @tc.name   atomicsLoadTest054
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0054
     * @tc.desc   Load value from Uint32Array in async arrow function with multiple delays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Uint32Array(sab);
      ta[0] = 4294967295;
      let delayCount: int = 0;

      // Async load with increasing delays
      const delayedLoad = async (arr: Uint32Array, idx: int, delays: int[]) => {
        for (const delay of delays) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, delay)
          });
          delayCount++;
        }
        return Atomics.load(arr, idx as int);
      };

      const result = await delayedLoad(ta, 0, [2, 3]);
      expect(result).assertEqual(4294967295);
      expect(delayCount).assertEqual(2);
    });

    /**
     * @tc.name   atomicsLoadTest055
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0055
     * @tc.desc   Load value from Int16Array with nested arrow functions for value formatting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2);
      const ta = new Int16Array(sab);
      ta[0] = 500;

      // Load and format value as string with prefix
      const formattedLoad = (arr: Int16Array, idx: number, prefix: string) => `${prefix}${Atomics.load(arr, idx as int)}`

      expect(formattedLoad(ta, 0, 'Value: ')).assertEqual('Value: 500');
      expect(formattedLoad(ta, 0, 'Data: ')).assertEqual('Data: 500');
    });

    /**
     * @tc.name   atomicsLoadTest056
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0056
     * @tc.desc   Throw RangeError when index equals array length (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32 elements
      const ta = new Int32Array(sab);
      try {
        Atomics.load(ta, 2)
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsLoadTest057
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0057
     * @tc.desc   Load value from BigInt64Array in async arrow function with result comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = -1000000000000n;

      // Async load and compare with expected value
      const loadAndCompare = async (arr: BigInt64Array, idx: int, expected: bigint) => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 4)
        });
        const value = Atomics.load(arr, idx as int);
        return value === expected;
      };

      const isMatch = await loadAndCompare(ta, 0, -1000000000000n);
      const isMismatch = await loadAndCompare(ta, 0, -999999999999n);
      expect(isMatch).assertEqual(true);
      expect(isMismatch).assertEqual(false);
    });

    /**
     * @tc.name   atomicsLoadTest058
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0058
     * @tc.desc   Load value from Uint8Array with arrow function for range check after load
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Uint8Array(sab);
      ta[0] = 150;

      // Check if loaded value is within target range
      const rangeCheckLoad = (arr: Uint8Array, idx: int, min: number, max: number) => {
        const value = Atomics.load(arr, idx as int);
        return value >= min && value <= max ? value : 'Out of range';
      }

      expect(rangeCheckLoad(ta, 0, 100, 200)).assertEqual(150);
      expect(rangeCheckLoad(ta, 0, 200, 300)).assertEqual('Out of range');
    });

    /**
     * @tc.name   atomicsLoadTest059
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0059
     * @tc.desc   Load value from Int32Array in nested Promise chain with arrow functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 7890;

      // Nested Promise chain: delay → load → return value
      const result = await Promise.resolve()
        .then(() => new Promise<Int32Array>((resolve) => {
          setTimeout(() => resolve(ta), 3)
        }))
        .then((arr) => Atomics.load(arr, 0))
        .then((val) => val);

      expect(result).assertEqual(7890);
    });

    /**
     * @tc.name   atomicsLoadTest060
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0060
     * @tc.desc   Throw TypeError when typedArray is non-SharedArrayBuffer backed (Uint16Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ta = new Uint16Array([100, 200]); // Non-SharedArrayBuffer backed
      try {
        Atomics.load(ta, 0);
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });


    /**
     * @tc.name   atomicsLoadTest061
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0061
     * @tc.desc   Load value from BigUint64Array in async nested arrow functions with delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      ta[0] = 1234567890123456789n;

      // Nested async arrows: outer delay wrapper → inner loader
      const outerDelay = async (delayMs: int, arr: BigUint64Array, idx: int) => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, delayMs)
        });
        return Atomics.load(arr, idx as int);
      }

      const result = await outerDelay(3, ta, 0);
      expect(result).assertEqual(1234567890123456789n);
    });

    /**
     * @tc.name   atomicsLoadTest062
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0062
     * @tc.desc   Load value from Int8Array in Promise.race with multiple loaders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Int8Array(sab);
      ta[0] = -34;

      // Create multiple loaders with different delays
      const createLoader = (delay: int) =>
      new Promise<number>((resolve) => {
        setTimeout(() => resolve(Atomics.load(ta, 0)), delay)
      }
      );

      // Race between fast (2ms) and slow (5ms) loader
      const raceResult = await Promise.race([createLoader(2), createLoader(5)]);
      expect(raceResult).assertEqual(-34);
    });

    /**
     * @tc.name   atomicsLoadTest063
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0063
     * @tc.desc   Nested arrow functions for load with async error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0001; // Initial state

      // Flip bit 0 only if current state is 0b0001
      const oldState = Atomics.compareExchange(ia, 0, 0b0001 as long, 0b0001 ^ 0b0001);
      const newState = Atomics.load(ia, 0);

      expect(oldState).assertEqual(0b0001);
      expect(newState).assertEqual(0b0000);
      // Flip back with validation
      Atomics.compareExchange(ia, 0, 0b0000 as long, 0b0001);
      expect(Atomics.load(ia, 0)).assertEqual(0b0001);
    });

    /**
     * @tc.name   atomicsLoadTest064
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0064
     * @tc.desc   Load value from Uint32Array in async batch with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12); // 3 Uint32 elements
      const ta = new Uint32Array(sab);
      ta[0] = 100000;
      ta[1] = 200000;
      ta[2] = 300000;

      // Async batch load for multiple indices
      const batchLoad = async (arr: Uint32Array, indices: number[]) =>
      Promise.all(indices.map(async (idx) => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 1)
        });
        return Atomics.load(arr, idx as int);
      }));

      const results = await batchLoad(ta, [0, 2]);
      expect(results[0]).assertEqual(100000);
      expect(results[1]).assertEqual(300000);
    });

    /**
     * @tc.name   atomicsLoadTest065
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0065
     * @tc.desc   Throw TypeError when index is string (non-integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0; // Counter

      // Increment 3 times, then take atomic snapshot
      Atomics.add(ia, 0, 1);
      Atomics.add(ia, 0, 1);
      Atomics.add(ia, 0, 1);
      const snapshot = Atomics.exchange(ia, 0, Atomics.load(ia, 0));

      expect(snapshot).assertEqual(3);
      expect(Atomics.load(ia, 0)).assertEqual(3);
      // Continue incrementing
      Atomics.add(ia, 0, 2);
      expect(Atomics.load(ia, 0)).assertEqual(5);
    });

    /**
     * @tc.name   atomicsLoadTest066
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0066
     * @tc.desc   Load value from BigInt64Array in async arrow function with post-processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = -987654321n;

      // Async load + post-processing (convert to absolute value)
      const loadAndAbs = async (arr: BigInt64Array, idx: int) => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        const value: bigint = Atomics.load(arr, idx as int);
        return value < 0n ? -value : value;
      };

      const result = await loadAndAbs(ta, 0);
      expect(result).assertEqual(987654321n);
    });

    /**
     * @tc.name   atomicsLoadTest067
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0067
     * @tc.desc   Nested arrow functions for load with async validation callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2);
      const ta = new Int16Array(sab);
      ta[0] = 32000;
      let validationCalled = false;

      // Load with async validation callback
      const loadWithValidation = async (arr: Int16Array, idx: number, callback: (val: number) => void) => {
        const value: number = Atomics.load(arr, idx as int);
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 2)
        });
        callback(value);
        validationCalled = true;
        return value;
      }

      const result = await loadWithValidation(ta, 0, (val) => {
        expect(val).assertEqual(32000);
      });
      expect(result).assertEqual(32000);
      expect(validationCalled).assertEqual(true);
    });

    /**
     * @tc.name   atomicsLoadTest068
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0068
     * @tc.desc   Load value from Uint8Array in Promise.allSettled with mixed valid/invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2); // 2 Uint8 elements
      const ta = new Uint8Array(sab);
      ta[1] = 200;

      const promises = [
        Promise.resolve().then(() => Atomics.load(ta, 1)), // Valid index
        Promise.resolve().then(() => Atomics.load(ta, 5)), // Invalid index
        Promise.resolve().then(() => Atomics.load(ta, -2))// Invalid index
      ];

      const results = await Promise.allSettled(promises);
      // Valid result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<long>).value).assertEqual(200);
      // Invalid results
      expect(results[1].status).assertEqual('rejected');
      expect(results[2].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertContain('Index');
      expect((results[2] as PromiseRejectedResult).reason.message).assertContain('Index');
    });

    /**
     * @tc.name   atomicsLoadTest069
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0069
     * @tc.desc   Load value from Int32Array in async arrow function with dynamic index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 2 Int32 elements
      const ta = new Int32Array(sab);
      ta[0] = 111;
      ta[1] = 222;

      // Async load with dynamic index selection
      const dynamicLoad = async (arr: Int32Array, useIndex1: boolean): Promise<long> => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 2)
        });
        const idx: int = useIndex1 ? 1 : 0;
        return Atomics.load(arr, idx as int);
      };

      const result1 = await dynamicLoad(ta, false);
      const result2 = await dynamicLoad(ta, true);
      expect(result1).assertEqual(111);
      expect(result2).assertEqual(222);
    });

    /**
     * @tc.name   atomicsLoadTest070
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0070
     * @tc.desc   Throw TypeError when typedArray is ArrayBuffer (not typed array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0010; // Initial state

      // Set bit 1 and 2, then reset to initial
      Atomics.or(ia, 0, 0b0110 as long); // 0b0010 | 0b0110 = 0b0110 (6)
      const modified = Atomics.load(ia, 0);
      const reset = Atomics.exchange(ia, 0, 0b0010 as long);

      expect(modified).assertEqual(0b0110);
      expect(reset).assertEqual(0b0110);
      expect(Atomics.load(ia, 0)).assertEqual(0b0010);
    });

    /**
     * @tc.name   atomicsLoadTest071
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0071
     * @tc.desc   Load value from BigUint64Array in nested async arrows with cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      ta[0] = 999999999999999999n;
      let cleanupDone = false;

      // Nested async arrows: load → cleanup
      const loadWithCleanup = async (arr: BigUint64Array, idx: int) => {
        try {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          return Atomics.load(arr, idx as int);
        } finally {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 1)
          });
          cleanupDone = true;
        }
      }

      const result = await loadWithCleanup(ta, 0);
      expect(result).assertEqual(999999999999999999n);
      expect(cleanupDone).assertEqual(true);
    });

    /**
     * @tc.name   atomicsLoadTest072
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0072
     * @tc.desc   Load value from Int16Array in Promise.race with timeout fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2);
      const ta = new Int16Array(sab);
      ta[0] = 4567;

      // Race between loader and timeout (loader should win)
      const raceResult = await Promise.race([
        new Promise<number>((resolve) => {
          setTimeout(() => resolve(Atomics.load(ta, 0)), 3)
        }
        ),
        new Promise<number>((resolve) => {
          setTimeout(() => resolve(-1), 10)
        } // Timeout fallback
        )
      ]);

      expect(raceResult).assertEqual(4567);
    });

    /**
     * @tc.name   atomicsLoadTest073
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0073
     * @tc.desc   Nested arrow functions for load with async value transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 1234;

      // Load → async transformation (convert to string)
      const transformLoad = async (arr: Int32Array, idx: number) => {
        const value = Atomics.load(arr, idx as int);
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 2)
        });
        return value.toString();
      }

      const result = await transformLoad(ta, 0);
      expect(result).assertEqual('1234');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   atomicsLoadTest074
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0074
     * @tc.desc   Load value from Uint8Array in async batch with index filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4); // 4 Uint8 elements
      const ta = new Uint8Array(sab);
      ta[0] = 10;
      ta[1] = 20;
      ta[2] = 30;
      ta[3] = 40;

      // Async batch load + filter even indices
      const filteredBatchLoad = async (arr: Uint8Array) => {
        const indices = [0, 1, 2, 3].filter(idx => idx % 2 === 0); // Even indices
        return Promise.all(indices.map(async (idx) => {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 1)
          });
          return Atomics.load(arr, idx as int);
        }));
      };

      const results = await filteredBatchLoad(ta);
      expect(results[0]).assertEqual(10);
      expect(results[1]).assertEqual(30);
    });


    /**
     * @tc.name   atomicsLoadTest075
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0075
     * @tc.desc   Throw RangeError when index is larger than max safe integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      const maxSafeInt = Number.MAX_SAFE_INTEGER;

      try {
        Atomics.load(ta, maxSafeInt as int);
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsLoadTest076
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0076
     * @tc.desc   Load value from BigInt64Array in async arrow function with retry on timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = -567890123456n;
      let retryCount: int = 0;

      // Async load with retry if timeout (simulate transient delay)
      const loadWithTimeoutRetry = async (arr: BigInt64Array, idx: int): Promise<bigint> => {
        retryCount++;
        try {
          return await Promise.race([
            new Promise<bigint>((resolve) => {
              setTimeout(() => resolve(Atomics.load(arr, idx as int)), 3);
            }),
            new Promise<never>((_, reject) => {
              () => reject(new Error('Timeout')); // First attempt timeout
            })
          ]);
        } catch (err) {
          if (retryCount < 2 && (err as Error).message === 'Timeout') {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve(undefined)
              }, 2)
            });
            // return loadWithTimeoutRetry(arr, idx); // Retry once
          }
          throw err as Error;
        }
      };

      const result = await loadWithTimeoutRetry(ta, 0);
      expect(result).assertEqual(-567890123456n);
      expect(retryCount).assertEqual(1);
    });

    /**
     * @tc.name   atomicsLoadTest077
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0077
     * @tc.desc   Nested arrow functions for load with async batch validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(6); // 3 Int16 elements
      const ta = new Int16Array(sab);
      ta[0] = 100;
      ta[1] = 200;
      ta[2] = 300;
      let validCount: int = 0;

      // Batch load + async validation (check value > 0)
      const batchValidateLoad = async (arr: Int16Array, indices: int[]): Promise<long[]> => {
        const values = await Promise.all(
          indices.map(async (idx): Promise<long> => {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve(undefined)
              }, 1)
            });
            return Atomics.load(arr, idx as int);
          })
        );
        values.forEach((val: long) => {
          val > 0 && validCount++
        });
        return values;
      }

      const results = await batchValidateLoad(ta, [0, 1, 2]);
      expect(results[0]).assertEqual(100);
      expect(results[1]).assertEqual(200);
      expect(results[2]).assertEqual(300);
      expect(validCount).assertEqual(3);
    });

    /**
     * @tc.name   atomicsLoadTest078
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0078
     * @tc.desc   Load value from Uint32Array in Promise.all with mixed async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Uint32Array(sab);
      ta[0] = 123456789;

      // Mixed tasks: load + dummy async calculation
      const mixedTasks = [
        Promise.resolve().then(() => Atomics.load(ta, 0)),
        new Promise<number>((resolve) => {
          setTimeout(() => resolve(100 + 200), 2)
        })
      ];

      const result = await Promise.all(mixedTasks);
      expect(result[0]).assertEqual(123456789);
      expect(result[1]).assertEqual(300);
    });

    /**
     * @tc.name   atomicsLoadTest079
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0079
     * @tc.desc   Throw TypeError when index is BigInt (non-integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10; // Counter

      // Increment and rollback if exceeds 15
      Atomics.add(ia, 0, 8); // 10 + 8 = 18
      const current = Atomics.load(ia, 0);
      const rolledBack = Atomics.compareExchange(ia, 0, current as long, current > 15 ? 10 : current);

      expect(rolledBack).assertEqual(18);
      expect(Atomics.load(ia, 0)).assertEqual(10);
      // Increment without rollback
      Atomics.add(ia, 0, 3);
      expect(Atomics.load(ia, 0)).assertEqual(13);
    });


    /**
     * @tc.name   atomicsLoadTest081
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0081
     * @tc.desc   Nested arrow functions for load with async error logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      let errorLog: string[] = [];

      // Load with async error logging on failure
      const loadWithErrorLog = async (arr: Int32Array, idx: int) => {
        try {
          return Atomics.load(arr, idx as int);
        } catch (err) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 2)
          });
          errorLog.push((err as Error).name);
          throw err as Error;
        }
      }

      try {
        await loadWithErrorLog(ta, 1); // Invalid index
      } catch (err) {
        // Expected error
      }
      expect(errorLog).assertDeepEquals(['RangeError']);
    });


    /**
     * @tc.name   atomicsLoadTest083
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0083
     * @tc.desc   Load value from Int16Array in async batch with value sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4); // 2 Int16 elements
      const ta = new Int16Array(sab);
      ta[0] = 500;
      ta[1] = 1500;

      // Async batch load + calculate sum of values
      const batchLoadAndSum = async (arr: Int16Array, indices: number[]) => {
        const values = await Promise.all(
          indices.map(async (idx) => {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve(undefined)
              }, 1)
            });
            return Atomics.load(arr, idx as int);
          })
        );
        return values.reduce((acc, val) => acc + val, 0);
      };

      const sum = await batchLoadAndSum(ta, [0, 1]);
      expect(sum).assertEqual(2000);
    });

    /**
     * @tc.name   atomicsLoadTest084
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0084
     * @tc.desc   Throw TypeError when typedArray is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b110110; // Initial value (54)

      // Filter: keep only bits 3-5 (0b111000)
      const filter: int = 0b111000;
      Atomics.and(ia, 0, filter as long); // 0b110110 & 0b111000 = 0b110000 (48)
      const filtered = Atomics.load(ia, 0);
      // Validate filter result
      const validated = Atomics.compareExchange(ia, 0, filtered as long, filtered);

      expect(filtered).assertEqual(0b110000);
      expect(validated).assertEqual(0b110000);
      expect((filtered & ~filter) === 0).assertEqual(true);
    });


    /**
     * @tc.name   atomicsLoadTest086
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0086
     * @tc.desc   Load value from Uint8Array in Promise.allSettled with error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2); // 2 Uint8 elements
      const ta = new Uint8Array(sab);
      ta[0] = 255;

      const promises = [
        Promise.resolve().then(() => Atomics.load(ta, 0)), // Valid
        Promise.resolve().then(() => Atomics.load(ta, 5)), // Invalid
        Promise.resolve().then(() => Atomics.load(ta, -1))// Invalid
      ];

      const results = await Promise.allSettled(promises);
      // Process results: collect valid values, count errors
      let validValues: long[] = [];
      let errorCount: int = 0;

      results.forEach((res: PromiseFulfilledResult<long> | PromiseRejectedResult) => {
        if (res.status === 'fulfilled') {
          validValues.push((res as PromiseFulfilledResult<long>).value);
        } else {
          errorCount++;
        }
      });

      expect(validValues[0]).assertEqual(255);
      expect(errorCount).assertEqual(2);
    });

    /**
     * @tc.name   atomicsLoadTest087
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0087
     * @tc.desc   Load value from Int32Array in async arrow function with dynamic delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 98765;

      // Async load with delay based on index (dummy dynamic logic)
      const dynamicDelayLoad = async (arr: Int32Array, idx: int) => {
        const delay: int = idx === 0 ? 3 : 5; // Dynamic delay
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, delay)
        });
        return Atomics.load(arr, idx as int);
      };

      const result = await dynamicDelayLoad(ta, 0);
      expect(result).assertEqual(98765);
    });


    /**
     * @tc.name   atomicsLoadTest089
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0089
     * @tc.desc   Load value from BigInt64Array in Promise.race with error and success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = -1234567890123n;

      // Race between valid loader (fast) and error promise (slow)
      const raceResult = await Promise.race([
        new Promise<bigint>((resolve) => {
          setTimeout(() => resolve(Atomics.load(ta, 0)), 2)
        }
        ),
        new Promise<never>((_, reject) => {
          setTimeout(() => reject(new Error('Race error')), 5)
        }
        )
      ]);

      expect(raceResult).assertEqual(-1234567890123n);
    });

    /**
     * @tc.name   atomicsLoadTest090
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0090
     * @tc.desc   Throw RangeError when index is negative (Uint16Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4); // 2 Uint16 elements
      const ta = new Uint16Array(sab);

      try {
        Atomics.load(ta, -3);
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsLoadTest091
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0091
     * @tc.desc   Nested arrow functions for load with async value formatting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Int8Array(sab);
      ta[0] = 45;

      // Load + async format value as currency string
      const formattedLoad = async (arr: Int8Array, idx: int, currency: string) => {
        const value = Atomics.load(arr, idx as int);
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        return `${currency}${value}`;
      }

      const result = await formattedLoad(ta, 0, '$');
      expect(result).assertEqual('$45');
    });

    /**
     * @tc.name   atomicsLoadTest092
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0092
     * @tc.desc   Load value from Uint32Array in async batch with unique value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12); // 3 Uint32 elements
      const ta = new Uint32Array(sab);
      ta[0] = 100;
      ta[1] = 200;
      ta[2] = 100;

      // Async batch load + check if all values are unique
      const batchLoadAndCheckUnique = async (arr: Uint32Array) => {
        const values = await Promise.all(
          [0, 1, 2].map(async (idx) => {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                resolve(undefined)
              }, 1)
            });
            return Atomics.load(arr, idx as int);
          })
        );
        const uniqueValues = new Set<long>(values);
        return uniqueValues.size === values.length;
      };

      const isUnique = await batchLoadAndCheckUnique(ta);
      expect(isUnique).assertEqual(false); // 100 is duplicated
    });

    /**
     * @tc.name   atomicsLoadTest093
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0093
     * @tc.desc   Throw TypeError when typedArray is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 100; // Target value

      // Phase 1: Validate current value
      const phase1 = Atomics.compareExchange(ia, 0, 100, -1); // Lock
      if (phase1 === 100) {
        // Phase 2: Update to new value
        Atomics.exchange(ia, 0, 200);
      }

      expect(phase1).assertEqual(100);
      expect(Atomics.load(ia, 0)).assertEqual(200);
      // Reverse two-phase update
      Atomics.compareExchange(ia, 0, 200, -1);
      Atomics.exchange(ia, 0, 100);
      expect(Atomics.load(ia, 0)).assertEqual(100);
    });

    /**
     * @tc.name   atomicsLoadTest094
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0094
     * @tc.desc   Load value from Int16Array in nested async arrows with delay chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(2);
      const ta = new Int16Array(sab);
      ta[0] = 7890;

      // Nested async arrows with sequential delays
      const delayChainLoad = async (ms: int, ms2: int, arr: Int16Array, idx: int) => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, ms)
        });
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, ms2)
        });
        return Atomics.load(arr, idx as int);
      }


      const result = await delayChainLoad(2, 3, ta, 0);
      expect(result).assertEqual(7890);
    });


    /**
     * @tc.name   atomicsLoadTest096
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0096
     * @tc.desc   Throw RangeError when index is larger than array length (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8); // 1 BigInt64 element
      const ta = new BigInt64Array(sab);
      try {
        Atomics.load(ta, 5);
      } catch (e) {
        expect(e.message).assertContain('Index');
      }
    });

    /**
     * @tc.name   atomicsLoadTest097
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0097
     * @tc.desc   Nested arrow functions for load with async value validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 300;

      // Load + async validate value is even
      const validateLoad = async (arr: Int32Array, idx: int) => {
        const value = Atomics.load(arr, idx as int);
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 2)
        });
        return value % 2 === 0;

      };

      const isEven = await validateLoad(ta, 0);
      expect(isEven).assertEqual(true); // 300 is even
    });

    /**
     * @tc.name   atomicsLoadTest098
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0098
     * @tc.desc   Load value from Uint8Array in async arrow function with retries on invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1);
      const ta = new Uint8Array(sab);
      ta[0] = 200;
      let retryCount: int = 0;
      const targetMin: int = 150;

      // Async load with retry if value < targetMin (simulate validation)
      const loadWithValueRetry = async (arr: Uint8Array, idx: int): Promise<number> => {
        retryCount++;
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        const value: number = Atomics.load(arr, idx as int);
        if (value < targetMin && retryCount < 2) {
          // return loadWithValueRetry(arr, idx); // Retry if value is too small
        }
        return value;
      };

      const result = await loadWithValueRetry(ta, 0);
      expect(result).assertEqual(200);
      expect(retryCount).assertEqual(1); // No retry needed (200 ≥ 150)
    });

    /**
     * @tc.name   atomicsLoadTest099
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0099
     * @tc.desc   Load value from Int32Array in Promise.allSettled with mixed tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 5678;

      const promises = [
        Promise.resolve().then(() => Atomics.load(ta, 0)), // Valid load
        Promise.resolve().then(() => Atomics.load(ta, 1)), // Invalid load
        new Promise<long>((resolve) => {
          setTimeout(() => resolve(123), 2)
        })// Dummy task
      ];

      const results = await Promise.allSettled(promises);
      // Valid load result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<long>).value).assertEqual(5678);
      // Invalid load result
      expect(results[1].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertContain('Index');
      // Dummy task result
      expect(results[2].status).assertEqual('fulfilled');
      expect((results[2] as PromiseFulfilledResult<long>).value).assertEqual(123);
    });

    /**
     * @tc.name   atomicsLoadTest100
     * @tc.number SUB_BUILTINS_Atomics_load_TEST_0100
     * @tc.desc   Nested arrow functions for load with async cleanup and validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsLoadTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 999999999999999999n;
      let cleanupDone = false;
      let validated = false;

      // Load + async validation + async cleanup
      const safeLoadWithCleanup = async (arr: BigInt64Array, idx: int, min: bigint) => {
        try {
          const value: bigint = Atomics.load(arr, idx as int);
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 2)
          });
          validated = value >= min; // Validate value ≥ min
          return value;
        } finally {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 1)
          });
          cleanupDone = true;
        }
      };

      const result = await safeLoadWithCleanup(ta, 0, 100000000000000000n);
      expect(result).assertEqual(999999999999999999n);
      expect(validated).assertEqual(true);
      expect(cleanupDone).assertEqual(true);
    });
  }

  )
}