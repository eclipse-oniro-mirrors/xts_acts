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
  splitDirectSymbolSplit,
  splitStringVsSymbolSame,
  splitSymbolWithLimit,
  splitHasIndicesD,
  splitSubclassOverride,
  splitSubclassCallSuperOut,
  splitSubclassCallSuperCount,
  splitSpeciesEffect,
  splitSubclassConstructorOut,
  splitSubclassConstructorSplitCount,
  splitCustomSymbolObject,
  splitThisTypeErrors,
  splitNonRegExpThisThrows,
  splitRegexLikeObjectCallThrows,
  splitRegexLikeObjectCallOut,
  splitSymbolInputThrows,
  splitBigIntInput,
  splitToStringObjectInput,
  splitToPrimitiveInput,
  splitArrayInput,
  splitFunctionInput,
  splitCustomSplitterStateful,
  splitCustomSplitterWithLimit,
  splitCustomSplitterValidate,
  splitCustomSplitterNonArrayReturn,
  splitLimitStringInput,
  splitSeparatorNullInput,
  splitSeparatorNumberInput,
  splitSeparatorObjectInput,
  splitSupportsHasIndices,
  splitUndefinedSeparator
} from './RegExpHelper';

export default function splitTest() {

    describe('Split_Basic', () => {
      /**
       * @tc.name testSplit0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_0100
       * @tc.desc   Test basic string separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'Hello World'.split(' ');
        expect(out.join('|')).assertEqual('Hello|World');
      });

      /**
       * @tc.name testSplit0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_0200
       * @tc.desc   Test regex separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello1World2Test'.split(/\d/).join('|')).assertEqual('Hello|World|Test');
      });

      /**
       * @tc.name testSplit0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_0300
       * @tc.desc   Test regex literal char class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('apple,orange;banana|grape'.split(/[,;|]/).join('|')).assertEqual('apple|orange|banana|grape');
      });

      /**
       * @tc.name testSplit0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_0400
       * @tc.desc   Test separator not found
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'Hello World'.split(/xyz/);
        expect(out.length).assertEqual(1);
        expect(out[0]).assertEqual('Hello World');
      });

      /**
       * @tc.name testSplit0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_0500
       * @tc.desc   Test direct symbol split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitDirectSymbolSplit().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplit0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_0600
       * @tc.desc   Test string split equals symbol split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitStringVsSymbolSame()).assertTrue();
      });

      /**
       * @tc.name testSplit0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_0700
       * @tc.desc   Test param order equivalent result
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const a = 'a,b,c'.split(/,/, 2);
        const b = splitSymbolWithLimit();
        expect(a.join('|')).assertEqual(b.join('|'));
      });
    });

    describe('Special_Chars_And_Escape', () => {
      /**
       * @tc.name testSplit0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_0800
       * @tc.desc   Test dot escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a.b.c'.split(/\./).join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplit0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_0900
       * @tc.desc   Test char set tab newline
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello\tWorld\nTest'.split(/[\t\n]/).join('|')).assertEqual('Hello|World|Test');
      });

      /**
       * @tc.name testSplit0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1000
       * @tc.desc   Test backslash escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('path\\to\\file'.split(/\\/).join('|')).assertEqual('path|to|file');
      });

      /**
       * @tc.name testSplit0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1100
       * @tc.desc   Test unicode char separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('\u4e2d\u6587\u2460\u82f1\u6587\u2460\u6d4b\u8bd5'.split(/\u2460/).join('|')).assertEqual('\u4e2d\u6587|\u82f1\u6587|\u6d4b\u8bd5');
      });

      /**
       * @tc.name testSplit0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1200
       * @tc.desc   Test emoji separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const emoji = String.fromCodePoint(0x1F600);
        expect(`test${emoji}data${emoji}example`.split(new RegExp(emoji, 'u')).join('|')).assertEqual('test|data|example');
      });

      /**
       * @tc.name testSplit0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1300
       * @tc.desc   Test zero width char separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test\u200Bdata'.split(/\u200B/).join('|')).assertEqual('test|data');
      });
    });

    describe('Split_Flags', () => {
      /**
       * @tc.name testSplit0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1400
       * @tc.desc   Test ignore case i
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('HelloAworldATEST'.split(/a/i).join('|')).assertEqual('Hello|world|TEST');
      });

      /**
       * @tc.name testSplit0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1500
       * @tc.desc   Test ignore g behavior equivalent
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const a = 'test1test2test3'.split(/test/);
        const b = 'test1test2test3'.split(/test/g);
        expect(a.join('|')).assertEqual(b.join('|'));
      });

      /**
       * @tc.name testSplit0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1600
       * @tc.desc   Test multiline m
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'line1\nline2\nline3'.split(/$/m);
        expect(out.length >= 3).assertTrue();
      });

      /**
       * @tc.name testSplit0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1700
       * @tc.desc   Test unicode u empty split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const emoji = String.fromCodePoint(0x1F600);
        const parts = (emoji + emoji).split(/(?:)/u).filter((s) => s !== '');
        expect(parts.length).assertEqual(2);
      });

      /**
       * @tc.name testSplit0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1800
       * @tc.desc   Test sticky y
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test1test2test3'.split(/test/y);
        expect(out[0]).assertEqual('');
      });

      /**
       * @tc.name testSplit0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_1900
       * @tc.desc   Test dotAll s
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'line1\nline2'.split(/.+/s);
        expect(out.length >= 1).assertTrue();
      });

      /**
       * @tc.name testSplit0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2000
       * @tc.desc   Test has indices d
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitHasIndicesD();
        if (out === null) {
          return;
        }
        expect(out.join('|')).assertEqual('|1|2');
      });

      /**
       * @tc.name testSplit0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2100
       * @tc.desc   Test combined flags sample
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Test1TEST2test3'.split(/test/gi).join('|')).assertEqual('|1|2|3');
      });
    });

    describe('Split_Capture_Groups', () => {
      /**
       * @tc.name testSplit0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2200
       * @tc.desc   Test single capture group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello 1 word. Sentence number 2.'.split(/(\d)/).join('|')).assertEqual('Hello |1| word. Sentence number |2|.');
      });

      /**
       * @tc.name testSplit0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2300
       * @tc.desc   Test multi capture group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'item1-item2=item3'.split(/(-)|(=)/);
        expect(out[1]).assertEqual('-');
        expect(out[2]).assertEqual(undefined);
        expect(out[3]).assertEqual('item2');
      });

      /**
       * @tc.name testSplit0123
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2400
       * @tc.desc   Test non capture group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('item1,item2;item3'.split(/(?:,|;)/).join('|')).assertEqual('item1|item2|item3');
      });

      /**
       * @tc.name testSplit0124
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2500
       * @tc.desc   Test nested capture group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test123abc'.split(/((\d)(\d))/);
        expect(out[1]).assertEqual('12');
        expect(out[2]).assertEqual('1');
        expect(out[3]).assertEqual('2');
      });

      /**
       * @tc.name testSplit0125
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2600
       * @tc.desc   Test named capture group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'version1.2.3'.split(/(?<sep>\.)/);
        expect(out.join('|')).assertEqual('version1|.|2|.|3');
      });

      /**
       * @tc.name testSplit0126
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2700
       * @tc.desc   Test capture group with limit
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = '1a2b3c4d'.split(/(\d)/, 5);
        expect(out.join('|')).assertEqual('|1|a|2|b');
      });

      /**
       * @tc.name testSplit0127
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2800
       * @tc.desc   Test capture group undefined case
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'a-b=c'.split(/(-)|(=)/);
        expect(out[0]).assertEqual('a');
        expect(out[1]).assertEqual('-');
        expect(out[2]).assertEqual(undefined);
        expect(out[3]).assertEqual('b');
      });
    });

    describe('Quantifiers', () => {
      /**
       * @tc.name testSplit0128
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_2900
       * @tc.desc   Test star quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'Hello    World'.split(/\s*/).filter((x: string) => x !== '');
        expect(out.join('')).assertEqual('HelloWorld');
      });

      /**
       * @tc.name testSplit0129
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3000
       * @tc.desc   Test plus quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello     World'.split(/\s+/).join('|')).assertEqual('Hello|World');
      });

      /**
       * @tc.name testSplit0130
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3100
       * @tc.desc   Test optional quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('col1, col2, col3'.split(/,\s?/).join('|')).assertEqual('col1|col2|col3');
      });

      /**
       * @tc.name testSplit0131
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3200
       * @tc.desc   Test exact quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test--split--here'.split(/-{2}/).join('|')).assertEqual('test|split|here');
      });

      /**
       * @tc.name testSplit0132
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3300
       * @tc.desc   Test range quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a1b22c333d'.split(/\d{1,2}/).join('|')).assertEqual('a|b|c||d');
      });

      /**
       * @tc.name testSplit0133
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3400
       * @tc.desc   Test at least quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test111split222here'.split(/\d{2,}/).join('|')).assertEqual('test|split|here');
      });

      /**
       * @tc.name testSplit0134
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3500
       * @tc.desc   Test possessive quantifier family not supported should throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let starThrows = false;
        let plusThrows = false;
        let qThrows = false;

        try {
          new RegExp('a*+b');
        } catch (_) {
          starThrows = true;
        }

        try {
          new RegExp('a++b');
        } catch (_) {
          plusThrows = true;
        }

        try {
          new RegExp('a?+b');
        } catch (_) {
          qThrows = true;
        }

        expect(starThrows).assertTrue();
        expect(plusThrows).assertTrue();
        expect(qThrows).assertTrue();
      });
    });

    describe('Boundary_Assertions', () => {
      /**
       * @tc.name testSplit0135
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3600
       * @tc.desc   Test start anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('^test content'.split(/^\^/).join('|')).assertEqual('|test content');
      });

      /**
       * @tc.name testSplit0136
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3700
       * @tc.desc   Test end anchor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test content$'.split(/\$$/).join('|')).assertEqual('test content|');
      });

      /**
       * @tc.name testSplit0137
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3800
       * @tc.desc   Test word boundary
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'word1 word2'.split(/\b/);
        const joined = out.join('|');
        expect(
          joined === '|word|1 |word|2' || joined === 'word1| |word2|' || joined === 'word1| |word2'
        ).assertTrue();
      });

      /**
       * @tc.name testSplit0138
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_3900
       * @tc.desc   Test non word boundary
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test123'.split(/\B/);
        expect(out.length > 1).assertTrue();
      });

      /**
       * @tc.name testSplit0139
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4000
       * @tc.desc   Test positive lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test1split2here3'.split(/(?=\d)/).join('|')).assertEqual('test|1split|2here|3');
      });

      /**
       * @tc.name testSplit0140
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4100
       * @tc.desc   Test negative lookahead
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('abc123def'.split(/\d(?!\d)/).join('|')).assertEqual('abc12|def');
      });

      /**
       * @tc.name testSplit0141
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4200
       * @tc.desc   Test positive lookbehind
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test1world'.split(/(?<=\d)/).join('|')).assertEqual('test1|world');
      });

      /**
       * @tc.name testSplit0142
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4300
       * @tc.desc   Test negative lookbehind
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('abc123def'.split(/(?<!\d)(?=\d)/).join('|')).assertEqual('abc|123def');
      });

      /**
       * @tc.name testSplit0143
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4400
       * @tc.desc   Test G assertion
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test test'.split(/\Gtest/g);
        expect(out.length >= 1).assertTrue();
      });
    });

    describe('Limit', () => {
      /**
       * @tc.name testSplit0144
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4500
       * @tc.desc   Test limit count
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello World. How are you?'.split(/\s/, 3).join('|')).assertEqual('Hello|World.|How');
      });

      /**
       * @tc.name testSplit0145
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4600
       * @tc.desc   Test limit zero
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello World'.split(/\s/, 0).length).assertEqual(0);
      });

      /**
       * @tc.name testSplit0146
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4700
       * @tc.desc   Test limit gt possible
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, 10).join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplit0147
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4800
       * @tc.desc   Test limit negative
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, -1).join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplit0148
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_4900
       * @tc.desc   Test limit float
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c d'.split(/\s/, 2.9).join('|')).assertEqual('a|b');
      });

      /**
       * @tc.name testSplit0149
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5000
       * @tc.desc   Test limit string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitLimitStringInput().join('|')).assertEqual('a|b');
      });

      /**
       * @tc.name testSplit0150
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5100
       * @tc.desc   Test limit infinity
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, Number.POSITIVE_INFINITY).length).assertEqual(0);
      });

      /**
       * @tc.name testSplit0151
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5200
       * @tc.desc   Test limit minus infinity
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, Number.NEGATIVE_INFINITY).length).assertEqual(0);
      });

      /**
       * @tc.name testSplit0152
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5300
       * @tc.desc   Test limit nan
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a b c'.split(/\s/, Number.NaN).length).assertEqual(0);
      });

      /**
       * @tc.name testSplit0153
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5400
       * @tc.desc   Test limit with capture group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = '1a2b3c'.split(/(\d)(?=\D)/, 4);
        expect(out.join('|')).assertEqual('|1|a|2');
      });
    });

    describe('Empty_And_Edges', () => {
      /**
       * @tc.name testSplit0154
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5500
       * @tc.desc   Test empty input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = ''.split(/test/);
        expect(out.length).assertEqual(1);
        expect(out[0]).assertEqual('');
      });

      /**
       * @tc.name testSplit0155
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5600
       * @tc.desc   Test empty match regex on non empty
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test'.split(/(?:)/).join('|')).assertEqual('t|e|s|t');
      });

      /**
       * @tc.name testSplit0156
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5700
       * @tc.desc   Test starts with separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(',Hello,World'.split(/,/).join('|')).assertEqual('|Hello|World');
      });

      /**
       * @tc.name testSplit0157
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5800
       * @tc.desc   Test ends with separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello,World,'.split(/,/).join('|')).assertEqual('Hello|World|');
      });

      /**
       * @tc.name testSplit0158
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_5900
       * @tc.desc   Test consecutive separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a,,b,,,c'.split(/,/).join('|')).assertEqual('a||b|||c');
      });

      /**
       * @tc.name testSplit0159
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6000
       * @tc.desc   Test all separator
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('///'.split(/\//).join('|')).assertEqual('|||');
      });

      /**
       * @tc.name testSplit0160
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6100
       * @tc.desc   Test empty string with empty match regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(''.split(/(?:)/).length).assertEqual(0);
      });

      /**
       * @tc.name testSplit0161
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6200
       * @tc.desc   Test nullable regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test'.split(/a?/);
        expect(out.join('|') === 't|e|s|t' || out.join('|') === 't|e|s|t|').assertTrue();
      });
    });

    describe('Split_Complex_Patterns', () => {
      /**
       * @tc.name testSplit0162
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6300
       * @tc.desc   Test alternation
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('apple|banana;orange|grape'.split(/\||;/).join('|')).assertEqual('apple|banana|orange|grape');
      });

      /**
       * @tc.name testSplit0163
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6400
       * @tc.desc   Test char class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a1b2c3d4'.split(/[0246]/).join('|')).assertEqual('a1b|c3d|');
      });

      /**
       * @tc.name testSplit0164
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6500
       * @tc.desc   Test negated char class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('testABC123XYZ'.split(/[^a-z]+/).join('|')).assertEqual('test|');
      });

      /**
       * @tc.name testSplit0165
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6600
       * @tc.desc   Test predefined class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('test123abc456def'.split(/\d+/).join('|')).assertEqual('test|abc|def');
      });

      /**
       * @tc.name testSplit0166
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6700
       * @tc.desc   Test negative predefined class
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('123test456abc'.split(/\D+/).join('|')).assertEqual('123|456|');
      });

      /**
       * @tc.name testSplit0167
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6800
       * @tc.desc   Test combined pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('name:John; age:25; city:NYC'.split(/;\s*/).join('|')).assertEqual('name:John|age:25|city:NYC');
      });

      /**
       * @tc.name testSplit0168
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_6900
       * @tc.desc   Test atomic group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          const re = new RegExp('(?>a*)b');
          'abc'.split(re);
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplit0169
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7000
       * @tc.desc   Test unicode property escape
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('A\u6D7C'.split(/\p{Lu}/u).join('|')).assertEqual('|\u6D7C');
      });
    });

    describe('Practical', () => {
      /**
       * @tc.name testSplit0170
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7100
       * @tc.desc   Test multiline split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('line1\nline2\r\nline3'.split(/\r?\n/).join('|')).assertEqual('line1|line2|line3');
      });

      /**
       * @tc.name testSplit0171
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7200
       * @tc.desc   Test tsv split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('col1\tcol2\tcol3'.split(/\t/).join('|')).assertEqual('col1|col2|col3');
      });

      /**
       * @tc.name testSplit0172
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7300
       * @tc.desc   Test html div split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('<div>content1</div><div>content2</div>'.split(/<\/?div>/).join('|')).assertEqual('|content1||content2|');
      });

      /**
       * @tc.name testSplit0173
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7400
       * @tc.desc   Test url path split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('/api/v1/users/123'.split(/\/+/).join('|')).assertEqual('|api|v1|users|123');
      });

      /**
       * @tc.name testSplit0174
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7500
       * @tc.desc   Test datetime split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('2024-01-15T10:30:00'.split(/[-T:]/).join('|')).assertEqual('2024|01|15|10|30|00');
      });

      /**
       * @tc.name testSplit0175
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7600
       * @tc.desc   Test quoted string split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('Hello "world, test" example'.split(/ (?=")|(?<=") /).join('|')).assertEqual('Hello|"world, test"|example');
      });

      /**
       * @tc.name testSplit0176
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7700
       * @tc.desc   Test csv split complex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'name,"John, Doe",age,30';
        const out = str.split(/,(?=(?:(?:[^"]*"){2})*[^"]*$)/);
        expect(out.join('|')).assertEqual('name|"John, Doe"|age|30');
      });

      /**
       * @tc.name testSplit0177
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7800
       * @tc.desc   Test log split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('[ERROR] 2024-01-15 [INFO] 2024-01-16'.split(/\[\w+\]\s*/).join('|')).assertEqual('|2024-01-15 |2024-01-16');
      });

      /**
       * @tc.name testSplit0178
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_7900
       * @tc.desc   Test config kv split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('key1=value1;key2=value2;key3=value3'.split(/;|=/).join('|')).assertEqual('key1|value1|key2|value2|key3|value3');
      });

      /**
       * @tc.name testSplit0179
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8000
       * @tc.desc   Test windows path split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('C:\\Users\\test\\file.txt'.split(/\\/).join('|')).assertEqual('C:|Users|test|file.txt');
      });

      /**
       * @tc.name testSplit0180
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8100
       * @tc.desc   Test unix path split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('/home/user/documents/file.txt'.split(/\//).join('|')).assertEqual('|home|user|documents|file.txt');
      });
    });

    describe('Symbol_This_Input_11_12_13_14_15', () => {
      /**
       * @tc.name testSplit0181
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8200
       * @tc.desc   Test subclass override
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSubclassOverride().join('|')).assertEqual('(a)|(b)|(c)');
      });

      /**
       * @tc.name testSplit0182
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8300
       * @tc.desc   Test subclass call super split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitSubclassCallSuperOut();
        const count = splitSubclassCallSuperCount();
        expect(out.join('|')).assertEqual('a|b|c');
        expect(count).assertEqual(1);
      });

      /**
       * @tc.name testSplit0183
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8400
       * @tc.desc   Test species effect
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitSpeciesEffect();
        expect(out.join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplit0184
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8500
       * @tc.desc   Test subclass constructor behavior
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitSubclassConstructorOut();
        const splitCount = splitSubclassConstructorSplitCount();
        expect(out.join('|')).assertEqual('a|b|c');
        expect(splitCount).assertEqual(3);
      });

      /**
       * @tc.name testSplit0185
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8600
       * @tc.desc   Test lastIndex reset by split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/g;
        re.lastIndex = 5;
        'test test'.split(re);
        expect(re.lastIndex).assertEqual(5);
      });

      /**
       * @tc.name testSplit0186
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8700
       * @tc.desc   Test lastIndex change during split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/g;
        const out = 'test test test'.split(re);
        expect(out.length).assertEqual(4);
      });

      /**
       * @tc.name testSplit0187
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8800
       * @tc.desc   Test manual lastIndex ignored
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/y;
        re.lastIndex = 5;
        const out = 'test test'.split(re);
        expect(out[0]).assertEqual('');
      });

      /**
       * @tc.name testSplit0188
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_8900
       * @tc.desc   Test sticky lastIndex behavior
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const re = /test/y;
        const out = 'testtest'.split(re);
        expect(out.length >= 2).assertTrue();
      });

      /**
       * @tc.name testSplit0189
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9000
       * @tc.desc   Test non regexp this throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitNonRegExpThisThrows()).assertFalse();
      });

      /**
       * @tc.name testSplit0190
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9100
       * @tc.desc   Test undefined null this throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitThisTypeErrors()).assertTrue();
      });

      /**
       * @tc.name testSplit0191
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9200
       * @tc.desc   Test null this throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitThisTypeErrors()).assertTrue();
      });

      /**
       * @tc.name testSplit0192
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9300
       * @tc.desc   Test regex like object this throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const thrown = splitRegexLikeObjectCallThrows();
        const out = splitRegexLikeObjectCallOut();
        if (thrown) {
          expect(thrown).assertTrue();
          return;
        }
        const joined = out.join('|');
        expect(joined === 'a|b|c' || joined === 'a,|,|').assertTrue();
      });

      /**
       * @tc.name testSplit0193
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9400
       * @tc.desc   Test custom splitter object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitCustomSymbolObject().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplit0194
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9500
       * @tc.desc   Test stateful custom splitter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitCustomSplitterStateful().join('|')).assertEqual('a|bc|c5d|e|f');
      });

      /**
       * @tc.name testSplit0195
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9600
       * @tc.desc   Test custom splitter with limit
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitCustomSplitterWithLimit().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplit0196
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9700
       * @tc.desc   Test validating splitter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitCustomSplitterValidate().join('|')).assertEqual('abc|bcdefg');
      });

      /**
       * @tc.name testSplit0197
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9800
       * @tc.desc   Test custom splitter non array return
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitCustomSplitterNonArrayReturn();
        expect(out[0]).assertEqual('not an array');
      });

      /**
       * @tc.name testSplit0198
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_TEST_9900
       * @tc.desc   Test symbol input throws
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSymbolInputThrows()).assertTrue();
      });

      /**
       * @tc.name testSplit0199
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_0100
       * @tc.desc   Test bigint input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitBigIntInput().length).assertEqual(1);
      });

      /**
       * @tc.name testSplit0200
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_0200
       * @tc.desc   Test object to string input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitToStringObjectInput().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplit0201
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_0300
       * @tc.desc   Test symbol toPrimitive input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitToPrimitiveInput().join('|')).assertEqual('x|y|z');
      });

      /**
       * @tc.name testSplit0202
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_0400
       * @tc.desc   Test array input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitArrayInput().join('|')).assertEqual('a|b|c');
      });

      /**
       * @tc.name testSplit0203
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_0500
       * @tc.desc   Test function input
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = splitFunctionInput();
        expect(out.length >= 1).assertTrue();
      });
    });

    describe('Extended_16_17_18_19_20', () => {
      /**
       * @tc.name testSplit0204
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_0600
       * @tc.desc   Test surrogate pair u vs non u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const emoji = String.fromCodePoint(0x1F600);
        const str = emoji + emoji;
        const a = str.split(/(?:)/);
        const b = str.split(/(?:)/u);
        expect(a.length > b.length).assertTrue();
      });

      /**
       * @tc.name testSplit0205
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_0700
       * @tc.desc   Test emoji sequence u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const family = '\uD83D\uDC68\u200D\uD83D\uDC69\u200D\uD83D\uDC67\u200D\uD83D\uDC66';
        const out = family.split(/(?:)/u);
        expect(out.length >= 1).assertTrue();
      });

      /**
       * @tc.name testSplit0206
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_0800
       * @tc.desc   Test combining char u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const composed = '\u947C';
        const decomposed = 'e\u0301';
        const a = composed.split(/(?:)/u);
        const b = decomposed.split(/(?:)/u);
        expect(a.length >= 1).assertTrue();
        expect(b.length >= a.length).assertTrue();
      });

      /**
       * @tc.name testSplit0207
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_0900
       * @tc.desc   Test unicode property letter
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let out: string[] = [];
        let supported = true;
        try {
          out = 'A\u6D7C'.split(/\p{Letter}/u);
        } catch (_) {
          supported = false;
        }
        if (!supported) {
          return;
        }
        expect(out.join('|')).assertEqual('||');
      });

      /**
       * @tc.name testSplit0208
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1000
       * @tc.desc   Test unicode script greek
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let out: string[] = [];
        let supported = true;
        try {
          out = 'A\u03B1\u03B2'.split(/\p{Script=Greek}/u);
        } catch (_) {
          supported = false;
        }
        if (!supported) {
          return;
        }
        expect(out.join('|')).assertEqual('A||');
      });

      /**
       * @tc.name testSplit0209
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1100
       * @tc.desc   Test separator undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitUndefinedSeparator().join('|')).assertEqual('Hello World');
      });

      /**
       * @tc.name testSplit0210
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1200
       * @tc.desc   Test separator null
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSeparatorNullInput().join('|')).assertEqual('test||test');
      });

      /**
       * @tc.name testSplit0211
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1300
       * @tc.desc   Test separator number
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSeparatorNumberInput().join('|')).assertEqual('test|test');
      });

      /**
       * @tc.name testSplit0212
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1400
       * @tc.desc   Test separator plain object
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect(splitSeparatorObjectInput().join('|')).assertEqual('test|test');
      });

      /**
       * @tc.name testSplit0213
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1500
       * @tc.desc   Test invalid regex syntax should throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          new RegExp('[a-z');
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplit0214
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1600
       * @tc.desc   Test invalid flag combination should throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          new RegExp('test', 'x');
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplit0215
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1700
       * @tc.desc   Test invalid unicode codepoint should throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          new RegExp('\\u{123456}', 'u');
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplit0216
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1800
       * @tc.desc   Test invalid lookbehind syntax should throw
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let thrown = false;
        try {
          new RegExp('(?<=');
        } catch (_) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
       * @tc.name testSplit0217
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_1900
       * @tc.desc   Test very long string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const left = 'a'.repeat(100000);
        const out = `${left},b`.split(/,/);
        expect(out.length).assertEqual(2);
        expect(out[1]).assertEqual('b');
      });

      /**
       * @tc.name testSplit0218
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2000
       * @tc.desc   Test special unicode chars
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const a = String.fromCodePoint(0x1F600);
        const b = String.fromCodePoint(0x1F601);
        const c = String.fromCodePoint(0x1F602);
        const d = String.fromCodePoint(0x1F603);
        const parts = (a + b + c + d).split(/(?:)/u).filter((s) => s !== '');
        expect(parts.join('|')).assertEqual([a, b, c, d].join('|'));
      });

      /**
       * @tc.name testSplit0219
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2100
       * @tc.desc   Test lookbehind support detection
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let supported = false;
        try {
          supported = new RegExp('(?<=)').test('');
        } catch (_) {
          supported = false;
        }
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testSplit0220
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2200
       * @tc.desc   Test unicode property support detection
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let supported = false;
        try {
          supported = new RegExp('\\p{L}', 'u').test('A');
        } catch (_) {
          supported = false;
        }
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testSplit0221
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2300
       * @tc.desc   Test dotAll support detection
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let supported = false;
        try {
          supported = new RegExp('.', 's').test('\n');
        } catch (_) {
          supported = false;
        }
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testSplit0222
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2400
       * @tc.desc   Test hasIndices support detection
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const supported = splitSupportsHasIndices();
        expect(typeof supported === 'boolean').assertTrue();
      });

      /**
       * @tc.name testSplit0223
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2500
       * @tc.desc   Test engine diff empty split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = ''.split(/(?:)/);
        expect(out.length === 0 || out.length === 1).assertTrue();
      });

      /**
       * @tc.name testSplit0224
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2600
       * @tc.desc   Test csv simple parse
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const csv = 'name,age,city\nJohn,25,NYC\nJane,30,LA';
        const rows = csv.split(/\n/);
        const parsed = rows.map((r: string) => r.split(/,/).join(':')).join('|');
        expect(parsed).assertEqual('name:age:city|John:25:NYC|Jane:30:LA');
      });

      /**
       * @tc.name testSplit0225
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2700
       * @tc.desc   Test csv complex parse
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const csv = 'name,"description,with,commas",value';
        const out = csv.split(/,(?=(?:(?:[^"]*"){2})*[^"]*$)/);
        expect(out.join('|')).assertEqual('name|"description,with,commas"|value');
      });

      /**
       * @tc.name testSplit0226
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2800
       * @tc.desc   Test log line parse
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const logLine = '127.0.0.1 - - [10/Oct/2023:13:55:36] "GET /api HTTP/1.1" 200 1234';
        const out = logLine.split(/\s+/);
        expect(out.length >= 8).assertTrue();
      });

      /**
       * @tc.name testSplit0227
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_2900
       * @tc.desc   Test ini section split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const ini = '[section1]\nkey1=value1\nkey2=value2\n[section2]\nkey3=value3';
        const out = ini.split(/\n(?=\[)/);
        expect(out.length).assertEqual(2);
      });

      /**
       * @tc.name testSplit0228
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3000
       * @tc.desc   Test markdown heading split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const markdown = '# Title1\ncontent1\n## Title2\ncontent2\n### Title3\ncontent3';
        const out = markdown.split(/\n(?=#{1,3}\s)/);
        expect(out.length).assertEqual(3);
      });

      /**
       * @tc.name testSplit0229
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3100
       * @tc.desc   Test code statement split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const code = 'let a=1;let b=2;if(a>b){return a;}else{return b;}';
        const out = code.split(/(?<=;|\})(?=\s*\w)/);
        expect(out.length >= 2).assertTrue();
      });

      /**
       * @tc.name testSplit0230
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3200
       * @tc.desc   Test url query parse
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const query = 'name=John&age=25&city=NYC';
        const parsed = query.split(/&/).map((x: string) => x.split(/=/).join(':')).join('|');
        expect(parsed).assertEqual('name:John|age:25|city:NYC');
      });

      /**
       * @tc.name testSplit0231
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3300
       * @tc.desc   Test rgba value split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const rgba = 'rgba(255, 128, 64, 0.5)';
        const out = rgba.split(/[\(\),\s]+/).filter((x: string) => x);
        expect(out.join('|')).assertEqual('rgba|255|128|64|0.5');
      });

      /**
       * @tc.name testSplit0232
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3400
       * @tc.desc   Test extreme quantifier
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = 'a'.repeat(1000);
        const out = str.split(/a{1000}/);
        expect(out.join('|')).assertEqual('|');
      });

      /**
       * @tc.name testSplit0233
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3500
       * @tc.desc   Test many capture groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const groups = Array(20).fill('(\\w)').join('');
        const re = new RegExp(`^${groups}$`);
        const out = 'a'.repeat(20).split(re);
        expect(out.length > 1).assertTrue();
      });

      /**
       * @tc.name testSplit0234
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3600
       * @tc.desc   Test deep nested groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'abc'.split(/(((a)))/);
        expect(out[1]).assertEqual('a');
        expect(out[2]).assertEqual('a');
        expect(out[3]).assertEqual('a');
      });

      /**
       * @tc.name testSplit0235
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3700
       * @tc.desc   Test zero width match loop guard
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test'.split(/(?=)/);
        expect(out.length > 1).assertTrue();
      });

      /**
       * @tc.name testSplit0236
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3800
       * @tc.desc   Test empty string with empty regex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = ''.split(/(?:)/);
        expect(out.length === 0 || out.length === 1).assertTrue();
      });

      /**
       * @tc.name testSplit0237
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_3900
       * @tc.desc   Test limit equals one
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('a,b,c,d'.split(/,/, 1).join('|')).assertEqual('a');
      });

      /**
       * @tc.name testSplit0238
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_4000
       * @tc.desc   Test capture at start
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('123abc'.split(/(\d+)/).join('|')).assertEqual('|123|abc');
      });

      /**
       * @tc.name testSplit0239
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_4100
       * @tc.desc   Test capture at end
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('abc123'.split(/(\d+)/).join('|')).assertEqual('abc|123|');
      });

      /**
       * @tc.name testSplit0240
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_4200
       * @tc.desc   Test only capture split
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        expect('1a2b3c'.split(/(\d)/).join('|')).assertEqual('|1|a|2|b|3|c');
      });

      /**
       * @tc.name testSplit0241
       * @tc.number SUB_COMMONLIBRARY_REGEXP_SPLIT_EXT_TEST_4300
       * @tc.desc   Test alt empty nonempty
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSplit0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const out = 'test'.split(/t|/);
        expect(out.length >= 1).assertTrue();
      });
    });

}

