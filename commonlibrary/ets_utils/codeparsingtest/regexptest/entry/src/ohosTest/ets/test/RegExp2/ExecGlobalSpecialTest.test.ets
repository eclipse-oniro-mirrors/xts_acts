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

export default function execGlobalSpecialTest() {
  describe('Global_Flag_Special_Case_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBALSPECIAL_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec zero-length matches with ^ multiline global
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /^/gm;
      const str: string = "line1\nline2\nline3";
      let result: RegExpExecArray | null = null;
      let count: number = 0;
      while ((result = re.exec(str)) !== null && count < 10) {
        count++;
        if (result[0].length === 0) {
          re.lastIndex++;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBALSPECIAL_TEST_0200
     * @tc.desc   Test RegExp lastIndex reset when exec fails on a new string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /ab*/g;

      const result1: RegExpExecArray | null = re.exec("abbc");
      expect(result1?.[0]).assertEqual("abb");
      expect(re.lastIndex).assertEqual(3);

      const result2: RegExpExecArray | null = re.exec("xyz");
      expect(result2).assertEqual(null);
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBALSPECIAL_TEST_0300
     * @tc.desc   Test manual lastIndex reset before repeated exec on same string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /foo/g;
      const str: string = "foo foo foo";
      re.exec(str);
      expect(re.lastIndex).assertEqual(3);
      re.lastIndex = 0;
      re.exec(str);
      expect(re.lastIndex).assertEqual(3);
    });
  });
}
