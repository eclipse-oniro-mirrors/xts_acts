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

export default function execGlobalTest() {
  describe('Global_Matching_State_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec updates lastIndex for global pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /foo/g;
      let result = re.exec("foo foo");
      expect(result?.index).assertEqual(0);
      expect(re.lastIndex).assertEqual(3);

      result = re.exec("foo foo");
      expect(result?.index).assertEqual(4);
      expect(re.lastIndex).assertEqual(7);
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec traverses multiple matches with g flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /ab*/g;
      const str = "abbcdefabh";
      let result: RegExpExecArray | null;
      let count = 0;
      while ((result = re.exec(str)) !== null) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec sticky y flag requires match at lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /foo/y;
      const str = "foo foo";
      re.lastIndex = 0;
      let result = re.exec(str);
      expect(result?.index).assertEqual(0);

      re.lastIndex = 1;
      result = re.exec(str);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0400
     * @tc.desc   Test RegExp lastIndex resets to 0 on global match failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /abc/g;
      const str = "xyz";
      re.exec(str);
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0500
     * @tc.desc   Test RegExp non-global exec does not advance lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /foo/;
      re.exec("foo foo");
      expect(re.lastIndex).assertEqual(0);
    });
  });
}
