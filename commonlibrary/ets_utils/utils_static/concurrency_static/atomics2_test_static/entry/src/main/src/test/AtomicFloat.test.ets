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

const FLOAT_DELTA: float = 0.00001f;
const OVER_FLOAT_MAX: float = Double.toFloat(Double.MAX_VALUE);
const UNDER_FLOAT_MIN: float = Double.toFloat(-Double.MAX_VALUE);

function isNear(actual: float, expected: float, delta: float = FLOAT_DELTA): boolean {
  return actual >= expected - delta && actual <= expected + delta;
}

export default function atomicFloatTest(): void {
  describe('atomicFloatTest', (): void => {
    afterEach(async (): Promise<void> => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicFloatTest001
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0001
     * @tc.desc   Verify AtomicFloat.load() P0 cases with 0.0, 3.14, -1.0 and 1.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      expect(new AtomicFloat(0.0f).load()).assertEqual(0.0f);
      expect(isNear(new AtomicFloat(3.14f).load(), 3.14f)).assertTrue();
      expect(new AtomicFloat(-1.0f).load()).assertEqual(-1.0f);
      expect(new AtomicFloat(1.0f).load()).assertEqual(1.0f);
    });

    /**
     * @tc.name   atomicFloatTest002
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0002
     * @tc.desc   Verify AtomicFloat.load() P1 cases with boundaries and infinities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      expect(isNear(new AtomicFloat(-1.5f).load(), -1.5f)).assertTrue();
      expect(new AtomicFloat(Float.MAX_VALUE).load()).assertEqual(Float.MAX_VALUE);
      expect(new AtomicFloat(Float.MIN_VALUE).load()).assertEqual(Float.MIN_VALUE);
      expect(new AtomicFloat(Float.POSITIVE_INFINITY).load()).assertEqual(Float.POSITIVE_INFINITY);
      expect(new AtomicFloat(Float.NEGATIVE_INFINITY).load()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name   atomicFloatTest003
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0003
     * @tc.desc   Verify AtomicFloat.load() P2 out-of-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const overMaxStored = new AtomicFloat(OVER_FLOAT_MAX).load();
      expect(Float.isNaN(overMaxStored)).assertFalse();
      expect(overMaxStored == Float.POSITIVE_INFINITY || overMaxStored >= Float.MAX_VALUE).assertTrue();

      const underMinStored = new AtomicFloat(UNDER_FLOAT_MIN).load();
      expect(Float.isNaN(underMinStored)).assertFalse();
      expect(underMinStored == Float.NEGATIVE_INFINITY || underMinStored <= -Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.name   atomicFloatTest004
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0004
     * @tc.desc   Verify AtomicFloat.store() P0 cases with 0.0, 3.14, -1.0 and 1.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicFloat(0.0f);
      atom.store(0.0f);
      expect(atom.load()).assertEqual(0.0f);
      atom.store(3.14f);
      expect(isNear(atom.load(), 3.14f)).assertTrue();
      atom.store(-1.0f);
      expect(atom.load()).assertEqual(-1.0f);
      atom.store(1.0f);
      expect(atom.load()).assertEqual(1.0f);
    });

    /**
     * @tc.name   atomicFloatTest005
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0005
     * @tc.desc   Verify AtomicFloat.store() P1 cases with boundaries and infinities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicFloat(0.0f);
      atom.store(-1.5f);
      expect(isNear(atom.load(), -1.5f)).assertTrue();
      atom.store(Float.MAX_VALUE);
      expect(atom.load()).assertEqual(Float.MAX_VALUE);
      atom.store(Float.MIN_VALUE);
      expect(atom.load()).assertEqual(Float.MIN_VALUE);
      atom.store(Float.POSITIVE_INFINITY);
      expect(atom.load()).assertEqual(Float.POSITIVE_INFINITY);
      atom.store(Float.NEGATIVE_INFINITY);
      expect(atom.load()).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.name   atomicFloatTest006
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0006
     * @tc.desc   Verify AtomicFloat.store() P2 out-of-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicFloat(0.0f);

      atom.store(OVER_FLOAT_MAX);
      const overMaxStored = atom.load();
      expect(Float.isNaN(overMaxStored)).assertFalse();
      expect(overMaxStored == Float.POSITIVE_INFINITY || overMaxStored >= Float.MAX_VALUE).assertTrue();

      atom.store(UNDER_FLOAT_MIN);
      const underMinStored = atom.load();
      expect(Float.isNaN(underMinStored)).assertFalse();
      expect(underMinStored == Float.NEGATIVE_INFINITY || underMinStored <= -Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.name   atomicFloatTest007
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0007
     * @tc.desc   Verify AtomicFloat.exchange() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicFloat(3.14f);
      expect(isNear(atom.exchange(2.71f), 3.14f)).assertTrue();
      expect(isNear(atom.load(), 2.71f)).assertTrue();

      atom.store(0.0f);
      expect(atom.exchange(-1.0f)).assertEqual(0.0f);
      expect(atom.load()).assertEqual(-1.0f);

      atom.store(-1.0f);
      expect(atom.exchange(1.0f)).assertEqual(-1.0f);
      expect(atom.load()).assertEqual(1.0f);

      atom.store(1.0f);
      expect(atom.exchange(-1.0f)).assertEqual(1.0f);
      expect(atom.load()).assertEqual(-1.0f);
    });

    /**
     * @tc.name   atomicFloatTest008
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0008
     * @tc.desc   Verify AtomicFloat.exchange() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicFloat(Float.MAX_VALUE);
      expect(atom.exchange(0.0f)).assertEqual(Float.MAX_VALUE);
      expect(atom.load()).assertEqual(0.0f);

      atom.store(Float.MIN_VALUE);
      expect(atom.exchange(100.0f)).assertEqual(Float.MIN_VALUE);
      expect(atom.load()).assertEqual(100.0f);
    });

    /**
     * @tc.name   atomicFloatTest009
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0009
     * @tc.desc   Verify AtomicFloat.exchange() P2 out-of-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicFloat(Float.MAX_VALUE);

      expect(atom.exchange(OVER_FLOAT_MAX)).assertEqual(Float.MAX_VALUE);
      const overMaxStored = atom.load();
      expect(Float.isNaN(overMaxStored)).assertFalse();
      expect(overMaxStored == Float.POSITIVE_INFINITY || overMaxStored >= Float.MAX_VALUE).assertTrue();

      atom.store(Float.MIN_VALUE);
      expect(atom.exchange(UNDER_FLOAT_MIN)).assertEqual(Float.MIN_VALUE);
      const underMinStored = atom.load();
      expect(Float.isNaN(underMinStored)).assertFalse();
      expect(underMinStored == Float.NEGATIVE_INFINITY || underMinStored <= -Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.name   atomicFloatTest010
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0010
     * @tc.desc   Verify AtomicFloat.compareAndSwap() P0 success and mismatch cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const atom = new AtomicFloat(3.14f);
      expect(isNear(atom.compareAndSwap(3.14f, 2.71f), 3.14f)).assertTrue();
      expect(isNear(atom.load(), 2.71f)).assertTrue();

      atom.store(3.14f);
      expect(isNear(atom.compareAndSwap(3.15f, 2.71f), 3.14f)).assertTrue();
      expect(isNear(atom.load(), 3.14f)).assertTrue();

      atom.store(0.0f);
      expect(atom.compareAndSwap(0.0f, -1.0f)).assertEqual(0.0f);
      expect(atom.load()).assertEqual(-1.0f);

      atom.store(-1.0f);
      expect(atom.compareAndSwap(-1.0f, 1.0f)).assertEqual(-1.0f);
      expect(atom.load()).assertEqual(1.0f);

      atom.store(1.0f);
      expect(atom.compareAndSwap(1.0f, 0.0f)).assertEqual(1.0f);
      expect(atom.load()).assertEqual(0.0f);
    });

    /**
     * @tc.name   atomicFloatTest011
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0011
     * @tc.desc   Verify AtomicFloat.compareAndSwap() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const atom = new AtomicFloat(Float.MAX_VALUE);
      expect(atom.compareAndSwap(Float.MAX_VALUE, 0.0f)).assertEqual(Float.MAX_VALUE);
      expect(atom.load()).assertEqual(0.0f);

      atom.store(Float.MIN_VALUE);
      expect(atom.compareAndSwap(Float.MIN_VALUE, 100.0f)).assertEqual(Float.MIN_VALUE);
      expect(atom.load()).assertEqual(100.0f);
    });

    /**
     * @tc.name   atomicFloatTest012
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0012
     * @tc.desc   Verify AtomicFloat.compareAndSwap() P2 out-of-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const atom = new AtomicFloat(Float.MAX_VALUE);

      expect(atom.compareAndSwap(Float.MAX_VALUE, OVER_FLOAT_MAX)).assertEqual(Float.MAX_VALUE);
      const overMaxStored = atom.load();
      expect(Float.isNaN(overMaxStored)).assertFalse();
      expect(overMaxStored == Float.POSITIVE_INFINITY || overMaxStored >= Float.MAX_VALUE).assertTrue();

      atom.store(Float.MIN_VALUE);
      expect(atom.compareAndSwap(Float.MIN_VALUE, UNDER_FLOAT_MIN)).assertEqual(Float.MIN_VALUE);
      const underMinStored = atom.load();
      expect(Float.isNaN(underMinStored)).assertFalse();
      expect(underMinStored == Float.NEGATIVE_INFINITY || underMinStored <= -Float.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.name   atomicFloatTest013
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_TEST_0013
     * @tc.desc   Verify AtomicFloat.isLockFree() return type and value domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const result: boolean = AtomicFloat.isLockFree();
      expect(result === true || result === false).assertTrue();
    });
  });
}
