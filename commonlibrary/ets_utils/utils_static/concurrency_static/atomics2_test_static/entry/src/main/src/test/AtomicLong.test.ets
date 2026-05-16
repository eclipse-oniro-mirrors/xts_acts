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

export default function atomicLongTest() {
  describe('atomicLongTest', () => {
    afterEach(async () => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicLongTest001
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0001
     * @tc.desc   Verify AtomicLong.load() P0 cases with 0, 42, -1 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(new AtomicLong(0).load()).assertEqual(0);
      expect(new AtomicLong(42).load()).assertEqual(42);
      expect(new AtomicLong(-1).load()).assertEqual(-1);
      expect(new AtomicLong(1).load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicLongTest002
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0002
     * @tc.desc   Verify AtomicLong.load() P1 cases with -100 and safe boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      expect(new AtomicLong(-100).load()).assertEqual(-100);
      expect(new AtomicLong(safeMax as long).load()).assertEqual(safeMax as long);
      expect(new AtomicLong(safeMin as long).load()).assertEqual(safeMin as long);
    });

    /**
     * @tc.name   atomicLongTest003
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0003
     * @tc.desc   Verify AtomicLong.load() P2 out-of-safe-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const overSafeMax = 9007199254740992;
      const underSafeMin = -9007199254740993;
      expect(new AtomicLong(overSafeMax as long).load()).assertEqual(overSafeMax as long);
      expect(new AtomicLong(underSafeMin as long).load()).assertEqual(underSafeMin as long);
    });

    /**
     * @tc.name   atomicLongTest004
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0004
     * @tc.desc   Verify AtomicLong.store() P0 cases with 0, 100, -1 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicLong(0);
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
     * @tc.name   atomicLongTest005
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0005
     * @tc.desc   Verify AtomicLong.store() P1 cases with -50 and safe boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicLong(0);
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      atom.store(-50);
      expect(atom.load()).assertEqual(-50);
      atom.store(safeMax as long);
      expect(atom.load()).assertEqual(safeMax as long);
      atom.store(safeMin as long);
      expect(atom.load()).assertEqual(safeMin as long);
    });

    /**
     * @tc.name   atomicLongTest006
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0006
     * @tc.desc   Verify AtomicLong.store() P2 out-of-safe-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atom = new AtomicLong(0);
      const overSafeMax = 9007199254740992;
      const underSafeMin = -9007199254740993;
      atom.store(overSafeMax as long);
      expect(atom.load()).assertEqual(overSafeMax as long);
      atom.store(underSafeMin as long);
      expect(atom.load()).assertEqual(underSafeMin as long);
    });

    /**
     * @tc.name   atomicLongTest007
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0007
     * @tc.desc   Verify AtomicLong.exchange() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicLong(42);
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
     * @tc.name   atomicLongTest008
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0008
     * @tc.desc   Verify AtomicLong.exchange() P1 safe-boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicLong(9007199254740991 as long);
      const safeMin = -9007199254740992;
      expect(atom.exchange(0)).assertEqual(9007199254740991 as long);
      expect(atom.load()).assertEqual(0);

      atom.store(safeMin as long);
      expect(atom.exchange(100)).assertEqual(safeMin as long);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicLongTest009
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0009
     * @tc.desc   Verify AtomicLong.exchange() P2 out-of-safe-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const overSafeMax = 9007199254740992;
      const underSafeMin = -9007199254740993;
      const atom = new AtomicLong(safeMax as long);

      expect(atom.exchange(overSafeMax as long)).assertEqual(safeMax as long);
      expect(atom.load()).assertEqual(overSafeMax as long);

      atom.store(safeMin as long);
      expect(atom.exchange(underSafeMin as long)).assertEqual(safeMin as long);
      expect(atom.load()).assertEqual(underSafeMin as long);
    });

    /**
     * @tc.name   atomicLongTest010
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0010
     * @tc.desc   Verify AtomicLong.compareAndSwap() P0 success and mismatch cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicLong(42);
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
     * @tc.name   atomicLongTest011
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0011
     * @tc.desc   Verify AtomicLong.compareAndSwap() P1 safe-boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const atom = new AtomicLong(safeMax as long);

      expect(atom.compareAndSwap(safeMax as long, 0)).assertEqual(safeMax as long);
      expect(atom.load()).assertEqual(0);

      atom.store(safeMin as long);
      expect(atom.compareAndSwap(safeMin as long, 100)).assertEqual(safeMin as long);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicLongTest012
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0012
     * @tc.desc   Verify AtomicLong.compareAndSwap() P2 out-of-safe-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const overSafeMax = 9007199254740992;
      const underSafeMin = -9007199254740993;
      const atom = new AtomicLong(safeMax as long);

      expect(atom.compareAndSwap(safeMax as long, overSafeMax as long)).assertEqual(safeMax as long);
      expect(atom.load()).assertEqual(overSafeMax as long);

      atom.store(safeMin as long);
      expect(atom.compareAndSwap(safeMin as long, underSafeMin as long)).assertEqual(safeMin as long);
      expect(atom.load()).assertEqual(underSafeMin as long);
    });

    /**
     * @tc.name   atomicLongTest013
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0013
     * @tc.desc   Verify AtomicLong.fetchAdd() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicLong(42);
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
     * @tc.name   atomicLongTest014
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0014
     * @tc.desc   Verify AtomicLong.fetchAdd() P1 near-boundary and zero-add cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const nearSafeMax = 9007199254740990;
      const nearSafeMin = -9007199254740991;
      const atom = new AtomicLong(nearSafeMax as long);

      expect(atom.fetchAdd(1)).assertEqual(nearSafeMax as long);
      expect(atom.load()).assertEqual(safeMax as long);

      atom.store(nearSafeMin as long);
      expect(atom.fetchAdd(-1)).assertEqual(nearSafeMin as long);
      expect(atom.load()).assertEqual(safeMin as long);

      atom.store(123456789 as long);
      expect(atom.fetchAdd(0)).assertEqual(123456789 as long);
      expect(atom.load()).assertEqual(123456789 as long);
    });

    /**
     * @tc.name   atomicLongTest015
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0015
     * @tc.desc   Verify AtomicLong.fetchAdd() P2 overflow input cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const overSafeMax = 9007199254740992;
      const underSafeMin = -9007199254740993;
      const atom = new AtomicLong(safeMax as long);

      expect(atom.fetchAdd(1)).assertEqual(safeMax as long);
      expect(atom.load() === safeMax as long).assertFalse();

      atom.store(safeMin as long);
      expect(atom.fetchAdd(-1)).assertEqual(safeMin as long);
      expect(atom.load() === safeMin as long).assertFalse();

      atom.store(safeMax as long);
      expect(atom.fetchAdd(overSafeMax as long)).assertEqual(safeMax as long);
      expect(atom.load() === safeMax as long).assertFalse();

      atom.store(safeMin as long);
      expect(atom.fetchAdd(underSafeMin as long)).assertEqual(safeMin as long);
      expect(atom.load() === safeMin as long).assertFalse();
    });

    /**
     * @tc.name   atomicLongTest016
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0016
     * @tc.desc   Verify AtomicLong.fetchSub() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicLong(42);
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
     * @tc.name   atomicLongTest017
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0017
     * @tc.desc   Verify AtomicLong.fetchSub() P1 safe-boundary and zero-sub cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const atom = new AtomicLong(safeMax as long);

      expect(atom.fetchSub(1)).assertEqual(safeMax as long);
      expect(atom.load()).assertEqual((safeMax - 1) as long);

      atom.store(safeMin as long);
      expect(atom.fetchSub(-1)).assertEqual(safeMin as long);
      expect(atom.load() === safeMin as long).assertFalse();

      atom.store(987654321 as long);
      expect(atom.fetchSub(0)).assertEqual(987654321 as long);
      expect(atom.load()).assertEqual(987654321 as long);
    });

    /**
     * @tc.name   atomicLongTest018
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0018
     * @tc.desc   Verify AtomicLong.fetchSub() P2 overflow input cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicLongTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const overSafeMax = 9007199254740992;
      const underSafeMin = -9007199254740993;
      const atom = new AtomicLong(safeMax as long);

      expect(atom.fetchSub(overSafeMax as long)).assertEqual(safeMax as long);
      expect(atom.load() === safeMax as long).assertFalse();

      atom.store(safeMin as long);
      expect(atom.fetchSub(underSafeMin as long)).assertEqual(safeMin as long);
      expect(atom.load() === safeMin as long).assertFalse();
    });

    /**
     * @tc.name   atomicLongTest019
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0019
     * @tc.desc   Verify AtomicLong.fetchAnd() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicLong(300);
      expect(atom.fetchAnd(255)).assertEqual(300);
      expect(atom.load()).assertEqual(44);

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
     * @tc.name   atomicLongTest020
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0020
     * @tc.desc   Verify AtomicLong.fetchAnd() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const atom = new AtomicLong(0);

      expect(atom.fetchAnd(999999 as long)).assertEqual(0);
      expect(atom.load()).assertEqual(0);

      atom.store(safeMax as long);
      expect(atom.fetchAnd(safeMax as long)).assertEqual(safeMax as long);
      expect(atom.load()).assertEqual(safeMax as long);

      atom.store(safeMin as long);
      expect(atom.fetchAnd(safeMin as long)).assertEqual(safeMin as long);
      expect(atom.load()).assertEqual(safeMin as long);
    });

    /**
     * @tc.name   atomicLongTest021
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0021
     * @tc.desc   Verify AtomicLong.fetchOr() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicLong(44);
      expect(atom.fetchOr(1)).assertEqual(44);
      expect(atom.load()).assertEqual(45);

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
      expect(atom.fetchOr(123456 as long)).assertEqual(0);
      expect(atom.load()).assertEqual(123456 as long);
    });

    /**
     * @tc.name   atomicLongTest022
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0022
     * @tc.desc   Verify AtomicLong.fetchOr() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const atom = new AtomicLong(safeMax as long);

      expect(atom.fetchOr(0)).assertEqual(safeMax as long);
      expect(atom.load()).assertEqual(safeMax as long);

      atom.store(safeMin as long);
      expect(atom.fetchOr(0)).assertEqual(safeMin as long);
      expect(atom.load()).assertEqual(safeMin as long);
    });

    /**
     * @tc.name   atomicLongTest023
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0023
     * @tc.desc   Verify AtomicLong.fetchXor() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicLong(45);
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
    });

    /**
     * @tc.name   atomicLongTest024
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0024
     * @tc.desc   Verify AtomicLong.fetchXor() P1 repeat and boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicLongTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const safeMax = 9007199254740991;
      const safeMin = -9007199254740992;
      const atom = new AtomicLong(777 as long);

      const oldValue = atom.fetchXor(99 as long);
      expect(oldValue).assertEqual(777 as long);
      const changed = atom.load();
      expect(changed).assertEqual((777 ^ 99).toLong());
      atom.fetchXor(99 as long);
      expect(atom.load()).assertEqual(777 as long);

      atom.store(safeMax as long);
      expect(atom.fetchXor(safeMax as long)).assertEqual(safeMax as long);
      expect(atom.load()).assertEqual(0);

      atom.store(safeMin as long);
      expect(atom.fetchXor(safeMin as long)).assertEqual(safeMin as long);
      expect(atom.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicLongTest025
     * @tc.number SUB_BUILTINS_ATOMIC_LONG_TEST_0025
     * @tc.desc   Verify AtomicLong.isLockFree() return type and value domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicLongTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = AtomicLong.isLockFree();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
    });
  });
}
