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


export default function RegularExpressions01Test() {
  describe('RegularExpressions01Test', () => {
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
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0100
     * @tc.name      testGroupingModuleCase0001
     * @tc.desc      Verify basic capturing group behavior in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re1: RegExp = new RegExp('(abc)');
      const result1: RegExpExecArray | null = re1.exec("xyzabc123");
      const wholeMatch: String = result1?.[0] ?? "";
      const group1: String = result1?.[1] ?? "";
      const isWholeMatchCorrect: boolean = wholeMatch === "abc";
      const isGroup1Correct: boolean = group1 === "abc";
      const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0200
     * @tc.name      testGroupingModuleCase0002
     * @tc.desc      Verify regular expression with multiple capturing groups can match correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      () => {
        const TAG = "testGroupingModuleCase0002";
        const re2: RegExp = new RegExp('(\\d+)-(\\w+)');
        const result2: RegExpExecArray | null = re2.exec("123-test");
        const wholeMatch: String = result2?.[0] ?? "";
        const group1: String = result2?.[1] ?? "";
        const group2: String = result2?.[2] ?? "";
        const isWholeMatchCorrect: boolean = wholeMatch === "123-test";
        const isGroup1Correct: boolean = group1 === "123";
        const isGroup2Correct: boolean = group2 === "test";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct && isGroup2Correct;
        expect(testPassed).assertTrue();
      });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0300
     * @tc.name      testGroupingModuleCase0003
     * @tc.desc      Verify regular expression with nested capturing groups can match correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re3: RegExp = new RegExp('(a(b)c)');
      const result3: RegExpExecArray | null = re3.exec("abc");
      const wholeMatch: String = result3?.[0] ?? "";
      const group1: String = result3?.[1] ?? "";
      const group2: String = result3?.[2] ?? "";
      const isWholeMatchCorrect: boolean = wholeMatch === "abc";
      const isGroup1Correct: boolean = group1 === "abc";
      const isGroup2Correct: boolean = group2 === "b";
      const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct && isGroup2Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0400
     * @tc.name      testGroupingModuleCase0004
     * @tc.desc      Verify regular expression with nested capturing groups can match correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re4: RegExp = new RegExp('(?:abc)');
      const result4: RegExpExecArray | null = re4.exec("abc123");
      const resultLength: number = result4?.length ?? 0;
      const testPassed: boolean = resultLength === 1;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0500
     * @tc.name      testGroupingModuleCase0005
     * @tc.desc      Verify matching results of mixed non-capturing and capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re5: RegExp = new RegExp('(?:a)(b)(?:c)');
      const result5: RegExpExecArray | null = re5.exec("abc");
      const wholeMatch: String = result5?.[0] ?? "";
      const group1: String = result5?.[1] ?? "";
      const isWholeMatchCorrect: boolean = wholeMatch === "abc";
      const isGroup1Correct: boolean = group1 === "b";
      const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0600
     * @tc.name      testGroupingModuleCase0006
     * @tc.desc      Verify matching results of groups combined with quantifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re6: RegExp = new RegExp('(ab){2}');
      const result6: RegExpExecArray | null = re6.exec("abab");
      const wholeMatch: String = result6?.[0] ?? "";
      const group1: String = result6?.[1] ?? "";
      const isWholeMatchCorrect: boolean = wholeMatch === "abab";
      const isGroup1Correct: boolean = group1 === "ab";
      const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0700
     * @tc.name      testGroupingModuleCase0007
     * @tc.desc      Verify matching results of groups combined with selection operators.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re7: RegExp = new RegExp('(a|b)c');
      const result7: RegExpExecArray | null = re7.exec("ac");
      const wholeMatch: String = result7?.[0] ?? "";
      const group1: String = result7?.[1] ?? "";
      const isWholeMatchCorrect: boolean = wholeMatch === "ac";
      const isGroup1Correct: boolean = group1 === "a";
      const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0800
     * @tc.name      testGroupingModuleCase0008
     * @tc.desc      Verify basic usage of backreference \1 in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re8: RegExp = new RegExp('(\\w)\\1');
      const result8: boolean = re8.test("aa");
      const testPassed: boolean = result8 === true;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0900
     * @tc.name      testGroupingModuleCase0009
     * @tc.desc      Verify usage of multiple backreferences \1 and \2 in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re9: RegExp = new RegExp('(\\w)(\\d)\\1\\2');
      const result9: boolean = re9.test("a1a1");
      const testPassed: boolean = result9 === true;
      expect(testPassed).assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1000
     * @tc.name      testGroupingModuleCase0010
     * @tc.desc      Verify backreference to nested groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re10: RegExp = new RegExp('((a)b)\\2');
      const result10: boolean = re10.test("aba");
      const testPassed: boolean = result10 === true;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1100
     * @tc.name      testGroupingModuleCase0011
     * @tc.desc      Verify that backreferencing non-capturing groups is invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let errorOccurred = false;
      try {
        const re11: RegExp = new RegExp('(?:a)b\\1');
        re11.test("aba");
      } catch (e) {
        errorOccurred = true;
      }
      expect(errorOccurred).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1200
     * @tc.name      testGroupingModuleCase0012
     * @tc.desc      Verify basic usage of named capturing groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re12: RegExp = new RegExp('(?<name>abc)');
      const result12: RegExpExecArray | null = re12.exec("abc123");
      const wholeMatch: String = result12?.[0] ?? "";
      const groupNameValue: String = result12?.groups?.['name'] ?? "";
      const isWholeMatchCorrect: boolean = wholeMatch === "abc";
      const isGroupNameCorrect: boolean = groupNameValue === "abc";
      const testPassed: boolean = isWholeMatchCorrect && isGroupNameCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1300
     * @tc.name      testGroupingModuleCase0013
     * @tc.desc      Verify multiple named capturing groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re13: RegExp = new RegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})');
      const result13: RegExpExecArray | null = re13.exec("2023-12-31");
      const year: String = result13?.groups?.['year'] ?? "";
      const month: String = result13?.groups?.['month'] ?? "";
      const day: String = result13?.groups?.['day'] ?? "";
      const isYearCorrect: boolean = year === "2023";
      const isMonthCorrect: boolean = month === "12";
      const isDayCorrect: boolean = day === "31";
      const testPassed: boolean = isYearCorrect && isMonthCorrect && isDayCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1400
     * @tc.name      testGroupingModuleCase0014
     * @tc.desc      Verify coexistence of named groups and numeric references in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re14: RegExp = new RegExp('(?<group1>a)(b)');
      const result14: RegExpExecArray | null = re14.exec("ab");
      const group1: String = result14?.groups?.['group1'] ?? "";
      const group2: String = result14?.[2] ?? "";
      const isGroup1Correct: boolean = group1 === "a";
      const isGroup2Correct: boolean = group2 === "b";
      const testPassed: boolean = isGroup1Correct && isGroup2Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1500
     * @tc.name      testGroupingModuleCase0015
     * @tc.desc      Verify named backreference \k<char> in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re15: RegExp = new RegExp('(?<char>\\w)\\k<char>');
      const result15: boolean = re15.test("aa");
      const testPassed: boolean = result15 === true;
      expect(testPassed).assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1600
     * @tc.name      testGroupingModuleCase0016
     * @tc.desc      Verify mixed usage of named backreferences and numeric backreferences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re16: RegExp = new RegExp('(?<a>\\w)(?<b>\\d)\\1\\k<b>');
      const result16: boolean = re16.test("a1a1");
      const testPassed: boolean = result16 === true;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1700
     * @tc.name      testGroupingModuleCase0017
     * @tc.desc      Verify usage of capturing groups in string replacement with $1 reference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re17: RegExp = new RegExp('(\\w+)\\s(\\w+)');
      const result17: String = "John Doe".replace(re17, "$2, $1");
      const testPassed: boolean = result17 === "Doe, John";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1800
     * @tc.name      testGroupingModuleCase0018
     * @tc.desc      Verify usage of named capturing groups in string replacement with $<name> reference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re18: RegExp = new RegExp('(?<first>\\w+)\\s(?<last>\\w+)');
      const result18: String = "John Doe".replace(re18, "$<last>, $<first>");
      const testPassed: boolean = result18 === "Doe, John";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1900
     * @tc.name      testGroupingModuleCase0019
     * @tc.desc      Verify usage of capturing groups in replacement function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re19: RegExp = new RegExp('(\\w+)', 'g');
      const result19: String = "hello world".replace(re19,
        (match: string, group1: Object[]): string => {
          let g1 = group1[0] as String;
          return g1.toUpperCase();
        }
      );
      const testPassed: boolean = result19 === "HELLO WORLD";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2000
     * @tc.name      testGroupingModuleCase0020
     * @tc.desc      Verify matching results of empty capturing groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re20: RegExp = new RegExp('()');
      const result20: RegExpExecArray | null = re20.exec("test");
      const wholeMatch: String = result20?.[0] ?? "";
      const group1: String = result20?.[1] ?? "";
      const isGroup1Empty: boolean = group1 === "";
      const isWholeMatchEmpty: boolean = wholeMatch === "";
      const testPassed: boolean = isWholeMatchEmpty && isGroup1Empty;
      expect(testPassed).assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2100
     * @tc.name      testGroupingModuleCase0021
     * @tc.desc      Verify capturing groups matching optional content in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re21: RegExp = new RegExp('(\\d{3}-)?\\d{4}');
      const result21: RegExpExecArray | null = re21.exec("123-4567");
      const wholeMatch: String = result21?.[0] ?? "";
      const group1: String = result21?.[1] ?? "";
      const isWholeMatchCorrect: boolean = wholeMatch === "123-4567";
      const isGroup1Correct: boolean = group1 === "123-";
      const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2200
     * @tc.name      testGroupingModuleCase0022
     * @tc.desc      Verify capturing result when a group matches 0 times in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re22: RegExp = new RegExp('(\\d{3}-)?\\d{4}');
      const result22: RegExpExecArray | null = re22.exec("4567");
      const group1: String = result22?.[1] ?? "";
      const testPassed: boolean = group1 === "";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2300
     * @tc.name      testGroupingModuleCase0023
     * @tc.desc      Verify combination of capturing groups and global matching in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re23: RegExp = new RegExp('(\\w+)', 'g');
      const str23: string = "a b c";
      const result23: string[] = [];
      let match23: RegExpExecArray | null;
      while ((match23 = re23.exec(str23)) !== null) {
        result23.push(match23?.[1] ?? '');
      }
      const joinedResult: String = result23.join(",");
      const testPassed: boolean = joinedResult === "a,b,c";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2400
     * @tc.name      testGroupingModuleCase0024
     * @tc.desc      Verify combination of capturing groups and multiline mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re24: RegExp = new RegExp('^(\\w+)', 'gm');
      const str24: string = "first\nsecond\nthird";
      const result24: string[] = [];
      let match24: RegExpExecArray | null;
      while ((match24 = re24.exec(str24)) !== null) {
        result24.push(match24?.[1] ?? '');
      }
      const joinedResult: String = result24.join(",");
      const testPassed: boolean = joinedResult === "first,second,third";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2500
     * @tc.name      testGroupingModuleCase0025
     * @tc.desc      Verify combination of capturing groups and case-insensitive mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re25: RegExp = new RegExp('(ABC)', 'i');
      const result25: RegExpExecArray | null = re25.exec("abc");
      const group1: String = result25?.[1] ?? "";
      const testPassed: boolean = group1 === "abc";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2600
     * @tc.name      testGroupingModuleCase0026
     * @tc.desc      Verify positive lookahead assertion in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re26: RegExp = new RegExp('a(?=b)');
      const result26: RegExpExecArray | null = re26.exec("ab");
      const wholeMatch: String = result26?.[0] ?? "";
      const testPassed: boolean = wholeMatch === "a";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2700
     * @tc.name      testGroupingModuleCase0027
     * @tc.desc      Verify capturing groups inside positive lookahead assertions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re27: RegExp = new RegExp('a(?=(b))');
      const result27: RegExpExecArray | null = re27.exec("ab");
      const wholeMatch: String = result27?.[0] ?? "";
      const group1: String = result27?.[1] ?? "";
      const isWholeMatchCorrect: boolean = wholeMatch === "a";
      const isGroup1Correct: boolean = group1 === "b";
      const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2800
     * @tc.name      testGroupingModuleCase0028
     * @tc.desc      Verify negative lookahead assertion in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re28: RegExp = new RegExp('a(?!b)');
      const result28: boolean = re28.test("ac");
      const testPassed: boolean = result28 === true;
      expect(testPassed).assertTrue();
    });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2900
     * @tc.name      testGroupingModuleCase0029
     * @tc.desc      Verify positive lookbehind assertion in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re29: RegExp = new RegExp('(?<=a)b');
      const result29: boolean = re29.test("ab");
      const testPassed: boolean = result29 === true;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3000
     * @tc.name      testGroupingModuleCase0030
     * @tc.desc      Verify capturing groups inside positive lookbehind assertions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re30: RegExp = new RegExp('(?<=(a))b');
      const result30: RegExpExecArray | null = re30.exec("ab");
      const wholeMatch: String = result30?.[0] ?? "";
      const group1: String = result30?.[1] ?? "";
      const isWholeMatchCorrect: boolean = wholeMatch === "b";
      const isGroup1Correct: boolean = group1 === "a";
      const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3100
     * @tc.name      testGroupingModuleCase0031
     * @tc.desc      Verify negative lookbehind assertion in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re31: RegExp = new RegExp('(?<!a)b');
      const result31: boolean = re31.test("cb");
      const testPassed: boolean = result31 === true;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3200
     * @tc.name      testGroupingModuleCase0032
     * @tc.desc      Verify combination of capturing groups and dotAll mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re32: RegExp = new RegExp('(a.b)', 's');
      const result32: RegExpExecArray | null = re32.exec("a\nb");
      const group1: String = result32?.[1] ?? "";
      const testPassed: boolean = group1 === "a\nb";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3300
     * @tc.name      testGroupingModuleCase0033
     * @tc.desc      Verify combination of capturing groups and Unicode mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re33: RegExp = new RegExp('(\\p{Script=Greek})', 'u');
      const result33: RegExpExecArray | null = re33.exec("α");
      const group1: String = result33?.[1] ?? "";
      const testPassed: boolean = group1 === "α";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3400
     * @tc.name      testGroupingModuleCase0034
     * @tc.desc      Verify combination of capturing groups and sticky mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re34: RegExp = new RegExp('(a)', 'y');
      re34.lastIndex = 1;
      const result34: RegExpExecArray | null = re34.exec("ba");
      const group1: String = result34?.[1] ?? "";
      const testPassed: boolean = group1 === "a";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3500
     * @tc.name      testGroupingModuleCase0035
     * @tc.desc      Verify capturing result of repeated groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re35: RegExp = new RegExp('(a)+');
      const result35: RegExpExecArray | null = re35.exec("aaa");
      const group1: String = result35?.[1] ?? "";
      const testPassed: boolean = group1 === "a";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3600
     * @tc.name      testGroupingModuleCase0036
     * @tc.desc      Verify capturing results of multiple repeated groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re36: RegExp = new RegExp('(\\d)(\\d)+');
      const result36: RegExpExecArray | null = re36.exec("1234");
      const group1: String = result36?.[1] ?? "";
      const group2: String = result36?.[2] ?? "";
      const isGroup1Correct: boolean = group1 === "1";
      const isGroup2Correct: boolean = group2 === "4";
      const testPassed: boolean = isGroup1Correct && isGroup2Correct;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3700
     * @tc.name      testGroupingModuleCase0037
     * @tc.desc      Verify capturing result of groups with non-greedy quantifiers in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re37: RegExp = new RegExp('(a+?)');
      const result37: RegExpExecArray | null = re37.exec("aaa");
      const group1: String = result37?.[1] ?? "";
      const testPassed: boolean = group1 === "a";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3800
     * @tc.name      testGroupingModuleCase0038
     * @tc.desc      Verify groups matching special characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re38: RegExp = new RegExp('(\\*\\+\\?)');
      const result38: RegExpExecArray | null = re38.exec("*+?");
      const group1: String = result38?.[1] ?? "";
      const testPassed: boolean = group1 === "*+?";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3900
     * @tc.name      testGroupingModuleCase0039
     * @tc.desc      Verify capturing group matching whitespace characters and measuring its length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re39: RegExp = new RegExp('(\\s+)');
      const input: string = "   \t\n";
      const result39: RegExpExecArray | null = re39.exec(input);
      const whitespaceMatch: String = result39?.[1] ?? "";
      const length: number = whitespaceMatch.length;
      expect(length).assertEqual(5);

      const actualInput: string = "   \t";
      const execResult: RegExpExecArray | null = re39.exec(actualInput);
      const matchStr: String = execResult?.[1] ?? "";
      const actualLength: number = matchStr.length;
      const expectedLength: number = 4;
      const testPassed: boolean = actualLength === expectedLength;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4000
     * @tc.name      testGroupingModuleCase0040
     * @tc.desc      Verify groups matching word boundaries and position acquisition in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re40: RegExp = new RegExp('(\\b)');
      const result40: RegExpExecArray | null = re40.exec("test");
      const boundaryIndex: number = result40?.index ?? -1;
      const testPassed: boolean = boundaryIndex === 0;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4100
     * @tc.name      testGroupingModuleCase0041
     * @tc.desc      Verify groups matching digits in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re41: RegExp = new RegExp('(\\d+)');
      const result41: RegExpExecArray | null = re41.exec("abc123def");
      const numberStr: String = result41?.[1] ?? "";
      const testPassed: boolean = numberStr === "123";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4200
     * @tc.name      testGroupingModuleCase0042
     * @tc.desc      Verify groups matching non-digits in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re42: RegExp = new RegExp('(\\D+)');
      const result42: RegExpExecArray | null = re42.exec("123abc456");
      const nonDigitStr: String = result42?.[1] ?? "";
      const testPassed: boolean = nonDigitStr === "abc";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4300
     * @tc.name      testGroupingModuleCase0043
     * @tc.desc      Verify groups matching word characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re43: RegExp = new RegExp('(\\w+)');
      const result43: RegExpExecArray | null = re43.exec("___abc123___");
      const wordStr: String = result43?.[1] ?? "";
      const testPassed: boolean = wordStr === "___abc123___";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4400
     * @tc.name      testGroupingModuleCase0044
     * @tc.desc      Verify groups matching non-word characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re44: RegExp = new RegExp('(\\W+)');
      const result44: RegExpExecArray | null = re44.exec("test@example.com");
      const nonWordStr: String = result44?.[1] ?? "";
      const testPassed: boolean = nonWordStr === "@";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4500
     * @tc.name      testGroupingModuleCase0045
     * @tc.desc      Verify groups matching hexadecimal-encoded characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re45: RegExp = new RegExp('(\x41)');
      const result45: RegExpExecArray | null = re45.exec("A");
      const hexChar: String = result45?.[1] ?? "";
      const testPassed: boolean = hexChar === "A";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4600
     * @tc.name      testGroupingModuleCase0046
     * @tc.desc      Verify groups matching Unicode-encoded characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re46: RegExp = new RegExp('(\u00A9)');
      const result46: RegExpExecArray | null = re46.exec("©");
      const unicodeChar: String = result46?.[1] ?? "";
      const testPassed: boolean = unicodeChar === "©";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4700
     * @tc.name      testGroupingModuleCase0047
     * @tc.desc      Verify groups matching UTF-32 characters (Unicode supplementary planes) in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re47: RegExp = new RegExp('(\u{1F600})', 'u');
      const result47: RegExpExecArray | null = re47.exec("😀");
      const utf32Char: String = result47?.[1] ?? "";
      const testPassed: boolean = utf32Char === "😀";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4800
     * @tc.name      testGroupingModuleCase0048
     * @tc.desc      Verify groups matching Chinese characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re48: RegExp = new RegExp('([\\u4e00-\\u9fa5]+)');
      const result48: RegExpExecArray | null = re48.exec("你好，世界");
      const chineseStr: String = result48?.[1] ?? "";
      const testPassed: boolean = chineseStr === "你好";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4900
     * @tc.name      testGroupingModuleCase0049
     * @tc.desc      Verify groups matching email addresses and extracting username/domain in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re49: RegExp = new RegExp('([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+\\.[a-zA-Z]{2,})');
      const result49: RegExpExecArray | null = re49.exec("test@example.com");
      const username: String = result49?.[1] ?? "";
      const domain: String = result49?.[2] ?? "";
      const isUsernameCorrect: boolean = username === "test";
      const isDomainCorrect: boolean = domain === "example.com";
      const testPassed: boolean = isUsernameCorrect && isDomainCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5000
     * @tc.name      testGroupingModuleCase0050
     * @tc.desc      Verify groups matching URLs and extracting protocol, domain, and path in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re50: RegExp = new RegExp('(https?)://([^/]+)(/.*)?');
      const result50: RegExpExecArray | null = re50.exec("https://example.com/path");
      const protocol: String = result50?.[1] ?? "";
      const domain: String = result50?.[2] ?? "";
      const path: String = result50?.[3] ?? "";
      const isProtocolCorrect: boolean = protocol === "https";
      const isDomainCorrect: boolean = domain === "example.com";
      const isPathCorrect: boolean = path === "/path";
      const testPassed: boolean = isProtocolCorrect && isDomainCorrect && isPathCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5100
     * @tc.name      testGroupingModuleCase0051
     * @tc.desc      Verify groups matching IP addresses and extracting each segment in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re51: RegExp = new RegExp('(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})');
      const result51: RegExpExecArray | null = re51.exec("192.168.1.1");
      const segment1: String = result51?.[1] ?? "";
      const segment2: String = result51?.[2] ?? "";
      const segment3: String = result51?.[3] ?? "";
      const segment4: String = result51?.[4] ?? "";
      const fullIp: String = `${segment1}.${segment2}.${segment3}.${segment4}`;
      const testPassed: boolean = fullIp === "192.168.1.1";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5200
     * @tc.name      testGroupingModuleCase0052
     * @tc.desc      Verify groups matching dates and extracting year, month, day in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re52: RegExp = new RegExp('(\\d{4})-(\\d{2})-(\\d{2})');
      const result52: RegExpExecArray | null = re52.exec("2023-12-31");
      const year: String = result52?.[1] ?? "";
      const month: String = result52?.[2] ?? "";
      const day: String = result52?.[3] ?? "";
      const formattedDate: String = `${year} 年 ${month} 月 ${day} 日`;
      const testPassed: boolean = formattedDate === "2023 年 12 月 31 日";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5300
     * @tc.name      testGroupingModuleCase0053
     * @tc.desc      Verify groups matching time and extracting hours, minutes, seconds in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re53: RegExp = new RegExp('(\\d{2}):(\\d{2}):(\\d{2})');
      const result53: RegExpExecArray | null = re53.exec("12:34:56");
      const hours: String = result53?.[1] ?? "";
      const minutes: String = result53?.[2] ?? "";
      const seconds: String = result53?.[3] ?? "";
      const formattedTime: String = `${hours} 时 ${minutes} 分 ${seconds} 秒`;
      const testPassed: boolean = formattedTime === "12 时 34 分 56 秒";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5400
     * @tc.name      testGroupingModuleCase0054
     * @tc.desc      Verify groups matching phone numbers and extracting area code and number in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re54: RegExp = new RegExp('(\\d{3,4})-(\\d{7,8})');
      const result54: RegExpExecArray | null = re54.exec("010-12345678");
      const areaCode: String = result54?.[1] ?? "";
      const phoneNumber: String = result54?.[2] ?? "";
      const isAreaCodeCorrect: boolean = areaCode === "010";
      const isNumberCorrect: boolean = phoneNumber === "12345678";
      const testPassed: boolean = isAreaCodeCorrect && isNumberCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5500
     * @tc.name      testGroupingModuleCase0055
     * @tc.desc      Verify groups matching ID card numbers and extracting area code, birthday, and other info in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re55: RegExp = new RegExp('(\\d{6})(\\d{8})(\\d{4})');
      const result55: RegExpExecArray | null = re55.exec("110101199001011234");
      const areaCode: String = result55?.[1] ?? "";
      const birthday: String = result55?.[2] ?? "";
      const other: String = result55?.[3] ?? "";
      const isAreaCorrect: boolean = areaCode === "110101";
      const isBirthdayCorrect: boolean = birthday === "19900101";
      const isOtherCorrect: boolean = other === "1234";
      const testPassed: boolean = isAreaCorrect && isBirthdayCorrect && isOtherCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5600
     * @tc.name      testGroupingModuleCase0056
     * @tc.desc      Verify groups matching HTML tags and extracting tag name and attributes in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re56: RegExp = new RegExp('<(\\w+)([^>]*)>');
      const result56: RegExpExecArray | null = re56.exec("<div class='test'>");
      const tagName: String = result56?.[1] ?? "";
      const attributes: String = (result56?.[2] ?? "").trim();
      const isTagNameCorrect: boolean = tagName === "div";
      const isAttributesCorrect: boolean = attributes === "class='test'";
      const testPassed: boolean = isTagNameCorrect && isAttributesCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5700
     * @tc.name      testGroupingModuleCase0057
     * @tc.desc      Verify groups matching CSS selectors and extracting type and name in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re57: RegExp = new RegExp('(\\.)([a-zA-Z0-9_-]+)');
      const result57: RegExpExecArray | null = re57.exec(".class-name");
      const type: String = result57?.[1] ?? "";
      const name: String = result57?.[2] ?? "";
      const isTypeCorrect: boolean = type === ".";
      const isNameCorrect: boolean = name === "class-name";
      const testPassed: boolean = isTypeCorrect && isNameCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5800
     * @tc.name      testGroupingModuleCase0058
     * @tc.desc      Verify groups matching JSON key-value pairs and extracting key and value in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re58: RegExp = new RegExp('"([^"]+)":\\s*"([^"]+)"');
      const result58: RegExpExecArray | null = re58.exec('"name": "test"');
      const key: String = result58?.[1] ?? "";
      const value: String = result58?.[2] ?? "";
      const isKeyCorrect: boolean = key === "name";
      const isValueCorrect: boolean = value === "test";
      const testPassed: boolean = isKeyCorrect && isValueCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5900
     * @tc.name      testGroupingModuleCase0059
     * @tc.desc      Verify groups matching version numbers and extracting major, minor, and patch versions in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re59: RegExp = new RegExp('(\\d+)\\.(\\d+)\\.(\\d+)');
      const result59: RegExpExecArray | null = re59.exec("1.2.3");
      const majorVersion: String = result59?.[1] ?? "";
      const minorVersion: String = result59?.[2] ?? "";
      const patchVersion: String = result59?.[3] ?? "";
      const isMajorCorrect: boolean = majorVersion === "1";
      const isMinorCorrect: boolean = minorVersion === "2";
      const isPatchCorrect: boolean = patchVersion === "3";
      const testPassed: boolean = isMajorCorrect && isMinorCorrect && isPatchCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6000
     * @tc.name      testGroupingModuleCase0060
     * @tc.desc      Verify groups matching filenames and extracting name and extension in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re60: RegExp = new RegExp('(.+)\\.([a-zA-Z0-9]+)');
      const result60: RegExpExecArray | null = re60.exec("document.txt");
      const fileName: String = result60?.[1] ?? "";
      const fileExt: String = result60?.[2] ?? "";
      const isNameCorrect: boolean = fileName === "document";
      const isExtCorrect: boolean = fileExt === "txt";
      const testPassed: boolean = isNameCorrect && isExtCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6100
     * @tc.name      testGroupingModuleCase0061
     * @tc.desc      Verify groups and backreferences in replacing HTML tags using regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re61: RegExp = new RegExp('<(\\w+)>(.*)<\\/\\1>');
      const result61: string = "<b>bold text</b>".replace(re61, "$2");
      const testPassed: boolean = result61 === "bold text";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6200
     * @tc.name      testGroupingModuleCase0062
     * @tc.desc      Verify groups and conditional replacement with template string type conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re62: RegExp = new RegExp('(\\d+)([+-])(\\d+)');
      const result62: string = "10+5".replace(re62,
        (match: string, group: Object[]): string => {
          const numA: double = parseInt((group[0] as string));
          const op: string = group[1] as string;
          const numB: double = parseInt((group[2] as string));
          const res: number = op === '+' ? (numA + numB) : (numA - numB)
          return op === '+' ? `${numA + numB}` : `${numA - numB}`;
        })
      const testPassed: boolean = result62 === "15";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6300
     * @tc.name      testGroupingModuleCase0063
     * @tc.desc      Verify groups matching and swapping content using backreferences in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re63: RegExp = new RegExp('(\\w+)\\s(\\w+)');
      const result63: string = "first second".replace(re63, "$2 $1");
      const testPassed: boolean = result63 === "second first";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6400
     * @tc.name      testGroupingModuleCase0064
     * @tc.desc      Verify groups matching and reorganizing date formats using backreferences in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re64: RegExp = new RegExp('(\\d{4})-(\\d{2})-(\\d{2})');
      const result64: string = "2023-12-31".replace(re64, "$2/$3/$1");
      const testPassed: boolean = result64 === "12/31/2023";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6500
     * @tc.name      testGroupingModuleCase0065
     * @tc.desc      Verify groups matching and formatting phone numbers using backreferences in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re65: RegExp = new RegExp('(\\d{3})(\\d{3})(\\d{4})');
      const result65: string = "1234567890".replace(re65, "($1) $2-$3");
      const testPassed: boolean = result65 === "(123) 456-7890";
      expect(testPassed).assertTrue();
    });


    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6700
     * @tc.name      testGroupingModuleCase0067
     * @tc.desc      Verify replacement behavior when referencing out-of-range groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re67: RegExp = new RegExp('(a)(b)');
      const result67: string = "ab".replace(re67, "$3");
      const testPassed: boolean = result67 === "$3";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6800
     * @tc.name      testGroupingModuleCase0068
     * @tc.desc      Verify replacement behavior when referencing non-existent named groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re68: RegExp = new RegExp('(?<a>abc)');
      const result68: string = "abc".replace(re68, "$<b>");
      const testPassed: boolean = result68 === "";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6900
     * @tc.name      testGroupingModuleCase0069
     * @tc.desc      Verify replacement behavior of empty groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re69: RegExp = new RegExp('()');
      const result69: string = "test".replace(re69, "[$1]");
      const testPassed: boolean = result69 === "[]test";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7000
     * @tc.name testGroupingModuleCase0070
     * @tc.desc Verify overlapping matches by manually adjusting lastIndex after each exec.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testGroupingModuleCase0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re70: RegExp = new RegExp('(a.)', 'g');
      const str: string = "aaa";
      const matches: string[] = [];
      let match: RegExpExecArray | null;
      while ((match = re70.exec(str)) !== null) {
        matches.push(match?.[1]??'');
        re70.lastIndex = (match?.index??0) + 1;
      }
      const result70: string = matches.join(",");
      const expected: string = "aa,aa";
      const testPassed: boolean = result70 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7100
     * @tc.name      testGroupingModuleCase0071
     * @tc.desc      Verify groups matching zero-length content (empty string) in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re71: RegExp = new RegExp('(a*)');
      const result71: RegExpExecArray | null = re71.exec("");
      const groupContent: String = result71?.[1] ?? "";
      const isEmptyString: boolean = groupContent === "";
      const testPassed: boolean = isEmptyString;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7300
     * @tc.name      testGroupingModuleCase0073
     * @tc.desc      Verify groups matching special Unicode properties (e.g., Emoji) in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re73: RegExp = new RegExp('(\\p{Emoji})', 'u');
      const result73: RegExpExecArray | null = re73.exec("😀");
      const emojiChar: String = result73?.[1] ?? "";
      const testPassed: boolean = emojiChar === "😀";
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7400
     * @tc.name      testGroupingModuleCase0074
     * @tc.desc      Verify groups matching control characters (e.g., carriage return) in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re74: RegExp = new RegExp('(\\cM)');
      const result74: RegExpExecArray | null = re74.exec("\r");
      const isMatchSuccess: boolean = result74 !== null;
      const testPassed: boolean = isMatchSuccess;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7500
     * @tc.name      testGroupingModuleCase0075
     * @tc.desc      Verify groups matching newline characters and getting their length in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re75: RegExp = new RegExp('(\\n+)');
      const result75: RegExpExecArray | null = re75.exec("line1\n\nline2");
      const newlineStr: String = result75?.[1] ?? "";
      const newlineLength: number = newlineStr.length;
      const testPassed: boolean = newlineLength === 2;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7600
     * @tc.name      testGroupingModuleCase0076
     * @tc.desc      Verify groups matching tab characters and getting their length in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re76: RegExp = new RegExp('(\\t+)');
      const result76: RegExpExecArray | null = re76.exec("col1\t\tcol2");
      const tabStr: String = result76?.[1] ?? "";
      const tabLength: number = tabStr.length;
      const testPassed: boolean = tabLength === 2;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7800
     * @tc.name      testGroupingModuleCase0078
     * @tc.desc      Verify combination of test method and groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re78: RegExp = new RegExp('(a)');
      const testResult: boolean = re78.test("a");
      const execResult: RegExpExecArray | null = re78.exec("a");
      const group1Content: String = execResult?.[1] ?? "";
      const isTestCorrect: boolean = testResult === true;
      const isGroupCorrect: boolean = group1Content === "a";
      const testPassed: boolean = isTestCorrect && isGroupCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7900
     * @tc.name      testGroupingModuleCase0079
     * @tc.desc      Verify combination of match method and groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re79: RegExp = new RegExp('(\\d+)');
      const result79: RegExpMatchArray | null = "abc123def".match(re79);
      const fullMatch: String = result79?.[0] ?? "";
      const group1Content: String = result79?.[1] ?? "";
      const isFullMatchCorrect: boolean = fullMatch === "123";
      const isGroupCorrect: boolean = group1Content === "123";
      const testPassed: boolean = isFullMatchCorrect && isGroupCorrect;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8100
     * @tc.name      testGroupingModuleCase0081
     * @tc.desc      Verify the split method with capturing groups in regular expressions, which preserves the delimiter in the result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re81: RegExp = new RegExp('(\\s)');
      const result81: string[] = "a b c".split(re81);
      const output: string = result81.join("|");
      const expected: string = "a| |b| |c";
      const testPassed: boolean = output === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8200
     * @tc.name      testGroupingModuleCase0082
     * @tc.desc      Verify the lastIndex property of a global regular expression after exec with capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re82: RegExp = new RegExp('(\\w+)', 'g');
      re82.exec("a b c");
      const result82: number = re82.lastIndex;
      const expected: number = 1;
      const testPassed: boolean = result82 === expected;
      expect(testPassed).assertTrue();
    });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8300
     * @tc.name      testGroupingModuleCase0083
     * @tc.desc      Verify capturing group behavior when matching an empty string with a zero-or-more quantifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re83: RegExp = new RegExp('(a*)');
      const result83: RegExpExecArray | null = re83.exec("");
      const group1: String = result83?.[1] ?? "";
      const isMatchEmpty: boolean = group1 === "";
      const testPassed: boolean = isMatchEmpty;
      expect(testPassed).assertTrue();
    });
  })
}