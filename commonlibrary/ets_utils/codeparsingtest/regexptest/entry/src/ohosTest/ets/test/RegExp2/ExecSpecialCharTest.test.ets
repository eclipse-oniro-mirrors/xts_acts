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

class ExecSpecialChar {
  static execEscapedDot(input: string): RegExpExecArray | null {
    return /\./.exec(input);
  }

  static execTab(input: string): RegExpExecArray | null {
    return /\t/.exec(input);
  }

  static execNewline(input: string): RegExpExecArray | null {
    return /\n/.exec(input);
  }

  static execChineseRange(input: string): RegExpExecArray | null {
    return /[\u4e00-\u9fa5]+/.exec(input);
  }

  static execEmojiProperty(input: string): RegExpExecArray | null {
    return /\p{Emoji}/u.exec(input);
  }
}

export default function execSpecialCharTest() {
  describe('Special_Character_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec escaped dot matches literal period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecSpecialChar.execEscapedDot("a.b");
      expect(result?.[0]).assertEqual(".");
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec tab and newline escape sequences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = ExecSpecialChar.execTab("a\tb");
      const result2 = ExecSpecialChar.execNewline("a\nb");
      expect(result1?.[0]).assertEqual("\t");
      expect(result2?.[0]).assertEqual("\n");
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec Unicode Han character class range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecSpecialChar.execChineseRange("hello\u4E16\u754Cworld");
      expect(result?.[0]).assertEqual("\u4E16\u754C");
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0400
     * @tc.desc   Test RegExp.prototype.exec Unicode property escape \\p{Emoji} with u flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emoji = String.fromCodePoint(0x1F600);
      const result = ExecSpecialChar.execEmojiProperty(`Hello ${emoji} World`);
      expect(result?.[0]).assertEqual(emoji);
    });
  });
}
