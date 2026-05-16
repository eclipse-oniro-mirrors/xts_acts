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

class ExecReturn {
  static execHello(input: string): RegExpExecArray | null {
    return /hello/.exec(input);
  }

  static execNamedHello(input: string): RegExpExecArray | null {
    return /(?<word>hello)/.exec(input);
  }
}

export default function execReturnTest() {
  describe('Return_Value_Property_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0100
     * @tc.desc   Test RegExpExecArray index property after exec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecReturn.execHello("say hello world");
      expect(result?.index).assertEqual(4);
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0200
     * @tc.desc   Test RegExpExecArray input property equals original string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /hello/;
      const result = re.exec("hello world");
      expect(result?.input).assertEqual("hello world");
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0300
     * @tc.desc   Test RegExpExecArray groups property for named capture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = ExecReturn.execNamedHello("hello world");
      expect(result?.groups?.word).assertEqual("hello");
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0400
     * @tc.desc   Test RegExpExecArray indices property when d flag is set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsRegExp('(?<word>hello)', 'd')) {
        return;
      }
      const re: RegExp = new RegExp('(?<word>hello)', 'd');
      const result: RegExpExecArrayWithIndices | null = re.exec('hello world') as RegExpExecArrayWithIndices | null;
      expect(result !== null).assertTrue();
      expect(result!.indices !== undefined).assertTrue();
      expect(result!.indices![0][0]).assertEqual(0);
      expect(result!.indices![0][1]).assertEqual(5);
    });

    /**
     * @tc.name testExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0500
     * @tc.desc   Test named capture exec full match string without d flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = new RegExp('(?<word>hello)');
      const result: RegExpExecArray | null = re.exec('hello world');
      expect(result?.[0]).assertEqual('hello');
    });
  });
}
