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

export default function RegularExpressions04Test() {
  describe('RegularExpressions04Test', () => {
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
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_0100
     * @tc.name      test_GlobalMatch_0001
     * @tc.desc      Test global match flag (g) to find all occurrences of 'abc'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalMatch_0001 start');
        let re1 = /abc/g;
        let str1 = "abc123abc456";
        let result1 = str1.match(re1);
        let result = Array.isArray(result1) && result1.join(",") === "abc,abc";
        expect(result).assertTrue();
        console.log('test_GlobalMatch_0001 done');
        done();
        console.log('test_GlobalMatch_0001 end');
      });

    /**
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_EXEC_0200
     * @tc.name      test_GlobalMatch_Exec_0002
     * @tc.desc      Test global match flag (g) with exec() to find all occurrences of digits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_Exec_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalMatch_Exec_0002 start');
        const re2: RegExp = /\d+/g;
        const str2: string = "10 20 30";
        const result2: string[] = [];
        let match2: RegExpExecArray | null;

        while ((match2 = re2.exec(str2)) !== null) {
          result2.push(match2[0]);
        }

        const result: boolean = Array.isArray(result2) && result2.join(",") === "10,20,30";
        expect(result).assertTrue();
        console.log('test_GlobalMatch_Exec_0002 done');
        done();
        console.log('test_GlobalMatch_Exec_0002 end');
      });

    /**
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_TEST_0300
     * @tc.name      test_GlobalMatch_Test_0003
     * @tc.desc      Test global match flag (g) with test() to find occurrences of 'abc'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_Test_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalMatch_Test_0003 start');
        let re3 = /abc/g;
        let str3 = "abcabc";
        let result3 = [re3.test(str3), re3.test(str3), re3.test(str3)];
        let result = result3.join(",") === "true,true,false";
        expect(result).assertTrue();
        console.log('test_GlobalMatch_Test_0003 done');
        done();
        console.log('test_GlobalMatch_Test_0003 end');
      });

    /**
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_COMPARE_0400
     * @tc.name      test_GlobalMatch_Compare_0004
     * @tc.desc      Compare global match flag (g) with non-global match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_Compare_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalMatch_Compare_0004 start');
        let re4 = /abc/;
        let re4g = /abc/g;
        let str4 = "abc123abc";
        let result4 = [
          str4.match(re4)?.length,
          str4.match(re4g)?.length
        ];
        let result = result4.join(",") === "1,2";
        expect(result).assertTrue();
        console.log('test_GlobalMatch_Compare_0004 done');
        done();
        console.log('test_GlobalMatch_Compare_0004 end');
      });

    /**
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_LASTINDEX_0500
     * @tc.name      test_GlobalMatch_LastIndex_0005
     * @tc.desc      Test global match flag (g) effect on lastIndex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_LastIndex_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalMatch_LastIndex_0005 start');
        let re5 = /abc/g;
        let str5 = "abcabc";
        re5.test(str5);
        let result5 = re5.lastIndex;
        let result = result5 === 3;
        expect(result).assertTrue();
        console.log('test_GlobalMatch_LastIndex_0005 done');
        done();
        console.log('test_GlobalMatch_LastIndex_0005 end');
      });

    /**
     * @tc.number    SUB_REGEX_IGNORE_CASE_0600
     * @tc.name      test_IgnoreCase_0006
     * @tc.desc      Test ignore case flag (i) to match case-insensitive strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCase_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCase_0006 start');
        let re6 = /ABC/i;
        let result6 = [
          re6.test("abc"),
          re6.test("Abc"),
          re6.test("ABC")
        ];
        let result = result6.join(",") === "true,true,true";
        expect(result).assertTrue();
        console.log('test_IgnoreCase_0006 done');
        done();
        console.log('test_IgnoreCase_0006 end');
      });

    /**
     * @tc.number    SUB_REGEX_IGNORE_CASE_MATCH_0700
     * @tc.name      test_IgnoreCase_Match_0007
     * @tc.desc      Test ignore case flag (i) with match() to find case-insensitive matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCase_Match_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCase_Match_0007 start');
        let re7 = /java/i;
        let str7 = "JavaScript java JAVA";
        let result7 = str7.match(re7);
        let result = result7?.[0] === "Java";
        expect(result).assertTrue();
        console.log('test_IgnoreCase_Match_0007 done');
        done();
        console.log('test_IgnoreCase_Match_0007 end');
      });

    /**
     * @tc.number    SUB_REGEX_IGNORE_CASE_GLOBAL_0800
     * @tc.name      test_IgnoreCase_Global_0008
     * @tc.desc      Test ignore case flag (i) with global match flag (g) to find all case-insensitive matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCase_Global_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCase_Global_0008 start');
        let re8 = /java/ig;
        let str8 = "JavaScript java JAVA";
        let result8 = str8.match(re8);
        let result = Array.isArray(result8) && result8.join(",") === "Java,java,JAVA";
        expect(result).assertTrue();
        console.log('test_IgnoreCase_Global_0008 done');
        done();
        console.log('test_IgnoreCase_Global_0008 end');
      });

    /**
     * @tc.number    SUB_REGEX_IGNORE_CASE_SPECIAL_CHAR_0900
     * @tc.name      test_IgnoreCase_SpecialChar_0900
     * @tc.desc      Test ignore case flag (i) with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCase_SpecialChar_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCase_SpecialChar_0900 start');
        let re9 = /ä/i;
        let result9 = [
          re9.test("Ä"),
          re9.test("ä")
        ];
        let result = result9.join(",") === "true,true";
        expect(result).assertTrue();
        console.log('test_IgnoreCase_SpecialChar_0900 done');
        done();
        console.log('test_IgnoreCase_SpecialChar_0900 end');
      });

    /**
     * @tc.number    SUB_REGEX_CASE_SENSITIVE_1000
     * @tc.name      test_CaseSensitive_0010
     * @tc.desc      Test without ignore case flag (i) for case-sensitive matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CaseSensitive_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_CaseSensitive_0010 start');
        let re10 = /ABC/;
        let result10 = [
          re10.test("abc"),
          re10.test("ABC")
        ];
        let result = result10.join(",") === "false,true";
        expect(result).assertTrue();
        console.log('test_CaseSensitive_0010 done');
        done();
        console.log('test_CaseSensitive_0010 end');
      });

    /**
     * @tc.number    SUB_REGEX_MULTILINE_1100
     * @tc.name      test_MultilineBasic_0011
     * @tc.desc      Test multiline flag (m) for line-start matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineBasic_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineBasic_0011 start');
        let re11 = /^line/m;
        let str11 = "first line\nline second\nline3";
        let result11 = str11.match(re11)?.[0];
        let result = result11 === "line";
        expect(result).assertTrue();
        console.log('test_MultilineBasic_0011 done');
        done();
        console.log('test_MultilineBasic_0011 end');
      });

    /**
     * @tc.number    SUB_REGEX_MULTILINE_GLOBAL_1200
     * @tc.name      test_MultilineWithGlobal_0012
     * @tc.desc      Test multiline flag (m) combined with global flag (g) for line-start matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineWithGlobal_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineWithGlobal_0012 start');
        let re12 = /^line/mg;
        let str12 = "line1\nline2\nline3";
        let result12 = str12.match(re12);
        let result = Array.isArray(result12) && result12.join(",") === "line,line,line";
        expect(result).assertTrue();
        console.log('test_MultilineWithGlobal_0012 done');
        done();
        console.log('test_MultilineWithGlobal_0012 end');
      });

    /**
     * @tc.number    SUB_REGEX_MULTILINE_DOLLAR_1300
     * @tc.name      test_MultilineWithDollar_0013
     * @tc.desc      Test multiline flag (m) with dollar-end assertion for line-end matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineWithDollar_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineWithDollar_0013 start');
        let re13 = /end$/mg;
        let str13 = "this is the end\nanother end\nthe final ending";
        let result13 = str13.match(re13);
        let result = Array.isArray(result13) && result13.join(",") === "end,end";
        expect(result).assertTrue();
        console.log('test_MultilineWithDollar_0013 done');
        done();
        console.log('test_MultilineWithDollar_0013 end');
      });

    /**
     * @tc.number    SUB_REGEX_MULTILINE_DISABLED_1400
     * @tc.name      test_MultilineDisabled_0014
     * @tc.desc      Test without multiline flag (m) to show no line-start match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineDisabled_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineDisabled_0014 start');
        let re14 = /^line/;
        let str14 = "first line\nline second";
        let result14 = str14.match(re14) ? "匹配" : "不匹配";
        let result = result14 === "不匹配";
        expect(result).assertTrue();
        console.log('test_MultilineDisabled_0014 done');
        done();
        console.log('test_MultilineDisabled_0014 end');
      });

    /**
     * @tc.number    SUB_REGEX_MULTILINE_START_END_1500
     * @tc.name      test_MultilineStartAndEnd_0015
     * @tc.desc      Test multiline flag (m) with both ^ and $ for full-line matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_MultilineStartAndEnd_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        console.log('test_MultilineStartAndEnd_0015 start');
        const re15 = /^start.*end$/mg;
        const str15 = "start1 end1\nstart2 middle end2\nstart3 no";
        const result15 = str15.match(re15);
        const result = result15?.join("; ");

        expect(result).assertEqual(undefined);
        console.log('test_MultilineStartAndEnd_0015 done');
        done();
        console.log('test_MultilineStartAndEnd_0015 end');
      });

    /**
     * @tc.number    SUB_REGEX_UNICODE_1600
     * @tc.name      test_UnicodeFlag_0016
     * @tc.desc      Test Unicode flag (u) for Unicode code-point matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeFlag_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeFlag_0016 start');
        let re16 = /\u{1F600}/u;
        let result16 = re16.test("😀") ? "匹配" : "不匹配";
        let result = result16 === "匹配";
        expect(result).assertTrue();
        console.log('test_UnicodeFlag_0016 done');
        done();
        console.log('test_UnicodeFlag_0016 end');
      });

    /**
     * @tc.number    SUB_REGEX_UNICODE_ESCAPE_1700
     * @tc.name      test_UnicodeEscape_0017
     * @tc.desc      Test Unicode flag (u) with code-point escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeEscape_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeEscape_0017 start');

        const re17 = /\u{61}/u;
        const match = re17.exec("a");

        if (!match) {
          expect(false).assertTrue();
          done();
          return;
        }

        const cp = match[0].codePointAt(0)!;
        const result17 = String.fromCodePoint(cp);

        const result = result17 === 'a';
        expect(result).assertTrue();

        console.log('test_UnicodeEscape_0017 done');
        done();
        console.log('test_UnicodeEscape_0017 end');
      });

    /**
     * @tc.number    SUB_REGEX_UNICODE_QUANTIFIER_1800
     * @tc.name      test_UnicodeQuantifier_0018
     * @tc.desc      Test Unicode flag (u) with quantifiers on emoji and letter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeQuantifier_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeQuantifier_0018 start');
        let re18 = /^.{2}$/u;
        let str18 = "😀a";
        let result18 = re18.test(str18);
        expect(result18).assertTrue();
        console.log('test_UnicodeQuantifier_0018 done');
        done();
        console.log('test_UnicodeQuantifier_0018 end');
      });

    /**
     * @tc.number    SUB_ANI_REGEXP_UNICODE_FLAG_0019
     * @tc.name      test_RegExp_UnicodeFlag_0019
     * @tc.desc      RegExp without u-flag: \u{1F600} should throw "Invalid Unicode escape sequence"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegExp_UnicodeFlag_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegExp_UnicodeFlag_0019 start');

        let thrown = false;
        try {
          const re = new RegExp('\\u{1F600}');
          re.test('😀');
        } catch (e) {
          thrown = true;
        }

        expect(thrown).assertFalse();
        const reU = new RegExp('\\u{1F600}', 'u');
        expect(reU.test('😀')).assertTrue();

        console.log('test_RegExp_UnicodeFlag_0019 done');
        done();
      });

    /**
     * @tc.number    SUB_REGEX_UNICODE_PROPERTY_2000
     * @tc.name      test_UnicodeProperty_0020
     * @tc.desc      Test Unicode flag (u) with Emoji property escape
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeProperty_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeProperty_0020 start');
        let re20 = /\p{Emoji}/u;
        let result20 = re20.test("👍") ? "匹配" : "不匹配";
        let result = result20 === "匹配";
        expect(result).assertTrue();
        console.log('test_UnicodeProperty_0020 done');
        done();
        console.log('test_UnicodeProperty_0020 end');
      });

    /**
     * @tc.number    SUB_REGEX_DOTALL_2100
     * @tc.name      test_DotAllFlag_0021
     * @tc.desc      Test dotAll flag (s) to match newline between a and b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllFlag_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllFlag_0021 start');
        let re21 = /a.b/s;
        let result21 = re21.test("a\nb") ? "匹配" : "不匹配";
        let result = result21 === "匹配";
        expect(result).assertTrue();
        console.log('test_DotAllFlag_0021 done');
        done();
        console.log('test_DotAllFlag_0021 end');
      });

    /**
     * @tc.number    SUB_REGEX_DOTALL_QUANTIFIER_2200
     * @tc.name      test_DotAllQuantifier_0022
     * @tc.desc      Test dotAll flag (s) with greedy dot-plus to span newlines
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllQuantifier_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllQuantifier_0022 start');
        let re22 = /^.+/s;
        let str22 = "line1\nline2\nline3";
        let result22 = str22.match(re22)?.[0].length;
        let result = result22 === 17;
        expect(result).assertTrue();
        console.log('test_DotAllQuantifier_0022 done');
        done();
        console.log('test_DotAllQuantifier_0022 end');
      });

    /**
     * @tc.number    SUB_REGEX_NO_DOTALL_2300
     * @tc.name      test_NoDotAllFlag_0023
     * @tc.desc      Test without dotAll flag (s) to show newline mismatch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_NoDotAllFlag_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_NoDotAllFlag_0023 start');
        let re23 = /a.b/;
        let result23 = re23.test("a\nb") ? "匹配" : "不匹配";
        let result = result23 === "不匹配";
        expect(result).assertTrue();
        console.log('test_NoDotAllFlag_0023 done');
        done();
        console.log('test_NoDotAllFlag_0023 end');
      });

    /**
     * @tc.number    SUB_REGEX_DOTALL_COMBINED_2400
     * @tc.name      test_DotAllCombined_0024
     * @tc.desc      Test dotAll flag (s) combined with global flag (g) for multi-line matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllCombined_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllCombined_0024 start');
        let re24 = /start.*end/gs;
        let str24 = "start\nmiddle\nend\nanother start\nend";
        let result24 = str24.match(re24);
        let result = result24?.join("; ") === "start\nmiddle\nend\nanother start\nend";
        expect(result).assertTrue();
        console.log('test_DotAllCombined_0024 done');
        done();
        console.log('test_DotAllCombined_0024 end');
      });

    /**
     * @tc.number    SUB_REGEX_DOTALL_SPECIAL_2500
     * @tc.name      test_DotAllSpecialChars_0025
     * @tc.desc      Test dotAll flag (s) matching tab and carriage-return between a and s
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllSpecialChars_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllSpecialChars_0025 start');
        let re25 = /a.s/s;
        let result25 = [
          re25.test("a\ts"),
          re25.test("a\rs")
        ];
        let result = result25.join(",") === "true,true";
        expect(result).assertTrue();
        console.log('test_DotAllSpecialChars_0025 done');
        done();
        console.log('test_DotAllSpecialChars_0025 end');
      });

    /**
     * @tc.number    SUB_REGEX_STICKY_BASIC_2600
     * @tc.name      test_StickyBasic_0026
     * @tc.desc      Test sticky flag (y) anchored match from lastIndex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyBasic_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickyBasic_0026 start');
        let re26 = /abc/y;
        let str26 = "xyzabc";
        re26.lastIndex = 3;
        let result26 = re26.test(str26);
        expect(result26).assertTrue();
        console.log('test_StickyBasic_0026 done');
        done();
        console.log('test_StickyBasic_0026 end');
      });

    /**
     * @tc.number    SUB_REGEX_STICKY_LASTINDEX_2700
     * @tc.name      test_StickyLastIndex_0027
     * @tc.desc      Test sticky flag (y) exec from different lastIndex positions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyLastIndex_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickyLastIndex_0027 start');
        let re27 = /\d+/y;
        let str27 = "123abc456";
        re27.lastIndex = 0;
        let result27 = re27.exec(str27)?.[0] ?? "null";
        re27.lastIndex = 6;
        result27 += "," + (re27.exec(str27)?.[0] ?? "null");
        let result = result27 === "123,456";
        expect(result).assertTrue();
        console.log('test_StickyLastIndex_0027 done');
        done();
        console.log('test_StickyLastIndex_0027 end');
      });

    /**
     * @tc.number    SUB_REGEX_STICKY_FAIL_2800
     * @tc.name      test_StickyFail_0028
     * @tc.desc      Test sticky flag (y) failure and lastIndex reset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyFail_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickyFail_0028 start');
        let re28 = /abc/y;
        let str28 = "aabc";
        re28.lastIndex = 1;
        let result28 = re28.test(str28);
        let result = result28 === true && re28.lastIndex === 4;
        expect(result).assertTrue();
        console.log('test_StickyFail_0028 done');
        done();
        console.log('test_StickyFail_0028 end');
      });

    /**
     * @tc.number    SUB_REGEX_STICKY_VS_GLOBAL_2900
     * @tc.name      test_StickyVsGlobal_0029
     * @tc.desc      Compare lastIndex behavior between global (g) and sticky (y) flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyVsGlobal_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickyVsGlobal_0029 start');
        let re29g = /\d+/g;
        let re29y = /\d+/y;
        let str29 = "10 20 30";
        str29.match(re29g);
        let result29 = [re29g.lastIndex];
        re29y.lastIndex = 0;
        str29.match(re29y);
        result29.push(re29y.lastIndex);
        let result = result29.join(",") === "0,2";
        expect(result).assertTrue();
        console.log('test_StickyVsGlobal_0029 done');
        done();
        console.log('test_StickyVsGlobal_0029 end');
      });

    /**
     * @tc.number    SUB_REGEX_STICKY_GLOBAL_COMBINED_3000
     * @tc.name      test_StickyGlobalCombined_0030
     * @tc.desc      Test combined sticky (y) and global (g) flags with manual lastIndex advance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyGlobalCombined_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickyGlobalCombined_0030 start');
        let re30 = /\d+/yg;
        let str30 = "123 456 789";
        let result30: string[] = [];
        re30.lastIndex = 0;
        let match30: RegExpExecArray | null;
        while ((match30 = re30.exec(str30)) !== null) {
          result30.push(match30[0]);
          re30.lastIndex++;
        }
        let result = result30.join(",") === "123,456,789";
        expect(result).assertTrue();
        console.log('test_StickyGlobalCombined_0030 done');
        done();
        console.log('test_StickyGlobalCombined_0030 end');
      });

    /**
     * @tc.number    SUB_REGEX_GI_3100
     * @tc.name      test_GlobalIgnoreCase_0031
     * @tc.desc      Test global plus ignore-case flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_GlobalIgnoreCase_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalIgnoreCase_0031 start');
        const re31 = /java/gi;
        const str31 = 'Java JavaScript JAVA javaScript';
        const result31 = str31.match(re31);
        const ok = result31?.join(',') === 'Java,Java,JAVA,java';
        expect(ok).assertTrue();
        console.log('test_GlobalIgnoreCase_0031 done');
        done();
        console.log('test_GlobalIgnoreCase_0031 end');
      });

    /**
     * @tc.number    SUB_REGEX_GM_3200
     * @tc.name      test_GlobalMultiline_0032
     * @tc.desc      Test global plus multiline flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_GlobalMultiline_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalMultiline_0032 start');
        const re32 = /^item/mg;
        const str32 = 'item1\nitem2\nnot an item\nitem3';
        const result32 = str32.match(re32);
        const ok = result32?.join(',') === 'item,item,item';
        expect(ok).assertTrue();
        console.log('test_GlobalMultiline_0032 done');
        done();
        console.log('test_GlobalMultiline_0032 end');
      });

    /**
     * @tc.number    SUB_REGEX_GU_3300
     * @tc.name      test_GlobalUnicode_0033
     * @tc.desc      Test global plus Unicode flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_GlobalUnicode_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalUnicode_0033 start');
        const re33 = /\p{Emoji}/gu;
        const str33 = '😀👍😊😎';
        const result33 = str33.match(re33)?.length;
        expect(result33 === 4).assertTrue();
        console.log('test_GlobalUnicode_0033 done');
        done();
        console.log('test_GlobalUnicode_0033 end');
      });

    /**
     * @tc.number    SUB_REGEX_GS_3400
     * @tc.name      test_GlobalDotAll_0034
     * @tc.desc      Test global plus dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalDotAll_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalDotAll_0034 start');
        let re34 = /\/\*.*?\*\//gs;
        let str34 = "/* 注释1 \n 多行 */ 代码 /* 注释2 */";
        let result34 = str34.match(re34);
        let result = result34?.join("; ") === "/* 注释1 \n 多行 */; /* 注释2 */";
        expect(result).assertTrue();
        console.log('test_GlobalDotAll_0034 done');
        done();
        console.log('test_GlobalDotAll_0034 end');
      });

    /**
     * @tc.number    SUB_REGEX_IM_3500
     * @tc.name      test_IgnoreCaseMultiline_0035
     * @tc.desc      Test ignore-case plus multiline flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_IgnoreCaseMultiline_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseMultiline_0035 start');
        const re35 = /^start/im;
        const str35 = 'not start\nStart here\nanother line';
        const result35 = str35.match(re35)?.[0];
        expect(result35 === 'Start').assertTrue();
        console.log('test_IgnoreCaseMultiline_0035 done');
        done();
        console.log('test_IgnoreCaseMultiline_0035 end');
      });

    /**
     * @tc.number    SUB_REGEX_IU_3600
     * @tc.name      test_IgnoreCaseUnicode_0036
     * @tc.desc      Test ignore-case plus Unicode flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_IgnoreCaseUnicode_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseUnicode_0036 start');
        const re36 = /\p{Ll}/iu;
        const str36 = 'ÄÖÜ';
        const result36 = re36.test(str36) ? '匹配' : '不匹配';
        expect(result36 === '匹配').assertTrue();
        console.log('test_IgnoreCaseUnicode_0036 done');
        done();
        console.log('test_IgnoreCaseUnicode_0036 end');
      });

    /**
     * @tc.number    SUB_REGEX_IS_3700
     * @tc.name      test_IgnoreCaseDotAll_0037
     * @tc.desc      Test ignore-case plus dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_IgnoreCaseDotAll_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseDotAll_0037 start');
        const re37 = /a.b/is;
        const str37 = 'A\nB';
        const result37 = re37.test(str37) ? '匹配' : '不匹配';
        expect(result37 === '匹配').assertTrue();
        console.log('test_IgnoreCaseDotAll_0037 done');
        done();
        console.log('test_IgnoreCaseDotAll_0037 end');
      });

    /**
     * @tc.number    SUB_REGEX_MU_3800
     * @tc.name      test_MultilineUnicode_0038
     * @tc.desc      Test multiline plus Unicode flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_MultilineUnicode_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineUnicode_0038 start');
        const re38 = /^\p{Script=Greek}/mu;
        const str38 = 'αβγ\nΔΕΖ';
        const result38 = str38.match(re38);
        const ok = result38?.join(',') === 'α';
        expect(ok).assertTrue();
        console.log('test_MultilineUnicode_0038 done');
        done();
        console.log('test_MultilineUnicode_0038 end');
      });

    /**
     * @tc.number    SUB_REGEX_MS_3900
     * @tc.name      test_MultilineDotAll_0039
     * @tc.desc      Test multiline plus dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_MultilineDotAll_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineDotAll_0039 start');
        const re39 = /^start.*end$/ms;
        const str39 = 'start\nmiddle\nend';
        const result39 = re39.test(str39) ? '匹配' : '不匹配';
        expect(result39 === '匹配').assertTrue();
        console.log('test_MultilineDotAll_0039 done');
        done();
        console.log('test_MultilineDotAll_0039 end');
      });

    /**
     * @tc.number    SUB_REGEX_US_4000
     * @tc.name      test_UnicodeDotAll_0040
     * @tc.desc      Test Unicode plus dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_UnicodeDotAll_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeDotAll_0040 start');
        const re40 = /^.\n.$/us;
        const str40 = '😀\n👍';
        const result40 = re40.test(str40) ? '匹配' : '不匹配';
        expect(result40 === '匹配').assertTrue();
        console.log('test_UnicodeDotAll_0040 done');
        done();
        console.log('test_UnicodeDotAll_0040 end');
      });

    /**
     * @tc.number    SUB_REGEX_GIM_4100
     * @tc.name      test_GlobalIgnoreCaseMultiline_0041
     * @tc.desc      Test global, ignore-case and multiline flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalIgnoreCaseMultiline_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalIgnoreCaseMultiline_0041 start');
        let re41 = /^java/igm;
        let str41 = "java\nJavaScript\nJAVA\nnot java";
        let result41 = str41.match(re41);
        let result = result41?.join(",") === "java,Java,JAVA";
        expect(result).assertTrue();
        console.log('test_GlobalIgnoreCaseMultiline_0041 done');
        done();
        console.log('test_GlobalIgnoreCaseMultiline_0041 end');
      });

    /**
     * @tc.number    SUB_REGEX_GMU_4200
     * @tc.name      test_GlobalMultilineUnicode_0042
     * @tc.desc      Test global, multiline and Unicode flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMultilineUnicode_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalMultilineUnicode_0042 start');
        let re42 = /^\p{Emoji}/mgu;
        let str42 = "😀 笑脸\n👍 拇指\n😊 微笑";
        let result42 = str42.match(re42);
        let result = result42?.join(",") === "😀,👍,😊";
        expect(result).assertTrue();
        console.log('test_GlobalMultilineUnicode_0042 done');
        done();
        console.log('test_GlobalMultilineUnicode_0042 end');
      });

    /**
     * @tc.number    SUB_REGEX_IMS_4300
     * @tc.name      test_IgnoreCaseMultilineDotAll_0043
     * @tc.desc      Test ignore-case, multiline and dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseMultilineDotAll_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseMultilineDotAll_0043 start');
        let re43 = /^start.*end$/ims;
        let str43 = "Start\nmiddle\nEND";
        let result43 = re43.test(str43) ? "匹配" : "不匹配";
        expect(result43 === "匹配").assertTrue();
        console.log('test_IgnoreCaseMultilineDotAll_0043 done');
        done();
        console.log('test_IgnoreCaseMultilineDotAll_0043 end');
      });

    /**
     * @tc.number    SUB_REGEX_GUS_4400
     * @tc.name      test_GlobalUnicodeDotAll_0044
     * @tc.desc      Test global, Unicode and dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalUnicodeDotAll_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalUnicodeDotAll_0044 start');
        let re44 = /\p{Emoji}.*?\p{Emoji}/gus;
        let str44 = "😀 中间\n有内容 👍 更多\n内容 😊";
        let result44 = str44.match(re44);
        let result = result44?.join("; ") === "😀 中间\n有内容 👍";
        expect(result).assertTrue();
        console.log('test_GlobalUnicodeDotAll_0044 done');
        done();
        console.log('test_GlobalUnicodeDotAll_0044 end');
      });

    /**
     * @tc.number    SUB_REGEX_GIMU_4500
     * @tc.name      test_GlobalIgnoreCaseMultilineUnicode_0045
     * @tc.desc      Test global, ignore-case, multiline and Unicode flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalIgnoreCaseMultilineUnicode_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalIgnoreCaseMultilineUnicode_0045 start');
        let re45 = /^\p{L}/igmu;
        let str45 = "apple\nBanana\nÇiçek\nДом";
        let result45 = str45.match(re45);
        let result = result45?.join(",") === "a,B,Ç,Д";
        expect(result).assertTrue();
        console.log('test_GlobalIgnoreCaseMultilineUnicode_0045 done');
        done();
        console.log('test_GlobalIgnoreCaseMultilineUnicode_0045 end');
      });

    /**
     * @tc.number    SUB_REGEX_GIMUS_4600
     * @tc.name      test_GlobalIgnoreCaseMultilineUnicodeDotAll_0046
     * @tc.desc      Test all five flags: global, ignore-case, multiline, Unicode, dotAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalIgnoreCaseMultilineUnicodeDotAll_0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalIgnoreCaseMultilineUnicodeDotAll_0046 start');
        let re46 = /^\p{L}.*?end$/igmus;
        let str46 = "Apple\n多行\nEnd\nBanana\n另一段\nEND";
        let result46 = str46.match(re46);
        let result = result46?.join("; ") === "Apple\n多行\nEnd; Banana\n另一段\nEND";
        expect(result).assertTrue();
        console.log('test_GlobalIgnoreCaseMultilineUnicodeDotAll_0046 done');
        done();
        console.log('test_GlobalIgnoreCaseMultilineUnicodeDotAll_0046 end');
      });

    /**
     * @tc.number    SUB_REGEX_G_REPLACE_4700
     * @tc.name      test_GlobalReplace_0047
     * @tc.desc      Test global flag (g) with String.prototype.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalReplace_0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalReplace_0047 start');
        let re47 = /cat/g;
        let str47 = "cat dog cat bird";
        let result47 = str47.replace(re47, "fox");
        let result = result47 === "fox dog fox bird";
        expect(result).assertTrue();
        console.log('test_GlobalReplace_0047 done');
        done();
        console.log('test_GlobalReplace_0047 end');
      });

    /**
     * @tc.number    SUB_REGEX_I_REPLACE_4800
     * @tc.name      test_IgnoreCaseReplace_0048
     * @tc.desc      Test ignore-case flag (i) with String.prototype.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseReplace_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseReplace_0048 start');
        let re48 = /java/i;
        let str48 = "JavaScript is better than java";
        let result48 = str48.replace(re48, "TypeScript");
        let result = result48 === "TypeScriptScript is better than java";
        expect(result).assertTrue();
        console.log('test_IgnoreCaseReplace_0048 done');
        done();
        console.log('test_IgnoreCaseReplace_0048 end');
      });

    /**
     * @tc.number    SUB_REGEX_M_REPLACE_4900
     * @tc.name      test_MultilineReplace_0049
     * @tc.desc      Test multiline flag (m) with String.prototype.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineReplace_0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineReplace_0049 start');
        let re49 = /^/mg;
        let str49 = "line1\nline2\nline3";
        let result49 = str49.replace(re49, "-> ");
        let result = result49 === "-> line1\n-> line2\n-> line3";
        expect(result).assertTrue();
        console.log('test_MultilineReplace_0049 done');
        done();
        console.log('test_MultilineReplace_0049 end');
      });

    /**
     * @tc.number    SUB_REGEX_U_REPLACE_5000
     * @tc.name      test_UnicodeReplace_0050
     * @tc.desc      Test Unicode flag (u) with String.prototype.replace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeReplace_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeReplace_0050 start');
        let re50 = /\p{Emoji}/gu;
        let str50 = "Hello 😀 World 👍";
        let result50 = str50.replace(re50, "[emoji]");
        let result = result50 === "Hello [emoji] World [emoji]";
        expect(result).assertTrue();
        console.log('test_UnicodeReplace_0050 done');
        done();
        console.log('test_UnicodeReplace_0050 end');
      });

    /**
     * @tc.number    SUB_REGEX_DOTALL_REPLACE_5100
     * @tc.name      test_DotAllReplace_0051
     * @tc.desc      Test dotAll flag (s) with replace for multiline paragraph wrapping
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllReplace_0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllReplace_0051 start');
        let re51 = /<p>.*?<\/p>/gs;
        let str51 = "<p>第一段\n多行文本</p>\n<p>第二段</p>";
        let result51 = str51.replace(re51, "<div>$&</div>");
        let expected = "<div><p>第一段\n多行文本</p></div>\n<div><p>第二段</p></div>";
        let result = result51 === expected;
        expect(result).assertTrue();
        console.log('test_DotAllReplace_0051 done');
        done();
        console.log('test_DotAllReplace_0051 end');
      });

    /**
     * @tc.number    SUB_REGEX_Y_REPLACE_5200
     * @tc.name      test_StickyReplace_0052
     * @tc.desc      Test sticky flag (y) with replace from lastIndex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyReplace_0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickyReplace_0052 start');
        let re52 = /\d+/y;
        let str52 = "123abc456";
        re52.lastIndex = 0;
        let result52 = str52.replace(re52, "XXX");
        let result = result52 === "XXXabc456";
        expect(result).assertTrue();
        console.log('test_StickyReplace_0052 done');
        done();
        console.log('test_StickyReplace_0052 end');
      });

    /**
     * @tc.number    SUB_REGEX_G_SPLIT_5300
     * @tc.name      test_GlobalSplit_0053
     * @tc.desc      Test global flag (g) with String.prototype.split
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalSplit_0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalSplit_0053 start');
        let re53 = /\s+/g;
        let str53 = "a   b  c d";
        let result53 = str53.split(re53);
        let result = result53.join("|") === "a|b|c|d";
        expect(result).assertTrue();
        console.log('test_GlobalSplit_0053 done');
        done();
        console.log('test_GlobalSplit_0053 end');
      });

    /**
     * @tc.number    SUB_REGEX_I_SPLIT_5400
     * @tc.name      test_IgnoreCaseSplit_0054
     * @tc.desc      Test ignore-case flag (i) with String.prototype.split
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseSplit_0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseSplit_0054 start');
        let re54 = /java/i;
        let str54 = "JavaScriptjavaTypeScript";
        let result54 = str54.split(re54);
        let result = result54.join("|") === "|Script|TypeScript";
        expect(result).assertTrue();
        console.log('test_IgnoreCaseSplit_0054 done');
        done();
        console.log('test_IgnoreCaseSplit_0054 end');
      });

    /**
     * @tc.number    SUB_REGEX_M_SPLIT_5500
     * @tc.name      test_MultilineSplit_0055
     * @tc.desc      Test multiline flag (m) with String.prototype.split
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineSplit_0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineSplit_0055 start');
        let re55 = /^end/m;
        let str55 = "start\nend\nanother start\nend";
        let result55 = str55.split(re55);
        let result = result55.length === 3;
        expect(result).assertTrue();
        console.log('test_MultilineSplit_0055 done');
        done();
        console.log('test_MultilineSplit_0055 end');
      });

    /**
     * @tc.number    SUB_REGEX_U_SPLIT_5600
     * @tc.name      test_UnicodeSplit_0056
     * @tc.desc      Test Unicode flag (u) with String.prototype.split
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeSplit_0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeSplit_0056 start');
        let re56 = /\p{P}/u;
        let str56 = "Hello,世界！How are you?";
        let result56 = str56.split(re56);
        let result = result56.join("|") === "Hello|世界|How are you|";
        expect(result).assertTrue();
        console.log('test_UnicodeSplit_0056 done');
        done();
        console.log('test_UnicodeSplit_0056 end');
      });

    /**
     * @tc.number    SUB_REGEX_S_SPLIT_5700
     * @tc.name      test_DotAllSplit_0057
     * @tc.desc      Test dotAll flag (s) with String.prototype.split
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllSplit_0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllSplit_0057 start');
        let re57 = /\.\./s;
        let str57 = "a..b\n..c..d";
        let result57 = str57.split(re57);
        let result = result57.join("|") === "a|b\n|c|d";
        expect(result).assertTrue();
        console.log('test_DotAllSplit_0057 done');
        done();
        console.log('test_DotAllSplit_0057 end');
      });

    /**
     * @tc.number    SUB_REGEX_Y_SPLIT_5800
     * @tc.name      test_StickySplit_0058
     * @tc.desc      Test sticky flag (y) with String.prototype.split
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickySplit_0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickySplit_0058 start');
        let re58 = /,/y;
        let str58 = "a,b,c,d";
        let result58 = str58.split(re58);
        let result = result58.join("|") === "a|b|c|d";
        expect(result).assertTrue();
        console.log('test_StickySplit_0058 done');
        done();
        console.log('test_StickySplit_0058 end');
      });

    /**
     * @tc.number    SUB_REGEX_G_MATCHALL_5900
     * @tc.name      test_GlobalMatchAll_0059
     * @tc.desc      Test global flag (g) with String.prototype.matchAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatchAll_0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalMatchAll_0059 start');
        let re59 = /\d+/g;
        let str59 = "10 20 30";
        let result59 = Array.from(str59.matchAll(re59), m => m[0]);
        let result = result59.join(",") === "10,20,30";
        expect(result).assertTrue();
        console.log('test_GlobalMatchAll_0059 done');
        done();
        console.log('test_GlobalMatchAll_0059 end');
      });

    /**
     * @tc.number    SUB_REGEX_I_MATCHALL_6000
     * @tc.name      test_IgnoreCaseMatchAll_0060
     * @tc.desc      Test ignore-case flag (i) with String.prototype.matchAll
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseMatchAll_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseMatchAll_0060 start');
        let re60 = /java/ig;
        let str60 = "Java java JAVA";
        let result60 = Array.from(str60.matchAll(re60), m => m[0]);
        let result = result60.join(",") === "Java,java,JAVA";
        expect(result).assertTrue();
        console.log('test_IgnoreCaseMatchAll_0060 done');
        done();
        console.log('test_IgnoreCaseMatchAll_0060 end');
      });

    /**
     * @tc.number    SUB_REGEX_G_EMPTY_6100
     * @tc.name      test_GlobalEmpty_0061
     * @tc.desc      Test global flag (g) boundary case with empty string pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalEmpty_0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalEmpty_0061 start');
        let re61 = /(?:)/g;
        let str61 = "abc";
        let result61 = str61.match(re61)?.length;
        let result = result61 === 4;
        expect(result).assertTrue();
        console.log('test_GlobalEmpty_0061 done');
        done();
        console.log('test_GlobalEmpty_0061 end');
      });

    /**
     * @tc.number    SUB_REGEX_G_CONSECUTIVE_6200
     * @tc.name      test_GlobalConsecutive_0062
     * @tc.desc      Test global flag (g) boundary case with consecutive matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalConsecutive_0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalConsecutive_0062 start');
        let re62 = /aa/g;
        let str62 = "aaaa";
        let result62 = str62.match(re62);
        let result = result62?.join(",") === "aa,aa";
        expect(result).assertTrue();
        console.log('test_GlobalConsecutive_0062 done');
        done();
        console.log('test_GlobalConsecutive_0062 end');
      });

    /**
     * @tc.number    SUB_REGEX_I_SPECIAL_6300
     * @tc.name      test_IgnoreCaseSpecial_0063
     * @tc.desc      Test ignore-case flag (i) boundary case with special character ß
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseSpecial_0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseSpecial_0063 start');
        let re63 = /ß/i;
        let result63 = re63.test("SS") ? "匹配" : "不匹配";
        let result = result63 === "不匹配";
        expect(result).assertTrue();
        console.log('test_IgnoreCaseSpecial_0063 done');
        done();
        console.log('test_IgnoreCaseSpecial_0063 end');
      });

    /**
     * @tc.number    SUB_REGEX_I_UNICODE_6400
     * @tc.name      test_IgnoreCaseUnicode_0064
     * @tc.desc      Test ignore-case flag (i) boundary case with Greek Sigma variants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseUnicode_0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseUnicode_0064 start');
        let re64 = /σ/i;
        let result64 = [
          re64.test("Σ"),
          re64.test("ς")
        ].join(",");
        let result = result64 === "true,true";
        expect(result).assertTrue();
        console.log('test_IgnoreCaseUnicode_0064 done');
        done();
        console.log('test_IgnoreCaseUnicode_0064 end');
      });

    /**
     * @tc.number    SUB_REGEX_M_EMPTY_6500
     * @tc.name      test_MultilineEmpty_0065
     * @tc.desc      Test multiline flag (m) boundary case with empty lines
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineEmpty_0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineEmpty_0065 start');
        let re65 = /^$/mg;
        let str65 = "line1\n\nline2\n\nline3";
        let result65 = str65.match(re65)?.length;
        let result = result65 === 2;
        expect(result).assertTrue();
        console.log('test_MultilineEmpty_0065 done');
        done();
        console.log('test_MultilineEmpty_0065 end');
      });

    /**
     * @tc.number    SUB_REGEX_M_SINGLE_6600
     * @tc.name      test_MultilineSingle_0066
     * @tc.desc      Test multiline flag (m) boundary case with single line
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineSingle_0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineSingle_0066 start');
        let re66 = /^start.*end$/m;
        let str66 = "start middle end";
        let result66 = re66.test(str66) ? "匹配" : "不匹配";
        let result = result66 === "匹配";
        expect(result).assertTrue();
        console.log('test_MultilineSingle_0066 done');
        done();
        console.log('test_MultilineSingle_0066 end');
      });

    /**
     * @tc.number    SUB_REGEX_U_SURROGATE_6700
     * @tc.name      test_UnicodeSurrogate_0067
     * @tc.desc      Test Unicode flag (u) boundary case with emoji surrogate pair
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeSurrogate_0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeSurrogate_0067 start');
        let re67 = /^.$/u;
        let str67 = "😀";
        let result67 = re67.test(str67) ? "匹配" : "不匹配";
        let result = result67 === "匹配";
        expect(result).assertTrue();
        console.log('test_UnicodeSurrogate_0067 done');
        done();
        console.log('test_UnicodeSurrogate_0067 end');
      });

    /**
     * @tc.number    SUB_REGEX_U_INVALID_6800
     * @tc.name      test_UnicodeInvalid_0068
     * @tc.desc      Test Unicode flag (u) boundary case with invalid Unicode surrogate
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeInvalid_0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeInvalid_0068 start');
        let re68 = /./u;
        let str68 = "\uD800";
        let result68 = re68.test(str68) ? "匹配" : "不匹配";
        let result = result68 === "匹配";
        expect(result).assertTrue();
        console.log('test_UnicodeInvalid_0068 done');
        done();
        console.log('test_UnicodeInvalid_0068 end');
      });

    /**
     * @tc.number    SUB_REGEX_S_NEWLINES_6900
     * @tc.name      test_DotAllNewlines_0069
     * @tc.desc      Test dotAll flag (s) boundary case with various newline characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllNewlines_0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllNewlines_0069 start');
        let re69 = /a.b/s;
        let result69 = [
          re69.test("a\nb"),
          re69.test("a\r\nb"),
          re69.test("a\rb")
        ].join(",");
        let result = result69 === "true,false,true";
        expect(result).assertTrue();
        console.log('test_DotAllNewlines_0069 done');
        done();
        console.log('test_DotAllNewlines_0069 end');
      });

    /**
     * @tc.number    SUB_REGEX_S_CONTROL_7000
     * @tc.name      test_DotAllControl_0070
     * @tc.desc      Test dotAll flag (s) boundary case with non-newline control characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllControl_0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllControl_0070 start');
        let re70 = /a.b/s;
        let result70 = [
          re70.test("a\0b"),
          re70.test("a\tb")
        ].join(",");
        let result = result70 === "true,true";
        expect(result).assertTrue();
        console.log('test_DotAllControl_0070 done');
        done();
        console.log('test_DotAllControl_0070 end');
      });

    /**
     * @tc.number    SUB_REGEX_Y_LASTINDEX_OVER_7100
     * @tc.name      test_Y_LastIndexOver_0071
     * @tc.desc      Test sticky flag (y) when lastIndex is out of string bounds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Y_LastIndexOver_0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Y_LastIndexOver_0071 start');
        let re71 = /abc/y;
        let str71 = "abc";
        re71.lastIndex = 5;
        let result71 = re71.test(str71);
        let result = result71 === false;
        expect(result).assertTrue();
        console.log('test_Y_LastIndexOver_0071 done');
        done();
        console.log('test_Y_LastIndexOver_0071 end');
      });

    /**
     * @tc.number    SUB_REGEX_Y_ZERO_LEN_7200
     * @tc.name      test_Y_ZeroLength_0072
     * @tc.desc      Test sticky flag (y) boundary case with zero-length match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Y_ZeroLength_0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_Y_ZeroLength_0072 start');
        let re72 = /()/y;
        let str72 = "abc";
        re72.lastIndex = 1;
        let result72 = re72.exec(str72)?.index;
        let result = result72 === 1;
        expect(result).assertTrue();
        console.log('test_Y_ZeroLength_0072 done');
        done();
        console.log('test_Y_ZeroLength_0072 end');
      });

    /**
     * @tc.number    SUB_REGEX_G_SPECIAL_7300
     * @tc.name      test_GlobalSpecial_0073
     * @tc.desc      Test global flag (g) with special start-anchor regex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalSpecial_0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalSpecial_0073 start');
        let re73 = /^/g;
        let str73 = "test";
        let result73 = str73.match(re73)?.length;
        let result = result73 === 1;
        expect(result).assertTrue();
        console.log('test_GlobalSpecial_0073 done');
        done();
        console.log('test_GlobalSpecial_0073 end');
      });

    /**
     * @tc.number    SUB_REGEX_I_DIGIT_7400
     * @tc.name      test_IgnoreCaseDigit_0074
     * @tc.desc      Test ignore-case flag (i) boundary case with numeric pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseDigit_0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseDigit_0074 start');
        let re74 = /123/i;
        let result74 = re74.test("123") && re74.test("123") ? "一致" : "不一致";
        let result = result74 === "一致";
        expect(result).assertTrue();
        console.log('test_IgnoreCaseDigit_0074 done');
        done();
        console.log('test_IgnoreCaseDigit_0074 end');
      });

    /**
     * @tc.number    SUB_REGEX_M_NO_NEWLINE_7500
     * @tc.name      test_MultilineNoNewline_0075
     * @tc.desc      Test multiline flag (m) boundary case without newline characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineNoNewline_0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineNoNewline_0075 start');
        let re75 = /^line1.*line2$/m;
        let str75 = "line1 line2";
        let result75 = re75.test(str75) ? "匹配" : "不匹配";
        let result = result75 === "匹配";
        expect(result).assertTrue();
        console.log('test_MultilineNoNewline_0075 done');
        done();
        console.log('test_MultilineNoNewline_0075 end');
      });

    /**
     * @tc.number    SUB_REGEX_U_NON_UNICODE_7600
     * @tc.name      test_UnicodeNonUnicode_0076
     * @tc.desc      Test Unicode flag (u) boundary case with non-Unicode word pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeNonUnicode_0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeNonUnicode_0076 start');
        let re76 = /\w/u;
        let str76 = "aäα";
        let result76 = str76.match(re76)?.length;
        let result = result76 === 1;
        expect(result).assertTrue();
        console.log('test_UnicodeNonUnicode_0076 done');
        done();
        console.log('test_UnicodeNonUnicode_0076 end');
      });

    /**
     * @tc.number    SUB_REGEX_S_NON_DOT_7700
     * @tc.name      test_DotAllNonDot_0077
     * @tc.desc      Test dotAll flag (s) boundary case with non-dot pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllNonDot_0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllNonDot_0077 start');
        let re77 = /abc/s;
        let result77 = re77.test("abc") ? "匹配" : "不匹配";
        let result = result77 === "匹配";
        expect(result).assertTrue();
        console.log('test_DotAllNonDot_0077 done');
        done();
        console.log('test_DotAllNonDot_0077 end');
      });

    /**
     * @tc.number    SUB_REGEX_Y_NO_LASTINDEX_7800
     * @tc.name      test_StickyNoLastIndex_0078
     * @tc.desc      Test sticky flag (y) boundary case without setting lastIndex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyNoLastIndex_0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickyNoLastIndex_0078 start');
        let re78 = /abc/y;
        let str78 = "abc";
        let result78 = re78.test(str78) ? "匹配" : "不匹配";
        let result = result78 === "匹配";
        expect(result).assertTrue();
        console.log('test_StickyNoLastIndex_0078 done');
        done();
        console.log('test_StickyNoLastIndex_0078 end');
      });

    /**
     * @tc.number    SUB_REGEX_GY_COMBINED_7900
     * @tc.name      test_GlobalStickyCombined_0079
     * @tc.desc      Test combined global and sticky flags (g+y) boundary case
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalStickyCombined_0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalStickyCombined_0079 start');
        let re79 = /a/gy;
        let str79 = "aaabaaa";
        let result79 = str79.match(re79)?.length;
        let result = result79 === 3;
        expect(result).assertTrue();
        console.log('test_GlobalStickyCombined_0079 done');
        done();
        console.log('test_GlobalStickyCombined_0079 end');
      });

    /**
     * @tc.number    SUB_REGEX_DUP_FLAG_8000
     * @tc.name      test_DuplicateFlag_0080
     * @tc.desc      Test duplicate flag error handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DuplicateFlag_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_DuplicateFlag_0080 start");
        let caught = false;
        try {
          new RegExp('abc', 'gg');
        } catch (e) {
          caught = /invalid.*flags/i.test(e.message);
        }

        expect(caught).assertTrue();
        console.log('test_DuplicateFlag_0080 done');
        done();
        console.log('test_DuplicateFlag_0080 end');
      });

    /**
     * @tc.number    SUB_REGEX_DYNAMIC_FLAGS_8100
     * @tc.name      test_DynamicFlags_0081
     * @tc.desc      Test creating regex with dynamic pattern and flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DynamicFlags_0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DynamicFlags_0081 start');
        let pattern81 = "java";
        let flags81 = "gi";
        let re81 = new RegExp(pattern81, flags81);
        let str81 = "Java JavaScript JAVA";
        let result81 = str81.match(re81);
        let result = result81?.join(",") === "Java,Java,JAVA";
        expect(result).assertTrue();
        console.log('test_DynamicFlags_0081 done');
        done();
        console.log('test_DynamicFlags_0081 end');
      });

    /**
     * @tc.number    SUB_REGEX_FLAGS_PROP_8200
     * @tc.name      test_FlagsProperty_0082
     * @tc.desc      Test reading flags property of a regex with all flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FlagsProperty_0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_FlagsProperty_0082 start');
        let re82 = /abc/gimsuy;
        let result82 = re82.flags;
        let result = result82 === "gimsuy";
        expect(result).assertTrue();
        console.log('test_FlagsProperty_0082 done');
        done();
        console.log('test_FlagsProperty_0082 end');
      });

    /**
     * @tc.number    SUB_REGEX_G_LASTINDEX_RESET_8300
     * @tc.name      test_GlobalLastIndexReset_0083
     * @tc.desc      Test global flag (g) with manual lastIndex reset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalLastIndexReset_0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalLastIndexReset_0083 start');
        let re83 = /abc/g;
        let str83 = "abc123abc";
        re83.exec(str83);
        re83.lastIndex = 0;
        let result83 = re83.exec(str83)?.[0];
        let result = result83 === "abc";
        expect(result).assertTrue();
        console.log('test_GlobalLastIndexReset_0083 done');
        done();
        console.log('test_GlobalLastIndexReset_0083 end');
      });

    /**
     * @tc.number    SUB_REGEX_I_UNICODE_CASE_FOLD_8400
     * @tc.name      test_IgnoreCaseUnicodeCaseFold_0084
     * @tc.desc      Test ignore-case flag (i) with Unicode case folding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseUnicodeCaseFold_0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseUnicodeCaseFold_0084 start');
        let re84 = /\p{L}/iu;
        let str84 = "Σ";
        let result84 = str84.match(re84)?.[0];
        let result = result84 === "Σ";
        expect(result).assertTrue();
        console.log('test_IgnoreCaseUnicodeCaseFold_0084 done');
        done();
        console.log('test_IgnoreCaseUnicodeCaseFold_0084 end');
      });

    /**
     * @tc.number    SUB_REGEX_M_CARET_MIDDLE_8500
     * @tc.name      test_MultilineCaretMiddle_0085
     * @tc.desc      Test multiline flag (m) with ^ matching in middle of string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineCaretMiddle_0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineCaretMiddle_0085 start');
        let re85 = /^second/m;
        let str85 = "first\nsecond\nthird";
        let result85 = str85.search(re85);
        let result = result85 === 6;
        expect(result).assertTrue();
        console.log('test_MultilineCaretMiddle_0085 done');
        done();
        console.log('test_MultilineCaretMiddle_0085 end');
      });

    /**
     * @tc.number    SUB_REGEX_U_UNICODE_PROP_8600
     * @tc.name      test_UnicodeProperty_0086
     * @tc.desc      Test Unicode flag (u) with Unicode property class for numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeProperty_0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeProperty_0086 start');
        let re86 = /\p{Number}/gu;
        let str86 = "123 ¼ ½ ¾";
        let result86 = str86.match(re86);
        let result = result86?.join(",") === "1,2,3,¼,½,¾";
        expect(result).assertTrue();
        console.log('test_UnicodeProperty_0086 done');
        done();
        console.log('test_UnicodeProperty_0086 end');
      });

    /**
     * @tc.number    SUB_REGEX_S_EXPLICIT_NEWLINE_8700
     * @tc.name      test_DotAllExplicitNewline_0087
     * @tc.desc      Test dotAll flag (s) with explicit newline in pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllExplicitNewline_0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllExplicitNewline_0087 start');
        let re87 = /a\nb/s;
        let str87 = "a\nb";
        let result87 = re87.test(str87) ? "匹配" : "不匹配";
        let result = result87 === "匹配";
        expect(result).assertTrue();
        console.log('test_DotAllExplicitNewline_0087 done');
        done();
        console.log('test_DotAllExplicitNewline_0087 end');
      });

    /**
     * @tc.number    SUB_REGEX_Y_QUANTIFIER_8800
     * @tc.name      test_StickyQuantifier_0088
     * @tc.desc      Test sticky flag (y) with quantifier for digit matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyQuantifier_0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickyQuantifier_0088 start');
        let re88 = /\d+/y;
        let str88 = "1234abc";
        re88.lastIndex = 0;
        let result88 = re88.exec(str88)?.[0];
        let result = result88 === "1234";
        expect(result).assertTrue();
        console.log('test_StickyQuantifier_0088 done');
        done();
        console.log('test_StickyQuantifier_0088 end');
      });

    /**
     * @tc.number    SUB_REGEX_G_REUSE_8900
     * @tc.name      test_GlobalReuse_0089
     * @tc.desc      Test global flag (g) with regex object reuse across strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalReuse_0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalReuse_0089 start');
        let re89 = /test/g;
        let str89a = "test1 test2";
        let str89b = "test3 test4";
        let result89 = [
          str89a.match(re89)?.join(","),
          str89b.match(re89)?.join(",")
        ];
        let result = result89.join("; ") === "test,test; test,test";
        expect(result).assertTrue();
        console.log('test_GlobalReuse_0089 done');
        done();
        console.log('test_GlobalReuse_0089 end');
      });

    /**
     * @tc.number    SUB_REGEX_I_REUSE_9000
     * @tc.name      test_IgnoreCaseReuse_0090
     * @tc.desc      Test ignore-case flag (i) with regex object reuse across strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseReuse_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseReuse_0090 start');
        let re90 = /java/i;
        let str90a = "JavaScript";
        let str90b = "javaprogramming";
        let result90 = [
          str90a.match(re90)?.[0],
          str90b.match(re90)?.[0]
        ];
        let result = result90.join(", ") === "Java, java";
        expect(result).assertTrue();
        console.log('test_IgnoreCaseReuse_0090 done');
        done();
        console.log('test_IgnoreCaseReuse_0090 end');
      });
  })
}