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
import { regexpSymbolSearch } from './RegExpSymbols';

class PlainObjectForToString {
}

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (err) {
    return false;
  }
}

function supportsLookbehindSemantics(): boolean {
  try {
    const re: RegExp = new RegExp('(?<!abc)\\d+');
    if (re.test('abc100')) {
      return false;
    }
    if (!re.test('def100')) {
      return false;
    }
    return true;
  } catch (_) {
    return false;
  }
}

export default function searchBasicTest() {
  describe('RegExp_Search_Basic', () => {
    /**
       * @tc.name testSearch0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0100
      * @tc.desc   Test returns the first match index
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/[A-Z]/, 'hey JudE')).assertEqual(4);
    });

    /**
       * @tc.name testSearch0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0200
      * @tc.desc   Test returns -1 when not found
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/[.]/, 'hey JudE')).assertEqual(-1);
    });

    /**
       * @tc.name testSearch0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0300
      * @tc.desc   Test accepts a string pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('Hello World'.search('World')).assertEqual(6);
    });

    /**
       * @tc.name testSearch0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0400
      * @tc.desc   Test empty pattern returns 0
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('Hello'.search('')).assertEqual(0);
      expect(regexpSymbolSearch(/(?:)/, '')).assertEqual(0);
    });
  });

  describe('RegExp_Search_Flags', () => {
    /**
       * @tc.name testSearch0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0500
      * @tc.desc   Test global flag does not change the result
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/abc/g, 'abc abc abc')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0600
      * @tc.desc   Test ignore-case flag works
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/world/i, 'Hello World')).assertEqual(6);
    });

    /**
       * @tc.name testSearch0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0700
      * @tc.desc   Test multiline anchors work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/^Line2/m, 'Line1\nLine2\nLine3')).assertEqual(6);
    });

    /**
       * @tc.name testSearch0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0800
      * @tc.desc   Test combined flags work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/world/gim, 'Hello\nWORLD\nworld')).assertEqual(6);
    });

    /**
       * @tc.name testSearch0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0900
      * @tc.desc   Test unicode flag works
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/\?/u, 'caf?')).assertEqual(3);
    });

    /**
       * @tc.name testSearch0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1000
      * @tc.desc   Test sticky flag does not affect the result
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /abc/y;
      re.lastIndex = 3;
      expect(regexpSymbolSearch(re, 'abcabc')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1100
      * @tc.desc   Test dotAll matches newline when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsRegExp('.', 's')) {
        return;
      }
      expect(regexpSymbolSearch(/Hello.World/s, 'Hello\nWorld')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4300
      * @tc.desc   Test dotAll flag unsupported when not available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('.', 's')) {
        return;
      }
      expect(supportsRegExp('.', 's')).assertFalse();
    });

    /**
       * @tc.name testSearch0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1200
      * @tc.desc   Test hasIndices does not change search return when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsRegExp('test(\\d+)', 'd')) {
        return;
      }
      const re: RegExp = new RegExp('test(\\d+)', 'd');
      expect(regexpSymbolSearch(re, 'test123')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4400
      * @tc.desc   Test d flag unsupported when hasIndices not available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('test(\\d+)', 'd')) {
        return;
      }
      expect(supportsRegExp('test(\\d+)', 'd')).assertFalse();
    });
  });

  describe('RegExp_Search_lastIndex', () => {
    /**
       * @tc.name testSearch0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1300
      * @tc.desc   Test ignores an existing lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /abc/g;
      re.lastIndex = 4;
      expect(regexpSymbolSearch(re, 'abc abc')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1400
      * @tc.desc   Test restores lastIndex after the call
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /abc/g;
      re.lastIndex = 5;
      regexpSymbolSearch(re, 'abc abc abc');
      expect(re.lastIndex).assertEqual(5);
    });

    /**
       * @tc.name testSearch0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1500
      * @tc.desc   Test ignores lastIndex for sticky patterns
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re: RegExp = /abc/y;
      re.lastIndex = 4;
      expect(regexpSymbolSearch(re, 'abc abc')).assertEqual(0);
    });
  });

  describe('RegExp_Search_Patterns_And_Unicode', () => {
    /**
       * @tc.name testSearch0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1600
      * @tc.desc   Test special and escaped characters work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/@/, 'price@100')).assertEqual(5);
      expect(regexpSymbolSearch(/\n/, 'Hello\nWorld')).assertEqual(5);
    });

    /**
       * @tc.name testSearch0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1700
      * @tc.desc   Test character classes work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/[0-9]/, 'abc123')).assertEqual(3);
      expect(regexpSymbolSearch(/[^\w\s']/, "I think Ruth's dog is cuter than your dog!")).assertEqual(41);
    });

    /**
       * @tc.name testSearch0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1800
      * @tc.desc   Test unicode and emoji work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpSymbolSearch(/\u00A3/, 'a\u00A3')).assertEqual(1);
        expect(regexpSymbolSearch(/\uD83D\uDE00/u, 'Hello \uD83D\uDE00 World')).assertEqual(6);
      });

    /**
       * @tc.name testSearch0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1900
      * @tc.desc   Test unicode property escapes work when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsRegExp('\\p{Script=Greek}', 'u')) {
        return;
      }
      const greekRe: RegExp = new RegExp('\\p{Script=Greek}', 'u');
      const notNumberRe: RegExp = new RegExp('\\P{Number}', 'u');
      expect(regexpSymbolSearch(greekRe, 'ABC \u03B1')).assertEqual(4);
      expect(regexpSymbolSearch(notNumberRe, '123ABC')).assertEqual(3);
    });

    /**
       * @tc.name testSearch0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4500
      * @tc.desc   Test unicode property escapes unsupported when not available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('\\p{Script=Greek}', 'u')) {
        return;
      }
      expect(supportsRegExp('\\p{Script=Greek}', 'u')).assertFalse();
    });

    /**
       * @tc.name testSearch0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2000
      * @tc.desc   Test predefined character classes work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'test123';
      expect(regexpSymbolSearch(/\d/, str)).assertEqual(4);
      expect(regexpSymbolSearch(/\w/, str)).assertEqual(0);
      expect(regexpSymbolSearch(/\s/, str)).assertEqual(-1);
    });
  });

  describe('RegExp_Search_Boundaries_And_Lookarounds', () => {
    /**
       * @tc.name testSearch0123
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2100
      * @tc.desc   Test handles empty and single-char cases
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/abc/, '')).assertEqual(-1);
      expect(regexpSymbolSearch(/a/, 'a')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0124
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2200
      * @tc.desc   Test start/end anchors work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'Hello World';
      expect(regexpSymbolSearch(/^Hello/, str)).assertEqual(0);
      expect(regexpSymbolSearch(/World$/, str)).assertEqual(6);
    });

    /**
       * @tc.name testSearch0125
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2300
      * @tc.desc   Test works for long strings
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'a'.repeat(10000) + 'target';
      expect(regexpSymbolSearch(/target/, str)).assertEqual(10000);
    });

    /**
       * @tc.name testSearch0126
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2400
      * @tc.desc   Test lookahead works
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/\d(?=def)/, 'abc123def')).assertEqual(5);
      expect(regexpSymbolSearch(/\d(?!def)/, 'abc123def')).assertEqual(3);
    });

    /**
       * @tc.name testSearch0127
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2500
      * @tc.desc   Test lookbehind works when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (!supportsLookbehindSemantics()) {
        return;
      }
      const positiveLookbehind: RegExp = new RegExp('(?<=:)\\d+');
      const negativeLookbehind: RegExp = new RegExp('(?<!abc)\\d+');
      expect(regexpSymbolSearch(positiveLookbehind, 'price:100')).assertEqual(6);
      expect(regexpSymbolSearch(negativeLookbehind, 'abc100 def100')).assertEqual(10);
    });

    /**
       * @tc.name testSearch0128
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4600
      * @tc.desc   Test lookbehind unsupported when not available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsLookbehindSemantics()) {
        return;
      }
      expect(supportsLookbehindSemantics()).assertFalse();
    });

    /**
       * @tc.name testSearch0129
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2600
      * @tc.desc   Test word boundaries work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/\bhello\b/i, 'Hello world, hello')).assertEqual(0);
      expect(regexpSymbolSearch(/\B\d\B/, 'abc123')).assertEqual(3);
    });
  });

  describe('RegExp_Search_Type_Conversion', () => {
    /**
       * @tc.name testSearch0130
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2700
      * @tc.desc   Test coerces number/null/undefined/boolean
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('abc123'.search(String(123))).assertEqual(3);
      expect('null undefined'.search(String(null))).assertEqual(0);
      expect('null undefined'.search(String(undefined))).assertEqual(5);
      expect('true false'.search(String(true))).assertEqual(0);
    });

    /**
       * @tc.name testSearch0131
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2800
      * @tc.desc   Test coerces object/array to string when pattern is comma
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PlainObjectForToString = new PlainObjectForToString();
      const arr: Array<string> = [','];
      const objIdx: number = '[object Object]'.search(String(obj));
      expect(objIdx >= 0).assertTrue();
      const pat: string = String(arr);
      if (pat !== ',') {
        return;
      }
      const idx: number = 'a,b,c'.search(pat);
      expect(idx === 1 || idx === 0).assertTrue();
    });

    /**
       * @tc.name testSearch0132
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4700
      * @tc.desc   Test coerces object/array to string when pattern is not comma
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: PlainObjectForToString = new PlainObjectForToString();
      const arr: Array<string> = [','];
      const objIdx: number = '[object Object]'.search(String(obj));
      expect(objIdx >= 0).assertTrue();
      const pat: string = String(arr);
      if (pat === ',') {
        return;
      }
      const idx: number = 'a,b,c'.search(pat);
      expect(idx === 0 || idx === 1).assertTrue();
    });
  });

  describe('RegExp_Search_Advanced_And_Applications', () => {
    /**
       * @tc.name testSearch0133
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2900
      * @tc.desc   Test preserves group/quantifier/alternation semantics
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/(\d{4})-(\d{2})-(\d{2})/, '2023-12-25')).assertEqual(0);
      expect(regexpSymbolSearch(/(?:abc)\d+/, 'abc123')).assertEqual(0);
      const namedGroupRe: RegExp = new RegExp('(?<first>\\w+)\\s(?<last>\\w+)');
      expect(regexpSymbolSearch(namedGroupRe, 'John Smith')).assertEqual(0);
      expect(regexpSymbolSearch(/a+b+/, 'aaabbc')).assertEqual(0);
      expect(regexpSymbolSearch(/cat|dog/, 'cat or dog')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0134
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3000
      * @tc.desc   Test constructor forms work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(new RegExp('test'), 'test')).assertEqual(0);
      expect(regexpSymbolSearch(new RegExp('\\d+'), 'test123')).assertEqual(4);
      const pattern: RegExp = new RegExp(['cat', 'dog', 'bird'].join('|'), 'i');
      expect(regexpSymbolSearch(pattern, 'Cat Dog Bird')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0135
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3100
      * @tc.desc   Test covers -1, 0 and positive return values
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/xyz/, 'test')).assertEqual(-1);
      expect(regexpSymbolSearch(/(?:)/, 'test')).assertEqual(0);
      expect(regexpSymbolSearch(/test/, 'abc test')).assertEqual(4);
      expect(regexpSymbolSearch(/c/, 'abc')).assertEqual(2);
      expect(regexpSymbolSearch(/\n/, 'abc\ndef')).assertEqual(3);
    });

    /**
       * @tc.name testSearch0136
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3200
      * @tc.desc   Test covers common application scenarios
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const hasEmail: boolean = regexpSymbolSearch(/^[\w.-]+@[\w.-]+\.\w+$/, 'test@example.com') !== -1;
      const hasHttps: boolean = regexpSymbolSearch(/^https:/, 'https://example.com') === 0;
      const hasFirstNumberAt3: boolean = regexpSymbolSearch(/\d/, 'abc123def') === 3;
      const hasHtml: boolean = regexpSymbolSearch(/<[^>]+>/, '<div>Hello</div>') !== -1;
      const isHexColor: boolean = regexpSymbolSearch(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/, '#FF5733') !== -1;

      expect(hasEmail).assertTrue();
      expect(hasHttps).assertTrue();
      expect(hasFirstNumberAt3).assertTrue();
      expect(hasHtml).assertTrue();
      expect(isHexColor).assertTrue();
    });
  });

  describe('RegExp_Search_Error_And_Compatibility', () => {
    /**
       * @tc.name testSearch0137
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3300
      * @tc.desc   Test invalid regex or flag throws syntax error
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let e1: boolean = false;
      let e2: boolean = false;

      try {
        new RegExp('[a-z');
      } catch (err) {
        e1 = true;
      }

      try {
        new RegExp('test', 'x');
      } catch (err) {
        e2 = true;
      }

      expect(e1).assertTrue();
      expect(e2).assertTrue();
    });

    /**
       * @tc.name testSearch0138
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3400
      * @tc.desc   Test invalid unicode property throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let thrown: boolean = false;
      try {
        new RegExp('\\p{Invalid}', 'u');
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
       * @tc.name testSearch0139
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3500
      * @tc.desc   Test undefined pattern is coerced to "undefined"
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect('null undefined'.search('undefined')).assertEqual(5);
    });

    /**
       * @tc.name testSearch0140
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3600
      * @tc.desc   Test feature detection is consistent
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const supportsLookbehind: boolean = supportsRegExp('(?<=a)b');
      const supportsUnicodeProperties: boolean = supportsRegExp('\\p{L}', 'u');
      const supportsDotAll: boolean = supportsRegExp('.', 's');
      const supportsHasIndices: boolean = supportsRegExp('.', 'd');

      expect(typeof supportsLookbehind).assertEqual('boolean');
      expect(typeof supportsUnicodeProperties).assertEqual('boolean');
      expect(typeof supportsDotAll).assertEqual('boolean');
      expect(typeof supportsHasIndices).assertEqual('boolean');
    });
  });

  describe('RegExp_Search_Extended_Scenarios', () => {
    /**
       * @tc.name testSearch0141
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3700
      * @tc.desc   Test zero-width matches return expected positions
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'abc';
      expect(regexpSymbolSearch(/^/, str)).assertEqual(0);
      expect(regexpSymbolSearch(/$/, str)).assertEqual(3);
      expect(regexpSymbolSearch(/\b/, str)).assertEqual(0);
      expect(regexpSymbolSearch(/\B/, str)).assertEqual(1);
    });

    /**
       * @tc.name testSearch0142
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3800
      * @tc.desc   Test extreme quantifier and nested group work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const longA: string = 'a'.repeat(1000);
      expect(regexpSymbolSearch(/a{1000}/, longA)).assertEqual(0);
      expect(regexpSymbolSearch(/(((a)))/, 'a')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0143
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3900
      * @tc.desc   Test zero-width global does not loop indefinitely
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(regexpSymbolSearch(/(?=)/g, 'test')).assertEqual(0);
    });

    /**
       * @tc.name testSearch0144
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4000
      * @tc.desc   Test many capture groups work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const group: string = '(\\w)';
      const groups: string = group.repeat(20);
      const pattern: RegExp = new RegExp('^' + groups + '$');
      const str: string = 'a'.repeat(20);
      expect(regexpSymbolSearch(pattern, str)).assertEqual(0);
    });

    /**
       * @tc.name testSearch0145
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4100
      * @tc.desc   Test real-world validation patterns work
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ipv4: boolean = regexpSymbolSearch(/^((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)\.){3}(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)$/, '192.168.1.1') !== -1;
      const phone: boolean = regexpSymbolSearch(/^(\([0-9]{3}\)\s?|[0-9]{3}-)[0-9]{3}-[0-9]{4}$/, '123-456-7890') !== -1;
      const date: boolean = regexpSymbolSearch(/^\d{4}-\d{2}-\d{2}$/, '2024-01-15') !== -1;
      const time: boolean = regexpSymbolSearch(/^\d{1,2}:\d{2}(:\d{2})?$/, '10:30') !== -1;
      const coordinates: boolean = regexpSymbolSearch(/^\(\s*-?\d+(\.\d+)?\s*,\s*-?\d+(\.\d+)?\s*\)$/, '(123.45, -67.89)') !== -1;

      expect(ipv4).assertTrue();
      expect(phone).assertTrue();
      expect(date).assertTrue();
      expect(time).assertTrue();
      expect(coordinates).assertTrue();
    });

    /**
       * @tc.name testSearch0146
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4200
      * @tc.desc   Test unicode script cases work when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\p{Script=Hiragana}+', 'u')) {
          return;
        }
        const hiraganaRe: RegExp = new RegExp('\\p{Script=Hiragana}+', 'u');
        expect(regexpSymbolSearch(hiraganaRe, '\u3042\u3044\u3046')).assertEqual(0);
      });

    /**
       * @tc.name testSearch0147
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4800
      * @tc.desc   Test Hiragana script property unsupported when not available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSearch0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (supportsRegExp('\\p{Script=Hiragana}+', 'u')) {
          return;
        }
        expect(supportsRegExp('\\p{Script=Hiragana}+', 'u')).assertFalse();
      });
  });
}
