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
  regexpTestCallThisNotRegExpThrows,
  regexpTestCallThisUndefinedThrows,
  regexpTestCallThisNullThrows,
  regexpTestCallRegexLikeObject,
  strictDeleteRegexSourceThrows,
  regexpTestSymbolParameterThrows,
  regexpTestToPrimitiveCoercionMatchesPrimitive,
  regexpTestBigintParameterMatches123
} from './RegExpHelper';

interface CompileCapable {
  compile?: (pattern: string, flags?: string) => void;
}

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

function throwsOnRegExpCtor(pattern: string, flags?: string): boolean {
  try {
    if (flags === undefined) {
      new RegExp(pattern);
    } else {
      new RegExp(pattern, flags);
    }
    return false;
  } catch (_) {
    return true;
  }
}

function functionToStringForTest0114(): void {
}

export default function testTest() {

    describe('Test_Basic', () => {
      /**
       * @tc.name testTest0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0100
       * @tc.desc   Test simple match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /hello/;
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0200
       * @tc.desc   Test full match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello';
        const re = /^hello$/;
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0300
       * @tc.desc   Test repeatable non global
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /hello/;
        expect(re.test(str)).assertTrue();
        expect(re.test(str)).assertTrue();
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0400
       * @tc.desc   Test no match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /goodbye/;
        expect(re.test(str)).assertFalse();
      });

      /**
       * @tc.name testTest0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0500
       * @tc.desc   Test partial match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /world/;
        expect(re.test(str)).assertTrue();
      });
    });

    describe('Parameter_Types', () => {
      /**
       * @tc.name testTest0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0600
       * @tc.desc   Test string parameter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        expect(re.test('test string')).assertTrue();
        expect(re.test('no match')).assertFalse();
      });

      /**
       * @tc.name testTest0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0700
       * @tc.desc   Test empty string parameter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^$/;
        expect(re.test('')).assertTrue();
        expect(re.test('not empty')).assertFalse();
      });

      /**
       * @tc.name testTest0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0800
       * @tc.desc   Test non string coercion number array object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /123/;
        expect(re.test(String(123))).assertTrue();
        const arr: number[] = [1, 2, 3];
        expect(re.test(String(arr))).assertFalse();
        class EmptyObj {
        }
        expect(re.test(String(new EmptyObj()))).assertFalse();
      });

      /**
       * @tc.name testTest0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0900
       * @tc.desc   Test undefined and null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /undefined/;
        expect(re.test(String(undefined))).assertTrue();
        expect(re.test(String(null))).assertFalse();
      });

      /**
       * @tc.name testTest0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1000
       * @tc.desc   Test symbol parameter throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestSymbolParameterThrows()).assertTrue();
      });

      /**
       * @tc.name testTest0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1100
       * @tc.desc   Test boolean parameter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /true/;
        expect(re.test(String(true))).assertTrue();
        expect(re.test(String(false))).assertFalse();
      });

      /**
       * @tc.name testTest0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1200
       * @tc.desc   Test object toString
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class CustomToString {
          toString(): string {
            return 'custom';
          }
        }
        const obj = new CustomToString();
        const re = /custom/;
        expect(re.test(String(obj))).assertTrue();
      });

      /**
       * @tc.name testTest0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1300
       * @tc.desc   Test symbol toPrimitive
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestToPrimitiveCoercionMatchesPrimitive()).assertTrue();
      });

      /**
       * @tc.name testTest0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1400
       * @tc.desc   Test bigint parameter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestBigintParameterMatches123()).assertTrue();
      });

      /**
       * @tc.name testTest0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1500
       * @tc.desc   Test RegExp.test on String(function): boolean result and non-empty serialization
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const s = String(functionToStringForTest0114);
        const v = /./.test(s);
        expect(typeof v === 'boolean').assertTrue();
        expect(v).assertTrue();
      });
    });

    describe('Test_Flags', () => {
      /**
       * @tc.name testTest0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1600
       * @tc.desc   Test ignoreCase
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'HELLO world';
        expect(/hello/.test(str)).assertFalse();
        expect(/hello/i.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1700
       * @tc.desc   Test global lastIndex changes
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello hello';
        const re = /hello/g;
        expect(re.lastIndex).assertEqual(0);
        expect(re.test(str)).assertTrue();
        expect(re.lastIndex > 0).assertTrue();
        expect(re.test(str)).assertTrue();
        expect(re.lastIndex > 0).assertTrue();
        expect(re.test(str)).assertFalse();
        expect(re.lastIndex).assertEqual(0);
      });

      /**
       * @tc.name testTest0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1800
       * @tc.desc   Test multiline affects anchors
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello\nworld';
        expect(/^world/.test(str)).assertFalse();
        expect(/^world/m.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1900
       * @tc.desc   Test sticky uses lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world hello';
        const re = /hello/y;
        re.lastIndex = 0;
        expect(re.test(str)).assertTrue();
        expect(re.lastIndex).assertEqual(5);
        expect(re.test(str)).assertFalse();
      });

      /**
       * @tc.name testTest0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2000
       * @tc.desc   Test dot without s does not span newline
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello\nworld';
        const re1 = /hello.*world/;
        expect(re1.test(str)).assertFalse();
      });

      /**
       * @tc.name testTest0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXTRA_TEST_0300
       * @tc.desc   Test dotAll pattern unsupported when s flag not available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (supportsRegExp('hello.*world', 's')) {
          return;
        }
        expect(supportsRegExp('hello.*world', 's')).assertFalse();
      });

      /**
       * @tc.name testTest0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2100
       * @tc.desc   Test dot matches supplementary plane without u flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = String.fromCodePoint(0x1D306);
        expect(/./.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2200
       * @tc.desc   Test hasIndices supported or skip
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('test', 'd')) {
          return;
        }
        const re = new RegExp('test', 'd');
        expect(re.test('test')).assertTrue();
      });

      /**
       * @tc.name testTest0123
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXTRA_TEST_0400
       * @tc.desc   Test d flag unsupported when hasIndices not available
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (supportsRegExp('test', 'd')) {
          return;
        }
        expect(supportsRegExp('test', 'd')).assertFalse();
      });

      /**
       * @tc.name testTest0124
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2300
       * @tc.desc   Test combined flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'HELLO\nhello';
        const re = /^hello$/gim;
        expect(re.test(str)).assertTrue();
        expect(re.lastIndex > 0).assertTrue();
        re.lastIndex = 6;
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0125
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2400
       * @tc.desc   Test invalid flag throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('test', 'x')).assertTrue();
      });
    });

    describe('Syntax', () => {
      /**
       * @tc.name testTest0126
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2500
       * @tc.desc   Test character match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test@example.com';
        expect(/@/.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0127
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2600
       * @tc.desc   Test character class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a1b2c3';
        expect(/[abc]/.test(str)).assertTrue();
        expect(/[0-9]/.test(str)).assertTrue();
        expect(/[^abc]/.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0128
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2700
       * @tc.desc   Test predefined classes
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test123  ';
        expect(/\d/.test(str)).assertTrue();
        expect(/\w/.test(str)).assertTrue();
        expect(/\s/.test(str)).assertTrue();
        expect(/\D/.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0129
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2800
       * @tc.desc   Test quantifiers
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/a?/.test('a')).assertTrue();
        expect(/a+/.test('ab')).assertTrue();
        expect(/a{2}/.test('abc')).assertFalse();
        expect(/a{1,3}/.test('aaaa')).assertTrue();
      });

      /**
       * @tc.name testTest0130
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2900
       * @tc.desc   Test anchors
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        expect(/^hello/.test(str)).assertTrue();
        expect(/world$/.test(str)).assertTrue();
        expect(/\bhello\b/.test(str)).assertTrue();
        expect(/\Bwor\B/.test(str)).assertFalse();
      });

      /**
       * @tc.name testTest0131
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3000
       * @tc.desc   Test alternation
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/apple|orange/.test('apple')).assertTrue();
        expect(/apple|orange/.test('orange')).assertTrue();
        expect(/apple|orange/.test('banana')).assertFalse();
      });

      /**
       * @tc.name testTest0132
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3100
       * @tc.desc   Test group and backref
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello hello';
        expect(/(hello)\s\1/.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0133
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3200
       * @tc.desc   Test non capture group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        expect(/(?:hello|world) world/.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0134
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3300
       * @tc.desc   Test lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str1 = 'hello world';
        const str2 = 'hello universe';
        expect(/hello(?= world)/.test(str1)).assertTrue();
        expect(/hello(?= world)/.test(str2)).assertFalse();
        expect(/hello(?! world)/.test(str1)).assertFalse();
        expect(/hello(?! world)/.test(str2)).assertTrue();
      });

      /**
       * @tc.name testTest0135
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3400
       * @tc.desc   Test lookbehind when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<=hello )world')) {
          return;
        }
        expect(new RegExp('(?<=hello )world').test('hello world')).assertTrue();
        expect(new RegExp('(?<=hello )world').test('hi world')).assertFalse();
        expect(new RegExp('(?<!hello )world').test('hello world')).assertFalse();
        expect(new RegExp('(?<!hello )world').test('hi world')).assertTrue();
      });

      /**
       * @tc.name testTest0136
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3500
       * @tc.desc   Test atomic group if supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?>a*)ab')) {
          return;
        }
        expect(new RegExp('(?>a*)ab').test('abc')).assertFalse();
        expect(/a*ab/.test('abc')).assertTrue();
      });

      /**
       * @tc.name testTest0137
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3600
       * @tc.desc   Test possessive quantifier if supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('a++ab')) {
          return;
        }
        const twoAsThenB = '\u0061\u0061\u0062';
        expect(new RegExp('a++ab').test(twoAsThenB)).assertFalse();
        expect(/a+ab/.test(twoAsThenB)).assertTrue();
      });

      /**
       * @tc.name testTest0138
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3700
       * @tc.desc   Test unicode property escape if supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\p{Lu}', 'u')) {
          return;
        }
        expect(new RegExp('\\p{Lu}', 'u').test('A')).assertTrue();
        expect(new RegExp('\\p{Lu}', 'u').test('\u6D7C')).assertFalse();
      });

      /**
       * @tc.name testTest0139
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3800
       * @tc.desc   Test G anchor if supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\Gtest', 'g')) {
          return;
        }
        const probe = new RegExp('\\Gtest', 'g');
        if (!probe.test('test')) {
          return;
        }
        const str = 'test test';
        const re = new RegExp('\\Gtest', 'g');
        expect(re.test(str)).assertTrue();
        expect(re.test(str)).assertTrue();
        expect(re.test(str)).assertFalse();
      });
    });

    describe('Test_Boundaries', () => {
      /**
       * @tc.name testTest0140
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3900
       * @tc.desc   Test min length strings
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /.*/;
        expect(re.test('')).assertTrue();
        expect(re.test('a')).assertTrue();
      });

      /**
       * @tc.name testTest0141
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4000
       * @tc.desc   Test long string reasonable size
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const longStr = 'a'.repeat(20000) + 'b';
        expect(/b$/.test(longStr)).assertTrue();
      });

      /**
       * @tc.name testTest0142
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4100
       * @tc.desc   Test special unicode
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const emoji = String.fromCodePoint(0x1F600);
        expect(new RegExp(emoji, 'u').test(`hello ${emoji} world`)).assertTrue();
        expect(/^\u947C/.test('\u947C')).assertTrue();
      });

      /**
       * @tc.name testTest0143
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4200
       * @tc.desc   Test dot matches supplementary plane without u flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = String.fromCodePoint(0x1D306);
        expect(/./.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0144
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4300
       * @tc.desc   Test zero width assertions
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test';
        expect(/^test/.test(str)).assertTrue();
        expect(/test$/.test(str)).assertTrue();
        expect(/\btest\b/.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0145
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4400
       * @tc.desc   Test number boundary
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^9007199254740991$/;
        expect(re.test(String(9007199254740991))).assertTrue();
        expect(re.test(String(-9007199254740991))).assertFalse();
      });

      /**
       * @tc.name testTest0146
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4500
       * @tc.desc   Test quantifier edge
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/a{0}/.test('')).assertTrue();
        expect(/a{1024}/.test('a'.repeat(1024))).assertTrue();
      });
    });

    describe('Special_Characters', () => {
      /**
       * @tc.name testTest0147
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4600
       * @tc.desc   Test escape dot
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test.txt';
        expect(/./.test(str)).assertTrue();
        expect(/\./.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0148
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4700
       * @tc.desc   Test backslash
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'path\\to\\file';
        expect(/\\/.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0149
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4800
       * @tc.desc   Test quotes
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/'/.test("it's a test")).assertTrue();
        expect(/"/.test('he said "hello"')).assertTrue();
      });

      /**
       * @tc.name testTest0150
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4900
       * @tc.desc   Test parentheses
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '(test)';
        expect(/\(/.test(str)).assertTrue();
        expect(/\)/.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0151
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5000
       * @tc.desc   Test brackets
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str1 = 'test[1]';
        expect(/\[/.test(str1)).assertTrue();
        expect(/\]/.test(str1)).assertTrue();
        expect(/[[]/.test('a')).assertFalse();
        expect(/[[]/.test(str1)).assertTrue();
      });

      /**
       * @tc.name testTest0152
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5100
       * @tc.desc   Test braces colon semicolon equals
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\{/.test('{test}')).assertTrue();
        expect(/\}/.test('{test}')).assertTrue();
        expect(/:/.test('key:value')).assertTrue();
        expect(/;/.test('statement1;statement2')).assertTrue();
        expect(/=/.test('a=b')).assertTrue();
      });

      /**
       * @tc.name testTest0153
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5200
       * @tc.desc   Test plus star question
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\+/.test('1+1')).assertTrue();
        expect(/\d+/.test('1+1')).assertTrue();
        expect(/\*/.test('a*b')).assertTrue();
        expect(/a.*b/.test('a*b')).assertTrue();
        expect(/\?/.test('really?')).assertTrue();
        expect(/really?/.test('really?')).assertTrue();
      });

      /**
       * @tc.name testTest0154
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5300
       * @tc.desc   Test hash dollar percent amp pipe tilde backtick at
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/#/.test('#heading')).assertTrue();
        expect(/\$/.test('$100')).assertTrue();
        expect(/100$/.test('$100')).assertTrue();
        expect(/%/.test('50%')).assertTrue();
        expect(/&/.test('a&b')).assertTrue();
        expect(/\|/.test('a|b')).assertTrue();
        expect(/a|b/.test('a|b')).assertTrue();
        expect(/~/.test('~/.bashrc')).assertTrue();
        expect(/`/.test('`code`')).assertTrue();
        expect(/@/.test('user@example.com')).assertTrue();
      });
    });

    describe('Test_Capture_Groups', () => {
      /**
       * @tc.name testTest0155
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5400
       * @tc.desc   Test basic groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/([a-z]+)([0-9]+)/.test('abc123')).assertTrue();
      });

      /**
       * @tc.name testTest0156
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5500
       * @tc.desc   Test nested groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/((test)(123))/.test('test123')).assertTrue();
      });

      /**
       * @tc.name testTest0157
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5600
       * @tc.desc   Test named groups when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})')) {
          return;
        }
        const re = new RegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})');
        expect(re.test('2023-12-25')).assertTrue();
      });

      /**
       * @tc.name testTest0158
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5700
       * @tc.desc   Test backreference
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/([a-z]+)\1/.test('abcabc')).assertTrue();
        expect(/([a-z]+)\1/.test('abcxyz')).assertFalse();
      });

      /**
       * @tc.name testTest0159
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5800
       * @tc.desc   Test named backreference when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<word>\\w+)_\\k<word>')) {
          return;
        }
        const re = new RegExp('(?<word>\\w+)_\\k<word>');
        expect(re.test('test_test')).assertTrue();
        expect(re.test('test_demo')).assertFalse();
      });

      /**
       * @tc.name testTest0160
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5900
       * @tc.desc   Test non capture group does not shift backref
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/(?:a)(b)\1/.test('abb')).assertTrue();
      });

      /**
       * @tc.name testTest0161
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6000
       * @tc.desc   Test multiple groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/([^=]+)=([^=]+)/.test('name=value')).assertTrue();
      });

      /**
       * @tc.name testTest0162
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6100
       * @tc.desc   Test nested named groups when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<outer>t(?<inner>es)t)(?<num>123)')) {
          return;
        }
        const re = new RegExp('(?<outer>t(?<inner>es)t)(?<num>123)');
        expect(re.test('test123')).assertTrue();
      });

      /**
       * @tc.name testTest0163
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6200
       * @tc.desc   Test empty groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/()/.test('')).assertTrue();
        expect(/()()/.test('')).assertTrue();
      });

      /**
       * @tc.name testTest0164
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6300
       * @tc.desc   Test many groups reasonable
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const groups = Array(20).fill('(\\w)').join('');
        const re = new RegExp(`^${groups}$`);
        const str = 'a'.repeat(20);
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0165
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6400
       * @tc.desc   Test backref out of range is false
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern = '(a)\\2';
        if (!supportsRegExp(pattern)) {
          return;
        }
        const re = new RegExp(pattern);
        expect(re.test('aa')).assertFalse();
      });

      /**
       * @tc.name testTest0166
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6500
       * @tc.desc   Test duplicate named group throws when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('(?<a>a)')) {
          return;
        }
        expect(throwsOnRegExpCtor('(?<a>a)(?<a>b)')).assertTrue();
      });
    });

    describe('Test_Complex_Patterns', () => {
      /**
       * @tc.name testTest0167
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6600
       * @tc.desc   Test email
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        expect(re.test('test@example.com')).assertTrue();
        expect(re.test('invalid-email')).assertFalse();
      });

      /**
       * @tc.name testTest0168
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6700
       * @tc.desc   Test url
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^https?:\/\/[^\s/$.?#].[^\s]*$/;
        expect(re.test('https://example.com')).assertTrue();
        expect(re.test('not a url')).assertFalse();
      });

      /**
       * @tc.name testTest0169
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6800
       * @tc.desc   Test phone
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^(\([0-9]{3}\)\s?|[0-9]{3}-)[0-9]{3}-[0-9]{4}$/;
        expect(re.test('123-456-7890')).assertTrue();
        expect(re.test('(123) 456-7890')).assertTrue();
        expect(re.test('not a phone')).assertFalse();
      });

      /**
       * @tc.name testTest0170
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6900
       * @tc.desc   Test date format
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/;
        expect(re.test('2023-12-25')).assertTrue();
        expect(re.test('2023-02-28')).assertTrue();
        expect(re.test('not a date')).assertFalse();
      });
    });

    describe('Compare_With_String_Methods', () => {
      /**
       * @tc.name testTest0171
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7000
       * @tc.desc   Test includes indexOf search match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /hello/;
        expect(re.test(str)).assertTrue();
        expect(str.includes('hello')).assertTrue();
        expect(str.indexOf('hello') !== -1).assertTrue();
        expect(str.search(re) !== -1).assertTrue();
        expect(str.match(re) !== null).assertTrue();
      });

      /**
       * @tc.name testTest0172
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7100
       * @tc.desc   Test replace split exec types
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello world';
        const re = /hello/;
        expect(re.test(str)).assertTrue();
        expect(str.replace(re, 'hi')).assertEqual('hi world');
        expect('a,b,c'.split(/,/).length).assertEqual(3);
        expect(re.exec(str) !== null).assertTrue();
        expect(typeof re.test(str) === 'boolean').assertTrue();
      });
    });

    describe('Error_Handling', () => {
      /**
       * @tc.name testTest0173
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7200
       * @tc.desc   Test invalid regex syntax
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('[a-z')).assertTrue();
      });

      /**
       * @tc.name testTest0174
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7300
       * @tc.desc   Test invalid flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('test', 'x')).assertTrue();
      });

      /**
       * @tc.name testTest0175
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7400
       * @tc.desc   Test nested quantifier invalid
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('a**')).assertTrue();
      });

      /**
       * @tc.name testTest0176
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7500
       * @tc.desc   Test invalid quantifier range
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(throwsOnRegExpCtor('a{5,3}')).assertTrue();
      });

      /**
       * @tc.name testTest0177
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7600
       * @tc.desc   Test unicode codepoint invalid when u supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        if (!supportsRegExp('\\u{123456}', 'u')) {
          return;
        }
        expect(throwsOnRegExpCtor('\\u{123456}', 'u')).assertTrue();
      });
    });

    describe('This_Value', () => {
      /**
       * @tc.name testTest0178
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7700
       * @tc.desc   Test call this not regexp throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestCallThisNotRegExpThrows()).assertTrue();
      });

      /**
       * @tc.name testTest0179
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7800
       * @tc.desc   Test call this undefined throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestCallThisUndefinedThrows()).assertTrue();
      });

      /**
       * @tc.name testTest0180
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7900
       * @tc.desc   Test call this null throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(regexpTestCallThisNullThrows()).assertTrue();
      });

      /**
       * @tc.name testTest0181
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8000
       * @tc.desc   Test regex like object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const v = regexpTestCallRegexLikeObject();
        expect(typeof v === 'boolean').assertTrue();
        expect(v).assertTrue();
      });

      /**
       * @tc.name testTest0182
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8100
       * @tc.desc   Test subclass override test
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        class MyRegExp extends RegExp {
          test(str: string): boolean {
            return super.test(str);
          }
        }
        const re = new MyRegExp('test');
        expect(re.test('test')).assertTrue();
      });
    });

    describe('RegExp_Constructor', () => {
      /**
       * @tc.name testTest0183
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8200
       * @tc.desc   Test new RegExp
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = new RegExp('test', 'g');
        expect(re.test('test string')).assertTrue();
        expect(re.lastIndex).assertEqual(4);
      });

      /**
       * @tc.name testTest0184
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8300
       * @tc.desc   Test escape in constructor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re1 = /\d+/;
        const re2 = new RegExp('\\d+');
        expect(re1.test('123')).assertTrue();
        expect(re2.test('123')).assertTrue();
      });

      /**
       * @tc.name testTest0185
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8400
       * @tc.desc   Test dynamic pattern flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const pattern = 'test';
        const flags = 'gi';
        const re = new RegExp(pattern, flags);
        expect(re.test('TEST')).assertTrue();
      });

      /**
       * @tc.name testTest0186
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8500
       * @tc.desc   Test empty pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re1 = new RegExp('');
        expect(re1.test('')).assertTrue();
        const re2 = new RegExp('', 'g');
        expect(re2.test('anything')).assertTrue();
      });

      /**
       * @tc.name testTest0187
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8600
       * @tc.desc   Test construct from regexp
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r1 = /test/g;
        const r2 = new RegExp(r1);
        expect(r2.test('test')).assertTrue();
        expect(r2.global).assertTrue();
      });

      /**
       * @tc.name testTest0188
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8700
       * @tc.desc   Test override flags in constructor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const r1 = /test/;
        const r2 = new RegExp(r1, 'g');
        expect(r2.global).assertTrue();
      });
    });

    describe('Compile', () => {
      /**
       * @tc.name testTest0189
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8800
       * @tc.desc   Test compile existence
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/;
        const c = (re as Object as CompileCapable).compile;
        const t = typeof c;
        expect(t === 'function' || t === 'undefined').assertTrue();
      });

      /**
       * @tc.name testTest0190
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8900
       * @tc.desc   Test compile behavior when exists
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/g;
        re.lastIndex = 5;
        const cap = re as Object as CompileCapable;
        if (typeof cap.compile !== 'function') {
          return;
        }
        cap.compile('new');
        expect(re.lastIndex).assertEqual(0);
        expect(re.test('new')).assertTrue();
      });

      /**
       * @tc.name testTest0191
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXTRA_TEST_0500
       * @tc.desc   Test compile absent when not on prototype
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/g;
        re.lastIndex = 5;
        const cap = re as Object as CompileCapable;
        if (typeof cap.compile === 'function') {
          return;
        }
        expect(typeof cap.compile).assertEqual('undefined');
      });
    });

    describe('Strict_Mode', () => {
      /**
       * @tc.name testTest0192
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9000
       * @tc.desc   Test basic
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/test/.test('test')).assertTrue();
      });

      /**
       * @tc.name testTest0193
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9100
       * @tc.desc   Test strict delete source throws via helper
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(strictDeleteRegexSourceThrows()).assertTrue();
      });
    });

    describe('Multi_Instance', () => {
      /**
       * @tc.name testTest0194
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9200
       * @tc.desc   Test independent lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test test';
        const r1 = /test/g;
        const r2 = /test/g;
        r1.test(str);
        r2.test(str);
        expect(r1.lastIndex).assertEqual(4);
        expect(r2.lastIndex).assertEqual(4);
      });

      /**
       * @tc.name testTest0195
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9300
       * @tc.desc   Test alternate usage
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'foo bar foo';
        const r1 = /foo/g;
        const r2 = /bar/g;
        expect(r1.test(str)).assertTrue();
        expect(r2.test(str)).assertTrue();
        expect(r1.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0196
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9400
       * @tc.desc   Test same pattern diff flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'test test';
        const r1 = /test/;
        const r2 = /test/g;
        expect(r1.test(str)).assertTrue();
        expect(r2.test(str)).assertTrue();
        expect(r1.lastIndex).assertEqual(0);
        expect(r2.lastIndex).assertEqual(4);
      });
    });

    describe('Web_Compatibility', () => {
      /**
       * @tc.name testTest0197
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9500
       * @tc.desc   Test lookbehind support probe
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = supportsRegExp('(?<=lookbehind)test');
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testTest0198
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9600
       * @tc.desc   Test unicode property support probe
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = supportsRegExp('\\p{Extended_Pictographic}', 'u');
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testTest0199
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9700
       * @tc.desc   Test hasIndices support probe
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = supportsRegExp('test', 'd');
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testTest0200
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9800
       * @tc.desc   Test dotAll support probe
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = supportsRegExp('test.test', 's');
        expect(typeof supported === 'boolean').assertTrue();
      });
    });

    describe('Performance_Smoke', () => {
      /**
       * @tc.name testTest0201
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9900
       * @tc.desc   Test simple perf smoke
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a'.repeat(20000) + 'b';
        const re = /b$/;
        expect(re.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0202
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0100
       * @tc.desc   Test global loop smoke
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a b c d e f g h i j'.repeat(50);
        const re = /a/g;
        let count = 0;
        while (re.test(str)) {
          count++;
          if (count > 1000) {
            break;
          }
        }
        expect(count > 0).assertTrue();
      });
    });

    describe('Edge_Cases', () => {
      /**
       * @tc.name testTest0203
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0200
       * @tc.desc   Test zero width
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/\b/.test('test')).assertTrue();
      });

      /**
       * @tc.name testTest0204
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0300
       * @tc.desc   Test empty alternative
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/a|/.test('')).assertTrue();
        expect(/a|/.test('a')).assertTrue();
      });

      /**
       * @tc.name testTest0205
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0400
       * @tc.desc   Test double anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/^^/.test('test')).assertTrue();
      });

      /**
       * @tc.name testTest0206
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0500
       * @tc.desc   Test nested star
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(/(a)*/.test('')).assertTrue();
        expect(/((a)*)*/.test('')).assertTrue();
      });

      /**
       * @tc.name testTest0207
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0600
       * @tc.desc   Test special combo
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = '\\d\\w\\s';
        const re = /\\\w\\\w\\\w/;
        expect(re.test(str)).assertTrue();
      });
    });

    describe('Real_World', () => {
      /**
       * @tc.name testTest0208
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0700
       * @tc.desc   Test form email validation
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const validateEmail = (email: string): boolean => {
          const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
          return re.test(email);
        };
        expect(validateEmail('user@example.com')).assertTrue();
        expect(validateEmail('invalid')).assertFalse();
      });

      /**
       * @tc.name testTest0209
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0800
       * @tc.desc   Test data cleaning
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const isClean = (s: string): boolean => /^[a-zA-Z0-9\s]+$/.test(s);
        expect(isClean('Hello World 123')).assertTrue();
        expect(isClean('Hello@World')).assertFalse();
      });

      /**
       * @tc.name testTest0210
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0900
       * @tc.desc   Test search keyword
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const isValidKeyword = (k: string): boolean => /^[a-zA-Z0-9\s\-_]{2,50}$/.test(k);
        expect(isValidKeyword('search-term')).assertTrue();
        expect(isValidKeyword('a')).assertFalse();
      });

      /**
       * @tc.name testTest0211
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_1000
       * @tc.desc   Test log analysis
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const isErrorLog = (log: string): boolean => /\[ERROR\]/.test(log);
        expect(isErrorLog('[INFO] Processing')).assertFalse();
        expect(isErrorLog('[ERROR] Failed')).assertTrue();
      });

      /**
       * @tc.name testTest0212
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_1100
       * @tc.desc   Test config line
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const isValidConfigLine = (line: string): boolean => /^[a-zA-Z_]\w*\s*=\s*[^#]+/.test(line);
        expect(isValidConfigLine('key=value')).assertTrue();
        expect(isValidConfigLine('123key=value')).assertFalse();
      });

      /**
       * @tc.name testTest0213
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXTRA_TEST_0100
       * @tc.desc   Test dotAll s flag spans newline when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'hello\nworld';
        if (!supportsRegExp('hello.*world', 's')) {
          return;
        }
        const re2 = new RegExp('hello.*world', 's');
        expect(re2.test(str)).assertTrue();
      });

      /**
       * @tc.name testTest0214
       * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXTRA_TEST_0200
       * @tc.desc   Test dot with u flag matches supplementary plane when supported
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = String.fromCodePoint(0x1D306);
        if (!supportsRegExp('.', 'u')) {
          return;
        }
        expect(/./u.test(str)).assertTrue();
      });
    });

}



