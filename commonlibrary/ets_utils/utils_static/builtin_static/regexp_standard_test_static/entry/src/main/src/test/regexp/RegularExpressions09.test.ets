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

export default function RegularExpressions09Test() {
  describe('RegularExpressions09Test', () => {
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
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7800
     * @tc.name      testRegExpQuantifierPhone0078
     * @tc.desc      Test quantifier matching phone number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierPhone0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re78: RegExp = new RegExp('\\d{3}-\\d{8}|\\d{4}-\\d{7}');
      const result78: boolean = re78.test("010-12345678");
      expect(result78).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7900
     * @tc.name      testRegExpQuantifierPostalCode0079
     * @tc.desc      Test quantifier matching postal code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierPostalCode0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re79: RegExp = new RegExp('\\d{6}');
      const result79: boolean = re79.test("100000");
      expect(result79).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8000
     * @tc.name      testRegExpQuantifierCreditCard0080
     * @tc.desc      Test quantifier matching credit card number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierCreditCard0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re80: RegExp = new RegExp('\\d{4} \\d{4} \\d{4} \\d{4}');
      const result80: boolean = re80.test("1234 5678 9012 3456");
      expect(result80).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8100
     * @tc.name      testRegExpQuantifierZeroCase0081
     * @tc.desc      Test quantifier edge case (n=0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierZeroCase0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re81: RegExp = new RegExp('a{0}');
      const result81 = re81.exec("abc")?.index;
      expect(result81 === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8200
     * @tc.name      testRegExpQuantifierInvalidRange0082
     * @tc.desc      Test quantifier edge case (n>m)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierInvalidRange0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const re82: RegExp = new RegExp("a{5,2}");
        expect(false).assertTrue();
      } catch (e) {
        expect((e as Error).message.toString()).assertEqual("Invalid repetition count");
      }
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8500
     * @tc.name      testRegExpQuantifierEmptyCharSet0085
     * @tc.desc      Test quantifier with empty character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierEmptyCharSet0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re85: RegExp = new RegExp('[]*');
      const result85: boolean = re85.test("anything");
      expect(result85).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8600
     * @tc.name      testRegExpQuantifierEmptyGroup0086
     * @tc.desc      Test quantifier with empty group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierEmptyGroup0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re86: RegExp = new RegExp('()*');
      const matchResult = re86.exec("test");
      const result86 = matchResult ? matchResult[0] : null;
      expect(result86 === "").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8700
     * @tc.name      testRegExpQuantifierGlobalState0087
     * @tc.desc      Test quantifier state in global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierGlobalState0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re87: RegExp = new RegExp('a+', 'g');
      re87.exec("aaa");
      const result87 = re87.lastIndex;
      expect(result87 === 3).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8800
     * @tc.name      testRegExpQuantifierLongString0088
     * @tc.desc      Test quantifier matching extreme case (long string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierLongString0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const longStr = "a".repeat(1000);
      const re88: RegExp = new RegExp('a{1000}');
      const result88: boolean = re88.test(longStr);
      expect(result88).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8900
     * @tc.name      testRegExpQuantifierUnicodeCombining0089
     * @tc.desc      Test quantifier with Unicode combining characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierUnicodeCombining0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re89: RegExp = new RegExp('\\p{L}+', 'u');
      const result89: boolean = re89.test("café");
      expect(result89).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9000
     * @tc.name      testRegExpQuantifierLookahead0090
     * @tc.desc      Test quantifier combined with lookahead assertion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierLookahead0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re90: RegExp = new RegExp('(?=\\d{3})');
      const result90 = re90.exec("12345")?.index;
      expect(result90 === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9100
     * @tc.name      testRegExpQuantifierAlternation0091
     * @tc.desc      Test quantifier matching preceding alternation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierAlternation0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re91: RegExp = new RegExp('(a|b)+');
      const result91 = re91.exec("abab")?.[0] || null;
      expect(result91 === "abab").assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9200
     * @tc.name      testRegExpQuantifierBackreference0092
     * @tc.desc      Test quantifier combined with backreference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierBackreference0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re92: RegExp = new RegExp('(\\w)\\1+');
      const result92 = re92.exec("aabbbcc")?.[0] || null;
      expect(result92 === "aa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9300
     * @tc.name      testRegExpQuantifierHTMLTag0093
     * @tc.desc      Test quantifier matching HTML tag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierHTMLTag0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re93: RegExp = new RegExp('<[^>]+>');
      const result93 = re93.exec("<div class='test'>")?.[0] || null;
      expect(result93 === "<div class='test'>").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9400
     * @tc.name      testRegExpQuantifierJSON0094
     * @tc.desc      Test quantifier matching JSON key-value pair
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierJSON0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re94: RegExp = new RegExp('"[^"]+":\\s*"[^"]+"');
      const result94 = re94.exec('"name": "test"')?.[0] || null;
      expect(result94 === "\"name\": \"test\"").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9500
     * @tc.name      testRegExpQuantifierCSSSelector0095
     * @tc.desc      Test quantifier matching CSS selector
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierCSSSelector0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re95: RegExp = new RegExp('\\.[a-zA-Z0-9_-]+');
      const result95 = re95.exec(".class-name123")?.[0] || null;
      expect(result95 === ".class-name123").assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9600
     * @tc.name      testRegExpQuantifierFilePath0096
     * @tc.desc      Test quantifier matching file path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierFilePath0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re96: RegExp = new RegExp('\\/[\\w-]+', 'g');
      const result96 = "/path/to/file".match(re96)?.join("") || "";
      expect(result96 === "/path/to/file").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9700
     * @tc.name      testRegExpQuantifierVersion0097
     * @tc.desc      Test quantifier matching version number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierVersion0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re97: RegExp = new RegExp('\\d+\\.\\d+\\.\\d+');
      const result97: boolean = re97.test("1.2.3");
      expect(result97).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9800
     * @tc.name      testRegExpQuantifierUsername0098
     * @tc.desc      Test quantifier matching username
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierUsername0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re98: RegExp = new RegExp('^[a-zA-Z0-9_]{3,16}$');
      const result98: boolean = re98.test("user_name123");
      expect(result98).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9900
     * @tc.name      testRegExpQuantifierPassword0099
     * @tc.desc      Test quantifier matching password (at least 8 characters)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierPassword0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re99: RegExp = new RegExp('^.{8,}$');
      const result99: boolean = re99.test("password123");
      expect(result99).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_10000
     * @tc.name      testRegExpComplexQuantifier0100
     * @tc.desc      Test complex quantifier combination matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpComplexQuantifier0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re100: RegExp = new RegExp('^(\\d{3,4}-)?\\d{7,8}$');
      const result100 = re100.test("010-12345678") && re100.test("12345678");
      expect(result100).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0100
     * @tc.name      testRegExpEscapeAsterisk0001
     * @tc.desc      Test backslash escaping special character (*)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeAsterisk0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re1: RegExp = new RegExp('a\\*b');
      const result1: boolean = re1.test("a*b");
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0200
     * @tc.name      testRegExpEscapePlus0002
     * @tc.desc      Test backslash escaping special character (+)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapePlus0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re2: RegExp = new RegExp('a\\+b');
      const result2: boolean = re2.test("a+b");
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0300
     * @tc.name      testRegExpEscapeQuestion0003
     * @tc.desc      Test backslash escaping special character (?)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeQuestion0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re3: RegExp = new RegExp('a\\?b');
      const result3: boolean = re3.test("a?b");
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0400
     * @tc.name      testRegExpEscapeDot0004
     * @tc.desc      Test backslash escaping special character (.)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeDot0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re4: RegExp = new RegExp('a\\.b');
      const result4: boolean = re4.test("a.b");
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0500
     * @tc.name      testRegExpEscapeParenthesis0005
     * @tc.desc      Test backslash escaping special character (()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeParenthesis0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re5: RegExp = new RegExp('a\\(b');
      const result5: boolean = re5.test("a(b");
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0600
     * @tc.name      testRegExpEscapeParenthesisClose0006
     * @tc.desc      Test backslash escaping special character ())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeParenthesisClose0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re6: RegExp = new RegExp('a\\)b');
      const result6: boolean = re6.test("a)b");
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0700
     * @tc.name      testRegExpEscapeBracketOpen0007
     * @tc.desc      Test backslash escaping special character ([)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeBracketOpen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re7: RegExp = new RegExp('a\\[b');
      const result7: boolean = re7.test("a[b");
      expect(result7).assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0800
     * @tc.name      testRegExpEscapeBracketClose0008
     * @tc.desc      Test backslash escaping special character (])
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeBracketClose0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re8: RegExp = new RegExp('a\\]b');
      const result8: boolean = re8.test("a]b");
      expect(result8).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0900
     * @tc.name      testRegExpEscapeBraceOpen0009
     * @tc.desc      Test backslash escaping special character ({)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeBraceOpen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re9: RegExp = new RegExp('a\\{b');
      const result9: boolean = re9.test("a{b");
      expect(result9).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1000
     * @tc.name      testRegExpEscapeBraceClose0010
     * @tc.desc      Test backslash escaping special character (})
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeBraceClose0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re10: RegExp = new RegExp('a\\}b');
      const result10: boolean = re10.test("a}b");
      expect(result10).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1100
     * @tc.name      testRegExpEscapeCaret0011
     * @tc.desc      Test backslash escaping special character (^)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeCaret0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re11: RegExp = new RegExp('a\\^b');
      const result11: boolean = re11.test("a^b");
      expect(result11).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1200
     * @tc.name      testRegExpEscapeDollar0012
     * @tc.desc      Test backslash escaping special character ($)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeDollar0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re12: RegExp = new RegExp('a\\$b');
      const result12: boolean = re12.test("a$b");
      expect(result12).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1300
     * @tc.name      testRegExpEscapePipe0013
     * @tc.desc      Test backslash escaping special character (|)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapePipe0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re13: RegExp = new RegExp('a\\|b');
      const result13: boolean = re13.test("a|b");
      expect(result13).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1400
     * @tc.name      testRegExpEscapeWordBoundary0014
     * @tc.desc      Test backslash making ordinary character special (b → word boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeWordBoundary0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re14: RegExp = new RegExp('\\btest');
      const result14: boolean = re14.test(" test");
      expect(result14).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1500
     * @tc.name      testRegExpEscapeDigit0015
     * @tc.desc      Test backslash making ordinary character special (d → digit)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeDigit0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re15: RegExp = new RegExp('\\d');
      const result15: boolean = re15.test("5");
      expect(result15).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_1600
     * @tc.name      testRegExpCaretStart0016
     * @tc.desc      Test caret (^) matching string start
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretStart0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re16: RegExp = new RegExp('^test');
      const result16: boolean = re16.test("testabc");
      expect(result16).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_1700
     * @tc.name      testRegExpCaretNotStart0017
     * @tc.desc      Test caret (^) not matching non-start position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretNotStart0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re17: RegExp = new RegExp('^test');
      const result17: boolean = re17.test("atestabc");
      expect(result17).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_1800
     * @tc.name      testRegExpCaretMultiline0018
     * @tc.desc      Test caret (^) with m flag matching after newline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretMultiline0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re18: RegExp = new RegExp('^line', 'm');
      const result18: boolean = re18.test("first\nline");
      expect(result18).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_1900
     * @tc.name      testRegExpCaretNegation0019
     * @tc.desc      Test caret (^) at character set start for negation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretNegation0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re19: RegExp = new RegExp('[^abc]');
      const result19: boolean = re19.test("d");
      expect(result19).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_2000
     * @tc.name      testRegExpCaretLiteral0020
     * @tc.desc      Test caret (^) at non-start of character set as literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretLiteral0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re20: RegExp = new RegExp('[a^bc]');
      const result20: boolean = re20.test("^");
      expect(result20).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_2100
     * @tc.name      testRegExpDollarEnd0021
     * @tc.desc      Test dollar ($) matching string end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDollarEnd0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re21: RegExp = new RegExp('test$');
      const result21: boolean = re21.test("abctest");
      expect(result21).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_2200
     * @tc.name      testRegExpDollarNotEnd0022
     * @tc.desc      Test dollar ($) not matching non-end position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDollarNotEnd0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re22: RegExp = new RegExp('test$');
      const result22: boolean = re22.test("abctestxyz");
      expect(result22).assertFalse();
    });
    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_2300
     * @tc.name      testRegExpDollarMultiline0023
     * @tc.desc      Test dollar ($) with m flag matching before newline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDollarMultiline0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re23: RegExp = new RegExp('line$', 'm');
      const result23: boolean = re23.test("line\nsecond");
      expect(result23).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2400
     * @tc.name      testRegExpStarZeroMatch0024
     * @tc.desc      Test asterisk (*) matches preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarZeroMatch0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re24: RegExp = new RegExp('a*b');
      const result24: boolean = re24.test("b");
      expect(result24).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2500
     * @tc.name      testRegExpStarOneMatch0025
     * @tc.desc      Test asterisk (*) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarOneMatch0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re25: RegExp = new RegExp('a*b');
      const result25: boolean = re25.test("ab");
      expect(result25).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2600
     * @tc.name      testRegExpStarMultipleMatch0026
     * @tc.desc      Test asterisk (*) matches preceding item multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarMultipleMatch0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re26: RegExp = new RegExp('a*b');
      const result26: boolean = re26.test("aaab");
      expect(result26).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2700
     * @tc.name      testRegExpStarEquivalent0027
     * @tc.desc      Test asterisk (*) equivalent to {0,}
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarEquivalent0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re27: RegExp = new RegExp('a{0,}b');
      const result27: boolean = re27.test("aaab");
      expect(result27).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2800
     * @tc.name      testRegExpPlusOneMatch0028
     * @tc.desc      Test plus (+) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusOneMatch0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re28: RegExp = new RegExp('a+b');
      const result28: boolean = re28.test("ab");
      expect(result28).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3000
     * @tc.name      testRegExpPlusNoZeroMatch0030
     * @tc.desc      Test plus (+) does not match preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusNoZeroMatch0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re30: RegExp = new RegExp('a+b');
      const result30: boolean = re30.test("b");
      expect(result30).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3100
     * @tc.name      testRegExpPlusEquivalent0031
     * @tc.desc      Test plus (+) equivalent to {1,}
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusEquivalent0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re31: RegExp = new RegExp('a{1,}b');
      const result31: boolean = re31.test("aaab");
      expect(result31).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3200
     * @tc.name      testRegExpQuestionZeroMatch0032
     * @tc.desc      Test question mark (?) matches preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionZeroMatch0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re32: RegExp = new RegExp('a?b');
      const result32: boolean = re32.test("b");
      expect(result32).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3300
     * @tc.name      testRegExpQuestionOneMatch0033
     * @tc.desc      Test question mark (?) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionOneMatch0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re33: RegExp = new RegExp('a?b');
      const result33: boolean = re33.test("ab");
      expect(result33).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3500
     * @tc.name      testRegExpQuestionEquivalent0035
     * @tc.desc      Test question mark (?) equivalent to {0,1}
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionEquivalent0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re35: RegExp = new RegExp('a{0,1}b');
      const result35: boolean = re35.test("ab");
      expect(result35).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3600
     * @tc.name      testRegExpNonGreedyPlus0036
     * @tc.desc      Test question mark (?) making quantifier non-greedy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyPlus0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re36: RegExp = new RegExp('a+?b');
      const result36 = re36.exec("aaab")?.[0] || null;
      expect(result36).assertEqual("aaab");
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3700
     * @tc.name      testRegExpPositiveLookahead0037
     * @tc.desc      Test question mark (?) for positive lookahead (x (?=y))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPositiveLookahead0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re37: RegExp = new RegExp('a(?=b)');
      const result37 = re37.exec("ab")?.[0] || null;
      expect(result37 === "a").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3800
     * @tc.name      testRegExpNegativeLookahead0038
     * @tc.desc      Test question mark (?) for negative lookahead (x (?!y))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNegativeLookahead0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re38: RegExp = new RegExp('a(?!b)');
      const result38: boolean = re38.test("ac");
      expect(result38).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3900
     * @tc.name      testRegExpDotCharacter0039
     * @tc.desc      Test dot (.) matching any character except newline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDotCharacter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re39: RegExp = new RegExp('a.b');
      const result39: boolean = re39.test("acb");
      expect(result39).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4000
     * @tc.name      testRegExpDotNoNewline0040
     * @tc.desc      Test dot (.) not matching newline character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDotNoNewline0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re40: RegExp = new RegExp('a.b');
      const result40: boolean = re40.test("a\nb");
      expect(result40).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4100
     * @tc.name      testRegExpDotWithSFlag0041
     * @tc.desc      Test dot (.) matching newline character with s flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDotWithSFlag0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re41: RegExp = new RegExp('a.b', 's');
      const result41: boolean = re41.test("a\nb");
      expect(result41).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4300
     * @tc.name      testRegExpDotWithDigit0043
     * @tc.desc      Test dot (.) matching digit character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDotWithDigit0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re43: RegExp = new RegExp('a.b');
      const result43: boolean = re43.test("a1b");
      expect(result43).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4400
     * @tc.name      testRegExpCaptureGroup0044
     * @tc.desc      Test parentheses ((x)) for capture groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaptureGroup0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re44: RegExp = new RegExp('(a)(b)');
      const result44 = re44.exec("ab");
      expect(result44?.[0] === "ab").assertTrue();
      expect(result44?.[1] === "a").assertTrue();
      expect(result44?.[2] === "b").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4500
     * @tc.name      testRegExpBackReference0045
     * @tc.desc      Test parentheses ((x)) back reference \1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBackReference0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re45: RegExp = new RegExp('(a)\\1');
      const result45: boolean = re45.test("aa");
      expect(result45).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4600
     * @tc.name      testRegExpBackReference0046
     * @tc.desc      Test parentheses ((x)) back reference \2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBackReference0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re46: RegExp = new RegExp('(a)(b)\\2\\1');
      const result46: boolean = re46.test("abba");
      expect(result46).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4700
     * @tc.name      testRegExpNonCaptureGroup0047
     * @tc.desc      Test non-capturing parentheses ((?:x)) not memorizing match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonCaptureGroup0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re47: RegExp = new RegExp('(?:a)(b)');
      const result47 = re47.exec("ab");
      expect(result47?.length === 2).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4800
     * @tc.name      testRegExpNonCaptureWithQuantifier0048
     * @tc.desc      Test non-capturing parentheses ((?:x)) combined with quantifier
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonCaptureWithQuantifier0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re48: RegExp = new RegExp('(?:ab){2}');
      const result48: boolean = re48.test("abab");
      expect(result48).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4900
     * @tc.name      testRegExpCharacterClass0049
     * @tc.desc      Test square brackets ([xyz]) matching any one character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharacterClass0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re49: RegExp = new RegExp('[abc]');
      const result49: boolean = re49.test("b");
      expect(result49).assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5000
     * @tc.name      testRegExpCharacterClassExclusion0050
     * @tc.desc      Test square brackets ([xyz]) not matching excluded characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharacterClassExclusion0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re50: RegExp = new RegExp('[abc]');
      const result50: boolean = re50.test("d");
      expect(result50).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5100
     * @tc.name      testRegExpCharacterRange0051
     * @tc.desc      Test square brackets ([a-z]) matching character range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharacterRange0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re51: RegExp = new RegExp('[a-z]');
      const result51: boolean = re51.test("x");
      expect(result51).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5200
     * @tc.name      testRegExpUppercaseRange0052
     * @tc.desc      Test square brackets ([A-Z]) matching uppercase character range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUppercaseRange0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re52: RegExp = new RegExp('[A-Z]');
      const result52: boolean = re52.test("X");
      expect(result52).assertTrue();
    });
 })
}