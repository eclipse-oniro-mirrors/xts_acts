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
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import sleep from './Util.test';

const SHORT_MAX_INT: int = 32767;
const SHORT_MIN_INT: int = -32768;
const OVER_SHORT_MAX: int = 32768;
const UNDER_SHORT_MIN: int = -32769;

const SHORT_MAX: short = 32767;
const SHORT_MIN: short = -32768;
const OVER_SHORT_MAX_VALUE: short = OVER_SHORT_MAX.toShort();
const UNDER_SHORT_MIN_VALUE: short = UNDER_SHORT_MIN.toShort();

function toShortValue(value: int): short {
  return value.toShort();
}

export default function atomicShortTest(): void {
  describe('atomicShortTest', (): void => {
    afterEach(async (): Promise<void> => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicShortTest001
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0001
     * @tc.desc   Verify AtomicShort.load() P0 cases with 0, 42, -1 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      expect(new AtomicShort(0).load()).assertEqual(0);
      expect(new AtomicShort(42).load()).assertEqual(42);
      expect(new AtomicShort(-1).load()).assertEqual(-1);
      expect(new AtomicShort(1).load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicShortTest002
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0002
     * @tc.desc   Verify AtomicShort.load() P1 cases with -100 and int16 boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      expect(new AtomicShort(-100).load()).assertEqual(-100);
      expect(new AtomicShort(SHORT_MAX).load()).assertEqual(SHORT_MAX);
      expect(new AtomicShort(SHORT_MIN).load()).assertEqual(SHORT_MIN);
    });

    /**
     * @tc.name   atomicShortTest003
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0003
     * @tc.desc   Verify AtomicShort.load() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      expect(new AtomicShort(OVER_SHORT_MAX_VALUE).load()).assertEqual(toShortValue(OVER_SHORT_MAX));
      expect(new AtomicShort(UNDER_SHORT_MIN_VALUE).load()).assertEqual(toShortValue(UNDER_SHORT_MIN));
    });

    /**
     * @tc.name   atomicShortTest004
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0004
     * @tc.desc   Verify AtomicShort.store() P0 cases with 0, 100, -1 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicShort(0);
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
     * @tc.name   atomicShortTest005
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0005
     * @tc.desc   Verify AtomicShort.store() P1 cases with -50 and int16 boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicShort(0);
      atom.store(-50);
      expect(atom.load()).assertEqual(-50);
      atom.store(SHORT_MAX);
      expect(atom.load()).assertEqual(SHORT_MAX);
      atom.store(SHORT_MIN);
      expect(atom.load()).assertEqual(SHORT_MIN);
    });

    /**
     * @tc.name   atomicShortTest006
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0006
     * @tc.desc   Verify AtomicShort.store() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(0);
      atom.store(OVER_SHORT_MAX_VALUE);
      expect(atom.load()).assertEqual(toShortValue(OVER_SHORT_MAX));
      atom.store(UNDER_SHORT_MIN_VALUE);
      expect(atom.load()).assertEqual(toShortValue(UNDER_SHORT_MIN));
    });

    /**
     * @tc.name   atomicShortTest007
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0007
     * @tc.desc   Verify AtomicShort.exchange() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicShort(42);
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
     * @tc.name   atomicShortTest008
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0008
     * @tc.desc   Verify AtomicShort.exchange() P1 int16 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicShort(SHORT_MAX);
      expect(atom.exchange(0)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(0);

      atom.store(SHORT_MIN);
      expect(atom.exchange(100)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortTest009
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0009
     * @tc.desc   Verify AtomicShort.exchange() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(SHORT_MAX);
      expect(atom.exchange(OVER_SHORT_MAX_VALUE)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(toShortValue(OVER_SHORT_MAX));

      atom.store(SHORT_MIN);
      expect(atom.exchange(UNDER_SHORT_MIN_VALUE)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(toShortValue(UNDER_SHORT_MIN));
    });

    /**
     * @tc.name   atomicShortTest010
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0010
     * @tc.desc   Verify AtomicShort.compareAndSwap() P0 success and mismatch cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicShort(42);
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
     * @tc.name   atomicShortTest011
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0011
     * @tc.desc   Verify AtomicShort.compareAndSwap() P1 int16 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicShort(SHORT_MAX);
      expect(atom.compareAndSwap(SHORT_MAX, 0)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(0);

      atom.store(SHORT_MIN);
      expect(atom.compareAndSwap(SHORT_MIN, 100)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortTest012
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0012
     * @tc.desc   Verify AtomicShort.compareAndSwap() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(SHORT_MAX);
      expect(atom.compareAndSwap(SHORT_MAX, OVER_SHORT_MAX_VALUE)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(toShortValue(OVER_SHORT_MAX));

      atom.store(SHORT_MIN);
      expect(atom.compareAndSwap(SHORT_MIN, UNDER_SHORT_MIN_VALUE)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(toShortValue(UNDER_SHORT_MIN));
    });

    /**
     * @tc.name   atomicShortTest013
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0013
     * @tc.desc   Verify AtomicShort.fetchAdd() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicShort(42);

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
    });

    /**
     * @tc.name   atomicShortTest014
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0014
     * @tc.desc   Verify AtomicShort.fetchAdd() P1 boundary and zero-add cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicShort(32766);
      expect(atom.fetchAdd(1)).assertEqual(32766);
      expect(atom.load()).assertEqual(SHORT_MAX);

      atom.store(SHORT_MAX);
      expect(atom.fetchAdd(1)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(toShortValue(SHORT_MAX_INT + 1));

      atom.store(SHORT_MIN);
      expect(atom.fetchAdd(-1)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(toShortValue(SHORT_MIN_INT - 1));

      atom.store(123);
      expect(atom.fetchAdd(0)).assertEqual(123);
      expect(atom.load()).assertEqual(123);
    });

    /**
     * @tc.name   atomicShortTest015
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0015
     * @tc.desc   Verify AtomicShort.fetchAdd() P2 overflow input cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(SHORT_MAX);
      expect(atom.fetchAdd(OVER_SHORT_MAX_VALUE)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(toShortValue(SHORT_MAX_INT + OVER_SHORT_MAX_VALUE));

      atom.store(SHORT_MIN);
      expect(atom.fetchAdd(UNDER_SHORT_MIN_VALUE)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(toShortValue(SHORT_MIN_INT + UNDER_SHORT_MIN_VALUE));
    });

    /**
     * @tc.name   atomicShortTest016
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0016
     * @tc.desc   Verify AtomicShort.fetchSub() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicShort(42);

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
    });

    /**
     * @tc.name   atomicShortTest017
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0017
     * @tc.desc   Verify AtomicShort.fetchSub() P1 int16 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicShort(SHORT_MAX);
      expect(atom.fetchSub(1)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(32766);

      atom.store(SHORT_MIN);
      expect(atom.fetchSub(-1)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(toShortValue(SHORT_MIN_INT - (-1)));
    });

    /**
     * @tc.name   atomicShortTest018
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0018
     * @tc.desc   Verify AtomicShort.fetchSub() P2 overflow input cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicShort(SHORT_MAX);
      expect(atom.fetchSub(OVER_SHORT_MAX_VALUE)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(toShortValue(SHORT_MAX_INT - OVER_SHORT_MAX_VALUE));

      atom.store(SHORT_MIN);
      expect(atom.fetchSub(UNDER_SHORT_MIN_VALUE)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(toShortValue(SHORT_MIN_INT - UNDER_SHORT_MIN_VALUE));
    });

    /**
     * @tc.name   atomicShortTest019
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0019
     * @tc.desc   Verify AtomicShort.fetchAnd() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicShort(300);
      expect(atom.fetchAnd(255)).assertEqual(300);
      expect(atom.load()).assertEqual(44);

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
     * @tc.name   atomicShortTest020
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0020
     * @tc.desc   Verify AtomicShort.fetchAnd() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicShort(0);
      expect(atom.fetchAnd(12345)).assertEqual(0);
      expect(atom.load()).assertEqual(0);

      atom.store(SHORT_MAX);
      expect(atom.fetchAnd(SHORT_MAX)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(SHORT_MAX);

      atom.store(SHORT_MIN);
      expect(atom.fetchAnd(SHORT_MIN)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(SHORT_MIN);
    });

    /**
     * @tc.name   atomicShortTest021
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0021
     * @tc.desc   Verify AtomicShort.fetchOr() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicShort(44);

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
    });

    /**
     * @tc.name   atomicShortTest022
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0022
     * @tc.desc   Verify AtomicShort.fetchOr() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicShort(0);
      expect(atom.fetchOr(12345)).assertEqual(0);
      expect(atom.load()).assertEqual(12345);

      atom.store(SHORT_MAX);
      expect(atom.fetchOr(0)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(SHORT_MAX);

      atom.store(SHORT_MIN);
      expect(atom.fetchOr(0)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(SHORT_MIN);
    });

    /**
     * @tc.name   atomicShortTest023
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0023
     * @tc.desc   Verify AtomicShort.fetchXor() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicShort(45);

      expect(atom.fetchXor(16)).assertEqual(45);
      expect(atom.load()).assertEqual(61);

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
     * @tc.name   atomicShortTest024
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0024
     * @tc.desc   Verify AtomicShort.fetchXor() P1 repeat and boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicShortTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const baseValue: short = toShortValue(777);
      const maskValue: short = toShortValue(99);
      const atom = new AtomicShort(baseValue);

      expect(atom.fetchXor(maskValue)).assertEqual(baseValue);
      expect(atom.load()).assertEqual(toShortValue(777 ^ 99));
      expect(atom.fetchXor(maskValue)).assertEqual(toShortValue(777 ^ 99));
      expect(atom.load()).assertEqual(baseValue);

      atom.store(SHORT_MAX);
      expect(atom.fetchXor(SHORT_MAX)).assertEqual(SHORT_MAX);
      expect(atom.load()).assertEqual(0);

      atom.store(SHORT_MIN);
      expect(atom.fetchXor(SHORT_MIN)).assertEqual(SHORT_MIN);
      expect(atom.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortTest025
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_TEST_0025
     * @tc.desc   Verify AtomicShort.isLockFree() return type and value domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const result: boolean = AtomicShort.isLockFree();
      expect(result === true || result === false).assertTrue();
    });
  });
}
