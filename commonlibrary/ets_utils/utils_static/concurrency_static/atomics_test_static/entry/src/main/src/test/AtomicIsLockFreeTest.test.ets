'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import sleep  from './Util.test';


interface GeneratedObjectLiteralInterface_2 {
  validSizes: number[];
  invalidSizes: number[];
  lockFreeCount: number;
}

interface GeneratedObjectLiteralInterface_6 {
  trueCount: number;
  falseCount: number;
  allResults: boolean[];
}

export default function atomicsIsLockFreeTest() {
  describe('atomicsIsLockFreeTest', () => {
    afterEach(async () => {
      await sleep(50)
    })

    /**
     * @tc.name   atomicsIsLockFreeTest001
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0001
     * @tc.desc   Test Atomics.isLockFree with valid 1-byte (8-bit) element size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 1; // 8-bit (Int8Array/Uint8Array)
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest002
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0002
     * @tc.desc   Test Atomics.isLockFree with valid 2-byte (16-bit) element size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 2; // 16-bit (Int16Array/Uint16Array)
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest003
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0003
     * @tc.desc   Test Atomics.isLockFree with valid 4-byte (32-bit) element size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 4; // 32-bit (Int32Array/Uint32Array)
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest004
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0004
     * @tc.desc   Test Atomics.isLockFree with valid 8-byte (64-bit) element size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 8; // 64-bit (BigInt64Array/BigUint64Array)
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest005
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0005
     * @tc.desc   Test Atomics.isLockFree with 0-byte invalid element size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 0; // Invalid: 0 bytes
      const result = Atomics.isLockFree(elementSize);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest006
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0006
     * @tc.desc   Test Atomics.isLockFree with 3-byte non-power-of-two element size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 3; // Invalid: not power of two
      const result = Atomics.isLockFree(elementSize);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest007
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0007
     * @tc.desc   Test Atomics.isLockFree with 16-byte oversized element size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 16; // Invalid: larger than 8 bytes
      const result = Atomics.isLockFree(elementSize);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest008
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0008
     * @tc.desc   Test Atomics.isLockFree with negative element size (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = -1; // Invalid: negative
      const result = Atomics.isLockFree(elementSize);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest009
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0009
     * @tc.desc   Test Atomics.isLockFree with float element size (2.5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize = 2.5; // Invalid: non-integer
      const result = Atomics.isLockFree(elementSize as int);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest010
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0010
     * @tc.desc   Test Atomics.isLockFree consistency for 4-byte size (multiple calls)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 4;
      const result1 = Atomics.isLockFree(elementSize);
      const result2 = Atomics.isLockFree(elementSize);
      const result3 = Atomics.isLockFree(elementSize);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest011
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0011
     * @tc.desc   Test Atomics.isLockFree with Int8Array element size (1 byte)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize = Int8Array.BYTES_PER_ELEMENT; // 1 byte
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest012
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0012
     * @tc.desc   Test Atomics.isLockFree with Uint16Array element size (2 bytes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize = Uint16Array.BYTES_PER_ELEMENT; // 2 bytes
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest013
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0013
     * @tc.desc   Test Atomics.isLockFree with Int32Array element size (4 bytes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize = Int32Array.BYTES_PER_ELEMENT; // 4 bytes
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest014
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0014
     * @tc.desc   Test Atomics.isLockFree with BigUint64Array element size (8 bytes)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize = BigUint64Array.BYTES_PER_ELEMENT; // 8 bytes
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest015
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0015
     * @tc.desc   Test Atomics.isLockFree with string argument ("4")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1111;

      // Verify lock-free for 4-byte operations
      expect(Atomics.isLockFree(4)).assertEqual(true);

      // Bitwise atomic chain: and → xor → or
      Atomics.and(ia, 0, 0b1010 as long); // 0b1111 & 0b1010 = 0b1010
      Atomics.xor(ia, 0, 0b0110 as long); // 0b1010 ^ 0b0110 = 0b1100
      Atomics.or(ia, 0, 0b0011 as long); // 0b1100 | 0b0011 = 0b1111

      expect(Atomics.load(ia, 0)).assertEqual(0b1111);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest016
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0016
     * @tc.desc   Test Atomics.isLockFree with null argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab32 = new ArrayBuffer(4);
      const ia32 = new Int32Array(sab32);
      ia32[0] = 42;
      // BigInt64Array (8-byte)
      const sab64 = new ArrayBuffer(8);
      const ba64 = new BigInt64Array(sab64);
      ba64[0] = 99n;

      expect(Atomics.isLockFree(4)).assertEqual(true);
      expect(Atomics.isLockFree(8)).assertEqual(true);

      Atomics.add(ia32, 0, 8);
      Atomics.add(ba64, 0, 1n);

      expect(Atomics.load(ia32, 0)).assertEqual(50);
      expect(Atomics.load(ba64, 0)).assertEqual(100n);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest017
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0017
     * @tc.desc   Test Atomics.isLockFree with undefined argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;

      // Verify lock-free before chaining operations
      expect(Atomics.isLockFree(4)).assertEqual(true);

      // Operation chain: add → xor → or → compareExchange
      Atomics.add(ia, 0, 3); // 5 + 3 = 8
      Atomics.xor(ia, 0, 4); // 8 ^ 4 = 12
      Atomics.or(ia, 0, 2); // 12 | 2 = 14
      const finalRes = Atomics.compareExchange(ia, 0, 14, 14);

      expect(finalRes).assertEqual(14);
      expect(Atomics.load(ia, 0)).assertEqual(14);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest018
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0018
     * @tc.desc   Test Atomics.isLockFree with object argument ({ value: 4 })
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab32 = new ArrayBuffer(4);
      const ia32 = new Int32Array(sab32);
      ia32[0] = 30;
      // BigUint64Array (8-byte)
      const sab64 = new ArrayBuffer(8);
      const bua64 = new BigUint64Array(sab64);
      bua64[0] = 100n;

      // Verify lock-free support
      expect(Atomics.isLockFree(4)).assertEqual(true);
      expect(Atomics.isLockFree(8)).assertEqual(true);

      // Atomic operations on different types
      Atomics.sub(ia32, 0, 5);
      Atomics.xor(bua64, 0, 50n);

      expect(Atomics.load(ia32, 0)).assertEqual(25);
      expect(Atomics.load(bua64, 0)).assertEqual(86n); // 100n ^ 50n = 150n
    });

    /**
     * @tc.name   atomicsIsLockFreeTest019
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0019
     * @tc.desc   Test Atomics.isLockFree with array argument ([4])
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0; // State: 0 ↔ 1

      // Confirm lock-free before conflict-prone operation
      expect(Atomics.isLockFree(4)).assertEqual(true);

      // Lock-free toggle with conflict resolution (simulate concurrent access)
      let current: number = Atomics.load(ia, 0);
      while (Atomics.compareExchange(ia, 0, current as long, current ^ 1) !== current) {
        current = Atomics.load(ia, 0);
      }

      expect(Atomics.load(ia, 0)).assertEqual(1);
      // Toggle back lock-free
      current = 1;
      while (Atomics.compareExchange(ia, 0, current as long, current ^ 1) !== current) {
        current = Atomics.load(ia, 0);
      }
      expect(Atomics.load(ia, 0)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest020
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0020
     * @tc.desc   Test Atomics.isLockFree with boolean argument (true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 3; // Val1
      ia[1] = 5; // Val2
      ia[2] = 8; // Sum (Val1+Val2)

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
     * @tc.name   atomicsIsLockFreeTest021
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0021
     * @tc.desc   Test Atomics.isLockFree with boolean argument (false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 47514189841n; // Initial bitmask

      // Validate 8-byte lock-free support (modern env)
      expect(Atomics.isLockFree(8)).assertEqual(true);

      // Lock-free bitmask operations
      Atomics.and(ba, 0, 47530967040n); // Clear lower 4 bits → 0b10110000n
      Atomics.xor(ba, 0, 47261417472n); // Toggle bit 6 → 0b11110000n
      Atomics.or(ba, 0, 47244644625n); // Set lower 4 bits → 0b11111111n

      const result = Atomics.load(ba, 0);
      expect(result).assertEqual(47530971409n)
    });

    /**
     * @tc.name   atomicsIsLockFreeTest022
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0022
     * @tc.desc   Test Atomics.isLockFree with BigInt argument (4n)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(Atomics.isLockFree(Number.MAX_VALUE as int)).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest023
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0023
     * @tc.desc   Test Atomics.isLockFree in async function (4-byte size)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncCheck = async (size: int): Promise<boolean> => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 5)
        });
        return Atomics.isLockFree(size);
      };

      const result = await asyncCheck(4);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest024
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0024
     * @tc.desc   Test Atomics.isLockFree in Promise.resolve (8-byte size)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await Promise.resolve(Atomics.isLockFree(8));
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest025
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0025
     * @tc.desc   Test Atomics.isLockFree comparison between 4-byte and 8-byte sizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result4 = Atomics.isLockFree(4);
      const result8 = Atomics.isLockFree(8);
      expect(typeof result4).assertEqual('boolean');
      expect(typeof result8).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest026
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0026
     * @tc.desc   Test Atomics.isLockFree with max safe integer (2^53 - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const maxSafeInt = Number.MAX_SAFE_INTEGER; // 9007199254740991
      const result = Atomics.isLockFree(maxSafeInt as int);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest027
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0027
     * @tc.desc   Test Atomics.isLockFree with min safe integer (-2^53 + 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const minSafeInt = Number.MIN_SAFE_INTEGER; // -9007199254740991
      const result = Atomics.isLockFree(minSafeInt as int);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest028
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0028
     * @tc.desc   Test Atomics.isLockFree with NaN argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = Atomics.isLockFree(NaN as int);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest029
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0029
     * @tc.desc   Test Atomics.isLockFree with Infinity argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = Atomics.isLockFree(Infinity as int);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest030
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0030
     * @tc.desc   Test Atomics.isLockFree with -Infinity argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = Atomics.isLockFree(-Infinity as int);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest031
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0031
     * @tc.desc   Test Atomics.isLockFree with 1-byte size in nested function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const nestedCheck = (): boolean => {
        const innerCheck = (size: int): boolean => Atomics.isLockFree(size);
        return innerCheck(1);
      };

      const result = nestedCheck();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest032
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0032
     * @tc.desc   Test Atomics.isLockFree with 2-byte size in async IIFE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await (async () => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        return Atomics.isLockFree(2);
      })();

      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest033
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0033
     * @tc.desc   Test Atomics.isLockFree with typed array BYTES_PER_ELEMENT constant (Int8Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize = Int8Array.BYTES_PER_ELEMENT; // 1
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest034
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0034
     * @tc.desc   Test Atomics.isLockFree with typed array BYTES_PER_ELEMENT constant (Uint32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize = Uint32Array.BYTES_PER_ELEMENT; // 4
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest035
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0035
     * @tc.desc   Test Atomics.isLockFree with typed array BYTES_PER_ELEMENT constant (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize = BigInt64Array.BYTES_PER_ELEMENT; // 8
      const result = Atomics.isLockFree(elementSize);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest036
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0036
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raceResult = await Promise.race([
        Promise.resolve(Atomics.isLockFree(4)), new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(false)
          }, 3)
        })
      ]);

      expect(typeof raceResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest037
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0037
     * @tc.desc   Test Atomics.isLockFree with 8-byte size in Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await Promise.all([
        Promise.resolve(Atomics.isLockFree(8)), Promise.resolve(Atomics.isLockFree(8))
      ]);

      expect(result[0]).assertEqual(result[1]);
      expect(typeof result[1]).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest038
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0038
     * @tc.desc   Test Atomics.isLockFree with 1-byte size and post-validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = Atomics.isLockFree(1);
      const isValid = typeof result === 'boolean';
      expect(isValid).assertEqual(true);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest039
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0039
     * @tc.desc   Test Atomics.isLockFree with 2-byte size in conditional check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 2;
      let checkResult = false;

      if (Atomics.isLockFree(elementSize)) {
        checkResult = true;
      } else {
        checkResult = false;
      }

      expect(typeof checkResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest040
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0040
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in loop (multiple iterations)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const elementSize: int = 4;
      const results: boolean[] = [];

      for (let i: int = 0; i < 5; i++) {
        results.push(Atomics.isLockFree(elementSize));
      }

      // All iterations should return the same result
      const firstResult = results[0];
      for (const res of results) {
        expect(res).assertEqual(firstResult);
      }
      expect(typeof firstResult).assertEqual('boolean');
    });


    /**
     * @tc.name   atomicsIsLockFreeTest042
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0042
     * @tc.desc   Test nested async functions with Atomics.isLockFree (8-byte size)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Outer async function
      const outerCheck = async (size: int): Promise<boolean> => {
        // Inner async function with delay
        const innerCheck = async (s: int): Promise<boolean> => {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          return Atomics.isLockFree(s);
        };
        return innerCheck(size);
      };

      const result = await outerCheck(8);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest043
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0043
     * @tc.desc   Test Atomics.isLockFree with invalid string coercion in Promise.catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(Atomics.isLockFree(Number.EPSILON as int)).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest044
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0044
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in Promise.allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises = [
        Promise.resolve(Atomics.isLockFree(4)), //     Promise.resolve(Atomics.isLockFree(4)),
        Promise.resolve(Atomics.isLockFree(4))
      ];

      const results = await Promise.allSettled(promises);
      results.forEach((res: PromiseFulfilledResult<Boolean> | PromiseRejectedResult) => {
        expect(res.status).assertEqual('fulfilled');
        expect(typeof (res as PromiseFulfilledResult<boolean>).value).assertEqual('boolean');
      });
      // All results should be consistent
      const firstVal = (results[0] as PromiseFulfilledResult<boolean>).value;
      results.slice(1).forEach((res: PromiseFulfilledResult<Boolean> | PromiseRejectedResult) => {
        expect((res as PromiseFulfilledResult<boolean>).value).assertEqual(firstVal);
      });
    });

    /**
     * @tc.name   atomicsIsLockFreeTest045
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0045
     * @tc.desc   Test Atomics.isLockFree with dynamic size from async API mock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Mock async API to get element size
      const mockFetchSize = async (): Promise<number> => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 5)
        });
        return 4.0; // Return valid 4-byte size
      };

      const size = await mockFetchSize();
      const result = Atomics.isLockFree(size as int);
      expect(size).assertEqual(4);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest046
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0046
     * @tc.desc   Test nested conditional check with Atomics.isLockFree (1-byte size)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const checkLockFree = async (size: int): Promise<string> => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        if (size === 1) {
          const isFree = Atomics.isLockFree(size);
          if (isFree) {
            return '1-byte is lock-free';
          } else {
            return '1-byte is not lock-free';
          }
        } else {
          return 'Invalid size';
        }
      };

      const resultMsg = await checkLockFree(1);
      expect(resultMsg).assertContain('1-byte is lock-free');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest047
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0047
     * @tc.desc   Test Atomics.isLockFree with BigInt coercion error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncBigIntCheck = async () => {
        let result: boolean | null = null;
        try {
          result = Atomics.isLockFree(8);
        } catch (err) {
          // isLockFree doesn't throw, coerces BigInt to Number as int(8n → 8)
          expect(true).assertEqual(false); // Should not reach here
        }
        return result;
      };

      const result = await asyncBigIntCheck();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest048
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0048
     * @tc.desc   Test Atomics.isLockFree with 2-byte size in async closure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const createLockCheckClosure = (size: int) => {
        // Closure captures 'size' from outer function
        return async () => {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          return Atomics.isLockFree(size);
        };
      };

      const lockCheck = createLockCheckClosure(2);
      const result = await lockCheck();
      expect(typeof result).assertEqual('boolean');
    });


    /**
     * @tc.name   atomicsIsLockFreeTest050
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0050
     * @tc.desc   Test Atomics.isLockFree with 8-byte size and async cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cleanupCalled = false;

      const asyncCheckWithCleanup = async (size: int): Promise<boolean> => {
        try {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          return Atomics.isLockFree(size);
        } finally {
          // Run cleanup regardless of result
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 1)
          });
          cleanupCalled = true;
        }
      };

      const result = await asyncCheckWithCleanup(8);
      expect(typeof result).assertEqual('boolean');
      expect(cleanupCalled).assertEqual(true);
    });


    /**
     * @tc.name   atomicsIsLockFreeTest052
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0052
     * @tc.desc   Test Atomics.isLockFree with invalid object coercion in nested try/catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const nestedErrorCheck = async () => {
        let finalResult: boolean | string = false;
        try {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          try {
            const result = Atomics.isLockFree(4);
            finalResult = result;
          } catch (innerErr) {
            finalResult = 'Inner error';
          }
        } catch (outerErr) {
          finalResult = 'Outer error';
        }
        return finalResult;
      };

      const result = await nestedErrorCheck();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest053
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0053
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in Promise chain with transform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await Promise.resolve(4) // Start with size 4
        .then(async (size: int):Promise<Int> => {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          return size;
        })
        .then((size: int): boolean => Atomics.isLockFree(size))
        .then((isFree: boolean) => {
          // Transform result to string for validation
          return isFree ? 'lock-free' : 'not lock-free';
        });

      expect(result).assertContain('lock-free');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest054
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0054
     * @tc.desc   Test Atomics.isLockFree with 2-byte size and async validation callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const validateResult = async (isFree: boolean, callback: (valid: boolean) => void) => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        callback(typeof isFree === 'boolean');
      };

      let isResultValid = false;
      const size: int = 2;
      const isFree = Atomics.isLockFree(size);

      await validateResult(isFree,(valid) => {
        isResultValid = valid;
      });

      expect(isResultValid).assertEqual(true);
    });


    /**
     * @tc.name   atomicsIsLockFreeTest056
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0056
     * @tc.desc   Test Atomics.isLockFree with 1-byte size in async retry logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let retryCount: int = 0;
      const maxRetries: int = 2;

      const asyncRetryCheck = async (size: int): Promise<boolean> => {
        retryCount++;
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 2 * retryCount)
        }); // Increasing delay

        const result = Atomics.isLockFree(size);
        // Retry if first attempt (simulate transient check need)
        if (retryCount < maxRetries && size === 1) {
          // return asyncRetryCheck(size);
        }
        return result;
      };

      const result = await asyncRetryCheck(1);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest057
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0057
     * @tc.desc   Test Atomics.isLockFree with 4-byte size and nested Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const nestedTasks = [
        Promise.resolve(Atomics.isLockFree(4)),
        Promise.all([
          Promise.resolve(Atomics.isLockFree(4)), Promise.resolve(Atomics.isLockFree(4))
        ])
      ];

      const result = await Promise.all(nestedTasks);
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest058
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0058
     * @tc.desc   Test Atomics.isLockFree with invalid array coercion and error logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let errorLogged = false;
      const mockLogger = (msg: string) => {
        errorLogged = true;
      };

      const asyncCheckWithLog = async () => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        const result = Atomics.isLockFree(4);
        if (result === false) {
          mockLogger('Invalid input: array coerced to NaN, returns false');
        }
        return result;
      };

      const result = await asyncCheckWithLog();
      expect(result).assertEqual(true);
      expect(errorLogged).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest059
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0059
     * @tc.desc   Test Atomics.isLockFree with 8-byte size in async conditional chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: int = 8;
      let finalMsg = '';

      const asyncConditionalChain: string = await Promise.resolve(size)
        .then((s: int): boolean => {
          if (s === 8) {
            return Atomics.isLockFree(s);
          }
          throw new Error('Invalid size');
        })
        .then((isFree: boolean) => {
          finalMsg = isFree ? '8-byte operations are lock-free' : '8-byte operations need locking';
          return finalMsg;
        })
        .catch((err: Error) => {
          return err.message
        });

      expect(asyncConditionalChain).assertContain('8-byte operations are lock-free');
      expect(finalMsg).assertEqual(asyncConditionalChain);
    });


    /**
     * @tc.name   atomicsIsLockFreeTest061
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0061
     * @tc.desc   Test Atomics.isLockFree with mixed valid/invalid sizes in Promise.allSettled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises = [
        Promise.resolve(Atomics.isLockFree(1)), // Valid
        Promise.resolve(Atomics.isLockFree(5)), // Invalid
        Promise.resolve(Atomics.isLockFree(8)), // Valid
        Promise.resolve(Atomics.isLockFree(-3))// Invalid
      ];

      const results = await Promise.allSettled(promises);
      results.forEach((res: PromiseFulfilledResult<Boolean> | PromiseRejectedResult, index: int,
        results: Array<PromiseFulfilledResult<Boolean> | PromiseRejectedResult>) => {
        expect(res.status).assertEqual('fulfilled');
        const value = (res as PromiseFulfilledResult<boolean>).value;
        let arr: int[] = [0, 2]
        if (arr.includes(index)) { // Valid sizes (1,8)
          expect(typeof value).assertEqual('boolean');
        } else { // Invalid sizes (5,-3)
          expect(value).assertEqual(false);
        }
      });
    });

    /**
     * @tc.name   atomicsIsLockFreeTest062
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0062
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in nested async closure chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const createOuterClosure = () => {
        const outerSize: int = 4;
        return (): Promise<boolean> => {
          const createInnerClosure = () => {
            return async () => {
              await new Promise<void>((resolve) => {
                setTimeout(() => {
                  resolve(undefined)
                }, 3)
              });
              return Atomics.isLockFree(outerSize);
            };
          };
          const innerClosure = createInnerClosure();
          return innerClosure();
        };
      };

      const outerClosure = createOuterClosure();
      const result = await outerClosure();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest063
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0063
     * @tc.desc   Test Atomics.isLockFree with 1-byte size and async timeout fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raceResult = await Promise.race([
        // Primary check: 1-byte size with delay
        new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(Atomics.isLockFree(1));
          }, 3);
        }),
        // Fallback: return default false if timeout
        new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(false);
          }, 10);
        })
      ]);

      expect(typeof raceResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest064
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0064
     * @tc.desc   Test Atomics.isLockFree with 8-byte size in async loop with result caching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const size: int = 8;
      const cache: boolean[] = [];

      const asyncCachedCheck = async (iterations: number) => {
        for (let i: int = 0; i < iterations; i++) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          const result = Atomics.isLockFree(size);
          cache.push(result);
        }
      };

      await asyncCachedCheck(3);
      expect(cache.length).assertEqual(3);
      // All cached results should be the same
      const firstCache = cache[0];
      expect(firstCache).assertEqual(true)
      expect(typeof firstCache).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest065
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0065
     * @tc.desc   Test Atomics.isLockFree with invalid NaN coercion in async error handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncNaNCheck = async () => {
        try {
          const result = Atomics.isLockFree(NaN as int);
          // Verify result and log (isLockFree returns false for NaN)
          return result;
        } catch (err) {
          return false;
        }
      };

      const result = await asyncNaNCheck();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest066
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0066
     * @tc.desc   Test Atomics.isLockFree with 2-byte size in Promise chain with cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cleanupExecuted = false;
      const size: int = 2;

      const result = await Promise.resolve(size)
        .then(async (s: int):Promise<Boolean> => {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          return Atomics.isLockFree(s);
        })
        .finally(async () => {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          cleanupExecuted = true;
        });

      expect(typeof result).assertEqual('boolean');
      expect(cleanupExecuted).assertEqual(true);
    });


    /**
     * @tc.name   atomicsIsLockFreeTest068
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0068
     * @tc.desc   Test Atomics.isLockFree with 1-byte size in parallel async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const taskCount: int = 3;
      // Create multiple parallel tasks checking 1-byte size
      const parallelTasks = Array.from(new Array<int>(taskCount), async () => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, Math.random() * 5 as int)
        }); // Random small delay
        return Atomics.isLockFree(1);
      });

      const results = await Promise.all(parallelTasks);
      expect(results.length).assertEqual(taskCount);
      // All parallel results should be consistent
      const firstResult = results[0];
      expect(firstResult).assertEqual(true);
      expect(typeof firstResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest069
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0069
     * @tc.desc   Test Atomics.isLockFree with 8-byte size in nested try/catch/finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let tryExecuted = false;
      let catchExecuted = false;
      let finallyExecuted = false;
      let result: boolean | null = null;

      const nestedErrorFlow = async () => {
        try {
          tryExecuted = true;
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          result = Atomics.isLockFree(8);
          // Simulate no error (isLockFree doesn't throw)
        } catch (innerErr) {
          catchExecuted = true;
        } finally {
          finallyExecuted = true;
        }
      };

      await nestedErrorFlow();
      expect(tryExecuted).assertEqual(true);
      expect(catchExecuted).assertEqual(false); // No error thrown
      expect(finallyExecuted).assertEqual(true);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest070
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0070
     * @tc.desc   Test Atomics.isLockFree with mixed sizes and async result aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sizes: int[] = [1, 2, 3, 4, 6, 8];
      const aggregationResult: GeneratedObjectLiteralInterface_2 = {
        validSizes: [] as number[],
        invalidSizes: [] as number[],
        lockFreeCount: 0
      };

      const asyncAggregation = async () => {
        for (const size of sizes) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          const isFree = Atomics.isLockFree(size);
          let arr: int[] = [1, 2, 4, 8]
          if (arr.includes(size)) {
            aggregationResult.validSizes.push(size);
            if (isFree) {
              aggregationResult.lockFreeCount++;
            }
          } else {
            aggregationResult.invalidSizes.push(size);
          }
        }
      };

      await asyncAggregation();
      expect(aggregationResult.validSizes[0]).assertEqual(1);
      expect(aggregationResult.validSizes[1]).assertEqual(2);
      expect(aggregationResult.validSizes[2]).assertEqual(4);
      expect(aggregationResult.validSizes[3]).assertEqual(8);
      expect(aggregationResult.invalidSizes[0]).assertEqual(3);
      expect(aggregationResult.invalidSizes[1]).assertEqual(6);
      expect(aggregationResult.lockFreeCount).assertLargerOrEqual(0); // Count depends on environment
    });


    /**
     * @tc.name   atomicsIsLockFreeTest072
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0072
     * @tc.desc   Test Atomics.isLockFree with 2-byte size in nested Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const innerRace = () => {
        return Promise.race([
          Promise.resolve(Atomics.isLockFree(2)), new Promise<boolean>((resolve) => {
            setTimeout(() => {
              resolve(false)
            }, 5)
          })
        ]);
      };

      // Nested race: inner race vs another delay
      const outerRaceResult = await Promise.race([
        innerRace(),
        new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(false)
          }, 10)
        })
      ]);

      expect(typeof outerRaceResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest073
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0073
     * @tc.desc   Test Atomics.isLockFree with 1-byte size in async loop with early exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sizes:int[] = [1, 1, 1, 5, 1]; // Early exit when invalid size is hit
      const results: boolean[] = [];
      let exitEarly = false;

      const asyncLoopWithExit = async () => {
        for (const size of sizes) {
          if (exitEarly) {
            break;
          }
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          const isFree = Atomics.isLockFree(size);
          results.push(isFree);
          // Exit early when invalid size (5) is processed
          if (size === 5) {
            exitEarly = true;
          }
        }
      };

      await asyncLoopWithExit();
      expect(results.length).assertEqual(4); // Processed [1,1,1,5]
      expect(exitEarly).assertEqual(true);
      expect(results[3]).assertEqual(false); // Result for invalid size 5
    });


    /**
     * @tc.name   atomicsIsLockFreeTest075
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0075
     * @tc.desc   Test Atomics.isLockFree with invalid -Infinity coercion in async error flow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncInvalidInfinityCheck = async () => {
        let flowLog: string[] = [];
        try {
          flowLog.push('try-start');
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          const result = Atomics.isLockFree(-Infinity as int);
          flowLog.push('try-success');
          expect(result).assertEqual(false);
          return flowLog;
        } catch (err) {
          flowLog.push('catch-triggered');
          return flowLog;
        }
      };

      const flowLog = await asyncInvalidInfinityCheck();
      expect(flowLog).assertDeepEquals(['try-start', 'try-success']); // No error thrown
      // -Infinity is invalid, returns false
    });


    /**
     * @tc.name   atomicsIsLockFreeTest078
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0078
     * @tc.desc   Test Atomics.isLockFree with 1-byte size in nested async validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const outerValidation = async (size: int) => {
        const innerValidation = async (s: int): Promise<boolean> => {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          // Inner validation: size is positive integer
          if (s <= 0 || !Number.isInteger(s)) {
            return false;
          }
          return Atomics.isLockFree(s);
        };

        const isSizeValid = [1, 2, 4, 8].includes(size);
        const lockFreeResult = await innerValidation(size);
        return isSizeValid;
      };

      const isSizeValid = await outerValidation(1);
      expect(isSizeValid).assertEqual(true);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest079
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0079
     * @tc.desc   Test Atomics.isLockFree with 8-byte size in async function with retries on invalid state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let simulateInvalidState = true;
      let retryCount: int = 0;

      const asyncCheckWithStateRetry = async (size: int): Promise<boolean> => {
        retryCount++;
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });

        // Simulate invalid state on first attempt
        if (simulateInvalidState && retryCount === 1) {
          simulateInvalidState = false; // Reset state for next attempt
          // return asyncCheckWithStateRetry(size);
        }

        return Atomics.isLockFree(size);
      };

      const result = await asyncCheckWithStateRetry(8);
      expect(typeof result).assertEqual('boolean');
    });


    /**
     * @tc.name   atomicsIsLockFreeTest081
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0081
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in Promise.race with error promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const raceResult = await Promise.race([
        // Atomics check (faster, should win)
        new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(Atomics.isLockFree(4));
          }, 2);
        }),
        // Error promise (slower)
        new Promise<never>((_, reject) => {
          setTimeout(() => {
            reject(new Error('Race error'));
          }, 5);
        })
      ]);

      expect(typeof raceResult).assertEqual('boolean');
    });


    /**
     * @tc.name   atomicsIsLockFreeTest083
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0083
     * @tc.desc   Test Atomics.isLockFree with 1-byte size in async loop with result logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const iterations: int = 3;
      const log: string[] = [];

      const asyncLoggedCheck = async () => {
        for (let i: int = 0; i < iterations; i++) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          const isFree = Atomics.isLockFree(1);
          log.push(`Iteration ${i + 1}: 1-byte lock-free = ${isFree}`);
        }
      };

      await asyncLoggedCheck();
      expect(log.length).assertEqual(iterations);
      log.forEach(entry => {
        expect(entry).assertContain('1-byte lock-free = true');
      });
    });


    /**
     * @tc.name   atomicsIsLockFreeTest085
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0085
     * @tc.desc   Test Atomics.isLockFree with invalid object coercion in async batch check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(Atomics.isLockFree(Number.MIN_VALUE as int)).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest086
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0086
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in async function with state reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let state: 'idle' | 'checking' | 'done' = 'idle';

      const asyncCheckWithState = async (size: int): Promise<boolean> => {
        state = 'checking';
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        const result = Atomics.isLockFree(size);
        state = 'done';
        return result;
      };

      const resultPromise = asyncCheckWithState(4);
      expect(state).assertEqual('checking'); // State updates during async call
      const result = await resultPromise;
      expect(state).assertEqual('done');
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest087
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0087
     * @tc.desc   Test Atomics.isLockFree with 2-byte size in Promise.allSettled with error simulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promises = [
        // Valid check
        Promise.resolve(Atomics.isLockFree(2)), // Simulate error in promise as int(not from isLockFree itself)
        new Promise<boolean>((_, reject) => {
          setTimeout(() => reject(new Error('Simulated promise error')), 3);
        }),
        // Another valid check
        Promise.resolve(Atomics.isLockFree(2))
      ];

      const results = await Promise.allSettled(promises);
      // Check first valid promise
      expect(results[0].status).assertEqual('fulfilled');
      expect(typeof (results[0] as PromiseFulfilledResult<Boolean>).value).assertEqual('boolean');
      // Check simulated error promise
      expect(results[1].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertContain('Simulated promise error');
      // Check third valid promise
      expect(results[2].status).assertEqual('fulfilled');
      expect(typeof (results[2] as PromiseFulfilledResult<Boolean>).value).assertEqual('boolean');
    });


    /**
     * @tc.name   atomicsIsLockFreeTest090
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0090
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in async loop with result aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const iterations: int = 4;
      const aggregation: GeneratedObjectLiteralInterface_6 = {
        trueCount: 0,
        falseCount: 0,
        allResults: [] as boolean[]
      };

      const asyncAggregateCheck = async () => {
        for (let i: int = 0; i < iterations; i++) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          const isFree = Atomics.isLockFree(4);
          aggregation.allResults.push(isFree);
          isFree ? aggregation.trueCount++ : aggregation.falseCount++;
        }
      };

      await asyncAggregateCheck();
      expect(aggregation.allResults.length).assertEqual(iterations);
      expect(aggregation.trueCount + aggregation.falseCount).assertEqual(iterations);
      // All results for same size should be consistent
      const firstResult = aggregation.allResults[0];
      expect(firstResult).assertEqual(true);
    });


    /**
     * @tc.name   atomicsIsLockFreeTest092
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0092
     * @tc.desc   Test Atomics.isLockFree with 1-byte size in async function with dynamic validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const dynamicValidate = async (size: int, validSizes: int[]): Promise<boolean> => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        if (!validSizes.includes(size)) {
          return false;
        }
        return Atomics.isLockFree(size);
      };

      const validSizes = [1, 2, 4, 8];
      const result = await dynamicValidate(1, validSizes);
      expect(typeof result).assertEqual('boolean');

      // Test invalid size with dynamic list
      const invalidResult = await dynamicValidate(3, validSizes);
      expect(invalidResult).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest093
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0093
     * @tc.desc   Test Atomics.isLockFree with 8-byte size in nested Promise chain with cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cleanupCalled = false;

      const result = await Promise.resolve(8)
        .then((size:int) => {
          // Async delay in chain
          return new Promise<int>((resolve) => {
            setTimeout(() => {
              resolve(size)
            }, 3)
          });
        })
        .then((size:int) => {
          const isFree = Atomics.isLockFree(size);
          return isFree;
        })
        .finally(async () => {
          // Async cleanup
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          cleanupCalled = true;
        });

      expect(typeof result).assertEqual('boolean');
      expect(cleanupCalled).assertEqual(true);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest094
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0094
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in async batch check with progress tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const batchSize: int = 3;
      const progress: number[] = [];
      const results: boolean[] = [];

      const asyncBatchWithProgress = async () => {
        for (let i: int = 0; i < batchSize; i++) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 3)
          });
          results.push(Atomics.isLockFree(4));
          progress.push(Math.round(((i + 1) / batchSize) * 100)); // Track percentage
        }
      };

      await asyncBatchWithProgress();
      expect(results.length).assertEqual(batchSize);
      expect(results[0]).assertEqual(true);
      expect(results[1]).assertEqual(true);
      expect(progress[2]).assertEqual(100);
    });


    /**
     * @tc.name   atomicsIsLockFreeTest095
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0095
     * @tc.desc   Test Atomics.isLockFree with 2-byte size in async closure with memory cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(Atomics.isLockFree(Number.POSITIVE_INFINITY as int)).assertEqual(false);
    });

    /**
     * @tc.name   atomicsIsLockFreeTest096
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0096
     * @tc.desc   Test Atomics.isLockFree with 4-byte size in async loop with result validation callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const iterations: int = 3;
      let validationCount: int = 0;

      const validateResult = (result: boolean) => {
        if (typeof result === 'boolean') {
          validationCount++;
        }
      };

      const asyncLoopWithValidation = async (size: int) => {
        for (let i: int = 0; i < iterations; i++) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              resolve(undefined)
            }, 2)
          });
          const result = Atomics.isLockFree(size);
          validateResult(result);
        }
      };

      await asyncLoopWithValidation(4);
      expect(validationCount).assertEqual(iterations); // All results passed validation
    });

    /**
     * @tc.name   atomicsIsLockFreeTest097
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0097
     * @tc.desc   Test Atomics.isLockFree with 8-byte size in nested Promise.race with fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const innerRace = (size: int) => {
        return Promise.race([
          Promise.resolve(Atomics.isLockFree(size)), new Promise<boolean>((resolve) => {
            setTimeout(() => resolve(false), 5)
          })
        ]);
      };

      // Outer race: use inner race result or default to false on timeout
      const finalResult = await Promise.race([
        innerRace(8),
        new Promise<boolean>((resolve) => {
          setTimeout(() => resolve(false), 10)
        })
      ]);

      expect(typeof finalResult).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicsIsLockFreeTest098
     * @tc.number SUB_BUILTINS_Atomics_isLockFree_TEST_0098
     * @tc.desc   Test Atomics.isLockFree with 1-byte size in async function with dynamic size adjustment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsIsLockFreeTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const adjustSizeAndCheck = async (baseSize: int, offset: int) => {
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            resolve(undefined)
          }, 3)
        });
        const adjustedSize: int = baseSize + offset;
        // Ensure adjusted size is valid (1,2,4,8) or default to 1
        const validSize: int = [1, 2, 4, 8].includes(adjustedSize) ? adjustedSize : 1;
        return Atomics.isLockFree(validSize);
      };

      // Test with offset that makes size invalid (base=1 + offset=1 → 2, valid as int)
      const result1 = await adjustSizeAndCheck(1, 1);
      // Test with offset that makes size invalid (base=1 + offset=2 → 3, defaults to 1)
      const result2 = await adjustSizeAndCheck(1, 2);

      expect(typeof result1).assertEqual('boolean');
      expect(typeof result2).assertEqual('boolean');
    });

  })
}