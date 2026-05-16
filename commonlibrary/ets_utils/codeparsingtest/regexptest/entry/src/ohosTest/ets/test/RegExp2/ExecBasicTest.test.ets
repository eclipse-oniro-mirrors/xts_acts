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

class ExecBasic {
  static matchHello(input: string): RegExpExecArray | null {
    const re = /hello/;
    return re.exec(input);
  }

  static matchAbc(input: string): RegExpExecArray | null {
    const re = /abc/;
    return re.exec(input);
  }

  static matchEmptyPattern(input: string): RegExpExecArray | null {
    const re = /(?:)/;
    return re.exec(input);
  }

  static searchWithPattern(input: string, re: RegExp): number {
    return input.search(re);
  }
}

export default function execBasicTest() {
  describe('Basic_Matching_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec simple pattern /hello/ match and index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchHello("hello world");
      expect(result?.[0]).assertEqual("hello");
      expect(result?.index).assertEqual(0);
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec returns null when pattern does not match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchHello("world");
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec /abc/ on empty string returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchAbc("");
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0400
     * @tc.desc   Test RegExp.prototype.exec empty non-capturing pattern (?:)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchEmptyPattern("hello");
      expect(result?.[0]).assertEqual("");
      expect(result?.index).assertEqual(0);
    });

    /**
     * @tc.name testExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0500
     * @tc.desc   Test String.search index aligns with exec match position for /a/ on abc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /a/;
      const str: string = "abc";
      const execResult: RegExpExecArray | null = re.exec(str);
      expect(execResult !== null).assertTrue();
      const searchIndex: number = ExecBasic.searchWithPattern(str, re);
      expect(execResult!.index).assertEqual(searchIndex);
    });

    /**
     * @tc.name testExec0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_1100
     * @tc.desc   Test exec returns null when pattern does not match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /z/;
      const str: string = "abc";
      const execResult: RegExpExecArray | null = re.exec(str);
      expect(execResult).assertEqual(null);
    });

    /**
     * @tc.name testExec0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0600
     * @tc.desc   Boundary: exec /hello/ on empty string returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchHello('');
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name testExec0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0700
     * @tc.desc   Boundary: exec empty non-capturing pattern on empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchEmptyPattern('');
      expect(result?.[0]).assertEqual('');
      expect(result?.index).assertEqual(0);
    });

    /**
     * @tc.name testExec0108
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0800
     * @tc.desc   Boundary: String.search returns -1 when pattern never matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ExecBasic.searchWithPattern('abc', /z/)).assertEqual(-1);
    });

    /**
     * @tc.name testExec0109
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0900
     * @tc.desc   Boundary: String.search on empty string when pattern requires a character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ExecBasic.searchWithPattern('', /a/)).assertEqual(-1);
    });

    /**
     * @tc.name testExec0110
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_1000
     * @tc.desc   Boundary: exec with whitespace-only input and no match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecBasic.matchHello('   \t\n  ');
      expect(result).assertEqual(null);
    });
  });
}
