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

export default function execReturnTypeTest() {
  describe('Match_Result_Type_Tests', () => {
    /**
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURNTYPE_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec returns array-like object with index and input types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /test/;
      const result = re.exec("test");
      expect(Array.isArray(result)).assertTrue();
      expect(typeof result?.index).assertEqual("number");
      expect(typeof result?.input).assertEqual("string");
    });

    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURNTYPE_TEST_0200
     * @tc.desc   Test RegExp.prototype.exec returns null on failure and lastIndex unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /test/;
      const result = re.exec("hello");
      expect(result).assertEqual(null);
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURNTYPE_TEST_0300
    * @tc.desc   Test placeholder for enumerable properties on exec result (commented checks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /(a)(b)/;
      const result = re.exec('zab');
      expect(result?.[1]).assertEqual('a');
      expect(result?.[2]).assertEqual('b');
      expect(result?.index).assertEqual(1);
    });
  });
}
