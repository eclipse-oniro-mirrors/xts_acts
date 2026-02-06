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

export default function RegularExpressions10Test() {
  describe('RegularExpressions10Test', () => {
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
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5300
     * @tc.name      testRegExpDigitRange0053
     * @tc.desc      Test square brackets ([0-9]) matching digit range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDigitRange0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re53: RegExp = new RegExp('[0-9]');
      const result53: boolean = re53.test("5");
      expect(result53).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_5400
     * @tc.name      testRegExpAlphanumericRange0054
     * @tc.desc      Test square brackets ([a-z0-9]) matching alphanumeric range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlphanumericRange0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re54: RegExp = new RegExp('[a-z0-9]', 'i');
      const result54: boolean = re54.test("5");
      expect(result54).assertTrue();
    });

    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_5500
     * @tc.name      testRegExpNegatedCharacterClass0055
     * @tc.desc      Test square brackets ([^xyz]) for negated character matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNegatedCharacterClass0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re55: RegExp = new RegExp('[^abc]');
      const result55: boolean = re55.test("d");
      expect(result55).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_5600
     * @tc.name      testRegExpNegatedRange0056
     * @tc.desc      Test square brackets ([^a-z]) for negated range matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNegatedRange0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re56: RegExp = new RegExp('[^a-z]');
      const result56: boolean = re56.test("A");
      expect(result56).assertTrue();
    });

    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_5700
     * @tc.name      testRegExpBackspace0057
     * @tc.desc      Test square brackets ([\\b]) matching backspace character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBackspace0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re57: RegExp = new RegExp('[\\b]');
      const result57: boolean = re57.test("a\bb");
      expect(result57).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5800
     * @tc.name      testRegExpWordBoundaryStart0058
     * @tc.desc      Test word boundary (\\b) matching word start
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordBoundaryStart0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re58: RegExp = new RegExp('\\btest');
      const result58: boolean = re58.test(" test");
      expect(result58).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_5900
     * @tc.name      testRegExpWordBoundaryEnd0059
     * @tc.desc      Test word boundary (\\b) matching word end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordBoundaryEnd0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re59: RegExp = new RegExp('test\\b');
      const result59: boolean = re59.test("test ");
      expect(result59).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6000
     * @tc.name      testRegExpWordBoundaryMiddle0060
     * @tc.desc      Test word boundary (\\b) not matching word middle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordBoundaryMiddle0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re60: RegExp = new RegExp('es\\b');
      const result60: boolean = re60.test("test");
      expect(result60).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6100
     * @tc.name      testRegExpNonWordBoundary0061
     * @tc.desc      Test non-word boundary (\\B) matching word middle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWordBoundary0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re61: RegExp = new RegExp('es\\B');
      const result61: boolean = re61.test("test");
      expect(result61).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6200
     * @tc.name      testRegExpNonWordBoundaryStart0062
     * @tc.desc      Test non-word boundary (\\B) not matching word start
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWordBoundaryStart0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re62: RegExp = new RegExp('\\Btest');
      const result62: boolean = re62.test(" test");
      expect(result62).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6300
     * @tc.name      testRegExpNonWordBoundaryEnd0063
     * @tc.desc      Test non-word boundary (\\B) not matching word end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWordBoundaryEnd0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re63: RegExp = new RegExp('test\\B');
      const result63: boolean = re63.test("test ");
      expect(result63).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6400
     * @tc.name      testRegExpControlCharacter0064
     * @tc.desc      Test control character (\\cX) matching Control-M (\\r)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpControlCharacter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re64: RegExp = new RegExp('\\cM');
      const result64: boolean = re64.test("\r");
      expect(result64).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6500
     * @tc.name      testRegExpControlZ0065
     * @tc.desc      Test control character (\\cX) matching Control-Z
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpControlZ0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re65: RegExp = new RegExp('\\cZ');
      const result65: boolean = re65.test("\x1A");
      expect(result65).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6600
     * @tc.name      testRegExpDigit0066
     * @tc.desc      Test digit (\\d) matching numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDigit0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re66: RegExp = new RegExp('\\d');
      const result66: boolean = re66.test("123");
      expect(result66).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6700
     * @tc.name      testRegExpNonDigit0067
     * @tc.desc      Test non-digit (\\D) matching non-numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonDigit0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re67: RegExp = new RegExp('\\D');
      const result67: boolean = re67.test("123a");
      expect(result67).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6800
     * @tc.name      testRegExpWhitespace0068
     * @tc.desc      Test whitespace character (\\s) matching space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWhitespace0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re68: RegExp = new RegExp('\\s');
      const result68: boolean = re68.test("a b");
      expect(result68).assertTrue();
    });
    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_6900
     * @tc.name      testRegExpWhitespaceTab0069
     * @tc.desc      Test whitespace character (\\s) matching tab character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWhitespaceTab0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re69: RegExp = new RegExp('\\s');
      const result69: boolean = re69.test("a\tb");
      expect(result69).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7000
     * @tc.name      testRegExpWhitespaceNewline0070
     * @tc.desc      Test whitespace character (\\s) matching newline character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWhitespaceNewline0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re70: RegExp = new RegExp('\\s');
      const result70: boolean = re70.test("a\nb");
      expect(result70).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7100
     * @tc.name      testRegExpNonWhitespace0071
     * @tc.desc      Test non-whitespace character (\\S) matching non-whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWhitespace0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re71: RegExp = new RegExp('\\S');
      const result71: boolean = re71.test("   a   ");
      expect(result71).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7200
     * @tc.name      testRegExpWordCharacter0072
     * @tc.desc      Test word character (\\w) matching letters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordCharacter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re72: RegExp = new RegExp('\\w');
      const result72: boolean = re72.test("abc");
      expect(result72).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7300
     * @tc.name      testRegExpWordCharacterDigit0073
     * @tc.desc      Test word character (\\w) matching digits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordCharacterDigit0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re73: RegExp = new RegExp('\\w');
      const result73: boolean = re73.test("123");
      expect(result73).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7400
     * @tc.name      testRegExpWordCharacterUnderscore0074
     * @tc.desc      Test word character (\\w) matching underscore
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordCharacterUnderscore0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re74: RegExp = new RegExp('\\w');
      const result74: boolean = re74.test("_");
      expect(result74).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7500
     * @tc.name      testRegExpNonWordCharacter0075
     * @tc.desc      Test non-word character (\\W) matching special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWordCharacter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re75: RegExp = new RegExp('\\W');
      const result75: boolean = re75.test("@");
      expect(result75).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7600
     * @tc.name      testRegExpHexEscape0076
     * @tc.desc      Test hexadecimal (\\xhh) matching \\x41 (A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpHexEscape0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re76: RegExp = new RegExp('\\x41');
      const result76: boolean = re76.test("A");
      expect(result76).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7700
     * @tc.name      testRegExpHexEscapeLowercase0077
     * @tc.desc      Test hexadecimal (\\xhh) matching \\x61 (a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpHexEscapeLowercase0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re77: RegExp = new RegExp('\\x61');
      const result77: boolean = re77.test("a");
      expect(result77).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7800
     * @tc.name      testRegExpUnicodeEscape0078
     * @tc.desc      Test UTF-16 (\\uhhhh) matching \\u0041 (A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUnicodeEscape0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re78: RegExp = new RegExp('\\u0041');
      const result78: boolean = re78.test("A");
      expect(result78).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7900
     * @tc.name      testRegExpUnicodeEscapeLowercase0079
     * @tc.desc      Test UTF-16 (\\uhhhh) matching \\u0061 (a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUnicodeEscapeLowercase0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re79: RegExp = new RegExp('\\u0061');
      const result79: boolean = re79.test("a");
      expect(result79).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8000
     * @tc.name      testRegExpUnicodeCodePoint0080
     * @tc.desc      Test UTF-32 (\\u{hhhh}) with u flag matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUnicodeCodePoint0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re80: RegExp = new RegExp('\\u{4E2D}', 'u');
      const result80: boolean = re80.test("中");
      expect(result80).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8200
     * @tc.name      testRegExpAlternationLeft0082
     * @tc.desc      Test vertical bar (|) matching left character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationLeft0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re82: RegExp = new RegExp('a|b');
      const result82: boolean = re82.test("a");
      expect(result82).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8300
     * @tc.name      testRegExpAlternationRight0083
     * @tc.desc      Test vertical bar (|) matching right character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationRight0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re83: RegExp = new RegExp('a|b');
      const result83: boolean = re83.test("b");
      expect(result83).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8400
     * @tc.name      testRegExpAlternationMultiLeft0084
     * @tc.desc      Test vertical bar (|) matching multi-character left
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationMultiLeft0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re84: RegExp = new RegExp('ab|cd');
      const result84: boolean = re84.test("ab");
      expect(result84).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8500
     * @tc.name      testRegExpAlternationMultiRight0085
     * @tc.desc      Test vertical bar (|) matching multi-character right
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationMultiRight0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re85: RegExp = new RegExp('ab|cd');
      const result85: boolean = re85.test("cd");
      expect(result85).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8600
     * @tc.name      testRegExpAlternationPrecedence0086
     * @tc.desc      Test vertical bar (|) preferring left match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationPrecedence0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re86: RegExp = new RegExp('abc|ab');
      const result86 = re86.exec("abc")?.[0] || null;
      expect(result86 === "abc").assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8700
     * @tc.name      testRegExpExactQuantifier0087
     * @tc.desc      Test curly braces ({n}) matching preceding item n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpExactQuantifier0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re87: RegExp = new RegExp('a{2}');
      const result87: boolean = re87.test("aa");
      expect(result87).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8800
     * @tc.name      testRegExpExactQuantifierFailure0088
     * @tc.desc      Test curly braces ({n}) not matching preceding item n±1 times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpExactQuantifierFailure0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re88: RegExp = new RegExp('a{2}');
      const result88: boolean = re88.test("a");
      expect(result88).assertFalse();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8900
     * @tc.name      testRegExpMinQuantifier0089
     * @tc.desc      Test curly braces ({n,}) matching preceding item at least n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpMinQuantifier0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re89: RegExp = new RegExp('a{2,}');
      const result89: boolean = re89.test("aaa");
      expect(result89).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9000
     * @tc.name      testRegExpMinQuantifierFailure0090
     * @tc.desc      Test curly braces ({n,}) not matching preceding item less than n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpMinQuantifierFailure0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re90: RegExp = new RegExp('a{2,}');
      const result90: boolean = re90.test("a");
      expect(result90).assertFalse();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9100
     * @tc.name      testRegExpRangeQuantifierMin0091
     * @tc.desc      Test curly braces ({n,m}) matching preceding item n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpRangeQuantifierMin0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re91: RegExp = new RegExp('a{2,4}');
      const result91: boolean = re91.test("aa");
      expect(result91).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9200
     * @tc.name      testRegExpRangeQuantifierMiddle0092
     * @tc.desc      Test curly braces ({n,m}) matching preceding item middle times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpRangeQuantifierMiddle0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re92: RegExp = new RegExp('a{2,4}');
      const result92: boolean = re92.test("aaa");
      expect(result92).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9300
     * @tc.name      testRegExpRangeQuantifierMax0093
     * @tc.desc      Test curly braces ({n,m}) matching preceding item m times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpRangeQuantifierMax0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re93: RegExp = new RegExp('a{2,4}');
      const result93: boolean = re93.test("aaaa");
      expect(result93).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9400
     * @tc.name      testRegExpRangeQuantifierExceed0094
     * @tc.desc      Test curly braces ({n,m}) not matching preceding item more than m times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpRangeQuantifierExceed0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re94: RegExp = new RegExp('a{2,4}');
      const result94 = re94.exec("aaaaa")?.[0] || null;
      expect(result94 === "aaaa").assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9500
     * @tc.name      testRegExpNonGreedyRangeQuantifier0095
     * @tc.desc      Test curly braces ({n,m}) non-greedy mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyRangeQuantifier0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re95: RegExp = new RegExp('a{2,4}?');
      const result95 = re95.exec("aaaa")?.[0] || null;
      expect(result95 === "aa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9600
     * @tc.name      testRegExpLookbehind0096
     * @tc.desc      Test question mark (?) for lookbehind assertion ((?<=y) x)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpLookbehind0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re96: RegExp = new RegExp('(?<=a)b');
      const result96: boolean = re96.test("ab");
      expect(result96).assertTrue();
    });
 })
}