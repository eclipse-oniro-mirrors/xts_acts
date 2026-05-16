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
  stringMatchAllNonGlobalThrows,
  stringPrimitiveSymbolMatchAllTypeError,
  nullSymbolMatchAllThrows,
  stringMatchAllEqualsRegExpSymbolMatchAllCount
} from './RegExpHelper';

export default function matchAllExtrasTest() {
  describe('MatchAll_Protocol_And_Symbol', () => {
    /**
     * @tc.name testMatchAll0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EXTRAS_TEST_0100
     * @tc.desc   Test String.matchAll throws TypeError when RegExp is not global
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(stringMatchAllNonGlobalThrows()).assertTrue();
    });

    /**
     * @tc.name testMatchAll0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EXTRAS_TEST_0200
     * @tc.desc   Test String.matchAll result count equals RegExp[Symbol.matchAll] count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(stringMatchAllEqualsRegExpSymbolMatchAllCount()).assertTrue();
    });

    /**
     * @tc.name testMatchAll0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EXTRAS_TEST_0300
     * @tc.desc   Test primitive string without callable Symbol.matchAll throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(stringPrimitiveSymbolMatchAllTypeError()).assertTrue();
    });

    /**
     * @tc.name testMatchAll0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EXTRAS_TEST_0400
     * @tc.desc   Test null receiver for Symbol.matchAll throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(nullSymbolMatchAllThrows()).assertTrue();
    });
  });
}
