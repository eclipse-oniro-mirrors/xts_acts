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

export default function atomicCharTest() {
  describe('atomicCharTest', () => {
    afterEach(async () => {
      await sleep(50);
    });

    /**
     * @tc.name   atomicCharTest001
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_TEST_0001
     * @tc.desc   Verify AtomicChar.load() P0 cases with ASCII and Chinese chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(new AtomicChar(c'A').load()).assertEqual(c'A');
      expect(new AtomicChar(c'中').load()).assertEqual(c'中');
    });

    /**
     * @tc.name   atomicCharTest002
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_TEST_0002
     * @tc.desc   Verify AtomicChar.load() P1 cases with boundary unicode chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(new AtomicChar(c'\u0000').load()).assertEqual(c'\u0000');
      expect(new AtomicChar(c'\uFFFF').load()).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.name   atomicCharTest003
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_TEST_0003
     * @tc.desc   Verify AtomicChar.store() P0 cases with ASCII and Chinese chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicChar(c'A');

      atom.store(c'A');
      expect(atom.load()).assertEqual(c'A');

      atom.store(c'中');
      expect(atom.load()).assertEqual(c'中');
    });

    /**
     * @tc.name   atomicCharTest004
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_TEST_0004
     * @tc.desc   Verify AtomicChar.store() P1 cases with Latin and unicode chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicCharTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const atom = new AtomicChar(c'A');

      atom.store(c'Z');
      expect(atom.load()).assertEqual(c'Z');

      atom.store(c'\u4E2D');
      expect(atom.load()).assertEqual(c'\u4E2D');
    });

    /**
     * @tc.name   atomicCharTest005
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_TEST_0005
     * @tc.desc   Verify AtomicChar.exchange() P0 cases with ASCII and Chinese chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomAscii = new AtomicChar(c'A');
      expect(atomAscii.exchange(c'B')).assertEqual(c'A');
      expect(atomAscii.load()).assertEqual(c'B');

      const atomCn = new AtomicChar(c'中');
      expect(atomCn.exchange(c'国')).assertEqual(c'中');
      expect(atomCn.load()).assertEqual(c'国');
    });

    /**
     * @tc.name   atomicCharTest006
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_TEST_0006
     * @tc.desc   Verify AtomicChar.compareAndSwap() P0 success and mismatch cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atom = new AtomicChar(c'A');

      expect(atom.compareAndSwap(c'A', c'B')).assertEqual(c'A');
      expect(atom.load()).assertEqual(c'B');

      atom.store(c'A');
      expect(atom.compareAndSwap(c'B', c'C')).assertEqual(c'A');
      expect(atom.load()).assertEqual(c'A');
    });

    /**
     * @tc.name   atomicCharTest007
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_TEST_0007
     * @tc.desc   Verify AtomicChar.isLockFree() return type and value domain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const result = AtomicChar.isLockFree();
      expect(typeof result).assertEqual('boolean');
      expect(result === true || result === false).assertTrue();
    });
  });
}
