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

interface TestObject {
  id?: number;
  name?: string;
  data?: string;
  key?: string;
  prop?: string;
  a?: number;
  b?: number;
  unused?: string;
  new?: string;
  x?: number;
  y?: number;
}

type TestArray = Array<number | string | boolean | null | undefined>;

interface TestFunction extends Function {
  prop?: string;
}

class MockSymbol {
  description: string;

  constructor(description: string) {
    this.description = description;
  }
}

export default function RegularExpressions13Test() {
  describe('RegularExpressions13Test', () => {
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
     * @tc.number REGEX_EXEC_BASIC_0100
     * @tc.name testRegexExecBasic0001
     * @tc.desc Verify basic exec() method functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecBasic0001 start');

      const re1 = /abc/;
      const match1 = re1.exec("xyzabc123");
      const result1 = match1?.[0] ?? null;
      console.log(`1. exec() basic match: ${result1}`);
      expect(result1).assertEqual("abc");
      done();
      console.log('testRegexExecBasic0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_NO_MATCH_0100
     * @tc.name testRegexExecNoMatch0001
     * @tc.desc Verify exec() with no match found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecNoMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecNoMatch0001 start');

      const re2 = /abc/;
      const result2 = re2.exec("xyz123");
      console.log(`2. exec() no match: ${result2}`);
      expect(result2).assertNull();
      done();
      console.log('testRegexExecNoMatch0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_CAPTURE_GROUPS_0100
     * @tc.name testRegexExecCaptureGroups0001
     * @tc.desc Verify exec() with capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecCaptureGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecCaptureGroups0001 start');

      const re3 = /(\d+)-(\w+)/;
      const match3 = re3.exec("123-test");
      const fullMatch = match3?.[0] ?? null;
      const group1 = match3?.[1] ?? null;
      const group2 = match3?.[2] ?? null;
      console.log(`3. exec() capture groups: full=${fullMatch}, group1=${group1}, group2=${group2}`);
      expect(fullMatch).assertEqual("123-test");
      expect(group1).assertEqual("123");
      expect(group2).assertEqual("test");
      done();
      console.log('testRegexExecCaptureGroups0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_GLOBAL_0100
     * @tc.name testRegexExecGlobal0001
     * @tc.desc Verify exec() with global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecGlobal0001 start');

      const re4 = /abc/g;
      const str4 = "abc123abc456";
      const match1 = re4.exec(str4)?.[0];
      const match2 = re4.exec(str4)?.[0];
      const result4 = [match1, match2].filter(Boolean).join(",");
      console.log(`4. exec() global matches: ${result4}`);
      expect(result4).assertEqual("abc,abc");
      done();
      console.log('testRegexExecGlobal0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_MULTILINE_0100
     * @tc.name testRegexExecMultiline0001
     * @tc.desc Verify exec() with multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecMultiline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecMultiline0001 start');

      const re5 = /^line/gm;
      const str5 = "line1\nline2\nline3";
      const match1 = re5.exec(str5)?.[0];
      const match2 = re5.exec(str5)?.[0];
      const result5 = [match1, match2].filter(Boolean).join(",");
      console.log(`5. exec() multiline matches: ${result5}`);
      expect(result5).assertEqual("line,line");
      done();
      console.log('testRegexExecMultiline0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_LASTINDEX_0100
     * @tc.name testRegexExecLastIndex0001
     * @tc.desc Verify lastIndex property after exec().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecLastIndex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecLastIndex0001 start');

      const re6 = /abc/g;
      re6.exec("abcabc");
      const result6 = re6.lastIndex;
      console.log(`6. exec() lastIndex value: ${result6}`);
      expect(result6).assertEqual(3);
      done();
      console.log('testRegexExecLastIndex0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_IGNORE_CASE_0100
     * @tc.name testRegexExecIgnoreCase0001
     * @tc.desc Verify exec() with ignore case flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecIgnoreCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecIgnoreCase0001 start');

      const re7 = /ABC/i;
      const result7 = re7.exec("abc123")?.[0];
      console.log(`7. exec() ignore case: ${result7}`);
      expect(result7).assertEqual("abc");
      done();
      console.log('testRegexExecIgnoreCase0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_UNICODE_0100
     * @tc.name testRegexExecUnicode0001
     * @tc.desc Verify exec() with Unicode flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecUnicode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecUnicode0001 start');

      const re8 = /\u{1F600}/u;
      const result8 = re8.exec("😀")?.[0];
      console.log(`8. exec() Unicode mode: ${result8 ? "matched" : "failed"}`);
      expect(result8).not().assertNull();
      done();
      console.log('testRegexExecUnicode0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_DOTALL_0100
     * @tc.name testRegexExecDotall0001
     * @tc.desc Verify exec() with dotall flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecDotall0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecDotall0001 start');

      const re9 = /a.b/s;
      const result9 = re9.exec("a\nb")?.[0];
      console.log(`9. exec() dotall mode: ${result9}`);
      expect(result9).assertEqual("a\nb");
      done();
      console.log('testRegexExecDotall0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_STICKY_0100
     * @tc.name testRegexExecSticky0001
     * @tc.desc Verify exec() with sticky flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecSticky0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecSticky0001 start');

      const re10 = /abc/y;
      re10.lastIndex = 3;
      const result10 = re10.exec("xyzabc")?.[0];
      console.log(`10. exec() sticky mode: ${result10}`);
      expect(result10).assertEqual("abc");
      done();
      console.log('testRegexExecSticky0001 done');
    });

    /**
     * @tc.number REGEX_TEST_BASIC_0100
     * @tc.name testRegexTestBasic0001
     * @tc.desc Verify basic test() method functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestBasic0001 start');

      const re11 = /abc/;
      const result11 = re11.test("abcdef");
      console.log(`11. test() basic: ${result11}`);
      expect(result11).assertTrue();
      done();
      console.log('testRegexTestBasic0001 done');
    });

    /**
     * @tc.number REGEX_TEST_NO_MATCH_0100
     * @tc.name testRegexTestNoMatch0001
     * @tc.desc Verify test() with no match found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestNoMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestNoMatch0001 start');

      const re12 = /abc/;
      const result12 = re12.test("defghi");
      console.log(`12. test() no match: ${result12}`);
      expect(result12).assertFalse();
      done();
      console.log('testRegexTestNoMatch0001 done');
    });

    /**
     * @tc.number REGEX_TEST_GLOBAL_0100
     * @tc.name testRegexTestGlobal0001
     * @tc.desc Verify test() with global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestGlobal0001 start');

      const re13 = /abc/g;
      const str13 = "abc123abc";
      const results = [
        re13.test(str13),
        re13.test(str13),
        re13.test(str13)
      ];
      console.log(`13. test() global: ${results.join(",")}`);
      expect(results).assertDeepEquals([true, true, false]);
      done();
      console.log('testRegexTestGlobal0001 done');
    });

    /**
     * @tc.number REGEX_TEST_IGNORE_CASE_0100
     * @tc.name testRegexTestIgnoreCase0001
     * @tc.desc Verify test() with ignore case flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestIgnoreCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestIgnoreCase0001 start');

      const re14 = /ABC/i;
      const result14 = re14.test("abc");
      console.log(`14. test() ignore case: ${result14}`);
      expect(result14).assertTrue();
      done();
      console.log('testRegexTestIgnoreCase0001 done');
    });

    /**
     * @tc.number REGEX_TEST_MULTILINE_0100
     * @tc.name testRegexTestMultiline0001
     * @tc.desc Verify test() with multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestMultiline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestMultiline0001 start');

      const re15 = /^end/m;
      const result15 = re15.test("start\nend");
      console.log(`15. test() multiline: ${result15}`);
      expect(result15).assertTrue();
      done();
      console.log('testRegexTestMultiline0001 done');
    });

    /**
     * @tc.number STRING_MATCH_BASIC_0100
     * @tc.name testStringMatchBasic0001
     * @tc.desc Verify basic String.match() functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchBasic0001 start');

      const re16 = /abc/;
      const result16 = "xyzabc123".match(re16)?.[0];
      console.log(`16. match() basic: ${result16}`);
      expect(result16).assertEqual("abc");
      done();
      console.log('testStringMatchBasic0001 done');
    });

    /**
     * @tc.number STRING_MATCH_GLOBAL_0100
     * @tc.name testStringMatchGlobal0001
     * @tc.desc Verify String.match() with global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchGlobal0001 start');

      const re17 = /abc/g;
      const result17 = "abc123abc456".match(re17);
      console.log(`17. match() global: ${result17?.join(",")}`);
      expect(result17).assertDeepEquals(["abc","abc"]);
      done();
      console.log('testStringMatchGlobal0001 done');
    });

    /**
     * @tc.number STRING_MATCH_CAPTURE_GROUPS_0100
     * @tc.name testStringMatchCaptureGroups0001
     * @tc.desc Verify String.match() with capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchCaptureGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchCaptureGroups0001 start');

      const re18 = /(\w+)\s(\w+)/;
      const match18 = "John Doe".match(re18);
      const fullMatch = match18?.[0];
      const group1 = match18?.[1];
      console.log(`18. match() capture groups: full=${fullMatch}, group1=${group1}`);
      expect(fullMatch).assertEqual("John Doe");
      expect(group1).assertEqual("John");
      done();
      console.log('testStringMatchCaptureGroups0001 done');
    });

    /**
     * @tc.number STRING_MATCH_NAMED_GROUPS_0100
     * @tc.name testStringMatchNamedGroups0001
     * @tc.desc Verify String.match() with named groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchNamedGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchNamedGroups0001 start');

      const re19 = /(?<first>\w+)\s(?<last>\w+)/;
      const match19 = "John Doe".match(re19);
      const firstName = match19?.groups?.first;
      console.log(`19. match() named groups: first=${firstName}`);
      expect(firstName).assertEqual("John");
      done();
      console.log('testStringMatchNamedGroups0001 done');
    });

    /**
     * @tc.number STRING_MATCH_NO_MATCH_0100
     * @tc.name testStringMatchNoMatch0001
     * @tc.desc Verify String.match() with no match found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchNoMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchNoMatch0001 start');

      const re20 = /xyz/;
      const result20 = "abc123".match(re20);
      console.log(`20. match() no match: ${result20}`);
      expect(result20).assertNull();
      done();
      console.log('testStringMatchNoMatch0001 done');
    });

    /**
     * @tc.number STRING_MATCHALL_BASIC_0100
     * @tc.name testStringMatchAllBasic0001
     * @tc.desc Verify basic String.matchAll() functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllBasic0001 start');

      const re21 = /abc/g;
      const str21 = "abc123abc456";
      const matches21 = Array.from(str21.matchAll(re21), m => m[0]);
      const result21 = matches21.join(",");
      console.log(`21. matchAll() basic: ${result21}`);
      expect(result21).assertEqual("abc,abc");
      done();
      console.log('testStringMatchAllBasic0001 done');
    });

    /**
     * @tc.number STRING_MATCHALL_CAPTURE_GROUPS_0100
     * @tc.name testStringMatchAllCaptureGroups0001
     * @tc.desc Verify String.matchAll() with capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllCaptureGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllCaptureGroups0001 start');

      const re22 = /(\d+)-(\w+)/g;
      const str22 = "123-test 456-case";
      const matches22 = Array.from(str22.matchAll(re22), m => `${m[1]},${m[2]}`);
      const result22 = matches22.join(";");
      console.log(`22. matchAll() capture groups: ${result22}`);
      expect(result22).assertEqual("123,test;456,case");
      done();
      console.log('testStringMatchAllCaptureGroups0001 done');
    });

    /**
     * @tc.number STRING_MATCHALL_NON_GLOBAL_0100
     * @tc.name testStringMatchAllNonGlobal0001
     * @tc.desc Verify String.matchAll() without global flag throws error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllNonGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllNonGlobal0001 start');

      const re23 = /abc/;
      const str23 = "abc123abc";
      let errorOccurred = false;

      try {
        Array.from(str23.matchAll(re23));
      } catch (e) {
        errorOccurred = true;
        // ArkTS-compatible error message check
        expect(e.message.indexOf("global") !== -1).assertTrue();
      }

      console.log(`23. matchAll() non-global error occurred: ${errorOccurred}`);
      expect(errorOccurred).assertTrue();
      done();
      console.log('testStringMatchAllNonGlobal0001 done');
    });

    /**
     * @tc.number STRING_SEARCH_BASIC_0100
     * @tc.name testStringSearchBasic0001
     * @tc.desc Verify basic String.search() functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchBasic0001 start');

      const re24 = /abc/;
      const result24 = "xyzabc123".search(re24);
      console.log(`24. search() basic: ${result24}`);
      expect(result24).assertEqual(3);
      done();
      console.log('testStringSearchBasic0001 done');
    });

    /**
     * @tc.number STRING_SEARCH_NO_MATCH_0100
     * @tc.name testStringSearchNoMatch0001
     * @tc.desc Verify String.search() with no match found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchNoMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchNoMatch0001 start');

      const re25 = /xyz/;
      const result25 = "abc123def".search(re25);
      console.log(`25. search() no match: ${result25}`);
      expect(result25).assertEqual(-1);
      done();
      console.log('testStringSearchNoMatch0001 done');
    });

    /**
     * @tc.number STRING_SEARCH_IGNORE_CASE_0100
     * @tc.name testStringSearchIgnoreCase0001
     * @tc.desc Verify String.search() with ignore case flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchIgnoreCase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchIgnoreCase0001 start');

      const re26 = /ABC/i;
      const result26 = "abcdef".search(re26);
      console.log(`26. search() ignore case: ${result26}`);
      expect(result26).assertEqual(0);
      done();
      console.log('testStringSearchIgnoreCase0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_BASIC_0100
     * @tc.name testStringReplaceBasic0001
     * @tc.desc Verify basic String.replace() functionality.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceBasic0001 start');

      const re27 = /abc/;
      const result27 = "xyzabc123".replace(re27, "def");
      console.log(`27. replace() basic: ${result27}`);
      expect(result27).assertEqual("xyzdef123");
      done();
      console.log('testStringReplaceBasic0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_GLOBAL_0100
     * @tc.name testStringReplaceGlobal0001
     * @tc.desc Verify String.replace() with global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceGlobal0001 start');

      const re28 = /abc/g;
      const result28 = "abc123abc456".replace(re28, "def");
      console.log(`28. replace() global: ${result28}`);
      expect(result28).assertEqual("def123def456");
      done();
      console.log('testStringReplaceGlobal0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_GROUP_REF_0100
     * @tc.name testStringReplaceGroupRef0001
     * @tc.desc Verify String.replace() with group references.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceGroupRef0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceGroupRef0001 start');

      const re29 = /(\w+)\s(\w+)/;
      const result29 = "John Doe".replace(re29, "$2, $1");
      console.log(`29. replace() group ref: ${result29}`);
      expect(result29).assertEqual("Doe, John");
      done();
      console.log('testStringReplaceGroupRef0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_NAMED_GROUP_0100
     * @tc.name testStringReplaceNamedGroup0001
     * @tc.desc Verify String.replace() with named groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceNamedGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceNamedGroup0001 start');

      const re30 = /(?<first>\w+)\s(?<last>\w+)/;
      const result30 = "John Doe".replace(re30, "$<last>, $<first>");
      console.log(`30. replace() named group: ${result30}`);
      expect(result30).assertEqual("Doe, John");
      done();
      console.log('testStringReplaceNamedGroup0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_FUNCTION_0100
     * @tc.name testStringReplaceFunction0001
     * @tc.desc Verify String.replace() with function replacer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceFunction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceFunction0001 start');

      const re31: RegExp = /(\d+)/;
      const result31: string = "age: 20".replace(re31, (match: string, num: string): string => {
        return (Number(num) + 1).toString();
      });

      console.log(`31. replace() function: ${result31}`);
      expect(result31).assertEqual("age: 21");
      done();
      console.log('testStringReplaceFunction0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_GLOBAL_FUNCTION_0100
     * @tc.name testStringReplaceGlobalFunction0001
     * @tc.desc Verify String.replace() with global flag and function replacer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceGlobalFunction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceGlobalFunction0001 start');

      const re32 = /(\d+)/g;
      const result32 = "1, 2, 3".replace(re32, num => (Number(num) * 2).toString());
      console.log(`32. replace() global function: ${result32}`);
      expect(result32).assertEqual("2, 4, 6");
      done();
      console.log('testStringReplaceGlobalFunction0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_SPECIAL_PATTERN_0100
     * @tc.name testStringReplaceSpecialPattern0001
     * @tc.desc Verify String.replace() with special $& pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceSpecialPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceSpecialPattern0001 start');

      const re33 = /abc/;
      const result33 = "xyzabc123".replace(re33, "[$&]");
      console.log(`33. replace() $& pattern: ${result33}`);
      expect(result33).assertEqual("xyz[abc]123");
      done();
      console.log('testStringReplaceSpecialPattern0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_PREVIOUS_MATCH_0100
     * @tc.name testStringReplacePreviousMatch0001
     * @tc.desc Verify String.replace() with $` pattern (inserts preceding portion).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplacePreviousMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplacePreviousMatch0001 start');

      const re34: RegExp = /abc/;
      const result34: string = "xyzabc123".replace(re34, "[$`]");
      console.log("34. replace() $` pattern: " + result34);
      expect(result34).assertEqual("xyz[xyz]123");
      done();
      console.log('testStringReplacePreviousMatch0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_AFTER_MATCH_0100
     * @tc.name testStringReplaceAfterMatch0001
     * @tc.desc Verify String.replace() with $' pattern (inserts following portion).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceAfterMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceAfterMatch0001 start');

      const re35: RegExp = /abc/;
      const result35: string = "xyzabc123".replace(re35, "[$']");
      console.log("35. replace() $' pattern: " + result35);
      expect(result35).assertEqual("xyz[123]123");
      done();
      console.log('testStringReplaceAfterMatch0001 done');
    });

    /**
     * @tc.number STRING_SPLIT_BASIC_0100
     * @tc.name testStringSplitBasic0001
     * @tc.desc Verify basic String.split() with separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitBasic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitBasic0001 start');

      const re36: RegExp = /,/;
      const result36: string[] = "a,b,c".split(re36);
      console.log("36. split() basic: " + result36.join("|"));
      expect(result36).assertDeepEquals(["a", "b", "c"]);
      done();
      console.log('testStringSplitBasic0001 done');
    });

    /**
     * @tc.number STRING_SPLIT_LIMIT_0100
     * @tc.name testStringSplitLimit0001
     * @tc.desc Verify String.split() with limit parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitLimit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitLimit0001 start');

      const re37: RegExp = /,/;
      const result37: string[] = "a,b,c,d".split(re37, 2);
      console.log("37. split() limit: " + result37.join("|"));
      expect(result37).assertDeepEquals(["a", "b"]);
      done();
      console.log('testStringSplitLimit0001 done');
    });

    /**
     * @tc.number STRING_SPLIT_REGEX_0100
     * @tc.name testStringSplitRegex0001
     * @tc.desc Verify String.split() with regex separator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitRegex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitRegex0001 start');

      const re38: RegExp = /\s+/;
      const result38: string[] = "a   b  c d".split(re38);
      console.log("38. split() regex: " + result38.join("|"));
      expect(result38).assertDeepEquals(["a", "b", "c", "d"]);
      done();
      console.log('testStringSplitRegex0001 done');
    });

    /**
     * @tc.number STRING_SPLIT_CAPTURE_GROUPS_0100
     * @tc.name testStringSplitCaptureGroups0001
     * @tc.desc Verify String.split() with capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitCaptureGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitCaptureGroups0001 start');

      const re39: RegExp = /(\d)/;
      const result39: string[] = "a1b2c3".split(re39);
      console.log("39. split() capture groups: " + result39.join("|"));
      expect(result39).assertDeepEquals(["a", "1", "b", "2", "c", "3", ""]);
      done();
      console.log('testStringSplitCaptureGroups0001 done');
    });

    /**
     * @tc.number STRING_SPLIT_GLOBAL_FLAG_0100
     * @tc.name testStringSplitGlobalFlag0001
     * @tc.desc Verify String.split() with global flag behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitGlobalFlag0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitGlobalFlag0001 start');

      const re40: RegExp = /a/g;
      const result40: string[] = "aaabaaa".split(re40);
      const filteredResult: string[] = result40.filter((x: string) => x !== "");
      console.log("40. split() global flag: " + filteredResult.join("|"));
      expect(filteredResult).assertDeepEquals(["b"]);
      done();
      console.log('testStringSplitGlobalFlag0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_NESTED_GROUPS_0100
     * @tc.name testRegexExecNestedGroups0001
     * @tc.desc Verify exec() with nested capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecNestedGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecNestedGroups0001 start');

      const re41 = /(a(b)c)/;
      const match41 = re41.exec("abc");
      const result41 = `0=${match41?.[0]}, 1=${match41?.[1]}, 2=${match41?.[2]}`;
      console.log(`41. exec() nested groups: ${result41}`);
      expect(result41).assertEqual("0=abc, 1=abc, 2=b");
      done();
      console.log('testRegexExecNestedGroups0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_NON_CAPTURE_0100
     * @tc.name testRegexExecNonCapture0001
     * @tc.desc Verify exec() with non-capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecNonCapture0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecNonCapture0001 start');

      const re42 = /(?:abc)(\d+)/;
      const match42 = re42.exec("abc123");
      const result42 = `length=${match42?.length}, group1=${match42?.[1]}`;
      console.log(`42. exec() non-capture: ${result42}`);
      expect(result42).assertEqual("length=2, group1=123");
      done();
      console.log('testRegexExecNonCapture0001 done');
    });

    /**
     * @tc.number REGEX_TEST_EMPTY_STRING_0100
     * @tc.name testRegexTestEmptyString0001
     * @tc.desc Verify test() with empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestEmptyString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestEmptyString0001 start');

      const re43 = /^$/;
      const result43 = re43.test("");
      console.log(`43. test() empty string: ${result43}`);
      expect(result43).assertTrue();
      done();
      console.log('testRegexTestEmptyString0001 done');
    });

    /**
     * @tc.number REGEX_TEST_SPECIAL_CHARS_0100
     * @tc.name testRegexTestSpecialChars0001
     * @tc.desc Verify test() with special characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestSpecialChars0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestSpecialChars0001 start');

      const re44 = /\$|\^|\*/;
      const result44 = re44.test("a^b");
      console.log(`44. test() special chars: ${result44}`);
      expect(result44).assertTrue();
      done();
      console.log('testRegexTestSpecialChars0001 done');
    });

    /**
     * @tc.number STRING_MATCH_MULTILINE_0100
     * @tc.name testStringMatchMultiline0001
     * @tc.desc Verify String.match() with multiline text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchMultiline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchMultiline0001 start');

      const re45 = /line\d/g;
      const result45 = "line1\nline2\nline3".match(re45)?.join(",");
      console.log(`45. match() multiline: ${result45}`);
      expect(result45).assertEqual("line1,line2,line3");
      done();
      console.log('testStringMatchMultiline0001 done');
    });

    /**
     * @tc.number STRING_MATCHALL_ITERATOR_0100
     * @tc.name testStringMatchAllIterator0001
     * @tc.desc Verify String.matchAll() iterator behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllIterator0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllIterator0001 start');

      const re46 = /\d+/g;
      const iterator46 = "123 456 789".matchAll(re46);
      const result46 = [
        iterator46.next().value?.[0],
        iterator46.next().value?.[0]
      ].join(",");
      console.log(`46. matchAll() iterator: ${result46}`);
      expect(result46).assertEqual("123,456");
      done();
      console.log('testStringMatchAllIterator0001 done');
    });

    /**
     * @tc.number STRING_SEARCH_COMPARE_0100
     * @tc.name testStringSearchCompare0001
     * @tc.desc Verify String.search() with regex vs string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchCompare0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchCompare0001 start');

      const str47 = "abc123def";
      const result47 = [
        str47.search(/123/),
        str47.search("123")
      ].join(",");
      console.log(`47. search() compare: ${result47}`);
      expect(result47).assertEqual("3,3");
      done();
      console.log('testStringSearchCompare0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_SPECIAL_CHARS_0100
     * @tc.name testStringReplaceSpecialChars0001
     * @tc.desc Verify String.replace() removing special chars.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceSpecialChars0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceSpecialChars0001 start');

      const re48 = /[^\w\s]/g;
      const result48 = "Hello, World! 123?".replace(re48, "");
      console.log(`48. replace() special chars: ${result48}`);
      expect(result48).assertEqual("Hello World 123");
      done();
      console.log('testStringReplaceSpecialChars0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_CAPITALIZE_0100
     * @tc.name testStringReplaceCapitalize0001
     * @tc.desc Verify String.replace() with capitalization.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceCapitalize0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceCapitalize0001 start');

      const re49 = /(\w+)/g;
      const result49 = "hello world".replace(re49, (word: string) =>
      word.charAt(0).toUpperCase() + word.slice(1)
      );
      console.log(`49. replace() capitalize: ${result49}`);
      expect(result49).assertEqual("Hello World");
      done();
      console.log('testStringReplaceCapitalize0001 done');
    });

    /**
     * @tc.number STRING_SPLIT_EMPTY_STRING_0100
     * @tc.name testStringSplitEmptyString0001
     * @tc.desc Verify String.split() with empty string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitEmptyString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitEmptyString0001 start');

      const re50 = /(?!$)/;
      const result50 = "abc".split(re50).join("|");
      console.log(`50. split() empty string: ${result50}`);
      expect(result50).assertEqual("a|b|c");
      done();
      console.log('testStringSplitEmptyString0001 done');
    });

    /**
     * @tc.number REGEX_ZERO_WIDTH_ASSERTION_0300
     * @tc.name testRegexZeroWidthAssertion0003
     * @tc.desc Verify RegExp.exec() with zero-width assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexZeroWidthAssertion0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexZeroWidthAssertion0003 start');

      const re51: RegExp = /a(?=b)/;
      const result51: string | undefined = re51.exec("ab")?.[0];
      console.log(`51. exec() zero-width assertion: ${result51}`);
      expect(result51).assertEqual("a");
      done();
      console.log('testRegexZeroWidthAssertion0003 done');
    });

    /**
     * @tc.number REGEX_WORD_BOUNDARY_0300
     * @tc.name testRegexWordBoundary0003
     * @tc.desc Verify RegExp.test() with word boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordBoundary0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWordBoundary0003 start');

      const re52: RegExp = /\bword\b/;
      const result52: boolean[] = [
        re52.test("word"),
        re52.test("wording")
      ];
      console.log(`52. test() word boundary: ${result52.join(",")}`);
      expect(result52).assertDeepEquals([true, false]);
      done();
      console.log('testRegexWordBoundary0003 done');
    });

    /**
     * @tc.number REGEX_UNICODE_PROPERTY_0300
     * @tc.name testRegexUnicodeProperty0003
     * @tc.desc Verify String.match() with Unicode property escape.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeProperty0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnicodeProperty0003 start');

      const re53: RegExp = /\p{Emoji}/gu;
      const result53: string[] | null = "Hello 😀 World 👍".match(re53);
      console.log(`53. match() Unicode emoji: ${result53?.join(",")}`);
      expect(result53).assertDeepEquals(["😀", "👍"]);
      done();
      console.log('testRegexUnicodeProperty0003 done');
    });

    /**
     * @tc.number STRING_MATCHALL_NAMED_GROUPS_0300
     * @tc.name testStringMatchAllNamedGroups0003
     * @tc.desc Verify String.matchAll() with named groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllNamedGroups0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllNamedGroups0003 start');

      const re54: RegExp = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/g;
      const str54: string = "2023-12-31 2024-01-01";
      const result54: string[] = Array.from(str54.matchAll(re54),
        (m: RegExpMatchArray) => m.groups?.year ?? ""
      );
      console.log(`54. matchAll() named groups: ${result54.join(",")}`);
      expect(result54).assertDeepEquals(["2023", "2024"]);
      done();
      console.log('testStringMatchAllNamedGroups0003 done');
    });

    /**
     * @tc.number STRING_SEARCH_COMPARISON_0300
     * @tc.name testStringSearchComparison0003
     * @tc.desc Compare String.search() with regex literal and constructor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchComparison0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchComparison0003 start');

      const str55: string = "abc123def";
      const result55: number[] = [
        str55.search(/123/),
        str55.search(new RegExp("123"))
      ];
      console.log(`55. search() comparison: ${result55.join(",")}`);
      expect(result55).assertDeepEquals([3, 3]);
      done();
      console.log('testStringSearchComparison0003 done');
    });

    /**
     * @tc.number STRING_REPLACE_GROUP_SWAP_0300
     * @tc.name testStringReplaceGroupSwap0003
     * @tc.desc Verify String.replace() with group swapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceGroupSwap0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceGroupSwap0003 start');

      const re56: RegExp = /(\d{3})-(\d{4})/;
      const result56: string = "电话: 123-4567".replace(re56, "$2-$1");
      console.log(`56. replace() group swap: ${result56}`);
      expect(result56).assertEqual("电话: 4567-123");
      done();
      console.log('testStringReplaceGroupSwap0003 done');
    });

    /**
     * @tc.number STRING_SPLIT_GLOBAL_FLAG_0300
     * @tc.name testStringSplitGlobalFlag0003
     * @tc.desc Verify String.split() with and without global flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitGlobalFlag0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitGlobalFlag0003 start');

      const re57: RegExp = /\d/;
      const re57g: RegExp = /\d/g;
      const str57: string = "a1b2c3";
      const result57: string[] = [
        str57.split(re57).join("|"),
        str57.split(re57g).join("|")
      ];
      console.log(`57. split() global flag: ${result57.join("; ")}`);
      expect(result57).assertDeepEquals(["a|b|c|", "a|b|c|"]);
      done();
      console.log('testStringSplitGlobalFlag0003 done');
    });

    /**
     * @tc.number REGEX_EXEC_GLOBAL_ITERATION_0300
     * @tc.name testRegexExecGlobalIteration0003
     * @tc.desc Verify RegExp.exec() with global flag iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecGlobalIteration0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecGlobalIteration0003 start');

      const re58: RegExp = /\d+/g;
      const str58: string = "10 20 30 40";
      const result58: string[] = [];
      let match58: RegExpExecArray | null;

      while ((match58 = re58.exec(str58)) !== null) {
        result58.push(match58[0]);
      }

      console.log(`58. exec() global iteration: ${result58.join(",")}`);
      expect(result58).assertDeepEquals(["10", "20", "30", "40"]);
      done();
      console.log('testRegexExecGlobalIteration0003 done');
    });

    /**
     * @tc.number REGEX_TEST_LASTINDEX_0300
     * @tc.name testRegexTestLastIndex0003
     * @tc.desc Verify RegExp.test() with lastIndex modification.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestLastIndex0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestLastIndex0003 start');

      const re59: RegExp = /abc/g;
      const str59: string = "abcabc";
      re59.lastIndex = 3;
      const result59: boolean = re59.test(str59);
      const lastIndex: number = re59.lastIndex;
      console.log(`59. test() lastIndex: ${result59}, lastIndex=${lastIndex}`);
      expect(result59).assertTrue();
      expect(lastIndex).assertEqual(6);
      done();
      console.log('testRegexTestLastIndex0003 done');
    });

    /**
     * @tc.number STRING_MATCH_CAPTURE_GROUPS_0300
     * @tc.name testStringMatchCaptureGroups0003
     * @tc.desc Verify String.match() with capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchCaptureGroups0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchCaptureGroups0003 start');

      const re60: RegExp = /(\w+)\s(\w+)/;
      const match60: RegExpMatchArray | null = "first second".match(re60);
      const result60: string = match60?.slice(0, 3).join("|") ?? "";
      console.log(`60. match() capture groups: ${result60}`);
      expect(result60).assertEqual("first second|first|second");
      done();
      console.log('testStringMatchCaptureGroups0003 done');
    });

    /**
     * @tc.number STRING_MATCHALL_FOROF_0100
     * @tc.name testStringMatchAllForOf0001
     * @tc.desc Verify String.matchAll() with for...of iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllForOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllForOf0001 start');

      const re61: RegExp = /(\w)/g;
      const str61: string = "abc";
      const result61: string[] = [];

      for (const match of str61.matchAll(re61)) {
        result61.push(match[1]);
      }

      console.log(`61. matchAll() for...of: ${result61.join(",")}`);
      expect(result61).assertDeepEquals(["a", "b", "c"]);
      done();
      console.log('testStringMatchAllForOf0001 done');
    });

    /**
     * @tc.number STRING_SEARCH_MULTILINE_0100
     * @tc.name testStringSearchMultiline0001
     * @tc.desc Verify String.search() with multiline flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchMultiline0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchMultiline0001 start');

      const re62: RegExp = /^second/m;
      const result62: number = "first\nsecond\nthird".search(re62);
      console.log(`62. search() multiline: ${result62}`);
      expect(result62).assertEqual(6);
      done();
      console.log('testStringSearchMultiline0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_FUNCTION_ARGS_0100
     * @tc.name testStringReplaceFunctionArgs0001
     * @tc.desc Verify String.replace() with function arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceFunctionArgs0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceFunctionArgs0001 start');

      const re63: RegExp = /(\d+)-(\d+)/;
      const result63: string = "100-200".replace(re63,
        (match: string, p1: string, p2: string, offset: number, string: string): string => {
          return `${Number(p1) + Number(p2)} (位置: ${offset})`;
        }
      );

      console.log(`63. replace() function args: ${result63}`);
      expect(result63).assertEqual("300 (位置: 0)");
      done();
      console.log('testStringReplaceFunctionArgs0001 done');
    });

    /**
     * @tc.number STRING_SPLIT_QUANTIFIER_0100
     * @tc.name testStringSplitQuantifier0001
     * @tc.desc Verify String.split() with quantifier in regex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitQuantifier0001 start');

      const re64: RegExp = /\s{2,}/;
      const result64: string[] = "a  b   c    d".split(re64);
      console.log(`64. split() with quantifier: ${result64.join("|")}`);
      expect(result64).assertDeepEquals(["a", "b", "c", "d"]);
      done();
      console.log('testStringSplitQuantifier0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_REUSE_0100
     * @tc.name testRegexExecReuse0001
     * @tc.desc Verify RegExp.exec() with reused regex object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecReuse0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecReuse0001 start');

      const re65: RegExp = /abc/g;
      const result65: (string | undefined)[] = [
        re65.exec("abc123")?.[0],
        re65.exec("defabc")?.[0]
      ];

      console.log(`65. exec() reused regex: ${result65.join(",")}`);
      expect(result65).assertDeepEquals(["abc","abc"]);
      done();
      console.log('testRegexExecReuse0001 done');
    });

    /**
     * @tc.number REGEX_TEST_EMPTY_PATTERN_0100
     * @tc.name testRegexTestEmptyPattern0001
     * @tc.desc Verify RegExp.test() with empty pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestEmptyPattern0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestEmptyPattern0001 start');

      const re66: RegExp = /(?:)/;
      const result66: boolean = re66.test("任何字符串");
      console.log(`66. test() empty pattern: ${result66}`);
      expect(result66).assertTrue();
      done();
      console.log('testRegexTestEmptyPattern0001 done');
    });

    /**
     * @tc.number STRING_MATCH_NUMBERED_GROUPS_0100
     * @tc.name testStringMatchNumberedGroups0001
     * @tc.desc Verify String.match() with numbered groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchNumberedGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchNumberedGroups0001 start');

      const re67: RegExp = /(\w+)\s(\w+)/;
      const match67: RegExpMatchArray | null = "Hello World".match(re67);
      const result67: string = `${match67?.[1]} ${match67?.[2]}`;

      console.log(`67. match() numbered groups: ${result67}`);
      expect(result67).assertEqual("Hello World");
      done();
      console.log('testStringMatchNumberedGroups0001 done');
    });

    /**
     * @tc.number STRING_MATCHALL_EMPTY_MATCH_0100
     * @tc.name testStringMatchAllEmptyMatch0001
     * @tc.desc Verify String.matchAll() with empty matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllEmptyMatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllEmptyMatch0001 start');

      const re68: RegExp = /()/g;
      const str68: string = "ab";
      const result68: number[] = Array.from(str68.matchAll(re68), (m: RegExpMatchArray) => m.index ?? -1);

      console.log(`68. matchAll() empty matches: ${result68.join(",")}`);
      expect(result68).assertDeepEquals([0, 1, 2]);
      done();
      console.log('testStringMatchAllEmptyMatch0001 done');
    });

    /**
     * @tc.number REGEX_SEARCH_LOOKAHEAD_0300
     * @tc.name testRegexSearchLookahead0003
     * @tc.desc Verify String.search() with lookahead assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexSearchLookahead0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexSearchLookahead0003 start');

      const re69: RegExp = /(?=abc)/;
      const result69: number = "xyzabc123".search(re69);
      console.log(`69. search() lookahead: ${result69}`);
      expect(result69).assertEqual(3);
      done();
      console.log('testRegexSearchLookahead0003 done');
    });

    /**
     * @tc.number STRING_REPLACE_COUNTER_0300
     * @tc.name testStringReplaceCounter0003
     * @tc.desc Verify String.replace() with replacement counter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceCounter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceCounter0003 start');

      const re70: RegExp = /a/g;
      let count70: number = 0;
      const result70: string = "aaabaaa".replace(re70, (): string => {
        count70++;
        return "A";
      });

      console.log(`70. replace() counter: ${result70}, count=${count70}`);
      expect(result70).assertEqual("AAAbAAA");
      expect(count70).assertEqual(6);
      done();
      console.log('testStringReplaceCounter0003 done');
    });

    /**
     * @tc.number STRING_SPLIT_ALTERNATION_0300
     * @tc.name testStringSplitAlternation0003
     * @tc.desc Verify String.split() with alternation pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitAlternation0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitAlternation0003 start');

      const re71: RegExp = /,|;/;
      const result71: string[] = "a,b;c,d;e".split(re71);
      console.log(`71. split() alternation: ${result71.join("|")}`);
      expect(result71).assertDeepEquals(["a", "b", "c", "d", "e"]);
      done();
      console.log('testStringSplitAlternation0003 done');
    });

    /**
     * @tc.number REGEX_EXEC_BACKREFERENCE_0300
     * @tc.name testRegexExecBackreference0003
     * @tc.desc Verify RegExp.exec() with backreference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecBackreference0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecBackreference0003 start');

      const re72: RegExp = /(\w)\1/;
      const result72: string | undefined = re72.exec("aabbcc")?.[0];
      console.log(`72. exec() backreference: ${result72}`);
      expect(result72).assertEqual("aa");
      done();
      console.log('testRegexExecBackreference0003 done');
    });

    /**
     * @tc.number REGEX_TEST_LOOKBEHIND_0300
     * @tc.name testRegexTestLookbehind0003
     * @tc.desc Verify RegExp.test() with lookbehind assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestLookbehind0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestLookbehind0003 start');

      const re73: RegExp = /(?<=a)b/;
      const result73: boolean = re73.test("ab");
      console.log(`73. test() lookbehind: ${result73}`);
      expect(result73).assertTrue();
      done();
      console.log('testRegexTestLookbehind0003 done');
    });

    /**
     * @tc.number STRING_MATCH_GREEDY_0300
     * @tc.name testStringMatchGreedy0003
     * @tc.desc Verify String.match() with greedy vs non-greedy quantifiers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchGreedy0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchGreedy0003 start');

      const re74g: RegExp = /<.+>/;
      const re74ng: RegExp = /<.+?>/;
      const str74: string = "<div>content</div>";
      const result74: string[] = [
        str74.match(re74g)?.[0] ?? "",
        str74.match(re74ng)?.[0] ?? ""
      ];

      console.log(`74. match() greedy vs non-greedy: ${result74.join("; ")}`);
      expect(result74).assertDeepEquals(["<div>content</div>", "<div>"]);
      done();
      console.log('testStringMatchGreedy0003 done');
    });

    /**
     * @tc.number STRING_MATCHALL_NESTED_GROUPS_0300
     * @tc.name testStringMatchAllNestedGroups0003
     * @tc.desc Verify String.matchAll() with nested capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllNestedGroups0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllNestedGroups0003 start');

      const re75: RegExp = /(\w(\d))/g;
      const str75: string = "a1 b2 c3";
      const result75: string[] = Array.from(str75.matchAll(re75),
        (m: RegExpMatchArray) => `${m[1]}:${m[2]}`
      );

      console.log(`75. matchAll() nested groups: ${result75.join(", ")}`);
      expect(result75).assertDeepEquals(["a1:1", "b2:2", "c3:3"]);
      done();
      console.log('testStringMatchAllNestedGroups0003 done');
    });

    /**
     * @tc.number STRING_SEARCH_QUANTIFIER_0300
     * @tc.name testStringSearchQuantifier0003
     * @tc.desc Verify String.search() with quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchQuantifier0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchQuantifier0003 start');

      const re76: RegExp = /\d{3}/;
      const result76: number = "abc123def456".search(re76);
      console.log(`76. search() quantifier: ${result76}`);
      expect(result76).assertEqual(3);
      done();
      console.log('testStringSearchQuantifier0003 done');
    });

    /**
     * @tc.number STRING_REPLACE_ESCAPE_0300
     * @tc.name testStringReplaceEscape0003
     * @tc.desc Verify String.replace() with escaped characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceEscape0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceEscape0003 start');

      const re77: RegExp = /\$/g;
      const result77: string = "价格: $100, $200".replace(re77, "\\$");
      console.log(`77. replace() escape: ${result77}`);
      expect(result77).assertEqual("价格: \\$100, \\$200");
      done();
      console.log('testStringReplaceEscape0003 done');
    });

    /**
     * @tc.number STRING_SPLIT_EMPTY_MATCH_0300
     * @tc.name testStringSplitEmptyMatch0003
     * @tc.desc Verify String.split() with empty matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitEmptyMatch0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitEmptyMatch0003 start');

      const re78: RegExp = /x*/;
      const result78: string[] = "abc".split(re78);
      const filteredResult: string[] = result78.filter((x: string) => x !== "");

      console.log(`78. split() empty matches: ${filteredResult.join("|")}`);
      expect(filteredResult).assertDeepEquals(["a", "b", "c"]);
      done();
      console.log('testStringSplitEmptyMatch0003 done');
    });

    /**
     * @tc.number REGEX_EXEC_NAMED_GROUPS_0300
     * @tc.name testRegexExecNamedGroups0003
     * @tc.desc Verify RegExp.exec() with named capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecNamedGroups0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecNamedGroups0003 start');

      const re79: RegExp = /(?<name>\w+)/;
      const result79: string | undefined = re79.exec("test")?.groups?.name;
      console.log(`79. exec() named groups: ${result79}`);
      expect(result79).assertEqual("test");
      done();
      console.log('testRegexExecNamedGroups0003 done');
    });

    /**
     * @tc.number REGEX_TEST_NEGATIVE_LOOKAHEAD_0300
     * @tc.name testRegexTestNegativeLookahead0003
     * @tc.desc Verify RegExp.test() with negative lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestNegativeLookahead0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestNegativeLookahead0003 start');

      const re80: RegExp = /a(?!b)/;
      const result80: boolean = re80.test("ac");
      console.log(`80. test() negative lookahead: ${result80}`);
      expect(result80).assertTrue();
      done();
      console.log('testRegexTestNegativeLookahead0003 done');
    });

    /**
     * @tc.number STRING_MATCH_MULTILINE_GLOBAL_0100
     * @tc.name testStringMatchMultilineGlobal0001
     * @tc.desc Verify String.match() with multiline and global flags.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchMultilineGlobal0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchMultilineGlobal0001 start');

      const re81: RegExp = /^\w+/gm;
      const result81: string[] | null = "first line\nsecond line\nthird line".match(re81);
      console.log(`81. match() multiline global: ${result81?.join(",")}`);
      expect(result81).assertDeepEquals(["first", "second", "third"]);
      done();
      console.log('testStringMatchMultilineGlobal0001 done');
    });

    /**
     * @tc.number STRING_MATCHALL_DESTRUCTURING_0100
     * @tc.name testStringMatchAllDestructuring0001
     * @tc.desc Verify String.matchAll() with destructuring assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllDestructuring0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllDestructuring0001 start');

      const re82: RegExp = /(\w+)\s(\w+)/g;
      const str82: string = "John Doe; Jane Smith";
      const result82: string[] = [];

      const matches82: IterableIterator<RegExpMatchArray> = str82.matchAll(re82);
      for (const match of matches82) {
        const first: string = match[1];
        const last: string = match[2];
        result82.push(`${last}, ${first}`);
      }

      console.log("82. matchAll() destructuring: " + result82.join("; "));
      expect(result82).assertDeepEquals(["Doe, John", "Smith, Jane"]);
      done();
      console.log('testStringMatchAllDestructuring0001 done');
    });

    /**
     * @tc.number STRING_SEARCH_IGNORE_CASE_0200
     * @tc.name testStringSearchIgnoreCase0002
     * @tc.desc Verify String.search() with ignore case and multiline flags.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchIgnoreCase0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchIgnoreCase0002 start');

      const re83: RegExp = /^end/im;
      const result83: number = "Start\nEND\nFinish".search(re83);
      console.log(`83. search() ignore case: ${result83}`);
      expect(result83).assertEqual(6);
      done();
      console.log('testStringSearchIgnoreCase0002 done');
    });

    /**
     * @tc.number STRING_REPLACE_GROUPS_0100
     * @tc.name testStringReplaceGroups0001
     * @tc.desc Verify String.replace() with groups parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceGroups0001 start');

      const re84: RegExp = /(?<first>\w+)\s(?<last>\w+)/;

      // 替代方案：使用Record类型
      const result84: string = "John Doe".replace(re84,
        (match: string, p1: string, p2: string, offset: number, string: string, groups: Record<string, string>): string => {
          return `${groups.last}, ${groups.first}`;
        }
      );

      console.log("84. replace() groups: " + result84);
      expect(result84).assertEqual("Doe, John");
      done();
      console.log('testStringReplaceGroups0001 done');
    });

    /**
     * @tc.number STRING_SPLIT_NON_CAPTURE_0100
     * @tc.name testStringSplitNonCapture0001
     * @tc.desc Verify String.split() with non-capture group.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitNonCapture0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitNonCapture0001 start');

      const re85: RegExp = /(?:,|;)/;
      const result85: string[] = "a,b;c,d".split(re85);
      console.log(`85. split() non-capture: ${result85.join("|")}`);
      expect(result85).assertDeepEquals(["a", "b", "c", "d"]);
      done();
      console.log('testStringSplitNonCapture0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_STICKY_0200
     * @tc.name testRegexExecSticky0002
     * @tc.desc Verify RegExp.exec() with sticky flag and lastIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecSticky0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecSticky0002 start');

      const re86: RegExp = /abc/y;
      const str86: string = "xyzabcabc";
      re86.lastIndex = 3;

      const match1: string | undefined = re86.exec(str86)?.[0];
      const index1: number = re86.lastIndex;
      const match2: string | undefined = re86.exec(str86)?.[0];
      const index2: number = re86.lastIndex;

      console.log(`86. exec() sticky: ${match1}, ${index1}, ${match2}, ${index2}`);
      expect(match1).assertEqual("abc");
      expect(index1).assertEqual(6);
      expect(match2).assertEqual("abc");
      expect(index2).assertEqual(9);
      done();
      console.log('testRegexExecSticky0002 done');
    });

    /**
     * @tc.number REGEX_TEST_UNICODE_0100
     * @tc.name testRegexTestUnicode0001
     * @tc.desc Verify RegExp.test() with Unicode property.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestUnicode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestUnicode0001 start');

      const re87: RegExp = /\p{Script=Greek}/u;
      const result87: boolean = re87.test("αβγ");
      console.log(`87. test() Unicode: ${result87}`);
      expect(result87).assertTrue();
      done();
      console.log('testRegexTestUnicode0001 done');
    });

    /**
     * @tc.number STRING_MATCH_WORD_BOUNDARY_0100
     * @tc.name testStringMatchWordBoundary0001
     * @tc.desc Verify String.match() with word boundaries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchWordBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchWordBoundary0001 start');

      const re88: RegExp = /\b\w+\b/g;
      const result88: string[] | null = "Hello, world! How are you?".match(re88);
      console.log(`88. match() word boundaries: ${result88?.join(",")}`);
      expect(result88).assertDeepEquals(["Hello", "world", "How", "are", "you"]);
      done();
      console.log('testStringMatchWordBoundary0001 done');
    });

    /**
     * @tc.number STRING_MATCHALL_EMPTY_0100
     * @tc.name testStringMatchAllEmpty0001
     * @tc.desc Verify String.matchAll() with empty regex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllEmpty0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllEmpty0001 start');

      const re89: RegExp = /()/g;
      const str89: string = "ab";
      const result89: number = Array.from(str89.matchAll(re89)).length;
      console.log(`89. matchAll() empty: ${result89}`);
      expect(result89).assertEqual(3);
      done();
      console.log('testStringMatchAllEmpty0001 done');
    });

    /**
     * @tc.number STRING_SEARCH_LOOKBEHIND_0100
     * @tc.name testStringSearchLookbehind0001
     * @tc.desc Verify String.search() with lookbehind assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchLookbehind0001 start');

      const re90: RegExp = /(?<=@)/;
      const result90: number = "user@example.com".search(re90);
      console.log(`90. search() lookbehind: ${result90}`);
      expect(result90).assertEqual(5);
      done();
      console.log('testStringSearchLookbehind0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_URL_0100
     * @tc.name testStringReplaceUrl0001
     * @tc.desc Verify String.replace() with URL parameters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceUrl0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceUrl0001 start');

      const re91: RegExp = /(\?|&)page=\d+/;
      const result91: string = "https://example.com?page=1&sort=asc".replace(re91, "$1page=2");
      console.log(`91. replace() URL: ${result91}`);
      expect(result91).assertEqual("https://example.com?page=2&sort=asc");
      done();
      console.log('testStringReplaceUrl0001 done');
    });

    /**
     * @tc.number STRING_SPLIT_CAPTURE_COMPARE_0100
     * @tc.name testStringSplitCaptureCompare0001
     * @tc.desc Verify String.split() comparing capture vs non-capture groups.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSplitCaptureCompare0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSplitCaptureCompare0001 start');

      const re92c: RegExp = /(\d)/;
      const re92nc: RegExp = /(?:\d)/;
      const str92: string = "a1b2c";

      const result92c: string = str92.split(re92c).join("|");
      const result92nc: string = str92.split(re92nc).join("|");

      console.log(`92. split() capture vs non-capture: ${result92c}; ${result92nc}`);
      expect(result92c).assertEqual("a|1|b|2|c");
      expect(result92nc).assertEqual("a|b|c");
      done();
      console.log('testStringSplitCaptureCompare0001 done');
    });

    /**
     * @tc.number REGEX_EXEC_FLAGS_0100
     * @tc.name testRegexExecFlags0001
     * @tc.desc Verify RegExp.exec() with multiple flags.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexExecFlags0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexExecFlags0001 start');

      const re93: RegExp = /abc/gim;
      const str93: string = "ABC\nabc\nAbC";
      const result93: string[] = [];
      let match93: RegExpExecArray | null;

      while ((match93 = re93.exec(str93)) !== null) {
        result93.push(match93[0]);
      }

      console.log(`93. exec() multiple flags: ${result93.join(",")}`);
      expect(result93).assertDeepEquals(["ABC", "abc", "AbC"]);
      done();
      console.log('testRegexExecFlags0001 done');
    });

    /**
     * @tc.number REGEX_TEST_DYNAMIC_0100
     * @tc.name testRegexTestDynamic0001
     * @tc.desc Verify RegExp.test() with dynamic pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTestDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTestDynamic0001 start');

      const pattern94: string = "abc";
      const re94: RegExp = new RegExp(pattern94);
      const result94: boolean = re94.test("xyzabc123");
      console.log(`94. test() dynamic: ${result94}`);
      expect(result94).assertTrue();
      done();
      console.log('testRegexTestDynamic0001 done');
    });

    /**
     * @tc.number STRING_MATCH_DYNAMIC_FLAGS_0100
     * @tc.name testStringMatchDynamicFlags0001
     * @tc.desc Verify String.match() with dynamic flags.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchDynamicFlags0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchDynamicFlags0001 start');

      const re95: RegExp = new RegExp("abc", "gi");
      const result95: string[] | null = "ABCabcAbC".match(re95);
      console.log(`95. match() dynamic flags: ${result95?.join(",")}`);
      expect(result95).assertDeepEquals(["ABC", "abc", "AbC"]);
      done();
      console.log('testStringMatchDynamicFlags0001 done');
    });

    /**
     * @tc.number STRING_MATCHALL_COMPLEX_0100
     * @tc.name testStringMatchAllComplex0001
     * @tc.desc Verify String.matchAll() with complex pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringMatchAllComplex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringMatchAllComplex0001 start');

      const re96: RegExp = /(\d{4})-(\d{2})-(\d{2})/g;
      const str96: string = "日期: 2023-12-31, 2024-01-01";
      const result96: string[] = Array.from(str96.matchAll(re96),
        (m: RegExpMatchArray) => `${m[3]}/${m[2]}/${m[1]}`
      );

      console.log(`96. matchAll() complex: ${result96.join(", ")}`);
      expect(result96).assertDeepEquals(["31/12/2023", "01/01/2024"]);
      done();
      console.log('testStringMatchAllComplex0001 done');
    });

    /**
     * @tc.number STRING_SEARCH_DYNAMIC_0100
     * @tc.name testStringSearchDynamic0001
     * @tc.desc Verify String.search() with dynamic pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringSearchDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringSearchDynamic0001 start');

      const keyword97: string = "test";
      const re97: RegExp = new RegExp(keyword97);
      const result97: number = "this is a test string".search(re97);
      console.log(`97. search() dynamic: ${result97}`);
      expect(result97).assertEqual(10);
      done();
      console.log('testStringSearchDynamic0001 done');
    });

    /**
     * @tc.number STRING_REPLACE_DYNAMIC_0100
     * @tc.name testStringReplaceDynamic0001
     * @tc.desc Verify String.replace() with dynamic pattern.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testStringReplaceDynamic0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testStringReplaceDynamic0001 start');
      const re98: RegExp = new RegExp("(\\w+) (\\w+)", "g");
      const result98: string = "John Doe, Jane Smith".replace(re98, "$2, $1");
      console.log(`98. replace() dynamic: ${result98}`);
      expect(result98).assertEqual("Doe, John, Smith, Jane");
      done();
      console.log('testStringReplaceDynamic0001 done');
    });
  })
}