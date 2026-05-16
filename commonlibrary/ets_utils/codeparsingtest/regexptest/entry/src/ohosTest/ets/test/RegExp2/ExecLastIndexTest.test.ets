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

export default function execLastIndexTest() {
  describe('LastIndex_Behavior_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_LASTINDEX_TEST_0100
     * @tc.desc   Test lastIndex initial value 0 for non-global RegExp after exec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /test/;
      expect(re.lastIndex).assertEqual(0);
      re.exec("test");
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_LASTINDEX_TEST_0200
     * @tc.desc   Test sticky RegExp exec honors lastIndex for next attempt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /test/y;
      const str = "test test";
      re.lastIndex = 0;
      const result1 = re.exec(str);
      expect(result1?.index).assertEqual(0);

      re.lastIndex = 5;
      const result2 = re.exec(str);
      expect(result2?.index).assertEqual(5);

      re.lastIndex = 1;
      const result3 = re.exec(str);
      expect(result3).assertEqual(null);
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_LASTINDEX_TEST_0300
     * @tc.desc   Test global exec returns null when lastIndex exceeds string length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /test/g;
      re.lastIndex = 100;
      const result = re.exec("test");
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_LASTINDEX_TEST_0400
     * @tc.desc   Test negative lastIndex is treated as zero for global exec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /test/g;
      re.lastIndex = -1;
      const result = re.exec("test");
      expect(result?.index).assertEqual(0);
    });
  });
}
