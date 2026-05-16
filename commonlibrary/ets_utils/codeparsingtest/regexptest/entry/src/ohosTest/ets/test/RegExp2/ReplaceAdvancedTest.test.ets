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

export default function replaceAdvancedTest() {

    describe('lastIndex_Property_Tests', () => {
      /**
       * @tc.name testReplace0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0100
      * @tc.desc   Test Non-global replace honors lastIndex as search start
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc abc";
        const regex = /abc/;
        regex.lastIndex = 4;
        const result = str.replace(regex, "XYZ");
        expect(result).assertEqual("XYZ abc");
      });

      /**
       * @tc.name testReplace0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0200
      * @tc.desc   Test Global replace replaces all matches and resets lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc abc abc";
        const regex = /abc/g;
        regex.lastIndex = 4;
        const result = str.replace(regex, "XYZ");
        expect(result).assertEqual("XYZ XYZ XYZ");
        expect(regex.lastIndex).assertEqual(0);
      });

      /**
       * @tc.name testReplace0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0300
      * @tc.desc   Test Sticky replace respects lastIndex positioning
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "aaa";
        const regex = /a/y;
        regex.lastIndex = 1;
        const result = str.replace(regex, "b");
        expect(result).assertEqual("aba");
      });

      /**
       * @tc.name testReplace0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0400
      * @tc.desc   Test Global replace after manually setting lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "test test";
        const regex = /test/g;
        regex.lastIndex = 5;
        const result = str.replace(regex, "XYZ");
        expect(result).assertEqual("XYZ XYZ");
        expect(regex.lastIndex).assertEqual(0);
      });

      /**
       * @tc.name testReplace0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0500
      * @tc.desc   Test lastIndex returns to zero after global replace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc abc";
        const regex = /abc/g;
        const before = regex.lastIndex;
        str.replace(regex, "XYZ");
        const after = regex.lastIndex;
        expect(after).assertEqual(0);
      });
    });

    describe('ReplaceAdvanced_Boundary_Value_Tests', () => {
      /**
       * @tc.name testReplace0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0600
      * @tc.desc   Test Replace on empty source string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "";
        const result = str.replace(/a/, "b");
        expect(result).assertEqual("");
      });

      /**
       * @tc.name testReplace0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0700
      * @tc.desc   Test Empty-match regex inserts replacement at position zero
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "test";
        const result = str.replace(/(?:)/, "_");
        expect(result).assertEqual("_test");
      });

      /**
       * @tc.name testReplace0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0800
      * @tc.desc   Test Single-character string replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "a";
        const result = str.replace(/a/, "b");
        expect(result).assertEqual("b");
      });

      /**
       * @tc.name testReplace0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0900
      * @tc.desc   Test Long string global replace preserves length
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "a".repeat(10000);
        const result = str.replace(/a/g, "b");
        expect(result.length).assertEqual(10000);
        expect(result).assertEqual("b".repeat(10000));
      });

      /**
       * @tc.name testReplace0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1000
      * @tc.desc   Test Replace matched segment with empty string
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/World/, "");
        expect(result).assertEqual("Hello ");
      });

      /**
       * @tc.name testReplace0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1100
      * @tc.desc   Test Replace whole string using start/end anchors
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello";
        const result = str.replace(/^.*$/, "Bye");
        expect(result).assertEqual("Bye");
      });

      /**
       * @tc.name testReplace0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1200
      * @tc.desc   Test Emoji replace with Unicode flag on surrogate pairs
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "\uD83D\uDE00\uD83D\uDE00";
        const resultWithU = str.replace(/\uD83D\uDE00/gu, "X");
        expect(resultWithU).assertEqual("XX");
      });
    });

    describe('Special_Chars_And_Unicode', () => {
      /**
       * @tc.name testReplace0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1300
      * @tc.desc   Test Replace newline and tab with spaces
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello\nWorld\t!";
        const result = str.replace(/\n/g, " ").replace(/\t/g, "  ");
        expect(result).assertEqual("Hello World  !");
      });

      /**
       * @tc.name testReplace0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1400
      * @tc.desc   Test Replace accented Unicode character
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "caf\u00e9";
        const result = str.replace(/\u00e9/, "e");
        expect(result).assertEqual("cafe");
      });

      /**
       * @tc.name testReplace0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1500
      * @tc.desc   Test Replace emoji in plain text
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello \uD83D\uDE00 World";
        const result = str.replace(/\uD83D\uDE00/g, ":-)");
        expect(result).assertEqual("Hello :-) World");
      });

      /**
       * @tc.name testReplace0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1600
      * @tc.desc   Test Replace Unicode math digit with u flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const mathSansHigh = 55349;
        const mathSansDigitZeroLow = 57240;
        const mathSansDigitOneLow = 57241;
        const mathSansDigitTwoLow = 57242;
        const mathZero = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow);
        const str = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow, mathSansHigh, mathSansDigitOneLow,
          mathSansHigh, mathSansDigitTwoLow);
        const result = str.replace(new RegExp(mathZero, 'gu'), '0');
        const digitOne = String.fromCharCode(mathSansHigh, mathSansDigitOneLow);
        const digitTwo = String.fromCharCode(mathSansHigh, mathSansDigitTwoLow);
        expect(result).assertEqual('0' + digitOne + digitTwo);
      });

      /**
       * @tc.name testReplace0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1700
      * @tc.desc   Test Surrogate pair handling with and without global u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "\uD83D\uDE00\uD83D\uDE00";
        const result1 = str.replace(/\uD83D\uDE00/u, "X");
        const result2 = str.replace(/\uD83D\uDE00/gu, "X");
        expect(result1).assertEqual("X\uD83D\uDE00");
        expect(result2).assertEqual("XX");
      });

      /**
       * @tc.name testReplace0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1800
      * @tc.desc   Test Combining character replace with u flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "e\u0301";
        const result = str.replace(/\u0301/u, "");
        expect(result).assertEqual("e");
      });

      /**
       * @tc.name testReplace0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1900
      * @tc.desc   Test Partial replace in complex emoji sequence
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "\uD83D\uDE00\uD83D\uDE00\uD83D\uDE00";
        const result = str.replace(/\uD83D\uDE00/gu, "XX");
        expect(result).not().assertEqual(str);
      });

      /**
       * @tc.name testReplace0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2000
      * @tc.desc   Test Unicode property escape Script=Greek
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "ABC \u03b1\u03b2\u03b3";
        const result = str.replace(/\p{Script=Greek}/gu, "X");
        expect(result).assertEqual("ABC XXX");
      });
    });

    describe('Regex_Flag_Interactions', () => {
      /**
       * @tc.name testReplace0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2100
      * @tc.desc   Test Sticky y flag replace with lastIndex
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "aaa";
        const regex = /a/y;
        regex.lastIndex = 1;
        const result = str.replace(regex, "b");
        expect(result).assertEqual("aba");
      });

      /**
       * @tc.name testReplace0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2200
      * @tc.desc   Test dotAll s flag matches across newline
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello\nWorld";
        const result = str.replace(/Hello.World/s, "Hi");
        expect(result).assertEqual("Hi");
      });

      /**
       * @tc.name testReplace0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2300
      * @tc.desc   Test Combined gim and sm flag replace behavior
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Test\nTEST\ntest";
        const result1 = str.replace(/test/gim, "XYZ");
        const result2 = str.replace(/.+/sm, "ABC");
        expect(result1).assertEqual("XYZ\nXYZ\nXYZ");
        expect(result2).assertEqual("ABC");
      });

      /**
       * @tc.name testReplace0123
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2400
      * @tc.desc   Test Compare first-only vs global replace
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "test test test";
        const result1 = str.replace(/test/, "XYZ");
        const result2 = str.replace(/test/g, "XYZ");
        expect(result1).assertEqual("XYZ test test");
        expect(result2).assertEqual("XYZ XYZ XYZ");
      });
    });

}
