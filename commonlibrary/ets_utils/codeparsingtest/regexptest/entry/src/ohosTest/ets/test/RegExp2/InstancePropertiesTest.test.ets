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
  assignSourceStrictStillOriginal,
  regexpWithDFlagHasIndicesTrue,
  regexpLiteralWithoutDNotHasIndices
} from './RegExpHelper';

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

export default function instancePropertiesTest() {
  describe('Instance_Properties', () => {
    /**
     * @tc.name testRegExpInstance0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0100
     * @tc.desc   Test source abc i and dollar plus g
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex1 = new RegExp('abc', 'i');
      const regex2 = new RegExp('\\d+', 'g');
      const regex3 = new RegExp('\\w+');
      expect(regex1.source).assertEqual('abc');
      expect(regex2.source).assertEqual('\\d+');
      expect(regex3.source).assertEqual('\\w+');
    });

    /**
     * @tc.name testRegExpInstance0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0200
     * @tc.desc   Test source readonly strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(assignSourceStrictStillOriginal()).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0300
     * @tc.desc   Test flags gim and empty pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex1 = /abc/gim;
      const regex2 = /test/;
      expect(regex1.flags).assertEqual('gim');
      expect(regex2.flags).assertEqual('');
    });

    /**
     * @tc.name testRegExpInstance0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0900
     * @tc.desc   Test s flag unsupported when dotAll not available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('hello', 's')) {
        return;
      }
      expect(supportsRegExp('hello', 's')).assertFalse();
    });

    /**
     * @tc.name testRegExpInstance0109
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0800
     * @tc.desc   Test flags include s when dotAll supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsRegExp('hello', 's')) {
        return;
      }
      const regex3 = new RegExp('hello', 's');
      expect(regex3.flags.indexOf('s') >= 0).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0400
     * @tc.desc   Test global ignoreCase multiline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(/test/g.global).assertTrue();
      expect(/test/.global).assertFalse();
      expect(/test/i.ignoreCase).assertTrue();
      expect(/test/.ignoreCase).assertFalse();
      expect(/test/m.multiline).assertTrue();
      expect(/test/.multiline).assertFalse();
    });

    /**
     * @tc.name testRegExpInstance0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0500
     * @tc.desc   Test dotAll true when s flag supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsRegExp('test', 's')) {
        return;
      }
      expect(new RegExp('test', 's').dotAll).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0108
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0700
     * @tc.desc   Test dotAll sticky unicode on literals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(/test/.dotAll).assertFalse();
      expect(/test/y.sticky).assertTrue();
      expect(/test/.sticky).assertFalse();
      expect(/test/u.unicode).assertTrue();
      expect(/test/.unicode).assertFalse();
    });

    /**
     * @tc.name testRegExpInstance0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0600
     * @tc.desc   Test hasIndices true when d flag supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsRegExp('test', 'd')) {
        return;
      }
      expect(regexpWithDFlagHasIndicesTrue()).assertTrue();
    });

    /**
     * @tc.name testRegExpInstance0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_1100
     * @tc.desc   Test literal without d flag hasIndices false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstance0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpLiteralWithoutDNotHasIndices()).assertTrue();
    });
  });
}


