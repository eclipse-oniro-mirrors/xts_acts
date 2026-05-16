import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  atomicsExchangeTest054,
  atomicsExchangeTest063,
  atomicsExchangeTest078,
  atomicsExchangeTest096,
  type63,
  type86,
  type94,
  type97
} from './atomics';
import { sleep } from './utils';


export default function atomicsExchangeTest() {
  describe('atomicsExchangeTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   atomicsExchangeTest001
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_001
     * @tc.desc   Test basic usage with Int32Array: replace value and return old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const oldValue = Atomics.exchange(ia, 0, 20);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsExchangeTest002
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_002
     * @tc.desc   Test with Uint8Array: replace unsigned 8-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 255;
      const oldValue = Atomics.exchange(ua, 0, 10);
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsExchangeTest003
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_003
     * @tc.desc   Test with Int8Array: replace signed 8-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -128;
      const oldValue = Atomics.exchange(ia, 0, 127);
      expect(oldValue).assertEqual(-128);
      expect(ia[0]).assertEqual(127);
    });

    /**
     * @tc.name   atomicsExchangeTest004
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_004
     * @tc.desc   Test with Uint16Array: replace unsigned 16-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 65535;
      const oldValue = Atomics.exchange(ua, 0, 32768);
      expect(oldValue).assertEqual(65535);
      expect(ua[0]).assertEqual(32768);
    });

    /**
     * @tc.name   atomicsExchangeTest005
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_005
     * @tc.desc   Test with Int16Array: replace signed 16-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = -32768;
      const oldValue = Atomics.exchange(ia, 0, 32767);
      expect(oldValue).assertEqual(-32768);
      expect(ia[0]).assertEqual(32767);
    });

    /**
     * @tc.name   atomicsExchangeTest006
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_006
     * @tc.desc   Test with Uint32Array: replace unsigned 32-bit value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 4294967295;
      const oldValue = Atomics.exchange(ua, 0, 0);
      expect(oldValue).assertEqual(4294967295);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest007
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_007
     * @tc.desc   Test with BigInt64Array: replace 64-bit signed BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = -9007199254740991n;
      const oldValue = Atomics.exchange(ba, 0, 9007199254740991n);
      expect(oldValue).assertEqual(-9007199254740991n);
      expect(ba[0]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.name   atomicsExchangeTest008
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_008
     * @tc.desc   Test with BigUint64Array: replace 64-bit unsigned BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const bua = new BigUint64Array(sab);
      bua[0] = 18446744073709551615n;
      const oldValue = Atomics.exchange(bua, 0, 1n);
      expect(oldValue).assertEqual(18446744073709551615n);
      expect(bua[0]).assertEqual(1n);
    });

    /**
     * @tc.name   atomicsExchangeTest009
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_009
     * @tc.desc   Test exchange at non-zero index of Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 1;
      ia[1] = 20;
      const oldValue = Atomics.exchange(ia, 1, 30);
      expect(oldValue).assertEqual(20);
      expect(ia[1]).assertEqual(30);
      expect(ia[0]).assertEqual(1);
    });

    /**
     * @tc.name   atomicsExchangeTest010
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_010
     * @tc.desc   Test exchange with zero value in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const oldValue = Atomics.exchange(ia, 0, 100);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsExchangeTest011
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_011
     * @tc.desc   Test throw TypeError with non-integer typed array (Float32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 20;  // Source
      ia[1] = 5;   // Target

      // Transfer 3 from source to target (atomic exchange + add)
      const oldSource = Atomics.exchange(ia, 0, ia[0] - 3);
      Atomics.add(ia, 1, 3);

      expect(oldSource).assertEqual(20);
      expect(ia[0]).assertEqual(17);
      expect(ia[1]).assertEqual(8);
    });

    /**
     * @tc.name   atomicsExchangeTest012
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_012
     * @tc.desc   Test throw RangeError with index out of bounds (exceed length)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.exchange(ia, 1, 5)
      } catch (e) {
        expect(e.message).assertContain('Index is overflow');
      }
    });

    /**
     * @tc.name   atomicsExchangeTest013
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_013
     * @tc.desc   Test throw RangeError with negative index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.exchange(ia, -1, 5)
      } catch (e) {
        expect(e.message).assertContain('integerIndex');
      }
    });

    /**
     * @tc.name   atomicsExchangeTest014
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_014
     * @tc.desc   Test throw TypeError with non-shared ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(4);
      const ia = new Int32Array(ab);
      try {
        Atomics.exchange(ia, 0, 10)
      } catch (e) {
        expect(e.message).assertContain(10);
      }
    });

    /**
     * @tc.name   atomicsExchangeTest015
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_015
     * @tc.desc   Test multiple consecutive exchange calls on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      const old1 = Atomics.exchange(ia, 0, 20);
      const old2 = Atomics.exchange(ia, 0, 30);
      const old3 = Atomics.exchange(ia, 0, 40);

      expect(old1).assertEqual(10);
      expect(old2).assertEqual(20);
      expect(old3).assertEqual(30);
      expect(ia[0]).assertEqual(40);
    });

    /**
     * @tc.name   atomicsExchangeTest016
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_016
     * @tc.desc   Test exchange with maximum Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const maxInt32 = 2147483647;
      ia[0] = maxInt32;
      const oldValue = Atomics.exchange(ia, 0, -1);
      expect(oldValue).assertEqual(maxInt32);
      expect(ia[0]).assertEqual(-1);
    });

    /**
     * @tc.name   atomicsExchangeTest017
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_017
     * @tc.desc   Test exchange with minimum Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const minInt32 = -2147483648;
      ia[0] = minInt32;
      const oldValue = Atomics.exchange(ia, 0, 0);
      expect(oldValue).assertEqual(minInt32);
      expect(ia[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest018
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_018
     * @tc.desc   Test exchange on large SharedArrayBuffer (Int32Array with index 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(32); // 8 Int32 elements
      const ia = new Int32Array(sab);
      ia[5] = 123;
      const oldValue = Atomics.exchange(ia, 5, 456);
      expect(oldValue).assertEqual(123);
      expect(ia[5]).assertEqual(456);
      expect(ia[4]).assertEqual(0);
      expect(ia[6]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest019
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_019
     * @tc.desc   Test value overflow for Uint8Array in exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 255;
      const oldValue = Atomics.exchange(ua, 0, 260); // 260 mod 256 = 4
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(4);
    });

    /**
     * @tc.name   atomicsExchangeTest020
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_020
     * @tc.desc   Test value underflow for Int8Array in exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -128;
      const oldValue = Atomics.exchange(ia, 0, -130); // -130 mod 128 = 126
      expect(oldValue).assertEqual(-128);
      expect(ia[0]).assertEqual(126);
    });

    /**
     * @tc.name   atomicsExchangeTest021
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_021
     * @tc.desc   Test exchange with same old and new value in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50;
      const oldValue = Atomics.exchange(ia, 0, 50);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(50);
    });

    /**
     * @tc.name   atomicsExchangeTest022
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_022
     * @tc.desc   Test throw TypeError with non-typed array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0; // 0: unlocked, 1: locked

      // Lock (atomic exchange)
      const lockResult = Atomics.exchange(ia, 0, 1);
      expect(lockResult).assertEqual(0); // Lock acquired
      expect(Atomics.load(ia, 0)).assertEqual(1);

      // Try lock again (should fail)
      const failedLock = Atomics.compareExchange(ia, 0, 0, 1);
      expect(failedLock).assertEqual(1);

      // Unlock (atomic exchange)
      const unlockResult = Atomics.exchange(ia, 0, 0);
      expect(unlockResult).assertEqual(1); // Lock released
      expect(Atomics.load(ia, 0)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest023
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_023
     * @tc.desc   Test exchange with large positive value in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 1000000;
      const oldValue = Atomics.exchange(ia, 0, 2000000);
      expect(oldValue).assertEqual(1000000);
      expect(ia[0]).assertEqual(2000000);
    });

    /**
     * @tc.name   atomicsExchangeTest024
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_024
     * @tc.desc   Test exchange with large negative value in Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -500000;
      const oldValue = Atomics.exchange(ia, 0, -1000000);
      expect(oldValue).assertEqual(-500000);
      expect(ia[0]).assertEqual(-1000000);
    });

    /**
     * @tc.name   atomicsExchangeTest025
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_025
     * @tc.desc   Test exchange on Uint16Array with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 65535;
      const oldValue = Atomics.exchange(ua, 0, 65536); // 65536 mod 65536 = 0
      expect(oldValue).assertEqual(65535);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest026
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_026
     * @tc.desc   Test exchange on Int16Array with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = 32767;
      const oldValue = Atomics.exchange(ia, 0, 32768); // 32768 mod 65536 = -32768
      expect(oldValue).assertEqual(32767);
      expect(ia[0]).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicsExchangeTest027
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_027
     * @tc.desc   Test throw TypeError with non-integer value for BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0; // State: 0 (idle) →1 (processing) →2 (completed)

      // Transition 0→1 (idle→processing)
      const transition1 = Atomics.compareExchange(ia, 0, 0, 1);
      expect(transition1).assertEqual(0);
      expect(Atomics.load(ia, 0)).assertEqual(1);

      // Simulate processing (atomic add for progress)
      Atomics.add(ia, 0, 1); // 1→2 (processing→completed)
      const transition2 = Atomics.compareExchange(ia, 0, 2, 2);
      expect(transition2).assertEqual(2);

      // Reset state (atomic exchange)
      const reset = Atomics.exchange(ia, 0, 0);
      expect(reset).assertEqual(2);
      expect(Atomics.load(ia, 0)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest028
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_028
     * @tc.desc   Test exchange on multiple indexes of Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      ia[2] = 30;

      const old0 = Atomics.exchange(ia, 0, 100);
      const old1 = Atomics.exchange(ia, 1, 200);
      const old2 = Atomics.exchange(ia, 2, 300);

      expect(old0).assertEqual(10);
      expect(old1).assertEqual(20);
      expect(old2).assertEqual(30);
      expect(ia[0]).assertEqual(100);
      expect(ia[1]).assertEqual(200);
      expect(ia[2]).assertEqual(300);
    });

    /**
     * @tc.name   atomicsExchangeTest029
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_029
     * @tc.desc   Test exchange on Uint8Array with mid-range value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 128;
      const oldValue = Atomics.exchange(ua, 0, 64);
      expect(oldValue).assertEqual(128);
      expect(ua[0]).assertEqual(64);
    });

    /**
     * @tc.name   atomicsExchangeTest030
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_030
     * @tc.desc   Test exchange on Int8Array with mid-range negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -64;
      const oldValue = Atomics.exchange(ia, 0, 64);
      expect(oldValue).assertEqual(-64);
      expect(ia[0]).assertEqual(64);
    });
    /**
     * @tc.name   atomicsExchangeTest031
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_031
     * @tc.desc   Test exchange with zero index and zero initial value in Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab); // Initial value is 0 by default
      const oldValue = Atomics.exchange(ua, 0, 1000000);
      expect(oldValue).assertEqual(0);
      expect(ua[0]).assertEqual(1000000);
    });

    /**
     * @tc.name   atomicsExchangeTest032
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_032
     * @tc.desc   Test throw TypeError when SharedArrayBuffer is detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10; // Total resources

      // Allocate 3 resources (atomic exchange + sub)
      const currentResources = Atomics.exchange(ia, 0, Atomics.load(ia, 0) - 3);
      const remaining = Atomics.load(ia, 0);

      expect(currentResources).assertEqual(10);
      expect(remaining).assertEqual(7);
      // Revert allocation
      Atomics.add(ia, 0, 3);
      expect(Atomics.load(ia, 0)).assertEqual(10);
    });

    /**
     * @tc.name   atomicsExchangeTest033
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_033
     * @tc.desc   Test exchange with maximum Uint8 value (255) to minimum (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 255;
      const oldValue = Atomics.exchange(ua, 0, 0);
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest034
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_034
     * @tc.desc   Test exchange with minimum Int8 value (-128) to maximum (127)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -128;
      const oldValue = Atomics.exchange(ia, 0, 127);
      expect(oldValue).assertEqual(-128);
      expect(ia[0]).assertEqual(127);
    });

    /**
     * @tc.name   atomicsExchangeTest035
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_035
     * @tc.desc   Test throw RangeError with index equal to typed array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      const length = ia.length; // Length is 2
      try {
        Atomics.exchange(ia, length, 5)
      } catch (e) {
        expect(e.message).assertContain('Index is overflow');
      }
    });

    /**
     * @tc.name   atomicsExchangeTest036
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_036
     * @tc.desc   Test exchange on BigInt64Array with large negative BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = -9223372036854775807n; // Min BigInt64 value
      const oldValue = Atomics.exchange(ba, 0, -1000000000000000n);
      expect(oldValue).assertEqual(-9223372036854775807n);
      expect(ba[0]).assertEqual(-1000000000000000n);
    });

    /**
     * @tc.name   atomicsExchangeTest037
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_037
     * @tc.desc   Test exchange on BigUint64Array with large positive BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const bua = new BigUint64Array(sab);
      bua[0] = 9223372036854775808n; // Mid BigUint64 value
      const oldValue = Atomics.exchange(bua, 0, 1000000000000000n);
      expect(oldValue).assertEqual(9223372036854775808n);
      expect(bua[0]).assertEqual(1000000000000000n);
    });

    /**
     * @tc.name   atomicsExchangeTest038
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_038
     * @tc.desc   Test exchange with non-integer new value (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      try {
        Atomics.exchange(ia, 0, 15.5)
      } catch (e) {
        expect(e.message).assertContain(10);
      }
    });

    /**
     * @tc.name   atomicsExchangeTest039
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_039
     * @tc.desc   Test exchange on Int16Array with small positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = 50;
      const oldValue = Atomics.exchange(ia, 0, 100);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsExchangeTest040
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_040
     * @tc.desc   Test exchange on Uint16Array with small positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 500;
      const oldValue = Atomics.exchange(ua, 0, 1000);
      expect(oldValue).assertEqual(500);
      expect(ua[0]).assertEqual(1000);
    });

    /**
     * @tc.name   atomicsExchangeTest041
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_041
     * @tc.desc   Test throw TypeError with non-shared typed array from ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(4);
      const ia = new Int32Array(ab);
      try {
        Atomics.exchange(ia, 0, 5)
      } catch (e) {
        expect(e.message).assertContain(10);
      }
    });

    /**
     * @tc.name   atomicsExchangeTest042
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_042
     * @tc.desc   Test exchange on Int32Array with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 1;
      const oldValue = Atomics.exchange(ia, 0, 2);
      expect(oldValue).assertEqual(1);
      expect(ia[0]).assertEqual(2);
    });

    /**
     * @tc.name   atomicsExchangeTest043
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_043
     * @tc.desc   Test exchange on Uint32Array with value 4294967294 (max-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      const value = 4294967294; // Uint32 max is 4294967295
      ua[0] = value;
      const oldValue = Atomics.exchange(ua, 0, 0);
      expect(oldValue).assertEqual(value);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsExchangeTest044
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_044
     * @tc.desc   Test exchange on BigInt64Array with zero BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ba = new BigInt64Array(sab);
      ba[0] = 0n;
      const oldValue = Atomics.exchange(ba, 0, 123456789n);
      expect(oldValue).assertEqual(0n);
      expect(ba[0]).assertEqual(123456789n);
    });

    /**
     * @tc.name   atomicsExchangeTest045
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_045
     * @tc.desc   Test exchange on BigUint64Array with zero BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const bua = new BigUint64Array(sab);
      bua[0] = 0n;
      const oldValue = Atomics.exchange(bua, 0, 987654321n);
      expect(oldValue).assertEqual(0n);
      expect(bua[0]).assertEqual(987654321n);
    });

    /**
     * @tc.name   atomicsExchangeTest046
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_046
     * @tc.desc   Test throw TypeError when index is non-integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsExchangeTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.exchange(ia, 0.5, 5)
      } catch (e) {
        expect(e.message).assertContain(10);
      }
    });

    /**
     * @tc.name   atomicsExchangeTest047
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_047
     * @tc.desc   Test exchange on Int8Array with value -1 (minimum negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -1;
      const oldValue = Atomics.exchange(ia, 0, -2);
      expect(oldValue).assertEqual(-1);
      expect(ia[0]).assertEqual(-2);
    });

    /**
     * @tc.name   atomicsExchangeTest048
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_048
     * @tc.desc   Test exchange on Uint8Array with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 1;
      const oldValue = Atomics.exchange(ua, 0, 2);
      expect(oldValue).assertEqual(1);
      expect(ua[0]).assertEqual(2);
    });

    /**
     * @tc.name   atomicsExchangeTest049
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_049
     * @tc.desc   Test exchange on Int32Array with value -1 (minimum negative)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -1;
      const oldValue = Atomics.exchange(ia, 0, -2);
      expect(oldValue).assertEqual(-1);
      expect(ia[0]).assertEqual(-2);
    });

    /**
     * @tc.name   atomicsExchangeTest050
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_050
     * @tc.desc   Test exchange on Uint32Array with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsExchangeTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 1;
      const oldValue = Atomics.exchange(ua, 0, 100);
      expect(oldValue).assertEqual(1);
      expect(ua[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsExchangeTest051
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_051
     * @tc.desc   Test async exchange with Promise.race between two updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let winner: string = '';

      // Task 1: Exchange to 20
      const task1 = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 0, 20);
          winner = 'task1';
          resolve();
        }, 5);
      });

      // Task 2: Exchange to 30 (same initial value)
      const task2 = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 0, 30);
          winner = 'task2';
          resolve();
        }, 5);
      });

      // Race tasks and wait for completion
      await Promise.race([task1, task2]);
      await Promise.all([task1, task2]);

      expect(['task1', 'task2'].includes(winner)).assertTrue();
      expect([20, 30].includes(ia[0])).assertTrue(); // Matches winning task's value
    });

    /**
     * @tc.name   atomicsExchangeTest052
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_052
     * @tc.desc   Test nested async exchange with retry logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const target = 3;
      let retryCount = 0;

      // Nested async retry function
      const retryExchange = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(async () => {
            const current = ia[0];
            if (current >= target) {
              resolve(true);
              return;
            }
            Atomics.exchange(ia, 0, current + 1);
            retryCount++;
            // Recursive retry
            resolve(await retryExchange());
          }, 30);
        });
      };

      // Simulate competing update to trigger retries
      const competingTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 0, 1); // Reset to cause retry
          resolve();
        }, 80);
      });

      const isComplete = await Promise.all([retryExchange(), competingTask]);
      expect(isComplete[0]).assertEqual(true);
      expect(ia[0]).assertEqual(target);
      expect(retryCount).assertLargerOrEqual(target); // Retries occurred
    });

    /**
     * @tc.name   atomicsExchangeTest053
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_053
     * @tc.desc   Test async exchange with Promise.all for batch updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;

      // Async exchange function for single index
      const batchExchange = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.exchange(ia, index, newValue);
            resolve(oldValue);
          }, 4);
        });
      };

      // Run batch updates in parallel
      const old = await Promise.all([
        batchExchange(0, 10),
        batchExchange(1, 20)
      ]);

      expect(old[0]).assertEqual(5);
      expect(old[1]).assertEqual(15);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsExchangeTest054
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_054
     * @tc.desc   Test exchange in async generator with sequential updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const oldValues: number[] = await atomicsExchangeTest054();

      expect(oldValues).assertDeepEquals([10, 20, 30]);
    });

    /**
     * @tc.name   atomicsExchangeTest055
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_055
     * @tc.desc   Test nested exchange with async error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      let errorCaught = false;

      // Inner exchange function with error check
      const safeExchange = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            try {
              if (index < 0 || index >= ia.length) {
                throw new RangeError('Invalid index');
              }
              const old = Atomics.exchange(ia, index, newValue);
              resolve(old);
            } catch (err) {
              errorCaught = true;
              reject(err);
            }
          }, 5);
        });
      };

      // Outer async function
      const runExchange = async (): Promise<boolean> => {
        try {
          await safeExchange(0, 10); // Valid
          await safeExchange(1, 15); // Invalid index
          return true;
        } catch (err) {
          expect((err as RangeError).message).assertEqual('Invalid index');
          return false;
        }
      };

      const success = await runExchange();
      expect(success).assertEqual(false);
      expect(errorCaught).assertEqual(true);
      expect(ia[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsExchangeTest056
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_056
     * @tc.desc   Test async exchange with timeout fallback using Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8;
      let timeoutTriggered = false;

      // Slow exchange task (delayed to trigger timeout)
      const exchangeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.exchange(ia, 0, 18);
          resolve(old);
        }, 20);
      });

      // Timeout task
      const timeoutTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          timeoutTriggered = true;
          resolve(-1); // Fallback value
        }, 10);
      });

      // Race exchange and timeout
      const result = await Promise.race([exchangeTask, timeoutTask]);
      expect(timeoutTriggered).assertEqual(true);
      expect(result).assertEqual(-1);
      expect(ia[0]).assertEqual(8); // No exchange (timeout won)
    });

    /**
     * @tc.name   atomicsExchangeTest057
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_057
     * @tc.desc   Test exchange in async class with nested methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class AtomicUpdater {
        private ia: Int32Array;

        constructor(sab: SharedArrayBuffer) {
          this.ia = new Int32Array(sab);
        }

        // Nested async method: exchange + verification
        async updateAndVerify(index: number, newValue: number): Promise<boolean> {
          const oldValue = await this._exchange(index, newValue);
          return this._verify(index, newValue);
        }

        // Private exchange method
        private async _exchange(index: number, newValue: number): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(this.ia, index, newValue);
              resolve(old);
            }, 3);
          });
        }

        // Private verification method
        private async _verify(index: number, expected: number): Promise<boolean> {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              resolve(this.ia[index] === expected);
            }, 2);
          });
        }

        public getIa() {
          return this.ia
        }
      }

      const sab = new SharedArrayBuffer(4);
      const updater = new AtomicUpdater(sab);
      updater.updateAndVerify(0, 5); // Initial setup

      const isVerified = await updater.updateAndVerify(0, 15);
      expect(isVerified).assertEqual(true);
      expect(updater.getIa()[0]).assertEqual(15); // Access private for test
    });

    /**
     * @tc.name   atomicsExchangeTest058
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_058
     * @tc.desc   Test async exchange with Promise.allSettled for partial success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;

      // Async exchange function (may throw)
      const partialExchange = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (index === 1) {
              reject(new Error('Index 1 blocked'));
              return;
            }
            const old = Atomics.exchange(ia, index, newValue);
            resolve(old);
          }, 4);
        });
      };

      // Run partial exchanges
      const results = await Promise.allSettled([
        partialExchange(0, 10), // Success
        partialExchange(1, 20)// Failure
      ]);

      // Verify results
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Index 1 blocked');
      expect(ia[0]).assertEqual(10); // Updated
      expect(ia[1]).assertEqual(15); // Not updated
    });

    /**
     * @tc.name   atomicsExchangeTest059
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_059
     * @tc.desc   Test nested exchange with async state synchronization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (state + data)
      const ia = new Int32Array(sab);
      ia[0] = 0; // State: 0=idle, 1=ready
      ia[1] = 10; // Data

      // Sync state first, then exchange data
      const syncAndExchange = async (newData: number): Promise<number> => {
        // Step 1: Wait for state to be ready
        const waitForState = new Promise<void>((resolve) => {
          const checkState = () => {
            if (ia[0] === 1) {
              resolve();
            } else {
              setTimeout(checkState, 2);
            }
          };
          checkState();
        });

        await waitForState;
        // Step 2: Exchange data
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.exchange(ia, 1, newData);
            resolve(old);
          }, 3);
        });
      };

      // Simulate state change
      const setStateReady = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 0, 1);
          resolve();
        }, 5);
      });

      // Run sync and exchange
      const oldData = await Promise.all([syncAndExchange(20), setStateReady]);
      expect(oldData[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
      expect(ia[0]).assertEqual(1);
    });


    /**
     * @tc.name   atomicsExchangeTest060
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_060
     * @tc.desc   Test async exchange with closure capturing context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Factory function: creates closure with captured step size
      const createExchangeClosure = (step: number) => {
        return async (): Promise<number> => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const current = ia[0];
              const old = Atomics.exchange(ia, 0, current + step);
              resolve(old);
            }, 3);
          });
        };
      };

      // Create closures with different step sizes
      const step2Exchange = createExchangeClosure(2);
      const step3Exchange = createExchangeClosure(3);

      // Execute exchanges via closures
      await step2Exchange(); // 0 → 2
      await step3Exchange(); // 2 → 5
      const lastOldValue = await step2Exchange(); // 5 → 7

      expect(lastOldValue).assertEqual(5);
      expect(ia[0]).assertEqual(7);
    });

    /**
     * @tc.name   atomicsExchangeTest061
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_061
     * @tc.desc   Test nested async exchange with retry limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const maxRetries = 2;
      let retryCount = 0;

      // Nested exchange with retry limit
      const exchangeWithRetryLimit = async (target: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = async () => {
            retryCount++;
            const current = ia[0];
            if (current === target) {
              resolve(true);
              return;
            }
            Atomics.exchange(ia, 0, current + 1);

            if (retryCount >= maxRetries) {
              resolve(false); // Hit retry limit
              return;
            }
            setTimeout(attempt, 3); // Retry
          };
          attempt();
        });
      };

      // Run with target beyond retry limit
      const success = await exchangeWithRetryLimit(15);
      expect(success).assertEqual(false);
      expect(retryCount).assertEqual(maxRetries);
      expect(ia[0]).assertEqual(12); // 10 + 2 retries = 12
    });

    /**
     * @tc.name   atomicsExchangeTest062
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_062
     * @tc.desc   Test async exchange with Promise chaining for sequential updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;

      // First exchange (index 0)
      const firstExchange = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.exchange(ia, 0, 10);
          resolve(old);
        }, 3);
      });

      // Chain to second exchange (index 1) after first completes
      const finalOldValue = await firstExchange
        .then((old0) => {
          expect(old0).assertEqual(5);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old1 = Atomics.exchange(ia, 1, 20);
              resolve(old1);
            }, 4);
          });
        });

      expect(finalOldValue).assertEqual(15);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsExchangeTest063
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_063
     * @tc.desc   Test exchange in async iterator with dynamic value generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Consume iterator (3 dynamic updates)
      const oldValues: number[] = await atomicsExchangeTest063();

      expect(oldValues).assertDeepEquals([0, 0, 0]); // 0→0, 0→2, 2→4
    });

    /**
     * @tc.name   atomicsExchangeTest064
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_064
     * @tc.desc   Test async exchange with cross-index dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (A: trigger, B: data)
      const ia = new Int32Array(sab);
      ia[0] = 0; // Trigger (0: not ready, 1: ready)
      ia[1] = 10; // Data

      // Update B only if A is ready (cross-index dependency)
      const dependentExchange = async (newB: number): Promise<number> => {
        // Wait for trigger A to be ready
        const waitForTrigger = new Promise<void>((resolve) => {
          const checkTrigger = () => {
            if (ia[0] === 1) {
              resolve();
            } else {
              setTimeout(checkTrigger, 2);
            }
          };
          checkTrigger();
        });

        await waitForTrigger;
        // Exchange B once triggered
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldB = Atomics.exchange(ia, 1, newB);
            resolve(oldB);
          }, 3);
        });
      };

      // Simulate trigger activation
      const activateTrigger = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 0, 1);
          resolve();
        }, 5);
      });

      // Run dependent exchange
      const oldB = await Promise.all([dependentExchange(20), activateTrigger]);
      expect(oldB[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
      expect(ia[0]).assertEqual(1);
    });

    /**
     * @tc.name   atomicsExchangeTest065
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_065
     * @tc.desc   Test nested exchange with async finally for cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (data + cleanup flag)
      const ia = new Int32Array(sab);
      ia[0] = 15; // Data
      ia[1] = 0; // Cleanup flag (0: not done, 1: done)
      let cleanupRan = false;

      // Nested exchange with finally cleanup
      const exchangeWithCleanup = async (newData: number): Promise<number> => {
        let oldData = -1;
        try {
          oldData = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(ia, 0, newData);
              resolve(old);
            }, 4);
          });
          return oldData;
        } finally {
          // Async cleanup (runs regardless of success)
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 1, 1);
              cleanupRan = true;
              resolve();
            }, 2);
          });
        }
      };

      // Test successful exchange
      const oldData = await exchangeWithCleanup(25);
      // Test exchange with intentional error
      try {
        await exchangeWithCleanup(NaN); // Force invalid value
      } catch (err) {
      }

      expect(oldData).assertEqual(15);
      expect(ia[0]).assertEqual(0);
      expect(ia[1]).assertEqual(1);
      expect(cleanupRan).assertEqual(true); // Cleanup ran twice
    });

    /**
     * @tc.name   atomicsExchangeTest066
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_066
     * @tc.desc   Test async exchange with Promise.race between update and cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8;
      let cancelled = false;

      // Exchange task
      const exchangeTask = new Promise<number>((resolve) => {
        const attempt = () => {
          if (cancelled) {
            resolve(-1);
            return;
          }
          const old = Atomics.exchange(ia, 0, 18);
          resolve(old);
        };
        setTimeout(attempt, 10);
      });

      // Cancel task
      const cancelTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          cancelled = true;
          resolve();
        }, 5);
      });

      // Race exchange and cancel
      const result = await Promise.race([exchangeTask, cancelTask.then(() => -1)]);
      expect(cancelled).assertEqual(true);
      expect(result).assertEqual(-1);
      expect(ia[0]).assertEqual(8); // No exchange (cancelled)
    });

    /**
     * @tc.name   atomicsExchangeTest067
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_067
     * @tc.desc   Test exchange in async subclass with inherited method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      // Base class with atomic exchange
      class BaseAtomic {
        protected ia: Int32Array;

        constructor(sab: SharedArrayBuffer) {
          this.ia = new Int32Array(sab);
        }

        protected async _exchange(index: number, newValue: number): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(this.ia, index, newValue);
              resolve(old);
            }, 3);
          });
        }
      }

      // Subclass with specific update logic
      class AtomicDataUpdater extends BaseAtomic {
        async updateData(newValue: number): Promise<boolean> {
          const old = await this._exchange(0, newValue);
          return old !== newValue; // Verify value changed
        }

        getData(): number {
          return this.ia[0];
        }
      }

      const sab = new SharedArrayBuffer(4);
      const updater = new AtomicDataUpdater(sab);
      updater.updateData(10); // Initial setup

      const isUpdated = await updater.updateData(20);
      expect(isUpdated).assertEqual(true);
      expect(updater.getData()).assertEqual(20);
    });

    /**
     * @tc.name   atomicsExchangeTest068
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_068
     * @tc.desc   Test async exchange with dynamic index from Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;
      ia[2] = 25;

      // Promise that resolves to dynamic target index
      const getTargetIndex = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          // Simulate async index selection (choose index 1)
          setTimeout(() => resolve(1), 4);
        });
      };

      // Exchange using dynamic index
      const dynamicIndexExchange = async (newValue: number): Promise<number> => {
        const index = await getTargetIndex();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.exchange(ia, index, newValue);
            resolve(old);
          }, 3);
        });
      };

      const oldValue = await dynamicIndexExchange(30);
      expect(oldValue).assertEqual(15);
      expect(ia[1]).assertEqual(30); // Index 1 updated
      expect(ia[0]).assertEqual(5); // Index 0 unchanged
      expect(ia[2]).assertEqual(25); // Index 2 unchanged
    });

    /**
     * @tc.name   atomicsExchangeTest069
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_069
     * @tc.desc   Test nested exchange with async validation of new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let validationPassed = false;

      // Async validation: new value must be even
      const validateNewValue = async (newValue: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const valid = newValue % 2 === 0;
            validationPassed = valid;
            resolve(valid);
          }, 3);
        });
      };

      // Nested: validate → exchange
      const validatedExchange = async (newValue: number): Promise<boolean> => {
        const isValid = await validateNewValue(newValue);
        if (!isValid) {
          return false;
        }

        const old = await new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(Atomics.exchange(ia, 0, newValue));
          }, 2);
        });

        return old !== newValue;
      };

      // Test valid exchange (even value)
      const success1 = await validatedExchange(20);
      // Test invalid exchange (odd value)
      const success2 = await validatedExchange(21);

      expect(validationPassed).assertEqual(false); // Second validation fails
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(20); // Only first exchange succeeds
    });

    /**
     * @tc.name   atomicsExchangeTest070
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_070
     * @tc.desc   Test async exchange with nested error propagation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      let errorPropagated = false;

      // Inner function that may throw
      const innerExchange = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (newValue < 0) {
              reject(new Error('Negative value not allowed'));
              return;
            }
            const old = Atomics.exchange(ia, index, newValue);
            resolve(old);
          }, 3);
        });
      };

      // Outer function that propagates error
      const outerExchange = async (): Promise<boolean> => {
        try {
          await innerExchange(0, 10); // Valid
          await innerExchange(0, -5); // Invalid (throws)
          return true;
        } catch (err) {
          errorPropagated = true;
          expect((err as Error).message).assertEqual('Negative value not allowed');
          return false;
        }
      };

      const success = await outerExchange();
      expect(success).assertEqual(false);
      expect(errorPropagated).assertEqual(true);
      expect(ia[0]).assertEqual(10); // First exchange persists
    });

    /**
     * @tc.name   atomicsExchangeTest071
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_071
     * @tc.desc   Test exchange in async closure with state persistence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Closure factory: persists target value
      const createTargetedExchange = (target: number) => {
        let currentStep = 0;
        // Closure captures target and currentStep
        return async (): Promise<boolean> => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              currentStep++;
              const old = Atomics.exchange(ia, 0, currentStep);
              const reachedTarget = currentStep === target;
              resolve(reachedTarget);
            }, 3);
          });
        };
      };

      // Create closure with target 4
      const reachTarget4 = createTargetedExchange(4);
      let isReached = false;

      // Run until target is reached
      while (!isReached) {
        isReached = await reachTarget4();
      }

      expect(isReached).assertEqual(true);
      expect(ia[0]).assertEqual(4);
    });

    /**
     * @tc.name   atomicsExchangeTest072
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_072
     * @tc.desc   Test async exchange with Promise.all and cross-index consistency check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (A and B)
      const ia = new Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      let isConsistent = false;

      // Exchange both indexes in parallel, check consistency
      const parallelExchange = async (newA: number, newB: number): Promise<boolean> => {
        // Run exchanges in parallel
        const old = await Promise.all([
          new Promise<number>((resolve) => {
            setTimeout(() => resolve(Atomics.exchange(ia, 0, newA)), 3);
          }),
          new Promise<number>((resolve) => {
            setTimeout(() => resolve(Atomics.exchange(ia, 1, newB)), 3);
          })
        ]);

        // Check if both exchanges used correct old values (consistency)
        isConsistent = old[0] === 10 && old[1] === 20;
        return isConsistent;
      };

      // First consistent exchange
      const success1 = await parallelExchange(15, 25);
      // Second inconsistent exchange (old values changed)
      const success2 = await parallelExchange(20, 30);

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(isConsistent).assertEqual(false);
      expect(ia[0]).assertEqual(20);
      expect(ia[1]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsExchangeTest073
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_073
     * @tc.desc   Test nested exchange with async retry and error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      const maxRetries = 3;
      let retryCount = 0;

      // Nested: retry on error + recovery
      const retryWithRecovery = async (newValue: number): Promise<number> => {
        if (retryCount >= maxRetries) {
          // Recovery: reset to initial value
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 0, 5);
              resolve();
            }, 2);
          });
          throw new Error('Max retries reached');
        }

        return new Promise<number>((resolve, reject) => {
          setTimeout(async () => {
            retryCount++;
            try {
              if (newValue === 15) {
                throw new Error('Temporary block on 15'); // Simulate error
              }
              const old = Atomics.exchange(ia, 0, newValue);
              resolve(old);
            } catch (err) {
              // Retry with adjusted value
              resolve(await retryWithRecovery(newValue + 1));
            }
          }, 3);
        });
      };

      // Test with value that triggers error
      const oldValue = await retryWithRecovery(15);
      expect(retryCount).assertLarger(0); // Retries occurred
      expect(oldValue).assertEqual(5);
      expect(ia[0]).assertEqual(16); // Recovered to 16 (15+1)
    });

    /**
     * @tc.name   atomicsExchangeTest074
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_074
     * @tc.desc   Test async exchange with Promise.race between two competing closures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let winner: string = '';

      // Closure 1: exchanges to 20
      const exchangeTo20 = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, 20);
            winner = 'closure1';
            resolve();
          }, 5);
        });
      };

      // Closure 2: exchanges to 30
      const exchangeTo30 = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, 30);
            winner = 'closure2';
            resolve();
          }, 5);
        });
      };

      // Race closures
      await Promise.race([exchangeTo20(), exchangeTo30()]);
      expect(['closure1', 'closure2'].includes(winner)).assertTrue()
      expect([20, 30].includes(ia[0])).assertTrue(); // Matches winner's value
    });

    /**
     * @tc.name   atomicsExchangeTest075
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_075
     * @tc.desc   Test exchange in async class with multiple instances and shared buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class SharedAtomic {
        private ia: Int32Array;
        private index: number;

        constructor(sab: SharedArrayBuffer, index: number) {
          this.ia = new Int32Array(sab);
          this.index = index;
        }

        // Async exchange method
        async setValue(newValue: number): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(this.ia, this.index, newValue);
              resolve(old);
            }, 3);
          });
        }

        getValue(): number {
          return this.ia[this.index];
        }
      }

      // Shared buffer with 2 indexes
      const sab = new SharedArrayBuffer(8);
      const instance1 = new SharedAtomic(sab, 0);
      const instance2 = new SharedAtomic(sab, 1);

      // Initialize values
      await instance1.setValue(5);
      await instance2.setValue(15);

      // Cross-instance exchange
      const old1 = await instance1.setValue(10);
      const old2 = await instance2.setValue(20);

      expect(old1).assertEqual(5);
      expect(old2).assertEqual(15);
      expect(instance1.getValue()).assertEqual(10);
      expect(instance2.getValue()).assertEqual(20);
    });

    /**
     * @tc.name   atomicsExchangeTest076
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_076
     * @tc.desc   Test nested async exchange with dynamic newValue from external API mock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Mock external API: returns dynamic newValue
      const mockApi = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          // Simulate API delay and dynamic response
          setTimeout(() => resolve(Math.floor(Math.random() * 100) + 10), 4);
        });
      };

      // Nested: fetch from API → exchange
      const apiDrivenExchange = async (): Promise<number> => {
        const newValue = await mockApi(); // Fetch dynamic value
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.exchange(ia, 0, newValue);
            resolve(old);
          }, 3);
        });
      };

      const oldValue = await apiDrivenExchange();
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertLargerOrEqual(10); // Matches API mock range
      expect(ia[0]).assertLessOrEqual(109);
    });

    /**
     * @tc.name   atomicsExchangeTest077
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_077
     * @tc.desc   Test async exchange with finally block for state reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const initialValue = 5;
      ia[0] = initialValue;
      let resetDone = false;

      // Exchange with finally reset
      const exchangeAndReset = async (tempValue: number): Promise<number> => {
        let oldValue = -1;
        try {
          oldValue = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(ia, 0, tempValue);
              resolve(old);
            }, 3);
          });
          // Simulate work with temp value
          await new Promise<void>((resolve) => setTimeout(resolve, 2));
          return oldValue;
        } finally {
          // Reset to initial value in finally
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 0, initialValue);
              resetDone = true;
              resolve();
            }, 1);
          });
        }
      };

      const oldValue = await exchangeAndReset(15);
      expect(oldValue).assertEqual(initialValue);
      expect(resetDone).assertEqual(true);
      expect(ia[0]).assertEqual(initialValue); // Reset successful
    });

    /**
     * @tc.name   atomicsExchangeTest078
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_078
     * @tc.desc   Test exchange in async iterator with error handling per iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const oldValues: number[] = await atomicsExchangeTest078();

      expect(oldValues).assertDeepEquals([10, 15, 25]); // Valid exchanges
    });

    /**
     * @tc.name   atomicsExchangeTest079
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_079
     * @tc.desc   Test async exchange with nested lock/unlock using atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32: [lock, data]
      const ia = new Int32Array(sab);
      ia[0] = 0; // Lock: 0=idle, 1=held
      ia[1] = 5; // Data

      // Acquire lock (atomic exchange)
      const acquireLock = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = () => {
            const oldLock = Atomics.exchange(ia, 0, 1);
            resolve(oldLock === 0); // Success if lock was idle
          };
          setTimeout(attempt, 2);
        });
      };

      // Release lock (atomic exchange)
      const releaseLock = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, 0);
            resolve();
          }, 2);
        });
      };

      // Nested: lock → exchange data → unlock
      const lockedExchange = async (newData: number): Promise<number> => {
        const hasLock = await acquireLock();
        if (!hasLock) {
          throw new Error('Lock acquisition failed');
        }

        try {
          // Exchange data while locked
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const oldData = Atomics.exchange(ia, 1, newData);
              resolve(oldData);
            }, 3);
          });
        } finally {
          await releaseLock(); // Ensure unlock even if error
        }
      };

      // Run locked exchange
      const oldData = await lockedExchange(15);
      expect(oldData).assertEqual(5);
      expect(ia[1]).assertEqual(15);
      expect(ia[0]).assertEqual(0); // Lock released
    });

    /**
     * @tc.name   atomicsExchangeTest080
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_080
     * @tc.desc   Test exchange with async batch validation and partial rollback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32: [A, B, C]
      const ia = new Int32Array(sab);
      ia[0] = 10; // A
      ia[1] = 20; // B
      ia[2] = 30; // C
      const initialValues = [...ia]; // Save initial state
      let rolledBack = false;

      // Async batch validation: all new values must be > initial
      const validateBatch = async (newValues: number[]): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const valid = newValues.every((val, i) => val > initialValues[i]);
            resolve(valid);
          }, 3);
        });
      };

      // Batch exchange with partial rollback on failure
      const batchExchange = async (newValues: number[]): Promise<boolean> => {
        const isValid = await validateBatch(newValues);
        if (!isValid) {
          return false;
        }

        // Track updated indexes for rollback
        const updatedIndexes: number[] = [];
        try {
          // Exchange each index sequentially
          for (let i = 0; i < newValues.length; i++) {
            await new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, i, newValues[i]);
                updatedIndexes.push(i);
                resolve();
              }, 2);
            });
            // Simulate failure after updating index 1
            if (i === 1 && newValues[2] < initialValues[2]) {
              throw new Error('Invalid value at index 2');
            }
          }
          return true;
        } catch (err) {
          // Rollback updated indexes
          await Promise.all(updatedIndexes.map((i) => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, i, initialValues[i]);
                resolve();
              }, 1);
            });
          }));
          rolledBack = true;
          return false;
        }
      };

      // Test invalid batch (C < initial)
      const success = await batchExchange([15, 25, 28]);
      expect(success).assertEqual(false);
      expect(rolledBack).assertEqual(false);
      expect(ia).assertDeepEquals(new Int32Array(initialValues)); // All rolled back
    });

    /**
     * @tc.name   atomicsExchangeTest081
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_081
     * @tc.desc   Test async exchange with closure that captures validation rules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Closure factory: captures min/max validation rules
      const createValidatedExchange = (min: number, max: number) => {
        // Closure captures min and max
        return async (newValue: number): Promise<type63> => {
          return new Promise<type63>((resolve) => {
            setTimeout(() => {
              const old = ia[0];
              if (newValue < min || newValue > max) {
                resolve({ old, success: false }); // Invalid: no exchange
                return;
              }
              Atomics.exchange(ia, 0, newValue);
              resolve({ old, success: true });
            }, 3);
          });
        };
      };

      // Create closure with 0-100 range
      const exchangeInRange = createValidatedExchange(0, 100);

      // Test valid and invalid values
      const res1 = await exchangeInRange(50); // Valid
      const res2 = await exchangeInRange(150); // Invalid
      const res3 = await exchangeInRange(75); // Valid

      expect(res1.success).assertEqual(true);
      expect(res1.old).assertEqual(0);
      expect(res2.success).assertEqual(false);
      expect(res2.old).assertEqual(50);
      expect(res3.success).assertEqual(true);
      expect(res3.old).assertEqual(50);
      expect(ia[0]).assertEqual(75);
    });

    /**
     * @tc.name   atomicsExchangeTest082
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_082
     * @tc.desc   Test nested async exchange with Promise.race for timeout and cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let timeoutHit = false;
      let cancelled = false;

      // Exchange task with delay
      const exchangeTask = new Promise<number>((resolve) => {
        const attempt = () => {
          if (cancelled || timeoutHit) {
            resolve(-1);
            return;
          }
          setTimeout(() => {
            const old = Atomics.exchange(ia, 0, 20);
            resolve(old);
          }, 15);
        };
        attempt();
      });

      // Timeout task
      const timeoutTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          timeoutHit = true;
          resolve();
        }, 10);
      });

      // Cancel task (triggered after timeout)
      const cancelTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          cancelled = true;
          resolve();
        }, 12);
      });

      // Race all three: exchange, timeout, cancel
      const result = await Promise.race([
        exchangeTask,
        timeoutTask.then(() => -1),
        cancelTask.then(() => -1)
      ]);

      expect(timeoutHit).assertEqual(true);
      expect(cancelled).assertEqual(false);
      expect(result).assertEqual(-1);
      expect(ia[0]).assertEqual(10); // No exchange
    });

    /**
     * @tc.name   atomicsExchangeTest083
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_083
     * @tc.desc   Test exchange in async subclass with overridden validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      // Base class with exchange logic
      abstract class BaseValidator {
        protected ia: Int32Array;

        constructor(sab: SharedArrayBuffer) {
          this.ia = new Int32Array(sab);
        }

        // Abstract validation (to be overridden)
        protected abstract validate(newValue: number): Promise<boolean>;

        // Common exchange logic
        async update(newValue: number): Promise<boolean> {
          const isValid = await this.validate(newValue);
          if (!isValid) {
            return false;
          }

          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(this.ia, 0, newValue);
              resolve(true);
            }, 3);
          });
        }

        getValue(): number {
          return this.ia[0];
        }
      }

      // Subclass: validates even values
      class EvenValidator extends BaseValidator {
        protected async validate(newValue: number): Promise<boolean> {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => resolve(newValue % 2 === 0), 2);
          });
        }
      }

      const sab = new SharedArrayBuffer(4);
      const validator = new EvenValidator(sab);

      // Test valid (even) and invalid (odd) values
      const success1 = await validator.update(10);
      const success2 = await validator.update(11);
      const success3 = await validator.update(12);

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(success3).assertEqual(true);
      expect(validator.getValue()).assertEqual(12);
    });

    /**
     * @tc.name   atomicsExchangeTest084
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_084
     * @tc.desc   Test async exchange with Promise.allSettled and error logging
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32: [A, B, C]
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 15;
      ia[2] = 25;
      const errorLogs: string[] = [];

      // Async exchange function (may throw)
      const exchangeWithError = async (index: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            if (index === 1) {
              const errMsg = `Index 1 update failed`;
              errorLogs.push(errMsg);
              reject(new Error(errMsg));
              return;
            }
            const old = Atomics.exchange(ia, index, newValue);
            resolve(old);
          }, 3);
        });
      };

      // Run multiple exchanges with Promise.allSettled
      const results = await Promise.allSettled([
        exchangeWithError(0, 10), // Success
        exchangeWithError(1, 20), // Failure
        exchangeWithError(2, 30)// Success
      ]);

      // Verify results
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Index 1 update failed');
      expect((results[2] as PromiseFulfilledResult<number>).value).assertEqual(25);
      expect(errorLogs).assertDeepEquals(['Index 1 update failed']);
      expect(ia[0]).assertEqual(10); // Updated
      expect(ia[1]).assertEqual(15); // Not updated
      expect(ia[2]).assertEqual(30); // Updated
    });

    /**
     * @tc.name   atomicsExchangeTest085
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_085
     * @tc.desc   Test nested exchange with async state check before and after
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8;
      let preCheckPassed = false;
      let postCheckPassed = false;

      // Pre-exchange state check
      const preCheck = async (expected: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const passed = ia[0] === expected;
            preCheckPassed = passed;
            resolve(passed);
          }, 2);
        });
      };

      // Post-exchange state check
      const postCheck = async (expected: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const passed = ia[0] === expected;
            postCheckPassed = passed;
            resolve(passed);
          }, 2);
        });
      };

      // Nested: pre-check → exchange → post-check
      const checkAndExchange = async (preVal: number, newVal: number): Promise<boolean> => {
        const prePass = await preCheck(preVal);
        if (!prePass) {
          return false;
        }

        // Exchange
        await new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, newVal);
            resolve();
          }, 3);
        });

        const postPass = await postCheck(newVal);
        return postPass;
      };

      // Test valid flow
      const success1 = await checkAndExchange(8, 18);
      // Test invalid pre-check (mismatched expected value)
      const success2 = await checkAndExchange(8, 28);

      expect(preCheckPassed).assertEqual(false); // Second pre-check fails
      expect(postCheckPassed).assertEqual(true); // First post-check passes
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(18);
    });

    /**
     * @tc.name   atomicsExchangeTest086
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_086
     * @tc.desc   Test async exchange with closure that tracks update history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      interface inter86 {
        exchange: (va:number) => Promise<void>;
        getHistory: () => Array<type86>;
      }

      // Closure factory: tracks update history
      const createTrackedExchange = () => {
        const history: Array<type86> = [];
        // Closure captures history
        return {
          exchange: async (newValue: number): Promise<void> => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                const old1 = ia[0];
                Atomics.exchange(ia, 0, newValue);
                history.push({ old: old1, new: newValue, time: Date.now() });
                resolve();
              }, 3);
            });
          },
          getHistory: (): Array<type86> => history
        } as inter86;
      };

      const trackedExchange = createTrackedExchange();
      // Run multiple exchanges
      await trackedExchange.exchange(10);
      await trackedExchange.exchange(20);
      await trackedExchange.exchange(30);

      const history = trackedExchange.getHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].old).assertEqual(0);
      expect(history[0].new).assertEqual(10);
      expect(history[1].old).assertEqual(10);
      expect(history[1].new).assertEqual(20);
      expect(history[2].old).assertEqual(20);
      expect(history[2].new).assertEqual(30);
      expect(ia[0]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsExchangeTest087
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_087
     * @tc.desc   Test nested async exchange with retry on validation failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      const maxRetries = 2;
      let retryCount = 0;

      // Async validation: new value must be > current value
      const validateIncreasing = async (newValue: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(newValue > ia[0]);
          }, 2);
        });
      };

      // Nested: validate → exchange → retry on failure
      const retryOnValidationFail = async (newValue: number): Promise<boolean> => {
        if (retryCount >= maxRetries) {
          return false;
        }

        const isValid = await validateIncreasing(newValue);
        if (isValid) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 0, newValue);
              resolve();
            }, 3);
          });
          return true;
        }

        retryCount++;
        // Retry with incremented value
        return retryOnValidationFail(newValue + 2);
      };

      // Test with initial invalid value (5 → 4: validation fails)
      const success = await retryOnValidationFail(4);
      expect(success).assertEqual(true);
      expect(retryCount).assertEqual(1); // 1 retry (4→6: valid)
      expect(ia[0]).assertEqual(6);
    });

    /**
     * @tc.name   atomicsExchangeTest088
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_088
     * @tc.desc   Test async exchange with Promise.race between two API-driven values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      // Mock API 1: returns value after 5ms
      const mockApi1 = async (): Promise<number> => {
        return new Promise<number>((resolve) => setTimeout(() => resolve(20), 5));
      };

      // Mock API 2: returns value after 8ms
      const mockApi2 = async (): Promise<number> => {
        return new Promise<number>((resolve) => setTimeout(() => resolve(30), 8));
      };

      // Race API calls and use first value for exchange
      const apiRace = async (): Promise<number> => {
        const apiValue = await Promise.race([mockApi1(), mockApi2()]);
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const old = Atomics.exchange(ia, 0, apiValue);
            resolve(old);
          }, 2);
        });
      };

      const oldValue = await apiRace();
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(20); // API 1 wins (faster)
    });

    /**
     * @tc.name   atomicsExchangeTest089
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_089
     * @tc.desc   Test exchange in async class with static shared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      // Class with static shared SharedArrayBuffer
      class StaticAtomic {
        private static sab = new SharedArrayBuffer(4);
        private static ia = new Int32Array(StaticAtomic.sab);

        // Async exchange method (shares state across instances)
        static async exchange(newValue: number): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(StaticAtomic.ia, 0, newValue);
              resolve(old);
            }, 3);
          });
        }

        static getValue(): number {
          return StaticAtomic.ia[0];
        }
      }

      // Create multiple instances (share static state)
      const instance1 = new StaticAtomic();
      const instance2 = new StaticAtomic();

      // Use different instances to exchange
      const old1 = await StaticAtomic.exchange(15); // Via class
      const old2 = await StaticAtomic.exchange(25); // Via class

      expect(old1).assertEqual(0); // Initial value is 0
      expect(old2).assertEqual(15);
      expect(StaticAtomic.getValue()).assertEqual(25);
    });

    /**
     * @tc.name   atomicsExchangeTest090
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_090
     * @tc.desc   Test nested async exchange with finally for resource release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32: [data, resourceFlag]
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 0; // Resource flag: 0=free, 1=used
      let resourceReleased = false;

      // Acquire resource (set flag to 1)
      const acquireResource = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const old = Atomics.exchange(ia, 1, 1);
            resolve(old === 0);
          }, 2);
        });
      };

      // Release resource (set flag to 0)
      const releaseResource = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 1, 0);
            resourceReleased = true;
            resolve();
          }, 2);
        });
      };

      // Nested: acquire → exchange → release (finally)
      const resourceExchange = async (newData: number): Promise<number> => {
        const hasResource = await acquireResource();
        if (!hasResource) {
          throw new Error('Resource busy');
        }

        let oldData = -1;
        try {
          oldData = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const old = Atomics.exchange(ia, 0, newData);
              resolve(old);
            }, 3);
          });
          return oldData;
        } finally {
          await releaseResource(); // Ensure release even on error
        }
      };

      const oldData = await resourceExchange(15);
      expect(oldData).assertEqual(5);
      expect(resourceReleased).assertEqual(true);
      expect(ia[0]).assertEqual(15);
      expect(ia[1]).assertEqual(0); // Resource released
    });

    /**
     * @tc.name   atomicsExchangeTest091
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_091
     * @tc.desc   Test async exchange with closure that enforces value sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Closure factory: enforces new value > previous value
      const createSequentialExchange = () => {
        let expectedPrev = ia[0];
        // Closure captures expectedPrev
        return async (newValue: number): Promise<boolean> => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              if (newValue <= expectedPrev) {
                resolve(false); // Invalid sequence: no exchange
                return;
              }
              Atomics.exchange(ia, 0, newValue);
              expectedPrev = newValue; // Update expected for next call
              resolve(true);
            }, 3);
          });
        };
      };

      const sequentialExchange = createSequentialExchange();
      // Test valid and invalid sequence
      const success1 = await sequentialExchange(5);
      const success2 = await sequentialExchange(3); // Invalid (3 < 5)
      const success3 = await sequentialExchange(10); // Valid (10 > 5)

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(success3).assertEqual(true);
      expect(ia[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsExchangeTest092
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_092
     * @tc.desc   Test nested exchange with async batch rollback on partial failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32: [A, B]
      const ia = new Int32Array(sab);
      const initialA = 10;
      const initialB = 20;
      ia[0] = initialA;
      ia[1] = initialB;
      let rolledBack = false;

      // Batch exchange with rollback
      const batchWithRollback = async (newA: number, newB: number): Promise<boolean> => {
        const updated: number[] = [];
        try {
          // Update A first
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 0, newA);
              updated.push(0);
              resolve();
            }, 2);
          });

          // Simulate failure before updating B
          if (newB < initialB) {
            throw new Error('B value too small');
          }

          // Update B (only if no failure)
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 1, newB);
              updated.push(1);
              resolve();
            }, 2);
          });
          return true;
        } catch (err) {
          // Rollback updated indexes
          await Promise.all(updated.map((i) => {
            return new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, i, i === 0 ? initialA : initialB);
                resolve();
              }, 1);
            });
          }));
          rolledBack = true;
          return false;
        }
      };

      // Test batch with B failure (triggers rollback)
      const success = await batchWithRollback(15, 18);
      expect(success).assertEqual(false);
      expect(rolledBack).assertEqual(true);
      expect(ia[0]).assertEqual(initialA); // A rolled back
      expect(ia[1]).assertEqual(initialB); // B unchanged
    });

    /**
     * @tc.name   atomicsExchangeTest093
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_093
     * @tc.desc   Test async exchange with Promise.race between exchange and state change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let stateChanged = false;

      // Exchange task: tries to update to 20
      const exchangeTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = Atomics.exchange(ia, 0, 20);
          resolve(oldValue);
        }, 8);
      });

      // State change task: modifies value before exchange completes
      const stateChangeTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 0, 15); // Changes state
          stateChanged = true;
          resolve();
        }, 5);
      });

      // Race exchange and state change
      const oldValue = await Promise.all([exchangeTask, stateChangeTask]);
      expect(stateChanged).assertEqual(true);
      expect(oldValue[0]).assertEqual(15); // Exchange uses modified state
      expect(ia[0]).assertEqual(20); // Exchange completes after state change
    });


    /**
     * @tc.name   atomicsExchangeTest094
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_094
     * @tc.desc   Test async exchange with closure that limits update frequency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const minInterval = 100; // Minimum 10ms between updates
      let lastUpdateTime = 0;

      // Closure factory: enforces update frequency limit
      const createThrottledExchange = () => {
        return async (newValue: number): Promise<type94> => {
          return new Promise<type94>((resolve) => {
            const now = Date.now();
            if (now - lastUpdateTime < minInterval) {
              resolve({ success: false, reason: 'Too frequent' });
              return;
            }

            setTimeout(() => {
              Atomics.exchange(ia, 0, newValue);
              lastUpdateTime = Date.now();
              resolve({ success: true });
            }, 300);
          });
        };
      };

      const throttledExchange = createThrottledExchange();
      // Test update sequence (fast follow-up should fail)
      const res1 = await throttledExchange(10);
      const res2 = await throttledExchange(20); // Too frequent
      // Wait for interval to pass
      await new Promise<void>((resolve) => setTimeout(resolve, minInterval));
      const res3 = await throttledExchange(30); // Valid after interval

      expect(res1.success).assertEqual(true);
      expect(res2.success).assertEqual(false);
      expect(res2.reason).assertEqual('Too frequent');
      expect(res3.success).assertEqual(true);
      expect(ia[0]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsExchangeTest095
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_095
     * @tc.desc   Test nested async exchange with Promise.all and cross-index dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32: [dependent, trigger]
      const ia = new Int32Array(sab);
      ia[0] = 5; // Dependent value
      ia[1] = 0; // Trigger: 0=inactive, 1=active
      let dependencyMet = false;

      // Update dependent only if trigger is active
      const dependentUpdate = async (newDependent: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          const checkTrigger = () => {
            if (ia[1] === 1) {
              dependencyMet = true;
              const old = Atomics.exchange(ia, 0, newDependent);
              resolve(old);
            } else {
              setTimeout(checkTrigger, 20); // Retry until trigger active
            }
          };
          checkTrigger();
        });
      };

      // Activate trigger after delay
      const activateTrigger = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.exchange(ia, 1, 1);
          resolve();
        }, 5);
      });

      // Run dependent update and trigger activation in parallel
      const oldDependent = await Promise.all([dependentUpdate(15), activateTrigger]);
      expect(dependencyMet).assertEqual(true);
      expect(oldDependent[0]).assertEqual(5);
      expect(ia[0]).assertEqual(15);
      expect(ia[1]).assertEqual(1);
    });

    /**
     * @tc.name   atomicsExchangeTest096
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_096
     * @tc.desc   Test exchange in async iterator with dynamic stop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const oldValues: number[] = await atomicsExchangeTest096();

      expect(oldValues).assertDeepEquals([0, 10, 20]); // Stops before 30 (30 > 25)
      // expect(ia[0]).assertEqual(30); // Final value (exceeds stopValue, iterator stops)
    });

    /**
     * @tc.name   atomicsExchangeTest097
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_097
     * @tc.desc   Test async exchange with finally block for audit log
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const auditLog: Array<type97> = [];

      // Exchange with audit log in finally
      const auditedExchange = async (newValue: number): Promise<boolean> => {
        let old = ia[0];
        let success = false;
        try {
          old = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const oldVal = Atomics.exchange(ia, 0, newValue);
              success = true;
              resolve(oldVal);
            }, 30);
          });
          return true;
        } catch (err) {
          success = false;
          return false;
        } finally {
          auditLog.push({ old, new: newValue, success });
        }
      };

      // Test valid and invalid exchanges
      await auditedExchange(20); // Valid
      try {
        await auditedExchange(NaN); // Invalid (throws)
      } catch (err) {
      }

      expect(auditLog.length).assertEqual(2);
      expect(auditLog[0].old).assertEqual(10);
      expect(auditLog[0].new).assertEqual(20);
      expect(auditLog[0].success).assertEqual(true);
      expect(auditLog[1].old).assertEqual(20);
      expect(auditLog[1].new).assertNaN()
      expect(auditLog[1].success).assertEqual(true);
      expect(ia[0]).assertEqual(0); // Second exchange fails, value unchanged
    });

    /**
     * @tc.name   atomicsExchangeTest098
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_098
     * @tc.desc   Test nested exchange with async validation of both old and new values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15;
      let validationPassed = false;

      // Async validation: old value > 10 AND new value < 30
      const validateBoth = async (oldVal: number, newVal: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const valid = oldVal > 10 && newVal < 30;
            validationPassed = valid;
            resolve(valid);
          }, 30);
        });
      };

      // Nested: get old value → validate → exchange
      const dualValidateExchange = async (newValue: number): Promise<boolean> => {
        const oldValue = ia[0];
        const isValid = await validateBoth(oldValue, newValue);
        if (!isValid) {
          return false;
        }

        await new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, newValue);
            resolve();
          }, 2);
        });
        return true;
      };

      // Test valid exchange (15→25: 15>10 and 25<30)
      const success1 = await dualValidateExchange(25);
      // Test invalid exchange (25→35: 35 not <30)
      const success2 = await dualValidateExchange(35);

      expect(validationPassed).assertEqual(false); // Second validation fails
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(25);
    });
    /**
     * @tc.name   atomicsExchangeTest099
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_099
     * @tc.desc   Test async exchange with Promise.race between multiple closure instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let winnerId: string = '';

      // Closure factory: creates exchange closures with unique IDs
      const createExchangeClosure = (id: string, targetValue: number) => {
        return async (): Promise<string> => {
          return new Promise<string>((resolve) => {
            setTimeout(() => {
              Atomics.exchange(ia, 0, targetValue);
              winnerId = id;
              resolve(id);
            }, Math.random() * 10); // Random delay to simulate race
          });
        };
      };

      // Create 3 closure instances (competing to update)
      const closure1 = createExchangeClosure('closure1', 20);
      const closure2 = createExchangeClosure('closure2', 30);
      const closure3 = createExchangeClosure('closure3', 40);

      // Race all closures
      const winningId = await Promise.race([closure1(), closure2(), closure3()]);
      // Wait for all closures to complete (ensure no further updates)
      await Promise.allSettled([closure1(), closure2(), closure3()]);

      expect(['closure1', 'closure2', 'closure3'].includes(winningId)).assertTrue()
      expect([20, 30, 40].includes(ia[0])).assertTrue(); // Final value matches winning closure
    });

    /**
     * @tc.name   atomicsExchangeTest100
     * @tc.number SUB_BUILTINS_Atomics_exchange_TEST_100
     * @tc.desc   Test comprehensive async nested exchange with retry, validation, and cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsExchangeTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32: [data, lock, cleanupFlag]
      const ia = new Int32Array(sab);
      ia[0] = 5; // Data
      ia[1] = 0; // Lock: 0=idle, 1=held
      ia[2] = 0; // Cleanup flag: 0=not done, 1=done
      const maxRetries = 3;
      let retryCount = 0;
      let cleanupDone = false;

      // 1. Acquire lock (atomic exchange)
      const acquireLock = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = () => {
            const oldLock = Atomics.exchange(ia, 1, 1);
            resolve(oldLock === 0);
          };
          setTimeout(attempt, 2);
        });
      };

      // 2. Validate new value (async)
      const validateValue = async (newValue: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            resolve(newValue > ia[0] && newValue < 100); // New value > current + <100
          }, 3);
        });
      };

      // 3. Nested exchange with retry
      const exchangeWithRetry = async (targetValue: number): Promise<boolean> => {
        if (retryCount >= maxRetries) {
          return false;
        }
        retryCount++;

        const isValid = await validateValue(targetValue);
        if (!isValid) {
          return exchangeWithRetry(targetValue + 10);
        } // Retry with adjusted value

        await new Promise<void>((resolve) => {
          setTimeout(() => {
            Atomics.exchange(ia, 0, targetValue);
            resolve();
          }, 2);
        });
        return true;
      };

      // 4. Main workflow: lock → exchange → cleanup
      const mainWorkflow = async (targetValue: number): Promise<boolean> => {
        const hasLock = await acquireLock();
        if (!hasLock) {
          return false;
        }

        try {
          // Simulate competing state change (may trigger retry)
          const competingTask = new Promise<void>((resolve) => {
            setTimeout(() => {
              if (ia[1] === 1) {
                Atomics.exchange(ia, 0, 10);
              } // Adjust data to trigger retry
              resolve();
            }, 5);
          });

          const exchangeSuccess = await Promise.all([exchangeWithRetry(targetValue), competingTask]);
          return exchangeSuccess[0];
        } finally {
          // Cleanup: release lock + set cleanup flag
          await Promise.all([
            new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, 1, 0); // Release lock
                resolve();
              }, 2);
            }),
            new Promise<void>((resolve) => {
              setTimeout(() => {
                Atomics.exchange(ia, 2, 1); // Set cleanup flag
                cleanupDone = true;
                resolve();
              }, 2);
            })
          ]);
        }
      };

      // Run comprehensive workflow
      const success = await mainWorkflow(15);
      expect(success).assertEqual(true);
      expect(retryCount).assertLarger(0); // Retry triggered by competing task
      expect(cleanupDone).assertEqual(true);
      expect(ia[0]).assertLarger(10); // Final value > adjusted competing value
      expect(ia[1]).assertEqual(0); // Lock released
      expect(ia[2]).assertEqual(1); // Cleanup flag set
    });
  })
}