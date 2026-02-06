/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface RegexMethodsResult {
  exec: string | undefined;
  test: boolean;
  match: string | undefined;
  search: number;
  replace: string;
}

export default function RegularExpressions14Test() {
  describe('RegularExpressions14Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
    afterAll(async () => {
      await Utils.msSleep(300);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number REGEX_ESCAPED_DOT_0100
     * @tc.name testRegexEscapedDot0001
     * @tc.desc Verify escaped dot matches literal dot.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedDot0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re1: RegExp = new RegExp('\\.');
      const result1: boolean = re1.test("test.txt");

      expect(result1).assertTrue();
    });

    /**
     * @tc.number REGEX_UNESCAPED_DOT_0100
     * @tc.name testRegexUnescapedDot0001
     * @tc.desc Verify unescaped dot matches any character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedDot0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re2: RegExp = new RegExp('.');
      const result2: boolean = re2.test("test");

      expect(result2).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_STAR_0100
     * @tc.name testRegexEscapedStar0001
     * @tc.desc Verify escaped star matches literal star.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedStar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re3: RegExp = new RegExp('\\*');
      const result3: boolean = re3.test("a*b");

      expect(result3).assertTrue();
    });

    /**
     * @tc.number REGEX_UNESCAPED_STAR_0100
     * @tc.name testRegexUnescapedStar0001
     * @tc.desc Verify unescaped star matches zero or more occurrences.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedStar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re4: RegExp = new RegExp('a*');
      const result4: boolean = re4.test("aaab");

      expect(result4).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_PLUS_0100
     * @tc.name testRegexEscapedPlus0001
     * @tc.desc Verify escaped plus matches literal plus.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedPlus0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re5: RegExp = new RegExp('\\+');
      const result5: boolean = re5.test("1+2=3");

      expect(result5).assertTrue();
    });

    /**
     * @tc.number REGEX_UNESCAPED_PLUS_0100
     * @tc.name testRegexUnescapedPlus0001
     * @tc.desc Verify unescaped plus matches one or more occurrences.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedPlus0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re6: RegExp = new RegExp('a+');
      const result6: boolean = re6.test("aaab");

      expect(result6).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_QUESTION_0100
     * @tc.name testRegexEscapedQuestion0001
     * @tc.desc Verify escaped question mark matches literal question mark.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedQuestion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re7: RegExp = new RegExp('\\?');
      const result7: boolean = re7.test("Do you know?");

      expect(result7).assertTrue();
    });

    /**
     * @tc.number REGEX_UNESCAPED_QUESTION_0100
     * @tc.name testRegexUnescapedQuestion0001
     * @tc.desc Verify unescaped question mark matches zero or one occurrence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedQuestion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re8: RegExp = new RegExp('a?');
      const result8: boolean = re8.test("aaab");

      expect(result8).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_PAREN_0100
     * @tc.name testRegexEscapedParen0001
     * @tc.desc Verify escaped parentheses match literal parentheses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedParen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re9: RegExp = new RegExp('\\(');
      const result9: boolean = re9.test("(test)");

      expect(result9).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_RIGHT_PAREN_0100
     * @tc.name testRegexEscapedRightParen0001
     * @tc.desc Verify escaped right parenthesis matches literal right parenthesis.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedRightParen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re10: RegExp = new RegExp('\\)');
      const result10: boolean = re10.test("(test)");

      expect(result10).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_BRACKET_0100
     * @tc.name testRegexEscapedBracket0001
     * @tc.desc Verify escaped brackets match literal brackets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedBracket0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re11: RegExp = new RegExp('\\[');
      const result11: boolean = re11.test("[abc]");

      expect(result11).assertTrue();
    });
    /**
     * @tc.number REGEX_ESCAPED_RIGHT_BRACKET_0100
     * @tc.name testRegexEscapedRightBracket0001
     * @tc.desc Verify escaped right bracket matches literal right bracket.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedRightBracket0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re12: RegExp = new RegExp('\\]');
      const result12: boolean = re12.test("[abc]");

      expect(result12).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_BRACE_0100
     * @tc.name testRegexEscapedBrace0001
     * @tc.desc Verify escaped braces match literal braces.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedBrace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re13: RegExp = new RegExp('\\{');
      const result13: boolean = re13.test("{1,3}");

      expect(result13).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_RIGHT_BRACE_0100
     * @tc.name testRegexEscapedRightBrace0001
     * @tc.desc Verify escaped right brace matches literal right brace.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedRightBrace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re14: RegExp = new RegExp('\\}');
      const result14: boolean = re14.test("{1,3}");

      expect(result14).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_BACKSLASH_0100
     * @tc.name testRegexEscapedBackslash0001
     * @tc.desc Verify escaped backslash matches literal backslash.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedBackslash0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re15: RegExp = new RegExp('\\\\');
      const result15: boolean = re15.test("C:\\test");

      expect(result15).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_PIPE_0100
     * @tc.name testRegexEscapedPipe0001
     * @tc.desc Verify escaped pipe matches literal pipe.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedPipe0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re16: RegExp = new RegExp('\\|');
      const result16: boolean = re16.test("a|b");

      expect(result16).assertTrue();
    });

    /**
     * @tc.number REGEX_UNESCAPED_PIPE_0100
     * @tc.name testRegexUnescapedPipe0001
     * @tc.desc Verify unescaped pipe works as OR operator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedPipe0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re17: RegExp = new RegExp('a|b');
      const result17: boolean = re17.test("cba");

      expect(result17).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_CARET_0100
     * @tc.name testRegexEscapedCaret0001
     * @tc.desc Verify escaped caret matches literal caret.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedCaret0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re18: RegExp = new RegExp('\\^');
      const result18: boolean = re18.test("^start");

      expect(result18).assertTrue();
    });

    /**
     * @tc.number REGEX_UNESCAPED_CARET_0100
     * @tc.name testRegexUnescapedCaret0001
     * @tc.desc Verify unescaped caret matches start of string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedCaret0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re19: RegExp = new RegExp('^start');
      const result19: boolean = re19.test("start here");

      expect(result19).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_DOLLAR_0100
     * @tc.name testRegexEscapedDollar0001
     * @tc.desc Verify escaped dollar sign matches literal dollar sign.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedDollar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re20: RegExp = new RegExp('\\$');
      const result20: boolean = re20.test("cost $50");

      expect(result20).assertTrue();
    });

    /**
     * @tc.number REGEX_DOLLAR_END_ANCHOR_0100
     * @tc.name testRegexDollarEndAnchor0001
     * @tc.desc Verify unescaped dollar sign matches end of string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDollarEndAnchor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re21: RegExp = new RegExp('end$');
      const result21: boolean = re21.test("this is the end");

      expect(result21).assertTrue();
    });

    /**
     * @tc.number REGEX_DIGIT_CLASS_0100
     * @tc.name testRegexDigitClass0001
     * @tc.desc Verify \d matches digit characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDigitClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re22: RegExp = new RegExp('\\d');
      const result22: boolean = re22.test("abc123");

      expect(result22).assertTrue();
    });
    /**
     * @tc.number REGEX_NON_DIGIT_CLASS_0100
     * @tc.name testRegexNonDigitClass0001
     * @tc.desc Verify \D matches non-digit characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonDigitClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re23: RegExp = new RegExp('\\D');
      const result23: boolean = re23.test("123abc");

      expect(result23).assertTrue();
    });

    /**
     * @tc.number REGEX_WORD_CLASS_0100
     * @tc.name testRegexWordClass0001
     * @tc.desc Verify \w matches word characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re24: RegExp = new RegExp('\\w');
      const result24: boolean = re24.test("###");

      expect(result24).assertFalse();
    });

    /**
     * @tc.number REGEX_NON_WORD_CLASS_0100
     * @tc.name testRegexNonWordClass0001
     * @tc.desc Verify \W matches non-word characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWordClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re25: RegExp = new RegExp('\\W');
      const result25: boolean = re25.test("abc123_");

      expect(result25).assertFalse();
    });

    /**
     * @tc.number REGEX_WHITESPACE_CLASS_0100
     * @tc.name testRegexWhitespaceClass0001
     * @tc.desc Verify \s matches whitespace characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWhitespaceClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re26: RegExp = new RegExp('\\s');
      const result26: boolean = re26.test("hello world");

      expect(result26).assertTrue();
    });

    /**
     * @tc.number REGEX_NON_WHITESPACE_CLASS_0100
     * @tc.name testRegexNonWhitespaceClass0001
     * @tc.desc Verify \S matches non-whitespace characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWhitespaceClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re27: RegExp = new RegExp('\\S');
      const result27: boolean = re27.test("   ");

      expect(result27).assertFalse();
    });

    /**
     * @tc.number REGEX_TAB_CHAR_0100
     * @tc.name testRegexTabChar0001
     * @tc.desc Verify \t matches tab character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTabChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re28: RegExp = new RegExp('\\t');
      const result28: boolean = re28.test("a\tb");

      expect(result28).assertTrue();
    });

    /**
     * @tc.number SUB_REGEX_CARRIAGE_RETURN_0100
     * @tc.name testRegexCarriageReturn0001
     * @tc.desc Verify \r matches carriage return.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCarriageReturn0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re29: RegExp = new RegExp('\\r');
      const result29: boolean = re29.test("line1\rline2");

      expect(result29).assertTrue();
    });

    /**
     * @tc.number REGEX_NEWLINE_0100
     * @tc.name testRegexNewline0001
     * @tc.desc Verify \n matches newline character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNewline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re30: RegExp = new RegExp('\\n');
      const result30: boolean = re30.test("first line\nsecond line");

      expect(result30).assertTrue();
    });

    /**
     * @tc.number SUB_REGEX_VERTICAL_TAB_0100
     * @tc.name testRegexVerticalTab0001
     * @tc.desc Verify \v matches vertical tab.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexVerticalTab0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re31: RegExp = new RegExp('\\v');
      const result31: boolean = re31.test("text\vmore text");

      expect(result31).assertTrue();
    });

    /**
     * @tc.number SUB_REGEX_FORM_FEED_0100
     * @tc.name testRegexFormFeed0001
     * @tc.desc Verify \f matches form feed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFormFeed0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re32: RegExp = new RegExp('\\f');
      const result32: boolean = re32.test("page1\fpage2");

      expect(result32).assertTrue();
    });

    /**
     * @tc.number REGEX_WORD_BOUNDARY_0100
     * @tc.name testRegexWordBoundary0001
     * @tc.desc Verify \b matches word boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re33: RegExp = new RegExp('\\bword\\b');
      const result33: boolean = re33.test("a word here");

      expect(result33).assertTrue();
    });

    /**
     * @tc.number SUB_REGEX_NON_WORD_BOUNDARY_0100
     * @tc.name testRegexNonWordBoundary0001
     * @tc.desc Verify \B matches non-word boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWordBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re34: RegExp = new RegExp('\\Bword\\B');
      const result34: boolean = re34.test("swordsmith");

      expect(result34).assertTrue();
    });

    /**
     * @tc.number SUB_REGEX_NULL_CHAR_0100
     * @tc.name testRegexNullChar0001
     * @tc.desc Verify \0 matches null character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNullChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re35: RegExp = new RegExp('\\0');
      const result35: boolean = re35.test("a\0b");

      expect(result35).assertTrue();
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_DOT_0100
     * @tc.name testRegexCharsetEscapedDot0001
     * @tc.desc Verify escaped dot in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedDot0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re36: RegExp = new RegExp('[.]');
      const result36: boolean = re36.test("a.b");

      expect(result36).assertTrue();
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_STAR_0100
     * @tc.name testRegexCharsetEscapedStar0001
     * @tc.desc Verify escaped star in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedStar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re37: RegExp = new RegExp('[*]');
      const result37: boolean = re37.test("a*b");

      expect(result37).assertTrue();
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_PLUS_0100
     * @tc.name testRegexCharsetEscapedPlus0001
     * @tc.desc Verify escaped plus in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedPlus0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re38: RegExp = new RegExp('[+]');
      const result38: boolean = re38.test("a+b");

      expect(result38).assertTrue();
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_QUESTION_0100
     * @tc.name testRegexCharsetEscapedQuestion0001
     * @tc.desc Verify escaped question mark in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedQuestion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re39: RegExp = new RegExp('[?]');
      const result39: boolean = re39.test("a?b");

      expect(result39).assertTrue();
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_PAREN_0100
     * @tc.name testRegexCharsetEscapedParen0001
     * @tc.desc Verify escaped parenthesis in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedParen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re40: RegExp = new RegExp('[(]');
      const result40: boolean = re40.test("a(b");

      expect(result40).assertTrue();
    });

    /**
     * @tc.number REGEX_UNICODE_ESCAPE_0100
     * @tc.name testRegexUnicodeEscape0001
     * @tc.desc Verify Unicode escape sequence matches specific character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re41: RegExp = new RegExp('\\u0041');
      const result41: boolean = re41.test("A");

      expect(result41).assertTrue();
    });

    /**
     * @tc.number REGEX_UNICODE_CHINESE_0100
     * @tc.name testRegexUnicodeChinese0001
     * @tc.desc Verify Unicode escape matches Chinese character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeChinese0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re42: RegExp = new RegExp('\\u4e2d');
      const result42: boolean = re42.test("中");

      expect(result42).assertTrue();
    });

    /**
     * @tc.number REGEX_OCTAL_ESCAPE_0100
     * @tc.name testRegexOctalEscape0001
     * @tc.desc Verify octal escape sequence matches character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexOctalEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re43: RegExp = new RegExp('\\x41');
      const result43: boolean = re43.test("A");

      expect(result43).assertTrue();
    });

    /**
     * @tc.number REGEX_HEX_ESCAPE_0100
     * @tc.name testRegexHexEscape0001
     * @tc.desc Verify hexadecimal escape sequence matches character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHexEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re44: RegExp = new RegExp('\\x41');
      const result44: boolean = re44.test("A");

      expect(result44).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_QUANTIFIER_0100
     * @tc.name testRegexEscapedQuantifier0001
     * @tc.desc Verify escaped quantifier matches literal characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re45: RegExp = new RegExp('a\\{2\\}');
      const result45: boolean = re45.test("a{2}");

      expect(result45).assertTrue();
    });

    /**
     * @tc.number REGEX_UNESCAPED_QUANTIFIER_0100
     * @tc.name testRegexUnescapedQuantifier0001
     * @tc.desc Verify unescaped quantifier matches repetition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re46: RegExp = new RegExp('a{2}');
      const result46: boolean = re46.test("aa");

      expect(result46).assertTrue();
    });

    /**
     * @tc.number REGEX_ESCAPED_GLOBAL_0100
     * @tc.name testRegexEscapedGlobal0001
     * @tc.desc Verify escaped character with global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re47: RegExp = new RegExp('\\.', 'g');
      const matches47: RegExpMatchArray | null = "a.b.c".match(re47);
      const result47: boolean = matches47?.length === 2;
      expect(result47).assertTrue();
    });

    /**
     * @tc.number REGEX_MULTILINE_ANCHOR_0100
     * @tc.name testRegexMultilineAnchor0001
     * @tc.desc Verify anchor with multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultilineAnchor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re48: RegExp = new RegExp('^\\d', 'm');
      const result48: boolean = re48.test("line1\n2line");

      expect(result48).assertTrue();
    });

    /**
     * @tc.number REGEX_IGNORE_CASE_0100
     * @tc.name testRegexIgnoreCase0001
     * @tc.desc Verify word character with ignore case flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIgnoreCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re49: RegExp = new RegExp('\\w+', 'i');
      const result49: boolean = re49.test("TEST");

      expect(result49).assertTrue();
    });

    /**
     * @tc.number REGEX_DIGIT_QUANTIFIER_0100
     * @tc.name testRegexDigitQuantifier0001
     * @tc.desc Verify digit with plus quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDigitQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re50: RegExp = new RegExp('\\d+');
      const result50: boolean = re50.test("12345");

      expect(result50).assertTrue();
    });

    /**
     * @tc.number REGEX_WORD_QUANTIFIER_0100
     * @tc.name testRegexWordQuantifier0001
     * @tc.desc Verify word character with star quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re51: RegExp = new RegExp('\\w*');
      const result51: boolean = re51.test("variable123");

      expect(result51).assertTrue();
    });

    /**
     * @tc.number REGEX_WHITESPACE_OPTIONAL_0100
     * @tc.name testRegexWhitespaceOptional0001
     * @tc.desc Verify whitespace with optional quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWhitespaceOptional0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re52: RegExp = new RegExp('\\s?');
      const result52: boolean = re52.test("");

      expect(result52).assertTrue();
    });

    /**
     * @tc.number REGEX_CHARSET_DIGIT_SPACE_0100
     * @tc.name testRegexCharsetDigitSpace0001
     * @tc.desc Verify character set with digit and space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetDigitSpace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re53: RegExp = new RegExp('[\\d\\s]');
      const result53: boolean = re53.test(" 123");

      expect(result53).assertTrue();
    });

    /**
     * @tc.number SUB_REGEX_NEGATED_CHARSET_0100
     * @tc.name testRegexNegatedCharset0001
     * @tc.desc Verify negated character set with word character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegatedCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re54: RegExp = new RegExp('[^\\w]');
      const result54: boolean = re54.test("!");

      expect(result54).assertTrue();
    });

    /**
     * @tc.number REGEX_EMPTY_STRING_0100
     * @tc.name testRegexEmptyString0001
     * @tc.desc Verify whitespace quantifier with empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re55: RegExp = new RegExp('\\s*');
      const result55: boolean = re55.test("");

      expect(result55).assertTrue();
    });

    /**
     * @tc.number REGEX_LONG_STRING_0100
     * @tc.name testRegexLongString0001
     * @tc.desc Verify digit quantifier in long string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLongString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re56: RegExp = new RegExp('\\d{5}');
      const result56: boolean = re56.test("abcdefghijklmnopqrstuvwxyz12345");

      expect(result56).assertTrue();
    });

    /**
     * @tc.number REGEX_URL_PATTERN_0100
     * @tc.name testRegexUrlPattern0001
     * @tc.desc Verify URL pattern with special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re58: RegExp = new RegExp('https?:\\/\\/\\w+\\.\\w+');
      const result58: boolean = re58.test("https://example.com");

      expect(result58).assertTrue();
    });

    /**
     * @tc.number REGEX_EMAIL_PATTERN_0100
     * @tc.name testRegexEmailPattern0001
     * @tc.desc Verify email pattern with special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmailPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re59: RegExp = new RegExp('\\w+@\\w+\\.\\w+');
      const result59: boolean = re59.test("test@example.com");

      expect(result59).assertTrue();
    });

    /**
     * @tc.number REGEX_FILE_PATH_0100
     * @tc.name testRegexFilePath0001
     * @tc.desc Verify file path pattern with backslashes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFilePath0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re60: RegExp = new RegExp('C:\\\\\\\\path\\\\\\\\to\\\\\\\\file');
      const result60: boolean = re60.test("C:\\path\\to\\file");

      expect(result60).assertFalse();
    });

    /**
     * @tc.number REGEX_IP_ADDRESS_0100
     * @tc.name testRegexIpAddress0001
     * @tc.desc Verify IP address pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpAddress0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re61: RegExp = new RegExp('\\d+\\.\\d+\\.\\d+\\.\\d+');
      const result61: boolean = re61.test("192.168.1.1");

      expect(result61).assertTrue();
    });

    /**
     * @tc.number REGEX_IP_WITH_PORT_0100
     * @tc.name testRegexIpWithPort0001
     * @tc.desc Verify IP address with port pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpWithPort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re62: RegExp = new RegExp('\\d+\\.\\d+\\.\\d+\\.\\d+:\\d+');
      const result62: boolean = re62.test("192.168.1.1:8080");

      expect(result62).assertTrue();
    });

    /**
     * @tc.number REGEX_PHONE_NUMBER_0100
     * @tc.name testRegexPhoneNumber0001
     * @tc.desc Verify phone number pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it("testRegexPhoneNumber0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re63: RegExp = new RegExp('\\d{3}-\\d{3}-\\d{4}');
      const result63: boolean = re63.test("123-456-7890");

      expect(result63).assertTrue();
    });

    /**
     * @tc.number REGEX_AREA_CODE_PHONE_0100
     * @tc.name testRegexAreaCodePhone0001
     * @tc.desc Verify phone number with area code pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexAreaCodePhone0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re64: RegExp = new RegExp('\\(\\d{3}\\) \\d{3}-\\d{4}');
      const result64: boolean = re64.test("(123) 456-7890");

      expect(result64).assertTrue();
    });

    /**
     * @tc.number REGEX_DATE_FORMAT_0100
     * @tc.name testRegexDateFormat0001
     * @tc.desc Verify date format (MM/DD/YYYY) pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDateFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re65: RegExp = new RegExp('\\d{2}/\\d{2}/\\d{4}');
      const result65: boolean = re65.test("12/31/2023");
      expect(result65).assertTrue();
    });

    /**
     * @tc.number REGEX_TIME_FORMAT_0100
     * @tc.name testRegexTimeFormat0001
     * @tc.desc Verify time format (HH:MM:SS) pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTimeFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re66: RegExp = new RegExp('\\d{2}:\\d{2}:\\d{2}');
      const result66: boolean = re66.test("23:59:59");
      expect(result66).assertTrue();
    });

    /**
     * @tc.number SUB_REGEX_CURRENCY_FORMAT_0100
     * @tc.name testRegexCurrencyFormat0001
     * @tc.desc Verify currency format pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCurrencyFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re67: RegExp = new RegExp('\\$\\d+\\.\\d{2}');
      const result67: boolean = re67.test("$19.99");
      expect(result67).assertTrue();
    });

    /**
     * @tc.number REGEX_PERCENTAGE_FORMAT_0100
     * @tc.name testRegexPercentageFormat0001
     * @tc.desc Verify percentage format pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPercentageFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re68: RegExp = new RegExp('\\d+%');
      const result68: boolean = re68.test("50%");

      expect(result68).assertTrue();
    });

    /**
     * @tc.number REGEX_VERSION_NUMBER_0100
     * @tc.name testRegexVersionNumber0001
     * @tc.desc Verify version number pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexVersionNumber0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re69: RegExp = new RegExp('\\d+\\.\\d+\\.\\d+');
      const result69: boolean = re69.test("1.2.3");

      expect(result69).assertTrue();
    });

    /**
     * @tc.number REGEX_HTML_TAG_0100
     * @tc.name testRegexHtmlTag0001
     * @tc.desc Verify HTML tag pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHtmlTag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re70: RegExp = new RegExp('<\\/?\\w+>');
      const result70: boolean = re70.test("<div>");

      expect(result70).assertTrue();
    });

    /**
     * @tc.number REGEX_XML_ATTRIBUTE_0100
     * @tc.name testRegexXmlAttribute0001
     * @tc.desc Verify XML attribute pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexXmlAttribute0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re71: RegExp = new RegExp('\\w+="[^"]*"');
      const result71: boolean = re71.test('name="value"');

      expect(result71).assertTrue();
    });

    /**
     * @tc.number REGEX_CSS_SELECTOR_0100
     * @tc.name testRegexCssSelector0001
     * @tc.desc Verify CSS selector pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCssSelector0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re72: RegExp = new RegExp('\\.\\w+');
      const result72: boolean = re72.test(".class");

      expect(result72).assertTrue();
    });

    /**
     * @tc.number REGEX_REGEX_LITERAL_0100
     * @tc.name testRegexRegexLiteral0001
     * @tc.desc Verify regex literal pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexRegexLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re73: RegExp = new RegExp('\\/.+\\/');
      const result73: boolean = re73.test("/pattern/");

      expect(result73).assertTrue();
    });

    /**
     * @tc.number REGEX_JSON_KEY_VALUE_0100
     * @tc.name testRegexJsonKeyValue0001
     * @tc.desc Verify JSON key-value pair pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexJsonKeyValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re74: RegExp = new RegExp('"\\w+": ".+"');
      const result74: boolean = re74.test('"key": "value"');

      expect(result74).assertTrue();
    });

    /**
     * @tc.number REGEX_CODE_COMMENT_0100
     * @tc.name testRegexCodeComment0001
     * @tc.desc Verify code comment pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCodeComment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re75: RegExp = new RegExp('\\/\\/.+');
      const result75: boolean = re75.test("// this is a comment");

      expect(result75).assertTrue();
    });

    /**
     * @tc.number REGEX_FUNCTION_CALL_0100
     * @tc.name testRegexFunctionCall0001
     * @tc.desc Verify function call with parameters pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFunctionCall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re76: RegExp = new RegExp('\\w+\\([^)]*\\)');
      const result76: boolean = re76.test("function(arg1, arg2)");

      expect(result76).assertTrue();
    });

    /**
     * @tc.number REGEX_ARRAY_LITERAL_0100
     * @tc.name testRegexArrayLiteral0001
     * @tc.desc Verify array literal pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexArrayLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re77: RegExp = new RegExp('\\[[^]]*\\]');
      const result77: boolean = re77.test("[1, 2, 3]");

      expect(result77).assertFalse();
    });

    /**
     * @tc.number REGEX_BOOLEAN_LITERAL_0100
     * @tc.name testRegexBooleanLiteral0001
     * @tc.desc Verify boolean literal pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexBooleanLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re78: RegExp = new RegExp('true|false');
      const result78: boolean = re78.test("true");

      expect(result78).assertTrue();
    });

    /**
     * @tc.number REGEX_NULL_LITERAL_0100
     * @tc.name testRegexNullLiteral0001
     * @tc.desc Verify null literal pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNullLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re79: RegExp = new RegExp('null');
      const result79: boolean = re79.test("null");

      expect(result79).assertTrue();
    });

    /**
     * @tc.number REGEX_UUID_FORMAT_0100
     * @tc.name testRegexUuidFormat0001
     * @tc.desc Verify UUID format pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUuidFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re80: RegExp = new RegExp('[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}');
      const result80: boolean = re80.test("f81d4fae-7dec-11d0-a765-00a0c91e6bf6");

      expect(result80).assertTrue();
    });

    /**
     * @tc.number REGEX_HEX_COLOR_0100
     * @tc.name testRegexHexColor0001
     * @tc.desc Verify hexadecimal color code pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHexColor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re81: RegExp = new RegExp('#([0-9a-fA-F]{3}){1,2}');
      const result81: boolean = re81.test("#ff00ff");

      expect(result81).assertTrue();
    });

    /**
     * @tc.number REGEX_ISBN_0100
     * @tc.name testRegexIsbn0001
     * @tc.desc Verify ISBN pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIsbn0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re82: RegExp = new RegExp('\\d{10}|\\d{13}');
      const result82: boolean = re82.test("978020137962");

      expect(result82).assertTrue();
    });

    /**
     * @tc.number REGEX_CREDIT_CARD_0100
     * @tc.name testRegexCreditCard0001
     * @tc.desc Verify credit card number pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCreditCard0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re83: RegExp = new RegExp('\\d{4} \\d{4} \\d{4} \\d{4}');
      const result83: boolean = re83.test("4111 1111 1111 1111");

      expect(result83).assertTrue();
    });

    /**
     * @tc.number REGEX_ZIP_CODE_0100
     * @tc.name testRegexZipCode0001
     * @tc.desc Verify ZIP code pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexZipCode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re84: RegExp = new RegExp('\\d{5}(-\\d{4})?');
      const result84: boolean = re84.test("12345-6789");

      expect(result84).assertTrue();
    });

    /**
     * @tc.number REGEX_MAC_ADDRESS_0100
     * @tc.name testRegexMacAddress0001
     * @tc.desc Verify MAC address pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMacAddress0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re85: RegExp = new RegExp('([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})');
      const result85: boolean = re85.test("00:1B:44:11:3A:B7");

      expect(result85).assertTrue();
    });

    /**
     * @tc.number REGEX_IPV6_0100
     * @tc.name testRegexIpv60001
     * @tc.desc Verify IPv6 address pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpv60001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re86: RegExp = new RegExp('([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}');
      const result86: boolean = re86.test("2001:0db8:85a3:0000:0000:8a2e:0370:7334");

      expect(result86).assertTrue();
    });

    /**
     * @tc.number REGEX_SCIENTIFIC_NOTATION_0100
     * @tc.name testRegexScientificNotation0001
     * @tc.desc Verify scientific notation pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexScientificNotation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re87: RegExp = new RegExp('\\d+(\\.\\d+)?[eE][+-]?\\d+');
      const result87: boolean = re87.test("1.23e-45");

      expect(result87).assertTrue();
    });

    /**
     * @tc.number REGEX_ROMAN_NUMERAL_0100
     * @tc.name testRegexRomanNumeral0001
     * @tc.desc Verify Roman numeral pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexRomanNumeral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re88: RegExp = new RegExp('M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})');
      const result88: boolean = re88.test("MCMXCIV");

      expect(result88).assertTrue();
    });

    /**
     * @tc.number REGEX_HTML_ENTITY_0100
     * @tc.name testRegexHtmlEntity0001
     * @tc.desc Verify HTML entity pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHtmlEntity0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re89: RegExp = new RegExp('&[a-zA-Z0-9]+;');
      const result89: boolean = re89.test("&amp;");

      expect(result89).assertTrue();
    });

    /**
     * @tc.number REGEX_EMOJI_0100
     * @tc.name testRegexEmoji0001
     * @tc.desc Verify emoji pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re90: RegExp = new RegExp('[\\u{1F600}-\\u{1F64F}]', 'u');
      const result90: boolean = re90.test("😊");

      expect(result90).assertTrue();
    });

    /**
     * @tc.number REGEX_FULLWIDTH_CHAR_0100
     * @tc.name testRegexFullwidthChar0001
     * @tc.desc Verify fullwidth character pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFullwidthChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re91: RegExp = new RegExp('[\\uFF00-\\uFFFF]');
      const result91: boolean = re91.test("Ａ");

      expect(result91).assertTrue();
    });

    /**
     * @tc.number REGEX_HALFWIDTH_CHAR_0100
     * @tc.name testRegexHalfwidthChar0001
     * @tc.desc Verify halfwidth character pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHalfwidthChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re92: RegExp = new RegExp('[\\u0020-\\u007E]');
      const result92: boolean = re92.test("A");

      expect(result92).assertTrue();
    });

    /**
     * @tc.number REGEX_CHINESE_CHAR_0100
     * @tc.name testRegexChineseChar0001
     * @tc.desc Verify Chinese character pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexChineseChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re93: RegExp = new RegExp('[\\u4e00-\\u9fa5]');
      const result93: boolean = re93.test("你好");

      expect(result93).assertTrue();
    });

    /**
     * @tc.number REGEX_HIRAGANA_0100
     * @tc.name testRegexHiragana0001
     * @tc.desc Verify Hiragana pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHiragana0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re94: RegExp = new RegExp('[\\u3040-\\u309F]');
      const result94: boolean = re94.test("あいう");

      expect(result94).assertTrue();
    });

    /**
     * @tc.number REGEX_HANGUL_0100
     * @tc.name testRegexHangul0001
     * @tc.desc Verify Hangul pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHangul0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re95: RegExp = new RegExp('[\\uAC00-\\uD7AF]');
      const result95: boolean = re95.test("안녕하세요");

      expect(result95).assertTrue();
    });

    /**
     * @tc.number REGEX_EMPTY_LINE_0100
     * @tc.name testRegexEmptyLine0001
     * @tc.desc Verify empty line pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyLine0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re96: RegExp = new RegExp('^\\s*$');
      const result96: boolean = re96.test("   ");

      expect(result96).assertTrue();
    });

    /**
     * @tc.number REGEX_CAPITALIZED_WORD_0100
     * @tc.name testRegexCapitalizedWord0001
     * @tc.desc Verify capitalized word pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCapitalizedWord0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re97: RegExp = new RegExp('\\b[A-Z][a-z]*\\b');
      const result97: boolean = re97.test("Hello");

      expect(result97).assertTrue();
    });

    /**
     * @tc.number REGEX_CAMEL_CASE_0100
     * @tc.name testRegexCamelCase0001
     * @tc.desc Verify camelCase pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCamelCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re98: RegExp = new RegExp('^[a-z]+([A-Z][a-z]+)*$');
      const result98: boolean = re98.test("camelCaseVariable");

      expect(result98).assertTrue();
    });

    /**
     * @tc.number REGEX_SNAKE_CASE_0100
     * @tc.name testRegexSnakeCase0001
     * @tc.desc Verify snake_case pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexSnakeCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re99: RegExp = new RegExp('^[a-z]+(_[a-z]+)*$');
      const result99: boolean = re99.test("snake_case_variable");

      expect(result99).assertTrue();
    });

    /**
     * @tc.number REGEX_PASCAL_CASE_0100
     * @tc.name testRegexPascalCase0001
     * @tc.desc Verify PascalCase pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPascalCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re100: RegExp = new RegExp('^[A-Z][a-z]+([A-Z][a-z]+)*$');
      const result100: boolean = re100.test("PascalCaseClass");

      expect(result100).assertTrue();
    });

    /**
     * @tc.number STRING_SPLIT_DYNAMIC_0100
     * @tc.name testStringSplitDynamic0001
     * @tc.desc Verify String.split() with dynamic separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const separator99: string = ",|;";
      const re99: RegExp = new RegExp(separator99);
      const result99: string[] = "a,b;c,d;e".split(re99);

      expect(result99).assertDeepEquals(["a", "b", "c", "d", "e"]);
    });

    /**
     * @tc.number REGEX_METHODS_COMPARISON_0100
     * @tc.name testRegexMethodsComparison0001
     * @tc.desc Compare different RegExp methods behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMethodsComparison0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {

      const re100: RegExp = new RegExp('abc');
      const str100: string = "xyzabc123abc";
      const result100: RegexMethodsResult = {
        exec: re100.exec(str100)?.[0],
        test: re100.test(str100),
        match: str100.match(re100)?.[0],
        search: str100.search(re100),
        replace: str100.replace(re100, "def").slice(0, 10)
      };

      expect(result100.exec).assertEqual("abc");
      expect(result100.test).assertTrue();
      expect(result100.match).assertEqual("abc");
      expect(result100.search).assertEqual(3);
      expect(result100.replace).assertEqual("xyzdef123a");
    });
  })
}