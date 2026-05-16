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

export default function testLastIndexTest() {
  describe('lastIndex', () => {
    /**
     * @tc.name testLastIndex0210
     * @tc.number SUB_COMMONLIBRARY_REGEXP_LASTINDEX_TEST_0100
     * @tc.desc   Test global lastIndex update and reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndex0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = 'foo bar foo';
      const re = /foo/g;
      expect(re.lastIndex).assertEqual(0);
      expect(re.test(str)).assertTrue();
      expect(re.lastIndex).assertEqual(3);
      expect(re.test(str)).assertTrue();
      expect(re.lastIndex).assertEqual(11);
      expect(re.test(str)).assertFalse();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testLastIndex0211
     * @tc.number SUB_COMMONLIBRARY_REGEXP_LASTINDEX_TEST_0200
     * @tc.desc   Test sticky lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndex0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = 'foo foo';
      const re = /foo/y;
      re.lastIndex = 0;
      expect(re.test(str)).assertTrue();
      re.lastIndex = 4;
      expect(re.test(str)).assertTrue();
      re.lastIndex = 2;
      expect(re.test(str)).assertFalse();
    });

    /**
     * @tc.name testLastIndex0212
     * @tc.number SUB_COMMONLIBRARY_REGEXP_LASTINDEX_TEST_0300
     * @tc.desc   Test manual reset lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndex0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = 'foo foo';
      const re = /foo/g;
      expect(re.test(str)).assertTrue();
      re.lastIndex = 0;
      expect(re.test(str)).assertTrue();
    });

    /**
     * @tc.name testLastIndex0213
     * @tc.number SUB_COMMONLIBRARY_REGEXP_LASTINDEX_TEST_0400
     * @tc.desc   Test independence between instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndex0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = 'foo bar foo';
      const r1 = /foo/g;
      const r2 = /foo/g;
      r1.test(str);
      r1.test(str);
      r2.test(str);
      expect(r1.lastIndex).assertEqual(11);
      expect(r2.lastIndex).assertEqual(3);
    });

    /**
     * @tc.name testLastIndex0214
     * @tc.number SUB_COMMONLIBRARY_REGEXP_LASTINDEX_TEST_0500
     * @tc.desc   Test lastIndex extremes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndex0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = 'test';
      const re = /test/g;
      re.lastIndex = -1;
      expect(re.test(str)).assertTrue();
      re.lastIndex = 100;
      expect(re.test(str)).assertFalse();
      re.lastIndex = Number.NaN;
      expect(re.test(str)).assertTrue();
      re.lastIndex = Number.POSITIVE_INFINITY;
      expect(re.test(str)).assertFalse();
    });

    /**
     * @tc.name testLastIndex0215
     * @tc.number SUB_COMMONLIBRARY_REGEXP_LASTINDEX_TEST_0600
     * @tc.desc   Test non global ignores lastIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndex0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = 'foo foo';
      const re = /foo/;
      re.lastIndex = 5;
      re.test(str);
      expect(re.lastIndex).assertEqual(5);
    });

    /**
     * @tc.name testLastIndex0216
     * @tc.number SUB_COMMONLIBRARY_REGEXP_LASTINDEX_TEST_0700
     * @tc.desc   Test lastIndex affects return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndex0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = 'foo bar';
      const re = /foo/g;
      re.lastIndex = 4;
      expect(re.test(str)).assertFalse();
      expect(re.lastIndex).assertEqual(0);
    });
  });
}


