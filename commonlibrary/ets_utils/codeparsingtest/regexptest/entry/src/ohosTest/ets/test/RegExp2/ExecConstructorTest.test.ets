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

export default function execConstructorTest() {
  describe('Regex_Constructor_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CONSTRUCTOR_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec with pattern from RegExp constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = new RegExp("hello");
      const result = re.exec("hello world");
      expect(result?.[0]).assertEqual("hello");
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CONSTRUCTOR_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec with regex literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /hello/;
      const result = re.exec("hello world");
      expect(result?.[0]).assertEqual("hello");
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CONSTRUCTOR_TEST_0300
     * @tc.desc   Test RegExp.prototype.exec with dynamic pattern and ignoreCase flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const pattern = "hello";
      const flags = "i";
      const re = new RegExp(pattern, flags);
      const result = re.exec("HELLO");
      expect(result?.[0]).assertEqual("HELLO");
    });
  });
}
