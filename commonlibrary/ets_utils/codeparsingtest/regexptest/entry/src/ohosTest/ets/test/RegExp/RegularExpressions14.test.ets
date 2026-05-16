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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

interface TestObject {
  id?: number;
  name?: string;
  data?: string;
  key?: string;
  prop?: string;
  a?: number;
  b?: number;
  unused?: string;
  new?: string;
  x?: number;
  y?: number;
}

type TestArray = Array<number | string | boolean | null | undefined>;

interface TestFunction extends Function {
  prop?: string;
}

class MockSymbol {
  description: string;

  constructor(description: string) {
    this.description = description;
  }
}

export default function RegularExpressions14Test() {
  describe('RegularExpressions14Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number REGEX_ESCAPED_DOT_0100
     * @tc.name testRegexEscapedDot0001
     * @tc.desc Verify escaped dot matches literal dot.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedDot0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedDot0001 start');

      const re1: RegExp = /\./;
      const result1: boolean = re1.test("test.txt");
      console.log(`1. Escaped dot matches literal dot: ${result1}`);
      expect(result1).assertTrue();
      done();
      console.log('testRegexEscapedDot0001 done');
    });

    /**
     * @tc.number REGEX_UNESCAPED_DOT_0100
     * @tc.name testRegexUnescapedDot0001
     * @tc.desc Verify unescaped dot matches any character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedDot0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnescapedDot0001 start');

      const re2: RegExp = /./;
      const result2: boolean = re2.test("test");
      console.log(`2. Unescaped dot matches any character: ${result2}`);
      expect(result2).assertTrue();
      done();
      console.log('testRegexUnescapedDot0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_STAR_0100
     * @tc.name testRegexEscapedStar0001
     * @tc.desc Verify escaped star matches literal star.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedStar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedStar0001 start');

      const re3: RegExp = /\*/;
      const result3: boolean = re3.test("a*b");
      console.log(`3. Escaped star matches literal star: ${result3}`);
      expect(result3).assertTrue();
      done();
      console.log('testRegexEscapedStar0001 done');
    });

    /**
     * @tc.number REGEX_UNESCAPED_STAR_0100
     * @tc.name testRegexUnescapedStar0001
     * @tc.desc Verify unescaped star matches zero or more occurrences.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedStar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnescapedStar0001 start');

      const re4: RegExp = /a*/;
      const result4: boolean = re4.test("aaab");
      console.log(`4. Unescaped star matches zero or more: ${result4}`);
      expect(result4).assertTrue();
      done();
      console.log('testRegexUnescapedStar0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_PLUS_0100
     * @tc.name testRegexEscapedPlus0001
     * @tc.desc Verify escaped plus matches literal plus.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedPlus0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedPlus0001 start');

      const re5: RegExp = /\+/;
      const result5: boolean = re5.test("1+2=3");
      console.log(`5. Escaped plus matches literal plus: ${result5}`);
      expect(result5).assertTrue();
      done();
      console.log('testRegexEscapedPlus0001 done');
    });

    /**
     * @tc.number REGEX_UNESCAPED_PLUS_0100
     * @tc.name testRegexUnescapedPlus0001
     * @tc.desc Verify unescaped plus matches one or more occurrences.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedPlus0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnescapedPlus0001 start');

      const re6: RegExp = /a+/;
      const result6: boolean = re6.test("aaab");
      console.log(`6. Unescaped plus matches one or more: ${result6}`);
      expect(result6).assertTrue();
      done();
      console.log('testRegexUnescapedPlus0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_QUESTION_0100
     * @tc.name testRegexEscapedQuestion0001
     * @tc.desc Verify escaped question mark matches literal question mark.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedQuestion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedQuestion0001 start');

      const re7: RegExp = /\?/;
      const result7: boolean = re7.test("Do you know?");
      console.log(`7. Escaped question mark matches literal: ${result7}`);
      expect(result7).assertTrue();
      done();
      console.log('testRegexEscapedQuestion0001 done');
    });

    /**
     * @tc.number REGEX_UNESCAPED_QUESTION_0100
     * @tc.name testRegexUnescapedQuestion0001
     * @tc.desc Verify unescaped question mark matches zero or one occurrence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedQuestion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnescapedQuestion0001 start');

      const re8: RegExp = /a?/;
      const result8: boolean = re8.test("aaab");
      console.log(`8. Unescaped question mark matches zero or one: ${result8}`);
      expect(result8).assertTrue();
      done();
      console.log('testRegexUnescapedQuestion0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_PAREN_0100
     * @tc.name testRegexEscapedParen0001
     * @tc.desc Verify escaped parentheses match literal parentheses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedParen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedParen0001 start');

      const re9: RegExp = /\(/;
      const result9: boolean = re9.test("(test)");
      console.log(`9. Escaped left parenthesis matches literal: ${result9}`);
      expect(result9).assertTrue();
      done();
      console.log('testRegexEscapedParen0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_RIGHT_PAREN_0100
     * @tc.name testRegexEscapedRightParen0001
     * @tc.desc Verify escaped right parenthesis matches literal right parenthesis.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedRightParen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedRightParen0001 start');

      const re10: RegExp = /\)/;
      const result10: boolean = re10.test("(test)");
      console.log(`10. Escaped right parenthesis matches literal: ${result10}`);
      expect(result10).assertTrue();
      done();
      console.log('testRegexEscapedRightParen0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_BRACKET_0100
     * @tc.name testRegexEscapedBracket0001
     * @tc.desc Verify escaped brackets match literal brackets.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedBracket0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedBracket0001 start');

      const re11: RegExp = /\[/;
      const result11: boolean = re11.test("[abc]");
      console.log(`11. Escaped left bracket matches literal: ${result11}`);
      expect(result11).assertTrue();
      done();
      console.log('testRegexEscapedBracket0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_RIGHT_BRACKET_0100
     * @tc.name testRegexEscapedRightBracket0001
     * @tc.desc Verify escaped right bracket matches literal right bracket.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedRightBracket0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedRightBracket0001 start');

      const re12: RegExp = /\]/;
      const result12: boolean = re12.test("[abc]");
      console.log(`12. Escaped right bracket matches literal: ${result12}`);
      expect(result12).assertTrue();
      done();
      console.log('testRegexEscapedRightBracket0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_BRACE_0100
     * @tc.name testRegexEscapedBrace0001
     * @tc.desc Verify escaped braces match literal braces.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedBrace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedBrace0001 start');

      const re13: RegExp = /\{/;
      const result13: boolean = re13.test("{1,3}");
      console.log(`13. Escaped left brace matches literal: ${result13}`);
      expect(result13).assertTrue();
      done();
      console.log('testRegexEscapedBrace0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_RIGHT_BRACE_0100
     * @tc.name testRegexEscapedRightBrace0001
     * @tc.desc Verify escaped right brace matches literal right brace.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedRightBrace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedRightBrace0001 start');

      const re14: RegExp = /\}/;
      const result14: boolean = re14.test("{1,3}");
      console.log(`14. Escaped right brace matches literal: ${result14}`);
      expect(result14).assertTrue();
      done();
      console.log('testRegexEscapedRightBrace0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_BACKSLASH_0100
     * @tc.name testRegexEscapedBackslash0001
     * @tc.desc Verify escaped backslash matches literal backslash.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedBackslash0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedBackslash0001 start');

      const re15: RegExp = /\\/;
      const result15: boolean = re15.test("C:\\test");
      console.log(`15. Escaped backslash matches literal: ${result15}`);
      expect(result15).assertTrue();
      done();
      console.log('testRegexEscapedBackslash0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_PIPE_0100
     * @tc.name testRegexEscapedPipe0001
     * @tc.desc Verify escaped pipe matches literal pipe.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedPipe0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedPipe0001 start');

      const re16: RegExp = /\|/;
      const result16: boolean = re16.test("a|b");
      console.log(`16. Escaped pipe matches literal: ${result16}`);
      expect(result16).assertTrue();
      done();
      console.log('testRegexEscapedPipe0001 done');
    });

    /**
     * @tc.number REGEX_UNESCAPED_PIPE_0100
     * @tc.name testRegexUnescapedPipe0001
     * @tc.desc Verify unescaped pipe works as OR operator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedPipe0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnescapedPipe0001 start');

      const re17: RegExp = /a|b/;
      const result17: boolean = re17.test("cba");
      console.log(`17. Unescaped pipe works as OR operator: ${result17}`);
      expect(result17).assertTrue();
      done();
      console.log('testRegexUnescapedPipe0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_CARET_0100
     * @tc.name testRegexEscapedCaret0001
     * @tc.desc Verify escaped caret matches literal caret.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedCaret0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedCaret0001 start');

      const re18: RegExp = /\^/;
      const result18: boolean = re18.test("^start");
      console.log(`18. Escaped caret matches literal: ${result18}`);
      expect(result18).assertTrue();
      done();
      console.log('testRegexEscapedCaret0001 done');
    });

    /**
     * @tc.number REGEX_UNESCAPED_CARET_0100
     * @tc.name testRegexUnescapedCaret0001
     * @tc.desc Verify unescaped caret matches start of string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedCaret0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnescapedCaret0001 start');

      const re19: RegExp = /^start/;
      const result19: boolean = re19.test("start here");
      console.log(`19. Unescaped caret matches start of string: ${result19}`);
      expect(result19).assertTrue();
      done();
      console.log('testRegexUnescapedCaret0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_DOLLAR_0100
     * @tc.name testRegexEscapedDollar0001
     * @tc.desc Verify escaped dollar sign matches literal dollar sign.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedDollar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedDollar0001 start');

      const re20: RegExp = /\$/;
      const result20: boolean = re20.test("cost $50");
      console.log(`20. Escaped dollar sign matches literal: ${result20}`);
      expect(result20).assertTrue();
      done();
      console.log('testRegexEscapedDollar0001 done');
    });

    /**
     * @tc.number REGEX_DOLLAR_END_ANCHOR_0100
     * @tc.name testRegexDollarEndAnchor0001
     * @tc.desc Verify unescaped dollar sign matches end of string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDollarEndAnchor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDollarEndAnchor0001 start');

      const re21: RegExp = /end$/;
      const result21: boolean = re21.test("this is the end");
      console.log(`21. Unescaped dollar matches end: ${result21}`);
      expect(result21).assertTrue();
      done();
      console.log('testRegexDollarEndAnchor0001 done');
    });

    /**
     * @tc.number REGEX_DIGIT_CLASS_0100
     * @tc.name testRegexDigitClass0001
     * @tc.desc Verify \d matches digit characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDigitClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDigitClass0001 start');

      const re22: RegExp = /\d/;
      const result22: boolean = re22.test("abc123");
      console.log(`22. \\d matches digit: ${result22}`);
      expect(result22).assertTrue();
      done();
      console.log('testRegexDigitClass0001 done');
    });

    /**
     * @tc.number REGEX_NON_DIGIT_CLASS_0100
     * @tc.name testRegexNonDigitClass0001
     * @tc.desc Verify \D matches non-digit characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonDigitClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonDigitClass0001 start');

      const re23: RegExp = /\D/;
      const result23: boolean = re23.test("123abc");
      console.log(`23. \\D matches non-digit: ${result23}`);
      expect(result23).assertTrue();
      done();
      console.log('testRegexNonDigitClass0001 done');
    });

    /**
     * @tc.number REGEX_WORD_CLASS_0100
     * @tc.name testRegexWordClass0001
     * @tc.desc Verify \w matches word characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWordClass0001 start');

      const re24: RegExp = /\w/;
      const result24: boolean = re24.test("###");
      console.log(`24. \\w matches word char: ${result24}`);
      expect(result24).assertFalse();
      done();
      console.log('testRegexWordClass0001 done');
    });

    /**
     * @tc.number REGEX_NON_WORD_CLASS_0100
     * @tc.name testRegexNonWordClass0001
     * @tc.desc Verify \W matches non-word characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWordClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonWordClass0001 start');

      const re25: RegExp = /\W/;
      const result25: boolean = re25.test("abc123_");
      console.log(`25. \\W matches non-word char: ${result25}`);
      expect(result25).assertFalse();
      done();
      console.log('testRegexNonWordClass0001 done');
    });

    /**
     * @tc.number REGEX_WHITESPACE_CLASS_0100
     * @tc.name testRegexWhitespaceClass0001
     * @tc.desc Verify \s matches whitespace characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWhitespaceClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWhitespaceClass0001 start');

      const re26: RegExp = /\s/;
      const result26: boolean = re26.test("hello world");
      console.log(`26. \\s matches whitespace: ${result26}`);
      expect(result26).assertTrue();
      done();
      console.log('testRegexWhitespaceClass0001 done');
    });

    /**
     * @tc.number REGEX_NON_WHITESPACE_CLASS_0100
     * @tc.name testRegexNonWhitespaceClass0001
     * @tc.desc Verify \S matches non-whitespace characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWhitespaceClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonWhitespaceClass0001 start');

      const re27: RegExp = /\S/;
      const result27: boolean = re27.test("   ");
      console.log(`27. \\S matches non-whitespace: ${result27}`);
      expect(result27).assertFalse();
      done();
      console.log('testRegexNonWhitespaceClass0001 done');
    });

    /**
     * @tc.number REGEX_TAB_CHAR_0100
     * @tc.name testRegexTabChar0001
     * @tc.desc Verify \t matches tab character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTabChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTabChar0001 start');

      const re28: RegExp = /\t/;
      const result28: boolean = re28.test("a\tb");
      console.log(`28. \\t matches tab: ${result28}`);
      expect(result28).assertTrue();
      done();
      console.log('testRegexTabChar0001 done');
    });

    /**
     * @tc.number SUB_REGEX_CARRIAGE_RETURN_0100
     * @tc.name testRegexCarriageReturn0001
     * @tc.desc Verify \r matches carriage return.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCarriageReturn0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCarriageReturn0001 start');

      const re29: RegExp = /\r/;
      const result29: boolean = re29.test("line1\rline2");
      console.log(`29. \\r matches carriage return: ${result29}`);
      expect(result29).assertTrue();
      done();
      console.log('testRegexCarriageReturn0001 done');
    });

    /**
     * @tc.number REGEX_NEWLINE_0100
     * @tc.name testRegexNewline0001
     * @tc.desc Verify \n matches newline character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNewline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNewline0001 start');

      const re30: RegExp = /\n/;
      const result30: boolean = re30.test("first line\nsecond line");
      console.log(`30. \\n matches newline: ${result30}`);
      expect(result30).assertTrue();
      done();
      console.log('testRegexNewline0001 done');
    });

    /**
     * @tc.number SUB_REGEX_VERTICAL_TAB_0100
     * @tc.name testRegexVerticalTab0001
     * @tc.desc Verify \v matches vertical tab.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexVerticalTab0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexVerticalTab0001 start');

      const re31: RegExp = /\v/;
      const result31: boolean = re31.test("text\vmore text");
      console.log(`31. \\v matches vertical tab: ${result31}`);
      expect(result31).assertTrue();
      done();
      console.log('testRegexVerticalTab0001 done');
    });

    /**
     * @tc.number SUB_REGEX_FORM_FEED_0100
     * @tc.name testRegexFormFeed0001
     * @tc.desc Verify \f matches form feed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFormFeed0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexFormFeed0001 start');

      const re32: RegExp = /\f/;
      const result32: boolean = re32.test("page1\fpage2");
      console.log(`32. \\f matches form feed: ${result32}`);
      expect(result32).assertTrue();
      done();
      console.log('testRegexFormFeed0001 done');
    });

    /**
     * @tc.number REGEX_WORD_BOUNDARY_0100
     * @tc.name testRegexWordBoundary0001
     * @tc.desc Verify \b matches word boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWordBoundary0001 start');

      const re33: RegExp = /\bword\b/;
      const result33: boolean = re33.test("a word here");
      console.log(`33. \\b matches word boundary: ${result33}`);
      expect(result33).assertTrue();
      done();
      console.log('testRegexWordBoundary0001 done');
    });

    /**
     * @tc.number SUB_REGEX_NON_WORD_BOUNDARY_0100
     * @tc.name testRegexNonWordBoundary0001
     * @tc.desc Verify \B matches non-word boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonWordBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonWordBoundary0001 start');

      const re34: RegExp = /\Bword\B/;
      const result34: boolean = re34.test("swordsmith");
      console.log(`34. \\B matches non-word boundary: ${result34}`);
      expect(result34).assertTrue();
      done();
      console.log('testRegexNonWordBoundary0001 done');
    });

    /**
     * @tc.number SUB_REGEX_NULL_CHAR_0100
     * @tc.name testRegexNullChar0001
     * @tc.desc Verify \0 matches null character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNullChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNullChar0001 start');

      const re35: RegExp = /\0/;
      const result35: boolean = re35.test("a\0b");
      console.log(`35. \\0 matches null char: ${result35}`);
      expect(result35).assertTrue();
      done();
      console.log('testRegexNullChar0001 done');
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_DOT_0100
     * @tc.name testRegexCharsetEscapedDot0001
     * @tc.desc Verify escaped dot in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedDot0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCharsetEscapedDot0001 start');

      const re36: RegExp = /[.]/;
      const result36: boolean = re36.test("a.b");
      console.log(`36. Dot in charset: ${result36}`);
      expect(result36).assertTrue();
      done();
      console.log('testRegexCharsetEscapedDot0001 done');
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_STAR_0100
     * @tc.name testRegexCharsetEscapedStar0001
     * @tc.desc Verify escaped star in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedStar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCharsetEscapedStar0001 start');

      const re37: RegExp = /[*]/;
      const result37: boolean = re37.test("a*b");
      console.log(`37. Star in charset: ${result37}`);
      expect(result37).assertTrue();
      done();
      console.log('testRegexCharsetEscapedStar0001 done');
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_PLUS_0100
     * @tc.name testRegexCharsetEscapedPlus0001
     * @tc.desc Verify escaped plus in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedPlus0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCharsetEscapedPlus0001 start');

      const re38: RegExp = /[+]/;
      const result38: boolean = re38.test("a+b");
      console.log(`38. Plus in charset: ${result38}`);
      expect(result38).assertTrue();
      done();
      console.log('testRegexCharsetEscapedPlus0001 done');
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_QUESTION_0100
     * @tc.name testRegexCharsetEscapedQuestion0001
     * @tc.desc Verify escaped question mark in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedQuestion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCharsetEscapedQuestion0001 start');

      const re39: RegExp = /[?]/;
      const result39: boolean = re39.test("a?b");
      console.log(`39. Question mark in charset: ${result39}`);
      expect(result39).assertTrue();
      done();
      console.log('testRegexCharsetEscapedQuestion0001 done');
    });

    /**
     * @tc.number REGEX_CHARSET_ESCAPED_PAREN_0100
     * @tc.name testRegexCharsetEscapedParen0001
     * @tc.desc Verify escaped parenthesis in character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetEscapedParen0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCharsetEscapedParen0001 start');

      const re40: RegExp = /[(]/;
      const result40: boolean = re40.test("a(b");
      console.log(`40. Parenthesis in charset: ${result40}`);
      expect(result40).assertTrue();
      done();
      console.log('testRegexCharsetEscapedParen0001 done');
    });

    /**
     * @tc.number REGEX_UNICODE_ESCAPE_0100
     * @tc.name testRegexUnicodeEscape0001
     * @tc.desc Verify Unicode escape sequence matches specific character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnicodeEscape0001 start');

      const re41: RegExp = /\u0041/;
      const result41: boolean = re41.test("A");
      console.log(`41. Unicode escape matches 'A': ${result41}`);
      expect(result41).assertTrue();
      done();
      console.log('testRegexUnicodeEscape0001 done');
    });

    /**
     * @tc.number REGEX_UNICODE_CHINESE_0100
     * @tc.name testRegexUnicodeChinese0001
     * @tc.desc Verify Unicode escape matches Chinese character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeChinese0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnicodeChinese0001 start');

      const re42: RegExp = /\u4e2d/;
      const result42: boolean = re42.test("中");
      console.log(`42. Unicode escape matches Chinese: ${result42}`);
      expect(result42).assertTrue();
      done();
      console.log('testRegexUnicodeChinese0001 done');
    });

    /**
     * @tc.number REGEX_OCTAL_ESCAPE_0100
     * @tc.name testRegexOctalEscape0001
     * @tc.desc Verify octal escape sequence matches character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexOctalEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexOctalEscape0001 start');

      const re43: RegExp = /\x41/;
      const result43: boolean = re43.test("A");
      console.log(`43. Octal escape matches 'A': ${result43}`);
      expect(result43).assertTrue();
      done();
      console.log('testRegexOctalEscape0001 done');
    });

    /**
     * @tc.number REGEX_HEX_ESCAPE_0100
     * @tc.name testRegexHexEscape0001
     * @tc.desc Verify hexadecimal escape sequence matches character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHexEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHexEscape0001 start');

      const re44: RegExp = /\x41/;
      const result44: boolean = re44.test("A");
      console.log(`44. Hex escape matches 'A': ${result44}`);
      expect(result44).assertTrue();
      done();
      console.log('testRegexHexEscape0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_QUANTIFIER_0100
     * @tc.name testRegexEscapedQuantifier0001
     * @tc.desc Verify escaped quantifier matches literal characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedQuantifier0001 start');

      const re45: RegExp = /a\{2\}/;
      const result45: boolean = re45.test("a{2}");
      console.log(`45. Escaped quantifier matches literal: ${result45}`);
      expect(result45).assertTrue();
      done();
      console.log('testRegexEscapedQuantifier0001 done');
    });

    /**
     * @tc.number REGEX_UNESCAPED_QUANTIFIER_0100
     * @tc.name testRegexUnescapedQuantifier0001
     * @tc.desc Verify unescaped quantifier matches repetition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnescapedQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnescapedQuantifier0001 start');

      const re46: RegExp = /a{2}/;
      const result46: boolean = re46.test("aa");
      console.log(`46. Unescaped quantifier matches repetition: ${result46}`);
      expect(result46).assertTrue();
      done();
      console.log('testRegexUnescapedQuantifier0001 done');
    });

    /**
     * @tc.number REGEX_ESCAPED_GLOBAL_0100
     * @tc.name testRegexEscapedGlobal0001
     * @tc.desc Verify escaped character with global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEscapedGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEscapedGlobal0001 start');

      const re47: RegExp = /\./g;
      const matches47: string[] | null = "a.b.c".match(re47);
      const result47: boolean = matches47?.length === 2;
      console.log(`47. Escaped char with global flag: ${result47}`);
      expect(result47).assertTrue();
      done();
      console.log('testRegexEscapedGlobal0001 done');
    });

    /**
     * @tc.number REGEX_MULTILINE_ANCHOR_0100
     * @tc.name testRegexMultilineAnchor0001
     * @tc.desc Verify anchor with multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultilineAnchor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMultilineAnchor0001 start');

      const re48: RegExp = /^\d/m;
      const result48: boolean = re48.test("line1\n2line");
      console.log(`48. Anchor with multiline flag: ${result48}`);
      expect(result48).assertTrue();
      done();
      console.log('testRegexMultilineAnchor0001 done');
    });

    /**
     * @tc.number REGEX_IGNORE_CASE_0100
     * @tc.name testRegexIgnoreCase0001
     * @tc.desc Verify word character with ignore case flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIgnoreCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexIgnoreCase0001 start');

      const re49: RegExp = /\w+/i;
      const result49: boolean = re49.test("TEST");
      console.log(`49. Word char with ignore case: ${result49}`);
      expect(result49).assertTrue();
      done();
      console.log('testRegexIgnoreCase0001 done');
    });

    /**
     * @tc.number REGEX_DIGIT_QUANTIFIER_0100
     * @tc.name testRegexDigitQuantifier0001
     * @tc.desc Verify digit with plus quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDigitQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDigitQuantifier0001 start');

      const re50: RegExp = /\d+/;
      const result50: boolean = re50.test("12345");
      console.log(`50. Digit with plus quantifier: ${result50}`);
      expect(result50).assertTrue();
      done();
      console.log('testRegexDigitQuantifier0001 done');
    });

    /**
     * @tc.number REGEX_WORD_QUANTIFIER_0100
     * @tc.name testRegexWordQuantifier0001
     * @tc.desc Verify word character with star quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWordQuantifier0001 start');

      const re51: RegExp = /\w*/;
      const result51: boolean = re51.test("variable123");
      console.log(`51. Word char with star quantifier: ${result51}`);
      expect(result51).assertTrue();
      done();
      console.log('testRegexWordQuantifier0001 done');
    });

    /**
     * @tc.number REGEX_WHITESPACE_OPTIONAL_0100
     * @tc.name testRegexWhitespaceOptional0001
     * @tc.desc Verify whitespace with optional quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWhitespaceOptional0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWhitespaceOptional0001 start');

      const re52: RegExp = /\s?/;
      const result52: boolean = re52.test("");
      console.log(`52. Whitespace with optional quantifier: ${result52}`);
      expect(result52).assertTrue();
      done();
      console.log('testRegexWhitespaceOptional0001 done');
    });

    /**
     * @tc.number REGEX_CHARSET_DIGIT_SPACE_0100
     * @tc.name testRegexCharsetDigitSpace0001
     * @tc.desc Verify character set with digit and space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharsetDigitSpace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCharsetDigitSpace0001 start');

      const re53: RegExp = /[\d\s]/;
      const result53: boolean = re53.test(" 123");
      console.log(`53. Charset with digit and space: ${result53}`);
      expect(result53).assertTrue();
      done();
      console.log('testRegexCharsetDigitSpace0001 done');
    });

    /**
     * @tc.number SUB_REGEX_NEGATED_CHARSET_0100
     * @tc.name testRegexNegatedCharset0001
     * @tc.desc Verify negated character set with word character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegatedCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNegatedCharset0001 start');

      const re54: RegExp = /[^\w]/;
      const result54: boolean = re54.test("!");
      console.log(`54. Negated charset with word char: ${result54}`);
      expect(result54).assertTrue();
      done();
      console.log('testRegexNegatedCharset0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_STRING_0100
     * @tc.name testRegexEmptyString0001
     * @tc.desc Verify whitespace quantifier with empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyString0001 start');

      const re55: RegExp = /\s*/;
      const result55: boolean = re55.test("");
      console.log(`55. Whitespace quantifier with empty string: ${result55}`);
      expect(result55).assertTrue();
      done();
      console.log('testRegexEmptyString0001 done');
    });

    /**
     * @tc.number REGEX_LONG_STRING_0100
     * @tc.name testRegexLongString0001
     * @tc.desc Verify digit quantifier in long string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLongString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLongString0001 start');

      const re56: RegExp = /\d{5}/;
      const result56: boolean = re56.test("abcdefghijklmnopqrstuvwxyz12345");
      console.log(`56. Digit quantifier in long string: ${result56}`);
      expect(result56).assertTrue();
      done();
      console.log('testRegexLongString0001 done');
    });

    /**
     * @tc.number REGEX_INVALID_ESCAPE_0100
     * @tc.name testRegexInvalidEscape0001
     * @tc.desc Verify invalid escape sequence behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexInvalidEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexInvalidEscape0001 start');

      const re57: RegExp = /\a/;
      const result57: boolean = re57.test("a");
      console.log(`57. Invalid escape sequence: ${result57}`);
      expect(result57).assertTrue();
      done();
      console.log('testRegexInvalidEscape0001 done');
    });

    /**
     * @tc.number REGEX_URL_PATTERN_0100
     * @tc.name testRegexUrlPattern0001
     * @tc.desc Verify URL pattern with special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUrlPattern0001 start');

      const re58: RegExp = /https?:\/\/\w+\.\w+/;
      const result58: boolean = re58.test("https://example.com");
      console.log(`58. URL pattern with special chars: ${result58}`);
      expect(result58).assertTrue();
      done();
      console.log('testRegexUrlPattern0001 done');
    });

    /**
     * @tc.number REGEX_EMAIL_PATTERN_0100
     * @tc.name testRegexEmailPattern0001
     * @tc.desc Verify email pattern with special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmailPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmailPattern0001 start');

      const re59: RegExp = /\w+@\w+\.\w+/;
      const result59: boolean = re59.test("test@example.com");
      console.log(`59. Email pattern with special chars: ${result59}`);
      expect(result59).assertTrue();
      done();
      console.log('testRegexEmailPattern0001 done');
    });

    /**
     * @tc.number REGEX_FILE_PATH_0100
     * @tc.name testRegexFilePath0001
     * @tc.desc Verify file path pattern with backslashes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFilePath0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexFilePath0001 start');

      const re60: RegExp = /C:\\\\path\\\\to\\\\file/;
      const result60: boolean = re60.test("C:\\path\\to\\file");
      console.log(`60. File path with backslashes: ${result60}`);
      expect(result60).assertFalse();
      done();
      console.log('testRegexFilePath0001 done');
    });

    /**
     * @tc.number REGEX_IP_ADDRESS_0100
     * @tc.name testRegexIpAddress0001
     * @tc.desc Verify IP address pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpAddress0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexIpAddress0001 start');

      const re61: RegExp = /\d+\.\d+\.\d+\.\d+/;
      const result61: boolean = re61.test("192.168.1.1");
      console.log(`61. IP address match: ${result61}`);
      expect(result61).assertTrue();
      done();
      console.log('testRegexIpAddress0001 done');
    });

    /**
     * @tc.number REGEX_IP_WITH_PORT_0100
     * @tc.name testRegexIpWithPort0001
     * @tc.desc Verify IP address with port pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpWithPort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexIpWithPort0001 start');

      const re62: RegExp = /\d+\.\d+\.\d+\.\d+:\d+/;
      const result62: boolean = re62.test("192.168.1.1:8080");
      console.log(`62. IP with port match: ${result62}`);
      expect(result62).assertTrue();
      done();
      console.log('testRegexIpWithPort0001 done');
    });

    /**
     * @tc.number REGEX_PHONE_NUMBER_0100
     * @tc.name testRegexPhoneNumber0001
     * @tc.desc Verify phone number pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPhoneNumber0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPhoneNumber0001 start');

      const re63: RegExp = /\d{3}-\d{3}-\d{4}/;
      const result63: boolean = re63.test("123-456-7890");
      console.log(`63. Phone number match: ${result63}`);
      expect(result63).assertTrue();
      done();
      console.log('testRegexPhoneNumber0001 done');
    });

    /**
     * @tc.number REGEX_AREA_CODE_PHONE_0100
     * @tc.name testRegexAreaCodePhone0001
     * @tc.desc Verify phone number with area code pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexAreaCodePhone0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexAreaCodePhone0001 start');

      const re64: RegExp = /\(\d{3}\) \d{3}-\d{4}/;
      const result64: boolean = re64.test("(123) 456-7890");
      console.log(`64. Area code phone match: ${result64}`);
      expect(result64).assertTrue();
      done();
      console.log('testRegexAreaCodePhone0001 done');
    });

    /**
     * @tc.number REGEX_DATE_FORMAT_0100
     * @tc.name testRegexDateFormat0001
     * @tc.desc Verify date format (MM/DD/YYYY) pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDateFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDateFormat0001 start');

      const re65: RegExp = /\d{2}\/\d{2}\/\d{4}/;
      const result65: boolean = re65.test("12/31/2023");
      console.log(`65. Date format match: ${result65}`);
      expect(result65).assertTrue();
      done();
      console.log('testRegexDateFormat0001 done');
    });

    /**
     * @tc.number REGEX_TIME_FORMAT_0100
     * @tc.name testRegexTimeFormat0001
     * @tc.desc Verify time format (HH:MM:SS) pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTimeFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTimeFormat0001 start');

      const re66: RegExp = /\d{2}:\d{2}:\d{2}/;
      const result66: boolean = re66.test("23:59:59");
      console.log(`66. Time format match: ${result66}`);
      expect(result66).assertTrue();
      done();
      console.log('testRegexTimeFormat0001 done');
    });

    /**
     * @tc.number SUB_REGEX_CURRENCY_FORMAT_0100
     * @tc.name testRegexCurrencyFormat0001
     * @tc.desc Verify currency format pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCurrencyFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCurrencyFormat0001 start');

      const re67: RegExp = /\$\d+\.\d{2}/;
      const result67: boolean = re67.test("$19.99");
      console.log(`67. Currency format match: ${result67}`);
      expect(result67).assertTrue();
      done();
      console.log('testRegexCurrencyFormat0001 done');
    });

    /**
     * @tc.number REGEX_PERCENTAGE_FORMAT_0100
     * @tc.name testRegexPercentageFormat0001
     * @tc.desc Verify percentage format pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPercentageFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPercentageFormat0001 start');

      const re68: RegExp = /\d+%/;
      const result68: boolean = re68.test("50%");
      console.log(`68. Percentage format match: ${result68}`);
      expect(result68).assertTrue();
      done();
      console.log('testRegexPercentageFormat0001 done');
    });

    /**
     * @tc.number REGEX_VERSION_NUMBER_0100
     * @tc.name testRegexVersionNumber0001
     * @tc.desc Verify version number pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexVersionNumber0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexVersionNumber0001 start');

      const re69: RegExp = /\d+\.\d+\.\d+/;
      const result69: boolean = re69.test("1.2.3");
      console.log(`69. Version number match: ${result69}`);
      expect(result69).assertTrue();
      done();
      console.log('testRegexVersionNumber0001 done');
    });

    /**
     * @tc.number REGEX_HTML_TAG_0100
     * @tc.name testRegexHtmlTag0001
     * @tc.desc Verify HTML tag pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHtmlTag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHtmlTag0001 start');

      const re70: RegExp = /<\/?\w+>/;
      const result70: boolean = re70.test("<div>");
      console.log(`70. HTML tag match: ${result70}`);
      expect(result70).assertTrue();
      done();
      console.log('testRegexHtmlTag0001 done');
    });

    /**
     * @tc.number REGEX_XML_ATTRIBUTE_0100
     * @tc.name testRegexXmlAttribute0001
     * @tc.desc Verify XML attribute pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexXmlAttribute0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexXmlAttribute0001 start');

      const re71: RegExp = /\w+="[^"]*"/;
      const result71: boolean = re71.test('name="value"');
      console.log(`71. XML attribute match: ${result71}`);
      expect(result71).assertTrue();
      done();
      console.log('testRegexXmlAttribute0001 done');
    });

    /**
     * @tc.number REGEX_CSS_SELECTOR_0100
     * @tc.name testRegexCssSelector0001
     * @tc.desc Verify CSS selector pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCssSelector0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCssSelector0001 start');

      const re72: RegExp = /\.\w+/;
      const result72: boolean = re72.test(".class");
      console.log(`72. CSS selector match: ${result72}`);
      expect(result72).assertTrue();
      done();
      console.log('testRegexCssSelector0001 done');
    });

    /**
     * @tc.number REGEX_REGEX_LITERAL_0100
     * @tc.name testRegexRegexLiteral0001
     * @tc.desc Verify regex literal pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexRegexLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexRegexLiteral0001 start');

      const re73: RegExp = /\/.+\//;
      const result73: boolean = re73.test("/pattern/");
      console.log(`73. Regex literal match: ${result73}`);
      expect(result73).assertTrue();
      done();
      console.log('testRegexRegexLiteral0001 done');
    });

    /**
     * @tc.number REGEX_JSON_KEY_VALUE_0100
     * @tc.name testRegexJsonKeyValue0001
     * @tc.desc Verify JSON key-value pair pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexJsonKeyValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexJsonKeyValue0001 start');

      const re74: RegExp = /"\w+": ".+"/;
      const result74: boolean = re74.test('"key": "value"');
      console.log(`74. JSON key-value match: ${result74}`);
      expect(result74).assertTrue();
      done();
      console.log('testRegexJsonKeyValue0001 done');
    });

    /**
     * @tc.number REGEX_CODE_COMMENT_0100
     * @tc.name testRegexCodeComment0001
     * @tc.desc Verify code comment pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCodeComment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCodeComment0001 start');

      const re75: RegExp = /\/\/.+/;
      const result75: boolean = re75.test("// this is a comment");
      console.log(`75. Code comment match: ${result75}`);
      expect(result75).assertTrue();
      done();
      console.log('testRegexCodeComment0001 done');
    });

    /**
     * @tc.number REGEX_FUNCTION_CALL_0100
     * @tc.name testRegexFunctionCall0001
     * @tc.desc Verify function call with parameters pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFunctionCall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexFunctionCall0001 start');

      const re76: RegExp = /\w+\([^)]*\)/;
      const result76: boolean = re76.test("function(arg1, arg2)");
      console.log(`76. Function call match: ${result76}`);
      expect(result76).assertTrue();
      done();
      console.log('testRegexFunctionCall0001 done');
    });

    /**
     * @tc.number REGEX_ARRAY_LITERAL_0100
     * @tc.name testRegexArrayLiteral0001
     * @tc.desc Verify array literal pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexArrayLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexArrayLiteral0001 start');

      const re77: RegExp = /\[[^]]*\]/;
      const result77: boolean = re77.test("[1, 2, 3]");
      console.log(`77. Array literal match: ${result77}`);
      expect(result77).assertFalse();
      done();
      console.log('testRegexArrayLiteral0001 done');
    });

    /**
     * @tc.number REGEX_BOOLEAN_LITERAL_0100
     * @tc.name testRegexBooleanLiteral0001
     * @tc.desc Verify boolean literal pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexBooleanLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexBooleanLiteral0001 start');

      const re78: RegExp = /true|false/;
      const result78: boolean = re78.test("true");
      console.log(`78. Boolean literal match: ${result78}`);
      expect(result78).assertTrue();
      done();
      console.log('testRegexBooleanLiteral0001 done');
    });

    /**
     * @tc.number REGEX_NULL_LITERAL_0100
     * @tc.name testRegexNullLiteral0001
     * @tc.desc Verify null literal pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNullLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNullLiteral0001 start');

      const re79: RegExp = /null/;
      const result79: boolean = re79.test("null");
      console.log(`79. Null literal match: ${result79}`);
      expect(result79).assertTrue();
      done();
      console.log('testRegexNullLiteral0001 done');
    });

    /**
     * @tc.number REGEX_UUID_FORMAT_0100
     * @tc.name testRegexUuidFormat0001
     * @tc.desc Verify UUID format pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUuidFormat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUuidFormat0001 start');

      const re80: RegExp = /[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}/;
      const result80: boolean = re80.test("f81d4fae-7dec-11d0-a765-00a0c91e6bf6");
      console.log(`80. UUID format match: ${result80}`);
      expect(result80).assertTrue();
      done();
      console.log('testRegexUuidFormat0001 done');
    });

    /**
     * @tc.number REGEX_HEX_COLOR_0100
     * @tc.name testRegexHexColor0001
     * @tc.desc Verify hexadecimal color code pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHexColor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHexColor0001 start');

      const re81: RegExp = /#([0-9a-fA-F]{3}){1,2}/;
      const result81: boolean = re81.test("#ff00ff");
      console.log(`81. Hex color match: ${result81}`);
      expect(result81).assertTrue();
      done();
      console.log('testRegexHexColor0001 done');
    });

    /**
     * @tc.number REGEX_ISBN_0100
     * @tc.name testRegexIsbn0001
     * @tc.desc Verify ISBN pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIsbn0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexIsbn0001 start');

      const re82: RegExp = /\d{10}|\d{13}/;
      const result82: boolean = re82.test("978020137962");
      console.log(`82. ISBN match: ${result82}`);
      expect(result82).assertTrue();
      done();
      console.log('testRegexIsbn0001 done');
    });

    /**
     * @tc.number REGEX_CREDIT_CARD_0100
     * @tc.name testRegexCreditCard0001
     * @tc.desc Verify credit card number pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCreditCard0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCreditCard0001 start');

      const re83: RegExp = /\d{4} \d{4} \d{4} \d{4}/;
      const result83: boolean = re83.test("4111 1111 1111 1111");
      console.log(`83. Credit card match: ${result83}`);
      expect(result83).assertTrue();
      done();
      console.log('testRegexCreditCard0001 done');
    });

    /**
     * @tc.number REGEX_ZIP_CODE_0100
     * @tc.name testRegexZipCode0001
     * @tc.desc Verify ZIP code pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexZipCode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexZipCode0001 start');

      const re84: RegExp = /\d{5}(-\d{4})?/;
      const result84: boolean = re84.test("12345-6789");
      console.log(`84. ZIP code match: ${result84}`);
      expect(result84).assertTrue();
      done();
      console.log('testRegexZipCode0001 done');
    });

    /**
     * @tc.number REGEX_MAC_ADDRESS_0100
     * @tc.name testRegexMacAddress0001
     * @tc.desc Verify MAC address pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMacAddress0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMacAddress0001 start');

      const re85: RegExp = /([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})/;
      const result85: boolean = re85.test("00:1B:44:11:3A:B7");
      console.log(`85. MAC address match: ${result85}`);
      expect(result85).assertTrue();
      done();
      console.log('testRegexMacAddress0001 done');
    });

    /**
     * @tc.number REGEX_IPV6_0100
     * @tc.name testRegexIpv60001
     * @tc.desc Verify IPv6 address pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpv60001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexIpv60001 start');

      const re86: RegExp = /([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}/;
      const result86: boolean = re86.test("2001:0db8:85a3:0000:0000:8a2e:0370:7334");
      console.log(`86. IPv6 address match: ${result86}`);
      expect(result86).assertTrue();
      done();
      console.log('testRegexIpv60001 done');
    });

    /**
     * @tc.number REGEX_SCIENTIFIC_NOTATION_0100
     * @tc.name testRegexScientificNotation0001
     * @tc.desc Verify scientific notation pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexScientificNotation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexScientificNotation0001 start');

      const re87: RegExp = /\d+(\.\d+)?[eE][+-]?\d+/;
      const result87: boolean = re87.test("1.23e-45");
      console.log(`87. Scientific notation match: ${result87}`);
      expect(result87).assertTrue();
      done();
      console.log('testRegexScientificNotation0001 done');
    });

    /**
     * @tc.number REGEX_ROMAN_NUMERAL_0100
     * @tc.name testRegexRomanNumeral0001
     * @tc.desc Verify Roman numeral pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexRomanNumeral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexRomanNumeral0001 start');

      const re88: RegExp = /M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})/;
      const result88: boolean = re88.test("MCMXCIV");
      console.log(`88. Roman numeral match: ${result88}`);
      expect(result88).assertTrue();
      done();
      console.log('testRegexRomanNumeral0001 done');
    });

    /**
     * @tc.number REGEX_HTML_ENTITY_0100
     * @tc.name testRegexHtmlEntity0001
     * @tc.desc Verify HTML entity pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHtmlEntity0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHtmlEntity0001 start');

      const re89: RegExp = /&[a-zA-Z0-9]+;/;
      const result89: boolean = re89.test("&amp;");
      console.log(`89. HTML entity match: ${result89}`);
      expect(result89).assertTrue();
      done();
      console.log('testRegexHtmlEntity0001 done');
    });

    /**
     * @tc.number REGEX_EMOJI_0100
     * @tc.name testRegexEmoji0001
     * @tc.desc Verify emoji pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmoji0001 start');

      const re90: RegExp = /[\u{1F600}-\u{1F64F}]/u;
      const result90: boolean = re90.test("😊");
      console.log(`90. Emoji match: ${result90}`);
      expect(result90).assertTrue();
      done();
      console.log('testRegexEmoji0001 done');
    });

    /**
     * @tc.number REGEX_FULLWIDTH_CHAR_0100
     * @tc.name testRegexFullwidthChar0001
     * @tc.desc Verify fullwidth character pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFullwidthChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexFullwidthChar0001 start');

      const re91: RegExp = /[\uFF00-\uFFFF]/;
      const result91: boolean = re91.test("Ａ");
      console.log(`91. Fullwidth char match: ${result91}`);
      expect(result91).assertTrue();
      done();
      console.log('testRegexFullwidthChar0001 done');
    });

    /**
     * @tc.number REGEX_HALFWIDTH_CHAR_0100
     * @tc.name testRegexHalfwidthChar0001
     * @tc.desc Verify halfwidth character pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHalfwidthChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHalfwidthChar0001 start');

      const re92: RegExp = /[\u0020-\u007E]/;
      const result92: boolean = re92.test("A");
      console.log(`92. Halfwidth char match: ${result92}`);
      expect(result92).assertTrue();
      done();
      console.log('testRegexHalfwidthChar0001 done');
    });

    /**
     * @tc.number REGEX_CHINESE_CHAR_0100
     * @tc.name testRegexChineseChar0001
     * @tc.desc Verify Chinese character pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexChineseChar0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexChineseChar0001 start');

      const re93: RegExp = /[\u4e00-\u9fa5]/;
      const result93: boolean = re93.test("你好");
      console.log(`93. Chinese char match: ${result93}`);
      expect(result93).assertTrue();
      done();
      console.log('testRegexChineseChar0001 done');
    });

    /**
     * @tc.number REGEX_HIRAGANA_0100
     * @tc.name testRegexHiragana0001
     * @tc.desc Verify Hiragana pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHiragana0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHiragana0001 start');

      const re94: RegExp = /[\u3040-\u309F]/;
      const result94: boolean = re94.test("あいう");
      console.log(`94. Hiragana match: ${result94}`);
      expect(result94).assertTrue();
      done();
      console.log('testRegexHiragana0001 done');
    });

    /**
     * @tc.number REGEX_HANGUL_0100
     * @tc.name testRegexHangul0001
     * @tc.desc Verify Hangul pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHangul0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHangul0001 start');

      const re95: RegExp = /[\uAC00-\uD7AF]/;
      const result95: boolean = re95.test("안녕하세요");
      console.log(`95. Hangul match: ${result95}`);
      expect(result95).assertTrue();
      done();
      console.log('testRegexHangul0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_LINE_0100
     * @tc.name testRegexEmptyLine0001
     * @tc.desc Verify empty line pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyLine0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyLine0001 start');

      const re96: RegExp = /^\s*$/;
      const result96: boolean = re96.test("   ");
      console.log(`96. Empty line match: ${result96}`);
      expect(result96).assertTrue();
      done();
      console.log('testRegexEmptyLine0001 done');
    });

    /**
     * @tc.number REGEX_CAPITALIZED_WORD_0100
     * @tc.name testRegexCapitalizedWord0001
     * @tc.desc Verify capitalized word pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCapitalizedWord0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCapitalizedWord0001 start');

      const re97: RegExp = /\b[A-Z][a-z]*\b/;
      const result97: boolean = re97.test("Hello");
      console.log(`97. Capitalized word match: ${result97}`);
      expect(result97).assertTrue();
      done();
      console.log('testRegexCapitalizedWord0001 done');
    });

    /**
     * @tc.number REGEX_CAMEL_CASE_0100
     * @tc.name testRegexCamelCase0001
     * @tc.desc Verify camelCase pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCamelCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCamelCase0001 start');

      const re98: RegExp = /^[a-z]+([A-Z][a-z]+)*$/;
      const result98: boolean = re98.test("camelCaseVariable");
      console.log(`98. CamelCase match: ${result98}`);
      expect(result98).assertTrue();
      done();
      console.log('testRegexCamelCase0001 done');
    });

    /**
     * @tc.number REGEX_SNAKE_CASE_0100
     * @tc.name testRegexSnakeCase0001
     * @tc.desc Verify snake_case pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexSnakeCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexSnakeCase0001 start');

      const re99: RegExp = /^[a-z]+(_[a-z]+)*$/;
      const result99: boolean = re99.test("snake_case_variable");
      console.log(`99. Snake_case match: ${result99}`);
      expect(result99).assertTrue();
      done();
      console.log('testRegexSnakeCase0001 done');
    });

    /**
     * @tc.number REGEX_PASCAL_CASE_0100
     * @tc.name testRegexPascalCase0001
     * @tc.desc Verify PascalCase pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPascalCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPascalCase0001 start');

      const re100: RegExp = /^[A-Z][a-z]+([A-Z][a-z]+)*$/;
      const result100: boolean = re100.test("PascalCaseClass");
      console.log(`100. PascalCase match: ${result100}`);
      expect(result100).assertTrue();
      done();
      console.log('testRegexPascalCase0001 done');
    });
    /**
     * @tc.number STRING_SPLIT_DYNAMIC_0100
     * @tc.name testStringSplitDynamic0001
     * @tc.desc Verify String.split() with dynamic separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitDynamic0001 start');

      const separator99: string = ",|;";
      const re99: RegExp = new RegExp(separator99);
      const result99: string[] = "a,b;c,d;e".split(re99);
      console.log(`99. split() dynamic: ${result99.join("|")}`);
      expect(result99).assertDeepEquals(["a", "b", "c", "d", "e"]);
      done();
      console.log('testStringSplitDynamic0001 done');
    });

    /**
     * @tc.number REGEX_METHODS_COMPARISON_0100
     * @tc.name testRegexMethodsComparison0001
     * @tc.desc Compare different RegExp methods behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMethodsComparison0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMethodsComparison0001 start');

      const re100: RegExp = /abc/;
      const str100: string = "xyzabc123abc";

      interface RegexMethodsResult {
        exec: string | undefined;
        test: boolean;
        match: string | undefined;
        search: number;
        replace: string;
      }

      const result100: RegexMethodsResult = {
        exec: re100.exec(str100)?.[0],
        test: re100.test(str100),
        match: str100.match(re100)?.[0],
        search: str100.search(re100),
        replace: str100.replace(re100, "def").slice(0, 10)
      };

      console.log(`100. methods comparison: exec=${result100.exec}, test=${result100.test}, ` +
        `match=${result100.match}, search=${result100.search}, ` +
        `replace=${result100.replace}`);
      expect(result100.exec).assertEqual("abc");
      expect(result100.test).assertTrue();
      expect(result100.match).assertEqual("abc");
      expect(result100.search).assertEqual(3);
      expect(result100.replace).assertEqual("xyzdef123a");
      done();
      console.log('testRegexMethodsComparison0001 done');
    });
  })
}