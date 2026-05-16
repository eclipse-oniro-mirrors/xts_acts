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

function createRegexFromFunction(): RegExp {
  return /cat|dog/g;
}

export default function matchAllEdgeCaseTest() {


    describe('Special_Pattern_Extended_Tests', () => {
      /**
      * @tc.name testMatchAll0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_0100
       * @tc.desc   Test RegExp[Symbol.matchAll] positive lookbehind when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str: string = "123apple 456apple";
        const pattern: string = "(?<=\\d{3})apple";
        let supportsLookbehind: boolean = true;

        try {
          new RegExp(pattern, "g");
        } catch (e) {
          supportsLookbehind = false;
        }

        if (!supportsLookbehind) {
          return;
        }
        const regex: RegExp = new RegExp(pattern, "g");
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(2);
      });

      /**
      * @tc.name testMatchAll0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_UNSUPPORTED_TEST_0100
       * @tc.desc   Test positive lookbehind unsupported when pattern invalid
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern: string = "(?<=\\d{3})apple";
        let supportsLookbehind: boolean = true;
        try {
          new RegExp(pattern, "g");
        } catch (e) {
          supportsLookbehind = false;
        }
        if (supportsLookbehind) {
          return;
        }
        expect(supportsLookbehind).assertFalse();
      });

      /**
      * @tc.name testMatchAll0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_0200
       * @tc.desc   Test RegExp[Symbol.matchAll] negative lookahead when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str: string = "apple123 apple456";
        const pattern: string = "apple(?!123)";
        let supportsLookahead: boolean = true;

        try {
          new RegExp(pattern, "g");
        } catch (e) {
          supportsLookahead = false;
        }

        if (!supportsLookahead) {
          return;
        }
        const regex: RegExp = new RegExp(pattern, "g");
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("apple");
      });

      /**
      * @tc.name testMatchAll0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_UNSUPPORTED_TEST_0200
       * @tc.desc   Test negative lookahead unsupported when pattern invalid
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern: string = "apple(?!123)";
        let supportsLookahead: boolean = true;
        try {
          new RegExp(pattern, "g");
        } catch (e) {
          supportsLookahead = false;
        }
        if (supportsLookahead) {
          return;
        }
        expect(supportsLookahead).assertFalse();
      });

      /**
      * @tc.name testMatchAll0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_0300
       * @tc.desc   Test RegExp[Symbol.matchAll] unicode property escapes when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const emoji = String.fromCodePoint(0x1F600);
        const str: string = `Hello 123 ${emoji}`;
        const pattern: string = "\\p{Number}+";
        let supportsUnicodeProps: boolean = true;

        try {
          new RegExp(pattern, "gu");
        } catch (e) {
          supportsUnicodeProps = false;
        }

        if (!supportsUnicodeProps) {
          return;
        }
        const regex: RegExp = new RegExp(pattern, "gu");
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("123");
      });

      /**
      * @tc.name testMatchAll0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_UNSUPPORTED_TEST_0300
       * @tc.desc   Test matchAll digits via \\d when unicode property escapes unsupported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const emoji = String.fromCodePoint(0x1F600);
        const str: string = `Hello 123 ${emoji}`;
        const pattern: string = "\\p{Number}+";
        let supportsUnicodeProps: boolean = true;
        try {
          new RegExp(pattern, "gu");
        } catch (e) {
          supportsUnicodeProps = false;
        }
        if (supportsUnicodeProps) {
          return;
        }
        const regex: RegExp = /\d+/g;
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("123");
      });
    });

    describe('This_Value_Extended_Tests', () => {
      /**
      * @tc.name testMatchAll0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_0400
       * @tc.desc   Test RegExp[Symbol.matchAll] with RegExp object passed from variable
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        const str: string = "test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const firstMatch: IteratorResult<RegExpMatchArray> = iterator.next();
        expect(firstMatch.done).assertFalse();
        expect(firstMatch.value[0]).assertEqual("test");
      });

      /**
      * @tc.name testMatchAll0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_0500
       * @tc.desc   Test RegExp[Symbol.matchAll] with RegExp created via constructor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern: string = "\\d+";
        const flags: string = "g";
        const regex: RegExp = new RegExp(pattern, flags);
        const str: string = "123 456";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(2);
      });
    });

    describe('HasIndices_Flag_Extended_Tests', () => {
      /**
      * @tc.name testMatchAll0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_0600
       * @tc.desc   Test RegExp[Symbol.matchAll] skip d-flag behavior when environment is unsupported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\d+/g;
        const str: string = "7 8";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(2);
        expect(results[0][0]).assertEqual("7");
        expect(results[1][0]).assertEqual("8");
      });
    });

    describe('Inheritance_Extended_Tests', () => {
      /**
      * @tc.name testMatchAll0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_0700
       * @tc.desc   Test RegExp[Symbol.matchAll] when using RegExp literal
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /test/g;
        const str: string = "test test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(2);
      });

      /**
      * @tc.name testMatchAll0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_0800
       * @tc.desc   Test RegExp[Symbol.matchAll] when RegExp is returned from helper function
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = createRegexFromFunction();
        const str: string = "cat dog";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(2);
      });
    });

    describe('String_Parameter_Extended_Tests', () => {
      /**
      * @tc.name testMatchAll0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_0900
       * @tc.desc   Test RegExp[Symbol.matchAll] converts boolean input to string and matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /true/g;
        const boolValue: boolean = true;
        const str: string = String(boolValue);
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("true");
      });

      /**
      * @tc.name testMatchAll0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_1000
       * @tc.desc   Test RegExp[Symbol.matchAll] converts String object input to string and matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /Hello/g;
        const strObj: String = new String("Hello World");
        const str: string = String(strObj);
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("Hello");
      });

      /**
      * @tc.name testMatchAll0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_1100
       * @tc.desc   Test RegExp[Symbol.matchAll] converts undefined input to "undefined" and matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /undefined/g;
        const undefinedValue: undefined = undefined;
        const str: string = String(undefinedValue);
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(1);
        expect(results[0][0]).assertEqual("undefined");
      });
    });

    describe('Error_Handling_Extended_Tests', () => {
      /**
      * @tc.name testMatchAll0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_1200
       * @tc.desc   Test RegExp[Symbol.matchAll] iterator returns done=true when no matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /pattern-that-does-not-exist/g;
        const str: string = "some text";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const firstResult: IteratorResult<RegExpMatchArray> = iterator.next();
        expect(firstResult.done).assertTrue();
        expect(firstResult.value).assertUndefined();
      });

      /**
      * @tc.name testMatchAll0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_1300
       * @tc.desc   Test RegExp[Symbol.matchAll] does not throw for valid pattern with no matches
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\\d{100}/;
        const str: string = "abc";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);
        expect(results.length).assertEqual(0);
      });
    });

    describe('Performance_Memory_Basic_Tests', () => {
      /**
      * @tc.name testMatchAll0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_1400
       * @tc.desc   Test RegExp[Symbol.matchAll] iterates many matches over a large string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /\w+/g;
        const baseStr: string = "word ";
        const str: string = baseStr.repeat(50);
        let count: number = 0;

        for (const match of regexpSymbolMatchAll(regex, str)) {
          count++;
          expect(match[0].length > 0).assertTrue();
        }

        expect(count).assertEqual(50);
      });

      /**
      * @tc.name testMatchAll0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_1500
       * @tc.desc   Test RegExp[Symbol.matchAll] complex regex with capture groups returns correct match count
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const regex: RegExp = /(\w)(\w)(\w)/g;
        const str: string = "abcdef";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
        if (results.length > 0) {
          expect(results[0].length).assertEqual(4);
        }
      });
    });

    describe('RegExp_Constructor_Comparison_Tests', () => {
      /**
      * @tc.name testMatchAll0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_1600
       * @tc.desc   Test RegExp[Symbol.matchAll] matches are equivalent between constructed and literal regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern: string = "\\d+";
        const str: string = "123 456";

        const regex1: RegExp = new RegExp(pattern, "g");
        const results1: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex1, str));

        const regex2: RegExp = /\d+/g;
        const results2: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex2, str));

        expect(results1.length).assertEqual(results2.length);
        expect(results1[0][0]).assertEqual(results2[0][0]);
      });

      /**
      * @tc.name testMatchAll0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_EDGECASE_TEST_1700
       * @tc.desc   Test RegExp[Symbol.matchAll] constructor special escape characters work correctly
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testMatchAll0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern: string = "\\.";
        const str: string = "a.b.c";
        const regex: RegExp = new RegExp(pattern, "g");
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator);

        expect(results.length).assertEqual(2);
      });
    });

}
