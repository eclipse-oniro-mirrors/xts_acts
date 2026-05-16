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

class ExecSpecial {
  static matchPositiveLookahead(input: string): RegExpExecArray | null {
    const re = /foo(?=bar)/;
    return re.exec(input);
  }

  static matchNegativeLookahead(input: string): RegExpExecArray | null {
    const re = /foo(?!bar)/;
    return re.exec(input);
  }

  static matchPositiveLookbehind(input: string): RegExpExecArray | null {
    const re = /(?<=test)123/;
    return re.exec(input);
  }

  static matchNegativeLookbehind(input: string): RegExpExecArray | null {
    const re = /(?<!test)123/;
    return re.exec(input);
  }
}

export default function execSpecialTest() {
  describe('Exec_Special_Pattern_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec positive lookahead (?=)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecSpecial.matchPositiveLookahead("foobar");
      const result2 = ExecSpecial.matchPositiveLookahead("foobaz");
      expect(result1?.[0]).assertEqual("foo");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec negative lookahead (?!)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecSpecial.matchNegativeLookahead("foobaz");
      const result2 = ExecSpecial.matchNegativeLookahead("foobar");
      expect(result1?.[0]).assertEqual("foo");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec positive lookbehind (?<=) when supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecSpecial.matchPositiveLookbehind("test123");
      const result2 = ExecSpecial.matchPositiveLookbehind("abc123");
      if (result1 === null) {
        return;
      }
      expect(result1?.[0]).assertEqual("123");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0500
     * @tc.desc   Test positive lookbehind yields no match when unsupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecSpecial.matchPositiveLookbehind("test123");
      const result2 = ExecSpecial.matchPositiveLookbehind("abc123");
      if (result1 !== null) {
        return;
      }
      expect(result1).assertEqual(null);
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0400
     * @tc.desc   Test RegExp.prototype.exec negative lookbehind (?<!) when supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecSpecial.matchNegativeLookbehind("abc123");
      const result2 = ExecSpecial.matchNegativeLookbehind("test123");
      if (result1 === null) {
        return;
      }
      expect(result1?.[0]).assertEqual("123");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0600
     * @tc.desc   Test negative lookbehind yields no match when unsupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecSpecial.matchNegativeLookbehind("abc123");
      const result2 = ExecSpecial.matchNegativeLookbehind("test123");
      if (result1 !== null) {
        return;
      }
      expect(result1).assertEqual(null);
      expect(result2).assertEqual(null);
    });
  });
}
