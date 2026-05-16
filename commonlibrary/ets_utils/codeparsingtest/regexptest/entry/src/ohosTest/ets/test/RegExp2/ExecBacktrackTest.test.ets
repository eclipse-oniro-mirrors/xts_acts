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

class ExecBacktrack {
  static matchAlternation(input: string): RegExpExecArray | null {
    const re = /a(b|c)d/;
    return re.exec(input);
  }

  static matchNestedPattern(input: string): RegExpExecArray | null {
    const re = /((?:[A-Za-z]+)(?:\d+))/;
    return re.exec(input);
  }
}

export default function execBacktrackTest() {
  describe('Backtracking_Complex_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BACKTRACK_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec alternation capture a(b|c)d
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecBacktrack.matchAlternation("abd");
      const result2 = ExecBacktrack.matchAlternation("acd");
      expect(result1?.[1]).assertEqual("b");
      expect(result2?.[1]).assertEqual("c");
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BACKTRACK_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec nested letter-and-digit group
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBacktrack.matchNestedPattern("test123");
      expect(result?.[1]).assertEqual("test123");
    });
  });
}
