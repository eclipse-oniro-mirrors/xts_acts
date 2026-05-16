import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { atomicsAndTest090, type69, type73, type90 } from './atomics';
import { sleep } from './utils';


export default function atomicsAndTest() {
  describe('atomicsAndTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.name   atomicsAndTest001
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_001
     * @tc.desc   测试Atomics.and()基本功能：对Uint8Array执行AND操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(1);
      const ta = new Uint8Array(sab);
      ta[0] = 0b1010; // 10

      const oldValue = Atomics.and(ta, 0, 0b1100); // 12
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0b1010); // 应返回旧值10
      expect(newValue).assertEqual(0b1000); // 10 & 12 = 8
    });

    /**
     * @tc.name   atomicsAndTest002
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_002
     * @tc.desc   测试Atomics.and()边界条件：值为0的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = 0;

      const oldValue = Atomics.and(ta, 0, 0xFFFFFFFF);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0); // 应返回旧值0
      expect(newValue).assertEqual(0); // 0 & 任何值 = 0
    });

    /**
     * @tc.name   atomicsAndTest003
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_003
     * @tc.desc   测试Atomics.and()边界条件：值为最大值的情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      ta[0] = 0xFFFFFFFF; // 最大值

      const oldValue = Atomics.and(ta, 0, 0xAAAAAAAA);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(0xFFFFFFFF); // 应返回旧值
      expect(newValue).assertEqual(0xAAAAAAAA); // 0xFFFFFFFF & 0xAAAAAAAA = 0xAAAAAAAA
    });

    /**
     * @tc.name   atomicsAndTest004
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_004
     * @tc.desc   测试Atomics.and()错误处理：非整数类型的TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new Uint16Array(sab);

      expect(Atomics.and(ta, 0, 1)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsAndTest005
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_005
     * @tc.desc   测试Atomics.and()错误处理：索引越界
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      try {
        Atomics.and(ta, 1, 1)
      } catch (e) {
        expect(e.message).assertContain('');
      }

    });

    /**
     * @tc.name   atomicsAndTest006
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_006
     * @tc.desc   测试Atomics.and()对不同类型的TypedArray的支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // 测试Int8Array
      const sab1 = new SharedArrayBuffer(1);
      const ta1 = new Int8Array(sab1);
      ta1[0] = 0b0111; // 7
      Atomics.and(ta1, 0, 0b0011); // 3
      expect(Atomics.load(ta1, 0)).assertEqual(0b0011); // 3

      // 测试Uint16Array
      const sab2 = new SharedArrayBuffer(2);
      const ta2 = new Uint16Array(sab2);
      ta2[0] = 0b11110000; // 240
      Atomics.and(ta2, 0, 0b11001100); // 204
      expect(Atomics.load(ta2, 0)).assertEqual(0b11000000); // 192

      // 测试Int32Array
      const sab3 = new SharedArrayBuffer(4);
      const ta3 = new Int32Array(sab3);
      ta3[0] = 0x12345678;
      Atomics.and(ta3, 0, 0x0000FFFF);
      expect(Atomics.load(ta3, 0)).assertEqual(0x00005678);
    });

    /**
     * @tc.name   atomicsAndTest007
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_007
     * @tc.desc   测试Atomics.and()返回值：验证返回的是操作前的旧值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Uint32Array(sab);
      const initialValue = 0b11001100;
      ta[0] = initialValue;

      const oldValue = Atomics.and(ta, 0, 0b10101010);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(initialValue); // 返回值应为操作前的旧值
      expect(newValue).assertEqual(0b10001000); // 0b11001100 & 0b10101010 = 0b10001000
    });

    /**
     * @tc.name   atomicsAndTest008
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_008
     * @tc.desc   测试Atomics.and()对BigInt64Array的支持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(8);
      const ta = new BigInt64Array(sab);
      ta[0] = 0xFFFFFFFFFFFFFFFFn; // 最大值

      const oldValue = Atomics.and(ta, 0, 0xAAAAAAAAAAAAAAAAn);
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(-1n); // 应返回旧值
      expect(newValue).assertEqual(-6148914691236517206n); // 正确的AND结果
    });

    /**
     * @tc.name   atomicsAndTest009
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_009
     * @tc.desc   测试Atomics.and()对负数值的处理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ta = new Int32Array(sab);
      ta[0] = -5; // 二进制表示为 11111111 11111111 11111111 11111011

      const oldValue = Atomics.and(ta, 0, 3); // 二进制 00000000 00000000 00000000 00000011
      const newValue = Atomics.load(ta, 0);

      expect(oldValue).assertEqual(-5); // 应返回旧值
      expect(newValue).assertEqual(3); // -5 & 3 = 3
    });

    /**
     * @tc.name   atomicsAndTest010
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_010
     * @tc.desc   测试Atomics.and()原子性：多线程环境下的操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const view = new Int32Array(sab);

      // Initialize with all bits set
      Atomics.store(view, 0, 0b11111111);

      // Simulate multiple threads clearing different bits
      const threadOperations = [
        () => Atomics.and(view, 0, 0b11111110), // Clear bit 0
        () => Atomics.and(view, 0, 0b11111101), // Clear bit 1
        () => Atomics.and(view, 0, 0b11111011), // Clear bit 2
        () => Atomics.and(view, 0, 0b11110111), // Clear bit 3
        () => Atomics.and(view, 0, 0b11101111), // Clear bit 4
        () => Atomics.and(view, 0, 0b11011111), // Clear bit 5
        () => Atomics.and(view, 0, 0b10111111), // Clear bit 6
        () => Atomics.and(view, 0, 0b01111111)// Clear bit 7
      ];

      // Execute all operations
      threadOperations.forEach((op): number => op());

      // All bits should be cleared
      expect(Atomics.load(view, 0)).assertEqual(0);

      // Test with bitmask combination
      Atomics.store(view, 0, 0b11111111);

      // Simulate concurrent bit clearing
      const clearBit = (bit: number) => {
        const mask = ~(1 << bit);
        Atomics.and(view, 0, mask);
      };

      // Clear bits 0-4
      for (let i = 0; i < 5; i++) {
        clearBit(i);
      }

      // Bits 5-7 should remain set
      expect(Atomics.load(view, 0)).assertEqual(0b11100000);
    });
    /**
     * @tc.name   atomicsAndTest011
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0011
     * @tc.desc   Test bitwise AND operation of Atomics.and on Int32Array with non-zero values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1010;
      const result = Atomics.and(ia, 0, 0b1001);
      expect(result).assertEqual(10);
      expect(ia[0]).assertEqual(8);
    });
    /**
     * @tc.name   atomicsAndTest012
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0012
     * @tc.desc   Test bitwise AND operation of Atomics.and on Int32Array with value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0;
      const result = Atomics.and(ia, 0, 0b1111);
      expect(result).assertEqual(0);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest013
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0013
     * @tc.desc   Test bitwise AND operation of Atomics.and on Int32Array with all-1 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1111;
      const result = Atomics.and(ia, 0, 0b1111);
      expect(result).assertEqual(15);
      expect(ia[0]).assertEqual(15);
    });
    /**
     * @tc.name   atomicsAndTest014
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0014
     * @tc.desc   Test bitwise AND operation of Atomics.and on Int32Array with negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -5;
      const result = Atomics.and(ia, 0, -3);
      expect(result).assertEqual(-5);
      expect(ia[0]).assertEqual(-7);
    });
    /**
     * @tc.name   atomicsAndTest015
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0015
     * @tc.desc   Test Atomics.and operation on different indices of Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(12);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      ia[2] = 30;
      Atomics.and(ia, 1, 15);
      expect(ia[0]).assertEqual(10);
      expect(ia[1]).assertEqual(4);
      expect(ia[2]).assertEqual(30);
    });
    /**
     * @tc.name   atomicsAndTest016
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0016
     * @tc.desc   Test Atomics.and returns original value before operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const originalValue = 0b1100;
      ia[0] = originalValue;
      const result = Atomics.and(ia, 0, 0b0101);
      expect(result).assertEqual(originalValue);
      expect(ia[0]).assertEqual(4);
    });
    /**
     * @tc.name   atomicsAndTest017
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0017
     * @tc.desc   Test Atomics.and operation on Int32Array with zero mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b11110000;
      const result = Atomics.and(ia, 0, 0);
      expect(result).assertEqual(240);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest018
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0018
     * @tc.desc   Test Atomics.and operation on Int32Array with max Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const maxInt32 = 2147483647;
      ia[0] = maxInt32;
      const result = Atomics.and(ia, 0, 0x7FFFFFFF);
      expect(result).assertEqual(maxInt32);
      expect(ia[0]).assertEqual(maxInt32);
    });
    /**
     * @tc.name   atomicsAndTest019
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0019
     * @tc.desc   Test Atomics.and operation on Int32Array with min Int32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      const minInt32 = -2147483648;
      ia[0] = minInt32;
      const result = Atomics.and(ia, 0, 0x80000000);
      expect(result).assertEqual(minInt32);
      expect(ia[0]).assertEqual(minInt32);
    });
    /**
     * @tc.name   atomicsAndTest020
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0020
     * @tc.desc   Test Atomics.and operation on Int32Array with mixed bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b101101;
      const result = Atomics.and(ia, 0, 0b110011);
      expect(result).assertEqual(45);
      expect(ia[0]).assertEqual(33);
    });
    /**
     * @tc.name   atomicsAndTest021
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0021
     * @tc.desc   Test bitwise AND operation of Atomics.and on Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 0xFFFF0000;
      const result = Atomics.and(ua, 0, 0x0000FFFF);
      expect(result).assertEqual(4294901760);
      expect(ua[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest022
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0022
     * @tc.desc   Test Atomics.and operation on Uint32Array with max Uint32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      const maxUint32 = 4294967295;
      ua[0] = maxUint32;
      const result = Atomics.and(ua, 0, 0xAAAAAAAA);
      expect(result).assertEqual(maxUint32);
      expect(ua[0]).assertEqual(2863311530);
    });
    /**
     * @tc.name   atomicsAndTest023
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0023
     * @tc.desc   Test two consecutive Atomics.and operations on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1111;
      Atomics.and(ia, 0, 0b0111);
      const result = Atomics.and(ia, 0, 0b0011);
      expect(result).assertEqual(7);
      expect(ia[0]).assertEqual(3);
    });
    /**
     * @tc.name   atomicsAndTest024
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0024
     * @tc.desc   Test error capture for out-of-bounds index in Atomics.and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      try {
        Atomics.and(ia, 1, 5)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });
    /**
     * @tc.name   atomicsAndTest025
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0025
     * @tc.desc   Test error capture for non-SharedArrayBuffer array in Atomics.and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const ia = new Int32Array([10, 20, 30]);
      try {
        Atomics.and(ia, 0, 5)
      } catch (e) {
        expect(e.message).assertContain('');
      }
    });
    /**
     * @tc.name   atomicsAndTest026
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0026
     * @tc.desc   Test Atomics.and operation on Int32Array with non-integer mask (auto-conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1111;
      const result = Atomics.and(ia, 0, 5.9);
      expect(result).assertEqual(15);
      expect(ia[0]).assertEqual(5);
    });
    /**
     * @tc.name   atomicsAndTest027
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0027
     * @tc.desc   Test Atomics.and operation on Int32Array with boolean mask (auto-conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1010;
      const result1 = Atomics.and(ia, 0, 1);
      expect(result1).assertEqual(10);
      expect(ia[0]).assertEqual(0);
      ia[0] = 0b1010;
      const result2 = Atomics.and(ia, 0, 1);
      expect(result2).assertEqual(10);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest028
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0028
     * @tc.desc   Test Atomics.and operation on Int32Array with mask as string (auto-conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 12;
      const result = Atomics.and(ia, 0, 5);
      expect(result).assertEqual(12);
      expect(ia[0]).assertEqual(4);
    });

    /**
     * @tc.name   atomicsAndTest029
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0029
     * @tc.desc   Test Atomics.and on Uint32Array with negative mask (auto-conversion to unsigned 32-bit)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 20; // 0x00000014
      const result = Atomics.and(ua, 0, -5); // -5 → 0xFFFFFFFB in 32-bit unsigned
      expect(result).assertEqual(20);
      expect(ua[0]).assertEqual(16); // 0x00000014 & 0xFFFFFFFB = 0x00000010
    });
    /**
     * @tc.name   atomicsAndTest030
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0030
     * @tc.desc   Test Atomics.and on Int32Array with NaN mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 25; // 0x00000019
      const result = Atomics.and(ia, 0, NaN); // NaN → 0
      expect(result).assertEqual(25);
      expect(ia[0]).assertEqual(0); // 25 & 0 = 0
    });
    /**
     * @tc.name   atomicsAndTest031
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0031
     * @tc.desc   Test Atomics.and on Int32Array with Infinity mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 18; // 0x00000012
      const result = Atomics.and(ia, 0, Infinity); // Infinity → 0
      expect(result).assertEqual(18);
      expect(ia[0]).assertEqual(0); // 18 & 0 = 0
    });
    /**
     * @tc.name   atomicsAndTest032
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0032
     * @tc.desc   Test Atomics.and on Int32Array with -Infinity mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 33; // 0x00000021
      const result = Atomics.and(ia, 0, -Infinity); // -Infinity → 0
      expect(result).assertEqual(33);
      expect(ia[0]).assertEqual(0); // 33 & 0 = 0
    });
    /**
     * @tc.name   atomicsAndTest033
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0033
     * @tc.desc   Test Atomics.and on Uint32Array with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicsAndTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 0; // Default initial value, explicitly set here
      const result = Atomics.and(ua, 0, 0xFF); // 255
      expect(result).assertEqual(0);
      expect(ua[0]).assertEqual(0); // 0 & 255 = 0
    });
    /**
     * @tc.name   atomicsAndTest034
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0034
     * @tc.desc   Test Atomics.and on Int32Array with empty string mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 42;
      // Explicitly convert empty string to number to avoid TypeScript type error
      const mask = Number('');
      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(42);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest035
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0035
     * @tc.desc   Test Atomics.and on Int32Array with non-numeric string mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 17;
      // Convert non-numeric string to number (results in NaN, then coerced to 0 in bitwise ops)
      const mask = Number('test');
      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(17);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest036
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0036
     * @tc.desc   Test Atomics.and on Uint32Array with hex string mask (valid conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 0x12345678;
      // Convert hex string to number with explicit radix
      const mask = parseInt('0xFFFF0000', 16);
      const result = Atomics.and(ua, 0, mask);
      expect(result).assertEqual(0x12345678);
      expect(ua[0]).assertEqual(0x12340000);
    });
    /**
     * @tc.name   atomicsAndTest037
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0037
     * @tc.desc   Test Atomics.and on Int32Array with octal string mask (valid conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 63;
      // Convert octal string to number with explicit radix
      const mask = parseInt('0o17', 8);
      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(63);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest038
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0038
     * @tc.desc   Test Atomics.and on Int32Array with binary string mask (valid conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 27;
      // Convert binary string to number with explicit radix
      const mask = parseInt('0b10101', 2);
      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(27);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest039
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0039
     * @tc.desc   Test Atomics.and on Uint32Array with 64-bit mask (auto-truncation to 32-bit)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 0xFFFFFFFF;
      // 64-bit mask (0x1FFFFFFFF) truncated to 32-bit (0xFFFFFFFF) for Uint32Array
      const mask = 0x1FFFFFFFF;
      const result = Atomics.and(ua, 0, mask);
      expect(result).assertEqual(4294967295);
      expect(ua[0]).assertEqual(4294967295);
    });
    /**
     * @tc.name   atomicsAndTest040
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0040
     * @tc.desc   Test Atomics.and on Int32Array with 64-bit negative mask (truncation to 32-bit)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = -1; // 0xFFFFFFFF in 32-bit two's complement
      // 64-bit negative mask truncated to 32-bit (0xFFFFFFFF) for Int32Array
      const mask = -0x100000001;
      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(-1);
      expect(ia[0]).assertEqual(-1);
    });
    /**
     * @tc.name   atomicsAndTest041
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0041
     * @tc.desc   Test Atomics.and on Int32Array with null mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 55;
      // Convert null to number (results in 0) to avoid TypeScript error
      const mask = Number(null);
      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(55);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest042
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0042
     * @tc.desc   Test Atomics.and on Int32Array with undefined mask (auto-conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 72;
      // Convert undefined to number (results in NaN, coerced to 0 in bitwise ops)
      const mask = Number(undefined);
      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(72);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest043
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0043
     * @tc.desc   Test Atomics.and on Uint32Array with object mask (invalid conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab);
      ua[0] = 99;
      // Convert object to number (results in NaN, coerced to 0 in bitwise ops)
      const mask = Number({});
      const result = Atomics.and(ua, 0, mask);
      expect(result).assertEqual(99);
      expect(ua[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest044
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0044
     * @tc.desc   Test Atomics.and on Int32Array with array mask (invalid conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 105;
      // Convert array to number (results in NaN, coerced to 0 in bitwise ops)
      const mask = Number([1, 2, 3]);
      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(105);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest045
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0045
     * @tc.desc   Test Atomics.and on Int32Array with function mask (invalid conversion to 0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 121;
      // Convert function to number (results in NaN, coerced to 0 in bitwise ops)
      const mask = Number(() => {
      });
      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(121);
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest046
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0046
     * @tc.desc   Test Atomics.and on Int16Array (valid 16-bit integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2); // Int16Array uses 2 bytes per element
      const ia16 = new Int16Array(sab);
      ia16[0] = 0x7FFF; // Max Int16 value
      const mask = 0x00FF; // 8-bit mask
      const result = Atomics.and(ia16, 0, mask);
      expect(result).assertEqual(32767);
      expect(ia16[0]).assertEqual(255);
    });
    /**
     * @tc.name   atomicsAndTest047
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0047
     * @tc.desc   Test Atomics.and on Uint16Array (valid 16-bit unsigned type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ua16 = new Uint16Array(sab);
      ua16[0] = 0xFFFF; // Max Uint16 value
      const mask = 0x0F0F; // 16-bit mask
      const result = Atomics.and(ua16, 0, mask);
      expect(result).assertEqual(65535);
      expect(ua16[0]).assertEqual(3855);
    });
    /**
     * @tc.name   atomicsAndTest048
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0048
     * @tc.desc   Test Atomics.and on Int8Array (valid 8-bit integer type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1); // Int8Array uses 1 byte per element
      const ia8 = new Int8Array(sab);
      ia8[0] = -1; // 0xFF in 8-bit two's complement
      const mask = 0x0F; // 4-bit mask
      const result = Atomics.and(ia8, 0, mask);
      expect(result).assertEqual(-1);
      expect(ia8[0]).assertEqual(15);
    });
    /**
     * @tc.name   atomicsAndTest049
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0049
     * @tc.desc   Test Atomics.and on Uint8Array (valid 8-bit unsigned type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ua8 = new Uint8Array(sab);
      ua8[0] = 0xFF; // Max Uint8 value
      const mask = 0xAA; // 8-bit mask (10101010)
      const result = Atomics.and(ua8, 0, mask);
      expect(result).assertEqual(255);
      expect(ua8[0]).assertEqual(170);
    });
    /**
     * @tc.name   atomicsAndTest050
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0050
     * @tc.desc   Test Atomics.and on BigInt64Array (valid 64-bit bigint type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // BigInt64Array uses 8 bytes per element
      const bia64 = new BigInt64Array(sab);
      bia64[0] = 0x123456789ABCDEFn; // 64-bit bigint value
      const mask = 0xFFFF0000FFFF0000n; // 64-bit bigint mask
      const result = Atomics.and(bia64, 0, mask);
      expect(result).assertEqual(81985529216486895n);
      expect(bia64[0]).assertEqual(81909220532486144n);
    });
    /**
     * @tc.name   atomicsAndTest051
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0051
     * @tc.desc   Test Atomics.and in async function with Promise.resolve wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 30; // 0b11110
      // Async wrapper with Promise.resolve
      const asyncAnd = async (arr: Int32Array, idx: number, mask: number): Promise<number> => {
        return Promise.resolve(Atomics.and(arr, idx, mask));
      };
      const result: number = await asyncAnd(ia, 0,
        0b10101); // 21
      expect(result).assertEqual(30);
      expect(ia[0]).assertEqual(20); // 30 & 21 = 26
    });
    /**
     * @tc.name   atomicsAndTest052
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0052
     * @tc.desc   Test nested Atomics.and calls in Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 45; // 0b101101
      // Nested Promise chain
      const finalValue: number = await Promise.resolve(ia).then(arr => {
        Atomics.and(arr, 0, 0b110000); // 48 → 45 & 48 = 16
        return arr;
      }).then(arr => {
        return Atomics.and(arr, 0, 0b001111); // 15 → 16 & 15 = 0
      });
      expect(finalValue).assertEqual(32); // Return old value of second and
      expect(ia[0]).assertEqual(0);
    });
    /**
     * @tc.name   atomicsAndTest053
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0053
     * @tc.desc   Test Atomics.and with async timeout before operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50; // 0b110010
      // Async timeout helper
      const delay = (ms: number): Promise<void> => new Promise<void>(resolve => setTimeout(resolve, ms));
      // Wait 10ms before Atomics.and
      await delay(10);
      const result = Atomics.and(ia, 0, 0b100011); // 35
      expect(result).assertEqual(50);
      expect(ia[0]).assertEqual(34); // 50 & 35 = 18
    });
    /**
     * @tc.name   atomicsAndTest054
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0054
     * @tc.desc   Test parallel Atomics.and calls with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 12;
      ia[1] = 24;
      // Parallel Atomics.and via Promise.all
      const result = await Promise.all([Promise.resolve(Atomics.and(ia, 0, 7)), // 12 & 7 = 4
        Promise.resolve(Atomics.and(ia, 1, 15))// 24 & 15 = 8
      ]);
      expect(result[0]).assertEqual(12);
      expect(result[1]).assertEqual(24);
      expect(ia[0]).assertEqual(4);
      expect(ia[1]).assertEqual(8);
    });
    /**
     * @tc.name   atomicsAndTest055
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0055
     * @tc.desc   Test nested async functions with Atomics.and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 60; // 0b111100
      // Nested async functions
      const outerAsync = async (): Promise<number> => {
        const innerAsync = async (arr: Int32Array): Promise<number> => {
          return Atomics.and(arr, 0, 0b001111); // 15 → 60 & 15 = 12
        };
        return innerAsync(ia);
      };
      const result = await outerAsync();
      expect(result).assertEqual(60);
      expect(ia[0]).assertEqual(12);
    });
    /**
     * @tc.name   atomicsAndTest056
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0056
     * @tc.desc   Test Atomics.and in Promise.race with timeout fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 35; // 0b100011
      // Promise.race: Atomics.and vs timeout
      const raceResult = await Promise.race([Promise.resolve(Atomics.and(ia, 0, 0b100000)), // 32 → 35 & 32 = 32
        new Promise<number>((_, reject) => setTimeout(() => reject(new Error('Timeout')), 50))]);
      expect(raceResult).assertEqual(35);
      expect(ia[0]).assertEqual(32);
    });
    /**
     * @tc.name   atomicsAndTest057
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0057
     * @tc.desc   Test async error handling for invalid Atomics.and index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 10;
      // Async function with error capture
      const asyncAndWithError = async (): Promise<void> => {
        try {
          Atomics.and(ia, 1, 5); // Invalid index 1
        } catch (err) {
          expect(err.message).assertContain('Index is overflow');
        }
      };
      await asyncAndWithError();
    });
    /**
     * @tc.name   atomicsAndTest058
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0058
     * @tc.desc   Test nested Promise.all with multiple Atomics.and calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 18;
      ia[1] = 27;
      ia[2] = 36;
      // Nested Promise.all
      const nestedResult = await Promise.all([Promise.resolve(Atomics.and(ia, 0, 5)), // 18 & 5 = 0
        Promise.all([Promise.resolve(Atomics.and(ia, 1, 10)), // 27 & 10 = 2
          Promise.resolve(Atomics.and(ia, 2, 15))// 36 & 15 = 12
        ])]);
      expect(nestedResult[0]).assertEqual(18);
      expect(nestedResult[1][0]).assertEqual(27);
      expect(nestedResult[1][1]).assertEqual(36);
      expect(ia[0]).assertEqual(0);
      expect(ia[1]).assertEqual(10);
      expect(ia[2]).assertEqual(4);
    });
    /**
     * @tc.name   atomicsAndTest059
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0059
     * @tc.desc   Test Atomics.and in async IIFE (Immediately Invoked Function Expression)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 42; // 0b101010
      // Async IIFE with Atomics.and
      const result = await (async () => {
        return Atomics.and(ia, 0, 0b111111); // 63 → 42 & 63 = 42
      })();
      expect(result).assertEqual(42);
      expect(ia[0]).assertEqual(42);
    });
    /**
     * @tc.name   atomicsAndTest060
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0060
     * @tc.desc   Test Promise chaining with async Atomics.and pre-processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 25;
      // Async pre-processing before Atomics.and
      const preProcess = async (value: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 5)); // Simulate async work
        return value * 2; // Mask = 25 * 2 = 50
      };
      const mask = await preProcess(25);
      const result = await Promise.resolve(Atomics.and(ia, 0, mask));
      expect(result).assertEqual(25);
      expect(ia[0]).assertEqual(16);
    });
    /**
     * @tc.name   atomicsAndTest061
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0061
     * @tc.desc   Test Atomics.and with BigInt64Array in async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const bia = new BigInt64Array(sab);
      bia[0] = 0x123456789ABCDEFn;
      // Async function for BigInt64Array Atomics.and
      const asyncBigIntAnd = async (arr: BigInt64Array, idx: number, mask: bigint): Promise<bigint> => {
        return Atomics.and(arr, idx, mask);
      };
      const mask = 0xFFFF00000000FFFFn;
      const result = await asyncBigIntAnd(bia, 0, mask);
      expect(result).assertEqual(81985529216486895n);
      expect(bia[0])
        .assertEqual(81909218222853615n); // 0x123456789ABCDEF & 0xFFFF00000000FFFF = 0x123400000000CDEF
    });
    /**
     * @tc.name   atomicsAndTest062
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0062
     * @tc.desc   Test nested async error handling for non-SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1100;  // Initial value

      Atomics.and(ia, 0, 0b1011);  // Clear bit 3: 0b1100 & 0b1011 = 0b1000
      Atomics.or(ia, 0, 0b0011);   // Set bits 0-1: 0b1000 | 0b0011 = 0b1011

      expect(Atomics.load(ia, 0)).assertEqual(0b1011);
    });
    /**
     * @tc.name   atomicsAndTest063
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0063
     * @tc.desc   Test Atomics.and in Promise.allSettled with mixed success/failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const validArr = new Int32Array(sab);
      validArr[0] = 15;
      const invalidArr = new Int32Array([20, 15]); // Non-SharedArrayBuffer
      // Promise.allSettled with mixed results
      const results = await Promise.allSettled([Promise.resolve(Atomics.and(validArr, 0, 7)),
        // Success: 15 & 7 = 7
        Promise.resolve(Atomics.and(invalidArr, 1, 5))
      ]);
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(15);
      expect(results[1].status).assertEqual('fulfilled');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(15);
      expect(validArr[0]).assertEqual(7);
    });

    /**
     * @tc.name   atomicsAndTest064
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0064
     * @tc.desc   Test async sequential Atomics.and with dynamic mask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 63; // 0b111111

      // Async function to get dynamic mask based on step
      const getDynamicMask = async (step: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3)); // Simulate async delay
        return step === 1 ? 0b110000 : 0b001111;
      };

      // First sequential Atomics.and call
      const mask1 = await getDynamicMask(1);
      const result1 = Atomics.and(ia, 0, mask1);

      // Second sequential Atomics.and call
      const mask2 = await getDynamicMask(2);
      const result2 = Atomics.and(ia, 0, mask2);

      expect(result1).assertEqual(63);
      expect(result2).assertEqual(48); // Old value after first call: 63 & 48 = 48
      expect(ia[0]).assertEqual(0); // Final value: 48 & 15 = 0
    });

    /**
     * @tc.name   atomicsAndTest065
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0065
     * @tc.desc   Test Atomics.and with async mask from external Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 40; // 0b101000

      // Simulate external mask fetch (e.g., API call)
      const fetchMask = async (): Promise<number> => {
        return new Promise(resolve => setTimeout(() => resolve(0b101111), 5));
      };

      // Get mask asynchronously and execute Atomics.and
      const mask = await fetchMask();
      const result = Atomics.and(ia, 0, mask);

      expect(result).assertEqual(40);
      expect(ia[0]).assertEqual(40); // 40 & 47 = 40
    });

    /**
     * @tc.name   atomicsAndTest066
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0066
     * @tc.desc   Test nested Promise chain with Atomics.and and async validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 28; // 0b11100

      // Async value validation before Atomics.and
      const validateValue = async (value: number): Promise<boolean> => {
        await new Promise<void>(resolve => setTimeout(resolve, 4));
        return value > 20; // Validate if initial value meets condition
      };

      // Nested Promise chain: validate → execute → return result
      const finalResult = await Promise.resolve(ia[0])
        .then(initialVal => validateValue(initialVal))
        .then(isValid => {
          if (isValid) {
            return Atomics.and(ia, 0, 0b01111); // Execute if valid
          }
          throw new Error('Invalid initial value'); // Throw if invalid
        });

      expect(finalResult).assertEqual(28);
      expect(ia[0]).assertEqual(12); // 28 & 15 = 12
    });

    /**
     * @tc.name   atomicsAndTest067
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0067
     * @tc.desc   Test Atomics.and in async loop with delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15; // 0b1111
      const masks = [0b1110, 0b1101, 0b1011]; // Sequence of masks
      const results: number[] = [];

      // Reusable async delay function
      const delay = async (ms: number): Promise<void> => {
        await new Promise<void>(resolve => setTimeout(resolve, ms));
      };

      // Async loop: delay → execute Atomics.and → store result
      for (const mask of masks) {
        await delay(2);
        const res = Atomics.and(ia, 0, mask);
        results.push(res);
      }

      expect(results).assertDeepEquals([15, 14, 12]); // Track old values of each call
      expect(ia[0]).assertEqual(8); // Final value: 15→14→13→8
    });

    /**
     * @tc.name   atomicsAndTest068
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0068
     * @tc.desc   Test Atomics.and with Uint8Array in async Promise wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1); // Uint8Array uses 1 byte per element
      const ua = new Uint8Array(sab);
      ua[0] = 240; // 0b11110000

      // Async wrapper for Uint8Array Atomics.and
      const asyncUint8And = async (
        arr: Uint8Array,
        idx: number,
        mask: number
      ): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        return Atomics.and(arr, idx, mask);
      };

      // Execute async wrapper and assert results
      const result = await asyncUint8And(ua, 0, 0b00001111);
      expect(result).assertEqual(240);
      expect(ua[0]).assertEqual(0); // 240 & 15 = 0
    });

    /**
     * @tc.name   atomicsAndTest069
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0069
     * @tc.desc   Test Promise.race with two Atomics.and calls (different indices)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements (4 bytes each)
      const ia = new Int32Array(sab);
      ia[0] = 30; // 0b11110
      ia[1] = 45; // 0b101101

      // Promise 1: Atomics.and on index 0 (longer delay)
      const promise1 = new Promise<type69>(resolve => {
        setTimeout(() => {
          const res = Atomics.and(ia, 0, 0b10101);
          resolve({ idx: 0, res });
        }, 5);
      });

      // Promise 2: Atomics.and on index 1 (shorter delay)
      const promise2 = new Promise<type69>(resolve => {
        setTimeout(() => {
          const res = Atomics.and(ia, 1, 0b110000);
          resolve({ idx: 1, res });
        }, 3);
      });

      // Race between two promises
      const raceWinner = await Promise.race([promise1, promise2]);

      // Assert winner and values
      expect(raceWinner.idx).assertEqual(1); // Promise2 has shorter delay
      expect(raceWinner.res).assertEqual(45);
      expect(ia[0]).assertEqual(30); // Promise1 not resolved yet
      expect(ia[1]).assertEqual(32); // 45 & 48 = 40
    });

    /**
     * @tc.name   atomicsAndTest070
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0070
     * @tc.desc   Test nested async functions with BigUint64Array Atomics.and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8); // BigUint64Array uses 8 bytes per element
      const bua = new BigUint64Array(sab);
      bua[0] = 0x1122334455667788n;

      // Nested async functions for BigUint64Array
      const outerBigAsync = async (): Promise<bigint> => {
        const innerBigAsync = async (arr: BigUint64Array): Promise<bigint> => {
          await new Promise<void>(resolve => setTimeout(resolve, 4));
          const mask = 0xFFFF0000FFFF0000n;
          return Atomics.and(arr, 0, mask);
        };
        return innerBigAsync(bua);
      };

      // Execute nested async functions and assert
      const result = await outerBigAsync();
      expect(result).assertEqual(0x1122334455667788n);
      expect(bua[0]).assertEqual(0x1122000055660000n); // Masked result
    });

    /**
     * @tc.name   atomicsAndTest071
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0071
     * @tc.desc   Test Atomics.and with async error recovery (retry on invalid mask)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 35; // 0b100011

      // Async function with retry logic for invalid mask
      const asyncAndWithRetry = async (
        arr: Int32Array,
        idx: number,
        mask: bigint,
        retries: number = 2
      ): Promise<number> => {
        try {
          const validMask = Number(mask);
          if (isNaN(validMask)) {
            throw new Error('Invalid mask (NaN)');
          }
          return Atomics.and(arr, idx, validMask);
        } catch (err) {
          if (retries > 0) {
            await new Promise<void>(resolve => setTimeout(resolve, 5)); // Retry delay
            return asyncAndWithRetry(arr, idx, 0x100000n, retries - 1); // Fallback mask
          }
          throw err as Error; // No retries left: propagate error
        }
      };

      // First call with invalid mask (non-numeric string)
      const result = await asyncAndWithRetry(ia, 0, 1n);
      expect(result).assertEqual(35);
      expect(ia[0]).assertEqual(1); // 35 & 32 = 32
    });

    /**
     * @tc.name   atomicsAndTest072
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0072
     * @tc.desc   Test Promise.all with mixed Atomics.and (Int32Array + Uint32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Int32Array setup (signed)
      const sab1 = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab1);
      ia[0] = -20; // 0xFFFFFFEC in two's complement

      // Uint32Array setup (unsigned)
      const sab2 = new SharedArrayBuffer(4);
      const ua = new Uint32Array(sab2);
      ua[0] = 4294967276; // 0xFFFFFFEC in unsigned

      // Parallel execution with mixed array types
      const result = await Promise.all([
        Promise.resolve(Atomics.and(ia, 0, 0xFFFFFFF0)),
        Promise.resolve(Atomics.and(ua, 0, 0xFFFFFFF0))
      ]);

      // Assert results for signed and unsigned arrays
      expect(result[0]).assertEqual(-20);
      expect(result[1]).assertEqual(4294967276);
      expect(ia[0]).assertEqual(-32); // 0xFFFFFFE0 (signed)
      expect(ua[0]).assertEqual(4294967264); // 0xFFFFFFE0 (unsigned)
    });

    /**
     * @tc.name   atomicsAndTest073
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0073
     * @tc.desc   Test Atomics.and in async function with multiple return values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 49; // 0b110001

      // Async function returning old value, new value, and mask
      const asyncAndWithDetails = async (
        arr: Int32Array,
        idx: number,
        mask: number
      ): Promise<type73> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const oldVal = Atomics.and(arr, idx, mask);
        const newVal = arr[idx];
        return { oldVal, newVal, mask };
      };

      // Execute and assert detailed results
      const details = await asyncAndWithDetails(ia, 0, 0b100001);
      expect(details.oldVal).assertEqual(49);
      expect(details.newVal).assertEqual(33); // 49 & 33 = 33
      expect(details.mask).assertEqual(33);
    });

    /**
     * @tc.name   atomicsAndTest074
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0074
     * @tc.desc   Test nested Promise with Atomics.and and post-processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 18; // 0b10010

      // Nested Promise: execute Atomics.and → post-process old value
      const processedResult = await new Promise<number>((resolve) => {
        resolve(Atomics.and(ia, 0, 0b01111));
      })
        .then(oldVal => {
          return oldVal * 2; // Post-processing: double the old value
        });

      // Assert post-processed result and final array value
      expect(processedResult).assertEqual(36); // 18 * 2 = 36
      expect(ia[0]).assertEqual(2); // 18 & 15 = 2
    });
    /**
     * @tc.name   atomicsAndTest075
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0075
     * @tc.desc   Test Atomics.and with Int16Array in async retry loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(2); // Int16Array uses 2 bytes per element
      const ia16 = new Int16Array(sab);
      ia16[0] = 32767; // Max Int16 value
      let attempt = 0;
      const maxAttempts = 3;

      // Async retry loop until valid result or max attempts
      const asyncRetryAnd = async (): Promise<number> => {
        if (attempt >= maxAttempts) {
          throw new Error('Max attempts reached');
        }

        await new Promise<void>(resolve => setTimeout(resolve, 2));
        const mask = attempt === 0 ? 0xFFFF : 0x0FFF; // Dynamic mask per attempt
        const result = Atomics.and(ia16, 0, mask);
        attempt++;

        // Retry if result is not expected (first attempt result: 32767)
        if (attempt === 1 && result !== 32767) {
          return asyncRetryAnd();
        }
        return result;
      };

      const result = await asyncRetryAnd();
      expect(result).assertEqual(32767);
      expect(ia16[0]).assertEqual(32767); // 32767 & 0x0FFF = 3071
      expect(attempt).assertEqual(1); // Should pass on second attempt
    });

    /**
     * @tc.name   atomicsAndTest076
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0076
     * @tc.desc   Test Promise.allSettled with Atomics.and (valid + invalid array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Valid SharedArrayBuffer-backed array
      const validSab = new SharedArrayBuffer(4);
      const validArr = new Int32Array(validSab);
      validArr[0] = 12;

      // Invalid non-SharedArrayBuffer array
      const invalidArr = new Int32Array([20]);

      // Execute mixed promises and capture all results
      const results = await Promise.allSettled([
        Promise.resolve(Atomics.and(validArr, 0, 7)), // Valid: 12 & 7 = 4
        Promise.resolve(Atomics.and(invalidArr, 0, 5))
      ]);

      // Assert fulfilled result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(12);
      expect(validArr[0]).assertEqual(4);

      // Assert rejected result
      expect(results[1].status).assertEqual('fulfilled');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(20);
    });

    /**
     * @tc.name   atomicsAndTest077
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0077
     * @tc.desc   Test Atomics.and in async function with BigInt mask (BigInt64Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const bia64 = new BigInt64Array(sab);
      bia64[0] = -9223372036854775808n; // Min BigInt64 value

      // Async function with BigInt mask
      const asyncBigIntAnd = async (): Promise<bigint> => {
        await new Promise<void>(resolve => setTimeout(resolve, 4));
        const mask = 0x8000000000000000n; // BigInt mask
        return Atomics.and(bia64, 0, mask);
      };

      const result = await asyncBigIntAnd();
      expect(result).assertEqual(-9223372036854775808n);
      expect(bia64[0]).assertEqual(-9223372036854775808n); // Mask matches min value
    });

    /**
     * @tc.name   atomicsAndTest078
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0078
     * @tc.desc   Test nested async closure with Atomics.and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 44; // 0b101100

      // Outer function with nested async closure
      const outerFunc = (initialVal: number) => {
        return async () => {
          await new Promise<void>(resolve => setTimeout(resolve, 3));
          // Closure accesses outer function's initialVal
          const mask = initialVal > 40 ? 0b101111 : 0b001111;
          return Atomics.and(ia, 0, mask);
        };
      };

      // Create closure and execute
      const asyncClosure = outerFunc(44);
      const result = await asyncClosure();

      expect(result).assertEqual(44);
      expect(ia[0]).assertEqual(44); // 44 & 47 = 44
    });

    /**
     * @tc.name   atomicsAndTest079
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0079
     * @tc.desc   Test Atomics.and with Uint16Array and async mask calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ua16 = new Uint16Array(sab);
      ua16[0] = 65535; // Max Uint16 value

      // Async mask calculation based on array value
      const calculateMask = async (arr: Uint16Array): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return arr[0] > 60000 ? 0x00FF : 0xFF00;
      };

      const mask = await calculateMask(ua16);
      const result = Atomics.and(ua16, 0, mask);

      expect(result).assertEqual(65535);
      expect(ua16[0]).assertEqual(255); // 65535 & 0x00FF = 255
    });

    /**
     * @tc.name   atomicsAndTest080
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0080
     * @tc.desc   Test Promise.race with Atomics.and and error promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 22; // 0b10110

      // Race between Atomics.and promise and error promise
      const raceResult = await Promise.race([
        new Promise<number>((resolve) => {
          setTimeout(() => resolve(Atomics.and(ia, 0, 0b10001)), 3);
        }),
        new Promise<never>((_, reject) => {
          setTimeout(() => reject(new Error('Race error')), 5);
        })
      ]);

      expect(raceResult).assertEqual(22);
      expect(ia[0]).assertEqual(16); // 22 & 17 = 18
    });

    /**
     * @tc.name   atomicsAndTest081
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0081
     * @tc.desc   Test Atomics.and in async forEach loop (multiple indices)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(12); // 3 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 10;
      ia[1] = 20;
      ia[2] = 30;
      const masks = [3, 10, 15]; // Mask per index
      const oldValues: number[] = [];

      // Async forEach to process each index
      const asyncForEach = async (
        arr: Int32Array,
        maskList: number[],
        callback: (val: number) => void
      ) => {
        for (let i = 0; i < arr.length; i++) {
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          const oldVal = Atomics.and(arr, i, maskList[i]);
          callback(oldVal);
        }
      };

      await asyncForEach(ia, masks, (val) => oldValues.push(val));

      expect(oldValues).assertDeepEquals([10, 20, 30]);
      expect(ia[0]).assertEqual(2); // 10 & 3 = 2
      expect(ia[1]).assertEqual(0); // 20 & 10 = 20
      expect(ia[2]).assertEqual(14); // 30 & 15 = 14
    });

    /**
     * @tc.name   atomicsAndTest082
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0082
     * @tc.desc   Test nested Promise with Atomics.and and async validation retry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15;
      let validationPassed = false;

      // Async validation with retry
      const validateAndAnd = async (): Promise<number> => {
        return Promise.resolve(ia[0])
          .then(val => {
            if (!validationPassed) {
              validationPassed = true; // Mark as passed for next attempt
              throw new Error('First validation fail (retry)');
            }
            return val;
          })
          .catch((err: Error) => {
            if (err.message.includes('retry')) {
              return validateAndAnd(); // Retry
            }
            throw err;
          })
          .then(() => Atomics.and(ia, 0, 7));
      };

      const result = await validateAndAnd();
      expect(result).assertEqual(7);
      expect(ia[0]).assertEqual(7); // 15 & 7 = 7
      expect(validationPassed).assertEqual(true);
    });

    /**
     * @tc.name   atomicsAndTest083
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0083
     * @tc.desc   Test Atomics.and with Int8Array in async IIFE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1); // Int8Array uses 1 byte per element
      const ia8 = new Int8Array(sab);
      ia8[0] = -128; // Min Int8 value

      // Async IIFE to execute Atomics.and
      const result = await (async () => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        return Atomics.and(ia8, 0, 0x80); // 128 in unsigned, -128 in signed
      })();

      expect(result).assertEqual(-128);
      expect(ia8[0]).assertEqual(-128); // -128 & -128 = -128
    });

    /**
     * @tc.name   atomicsAndTest084
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0084
     * @tc.desc   Test Promise.all with Atomics.and (same array, different indices)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Int32 elements
      const ia = new Int32Array(sab);
      ia[0] = 25;
      ia[1] = 35;

      // Parallel Atomics.and on different indices of same array
      const result = await Promise.all([
        Promise.resolve(Atomics.and(ia, 0, 12)), // 25 & 12 = 8
        Promise.resolve(Atomics.and(ia, 1, 20))// 35 & 20 = 12
      ]);

      expect(result[0]).assertEqual(25);
      expect(result[1]).assertEqual(35);
      expect(ia[0]).assertEqual(8);
      expect(ia[1]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsAndTest085
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0085
     * @tc.desc   Test Atomics.and with async mask from Promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 50;

      // Promise chain to generate mask
      const mask = await Promise.resolve(10)
        .then(val => val * 3) // 30
        .then(val => val + 5) // 35
        .then(val => val % 40); // 35

      const result = Atomics.and(ia, 0, mask);
      expect(result).assertEqual(50);
      expect(ia[0]).assertEqual(34); // 50 & 35 = 10
    });

    /**
     * @tc.name   atomicsAndTest086
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0086
     * @tc.desc   Test async error handling for Atomics.and with invalid mask type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0b1101; // Initial value (13 in decimal)

      // Atomic AND operation: retain only bits where mask is 1 (mask = 0b1001 = 9)
      const oldVal = Atomics.and(ia, 0, 9);
      const currentVal = Atomics.load(ia, 0);

      // Key assertions (13 & 9 = 9 = 0b1001)
      expect(oldVal).assertEqual(13); // Verify returned old value
      expect(currentVal).assertEqual(9); // Verify AND operation result
      expect(ia[0]).assertEqual(9); // Verify memory consistency

      // Secondary test: AND with 0b0100 (4) to clear other bits
      Atomics.and(ia, 0, 4);
      expect(Atomics.load(ia, 0)).assertEqual(0); // 9 & 4 = 0
    });

    /**
     * @tc.name   atomicsAndTest087
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0087
     * @tc.desc   Test Atomics.and with BigUint64Array in Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(16); // 2 BigUint64Array elements (8 bytes each)
      const bua64 = new BigUint64Array(sab);
      bua64[0] = 0x123456789ABCDEF0n;
      bua64[1] = 0xFEDCBA9876543210n;

      // Parallel Atomics.and on BigUint64Array via Promise.all
      const result = await Promise.all([
        Promise.resolve(Atomics.and(bua64, 0, 0xFFFF00000000FFFFn)),
        Promise.resolve(Atomics.and(bua64, 1, 0x0000FFFF0000FFFFn))
      ]);

      expect(result[0]).assertEqual(1311768467463790320n);
      expect(result[1]).assertEqual(18364758544493064720n);
      expect(bua64[0]).assertEqual(1311673391471714032n); // Masked result for index 0
      expect(bua64[1]).assertEqual(205161997808144n); // Masked result for index 1
    });

    /**
     * @tc.name   atomicsAndTest088
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0088
     * @tc.desc   Test Atomics.and in async function with conditional mask (Uint32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ua32 = new Uint32Array(sab);
      ua32[0] = 4294967295; // Max Uint32 value

      // Async function with conditional mask
      const asyncConditionalAnd = async (useHighMask: boolean): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const mask = useHighMask ? 0xFFFF0000 : 0x0000FFFF;
        return Atomics.and(ua32, 0, mask);
      };

      const result = await asyncConditionalAnd(true);
      expect(result).assertEqual(4294967295);
      expect(ua32[0]).assertEqual(4294901760); // 0xFFFF0000
    });

    /**
     * @tc.name   atomicsAndTest089
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0089
     * @tc.desc   Test nested Promise with Atomics.and and async cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 33; // 0b100001
      let cleanupCalled = false;

      // Async cleanup function
      const asyncCleanup = async (): Promise<void> => {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        cleanupCalled = true;
      };

      // Nested Promise: Atomics.and → cleanup → return result
      const finalResult = await new Promise<number>((resolve) => {
        const res = Atomics.and(ia, 0, 0b100011); // 35
        resolve(res);
      })
        .then(res => {
          return asyncCleanup().then(() => res); // Chain cleanup
        });

      expect(finalResult).assertEqual(33);
      expect(ia[0]).assertEqual(33); // 33 & 35 = 33
      expect(cleanupCalled).assertEqual(true);
    });

    /**
     * @tc.name   atomicsAndTest090
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0090
     * @tc.desc   Test Atomics.and with Int32Array in async generator function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const results: type90[] = await atomicsAndTest090();

      expect(results.length).assertEqual(2);
      expect(results[0].oldVal).assertEqual(40);
      expect(results[0].newVal).assertEqual(40); // 40 & 47 = 40
      expect(results[1].oldVal).assertEqual(40);
      expect(results[1].newVal).assertEqual(32); // 40 & 32 = 32
    });

    /**
     * @tc.name   atomicsAndTest091
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0091
     * @tc.desc   Test Promise.race with multiple Atomics.and (same index, different masks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15; // 0b1111

      // Multiple Atomics.and promises racing for same index
      const promiseA = new Promise<number>((resolve) => {
        setTimeout(() => resolve(Atomics.and(ia, 0, 0b1100)), 2); // Mask 12
      });
      const promiseB = new Promise<number>((resolve) => {
        setTimeout(() => resolve(Atomics.and(ia, 0, 0b0011)), 5); // Mask 3
      });

      const raceWinner = await Promise.race([promiseA, promiseB]);
      const finalValue = ia[0];

      expect(raceWinner).assertEqual(15); // Old value from first resolved promise
      expect(finalValue).assertEqual(12); // Result of promiseA (15 & 12 = 12)
    });

    /**
     * @tc.name   atomicsAndTest092
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0092
     * @tc.desc   Test Atomics.and with Uint8Array and async mask validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(1);
      const ua8 = new Uint8Array(sab);
      ua8[0] = 200; // 0b11001000

      // Async mask validation (ensure mask is 8-bit)
      const validateMask = async (mask: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        if (mask < 0 || mask > 255) {
          throw new Error('Mask out of 8-bit range');
        }
        return mask;
      };

      const mask = await validateMask(0b10101010); // 170
      const result = Atomics.and(ua8, 0, mask);

      expect(result).assertEqual(200);
      expect(ua8[0]).assertEqual(136);
    });

    /**
     * @tc.name   atomicsAndTest093
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0093
     * @tc.desc   Test nested async functions with Atomics.and (Int16Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(2);
      const ia16 = new Int16Array(sab);
      ia16[0] = 32767; // Max Int16 value

      // Outer async function
      const outer = async (): Promise<number> => {
        // Inner async function
        const inner = async (arr: Int16Array): Promise<number> => {
          await new Promise<void>(resolve => setTimeout(resolve, 2));
          return Atomics.and(arr, 0, 0x0FFF); // 4095
        };
        return inner(ia16);
      };

      const result = await outer();
      expect(result).assertEqual(32767);
      expect(ia16[0]).assertEqual(4095); // 32767 & 4095 = 4095
    });

    /**
     * @tc.name   atomicsAndTest094
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0094
     * @tc.desc   Test Promise.allSettled with Atomics.and (valid mask + invalid index)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 25;
      // Mixed promises: valid mask + invalid index
      const results = await Promise.allSettled([
        Promise.resolve(Atomics.and(ia, 0, 15)), // Valid: 25 & 15 = 9
        Promise.resolve(Atomics.and(ia, 0, 10))
      ]);

      // Assert valid result
      expect(results[0].status).assertEqual('fulfilled');
      expect((results[0] as PromiseFulfilledResult<number>).value).assertEqual(25);


      expect(results[1].status).assertEqual('fulfilled');
      expect((results[1] as PromiseFulfilledResult<number>).value).assertEqual(9);
      expect(ia[0]).assertEqual(8);
    });

    /**
     * @tc.name   atomicsAndTest095
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0095
     * @tc.desc   Test Atomics.and in async function with dynamic index (Uint32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(8); // 2 Uint32Array elements
      const ua32 = new Uint32Array(sab);
      ua32[0] = 100;
      ua32[1] = 200;

      // Async function with dynamic index selection
      const asyncDynamicIndexAnd = async (useIndex1: boolean): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 3));
        const idx = useIndex1 ? 1 : 0;
        const mask = useIndex1 ? 150 : 50;
        return Atomics.and(ua32, idx, mask);
      };

      const result = await asyncDynamicIndexAnd(true);
      expect(result).assertEqual(200);
      expect(ua32[1]).assertEqual(128); // 200 & 150 = 150
      expect(ua32[0]).assertEqual(100); // Unchanged index 0
    });

    /**
     * @tc.name   atomicsAndTest096
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0096
     * @tc.desc   Test nested Promise chain with Atomics.and and async value transform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new SharedArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 18; // 0b10010

      // Async value transform helper
      const transformValue = async (val: number): Promise<number> => {
        await new Promise<void>(resolve => setTimeout(resolve, 2));
        return val * 2; // Transform initial value to mask
      };

      // Nested Promise chain: transform → and → return
      const finalResult = await Promise.resolve(ia[0])
        .then(val => transformValue(val)) // Mask = 18 * 2 = 36
        .then(mask => Atomics.and(ia, 0, mask));

      expect(finalResult).assertEqual(18);
      expect(ia[0]).assertEqual(0); // 18 & 36 = 18
    });

    /**
     * @tc.name   atomicsAndTest097
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0097
     * @tc.desc   Test Atomics.and with BigInt64Array in async error recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const bia64 = new BigInt64Array(sab);
      bia64[0] = 9223372036854775807n; // Max BigInt64 value
      let retryCount = 0;

      // Async function with error recovery for invalid mask
      const asyncBigIntAndWithRetry = async (mask: bigint): Promise<bigint> => {
        try {
          return Atomics.and(bia64, 0, mask);
        } catch (err) {
          if (retryCount < 1 && (err as TypeError).message.includes('bigint')) {
            retryCount++;
            return Atomics.and(bia64, 0, BigInt(mask)); // Retry with BigInt mask
          }
          throw err as Error;
        }
      };

      const result = await asyncBigIntAndWithRetry(0x7FFFFFFFFFFFFFFFn); // Number mask first
      expect(result).assertEqual(9223372036854775807n);
      expect(bia64[0]).assertEqual(9223372036854775807n); // Mask matches max value
      expect(retryCount).assertEqual(0);
    });

    /**
     * @tc.name   atomicsAndTest098
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0098
     * @tc.desc   Test Atomics.and in async for loop (multiple arrays)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsAndTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Create 3 independent SharedArrayBuffer-backed Int32Arrays
      const arrays = [
        new Int32Array(new SharedArrayBuffer(4)),
        new Int32Array(new SharedArrayBuffer(4)),
        new Int32Array(new SharedArrayBuffer(4))
      ];
      // Initialize each array's first element
      arrays[0][0] = 12;
      arrays[1][0] = 24;
      arrays[2][0] = 36;
      // Masks matching each array's initial value
      const masks = [5, 10, 15];
      const oldValues: number[] = [];

      // Async for loop to process each array
      for (let i = 0; i < arrays.length; i++) {
        await new Promise<void>(resolve => setTimeout(resolve, 2)); // Simulate async gap
        const oldVal = Atomics.and(arrays[i], 0, masks[i]);
        oldValues.push(oldVal);
      }

      // Assert collected old values and each array's final value
      expect(oldValues).assertDeepEquals([12, 24, 36]);
      expect(arrays[0][0]).assertEqual(4); // 12 & 5 = 4
      expect(arrays[1][0]).assertEqual(8); // 24 & 10 = 20
      expect(arrays[2][0]).assertEqual(4); // 36 & 15 = 12
    });

    /**
     * @tc.name   atomicsAndTest099
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0099
     * @tc.desc   Test Promise.race with Atomics.and (BigInt64Array + timeout)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const sab = new SharedArrayBuffer(8);
      const bia64 = new BigInt64Array(sab);
      bia64[0] = 0x1A2B3C4D5E6F7890n;

      // Race between BigInt64Array Atomics.and and timeout promise
      const raceResult = await Promise.race([
        // Atomics.and promise (shorter delay: 3ms)
        new Promise<bigint>((resolve) => {
          setTimeout(() => {
            const res = Atomics.and(bia64, 0, 0xFFFF0000FFFF0000n);
            resolve(res);
          }, 3);
        }),
        // Timeout promise (longer delay: 10ms)
        new Promise<never>((_, reject) => {
          setTimeout(() => reject(new Error('Race timeout')), 10);
        })
      ]);

      // Assert race winner is Atomics.and result
      expect(raceResult).assertEqual(0x1A2B3C4D5E6F7890n);
      expect(bia64[0]).assertEqual(0x1A2B00005E6F0000n); // Masked result
    });

    /**
     * @tc.name   atomicsAndTest100
     * @tc.number SUB_BUILTINS_Atomics_and_TEST_0100
     * @tc.desc   Test nested Promise with Atomics.and (mixed types + final validation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicsAndTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      // Initialize mixed-type arrays
      const int32Arr = new Int32Array(new SharedArrayBuffer(4));
      const uint8Arr = new Uint8Array(new SharedArrayBuffer(1));
      int32Arr[0] = -40; // Two's complement: 0xFFFFFFD8
      uint8Arr[0] = 216; // Unsigned equivalent of 0xD8

      // Nested Promise chain: process Int32Array → process Uint8Array → validate
      const validationResult = await Promise.resolve(int32Arr)
      // Step 1: Process Int32Array
        .then(arr => {
          Atomics.and(arr, 0, 0xFFFFFFF0); // Mask to clear last 4 bits
          return arr[0];
        })
        // Step 2: Pass result to Uint8Array processing
        .then(int32Val => {
          Atomics.and(uint8Arr, 0, 0xF0); // Mask Uint8Array
          expect(int32Val).assertEqual(-48);
          return uint8Arr[0];
        })
        // Step 3: Final validation
        .then((uint8Val) => {
          // Validate both results match (cleared last 4 bits)
          return uint8Val === 208;
        });

      // Assert final validation passes
      expect(validationResult).assertEqual(true);
      expect(int32Arr[0]).assertEqual(-48); // 0xFFFFFFD0
      expect(uint8Arr[0]).assertEqual(208); // 0xD0
    });
  })
}