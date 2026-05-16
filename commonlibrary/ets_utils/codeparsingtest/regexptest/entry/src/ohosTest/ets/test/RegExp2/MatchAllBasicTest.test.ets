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
import { regexpSymbolMatchAll } from './RegExpHelper';

export default function matchAllBasicTest() {
  describe('MatchAll_Basic_Function_Tests', () => {
    /**
     * @tc.name testMatchAll0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0100
     * @tc.desc   Test RegExp[Symbol.matchAll] basic call returns iterator matches and indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex: RegExp = /t(e)(st(\d?))/g;
      const str: string = "test1test2";
      const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
      const results: RegExpMatchArray[] = Array.from(iterator, (m: RegExpMatchArray) => m);
      expect(results[0][0]).assertEqual("test1");
      expect(results[1][0]).assertEqual("test2");
    });

    /**
     * @tc.name testMatchAll0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0200
     * @tc.desc   Test RegExp[Symbol.matchAll] equivalence with String.matchAll for global regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex: RegExp = /test/g;
      const str: string = "test test test";
      const result: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name testMatchAll0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0300
     * @tc.desc   Test RegExp[Symbol.matchAll] returns an iterator object and can be advanced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex: RegExp = /test/g;
      const str: string = "test test";
      const result: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);

      const firstResult: IteratorResult<RegExpMatchArray> = result.next();
      expect(firstResult.done).assertFalse();
      expect(firstResult.value?.[0]).assertEqual("test");
    });

    /**
     * @tc.name testMatchAll0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0400
     * @tc.desc   Test match results structure is consistent with exec-style match data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex: RegExp = /t(e)(st(\d?))/g;
      const str: string = "test1";
      const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
      const matchResult: IteratorResult<RegExpMatchArray> = iterator.next();

      expect(matchResult.done).assertFalse();
      const match: RegExpMatchArray = matchResult.value as RegExpMatchArray;

      expect(Array.isArray(match)).assertTrue();
      expect(match[0]).assertEqual("test1");
      expect(match.index).assertEqual(0);
      expect(match.input).assertEqual(str);
    });

    /**
     * @tc.name testMatchAll0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0500
     * @tc.desc   Test match object properties including groups behavior when no named groups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex: RegExp = /test/g;
      const str: string = "test";
      const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
      const match: RegExpMatchArray = iterator.next().value as RegExpMatchArray;

      expect(match[0]).assertEqual("test");
      expect(match.index).assertEqual(0);
      expect(match.input).assertEqual(str);
      expect(match.length).assertEqual(1);

      expect(match.groups).assertUndefined();
    });

    /**
     * @tc.name testMatchAll0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0600
     * @tc.desc   Test non-global RegExp returns a single match from matchAll protocol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex: RegExp = /test/;
      const str: string = "test test";
      const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
      const firstMatch: IteratorResult<RegExpMatchArray> = iterator.next();
      const secondMatch: IteratorResult<RegExpMatchArray> = iterator.next();

      expect(firstMatch.done).assertFalse();
      expect((firstMatch.value as RegExpMatchArray)[0]).assertEqual("test");
      expect(secondMatch.done).assertTrue();
    });

    /**
     * @tc.name testMatchAll0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0700
     * @tc.desc   Test global g RegExp matchAll returns all matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex: RegExp = /test/g;
      const str: string = "test test test";
      const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(results.length).assertEqual(3);
    });

    /**
     * @tc.name testMatchAll0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0800
     * @tc.desc   Test non-global matchAll returns one match for a different pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMatchAll0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex: RegExp = /\d+/;
      const str: string = "123 456 789";
      const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(results.length).assertEqual(1);
      expect(results[0][0]).assertEqual("123");
    });
  });
}
