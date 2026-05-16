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

interface DateGroups {
  year?: string;
  month?: string;
  day?: string;
}

interface UrlParameterGroups {
  name?: string;
  value?: string;
}

interface LogEntryGroups {
  date?: string;
  level?: string;
  message?: string;
}

interface HtmlTagGroups {
  tagName?: string;
  content?: string;
}

interface CustomObject {
  toString: () => string;
}

export default function matchAllAdvancedTest() {

    describe('MatchAll_Special_Pattern_Tests', () => {
      /**
       * @tc.name testMatchAll0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0100
       * @tc.desc   Test RegExp[Symbol.matchAll] positive lookahead assertion
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d+(?= dollars)/g;
        const str: string = "100 dollars, 200 dollars";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("100");
        expect(results[1][0]).assertEqual("200");
      });

      /**
       * @tc.name testMatchAll0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0200
       * @tc.desc   Test RegExp[Symbol.matchAll] negative lookahead assertion
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d{3}(?! dollars)/g;
        const str: string = "100 dollars, 200 euro";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("200");
      });

      /**
       * @tc.name testMatchAll0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0300
       * @tc.desc   Test RegExp[Symbol.matchAll] line start anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /^test/gm;
        const str: string = "test\ntest";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(2);
        expect(results[0].index).assertEqual(0);
        expect(results[1].index).assertEqual(5);
      });

      /**
       * @tc.name testMatchAll0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0400
       * @tc.desc   Test RegExp[Symbol.matchAll] line end anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test$/gm;
        const str: string = "test\ntest";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(2);
        expect(results[0].index).assertEqual(0);
        expect(results[1].index).assertEqual(5);
      });

      /**
       * @tc.name testMatchAll0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0500
       * @tc.desc   Test RegExp[Symbol.matchAll] word boundary matching
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\btest\b/g;
        const str: string = "test testing";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("test");
        expect(results[0].index).assertEqual(0);
      });

      /**
       * @tc.name testMatchAll0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0600
       * @tc.desc   Test RegExp[Symbol.matchAll] emoji character matching
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const emoji = String.fromCodePoint(0x1F600);
        const regex: RegExp = new RegExp(emoji, 'g');
        const str: string = `Hello ${emoji} World`;
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual(emoji);
      });
    });

    describe('Comparison_With_Other_Methods_Tests', () => {
      /**
       * @tc.name testMatchAll0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0700
       * @tc.desc   Test matchAll results match an exec loop for global regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern: string = "test";
        const regex1: RegExp = new RegExp(pattern, "g");
        const regex2: RegExp = new RegExp(pattern, "g");
        const str: string = "test test";

        const execResults: RegExpExecArray[] = [];
        let match: RegExpExecArray | null;
        while ((match = regex1.exec(str)) !== null) {
          execResults.push(match);
        }

        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex2, str);
        const matchAllResults: RegExpMatchArray[] = Array.from(iterator);

        expect(execResults.length).assertEqual(matchAllResults.length);
        expect(execResults[0][0]).assertEqual(matchAllResults[0][0]);
        expect(execResults[1][0]).assertEqual(matchAllResults[1][0]);
      });

      /**
       * @tc.name testMatchAll0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0800
       * @tc.desc   Test matchAll preserves capture groups compared with string match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /t(e)(st(\d?))/g;
        const str: string = "test1test2";

        const matchResult: RegExpMatchArray | null = str.match(regex);
        expect(matchResult?.[0]).assertEqual("test1");
        expect(matchResult?.[1]).assertEqual("test2");

        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const matchAllResults: RegExpMatchArray[] = Array.from(iterator);
        expect(matchAllResults[0].length).assertEqual(4);
        expect(matchAllResults[0][1]).assertEqual("e");
        expect(matchAllResults[0][3]).assertEqual("1");
      });

      /**
       * @tc.name testMatchAll0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0900
       * @tc.desc   Test matchAll does not change lastIndex unlike exec
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex1: RegExp = /test/g;
        const regex2: RegExp = /test/g;
        const str: string = "test test";

        regex1.exec(str);
        const lastIndexAfterExec: number = regex1.lastIndex;
        expect(lastIndexAfterExec).assertEqual(4);

        const initialLastIndex: number = regex2.lastIndex;
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex2, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        const lastIndexAfterMatchAll: number = regex2.lastIndex;
        expect(lastIndexAfterMatchAll).assertEqual(initialLastIndex);
        expect(results.length).assertEqual(2);
      });
    });

    describe('This_Value_Tests', () => {
      /**
       * @tc.name testMatchAll0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1000
       * @tc.desc   Test RegExp[Symbol.matchAll] with RegExp object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        const str: string = "test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const firstResult: IteratorResult<RegExpMatchArray> = iterator.next();
        expect(firstResult.done).assertFalse();
        expect(firstResult.value[0]).assertEqual("test");
      });
    });

    describe('HasIndices_Flag_Tests', () => {
      /**
       * @tc.name testMatchAll0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1100
       * @tc.desc   Test indices is undefined without d flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d+/g;
        const str: string = "123 456";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results[0]).not().assertUndefined();
        expect(results[0][0]).assertEqual("123");
        expect(results[1][0]).assertEqual("456");
      });

      /**
       * @tc.name testMatchAll0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1200
       * @tc.desc   Test d flag behavior when it is not supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\w+/g;
        const str: string = "a b";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("a");
        expect(results[1][0]).assertEqual("b");
      });
    });

    describe('Inheritance_Custom_Tests', () => {
      /**
       * @tc.name testMatchAll0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1300
       * @tc.desc   Test RegExp[Symbol.matchAll] RegExp subclass case
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("test");
        expect(results[1][0]).assertEqual("test");
      });
    });

    describe('String_Parameter_Type_Tests', () => {
      /**
       * @tc.name testMatchAll0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1400
       * @tc.desc   Test RegExp[Symbol.matchAll] converts number parameter to string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /1/g;
        const num: number = 123;
        const str: string = String(num);
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("1");
      });

      /**
       * @tc.name testMatchAll0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1500
       * @tc.desc   Test RegExp[Symbol.matchAll] converts object parameter to string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /object/g;
        interface EmptyObject {
        }
        const obj: EmptyObject = {};
        const str: string = String(obj);
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("object");
      });

      /**
       * @tc.name testMatchAll0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1600
       * @tc.desc   Test RegExp[Symbol.matchAll] converts custom object via toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const obj: CustomObject = {
          toString: (): string => {
            return "test 123";
          }
        };

        const regex: RegExp = /test/g;
        const str: string = String(obj);
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("test");
      });
    });

    describe('Real_World_Application_Tests', () => {
      /**
       * @tc.name testMatchAll0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1700
       * @tc.desc   Test RegExp[Symbol.matchAll] HTML tag extraction
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /<(\w+)>([^<]*)<\/\1>/g;
        const html: string = "<div>content</div><span>text</span>";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, html);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
        expect(results[0][1]).assertEqual("div");
        expect(results[0][2]).assertEqual("content");
        expect(results[1][1]).assertEqual("span");
        expect(results[1][2]).assertEqual("text");
      });

      /**
       * @tc.name testMatchAll0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1800
       * @tc.desc   Test RegExp[Symbol.matchAll] URL query parameter extraction
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /[?&](\w+)=([^&]+)/g;
        const url: string = "https://example.com?name=John&age=25";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, url);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
        expect(results[0][1]).assertEqual("name");
        expect(results[0][2]).assertEqual("John");
        expect(results[1][1]).assertEqual("age");
        expect(results[1][2]).assertEqual("25");
      });

      /**
       * @tc.name testMatchAll0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1900
       * @tc.desc   Test RegExp[Symbol.matchAll] log format parsing
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\[(\d{4}-\d{2}-\d{2})\]\s*\[(\w+)\]\s*(.+)/g;
        const log: string = "[2024-01-15] [ERROR] Database connection failed";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, log);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(1);
        expect(results[0][1]).assertEqual("2024-01-15");
        expect(results[0][2]).assertEqual("ERROR");
        expect(results[0][3]).assertEqual("Database connection failed");
      });

      /**
       * @tc.name testMatchAll0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2000
       * @tc.desc   Test RegExp[Symbol.matchAll] date extraction
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\b(\d{4})-(\d{2})-(\d{2})\b/g;
        const text: string = "Dates: 2024-01-15, 2023-12-25";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, text);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("2024-01-15");
        expect(results[1][0]).assertEqual("2023-12-25");
      });

      /**
       * @tc.name testMatchAll0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2100
       * @tc.desc   Test RegExp[Symbol.matchAll] price extraction
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\$\s*(\d+(?:\.\d{2})?)/g;
        const text: string = "Prices: $19.99, $100, $5.50";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, text);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(3);
        expect(results[0][0]).assertEqual("$19.99");
        expect(results[1][0]).assertEqual("$100");
        expect(results[2][0]).assertEqual("$5.50");
      });

      /**
       * @tc.name testMatchAll0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2200
       * @tc.desc   Test RegExp[Symbol.matchAll] phone number extraction
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\b\d{3}[-.\s]?\d{3}[-.\s]?\d{4}\b/g;
        const text: string = "Call us at 123-456-7890 or 555.123.4567";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, text);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("123-456-7890");
        expect(results[1][0]).assertEqual("555.123.4567");
      });

      /**
       * @tc.name testMatchAll0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2300
       * @tc.desc   Test RegExp[Symbol.matchAll] named capture groups extraction
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/g;
        const str: string = "2024-01-15 and 2023-12-25";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
        if (results[0].groups) {
          const groups1: DateGroups = results[0].groups as DateGroups;
          expect(groups1.year).assertEqual("2024");
          expect(groups1.month).assertEqual("01");
          expect(groups1.day).assertEqual("15");
        }
        if (results[1].groups) {
          const groups2: DateGroups = results[1].groups as DateGroups;
          expect(groups2.year).assertEqual("2023");
          expect(groups2.month).assertEqual("12");
          expect(groups2.day).assertEqual("25");
        }
      });
    });

    describe('Complex_Scenario_Tests', () => {
      /**
       * @tc.name testMatchAll0123
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2400
       * @tc.desc   Test RegExp[Symbol.matchAll] complex nested groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /((a|b)(c|d))+/g;
        const str: string = "ac bd ad bc";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(4);
        expect(results[0][0]).assertEqual("ac");
        expect(results[0][1]).assertEqual("ac");
        expect(results[0][2]).assertEqual("a");
        expect(results[0][3]).assertEqual("c");
        expect(results[1][0]).assertEqual("bd");
        expect(results[3][0]).assertEqual("bc");
      });

      /**
       * @tc.name testMatchAll0124
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2500
       * @tc.desc   Test RegExp[Symbol.matchAll] alternation patterns
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /cat|dog|bird|fish/g;
        const str: string = "cat dog bird fish cat";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(5);
        expect(results[0][0]).assertEqual("cat");
        expect(results[1][0]).assertEqual("dog");
        expect(results[2][0]).assertEqual("bird");
        expect(results[3][0]).assertEqual("fish");
        expect(results[4][0]).assertEqual("cat");
      });

      /**
       * @tc.name testMatchAll0125
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2600
       * @tc.desc   Test RegExp[Symbol.matchAll] multiline text matching
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /^test/gm;
        const str: string = "test\nline2\ntest\nline4";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
        expect(results[0].index).assertEqual(0);
        expect(results[1].index).assertEqual(11);
      });

      /**
       * @tc.name testMatchAll0126
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2700
       * @tc.desc   Test RegExp[Symbol.matchAll] dynamic regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern: string = "test";
        const regex: RegExp = new RegExp(pattern, "g");
        const str: string = "test test test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(3);
      });

      /**
       * @tc.name testMatchAll0127
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2800
       * @tc.desc   Test RegExp[Symbol.matchAll] user input pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const userInput: string = "test";
        const regex: RegExp = new RegExp(userInput, "gi");
        const str: string = "TEST test Test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(3);
      });

      /**
       * @tc.name testMatchAll0128
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2900
       * @tc.desc   Test RegExp[Symbol.matchAll] many matches results
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d/g;
        const str: string = "0123456789";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(10);
        expect(results[0][0]).assertEqual("0");
        expect(results[9][0]).assertEqual("9");
      });
    });

    describe('Iterator_Boundary_Tests', () => {
      /**
       * @tc.name testMatchAll0129
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3000
       * @tc.desc   Test RegExp[Symbol.matchAll] early termination in for-of
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d+/g;
        const str: string = "123 456 789";
        let count: number = 0;

        for (const match of regexpSymbolMatchAll(regex, str)) {
          count++;
          if (count >= 2) {
            break;
          }
        }

        expect(count).assertEqual(2);
      });

      /**
       * @tc.name testMatchAll0130
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3100
       * @tc.desc   Test RegExp[Symbol.matchAll] early return first match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d+/g;
        const str: string = "123 456 789";
        let first: RegExpMatchArray | undefined = undefined;
        for (const match of regexpSymbolMatchAll(regex, str)) {
          first = match;
          break;
        }
        expect(first).not().assertUndefined();
        if (first) {
          expect(first[0]).assertEqual("123");
        }
      });
    });

    describe('RegExp_Constructor_Tests', () => {
      /**
       * @tc.name testMatchAll0131
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3200
       * @tc.desc   Test RegExp[Symbol.matchAll] new RegExp form
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("test");
        expect(results[1][0]).assertEqual("test");
      });

      /**
       * @tc.name testMatchAll0132
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3300
       * @tc.desc   Test RegExp[Symbol.matchAll] constructor special escape characters
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = new RegExp("\\d+", "g");
        const str: string = "123 456";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("123");
        expect(results[1][0]).assertEqual("456");
      });

      /**
       * @tc.name testMatchAll0133
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3400
       * @tc.desc   Test RegExp[Symbol.matchAll] dynamic patterns constructed at runtime
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const keywords: string[] = ["cat", "dog", "bird"];
        const pattern: string = keywords.join("|");
        const regex: RegExp = new RegExp(pattern, "gi");
        const str: string = "Cat Dog Bird";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(3);
        expect(results[0][0]).assertEqual("Cat");
        expect(results[1][0]).assertEqual("Dog");
        expect(results[2][0]).assertEqual("Bird");
      });
    });

}
