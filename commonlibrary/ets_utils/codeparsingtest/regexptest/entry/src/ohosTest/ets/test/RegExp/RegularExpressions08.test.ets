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

export default function RegularExpressions08Test() {
  describe('RegularExpressions08Test', () => {
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
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0100
     * @tc.name      testRegExpStarZeroMatch0001
     * @tc.desc      Test asterisk (*) matches preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarZeroMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarZeroMatch0001";
        console.log(TAG + ' start');

          let re1 = /a*b/;
          let result1 = re1.test("b");
          console.log("* matches preceding item 0 times 'b' result:" + result1);
          expect(result1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0200
     * @tc.name      testRegExpStarOneMatch0002
     * @tc.desc      Test asterisk (*) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarOneMatch0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarOneMatch0002";
        console.log(TAG + ' start');

          let re2 = /a*b/;
          let result2 = re2.test("ab");
          console.log(" * matches preceding item 1 time 'ab' result: " + result2);
          expect(result2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0300
     * @tc.name      testRegExpStarMultipleMatch0003
     * @tc.desc      Test asterisk (*) matches preceding item multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarMultipleMatch0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarMultipleMatch0003";
        console.log(TAG + ' start');

          let re3 = /a*b/;
          let result3 = re3.test("aaab");
          console.log("* matches preceding item multiple times 'aaab' result: " + result3);
          expect(result3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0400
     * @tc.name      testRegExpStarEmptyString0004
     * @tc.desc      Test asterisk (*) matches empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarEmptyString0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarEmptyString0004";
        console.log(TAG + ' start');

          let re4 = /a*/;
          let matchResult = re4.exec("");
          let result4 = matchResult ? matchResult[0] : null;
          console.log(" * matches empty string result: " + (result4 === "" ? "empty string" : result4));
          expect(result4 === "").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0500
     * @tc.name      testRegExpStarGreedyMatch0005
     * @tc.desc      Test asterisk (*) greedy matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarGreedyMatch0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarGreedyMatch0005";
        console.log(TAG + ' start');

          let re5 = /a*.*/;
          let result5 = re5.exec("aaabbb")?.[0] || null;
          console.log(" * greedy match 'aaabbb' result: " + result5);
          expect(result5 === "aaabbb").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0600
     * @tc.name      testRegExpStarWithCharSet0006
     * @tc.desc      Test asterisk (*) combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarWithCharSet0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarWithCharSet0006";
        console.log(TAG + ' start');

          let re6 = /[0-9]*/;
          let result6 = re6.exec("123abc")?.[0] || null;
          console.log(" * combined with character set match '123abc' result: " + result6);
          expect(result6 === "123").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0700
     * @tc.name      testRegExpStarWithGroup0007
     * @tc.desc      Test asterisk (*) combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarWithGroup0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarWithGroup0007";
        console.log(TAG + ' start');

          let re7 = /(ab)*/;
          let result7 = re7.exec("ababab")?.[0] || null;
          console.log("* combined with grouping match 'ababab' result: " + result7);
          expect(result7 === "ababab").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0800
     * @tc.name      testRegExpStarGlobalMatch0008
     * @tc.desc      Test asterisk (*) global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarGlobalMatch0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpStarGlobalMatch0008";
        console.log(TAG + ' start');

          let re8 = /a*/g;
          let result8 = "aaabbb".match(re8)?.join(",") || "";
          console.log("* global match 'aaabbb' result: " + result8);
          expect(result8 === "aaa,,,,").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_0900
     * @tc.name      testRegExpPlusOneMatch0009
     * @tc.desc      Test plus (+) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusOneMatch0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusOneMatch0009";
        console.log(TAG + ' start');

          let re9 = /a+b/;
          let result9 = re9.test("ab");
          console.log("+ matches preceding item 1 time 'ab' result: " + result9);
          expect(result9).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1000
     * @tc.name      testRegExpPlusMultipleMatch0010
     * @tc.desc      Test plus (+) matches preceding item multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusMultipleMatch0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusMultipleMatch0010";
        console.log(TAG + ' start');

          let re10 = /a+b/;
          let result10 = re10.test("aaab");
          console.log(" + matches preceding item multiple times 'aaab' result: " + result10);
          expect(result10).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1100
     * @tc.name      testRegExpPlusNoZeroMatch0011
     * @tc.desc      Test plus (+) does not match preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusNoZeroMatch0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusNoZeroMatch0011";
        console.log(TAG + ' start');

          let re11 = /a+b/;
          let result11 = re11.test("b");
          console.log(" + does not match preceding item 0 times 'b' result: " + result11);
          expect(result11).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1200
     * @tc.name      testRegExpPlusGreedyMatch0012
     * @tc.desc      Test plus (+) greedy matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusGreedyMatch0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusGreedyMatch0012";
        console.log(TAG + ' start');

          let re12 = /a+.*/;
          let result12 = re12.exec("aaabbb")?.[0] || null;
          console.log("+ greedy match 'aaabbb' result: " + result12);
          expect(result12 === "aaabbb").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1300
     * @tc.name      testRegExpPlusWithCharSet0013
     * @tc.desc      Test plus (+) combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusWithCharSet0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusWithCharSet0013";
        console.log(TAG + ' start');

          let re13 = /[0-9]+/;
          let result13 = re13.exec("abc123def")?.[0] || null;
          console.log(" + combined with character set match 'abc123def' result: " + result13);
          expect(result13 === "123").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1400
     * @tc.name      testRegExpPlusWithGroup0014
     * @tc.desc      Test plus (+) combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusWithGroup0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusWithGroup0014";
        console.log(TAG + ' start');

          let re14 = /(ab)+/;
          let result14 = re14.exec("abababxyz")?.[0] || null;
          console.log("+ combined with grouping match 'abababxyz' result: " + result14);
          expect(result14 === "ababab").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1500
     * @tc.name      testRegExpPlusGlobalMatch0015
     * @tc.desc      Test plus (+) global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusGlobalMatch0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpPlusGlobalMatch0015";
        console.log(TAG + ' start');

          let re15 = /a+/g;
          let result15 = "aaabbbbaaa".match(re15)?.join(",") || "";
          console.log("+ global match 'aaabbbbaaa' result: " + result15);
          expect(result15 === "aaa,aaa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_1600
     * @tc.name      testRegExpQuestionZeroMatch0016
     * @tc.desc      Test question mark (?) matches preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionZeroMatch0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuestionZeroMatch0016";
        console.log(TAG + ' start');

          let re16 = /a?b/;
          let result16 = re16.test("b");
          console.log("? matches preceding item 0 times 'b' result: " + result16);
          expect(result16).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_1700
     * @tc.name      testRegExpQuestionOneMatch0017
     * @tc.desc      Test question mark (?) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionOneMatch0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuestionOneMatch0017";
        console.log(TAG + ' start');

          let re17 = /a?b/;
          let result17 = re17.test("ab");
          console.log(" ? matches preceding item 1 time 'ab' result: " + result17);
          expect(result17).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_1800
     * @tc.name      testRegExpQuestionNoMultipleMatch0018
     * @tc.desc      Test question mark (?) does not match preceding item multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionNoMultipleMatch0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuestionNoMultipleMatch0018";
        console.log(TAG + ' start');

          let re18 = /a?b/;
          let result18 = re18.exec("aaab")?.[0] || null;
          console.log(" ? does not match preceding item multiple times 'aaab' result: " + result18);
          expect(result18 === "ab").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_1900
     * @tc.name      testRegExpQuestionWithCharSet0019
     * @tc.desc      Test question mark (?) combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionWithCharSet0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuestionWithCharSet0019";
        console.log(TAG + ' start');

          let re19 = /[0-9]?/;
          let result19 = re19.exec("123")?.[0] || null;
          console.log(" ? combined with character set match '123' result: " + result19);
          expect(result19 === "1").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_2000
     * @tc.name      testRegExpQuestionWithGroup0020
     * @tc.desc      Test question mark (?) combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionWithGroup0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuestionWithGroup0020";
        console.log(TAG + ' start');

          let re20 = /(ab)?/;
          let result20 = re20.exec("abxyz")?.[0] || null;
          console.log(" ? combined with grouping match 'abxyz' result: " + result20);
          expect(result20 === "ab").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_2100
     * @tc.name      testRegExpQuestionGlobalMatch0021
     * @tc.desc      Test question mark (?) global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionGlobalMatch0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuestionGlobalMatch0021";
        console.log(TAG + ' start');

          let re21 = /a?/g;
          let result21 = "aaab".match(re21)?.join(",") || "";
          console.log(" ? global match 'aaab' result: " + result21);
          expect(result21 === "a,a,a,,").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2200
     * @tc.name      testRegExpBracesExactMatch0022
     * @tc.desc      Test braces {n} matches preceding item exactly n times (n=2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesExactMatch0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesExactMatch0022";
        console.log(TAG + ' start');

          let re22 = /a{2}/;
          let result22 = re22.test("aa");
          console.log("{2} matches preceding item 2 times 'aa' result: " + result22);
          expect(result22).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2300
     * @tc.name      testRegExpBracesExactMatch0023
     * @tc.desc      Test braces {n} matches preceding item exactly n times (n=3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesExactMatch0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesExactMatch0023";
        console.log(TAG + ' start');

          let re23 = /a{3}/;
          let result23 = re23.test("aaa");
          console.log("{3} matches preceding item 3 times 'aaa' result: " + result23);
          expect(result23).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2400
     * @tc.name      testRegExpBracesNoLessMatch0024
     * @tc.desc      Test braces {n} does not match preceding item less than n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesNoLessMatch0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesNoLessMatch0024";
        console.log(TAG + ' start');

          let re24 = /a{2}/;
          let result24 = re24.test("a");
          console.log("{2} does not match preceding item 1 time 'a' result: " + result24);
          expect(result24).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2500
     * @tc.name      testRegExpBracesPartialMatch0025
     * @tc.desc      Test braces {n} does not match preceding item more than n times (partial match)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesPartialMatch0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesPartialMatch0025";
        console.log(TAG + ' start');

          let re25 = /a{2}/;
          let result25 = re25.exec("aaa")?.[0] || null;
          console.log("{2} matches preceding item 3 times 'aaa' result: " + result25);
          expect(result25 === "aa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2600
     * @tc.name      testRegExpBracesWithCharSet0026
     * @tc.desc      Test braces {n} combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesWithCharSet0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesWithCharSet0026";
        console.log(TAG + ' start');

          let re26 = /[0-9]{3}/;
          let result26 = re26.test("123");
          console.log("{3} combined with character set match '123' result: " + result26);
          expect(result26).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2700
     * @tc.name      testRegExpBracesWithGroup0027
     * @tc.desc      Test braces {n} combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesWithGroup0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesWithGroup0027";
        console.log(TAG + ' start');

          let re27 = /(ab){2}/;
          let result27 = re27.test("abab");
          console.log("{2} combined with grouping match 'abab' result: " + result27);
          expect(result27).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2800
     * @tc.name      testRegExpBracesGlobalMatch0028
     * @tc.desc      Test braces {n} global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesGlobalMatch0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesGlobalMatch0028";
        console.log(TAG + ' start');

          let re28 = /a{2}/g;
          let result28 = "aaaaaa".match(re28)?.join(",") || "";
          console.log("{2} global match 'aaaaaa' result: " + result28);
          expect(result28 === "aa,aa,aa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2900
     * @tc.name      testRegExpBracesMinMatch0029
     * @tc.desc      Test braces {n,} matches preceding item at least n times (n=2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesMinMatch0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesMinMatch0029";
        console.log(TAG + ' start');

          let re29 = /a{2,}/;
          let result29 = re29.test("aa");
          console.log("{2,} matches preceding item at least 2 times 'aa' result: " + result29);
          expect(result29).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3000
     * @tc.name      testRegExpBracesMoreThanMinMatch0030
     * @tc.desc      Test braces {n,} matches preceding item more than n times (n=2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesMoreThanMinMatch0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesMoreThanMinMatch0030";
        console.log(TAG + ' start');

          let re30 = /a{2,}/;
          let result30 = re30.test("aaaa");
          console.log("{2,} matches preceding item more than 2 times 'aaaa' result: " + result30);
          expect(result30).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3100
     * @tc.name      testRegExpBracesNoLessThanMinMatch0031
     * @tc.desc      Test braces {n,} does not match preceding item less than n times (n=2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesNoLessThanMinMatch0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesNoLessThanMinMatch0031";
        console.log(TAG + ' start');

          let re31 = /a{2,}/;
          let result31 = re31.test("a");
          console.log("{2,} does not match preceding item less than 2 times 'a' result: " + result31);
          expect(result31).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3200
     * @tc.name      testRegExpBracesGreedyMatch0032
     * @tc.desc      Test braces {n,} greedy matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesGreedyMatch0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesGreedyMatch0032";
        console.log(TAG + ' start');

          let re32 = /a{2,}/;
          let result32 = re32.exec("aaaab")?.[0] || null;
          console.log("{2,} greedy match 'aaaab' result: " + result32);
          expect(result32 === "aaaa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3300
     * @tc.name      testRegExpBracesWithCharSet0033
     * @tc.desc      Test braces {n,} combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesWithCharSet0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesWithCharSet0033";
        console.log(TAG + ' start');

          let re33 = /[0-9]{2,}/;
          let result33 = re33.exec("12345")?.[0] || null;
          console.log("{2,} combined with character set match '12345' result: " + result33);
          expect(result33 === "12345").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3400
     * @tc.name      testRegExpBracesWithGroup0034
     * @tc.desc      Test braces {n,} combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesWithGroup0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesWithGroup0034";
        console.log(TAG + ' start');

          let re34 = /(ab){2,}/;
          let result34 = re34.exec("abababxyz")?.[0] || null;
          console.log("{2,} combined with grouping match 'abababxyz' result: " + result34);
          expect(result34 === "ababab").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3500
     * @tc.name      testRegExpBracesGlobalMatch0035
     * @tc.desc      Test braces {n,} global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesGlobalMatch0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesGlobalMatch0035";
        console.log(TAG + ' start');

          let re35 = /a{2,}/g;
          let result35 = "aabbaaaabbb".match(re35)?.join(",") || "";
          console.log("{2,} global match 'aabbaaaabbb' result: " + result35);
          expect(result35 === "aa,aaaa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3600
     * @tc.name      testRegExpBracesRangeMinMatch0036
     * @tc.desc      Test braces {n,m} matches preceding item n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeMinMatch0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesRangeMinMatch0036";
        console.log(TAG + ' start');

          let re36 = /a{2,4}/;
          let result36 = re36.test("aa");
          console.log("{2,4} matches preceding item 2 times 'aa' result: " + result36);
          expect(result36).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3700
     * @tc.name      testRegExpBracesRangeMiddleMatch0037
     * @tc.desc      Test braces {n,m} matches preceding item middle times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeMiddleMatch0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesRangeMiddleMatch0037";
        console.log(TAG + ' start');

          let re37 = /a{2,4}/;
          let result37 = re37.test("aaa");
          console.log("{2,4} matches preceding item 3 times 'aaa' result: " + result37);
          expect(result37).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3800
     * @tc.name      testRegExpBracesRangeMaxMatch0038
     * @tc.desc      Test braces {n,m} matches preceding item m times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeMaxMatch0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesRangeMaxMatch0038";
        console.log(TAG + ' start');

          let re38 = /a{2,4}/;
          let result38 = re38.test("aaaa");
          console.log("{2,4} matches preceding item 4 times 'aaaa' result: " + result38);
          expect(result38).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3900
     * @tc.name      testRegExpBracesRangeNoLessMatch0039
     * @tc.desc      Test braces {n,m} does not match preceding item less than n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeNoLessMatch0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesRangeNoLessMatch0039";
        console.log(TAG + ' start');

          let re39 = /a{2,4}/;
          let result39 = re39.test("a");
          console.log(" {2,4} does not match preceding item 1 time 'a' result: " + result39);
          expect(result39).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_4000
     * @tc.name      testRegExpBracesRangePartialMatch0040
     * @tc.desc      Test braces {n,m} does not match preceding item more than m times (partial match)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangePartialMatch0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesRangePartialMatch0040";
        console.log(TAG + ' start');

          let re40 = /a{2,4}/;
          let result40 = re40.exec("aaaaa")?.[0] || null;
          console.log("{2,4} matches preceding item 5 times 'aaaaa' result: " + result40);
          expect(result40 === "aaaa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_4100
     * @tc.name      testRegExpBracesRangeWithCharSet0041
     * @tc.desc      Test braces {n,m} combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeWithCharSet0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesRangeWithCharSet0041";
        console.log(TAG + ' start');

          let re41 = /[0-9]{2,4}/;
          let result41 = re41.exec("12345")?.[0] || null;
          console.log(" {2,4} combined with character set match '12345' result: " + result41);
          expect(result41 === "1234").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_4300
     * @tc.name      testRegExpBracesRangeGlobalMatch0043
     * @tc.desc      Test braces {n,m} global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeGlobalMatch0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpBracesRangeGlobalMatch0043";
        console.log(TAG + ' start');

          let re43 = /a{2,4}/g;
          let result43 = "aabbaaaaaabbb".match(re43)?.join(",") || "";
          console.log(" {2,4} global match 'aabbaaaaaabbb' result: " + result43);
          expect(result43 === "aa,aaaa,aa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4400
     * @tc.name      testRegExpNonGreedyStarMatch0044
     * @tc.desc      Test non-greedy asterisk (*?) matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyStarMatch0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyStarMatch0044";
        console.log(TAG + ' start');

          let re44 = /a*?b/;
          let result44 = re44.exec("aaab")?.[0] || null;
          console.log("*? non-greedy match 'aaab' result: " + result44);
          expect(result44 === "aaab").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4500
     * @tc.name      testRegExpNonGreedyStarMinMatch0045
     * @tc.desc      Test non-greedy asterisk (*?) minimal matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyStarMinMatch0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyStarMinMatch0045";
        console.log(TAG + ' start');

          let re45 = /<.*?>/;
          let result45 = re45.exec("<div><span></span></div>")?.[0] || null;
          console.log(" *? non-greedy match HTML tag result: " + result45);
          expect(result45 === "<div>").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4600
     * @tc.name      testRegExpNonGreedyPlusMatch0046
     * @tc.desc      Test non-greedy plus (+?) matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyPlusMatch0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyPlusMatch0046";
        console.log(TAG + ' start');

          let re46 = /a+?b/;
          let result46 = re46.exec("aaab")?.[0] || null;
          console.log(" +? non-greedy match 'aaab' result: " + result46);
          expect(result46 === "aaab").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4700
     * @tc.name      testRegExpNonGreedyPlusMinMatch0047
     * @tc.desc      Test non-greedy plus (+?) minimal matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyPlusMinMatch0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyPlusMinMatch0047";
        console.log(TAG + ' start');

          let re47 = /"[^"]+?"/;
          let result47 = re47.exec('"first" "second"')?.[0] || null;
          console.log("+? non-greedy match quoted content result: " + result47);
          expect(result47 === "\"first\"").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4800
     * @tc.name      testRegExpNonGreedyQuestionMatch0048
     * @tc.desc      Test non-greedy question mark (??) matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyQuestionMatch0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyQuestionMatch0048";
        console.log(TAG + ' start');

          let re48 = /a??b/;
          let result48 = re48.exec("ab")?.[0] || null;
          console.log(" ?? non-greedy match 'ab' result: " + result48);
          expect(result48 === "ab").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4900
     * @tc.name      testRegExpNonGreedyBracesMatch0049
     * @tc.desc      Test non-greedy braces {n}? matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyBracesMatch0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyBracesMatch0049";
        console.log(TAG + ' start');

          let re49 = /a{2}?/;
          let result49 = re49.exec("aaaa")?.[0] || null;
          console.log(" {2}? non-greedy match 'aaaa' result: " + result49);
          expect(result49 === "aa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_5000
     * @tc.name      testRegExpNonGreedyBracesMinMatch0050
     * @tc.desc      Test non-greedy braces {n,}? matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyBracesMinMatch0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyBracesMinMatch0050";
        console.log(TAG + ' start');

          let re50 = /a{2,}?/;
          let result50 = re50.exec("aaaa")?.[0] || null;
          console.log("{2,}? non-greedy match 'aaaa' result: " + result50);
          expect(result50 === "aa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_5100
     * @tc.name      testRegExpNonGreedyBracesRangeMatch0051
     * @tc.desc      Test non-greedy braces {n,m}? matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyBracesRangeMatch0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNonGreedyBracesRangeMatch0051";
        console.log(TAG + ' start');

          let re51 = /a{2,4}?/;
          let result51 = re51.exec("aaaa")?.[0] || null;
          console.log(" {2,4}? non-greedy match 'aaaa' result: " + result51);
          expect(result51 === "aa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BOUNDARY_5200
     * @tc.name      testRegExpQuantifierWithBoundary0052
     * @tc.desc      Test quantifier combined with boundary anchors (^ and $)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithBoundary0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithBoundary0052";
        console.log(TAG + ' start');

          let re52 = /^\d+$/;
          let result52 = re52.test("12345");
          console.log(" + combined with ^$ match pure digits '12345' result: " + result52);
          expect(result52).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BOUNDARY_5300
     * @tc.name      testRegExpQuantifierWithWordBoundary0053
     * @tc.desc      Test quantifier combined with word boundary (\b)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithWordBoundary0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithWordBoundary0053";
        console.log(TAG + ' start');

          let re53 = /\b\w{3}\b/;
          let result53 = re53.test("abc");
          console.log(" {3} combined with \\b match 3-letter word 'abc' result: " + result53);
          expect(result53).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5400
     * @tc.name      testRegExpQuantifierWithDot0054
     * @tc.desc      Test quantifier combined with any character (.)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithDot0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithDot0054";
        console.log(TAG + ' start');

          let re54 = /.{3}/;
          let result54 = re54.exec("12345")?.[0] || null;
          console.log("{3} combined with . match any 3 characters '12345' result: " + result54);
          expect(result54 === "123").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5500
     * @tc.name      testRegExpQuantifierWithAlternation0055
     * @tc.desc      Test quantifier combined with alternation (|)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithAlternation0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithAlternation0055";
        console.log(TAG + ' start');

          let re55 = /a+|b+/;
          let result55 = re55.exec("aaabbb")?.[0] || null;
          console.log(" + combined with | match 'aaabbb' result: " + result55);
          expect(result55 === "aaa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5600
     * @tc.name      testRegExpQuantifierWithDigit0056
     * @tc.desc      Test quantifier combined with digit character (\d)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithDigit0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithDigit0056";
        console.log(TAG + ' start');

          let re56 = /\d{3}-\d{4}/;
          let result56 = re56.test("123-4567");
          console.log(" {3} combined with \\d match phone number '123-4567' result: " + result56);
          expect(result56).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5700
     * @tc.name      testRegExpQuantifierWithLookahead0057
     * @tc.desc      Test quantifier combined with positive lookahead
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithLookahead0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithLookahead0057";
        console.log(TAG + ' start');

          let re57 = /a+(?=b)/;
          let result57 = re57.exec("aaab")?.[0] || null;
          console.log(" + combined with positive lookahead match 'aaab' result: " + result57);
          expect(result57 === "aaa").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_5800
     * @tc.name      testRegExpQuantifierWithLookbehind0058
     * @tc.desc      Test quantifier combined with lookbehind assertion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithLookbehind0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithLookbehind0058";
        console.log(TAG + ' start');

          let re58 = /(?<=a)b+/;
          let result58 = re58.exec("aabbb")?.[0] || null;
          console.log("+ combined with lookbehind assertion match 'aabbb' result: " + result58);
          expect(result58 === "bbb").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5900
     * @tc.name      testRegExpQuantifierWithIgnoreCase0059
     * @tc.desc      Test quantifier combined with ignore case flag (i)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithIgnoreCase0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithIgnoreCase0059";
        console.log(TAG + ' start');

          let re59 = /a{2,}/i;
          let result59 = re59.test("AA");
          console.log(" {2,} combined with i flag match 'AA' result: " + result59);
          expect(result59).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6000
     * @tc.name      testRegExpQuantifierWithGlobalFlag0060
     * @tc.desc      Test quantifier combined with global flag (g)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithGlobalFlag0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithGlobalFlag0060";
        console.log(TAG + ' start');

          let re60 = /a{2}/g;
          let result60 = "AaaAaa".match(re60)?.length || 0;
          console.log("{2} combined with g flag match 'AaaAaa' count: " + result60);
          expect(result60 === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6100
     * @tc.name      testRegExpQuantifierWithMultilineFlag0061
     * @tc.desc      Test quantifier combined with multiline flag (m)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithMultilineFlag0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithMultilineFlag0061";
        console.log(TAG + ' start');

          let re61 = /^\d{2,}$/m;
          let result61 = re61.test("12\n345\n6");
          console.log(" {2,} combined with m flag match multiline result: " + result61);
          expect(result61).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6200
     * @tc.name      testRegExpQuantifierWithDotallFlag0062
     * @tc.desc      Test quantifier combined with dotall flag (s)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithDotallFlag0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithDotallFlag0062";
        console.log(TAG + ' start');

          let re62 = /.{2,}/s;
          let result62 = re62.test("a\nbc");
          console.log("{2,} combined with s flag match string with newline result: " + result62);
          expect(result62).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6300
     * @tc.name      testRegExpQuantifierWithUnicodeFlag0063
     * @tc.desc      Test quantifier combined with unicode flag (u)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithUnicodeFlag0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithUnicodeFlag0063";
        console.log(TAG + ' start');

          let re63 = /\p{Emoji}{2,}/u;
          let result63 = re63.test("😀😁😂");
          console.log("63. {2,} combined with u flag match multiple emojis result: " + result63);
          expect(result63).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6400
     * @tc.name      testRegExpQuantifierWithStickyFlag0064
     * @tc.desc      Test quantifier combined with sticky flag (y)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithStickyFlag0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierWithStickyFlag0064";
        console.log(TAG + ' start');

          let re64 = /a{2}/y;
          re64.lastIndex = 1;
          let result64 = re64.test("baaa");
          console.log("{2} combined with y flag match 'baaa' result: " + result64);
          expect(result64).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6500
     * @tc.name      testRegExpNestedQuantifier0065
     * @tc.desc      Test nested quantifier (quantifier inside group)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNestedQuantifier0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpNestedQuantifier0065";
        console.log(TAG + ' start');

          let re65 = /(a{2})+/;
          let result65 = re65.test("aaaa");
          console.log(" nested quantifier match 'aaaa' result: " + result65);
          expect(result65).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6600
     * @tc.name      testRegExpConsecutiveQuantifier0066
     * @tc.desc      Test consecutive quantifiers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpConsecutiveQuantifier0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpConsecutiveQuantifier0066";
        console.log(TAG + ' start');

          let re66 = /a+b*c?/;
          let result66 = re66.test("aaac");
          console.log(" consecutive quantifiers match 'aaac' result: " + result66);
          expect(result66).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6700
     * @tc.name      testRegExpQuantifierEmptyMatch0067
     * @tc.desc      Test quantifier matching empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierEmptyMatch0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierEmptyMatch0067";
        console.log(TAG + ' start');

          let re67 = /a*/;
          let matchResult = re67.exec("xyz");
          let result67 = matchResult ? matchResult[0] : null;
          console.log("* match empty string result: " + (result67 === "" ? "empty string" : result67));
          expect(result67 === "").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6800
     * @tc.name      testRegExpQuantifierZeroWidth0068
     * @tc.desc      Test quantifier matching zero-width characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierZeroWidth0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierZeroWidth0068";
        console.log(TAG + ' start');

          let re68 = /\b/;
          let result68 = re68.exec("test")?.index;
          console.log("+ match word boundary position: " + result68);
          expect(result68 === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6900
     * @tc.name      testRegExpQuantifierNewline0069
     * @tc.desc      Test quantifier matching newline characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierNewline0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierNewline0069";
        console.log(TAG + ' start');

          let re69 = /\n+/;
          let result69 = re69.test("line1\n\nline2");
          console.log(" + match multiple newline characters result: " + result69);
          expect(result69).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7000
     * @tc.name      testRegExpQuantifierUnicode0070
     * @tc.desc      Test quantifier matching Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierUnicode0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierUnicode0070";
        console.log(TAG + ' start');

          let re70 = /[\u4e00-\u9fa5]{2,}/;
          let result70 = re70.test("中文");
          console.log(" {2,} match multiple Chinese characters result: " + result70);
          expect(result70).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7100
     * @tc.name      testRegExpQuantifierSpecialChar0071
     * @tc.desc      Test quantifier matching special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierSpecialChar0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierSpecialChar0071";
        console.log(TAG + ' start');

          let re71 = /\*{2,}/;
          let result71 = re71.test("***");
          console.log(" {2,} match multiple * result: " + result71);
          expect(result71).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7200
     * @tc.name      testRegExpQuantifierURL0072
     * @tc.desc      Test quantifier matching URL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierURL0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierURL0072";
        console.log(TAG + ' start');

          let re72 = /https?:\/\/.+/;
          let result72 = re72.test("https://example.com/path");
          console.log("+ match URL result: " + result72);
          expect(result72).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7300
     * @tc.name      testRegExpQuantifierEmail0073
     * @tc.desc      Test quantifier matching email address
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierEmail0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierEmail0073";
        console.log(TAG + ' start');

          let re73 = /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/;
          let result73 = re73.test("test.user+tag@example.co.uk");
          console.log(" + and {2,} match complex email result: " + result73);
          expect(result73).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7400
     * @tc.name      testRegExpQuantifierDate0074
     * @tc.desc      Test quantifier matching date (yyyy-mm-dd)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierDate0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierDate0074";
        console.log(TAG + ' start');

          let re74 = /\d{4}-\d{2}-\d{2}/;
          let result74 = re74.test("2023-12-31");
          console.log("{4} and {2} match date result: " + result74);
          expect(result74).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7500
     * @tc.name      testRegExpQuantifierTime0075
     * @tc.desc      Test quantifier matching time (hh:mm:ss)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierTime0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierTime0075";
        console.log(TAG + ' start');

          let re75 = /\d{2}:\d{2}:\d{2}/;
          let result75 = re75.test("12:34:56");
          console.log("{2} match time result: " + result75);
          expect(result75).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_7600
     * @tc.name      testRegExpQuantifierIP0076
     * @tc.desc      Test quantifier matching IP address
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierIP0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierIP0076";
        console.log(TAG + ' start');

          let re76 = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/;
          let result76 = re76.test("192.168.1.1");
          console.log("{1,3} match IP address result: " + result76);
          expect(result76).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_7700
     * @tc.name      testRegExpQuantifierIDCard0077
     * @tc.desc      Test quantifier matching ID card number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierIDCard0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testRegExpQuantifierIDCard0077";
        console.log(TAG + ' start');

          let re77 = /\d{17}[\dXx]/;
          let result77 = re77.test("110101199001011234");
          console.log("{17} match ID card number result: " + result77);
          expect(result77).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}