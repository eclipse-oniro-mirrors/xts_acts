'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium';
import sleep from './Util.test';

export default function atomicIntTest() {
  describe('atomicIntTest', () => {
    afterEach(async () => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicIntTest001
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0001
     * @tc.desc   Verify AtomicInt.load() P0 cases with 0, 42, -1 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(new AtomicInt(0).load()).assertEqual(0);
      expect(new AtomicInt(42).load()).assertEqual(42);
      expect(new AtomicInt(-1).load()).assertEqual(-1);
      expect(new AtomicInt(1).load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntTest002
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0002
     * @tc.desc   Verify AtomicInt.load() P1 cases with -100 and int32 boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(new AtomicInt(-100).load()).assertEqual(-100);
      expect(new AtomicInt(2147483647).load()).assertEqual(2147483647);
      expect(new AtomicInt(-2147483648).load()).assertEqual(-2147483648);
    });

    /**
     * @tc.name   atomicIntTest003
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0003
     * @tc.desc   Verify AtomicInt.load() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const overMax = 2147483648;
      const underMin = -2147483649;
      expect(new AtomicInt(overMax.toInt()).load()).assertEqual(-2147483648);
      expect(new AtomicInt(underMin.toInt()).load()).assertEqual(2147483647);
    });

    /**
     * @tc.name   atomicIntTest004
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0004
     * @tc.desc   Verify AtomicInt.store() P0 cases with 0, 100, -1 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicInt(0);
      atom.store(0);
      expect(atom.load()).assertEqual(0);
      atom.store(100);
      expect(atom.load()).assertEqual(100);
      atom.store(-1);
      expect(atom.load()).assertEqual(-1);
      atom.store(1);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntTest005
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0005
     * @tc.desc   Verify AtomicInt.store() P1 cases with -50 and int32 boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicInt(0);
      atom.store(-50);
      expect(atom.load()).assertEqual(-50);
      atom.store(2147483647);
      expect(atom.load()).assertEqual(2147483647);
      atom.store(-2147483648);
      expect(atom.load()).assertEqual(-2147483648);
    });

    /**
     * @tc.name   atomicIntTest006
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0006
     * @tc.desc   Verify AtomicInt.store() P2 overflow and continuous update cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atom = new AtomicInt(0);
      const overMax = 2147483648;
      const underMin = -2147483649;

      atom.store(overMax.toInt());
      expect(atom.load()).assertEqual(-2147483648);
      atom.store(underMin.toInt());
      expect(atom.load()).assertEqual(2147483647);

      atom.store(11);
      expect(atom.load()).assertEqual(11);
      atom.store(-22);
      expect(atom.load()).assertEqual(-22);
      atom.store(33);
      expect(atom.load()).assertEqual(33);
    });

    /**
     * @tc.name   atomicIntTest007
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0007
     * @tc.desc   Verify AtomicInt.exchange() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicInt(42);
      expect(atom.exchange(100)).assertEqual(42);
      expect(atom.load()).assertEqual(100);

      atom.store(0);
      expect(atom.exchange(-50)).assertEqual(0);
      expect(atom.load()).assertEqual(-50);

      atom.store(-1);
      expect(atom.exchange(1)).assertEqual(-1);
      expect(atom.load()).assertEqual(1);

      atom.store(1);
      expect(atom.exchange(-1)).assertEqual(1);
      expect(atom.load()).assertEqual(-1);
    });

    /**
     * @tc.name   atomicIntTest008
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0008
     * @tc.desc   Verify AtomicInt.exchange() P1 int32 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicInt(2147483647);
      expect(atom.exchange(0)).assertEqual(2147483647);
      expect(atom.load()).assertEqual(0);

      atom.store(-2147483648);
      expect(atom.exchange(100)).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicIntTest009
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0009
     * @tc.desc   Verify AtomicInt.exchange() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atom = new AtomicInt(2147483647);
      const overMax = 2147483648;
      expect(atom.exchange(overMax.toInt())).assertEqual(2147483647);
      expect(atom.load()).assertEqual(-2147483648);

      atom.store(-2147483648);
      const underMin = -2147483649;
      expect(atom.exchange(underMin.toInt())).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(2147483647);
    });

    /**
     * @tc.name   atomicIntTest010
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0010
     * @tc.desc   Verify AtomicInt.compareAndSwap() P0 success and mismatch cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicInt(42);
      expect(atom.compareAndSwap(42, 100)).assertEqual(42);
      expect(atom.load()).assertEqual(100);

      atom.store(42);
      expect(atom.compareAndSwap(43, 100)).assertEqual(42);
      expect(atom.load()).assertEqual(42);

      atom.store(0);
      expect(atom.compareAndSwap(0, -1)).assertEqual(0);
      expect(atom.load()).assertEqual(-1);

      atom.store(-1);
      expect(atom.compareAndSwap(-1, 1)).assertEqual(-1);
      expect(atom.load()).assertEqual(1);

      atom.store(1);
      expect(atom.compareAndSwap(1, 0)).assertEqual(1);
      expect(atom.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicIntTest011
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0011
     * @tc.desc   Verify AtomicInt.compareAndSwap() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicInt(-50);
      expect(atom.compareAndSwap(-50, 50)).assertEqual(-50);
      expect(atom.load()).assertEqual(50);

      atom.store(2147483647);
      expect(atom.compareAndSwap(2147483647, 0)).assertEqual(2147483647);
      expect(atom.load()).assertEqual(0);

      atom.store(-2147483648);
      expect(atom.compareAndSwap(-2147483648, 100)).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicIntTest012
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0012
     * @tc.desc   Verify AtomicInt.compareAndSwap() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atom = new AtomicInt(2147483647);
      const overMax = 2147483648;
      expect(atom.compareAndSwap(2147483647, overMax.toInt())).assertEqual(2147483647);
      expect(atom.load()).assertEqual(-2147483648);

      atom.store(-2147483648);
      const underMin = -2147483649;
      expect(atom.compareAndSwap(-2147483648, underMin.toInt())).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(2147483647);
    });

    /**
     * @tc.name   atomicIntTest013
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0013
     * @tc.desc   Verify AtomicInt.fetchAdd() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicInt(42);
      expect(atom.fetchAdd(5)).assertEqual(42);
      expect(atom.load()).assertEqual(47);

      atom.store(0);
      expect(atom.fetchAdd(100)).assertEqual(0);
      expect(atom.load()).assertEqual(100);

      atom.store(-1);
      expect(atom.fetchAdd(1)).assertEqual(-1);
      expect(atom.load()).assertEqual(0);

      atom.store(1);
      expect(atom.fetchAdd(-1)).assertEqual(1);
      expect(atom.load()).assertEqual(0);

      atom.store(0);
      expect(atom.fetchAdd(1)).assertEqual(0);
      expect(atom.load()).assertEqual(1);

      atom.store(0);
      expect(atom.fetchAdd(-1)).assertEqual(0);
      expect(atom.load()).assertEqual(-1);

      atom.store(100);
      expect(atom.fetchAdd(-50)).assertEqual(100);
      expect(atom.load()).assertEqual(50);
    });

    /**
     * @tc.name   atomicIntTest014
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0014
     * @tc.desc   Verify AtomicInt.fetchAdd() P1 boundary and zero-add cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicInt(-10);
      expect(atom.fetchAdd(-5)).assertEqual(-10);
      expect(atom.load()).assertEqual(-15);

      atom.store(2147483640);
      expect(atom.fetchAdd(7)).assertEqual(2147483640);
      expect(atom.load()).assertEqual(2147483647);

      atom.store(2147483647);
      expect(atom.fetchAdd(1)).assertEqual(2147483647);
      expect(atom.load()).assertEqual(-2147483648);

      atom.store(-2147483648);
      expect(atom.fetchAdd(-1)).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(2147483647);

      atom.store(123);
      expect(atom.fetchAdd(0)).assertEqual(123);
      expect(atom.load()).assertEqual(123);
    });

    /**
     * @tc.name   atomicIntTest015
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0015
     * @tc.desc   Verify AtomicInt.fetchAdd() P2 overflow input cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atom = new AtomicInt(2147483647);
      const overMax = 2147483648;
      expect(atom.fetchAdd(overMax.toInt())).assertEqual(2147483647);
      expect(atom.load()).assertEqual(-1);

      atom.store(-2147483648);
      const underMin = -2147483649;
      expect(atom.fetchAdd(underMin.toInt())).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(-1);
    });

    /**
     * @tc.name   atomicIntTest016
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0016
     * @tc.desc   Verify AtomicInt.fetchSub() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicInt(42);
      expect(atom.fetchSub(5)).assertEqual(42);
      expect(atom.load()).assertEqual(37);

      atom.store(100);
      expect(atom.fetchSub(100)).assertEqual(100);
      expect(atom.load()).assertEqual(0);

      atom.store(1);
      expect(atom.fetchSub(1)).assertEqual(1);
      expect(atom.load()).assertEqual(0);

      atom.store(-1);
      expect(atom.fetchSub(-1)).assertEqual(-1);
      expect(atom.load()).assertEqual(0);

      atom.store(0);
      expect(atom.fetchSub(1)).assertEqual(0);
      expect(atom.load()).assertEqual(-1);

      atom.store(0);
      expect(atom.fetchSub(-1)).assertEqual(0);
      expect(atom.load()).assertEqual(1);

      atom.store(50);
      expect(atom.fetchSub(-10)).assertEqual(50);
      expect(atom.load()).assertEqual(60);
    });

    /**
     * @tc.name   atomicIntTest017
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0017
     * @tc.desc   Verify AtomicInt.fetchSub() P1 boundary and zero-sub cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicInt(-10);
      expect(atom.fetchSub(-5)).assertEqual(-10);
      expect(atom.load()).assertEqual(-5);

      atom.store(5);
      expect(atom.fetchSub(10)).assertEqual(5);
      expect(atom.load()).assertEqual(-5);

      atom.store(2147483647);
      expect(atom.fetchSub(1)).assertEqual(2147483647);
      expect(atom.load()).assertEqual(2147483646);

      atom.store(-2147483648);
      expect(atom.fetchSub(-1)).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(-2147483647);

      atom.store(321);
      expect(atom.fetchSub(0)).assertEqual(321);
      expect(atom.load()).assertEqual(321);
    });

    /**
     * @tc.name   atomicIntTest018
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0018
     * @tc.desc   Verify AtomicInt.fetchSub() P2 overflow input cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicIntTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atom = new AtomicInt(2147483647);
      const overMax = 2147483648;
      expect(atom.fetchSub(overMax.toInt())).assertEqual(2147483647);
      expect(atom.load()).assertEqual(-1);

      atom.store(-2147483648);
      const underMin = -2147483649;
      expect(atom.fetchSub(underMin.toInt())).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicIntTest019
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0019
     * @tc.desc   Verify AtomicInt.fetchAnd() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicInt(300);
      expect(atom.fetchAnd(255)).assertEqual(300);
      expect(atom.load()).assertEqual(44);

      atom.store(15);
      expect(atom.fetchAnd(8)).assertEqual(15);
      expect(atom.load()).assertEqual(8);

      atom.store(-1);
      expect(atom.fetchAnd(123)).assertEqual(-1);
      expect(atom.load()).assertEqual(123);

      atom.store(0);
      expect(atom.fetchAnd(0)).assertEqual(0);
      expect(atom.load()).assertEqual(0);

      atom.store(1);
      expect(atom.fetchAnd(1)).assertEqual(1);
      expect(atom.load()).assertEqual(1);

      atom.store(-1);
      expect(atom.fetchAnd(-1)).assertEqual(-1);
      expect(atom.load()).assertEqual(-1);
    });

    /**
     * @tc.name   atomicIntTest020
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0020
     * @tc.desc   Verify AtomicInt.fetchAnd() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicInt(0);
      expect(atom.fetchAnd(999)).assertEqual(0);
      expect(atom.load()).assertEqual(0);

      atom.store(255);
      expect(atom.fetchAnd(0)).assertEqual(255);
      expect(atom.load()).assertEqual(0);

      atom.store(2147483647);
      expect(atom.fetchAnd(2147483647)).assertEqual(2147483647);
      expect(atom.load()).assertEqual(2147483647);

      atom.store(-2147483648);
      expect(atom.fetchAnd(-2147483648)).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(-2147483648);
    });

    /**
     * @tc.name   atomicIntTest021
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0021
     * @tc.desc   Verify AtomicInt.fetchOr() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicInt(44);
      expect(atom.fetchOr(1)).assertEqual(44);
      expect(atom.load()).assertEqual(45);

      atom.store(8);
      expect(atom.fetchOr(4)).assertEqual(8);
      expect(atom.load()).assertEqual(12);

      atom.store(0);
      expect(atom.fetchOr(1)).assertEqual(0);
      expect(atom.load()).assertEqual(1);

      atom.store(0);
      expect(atom.fetchOr(-1)).assertEqual(0);
      expect(atom.load()).assertEqual(-1);

      atom.store(-1);
      expect(atom.fetchOr(0)).assertEqual(-1);
      expect(atom.load()).assertEqual(-1);

      atom.store(1);
      expect(atom.fetchOr(0)).assertEqual(1);
      expect(atom.load()).assertEqual(1);

      atom.store(0);
      expect(atom.fetchOr(123456)).assertEqual(0);
      expect(atom.load()).assertEqual(123456);
    });

    /**
     * @tc.name   atomicIntTest022
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0022
     * @tc.desc   Verify AtomicInt.fetchOr() P1 boundary and chained cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicInt(255);
      expect(atom.fetchOr(7)).assertEqual(255);
      expect(atom.load()).assertEqual(255);

      atom.store(1);
      expect(atom.fetchOr(2)).assertEqual(1);
      expect(atom.load()).assertEqual(3);
      expect(atom.fetchOr(4)).assertEqual(3);
      expect(atom.load()).assertEqual(7);

      atom.store(2147483647);
      expect(atom.fetchOr(0)).assertEqual(2147483647);
      expect(atom.load()).assertEqual(2147483647);

      atom.store(-2147483648);
      expect(atom.fetchOr(0)).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(-2147483648);
    });

    /**
     * @tc.name   atomicIntTest023
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0023
     * @tc.desc   Verify AtomicInt.fetchXor() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicInt(45);
      expect(atom.fetchXor(16)).assertEqual(45);
      expect(atom.load()).assertEqual(61);

      atom.store(15);
      expect(atom.fetchXor(15)).assertEqual(15);
      expect(atom.load()).assertEqual(0);

      atom.store(0);
      expect(atom.fetchXor(1)).assertEqual(0);
      expect(atom.load()).assertEqual(1);

      atom.store(0);
      expect(atom.fetchXor(-1)).assertEqual(0);
      expect(atom.load()).assertEqual(-1);

      atom.store(-1);
      expect(atom.fetchXor(-1)).assertEqual(-1);
      expect(atom.load()).assertEqual(0);

      atom.store(1);
      expect(atom.fetchXor(1)).assertEqual(1);
      expect(atom.load()).assertEqual(0);

      atom.store(0);
      expect(atom.fetchXor(123)).assertEqual(0);
      expect(atom.load()).assertEqual(123);
    });

    /**
     * @tc.name   atomicIntTest024
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0024
     * @tc.desc   Verify AtomicInt.fetchXor() P1 boundary and double-xor cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicIntTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicInt(255);
      expect(atom.fetchXor(255)).assertEqual(255);
      expect(atom.load()).assertEqual(0);

      atom.store(777);
      const oldValue = atom.fetchXor(99);
      expect(oldValue).assertEqual(777);
      const changed = atom.load();
      expect(changed).assertEqual(777 ^ 99);
      atom.fetchXor(99);
      expect(atom.load()).assertEqual(777);

      atom.store(2147483647);
      expect(atom.fetchXor(2147483647)).assertEqual(2147483647);
      expect(atom.load()).assertEqual(0);

      atom.store(-2147483648);
      expect(atom.fetchXor(-2147483648)).assertEqual(-2147483648);
      expect(atom.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicIntTest025
     * @tc.number SUB_BUILTINS_ATOMIC_INT_TEST_0025
     * @tc.desc   Verify AtomicInt.isLockFree() return type and value domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicIntTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = AtomicInt.isLockFree();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
    });
  });
}
