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

export default function RegularExpressions13Test() {
  describe('RegularExpressions13Test', () => {
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
     * @tc.number REGEX_EXEC_BASIC_0100
     * @tc.name testRegexExecBasic0001
     * @tc.desc Verify basic exec() method functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re1: RegExp = new RegExp('abc');
      const match1 = re1.exec("xyzabc123");
      const result1 = match1?.[0] ?? null;
      expect(result1).assertEqual("abc");
    });

    /**
     * @tc.number REGEX_EXEC_NO_MATCH_0100
     * @tc.name testRegexExecNoMatch0001
     * @tc.desc Verify exec() with no match found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecNoMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re2: RegExp = new RegExp('abc');
      const result2 = re2.exec("xyz123");
      expect(result2).assertNull();
    });

    /**
     * @tc.number REGEX_EXEC_CAPTURE_GROUPS_0100
     * @tc.name testRegexExecCaptureGroups0001
     * @tc.desc Verify exec() with capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecCaptureGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re3: RegExp = new RegExp('(\\d+)-(\\w+)');
      const match3 = re3.exec("123-test");
      const fullMatch = match3?.[0] ?? null;
      const group1 = match3?.[1] ?? null;
      const group2 = match3?.[2] ?? null;
      expect(fullMatch).assertEqual("123-test");
      expect(group1).assertEqual("123");
      expect(group2).assertEqual("test");
    });

    /**
     * @tc.number REGEX_EXEC_LASTINDEX_0100
     * @tc.name testRegexExecLastIndex0001
     * @tc.desc Verify lastIndex property after exec().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecLastIndex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re6: RegExp = new RegExp('abc', 'g');
      re6.exec("abcabc");
      const result6 = re6.lastIndex;
      expect(result6).assertEqual(3);
    });

    /**
     * @tc.number REGEX_EXEC_IGNORE_CASE_0100
     * @tc.name testRegexExecIgnoreCase0001
     * @tc.desc Verify exec() with ignore case flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecIgnoreCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re7: RegExp = new RegExp('ABC', 'i');
      const result7 = re7.exec("abc123")?.[0];
      expect(result7).assertEqual("abc");
    });

    /**
     * @tc.number REGEX_EXEC_UNICODE_0100
     * @tc.name testRegexExecUnicode0001
     * @tc.desc Verify exec() with Unicode flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecUnicode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re8: RegExp = new RegExp('\\u{1F600}', 'u');
      const result8 = re8.exec("😀")?.[0];
      expect(result8).not().assertNull();
    });
    /**
     * @tc.number REGEX_EXEC_DOTALL_0100
     * @tc.name testRegexExecDotall0001
     * @tc.desc Verify exec() with dotall flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecDotall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re9: RegExp = new RegExp('a.b', 's');
      const result9 = re9.exec("a\nb")?.[0];
      expect(result9).assertEqual("a\nb");
    });

    /**
     * @tc.number REGEX_EXEC_STICKY_0100
     * @tc.name testRegexExecSticky0001
     * @tc.desc Verify exec() with sticky flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecSticky0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re10: RegExp = new RegExp('abc', 'y');
      re10.lastIndex = 3;
      const result10 = re10.exec("xyzabc")?.[0];
      expect(result10).assertEqual("abc");
    });

    /**
     * @tc.number REGEX_TEST_BASIC_0100
     * @tc.name testRegexTestBasic0001
     * @tc.desc Verify basic test() method functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re11: RegExp = new RegExp('abc');
      const result11: boolean = re11.test("abcdef");
      expect(result11).assertTrue();
    });

    /**
     * @tc.number REGEX_TEST_NO_MATCH_0100
     * @tc.name testRegexTestNoMatch0001
     * @tc.desc Verify test() with no match found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestNoMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re12: RegExp = new RegExp('abc');
      const result12: boolean = re12.test("defghi");
      expect(result12).assertFalse();
    });

    /**
     * @tc.number REGEX_TEST_GLOBAL_0100
     * @tc.name testRegexTestGlobal0001
     * @tc.desc Verify test() with global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re13: RegExp = new RegExp('abc', 'g');
      const str13 = "abc123abc";
      const results: boolean[] = [
        re13.test(str13),
        re13.test(str13),
        re13.test(str13)
      ];
      expect(results).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.number REGEX_TEST_IGNORE_CASE_0100
     * @tc.name testRegexTestIgnoreCase0001
     * @tc.desc Verify test() with ignore case flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestIgnoreCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re14: RegExp = new RegExp('ABC', 'i');
      const result14: boolean = re14.test("abc");
      expect(result14).assertTrue();
    });

    /**
     * @tc.number REGEX_TEST_MULTILINE_0100
     * @tc.name testRegexTestMultiline0001
     * @tc.desc Verify test() with multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestMultiline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re15: RegExp = new RegExp('^end', 'm');
      const result15: boolean = re15.test("start\nend");
      expect(result15).assertTrue();
    });

    /**
     * @tc.number STRING_MATCH_BASIC_0100
     * @tc.name testStringMatchBasic0001
     * @tc.desc Verify basic String.match() functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re16: RegExp = new RegExp('abc');
      const result16 = "xyzabc123".match(re16)?.[0];
      expect(result16).assertEqual("abc");
    });

    /**
     * @tc.number STRING_MATCH_GLOBAL_0100
     * @tc.name testStringMatchGlobal0001
     * @tc.desc Verify String.match() with global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re17: RegExp = new RegExp('abc', 'g');
      const result17 = "abc123abc456".match(re17);
      expect(result17).assertDeepEquals(["abc", "abc"]);
    });

    /**
     * @tc.number STRING_MATCH_CAPTURE_GROUPS_0100
     * @tc.name testStringMatchCaptureGroups0001
     * @tc.desc Verify String.match() with capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchCaptureGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re18: RegExp = new RegExp('(\\w+)\\s(\\w+)');
      const match18 = "John Doe".match(re18);
      const fullMatch = match18?.[0];
      const group1 = match18?.[1];
      expect(fullMatch).assertEqual("John Doe");
      expect(group1).assertEqual("John");
    });

    /**
     * @tc.number STRING_MATCH_NAMED_GROUPS_0100
     * @tc.name testStringMatchNamedGroups0001
     * @tc.desc Verify String.match() with named groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchNamedGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re19: RegExp = new RegExp('(?<first>\\w+)\\s(?<last>\\w+)');
      const match19 = "John Doe".match(re19);
      const firstName = match19?.groups?.['first'];
      expect(firstName).assertEqual("John");
    });

    /**
     * @tc.number STRING_MATCH_NO_MATCH_0100
     * @tc.name testStringMatchNoMatch0001
     * @tc.desc Verify String.match() with no match found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchNoMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re20: RegExp = new RegExp('xyz');
      const result20 = "abc123".match(re20);
      expect(result20).assertNull();
    });

    /**
     * @tc.number STRING_MATCHALL_NON_GLOBAL_0100
     * @tc.name testStringMatchAllNonGlobal0001
     * @tc.desc Verify String.matchAll() without global flag throws error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllNonGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re23: RegExp = new RegExp('abc');
      const str23 = "abc123abc";
      let errorOccurred = false;

      try {
        Array.from(str23.matchAll(re23));
      } catch (e) {
        errorOccurred = true;
        expect(e.message.indexOf("global") !== -1).assertTrue();
      }

      expect(errorOccurred).assertTrue();
    });

    /**
     * @tc.number STRING_SEARCH_BASIC_0100
     * @tc.name testStringSearchBasic0001
     * @tc.desc Verify basic String.search() functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re24: RegExp = new RegExp('abc');
      const result24 = "xyzabc123".search(re24);
      expect(result24).assertEqual(3);
    });

    /**
     * @tc.number STRING_SEARCH_NO_MATCH_0100
     * @tc.name testStringSearchNoMatch0001
     * @tc.desc Verify String.search() with no match found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchNoMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re25: RegExp = new RegExp('xyz');
      const result25 = "abc123def".search(re25);
      expect(result25).assertEqual(-1);
    });

    /**
     * @tc.number STRING_SEARCH_IGNORE_CASE_0100
     * @tc.name testStringSearchIgnoreCase0001
     * @tc.desc Verify String.search() with ignore case flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchIgnoreCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re26: RegExp = new RegExp('ABC', 'i');
      const result26 = "abcdef".search(re26);
      expect(result26).assertEqual(0);
    });

    /**
     * @tc.number STRING_REPLACE_BASIC_0100
     * @tc.name testStringReplaceBasic0001
     * @tc.desc Verify basic String.replace() functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re27: RegExp = new RegExp('abc');
      const result27 = "xyzabc123".replace(re27, "def");
      expect(result27).assertEqual("xyzdef123");
    });

    /**
     * @tc.number STRING_REPLACE_GLOBAL_0100
     * @tc.name testStringReplaceGlobal0001
     * @tc.desc Verify String.replace() with global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re28: RegExp = new RegExp('abc', 'g');
      const result28 = "abc123abc456".replace(re28, "def");
      expect(result28).assertEqual("def123def456");
    });

    /**
     * @tc.number STRING_REPLACE_GROUP_REF_0100
     * @tc.name testStringReplaceGroupRef0001
     * @tc.desc Verify String.replace() with group references.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceGroupRef0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re29: RegExp = new RegExp('(\\w+)\\s(\\w+)');
      const result29 = "John Doe".replace(re29, "$2, $1");
      expect(result29).assertEqual("Doe, John");
    });

    /**
     * @tc.number STRING_REPLACE_NAMED_GROUP_0100
     * @tc.name testStringReplaceNamedGroup0001
     * @tc.desc Verify String.replace() with named groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceNamedGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re30: RegExp = new RegExp('(?<first>\\w+)\\s(?<last>\\w+)');
      const result30 = "John Doe".replace(re30, "$<last>, $<first>");
      expect(result30).assertEqual("Doe, John");
    });

    /**
     * @tc.number STRING_REPLACE_GLOBAL_FUNCTION_0100
     * @tc.name testStringReplaceGlobalFunction0001
     * @tc.desc Verify String.replace() with global flag and function replacer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceGlobalFunction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re32: RegExp = new RegExp('(\\d+)', 'g');
      const result32 = "1, 2, 3".replace(re32, num => (Number(num) * 2).toString());
      expect(result32).assertEqual("2, 4, 6");
    });

    /**
     * @tc.number STRING_REPLACE_SPECIAL_PATTERN_0100
     * @tc.name testStringReplaceSpecialPattern0001
     * @tc.desc Verify String.replace() with special $& pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceSpecialPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re33: RegExp = new RegExp('abc');
      const result33 = "xyzabc123".replace(re33, "[$&]");
      expect(result33).assertEqual("xyz[abc]123");
    });

    /**
     * @tc.number STRING_REPLACE_PREVIOUS_MATCH_0100
     * @tc.name testStringReplacePreviousMatch0001
     * @tc.desc Verify String.replace() with $` pattern (inserts preceding portion).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplacePreviousMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re34: RegExp = new RegExp('abc');
      const result34: string = "xyzabc123".replace(re34, "[$`]");
      expect(result34).assertEqual("xyz[xyz]123");
    });

    /**
     * @tc.number STRING_REPLACE_AFTER_MATCH_0100
     * @tc.name testStringReplaceAfterMatch0001
     * @tc.desc Verify String.replace() with $' pattern (inserts following portion).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceAfterMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re35: RegExp = new RegExp('abc');
      const result35: string = "xyzabc123".replace(re35, "[$']");
      expect(result35).assertEqual("xyz[123]123");
    });

    /**
     * @tc.number STRING_SPLIT_BASIC_0100
     * @tc.name testStringSplitBasic0001
     * @tc.desc Verify basic String.split() with separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re36: RegExp = new RegExp(',');
      const result36: string[] = "a,b,c".split(re36);
      expect(result36).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number STRING_SPLIT_LIMIT_0100
     * @tc.name testStringSplitLimit0001
     * @tc.desc Verify String.split() with limit parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitLimit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re37: RegExp = new RegExp(',');
      const result37: string[] = "a,b,c,d".split(re37, 2);
      expect(result37).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.number STRING_SPLIT_REGEX_0100
     * @tc.name testStringSplitRegex0001
     * @tc.desc Verify String.split() with regex separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitRegex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re38: RegExp = new RegExp('\\s+');
      const result38: string[] = "a   b  c d".split(re38);
      expect(result38).assertDeepEquals(["a", "b", "c", "d"]);
    });

    /**
     * @tc.number STRING_SPLIT_CAPTURE_GROUPS_0100
     * @tc.name testStringSplitCaptureGroups0001
     * @tc.desc Verify String.split() with capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitCaptureGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re39: RegExp = new RegExp('(\\d)');
      const result39: string[] = "a1b2c3".split(re39);
      expect(result39).assertDeepEquals(["a", "1", "b", "2", "c", "3", ""]);
    });

    /**
     * @tc.number STRING_SPLIT_GLOBAL_FLAG_0100
     * @tc.name testStringSplitGlobalFlag0001
     * @tc.desc Verify String.split() with global flag behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitGlobalFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re40: RegExp = new RegExp('a', 'g');
      const result40: string[] = "aaabaaa".split(re40);
      const filteredResult: string[] = result40.filter((x: string) => x !== "");
      expect(filteredResult).assertDeepEquals(["b"]);
    });

    /**
     * @tc.number REGEX_EXEC_NESTED_GROUPS_0100
     * @tc.name testRegexExecNestedGroups0001
     * @tc.desc Verify exec() with nested capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecNestedGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re41: RegExp = new RegExp('(a(b)c)');
      const match41 = re41.exec("abc");
      const result41 = `0=${match41?.[0]}, 1=${match41?.[1]}, 2=${match41?.[2]}`;
      expect(result41).assertEqual("0=abc, 1=abc, 2=b");
    });

    /**
     * @tc.number REGEX_EXEC_NON_CAPTURE_0100
     * @tc.name testRegexExecNonCapture0001
     * @tc.desc Verify exec() with non-capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecNonCapture0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re42: RegExp = new RegExp('(?:abc)(\\d+)');
      const match42 = re42.exec("abc123");
      const result42 = `length=${match42?.length}, group1=${match42?.[1]}`;
      expect(result42).assertEqual("length=2, group1=123");
    });

    /**
     * @tc.number REGEX_TEST_EMPTY_STRING_0100
     * @tc.name testRegexTestEmptyString0001
     * @tc.desc Verify test() with empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestEmptyString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re43: RegExp = new RegExp('^$');
      const result43: boolean = re43.test("");
      expect(result43).assertTrue();
    });

    /**
     * @tc.number REGEX_TEST_SPECIAL_CHARS_0100
     * @tc.name testRegexTestSpecialChars0001
     * @tc.desc Verify test() with special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestSpecialChars0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re44: RegExp = new RegExp('\\$|\\^|\\*');
      const result44: boolean = re44.test("a^b");
      expect(result44).assertTrue();
    });

    /**
     * @tc.number STRING_MATCH_MULTILINE_0100
     * @tc.name testStringMatchMultiline0001
     * @tc.desc Verify String.match() with multiline text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchMultiline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re45: RegExp = new RegExp('line\\d', 'g');
      const result45 = "line1\nline2\nline3".match(re45)?.join(",");
      expect(result45).assertEqual("line1,line2,line3");
    });

    /**
     * @tc.number STRING_MATCHALL_ITERATOR_0100
     * @tc.name testStringMatchAllIterator0001
     * @tc.desc Verify String.matchAll() iterator behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllIterator0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re46: RegExp = new RegExp('\\d+', 'g');
      const iterator46 = "123 456 789".matchAll(re46);
      const result46 = [
        iterator46.next().value?.[0],
        iterator46.next().value?.[0]
      ].join(",");
      expect(result46).assertEqual("123,456");
    });

    /**
     * @tc.number STRING_SEARCH_COMPARE_0100
     * @tc.name testStringSearchCompare0001
     * @tc.desc Verify String.search() with regex vs string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchCompare0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str47 = "abc123def";
      const result47 = [
        str47.search(new RegExp("123")),
        str47.search("123")
      ].join(",");
      expect(result47).assertEqual("3,3");
    });

    /**
     * @tc.number STRING_REPLACE_SPECIAL_CHARS_0100
     * @tc.name testStringReplaceSpecialChars0001
     * @tc.desc Verify String.replace() removing special chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceSpecialChars0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re48: RegExp = new RegExp('[^\\w\\s]', 'g');
      const result48 = "Hello, World! 123?".replace(re48, "");
      expect(result48).assertEqual("Hello World 123");
    });

    /**
     * @tc.number STRING_REPLACE_CAPITALIZE_0100
     * @tc.name testStringReplaceCapitalize0001
     * @tc.desc Verify String.replace() with capitalization.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceCapitalize0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re49: RegExp = new RegExp('(\\w+)', 'g');
      const result49 = "hello world".replace(re49, (word: string) =>
      word.charAt(0).toUpperCase() + word.slice(1)
      );
      expect(result49).assertEqual("Hello World");
    });

    /**
     * @tc.number STRING_SPLIT_EMPTY_STRING_0100
     * @tc.name testStringSplitEmptyString0001
     * @tc.desc Verify String.split() with empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitEmptyString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re50: RegExp = new RegExp('(?!$)');
      const result50 = "abc".split(re50).join("|");
      expect(result50).assertEqual("a|b|c");
    });

    /**
     * @tc.number REGEX_ZERO_WIDTH_ASSERTION_0300
     * @tc.name testRegexZeroWidthAssertion0003
     * @tc.desc Verify RegExp.exec() with zero-width assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexZeroWidthAssertion0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re51: RegExp = new RegExp('a(?=b)');
      const result51: string | undefined = re51.exec("ab")?.[0];
      expect(result51).assertEqual("a");
    });

    /**
     * @tc.number REGEX_WORD_BOUNDARY_0300
     * @tc.name testRegexWordBoundary0003
     * @tc.desc Verify RegExp.test() with word boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordBoundary0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re52: RegExp = new RegExp('\\bword\\b');
      const result52: boolean[] = [
        re52.test("word"),
        re52.test("wording")
      ];
      expect(result52).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number REGEX_UNICODE_PROPERTY_0300
     * @tc.name testRegexUnicodeProperty0003
     * @tc.desc Verify String.match() with Unicode property escape.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeProperty0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re53: RegExp = new RegExp('\\p{Emoji}', 'gu');
      const result53: RegExpMatchArray | null = "Hello 😀 World 👍".match(re53);
      expect(result53).assertDeepEquals(["😀", "👍"]);
    });


    /**
     * @tc.number STRING_REPLACE_GROUP_SWAP_0300
     * @tc.name testStringReplaceGroupSwap0003
     * @tc.desc Verify String.replace() with group swapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceGroupSwap0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re56: RegExp = new RegExp('(\\d{3})-(\\d{4})');
      const result56: string = "电话: 123-4567".replace(re56, "$2-$1");
      expect(result56).assertEqual("电话: 4567-123");
    });

    /**
     * @tc.number STRING_SPLIT_GLOBAL_FLAG_0300
     * @tc.name testStringSplitGlobalFlag0003
     * @tc.desc Verify String.split() with and without global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitGlobalFlag0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re57: RegExp = new RegExp('\\d');
      const re57g: RegExp = new RegExp('\\d', 'g');
      const str57: string = "a1b2c3";
      const result57: string[] = [
        str57.split(re57).join("|"),
        str57.split(re57g).join("|")
      ];
      expect(result57).assertDeepEquals(["a|b|c|", "a|b|c|"]);
    });

    /**
     * @tc.number REGEX_EXEC_GLOBAL_ITERATION_0300
     * @tc.name testRegexExecGlobalIteration0003
     * @tc.desc Verify RegExp.exec() with global flag iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecGlobalIteration0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re58: RegExp = new RegExp('\\d+', 'g');
      const str58: string = "10 20 30 40";
      const result58: string[] = [];
      let match58: RegExpExecArray | null;

      while ((match58 = re58.exec(str58)) !== null) {
        result58.push(match58?.[0] ?? "");
      }

      expect(result58).assertDeepEquals(["10", "20", "30", "40"]);
    });

    /**
     * @tc.number REGEX_TEST_LASTINDEX_0300
     * @tc.name testRegexTestLastIndex0003
     * @tc.desc Verify RegExp.test() with lastIndex modification.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestLastIndex0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re59: RegExp = new RegExp('abc', 'g');
      const str59: string = "abcabc";
      re59.lastIndex = 3;
      const result59: boolean = re59.test(str59);
      const lastIndex: number = re59.lastIndex;

      expect(result59).assertTrue();
      expect(lastIndex).assertEqual(6);
    });

    /**
     * @tc.number STRING_MATCH_CAPTURE_GROUPS_0300
     * @tc.name testStringMatchCaptureGroups0003
     * @tc.desc Verify String.match() with capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchCaptureGroups0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re60: RegExp = new RegExp('(\\w+)\\s(\\w+)');
      const match60: RegExpMatchArray | null = "first second".match(re60);
      const result60: string = match60?.slice(0, 3).join("|") ?? "";

      expect(result60).assertEqual("first second|first|second");
    });

    /**
     * @tc.number STRING_MATCHALL_FOROF_0100
     * @tc.name testStringMatchAllForOf0001
     * @tc.desc Verify String.matchAll() with for...of iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllForOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re61: RegExp = new RegExp('(\\w)', 'g');
      const str61: string = "abc";
      const result61: string[] = [];

      for (const match of str61.matchAll(re61)) {
        result61.push(match?.[1] ?? "");
      }

      expect(result61).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number STRING_SEARCH_MULTILINE_0100
     * @tc.name testStringSearchMultiline0001
     * @tc.desc Verify String.search() with multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchMultiline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re62: RegExp = new RegExp('^second', 'm');
      const result62: number = "first\nsecond\nthird".search(re62);

      expect(result62).assertEqual(6);
    });

    /**
     * @tc.number STRING_SPLIT_QUANTIFIER_0100
     * @tc.name testStringSplitQuantifier0001
     * @tc.desc Verify String.split() with quantifier in regex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re64: RegExp = new RegExp('\\s{2,}');
      const result64: string[] = "a  b   c    d".split(re64);

      expect(result64).assertDeepEquals(["a", "b", "c", "d"]);
    });
    /**
     * @tc.number REGEX_EXEC_REUSE_0100
     * @tc.name testRegexExecReuse0001
     * @tc.desc Verify RegExp.exec() with reused regex object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecReuse0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re65: RegExp = new RegExp('abc', 'g');
      const result65: (string | undefined)[] = [
        re65.exec("abc123")?.[0],
        re65.exec("defabc")?.[0]
      ];

      expect(result65).assertDeepEquals(["abc", "abc"]);
    });

    /**
     * @tc.number REGEX_TEST_EMPTY_PATTERN_0100
     * @tc.name testRegexTestEmptyPattern0001
     * @tc.desc Verify RegExp.test() with empty pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestEmptyPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re66: RegExp = new RegExp('(?:)');
      const result66: boolean = re66.test("任何字符串");

      expect(result66).assertTrue();
    });

    /**
     * @tc.number STRING_MATCH_NUMBERED_GROUPS_0100
     * @tc.name testStringMatchNumberedGroups0001
     * @tc.desc Verify String.match() with numbered groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchNumberedGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re67: RegExp = new RegExp('(\\w+)\\s(\\w+)');
      const match67: RegExpMatchArray | null = "Hello World".match(re67);
      const result67: string = `${match67?.[1]} ${match67?.[2]}`;

      expect(result67).assertEqual("Hello World");
    });


    /**
     * @tc.number REGEX_SEARCH_LOOKAHEAD_0300
     * @tc.name testRegexSearchLookahead0003
     * @tc.desc Verify String.search() with lookahead assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexSearchLookahead0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re69: RegExp = new RegExp('(?=abc)');
      const result69: number = "xyzabc123".search(re69);

      expect(result69).assertEqual(3);
    });

    /**
     * @tc.number STRING_REPLACE_COUNTER_0300
     * @tc.name testStringReplaceCounter0003
     * @tc.desc Verify String.replace() with replacement counter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceCounter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re70: RegExp = new RegExp('a', 'g');
      let count70: number = 0;
      const result70: string = "aaabaaa".replace(re70, (): string => {
        count70++;
        return "A";
      });

      expect(result70).assertEqual("AAAbAAA");
      expect(count70).assertEqual(6);
    });

    /**
     * @tc.number STRING_SPLIT_ALTERNATION_0300
     * @tc.name testStringSplitAlternation0003
     * @tc.desc Verify String.split() with alternation pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitAlternation0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re71: RegExp = new RegExp(',|;');
      const result71: string[] = "a,b;c,d;e".split(re71);

      expect(result71).assertDeepEquals(["a", "b", "c", "d", "e"]);
    });

    /**
     * @tc.number REGEX_EXEC_BACKREFERENCE_0300
     * @tc.name testRegexExecBackreference0003
     * @tc.desc Verify RegExp.exec() with backreference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecBackreference0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re72: RegExp = new RegExp('(\\w)\\1');
      const result72: string | undefined = re72.exec("aabbcc")?.[0];

      expect(result72).assertEqual("aa");
    });

    /**
     * @tc.number REGEX_TEST_LOOKBEHIND_0300
     * @tc.name testRegexTestLookbehind0003
     * @tc.desc Verify RegExp.test() with lookbehind assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestLookbehind0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re73: RegExp = new RegExp('(?<=a)b');
      const result73: boolean = re73.test("ab");

      expect(result73).assertTrue();
    });

    /**
     * @tc.number STRING_MATCH_GREEDY_0300
     * @tc.name testStringMatchGreedy0003
     * @tc.desc Verify String.match() with greedy vs non-greedy quantifiers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchGreedy0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re74g: RegExp = new RegExp('<.+>');
      const re74ng: RegExp = new RegExp('<.+?>');
      const str74: string = "<div>content</div>";
      const result74: string[] = [
        str74.match(re74g)?.[0] ?? "",
        str74.match(re74ng)?.[0] ?? ""
      ];

      expect(result74).assertDeepEquals(["<div>content</div>", "<div>"]);
    });

    /**
     * @tc.number STRING_MATCHALL_NESTED_GROUPS_0300
     * @tc.name testStringMatchAllNestedGroups0003
     * @tc.desc Verify String.matchAll() with nested capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllNestedGroups0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re75: RegExp = new RegExp('(\\w(\\d))', 'g');
      const str75: string = "a1 b2 c3";
      const result75: string[] = Array.from(str75.matchAll(re75),
        (m: RegExpMatchArray) => `${m[1]}:${m[2]}`
      );

      expect(result75).assertDeepEquals(["a1:1", "b2:2", "c3:3"]);
    });

    /**
     * @tc.number STRING_SEARCH_QUANTIFIER_0300
     * @tc.name testStringSearchQuantifier0003
     * @tc.desc Verify String.search() with quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchQuantifier0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re76: RegExp = new RegExp('\\d{3}');
      const result76: number = "abc123def456".search(re76);

      expect(result76).assertEqual(3);
    });

    /**
     * @tc.number STRING_REPLACE_ESCAPE_0300
     * @tc.name testStringReplaceEscape0003
     * @tc.desc Verify String.replace() with escaped characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re77: RegExp = new RegExp('\\$', 'g');
      const result77: string = "价格: $100, $200".replace(re77, "\\$");

      expect(result77).assertEqual("价格: \\$100, \\$200");
    });

    /**
     * @tc.number STRING_SPLIT_EMPTY_MATCH_0300
     * @tc.name testStringSplitEmptyMatch0003
     * @tc.desc Verify String.split() with empty matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitEmptyMatch0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re78: RegExp = new RegExp('x*');
      const result78: string[] = "abc".split(re78);
      const filteredResult: string[] = result78.filter((x: string) => x !== "");

      expect(filteredResult).assertDeepEquals(["a", "b", "c"]);
    });

    /**
     * @tc.number REGEX_EXEC_NAMED_GROUPS_0300
     * @tc.name testRegexExecNamedGroups0003
     * @tc.desc Verify RegExp.exec() with named capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecNamedGroups0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re79: RegExp = new RegExp('(?<name>\\w+)');
      const result79: string | undefined = re79.exec("test")?.groups?.['name'];
      expect(result79).assertEqual("test");
    });

    /**
     * @tc.number REGEX_TEST_NEGATIVE_LOOKAHEAD_0300
     * @tc.name testRegexTestNegativeLookahead0003
     * @tc.desc Verify RegExp.test() with negative lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestNegativeLookahead0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re80: RegExp = new RegExp('a(?!b)');
      const result80: boolean = re80.test("ac");

      expect(result80).assertTrue();
    });

    /**
     * @tc.number STRING_MATCH_MULTILINE_GLOBAL_0100
     * @tc.name testStringMatchMultilineGlobal0001
     * @tc.desc Verify String.match() with multiline and global flags.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchMultilineGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re81: RegExp = new RegExp('^\\w+', 'gm');
      const result81: RegExpMatchArray | null = "first line\nsecond line\nthird line".match(re81);
      expect(result81).assertDeepEquals(["first", "second", "third"]);
    });
    /**
     * @tc.number STRING_MATCHALL_DESTRUCTURING_0100
     * @tc.name testStringMatchAllDestructuring0001
     * @tc.desc Verify String.matchAll() with destructuring assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllDestructuring0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re82: RegExp = new RegExp('(\\w+)\\s(\\w+)', 'g');
      const str82: string = "John Doe; Jane Smith";
      const result82: string[] = [];

      const matches82: IterableIterator<RegExpMatchArray> = str82.matchAll(re82);
      for (const match of matches82) {
        const first: string = match?.[1] ?? "";
        const last: string = match?.[2] ?? "";
        result82.push(`${last}, ${first}`);
      }

      expect(result82).assertDeepEquals(["Doe, John", "Smith, Jane"]);
    });

    /**
     * @tc.number STRING_SEARCH_IGNORE_CASE_0200
     * @tc.name testStringSearchIgnoreCase0002
     * @tc.desc Verify String.search() with ignore case and multiline flags.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchIgnoreCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re83: RegExp = new RegExp('^end', 'im');
      const result83: number = "Start\nEND\nFinish".search(re83);

      expect(result83).assertEqual(6);
    });

    /**
     * @tc.number STRING_SPLIT_NON_CAPTURE_0100
     * @tc.name testStringSplitNonCapture0001
     * @tc.desc Verify String.split() with non-capture group.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitNonCapture0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re85: RegExp = new RegExp('(?:,|;)');
      const result85: string[] = "a,b;c,d".split(re85);

      expect(result85).assertDeepEquals(["a", "b", "c", "d"]);
    });

    /**
     * @tc.number STRING_SPLIT_NON_CAPTURE_0200
     * @tc.name testRegexExecSticky0002
     * @tc.desc Verify String.split() with non-capture group.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecSticky0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re86: RegExp = new RegExp('abc', 'y');
      const str86: string = "xyzabcabc";
      re86.lastIndex = 3;

      const match1: string | undefined = re86.exec(str86)?.[0];
      const index1: number = re86.lastIndex;
      const match2: string | undefined = re86.exec(str86)?.[0];
      const index2: number = re86.lastIndex;

      expect(match1).assertEqual("abc");
      expect(index1).assertEqual(6);
      expect(match2).assertEqual("abc");
      expect(index2).assertEqual(9);
    });

    /**
     * @tc.number REGEX_TEST_UNICODE_0100
     * @tc.name testRegexTestUnicode0001
     * @tc.desc Verify RegExp.test() with Unicode property.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestUnicode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re87: RegExp = new RegExp('\\p{Script=Greek}', 'u');
      const result87: boolean = re87.test("αβγ");

      expect(result87).assertTrue();
    });

    /**
     * @tc.number STRING_MATCH_WORD_BOUNDARY_0100
     * @tc.name testStringMatchWordBoundary0001
     * @tc.desc Verify String.match() with word boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchWordBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re88: RegExp = new RegExp('\\b\\w+\\b', 'g');
      const result88: RegExpMatchArray | null = "Hello, world! How are you?".match(re88);
      expect(result88).assertDeepEquals(["Hello", "world", "How", "are", "you"]);
    });

    /**
     * @tc.number STRING_MATCHALL_EMPTY_0100
     * @tc.name testStringMatchAllEmpty0001
     * @tc.desc Verify String.matchAll() with empty regex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllEmpty0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re89: RegExp = new RegExp('()', 'g');
      const str89: string = "ab";
      const result89: number = Array.from(str89.matchAll(re89)).length;

      expect(result89).assertEqual(3);
    });

    /**
     * @tc.number STRING_SEARCH_LOOKBEHIND_0100
     * @tc.name testStringSearchLookbehind0001
     * @tc.desc Verify String.search() with lookbehind assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re90: RegExp = new RegExp('(?<=@)');
      const result90: number = "user@example.com".search(re90);

      expect(result90).assertEqual(5);
    });

    /**
     * @tc.number STRING_REPLACE_URL_0100
     * @tc.name testStringReplaceUrl0001
     * @tc.desc Verify String.replace() with URL parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceUrl0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re91: RegExp = new RegExp('(\\?|&)page=\\d+');
      const result91: string = "https://example.com?page=1&sort=asc".replace(re91, "$1page=2");

      expect(result91).assertEqual("https://example.com?page=2&sort=asc");
    });

    /**
     * @tc.number STRING_SPLIT_CAPTURE_COMPARE_0100
     * @tc.name testStringSplitCaptureCompare0001
     * @tc.desc Verify String.split() comparing capture vs non-capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitCaptureCompare0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re92c: RegExp = new RegExp('(\\d)');
      const re92nc: RegExp = new RegExp('(?:\\d)');
      const str92: string = "a1b2c";

      const result92c: string = str92.split(re92c).join("|");
      const result92nc: string = str92.split(re92nc).join("|");

      expect(result92c).assertEqual("a|1|b|2|c");
      expect(result92nc).assertEqual("a|b|c");
    });

    /**
     * @tc.number REGEX_EXEC_FLAGS_0100
     * @tc.name testRegexExecFlags0001
     * @tc.desc Verify RegExp.exec() with multiple flags.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecFlags0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re93: RegExp = new RegExp('abc', 'gim');
      const str93: string = "ABC\nabc\nAbC";
      const result93: string[] = [];
      let match93: RegExpExecArray | null;

      while ((match93 = re93.exec(str93)) !== null) {
        result93.push(match93?.[0] ?? "");
      }

      expect(result93).assertDeepEquals(["ABC", "abc", "AbC"]);
    });

    /**
     * @tc.number REGEX_TEST_DYNAMIC_0100
     * @tc.name testRegexTestDynamic0001
     * @tc.desc Verify RegExp.test() with dynamic pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const pattern94: string = "abc";
      const re94: RegExp = new RegExp(pattern94);
      const result94: boolean = re94.test("xyzabc123");

      expect(result94).assertTrue();
    });

    /**
     * @tc.number STRING_MATCH_DYNAMIC_FLAGS_0100
     * @tc.name testStringMatchDynamicFlags0001
     * @tc.desc Verify String.match() with dynamic flags.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchDynamicFlags0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re95: RegExp = new RegExp("abc", "gi");
      const result95: RegExpMatchArray | null = "ABCabcAbC".match(re95);

      expect(result95).assertDeepEquals(["ABC", "abc", "AbC"]);
    });

    /**
     * @tc.number STRING_MATCHALL_COMPLEX_0100
     * @tc.name testStringMatchAllComplex0001
     * @tc.desc Verify String.matchAll() with complex pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllComplex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re96: RegExp = new RegExp('(\\d{4})-(\\d{2})-(\\d{2})', 'g');
      const str96: string = "日期: 2023-12-31, 2024-01-01";
      const result96: string[] = Array.from(str96.matchAll(re96),
        (m: RegExpMatchArray) => `${m[3]}/${m[2]}/${m[1]}`
      );

      expect(result96).assertDeepEquals(["31/12/2023", "01/01/2024"]);
    });

    /**
     * @tc.number STRING_SEARCH_DYNAMIC_0100
     * @tc.name testStringSearchDynamic0001
     * @tc.desc Verify String.search() with dynamic pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const keyword97: string = "test";
      const re97: RegExp = new RegExp(keyword97);
      const result97: number = "this is a test string".search(re97);

      expect(result97).assertEqual(10);
    });

    /**
     * @tc.number STRING_REPLACE_DYNAMIC_0100
     * @tc.name testStringReplaceDynamic0001
     * @tc.desc Verify String.replace() with dynamic pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re98: RegExp = new RegExp('(\\w+) (\\w+)', 'g');
      const result98: string = "John Doe, Jane Smith".replace(re98, "$2, $1");

      expect(result98).assertEqual("Doe, John, Smith, Jane");
    });
  })
}