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

export default function RegularExpressions08Test() {
  describe('RegularExpressions08Test', () => {
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
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0100
     * @tc.name      testRegExpStarZeroMatch0001
     * @tc.desc      Test asterisk (*) matches preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarZeroMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re1: RegExp = new RegExp('a*b');
      const result1: boolean = re1.test("b");
      expect(result1).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0200
     * @tc.name      testRegExpStarOneMatch0002
     * @tc.desc      Test asterisk (*) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarOneMatch0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re2: RegExp = new RegExp('a*b');
      const result2: boolean = re2.test("ab");
      expect(result2).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0300
     * @tc.name      testRegExpStarMultipleMatch0003
     * @tc.desc      Test asterisk (*) matches preceding item multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarMultipleMatch0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re3: RegExp = new RegExp('a*b');
      const result3: boolean = re3.test("aaab");
      expect(result3).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0400
     * @tc.name      testRegExpStarEmptyString0004
     * @tc.desc      Test asterisk (*) matches empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarEmptyString0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re4: RegExp = new RegExp('a*');
      const matchResult = re4.exec("");
      const result4 = matchResult ? matchResult[0] : null;
      expect(result4 === "").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0600
     * @tc.name      testRegExpStarWithCharSet0006
     * @tc.desc      Test asterisk (*) combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarWithCharSet0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re6: RegExp = new RegExp('[0-9]*');
      const result6 = re6.exec("123abc")?.[0] ?? null;
      expect(result6 === "123").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0700
     * @tc.name      testRegExpStarWithGroup0007
     * @tc.desc      Test asterisk (*) combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarWithGroup0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re7: RegExp = new RegExp('(ab)*');
      const result7 = re7.exec("ababab")?.[0] ?? null;
      expect(result7 === "ababab").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_STAR_0800
     * @tc.name      testRegExpStarGlobalMatch0008
     * @tc.desc      Test asterisk (*) global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpStarGlobalMatch0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re8: RegExp = new RegExp('a*', 'g');
      const result8 = "aaabbb".match(re8)?.join(",") || "";
      expect(result8 === "aaa,,,,").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_0900
     * @tc.name      testRegExpPlusOneMatch0009
     * @tc.desc      Test plus (+) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusOneMatch0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re9: RegExp = new RegExp('a+b');
      const result9: boolean = re9.test("ab");
      expect(result9).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1000
     * @tc.name      testRegExpPlusMultipleMatch0010
     * @tc.desc      Test plus (+) matches preceding item multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusMultipleMatch0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re10: RegExp = new RegExp('a+b');
      const result10: boolean = re10.test("aaab");
      expect(result10).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1100
     * @tc.name      testRegExpPlusNoZeroMatch0011
     * @tc.desc      Test plus (+) does not match preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusNoZeroMatch0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re11: RegExp = new RegExp('a+b');
      const result11: boolean = re11.test("b");
      expect(result11).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1200
     * @tc.name      testRegExpPlusGreedyMatch0012
     * @tc.desc      Test plus (+) greedy matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusGreedyMatch0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re12: RegExp = new RegExp('a+.*');
      const result12 = re12.exec("aaabbb")?.[0] ?? null;
      expect(result12 === "aaabbb").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1300
     * @tc.name      testRegExpPlusWithCharSet0013
     * @tc.desc      Test plus (+) combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusWithCharSet0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re13: RegExp = new RegExp('[0-9]+');
      const result13 = re13.exec("abc123def")?.[0] ?? null;
      expect(result13 === "123").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1400
     * @tc.name      testRegExpPlusWithGroup0014
     * @tc.desc      Test plus (+) combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusWithGroup0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re14: RegExp = new RegExp('(ab)+');
      const result14 = re14.exec("abababxyz")?.[0] ?? null;
      expect(result14 === "ababab").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_PLUS_1500
     * @tc.name      testRegExpPlusGlobalMatch0015
     * @tc.desc      Test plus (+) global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpPlusGlobalMatch0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re15: RegExp = new RegExp('a+', 'g');
      const result15 = "aaabbbbaaa".match(re15)?.join(",") || "";
      expect(result15 === "aaa,aaa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_1600
     * @tc.name      testRegExpQuestionZeroMatch0016
     * @tc.desc      Test question mark (?) matches preceding item zero times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionZeroMatch0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re16: RegExp = new RegExp('a?b');
      const result16: boolean = re16.test("b");
      expect(result16).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_1700
     * @tc.name      testRegExpQuestionOneMatch0017
     * @tc.desc      Test question mark (?) matches preceding item one time
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionOneMatch0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re17: RegExp = new RegExp('a?b');
      const result17: boolean = re17.test("ab");
      expect(result17).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_1800
     * @tc.name      testRegExpQuestionNoMultipleMatch0018
     * @tc.desc      Test question mark (?) does not match preceding item multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionNoMultipleMatch0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re18: RegExp = new RegExp('a?b');
      const result18 = re18.exec("aaab")?.[0] ?? null;
      expect(result18 === "ab").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_1900
     * @tc.name      testRegExpQuestionWithCharSet0019
     * @tc.desc      Test question mark (?) combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionWithCharSet0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re19: RegExp = new RegExp('[0-9]?');
      const result19 = re19.exec("123")?.[0] ?? null;
      expect(result19 === "1").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_2000
     * @tc.name      testRegExpQuestionWithGroup0020
     * @tc.desc      Test question mark (?) combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionWithGroup0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re20: RegExp = new RegExp('(ab)?');
      const result20 = re20.exec("abxyz")?.[0] ?? null;
      expect(result20 === "ab").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUESTION_2100
     * @tc.name      testRegExpQuestionGlobalMatch0021
     * @tc.desc      Test question mark (?) global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuestionGlobalMatch0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re21: RegExp = new RegExp('a?', 'g');
      const result21 = "aaab".match(re21)?.join(",") || "";
      expect(result21 === "a,a,a,,").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2200
     * @tc.name      testRegExpBracesExactMatch0022
     * @tc.desc      Test braces {n} matches preceding item exactly n times (n=2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesExactMatch0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re22: RegExp = new RegExp('a{2}');
      const result22: boolean = re22.test("aa");
      expect(result22).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2300
     * @tc.name      testRegExpBracesExactMatch0023
     * @tc.desc      Test braces {n} matches preceding item exactly n times (n=3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesExactMatch0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re23: RegExp = new RegExp('a{3}');
      const result23: boolean = re23.test("aaa");
      expect(result23).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2400
     * @tc.name      testRegExpBracesNoLessMatch0024
     * @tc.desc      Test braces {n} does not match preceding item less than n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesNoLessMatch0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re24: RegExp = new RegExp('a{2}');
      const result24: boolean = re24.test("a");
      expect(result24).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2500
     * @tc.name      testRegExpBracesPartialMatch0025
     * @tc.desc      Test braces {n} does not match preceding item more than n times (partial match)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesPartialMatch0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re25: RegExp = new RegExp('a{2}');
      const result25 = re25.exec("aaa")?.[0] ?? null;
      expect(result25 === "aa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2600
     * @tc.name      testRegExpBracesWithCharSet0026
     * @tc.desc      Test braces {n} combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesWithCharSet0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re26: RegExp = new RegExp('[0-9]{3}');
      const result26: boolean = re26.test("123");
      expect(result26).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2700
     * @tc.name      testRegExpBracesWithGroup0027
     * @tc.desc      Test braces {n} combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesWithGroup0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re27: RegExp = new RegExp('(ab){2}');
      const result27: boolean = re27.test("abab");
      expect(result27).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2800
     * @tc.name      testRegExpBracesGlobalMatch0028
     * @tc.desc      Test braces {n} global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesGlobalMatch0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re28: RegExp = new RegExp('a{2}', 'g');
      const result28 = "aaaaaa".match(re28)?.join(",") || "";
      expect(result28 === "aa,aa,aa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_2900
     * @tc.name      testRegExpBracesMinMatch0029
     * @tc.desc      Test braces {n,} matches preceding item at least n times (n=2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesMinMatch0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re29: RegExp = new RegExp('a{2,}');
      const result29: boolean = re29.test("aa");
      expect(result29).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3000
     * @tc.name      testRegExpBracesMoreThanMinMatch0030
     * @tc.desc      Test braces {n,} matches preceding item more than n times (n=2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesMoreThanMinMatch0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re30: RegExp = new RegExp('a{2,}');
      const result30: boolean = re30.test("aaaa");
      expect(result30).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3100
     * @tc.name      testRegExpBracesNoLessThanMinMatch0031
     * @tc.desc      Test braces {n,} does not match preceding item less than n times (n=2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesNoLessThanMinMatch0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re31: RegExp = new RegExp('a{2,}');
      const result31: boolean = re31.test("a");
      expect(result31).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3200
     * @tc.name      testRegExpBracesGreedyMatch0032
     * @tc.desc      Test braces {n,} greedy matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesGreedyMatch0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re32: RegExp = new RegExp('a{2,}');
      const result32 = re32.exec("aaaab")?.[0] ?? null;
      expect(result32 === "aaaa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3300
     * @tc.name      testRegExpBracesWithCharSet0033
     * @tc.desc      Test braces {n,} combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesWithCharSet0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re33: RegExp = new RegExp('[0-9]{2,}');
      const result33 = re33.exec("12345")?.[0] ?? null;
      expect(result33 === "12345").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3400
     * @tc.name      testRegExpBracesWithGroup0034
     * @tc.desc      Test braces {n,} combined with grouping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesWithGroup0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re34: RegExp = new RegExp('(ab){2,}');
      const result34 = re34.exec("abababxyz")?.[0] ?? null;
      expect(result34 === "ababab").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3500
     * @tc.name      testRegExpBracesGlobalMatch0035
     * @tc.desc      Test braces {n,} global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesGlobalMatch0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re35: RegExp = new RegExp('a{2,}', 'g');
      const result35 = "aabbaaaabbb".match(re35)?.join(",") || "";
      expect(result35 === "aa,aaaa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3600
     * @tc.name      testRegExpBracesRangeMinMatch0036
     * @tc.desc      Test braces {n,m} matches preceding item n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeMinMatch0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re36: RegExp = new RegExp('a{2,4}');
      const result36: boolean = re36.test("aa");
      expect(result36).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3700
     * @tc.name      testRegExpBracesRangeMiddleMatch0037
     * @tc.desc      Test braces {n,m} matches preceding item middle times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeMiddleMatch0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re37: RegExp = new RegExp('a{2,4}');
      const result37: boolean = re37.test("aaa");
      expect(result37).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3800
     * @tc.name      testRegExpBracesRangeMaxMatch0038
     * @tc.desc      Test braces {n,m} matches preceding item m times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeMaxMatch0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re38: RegExp = new RegExp('a{2,4}');
      const result38: boolean = re38.test("aaaa");
      expect(result38).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_3900
     * @tc.name      testRegExpBracesRangeNoLessMatch0039
     * @tc.desc      Test braces {n,m} does not match preceding item less than n times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeNoLessMatch0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re39: RegExp = new RegExp('a{2,4}');
      const result39: boolean = re39.test("a");
      expect(result39).assertFalse();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_4000
     * @tc.name      testRegExpBracesRangePartialMatch0040
     * @tc.desc      Test braces {n,m} does not match preceding item more than m times (partial match)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangePartialMatch0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re40: RegExp = new RegExp('a{2,4}');
      const result40 = re40.exec("aaaaa")?.[0] ?? null;
      expect(result40 === "aaaa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_4100
     * @tc.name      testRegExpBracesRangeWithCharSet0041
     * @tc.desc      Test braces {n,m} combined with character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeWithCharSet0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re41: RegExp = new RegExp('[0-9]{2,4}');
      const result41 = re41.exec("12345")?.[0] ?? null;
      expect(result41 === "1234").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BRACES_4300
     * @tc.name      testRegExpBracesRangeGlobalMatch0043
     * @tc.desc      Test braces {n,m} global matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpBracesRangeGlobalMatch0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re43: RegExp = new RegExp('a{2,4}', 'g');
      const result43 = "aabbaaaaaabbb".match(re43)?.join(",") || "";
      expect(result43 === "aa,aaaa,aa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4400
     * @tc.name      testRegExpNonGreedyStarMatch0044
     * @tc.desc      Test non-greedy asterisk (*?) matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyStarMatch0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re44: RegExp = new RegExp('a*?b');
      const result44 = re44.exec("aaab")?.[0] ?? null;
      expect(result44 === "aaab").assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4500
     * @tc.name      testRegExpNonGreedyStarMinMatch0045
     * @tc.desc      Test non-greedy asterisk (*?) minimal matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyStarMinMatch0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re45: RegExp = new RegExp('<.*?>');
      const result45 = re45.exec("<div><span></span></div>")?.[0] ?? null;
      expect(result45 === "<div>").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4600
     * @tc.name      testRegExpNonGreedyPlusMatch0046
     * @tc.desc      Test non-greedy plus (+?) matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyPlusMatch0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re46: RegExp = new RegExp('a+?b');
      const result46 = re46.exec("aaab")?.[0] ?? null;
      expect(result46 === "aaab").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4700
     * @tc.name      testRegExpNonGreedyPlusMinMatch0047
     * @tc.desc      Test non-greedy plus (+?) minimal matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyPlusMinMatch0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re47: RegExp = new RegExp('"[^"]+?"');
      const result47 = re47.exec('"first" "second"')?.[0] ?? null;
      expect(result47 === "\"first\"").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4800
     * @tc.name      testRegExpNonGreedyQuestionMatch0048
     * @tc.desc      Test non-greedy question mark (??) matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyQuestionMatch0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re48: RegExp = new RegExp('a??b');
      const result48 = re48.exec("ab")?.[0] ?? null;
      expect(result48 === "ab").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_4900
     * @tc.name      testRegExpNonGreedyBracesMatch0049
     * @tc.desc      Test non-greedy braces {n}? matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyBracesMatch0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re49: RegExp = new RegExp('a{2}?');
      const result49 = re49.exec("aaaa")?.[0] ?? null;
      expect(result49 === "aa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_5000
     * @tc.name      testRegExpNonGreedyBracesMinMatch0050
     * @tc.desc      Test non-greedy braces {n,}? matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyBracesMinMatch0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re50: RegExp = new RegExp('a{2,}?');
      const result50 = re50.exec("aaaa")?.[0] ?? null;
      expect(result50 === "aa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_NONGREEDY_5100
     * @tc.name      testRegExpNonGreedyBracesRangeMatch0051
     * @tc.desc      Test non-greedy braces {n,m}? matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNonGreedyBracesRangeMatch0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re51: RegExp = new RegExp('a{2,4}?');
      const result51 = re51.exec("aaaa")?.[0] ?? null;
      expect(result51 === "aa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BOUNDARY_5200
     * @tc.name      testRegExpQuantifierWithBoundary0052
     * @tc.desc      Test quantifier combined with boundary anchors (^ and $)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithBoundary0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re52: RegExp = new RegExp('^\\d+$');
      const result52: boolean = re52.test("12345");
      expect(result52).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_BOUNDARY_5300
     * @tc.name      testRegExpQuantifierWithWordBoundary0053
     * @tc.desc      Test quantifier combined with word boundary (\b)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithWordBoundary0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re53: RegExp = new RegExp('\\b\\w{3}\\b');
      const result53: boolean = re53.test("abc");
      expect(result53).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5400
     * @tc.name      testRegExpQuantifierWithDot0054
     * @tc.desc      Test quantifier combined with any character (.)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithDot0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re54: RegExp = new RegExp('.{3}');
      const result54 = re54.exec("12345")?.[0] ?? null;
      expect(result54 === "123").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5500
     * @tc.name      testRegExpQuantifierWithAlternation0055
     * @tc.desc      Test quantifier combined with alternation (|)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithAlternation0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re55: RegExp = new RegExp('a+|b+');
      const result55 = re55.exec("aaabbb")?.[0] ?? null;
      expect(result55 === "aaa").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5600
     * @tc.name      testRegExpQuantifierWithDigit0056
     * @tc.desc      Test quantifier combined with digit character (\d)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithDigit0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re56: RegExp = new RegExp('\\d{3}-\\d{4}');
      const result56: boolean = re56.test("123-4567");
      expect(result56).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5700
     * @tc.name      testRegExpQuantifierWithLookahead0057
     * @tc.desc      Test quantifier combined with positive lookahead
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithLookahead0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re57: RegExp = new RegExp('a+(?=b)');
      const result57 = re57.exec("aaab")?.[0] ??null;
      expect(result57 === "aaa").assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_5800
     * @tc.name      testRegExpQuantifierWithLookbehind0058
     * @tc.desc      Test quantifier combined with lookbehind assertion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithLookbehind0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re58: RegExp = new RegExp('(?<=a)b+');
      const result58 = re58.exec("aabbb")?.[0] ??null;
      expect(result58 === "bbb").assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_5900
     * @tc.name      testRegExpQuantifierWithIgnoreCase0059
     * @tc.desc      Test quantifier combined with ignore case flag (i)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithIgnoreCase0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re59: RegExp = new RegExp('a{2,}', 'i');
      const result59: boolean = re59.test("AA");
      expect(result59).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6000
     * @tc.name      testRegExpQuantifierWithGlobalFlag0060
     * @tc.desc      Test quantifier combined with global flag (g)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithGlobalFlag0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re60: RegExp = new RegExp('a{2}', 'g');
      const result60 = "AaaAaa".match(re60)?.length || 0;
      expect(result60 === 2).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6100
     * @tc.name      testRegExpQuantifierWithMultilineFlag0061
     * @tc.desc      Test quantifier combined with multiline flag (m)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithMultilineFlag0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re61: RegExp = new RegExp('^\\d{2,}$', 'm');
      const result61: boolean = re61.test("12\n345\n6");
      expect(result61).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6200
     * @tc.name      testRegExpQuantifierWithDotallFlag0062
     * @tc.desc      Test quantifier combined with dotall flag (s)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithDotallFlag0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re62: RegExp = new RegExp('.{2,}', 's');
      const result62: boolean = re62.test("a\nbc");
      expect(result62).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6300
     * @tc.name      testRegExpQuantifierWithUnicodeFlag0063
     * @tc.desc      Test quantifier combined with unicode flag (u)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithUnicodeFlag0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re63: RegExp = new RegExp('\\p{Emoji}{2,}', 'u');
      const result63: boolean = re63.test("😀😁😂");
      expect(result63).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6400
     * @tc.name      testRegExpQuantifierWithStickyFlag0064
     * @tc.desc      Test quantifier combined with sticky flag (y)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierWithStickyFlag0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re64: RegExp = new RegExp('a{2}', 'y');
      re64.lastIndex = 1;
      const result64: boolean = re64.test("baaa");
      expect(result64).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_6500
     * @tc.name      testRegExpNestedQuantifier0065
     * @tc.desc      Test nested quantifier (quantifier inside group)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpNestedQuantifier0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re65: RegExp = new RegExp('(a{2})+');
      const result65: boolean = re65.test("aaaa");
      expect(result65).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6600
     * @tc.name      testRegExpConsecutiveQuantifier0066
     * @tc.desc      Test consecutive quantifiers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpConsecutiveQuantifier0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re66: RegExp = new RegExp('a+b*c?');
      const result66: boolean = re66.test("aaac");
      expect(result66).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6700
     * @tc.name      testRegExpQuantifierEmptyMatch0067
     * @tc.desc      Test quantifier matching empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierEmptyMatch0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re67: RegExp = new RegExp('a*');
      const matchResult = re67.exec("xyz");
      const result67 = matchResult ? matchResult[0] : null;
      expect(result67 === "").assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6800
     * @tc.name      testRegExpQuantifierZeroWidth0068
     * @tc.desc      Test quantifier matching zero-width characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierZeroWidth0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re68: RegExp = new RegExp('\\b');
      const result68 = re68.exec("test")?.index;
      expect(result68 === 0).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_6900
     * @tc.name      testRegExpQuantifierNewline0069
     * @tc.desc      Test quantifier matching newline characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierNewline0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re69: RegExp = new RegExp('\\n+');
      const result69: boolean = re69.test("line1\n\nline2");
      expect(result69).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7000
     * @tc.name      testRegExpQuantifierUnicode0070
     * @tc.desc      Test quantifier matching Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierUnicode0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re70: RegExp = new RegExp('[\\u4e00-\\u9fa5]{2,}');
      const result70: boolean = re70.test("中文");
      expect(result70).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7100
     * @tc.name      testRegExpQuantifierSpecialChar0071
     * @tc.desc      Test quantifier matching special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierSpecialChar0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re71: RegExp = new RegExp('\\*{2,}');
      const result71: boolean = re71.test("***");
      expect(result71).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7200
     * @tc.name      testRegExpQuantifierURL0072
     * @tc.desc      Test quantifier matching URL
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierURL0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re72: RegExp = new RegExp('https?:\\/\\/.+');
      const result72: boolean = re72.test("https://example.com/path");
      expect(result72).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7300
     * @tc.name      testRegExpQuantifierEmail0073
     * @tc.desc      Test quantifier matching email address
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierEmail0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re73: RegExp = new RegExp('[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}');
      const result73: boolean = re73.test("test.user+tag@example.co.uk");
      expect(result73).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_REGEXP_QUANTIFIER_7400
     * @tc.name      testRegExpQuantifierDate0074
     * @tc.desc      Test quantifier matching date (yyyy-mm-dd)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierDate0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re74: RegExp = new RegExp('\\d{4}-\\d{2}-\\d{2}');
      const result74: boolean = re74.test("2023-12-31");
      expect(result74).assertTrue();
    });

    /**
     * @tc.number    BASEDATA_REGEXP_QUANTIFIER_7500
     * @tc.name      testRegExpQuantifierTime0075
     * @tc.desc      Test quantifier matching time (hh:mm:ss)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierTime0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re75: RegExp = new RegExp('\\d{2}:\\d{2}:\\d{2}');
      const result75: boolean = re75.test("12:34:56");
      expect(result75).assertTrue();
    });

    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_7600
     * @tc.name      testRegExpQuantifierIP0076
     * @tc.desc      Test quantifier matching IP address
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierIP0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re76: RegExp = new RegExp('\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}');
      const result76: boolean = re76.test("192.168.1.1");
      expect(result76).assertTrue();
    });

    /**
     * @tc.number    SUB_DATA_REGEXP_QUANTIFIER_7700
     * @tc.name      testRegExpQuantifierIDCard0077
     * @tc.desc      Test quantifier matching ID card number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testRegExpQuantifierIDCard0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re77: RegExp = new RegExp('\\d{17}[\\dXx]');
      const result77: boolean = re77.test("110101199001011234");
      expect(result77).assertTrue();
    });
  })
}