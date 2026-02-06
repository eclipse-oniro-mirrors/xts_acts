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

export default function RegularExpressions09Test() {
  describe('RegularExpressions09Test', () => {
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
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7800
     * @tc.name      testRegExpQuantifierPhone0078
     * @tc.desc      Test quantifier matching phone number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierPhone0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierPhone0078";
        console.log(TAG + ' start');

          let re78 = /\d{3}-\d{8}|\d{4}-\d{7}/;
          let result78 = re78.test("010-12345678");
          console.log(" {3} and {8} match phone number result: " + result78);
          expect(result78).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7900
     * @tc.name      testRegExpQuantifierPostalCode0079
     * @tc.desc      Test quantifier matching postal code
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierPostalCode0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierPostalCode0079";
        console.log(TAG + ' start');

          let re79 = /\d{6}/;
          let result79 = re79.test("100000");
          console.log("{6} match postal code result: " + result79);
          expect(result79).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8000
     * @tc.name      testRegExpQuantifierCreditCard0080
     * @tc.desc      Test quantifier matching credit card number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierCreditCard0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierCreditCard0080";
        console.log(TAG + ' start');

          let re80 = /\d{4} \d{4} \d{4} \d{4}/;
          let result80 = re80.test("1234 5678 9012 3456");
          console.log(" {4} match credit card number result: " + result80);
          expect(result80).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8100
     * @tc.name      testRegExpQuantifierZeroCase0081
     * @tc.desc      Test quantifier edge case (n=0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierZeroCase0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierZeroCase0081";
        console.log(TAG + ' start');

          let re81 = /a{0}/;
          let result81 = re81.exec("abc")?.index;
          console.log(" {0} match position: " + result81);
          expect(result81 === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8200
     * @tc.name      testRegExpQuantifierInvalidRange0082
     * @tc.desc      Test quantifier edge case (n>m)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierInvalidRange0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierInvalidRange0082";
        console.log(TAG + ' start');

          try{
            let re82 = new RegExp("a{5,2}");
            console.log(" {5,2} invalid quantifier creation result: success");
            expect(false).assertTrue();
          } catch (e) {
            console.log("{5,2} invalid quantifier creation result: failure（" + e.message.slice(0, 20) + "）");
            expect(e.message.toString()).assertEqual("Invalid repetition count");
          }

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8500
     * @tc.name      testRegExpQuantifierEmptyCharSet0085
     * @tc.desc      Test quantifier with empty character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierEmptyCharSet0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierEmptyCharSet0085";
        console.log(TAG + ' start');

          let re85 = /[]*/;
          let result85 = re85.test("anything");
          console.log(" * with empty character set match result: " + result85);
          expect(result85).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_8600
     * @tc.name      testRegExpQuantifierEmptyGroup0086
     * @tc.desc      Test quantifier with empty group
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierEmptyGroup0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierEmptyGroup0086";
        console.log(TAG + ' start');

          let re86 = /()*/;
          let matchResult = re86.exec("test");
          let result86 = matchResult ? matchResult[0] : null;
          console.log("* with empty group match result: " + (result86 === "" ? "empty string" : result86));
          expect(result86 === "").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8700
     * @tc.name      testRegExpQuantifierGlobalState0087
     * @tc.desc      Test quantifier state in global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierGlobalState0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierGlobalState0087";
        console.log(TAG + ' start');

          let re87 = /a+/g;
          re87.exec("aaa");
          let result87 = re87.lastIndex;
          console.log("global + match after lastIndex: " + result87);
          expect(result87 === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8800
     * @tc.name      testRegExpQuantifierLongString0088
     * @tc.desc      Test quantifier matching extreme case (long string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierLongString0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierLongString0088";
        console.log(TAG + ' start');

          let longStr = "a".repeat(1000);
          let re88 = /a{1000}/;
          let result88 = re88.test(longStr);
          console.log(" {1000} match long string result: " + result88);
          expect(result88).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_8900
     * @tc.name      testRegExpQuantifierUnicodeCombining0089
     * @tc.desc      Test quantifier with Unicode combining characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierUnicodeCombining0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierUnicodeCombining0089";
        console.log(TAG + ' start');

          let re89 = /\p{L}+/u;
          let result89 = re89.test("café");
          console.log("+ match characters with accents result: " + result89);
          expect(result89).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9000
     * @tc.name      testRegExpQuantifierLookahead0090
     * @tc.desc      Test quantifier combined with lookahead assertion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierLookahead0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierLookahead0090";
        console.log(TAG + ' start');

          let re90 = /(?=\d{3})/;
          let result90 = re90.exec("12345")?.index;
          console.log("zero-width assertion with quantifier match position: " + result90);
          expect(result90 === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9100
     * @tc.name      testRegExpQuantifierAlternation0091
     * @tc.desc      Test quantifier matching preceding alternation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierAlternation0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierAlternation0091";
        console.log(TAG + ' start');

          let re91 = /(a|b)+/;
          let result91 = re91.exec("abab")?.[0] || null;
          console.log(" + match alternation result: " + result91);
          expect(result91 === "abab").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9200
     * @tc.name      testRegExpQuantifierBackreference0092
     * @tc.desc      Test quantifier combined with backreference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierBackreference0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierBackreference0092";
        console.log(TAG + ' start');

          let re92 = /(\w)\1+/;
          let result92 = re92.exec("aabbbcc")?.[0] || null;
          console.log(" + with backreference match result: " + result92);
          expect(result92 === "aa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9300
     * @tc.name      testRegExpQuantifierHTMLTag0093
     * @tc.desc      Test quantifier matching HTML tag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierHTMLTag0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierHTMLTag0093";
        console.log(TAG + ' start');

          let re93 = /<[^>]+>/;
          let result93 = re93.exec("<div class='test'>")?.[0] || null;
          console.log("+ match HTML tag result: " + result93);
          expect(result93 === "<div class='test'>").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9400
     * @tc.name      testRegExpQuantifierJSON0094
     * @tc.desc      Test quantifier matching JSON key-value pair
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierJSON0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierJSON0094";
        console.log(TAG + ' start');

          let re94 = /"[^"]+":\s*"[^"]+"/;
          let result94 = re94.exec('"name": "test"')?.[0] || null;
          console.log(" + match JSON key-value pair result: " + result94);
          expect(result94 === "\"name\": \"test\"").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9500
     * @tc.name      testRegExpQuantifierCSSSelector0095
     * @tc.desc      Test quantifier matching CSS selector
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierCSSSelector0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierCSSSelector0095";
        console.log(TAG + ' start');

          let re95 = /\.[a-zA-Z0-9_-]+/;
          let result95 = re95.exec(".class-name123")?.[0] || null;
          console.log(" + match CSS class selector result: " + result95);
          expect(result95 === ".class-name123").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9600
     * @tc.name      testRegExpQuantifierFilePath0096
     * @tc.desc      Test quantifier matching file path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierFilePath0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierFilePath0096";
        console.log(TAG + ' start');

          let re96 = /\/[\w-]+/g;
          let result96 = "/path/to/file".match(re96)?.join("") || "";
          console.log("+ match file path result: " + result96);
          expect(result96 === "/path/to/file").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_9700
     * @tc.name      testRegExpQuantifierVersion0097
     * @tc.desc      Test quantifier matching version number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierVersion0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierVersion0097";
        console.log(TAG + ' start');

          let re97 = /\d+\.\d+\.\d+/;
          let result97 = re97.test("1.2.3");
          console.log(" + and . match version number result: " + result97);
          expect(result97).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9800
     * @tc.name      testRegExpQuantifierUsername0098
     * @tc.desc      Test quantifier matching username
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierUsername0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierUsername0098";
        console.log(TAG + ' start');

          let re98 = /^[a-zA-Z0-9_]{3,16}$/;
          let result98 = re98.test("user_name123");
          console.log("{3,16} match username result: " + result98);
          expect(result98).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_9900
     * @tc.name      testRegExpQuantifierPassword0099
     * @tc.desc      Test quantifier matching password (at least 8 characters)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierPassword0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierPassword0099";
        console.log(TAG + ' start');

          let re99 = /^.{8,}$/;
          let result99 = re99.test("password123");
          console.log("{8,} match password result: " + result99);
          expect(result99).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_10000
     * @tc.name      testRegExpComplexQuantifier0100
     * @tc.desc      Test complex quantifier combination matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpComplexQuantifier0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpComplexQuantifier0100";
        console.log(TAG + ' start');

          let re100 = /^(\d{3,4}-)?\d{7,8}$/;
          let result100 = re100.test("010-12345678") && re100.test("12345678");
          console.log("complex quantifier combination match landline phone result: " + result100);
          expect(result100).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });



    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0100
     * @tc.name      testRegExpEscapeAsterisk0001
     * @tc.desc      Test backslash escaping special character (*)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeAsterisk0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeAsterisk0001";
        console.log(TAG + ' start');

          let re1 = /a\*b/;
          let result1 = re1.test("a*b");
          console.log("Escape * matching 'a*b' result:" + result1);
          expect(result1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0200
     * @tc.name      testRegExpEscapePlus0002
     * @tc.desc      Test backslash escaping special character (+)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapePlus0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapePlus0002";
        console.log(TAG + ' start');

          let re2 = /a\+b/;
          let result2 = re2.test("a+b");
          console.log("Escape + matching 'a+b' result: " + result2);
          expect(result2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0300
     * @tc.name      testRegExpEscapeQuestion0003
     * @tc.desc      Test backslash escaping special character (?)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeQuestion0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeQuestion0003";
        console.log(TAG + ' start');

          let re3 = /a\?b/;
          let result3 = re3.test("a?b");
          console.log("Escape ? matching 'a?b' result: " + result3);
          expect(result3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0400
     * @tc.name      testRegExpEscapeDot0004
     * @tc.desc      Test backslash escaping special character (.)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeDot0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeDot0004";
        console.log(TAG + ' start');

          let re4 = /a\.b/;
          let result4 = re4.test("a.b");
          console.log("Escape . matching 'a.b' result: " + result4);
          expect(result4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0500
     * @tc.name      testRegExpEscapeParenthesis0005
     * @tc.desc      Test backslash escaping special character (()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeParenthesis0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeParenthesis0005";
        console.log(TAG + ' start');

          let re5 = /a\(b/;
          let result5 = re5.test("a(b");
          console.log("Escape ( matching 'a(b' result: " + result5);
          expect(result5).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0600
     * @tc.name      testRegExpEscapeParenthesisClose0006
     * @tc.desc      Test backslash escaping special character ())
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeParenthesisClose0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeParenthesisClose0006";
        console.log(TAG + ' start');

          let re6 = /a\)b/;
          let result6 = re6.test("a)b");
          console.log("Escape ) matching 'a)b' result: " + result6);
          expect(result6).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0700
     * @tc.name      testRegExpEscapeBracketOpen0007
     * @tc.desc      Test backslash escaping special character ([)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeBracketOpen0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeBracketOpen0007";
        console.log(TAG + ' start');

          let re7 = /a\[b/;
          let result7 = re7.test("a[b");
          console.log("Escape [ matching 'a[b' result: " + result7);
          expect(result7).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0800
     * @tc.name      testRegExpEscapeBracketClose0008
     * @tc.desc      Test backslash escaping special character (])
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeBracketClose0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeBracketClose0008";
        console.log(TAG + ' start');

          let re8 = /a\]b/;
          let result8 = re8.test("a]b");
          console.log("Escape ] matching 'a]b' result: " + result8);
          expect(result8).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_0900
     * @tc.name      testRegExpEscapeBraceOpen0009
     * @tc.desc      Test backslash escaping special character ({)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeBraceOpen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeBraceOpen0009";
        console.log(TAG + ' start');

          let re9 = /a\{b/;
          let result9 = re9.test("a{b");
          console.log("Escape { matching 'a{b' result: " + result9);
          expect(result9).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1000
     * @tc.name      testRegExpEscapeBraceClose0010
     * @tc.desc      Test backslash escaping special character (})
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeBraceClose0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeBraceClose0010";
        console.log(TAG + ' start');

          let re10 = /a\}b/;
          let result10 = re10.test("a}b");
          console.log("Escape } matching 'a}b' result: " + result10);
          expect(result10).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1100
     * @tc.name      testRegExpEscapeCaret0011
     * @tc.desc      Test backslash escaping special character (^)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeCaret0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeCaret0011";
        console.log(TAG + ' start');

          let re11 = /a\^b/;
          let result11 = re11.test("a^b");
          console.log("Escape ^ matching 'a^b' result: " + result11);
          expect(result11).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1200
     * @tc.name      testRegExpEscapeDollar0012
     * @tc.desc      Test backslash escaping special character ($)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeDollar0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeDollar0012";
        console.log(TAG + ' start');

          let re12 = /a\$b/;
          let result12 = re12.test("a$b");
          console.log("Escape $ matching 'a$b' result: " + result12);
          expect(result12).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1300
     * @tc.name      testRegExpEscapePipe0013
     * @tc.desc      Test backslash escaping special character (|)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapePipe0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapePipe0013";
        console.log(TAG + ' start');

          let re13 = /a\|b/;
          let result13 = re13.test("a|b");
          console.log("Escape | matching 'a|b' result: " + result13);
          expect(result13).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1400
     * @tc.name      testRegExpEscapeWordBoundary0014
     * @tc.desc      Test backslash making ordinary character special (b → word boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeWordBoundary0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeWordBoundary0014";
        console.log(TAG + ' start');

          let re14 = /\btest/;
          let result14 = re14.test(" test");
          console.log("\\b matching word boundary 'test' result: " + result14);
          expect(result14).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ESCAPE_1500
     * @tc.name      testRegExpEscapeDigit0015
     * @tc.desc      Test backslash making ordinary character special (d → digit)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpEscapeDigit0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpEscapeDigit0015";
        console.log(TAG + ' start');

          let re15 = /\d/;
          let result15 = re15.test("5");
          console.log("\\d matching digit '5' result: " + result15);
          expect(result15).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_1600
     * @tc.name      testRegExpCaretStart0016
     * @tc.desc      Test caret (^) matching string start
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretStart0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpCaretStart0016";
        console.log(TAG + ' start');

          let re16 = /^test/;
          let result16 = re16.test("testabc");
          console.log("^ matching string start 'test' result: " + result16);
          expect(result16).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_1700
     * @tc.name      testRegExpCaretNotStart0017
     * @tc.desc      Test caret (^) not matching non-start position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretNotStart0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpCaretNotStart0017";
        console.log(TAG + ' start');

          let re17 = /^test/;
          let result17 = re17.test("atestabc");
          console.log("^ not matching non-start 'test' result: " + result17);
          expect(result17).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_1800
     * @tc.name      testRegExpCaretMultiline0018
     * @tc.desc      Test caret (^) with m flag matching after newline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretMultiline0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpCaretMultiline0018";
        console.log(TAG + ' start');

          let re18 = /^line/m;
          let result18 = re18.test("first\nline");
          console.log("m flag ^ matching after newline 'line' result: " + result18);
          expect(result18).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_1900
     * @tc.name      testRegExpCaretNegation0019
     * @tc.desc      Test caret (^) at character set start for negation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretNegation0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpCaretNegation0019";
        console.log(TAG + ' start');

          let re19 = /[^abc]/;
          let result19 = re19.test("d");
          console.log("Character set start ^ matching non-abc 'd' result: " + result19);
          expect(result19).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_2000
     * @tc.name      testRegExpCaretLiteral0020
     * @tc.desc      Test caret (^) at non-start of character set as literal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaretLiteral0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpCaretLiteral0020";
        console.log(TAG + ' start');

          let re20 = /[a^bc]/;
          let result20 = re20.test("^");
          console.log("Character set non-start ^ matching '^' result: " + result20);
          expect(result20).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_2100
     * @tc.name      testRegExpDollarEnd0021
     * @tc.desc      Test dollar ($) matching string end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDollarEnd0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpDollarEnd0021";
        console.log(TAG + ' start');

          let re21 = /test$/;
          let result21 = re21.test("abctest");
          console.log("$ matching string end 'test' result: " + result21);
          expect(result21).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_2200
     * @tc.name      testRegExpDollarNotEnd0022
     * @tc.desc      Test dollar ($) not matching non-end position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDollarNotEnd0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpDollarNotEnd0022";
        console.log(TAG + ' start');

          let re22 = /test$/;
          let result22 = re22.test("abctestxyz");
          console.log("$ not matching non-end 'test' result: " + result22);
          expect(result22).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_ANCHOR_2300
     * @tc.name      testRegExpDollarMultiline0023
     * @tc.desc      Test dollar ($) with m flag matching before newline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDollarMultiline0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpDollarMultiline0023";
        console.log(TAG + ' start');

          let re23 = /line$/m;
          let result23 = re23.test("line\nsecond");
          console.log("m flag $ matching before newline 'line' result: " + result23);
          expect(result23).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2400
     * @tc.name      testRegExpStarZeroMatch0024
     * @tc.desc      Test asterisk (*) matches preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarZeroMatch0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarZeroMatch0024";
        console.log(TAG + ' start');

          let re24 = /a*b/;
          let result24 = re24.test("b");
          console.log("* matching preceding item 0 times 'b' result: " + result24);
          expect(result24).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2500
     * @tc.name      testRegExpStarOneMatch0025
     * @tc.desc      Test asterisk (*) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarOneMatch0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarOneMatch0025";
        console.log(TAG + ' start');

          let re25 = /a*b/;
          let result25 = re25.test("ab");
          console.log("* matching preceding item 1 time 'ab' result: " + result25);
          expect(result25).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2600
     * @tc.name      testRegExpStarMultipleMatch0026
     * @tc.desc      Test asterisk (*) matches preceding item multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarMultipleMatch0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarMultipleMatch0026";
        console.log(TAG + ' start');

          let re26 = /a*b/;
          let result26 = re26.test("aaab");
          console.log("* matching preceding item multiple times 'aaab' result: " + result26);
          expect(result26).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2700
     * @tc.name      testRegExpStarEquivalent0027
     * @tc.desc      Test asterisk (*) equivalent to {0,}
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarEquivalent0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarEquivalent0027";
        console.log(TAG + ' start');

          let re27 = /a{0,}b/;
          let result27 = re27.test("aaab");
          console.log("{0,} equivalent to * matching 'aaab' result: " + result27);
          expect(result27).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_2800
     * @tc.name      testRegExpPlusOneMatch0028
     * @tc.desc      Test plus (+) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusOneMatch0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusOneMatch0028";
        console.log(TAG + ' start');

          let re28 = /a+b/;
          let result28 = re28.test("ab");
          console.log("+ matching preceding item 1 time 'ab' result: " + result28);
          expect(result28).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3000
     * @tc.name      testRegExpPlusNoZeroMatch0030
     * @tc.desc      Test plus (+) does not match preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusNoZeroMatch0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusNoZeroMatch0030";
        console.log(TAG + ' start');

          let re30 = /a+b/;
          let result30 = re30.test("b");
          console.log("+ not matching preceding item 0 times 'b' result: " + result30);
          expect(result30).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3100
     * @tc.name      testRegExpPlusEquivalent0031
     * @tc.desc      Test plus (+) equivalent to {1,}
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusEquivalent0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusEquivalent0031";
        console.log(TAG + ' start');

          let re31 = /a{1,}b/;
          let result31 = re31.test("aaab");
          console.log("{1,} equivalent to + matching 'aaab' result: " + result31);
          expect(result31).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3200
     * @tc.name      testRegExpQuestionZeroMatch0032
     * @tc.desc      Test question mark (?) matches preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionZeroMatch0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuestionZeroMatch0032";
        console.log(TAG + ' start');

          let re32 = /a?b/;
          let result32 = re32.test("b");
          console.log("? matching preceding item 0 times 'b' result: " + result32);
          expect(result32).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3300
     * @tc.name      testRegExpQuestionOneMatch0033
     * @tc.desc      Test question mark (?) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionOneMatch0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuestionOneMatch0033";
        console.log(TAG + ' start');

          let re33 = /a?b/;
          let result33 = re33.test("ab");
          console.log("? matching preceding item 1 time 'ab' result: " + result33);
          expect(result33).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3500
     * @tc.name      testRegExpQuestionEquivalent0035
     * @tc.desc      Test question mark (?) equivalent to {0,1}
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionEquivalent0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuestionEquivalent0035";
        console.log(TAG + ' start');

          let re35 = /a{0,1}b/;
          let result35 = re35.test("ab");
          console.log("{0,1} equivalent to ? matching 'ab' result: " + result35);
          expect(result35).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3600
     * @tc.name      testRegExpNonGreedyPlus0036
     * @tc.desc      Test question mark (?) making quantifier non-greedy
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyPlus0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyPlus0036";
        console.log(TAG + ' start');

          let re36 = /a+?b/;
          let result36 = re36.exec("aaab")?.[0] || null;
          console.log("? making + non-greedy matching 'aaab' result: " + result36);
          expect(result36).assertEqual("aaab");

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3700
     * @tc.name      testRegExpPositiveLookahead0037
     * @tc.desc      Test question mark (?) for positive lookahead (x (?=y))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPositiveLookahead0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPositiveLookahead0037";
        console.log(TAG + ' start');

          let re37 = /a(?=b)/;
          let result37 = re37.exec("ab")?.[0] || null;
          console.log("Positive lookahead matching 'a' (followed by b) result: " + result37);
          expect(result37 === "a").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3800
     * @tc.name      testRegExpNegativeLookahead0038
     * @tc.desc      Test question mark (?) for negative lookahead (x (?!y))
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNegativeLookahead0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNegativeLookahead0038";
        console.log(TAG + ' start');

          let re38 = /a(?!b)/;
          let result38 = re38.test("ac");
          console.log("Negative lookahead matching 'a' (not followed by b) result: " + result38);
          expect(result38).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_3900
     * @tc.name      testRegExpDotCharacter0039
     * @tc.desc      Test dot (.) matching any character except newline
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDotCharacter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpDotCharacter0039";
        console.log(TAG + ' start');

          let re39 = /a.b/;
          let result39 = re39.test("acb");
          console.log(". matching any character 'acb' result: " + result39);
          expect(result39).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4000
     * @tc.name      testRegExpDotNoNewline0040
     * @tc.desc      Test dot (.) not matching newline character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDotNoNewline0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpDotNoNewline0040";
        console.log(TAG + ' start');

          let re40 = /a.b/;
          let result40 = re40.test("a\nb");
          console.log(". not matching newline character 'a\\nb' result: " + result40);
          expect(result40).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4100
     * @tc.name      testRegExpDotWithSFlag0041
     * @tc.desc      Test dot (.) matching newline character with s flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDotWithSFlag0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpDotWithSFlag0041";
        console.log(TAG + ' start');

          let re41 = /a.b/s;
          let result41 = re41.test("a\nb");
          console.log("s flag . matching newline character 'a\\nb' result: " + result41);
          expect(result41).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4300
     * @tc.name      testRegExpDotWithDigit0043
     * @tc.desc      Test dot (.) matching digit character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpDotWithDigit0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpDotWithDigit0043";
        console.log(TAG + ' start');

          let re43 = /a.b/;
          let result43 = re43.test("a1b");
          console.log(". matching digit character 'a1b' result: " + result43);
          expect(result43).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4400
     * @tc.name      testRegExpCaptureGroup0044
     * @tc.desc      Test parentheses ((x)) for capture groups
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCaptureGroup0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpCaptureGroup0044";
        console.log(TAG + ' start');

          let re44 = /(a)(b)/;
          let result44 = re44.exec("ab");
          console.log("Capture group matching result: " + result44?.[0] + ", group1: " + result44?.[1] + ", group2: " + result44?.[2]);
          expect(result44?.[0] === "ab").assertTrue();
          expect(result44?.[1] === "a").assertTrue();
          expect(result44?.[2] === "b").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4500
     * @tc.name      testRegExpBackReference0045
     * @tc.desc      Test parentheses ((x)) back reference \1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBackReference0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBackReference0045";
        console.log(TAG + ' start');

          let re45 = /(a)\1/;
          let result45 = re45.test("aa");
          console.log("Back reference \\1 matching 'aa' result: " + result45);
          expect(result45).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4600
     * @tc.name      testRegExpBackReference0046
     * @tc.desc      Test parentheses ((x)) back reference \2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBackReference0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBackReference0046";
        console.log(TAG + ' start');

          let re46 = /(a)(b)\2\1/;
          let result46 = re46.test("abba");
          console.log("Back reference \\2\\1 matching 'abba' result: " + result46);
          expect(result46).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4700
     * @tc.name      testRegExpNonCaptureGroup0047
     * @tc.desc      Test non-capturing parentheses ((?:x)) not memorizing match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonCaptureGroup0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonCaptureGroup0047";
        console.log(TAG + ' start');

          let re47 = /(?:a)(b)/;
          let result47 = re47.exec("ab");
          console.log("Non-capture group matching result length: " + result47?.length);
          expect(result47?.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4800
     * @tc.name      testRegExpNonCaptureWithQuantifier0048
     * @tc.desc      Test non-capturing parentheses ((?:x)) combined with quantifier
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonCaptureWithQuantifier0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonCaptureWithQuantifier0048";
        console.log(TAG + ' start');

          let re48 = /(?:ab){2}/;
          let result48 = re48.test("abab");
          console.log("Non-capture group + quantifier matching 'abab' result: " + result48);
          expect(result48).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_4900
     * @tc.name      testRegExpCharacterClass0049
     * @tc.desc      Test square brackets ([xyz]) matching any one character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharacterClass0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpCharacterClass0049";
        console.log(TAG + ' start');

          let re49 = /[abc]/;
          let result49 = re49.test("b");
          console.log("[abc] matching 'b' result: " + result49);
          expect(result49).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5000
     * @tc.name      testRegExpCharacterClassExclusion0050
     * @tc.desc      Test square brackets ([xyz]) not matching excluded characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharacterClassExclusion0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpCharacterClassExclusion0050";
        console.log(TAG + ' start');

          let re50 = /[abc]/;
          let result50 = re50.test("d");
          console.log("[abc] not matching 'd' result: " + result50);
          expect(result50).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5100
     * @tc.name      testRegExpCharacterRange0051
     * @tc.desc      Test square brackets ([a-z]) matching character range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpCharacterRange0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpCharacterRange0051";
        console.log(TAG + ' start');

          let re51 = /[a-z]/;
          let result51 = re51.test("x");
          console.log("[a-z] matching 'x' result: " + result51);
          expect(result51).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5200
     * @tc.name      testRegExpUppercaseRange0052
     * @tc.desc      Test square brackets ([A-Z]) matching uppercase character range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpUppercaseRange0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpUppercaseRange0052";
        console.log(TAG + ' start');

          let re52 = /[A-Z]/;
          let result52 = re52.test("X");
          console.log("[A-Z] matching 'X' result: " + result52);
          expect(result52).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}