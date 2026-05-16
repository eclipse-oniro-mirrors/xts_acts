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

function assertNear(actual: number, expected: number, delta: number = 1e-10): void {
  expect(Math.abs(actual - expected) <= delta).assertTrue();
}

function assertOverMaxStored(actual: number): void {
  expect(Number.isNaN(actual)).assertFalse();
  expect(actual === Infinity || actual >= Double.MAX_VALUE).assertTrue();
}

function assertUnderMinStored(actual: number): void {
  expect(Number.isNaN(actual)).assertFalse();
  expect(actual === -Infinity || actual <= -Double.MAX_VALUE).assertTrue();
}

export default function atomicDoubleTest() {
  describe('atomicDoubleTest', () => {
    afterEach(async () => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicDoubleTest001
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0001
     * @tc.desc   Verify AtomicDouble.load() P0 cases with 0.0, 3.14159265, -1.0 and 1.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(new AtomicDouble(0.0).load()).assertEqual(0.0);
      assertNear(new AtomicDouble(3.14159265).load(), 3.14159265);
      expect(new AtomicDouble(-1.0).load()).assertEqual(-1.0);
      expect(new AtomicDouble(1.0).load()).assertEqual(1.0);
    });

    /**
     * @tc.name   atomicDoubleTest002
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0002
     * @tc.desc   Verify AtomicDouble.load() P1 cases with boundaries and infinities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      assertNear(new AtomicDouble(-1.5).load(), -1.5);
      expect(new AtomicDouble(Double.MAX_VALUE).load()).assertEqual(Double.MAX_VALUE);
      expect(new AtomicDouble(Double.MIN_VALUE).load()).assertEqual(Double.MIN_VALUE);
      expect(new AtomicDouble(Infinity).load()).assertEqual(Infinity);
      expect(new AtomicDouble(-Infinity).load()).assertEqual(-Infinity);
    });

    /**
     * @tc.name   atomicDoubleTest003
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0003
     * @tc.desc   Verify AtomicDouble.load() P2 out-of-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const overMax = (Double.MAX_VALUE * 2.0) as double;
      const underMin = (-Double.MAX_VALUE * 2.0) as double;
      const overMaxStored = new AtomicDouble(overMax).load();
      expect(Number.isNaN(overMaxStored)).assertFalse();
      expect(overMaxStored === Infinity || overMaxStored >= Double.MAX_VALUE).assertTrue();

      const underMinStored = new AtomicDouble(underMin).load();
      expect(Number.isNaN(underMinStored)).assertFalse();
      expect(underMinStored === -Infinity || underMinStored <= -Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleTest004
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0004
     * @tc.desc   Verify AtomicDouble.store() P0 cases with 0.0, 3.14159265, -1.0 and 1.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicDouble(0.0);
      atom.store(0.0);
      expect(atom.load()).assertEqual(0.0);
      atom.store(3.14159265);
      assertNear(atom.load(), 3.14159265);
      atom.store(-1.0);
      expect(atom.load()).assertEqual(-1.0);
      atom.store(1.0);
      expect(atom.load()).assertEqual(1.0);
    });

    /**
     * @tc.name   atomicDoubleTest005
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0005
     * @tc.desc   Verify AtomicDouble.store() P1 cases with boundaries and infinities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicDouble(0.0);
      atom.store(-1.5);
      assertNear(atom.load(), -1.5);
      atom.store(Double.MAX_VALUE);
      expect(atom.load()).assertEqual(Double.MAX_VALUE);
      atom.store(Double.MIN_VALUE);
      expect(atom.load()).assertEqual(Double.MIN_VALUE);
      atom.store(Infinity);
      expect(atom.load()).assertEqual(Infinity);
      atom.store(-Infinity);
      expect(atom.load()).assertEqual(-Infinity);
    });

    /**
     * @tc.name   atomicDoubleTest006
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0006
     * @tc.desc   Verify AtomicDouble.store() P2 out-of-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atom = new AtomicDouble(0.0);
      const overMax = (Double.MAX_VALUE * 2.0) as double;
      const underMin = (-Double.MAX_VALUE * 2.0) as double;

      atom.store(overMax);
      const overMaxStored = atom.load();
      expect(Number.isNaN(overMaxStored)).assertFalse();
      expect(overMaxStored === Infinity || overMaxStored >= Double.MAX_VALUE).assertTrue();

      atom.store(underMin);
      const underMinStored = atom.load();
      expect(Number.isNaN(underMinStored)).assertFalse();
      expect(underMinStored === -Infinity || underMinStored <= -Double.MAX_VALUE).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleTest007
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0007
     * @tc.desc   Verify AtomicDouble.exchange() P0 cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicDouble(3.14);
      assertNear(atom.exchange(2.71), 3.14);
      assertNear(atom.load(), 2.71);

      atom.store(0.0);
      expect(atom.exchange(-1.0)).assertEqual(0.0);
      expect(atom.load()).assertEqual(-1.0);

      atom.store(-1.0);
      expect(atom.exchange(1.0)).assertEqual(-1.0);
      expect(atom.load()).assertEqual(1.0);

      atom.store(1.0);
      expect(atom.exchange(-1.0)).assertEqual(1.0);
      expect(atom.load()).assertEqual(-1.0);
    });

    /**
     * @tc.name   atomicDoubleTest008
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0008
     * @tc.desc   Verify AtomicDouble.exchange() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicDouble(Double.MAX_VALUE);
      expect(atom.exchange(0.0)).assertEqual(Double.MAX_VALUE);
      expect(atom.load()).assertEqual(0.0);

      atom.store(Double.MIN_VALUE);
      expect(atom.exchange(100.0)).assertEqual(Double.MIN_VALUE);
      expect(atom.load()).assertEqual(100.0);
    });

    /**
     * @tc.name   atomicDoubleTest009
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0009
     * @tc.desc   Verify AtomicDouble.exchange() P2 out-of-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atom = new AtomicDouble(Double.MAX_VALUE);
      const overMax = (Double.MAX_VALUE * 2.0) as double;
      const underMin = (-Double.MAX_VALUE * 2.0) as double;

      expect(atom.exchange(overMax)).assertEqual(Double.MAX_VALUE);
      assertOverMaxStored(atom.load());

      atom.store(Double.MIN_VALUE);
      expect(atom.exchange(underMin)).assertEqual(Double.MIN_VALUE);
      assertUnderMinStored(atom.load());
    });

    /**
     * @tc.name   atomicDoubleTest010
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0010
     * @tc.desc   Verify AtomicDouble.compareAndSwap() P0 success and mismatch cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicDouble(3.14);
      assertNear(atom.compareAndSwap(3.14, 2.71), 3.14);
      assertNear(atom.load(), 2.71);

      atom.store(3.14);
      assertNear(atom.compareAndSwap(3.15, 2.71), 3.14);
      assertNear(atom.load(), 3.14);

      atom.store(0.0);
      expect(atom.compareAndSwap(0.0, -1.0)).assertEqual(0.0);
      expect(atom.load()).assertEqual(-1.0);

      atom.store(-1.0);
      expect(atom.compareAndSwap(-1.0, 1.0)).assertEqual(-1.0);
      expect(atom.load()).assertEqual(1.0);

      atom.store(1.0);
      expect(atom.compareAndSwap(1.0, 0.0)).assertEqual(1.0);
      expect(atom.load()).assertEqual(0.0);
    });

    /**
     * @tc.name   atomicDoubleTest011
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0011
     * @tc.desc   Verify AtomicDouble.compareAndSwap() P1 boundary cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicDouble(Double.MAX_VALUE);
      expect(atom.compareAndSwap(Double.MAX_VALUE, 0.0)).assertEqual(Double.MAX_VALUE);
      expect(atom.load()).assertEqual(0.0);

      atom.store(Double.MIN_VALUE);
      expect(atom.compareAndSwap(Double.MIN_VALUE, 100.0)).assertEqual(Double.MIN_VALUE);
      expect(atom.load()).assertEqual(100.0);
    });

    /**
     * @tc.name   atomicDoubleTest012
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0012
     * @tc.desc   Verify AtomicDouble.compareAndSwap() P2 out-of-range cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicDoubleTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atom = new AtomicDouble(Double.MAX_VALUE);
      const overMax = (Double.MAX_VALUE * 2.0) as double;
      const underMin = (-Double.MAX_VALUE * 2.0) as double;

      expect(atom.compareAndSwap(Double.MAX_VALUE, overMax)).assertEqual(Double.MAX_VALUE);
      assertOverMaxStored(atom.load());

      atom.store(Double.MIN_VALUE);
      expect(atom.compareAndSwap(Double.MIN_VALUE, underMin)).assertEqual(Double.MIN_VALUE);
      assertUnderMinStored(atom.load());
    });

    /**
     * @tc.name   atomicDoubleTest013
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_TEST_0013
     * @tc.desc   Verify AtomicDouble.isLockFree() return type and value domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = AtomicDouble.isLockFree();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
    });
  });
}
