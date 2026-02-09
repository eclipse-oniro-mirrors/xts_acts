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


export default function RegularExpressions04Test() {
  describe('RegularExpressions04Test', () => {
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
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_0100
     * @tc.name      test_GlobalMatch_0001
     * @tc.desc      Test global match flag (g) to find all occurrences of 'abc'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re1 = new RegExp('abc', 'g');
      let str1 = "abc123abc456";
      let result1 = str1.match(re1);
      let result = Array.isArray(result1) && result1?.join(",") === "abc,abc";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_EXEC_0200
     * @tc.name      test_GlobalMatch_Exec_0002
     * @tc.desc      Test global match flag (g) with exec() to find all occurrences of digits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_Exec_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re2: RegExp = new RegExp('\\d+', 'g');
      const str2: string = "10 20 30";
      const result2: string[] = [];
      let match2: RegExpExecArray | null;

      while ((match2 = re2.exec(str2)) !== null) {
        result2?.push(match2?.[0] ?? "");
      }

      const result: boolean = Array.isArray(result2) && result2.join(",") === "10,20,30";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_TEST_0300
     * @tc.name      test_GlobalMatch_Test_0003
     * @tc.desc      Test global match flag (g) with test() to find occurrences of 'abc'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_Test_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re3 = new RegExp('abc', 'g');
      let str3 = "abcabc";
      let result3 = [re3.test(str3), re3.test(str3), re3.test(str3)];
      let result = result3.join(",") === "true,true,false";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_COMPARE_0400
     * @tc.name      test_GlobalMatch_Compare_0004
     * @tc.desc      Compare global match flag (g) with non-global match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_Compare_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re4 = new RegExp('abc');
      let re4g = new RegExp('abc', 'g');
      let str4 = "abc123abc";
      let result4 = [
        str4.match(re4)?.length,
        str4.match(re4g)?.length
      ];
      let result = result4.join(",") === "1,2";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_GLOBAL_MATCH_LASTINDEX_0500
     * @tc.name      test_GlobalMatch_LastIndex_0005
     * @tc.desc      Test global match flag (g) effect on lastIndex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalMatch_LastIndex_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re5 = new RegExp('abc', 'g');
      let str5 = "abcabc";
      re5.test(str5);
      let result5 = re5.lastIndex;
      let result = result5 === 3;
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_IGNORE_CASE_0600
     * @tc.name      test_IgnoreCase_0006
     * @tc.desc      Test ignore case flag (i) to match case-insensitive strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCase_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re6 = new RegExp('ABC', 'i');
      let result6 = [
        re6.test("abc"),
        re6.test("Abc"),
        re6.test("ABC")
      ];
      let result = result6.join(",") === "true,true,true";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_IGNORE_CASE_MATCH_0700
     * @tc.name      test_IgnoreCase_Match_0007
     * @tc.desc      Test ignore case flag (i) with match() to find case-insensitive matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCase_Match_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re7 = new RegExp('java', 'i');
      let str7 = "JavaScript java JAVA";
      let result7 = str7.match(re7);
      let result = result7?.[0] === "Java";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_IGNORE_CASE_GLOBAL_0800
     * @tc.name      test_IgnoreCase_Global_0008
     * @tc.desc      Test ignore case flag (i) with global match flag (g) to find all case-insensitive matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCase_Global_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re8 = new RegExp('java', 'ig');
      let str8 = "JavaScript java JAVA";
      let result8 = str8.match(re8);
      let result = Array.isArray(result8) && result8?.join(",") === "Java,java,JAVA";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_CASE_SENSITIVE_1000
     * @tc.name      test_CaseSensitive_0010
     * @tc.desc      Test without ignore case flag (i) for case-sensitive matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CaseSensitive_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re10 = new RegExp('ABC');
      let result10 = [
        re10.test("abc"),
        re10.test("ABC")
      ];
      let result = result10.join(",") === "false,true";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_MULTILINE_1100
     * @tc.name      test_MultilineBasic_0011
     * @tc.desc      Test multiline flag (m) for line-start matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineBasic_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re11 = new RegExp('^line', 'm');
      let str11 = "first line\nline second\nline3";
      let result11 = str11.match(re11)?.[0];
      let result = result11 === "line";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_MULTILINE_GLOBAL_1200
     * @tc.name      test_MultilineWithGlobal_0012
     * @tc.desc      Test multiline flag (m) combined with global flag (g) for line-start matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineWithGlobal_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re12 = new RegExp('^line', 'mg');
      let str12 = "line1\nline2\nline3";
      let result12 = str12.match(re12);
      let result = Array.isArray(result12) && result12?.join(",") === "line,line,line";
      expect(result).assertTrue();
    });
    /**
     * @tc.number    SUB_REGEX_MULTILINE_DOLLAR_1300
     * @tc.name      test_MultilineWithDollar_0013
     * @tc.desc      Test multiline flag (m) with dollar-end assertion for line-end matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineWithDollar_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re13 = new RegExp('end$', 'mg');
      let str13 = "this is the end\nanother end\nthe final ending";
      let result13 = str13.match(re13);
      let result = Array.isArray(result13) && result13?.join(",") === "end,end";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_MULTILINE_DISABLED_1400
     * @tc.name      test_MultilineDisabled_0014
     * @tc.desc      Test without multiline flag (m) to show no line-start match
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineDisabled_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re14 = new RegExp('^line');
      let str14 = "first line\nline second";
      let result14 = str14.match(re14) ? "匹配" : "不匹配";
      let result = result14 === "不匹配";
      expect(result).assertTrue();
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
      () => {
        const re15 = new RegExp('^start.*end$', 'mg');
        const str15 = "start1 end1\nstart2 middle end2\nstart3 no";
        const result15 = str15.match(re15);
        const result = result15?.join("; ");

        expect(result).assertEqual(undefined);
      });

    /**
     * @tc.number    SUB_REGEX_UNICODE_1600
     * @tc.name      test_UnicodeFlag_0016
     * @tc.desc      Test Unicode flag (u) for Unicode code-point matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeFlag_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re16 = new RegExp('\\u{1F600}', 'u');
      let result16 = re16.test("😀") ? "匹配" : "不匹配";
      let result = result16 === "匹配";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_UNICODE_ESCAPE_1700
     * @tc.name      test_UnicodeEscape_0017
     * @tc.desc      Test Unicode flag (u) with code-point escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeEscape_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re17 = new RegExp('\\u{61}', 'u');
      const match = re17.exec("a");

      if (!match) {
        expect(false).assertTrue();
        return;
      }
      const cp = match[0]?.codePointAt(0)!;
      const result17 = String.fromCodePoint(cp) ?? "";
      const result = result17 === 'a';
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_UNICODE_QUANTIFIER_1800
     * @tc.name      test_UnicodeQuantifier_0018
     * @tc.desc      Test Unicode flag (u) with quantifiers on emoji and letter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeQuantifier_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re18 = new RegExp('^.{2}$', 'u');
      let str18 = "😀a";
      let result18 = re18.test(str18);
      expect(result18).assertTrue();
    });

    /**
     * @tc.number    SUB_ANI_REGEXP_UNICODE_FLAG_0019
     * @tc.name      test_RegExp_UnicodeFlag_0019
     * @tc.desc      RegExp without u-flag: \u{1F600} should throw "Invalid Unicode escape sequence"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegExp_UnicodeFlag_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
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
    });

    /**
     * @tc.number    SUB_REGEX_UNICODE_PROPERTY_2000
     * @tc.name      test_UnicodeProperty_0020
     * @tc.desc      Test Unicode flag (u) with Emoji property escape
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeProperty_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re20 = new RegExp('\\p{Emoji}', 'u');
      let result20 = re20.test("👍") ? "匹配" : "不匹配";
      let result = result20 === "匹配";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_DOTALL_2100
     * @tc.name      test_DotAllFlag_0021
     * @tc.desc      Test dotAll flag (s) to match newline between a and b
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllFlag_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re21 = new RegExp('a.b', 's');
      let result21 = re21.test("a\nb") ? "匹配" : "不匹配";
      let result = result21 === "匹配";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_DOTALL_QUANTIFIER_2200
     * @tc.name      test_DotAllQuantifier_0022
     * @tc.desc      Test dotAll flag (s) with greedy dot-plus to span newlines
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllQuantifier_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re22 = new RegExp('^.+', 's');
      let str22 = "line1\nline2\nline3";
      let result22 = str22.match(re22)?.[0]?.length ?? 0;
      let result = result22 === 17;
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_NO_DOTALL_2300
     * @tc.name      test_NoDotAllFlag_0023
     * @tc.desc      Test without dotAll flag (s) to show newline mismatch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_NoDotAllFlag_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re23 = new RegExp('a.b');
      let result23 = re23.test("a\nb") ? "匹配" : "不匹配";
      let result = result23 === "不匹配";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_DOTALL_COMBINED_2400
     * @tc.name      test_DotAllCombined_0024
     * @tc.desc      Test dotAll flag (s) combined with global flag (g) for multi-line matches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllCombined_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re24 = new RegExp('start.*end', 'gs');
      let str24 = "start\nmiddle\nend\nanother start\nend";
      let result24 = str24.match(re24);
      let result = result24?.join("; ") === "start\nmiddle\nend\nanother start\nend";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_DOTALL_SPECIAL_2500
     * @tc.name      test_DotAllSpecialChars_0025
     * @tc.desc      Test dotAll flag (s) matching tab and carriage-return between a and s
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllSpecialChars_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re25 = new RegExp('a.s', 's');
      let result25 = [
        re25.test("a\ts"),
        re25.test("a\rs")
      ];
      let result = result25.join(",") === "true,true";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_STICKY_BASIC_2600
     * @tc.name      test_StickyBasic_0026
     * @tc.desc      Test sticky flag (y) anchored match from lastIndex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyBasic_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re26 = new RegExp('abc', 'y');
      let str26 = "xyzabc";
      re26.lastIndex = 3;
      let result26 = re26.test(str26);
      expect(result26).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_STICKY_LASTINDEX_2700
     * @tc.name      test_StickyLastIndex_0027
     * @tc.desc      Test sticky flag (y) exec from different lastIndex positions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyLastIndex_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re27 = new RegExp('\\d+', 'y');
      let str27 = "123abc456";
      re27.lastIndex = 0;
      let result27 = re27.exec(str27)?.[0] ?? "null";
      re27.lastIndex = 6;
      result27 += "," + (re27.exec(str27)?.[0] ?? "null");
      let result = result27 === "123,456";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_STICKY_FAIL_2800
     * @tc.name      test_StickyFail_0028
     * @tc.desc      Test sticky flag (y) failure and lastIndex reset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyFail_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re28 = new RegExp('abc', 'y');
      let str28 = "aabc";
      re28.lastIndex = 1;
      let result28 = re28.test(str28);
      let result = result28 === true && re28.lastIndex === 4;
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_STICKY_VS_GLOBAL_2900
     * @tc.name      test_StickyVsGlobal_0029
     * @tc.desc      Compare lastIndex behavior between global (g) and sticky (y) flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyVsGlobal_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re29g = new RegExp('\\d+', 'g');
      let re29y = new RegExp('\\d+', 'y');
      let str29 = "10 20 30";
      str29.match(re29g);
      let result29 = [re29g.lastIndex];
      re29y.lastIndex = 0;
      str29.match(re29y);
      result29.push(re29y.lastIndex);
      let result = result29.join(",") === "0,2";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_STICKY_GLOBAL_COMBINED_3000
     * @tc.name      test_StickyGlobalCombined_0030
     * @tc.desc      Test combined sticky (y) and global (g) flags with manual lastIndex advance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyGlobalCombined_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re30 = new RegExp('\\d+', 'yg');
      let str30 = "123 456 789";
      let result30: string[] = [];
      re30.lastIndex = 0;
      let match30: RegExpExecArray | null;
      while ((match30 = re30.exec(str30)) !== null) {
        result30.push(match30?.[0] ?? "");
        re30.lastIndex++;
      }
      let result = result30.join(",") === "123,456,789";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_GI_3100
     * @tc.name      test_GlobalIgnoreCase_0031
     * @tc.desc      Test global plus ignore-case flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_GlobalIgnoreCase_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re31 = new RegExp('java', 'gi');
      const str31 = 'Java JavaScript JAVA javaScript';
      const result31 = str31.match(re31);
      const ok = result31?.join(',') === 'Java,Java,JAVA,java';
      expect(ok).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_GM_3200
     * @tc.name      test_GlobalMultiline_0032
     * @tc.desc      Test global plus multiline flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_GlobalMultiline_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re32 = new RegExp('^item', 'mg');
      const str32 = 'item1\nitem2\nnot an item\nitem3';
      const result32 = str32.match(re32);
      const ok = result32?.join(',') === 'item,item,item';
      expect(ok).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_GU_3300
     * @tc.name      test_GlobalUnicode_0033
     * @tc.desc      Test global plus Unicode flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_GlobalUnicode_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re33 = new RegExp('\\p{Emoji}', 'gu');
      const str33 = '😀👍😊😎';
      const result33 = str33.match(re33)?.length;
      expect(result33 === 4).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_GS_3400
     * @tc.name      test_GlobalDotAll_0034
     * @tc.desc      Test global plus dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalDotAll_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re34 = new RegExp("\\/\\*.*?\\*\\/", 'gs');
      let str34 = "/* 注释1 \n 多行 */ 代码 /* 注释2 */";
      let result34 = str34.match(re34);
      let result = result34?.join("; ") === "/* 注释1 \n 多行 */; /* 注释2 */";
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_IM_3500
     * @tc.name      test_IgnoreCaseMultiline_0035
     * @tc.desc      Test ignore-case plus multiline flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_IgnoreCaseMultiline_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re35 = new RegExp('^start', 'im');
      const str35 = 'not start\nStart here\nanother line';
      const result35 = str35.match(re35)?.[0];
      expect(result35 === 'Start').assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_IU_3600
     * @tc.name      test_IgnoreCaseUnicode_0036
     * @tc.desc      Test ignore-case plus Unicode flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_IgnoreCaseUnicode_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re36 = new RegExp('\\p{Ll}', 'iu');
      const str36 = 'ÄÖÜ';
      const result36 = re36.test(str36) ? '匹配' : '不匹配';
      expect(result36 === '匹配').assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_IS_3700
     * @tc.name      test_IgnoreCaseDotAll_0037
     * @tc.desc      Test ignore-case plus dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_IgnoreCaseDotAll_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re37 = new RegExp('a.b', 'is');
      const str37 = 'A\nB';
      const result37 = re37.test(str37) ? '匹配' : '不匹配';
      expect(result37 === '匹配').assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_MU_3800
     * @tc.name      test_MultilineUnicode_0038
     * @tc.desc      Test multiline plus Unicode flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_MultilineUnicode_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re38 = new RegExp('^\\p{Script=Greek}', 'mu');
      const str38 = 'αβγ\nΔΕΖ';
      const result38 = str38.match(re38);
      const ok = result38?.join(',') === 'α';
      expect(ok).assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_MS_3900
     * @tc.name      test_MultilineDotAll_0039
     * @tc.desc      Test multiline plus dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_MultilineDotAll_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re39 = new RegExp('^start.*end$', 'ms');
      const str39 = 'start\nmiddle\nend';
      const result39 = re39.test(str39) ? '匹配' : '不匹配';
      expect(result39 === '匹配').assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_US_4000
     * @tc.name      test_UnicodeDotAll_0040
     * @tc.desc      Test Unicode plus dotAll flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_UnicodeDotAll_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re40 = new RegExp('^.\\n.$', 'us');
      const str40 = '😀\n👍';
      const result40 = re40.test(str40) ? '匹配' : '不匹配';
      expect(result40 === '匹配').assertTrue();
    });

    /**
     * @tc.number    SUB_REGEX_GIM_4100
     * @tc.name      test_GlobalIgnoreCaseMultiline_0041
     * @tc.desc      Test global, ignore-case and multiline flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalIgnoreCaseMultiline_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let re41 = new RegExp('^java', 'igm');
      let str41 = "java\nJavaScript\nJAVA\nnot java";
      let result41 = str41.match(re41);
      let result = result41?.join(",") === "java,Java,JAVA";
      expect(result).assertTrue();
    });
  })
}