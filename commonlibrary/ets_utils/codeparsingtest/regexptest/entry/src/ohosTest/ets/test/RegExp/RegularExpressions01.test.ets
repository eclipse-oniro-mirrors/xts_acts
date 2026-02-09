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

export default function RegularExpressions01Test() {
  describe('RegularExpressions01Test', () => {
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
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0100
     * @tc.name      testGroupingModuleCase0001
     * @tc.desc      Verify basic capturing group behavior in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0001";
        console.log(TAG + " start");
        const re1: RegExp = /(abc)/;
        const result1: RegExpExecArray | null = re1.exec("xyzabc123");
        const wholeMatch: string = result1?.[0] || "";
        const group1: string = result1?.[1] || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "abc";
        const isGroup1Correct: boolean = group1 === "abc";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`1. Basic Capture Group Results: Overall=${wholeMatch}, Group 1=${group1}`);
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
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0002";
        console.log(TAG + " start");
        const re2: RegExp = /(\d+)-(\w+)/;
        const result2: RegExpExecArray | null = re2.exec("123-test");
        const wholeMatch: string = result2?.[0] || "";
        const group1: string = result2?.[1] || "";
        const group2: string = result2?.[2] || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "123-test";
        const isGroup1Correct: boolean = group1 === "123";
        const isGroup2Correct: boolean = group2 === "test";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct && isGroup2Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`2. Multiple Capture Grouping Results: Overall =${wholeMatch}, Group 1 = ${group1}, Group 2 = ${group2}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0300
     * @tc.name      testGroupingModuleCase0003
     * @tc.desc      Verify regular expression with nested capturing groups can match correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0003";
        console.log(TAG + " start");
        const re3: RegExp = /(a(b)c)/;
        const result3: RegExpExecArray | null = re3.exec("abc");
        const wholeMatch: string = result3?.[0] || "";
        const group1: string = result3?.[1] || "";
        const group2: string = result3?.[2] || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "abc";
        const isGroup1Correct: boolean = group1 === "abc";
        const isGroup2Correct: boolean = group2 === "b";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct && isGroup2Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`3. Nested Capture Grouping Results: Overall=${wholeMatch}, Group 1 =${group1}, Group 2 =${group2}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0400
     * @tc.name      testGroupingModuleCase0004
     * @tc.desc      Verify regular expression with nested capturing groups can match correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0004";
        console.log(TAG + " start");
        const re4: RegExp = /(?:abc)/;
        const result4: RegExpExecArray | null = re4.exec("abc123");
        const resultLength: number = result4?.length ?? 0;
        const testPassed: boolean = resultLength === 1;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`4. Non-Capture Packet Result Length: ${resultLength}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0500
     * @tc.name      testGroupingModuleCase0005
     * @tc.desc      Verify matching results of mixed non-capturing and capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0005";
        console.log(TAG + " start");
        const re5: RegExp = /(?:a)(b)(?:c)/;
        const result5: RegExpExecArray | null = re5.exec("abc");
        const wholeMatch: string = result5?.[0] || "";
        const group1: string = result5?.[1] || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "abc";
        const isGroup1Correct: boolean = group1 === "b";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`5. Mixed Grouping Results: Overall=${wholeMatch}, Group 1 =${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0600
     * @tc.name      testGroupingModuleCase0006
     * @tc.desc      Verify matching results of groups combined with quantifiers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0006";
        console.log(TAG + " start");
        const re6: RegExp = /(ab){2}/;
        const result6: RegExpExecArray | null = re6.exec("abab");
        const wholeMatch: string = result6?.[0] || "";
        const group1: string = result6?.[1] || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "abab";
        const isGroup1Correct: boolean = group1 === "ab";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`6. Results of grouping and quantifier combination: ${wholeMatch}, Group 1 =${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0700
     * @tc.name      testGroupingModuleCase0007
     * @tc.desc      Verify matching results of groups combined with selection operators.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0007";
        console.log(TAG + " start");
        const re7: RegExp = /(a|b)c/;
        const result7: RegExpExecArray | null = re7.exec("ac");
        const wholeMatch: string = result7?.[0] || "";
        const group1: string = result7?.[1] || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "ac";
        const isGroup1Correct: boolean = group1 === "a";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`7. Grouping and Selector Combination Results: ${wholeMatch}, Group 1 =${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0800
     * @tc.name      testGroupingModuleCase0008
     * @tc.desc      Verify basic usage of backreference \1 in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0008";
        console.log(TAG + " start");
        const re8: RegExp = /(\w)\1/;
        const result8: boolean = re8.test("aa");
        const testPassed: boolean = result8 === true;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`8. backreference \\1 match 'aa' result: ${result8}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_0900
     * @tc.name      testGroupingModuleCase0009
     * @tc.desc      Verify usage of multiple backreferences \1 and \2 in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0009";
        console.log(TAG + " start");
        const re9: RegExp = /(\w)(\d)\1\2/;
        const result9: boolean = re9.test("a1a1");
        const testPassed: boolean = result9 === true;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`9. backreference \\1\\2 match 'a1a1' result: ${result9}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1000
     * @tc.name      testGroupingModuleCase0010
     * @tc.desc      Verify backreference to nested groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0010";
        console.log(TAG + " start");
        const re10: RegExp = /((a)b)\2/;
        const result10: boolean = re10.test("aba");
        const testPassed: boolean = result10 === true;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`10. Backreference nested grouping match 'aba' result: ${result10}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1100
     * @tc.name      testGroupingModuleCase0011
     * @tc.desc      Verify that backreferencing non-capturing groups is invalid.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0011";
        console.log(TAG + " start");
        let errorOccurred = false;
        try {
          const re11: RegExp = /(?:a)b\1/;
          re11.test("aba");
        } catch (e) {
          errorOccurred = true;
          console.log(TAG + " caught expected error: " + e);
        }
        expect(errorOccurred).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1200
     * @tc.name      testGroupingModuleCase0012
     * @tc.desc      Verify basic usage of named capturing groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0012";
        console.log(TAG + " start");
        const re12: RegExp = /(?<name>abc)/;
        const result12: RegExpExecArray | null = re12.exec("abc123");
        const wholeMatch: string = result12?.[0] || "";
        const groupNameValue: string = result12?.groups?.name || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "abc";
        const isGroupNameCorrect: boolean = groupNameValue === "abc";
        const testPassed: boolean = isWholeMatchCorrect && isGroupNameCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`12. Named Grouping Results: Overall=${wholeMatch}, name=${groupNameValue}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1300
     * @tc.name      testGroupingModuleCase0013
     * @tc.desc      Verify multiple named capturing groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0013";
        console.log(TAG + " start");
        const re13: RegExp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
        const result13: RegExpExecArray | null = re13.exec("2023-12-31");
        const year: string = result13?.groups?.year || "";
        const month: string = result13?.groups?.month || "";
        const day: string = result13?.groups?.day || "";
        const isYearCorrect: boolean = year === "2023";
        const isMonthCorrect: boolean = month === "12";
        const isDayCorrect: boolean = day === "31";
        const testPassed: boolean = isYearCorrect && isMonthCorrect && isDayCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`13. Multiple named groups: Year=${year}, Month=${month}, Day=${day}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1400
     * @tc.name      testGroupingModuleCase0014
     * @tc.desc      Verify coexistence of named groups and numeric references in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0014";
        console.log(TAG + " start");
        const re14: RegExp = /(?<group1>a)(b)/;
        const result14: RegExpExecArray | null = re14.exec("ab");
        const group1: string = result14?.groups?.group1 || "";
        const group2: string = result14?.[2] || "";
        const isGroup1Correct: boolean = group1 === "a";
        const isGroup2Correct: boolean = group2 === "b";
        const testPassed: boolean = isGroup1Correct && isGroup2Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`14. Naming and Digital Referencing: group1=${group1}, Group 2 =${group2}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1500
     * @tc.name      testGroupingModuleCase0015
     * @tc.desc      Verify named backreference \k<char> in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0015";
        console.log(TAG + " start");
        const re15: RegExp = /(?<char>\w)\k<char>/;
        const result15: boolean = re15.test("aa");
        const testPassed: boolean = result15 === true;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`15. Named backreferences match 'aa' results: ${result15}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1600
     * @tc.name      testGroupingModuleCase0016
     * @tc.desc      Verify mixed usage of named backreferences and numeric backreferences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0016";
        console.log(TAG + " start");
        const re16: RegExp = /(?<a>\w)(?<b>\d)\1\k<b>/;
        const result16: boolean = re16.test("a1a1");
        const testPassed: boolean = result16 === true;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`16. Mixed reference match'a1a1' result: ${result16}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1700
     * @tc.name      testGroupingModuleCase0017
     * @tc.desc      Verify usage of capturing groups in string replacement with $1 reference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0017";
        console.log(TAG + " start");
        const re17: RegExp = /(\w+)\s(\w+)/;
        const result17: string = "John Doe".replace(re17, "$2, $1");
        const testPassed: boolean = result17 === "Doe, John";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`17. Group Replacement Results: ${result17}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1800
     * @tc.name      testGroupingModuleCase0018
     * @tc.desc      Verify usage of named capturing groups in string replacement with $&lt;name&gt; reference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0018";
        console.log(TAG + " start");
        const re18: RegExp = /(?<first>\w+)\s(?<last>\w+)/;
        const result18: string = "John Doe".replace(re18, "$<last>, $<first>");
        const testPassed: boolean = result18 === "Doe, John";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`18. Named Grouping Replacement Results: ${result18}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_1900
     * @tc.name      testGroupingModuleCase0019
     * @tc.desc      Verify usage of capturing groups in replacement function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0019";
        console.log(TAG + " start");
        const re19: RegExp = /(\w+)/g;
        const result19: string = "hello world".replace(re19,
          (match: string, group1: string): string => {
            return group1.toUpperCase();
          }
        );
        const testPassed: boolean = result19 === "HELLO WORLD";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`19. Using grouped results in function replacement: ${result19}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2000
     * @tc.name      testGroupingModuleCase0020
     * @tc.desc      Verify matching results of empty capturing groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0020";
        console.log(TAG + " start");
        const re20: RegExp = /()/;
        const result20: RegExpExecArray | null = re20.exec("test");
        const wholeMatch: string = result20?.[0] || "";
        const group1: string = result20?.[1] || "";
        const isGroup1Empty: boolean = group1 === "";
        const isWholeMatchEmpty: boolean = wholeMatch === "";
        const testPassed: boolean = isWholeMatchEmpty && isGroup1Empty;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`20. Empty packet matching results: ${wholeMatch}, Group 1 =${isGroup1Empty ? "空字符串" : group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2100
     * @tc.name      testGroupingModuleCase0021
     * @tc.desc      Verify capturing groups matching optional content in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0021";
        console.log(TAG + " start");
        const re21: RegExp = /(\d{3}-)?\d{4}/;
        const result21: RegExpExecArray | null = re21.exec("123-4567");
        const wholeMatch: string = result21?.[0] || "";
        const group1: string = result21?.[1] || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "123-4567";
        const isGroup1Correct: boolean = group1 === "123-";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`21. Optional Group Match Results: Overall=${wholeMatch}, Group 1 =${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2200
     * @tc.name      testGroupingModuleCase0022
     * @tc.desc      Verify capturing result when a group matches 0 times in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0022";
        console.log(TAG + " start");
        const re22: RegExp = /(\d{3}-)?\d{4}/;
        const result22: RegExpExecArray | null = re22.exec("4567");
        const group1: string | undefined = result22?.[1];
        const testPassed: boolean = group1 === undefined;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`22. Group Match 0 Results: Group 1 =${group1 ?? null}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2300
     * @tc.name      testGroupingModuleCase0023
     * @tc.desc      Verify combination of capturing groups and global matching in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0023";
        console.log(TAG + " start");
        const re23: RegExp = /(\w+)/g;
        const str23: string = "a b c";
        const result23: string[] = [];
        let match23: RegExpExecArray | null;
        while ((match23 = re23.exec(str23)) !== null) {
          result23.push(match23[1]);
        }
        const joinedResult: string = result23.join(",");
        const testPassed: boolean = joinedResult === "a,b,c";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`23. Global Match Group Results: ${joinedResult}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2400
     * @tc.name      testGroupingModuleCase0024
     * @tc.desc      Verify combination of capturing groups and multiline mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0024";
        console.log(TAG + " start");
        const re24: RegExp = /^(\w+)/gm;
        const str24: string = "first\nsecond\nthird";
        const result24: string[] = [];
        let match24: RegExpExecArray | null;
        while ((match24 = re24.exec(str24)) !== null) {
          result24.push(match24[1]);
        }
        const joinedResult: string = result24.join(",");
        const testPassed: boolean = joinedResult === "first,second,third";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`24. Multiline Mode Grouping Results: ${joinedResult}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2500
     * @tc.name      testGroupingModuleCase0025
     * @tc.desc      Verify combination of capturing groups and case-insensitive mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0025";
        console.log(TAG + " start");
        const re25: RegExp = /(ABC)/i;
        const result25: RegExpExecArray | null = re25.exec("abc");
        const group1: string = result25?.[1] || "";
        const testPassed: boolean = group1 === "abc";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`25. Ignore Case Group Results: ${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2600
     * @tc.name      testGroupingModuleCase0026
     * @tc.desc      Verify positive lookahead assertion in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0026";
        console.log(TAG + " start");
        const re26: RegExp = /a(?=b)/;
        const result26: RegExpExecArray | null = re26.exec("ab");
        const wholeMatch: string = result26?.[0] || "";
        const testPassed: boolean = wholeMatch === "a";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`26. Forward First Assertion Result: ${wholeMatch}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2700
     * @tc.name      testGroupingModuleCase0027
     * @tc.desc      Verify capturing groups inside positive lookahead assertions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0027";
        console.log(TAG + " start");
        const re27: RegExp = /a(?=(b))/;
        const result27: RegExpExecArray | null = re27.exec("ab");
        const wholeMatch: string = result27?.[0] || "";
        const group1: string = result27?.[1] || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "a";
        const isGroup1Correct: boolean = group1 === "b";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`27. Grouping in Forward Assertion: Overall=${wholeMatch}, Group 1 =${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2800
     * @tc.name      testGroupingModuleCase0028
     * @tc.desc      Verify negative lookahead assertion in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0028";
        console.log(TAG + " start");
        const re28: RegExp = /a(?!b)/;
        const result28: boolean = re28.test("ac");
        const testPassed: boolean = result28 === true;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`28. Negative advance assertion match results: ${result28}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_2900
     * @tc.name      testGroupingModuleCase0029
     * @tc.desc      Verify positive lookbehind assertion in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0029";
        console.log(TAG + " start");
        const re29: RegExp = /(?<=a)b/;
        const result29: boolean = re29.test("ab");
        const testPassed: boolean = result29 === true;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`29. Forward trailing assertion match result: ${result29}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3000
     * @tc.name      testGroupingModuleCase0030
     * @tc.desc      Verify capturing groups inside positive lookbehind assertions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0030";
        console.log(TAG + " start");
        const re30: RegExp = /(?<=(a))b/;
        const result30: RegExpExecArray | null = re30.exec("ab");
        const wholeMatch: string = result30?.[0] || "";
        const group1: string = result30?.[1] || "";
        const isWholeMatchCorrect: boolean = wholeMatch === "b";
        const isGroup1Correct: boolean = group1 === "a";
        const testPassed: boolean = isWholeMatchCorrect && isGroup1Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`30. Grouping in forward post-line assertion: overall=${wholeMatch}, Group 1 =${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3100
     * @tc.name      testGroupingModuleCase0031
     * @tc.desc      Verify negative lookbehind assertion in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0031";
        console.log(TAG + " start");
        const re31: RegExp = /(?<!a)b/;
        const result31: boolean = re31.test("cb");
        const testPassed: boolean = result31 === true;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`31. Negative backward line assertion match result: ${result31}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3200
     * @tc.name      testGroupingModuleCase0032
     * @tc.desc      Verify combination of capturing groups and dotAll mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0032";
        console.log(TAG + " start");
        const re32: RegExp = /(a.b)/s;
        const result32: RegExpExecArray | null = re32.exec("a\nb");
        const group1: string = result32?.[1] || "";
        const testPassed: boolean = group1 === "a\nb";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`32. Grouping results in dotAll mode: ${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3300
     * @tc.name      testGroupingModuleCase0033
     * @tc.desc      Verify combination of capturing groups and Unicode mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0033";
        console.log(TAG + " start");
        const re33: RegExp = /(\p{Script=Greek})/u;
        const result33: RegExpExecArray | null = re33.exec("α");
        const group1: string = result33?.[1] || "";
        const testPassed: boolean = group1 === "α";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`33. Unicode Mode Group Results: ${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3400
     * @tc.name      testGroupingModuleCase0034
     * @tc.desc      Verify combination of capturing groups and sticky mode in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0034";
        console.log(TAG + " start");
        const re34: RegExp = /(a)/y;
        re34.lastIndex = 1;
        const result34: RegExpExecArray | null = re34.exec("ba");
        const group1: string = result34?.[1] || "";
        const testPassed: boolean = group1 === "a";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`34. Sticky Mode Grouping Results: ${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3500
     * @tc.name      testGroupingModuleCase0035
     * @tc.desc      Verify capturing result of repeated groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0035";
        console.log(TAG + " start");
        const re35: RegExp = /(a)+/;
        const result35: RegExpExecArray | null = re35.exec("aaa");
        const group1: string = result35?.[1] || "";
        const testPassed: boolean = group1 === "a";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`35. Duplicate Group Capture Results: ${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3600
     * @tc.name      testGroupingModuleCase0036
     * @tc.desc      Verify capturing results of multiple repeated groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0036";
        console.log(TAG + " start");
        const re36: RegExp = /(\d)(\d)+/;
        const result36: RegExpExecArray | null = re36.exec("1234");
        const group1: string = result36?.[1] || "";
        const group2: string = result36?.[2] || "";
        const isGroup1Correct: boolean = group1 === "1";
        const isGroup2Correct: boolean = group2 === "4";
        const testPassed: boolean = isGroup1Correct && isGroup2Correct;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`36. Multiple Duplicate Grouping: Group 1 =${group1}, Group 2 =${group2}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3700
     * @tc.name      testGroupingModuleCase0037
     * @tc.desc      Verify capturing result of groups with non-greedy quantifiers in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0037";
        console.log(TAG + " start");
        const re37: RegExp = /(a+?)/;
        const result37: RegExpExecArray | null = re37.exec("aaa");
        const group1: string = result37?.[1] || "";
        const testPassed: boolean = group1 === "a";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`37. Non-greedy packet capture results: ${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3800
     * @tc.name      testGroupingModuleCase0038
     * @tc.desc      Verify groups matching special characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0038";
        console.log(TAG + " start");
        const re38: RegExp = /(\*\+\?)/;
        const result38: RegExpExecArray | null = re38.exec("*+?");
        const group1: string = result38?.[1] || "";
        const testPassed: boolean = group1 === "*+?";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`38. Group Match Special Character Results: ${group1}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_3900
     * @tc.name      testGroupingModuleCase0039
     * @tc.desc      Verify capturing group matching whitespace characters and measuring its length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0039";
        console.log(TAG + " start");
        const re39: RegExp = /(\s+)/;
        const input: string = "   \t\n";
        const result39: RegExpExecArray | null = re39.exec(input);
        const whitespaceMatch: string = result39?.[1] ?? "";
        const length: number = whitespaceMatch.length;
        expect(length).assertEqual(5);
        const actualInput: string = "   \t";
        const execResult: RegExpExecArray | null = re39.exec(actualInput);
        const matchStr: string = execResult?.[1] ?? "";
        const actualLength: number = matchStr.length;
        const expectedLength: number = 4;
        const testPassed: boolean = actualLength === expectedLength;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`39. Group Match Blank Character Length: ${actualLength}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4000
     * @tc.name      testGroupingModuleCase0040
     * @tc.desc      Verify groups matching word boundaries and position acquisition in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0040";
        console.log(TAG + " start");
        const re40: RegExp = /(\b)/;
        const result40: RegExpExecArray | null = re40.exec("test");
        const boundaryIndex: number = result40?.index ?? -1;
        const testPassed: boolean = boundaryIndex === 0;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`40. Group Match Word Boundary Position: ${boundaryIndex}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4100
     * @tc.name      testGroupingModuleCase0041
     * @tc.desc      Verify groups matching digits in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0041";
        console.log(TAG + " start");
        const re41: RegExp = /(\d+)/;
        const result41: RegExpExecArray | null = re41.exec("abc123def");
        const numberStr: string = result41?.[1] || "";
        const testPassed: boolean = numberStr === "123";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`41. Group Match Numeric Results: ${numberStr}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4200
     * @tc.name      testGroupingModuleCase0042
     * @tc.desc      Verify groups matching non-digits in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0042";
        console.log(TAG + " start");
        const re42: RegExp = /(\D+)/;
        const result42: RegExpExecArray | null = re42.exec("123abc456");
        const nonDigitStr: string = result42?.[1] || "";
        const testPassed: boolean = nonDigitStr === "abc";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`42. Group match non-numeric results: ${nonDigitStr}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4300
     * @tc.name      testGroupingModuleCase0043
     * @tc.desc      Verify groups matching word characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0043";
        console.log(TAG + " start");
        const re43: RegExp = /(\w+)/;
        const result43: RegExpExecArray | null = re43.exec("___abc123___");
        const wordStr: string = result43?.[1] || "";
        const testPassed: boolean = wordStr === "___abc123___";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`43. Group Match Word Character Results: ${wordStr}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4400
     * @tc.name      testGroupingModuleCase0044
     * @tc.desc      Verify groups matching non-word characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0044";
        console.log(TAG + " start");
        const re44: RegExp = /(\W+)/;
        const result44: RegExpExecArray | null = re44.exec("test@example.com");
        const nonWordStr: string = result44?.[1] || "";
        const testPassed: boolean = nonWordStr === "@";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`44. Group match non-word character results: ${nonWordStr}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4500
     * @tc.name      testGroupingModuleCase0045
     * @tc.desc      Verify groups matching hexadecimal-encoded characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0045";
        console.log(TAG + " start");
        const re45: RegExp = /(\x41)/;
        const result45: RegExpExecArray | null = re45.exec("A");
        const hexChar: string = result45?.[1] || "";
        const testPassed: boolean = hexChar === "A";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`45. Group match hex character results: ${hexChar}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4600
     * @tc.name      testGroupingModuleCase0046
     * @tc.desc      Verify groups matching Unicode-encoded characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0046";
        console.log(TAG + " start");
        const re46: RegExp = /(\u00A9)/;
        const result46: RegExpExecArray | null = re46.exec("©");
        const unicodeChar: string = result46?.[1] || "";
        const testPassed: boolean = unicodeChar === "©";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`46. Group Match Unicode Character Results: ${unicodeChar}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4700
     * @tc.name      testGroupingModuleCase0047
     * @tc.desc      Verify groups matching UTF-32 characters (Unicode supplementary planes) in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0047";
        console.log(TAG + " start");
        const re47: RegExp = /(\u{1F600})/u;
        const result47: RegExpExecArray | null = re47.exec("😀");
        const utf32Char: string = result47?.[1] || "";
        const testPassed: boolean = utf32Char === "😀";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`47. Group Match UTF-32 Character Results: ${utf32Char}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4800
     * @tc.name      testGroupingModuleCase0048
     * @tc.desc      Verify groups matching Chinese characters in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0048";
        console.log(TAG + " start");
        const re48: RegExp = /([\u4e00-\u9fa5]+)/;
        const result48: RegExpExecArray | null = re48.exec("你好，世界");
        const chineseStr: string = result48?.[1] || "";
        const testPassed: boolean = chineseStr === "你好";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`48. Group Match Chinese Character Results: ${chineseStr}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_4900
     * @tc.name      testGroupingModuleCase0049
     * @tc.desc      Verify groups matching email addresses and extracting username/domain in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0049";
        console.log(TAG + " start");
        const re49: RegExp = /([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})/;
        const result49: RegExpExecArray | null = re49.exec("test@example.com");
        const username: string = result49?.[1] || "";
        const domain: string = result49?.[2] || "";
        const isUsernameCorrect: boolean = username === "test";
        const isDomainCorrect: boolean = domain === "example.com";
        const testPassed: boolean = isUsernameCorrect && isDomainCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`49. Mailbox Grouping: User Name=${username}, Domain Name=${domain}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5000
     * @tc.name      testGroupingModuleCase0050
     * @tc.desc      Verify groups matching URLs and extracting protocol, domain, and path in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0050";
        console.log(TAG + " start");
        const re50: RegExp = /(https?):\/\/([^\/]+)(\/.*)?/;
        const result50: RegExpExecArray | null = re50.exec("https://example.com/path");
        const protocol: string = result50?.[1] || "";
        const domain: string = result50?.[2] || "";
        const path: string = result50?.[3] || "";
        const isProtocolCorrect: boolean = protocol === "https";
        const isDomainCorrect: boolean = domain === "example.com";
        const isPathCorrect: boolean = path === "/path";
        const testPassed: boolean = isProtocolCorrect && isDomainCorrect && isPathCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`50. URL Grouping: Protocol=${protocol}, Domain Name=${domain}, Path=${path}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5100
     * @tc.name      testGroupingModuleCase0051
     * @tc.desc      Verify groups matching IP addresses and extracting each segment in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0051";
        console.log(TAG + " start");
        const re51: RegExp = /(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/;
        const result51: RegExpExecArray | null = re51.exec("192.168.1.1");
        const segment1: string = result51?.[1] || "";
        const segment2: string = result51?.[2] || "";
        const segment3: string = result51?.[3] || "";
        const segment4: string = result51?.[4] || "";
        const fullIp: string = `${segment1}.${segment2}.${segment3}.${segment4}`;
        const testPassed: boolean = fullIp === "192.168.1.1";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`51. IP Packet: ${fullIp}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5200
     * @tc.name      testGroupingModuleCase0052
     * @tc.desc      Verify groups matching dates and extracting year, month, day in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0052";
        console.log(TAG + " start");
        const re52: RegExp = /(\d{4})-(\d{2})-(\d{2})/;
        const result52: RegExpExecArray | null = re52.exec("2023-12-31");
        const year: string = result52?.[1] || "";
        const month: string = result52?.[2] || "";
        const day: string = result52?.[3] || "";
        const formattedDate: string = `${year} 年 ${month} 月 ${day} 日`;
        const testPassed: boolean = formattedDate === "2023 年 12 月 31 日";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`52. Date Grouping: ${formattedDate}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5300
     * @tc.name      testGroupingModuleCase0053
     * @tc.desc      Verify groups matching time and extracting hours, minutes, seconds in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0053";
        console.log(TAG + " start");
        const re53: RegExp = /(\d{2}):(\d{2}):(\d{2})/;
        const result53: RegExpExecArray | null = re53.exec("12:34:56");
        const hours: string = result53?.[1] || "";
        const minutes: string = result53?.[2] || "";
        const seconds: string = result53?.[3] || "";
        const formattedTime: string = `${hours} 时 ${minutes} 分 ${seconds} 秒`;
        const testPassed: boolean = formattedTime === "12 时 34 分 56 秒";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`53. Time grouping: ${formattedTime}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5400
     * @tc.name      testGroupingModuleCase0054
     * @tc.desc      Verify groups matching phone numbers and extracting area code and number in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0054";
        console.log(TAG + " start");
        const re54: RegExp = /(\d{3,4})-(\d{7,8})/;
        const result54: RegExpExecArray | null = re54.exec("010-12345678");
        const areaCode: string = result54?.[1] || "";
        const phoneNumber: string = result54?.[2] || "";
        const isAreaCodeCorrect: boolean = areaCode === "010";
        const isNumberCorrect: boolean = phoneNumber === "12345678";
        const testPassed: boolean = isAreaCodeCorrect && isNumberCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`54. Telephone grouping: area code=${areaCode}, Number=${phoneNumber}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5500
     * @tc.name      testGroupingModuleCase0055
     * @tc.desc      Verify groups matching ID card numbers and extracting area code, birthday, and other info in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0055";
        console.log(TAG + " start");
        const re55: RegExp = /(\d{6})(\d{8})(\d{4})/;
        const result55: RegExpExecArray | null = re55.exec("110101199001011234");
        const areaCode: string = result55?.[1] || "";
        const birthday: string = result55?.[2] || "";
        const other: string = result55?.[3] || "";
        const isAreaCorrect: boolean = areaCode === "110101";
        const isBirthdayCorrect: boolean = birthday === "19900101";
        const isOtherCorrect: boolean = other === "1234";
        const testPassed: boolean = isAreaCorrect && isBirthdayCorrect && isOtherCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`55. Identity Card Grouping: District=${areaCode}, Birthday=${birthday}, Other=${other}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5600
     * @tc.name      testGroupingModuleCase0056
     * @tc.desc      Verify groups matching HTML tags and extracting tag name and attributes in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0056";
        console.log(TAG + " start");
        const re56: RegExp = /<(\w+)([^>]*)>/;
        const result56: RegExpExecArray | null = re56.exec("<div class='test'>");
        const tagName: string = result56?.[1] || "";
        const attributes: string = result56?.[2].trim() || "";
        const isTagNameCorrect: boolean = tagName === "div";
        const isAttributesCorrect: boolean = attributes === "class='test'";
        const testPassed: boolean = isTagNameCorrect && isAttributesCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`56. HTML tag grouping: tag names=${tagName}, Property=${attributes}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5700
     * @tc.name      testGroupingModuleCase0057
     * @tc.desc      Verify groups matching CSS selectors and extracting type and name in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0057";
        console.log(TAG + " start");
        const re57: RegExp = /(\.)([a-zA-Z0-9_-]+)/;
        const result57: RegExpExecArray | null = re57.exec(".class-name");
        const type: string = result57?.[1] || "";
        const name: string = result57?.[2] || "";
        const isTypeCorrect: boolean = type === ".";
        const isNameCorrect: boolean = name === "class-name";
        const testPassed: boolean = isTypeCorrect && isNameCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`57. CSS Selector Grouping: Types=${type}, Name=${name}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5800
     * @tc.name      testGroupingModuleCase0058
     * @tc.desc      Verify groups matching JSON key-value pairs and extracting key and value in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0058";
        console.log(TAG + " start");
        const re58: RegExp = /"([^"]+)":\s*"([^"]+)"/;
        const result58: RegExpExecArray | null = re58.exec('"name": "test"');
        const key: string = result58?.[1] || "";
        const value: string = result58?.[2] || "";
        const isKeyCorrect: boolean = key === "name";
        const isValueCorrect: boolean = value === "test";
        const testPassed: boolean = isKeyCorrect && isValueCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`58. JSON grouping: keys=${key}, Value=${value}`);
      });

    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_5900
     * @tc.name      testGroupingModuleCase0059
     * @tc.desc      Verify groups matching version numbers and extracting major, minor, and patch versions in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0059";
        console.log(TAG + " start");
        const re59: RegExp = /(\d+)\.(\d+)\.(\d+)/;
        const result59: RegExpExecArray | null = re59.exec("1.2.3");
        const majorVersion: string = result59?.[1] || "";
        const minorVersion: string = result59?.[2] || "";
        const patchVersion: string = result59?.[3] || "";
        const isMajorCorrect: boolean = majorVersion === "1";
        const isMinorCorrect: boolean = minorVersion === "2";
        const isPatchCorrect: boolean = patchVersion === "3";
        const testPassed: boolean = isMajorCorrect && isMinorCorrect && isPatchCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`59. Version Number Grouping: Major Version=${majorVersion}, secondary version=${minorVersion}, Revision No.=${patchVersion}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6000
     * @tc.name      testGroupingModuleCase0060
     * @tc.desc      Verify groups matching filenames and extracting name and extension in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0060";
        console.log(TAG + " start");
        const re60: RegExp = /(.+)\.([a-zA-Z0-9]+)/;
        const result60: RegExpExecArray | null = re60.exec("document.txt");
        const fileName: string = result60?.[1] || "";
        const fileExt: string = result60?.[2] || "";
        const isNameCorrect: boolean = fileName === "document";
        const isExtCorrect: boolean = fileExt === "txt";
        const testPassed: boolean = isNameCorrect && isExtCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`60. file name grouping: name=${fileName}, Extension=${fileExt}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6100
     * @tc.name      testGroupingModuleCase0061
     * @tc.desc      Verify groups and backreferences in replacing HTML tags using regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0061";
        console.log(TAG + " start");
        const re61: RegExp = /<(\w+)>(.*)<\/\1>/;
        const result61: string = "<b>bold text</b>".replace(re61, "$2");
        const testPassed: boolean = result61 === "bold text";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`61. Reverse Reference Replace Label Results: ${result61}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6200
     * @tc.name      testGroupingModuleCase0062
     * @tc.desc      Verify groups and conditional replacement with template string type conversion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0062";
        console.log(TAG + " start");
        const re62: RegExp = /(\d+)([+-])(\d+)/;
        const result62: string = "10+5".replace(re62, (
          match: string,
          a: string,
          op: '+' | '-',
          b: string
        ): string => {
          const numA: number = parseInt(a, 10);
          const numB: number = parseInt(b, 10);
          return op === '+'
            ? `${numA + numB}`
            : `${numA - numB}`;
        });
        const testPassed: boolean = result62 === "15";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`62. 条件替换结果: ${result62}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6300
     * @tc.name      testGroupingModuleCase0063
     * @tc.desc      Verify groups matching and swapping content using backreferences in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0063";
        console.log(TAG + " start");
        const re63: RegExp = /(\w+)\s(\w+)/;
        const result63: string = "first second".replace(re63, "$2 $1");
        const testPassed: boolean = result63 === "second first";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`63. Exchange Packet Content Results: ${result63}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6400
     * @tc.name      testGroupingModuleCase0064
     * @tc.desc      Verify groups matching and reorganizing date formats using backreferences in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0064";
        console.log(TAG + " start");
        const re64: RegExp = /(\d{4})-(\d{2})-(\d{2})/;
        const result64: string = "2023-12-31".replace(re64, "$2/$3/$1");
        const testPassed: boolean = result64 === "12/31/2023";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`64. Regroup Date Format Results: ${result64}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6500
     * @tc.name      testGroupingModuleCase0065
     * @tc.desc      Verify groups matching and formatting phone numbers using backreferences in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0065";
        console.log(TAG + " start");
        const re65: RegExp = /(\d{3})(\d{3})(\d{4})/;
        const result65: string = "1234567890".replace(re65, "($1) $2-$3");
        const testPassed: boolean = result65 === "(123) 456-7890";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`65.Formatting Phone Number Results: ${result65}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6600
     * @tc.name      testGroupingModuleCase0066
     * @tc.desc      Verify groups matching and extracting URL parameters using regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0066";
        console.log(TAG + " start");
        const re66: RegExp = /[?&]([^=]+)=([^&]+)/g;
        const url66: string = "?name=test&age=30&city=beijing";
        const params66: Record<string, string> = {};
        url66.replace(re66, (match: string, key: string, value: string): string => {
          params66[key] = value;
          return match;
        });
        const isNameCorrect: boolean = params66.name === "test";
        const isAgeCorrect: boolean = params66.age === "30";
        const testPassed: boolean = isNameCorrect && isAgeCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`66. Extract URL parameters: name=${params66.name}, age=${params66.age}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6700
     * @tc.name      testGroupingModuleCase0067
     * @tc.desc      Verify replacement behavior when referencing out-of-range groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0067";
        console.log(TAG + " start");
        const re67: RegExp = /(a)(b)/;
        const result67: string = "ab".replace(re67, "$3");
        const testPassed: boolean = result67 === "$3";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`67. Invalid Grouping Reference Replacement Results: ${result67}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6800
     * @tc.name      testGroupingModuleCase0068
     * @tc.desc      Verify replacement behavior when referencing non-existent named groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testGroupingModuleCase0068";
        console.log(TAG + " start");
        const re68: RegExp = /(?<a>abc)/;
        const result68: string = "abc".replace(re68, "$<b>");
        const testPassed: boolean = result68 === "";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`68. Invalid Named Grouping Reference Replacement Results: "${result68}"`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_6900
     * @tc.name      testGroupingModuleCase0069
     * @tc.desc      Verify replacement behavior of empty groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0069";
        console.log(TAG + " start");
        const re69: RegExp = /()/;
        const result69: string = "test".replace(re69, "[$1]");
        const testPassed: boolean = result69 === "[]test";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`69. Empty packet replacement results: ${result69}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7000
     * @tc.name      testGroupingModuleCase0070
     * @tc.desc      Verify overlapping matches by manually adjusting lastIndex after each exec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0070";
        console.log(TAG + " start");
        const re70: RegExp = /(a.)/g;
        const str: string = "aaa";
        const matches: string[] = [];
        let match: RegExpExecArray | null;
        while ((match = re70.exec(str)) !== null) {
          matches.push(match[1]);
          re70.lastIndex = match.index + 1;
        }
        const result70: string = matches.join(",");
        const expected: string = "aa,aa";
        const testPassed: boolean = result70 === expected;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`70. Group matching overlapping content: ${result70}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7100
     * @tc.name      testGroupingModuleCase0071
     * @tc.desc      Verify groups matching zero-length content (empty string) in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0071";
        console.log(TAG + " start");
        const re71: RegExp = /(a*)/;
        const result71: RegExpExecArray | null = re71.exec("");
        const groupContent: string = result71?.[1] || "";
        const isEmptyString: boolean = groupContent === "";
        const output: string = isEmptyString ? "空字符串" : groupContent;
        const testPassed: boolean = isEmptyString;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`71. Packet Match Zero Length: ${output}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7200
     * @tc.name      testGroupingModuleCase0072
     * @tc.desc      Verify counter application in global replacement with groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0072";
        console.log(TAG + " start");
        const re72: RegExp = /(\w)/g;
        let count72: number = 0;
        const result72: string = "test".replace(re72, (
          match: string,
          group: string
        ): string => {
          count72++;
          return group.toUpperCase();
        });
        const isCountCorrect: boolean = count72 === 4;
        const isResultCorrect: boolean = result72 === "TEST";
        const testPassed: boolean = isCountCorrect && isResultCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`72. Global Replacement Count: ${count72}, Results: ${result72}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7300
     * @tc.name      testGroupingModuleCase0073
     * @tc.desc      Verify groups matching special Unicode properties (e.g., Emoji) in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0073";
        console.log(TAG + " start");
        const re73: RegExp = /(\p{Emoji})/u;
        const result73: RegExpExecArray | null = re73.exec("😀");
        const emojiChar: string = result73?.[1] || "";
        const testPassed: boolean = emojiChar === "😀";
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`73. Special Unicode attribute grouping: ${emojiChar}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7400
     * @tc.name      testGroupingModuleCase0074
     * @tc.desc      Verify groups matching control characters (e.g., carriage return) in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0074";
        console.log(TAG + " start");
        const re74: RegExp = /(\cM)/;
        const result74: RegExpExecArray | null = re74.exec("\r");
        const isMatchSuccess: boolean = result74 !== null;
        const output: string = isMatchSuccess ? "成功" : "失败";
        const testPassed: boolean = isMatchSuccess;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`74.Control character grouping match results: ${output}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7500
     * @tc.name      testGroupingModuleCase0075
     * @tc.desc      Verify groups matching newline characters and getting their length in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0075";
        console.log(TAG + " start");
        const re75: RegExp = /(\n+)/;
        const result75: RegExpExecArray | null = re75.exec("line1\n\nline2");
        const newlineStr: string = result75?.[1] || "";
        const newlineLength: number = newlineStr.length;
        const testPassed: boolean = newlineLength === 2;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`75. Line break grouping match length: ${newlineLength}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7600
     * @tc.name      testGroupingModuleCase0076
     * @tc.desc      Verify groups matching tab characters and getting their length in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0076";
        console.log(TAG + " start");
        const re76: RegExp = /(\t+)/;
        const result76: RegExpExecArray | null = re76.exec("col1\t\tcol2");
        const tabStr: string = result76?.[1] || "";
        const tabLength: number = tabStr.length;
        const testPassed: boolean = tabLength === 2;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`76. Tab Group Match Length: ${tabLength}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7700
     * @tc.name      testGroupingModuleCase0077
     * @tc.desc      Verify nested structure matching using greedy matching and manual space handling.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0077";
        console.log(TAG + " start");
        const re77: RegExp = /(\((?:[^()]+|\g<1>)*\))/;
        const result77: RegExpExecArray | null = re77.exec("(a(b(c)d)e)");
        const expected = "(c)";
        const testPassed = result77 !== null && result77[0] === expected;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`77. Match result: ${result77 ? result77[0] : "null"}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7800
     * @tc.name      testGroupingModuleCase0078
     * @tc.desc      Verify combination of test method and groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0078";
        console.log(TAG + " start");
        const re78: RegExp = /(a)/;
        const testResult: boolean = re78.test("a");
        const execResult: RegExpExecArray | null = re78.exec("a");
        const group1Content: string = execResult?.[1] || "";
        const isTestCorrect: boolean = testResult === true;
        const isGroupCorrect: boolean = group1Content === "a";
        const testPassed: boolean = isTestCorrect && isGroupCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`78. existence of grouping in test method: ${testResult}, Group 1 =${group1Content}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_7900
     * @tc.name      testGroupingModuleCase0079
     * @tc.desc      Verify combination of match method and groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0079";
        console.log(TAG + " start");
        const re79: RegExp = /(\d+)/;
        const result79: RegExpMatchArray | null = "abc123def".match(re79);
        const fullMatch: string = result79?.[0] || "";
        const group1Content: string = result79?.[1] || "";
        const isFullMatchCorrect: boolean = fullMatch === "123";
        const isGroupCorrect: boolean = group1Content === "123";
        const testPassed: boolean = isFullMatchCorrect && isGroupCorrect;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`79.Match method grouping results: overall=${fullMatch}, Group 1 =${group1Content}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8000
     * @tc.name      testGroupingModuleCase0080
     * @tc.desc      Verify the matchAll method with capturing groups in regular expressions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0080";
        console.log(TAG + " start");
        const re80: RegExp = /(\w)/g;
        const matches80 = Array.from("abc".matchAll(re80), m => m[1]);
        const result80: string = matches80.join(",");
        const expected: string = "a,b,c";
        const testPassed: boolean = result80 === expected;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`80. matchAll method grouping results: ${result80}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8100
     * @tc.name      testGroupingModuleCase0081
     * @tc.desc      Verify the split method with capturing groups in regular expressions, which preserves the delimiter in the result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0081";
        console.log(TAG + " start");
        const re81: RegExp = /(\s)/;
        const result81: string[] = "a b c".split(re81);
        const output: string = result81.join("|");
        const expected: string = "a| |b| |c";
        const testPassed: boolean = output === expected;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`81. split method preserves grouping results: ${output}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8200
     * @tc.name      testGroupingModuleCase0082
     * @tc.desc      Verify the lastIndex property of a global regular expression after exec with capturing groups.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0082";
        console.log(TAG + " start");
        const re82: RegExp = /(\w+)/g;
        re82.exec("a b c");
        const result82: number = re82.lastIndex;
        const expected: number = 1;
        const testPassed: boolean = result82 === expected;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`82. lastIndex after grouping matching: ${result82}`);
      });
    /**
     * @tc.number    SUB_BASEDATA_GROUPING_MODULE_TEST_CASE_8300
     * @tc.name      testGroupingModuleCase0083
     * @tc.desc      Verify capturing group behavior when matching an empty string with a zero-or-more quantifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testGroupingModuleCase0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = "testGroupingModuleCase0083";
        console.log(TAG + " start");
        const re83: RegExp = /(a*)/;
        const result83: RegExpExecArray | null = re83.exec("");
        const group1: string = result83?.[1] ?? "undefined";
        const isMatchEmpty: boolean = group1 === "";
        const displayValue: string = isMatchEmpty ? "空字符串" : group1;
        const testPassed: boolean = isMatchEmpty;
        expect(testPassed).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
        console.log(`83. Group match empty string: ${displayValue}`);
      });
  })
}