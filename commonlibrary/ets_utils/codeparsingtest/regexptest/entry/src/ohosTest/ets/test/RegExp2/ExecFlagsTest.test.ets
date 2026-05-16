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

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

interface ExecIndicesArray extends Array<[number, number]> {
  groups?: Record<string, [number, number]>;
}

interface RegExpExecArrayWithIndices extends RegExpExecArray {
  indices?: ExecIndicesArray;
}

export default function execFlagsTest(): void {
  describe('Regex_Flags_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec with ignoreCase i flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /hello/i;
      const result: RegExpExecArray | null = re.exec("hello");
      expect(result?.[0]).assertEqual("hello");
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec with multiline m flag and ^ anchor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /^hello/m;
      const result: RegExpExecArray | null = re.exec("world\nhello");
      expect(result?.index).assertEqual(6);
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec with dotAll s flag matching newline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /hello.world/s;
      const result: RegExpExecArray | null = re.exec("hello\nworld");
      expect(result?.[0]).assertEqual("hello\nworld");
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0400
     * @tc.desc   Test RegExp.prototype.exec with unicode u flag and code point escape
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /\u{1F600}/u;
      const emoji = String.fromCodePoint(0x1F600);
      const result: RegExpExecArray | null = re.exec(`Hello ${emoji} World`);
      expect(result?.[0]).assertEqual(emoji);
    });

    /**
     * @tc.name testExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0500
     * @tc.desc   Test RegExp.prototype.exec with hasIndices d flag when supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsRegExp('test', 'd')) {
        return;
      }
      const re: RegExp = new RegExp('test', 'd');
      const raw: RegExpExecArrayWithIndices | null = re.exec("this is a test") as RegExpExecArrayWithIndices | null;
      expect(raw !== null).assertTrue();
      expect(raw!.indices !== undefined).assertTrue();
      expect(raw!.indices![0][0]).assertEqual(10);
      expect(raw!.indices![0][1]).assertEqual(14);
    });

    /**
     * @tc.name testExec0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0700
     * @tc.desc   Test d flag unsupported when hasIndices not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('test', 'd')) {
        return;
      }
      expect(supportsRegExp('test', 'd')).assertFalse();
    });

    /**
     * @tc.name testExec0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0600
     * @tc.desc   Test RegExp.prototype.exec global g flag loop collects match indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /test/g;
      const str: string = "test test test";
      const results: number[] = [];
      let match: RegExpExecArray | null;

      while ((match = re.exec(str)) !== null) {
        results.push(match.index);
      }

      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(5);
      expect(results[2]).assertEqual(10);
    });
  });
}
