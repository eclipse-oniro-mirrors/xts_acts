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

export default function atomicBooleanTest() {
  describe('atomicBooleanTest', () => {
    afterEach(async () => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicBooleanTest001
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_TEST_0001
     * @tc.desc   Verify AtomicBoolean.load() with true and false initial values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(new AtomicBoolean(true).load()).assertEqual(true);
      expect(new AtomicBoolean(false).load()).assertEqual(false);
    });

    /**
     * @tc.name   atomicBooleanTest002
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_TEST_0002
     * @tc.desc   Verify AtomicBoolean.store() with true and false values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicBoolean(false);

      atom.store(true);
      expect(atom.load()).assertEqual(true);

      atom.store(false);
      expect(atom.load()).assertEqual(false);
    });

    /**
     * @tc.name   atomicBooleanTest003
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_TEST_0003
     * @tc.desc   Verify AtomicBoolean.exchange() returns old value and updates internal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomTrue = new AtomicBoolean(true);
      expect(atomTrue.exchange(false)).assertEqual(true);
      expect(atomTrue.load()).assertEqual(false);

      const atomFalse = new AtomicBoolean(false);
      expect(atomFalse.exchange(true)).assertEqual(false);
      expect(atomFalse.load()).assertEqual(true);
    });

    /**
     * @tc.name   atomicBooleanTest004
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_TEST_0004
     * @tc.desc   Verify AtomicBoolean.compareAndSwap() success and mismatch behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicBoolean(true);

      expect(atom.compareAndSwap(true, false)).assertEqual(true);
      expect(atom.load()).assertEqual(false);

      atom.store(true);
      expect(atom.compareAndSwap(false, true)).assertEqual(true);
      expect(atom.load()).assertEqual(true);

      atom.store(false);
      expect(atom.compareAndSwap(false, true)).assertEqual(false);
      expect(atom.load()).assertEqual(true);
    });

    /**
     * @tc.name   atomicBooleanTest005
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_TEST_0005
     * @tc.desc   Verify AtomicBoolean.isLockFree() return type and value domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = AtomicBoolean.isLockFree();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
    });
  });
}
