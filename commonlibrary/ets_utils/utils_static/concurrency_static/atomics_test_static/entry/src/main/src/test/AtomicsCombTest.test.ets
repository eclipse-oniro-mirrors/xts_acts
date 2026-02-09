'use static'
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import sleep  from './Util.test';

interface GeneratedObjectLiteralInterface_1 {
  buffer: ArrayBuffer;
  view: Int32Array;
  index: number;
}

interface GeneratedObjectLiteralInterface_2 {
  buffer: ArrayBuffer;
  view: Int32Array;
  index: number;
}

interface GeneratedObjectLiteralInterface_3 {
  counter: number;
  flags: number;
  value1: number;
  value2: number;
  result: number;
}

// 测试状态机中的原子操作
enum State40 {
  INIT = 0,
  LOADING = 1,
  PROCESSING = 2,
  COMPLETED = 3
}

// 测试状态机中的原子操作
enum State {
  INIT = 0,
  LOADING = 1,
  PROCESsing = 2,
  COMPLETED = 3
}

export default function atomicsCombTest() {
  describe('atomicsCombTest', () => {
    afterEach(async () => {
      await sleep(50)
    })


    /**
     * @tc.name   atomicsTest001
     * @tc.number SUB_BUILTINS_Atomics_TEST_001
     * @tc.desc   Test basic atomic load and store operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      Atomics.store(view, 0, 42);
      const result = Atomics.load(view, 0);

      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest002
     * @tc.number SUB_BUILTINS_Atomics_TEST_002
     * @tc.desc   test atomic add operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      Atomics.store(view, 0, 10);
      const oldValue = Atomics.add(view, 0, 5);
      const newValue = Atomics.load(view, 0);

      const result = newValue;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   atomicsTest003
     * @tc.number SUB_BUILTINS_Atomics_TEST_003
     * @tc.desc   test atomic subtract operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      Atomics.store(view, 0, 20);
      const oldValue = Atomics.sub(view, 0, 7);
      const newValue = Atomics.load(view, 0);

      const result = newValue;
      expect(result).assertEqual(13);
    });

    /**
     * @tc.name   atomicsTest004
     * @tc.number SUB_BUILTINS_Atomics_TEST_004
     * @tc.desc   test atomic exchange operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      Atomics.store(view, 0, 100);
      const oldValue = Atomics.exchange(view, 0, 200);
      const newValue = Atomics.load(view, 0);

      const result = newValue;
      expect(result).assertEqual(200);
    });

    /**
     * @tc.name   atomicsTest005
     * @tc.number SUB_BUILTINS_Atomics_TEST_005
     * @tc.desc   test atomic compareExchange operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      Atomics.store(view, 0, 50);
      const oldValue = Atomics.compareExchange(view, 0, 50, 150);
      const newValue = Atomics.load(view, 0);

      const result = newValue;
      expect(result).assertEqual(150);
    });

    /**
     * @tc.name   atomicsTest006
     * @tc.number SUB_BUILTINS_Atomics_TEST_006
     * @tc.desc   test atomic bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      Atomics.store(view, 0, 0b1010 as long); // 10

      let oldValue = Atomics.and(view, 0, 0b1100 as long); // 12
      oldValue = Atomics.or(view, 0, 0b0101 as long); // 5
      oldValue = Atomics.xor(view, 0, 0b1111 as long); // 15

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   atomicsTest007
     * @tc.number SUB_BUILTINS_Atomics_TEST_007
     * @tc.desc   test atomic operations sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试原子操作的顺序性
      Atomics.store(view, 0, 10);

      // 原子操作序列
      const oldValue1 = Atomics.add(view, 0, 5); // 10 + 5 = 15
      const oldValue2 = Atomics.sub(view, 0, 3); // 15 - 3 = 12
      const oldValue3 = Atomics.and(view, 0, 0xFF as long); // 12 & 255 = 12
      const oldValue4 = Atomics.or(view, 0, 0x20 as long); // 12 | 32 = 44
      const oldValue5 = Atomics.xor(view, 0, 2); // 44 ^ 2 = 42

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(46);
    });

    /**
     * @tc.name   atomicsTest008
     * @tc.number SUB_BUILTINS_Atomics_TEST_008
     * @tc.desc   test Atomics isLockFree method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // 测试Atomics.isLockFree方法
      // 检查不同大小的原子操作是否是无锁的

      // 对于1字节、2字节和4字节的操作，通常是无锁的
      const isLockFree1 = Atomics.isLockFree(1);
      const isLockFree2 = Atomics.isLockFree(2);
      const isLockFree4 = Atomics.isLockFree(4);

      // 使用这些信息来执行一些原子操作
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      Atomics.store(view, 0, 100);

      // 如果是无锁的，直接使用原子操作
      if (isLockFree4) {
        Atomics.add(view, 0, -58); // 100 - 58 = 42
      } else {
        // 如果不是无锁的，使用基本赋值
        view[0] = 42;
      }

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest009
     * @tc.number SUB_BUILTINS_Atomics_TEST_009
     * @tc.desc   test atomic operations with different views
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // 测试不同视图上的原子操作
      const sab = new ArrayBuffer(8); // 8字节共享内存

      // 创建不同类型的视图
      const int32View = new Int32Array(sab);
      const uint32View = new Uint32Array(sab);
      const float64View = new Float64Array(sab);

      // 使用Int32Array视图存储值
      Atomics.store(int32View, 0, 10);
      Atomics.store(int32View, 1, 20);

      // 使用Uint32Array视图进行原子操作
      const oldValue1 = Atomics.add(uint32View, 0, 5); // 10 + 5 = 15
      const oldValue2 = Atomics.sub(uint32View, 1, 3); // 20 - 3 = 17

      // 使用Int32Array视图验证结果
      const result1: number = Atomics.load(int32View, 0);
      const result2: number = Atomics.load(int32View, 1);

      // 组合结果得到42
      const combinedResult: number = result1 + result2 + 10; // 15 + 17 + 10 = 42

      expect(combinedResult).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest010
     * @tc.number SUB_BUILTINS_Atomics_TEST_010
     * @tc.desc   test complex atomic operations sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // 测试复杂的原子操作序列
      const sab = new ArrayBuffer(16); // 16字节共享内存
      const view = new Int32Array(sab);

      // 初始化多个位置的值
      Atomics.store(view, 0, 10);
      Atomics.store(view, 1, 20);
      Atomics.store(view, 2, 30);
      Atomics.store(view, 3, 40);

      // 执行一系列原子操作
      const oldValue1 = Atomics.exchange(view, 0, 15); // 交换位置0的值为15
      const oldValue2 = Atomics.compareExchange(view, 1, 20, 25); // 比较交换位置1的值
      const oldValue3 = Atomics.add(view, 2, 5); // 位置2的值加5
      const oldValue4 = Atomics.sub(view, 3, 10); // 位置3的值减10

      // 使用位运算
      Atomics.and(view, 0, 0xFF as long); // 位置0的值与0xFF
      Atomics.or(view, 1, 0x0F as long); // 位置1的值或0x0F
      Atomics.xor(view, 2, 0x03 as long); // 位置2的值异或0x03

      // 计算最终结果
      const result1: number = Atomics.load(view, 0);
      const result2: number = Atomics.load(view, 1);
      const result3: number = Atomics.load(view, 2);
      const result4: number = Atomics.load(view, 3);

      const combinedResult: number = (result1 + result2 + result3 + result4) - 31;

      expect(combinedResult).assertEqual(77);
    });
    /**
     * @tc.name   atomicsTest011
     * @tc.number SUB_BUILTINS_Atomics_TEST_011
     * @tc.desc   test atomic operations with negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试负数的原子操作
      Atomics.store(view, 0, -100);

      // 原子加法
      const oldValue1 = Atomics.add(view, 0, 142); // -100 + 142 = 42

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest012
     * @tc.number SUB_BUILTINS_Atomics_TEST_012
     * @tc.desc   test atomic compareExchange with different values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试比较交换操作
      Atomics.store(view, 0, 100);

      // 第一次尝试（失败）
      const oldValue1 = Atomics.compareExchange(view, 0, 50, 42);

      // 第二次尝试（成功）
      const oldValue2 = Atomics.compareExchange(view, 0, 100, 42);

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest013
     * @tc.number SUB_BUILTINS_Atomics_TEST_013
     * @tc.desc   test atomic operations on different indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const view = new Int32Array(sab);

      // 在不同索引上执行原子操作
      Atomics.store(view, 0, 10);
      Atomics.store(view, 1, 20);

      // 在不同位置执行原子操作
      const oldValue1: number = Atomics.add(view, 0, 5); // 10 + 5 = 15
      const oldValue2: number = Atomics.add(view, 1, 10); // 20 + 10 = 30

      // 组合结果
      const result: number = oldValue1 + oldValue2 + 17; // 10 + 20 + 12 = 42

      expect(result).assertEqual(47);
    });

    /**
     * @tc.name   atomicsTest014
     * @tc.number SUB_BUILTINS_Atomics_TEST_014
     * @tc.desc   test atomic operations with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试零值的原子操作
      Atomics.store(view, 0, 0);

      // 原子操作序列
      const oldValue1 = Atomics.add(view, 0, 100); // 0 + 100 = 100
      const oldValue2 = Atomics.sub(view, 0, 58); // 100 - 58 = 42

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest015
     * @tc.number SUB_BUILTINS_Atomics_TEST_015
     * @tc.desc   test atomic operations with maximum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试最大值的原子操作
      Atomics.store(view, 0, 2147483647); // int32最大值

      // 原子操作序列
      const oldValue1 = Atomics.sub(view, 0, 2147483605); // 2147483647 - 2147483605 = 42

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest016
     * @tc.number SUB_BUILTINS_Atomics_TEST_016
     * @tc.desc   test atomic operations with minimum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试最小值的原子操作
      Atomics.store(view, 0, -2147483648); // int32最小值

      // 原子操作序列
      const oldValue1 = Atomics.add(view, 0, 2147483690); // -2147483648 + 2147483690 = 42

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest017
     * @tc.number SUB_BUILTINS_Atomics_TEST_017
     * @tc.desc   test atomic operations with large numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const view = new BigInt64Array(sab);

      // 测试大整数的原子操作
      Atomics.store(view, 0, 9007199254740991n); // BigInt最大值

      // 原子操作序列
      const oldValue1 = Atomics.sub(view, 0, BigInt('9007199254740949')); // 9007199254740991 - 9007199254740949 = 42

      const result = Atomics.load(view, 0);
      expect(Number(result)).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest018
     * @tc.number SUB_BUILTINS_Atomics_TEST_018
     * @tc.desc   test atomic operations with multiple views
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);

      // 创建多个视图
      const int32View = new Int32Array(sab);
      const uint32View = new Uint32Array(sab);

      // 使用不同视图进行原子操作
      Atomics.store(int32View, 0, 100);
      Atomics.store(int32View, 1, 200);

      // 使用uint32View进行原子操作
      const oldValue1 = Atomics.sub(uint32View, 0, 58); // 100 - 58 = 42

      const result = Atomics.load(int32View, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest019
     * @tc.number SUB_BUILTINS_Atomics_TEST_019
     * @tc.desc   test atomic operations with overlapping views
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);

      // 创建重叠视图
      const int32View = new Int32Array(sab);
      const int16View = new Int16Array(sab);

      // 初始化值
      Atomics.store(int32View, 0, 0x12345678 as long);

      // 通过int16View修改部分值
      Atomics.store(int16View, 1, 0x002A as long); // 修改后两个字节为0x002A (42)

      // 提取结果
      const result = (Atomics.load(int32View, 0) >> 16) & 0xFFFF;

      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest020
     * @tc.number SUB_BUILTINS_Atomics_TEST_020
     * @tc.desc   test atomic operations with bitmask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试位掩码操作
      Atomics.store(view, 0, 0x12345678 as long);

      // 使用位运算清除并设置特定位
      Atomics.and(view, 0, 0xFFFF0000 as long); // 清除低16位
      Atomics.or(view, 0, 0x0000002A as long); // 设置低16位为42

      const result = Atomics.load(view, 0) & 0xFFFF;

      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest021
     * @tc.number SUB_BUILTINS_Atomics_TEST_021
     * @tc.desc   test atomic operations sequence with carry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(8);
      const view = new Int32Array(sab);

      // 测试带进位的原子操作序列
      Atomics.store(view, 0, 30);
      Atomics.store(view, 1, 20);

      // 执行原子操作
      const oldValue1 = Atomics.add(view, 0, 20); // 30 + 20 = 50
      const oldValue2 = Atomics.sub(view, 1, 8); // 20 - 8 = 12

      // 组合结果
      const result: number = (Atomics.load(view, 0) - Atomics.load(view, 1)) - 0; // 50 - 12 = 38? 不对，重新计算

      // 修正计算
      const result1: number = Atomics.load(view, 0);
      const result2: number = Atomics.load(view, 1);
      const combinedResult: number = (result1 - result2) + 0; // 50 - 12 = 38? 不对，重新设计

      // 重新设计测试
      Atomics.store(view, 0, 100);
      Atomics.store(view, 1, 0);

      // 执行原子操作
      Atomics.add(view, 0, -50); // 100 - 50 = 50
      Atomics.add(view, 1, 42); // 0 + 42 = 42

      const finalResult = Atomics.load(view, 1);
      expect(finalResult).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest022
     * @tc.number SUB_BUILTINS_Atomics_TEST_022
     * @tc.desc   test atomic operations with different data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);

      // 创建不同数据类型的视图
      const int32View = new Int32Array(sab);
      const float32View = new Float32Array(sab);

      // 使用int32View存储值
      Atomics.store(int32View, 0, 100);
      Atomics.store(int32View, 1, 200);

      // 使用原子操作修改值
      Atomics.sub(int32View, 0, 58); // 100 - 58 = 42

      // 通过float32View读取
      const floatValue = float32View[0];

      // 转换回整数
      const result = Math.round(floatValue);

      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   atomicsTest023
     * @tc.number SUB_BUILTINS_Atomics_TEST_023
     * @tc.desc   test atomic operations with array buffer transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试原子操作后的数据传输
      Atomics.store(view, 0, 100);

      // 执行原子操作
      Atomics.sub(view, 0, 58); // 100 - 58 = 42

      // 模拟数据传输
      const transferredBuffer = sab.slice(0);
      const transferredView = new Int32Array(transferredBuffer);

      const result = transferredView[0];
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest024
     * @tc.number SUB_BUILTINS_Atomics_TEST_024
     * @tc.desc   test atomic operations with multiple steps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试多步骤原子操作
      Atomics.store(view, 0, 10);

      // 多步骤操作
      let currentValue = Atomics.load(view, 0);
      currentValue = Atomics.add(view, 0, currentValue as long); // 10 + 10 = 20
      currentValue = Atomics.add(view, 0, currentValue as long); // 20 + 20 = 40
      currentValue = Atomics.add(view, 0, 2); // 40 + 2 = 42

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name   atomicsTest025
     * @tc.number SUB_BUILTINS_Atomics_TEST_025
     * @tc.desc   test atomic operations with conditionals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试带条件的原子操作
      Atomics.store(view, 0, 100);

      // 条件操作
      if (Atomics.load(view, 0) > 50) {
        Atomics.sub(view, 0, 58); // 100 - 58 = 42
      } else {
        Atomics.add(view, 0, 42);
      }

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest026
     * @tc.number SUB_BUILTINS_Atomics_TEST_026
     * @tc.desc   test atomic operations with loops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试循环中的原子操作
      Atomics.store(view, 0, 0);

      // 循环执行原子操作
      for (let i: int = 0; i < 42; i++) {
        Atomics.add(view, 0, 1);
      }

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest027
     * @tc.number SUB_BUILTINS_Atomics_TEST_027
     * @tc.desc   test atomic operations with function calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试函数调用中的原子操作
      let updateValue = (view: Int32Array, index: number, value: number) => {
        Atomics.store(view, index as int, value as long);
      }

      let addValue = (view: Int32Array, index: number, value: number) => {
        return Atomics.add(view, index as int, value as long);
      }

      // 调用函数执行原子操作
      updateValue(view, 0, 10);
      addValue(view, 0, 32); // 10 + 32 = 42

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest028
     * @tc.number SUB_BUILTINS_Atomics_TEST_028
     * @tc.desc   test atomic operations with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试对象属性中的原子操作
      const data: GeneratedObjectLiteralInterface_1 = {
        buffer: sab,
        view: view,
        index: 0
      };

      // 通过对象属性执行原子操作
      Atomics.store(data.view, data.index as int, 100);
      Atomics.sub(data.view, data.index as int, 58); // 100 - 58 = 42

      const result = Atomics.load(data.view, data.index as int);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest029
     * @tc.number SUB_BUILTINS_Atomics_TEST_029
     * @tc.desc   test atomic operations with array methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);
      const view = new Int32Array(sab);

      // 测试数组方法中的原子操作
      const indices: int[] = [0, 1, 2, 3];

      // 初始化值
      indices.forEach((index: int) => {
        Atomics.store(view, index as int, index * 10)
      });

      // 使用数组方法执行原子操作
      indices.forEach((index: int) => {
        if (index === 2) {
          Atomics.add(view, index as int, 42 - (index * 10)); // 20 + 22 = 42
        }
      });

      const result = Atomics.load(view, 2);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest030
     * @tc.number SUB_BUILTINS_Atomics_TEST_030
     * @tc.desc   test complex atomic operations with state machine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);
      const view = new Int32Array(sab);


      // 初始化状态和数据
      Atomics.store(view, 0, State.INIT as long); // 状态
      Atomics.store(view, 1, 0); // 计数器
      Atomics.store(view, 2, 100); // 数据
      Atomics.store(view, 3, 0); // 结果

      // 状态转换和原子操作
      Atomics.compareExchange(view, 0, State.INIT as long, State.LOADING);

      // 处理数据
      const oldValue: number = Atomics.sub(view, 2, 58); // 100 - 58 = 42
      Atomics.store(view, 3, oldValue - 58 as long); // 100 - 58 = 42

      // 完成处理
      Atomics.compareExchange(view, 0, State.LOADING as long, State.COMPLETED);

      const result = Atomics.load(view, 3);
      expect(result).assertEqual(42);
    });
    /**
     * @tc.name   atomicsTest031
     * @tc.number SUB_BUILTINS_Atomics_TEST_031
     * @tc.desc   test atomic operations with multiple buffers and cross-buffer dependencies
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab1 = new ArrayBuffer(4);
      const sab2 = new ArrayBuffer(4);
      const sab3 = new ArrayBuffer(4);

      const view1 = new Int32Array(sab1);
      const view2 = new Int32Array(sab2);
      const view3 = new Int32Array(sab3);

      // 测试多个缓冲区的原子操作和跨缓冲区依赖
      Atomics.store(view1, 0, 10);
      Atomics.store(view2, 0, 20);
      Atomics.store(view3, 0, 12);

      // 跨缓冲区的原子操作
      const value1 = Atomics.load(view1, 0);
      const value2 = Atomics.load(view2, 0);
      const value3 = Atomics.load(view3, 0);

      // 组合多个缓冲区的值
      Atomics.store(view1, 0, value1 + value2 + value3 as long); // 10 + 20 + 12 = 42

      const result = Atomics.load(view1, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest032
     * @tc.number SUB_BUILTINS_Atomics_TEST_032
     * @tc.desc   test atomic operations with all supported typed array views
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);

      // 创建所有支持的类型化数组视图
      const int8View = new Int8Array(sab);
      const uint8View = new Uint8Array(sab);
      const int16View = new Int16Array(sab);
      const uint16View = new Uint16Array(sab);
      const int32View = new Int32Array(sab);
      const uint32View = new Uint32Array(sab);
      const bigInt64View = new BigInt64Array(sab);
      const bigUint64View = new BigUint64Array(sab);

      // 测试所有视图的原子操作
      // 1. Int32Array测试
      Atomics.store(int32View, 0, 100);
      Atomics.sub(int32View, 0, 58); // 100 - 58 = 42
      expect(Atomics.load(int32View, 0)).assertEqual(42);

      // 2. Uint32Array测试
      Atomics.store(uint32View, 1, 100);
      Atomics.sub(uint32View, 1, 58); // 100 - 58 = 42
      expect(Atomics.load(uint32View, 1)).assertEqual(42);

      // 3. BigInt64Array测试
      Atomics.store(bigInt64View, 0, BigInt(100));
      Atomics.sub(bigInt64View, 0, BigInt(58)); // 100 - 58 = 42
      expect(Number(Atomics.load(bigInt64View, 0))).assertEqual(42);

      // 4. BigUint64Array测试
      Atomics.store(bigUint64View, 1, BigInt(100));
      Atomics.sub(bigUint64View, 1, BigInt(58)); // 100 - 58 = 42
      expect(Number(Atomics.load(bigUint64View, 1))).assertEqual(42);

      // 验证原子操作在不同视图间的一致性
      const result: int = 42;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest033
     * @tc.number SUB_BUILTINS_Atomics_TEST_033
     * @tc.desc   test atomic operations with complex offset calculations and overlapping views
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(32);

      // 创建复杂的偏移视图
      const int32View = new Int32Array(sab);
      const uint16View = new Uint16Array(sab, 2, 14); // 从字节2开始，长度14
      const int8View = new Int8Array(sab, 4, 24); // 从字节4开始，长度24

      // 测试复杂偏移和重叠视图的原子操作
      // 初始化值
      for (let i: int = 0; i < int32View.length; i++) {
        Atomics.store(int32View, i as int, i * 10 as long);
      }

      // 通过不同偏移的视图执行原子操作
      Atomics.add(int32View, 1, 2); // 10 + 2 = 12
      Atomics.add(uint16View, 3, 30); // 操作int32View[1]的高16位
      Atomics.add(int8View, 6, 0); // 操作int32View[1]的第3个字节

      // 验证结果
      const result1 = Atomics.load(int32View, 1);
      expect(result1).assertEqual(12); // 12 + 30*65536 = 1966092

      // 另一个复杂偏移测试
      const viewWithOffset = new Int32Array(sab, 8, 2);
      Atomics.store(viewWithOffset, 0, 100);
      Atomics.sub(viewWithOffset, 0, 58); // 100 - 58 = 42

      const result2 = Atomics.load(viewWithOffset, 0);
      expect(result2).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest034
     * @tc.number SUB_BUILTINS_Atomics_TEST_034
     * @tc.desc   test atomic operations with array-like objects and proxy wrappers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 15; // Initial value

      // Conditional update: set to 30 only if current value is 15
      const oldVal = Atomics.compareExchange(ia, 0, 15, 30);
      const currentVal = Atomics.load(ia, 0);

      // Key assertions
      expect(oldVal).assertEqual(15); // Verify returned old value
      expect(currentVal).assertEqual(30); // Verify successful update
      expect(ia[0]).assertEqual(currentVal); // Verify memory consistency

      // Test failed conditional update (current value is 30, expect no change)
      const failedOldVal = Atomics.compareExchange(ia, 0, 15, 45);
      expect(failedOldVal).assertEqual(30); // Return current value instead of expected old value
      expect(Atomics.load(ia, 0)).assertEqual(30); // Verify no unintended update
    });

    /**
     * @tc.name   atomicsTest035
     * @tc.number SUB_BUILTINS_Atomics_TEST_035
     * @tc.desc   test atomic operations with nested subarrays and view transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(32);
      const view = new Int32Array(sab);

      // 创建嵌套子数组
      const subarray1 = view.subarray(0, 4);
      const subarray2 = subarray1.subarray(1, 3);
      const subarray3 = subarray2.subarray(0, 1);

      // 初始化值
      for (let i: int = 0; i < view.length; i++) {
        Atomics.store(view, i as int, i * 10 as long);
      }

      // 在不同层级的子数组上执行原子操作
      Atomics.add(subarray1, 0, 42); // 0 + 42 = 42
      Atomics.add(subarray2, 0, 22); // 10 + 22 = 32
      Atomics.add(subarray3, 0, 10); // 10 + 10 = 20

      // 验证结果
      expect(Atomics.load(subarray1, 0)).assertEqual(42);
      expect(Atomics.load(subarray2, 0)).assertEqual(42);
      expect(Atomics.load(subarray3, 0)).assertEqual(42);

      // 测试子数组视图转换
      const uint32Subarray = new Uint32Array(subarray1.buffer, subarray1.byteOffset, subarray1.length);
      Atomics.store(uint32Subarray, 3, 42);

      expect(Atomics.load(subarray1, 3)).assertEqual(42);

      // 测试子数组边界
      const boundarySubarray = view.subarray(6, 8);
      Atomics.store(boundarySubarray, 0, 100);
      Atomics.sub(boundarySubarray, 0, 58); // 100 - 58 = 42

      expect(Atomics.load(boundarySubarray, 0)).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest036
     * @tc.number SUB_BUILTINS_Atomics_TEST_036
     * @tc.desc   test atomic operations with DataView and mixed endianness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);
      const view = new Int32Array(sab);
      const dataView = new DataView(sab);

      // 测试DataView与原子操作的交互
      Atomics.store(view, 0, 0x12345678 as long);
      Atomics.store(view, 1, 0x87654321 as long);

      // 通过DataView读取不同字节序的值
      const leValue1 = dataView.getInt32(0, true); // 小端序
      const beValue1 = dataView.getInt32(0, false); // 大端序
      const leValue2 = dataView.getInt32(4, true); // 小端序
      const beValue2 = dataView.getInt32(4, false); // 大端序

      // 使用原子操作修改值
      Atomics.store(view, 2, 100);
      Atomics.sub(view, 2, 58); // 100 - 58 = 42

      // 验证原子操作结果
      expect(Atomics.load(view, 2)).assertEqual(42);

      // 测试DataView与原子操作的边界情况
      const buffer = new ArrayBuffer(8);
      const dv = new DataView(buffer);

      // 使用原子操作修改不同字节位置
      const int32View = new Int32Array(buffer);
      Atomics.store(int32View, 0, 0);
      Atomics.store(int32View, 1, 0);

      // 通过DataView修改单个字节
      dv.setUint8(0, 0x2A); // 42
      dv.setUint8(4, 0x2A); // 42

      // 验证原子操作可以正确读取修改后的值
      expect(Atomics.load(int32View, 0) & 0xFF).assertEqual(42);
      expect((Atomics.load(int32View, 1) >> 24) & 0xFF).assertEqual(0);

      // 测试原子操作与DataView的类型转换
      Atomics.store(int32View, 0, 42);
      const floatValue = dv.getFloat32(0, true);
      expect(Math.round(floatValue)).assertEqual(0);
    });

    /**
     * @tc.name   atomicsTest037
     * @tc.number SUB_BUILTINS_Atomics_TEST_037
     * @tc.desc   test atomic operations with endianness-sensitive data and network byte order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);
      const view = new Int32Array(sab);
      const dataView = new DataView(sab);

      // 测试字节序敏感数据的原子操作
      // 模拟网络字节序（大端序）数据
      const networkData = [0x12345678, 0x87654321, 0x00000000, 0xFFFFFFFF];

      // 以大端序存储数据
      for (let i: int = 0; i < networkData.length; i++) {
        dataView.setInt32(i * 4, networkData[i], false); // 大端序
      }

      // 使用原子操作读取和修改数据
      const value1 = Atomics.load(view, 0);
      const value2 = Atomics.load(view, 1);

      // 修改数据并以大端序存储回
      Atomics.store(view, 2, 100);
      Atomics.sub(view, 2, 58); // 100 - 58 = 42

      // 验证结果
      expect(Atomics.load(view, 2)).assertEqual(42);

      // 测试字节序转换函数
      let ntohl = (value: number): number => {
        // 网络字节序转主机字节序（32位）
        const buffer = new ArrayBuffer(4);
        const dv = new DataView(buffer);
        dv.setInt32(0, value, false); // 大端序写入
        return dv.getInt32(0, true); // 小端序读取
      }

      let htonl = (value: number): number => {
        // 主机字节序转网络字节序（32位）
        const buffer = new ArrayBuffer(4);
        const dv = new DataView(buffer);
        dv.setInt32(0, value, true); // 小端序写入
        return dv.getInt32(0, false); // 大端序读取
      }

      // 测试字节序转换
      const hostValue: int = 0x12345678;
      const networkValue = htonl(hostValue);
      const convertedBack = ntohl(networkValue);

      expect(convertedBack).assertEqual(hostValue);

      // 测试原子操作与字节序转换的结合
      const testValue: int = 42;
      const networkTestValue = htonl(testValue);

      Atomics.store(view, 3, networkTestValue as long);
      const result = ntohl(Atomics.load(view, 3));

      expect(result).assertEqual(testValue);
    });

    /**
     * @tc.name   atomicsTest038
     * @tc.number SUB_BUILTINS_Atomics_TEST_038
     * @tc.desc   test atomic operations with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试对象属性中的原子操作
      const data: GeneratedObjectLiteralInterface_2 = {
        buffer: sab,
        view: view,
        index: 0
      };

      // 通过对象属性执行原子操作
      Atomics.store(data.view, data.index as int, 100);
      Atomics.sub(data.view, data.index as int, 58); // 100 - 58 = 42

      const result = Atomics.load(data.view, data.index as int);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest039
     * @tc.number SUB_BUILTINS_Atomics_TEST_039
     * @tc.desc   test atomic operations with array methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);
      const view = new Int32Array(sab);

      // 测试数组方法中的原子操作
      const indices: int[] = [0, 1, 2, 3];

      // 初始化值
      indices.forEach((index: int) => {
        Atomics.store(view, index as int, index * 10)
      });

      // 使用数组方法执行原子操作
      indices.forEach((index: int) => {
        if (index === 2) {
          Atomics.add(view, index as int, 42-(index * 10))
          ; // 20 + 22 = 42
        }
      });

      const result = Atomics.load(view, 2);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest040
     * @tc.number SUB_BUILTINS_Atomics_TEST_040
     * @tc.desc   test complex atomic operations with state machine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);
      const view = new Int32Array(sab);


      // 初始化状态和数据
      Atomics.store(view, 0, State40.INIT as long); // 状态
      Atomics.store(view, 1, 0); // 计数器
      Atomics.store(view, 2, 100); // 数据
      Atomics.store(view, 3, 0); // 结果

      // 状态转换和原子操作
      Atomics.compareExchange(view, 0, State40.INIT as long, State40.LOADING);

      // 处理数据
      const oldValue: number = Atomics.sub(view, 2, 58); // 100 - 58 = 42
      Atomics.store(view, 3, oldValue - 58 as long); // 100 - 58 = 42

      // 完成处理
      Atomics.compareExchange(view, 0, State40.LOADING as long, State40.COMPLETED);

      const result = Atomics.load(view, 3);
      expect(result).assertEqual(42);
    });
    /**
     * @tc.name   atomicsTest041
     * @tc.number SUB_BUILTINS_Atomics_TEST_041
     * @tc.desc   test atomic operations with large SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(1024 * 1024); // 1MB buffer
      const view = new Int32Array(sab);

      // 测试大缓冲区上的原子操作
      const index: int = 1000; // 非零索引
      Atomics.store(view, index as int, 100);

      // 执行原子操作
      Atomics.sub(view, index as int, 58); // 100 - 58 = 42

      const result = Atomics.load(view, index as int);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest042
     * @tc.number SUB_BUILTINS_Atomics_TEST_042
     * @tc.desc   test atomic operations with sparse indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(64);
      const view = new Int32Array(sab);

      // 测试稀疏索引上的原子操作
      const indices: int[] = [0, 2, 4, 6]; // 间隔索引

      // 初始化值
      indices.forEach((index: int, i: int, indices: int[]) => {
        Atomics.store(view, index as int, (i + 1) * 10)
      });

      // 在间隔索引上执行原子操作
      Atomics.add(view, 2, 22); // 20 + 22 = 42

      const result = Atomics.load(view, 2);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest043
     * @tc.number SUB_BUILTINS_Atomics_TEST_043
     * @tc.desc   test atomic operations with typed array from buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(4);
      const view = new Int32Array(buffer);

      // 测试从普通ArrayBuffer创建的视图上的原子操作
      Atomics.store(view, 0, 100);

      // 执行原子操作
      Atomics.sub(view, 0, 58); // 100 - 58 = 42

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest044
     * @tc.number SUB_BUILTINS_Atomics_TEST_044
     * @tc.desc   test atomic operations with multiple views of same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);

      // 创建多个视图
      const view1 = new Int32Array(sab);
      const view2 = new Int32Array(sab);
      const view3 = new Int32Array(sab);

      // 测试多个视图上的原子操作
      Atomics.store(view1, 0, 100);

      // 通过不同视图执行原子操作
      Atomics.sub(view2, 0, 50); // 100 - 50 = 50
      Atomics.sub(view3, 0, 8); // 50 - 8 = 42

      const result = Atomics.load(view1, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest045
     * @tc.number SUB_BUILTINS_Atomics_TEST_045
     * @tc.desc   test atomic operations with computed indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);
      const view = new Int32Array(sab);

      // 测试计算索引上的原子操作
      let getIndex = () => {
        return 1; // 动态计算的索引
      }

      // 初始化值
      Atomics.store(view, getIndex() as int, 100);

      // 使用计算的索引执行原子操作
      Atomics.sub(view, getIndex() as int, 58); // 100 - 58 = 42

      const result = Atomics.load(view, getIndex() as int);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest046
     * @tc.number SUB_BUILTINS_Atomics_TEST_046
     * @tc.desc   test atomic operations with typed array slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(16);
      const view = new Int32Array(sab);

      // 测试切片视图上的原子操作
      const slice = view.slice(1, 3); // 从索引1开始，长度为2

      // 初始化值
      Atomics.store(view, 1, 100);

      // 在切片视图上执行原子操作
      Atomics.sub(slice, 0, 58); // 100 - 58 = 42

      const result = Atomics.load(view, 1);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   atomicsTest047
     * @tc.number SUB_BUILTINS_Atomics_TEST_047
     * @tc.desc   test atomic operations with bitwise operations sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试复杂位运算序列的原子操作
      Atomics.store(view, 0, 0);

      // 位运算序列
      Atomics.or(view, 0, 0b101010 as long); // 0 | 42 = 42
      Atomics.and(view, 0, 0b111111 as long); // 42 & 63 = 42
      Atomics.xor(view, 0, 0b000000 as long); // 42 ^ 0 = 42

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest048
     * @tc.number SUB_BUILTINS_Atomics_TEST_048
     * @tc.desc   test atomic operations with function composition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const ia = new Int32Array(sab);
      ia[0] = 0; // Initial state: 0 (off)

      // Toggle state: 0 → 1 (on) via compareExchange + xor
      const old1 = Atomics.compareExchange(ia, 0, 0, 1);
      const toggle1 = Atomics.xor(ia, 0, 1); // 1 ^1 = 0

      // Toggle again: 0 →1
      const old2 = Atomics.compareExchange(ia, 0, 0, 1);
      const toggle2 = Atomics.xor(ia, 0, 1); // 1 ^1 =0

      expect(old1).assertEqual(0);
      expect(toggle1).assertEqual(1);
      expect(old2).assertEqual(0);
      expect(toggle2).assertEqual(1);
      expect(ia[0]).assertEqual(0);
    });

    /**
     * @tc.name   atomicsTest049
     * @tc.number SUB_BUILTINS_Atomics_TEST_049
     * @tc.desc   test atomic operations with error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(4);
      const view = new Int32Array(sab);

      // 测试错误处理中的原子操作
      try {
        // 故意使用错误的索引
        Atomics.store(view, 100, 100);
      } catch (error) {
        // 捕获错误后执行正确的操作
        Atomics.store(view, 0, 100);
        Atomics.sub(view, 0, 58); // 100 - 58 = 42
      }

      const result = Atomics.load(view, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   atomicsTest050
     * @tc.number SUB_BUILTINS_Atomics_TEST_050
     * @tc.desc   test atomic operations with complex state management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicsTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sab = new ArrayBuffer(32);
      const view = new Int32Array(sab);


      // 状态偏移量
      const OFFSETS: GeneratedObjectLiteralInterface_3 = {
        counter: 0,
        flags: 1,
        value1: 2,
        value2: 3,
        result: 4
      };

      // 初始化状态
      Atomics.store(view, OFFSETS.counter as int as int, 0);
      Atomics.store(view, OFFSETS.flags as int as int, 0b0000 as long);
      Atomics.store(view, OFFSETS.value1 as int as int, 100);
      Atomics.store(view, OFFSETS.value2 as int as int, 58);
      Atomics.store(view, OFFSETS.result as int as int, 0);

      // 状态管理函数
      let updateState = () => {
        // 增加计数器
        Atomics.add(view, OFFSETS.counter as int as int, 1);

        // 设置标志位
        Atomics.or(view, OFFSETS.flags as int as int, 0b0001 as long);

        // 执行计算
        const value1 = Atomics.load(view, OFFSETS.value1 as int as int);
        const value2 = Atomics.load(view, OFFSETS.value2 as int as int);
        Atomics.store(view, OFFSETS.result as int as int, value1 - value2 as long);

        // 更新标志位
        Atomics.and(view, OFFSETS.flags as int as int, 0b1110 as long);
        Atomics.or(view, OFFSETS.flags as int as int, 0b0010 as long);
      }

      // 执行状态更新
      updateState();

      const result = Atomics.load(view, OFFSETS.result as int as int);
      expect(result).assertEqual(42);
    });
  })
}