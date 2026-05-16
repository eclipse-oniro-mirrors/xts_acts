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

import { afterAll, afterEach, beforeAll, beforeEach, describe as hypDescribe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import { regexpSymbolMatchAll } from './RegExpHelper';

export default function matchTest003(): void {
  // Zeros, empties, and unicode edges that historically broke matchAll staging.
  hypDescribe('MatchAllComplete_Boundary_Value_Tests', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
    * @tc.name testMatch0165
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2400
     * @tc.desc Test RegExp[Symbol.matchAll] no matches returns empty results array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMatch0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex: RegExp = new RegExp("test", "g");
      const str: string = "hello world";
      const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(results.length).assertEqual(0);
    });

    /**
    * @tc.name testMatch0166
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2500
     * @tc.desc Test RegExp[Symbol.matchAll] no matches iterator done immediately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMatch0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex: RegExp = new RegExp("test", "g");
      const str: string = "hello";
      const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
      const firstNext: IteratorResult<RegExpMatchArray> = iterator.next();
      expect(firstNext.done).assertTrue();
      expect(firstNext.value).assertUndefined();
    });

    /**
    * @tc.name testMatch0167
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2600
     * @tc.desc Test RegExp[Symbol.matchAll] zero-width assertions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMatch0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex: RegExp = new RegExp("\\d(?=\\.)", "g");
      const str: string = "123.456";
      const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(results.length).assertEqual(1);
      expect(results[0][0]).assertEqual("3");
    });

    /**
    * @tc.name testMatch0168
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2700
     * @tc.desc Test RegExp[Symbol.matchAll] empty match returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMatch0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex: RegExp = new RegExp("(?:)", "g");
      const str: string = "abc";
      const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(results.length).assertEqual(4);
      expect(results[0][0]).assertEqual("");
      expect(results[0].index).assertEqual(0);
      expect(results[3].index).assertEqual(3);
    });

    /**
    * @tc.name testMatch0169
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2800
     * @tc.desc Test RegExp[Symbol.matchAll] empty string input returns no matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMatch0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex: RegExp = new RegExp("test", "g");
      const str: string = "";
      const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(results.length).assertEqual(0);
    });

    /**
    * @tc.name testMatch0170
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2900
     * @tc.desc Test RegExp[Symbol.matchAll] empty string with empty match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMatch0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex: RegExp = new RegExp("(?:)", "g");
      const str: string = "";
      const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(results.length).assertEqual(1);
      expect(results[0][0]).assertEqual("");
      expect(results[0].index).assertEqual(0);
    });

    /**
    * @tc.name testMatch0171
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_3000
     * @tc.desc Test RegExp[Symbol.matchAll] single character string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMatch0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex: RegExp = new RegExp("a", "g");
      const str: string = "a";
      const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(results.length).assertEqual(1);
      expect(results[0][0]).assertEqual("a");
    });

    /**
    * @tc.name testMatch0172
     * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_3100
     * @tc.desc Test RegExp[Symbol.matchAll] special unicode characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testMatch0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emoji = String.fromCodePoint(0x1F600);
      const regex: RegExp = new RegExp(emoji, 'gu');
      const str: string = 'Hello ' + emoji + ' World';
      const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
      expect(results.length).assertEqual(1);
      expect(results[0][0]).assertEqual(emoji);
    });
  });
}

