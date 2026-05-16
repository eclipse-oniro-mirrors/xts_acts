/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

class Anchor {
  static matchStartAnchor(input: string): RegExpExecArray | null {
    const re = /^hello/;
    return re.exec(input);
  }

  static matchEndAnchor(input: string): RegExpExecArray | null {
    const re = /world$/;
    return re.exec(input);
  }

  static matchWordBoundary(input: string): RegExpExecArray | null {
    const re = /\btest\b/;
    return re.exec(input);
  }

  static matchNonWordBoundary(input: string): RegExpExecArray | null {
    const re = /test\B/;
    return re.exec(input);
  }
}

export default function execAnchorTest() {
  describe('Anchor_Boundary_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_ANCHOR_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec with start anchor ^hello
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = Anchor.matchStartAnchor("hello world");
      const result2 = Anchor.matchStartAnchor("say hello");
      expect(result1?.[0]).assertEqual("hello");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_ANCHOR_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec with end anchor world$
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = Anchor.matchEndAnchor("hello world");
      const result2 = Anchor.matchEndAnchor("world hello");
      expect(result1?.[0]).assertEqual("world");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_ANCHOR_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec with word boundary \\b for whole word test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = Anchor.matchWordBoundary("test");
      const result2 = Anchor.matchWordBoundary("testing");
      const result3 = Anchor.matchWordBoundary("123 test 456");
      expect(result1?.[0]).assertEqual("test");
      expect(result2).assertEqual(null);
      expect(result3?.[0]).assertEqual("test");
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_ANCHOR_TEST_0400
     * @tc.desc   Test RegExp.prototype.exec with non-word boundary \\B after test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = Anchor.matchNonWordBoundary("testing");
      const result2 = Anchor.matchNonWordBoundary("test");
      expect(result1?.[0]).assertEqual("test");
      expect(result2).assertEqual(null);
    });
  });
}

