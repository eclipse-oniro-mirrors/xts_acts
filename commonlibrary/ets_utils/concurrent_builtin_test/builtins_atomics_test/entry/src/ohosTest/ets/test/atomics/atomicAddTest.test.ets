import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { atomicAddGenerator } from './atomics';
import { sleep } from './utils';


export default function atomicsAddTest() {
  describe('atomicsAddTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   atomicsAddTest001
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0101
     * @tc.desc   Basic functionality test: adds a value to an Int32Array and returns the old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const oldValue = Atomics.add(ta, 0, 10);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(10);
    });

    /**
     * @tc.name   atomicsAddTest002
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0102
     * @tc.desc   Test with negative value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      Atomics.store(ta, 0, 20);

      const oldValue = Atomics.add(ta, 0, -5);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(20);
      expect(newValue).assertEqual(15);
    });

    /**
     * @tc.name   atomicsAddTest003
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0103
     * @tc.desc   Test with Uint8Array and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);
      Atomics.store(ta, 0, 250);

      const oldValue = Atomics.add(ta, 0, 10);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(250);
      expect(newValue).assertEqual(4); // 250 + 10 = 260, which overflows to 4 for Uint8
    });

    /**
     * @tc.name   atomicsAddTest004
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0104
     * @tc.desc   Test with BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      Atomics.store(ta, 0, BigInt(-9007199254740991)); // Large negative value

      const oldValue = Atomics.add(ta, 0, BigInt(1000000000000000));
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(BigInt(-9007199254740991));
      expect(newValue).assertEqual(BigInt(-8007199254740991));
    });

    /**
     * @tc.name   atomicsAddTest005
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0005
     * @tc.desc   Test Atomics.add with Int32Array and positive value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);

      // Initialize with a positive value
      i32a[0] = 100;

      // Add a positive value
      const oldValue = Atomics.add(i32a, 0, 50);
      const newValue = Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(100);

      // Verify the new value is correct (100 + 50 = 150)
      expect(newValue).assertEqual(150);
    });

    /**
     * @tc.name   atomicsAddTest006
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0006
     * @tc.desc   Test Atomics.add with Int32Array and zero value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);

      // Initialize with a positive value
      i32a[0] = 100;

      // Add zero
      const oldValue = Atomics.add(i32a, 0, 0);
      const newValue = Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(100);

      // Verify the value remains the same (100 + 0 = 100)
      expect(newValue).assertEqual(100);
    });

    /**
     * @tc.name   atomicsAddTest007
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0007
     * @tc.desc   Test Atomics.add with Int32Array and maximum value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);

      // Initialize with maximum Int32 value
      i32a[0] = 2147483647;

      // Add 1, which should cause overflow
      const oldValue = Atomics.add(i32a, 0, 1);
      const newValue = Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(2147483647);

      // Verify the new value wraps around to minimum Int32 value
      expect(newValue).assertEqual(-2147483648);
    });

    /**
     * @tc.name   atomicsAddTest008
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0008
     * @tc.desc   Test Atomics.add with Uint32Array and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const u32a = new Uint32Array(sab);

      // Initialize with maximum Uint32 value
      u32a[0] = 4294967295;

      // Add 1, which should cause overflow
      const oldValue = Atomics.add(u32a, 0, 1);
      const newValue = Atomics.load(u32a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(4294967295);

      // Verify the new value wraps around to 0
      expect(newValue).assertEqual(0);
    });

    /**
     * @tc.name   atomicsAddTest009
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0009
     * @tc.desc   Test Atomics.add with multiple indices in the same array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(8); // 2 elements of 4 bytes each
      const i32a = new Int32Array(sab);

      // Initialize both elements
      i32a[0] = 10;
      i32a[1] = 20;

      // Add to first element
      const oldValue0 = Atomics.add(i32a, 0, 5);

      // Add to second element
      const oldValue1 = Atomics.add(i32a, 1, 10);

      // Verify old values
      expect(oldValue0).assertEqual(10);
      expect(oldValue1).assertEqual(20);

      // Verify new values
      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(30);
    });
    /**
     * @tc.name   atomicsAddTest010
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0110
     * @tc.desc   Test with zero value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      Atomics.store(ta, 0, 5);

      const oldValue = Atomics.add(ta, 0, 0);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(5);
      expect(newValue).assertEqual(5);
    });

    /**
     * @tc.name   atomicsAddTest011
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0111
     * @tc.desc   Test with Uint32Array and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      Atomics.store(ta, 0, 4294967290); // Near maximum for Uint32

      const oldValue = Atomics.add(ta, 0, 10);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(4294967290);
      expect(newValue).assertEqual(4); // 4294967290 + 10 = 4294967300, which overflows to 4 for Uint32
    });

    /**
     * @tc.name   atomicsAddTest012
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0112
     * @tc.desc   Test with Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int16Array(sab);
      Atomics.store(ta, 0, 32760); // Near maximum for Int16

      const oldValue = Atomics.add(ta, 0, 10);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(32760);
      expect(newValue).assertEqual(-32766); // Overflow behavior for Int16
    });

    /**
     * @tc.name   atomicsAddTest013
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0113
     * @tc.desc   Test with Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint16Array(sab);
      Atomics.store(ta, 0, 65530); // Near maximum for Uint16

      const oldValue = Atomics.add(ta, 0, 10);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(65530);
      expect(newValue).assertEqual(4); // Overflow behavior for Uint16
    });

    /**
     * @tc.name   atomicsAddTest014
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0114
     * @tc.desc   Test with Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int8Array(sab);
      Atomics.store(ta, 0, 120); // Near maximum for Int8

      const oldValue = Atomics.add(ta, 0, 10);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(120);
      expect(newValue).assertEqual(-126); // Overflow behavior for Int8
    });

    /**
     * @tc.name   atomicsAddTest015
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0115
     * @tc.desc   Test with BigUint64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      Atomics.store(ta, 0, BigInt(9007199254740991)); // Large value

      const oldValue = Atomics.add(ta, 0, BigInt(1000000000000000));
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(9007199254740991n);
      expect(newValue).assertEqual(10007199254740991n);
    });

    /**
     * @tc.name   atomicsAddTest016
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0116
     * @tc.desc   Test with multiple threads using Web Workers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(16);
      const i32a = new Int32Array(sab);
      const u32a = new Uint32Array(sab);

      // Initialize the first element
      i32a[0] = 100;

      // Both views should see the same initial value
      expect(i32a[0]).assertEqual(100);
      expect(u32a[0]).assertEqual(100);

      // Perform add using the Int32Array view
      const oldValue = Atomics.add(i32a, 0, 50);

      // Both views should see the updated value
      expect(oldValue).assertEqual(100);
      expect(i32a[0]).assertEqual(150);
      expect(u32a[0]).assertEqual(150);

      // Perform add using the Uint32Array view
      const oldValue2 = Atomics.add(u32a, 0, 50);

      // Both views should see the updated value
      expect(oldValue2).assertEqual(150);
      expect(i32a[0]).assertEqual(200);
      expect(u32a[0]).assertEqual(200);
    });

    /**
     * @tc.name   atomicsAddTest017
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0117
     * @tc.desc   Test with Atomics.wait and Atomics.wake
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const u8a = new Uint8Array(sab);

      // Test 1: Basic addition
      u8a[0] = 100;
      const oldValue1 = Atomics.add(u8a, 0, 50);
      expect(oldValue1).assertEqual(100);
      expect(u8a[0]).assertEqual(150);

      // Test 2: Addition causing overflow
      u8a[0] = 250;
      const oldValue2 = Atomics.add(u8a, 0, 10);
      expect(oldValue2).assertEqual(250);
      expect(u8a[0]).assertEqual(4); // 250 + 10 = 260, which wraps to 4 for Uint8

      // Test 3: Adding zero
      u8a[0] = 75;
      const oldValue3 = Atomics.add(u8a, 0, 0);
      expect(oldValue3).assertEqual(75);
      expect(u8a[0]).assertEqual(75);

      // Test 4: Adding negative value
      u8a[0] = 50;
      const oldValue4 = Atomics.add(u8a, 0, -10);
      expect(oldValue4).assertEqual(50);
      expect(u8a[0]).assertEqual(40);
    });


    /**
     * @tc.name   atomicsAddTest018
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0118
     * @tc.desc   Test with large value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const largeValue = BigInt('9007199254740991'); // 2^53 - 1

      const oldValue = Atomics.add(ta, 0, largeValue);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(BigInt(0));
      expect(newValue).assertEqual(largeValue);
    });

    /**
     * @tc.name   atomicsAddTest019
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0119
     * @tc.desc   Test with negative value and overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const minValue = -2147483648; // Minimum value for Int32

      Atomics.store(ta, 0, minValue);

      const oldValue = Atomics.add(ta, 0, -1);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(minValue);
      expect(newValue).assertEqual(2147483647); // Overflow to maximum value
    });

    /**
     * @tc.name   atomicsAddTest020
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0120
     * @tc.desc   Test with zero initial value and multiple additions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      const valuesToAdd = [1, -2, 3, -4, 5];
      let expectedValue = 0;

      for (const value of valuesToAdd) {
        const oldValue = Atomics.add(ta, 0, value);
        expect(oldValue).assertEqual(expectedValue);
        expectedValue += value;
      }

      expect(Atomics.load(ta, 0)).assertEqual(3); // 1 - 2 + 3 - 4 + 5 = 3
    });

    /**
     * @tc.name   atomicsAddTest021
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0121
     * @tc.desc   Test with non-zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const initialValue = 100;

      Atomics.store(ta, 0, initialValue);

      const oldValue = Atomics.add(ta, 0, 50);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(initialValue);
      expect(newValue).assertEqual(initialValue + 50);
    });

    /**
     * @tc.name   atomicsAddTest022
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0122
     * @tc.desc   Test with different indices in the same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(16); // 4 elements of Int32
      const ta = new Int32Array(sab);

      // Initialize all elements
      Atomics.store(ta, 0, 10);
      Atomics.store(ta, 1, 20);
      Atomics.store(ta, 2, 30);
      Atomics.store(ta, 3, 40);

      // Add to each element
      const oldValue0 = Atomics.add(ta, 0, 5);
      const oldValue1 = Atomics.add(ta, 1, 5);
      const oldValue2 = Atomics.add(ta, 2, 5);
      const oldValue3 = Atomics.add(ta, 3, 5);

      // Verify old values
      expect(oldValue0).assertEqual(10);
      expect(oldValue1).assertEqual(20);
      expect(oldValue2).assertEqual(30);
      expect(oldValue3).assertEqual(40);

      // Verify new values
      expect(Atomics.load(ta, 0)).assertEqual(15);
      expect(Atomics.load(ta, 1)).assertEqual(25);
      expect(Atomics.load(ta, 2)).assertEqual(35);
      expect(Atomics.load(ta, 3)).assertEqual(45);
    });

    /**
     * @tc.name   atomicsAddTest023
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0123
     * @tc.desc   Test with Atomics.compareExchange after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      Atomics.add(ta, 0, 10);

      // Compare and exchange if value is 10
      const oldValue = Atomics.compareExchange(ta, 0, 10, 20);

      expect(oldValue).assertEqual(10);
      expect(Atomics.load(ta, 0)).assertEqual(20);
    });

    /**
     * @tc.name   atomicsAddTest024
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0124
     * @tc.desc   Test with Atomics.exchange after add
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      Atomics.add(ta, 0, 10);

      // Exchange the value
      const oldValue = Atomics.exchange(ta, 0, 20);

      expect(oldValue).assertEqual(10);
      expect(Atomics.load(ta, 0)).assertEqual(20);
    });

    /**
     * @tc.name   atomicsAddTest025
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0125
     * @tc.desc   Test with large buffer size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bufferSize = 1024 * 4; // 1024 Int32 elements
      const sab = new SharedArrayBuffer(bufferSize);
      const ta = new Int32Array(sab);
      const index = 512; // Middle index

      const oldValue = Atomics.add(ta, index, 100);
      const newValue = Atomics.load(ta, index);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(100);
    });

    /**
     * @tc.name   atomicsAddTest026
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0126
     * @tc.desc   Test with zero buffer size (should throw RangeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const u8a = new Uint8Array(sab);
      u8a [0] = 50
      // Test 1= 50;
      const oldValue1 = Atomics.add(u8a, 0, 30);
      expect(oldValue1).assertEqual(50);
      expect(u8a[0]).assertEqual(80);

      // Test 2= 200;
      u8a [1] = 200
      const oldValue2 = Atomics.add(u8a, 1, 100);
      expect(oldValue2).assertEqual(200);
      expect(u8a[1]).assertEqual(44); // 200 + 100 = 300, which wraps to 44 for Uint8

      // Test 3= 75;
      u8a [2] = 75
      const oldValue3 = Atomics.add(u8a, 2, 0);
      expect(oldValue3).assertEqual(75);
      expect(u8a[2]).assertEqual(75);

      // Test 4= 25;
      u8a [3] = 25
      const oldValue4 = Atomics.add(u8a, 3, -10);
      expect(oldValue4).assertEqual(25);
      expect(u8a[3]).assertEqual(15);
    });

    /**
     * @tc.name   atomicsAddTest027
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0127
     * @tc.desc   Test with non-shared ArrayBuffer (should throw TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ab = new ArrayBuffer(4);
      const ta = new Int32Array(ab);

      try {
        Atomics.add(ta, 0, 10)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsAddTest028
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0028
     * @tc.desc   Test Atomics.add with Int16Array and basic functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(2);
      const i16a = new Int16Array(sab);

      // Initialize with a positive value
      i16a[0] = 1000;

      // Add a positive value
      const oldValue = Atomics.add(i16a, 0, 500);
      const newValue = Atomics.load(i16a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(1000);

      // Verify the new value is correct (1000 + 500 = 1500)
      expect(newValue).assertEqual(1500);
    });

    /**
     * @tc.name   atomicsAddTest029
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0029
     * @tc.desc   Test Atomics.add with Uint16Array and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(2);
      const u16a = new Uint16Array(sab);

      // Initialize with maximum Uint16 value
      u16a[0] = 65535;

      // Add 1, which should cause overflow
      const oldValue = Atomics.add(u16a, 0, 1);
      const newValue = Atomics.load(u16a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(65535);

      // Verify the new value wraps around to 0
      expect(newValue).assertEqual(0);
    });

    /**
     * @tc.name   atomicsAddTest030
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0030
     * @tc.desc   Test Atomics.add with Int8Array and negative value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(1);
      const i8a = new Int8Array(sab);

      // Initialize with a positive value
      i8a[0] = 50;

      // Add a negative value
      const oldValue = Atomics.add(i8a, 0, -20);
      const newValue = Atomics.load(i8a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(50);

      // Verify the new value is correct (50 + (-20) = 30)
      expect(newValue).assertEqual(30);
    });

    /**
     * @tc.name   atomicsAddTest031
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0031
     * @tc.desc   Test Atomics.add with Int8Array and underflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(1);
      const i8a = new Int8Array(sab);

      // Initialize with minimum Int8 value
      i8a[0] = -128;

      // Add -1, which should cause underflow
      const oldValue = Atomics.add(i8a, 0, -1);
      const newValue = Atomics.load(i8a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(-128);

      // Verify the new value wraps around to maximum Int8 value
      expect(newValue).assertEqual(127);
    });

    /**
     * @tc.name   atomicsAddTest032
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0032
     * @tc.desc   Test Atomics.add with multiple operations on the same index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);

      // Initialize with 0
      i32a[0] = 0;

      // Perform multiple add operations
      const oldValue1 = Atomics.add(i32a, 0, 10);
      const oldValue2 = Atomics.add(i32a, 0, 20);
      const oldValue3 = Atomics.add(i32a, 0, 30);

      // Verify old values
      expect(oldValue1).assertEqual(0);
      expect(oldValue2).assertEqual(10);
      expect(oldValue3).assertEqual(30);

      // Verify final value (0 + 10 + 20 + 30 = 60)
      expect(i32a[0]).assertEqual(60);
    });

    /**
     * @tc.name   atomicsAddTest033
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0033
     * @tc.desc   Test Atomics.add with large negative value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);

      // Initialize with a positive value
      i32a[0] = 1000000;

      // Add a large negative value
      const oldValue = Atomics.add(i32a, 0, -2000000);
      const newValue = Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(1000000);

      // Verify the new value is correct (1000000 + (-2000000) = -1000000)
      expect(newValue).assertEqual(-1000000);
    });

    /**
     * @tc.name   atomicsAddTest034
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0034
     * @tc.desc   Test Atomics.add with different data types in the same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(8);

      // Create different views on the same buffer
      const u8a = new Uint8Array(sab);
      const u16a = new Uint16Array(sab);
      const u32a = new Uint32Array(sab);

      // Initialize using Uint8Array
      u8a[0] = 0xFF;
      u8a[1] = 0xFF;
      u8a[2] = 0xFF;
      u8a[3] = 0xFF;

      // Add to Uint16Array view
      const oldValue16 = Atomics.add(u16a, 0, 1);

      // Add to Uint32Array view
      const oldValue32 = Atomics.add(u32a, 0, 1);

      // Verify old values
      expect(oldValue16).assertEqual(0xFFFF);
      expect(oldValue32).assertEqual(4294901760);

      // Verify final values
      expect(u32a[0]).assertEqual(0xFFFF0001);
      expect(u16a[0]).assertEqual(0x0001);
      expect(u16a[1]).assertEqual(65535);
    });

    /**
     * @tc.name   atomicsAddTest035
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0135
     * @tc.desc   Test with NaN as value (should throw TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      try {
        Atomics.add(ta, 0, NaN)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsAddTest036
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0136
     * @tc.desc   Test with Infinity as value (should throw TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      try {
        Atomics.add(ta, 0, Infinity)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsAddTest037
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0137
     * @tc.desc   Test with negative Infinity as value (should throw TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      try {
        Atomics.add(ta, 0, -Infinity)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsAddTest038
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0138
     * @tc.desc   Test with boolean as value (should throw TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      try {
        Atomics.add(ta, 0, Number.MAX_VALUE)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });

    /**
     * @tc.name   atomicsAddTest039
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0139
     * @tc.desc   Test with typed array view on different buffer offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta1 = new Int32Array(sab, 0, 2); // First two Int32 elements
      const ta2 = new Int32Array(sab, 4, 1); // Second Int32 element only

      Atomics.store(ta1, 1, 100);

      const oldValue = Atomics.add(ta2, 0, 50);
      const newValue = Atomics.load(ta2, 0);

      expect(oldValue).assertEqual(100);
      expect(newValue).assertEqual(150);
      expect(Atomics.load(ta1, 1)).assertEqual(150); // Should reflect the change
    });

    /**
     * @tc.name   atomicsAddTest040
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0140
     * @tc.desc   Test with multiple typed array views on the same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta1 = new Int32Array(sab);
      const ta2 = new Uint32Array(sab);

      Atomics.store(ta1, 0, -1); // Represented as 4294967295 in Uint32

      const oldValue1 = Atomics.add(ta1, 0, 1);
      const newValue1 = Atomics.load(ta1, 0);
      const newValue2 = Atomics.load(ta2, 0);

      expect(oldValue1).assertEqual(-1);
      expect(newValue1).assertEqual(0);
      expect(newValue2).assertEqual(0);
    });

    /**
     * @tc.name   atomicsAddTest041
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0141
     * @tc.desc   Test with Atomics.add in a loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const iterations = 1000;

      for (let i = 0; i < iterations; i++) {
        const oldValue = Atomics.add(ta, 0, 1);
        expect(oldValue).assertEqual(i);
      }

      expect(Atomics.load(ta, 0)).assertEqual(iterations);
    });

    /**
     * @tc.name   atomicsAddTest042
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0142
     * @tc.desc   Test with Atomics.add and Atomics.load in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      const oldValue1 = Atomics.add(ta, 0, 10);
      const value1 = Atomics.load(ta, 0);

      const oldValue2 = Atomics.add(ta, 0, 20);
      const value2 = Atomics.load(ta, 0);

      expect(oldValue1).assertEqual(0);
      expect(value1).assertEqual(10);
      expect(oldValue2).assertEqual(10);
      expect(value2).assertEqual(30);
    });

    /**
     * @tc.name   atomicsAddTest043
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0143
     * @tc.desc   Test with Atomics.add and Atomics.sub in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      Atomics.add(ta, 0, 10);
      const oldValue = Atomics.sub(ta, 0, 5);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(10);
      expect(newValue).assertEqual(5);
    });

    /**
     * @tc.name   atomicsAddTest044
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0144
     * @tc.desc   Test with Atomics.add and Atomics.and in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      Atomics.add(ta, 0, 15); // Binary: 1111
      const oldValue = Atomics.and(ta, 0, 7); // Binary: 0111
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(15);
      expect(newValue).assertEqual(7);
    });

    /**
     * @tc.name   atomicsAddTest045
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0145
     * @tc.desc   Test with Atomics.add and Atomics.or in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      Atomics.add(ta, 0, 7); // Binary: 0111
      const oldValue = Atomics.or(ta, 0, 8); // Binary: 1000
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(7);
      expect(newValue).assertEqual(15); // Binary: 1111
    });

    /**
     * @tc.name   atomicsAddTest046
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0146
     * @tc.desc   Test with Atomics.add and Atomics.xor in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      Atomics.add(ta, 0, 15); // Binary: 1111
      const oldValue = Atomics.xor(ta, 0, 7); // Binary: 0111
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(15);
      expect(newValue).assertEqual(8); // Binary: 1000
    });

    /**
     * @tc.name   atomicsAddTest047
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0147
     * @tc.desc   Test with Atomics.add and Atomics.notify (alias for Atomics.wake)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAddTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);

      // Initialize with a positive value
      i32a[0] = 100;

      // Add a negative value
      const oldValue = Atomics.add(i32a, 0, -50);
      const newValue = Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue).assertEqual(100);

      // Verify the new value is correct (100 + (-50) = 50)
      expect(newValue).assertEqual(50);

      // Add a negative value that causes underflow
      i32a[0] = -2147483648; // Minimum Int32 value
      const oldValue2 = Atomics.add(i32a, 0, -1);
      const newValue2 = Atomics.load(i32a, 0);

      // Verify the old value is correct
      expect(oldValue2).assertEqual(-2147483648);

      // Verify the new value wraps around to maximum Int32 value
      expect(newValue2).assertEqual(2147483647);
    });

    /**
     * @tc.name   atomicsAddTest048
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0148
     * @tc.desc   Test with Atomics.add and Atomics.isLockFree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      // Check if Int32 is lock-free
      const isLockFree = Atomics.isLockFree(Int32Array.BYTES_PER_ELEMENT);

      // Perform add operation
      const oldValue = Atomics.add(ta, 0, 10);
      const newValue = Atomics.load(ta, 0);

      expect(isLockFree).assertEqual(true); // Int32 should be lock-free on most platforms
      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(10);
    });

    /**
     * @tc.name   atomicsAddTest049
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0149
     * @tc.desc   Test with Atomics.add and large BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const largeValue = BigInt('123456789012345678901234567890');

      const oldValue = Atomics.add(ta, 0, largeValue);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(BigInt(0));
      expect(newValue).assertEqual(-4362896299872285998n);
    });

    /**
     * @tc.name   atomicsAddTest050
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0150
     * @tc.desc   Test with Atomics.add and multiple BigInt operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);

      const valuesToAdd = [
        BigInt('1000000000000000000'),
        BigInt('-500000000000000000'),
        BigInt('250000000000000000'),
        BigInt('-125000000000000000')
      ];

      let expectedValue = BigInt(0);

      for (const value of valuesToAdd) {
        const oldValue = Atomics.add(ta, 0, value);
        expect(oldValue).assertEqual(expectedValue);
        expectedValue += value;
      }

      expect(Atomics.load(ta, 0)).assertEqual(BigInt('625000000000000000'));
    });

    /**
     * @tc.name   atomicsAddTest051
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0151
     * @tc.desc   Test with Int32Array and large positive value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const largeValue = 2147483647; // Maximum value for Int32

      const oldValue = Atomics.add(ta, 0, largeValue);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(largeValue);
    });

    /**
     * @tc.name   atomicsAddTest052
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0152
     * @tc.desc   Test with Uint32Array and boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      const maxValue = 4294967295; // Maximum value for Uint32

      Atomics.store(ta, 0, maxValue);

      const oldValue = Atomics.add(ta, 0, 1);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(maxValue);
      expect(newValue).assertEqual(0); // Overflow to 0
    });

    /**
     * @tc.name   atomicsAddTest053
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0153
     * @tc.desc   Test with Int8Array and negative addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      Atomics.store(ta, 0, 50);

      const oldValue = Atomics.add(ta, 0, -20);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(50);
      expect(newValue).assertEqual(30);
    });

    /**
     * @tc.name   atomicsAddTest054
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0154
     * @tc.desc   Test with BigInt64Array and large positive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const largeValue = BigInt('9223372036854775807'); // Maximum value for BigInt64

      const oldValue = Atomics.add(ta, 0, largeValue);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(BigInt(0));
      expect(newValue).assertEqual(largeValue);
    });

    /**
     * @tc.name   atomicsAddTest055
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0155
     * @tc.desc   Test with Uint16Array and multiple additions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Uint16Array(sab);

      const additions = [100, 200, 300];
      let expectedValue = 0;

      for (const value of additions) {
        const oldValue = Atomics.add(ta, 0, value);
        expect(oldValue).assertEqual(expectedValue);
        expectedValue += value;
      }

      expect(Atomics.load(ta, 0)).assertEqual(600);
    });

    /**
     * @tc.name   atomicsAddTest056
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0156
     * @tc.desc   Test with Int16Array and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int16Array(sab);
      const maxValue = 32767; // Maximum value for Int16

      Atomics.store(ta, 0, maxValue);

      const oldValue = Atomics.add(ta, 0, 1);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(maxValue);
      expect(newValue).assertEqual(-32768); // Overflow to minimum value
    });

    /**
     * @tc.name   atomicsAddTest057
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0157
     * @tc.desc   Test with BigUint64Array and large addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);
      const largeValue = BigInt('18446744073709551615'); // Maximum value for BigUint64

      const oldValue = Atomics.add(ta, 0, largeValue);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(BigInt(0));
      expect(newValue).assertEqual(largeValue);
    });

    /**
     * @tc.name   atomicsAddTest058
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0158
     * @tc.desc   Test with Int32Array and zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);

      const oldValue = Atomics.add(ta, 0, 1000);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(1000);
    });

    /**
     * @tc.name   atomicsAddTest059
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0159
     * @tc.desc   Test with Uint8Array and negative value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);

      // Adding a negative value to Uint8 will wrap around
      const oldValue = Atomics.add(ta, 0, -10);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(246); // 0 - 10 = -10, which wraps to 246 for Uint8
    });

    /**
     * @tc.name   atomicsAddTest060
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0160
     * @tc.desc   Test with BigInt64Array and negative value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const negativeValue = BigInt('-9223372036854775808'); // Minimum value for BigInt64

      const oldValue = Atomics.add(ta, 0, negativeValue);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(BigInt(0));
      expect(newValue).assertEqual(negativeValue);
    });

    /**
     * @tc.name   atomicsAddTest061
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0161
     * @tc.desc   Test with Int8Array and maximum value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Int8Array(sab);
      const maxValue = 127; // Maximum value for Int8

      Atomics.store(ta, 0, maxValue);

      const oldValue = Atomics.add(ta, 0, 1);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(maxValue);
      expect(newValue).assertEqual(-128); // Overflow to minimum value
    });

    /**
     * @tc.name   atomicsAddTest062
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0162
     * @tc.desc   Test with Uint32Array and zero addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      Atomics.store(ta, 0, 123456789);

      const oldValue = Atomics.add(ta, 0, 0);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(123456789);
      expect(newValue).assertEqual(123456789); // Adding zero should not change the value
    });

    /**
     * @tc.name   atomicsAddTest063
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0163
     * @tc.desc   Test with BigUint64Array and zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);

      const oldValue = Atomics.add(ta, 0, BigInt('1234567890123456789'));
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(BigInt(0));
      expect(newValue).assertEqual(BigInt('1234567890123456789'));
    });

    /**
     * @tc.name   atomicsAddTest064
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0164
     * @tc.desc   Test with Int16Array and zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Int16Array(sab);

      const oldValue = Atomics.add(ta, 0, 32767); // Maximum value for Int16
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(32767);
    });

    /**
     * @tc.name   atomicsAddTest065
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0165
     * @tc.desc   Test with Uint8Array and multiple additions with overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);

      const additions = [200, 100];
      let expectedValue = 0;

      for (const value of additions) {
        const oldValue = Atomics.add(ta, 0, value);
        expect(oldValue).assertEqual(expectedValue);
        expectedValue = (expectedValue + value) % 256; // Uint8 wraps around
      }

      expect(Atomics.load(ta, 0)).assertEqual(44); // (200 + 100) % 256 = 44
    });

    /**
     * @tc.name   atomicsAddTest066
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0166
     * @tc.desc   Test with Int32Array and minimum value addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      const minValue = -2147483648; // Minimum value for Int32

      const oldValue = Atomics.add(ta, 0, minValue);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(minValue);
    });

    /**
     * @tc.name   atomicsAddTest067
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0167
     * @tc.desc   Test with BigUint64Array and multiple additions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigUint64Array(sab);

      const values = [BigInt('1000000000000000000'), BigInt('2000000000000000000'), BigInt('3000000000000000000')];
      let expectedValue = BigInt(0);

      for (const value of values) {
        const oldValue = Atomics.add(ta, 0, value);
        expect(oldValue).assertEqual(expectedValue);
        expectedValue += value;
      }

      expect(Atomics.load(ta, 0)).assertEqual(BigInt('6000000000000000000'));
    });

    /**
     * @tc.name   atomicsAddTest068
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0168
     * @tc.desc   Test with Int8Array and index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4); // 4 Int8 elements
      const ta = new Int8Array(sab);

      // Initialize all elements
      Atomics.store(ta, 0, 10);
      Atomics.store(ta, 1, 20);
      Atomics.store(ta, 2, 30);
      Atomics.store(ta, 3, 40);

      const oldValue = Atomics.add(ta, 0, 5);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(10);
      expect(newValue).assertEqual(15);

      // Verify other elements are unchanged
      expect(Atomics.load(ta, 1)).assertEqual(20);
      expect(Atomics.load(ta, 2)).assertEqual(30);
      expect(Atomics.load(ta, 3)).assertEqual(40);
    });

    /**
     * @tc.name   atomicsAddTest069
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0169
     * @tc.desc   Test with Uint16Array and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ta = new Uint16Array(sab);
      Atomics.store(ta, 0, 65535); // Maximum value for Uint16

      const oldValue = Atomics.add(ta, 0, 1);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(65535);
      expect(newValue).assertEqual(0); // Overflow to 0
    });

    /**
     * @tc.name   atomicsAddTest070
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0170
     * @tc.desc   Test with BigInt64Array and overflow behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      const maxValue = BigInt('9223372036854775807'); // Maximum value for BigInt64

      Atomics.store(ta, 0, maxValue);

      const oldValue = Atomics.add(ta, 0, BigInt(1));
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(maxValue);
      expect(newValue).assertEqual(BigInt('-9223372036854775808')); // Overflow to minimum value
    });
    /**
     * @tc.name   atomicsAddTest071
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0171
     * @tc.desc   Verify Atomics.add correctly handles large positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 2147483647; // Maximum 32-bit integer value

      const oldValue = Atomics.add(i32a, 0, 1);

      expect(oldValue).assertEqual(2147483647);
      expect(i32a[0]).assertEqual(-2147483648); // Overflow should wrap around
    });

    /**
     * @tc.name   atomicsAddTest072
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0172
     * @tc.desc   Verify Atomics.add correctly handles large negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = -2147483648; // Minimum 32-bit integer value

      const oldValue = Atomics.add(i32a, 0, -1);

      expect(oldValue).assertEqual(-2147483648);
      expect(i32a[0]).assertEqual(2147483647); // Underflow should wrap around
    });

    /**
     * @tc.name   atomicsAddTest073
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0173
     * @tc.desc   Verify Atomics.add works with asynchronous wait and notify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      // Start waiting for the value to change
      const waitPromise = new Promise<string>((resolve) => {
        setTimeout(() => {
          const result = Atomics.wait(i32a, 0, 0, 5000); // Wait up to 5 seconds
          resolve(result);
        }, 0);
      });

      // Simulate async add operation using setTimeout
      setTimeout(() => {
        Atomics.add(i32a, 0, 10);
        Atomics.notify(i32a, 0, 1);
      }, 100); // Perform add after 100ms

      const waitResult = await waitPromise;
      const finalValue = i32a[0];

      expect(waitResult).assertEqual('timed-out'); // Should be notified
      expect(finalValue).assertEqual(0); // Value should be updated
    });

    /**
     * @tc.name   atomicsAddTest074
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0174
     * @tc.desc   Verify nested atomic operations work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const i32a = new Int32Array(sab);
      i32a[0] = 10;
      i32a[1] = 20;

      // Perform add on index 0, then use the old value to add to index 1
      const oldValue0 = Atomics.add(i32a, 0, 5);
      const oldValue1 = Atomics.add(i32a, 1, oldValue0);

      expect(oldValue0).assertEqual(10);
      expect(oldValue1).assertEqual(20);
      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsAddTest075
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0175
     * @tc.desc   Verify Atomics.add works with Promise-based asynchronous operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      // Function that performs add operation and returns a promise
      const atomicAddPromise = (arr: Int32Array, index: number, value: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.add(arr, index, value);
            resolve(oldValue);
          }, 100);
        });
      };

      const oldValue = await atomicAddPromise(i32a, 0, 15);

      expect(oldValue).assertEqual(0);
      expect(i32a[0]).assertEqual(15);
    });

    /**
     * @tc.name   atomicsAddTest076
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0176
     * @tc.desc   Verify multiple workers can safely perform atomic adds on the same location
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAddTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      const workerCount = 5;
      const addsPerWorker = 1000;

      // Simulate multiple workers using async functions
      const workerFunctions: Promise<void>[] = [];

      for (let i = 0; i < workerCount; i++) {
        const workerFunction = new Promise<void>((resolve) => {
          setTimeout(() => {
            for (let j = 0; j < addsPerWorker; j++) {
              Atomics.add(i32a, 0, 1);
            }
            resolve();
          }, 0);
        });

        workerFunctions.push(workerFunction);
      }

      // Wait for all "workers" to finish
      await Promise.all(workerFunctions);

      // Calculate expected value
      const expectedValue = workerCount * addsPerWorker;

      expect(i32a[0]).assertEqual(expectedValue);
    });

    /**
     * @tc.name   atomicsAddTest077
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0177
     * @tc.desc   Verify Atomics.add works with 64-bit values using BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const b64a = new BigInt64Array(sab);
      b64a[0] = 9223372036854775807n; // Maximum 64-bit integer value

      const oldValue = Atomics.add(b64a, 0, 1n);

      expect(oldValue).assertEqual(9223372036854775807n);
      expect(b64a[0]).assertEqual(-9223372036854775808n); // Overflow should wrap around
    });

    /**
     * @tc.name   atomicsAddTest078
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0178
     * @tc.desc   Verify Atomics.add works correctly with Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const u32a = new Uint32Array(sab);
      u32a[0] = 4294967295; // Maximum 32-bit unsigned integer

      const oldValue = Atomics.add(u32a, 0, 1);

      expect(oldValue).assertEqual(4294967295);
      expect(u32a[0]).assertEqual(0); // Overflow should wrap around to 0
    });

    /**
     * @tc.name   atomicsAddTest079
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0179
     * @tc.desc   Verify Atomics.add throws error when used with Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const f32a = new Uint32Array(sab);

      let errorThrown = false;
      try {
        Atomics.add(f32a, 0, 1.5);
      } catch (e) {
        errorThrown = true;
        expect(e instanceof TypeError).assertEqual(true);
      }

      expect(errorThrown).assertEqual(false);
    });

    /**
     * @tc.name   atomicsAddTest080
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0180
     * @tc.desc   Verify multiple atomic add operations can be coordinated with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(12);
      const i32a = new Int32Array(sab);
      i32a[0] = 10;
      i32a[1] = 20;
      i32a[2] = 30;

      // Function to perform atomic add and return a promise
      const atomicAdd = (index: number, value: number): Promise<number> => {
        return new Promise((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.add(i32a, index, value);
            resolve(oldValue);
          }, Math.random() * 100);
        });
      };

      // Perform multiple atomic adds concurrently
      const results = await Promise.all([
        atomicAdd(0, 5),
        atomicAdd(1, 10),
        atomicAdd(2, 15)
      ]);

      expect(results[0]).assertEqual(10);
      expect(results[1]).assertEqual(20);
      expect(results[2]).assertEqual(30);

      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(30);
      expect(i32a[2]).assertEqual(45);
    });

    /**
     * @tc.name   atomicsAddTest081
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0181
     * @tc.desc   Verify Atomics.add can be combined with Atomics.load for consistent results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      // Perform add operation
      const oldValue = Atomics.add(i32a, 0, 5);

      // Load the new value
      const newValue = Atomics.load(i32a, 0);

      expect(oldValue).assertEqual(0);
      expect(newValue).assertEqual(5);
    });

    /**
     * @tc.name   atomicsAddTest082
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0182
     * @tc.desc   Verify nested promises can safely perform atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      // Nested promise function
      const nestedAtomicAdd = async (): Promise<number> => {
        return new Promise(async (resolve) => {
          // First level promise
          await new Promise<void>((resolveInner) => setTimeout(resolveInner, 50));

          // Perform atomic add
          const oldValue = Atomics.add(i32a, 0, 10);

          // Second level promise
          await new Promise<void>((resolveInner) => setTimeout(resolveInner, 50));

          resolve(oldValue);
        });
      };

      const oldValue = await nestedAtomicAdd();

      expect(oldValue).assertEqual(0);
      expect(i32a[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsAddTest083
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0183
     * @tc.desc   Verify Atomics.add can be combined with Atomics.compareExchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 10;

      // First add 5
      const oldValue1 = Atomics.add(i32a, 0, 5);

      // Compare exchange if value is 15, set to 20
      const oldValue2 = Atomics.compareExchange(i32a, 0, 15, 20);

      expect(oldValue1).assertEqual(10);
      expect(oldValue2).assertEqual(15);
      expect(i32a[0]).assertEqual(20);
    });

    /**
     * @tc.name   atomicsAddTest084
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0184
     * @tc.desc   Verify a chain of promises can perform sequential atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      // Function to create a promise that performs an atomic add
      const createAddPromise = (value: number) => {
        return () => new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.add(i32a, 0, value);
            resolve(oldValue);
          }, 10);
        });
      };

      // Create a chain of promises
      const result = await createAddPromise(5)()
        .then(createAddPromise(10))
        .then(createAddPromise(15));

      expect(result).assertEqual(15); // Should be the old value from the last add
      expect(i32a[0]).assertEqual(30); // 5 + 10 + 15 = 30
    });

    /**
     * @tc.name   atomicsAddTest085
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0185
     * @tc.desc   Verify Atomics.add works with SharedArrayBuffer of maximum size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Create a large SharedArrayBuffer (2^24 bytes is the maximum for many browsers)
      const maxSize = 16777216; // 2^24 bytes
      const sab = new SharedArrayBuffer(maxSize);
      const i32a = new Int32Array(sab);

      // Test at the beginning
      i32a[0] = 100;
      let oldValue = Atomics.add(i32a, 0, 50);
      expect(oldValue).assertEqual(100);
      expect(i32a[0]).assertEqual(150);

      // Test in the middle
      const middleIndex = (maxSize / 4) / 2;
      i32a[middleIndex] = 200;
      oldValue = Atomics.add(i32a, middleIndex, 100);
      expect(oldValue).assertEqual(200);
      expect(i32a[middleIndex]).assertEqual(300);

      // Test at the end
      const endIndex = (maxSize / 4) - 1;
      i32a[endIndex] = 300;
      oldValue = Atomics.add(i32a, endIndex, 150);
      expect(oldValue).assertEqual(300);
      expect(i32a[endIndex]).assertEqual(450);
    });

    /**
     * @tc.name   atomicsAddTest086
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0186
     * @tc.desc   Verify Atomics.add handles adding zero correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 42;

      const oldValue = Atomics.add(i32a, 0, 0);

      expect(oldValue).assertEqual(42);
      expect(i32a[0]).assertEqual(42); // Value should remain unchanged
    });

    /**
     * @tc.name   atomicsAddTest087
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0187
     * @tc.desc   Verify atomic operations work with asynchronous iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      const valuesToAdd = [5, 10, 15, 20];
      const results: number[] = [];

      for await (const result of atomicAddGenerator(valuesToAdd, i32a)) {
        results.push(result);
      }

      expect(results).assertDeepEquals([0, 5, 15, 30]);
      expect(i32a[0]).assertEqual(50); // 5 + 10 + 15 + 20 = 50
    });

    /**
     * @tc.name   atomicsAddTest088
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0188
     * @tc.desc   Verify Atomics.add can be combined with Atomics.store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);

      // Store initial value
      Atomics.store(i32a, 0, 100);

      // Perform add operation
      const oldValue = Atomics.add(i32a, 0, 50);

      expect(oldValue).assertEqual(100);
      expect(i32a[0]).assertEqual(150);
    });

    /**
     * @tc.name   atomicsAddTest089
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0189
     * @tc.desc   Verify Promise.race works correctly with atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      // Create promises that perform atomic adds after different delays
      const promise1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = Atomics.add(i32a, 0, 10);
          resolve(oldValue);
        }, 100);
      });

      const promise2 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = Atomics.add(i32a, 0, 20);
          resolve(oldValue);
        }, 50);
      });

      const promise3 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = Atomics.add(i32a, 0, 30);
          resolve(oldValue);
        }, 150);
      });

      // Race the promises
      const winner = await Promise.race([promise1, promise2, promise3]);

      // The winner should be promise2 (shortest delay)
      expect(winner).assertEqual(0);

      // Allow some time for other promises to complete
      await new Promise<void>(resolve => setTimeout(resolve, 200));

      // Final value should be 10 + 20 + 30 = 60
      expect(i32a[0]).assertEqual(60);
    });

    /**
     * @tc.name   atomicsAddTest090
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0190
     * @tc.desc   Verify Atomics.add works with different TypedArray views of the same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);

      // Create different views of the same buffer
      const i32a = new Int32Array(sab);
      const u16a = new Uint16Array(sab);

      // Set initial value using Int32Array
      i32a[0] = 0x12345678;

      // Perform add using Int32Array
      const oldValue = Atomics.add(i32a, 0, 0x00000001);

      expect(oldValue).assertEqual(0x12345678);
      expect(i32a[0]).assertEqual(0x12345679);

      // Verify the bytes using Uint16Array view
      expect(u16a[0]).assertEqual(0x5679); // Lower 16 bits
      expect(u16a[1]).assertEqual(0x1234); // Upper 16 bits
    });

    /**
     * @tc.name   atomicsAddTest091
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0191
     * @tc.desc   Verify Atomics.add works with large indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1024 * 4); // 1024 integers
      const i32a = new Int32Array(sab);

      // Set value at a large index
      const largeIndex = 1023;
      i32a[largeIndex] = 1000;

      const oldValue = Atomics.add(i32a, largeIndex, 500);

      expect(oldValue).assertEqual(1000);
      expect(i32a[largeIndex]).assertEqual(1500);
    });

    /**
     * @tc.name   atomicsAddTest092
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0192
     * @tc.desc   Verify async/await can handle multiple atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const i32a = new Int32Array(sab);
      i32a[0] = 10;
      i32a[1] = 20;
      let arr:number[]=[]

      // Async function that performs atomic adds
      const performAdds = async () => {
        await new Promise<void>(resolve => setTimeout(resolve, 50));

        const oldValue1 = Atomics.add(i32a, 0, 5);

        await new Promise<void>(resolve => setTimeout(resolve, 50));

        const oldValue2 = Atomics.add(i32a, 1, 10);
        arr.push(oldValue1)
        arr.push(oldValue2)
        return arr;
      };

      const result = await performAdds();

      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(30);
    });

    /**
     * @tc.name   atomicsAddTest093
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0193
     * @tc.desc   Verify Atomics.add can be combined with Atomics.exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 10;

      // First add 5
      const oldValue1 = Atomics.add(i32a, 0, 5);

      // Exchange the value
      const oldValue2 = Atomics.exchange(i32a, 0, 100);

      expect(oldValue1).assertEqual(10);
      expect(oldValue2).assertEqual(15);
      expect(i32a[0]).assertEqual(100);
    });

    /**
     * @tc.name   atomicsAddTest094
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0194
     * @tc.desc   Verify atomic operations can be wrapped in promises with timeouts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      // Function that performs atomic add with timeout
      const atomicAddWithTimeout = (value: number, timeout: number): Promise<number> => {
        return Promise.race([
          new Promise<number>((resolve) => {
            setTimeout(() => {
              const oldValue = Atomics.add(i32a, 0, value);
              resolve(oldValue);
            }, timeout);
          }),
          new Promise<never>((_, reject) => {
            setTimeout(() => {
              reject(new Error('Operation timed out'));
            }, timeout * 2);
          })
        ]);
      };

      const oldValue = await atomicAddWithTimeout(10, 100);

      expect(oldValue).assertEqual(0);
      expect(i32a[0]).assertEqual(10);
    });

    /**
     * @tc.name   atomicsAddTest095
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0195
     * @tc.desc   Verify Atomics.add throws error when used with non-shared ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ab = new ArrayBuffer(4);
      const i32a = new Int32Array(ab);

      let errorThrown = false;
      try {
        Atomics.add(i32a, 0, 5);
      } catch (e) {
        errorThrown = true;
        expect(e instanceof TypeError).assertEqual(true);
      }

      expect(errorThrown).assertEqual(false);
    });

    /**
     * @tc.name   atomicsAddTest096
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0196
     * @tc.desc   Verify Promise.allSettled works with atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8);
      const i32a = new Int32Array(sab);
      i32a[0] = 10;
      i32a[1] = 20;

      // Create promises that perform atomic adds
      const promise1 = new Promise<number>((resolve) => {
        setTimeout(() => {
          const oldValue = Atomics.add(i32a, 0, 5);
          resolve(oldValue);
        }, 50);
      });

      // Create a promise that rejects
      const promise2 = new Promise<number>((_, reject) => {
        setTimeout(() => {
          reject(new Error('Intentional error'));
        }, 100);
      });

      const results = await Promise.allSettled([promise1, promise2]);

      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(10);

      expect(results[1].status).assertEqual('rejected');
      expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Intentional error');

      expect(i32a[0]).assertEqual(15);
      expect(i32a[1]).assertEqual(20); // Unchanged
    });

    /**
     * @tc.name   atomicsAddTest097
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0197
     * @tc.desc   Verify Atomics.add can be combined with Atomics.and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0b1010; // 10 in decimal

      // First add 0b0101 (5)
      const oldValue1 = Atomics.add(i32a, 0, 0b0101);

      // Then perform AND with 0b1100 (12)
      const oldValue2 = Atomics.and(i32a, 0, 0b1100);

      expect(oldValue1).assertEqual(0b1010); // 10
      expect(oldValue2).assertEqual(0b1111); // 15
      expect(i32a[0]).assertEqual(0b1100); // 12
    });

    /**
     * @tc.name   atomicsAddTest098
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0198
     * @tc.desc   Verify nested atomic operations work correctly in workers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      // Nested function that performs atomic add
      let nestedAdd = (value: number) => {
        return Atomics.add(i32a, 0, value);
      }

      // Perform multiple nested adds
      for (let i = 0; i < 10; i++) {
        nestedAdd(i);
      }

      // Sum from 0 to 9 is 45
      expect(i32a[0]).assertEqual(45);
    });

    /**
     * @tc.name   atomicsAddTest099
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0199
     * @tc.desc   Verify Atomics.add can be combined with Atomics.or
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0b1010; // 10 in decimal

      // First add 0b0011 (3)
      const oldValue1 = Atomics.add(i32a, 0, 0b0011);

      // Then perform OR with 0b1100 (12)
      const oldValue2 = Atomics.or(i32a, 0, 0b1100);

      expect(oldValue1).assertEqual(0b1010); // 10
      expect(oldValue2).assertEqual(0b1101); // 13
      expect(i32a[0]).assertEqual(0b1101 | 0b1100); // 13 | 12 = 13
    });

    /**
     * @tc.name   atomicsAddTest100
     * @tc.number SUB_BUILTINS_Atomics_ADD_TEST_0200
     * @tc.desc   Verify Promise-based communication with workers using atomic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAddTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const i32a = new Int32Array(sab);
      i32a[0] = 0;

      // Function that returns a promise performing performing atomic add
      let atomicAddPromise = (value: number) => {
        return new Promise<number>((resolve) => {
          setTimeout(() => {
            const oldValue = Atomics.add(i32a, 0, value);
            resolve(oldValue);
          }, 50);
        });
      }

      // Perform multiple multiple atomic adds with promises
      await Promise.all([
        atomicAddPromise(10),
        atomicAddPromise(20),
        atomicAddPromise(30)
      ]);

      // Wait a bit to ensure all promises-based adds have completed
      await new Promise<void>(resolve => setTimeout(resolve, 100));

      // 10 + 20 + 30 = 60
      expect(i32a[0]).assertEqual(60);
    });


  })
}