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

export default function RegularExpressions10Test() {
  describe('RegularExpressions10Test', () => {
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
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5300
     * @tc.name      testRegExpDigitRange0053
     * @tc.desc      Test square brackets ([0-9]) matching digit range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDigitRange0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpDigitRange0053";
        console.log(TAG + ' start');

          let re53 = /[0-9]/;
          let result53 = re53.test("5");
          console.log("[0-9] matching '5' result: " + result53);
          expect(result53).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_5400
     * @tc.name      testRegExpAlphanumericRange0054
     * @tc.desc      Test square brackets ([a-z0-9]) matching alphanumeric range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlphanumericRange0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpAlphanumericRange0054";
        console.log(TAG + ' start');

          let re54 = /[a-z0-9]/i;
          let result54 = re54.test("5");
          console.log("[a-z0-9]i matching '5' result: " + result54);
          expect(result54).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_5500
     * @tc.name      testRegExpNegatedCharacterClass0055
     * @tc.desc      Test square brackets ([^xyz]) for negated character matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNegatedCharacterClass0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNegatedCharacterClass0055";
        console.log(TAG + ' start');

          let re55 = /[^abc]/;
          let result55 = re55.test("d");
          console.log("[^abc] matching 'd' result: " + result55);
          expect(result55).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_5600
     * @tc.name      testRegExpNegatedRange0056
     * @tc.desc      Test square brackets ([^a-z]) for negated range matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNegatedRange0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNegatedRange0056";
        console.log(TAG + ' start');

          let re56 = /[^a-z]/;
          let result56 = re56.test("A");
          console.log("[^a-z] matching 'A' result: " + result56);
          expect(result56).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_5700
     * @tc.name      testRegExpBackspace0057
     * @tc.desc      Test square brackets ([\\b]) matching backspace character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBackspace0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBackspace0057";
        console.log(TAG + ' start');

          let re57 = /[\b]/;
          let result57 = re57.test("a\bb");
          console.log("[\\b] matching backspace character result: " + result57);
          expect(result57).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5800
     * @tc.name      testRegExpWordBoundaryStart0058
     * @tc.desc      Test word boundary (\\b) matching word start
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordBoundaryStart0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpWordBoundaryStart0058";
        console.log(TAG + ' start');

          let re58 = /\btest/;
          let result58 = re58.test(" test");
          console.log("\\b matching word start 'test' result: " + result58);
          expect(result58).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_5900
     * @tc.name      testRegExpWordBoundaryEnd0059
     * @tc.desc      Test word boundary (\\b) matching word end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordBoundaryEnd0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpWordBoundaryEnd0059";
        console.log(TAG + ' start');

          let re59 = /test\b/;
          let result59 = re59.test("test ");
          console.log("\\b matching word end 'test' result: " + result59);
          expect(result59).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6000
     * @tc.name      testRegExpWordBoundaryMiddle0060
     * @tc.desc      Test word boundary (\\b) not matching word middle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordBoundaryMiddle0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpWordBoundaryMiddle0060";
        console.log(TAG + ' start');

          let re60 = /es\b/;
          let result60 = re60.test("test");
          console.log("\\b not matching word middle 'es' result: " + result60);
          expect(result60).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6100
     * @tc.name      testRegExpNonWordBoundary0061
     * @tc.desc      Test non-word boundary (\\B) matching word middle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWordBoundary0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonWordBoundary0061";
        console.log(TAG + ' start');

          let re61 = /es\B/;
          let result61 = re61.test("test");
          console.log("\\B matching word middle 'es' result: " + result61);
          expect(result61).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6200
     * @tc.name      testRegExpNonWordBoundaryStart0062
     * @tc.desc      Test non-word boundary (\\B) not matching word start
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWordBoundaryStart0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonWordBoundaryStart0062";
        console.log(TAG + ' start');

          let re62 = /\Btest/;
          let result62 = re62.test(" test");
          console.log("\\B not matching word start 'test' result: " + result62);
          expect(result62).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6300
     * @tc.name      testRegExpNonWordBoundaryEnd0063
     * @tc.desc      Test non-word boundary (\\B) not matching word end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWordBoundaryEnd0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonWordBoundaryEnd0063";
        console.log(TAG + ' start');

          let re63 = /test\B/;
          let result63 = re63.test("test ");
          console.log("\\B not matching word end 'test' result: " + result63);
          expect(result63).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6400
     * @tc.name      testRegExpControlCharacter0064
     * @tc.desc      Test control character (\\cX) matching Control-M (\\r)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpControlCharacter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpControlCharacter0064";
        console.log(TAG + ' start');

          let re64 = /\cM/;
          let result64 = re64.test("\r");
          console.log("\\cM matching Control-M (\\r) result: " + result64);
          expect(result64).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6500
     * @tc.name      testRegExpControlZ0065
     * @tc.desc      Test control character (\\cX) matching Control-Z
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpControlZ0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpControlZ0065";
        console.log(TAG + ' start');

          let re65 = /\cZ/;
          let result65 = re65.test("\x1A");
          console.log("\\cZ matching Control-Z (\\x1A) result: " + result65);
          expect(result65).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6600
     * @tc.name      testRegExpDigit0066
     * @tc.desc      Test digit (\\d) matching numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDigit0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpDigit0066";
        console.log(TAG + ' start');

          let re66 = /\d/;
          let result66 = re66.test("123");
          console.log("\\d matching digit '123' result: " + result66);
          expect(result66).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6700
     * @tc.name      testRegExpNonDigit0067
     * @tc.desc      Test non-digit (\\D) matching non-numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonDigit0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonDigit0067";
        console.log(TAG + ' start');

          let re67 = /\D/;
          let result67 = re67.test("123a");
          console.log("\\D matching non-digit '123a' result: " + result67);
          expect(result67).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6800
     * @tc.name      testRegExpWhitespace0068
     * @tc.desc      Test whitespace character (\\s) matching space
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWhitespace0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpWhitespace0068";
        console.log(TAG + ' start');

          let re68 = /\s/;
          let result68 = re68.test("a b");
          console.log("\\s matching space 'a b' result: " + result68);
          expect(result68).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_6900
     * @tc.name      testRegExpWhitespaceTab0069
     * @tc.desc      Test whitespace character (\\s) matching tab character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWhitespaceTab0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpWhitespaceTab0069";
        console.log(TAG + ' start');

          let re69 = /\s/;
          let result69 = re69.test("a\tb");
          console.log("\\s matching tab character 'a\\tb' result: " + result69);
          expect(result69).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7000
     * @tc.name      testRegExpWhitespaceNewline0070
     * @tc.desc      Test whitespace character (\\s) matching newline character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWhitespaceNewline0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpWhitespaceNewline0070";
        console.log(TAG + ' start');

          let re70 = /\s/;
          let result70 = re70.test("a\nb");
          console.log("\\s matching newline character 'a\\nb' result: " + result70);
          expect(result70).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7100
     * @tc.name      testRegExpNonWhitespace0071
     * @tc.desc      Test non-whitespace character (\\S) matching non-whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWhitespace0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonWhitespace0071";
        console.log(TAG + ' start');

          let re71 = /\S/;
          let result71 = re71.test("   a   ");
          console.log("\\S matching non-whitespace '   a   ' result: " + result71);
          expect(result71).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7200
     * @tc.name      testRegExpWordCharacter0072
     * @tc.desc      Test word character (\\w) matching letters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordCharacter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpWordCharacter0072";
        console.log(TAG + ' start');

          let re72 = /\w/;
          let result72 = re72.test("abc");
          console.log("\\w matching letter 'abc' result: " + result72);
          expect(result72).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7300
     * @tc.name      testRegExpWordCharacterDigit0073
     * @tc.desc      Test word character (\\w) matching digits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordCharacterDigit0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpWordCharacterDigit0073";
        console.log(TAG + ' start');

          let re73 = /\w/;
          let result73 = re73.test("123");
          console.log("\\w matching digit '123' result: " + result73);
          expect(result73).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7400
     * @tc.name      testRegExpWordCharacterUnderscore0074
     * @tc.desc      Test word character (\\w) matching underscore
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpWordCharacterUnderscore0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpWordCharacterUnderscore0074";
        console.log(TAG + ' start');

          let re74 = /\w/;
          let result74 = re74.test("_");
          console.log("\\w matching underscore '_' result: " + result74);
          expect(result74).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7500
     * @tc.name      testRegExpNonWordCharacter0075
     * @tc.desc      Test non-word character (\\W) matching special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonWordCharacter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonWordCharacter0075";
        console.log(TAG + ' start');

          let re75 = /\W/;
          let result75 = re75.test("@");
          console.log("\\W matching '@' result: " + result75);
          expect(result75).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7600
     * @tc.name      testRegExpHexEscape0076
     * @tc.desc      Test hexadecimal (\\xhh) matching \\x41 (A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpHexEscape0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpHexEscape0076";
        console.log(TAG + ' start');

          let re76 = /\x41/;
          let result76 = re76.test("A");
          console.log("\\x41 matching 'A' result: " + result76);
          expect(result76).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7700
     * @tc.name      testRegExpHexEscapeLowercase0077
     * @tc.desc      Test hexadecimal (\\xhh) matching \\x61 (a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpHexEscapeLowercase0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpHexEscapeLowercase0077";
        console.log(TAG + ' start');

          let re77 = /\x61/;
          let result77 = re77.test("a");
          console.log("\\x61 matching 'a' result: " + result77);
          expect(result77).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7800
     * @tc.name      testRegExpUnicodeEscape0078
     * @tc.desc      Test UTF-16 (\\uhhhh) matching \\u0041 (A)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUnicodeEscape0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpUnicodeEscape0078";
        console.log(TAG + ' start');

          let re78 = /\u0041/;
          let result78 = re78.test("A");
          console.log("\\u0041 matching 'A' result: " + result78);
          expect(result78).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7900
     * @tc.name      testRegExpUnicodeEscapeLowercase0079
     * @tc.desc      Test UTF-16 (\\uhhhh) matching \\u0061 (a)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUnicodeEscapeLowercase0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpUnicodeEscapeLowercase0079";
        console.log(TAG + ' start');

          let re79 = /\u0061/;
          let result79 = re79.test("a");
          console.log("\\u0061 matching 'a' result: " + result79);
          expect(result79).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8000
     * @tc.name      testRegExpUnicodeCodePoint0080
     * @tc.desc      Test UTF-32 (\\u{hhhh}) with u flag matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUnicodeCodePoint0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpUnicodeCodePoint0080";
        console.log(TAG + ' start');

          let re80 = /\u{4E2D}/u;
          let result80 = re80.test("中");
          console.log("u flag \\u{4E2D} matching '中' result: " + result80);
          expect(result80).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8200
     * @tc.name      testRegExpAlternationLeft0082
     * @tc.desc      Test vertical bar (|) matching left character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationLeft0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpAlternationLeft0082";
        console.log(TAG + ' start');

          let re82 = /a|b/;
          let result82 = re82.test("a");
          console.log("| matching left character 'a' result: " + result82);
          expect(result82).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8300
     * @tc.name      testRegExpAlternationRight0083
     * @tc.desc      Test vertical bar (|) matching right character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationRight0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpAlternationRight0083";
        console.log(TAG + ' start');

          let re83 = /a|b/;
          let result83 = re83.test("b");
          console.log("| matching right character 'b' result: " + result83);
          expect(result83).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8400
     * @tc.name      testRegExpAlternationMultiLeft0084
     * @tc.desc      Test vertical bar (|) matching multi-character left
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationMultiLeft0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpAlternationMultiLeft0084";
        console.log(TAG + ' start');

          let re84 = /ab|cd/;
          let result84 = re84.test("ab");
          console.log("| matching multi-character left 'ab' result: " + result84);
          expect(result84).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8500
     * @tc.name      testRegExpAlternationMultiRight0085
     * @tc.desc      Test vertical bar (|) matching multi-character right
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationMultiRight0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpAlternationMultiRight0085";
        console.log(TAG + ' start');

          let re85 = /ab|cd/;
          let result85 = re85.test("cd");
          console.log("| matching multi-character right 'cd' result: " + result85);
          expect(result85).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8600
     * @tc.name      testRegExpAlternationPrecedence0086
     * @tc.desc      Test vertical bar (|) preferring left match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpAlternationPrecedence0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpAlternationPrecedence0086";
        console.log(TAG + ' start');

          let re86 = /abc|ab/;
          let result86 = re86.exec("abc")?.[0] || null;
          console.log("| preferring left match 'abc' result: " + result86);
          expect(result86 === "abc").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8700
     * @tc.name      testRegExpExactQuantifier0087
     * @tc.desc      Test curly braces ({n}) matching preceding item n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpExactQuantifier0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpExactQuantifier0087";
        console.log(TAG + ' start');

          let re87 = /a{2}/;
          let result87 = re87.test("aa");
          console.log("{2} matching preceding item 2 times 'aa' result: " + result87);
          expect(result87).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8800
     * @tc.name      testRegExpExactQuantifierFailure0088
     * @tc.desc      Test curly braces ({n}) not matching preceding item n±1 times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpExactQuantifierFailure0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpExactQuantifierFailure0088";
        console.log(TAG + ' start');

          let re88 = /a{2}/;
          let result88 = re88.test("a");
          console.log("{2} not matching preceding item 1 time 'a' result: " + result88);
          expect(result88).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8900
     * @tc.name      testRegExpMinQuantifier0089
     * @tc.desc      Test curly braces ({n,}) matching preceding item at least n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpMinQuantifier0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpMinQuantifier0089";
        console.log(TAG + ' start');

          let re89 = /a{2,}/;
          let result89 = re89.test("aaa");
          console.log("{2,} matching preceding item at least 2 times 'aaa' result: " + result89);
          expect(result89).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9000
     * @tc.name      testRegExpMinQuantifierFailure0090
     * @tc.desc      Test curly braces ({n,}) not matching preceding item less than n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpMinQuantifierFailure0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpMinQuantifierFailure0090";
        console.log(TAG + ' start');

          let re90 = /a{2,}/;
          let result90 = re90.test("a");
          console.log("{2,} not matching preceding item less than 2 times 'a' result: " + result90);
          expect(result90).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9100
     * @tc.name      testRegExpRangeQuantifierMin0091
     * @tc.desc      Test curly braces ({n,m}) matching preceding item n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpRangeQuantifierMin0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpRangeQuantifierMin0091";
        console.log(TAG + ' start');

          let re91 = /a{2,4}/;
          let result91 = re91.test("aa");
          console.log("{2,4} matching preceding item 2 times 'aa' result: " + result91);
          expect(result91).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9200
     * @tc.name      testRegExpRangeQuantifierMiddle0092
     * @tc.desc      Test curly braces ({n,m}) matching preceding item middle times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpRangeQuantifierMiddle0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpRangeQuantifierMiddle0092";
        console.log(TAG + ' start');

          let re92 = /a{2,4}/;
          let result92 = re92.test("aaa");
          console.log("{2,4} matching preceding item 3 times 'aaa' result: " + result92);
          expect(result92).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9300
     * @tc.name      testRegExpRangeQuantifierMax0093
     * @tc.desc      Test curly braces ({n,m}) matching preceding item m times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpRangeQuantifierMax0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpRangeQuantifierMax0093";
        console.log(TAG + ' start');

          let re93 = /a{2,4}/;
          let result93 = re93.test("aaaa");
          console.log("{2,4} matching preceding item 4 times 'aaaa' result: " + result93);
          expect(result93).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9400
     * @tc.name      testRegExpRangeQuantifierExceed0094
     * @tc.desc      Test curly braces ({n,m}) not matching preceding item more than m times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpRangeQuantifierExceed0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpRangeQuantifierExceed0094";
        console.log(TAG + ' start');

          let re94 = /a{2,4}/;
          let result94 = re94.exec("aaaaa")?.[0] || null;
          console.log("{2,4} matching preceding item more than 4 times 'aaaaa' result: " + result94);
          expect(result94 === "aaaa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9500
     * @tc.name      testRegExpNonGreedyRangeQuantifier0095
     * @tc.desc      Test curly braces ({n,m}) non-greedy mode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyRangeQuantifier0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyRangeQuantifier0095";
        console.log(TAG + ' start');

          let re95 = /a{2,4}?/;
          let result95 = re95.exec("aaaa")?.[0] || null;
          console.log("{2,4}? non-greedy matching 'aaaa' result: " + result95);
          expect(result95 === "aa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9600
     * @tc.name      testRegExpLookbehind0096
     * @tc.desc      Test question mark (?) for lookbehind assertion ((?<=y) x)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpLookbehind0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpLookbehind0096";
        console.log(TAG + ' start');

          let re96 = /(?<=a)b/;
          let result96 = re96.test("ab");
          console.log("Lookbehind assertion matching 'b' (preceded by a) result: " + result96);
          expect(result96).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9700
     * @tc.name      testRegExpNegativeLookbehind0097
     * @tc.desc      Test question mark (?) for negative lookbehind assertion ((?<!y) x)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNegativeLookbehind0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNegativeLookbehind0097";
        console.log(TAG + ' start');

          let re97 = /(?<!a)b/;
          let result97 = re97.test("cb");
          console.log("Negative lookbehind assertion matching 'b' (not preceded by a) result: " + result97);
          expect(result97).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9800
     * @tc.name      testRegExpUnicodeProperty0098
     * @tc.desc      Test Unicode property escape (\\p{...}) matching letters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUnicodeProperty0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpUnicodeProperty0098";
        console.log(TAG + ' start');

          let re98 = /\p{Letter}/u;
          let result98 = re98.test("A");
          console.log("Unicode property matching letter 'A' result: " + result98);
          expect(result98).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9900
     * @tc.name      testRegExpUnicodePropertyNegative0099
     * @tc.desc      Test Unicode property escape (\\P{...}) matching non-letters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUnicodePropertyNegative0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpUnicodePropertyNegative0099";
        console.log(TAG + ' start');

          let re99 = /\P{Letter}/u;
          let result99 = re99.test("1");
          console.log("Unicode non-property matching non-letter '1' result: " + result99);
          expect(result99).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_10000
     * @tc.name      testRegExpIPAddress0100
     * @tc.desc      Test special character combination matching IP address
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpIPAddress0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpIPAddress0100";
        console.log(TAG + ' start');

          let re100 = /\b(?:\d{1,3}\.){3}\d{1,3}\b/;
          let result100 = re100.test("192.168.1.1");
          console.log("Special character combination matching IP address result: " + result100);
          expect(result100).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}