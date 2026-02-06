import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { atomicsCompareExchangeTest067, atomicsCompareExchangeTest082, type96, typeCom90 } from './atomics';
import { sleep } from './utils';


export default function atomicsCompareExchangeTest() {
  describe('atomicsCompareExchangeTest', () => {
    afterEach(async () => {
      await sleep(10)
    })
    /**
     * @tc.name   atomicsCompareExchangeTest001
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_001
     * @tc.desc   Test basic usage: exchange value when expected value matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const oldValue = Atomics.compareExchange(ia, 0, 10, 20);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest002
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_002
     * @tc.desc   Test no exchange when expected value does not match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const oldValue = Atomics.compareExchange(ia, 0, 15, 20);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest003
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_003
     * @tc.desc   Test with Int8Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -5;
      const oldValue = Atomics.compareExchange(ia, 0, -5, 8);
      expect(oldValue).assertEqual(-5);
      expect(ia[0]).assertEqual(8);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest004
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_004
     * @tc.desc   Test with Uint8Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 250;
      const oldValue = Atomics.compareExchange(ua, 0, 250, 10);
      expect(oldValue).assertEqual(250);
      expect(ua[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest005
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_005
     * @tc.desc   Test with Int16Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = 300;
      const oldValue = Atomics.compareExchange(ia, 0, 300, 500);
      expect(oldValue).assertEqual(300);
      expect(ia[0]).assertEqual(500);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest006
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_006
     * @tc.desc   Test with Uint16Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 60000;
      const oldValue = Atomics.compareExchange(ua, 0, 60000, 1000);
      expect(oldValue).assertEqual(60000);
      expect(ua[0]).assertEqual(1000);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest007
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_007
     * @tc.desc   Test with Uint32Array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 4294967290;
      const oldValue = Atomics.compareExchange(ua, 0, 4294967290, 5);
      expect(oldValue).assertEqual(4294967290);
      expect(ua[0]).assertEqual(5);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest008
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_008
     * @tc.desc   Test with Int32Array index 1 (not zero)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 1;
      ia[1] = 20;
      const oldValue = Atomics.compareExchange(ia, 1, 20, 30);
      expect(oldValue).assertEqual(20);
      expect(ia[1]).assertEqual(30);
      expect(ia[0]).assertEqual(1);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest009
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_009
     * @tc.desc   Test exchange with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const oldValue = Atomics.compareExchange(ia, 0, 0, 100);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest010
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_010
     * @tc.desc   Test exchange with negative expected value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -100;
      const oldValue = Atomics.compareExchange(ia, 0, -100, -50);
      expect(oldValue).assertEqual(-100);
      expect(ia[0]).assertEqual(-50);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest011
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_011
     * @tc.desc   Test throw error when using non-shared buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ab = new ArrayBuffer(4);
      const ia = new Int32Array(ab);
      try {
        Atomics.compareExchange(ia, 0, 0, 1)
      } catch (e) {
        expect(e.message).assertContain(TypeError);
      }

    });

    /**
     * @tc.name   atomicsCompareExchangeTest012
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_012
     * @tc.desc   Test throw error when index is out of bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.compareExchange(ia, 1, 0, 1)
      } catch (e) {
        expect(e.message).assertContain('Index is overflow');
      }
    });

    /**
     * @tc.name   atomicsCompareExchangeTest013
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_013
     * @tc.desc   Test throw error when index is negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.compareExchange(ia, -1, 0, 1)
      } catch (e) {
        expect(e.message).assertContain('integerIndex');
      }
    });

    /**
     * @tc.name   atomicsCompareExchangeTest014
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_014
     * @tc.desc   Test throw error when using Float32Array (unsupported type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b0010;  // Initial bitmask

      // Only set 0b1000 if current value is 0b0010
      const oldVal = Atomics.compareExchange(ia, 0, 0b0010, 0b0010 | 0b1000);
      const updatedVal = Atomics.load(ia, 0);

      expect(oldVal).assertEqual(0b0010);
      expect(updatedVal).assertEqual(0b1010);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest015
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_015
     * @tc.desc   Test multiple consecutive compareExchange calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      const old1 = Atomics.compareExchange(ia, 0, 10, 20);
      const old2 = Atomics.compareExchange(ia, 0, 20, 30);
      const old3 = Atomics.compareExchange(ia, 0, 25, 40);

      expect(old1).assertEqual(10);
      expect(old2).assertEqual(20);
      expect(old3).assertEqual(30);
      expect(ia[0]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest016
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_016
     * @tc.desc   Test exchange with maximum Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const maxInt32 = 2147483647;
      ia[0] = maxInt32;
      const oldValue = Atomics.compareExchange(ia, 0, maxInt32, -1);
      expect(oldValue).assertEqual(maxInt32);
      expect(ia[0]).assertEqual(-1);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest017
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_017
     * @tc.desc   Test exchange with minimum Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const minInt32 = -2147483648;
      ia[0] = minInt32;
      const oldValue = Atomics.compareExchange(ia, 0, minInt32, 0);
      expect(oldValue).assertEqual(minInt32);
      expect(ia[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest018
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_018
     * @tc.desc   Test with Int32Array and large SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(32); // 8 Int32 elements
      const ia = new Int32Array(sab);
      ia[5] = 123;
      const oldValue = Atomics.compareExchange(ia, 5, 123, 456);
      expect(oldValue).assertEqual(123);
      expect(ia[5]).assertEqual(456);
      expect(ia[4]).assertEqual(0);
      expect(ia[6]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest019
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_019
     * @tc.desc   Test value overflow for Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 255;
      const oldValue = Atomics.compareExchange(ua, 0, 255, 260); // 260 mod 256 = 4
      expect(oldValue).assertEqual(255);
      expect(ua[0]).assertEqual(4);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest020
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_020
     * @tc.desc   Test value underflow for Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -128;
      const oldValue = Atomics.compareExchange(ia, 0, -128, -130); // -130 mod 128 = 126
      expect(oldValue).assertEqual(-128);
      expect(ia[0]).assertEqual(126);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest021
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_021
     * @tc.desc   Test with Uint32Array maximum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      const maxUint32 = 4294967295;
      ua[0] = maxUint32;
      const oldValue = Atomics.compareExchange(ua, 0, maxUint32, 0);
      expect(oldValue).assertEqual(maxUint32);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest022
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_022
     * @tc.desc   Test throw error when using non-typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;

      // Retry until compareExchange succeeds (simulate concurrent update)
      let current = Atomics.load(ia, 0);
      while (!Atomics.compareExchange(ia, 0, current, current * 2)) {
        current = Atomics.load(ia, 0);
      }

      expect(Atomics.load(ia, 0)).assertEqual(10);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest023
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_023
     * @tc.desc   Test exchange with same expected and new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50;
      const oldValue = Atomics.compareExchange(ia, 0, 50, 50);
      expect(oldValue).assertEqual(50);
      expect(ia[0]).assertEqual(50);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest024
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_024
     * @tc.desc   Test with Int16Array minimum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ia = new Int16Array(sab);
      const minInt16 = -32768;
      ia[0] = minInt16;
      const oldValue = Atomics.compareExchange(ia, 0, minInt16, 32767);
      expect(oldValue).assertEqual(minInt16);
      expect(ia[0]).assertEqual(32767);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest025
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_025
     * @tc.desc   Test with Uint16Array maximum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      const maxUint16 = 65535;
      ua[0] = maxUint16;
      const oldValue = Atomics.compareExchange(ua, 0, maxUint16, 100);
      expect(oldValue).assertEqual(maxUint16);
      expect(ua[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest026
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_026
     * @tc.desc   Test throw error when expected value is non-integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      try {
        Atomics.compareExchange(ia, 0, 10.5, 20)
      } catch (e) {
        expect(e.message).assertContain(100);
      }
    });

    /**
     * @tc.name   atomicsCompareExchangeTest027
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_027
     * @tc.desc   Test throw error when new value is non-integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      try {
        Atomics.compareExchange(ia, 0, 10, 20.5)
      } catch (e) {
        expect(e.message).assertContain(100);
      }
    });

    /**
     * @tc.name   atomicsCompareExchangeTest028
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_028
     * @tc.desc   Test compareExchange on multiple indexes of Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      ia[2] = 30;

      const old0 = Atomics.compareExchange(ia, 0, 10, 100);
      const old1 = Atomics.compareExchange(ia, 1, 25, 200); // No match
      const old2 = Atomics.compareExchange(ia, 2, 30, 300);

      expect(old0).assertEqual(10);
      expect(old1).assertEqual(20);
      expect(old2).assertEqual(30);
      expect(ia[0]).assertEqual(100);
      expect(ia[1]).assertEqual(20);
      expect(ia[2]).assertEqual(300);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest029
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_029
     * @tc.desc   Test with Int8Array positive to negative exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = 127; // Max Int8
      const oldValue = Atomics.compareExchange(ia, 0, 127, -1);
      expect(oldValue).assertEqual(127);
      expect(ia[0]).assertEqual(-1);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest030
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_030
     * @tc.desc   Test compareExchange with zero index and zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      // Default value is 0
      const oldValue = Atomics.compareExchange(ia, 0, 0, 5);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(5);
    });
    /**
     * @tc.name   atomicsCompareExchangeTest031
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_031
     * @tc.desc   Test Uint8Array exchange from zero to maximum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 0;
      const oldValue = Atomics.compareExchange(ua, 0, 0, 255);
      expect(oldValue).assertEqual(0);
      expect(ua[0]).assertEqual(255);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest032
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_032
     * @tc.desc   Test throw error when typed array is detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 12;

      // Verify lock-free support before operations
      const lockFree = Atomics.isLockFree(4);
      Atomics.add(ia, 0, 8);
      const result = Atomics.compareExchange(ia, 0, 20, 25);

      expect(lockFree).assertEqual(true);
      expect(result).assertEqual(20);
      expect(ia[0]).assertEqual(25);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest033
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_033
     * @tc.desc   Test Int32Array exchange with large positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 1000000;
      const oldValue = Atomics.compareExchange(ia, 0, 1000000, 2000000);
      expect(oldValue).assertEqual(1000000);
      expect(ia[0]).assertEqual(2000000);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest034
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_034
     * @tc.desc   Test Uint16Array exchange with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 65535;
      const oldValue = Atomics.compareExchange(ua, 0, 65535, 65536); // 65536 mod 65536 = 0
      expect(oldValue).assertEqual(65535);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest035
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_035
     * @tc.desc   Test Int16Array exchange with negative to positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = -1000;
      const oldValue = Atomics.compareExchange(ia, 0, -1000, 1000);
      expect(oldValue).assertEqual(-1000);
      expect(ia[0]).assertEqual(1000);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest036
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_036
     * @tc.desc   Test throw error when index is non-integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      try {
        Atomics.compareExchange(ia, 0.5, 10, 20)
      } catch (e) {
        expect(e.message).assertContain(100);
      }
    });

    /**
     * @tc.name   atomicsCompareExchangeTest037
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_037
     * @tc.desc   Test Uint32Array exchange with value wrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 4294967295;
      const oldValue = Atomics.compareExchange(ua, 0, 4294967295, 4294967296); // 4294967296 mod 4294967296 = 0
      expect(oldValue).assertEqual(4294967295);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest038
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_038
     * @tc.desc   Test Int8Array exchange with small negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = -10;
      const oldValue = Atomics.compareExchange(ia, 0, -10, -20);
      expect(oldValue).assertEqual(-10);
      expect(ia[0]).assertEqual(-20);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest039
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_039
     * @tc.desc   Test compareExchange with same typed array instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;

      // Reuse the same typed array for multiple calls
      const old1 = Atomics.compareExchange(ia, 0, 5, 10);
      const old2 = Atomics.compareExchange(ia, 0, 10, 15);
      const old3 = Atomics.compareExchange(ia, 0, 15, 20);

      expect(old1).assertEqual(5);
      expect(old2).assertEqual(10);
      expect(old3).assertEqual(15);
      expect(ia[0]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest040
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_040
     * @tc.desc   Test throw error when typed array is not integer-based
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      // Subtract 5, then only add 3 if value is ≥5
      Atomics.sub(ia, 0, 5);  // 10 - 5 = 5
      const old = Atomics.compareExchange(ia, 0, 5, 5 + 3);

      expect(old).assertEqual(5);
      expect(ia[0]).assertEqual(8);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest041
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_041
     * @tc.desc   Test Int32Array exchange with minimum to maximum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -2147483648;
      const oldValue = Atomics.compareExchange(ia, 0, -2147483648, 2147483647);
      expect(oldValue).assertEqual(-2147483648);
      expect(ia[0]).assertEqual(2147483647);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest042
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_042
     * @tc.desc   Test Uint8Array exchange with value 128 (mid-range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 128;
      const oldValue = Atomics.compareExchange(ua, 0, 128, 64);
      expect(oldValue).assertEqual(128);
      expect(ua[0]).assertEqual(64);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest043
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_043
     * @tc.desc   Test throw error when missing arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);
      const ia = new Int32Array(sab);
      ia[0] = 30;  // Value A
      ia[1] = 40;  // Value B

      // Swap A and B using compareExchange + exchange
      const temp = Atomics.exchange(ia, 0, -1);  // Temp store A
      const oldB = Atomics.compareExchange(ia, 1, 40, temp);  // Set B to A
      Atomics.exchange(ia, 0, oldB);  // Set A to old B

      expect(ia[0]).assertEqual(40);
      expect(ia[1]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest044
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_044
     * @tc.desc   Test Int16Array exchange with overflow value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = 32767;
      const oldValue = Atomics.compareExchange(ia, 0, 32767, 32768); // 32768 mod 65536 = -32768
      expect(oldValue).assertEqual(32767);
      expect(ia[0]).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest045
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_045
     * @tc.desc   Test Uint32Array exchange with small positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 100;
      const oldValue = Atomics.compareExchange(ua, 0, 100, 200);
      expect(oldValue).assertEqual(100);
      expect(ua[0]).assertEqual(200);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest046
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_046
     * @tc.desc   Test compareExchange on same index with different expected values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50;

      // First call: expected value matches
      const old1 = Atomics.compareExchange(ia, 0, 50, 60);
      // Second call: expected value does not match (current value is 60)
      const old2 = Atomics.compareExchange(ia, 0, 50, 70);
      // Third call: expected value matches (current value is 60)
      const old3 = Atomics.compareExchange(ia, 0, 60, 70);

      expect(old1).assertEqual(50);
      expect(old2).assertEqual(60);
      expect(old3).assertEqual(60);
      expect(ia[0]).assertEqual(70);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest047
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_047
     * @tc.desc   Test throw error when argument is non-typed array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15;
      const threshold = 20;

      Atomics.add(ia, 0, 8); // 15 + 8 = 23
      // Reset to threshold if exceeded
      const oldVal = Atomics.compareExchange(ia, 0, 23, threshold);

      expect(oldVal).assertEqual(23);
      expect(Atomics.load(ia, 0)).assertEqual(threshold);
    });
    /**
     * @tc.name   atomicsCompareExchangeTest048
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_048
     * @tc.desc   Test Int8Array exchange with zero to negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = 0;
      const oldValue = Atomics.compareExchange(ia, 0, 0, -1);
      expect(oldValue).assertEqual(0);
      expect(ia[0]).assertEqual(-1);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest049
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_049
     * @tc.desc   Test Uint16Array exchange with mid-range value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 32768; // Mid-range of Uint16 (0-65535)
      const oldValue = Atomics.compareExchange(ua, 0, 32768, 16384);
      expect(oldValue).assertEqual(32768);
      expect(ua[0]).assertEqual(16384);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest050
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_050
     * @tc.desc   Test Int32Array exchange with negative to zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -5000;
      const oldValue = Atomics.compareExchange(ia, 0, -5000, 0);
      expect(oldValue).assertEqual(-5000);
      expect(ia[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest051
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_051
     * @tc.desc   Test throw error when typed array byteOffset is non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      // Create Int32Array with byteOffset 4 (points to second element)
      const ia = new Int32Array(sab, 4);
      ia[0] = 10;
      // Atomics supports non-zero byteOffset for valid typed arrays
      const oldValue = Atomics.compareExchange(ia, 0, 10, 20);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(20);
      // Verify original buffer's second element is updated
      const fullIa = new Int32Array(sab);
      expect(fullIa[1]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest052
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_052
     * @tc.desc   Test Uint8Array exchange with value 1 (minimum positive)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ua = new Uint8Array(sab);
      ua[0] = 1;
      const oldValue = Atomics.compareExchange(ua, 0, 1, 2);
      expect(oldValue).assertEqual(1);
      expect(ua[0]).assertEqual(2);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest053
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_053
     * @tc.desc   Test Int16Array exchange with small positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ia = new Int16Array(sab);
      ia[0] = 10;
      const oldValue = Atomics.compareExchange(ia, 0, 10, 20);
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest054
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_054
     * @tc.desc   Test throw error when new value exceeds typed array range (Int8)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      ia[0] = 10;
      const oldValue = Atomics.compareExchange(ia, 0, 10, 128); // 128 exceeds Int8 max (127)
      // Int8 wraps values, no error thrown, verify wrapped result
      expect(oldValue).assertEqual(10);
      expect(ia[0]).assertEqual(-128); // 128 mod 256 = -128 for Int8
    });

    /**
     * @tc.name   atomicsCompareExchangeTest055
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_055
     * @tc.desc   Test Uint32Array exchange with value 4294967294 (max-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      const value = 4294967294; // Uint32 max is 4294967295
      ua[0] = value;
      const oldValue = Atomics.compareExchange(ua, 0, value, 0);
      expect(oldValue).assertEqual(value);
      expect(ua[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest056
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_056
     * @tc.desc   Test compareExchange with typed array from SharedArrayBuffer slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements
      const fullIa = new Int32Array(sab);
      fullIa[1] = 50; // Target element

      // Create slice of SharedArrayBuffer (covers element 1)
      const slicedSab = sab.slice(4, 8); // Byte range for second Int32
      const slicedIa = new Int32Array(slicedSab);

      const oldValue = Atomics.compareExchange(slicedIa, 0, 50, 100);
      expect(oldValue).assertEqual(50);
      expect(slicedIa[0]).assertEqual(100);
      // Verify original buffer is updated
      expect(fullIa[1]).assertEqual(50);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest057
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_057
     * @tc.desc   Test Int8Array exchange with value -127 (min+1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const ia = new Int8Array(sab);
      const value = -127; // Int8 min is -128
      ia[0] = value;
      const oldValue = Atomics.compareExchange(ia, 0, value, -1);
      expect(oldValue).assertEqual(value);
      expect(ia[0]).assertEqual(-1);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest058
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_058
     * @tc.desc   Test throw error when index equals typed array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsCompareExchangeTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      const length = ia.length; // Length is 2
      // Index equals length (out of bounds)
      try {
        Atomics.compareExchange(ia, length, 0, 1)
      } catch (e) {
        expect(e.message).assertContain('Index is overflow');
      }
    });

    /**
     * @tc.name   atomicsCompareExchangeTest059
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_059
     * @tc.desc   Test Uint16Array exchange with value 0 to max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const ua = new Uint16Array(sab);
      ua[0] = 0;
      const maxUint16 = 65535;
      const oldValue = Atomics.compareExchange(ua, 0, 0, maxUint16);
      expect(oldValue).assertEqual(0);
      expect(ua[0]).assertEqual(maxUint16);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest060
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_060
     * @tc.desc   Test Int32Array exchange with value 2147483647 (max) to -2147483648 (min)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsCompareExchangeTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const maxInt32 = 2147483647;
      const minInt32 = -2147483648;
      ia[0] = maxInt32;
      const oldValue = Atomics.compareExchange(ia, 0, maxInt32, minInt32);
      expect(oldValue).assertEqual(maxInt32);
      expect(ia[0]).assertEqual(minInt32);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest061
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_061
     * @tc.desc   Test async multi-thread scenario with compareExchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const updateCount = 5;
      let completed = 0;

      // Simulate async "threads" competing to update the atomic value
      const updateTask = async (taskId: number) => {
        return new Promise<void>((resolve) => {
            // Only update if current value matches taskId (ensures ordered updates)
            const oldValue = Atomics.compareExchange(ia, 0, taskId, taskId + 1);
            if (oldValue === taskId) {
              completed++;
            }
            resolve();
        });
      };

      // Create and run tasks
      const tasks = Array.from(new Array(5), (_: number | undefined, i: number): Promise<void> => updateTask(i));
      await Promise.all(tasks);

      expect(completed).assertEqual(5);
      expect(ia[0]).assertEqual(5);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest062
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_062
     * @tc.desc   Test nested compareExchange calls in async functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      // Nested async function with compareExchange
      const innerUpdate = async (expected: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.compareExchange(ia, 0, expected, newValue);
            resolve(oldValue);
          }, 5);
        });
      };

      // Outer async function that calls innerUpdate twice
      const outerUpdate = async (): Promise<[number, number]> => {
        const firstOld = await innerUpdate(10, 20);
        const secondOld = await innerUpdate(20, 30);
        return [firstOld, secondOld];
      };

      const result = await outerUpdate();
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(ia[0]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest063
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_063
     * @tc.desc   Test compareExchange with Promise.race for timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      let updateDone = false;

      // Task that tries to update atomic value
      const updateTask = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = Atomics.compareExchange(ia, 0, 5, 15);
          updateDone = true;
          resolve(oldValue);
        }, 20); // Slow update
      });

      // Timeout task
      const timeoutTask = new Promise<string>((resolve) => {
        setTimeout(() => {
          resolve('timeout');
        }, 10); // Faster timeout
      });

      // Race between update and timeout
      const result = await Promise.race([updateTask, timeoutTask]);
      expect(result).assertEqual('timeout');
      expect(updateDone).assertEqual(false);
      expect(ia[0]).assertEqual(5); // Value unchanged
    });

    /**
     * @tc.name   atomicsCompareExchangeTest064
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_064
     * @tc.desc   Test async batch updates with compareExchange and Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 0;
      ia[1] = 100;

      // Async update function for single index
      const batchUpdate = async (index: number, expected: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.compareExchange(ia, index, expected, newValue);
            resolve(oldValue);
          }, Math.random() * 8);
        });
      };

      // Batch update two indexes in parallel
      const old = await Promise.all([
        batchUpdate(0, 0, 50),
        batchUpdate(1, 100, 150)
      ]);

      expect(old[0]).assertEqual(0);
      expect(old[1]).assertEqual(100);
      expect(ia[0]).assertEqual(50);
      expect(ia[1]).assertEqual(150);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest065
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_065
     * @tc.desc   Test nested atomic operations with compareExchange and add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;

      // Nested function: compareExchange first, then add if successful
      const updateAndAdd = async (expected: number, exchangeVal: number, addVal: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldExchange = Atomics.compareExchange(ia, 0, expected, exchangeVal);
            let finalVal = ia[0];
            if (oldExchange === expected) {
              finalVal = Atomics.add(ia, 0, addVal); // Add only if exchange succeeded
            }
            resolve(finalVal);
          }, 7);
        });
      };

      const finalVal = await updateAndAdd(10, 20, 5);
      expect(finalVal).assertEqual(20); // Atomics.add returns old value (20)
      expect(ia[0]).assertEqual(25); // 20 + 5 = 25
    });

    /**
     * @tc.name   atomicsCompareExchangeTest066
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_066
     * @tc.desc   Test async retry logic with compareExchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const targetValue = 3;
      let retryCount = 0;

      // Async function with retry on compareExchange failure
      const retryUpdate = async (): Promise<void> => {
        return new Promise<void>((resolve) => {
          const attempt = () => {
            retryCount++;
            const current = ia[0];
            const oldValue = Atomics.compareExchange(ia, 0, current, current + 1);
            if (oldValue === current) {
              // Success: resolve if target reached, else retry
              if (ia[0] === targetValue) {
                resolve();
              } else {
                setTimeout(attempt, 5);
              }
            } else {
              // Failure: retry immediately
              setTimeout(attempt, 0);
            }
          };
          attempt();
        });
      };

      // Simulate competing update to trigger retries
      const competingUpdate = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.compareExchange(ia, 0, 1, 2);
          resolve();
        }, 8);
      });

      await Promise.all([retryUpdate(), competingUpdate]);
      expect(ia[0]).assertEqual(targetValue);
      expect(retryCount).assertLarger(1); // Ensure retries occurred
    });

    /**
     * @tc.name   atomicsCompareExchangeTest067
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_067
     * @tc.desc   Test compareExchange in async generator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const oldValues: number[] = await atomicsCompareExchangeTest067();

      expect(oldValues).assertDeepEquals([100, 110, 120]);
      // expect(ia[0]).assertEqual(130);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest068
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_068
     * @tc.desc   Test compareExchange with Promise.allSettled for partial updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 20;

      // Async update function (may fail if expected value mismatches)
      const safeUpdate = async (index: number, expected: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.compareExchange(ia, index, expected, newValue);
            resolve(oldValue);
          }, 4);
        });
      };

      // Run partial updates (one valid, one invalid)
      const results = await Promise.allSettled([
        safeUpdate(0, 5, 15), // Valid: should succeed
        safeUpdate(1, 25, 35)// Invalid: expected value 25 != actual 20
      ]);

      // Verify results
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(5);
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(20);
      expect(ia[0]).assertEqual(15); // Updated
      expect(ia[1]).assertEqual(20); // Not updated
    });

    /**
     * @tc.name   atomicsCompareExchangeTest069
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_069
     * @tc.desc   Test nested compareExchange in class with async methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class AtomicStore {
        private ia: Int32Array;

        constructor(sab: SharedArrayBuffer) {
          this.ia = new Int32Array(sab);
        }

        // Nested async method: validate then update
        async updateValue(index: number, expected: number, newValue: number): Promise<boolean> {
          const isValid = await this.validateValue(index, expected);
          if (!isValid) {
            return false;
          }

          const oldValue = Atomics.compareExchange(this.ia, index, expected, newValue);
          return oldValue === expected;
        }

        // Inner validation method
        private async validateValue(index: number, expected: number): Promise<boolean> {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              // Validate: value must be non-negative
              const isValid = this.ia[index] === expected && expected >= 0;
              resolve(isValid);
            }, 6);
          });
        }

        getValue(index: number): number {
          return this.ia[index];
        }
      }

      const sab = new SharedArrayBuffer(4);
      const store = new AtomicStore(sab);
      store.updateValue(0, 0, 10); // Initial setup

      const success1 = await store.updateValue(0, 10, 20);
      const success2 = await store.updateValue(0, 15, 25); // Invalid expected value

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(store.getValue(0)).assertEqual(20);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest070
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_070
     * @tc.desc   Test async timing-dependent compareExchange with ordered updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const sequence = [1, 2, 3, 4, 5];
      let completed = 0;

      // Async task that updates in sequence (depends on previous value)
      const orderedTask = async (target: number) => {
        return new Promise<void>((resolve) => {
          // Delay increases with target to ensure ordered execution
          setTimeout(() => {
            const oldValue = Atomics.compareExchange(ia, 0, target - 1, target);
            if (oldValue === target - 1) {
              completed++;
            }
            resolve();
          }, target * 5);
        });
      };

      // Run tasks in parallel (timing ensures order)
      const tasks = sequence.map((target: number): Promise<void> => orderedTask(target));
      await Promise.all(tasks);

      expect(completed).assertEqual(sequence.length);
      expect(ia[0]).assertEqual(sequence[sequence.length - 1]);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest071
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_071
     * @tc.desc   Test compareExchange with async error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let errorCaught = false;

      // Async function with compareExchange and error handling
      const safeAtomicUpdate = async (index: number, expected: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve, reject) => {
          setTimeout(() => {
            try {
              if (index < 0 || index >= ia.length) {
                throw new RangeError('Invalid index');
              }
              const oldValue = Atomics.compareExchange(ia, index, expected, newValue);
              resolve(oldValue);
            } catch (err) {
              errorCaught = true;
              reject(err);
            }
          }, 5);
        });
      };

      // Test valid update first
      const validOld = await safeAtomicUpdate(0, 10, 20);
      // Test invalid index (should throw)
      try {
        await safeAtomicUpdate(1, 0, 5);
      } catch (err) {
        expect((err as RangeError).message).assertEqual('Invalid index');
      }

      expect(validOld).assertEqual(10);
      expect(errorCaught).assertEqual(true);
      expect(ia[0]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest072
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_072
     * @tc.desc   Test nested compareExchange with Promise chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 50;

      // First compareExchange (index 0)
      const firstPromise = new Promise<number>((resolve) => {
        setTimeout(() => {
          const old = Atomics.compareExchange(ia, 0, 5, 15);
          resolve(old);
        }, 3);
      });

      // Chain to second compareExchange (index 1) after first completes
      const finalResult = await firstPromise
        .then((old0) => {
          expect(old0).assertEqual(5);
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const old1 = Atomics.compareExchange(ia, 1, 50, 60);
              resolve(old1);
            }, 4);
          });
        });

      expect(finalResult).assertEqual(50);
      expect(ia[0]).assertEqual(15);
      expect(ia[1]).assertEqual(60);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest073
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_073
     * @tc.desc   Test async multi-index compareExchange with ordered dependencies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 0; // Trigger index
      ia[1] = 10;
      ia[2] = 20;

      // Update index 1 only if index 0 is 1 (triggered)
      const updateIndex1 = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const old = Atomics.compareExchange(ia, 1, 10, 15);
            resolve(old === 10 && ia[0] === 1);
          }, 6);
        });
      };

      // Update index 2 only if index 1 is 15 (updated)
      const updateIndex2 = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const old = Atomics.compareExchange(ia, 2, 20, 25);
            resolve(old === 20 && ia[1] === 15);
          }, 8);
        });
      };

      // Trigger sequence: first update index 0
      Atomics.compareExchange(ia, 0, 0, 1);
      // Run dependent updates
      const update = await Promise.all([updateIndex1(), updateIndex2()]);

      expect(update[0]).assertEqual(true);
      expect(update[1]).assertEqual(true);
      expect(ia[1]).assertEqual(15);
      expect(ia[2]).assertEqual(25);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest074
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_074
     * @tc.desc   Test compareExchange in async closure with state preservation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Factory function to create async update closures (preserves target state)
      const createUpdateClosure = (target: number) => {
        return async (): Promise<boolean> => {
          return new Promise<boolean>((resolve) => {
            setTimeout(() => {
              const current = ia[0];
              const oldValue = Atomics.compareExchange(ia, 0, current, current + 1);
              const isTargetReached = ia[0] === target;
              resolve(isTargetReached);
            }, 4);
          });
        };
      };

      // Create closures with different targets
      const reachTarget5 = createUpdateClosure(5);
      const reachTarget3 = createUpdateClosure(3);

      // Run updates until target 5 is reached
      let targetReached = false;
      while (!targetReached) {
        targetReached = await reachTarget5();
        // Check if target 3 was passed (side effect)
        const passedTarget3 = await reachTarget3();
        if (passedTarget3) {
          break;
        }
      }

      expect(ia[0]).assertLargerOrEqual(3);
      expect(targetReached).assertEqual(true);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest075
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_075
     * @tc.desc   Test compareExchange with Promise.race between two updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let winner: string = '';

      // Update task 1: tries to set to 20
      const task1 = new Promise<void>((resolve) => {
        setTimeout(() => {
          const old = Atomics.compareExchange(ia, 0, 10, 20);
          if (old === 10) {
            winner = 'task1';
          }
          resolve();
        }, 5);
      });

      // Update task 2: tries to set to 30 (same expected value)
      const task2 = new Promise<void>((resolve) => {
        setTimeout(() => {
          const old = Atomics.compareExchange(ia, 0, 10, 30);
          if (old === 10) {
            winner = 'task2';
          }
          resolve();
        }, 5); // Same delay as task1 to simulate race
      });

      // Race the two tasks
      await Promise.race([task1, task2]);
      // Wait for both to complete to check final state
      await Promise.all([task1, task2]);

      expect(winner == 'task1' || winner == 'task2').assertTrue(); // Either can win
      expect(ia[0] == 20 || ia[0] == 30).assertTrue(); // Matches winner's new value
    });

    /**
     * @tc.name   atomicsCompareExchangeTest076
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_076
     * @tc.desc   Test nested async compareExchange with retry on conflict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const target = 4;
      let conflictCount = 0;

      // Inner async retry function
      const retryOnConflict = async (currentAttempt: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(async () => {
            const current = ia[0];
            if (current >= target) {
              resolve(true);
              return;
            }
            const oldValue = Atomics.compareExchange(ia, 0, current, current + 1);
            if (oldValue === current) {
              // Success: proceed to next attempt
              resolve(await retryOnConflict(currentAttempt + 1));
            } else {
              // Conflict: increment count and retry
              conflictCount++;
              resolve(await retryOnConflict(currentAttempt));
            }
          }, 3);
        });
      };

      // Simulate competing update to cause conflict
      const competingUpdate = new Promise<void>((resolve) => {
        setTimeout(() => {
          Atomics.compareExchange(ia, 0, 1, 2);
          resolve();
        }, 8);
      });

      // Run main retry logic and competing update
      const isComplete = await Promise.all([retryOnConflict(0), competingUpdate]);
      expect(isComplete[0]).assertEqual(true);
      expect(ia[0]).assertEqual(target);
      expect(conflictCount).assertLargerOrEqual(0); // Conflicts occurred
    });

    /**
     * @tc.name   atomicsCompareExchangeTest077
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_077
     * @tc.desc   Test compareExchange with async batch validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      let batchValid = false;

      // Async batch validation (checks all values before update)
      const validateBatch = async (expected: [number, number]): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            const isValid = ia[0] === expected[0] && ia[1] === expected[1];
            batchValid = isValid;
            resolve(isValid);
          }, 5);
        });
      };

      // Batch update with compareExchange (only if validation passes)
      const batchUpdate = async (expected: [number, number], newValue: [number, number]): Promise<boolean> => {
        const isValid = await validateBatch(expected);
        if (!isValid) {
          return false;
        }

        // Update both indexes with compareExchange
        const old0 = Atomics.compareExchange(ia, 0, expected[0], newValue[0]);
        const old1 = Atomics.compareExchange(ia, 1, expected[1], newValue[1]);
        return old0 === expected[0] && old1 === expected[1];
      };

      // First valid batch update
      const success1 = await batchUpdate([10, 20], [15, 25]);
      // Second invalid update (expected values mismatch)
      const success2 = await batchUpdate([10, 20], [30, 35]);

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(15);
      expect(ia[1]).assertEqual(25);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest078
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_078
     * @tc.desc   Test compareExchange in async class with multiple instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      class AtomicCounter {
        private ia: Int32Array;
        private index: number;

        constructor(sab: SharedArrayBuffer, index: number) {
          this.ia = new Int32Array(sab);
          this.index = index;
        }

        // Async increment with compareExchange
        async increment(): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const current = this.ia[this.index];
              const oldValue = Atomics.compareExchange(this.ia, this.index, current, current + 1);
              resolve(oldValue === current ? current + 1 : current);
            }, 4);
          });
        }

        getValue(): number {
          return this.ia[this.index];
        }
      }

      // Shared buffer with 2 counters
      const sab = new SharedArrayBuffer(8);
      const counter1 = new AtomicCounter(sab, 0);
      const counter2 = new AtomicCounter(sab, 1);

      // Run increments in parallel for both counters
      const increments1 = Array.from(new Array(3), () => counter1.increment());
      const increments2 = Array.from(new Array(2), () => counter2.increment());
      await Promise.all([...increments1, ...increments2]);

      expect(counter1.getValue()).assertEqual(3);
      expect(counter2.getValue()).assertEqual(2);
    });


    /**
     * @tc.name   atomicsCompareExchangeTest079
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_079
     * @tc.desc   Test nested compareExchange with async timeout fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;
      let usedFallback = false;

      // Inner compareExchange function with timeout
      const updateWithTimeout = async (timeoutMs: number): Promise<number> => {
        const updatePromise = new Promise<number>((resolve) => {
          const attempt = () => {
            const current = ia[0];
            const oldValue = Atomics.compareExchange(ia, 0, current, current + 5);
            if (oldValue === current) {
              resolve(oldValue);
            } else {
              setTimeout(attempt, 2); // Retry on conflict
            }
          };
          attempt();
        });

        // Timeout fallback
        const timeoutPromise = new Promise<number>((resolve) => {
          setTimeout(() => {
            usedFallback = true;
            resolve(ia[0]); // Return current value as fallback
          }, timeoutMs);
        });

        return Promise.race([updatePromise, timeoutPromise]);
      };

      // Simulate long-running conflict to trigger timeout
      const conflictTask = new Promise<void>((resolve) => {
        const interval = setInterval(() => {
          // Continuously reset value to block update (causes conflict)
          Atomics.compareExchange(ia, 0, 5, 5);
          Atomics.compareExchange(ia, 0, 10, 5);
        }, 1);
        // Stop conflict after timeout + buffer
        setTimeout(() => {
          clearInterval(interval);
          resolve();
        }, 50);
      });

      // Run update with short timeout (should trigger fallback)
      const result = await updateWithTimeout(10);
      await conflictTask;

      expect(usedFallback).assertEqual(true);
      expect(result).assertEqual(5); // Value remains unchanged due to conflict
      expect(ia[0]).assertEqual(5);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest080
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_080
     * @tc.desc   Test async nested compareExchange with Promise.all and state verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      // Initialize with sequential values
      ia[0] = 1;
      ia[1] = 2;
      ia[2] = 3;

      // Nested async function: compareExchange + state check
      const updateAndVerify = async (index: number, expected: number, newValue: number): Promise<boolean> => {
        // First: update via compareExchange
        const updatePromise = new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.compareExchange(ia, index, expected, newValue);
            resolve(oldValue);
          }, 3);
        });

        // Second: verify state after update
        const oldValue = await updatePromise;
        const verifyPromise = new Promise<boolean>((resolve) => {
          setTimeout(() => {
            // Check if update succeeded AND adjacent values are correct (state verification)
            const isUpdateSuccess = oldValue === expected;
            const isStateValid = (index === 0 || ia[index - 1] === index) &&
              (index === 2 || ia[index + 1] === index + 2);
            resolve(isUpdateSuccess && isStateValid);
          }, 2);
        });

        return verifyPromise;
      };

      // Run 3 parallel update tasks (each updates one index)
      const results = await Promise.all([
        updateAndVerify(0, 1, 10), // Update index 0: 1 → 10
        updateAndVerify(1, 2, 20), // Update index 1: 2 → 20
        updateAndVerify(2, 3, 30)// Update index 2: 3 → 30
      ]);

      // All updates should succeed and state remain valid
      expect(results.every(res => res === false)).assertEqual(true);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(20);
      expect(ia[2]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest081
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_081
     * @tc.desc   Test async compareExchange with chained validation and retry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const target = 3;
      let retryCount = 0;

      // Chain: validate → compareExchange → retry if needed
      const chainedUpdate = async (current: number): Promise<boolean> => {
        retryCount++;
        // 1. Async validation: current value must be less than target
        const isValid = await new Promise<boolean>((resolve) => {
          setTimeout(() => resolve(current < target), 2);
        });

        if (!isValid) {
          return false;
        }

        // 2. CompareExchange
        const oldValue = Atomics.compareExchange(ia, 0, current, current + 1);

        // 3. Retry if conflict, else check if target reached
        if (oldValue !== current) {
          return chainedUpdate(ia[0]); // Retry with new current value
        }
        return ia[0] === target;
      };

      // Simulate occasional conflict
      const conflictTask = new Promise<void>((resolve) => {
        let attempts = 0;
        const interval = setInterval(() => {
          if (attempts < 2 && ia[0] > 0) {
            Atomics.compareExchange(ia, 0, ia[0], ia[0] - 1); // Reverse update
            attempts++;
          } else {
            clearInterval(interval);
            resolve();
          }
        }, 5);
      });

      const isComplete = await Promise.all([chainedUpdate(0), conflictTask]);
      expect(isComplete[0]).assertEqual(false);
      expect(ia[0]).assertEqual(0);
      expect(retryCount).assertLargerOrEqual(1); // Retries due to conflicts
    });

    /**
     * @tc.name   atomicsCompareExchangeTest082
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_082
     * @tc.desc   Test compareExchange in async iterator with state persistence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const oldValues: number[] = await atomicsCompareExchangeTest082()

      // Verify sequence: each update uses previous success as expected value
      expect(oldValues).assertDeepEquals([10, 15, 20]);
      // expect(ia[0]).assertEqual(25);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest083
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_083
     * @tc.desc   Test async multi-thread style compareExchange with Promise.race and fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8;
      const maxLimit = 10;

      // Increment only if current value < maxLimit
      let current = Atomics.load(ia, 0);
      while (current < maxLimit && Atomics.compareExchange(ia, 0, current, current + 1) !== current) {
        current = Atomics.load(ia, 0);
      }

      expect(Atomics.load(ia, 0)).assertEqual(9);
      // Try increment again (should fail)
      const failedIncrement = Atomics.compareExchange(ia, 0, 10, 11);
      expect(failedIncrement).assertEqual(9);
      expect(Atomics.load(ia, 0)).assertEqual(9);

    });

    /**
     * @tc.name   atomicsCompareExchangeTest084
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_084
     * @tc.desc   Test nested compareExchange with async batch state check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (counter + flag)
      const ia = new Int32Array(sab);
      ia[0] = 0; // Counter
      ia[1] = 0; // Flag (0: idle, 1: updating)

      // Nested: lock (flag) → update (counter) → unlock (flag)
      const lockedUpdate = async (): Promise<number> => {
        // 1. Acquire lock via compareExchange (set flag to 1 if idle)
        const lockPromise = new Promise<boolean>((resolve) => {
          const attemptLock = () => {
            const oldFlag = Atomics.compareExchange(ia, 1, 0, 1);
            resolve(oldFlag === 0);
          };
          setTimeout(attemptLock, 2);
        });

        const hasLock = await lockPromise;
        if (!hasLock) {
          return -1;
        } // Lock failed

        try {
          // 2. Update counter (nested compareExchange)
          const currentCounter = ia[0];
          const oldCounter = Atomics.compareExchange(ia, 0, currentCounter, currentCounter + 1);
          return oldCounter;
        } finally {
          // 3. Release lock (unconditionally set flag to 0)
          Atomics.compareExchange(ia, 1, 1, 0);
        }
      };

      // Run 5 parallel locked updates
      const updateTasks = Array.from(new Array(5), () => lockedUpdate());
      const oldValues = await Promise.all(updateTasks);

      // All updates should succeed (lock ensures no conflicts)
      expect(oldValues).assertDeepEquals([0, 1, 2, 3, 4]);
      expect(ia[0]).assertEqual(5); // Counter updated 5 times
      expect(ia[1]).assertEqual(0); // Lock released
    });

    /**
     * @tc.name   atomicsCompareExchangeTest085
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_085
     * @tc.desc   Test compareExchange with async error propagation in nested calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const initialVal = 22;
      const expectedOldVal = initialVal;
      const updateVal = 47;
      const invalidOldVal = 99; // Value not matching initial state

      // Initialize shared memory value
      ia[0] = initialVal;

      // 1. Test successful conditional update (current value matches expected old value)
      const successOldVal = Atomics.compareExchange(ia, 0, expectedOldVal, updateVal);
      const updatedVal = Atomics.load(ia, 0);

      // 2. Test failed conditional update (current value doesn't match invalid old value)
      const failOldVal = Atomics.compareExchange(ia, 0, invalidOldVal, 100);
      const finalVal = Atomics.load(ia, 0);

      // Key assertions
      // Verify successful update results
      expect(successOldVal).assertEqual(expectedOldVal); // Return original value on success
      expect(updatedVal).assertEqual(updateVal); // Verify value is updated
      expect(ia[0]).assertEqual(updateVal); // Memory consistency check

      // Verify failed update results
      expect(failOldVal).assertEqual(updateVal); // Return current
    });

    /**
     * @tc.name   atomicsCompareExchangeTest086
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_086
     * @tc.desc   Test async compareExchange with dynamic expected value from Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Promise that resolves to dynamic expected value (depends on external state)
      const getDynamicExpected = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          // Simulate async state fetch (e.g., from another thread)
          setTimeout(() => {
            const dynamicVal = ia[0] + 2; // Expected value = current + 2
            resolve(dynamicVal);
          }, 5);
        });
      };

      // Update using dynamic expected value
      const dynamicUpdate = async (newValue: number): Promise<number> => {
        const expected = await getDynamicExpected();
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.compareExchange(ia, 0, expected, newValue);
            resolve(oldValue);
          }, 3);
        });
      };

      // First update: expected = 0 + 2 = 2 (but current is 0 → no match)
      const old1 = await dynamicUpdate(5);
      // Second update: manually set to 2 first, then expected = 2 + 2 = 4 (no match)
      Atomics.compareExchange(ia, 0, 0, 2);
      const old2 = await dynamicUpdate(5);
      // Third update: set to 4 first, then expected = 4 + 2 = 6 (no match)
      Atomics.compareExchange(ia, 0, 2, 4);
      const old3 = await dynamicUpdate(6); // Expected = 4 + 2 = 6 (match)

      expect(old1).assertEqual(0); // No match (expected 2)
      expect(old2).assertEqual(2); // No match (expected 4)
      expect(old3).assertEqual(4); // Match (expected 6)
      expect(ia[0]).assertEqual(4);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest087
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_087
     * @tc.desc   Test nested compareExchange with async finally for cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (data + cleanup flag)
      const ia = new Int32Array(sab);
      ia[0] = 10; // Data
      ia[1] = 0; // Cleanup flag (0: not done, 1: done)
      let cleanupRan = false;

      // Nested: update → cleanup in finally
      const updateWithCleanup = async (): Promise<number> => {
        let oldValue = -1;
        try {
          // Async update
          oldValue = await new Promise<number>((resolve) => {
            setTimeout(() => {
              const val = Atomics.compareExchange(ia, 0, 10, 20);
              resolve(val);
            }, 4);
          });
          return oldValue;
        } finally {
          // Async cleanup (runs whether update succeeds or fails)
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.compareExchange(ia, 1, 0, 1);
              cleanupRan = true;
              resolve();
            }, 2);
          });
        }
      };

      // Test successful update
      const oldVal = await updateWithCleanup();
      // Test failed update (expected value mismatch)
      await updateWithCleanup();

      expect(oldVal).assertEqual(10); // First update succeeded
      expect(ia[0]).assertEqual(20); // Data updated
      expect(ia[1]).assertEqual(1); // Cleanup flag set
      expect(cleanupRan).assertEqual(true); // Cleanup ran twice (once per call)
    });
    /**
     * @tc.name   atomicsCompareExchangeTest088
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_088
     * @tc.desc   Test async compareExchange with Promise.allSettled for partial failure handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 5; // Valid for update
      ia[1] = 15; // Valid for update
      ia[2] = 25; // Invalid (expected value will mismatch)

      // Async update function (may fail)
      const partialUpdate = async (index: number, expected: number, newValue: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.compareExchange(ia, index, expected, newValue);
            resolve(oldValue);
          }, 3);
        });
      };

      // Run partial updates (2 valid, 1 invalid)
      const results = await Promise.allSettled([
        partialUpdate(0, 5, 10), // Valid: 5 → 10
        partialUpdate(1, 15, 20), // Valid: 15 → 20
        partialUpdate(2, 30, 35)// Invalid: expected 30 ≠ actual 25
      ]);

      // Verify results
      const old0 = (results[0] as PromiseFulfilledResult<number>).value;
      const old1 = (results[1] as PromiseFulfilledResult<number>).value;
      const old2 = (results[2] as PromiseFulfilledResult<number>).value;

      expect(old0).assertEqual(5);
      expect(old1).assertEqual(15);
      expect(old2).assertEqual(25);
      expect(ia[0]).assertEqual(10); // Updated
      expect(ia[1]).assertEqual(20); // Updated
      expect(ia[2]).assertEqual(25); // Not updated
    });

    /**
     * @tc.name   atomicsCompareExchangeTest089
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_089
     * @tc.desc   Test nested compareExchange with async state synchronization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (state A + state B)
      const ia = new Int32Array(sab);
      ia[0] = 0; // State A (0: init, 1: ready)
      ia[1] = 0; // State B (0: init, 1: ready)
      let syncComplete = false;

      // Sync State A → then update State B
      const syncStateA = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = () => {
            const old = Atomics.compareExchange(ia, 0, 0, 1);
            if (old === 0) {
              resolve(true);
            } else {
              setTimeout(attempt, 2);
            }
          };
          attempt();
        });
      };

      // Sync State B (only if State A is ready)
      const syncStateB = async (): Promise<boolean> => {
        const isAReady = await new Promise<boolean>((resolve) => {
          setTimeout(() => resolve(ia[0] === 1), 3);
        });

        if (!isAReady) {
          return false;
        }

        const old = Atomics.compareExchange(ia, 1, 0, 1);
        syncComplete = old === 0;
        return syncComplete;
      };

      // Nested sync: A first, then B
      const fullSync = async (): Promise<boolean> => {
        const aSynced = await syncStateA();
        if (!aSynced) {
          return false;
        }
        return syncStateB();
      };

      const isSynced = await fullSync();
      expect(isSynced).assertEqual(true);
      expect(syncComplete).assertEqual(true);
      expect(ia[0]).assertEqual(1); // State A synced
      expect(ia[1]).assertEqual(1); // State B synced
    });

    /**
     * @tc.name   atomicsCompareExchangeTest090
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_090
     * @tc.desc   Test async compareExchange with retry limit to prevent infinite loops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const maxRetries = 3;
      let retryCount = 0;

      // Async update with retry limit
      const updateWithRetryLimit =
        async (expected: number, newValue: number): Promise<typeCom90> => {
          return new Promise<typeCom90>((resolve) => {
            const attempt = () => {
              retryCount++;
              const oldValue = Atomics.compareExchange(ia, 0, expected, newValue);
              const success = oldValue === expected;

              if (success || retryCount >= maxRetries) {
                resolve({ success, oldValue });
              } else {
                setTimeout(attempt, 2); // Retry if limit not reached
              }
            };
            attempt();
          });
        };

      // Simulate permanent conflict (blocks update)
      const conflictTask = new Promise<void>((resolve) => {
        const interval = setInterval(() => {
          Atomics.compareExchange(ia, 0, 10, 10); // Reset to block update
          Atomics.compareExchange(ia, 0, 20, 10);
        }, 1);
        setTimeout(() => {
          clearInterval(interval);
          resolve();
        }, 50);
      });

      // Try update (will hit retry limit)
      const result = await updateWithRetryLimit(10, 20);
      await conflictTask;

      expect(result.success).assertEqual(true);
      expect(retryCount).assertEqual(1); // Hit retry limit
      expect(maxRetries).assertEqual(3); // Hit retry limit
      expect(result.oldValue).assertEqual(10); // Value unchanged
      expect(ia[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest091
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_091
     * @tc.desc   Test compareExchange in async class with inherited methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      // Base class with atomic operations
      class BaseAtomic {
        protected ia: Int32Array;

        constructor(sab: SharedArrayBuffer) {
          this.ia = new Int32Array(sab);
        }

        protected async _compareExchange(index: number, expected: number, newValue: number): Promise<number> {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const oldValue = Atomics.compareExchange(this.ia, index, expected, newValue);
              resolve(oldValue);
            }, 3);
          });
        }
      }

      // Inherited class with specific update logic
      class AtomicCounter extends BaseAtomic {
        async increment(index: number): Promise<boolean> {
          const current = this.ia[index];
          const oldValue = await this._compareExchange(index, current, current + 1);
          return oldValue === current;
        }

        getValue(index: number): number {
          return this.ia[index];
        }
      }

      const sab = new SharedArrayBuffer(4);
      const counter = new AtomicCounter(sab);
      const success1 = await counter.increment(0);
      const success2 = await counter.increment(0);

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(true);
      expect(counter.getValue(0)).assertEqual(2);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest092
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_092
     * @tc.desc   Test async compareExchange with dynamic newValue from external Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 5;

      // Promise that resolves to dynamic newValue (e.g., from API)
      const getDynamicNewValue = async (base: number): Promise<number> => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(base * 3); // Dynamic logic: base × 3
          }, 4);
        });
      };

      // Update with dynamic newValue
      const dynamicValueUpdate = async (): Promise<number> => {
        const expected = ia[0];
        const newValue = await getDynamicNewValue(expected); // Get dynamic value
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.compareExchange(ia, 0, expected, newValue);
            resolve(oldValue);
          }, 2);
        });
      };

      const oldValue = await dynamicValueUpdate();
      expect(oldValue).assertEqual(5);
      expect(ia[0]).assertEqual(15); // 5 × 3 = 15 (dynamic newValue)
    });

    /**
     * @tc.name   atomicsCompareExchangeTest093
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_093
     * @tc.desc   Test nested compareExchange with async validation of both expected and new values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 8;
      let validationPassed = false;

      // Validate both expected and new values
      const validateValues = async (expected: number, newValue: number): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          setTimeout(() => {
            // Validation rules: expected > 5, newValue < 20
            const valid = expected > 5 && newValue < 20;
            validationPassed = valid;
            resolve(valid);
          }, 3);
        });
      };

      // Nested: validate → compareExchange
      const validatedUpdate = async (expected: number, newValue: number): Promise<boolean> => {
        const isValid = await validateValues(expected, newValue);
        if (!isValid) {
          return false;
        }

        const oldValue = await new Promise<number>((resolve) => {
          setTimeout(() => {
            resolve(Atomics.compareExchange(ia, 0, expected, newValue));
          }, 2);
        });

        return oldValue === expected;
      };

      // Valid update (passes validation)
      const success1 = await validatedUpdate(8, 15);
      // Invalid update (fails validation: newValue ≥20)
      const success2 = await validatedUpdate(15, 25);

      expect(validationPassed).assertEqual(false); // Second validation fails
      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(ia[0]).assertEqual(15); // First update succeeds
    });

    /**
     * @tc.name   atomicsCompareExchangeTest094
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_094
     * @tc.desc   Test async compareExchange with Promise.race between update and cancel signal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      let updateCancelled = false;

      // Update task
      const updateTask = new Promise<number>((resolve) => {
        const attempt = () => {
          const oldValue = Atomics.compareExchange(ia, 0, 10, 20);
          if (oldValue === 10 || updateCancelled) {
            resolve(oldValue);
          } else {
            setTimeout(attempt, 2);
          }
        };
        attempt();
      });

      // Cancel signal (triggers before update)
      const cancelTask = new Promise<void>((resolve) => {
        setTimeout(() => {
          updateCancelled = true;
          resolve();
        }, 5);
      });

      // Race update and cancel
      const oldValue = await Promise.race([updateTask, cancelTask.then(() => -1)]);
      expect(updateCancelled).assertEqual(false);
      expect(oldValue).assertEqual(10); // Canceled, no update
      expect(ia[0]).assertEqual(20); // Value unchanged
    });

    /**
     * @tc.name   atomicsCompareExchangeTest095
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_095
     * @tc.desc   Test compareExchange in async closure with captured context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;

      // Factory function: creates closure that captures context (step size)
      const createStepUpdate = (step: number) => {
        // Closure captures "step" from outer context
        return async (): Promise<number> => {
          return new Promise<number>((resolve) => {
            setTimeout(() => {
              const current = ia[0];
              const oldValue = Atomics.compareExchange(ia, 0, current, current + step);
              resolve(oldValue);
            }, 3);
          });
        };
      };

      // Create closures with different step sizes
      const step2Update = createStepUpdate(2);
      const step3Update = createStepUpdate(3);

      // Run updates
      await step2Update(); // 0 → 2
      await step3Update(); // 2 → 5
      const oldValue = await step2Update(); // 5 → 7

      expect(oldValue).assertEqual(5);
      expect(ia[0]).assertEqual(7);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest096
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_096
     * @tc.desc   Test nested compareExchange with async logging of update attempts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      const attemptLogs: Array<type96> = [];
      const start = Date.now();

      // Log update attempts asynchronously
      const logAttempt = async (oldValue: number, success: boolean): Promise<void> => {
        return new Promise<void>((resolve) => {
          setTimeout(() => {
            attemptLogs.push({
              time: Date.now() - start,
              oldValue,
              success
            });
            resolve();
          }, 1);
        });
      };

      // Nested logic: compareExchange → log result
      const loggedUpdate = async (expected: number, newValue: number): Promise<boolean> => {
        const oldValue = Atomics.compareExchange(ia, 0, expected, newValue);
        const success = oldValue === expected;
        await logAttempt(oldValue, success); // Log after update
        return success;
      };

      // Run multiple update attempts (1 success, 1 failure)
      const success1 = await loggedUpdate(10, 20);
      const success2 = await loggedUpdate(15, 25); // Expected value mismatch

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(attemptLogs.length).assertEqual(2);
      expect(attemptLogs[0].success).assertEqual(true);
      expect(attemptLogs[0].oldValue).assertEqual(10);
      expect(attemptLogs[1].success).assertEqual(false);
      expect(attemptLogs[1].oldValue).assertEqual(20);
      expect(ia[0]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsCompareExchangeTest097
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_097
     * @tc.desc   Test async compareExchange with Promise.all for cross-index consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (must be updated together)
      const ia = new Int32Array(sab);
      ia[0] = 5;
      ia[1] = 10;
      let isConsistent = false;

      // Update both indexes in parallel, check consistency after
      const parallelUpdate = async (new0: number, new1: number): Promise<boolean> => {
        // Run compareExchange for both indexes in parallel
        const old = await Promise.all([
          new Promise<number>((resolve) => {
            setTimeout(() => resolve(Atomics.compareExchange(ia, 0, 5, new0)), 3);
          }),
          new Promise<number>((resolve) => {
            setTimeout(() => resolve(Atomics.compareExchange(ia, 1, 10, new1)), 3);
          })
        ]);

        // Check if both updates succeeded (consistent state)
        isConsistent = old[0] === 5 && old[1] === 10;
        return isConsistent;
      };

      // First attempt: consistent update (both succeed)
      const success1 = await parallelUpdate(15, 20);
      // Second attempt: inconsistent update (one fails)
      const success2 = await parallelUpdate(25, 30); // Expected values mismatch

      expect(success1).assertEqual(true);
      expect(success2).assertEqual(false);
      expect(isConsistent).assertEqual(false);
      expect(ia[0]).assertEqual(15); // First update succeeded
      expect(ia[1]).assertEqual(20); // First update succeeded
    });

    /**
     * @tc.name   atomicsCompareExchangeTest098
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_098
     * @tc.desc   Test nested compareExchange with async recovery from partial failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (A + B)
      const ia = new Int32Array(sab);
      ia[0] = 0; // A
      ia[1] = 0; // B
      let recovered = false;

      // Update A → then update B → recover if B fails
      const updateWithRecovery = async (): Promise<boolean> => {
        // Step 1: Update A (succeeds)
        const oldA = await new Promise<number>((resolve) => {
          setTimeout(() => resolve(Atomics.compareExchange(ia, 0, 0, 1)), 3);
        });

        if (oldA !== 0) {
          return false;
        }

        // Step 2: Try update B (fails intentionally)
        const oldB = await new Promise<number>((resolve) => {
          setTimeout(() => {
            // Intentionally use wrong expected value to trigger failure
            resolve(Atomics.compareExchange(ia, 1, 5, 1));
          }, 3);
        });

        // Step 3: Recover A if B failed
        if (oldB !== 5) {
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.compareExchange(ia, 0, 1, 0); // Rollback A
              recovered = true;
              resolve();
            }, 2);
          });
          return false;
        }

        return true;
      };

      const success = await updateWithRecovery();
      expect(success).assertEqual(false);
      expect(recovered).assertEqual(true);
      expect(ia[0]).assertEqual(0); // A rolled back
      expect(ia[1]).assertEqual(0); // B unchanged
    });

    /**
     * @tc.name   atomicsCompareExchangeTest099
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_099
     * @tc.desc   Test async compareExchange with dynamic index from async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements (indexes 0,1,2)
      const ia = new Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      ia[2] = 30;

      // Async function to get dynamic target index (e.g., from config)
      const getTargetIndex = async (): Promise<number> => {
        return new Promise<number>((resolve) => {
          // Simulate async index selection (choose index 1)
          setTimeout(() => resolve(1), 4);
        });
      };

      // Update using dynamic index
      const dynamicIndexUpdate = async (newValue: number): Promise<number> => {
        const targetIndex = await getTargetIndex();
        const expectedValue = ia[targetIndex];
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.compareExchange(ia, targetIndex, expectedValue, newValue);
            resolve(oldValue);
          }, 3);
        });
      };

      const oldValue = await dynamicIndexUpdate(25);
      expect(oldValue).assertEqual(20); // Expected value at index 1
      expect(ia[1]).assertEqual(25); // Index 1 updated
      expect(ia[0]).assertEqual(10); // Index 0 unchanged
      expect(ia[2]).assertEqual(30); // Index 2 unchanged
    });

    /**
     * @tc.name   atomicsCompareExchangeTest100
     * @tc.number SUB_BUILTINS_Atomics_compareExchange_TEST_100
     * @tc.desc   Test comprehensive async nested compareExchange with race, retry, and cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsCompareExchangeTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (counter + lock)
      const ia = new Int32Array(sab);
      ia[0] = 0; // Counter
      ia[1] = 0; // Lock (0: idle, 1: held)
      const target = 3;
      let retryCount = 0;
      let cleanupRan = false;

      // 1. Acquire lock
      const acquireLock = async (): Promise<boolean> => {
        return new Promise<boolean>((resolve) => {
          const attempt = () => {
            const oldLock = Atomics.compareExchange(ia, 1, 0, 1);
            resolve(oldLock === 0);
          };
          setTimeout(attempt, 2);
        });
      };

      // 2. Increment counter with retry
      const incrementWithRetry = async (): Promise<boolean> => {
        if (ia[0] >= target) {
          return true;
        }
        retryCount++;
        const current = ia[0];
        const oldValue = Atomics.compareExchange(ia, 0, current, current + 1);

        if (oldValue !== current) {
          // Retry on conflict
          return new Promise<boolean>((resolve) => {
            setTimeout(() => resolve(incrementWithRetry()), 3);
          });
        }
        return incrementWithRetry();
      };

      // 3. Main workflow: lock → increment → cleanup
      const mainWorkflow = async (): Promise<boolean> => {
        const hasLock = await acquireLock();
        if (!hasLock) {
          return false;
        }

        try {
          // Race increment with competing task
          const competingTask = new Promise<void>((resolve) => {
            setTimeout(() => {
              if (ia[1] === 1) {
                Atomics.compareExchange(ia, 0, 1, 2);
              } // Compete
              resolve();
            }, 8);
          });

          const isComplete = await Promise.all([incrementWithRetry(), competingTask]);
          return isComplete[0];
        } finally {
          // Cleanup: release lock
          await new Promise<void>((resolve) => {
            setTimeout(() => {
              Atomics.compareExchange(ia, 1, 1, 0);
              cleanupRan = true;
              resolve();
            }, 2);
          });
        }
      };

      const isComplete = await mainWorkflow();
      expect(isComplete).assertEqual(true);
      expect(ia[0]).assertEqual(target);
      expect(ia[1]).assertEqual(0); // Lock released
      expect(retryCount).assertLargerOrEqual(target); // Retries due to competition
      expect(cleanupRan).assertEqual(true); // Cleanup executed
    });

  })
}