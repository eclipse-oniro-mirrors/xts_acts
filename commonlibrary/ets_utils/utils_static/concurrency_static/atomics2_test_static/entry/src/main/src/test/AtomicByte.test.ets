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

const BYTE_MAX_INT: int = 127;
const BYTE_MIN_INT: int = -128;
const OVER_BYTE_MAX: int = 128;
const UNDER_BYTE_MIN: int = -129;
const BYTE_200_INT: int = 200;
const BYTE_255_INT: int = 255;

const BYTE_MAX: byte = 127;
const BYTE_MIN: byte = (-128).toByte();
const OVER_BYTE_MAX_VALUE: byte = OVER_BYTE_MAX.toByte();
const UNDER_BYTE_MIN_VALUE: byte = UNDER_BYTE_MIN.toByte();
const BYTE_200_VALUE: byte = BYTE_200_INT.toByte();
const BYTE_255_VALUE: byte = BYTE_255_INT.toByte();

function toByteValue(value: int): byte {
  return value.toByte();
}

export default function atomicByteTest(): void {
  describe('atomicByteTest', (): void => {
    afterEach(async (): Promise<void> => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicByteTest001
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0001
     * @tc.desc   Verify AtomicByte.load() P0 cases with 0, 42, -1 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      expect(new AtomicByte(0).load()).assertEqual(0);
      expect(new AtomicByte(42).load()).assertEqual(42);
      expect(new AtomicByte(-1).load()).assertEqual(-1);
      expect(new AtomicByte(1).load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicByteTest002
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0002
     * @tc.desc   Verify AtomicByte.load() P1 cases with -100 and int8 boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      expect(new AtomicByte(-100).load()).assertEqual(-100);
      expect(new AtomicByte(BYTE_MAX).load()).assertEqual(BYTE_MAX);
      expect(new AtomicByte(BYTE_MIN).load()).assertEqual(BYTE_MIN);
    });

    /**
     * @tc.name   atomicByteTest003
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0003
     * @tc.desc   Verify AtomicByte.load() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicByteTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      expect(new AtomicByte(OVER_BYTE_MAX_VALUE).load()).assertEqual(toByteValue(OVER_BYTE_MAX));
      expect(new AtomicByte(UNDER_BYTE_MIN_VALUE).load()).assertEqual(toByteValue(UNDER_BYTE_MIN));
    });

    /**
     * @tc.name   atomicByteTest004
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0004
     * @tc.desc   Verify AtomicByte.store() P0 cases with 0, 42, -1 and 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicByte(0);
      atom.store(0);
      expect(atom.load()).assertEqual(0);
      atom.store(42);
      expect(atom.load()).assertEqual(42);
      atom.store(-1);
      expect(atom.load()).assertEqual(-1);
      atom.store(1);
      expect(atom.load()).assertEqual(1);
    });

    /**
     * @tc.name   atomicByteTest005
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0005
     * @tc.desc   Verify AtomicByte.store() P1 cases with -50 and int8 boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicByte(0);
      atom.store(-50);
      expect(atom.load()).assertEqual(-50);
      atom.store(BYTE_MAX);
      expect(atom.load()).assertEqual(BYTE_MAX);
      atom.store(BYTE_MIN);
      expect(atom.load()).assertEqual(BYTE_MIN);
    });

    /**
     * @tc.name   atomicByteTest006
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0006
     * @tc.desc   Verify AtomicByte.store() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicByteTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(0);
      atom.store(OVER_BYTE_MAX_VALUE);
      expect(atom.load()).assertEqual(toByteValue(OVER_BYTE_MAX));
      atom.store(UNDER_BYTE_MIN_VALUE);
      expect(atom.load()).assertEqual(toByteValue(UNDER_BYTE_MIN));
    });

    /**
     * @tc.name   atomicByteTest007
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0007
     * @tc.desc   Verify AtomicByte.exchange() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicByte(42);
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
     * @tc.name   atomicByteTest008
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0008
     * @tc.desc   Verify AtomicByte.exchange() P1 int8 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicByte(BYTE_MAX);
      expect(atom.exchange(0)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(0);

      atom.store(BYTE_MIN);
      expect(atom.exchange(100)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicByteTest009
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0009
     * @tc.desc   Verify AtomicByte.exchange() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicByteTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(BYTE_MAX);
      expect(atom.exchange(OVER_BYTE_MAX_VALUE)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(toByteValue(OVER_BYTE_MAX));

      atom.store(BYTE_MIN);
      expect(atom.exchange(UNDER_BYTE_MIN_VALUE)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(toByteValue(UNDER_BYTE_MIN));
    });

    /**
     * @tc.name   atomicByteTest010
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0010
     * @tc.desc   Verify AtomicByte.compareAndSwap() P0 success and mismatch cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicByte(42);
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
     * @tc.name   atomicByteTest011
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0011
     * @tc.desc   Verify AtomicByte.compareAndSwap() P1 int8 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicByte(BYTE_MAX);
      expect(atom.compareAndSwap(BYTE_MAX, 0)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(0);

      atom.store(BYTE_MIN);
      expect(atom.compareAndSwap(BYTE_MIN, 100)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicByteTest012
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0012
     * @tc.desc   Verify AtomicByte.compareAndSwap() P2 overflow cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicByteTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(BYTE_MAX);
      expect(atom.compareAndSwap(BYTE_MAX, OVER_BYTE_MAX_VALUE)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(toByteValue(OVER_BYTE_MAX));

      atom.store(BYTE_MIN);
      expect(atom.compareAndSwap(BYTE_MIN, UNDER_BYTE_MIN_VALUE)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(toByteValue(UNDER_BYTE_MIN));
    });

    /**
     * @tc.name   atomicByteTest013
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0013
     * @tc.desc   Verify AtomicByte.fetchAdd() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicByte(42);

      expect(atom.fetchAdd(5)).assertEqual(42);
      expect(atom.load()).assertEqual(47);

      atom.store(0);
      expect(atom.fetchAdd(10)).assertEqual(0);
      expect(atom.load()).assertEqual(10);

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
     * @tc.name   atomicByteTest014
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0014
     * @tc.desc   Verify AtomicByte.fetchAdd() P1 int8 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicByte(126);
      expect(atom.fetchAdd(1)).assertEqual(126);
      expect(atom.load()).assertEqual(BYTE_MAX);

      atom.store(BYTE_MAX);
      expect(atom.fetchAdd(1)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(toByteValue(BYTE_MAX_INT + 1));

      atom.store(BYTE_MIN);
      expect(atom.fetchAdd(-1)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(toByteValue(BYTE_MIN_INT - 1));
    });

    /**
     * @tc.name   atomicByteTest015
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0015
     * @tc.desc   Verify AtomicByte.fetchAdd() P2 overflow input cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicByteTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(BYTE_MAX);
      expect(atom.fetchAdd(OVER_BYTE_MAX_VALUE)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(toByteValue(BYTE_MAX_INT + OVER_BYTE_MAX_VALUE));

      atom.store(BYTE_MIN);
      expect(atom.fetchAdd(UNDER_BYTE_MIN_VALUE)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(toByteValue(BYTE_MIN_INT + UNDER_BYTE_MIN_VALUE));
    });

    /**
     * @tc.name   atomicByteTest016
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0016
     * @tc.desc   Verify AtomicByte.fetchSub() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicByte(42);

      expect(atom.fetchSub(5)).assertEqual(42);
      expect(atom.load()).assertEqual(37);

      atom.store(50);
      expect(atom.fetchSub(10)).assertEqual(50);
      expect(atom.load()).assertEqual(40);

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
     * @tc.name   atomicByteTest017
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0017
     * @tc.desc   Verify AtomicByte.fetchSub() P1 int8 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicByte(BYTE_MAX);
      expect(atom.fetchSub(1)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(126);

      atom.store(BYTE_MIN);
      expect(atom.fetchSub(-1)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(toByteValue(BYTE_MIN_INT - (-1)));
    });

    /**
     * @tc.name   atomicByteTest018
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0018
     * @tc.desc   Verify AtomicByte.fetchSub() P2 overflow input cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicByteTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicByte(BYTE_MAX);
      expect(atom.fetchSub(OVER_BYTE_MAX_VALUE)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(toByteValue(BYTE_MAX_INT - OVER_BYTE_MAX_VALUE));

      atom.store(BYTE_MIN);
      expect(atom.fetchSub(UNDER_BYTE_MIN_VALUE)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(toByteValue(BYTE_MIN_INT - UNDER_BYTE_MIN_VALUE));
    });

    /**
     * @tc.name   atomicByteTest019
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0019
     * @tc.desc   Verify AtomicByte.fetchAnd() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicByte(0);

      atom.store(BYTE_200_VALUE);
      expect(atom.fetchAnd(BYTE_255_VALUE)).assertEqual(BYTE_200_VALUE);
      expect(atom.load()).assertEqual(toByteValue(BYTE_200_VALUE & BYTE_255_VALUE));

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
     * @tc.name   atomicByteTest020
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0020
     * @tc.desc   Verify AtomicByte.fetchAnd() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicByte(0);
      expect(atom.fetchAnd(77)).assertEqual(0);
      expect(atom.load()).assertEqual(0);

      atom.store(BYTE_MAX);
      expect(atom.fetchAnd(BYTE_MAX)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(BYTE_MAX);

      atom.store(BYTE_MIN);
      expect(atom.fetchAnd(BYTE_MIN)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(BYTE_MIN);
    });

    /**
     * @tc.name   atomicByteTest021
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0021
     * @tc.desc   Verify AtomicByte.fetchOr() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicByte(44);

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
      expect(atom.fetchOr(10)).assertEqual(0);
      expect(atom.load()).assertEqual(10);
    });

    /**
     * @tc.name   atomicByteTest022
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0022
     * @tc.desc   Verify AtomicByte.fetchOr() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicByte(BYTE_MAX);
      expect(atom.fetchOr(0)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(BYTE_MAX);

      atom.store(BYTE_MIN);
      expect(atom.fetchOr(0)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(BYTE_MIN);
    });

    /**
     * @tc.name   atomicByteTest023
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0023
     * @tc.desc   Verify AtomicByte.fetchXor() P0 bitwise cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicByte(45);

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
     * @tc.name   atomicByteTest024
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0024
     * @tc.desc   Verify AtomicByte.fetchXor() P1 repeat and boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicByteTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const baseValue: byte = toByteValue(77);
      const maskValue: byte = toByteValue(21);
      const atom = new AtomicByte(baseValue);

      expect(atom.fetchXor(maskValue)).assertEqual(baseValue);
      expect(atom.load()).assertEqual(toByteValue(77 ^ 21));
      expect(atom.fetchXor(maskValue)).assertEqual(toByteValue(77 ^ 21));
      expect(atom.load()).assertEqual(baseValue);

      atom.store(BYTE_MAX);
      expect(atom.fetchXor(BYTE_MAX)).assertEqual(BYTE_MAX);
      expect(atom.load()).assertEqual(0);

      atom.store(BYTE_MIN);
      expect(atom.fetchXor(BYTE_MIN)).assertEqual(BYTE_MIN);
      expect(atom.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicByteTest025
     * @tc.number SUB_BUILTINS_ATOMIC_BYTE_TEST_0025
     * @tc.desc   Verify AtomicByte.isLockFree() return type and value domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicByteTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const result: boolean = AtomicByte.isLockFree();
      expect(result === true || result === false).assertTrue();
    });
  });
}
