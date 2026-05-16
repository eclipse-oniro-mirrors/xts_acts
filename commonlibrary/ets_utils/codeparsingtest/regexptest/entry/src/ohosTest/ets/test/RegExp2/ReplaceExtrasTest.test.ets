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
import {
  stringReplaceCustomSymbolReplace,
  regexpReplaceCallUndefinedThrows,
  regexpReplaceCallNullThrows
} from './RegExpHelper';

export default function replaceExtrasTest() {
  describe('Replace_Symbol_Replace', () => {
    /**
     * @tc.name testReplace0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTRAS_TEST_0100
     * @tc.desc   Test custom Symbol replace object for String replace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(stringReplaceCustomSymbolReplace()).assertTrue();
    });

    /**
     * @tc.name testReplace0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTRAS_TEST_0200
     * @tc.desc   Test Symbol replace undefined this throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpReplaceCallUndefinedThrows()).assertTrue();
    });

    /**
     * @tc.name testReplace0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_EXTRAS_TEST_0300
     * @tc.desc   Test Symbol replace null this throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReplace0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpReplaceCallNullThrows()).assertTrue();
    });
  });
}

